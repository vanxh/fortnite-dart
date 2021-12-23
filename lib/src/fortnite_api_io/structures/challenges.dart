class ChallengeResponse {
  late bool result = false;
  late int season = 0;
  late String lang = "en";
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

class ChallengeBundle {
  late String id;
  late String name;
  late String unlockType;
  late List<dynamic> tags;
  late List<dynamic> apiTags;
  late dynamic colors;
  late dynamic images;
  late List<dynamic> bundleRewards;
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

class Quest {
  late String id;
  late String name;
  late bool enabled;
  late String enabledDate;
  late dynamic parentQuest;
  late int progressTotal;
  late dynamic tandemCharacter;
  late List<dynamic> tags;
  late dynamic reward;
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
