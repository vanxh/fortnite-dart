import "client.dart";

/// mcp profile manager library
class McpProfile {
  /// The master client
  late final Client client;

  /// is the profile initialized
  bool initialized = false;

  /// mcp profile object
  McpProfile(this.client);
}
