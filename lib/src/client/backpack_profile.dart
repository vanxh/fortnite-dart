import "client.dart";
import "inventory_profile.dart";

import "../../resources/fortnite_profile_ids.dart";

/// inventory profile manager library
class BackpackProfile extends InventoryProfile {
  /// inventory profile constructor
  BackpackProfile(Client client) : super(client, FortniteProfile.theater0);
}
