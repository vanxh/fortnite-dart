import "client.dart";
import "mcp_profile.dart";

import "../structures/profile_item.dart";
import "../structures/stw_resource.dart";
import "../structures/stw_hero.dart";
import "../structures/stw_worker.dart";
import "../structures/stw_schematic.dart";
import "../structures/banner_quest.dart";
import "../structures/survivor_squad_preset.dart";
import "../structures/claim_daily_response.dart";
import "../structures/stw_hero_loadout.dart";

import "../../resources/fortnite_profile_ids.dart";
import "../../resources/mcp_operations.dart";
import "../../resources/homebase_rating_keys.dart";
import "../../resources/storm_king_quests.dart";

import "../util/curve_table.dart";

/// campaign profile manager library
class CampaignProfile extends McpProfile {
  /// power level curve table reader
  CurveTable powerLevelCurve = CurveTable(homebaseRatingKeys);

  /// campaign profile object
  CampaignProfile(Client client)
      : super(
          client,
          FortniteProfile.campaign,
        );

  /// init the profile
  Future<dynamic> init(String? accId) async {
    if (initialized == true) return;

    if (accId != null) {
      accountId = accId;
    }

    var res = await client.send(
      method: "POST",
      url: MCP(
        FortniteProfile.campaign,
        accountId: accountId,
        route: "public",
      ).QueryPublicProfile,
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
        case "AccountResource":
          items.add(
            AccountResource(
              client,
              id: item.key,
              profileId: profileId,
              templateId: item.value["templateId"],
              attributes: item.value["attributes"],
              quantity: item.value["quantity"],
            ),
          );
          break;

        case "Hero":
          items.add(
            STWHero(
              client,
              id: item.key,
              profileId: profileId,
              templateId: item.value["templateId"],
              attributes: item.value["attributes"],
              quantity: item.value["quantity"],
            ),
          );
          break;

        case "Worker":
          items.add(
            STWWorker(
              client,
              id: item.key,
              profileId: profileId,
              templateId: item.value["templateId"],
              attributes: item.value["attributes"],
              quantity: item.value["quantity"],
            ),
          );
          break;

        case "Schematic":
          items.add(
            STWSchematic(
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
          // print(item.value["templateId"]);
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
    client.log(
        LogLevel.info, "Campaign profile module initialized [$accountId]");
  }

  /// get account resources of the profile
  Iterable<AccountResource> get accountResources =>
      items.whereType<AccountResource>();

  /// get stw heroes of the profile
  Iterable<STWHero> get heroes => items.whereType<STWHero>();

  /// ninja type heroes of the profile
  Iterable<STWHero> get ninjaHeroes =>
      heroes.where((hero) => hero.type == "ninja");

  /// constructor type heroes of the profile
  Iterable<STWHero> get constructorHeroes =>
      heroes.where((hero) => hero.type == "constructor");

  /// commando type heroes of the profile
  Iterable<STWHero> get commandoHeroes =>
      heroes.where((hero) => hero.type == "commando");

  /// outlander type heroes of the profile
  Iterable<STWHero> get outlanderHeroes =>
      heroes.where((hero) => hero.type == "outlander");

  /// get stw schematics of the profile
  Iterable<STWSchematic> get schematics => items.whereType<STWSchematic>();

  /// get stw weapons of the profile
  Iterable<STWSchematic> get weapons =>
      schematics.where((schematic) => schematic.type == "weapon");

  /// get stw trap of the profile
  Iterable<STWSchematic> get traps =>
      schematics.where((schematic) => schematic.type == "trap");

  /// get workers of the profile
  Iterable<STWWorker> get workers => items.whereType<STWWorker>();

  /// get manager workers of the profile
  Iterable<STWWorker> get managers =>
      workers.where((worker) => worker.type == "manager");

  /// get hero loadouts of the profile
  Iterable<STWHeroLoadout> get heroLoadouts {
    var loadouts = <STWHeroLoadout>[];

    for (var i in items) {
      if (i.templateId.startsWith("CampaignHeroLoadout")) {
        loadouts.add(
          STWHeroLoadout(
            client,
            id: i.id,
            profileId: profileId,
            templateId: i.templateId,
            attributes: i.attributes,
            quantity: i.quantity,
          ),
        );
      }
    }

    return loadouts;
  }

  /// returns survivor squads of the profile.
  /// there are 8 survivors squads in total.
  /// each squad can have a max of 8 survivors.
  Map<String, List<STWWorker>> get survivorSquads {
    Map<String, List<STWWorker>> _squads = {
      "trainingteam": [],
      "fireteamalpha": [],
      "closeassaultsquad": [],
      "thethinktank": [],
      "emtsquad": [],
      "corpsofengineering": [],
      "scoutingparty": [],
      "gadgeteers": [],
    };

    for (STWWorker worker
        in workers.where((element) => element.squad != null)) {
      _squads[worker.squad?["name"]]?.add(worker);
    }

    return _squads;
  }

  /// returns power level rating of profile
  num get powerLevel {
    int totalFORT = fortStats.values.reduce((prev, cur) => prev + cur);
    return powerLevelCurve.eval(totalFORT * 4);
  }

  /// returns ventures power level rating of profile
  num get venturesPowerLevel {
    int totalFORT = venturesFORT.values.reduce((prev, cur) => prev + cur);
    return powerLevelCurve.eval(totalFORT * 4);
  }

  /// get total FORT stats of the profile.
  /// this is the sum of FORT stats of [survivorFORT] and [researchFORT].
  Map<String, int> get fortStats {
    int fortitude = 0;
    int resistance = 0;
    int offense = 0;
    int tech = 0;

    for (var fort in [survivorFORT, researchFORT]) {
      for (var key in fort.keys) {
        switch (key) {
          case "fortitude":
            fortitude += fort[key] ?? 0;
            break;

          case "resistance":
            resistance += fort[key] ?? 0;
            break;

          case "offense":
            offense += fort[key] ?? 0;
            break;

          case "tech":
            tech += fort[key] ?? 0;
            break;
        }
      }
    }

    return {
      "fortitude": fortitude,
      "resistance": resistance,
      "offense": offense,
      "tech": tech,
    };
  }

  /// get FORT stats from survivor squads.
  Map<String, int> get survivorFORT {
    int fortitude = 0;
    int resistance = 0;
    int offense = 0;
    int tech = 0;

    for (var squad in survivorSquads.values.toList()) {
      STWWorker? leadWorker;
      if (squad.where((s) => s.squad?["slotIdx"] == 0).isNotEmpty) {
        leadWorker = squad.firstWhere((s) => s.squad?["slotIdx"] == 0);
      }

      for (STWWorker worker in squad) {
        num totalBonus = worker.rating;

        if (worker.squad?["slotIdx"] == 0) {
          totalBonus += worker.leadBonus;
        } else if (leadWorker != null) {
          totalBonus += worker.bonus(leadWorker);
        }

        switch (worker.squad?["type"]) {
          case "medicine":
            fortitude += totalBonus.toInt();
            break;

          case "arms":
            offense += totalBonus.toInt();
            break;

          case "synthesis":
            tech += totalBonus.toInt();
            break;

          case "scavenging":
            resistance += totalBonus.toInt();
            break;
        }
      }
    }

    return {
      "fortitude": fortitude,
      "resistance": resistance,
      "offense": offense,
      "tech": tech,
    };
  }

  /// get FORT stats by research of profile
  Map<String, int> get researchFORT {
    int fortitude = 0;
    int resistance = 0;
    int offense = 0;
    int tech = 0;

    for (var item in items.where((i) =>
        i.templateId.contains("Stat:") && !i.templateId.contains("phoenix"))) {
      if (item.templateId.contains("fortitude")) {
        fortitude += item.quantity;
      } else if (item.templateId.contains("resistance")) {
        resistance += item.quantity;
      } else if (item.templateId.contains("offense")) {
        offense += item.quantity;
      } else if (item.templateId.contains("tech")) {
        tech += item.quantity;
      }
    }

    return {
      "fortitude": fortitude,
      "resistance": resistance,
      "offense": offense,
      "tech": tech,
    };
  }

  /// get ventures FORT stats of profile
  Map<String, int> get venturesFORT {
    Map<String, int> _venturesFORT = {
      "fortitude": 0,
      "resistance": 0,
      "offense": 0,
      "tech": 0,
    };

    for (ProfileItem item in items.where((i) =>
        i.templateId.contains("Stat:") && i.templateId.contains("phoenix"))) {
      if (item.templateId.contains("fortitude")) {
        _venturesFORT["fortitude"] = item.quantity;
      } else if (item.templateId.contains("resistance")) {
        _venturesFORT["resistance"] = item.quantity;
      } else if (item.templateId.contains("offense")) {
        _venturesFORT["offense"] = item.quantity;
      } else if (item.templateId.contains("technology")) {
        _venturesFORT["tech"] = item.quantity;
      }
    }

    return _venturesFORT;
  }

  /// completed tutorial?
  bool get tutorialCompleted => items
          .where((i) => i.templateId == "Quest:homebaseonboarding")
          .isEmpty
      ? false
      : (items
                  .firstWhere((i) => i.templateId == "Quest:homebaseonboarding")
                  .attributes["completion_hbonboarding_completezone"] ??
              0) >
          0;

  /// account level for profile
  num get accountLevel => stats["level"] ?? 0;

  /// past max level for profile
  num get pastMaxLevel => stats["rewards_claimed_post_max_level"] ?? 0;

  /// mfa rewards claimed or not
  bool get mfaClaimed => stats["mfa_reward_claimed"] as bool;

  /// backpack size
  num get backpackSize =>
      50 +
      (items
              .firstWhere(
                  (i) => i.templateId == "HomebaseNode:skilltree_backpacksize")
              .quantity *
          20) +
      (mfaClaimed ? 10 : 0);

  /// storage size
  num get storageSize =>
      items
          .firstWhere((i) =>
              i.templateId == "HomebaseNode:skilltree_stormshieldstorage")
          .quantity *
      20;

  /// available research points
  num get researchPoints => items
      .firstWhere(
          (i) => i.templateId == "Token:collectionresource_nodegatetoken01")
      .quantity;

  /// matches played
  num get matchesPlayed => stats["matches_played"];

  /// collection book level
  num get collectionBookLevel =>
      stats["collection_book"]?["maxBookXpLevelAchieved"] ?? 0;

  /// unslot cost
  num get unslotCost => stats["unslot_mtx_spend"];

  /// get banner quests of profile
  List<BannerQuest> get bannerQuests {
    List<BannerQuest> quests = [];

    for (final q
        in items.where((i) => i.templateId.startsWith("Quest:achievement_"))) {
      switch (q.templateId) {
        case "Quest:achievement_buildstructures":
          quests.add(
            BannerQuest(
              "Talented Builder",
              q.attributes["completion_build_any_structure"],
              500000,
            ),
          );
          break;

        case "Quest:achievement_destroygnomes":
          quests.add(
            BannerQuest(
              "Go Gnome!",
              q.attributes["completion_destroy_gnome"],
              100,
            ),
          );
          break;

        case "Quest:achievement_loottreasurechests":
          quests.add(
            BannerQuest(
              "Loot Legend",
              q.attributes["completion_interact_treasurechest"],
              300,
            ),
          );
          break;

        case "Quest:achievement_savesurvivors":
          quests.add(
            BannerQuest(
              "Guardian Angel",
              q.attributes["completion_questcollect_survivoritemdata"],
              10000,
            ),
          );
          break;

        case "Quest:achievement_playwithothers":
          quests.add(
            BannerQuest(
              "Plays Well with Others",
              q.attributes["completion_quick_complete"],
              1000,
            ),
          );
          break;

        case "Quest:achievement_killmistmonsters":
          quests.add(
            BannerQuest(
              "Unspeakable Horrors",
              q.attributes["completion_kill_husk_smasher"],
              20000,
            ),
          );
          break;

        case "Quest:achievement_explorezones":
          quests.add(
            BannerQuest(
              "World Explorer",
              q.attributes["completion_complete_exploration_1"],
              1500,
            ),
          );
          break;
      }
    }

    return quests;
  }

  /// get completed mission alerts
  List<String> get completedMissionAlerts =>
      ((stats["mission_alert_redemption_record"]?["claimData"] ?? []) as List)
          .map((m) => m["missionAlertId"])
          .cast<String>()
          .toList();

  /// get completed storm shields
  Map<String, int> get completedStormShields {
    Map<String, int> shields = {
      "Stonewood": 0,
      "Plankerton": 0,
      "Canny Valley": 0,
      "Twine Peaks": 0,
    };

    for (final i
        in items.where((i) => i.templateId.contains("Quest:outpostquest_t"))) {
      if (i.attributes["quest_state"] == "Claimed") {
        List<String> split = i.templateId.split("_");
        int ssdNum =
            (int.tryParse((split[split.length - 2]).replaceAll("t", "")) ?? 1) -
                1;
        int ssdQuan = int.tryParse(split.last.replaceAll("l", "")) ?? 0;
        String ssd = shields.keys.toList()[ssdNum];

        if (shields[ssd]! < ssdQuan) {
          shields[ssd] = ssdQuan;
        }
      }
    }

    return shields;
  }

  /// get endurance completions
  Map<String, DateTime?> get enduranceCompletions {
    Map<String, DateTime?> completions = {
      "Stonewood": null,
      "Plankerton": null,
      "Canny Valley": null,
      "Twine Peaks": null,
    };

    for (final i in items
        .where((i) => i.templateId.contains("Quest:endurancewave30theater"))) {
      String ssd = completions.keys
          .toList()[(int.tryParse(i.templateId.split("").last) ?? 1) - 1];
      completions[ssd] =
          DateTime.tryParse(i.attributes["last_state_change_time"]);
    }

    return completions;
  }

  /// get current storm king quest
  StormKingQuest get stormKingQuest {
    confirmInitialized();

    if (completedStormShields["Twine Peaks"]! < 5) {
      return StormKingQuest(
        "Quest:twinepeaks",
        "Twine Peaks Stormshield",
        "Complete Twine Peaks Stormshield Defense 5",
        10,
      )..completionCurrent = 0;
    }

    var filtered =
        items.where((i) => i.templateId.startsWith("Quest:stw_stormkinghard"));

    if (filtered.isEmpty) {
      throw Exception("No Storm King quests found");
    }

    return stormKingQuests[filtered.first.templateId]!;
  }

  /// get storm king schematics
  List<STWSchematic> get stormKingSchematics =>
      schematics.where((s) => s.isStormKing).toList();

  /// get storm king schematics count
  Map<String, int> get stormKingSchematicsCount {
    Map<String, int> count = {};

    for (final s in stormKingSchematics) {
      if (count.containsKey(s.templateId)) {
        count[s.templateId] = count[s.templateId]! + 1;
      } else {
        count[s.templateId] = 1;
      }
    }

    return count;
  }

  /// get pending difficulty rewards
  Map<String, int> get pendingDifficultyRewards {
    Map<String, int> rewards = {};

    var _r = stats["difficulty_increase_rewards_record"]?["pendingRewards"];
    if (_r == null) return rewards;

    for (final reward in _r) {
      for (final item in reward?["difficultyIncreaseMissionRewards"]
          ?["items"]) {
        if (rewards["itemType"] == null) {
          rewards["itemType"] = 0;
        }

        rewards["itemType"] =
            (rewards["itemType"] ?? 0) + (int.tryParse(item["quantity"]) ?? 0);
      }
    }

    return rewards;
  }

  /// get research levels
  Map<String, int> get researchLevels {
    confirmInitialized();

    return stats["research_levels"]?.cast<String, int>() ?? {};
  }

  /// get pending research levels (research levels that are below 120)
  Map<String, int> get pendingResearchLevels {
    confirmInitialized();

    Map<String, int> levels = {};

    for (final r in researchLevels.entries) {
      if (r.value < 120) {
        levels[r.key] = r.value;
      }
    }

    return levels;
  }

  /// collect research points
  Future<void> collectResearchPoints() async {
    confirmInitialized();

    return await client.post(
      MCP(profileId, accountId: client.accountId).ClaimCollectedResources,
      body: {
        "collectorsToClaim": [
          items
              .firstWhere((i) =>
                  i.templateId == "Token:collectionresource_nodegatetoken01")
              .id,
        ],
      },
    );
  }

  /// upgrade research stat
  Future<void> upgradeResearchStat(String stat) async {
    return await client.post(
      MCP(profileId, accountId: client.accountId).PurchaseResearchStatUpgrade,
      body: {
        "statId": stat,
      },
    );
  }

  /// updgrade a homebase node
  Future<void> upgradeHomebaseNode(String nodeId) async {
    return await client.post(
      MCP(profileId, accountId: client.accountId).PurchaseOrUpgradeHomebaseNode,
      body: {
        "nodeId": nodeId,
      },
    );
  }

  /// skip campaign tutorial if not completed
  Future<void> skipTutorial() async {
    confirmInitialized();

    if (tutorialCompleted) {
      throw Exception(
          "You have already completed the tutorial. You can't skip it again.");
    }

    return await client.post(
      MCP(profileId, accountId: client.accountId).SkipTutorial,
      body: {},
    );
  }

  /// get current survivor squad preset
  SurvivorSquadPreset get survivorSquadPreset {
    confirmInitialized();

    List<String> _characterIds = [];
    List<String> _squadIds = [];
    List<int> _slotIndices = [];

    for (final worker in workers) {
      if (worker.squad == null) continue;

      _characterIds.add(worker.id);
      _squadIds.add(worker.squad?["id"] ?? "");
      _slotIndices.add(worker.squad?["slotIdx"] ?? 0);
    }

    return SurvivorSquadPreset(
      characterIds: _characterIds,
      squadIds: _squadIds,
      slotIndices: _slotIndices,
    );
  }

  /// set a survivor squad preset
  Future<void> equipSurvivorSquadPreset(SurvivorSquadPreset preset) async {
    await client
        .post(MCP(profileId, accountId: client.accountId).UnassignAllSquads);
    return await client.post(
      MCP(profileId, accountId: client.accountId).AssignWorkerToSquadBatch,
      body: preset.toJson(),
    );
  }

  /// claim daily rewards
  Future<ClaimDailyRewardResponse> claimDailyReward() async {
    var res = await client.post(
      MCP(profileId, accountId: client.accountId).ClaimLoginReward,
    );
    return ClaimDailyRewardResponse.fromDay(
      (res["notifications"] as List?)?.first?["daysLoggedIn"] ?? 0,
      ((res["notifications"] as List?)?.first?["items"] as List?)?.isEmpty ??
          true,
    );
  }
}
