import "client.dart";
import "mcp_profile.dart";

import "../structures/profile_item.dart";
import "../structures/stw_resource.dart";
import "../structures/stw_hero.dart";
import "../structures/stw_worker.dart";
import "../structures/stw_schematic.dart";

import "../../resources/fortnite_profile_ids.dart";
import "../../resources/mcp_operations.dart";

/// campaign profile manager library
class CampaignProfile extends McpProfile {
  /// campaign profile object
  CampaignProfile(Client client)
      : super(
          client,
          FortniteProfile.campaign,
        );

  /// init the profile
  Future<dynamic> init() async {
    if (initialized == true) return;

    var res = await client.send(
      method: "POST",
      url: MCP(
        FortniteProfile.campaign,
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
          print(item.value["templateId"]);
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
        "Campaign profile module initialized [${client.accountId}]");
  }

  /// get account resources of the profile
  List<AccountResource> get accountResources =>
      items.whereType<AccountResource>().toList();

  /// get stw heroes of the profile
  List<STWHero> get heroes => items.whereType<STWHero>().toList();

  /// ninja type heroes of the profile
  List<STWHero> get ninjaHeroes =>
      heroes.where((hero) => hero.type == "ninja").toList();

  /// constructor type heroes of the profile
  List<STWHero> get constructorHeroes =>
      heroes.where((hero) => hero.type == "constructor").toList();

  /// commando type heroes of the profile
  List<STWHero> get commandoHeroes =>
      heroes.where((hero) => hero.type == "commando").toList();

  /// outlander type heroes of the profile
  List<STWHero> get outlanderHeroes =>
      heroes.where((hero) => hero.type == "outlander").toList();

  /// get stw schematics of the profile
  List<STWSchematic> get schematics => items.whereType<STWSchematic>().toList();

  /// get stw weapons of the profile
  List<STWSchematic> get weapons =>
      schematics.where((schematic) => schematic.type == "weapon").toList();

  /// get stw trap of the profile
  List<STWSchematic> get traps =>
      schematics.where((schematic) => schematic.type == "trap").toList();

  /// get workers of the profile
  List<STWWorker> get workers => items.whereType<STWWorker>().toList();

  /// get manager workers of the profile
  List<STWWorker> get managers =>
      workers.where((worker) => worker.type == "manager").toList();
}
