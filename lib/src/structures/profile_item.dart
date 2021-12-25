import "../client/client.dart";
import "../util/utils.dart";
import "../../resources/fortnite_profile_ids.dart";

/// Fortnite profile item object
class ProfileItem {
  /// main client
  late Client client;

  /// profile id of the item
  late FortniteProfile profileId;

  /// unique id of the item
  late String id;

  /// template if of the item
  late String templateId;

  /// attributes of the item
  late Map<String, dynamic> attributes;

  /// quantity of the item
  late int quantity;

  /// profile item
  ProfileItem(
    this.client, {
    required this.id,
    required this.profileId,
    required this.templateId,
    required this.attributes,
    required this.quantity,
  });

  /// is the item favourite
  bool get isFavourite => attributes["favorite"] ?? false;
}

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

  String get type =>
      vbucksType[templateId.split(":")[1]] ?? templateId.split(":")[1];

  String get platform =>
      vbucksPlatform[attributes["platform"]] ?? attributes["platform"];
}
