import "profile_item.dart";
import "../client/client.dart";
import "../../resources/fortnite_profile_ids.dart";

/// STW ingredient object
class STWIngredient extends ProfileItem {
  /// [STWIngredient]
  STWIngredient(
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
}
