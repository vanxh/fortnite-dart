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

  /// get rarity enum
  String get rarityEnum {
    List fields = templateId.split(":")[1].split("_");
    fields.removeAt(0);
    fields.removeLast();

    return fields.last;
  }

  /// get rarity
  String get rarity => stwRarities[rarityEnum] ?? rarityEnum;

  /// get gender
  String get gender =>
      attributes["gender"].toString() == "1" ? "male" : "female";

  /// get power level of the hero.
  num get rating =>
      baseItemRating["default_${rarityEnum}_t0$tier"]?.eval(level) ?? 0.0;
}
