class DeviceAuth {
  /// The account ID for the device auth
  late String accountId;

  /// The device ID for the device auth
  late String deviceId;

  /// The secret for the device auth
  late String secret;

  /// display name for user of device auth
  late String displayName;

  DeviceAuth({
    required this.accountId,
    required this.deviceId,
    required this.secret,
    this.displayName = "",
  });
}
