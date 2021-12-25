import "client.dart";
import "mcp_profile.dart";

/// common core profile manager library
class CommonCoreProfile extends McpProfile {
  /// common core profile object
  CommonCoreProfile(Client client) : super(client);

  /// init the profile
  Future<dynamic> init() async {
    if (initialized == false) return;

    initialized = true;
    client.log(LogLevel.info, "Common core profile module initialized");
  }
}
