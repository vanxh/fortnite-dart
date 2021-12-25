import "dart:io";
import "dart:convert";
import "package:fortnite/fortnite.dart";
import "package:logging/logging.dart";

final File deviceAuthFile = File("device_auth.json");

// main function
void main() async {
  DeviceAuth deviceAuth;

  if (!(await deviceAuthFile.exists())) {
    /// get an authorization code url
    String authorizationCodeURL = getAuthorizationCodeURL(
      forceLogin: false,
    );

    /// print the url to the console
    print(authorizationCodeURL);

    /// get an authorization code from previous url and use it to create a device auth.
    /// a device auth dont gets invalid until you forcefully delete it or change your password.
    deviceAuth = await authenticateWithAuthorizationCode(
      "f6e913e9bdb842b4b184370beac6cf2a", // authorization code
    );

    /// write the device auth to a file
    await deviceAuthFile.writeAsString(
      JsonEncoder().convert({
        "accountId": deviceAuth.accountId,
        "deviceId": deviceAuth.deviceId,
        "secret": deviceAuth.secret,
        "displayName": deviceAuth.displayName,
      }),
    );
  }

  /// read the device auth from the file
  var deviceAuthDetails = jsonDecode(await deviceAuthFile.readAsString());

  /// create the device object
  deviceAuth = DeviceAuth(
    accountId: deviceAuthDetails["accountId"],
    deviceId: deviceAuthDetails["deviceId"],
    secret: deviceAuthDetails["secret"],
    displayName: deviceAuthDetails["displayName"],
  );

  /// create the client object
  final Client client = Client(
    options: ClientOptions(
      log: true,
      deviceAuth: deviceAuth,
      logLevel: Level.ALL,
    ),
  );

  /// initialize the common core profile for the client
  await client.commonCore.init();

  /// print vbucks from common core profile data
  print(
      "${client.displayName} you have ${client.commonCore.totalVbucks} V-Bucks");
}
