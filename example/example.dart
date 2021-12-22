import "package:fortnite/fortnite.dart";
import "package:logging/logging.dart";

// main function
void main() async {
  String authorizationCodeURL = getAuthorizationCodeURL(
    forceLogin: false,
  ); // get an authorization code url
  print(authorizationCodeURL); // print the url to the console

  // * get an authorization code from previous url and use it to create a device auth.
  // * a device auth dont gets invalid until you forcefully delete it or change your password.
  DeviceAuth deviceAuth = await authenticateWithAuthorizationCode(
    "13656257585e47aa945b761e88903ab3", // authorization code
  );
  // cache the device auth by saving in some file or database for future use

  // create a client object with the device auth
  final Client client = Client(
    options: ClientOptions(
      log: true,
      deviceAuth: deviceAuth,
      logLevel: Level.ALL,
    ),
  );

  print(client.accountId); // print the account id of the client

  // rest of your code
}
