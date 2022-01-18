/// A class representing storm king quest
// ignore_for_file: non_constant_identifier_names

class StormKingQuest {
  /// The quest id
  String templateId;

  /// The quest name
  String name;

  /// The quest description
  String description;

  /// current completion
  int _completionCurrent = 0;

  /// Target completion of the quest
  int completionTarget;

  /// Is quest first week only
  bool firstWeekOnly = false;

  StormKingQuest(
    this.templateId,
    this.name,
    this.description,
    this.completionTarget, {
    this.firstWeekOnly = false,
  });

  /// Get current completion of quest
  int get completionCurrent => _completionCurrent;

  /// Set current completion of quest
  set completionCurrent(int value) {
    _completionCurrent = value;
    if (value >= completionTarget) {
      _completionCurrent = completionTarget;
    }
  }

  /// is quest completed
  bool get isCompleted => _completionCurrent == completionTarget;
}

StormKingQuest stw_stormkinghard_kingme = StormKingQuest(
  "Quest:stw_stormkinghard_kingme",
  "King Me",
  "Eliminate Mini-Bosses in 140+ zones.",
  2,
  firstWeekOnly: true,
);

StormKingQuest stw_stormkinghard_firsttakedown = StormKingQuest(
  "Quest:stw_stormkinghard_firsttakedown",
  "Regicide",
  "Eliminate the Mythic Storm King.",
  1,
  firstWeekOnly: true,
);

StormKingQuest stw_stormkinghard_weekly_002 = StormKingQuest(
  "Quest:stw_stormkinghard_weekly_002",
  "Scions of the Storm King: Storm Chests",
  "Complete a stormchest in a 140+ zone.",
  1,
);

StormKingQuest stw_stormkinghard_weekly_003 = StormKingQuest(
  "Quest:stw_stormkinghard_weekly_003",
  "Scions of the Storm King: Mini-Bosses",
  "Eliminate Mini-Bosses in 140+ zones.",
  3,
);

StormKingQuest stw_stormkinghard_weekly_004 = StormKingQuest(
  "Quest:stw_stormkinghard_weekly_004",
  "Scions of the Storm King: Mist Monsters",
  "Eliminate mist monsters in 140+ zones.",
  20,
);

StormKingQuest stw_stormkinghard_weekly_005 = StormKingQuest(
  "Quest:stw_stormkinghard_weekly_005",
  "Scions of the Storm King: Survivors",
  "Rescue survivors in 140+ zones.",
  10,
);

StormKingQuest stw_stormkinghard_weekly_007 = StormKingQuest(
  "Quest:stw_stormkinghard_weekly_007",
  "Scions of the Storm King: Elementals",
  "Eliminate elemental husks in 140+ zones.",
  300,
);

StormKingQuest stw_stormkinghard_weekly_showdown = StormKingQuest(
  "Quest:stw_stormkinghard_weekly_showdown",
  "Defeat the Mythic Storm King!",
  "Eliminate the Mythic Storm King.",
  1,
);

Map<String, StormKingQuest> stormKingQuests = {
  stw_stormkinghard_kingme.templateId: stw_stormkinghard_kingme,
  stw_stormkinghard_firsttakedown.templateId: stw_stormkinghard_firsttakedown,
  stw_stormkinghard_weekly_002.templateId: stw_stormkinghard_weekly_002,
  stw_stormkinghard_weekly_003.templateId: stw_stormkinghard_weekly_003,
  stw_stormkinghard_weekly_004.templateId: stw_stormkinghard_weekly_004,
  stw_stormkinghard_weekly_005.templateId: stw_stormkinghard_weekly_005,
  stw_stormkinghard_weekly_007.templateId: stw_stormkinghard_weekly_007,
  stw_stormkinghard_weekly_showdown.templateId:
      stw_stormkinghard_weekly_showdown,
};
