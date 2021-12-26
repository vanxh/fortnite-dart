import "package:numeral/numeral.dart";
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

/// STW Account resource object
class AccountResource extends ProfileItem {
  /// STW Account resource
  AccountResource(
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

  /// beautiful string quantity value of the resource
  String get quantityString => Numeral(quantity).value();

  /// parsed id of resource
  String get resourceId => templateId.split(":")[1];
}

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
  int get tier =>
      int.tryParse(templateId
          .split(":")[1]
          .split("_")[templateId.split(":")[1].split("_").length - 1]
          .split("t")[1]
          .toString()) ??
      1;

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
