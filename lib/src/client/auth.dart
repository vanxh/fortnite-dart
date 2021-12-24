import "client.dart";
import "../structures/device_auth.dart";
import "../structures/http_response.dart";
import "../structures/external_auth.dart";
import "../../resources/endpoints.dart";
import "../../resources/auth_clients.dart";

/// fortnite auth library
class FortniteAuth {
  /// The master client
  late final Client _client;

  FortniteAuth(this._client) {
    _client.log(LogLevel.info, "Fortnite auth module initialized");
  }

  /// Authenticate with the Fortnite API
  dynamic createOAuthToken({
    required String grantType,
    required String grantData,
    String tokenType = "eg1",
    required String authClient,
  }) async {
    HttpResponse res = await _client.http.post(
      url: Endpoints().oauthTokenCreate,
      headers: {
        "Authorization": "basic $authClient",
        "Content-Type": "application/x-www-form-urlencoded",
        "User-Agent":
            "Fortnite/++Fortnite+Release-18.21-CL-17811397 Android/11",
      },
      body: "grant_type=$grantType&$grantData&token_type=$tokenType",
    );

    if (res.success) {
      return res.data["access_token"];
    } else {
      if (res.error?["errorCode"] ==
          "errors.com.epicgames.account.invalid_account_credentials") {
        throw Exception("Your account credentials are invalid");
      }
      throw Exception(res.error?["errorMessage"] ?? "Unknown error");
    }
  }

  /// creates a [DeviceAuth] object.
  /// a device auth is valid until its forcefully deleted or account password is changed.
  Future<DeviceAuth> createDeviceAuth() async {
    HttpResponse res = await _client.send(
      method: "POST",
      url: "${Endpoints().oauthDeviceAuth}/${_client.accountId}/deviceAuth",
    );

    return DeviceAuth(
      accountId: _client.accountId,
      deviceId: res.data["deviceId"],
      secret: res.data["secret"],
      displayName: _client.displayName,
    );
  }

  /// creates an exchange code to authenticate with the fortnite api.
  /// an exchange code is valid only for 30 seconds.
  /// an exchange code can be used to launch game/ perform any action on account.
  Future<String> createExchangeCode() async {
    HttpResponse res = await _client.send(
      method: "GET",
      url: Endpoints().oauthExchange,
    );

    return res.data["code"];
  }

  /// creates any client token by exchange code.
  /// get a client from [AuthClients] and pass that to [authClient] parameter.
  Future<String> createClientAccessToken({
    required String authClient,
  }) async {
    return await createOAuthToken(
      grantType: "exchange_code",
      grantData: "exchange_code=${createExchangeCode()}",
      authClient: authClient,
    );
  }

  /// kills an access token.
  /// it kills all sessions created with that access token.
  Future<dynamic> killAccessToken({
    required String token,
  }) async {
    return await _client.send(
      method: "DELETE",
      url: "${Endpoints().oauthTokenDelete}/$token",
    );
  }

  /// kills multiple auth token sessions at once.
  Future<dynamic> killSessions(String killType) async {
    return await _client.send(
      method: "DELETE",
      url: "${Endpoints().oauthTokenDeleteMultiple}?killType=$killType",
    );
  }

  /// returns external auth connections for the account
  Future<List<ExternalAuth>> getExternalAuths() async {
    List<ExternalAuth> auths = [];

    HttpResponse res = await _client.send(
      method: "GET",
      url: "${Endpoints().accountId}/${_client.accountId}/externalAuths",
    );

    for (dynamic auth in res.data) {
      auths.add(
        ExternalAuth(
          accountId: auth["accountId"] ?? "",
          externalAuthId: auth["externalAuthId"] ?? "",
          dateAdded: auth["dateAdded"] ?? "",
          externalAuthIdType: auth["externalAuthIdType"] ?? "",
          externalDisplayName: auth["externalDisplayName"] ?? "",
          regionInfo: auth["regionInfo"] ?? "",
          type: auth["type"] ?? "",
        ),
      );
    }

    return auths;
  }
}
