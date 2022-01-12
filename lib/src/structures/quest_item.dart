import "profile_item.dart";
import "../client/client.dart";
import "../../resources/fortnite_profile_ids.dart";

/// Fortnite Quest item object
class QuestItem extends ProfileItem {
  /// Quest item
  QuestItem(
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

  /// Get when quest was created
  DateTime get creationTime =>
      DateTime.tryParse(attributes["creation_time"]) ?? DateTime(1970);

  /// Last update time
  DateTime get lastUpdate =>
      DateTime.tryParse(attributes["last_state_change_time"]) ?? DateTime(1970);

  /// get quest challenge bundle id
  String get challengeBundleId => attributes["challenge_bundle_id"];

  /// is the quest active
  bool get isActive => attributes["quest_state"] == "active";

  /// rarity of quest
  String get rarity => attributes["quest_rarity"];

  /// get completion of quest
  int get completion =>
      attributes[
          attributes.keys.firstWhere((key) => key.contains("completion"))] ??
      0;
}
