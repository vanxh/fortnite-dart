import "profile_item.dart";
import "../client/client.dart";
import "../util/utils.dart";
import "../../resources/fortnite_profile_ids.dart";

/// STW Schematic object
class STWSchematic extends ProfileItem {
  /// STW Schematic
  STWSchematic(
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

  /// get type of schematic (weapon or trap).
  String get type =>
      oreOrCrystalRegex.firstMatch(templateId.split(":")[1])?.group(1) == null
          ? "trap"
          : "weapon";

  /// get tier
  int get tier => int.parse(
      tierRegex.firstMatch(templateId.split(":")[1])?.group(1) ?? "01");

  /// get rarity
  String get rarity =>
      stwRarities[
          schematicRarityRegex.firstMatch(templateId.split(":")[1])?.group(1) ??
              "c"] ??
      "common";

  /// is the schematic ore or crystal.
  /// its null if the schematic is a trap.
  String? get oreOrCrystal =>
      oreOrCrystalRegex.firstMatch(templateId.split(":")[1])?.group(1);
}
