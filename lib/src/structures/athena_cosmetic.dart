import "profile_item.dart";
import "../client/client.dart";
import "../../resources/fortnite_profile_ids.dart";

/// Fortnite Athena cosmetic item object
class AthenaCosmetic extends ProfileItem {
  /// Athena cosmetic
  AthenaCosmetic(
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

  /// type of cosmetic
  String get type => templateId.split(":")[0];

  /// variants of item
  List<AthenaCosmeticVariant> get variants => attributes["variants"]
      .map<AthenaCosmeticVariant>(
          (variant) => AthenaCosmeticVariant.fromJson(variant))
      .toList();

  /// is the item seen
  bool get seen => attributes["item_seen"];

  /// is the item favourite
  String get favorite => attributes["favorite"];

  /// is the item gifted from a player
  bool get isGifted =>
      attributes["giftFromAccountId"] != null &&
      attributes["giftFromAccountId"] != "";

  /// item gifted from
  String? get giftedFrom => attributes["giftFromAccountId"];
}

/// Athena cosmetic variant object
class AthenaCosmeticVariant {
  /// The variant's channel id
  String channel;

  /// The variant's active channel
  String active;

  /// Owned variants
  List<String> owned;

  AthenaCosmeticVariant({
    required this.channel,
    required this.active,
    required this.owned,
  });

  /// Creates a new [AthenaCosmeticVariant] from a JSON object
  factory AthenaCosmeticVariant.fromJson(Map<String, dynamic> json) =>
      AthenaCosmeticVariant(
        channel: json["channel"],
        active: json["active"],
        owned: List<String>.from(json["owned"].map((x) => x.toString())),
      );
}
