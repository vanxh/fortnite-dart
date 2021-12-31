import "package:logging/logging.dart";
import "device_auth.dart";

/// options for the main client
class ClientOptions {
  /// should log
  late bool log;

  /// device auth
  late DeviceAuth deviceAuth;

  /// user agent to use
  String userAgent;

  /// log level
  Level logLevel;

  /// client options object
  ClientOptions({
    this.log = true,
    required this.deviceAuth,
    this.userAgent = "Fortnite/++Fortnite+Release-18.21-CL-17811397 Android/11",
    this.logLevel = Level.ALL,
  });

  /// client options from json method
  factory ClientOptions.fromJson(Map<String, dynamic> json) => ClientOptions(
        log: json["log"] is bool ? json["log"] : false,
        deviceAuth: json["deviceAuth"] is Map<String, dynamic>
            ? DeviceAuth.fromJson(json["deviceAuth"])
            : throw Exception(
                "deviceAuth property is not a valid Map<String, dynamic>"),
        logLevel: json["logLevel"] is Level ? json["logLevel"] : null,
        userAgent: json["userAgent"] is String ? json["userAgent"] : null,
      );
}
