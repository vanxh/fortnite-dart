/// Survivor squad preset object
class SurvivorSquadPreset {
  /// list of character ids
  List<String> characterIds;

  /// list of squad ids
  List<String> squadIds;

  /// list of slots
  List<int> slotIndices;

  /// constructor
  SurvivorSquadPreset({
    required this.characterIds,
    required this.squadIds,
    required this.slotIndices,
  });

  /// convert to json
  Map<String, dynamic> toJson() {
    return {
      "characterIds": characterIds,
      "squadIds": squadIds,
      "slotIndices": slotIndices,
    };
  }
}
