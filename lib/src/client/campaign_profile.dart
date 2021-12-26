import "client.dart";
import "mcp_profile.dart";

import "../structures/profile_item.dart";
import "../structures/stw_resource.dart";
import "../structures/stw_hero.dart";
import "../structures/stw_worker.dart";
import "../structures/stw_schematic.dart";

import "../../resources/fortnite_profile_ids.dart";
import "../../resources/mcp_operations.dart";
import "../../resources/homebase_rating_keys.dart";

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
      dynamic leadWorker = squad.firstWhere((s) => s.squad?["slotIdx"] == 0);

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
}
