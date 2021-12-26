import "package:numeral/numeral.dart";
import "profile_item.dart";
import "../client/client.dart";
import "../../resources/fortnite_profile_ids.dart";

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
