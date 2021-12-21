import 'device_auth.dart';

class ClientOptions {
  /// should log
  late bool log;

  /// device auth
  late DeviceAuth deviceAuth;

  /// client options object
  ClientOptions({
    this.log = true,
    required this.deviceAuth,
  });
}
