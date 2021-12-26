import "profile_item.dart";
import "../client/client.dart";
import "../util/utils.dart";
import "../../resources/fortnite_profile_ids.dart";

/// STW Hero object
class STWHero extends ProfileItem {
  /// STW Hero
  STWHero(
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

  /// get type
  String get type => templateId.split(":")[1].split("_")[1];

  /// get tier
  int get tier => int.parse(
      tierRegex.firstMatch(templateId.split(":")[1])?.group(1) ?? "01");

  /// get rarity
  String get rarity =>
      stwRarities[templateId
          .split(":")[1]
          .split("_")[templateId.split(":")[1].split("_").length - 2]] ??
      templateId
          .split(":")[1]
          .split("_")[templateId.split(":")[1].split("_").length - 2];

  /// get gender
  String get gender =>
      attributes["gender"].toString() == "1" ? "male" : "female";
}
