/// fortnite challenges response
class ChallengeResponse {
  /// result success of response
  late bool result = false;

  /// season number for quest bundles
  late int season = 0;

  /// language of response
  late String lang = "en";

  /// list of quest bundles
  List<ChallengeBundle> bundles = [];

  ChallengeResponse(dynamic res) {
    if (res == null) {
      return;
    }

    result = res["result"] as bool;
    season = res["season"] as int;
    lang = res["lang"] as String;

    for (dynamic bundle in res["bundles"]) {
      bundles.add(
        ChallengeBundle(
          id: bundle["id"],
          name: bundle["name"],
          unlockType: bundle["unlockType"],
          tags: bundle["tags"],
          apiTags: bundle["apiTags"],
          colors: bundle["colors"],
          images: bundle["images"],
          bundleRewards: bundle["bundleRewards"],
        ),
      );
    }
  }
}

/// fortnite challenge bundle
class ChallengeBundle {
  /// bundle id
  late String id;

  /// bundle name
  late String name;

  /// unlock type
  late String unlockType;

  /// tags
  late List<dynamic> tags;

  /// api tags
  late List<dynamic> apiTags;

  /// colors for the bundle
  late dynamic colors;

  /// images for quest bundle
  late dynamic images;

  /// rewards for the bundle
  late List<dynamic> bundleRewards;

  /// list of challenges
  List<Quest> quests = [];

  ChallengeBundle({
    required this.id,
    required this.name,
    required this.unlockType,
    required this.tags,
    required this.apiTags,
    required this.colors,
    required this.images,
    required this.bundleRewards,
    List<dynamic> q = const [],
  }) {
    q.map((quest) {
      quests.add(
        Quest(
          id: quest["id"],
          name: quest["name"],
          enabled: quest["enabled"],
          enabledDate: quest["enabledDate"],
          parentQuest: quest["parentQuest"],
          progressTotal: quest["progressTotal"],
          tandemCharacter: quest["tandemCharacter"],
          tags: quest["tags"],
          locations: quest["locations"],
          reward: quest["reward"],
        ),
      );
    });
  }
}

/// fortnite quest
class Quest {
  /// quest id
  late String id;

  /// quest name
  late String name;

  /// is the quest enabled
  late bool enabled;

  /// date when quest was enabled
  late String enabledDate;

  /// parest quest of the quest
  late dynamic parentQuest;

  /// total progress of the quest
  late int progressTotal;

  /// npc character of the quest
  late dynamic tandemCharacter;

  /// tags of the quest
  late List<dynamic> tags;

  /// reward object for quest
  late dynamic reward;

  /// map locations for the quest
  late List<dynamic> locations;

  Quest({
    required this.id,
    required this.name,
    required this.enabled,
    required this.enabledDate,
    required this.parentQuest,
    required this.progressTotal,
    required this.tandemCharacter,
    required this.tags,
    required this.reward,
    required this.locations,
  });
}
