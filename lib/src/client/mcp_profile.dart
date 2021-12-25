import "client.dart";
import "../../resources/fortnite_profile_ids.dart";
import "../structures/profile_item.dart";

/// mcp profile manager library
abstract class McpProfile {
  /// The master client
  late final Client client;

  /// account id of the profile
  late String accountId;

  /// The profile id of mcp profile
  late FortniteProfile profileId;

  /// is the profile initialized
  bool initialized = false;

  /// When the profile was created
  late DateTime created;

  /// When the profile was last updated
  late DateTime updated;

  /// time of epic servers
  late DateTime serverTime;

  /// number of profile revisions
  late int rvn;

  /// profile items
  List<ProfileItem> items = [];

  /// profile stats
  late Map<String, dynamic> stats;

  /// mcp profile object
  McpProfile(this.client, this.profileId) {
    accountId = client.accountId;
  }

  bool confirmInitialized() {
    if (initialized) return true;
    throw Exception("Profile is not initialized yet");
  }
}
