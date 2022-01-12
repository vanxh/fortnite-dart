import "client.dart";
import "mcp_profile.dart";

import "../structures/profile_item.dart";
import "../structures/quest_item.dart";
import "../structures/athena_cosmetic.dart";
import "../structures/cosmetic_locker.dart";

import "../../resources/fortnite_profile_ids.dart";
import "../../resources/mcp_operations.dart";
import "../../resources/endpoints.dart";

/// athena profile manager library
class AthenaProfile extends McpProfile {
  int gold = 0;

  /// athena profile object
  AthenaProfile(Client client)
      : super(
          client,
          FortniteProfile.athena,
        );

  /// init the profile
  Future<dynamic> init() async {
    if (initialized == true) return;

    var res = await client.send(
      method: "POST",
      url: MCP(
        FortniteProfile.athena,
        accountId: client.accountId,
      ).QueryProfile,
      body: {},
    );

    created = DateTime.parse(res["profileChanges"][0]["profile"]["created"]);
    updated = DateTime.parse(res["profileChanges"][0]["profile"]["updated"]);
    serverTime = DateTime.parse(res["serverTime"]);
    rvn = res["profileChanges"][0]["profile"]["rvn"];
    Map<String, dynamic> _items = res["profileChanges"][0]["profile"]["items"];
    stats = res["profileChanges"][0]["profile"]["stats"]["attributes"];

    for (var item in _items.entries) {
      switch (item.value["templateId"].toString().split(":")[0]) {
        case "Quest":
          items.add(
            QuestItem(
              client,
              id: item.key,
              profileId: profileId,
              templateId: item.value["templateId"],
              attributes: item.value["attributes"],
              quantity: item.value["quantity"],
            ),
          );
          break;

        case "AthenaCharacter":
        case "AthenaBackpack":
        case "AthenaPickaxe":
        case "AthenaGlider":
        case "AthenaSkyDiveContrail":
        case "AthenaDance":
        case "AthenaItemWrap":
        case "AthenaMusicPack":
        case "AthenaLoadingScreen":
          items.add(
            AthenaCosmetic(
              client,
              id: item.key,
              profileId: profileId,
              templateId: item.value["templateId"],
              attributes: item.value["attributes"],
              quantity: item.value["quantity"],
            ),
          );
          break;

        case "CosmeticLocker":
          items.add(
            CosmeticLocker(
              client,
              id: item.key,
              profileId: profileId,
              templateId: item.value["templateId"],
              attributes: item.value["attributes"],
              quantity: item.value["quantity"],
            ),
          );
          break;

        default:
          items.add(
            ProfileItem(
              client,
              id: item.key,
              profileId: profileId,
              templateId: item.value["templateId"],
              attributes: item.value["attributes"],
              quantity: item.value["quantity"],
            ),
          );
          break;
      }
    }

    initialized = true;
    client.log(LogLevel.info,
        "Athena profile module initialized [${client.accountId}]");
  }

  /// get br inventory gold
  Future<int> getGold() async {
    gold = (await client.send(
          method: "GET",
          url: "${Endpoints().brInventory}/$accountId",
        ))?["stash"]?["globalcash"] ??
        0;
    return gold;
  }

  /// get quests of the profile
  List<QuestItem> get quests => items.whereType<QuestItem>().toList();

  /// get cosmetics of the profile
  List<AthenaCosmetic> get cosmetics =>
      items.whereType<AthenaCosmetic>().toList();

  /// get skins of profile
  List<AthenaCosmetic> get skins =>
      cosmetics.where((i) => i.type == "AthenaCharacter").toList();

  /// get backpacks of profile
  List<AthenaCosmetic> get backpacks =>
      cosmetics.where((i) => i.type == "AthenaBackpack").toList();

  /// get pickaxes of profile
  List<AthenaCosmetic> get pickaxes =>
      cosmetics.where((i) => i.type == "AthenaPickaxe").toList();

  /// get gliders of profile
  List<AthenaCosmetic> get gliders =>
      cosmetics.where((i) => i.type == "AthenaGlider").toList();

  /// get skydive contrails of profile
  List<AthenaCosmetic> get skydiveContrails =>
      cosmetics.where((i) => i.type == "AthenaSkyDiveContrail").toList();

  /// get dances of profile
  List<AthenaCosmetic> get dances =>
      cosmetics.where((i) => i.type == "AthenaDance").toList();

  /// get item wraps of profile
  List<AthenaCosmetic> get itemWraps =>
      cosmetics.where((i) => i.type == "AthenaItemWrap").toList();

  /// get music packs of profile
  List<AthenaCosmetic> get musicPacks =>
      cosmetics.where((i) => i.type == "AthenaMusicPack").toList();

  /// get loading screens of profile
  List<AthenaCosmetic> get loadingScreens =>
      cosmetics.where((i) => i.type == "AthenaLoadingScreen").toList();

  /// get cosmetic locker of profile
  List<CosmeticLocker> get cosmeticLocker =>
      items.whereType<CosmeticLocker>().toList();

  /// get equipped skin
  String? get equippedSkin => cosmeticLocker
      .where((item) =>
          item.id ==
          (stats["loadouts"] ??
              [] as List<String>)[stats["active_loadout_index"] ?? 0])
      .first
      .character;

  /// season number
  int get seasonNumber => stats["season_num"] ?? 0;

  /// last match date time
  DateTime get lastMatch => DateTime.parse(
      stats["last_match_end_datetime"] ?? DateTime(1970).toString());

  /// get account level
  num get accountLevel => stats["accountLevel"] ?? 0;

  /// get battle pass level
  num get battlePassLevel => stats["level"] ?? 0;

  /// get supercharged xp
  num get superchargedXP => stats["rested_xp"] ?? 0;

  /// get supercharged xp exchange
  num get superchargedXPExchange => stats["rested_xp_exchange"] ?? 0;

  /// get supercharged xp multiplier
  num get superchargedXPMultiplier => stats["rested_xp_mult"] ?? 0;

  /// overflowed supercharged xp
  num get overflowedSuperchargedXP => stats["rested_xp_overflow"] ?? 0;

  /// get battle stars
  num get battlestars => stats["battlestars"] ?? 0;

  /// total battle stars for this season
  num get battlestarsSeasonTotal => stats["battlestars_season_total"] ?? 0;

  /// is battle pass active
  bool get isVIP => stats["book_purchased"] ?? false;

  /// creative afk tracker
  QuestItem get creativeAFKTracker => quests.firstWhere(
      (item) => item.templateId == "Quest:quest_br_creative_playtimetracker_4");

  /// xp per afk creative xp grant
  num get xpPerTick => 12000;

  /// xp claimed from afk creative today
  num get xpClaimedFromAFKCreative => (creativeAFKTimePlayed / 15) * xpPerTick;

  /// max xp from afk creative per day
  num get maxAFKCreativeXPPerDay => xpPerTick * 5;

  /// time betweek xp grants from afk creative in minutes
  num get timeBetweenTicks => 15;

  /// total creative afk time played
  num get creativeAFKTimePlayed => creativeAFKTracker.completion;

  /// max afk creative time playable
  num get maxCreativeAFKTimePlayable => timeBetweenTicks * 5;

  /// get last time afk creative xp granted on
  DateTime get lastCreativeAFKTimeGranted => DateTime.parse(
      stats["last_state_change_time"] ?? DateTime(1970).toString());
}
