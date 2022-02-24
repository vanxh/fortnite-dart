import "client.dart";
import "inventory_profile.dart";

import "../../resources/fortnite_profile_ids.dart";

/// inventory profile manager library
class StorageProfile extends InventoryProfile {
  /// inventory profile constructor
  StorageProfile(Client client) : super(client, FortniteProfile.outpost0);
}
