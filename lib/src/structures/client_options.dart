import "package:logging/logging.dart";
import "device_auth.dart";

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
}
