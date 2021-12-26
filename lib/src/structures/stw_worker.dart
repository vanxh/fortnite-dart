import "profile_item.dart";
import "../client/client.dart";
import "../util/utils.dart";
import "../../resources/fortnite_profile_ids.dart";

/// STW Worker object
class STWWorker extends ProfileItem {
  /// STW Worker
  STWWorker(
    Client client, {
    required String id,
    required FortniteProfile profileId,
    required String templateId,
    required Map<String, dynamic> attributes,
    required int quantity,
  }) : super(
          client,
          id: id,
          profileId: profileId,
          templateId: templateId,
          attributes: attributes,
          quantity: quantity,
        );

  /// get level
  int get level => int.tryParse(attributes["level"].toString()) ?? 1;

  /// get raw type of survivor
  String get rawType => templateId.split(":")[1].split("_")[0];

  /// get type of survivor
  String get type => rawType == "worker"
      ? "special"
      : rawType.contains("manager")
          ? "manager"
          : "basic";

  /// get tier
  int get tier => int.parse(
      tierRegex.firstMatch(templateId.split(":")[1])?.group(1) ?? "01");

  /// get rarity
  String get rarity {
    List fields = templateId.split(":")[1].split("_");
    fields.removeAt(0);
    fields.removeLast();

    String r = type == "manager" ? fields.first : fields.last;

    return stwRarities[r] ?? r;
  }

  /// get gender
  String get gender =>
      attributes["gender"].toString() == "1" ? "male" : "female";

  /// get synergy of manager.
  /// it is null if worker is not a manager
  String? get managerSynergy =>
      type == "manager" ? attributes["managerSynergy"] : null;

  /// squad data of worker
  Map<String, dynamic>? get squad => attributes["squad_id"] != ""
      ? {
          "id": attributes["squad_id"],
          "name": attributes["squad_id"].split("_")[3],
          "type": attributes["squad_id"].split("_")[2],
          "slotIdx": attributes["squad_slot_idx"],
        }
      : null;

  /// portrait of the worker
  String get portrait => attributes["portrait"];

  /// personality of worker
  String get personality => attributes["personality"];

  /// building slot id
  String? get buildingSlotId => attributes["building_slot_used"] != -1
      ? attributes["slotted_building_id"]
      : null;

  /// set bonus of worker
  String get setBonus => attributes["set_bonus"];

  /// is the worker a leader
  bool get isLeader => type == "manager";

  /// rarity value of worker.
  /// its an int between 0-6
  int get rarityValue {
    return {
          "common": [1, 1],
          "uncommon": [2, 2],
          "rare": [3, 3],
          "epic": [4, 4],
          "legendary": [5, 5],
          "mythic": [6, 0],
        }[rarity]?[isLeader ? 1 : 0] ??
        0;
  }

  /// get evo constant of worker.
  /// its a num between 0-9.85
  num get evoConstant {
    return {
          1: [5, 5],
          2: [6.35, 6.35],
          3: [7, 7],
          4: [8, 8],
          5: [9, 9],
          6: [9.85, 0],
        }[rarityValue]?[isLeader ? 1 : 0] ??
        0;
  }

  /// get level constant of survivor.
  /// its a num between 0-1.645
  num get levelConstant {
    return {
          1: [1, 1],
          2: [1.08, 1.08],
          3: [1.245, 1.245],
          4: [1.374, 1.374],
          5: [1.5, 1.5],
          6: [1.645, 0],
        }[rarityValue]?[isLeader ? 1 : 0] ??
        0;
  }

  /// get power level of the worker.
  /// depends on [tier] , [level] , [rarityValue] and [isLeader].
  num get rating {
    return ((5 * rarityValue) -
            (isLeader ? 0 : 5) +
            (level - 1) * levelConstant +
            (tier - 1) * evoConstant)
        .round();
  }

  /// the workers lead bonus.
  /// will return 0 if worker is not a leader.
  num get leadBonus {
    if (managerSynergy == null || squad == null) {
      return 0;
    }

    if (stwSurvivorLeadSynergy[squad?["name"]] ==
        managerSynergy?.split(".")[2]) {
      return rating;
    }

    return 0;
  }

  /// get the workers bonus.
  /// depends on the leaders rarity and personality.
  /// returns 0 if worker is a leader.
  num bonus(STWWorker leaderWorker) {
    if (isLeader) {
      return 0;
    }

    if (!leaderWorker.isLeader) {
      return 0;
    }

    if (personality == leaderWorker.personality) {
      switch (leaderWorker.rarity) {
        case "legendary":
          return 8;

        case "epic":
          return 5;

        case "rare":
          return 4;

        case "uncommon":
          return 3;

        case "common":
          return 2;
      }
    } else if (leaderWorker.rarity == "legendary") {
      if (rating <= 2) {
        return 0;
      }
      return -2;
    }

    return 0;
  }
}
