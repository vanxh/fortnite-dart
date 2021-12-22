import "package:dio/dio.dart";
import "../structures/device_auth.dart";
import "package:fortnite/resources/endpoints.dart";
import "package:fortnite/resources/auth_clients.dart";

/// parses an authorization code
dynamic parseAuthorizationCode(String authCode) {
  if (authCode.length == 32) {
    return authCode;
  }

  return RegExp(r"code=([a-f0-9]+)").firstMatch(authCode)?.group(1);
}

/// get a url to get authorization code from.
///
/// [forceLogin] - if true, the url will force the user to login to an account before getting its authorization code.
///
/// [clientId] - the client id to use (by default fortniteIOSClient that used by the library).
String getAuthorizationCodeURL({
  bool forceLogin = false,
  String clientId = "3446cd72694c4a4485d81b77adbb2141",
}) {
  String loginURL = "https://www.epicgames.com/id/login";
  String redirectURL =
      "https://www.epicgames.com/id/api/redirect?clientId=$clientId&responseType=code${forceLogin ? "&prompt=login" : ""}";

  return "$loginURL?redirectUrl=${Uri.encodeComponent(redirectURL)}";
}

/// creates a device auth object with authorization code
Future<DeviceAuth> authenticateWithAuthorizationCode(
    String authorizationCode) async {
  if (parseAuthorizationCode(authorizationCode) == null) {
    throw "That is not a valid authorization code.";
  }

  try {
    Response<dynamic> res = await Dio().post(
      Endpoints().oauthTokenCreate,
      options: Options(
        headers: {
          "Authorization": "basic ${AuthClients().fortniteIOSGameClient}",
          "User-Agent":
              "Fortnite/++Fortnite+Release-18.21-CL-17811397 Android/11",
          "Content-Type": "application/x-www-form-urlencoded",
        },
      ),
      data:
          "grant_type=authorization_code&code=${parseAuthorizationCode(authorizationCode)}&token_type=eg1",
    );

    String accessToken = res.data["access_token"];
    String accountId = res.data["account_id"];
    String displayName = res.data["displayName"] ?? accountId;

    Response<dynamic> res2 = await Dio().post(
      "${Endpoints().oauthDeviceAuth}/$accountId/deviceAuth",
      options: Options(
        headers: {
          "Authorization": "bearer $accessToken",
          "User-Agent":
              "Fortnite/++Fortnite+Release-18.21-CL-17811397 Android/11",
          "Content-Type": "application/json",
        },
      ),
    );

    return DeviceAuth(
      accountId: accountId,
      deviceId: res2.data["deviceId"],
      secret: res2.data["secret"],
      displayName: displayName,
    );
  } on DioError catch (e) {
    throw e.response?.data["errorMessage"] ?? "Unknown Error";
  }
}
