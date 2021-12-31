/// device auth object
class DeviceAuth {
  /// The account ID for the device auth
  late String accountId;

  /// The device ID for the device auth
  late String deviceId;

  /// The secret for the device auth
  late String secret;

  /// display name for user of device auth
  late String displayName;

  /// constructor
  DeviceAuth({
    required this.accountId,
    required this.deviceId,
    required this.secret,
    this.displayName = "",
  });

  /// device auth from json method
  factory DeviceAuth.fromJson(Map<String, dynamic> json) => DeviceAuth(
        accountId: json["accountId"] is String ? json["accountId"] ?? "" : "",
        deviceId: json["deviceId"] is String ? json["deviceId"] ?? "" : "",
        secret: json["secret"] is String ? json["secret"] ?? "" : "",
        displayName:
            json["displayName"] is String ? json["displayName"] ?? "" : "",
      );

  /// device auth to json method
  Map<String, String> toJson() => {
        "accountId": accountId,
        "deviceId": deviceId,
        "secret": secret,
        "displayName": displayName,
      };
}
