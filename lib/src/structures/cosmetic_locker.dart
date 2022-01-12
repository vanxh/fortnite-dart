import "profile_item.dart";
import "../client/client.dart";
import "../../resources/fortnite_profile_ids.dart";

/// Fortnite Athena cosmetic locker item object
class CosmeticLocker extends ProfileItem {
  /// Athena cosmetic locker
  CosmeticLocker(
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

  /// is the item seen
  bool get seen => attributes["item_seen"];

  /// is the item favourite
  String get favorite => attributes["favorite"];

  /// item's name
  String get name => attributes["locker_name"];

  /// locker slot data
  Map<String, dynamic> get _lockerSlotsData =>
      attributes["locker_slots_data"]?["slots"] ?? {};

  /// loading screen of cosmetic locker
  String? get loadingScreen =>
      (_lockerSlotsData["LoadingScreen"]?["items"] as List).first?.toString();

  /// music pack of cosmetic locker
  String? get musicPack =>
      (_lockerSlotsData["MusicPack"]?["items"] as List).first?.toString();

  /// get items wraps of cosmetic locker
  List<String> get itemWraps =>
      (_lockerSlotsData["ItemWrap"]?["items"] as List).cast<String>();

  /// get emotes of cosmetic locker
  List<String> get emotes =>
      (_lockerSlotsData["Dance"]?["items"] as List).cast<String>();

  /// get character of cosmetic locker
  String? get character =>
      (_lockerSlotsData["Character"]?["items"] as List).first?.toString();

  /// get sky diving contrail of cosmetic locker
  String? get skyDivingContrail =>
      (_lockerSlotsData["SkyDiveContrail"]?["items"] as List).first?.toString();

  /// get glider of cosmetic locker
  String? get glider =>
      (_lockerSlotsData["Glider"]?["items"] as List).first?.toString();

  /// get backpack of cosmetic locker
  String? get backpack =>
      (_lockerSlotsData["Backpack"]?["items"] as List).first?.toString();

  /// get pickaxe of cosmetic locker
  String? get pickaxe =>
      (_lockerSlotsData["Pickaxe"]?["items"] as List).first?.toString();
}
