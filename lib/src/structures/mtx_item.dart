import "profile_item.dart";
import "../client/client.dart";
import "../util/utils.dart";
import "../../resources/fortnite_profile_ids.dart";

/// V-Bucks item object
class MtxItem extends ProfileItem {
  /// V-Bucks item
  MtxItem(
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

  /// get type of mtx item
  String get type =>
      vbucksType[templateId.split(":")[1]] ?? templateId.split(":")[1];

  /// get platform of mtx item
  String get platform =>
      vbucksPlatform[attributes["platform"]] ?? attributes["platform"];
}
