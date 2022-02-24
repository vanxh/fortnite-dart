import "client.dart";
import "inventory_profile.dart";

import "../../resources/fortnite_profile_ids.dart";

/// inventory profile manager library
class VenturesBackpackProfile extends InventoryProfile {
  /// inventory profile constructor
  VenturesBackpackProfile(Client client)
      : super(client, FortniteProfile.theater2);
}
