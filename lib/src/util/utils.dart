import "package:dio/dio.dart";
import "../structures/device_auth.dart";
import "../../resources/endpoints.dart";
import "../../resources/auth_clients.dart";

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

/// Vbucks type
Map<String, String> vbucksType = {
  "MtxComplimentary": "STW/Refunds",
  "MtxGiveaway": "Challenges/Battle Pass",
  "MtxPurchased": "Purchased",
  "MtxPurchaseBonus": "Purchase Bonus",
};

/// Vbucks platform
Map<String, String> vbucksPlatform = {
  "Live": "Xbox",
  "PSN": "Playstation",
};

/// Fortnite rarities object
Map<String, String> stwRarities = {
  "c": "common",
  "uc": "uncommon",
  "r": "rare",
  "vr": "epic",
  "sr": "legendary",
  "ur": "mythic",
};

/// stw survivor lead synergies
Map<String, String> stwSurvivorLeadSynergy = {
  "trainingteam": "IsTrainer",
  "fireteamalpha": "IsSoldier",
  "closeassaultsquad": "IsMartialArtist",
  "thethinktank": "IsInventor",
  "emtsquad": "IsDoctor",
  "corpsofengineering": "IsEngineer",
  "scoutingparty": "IsExplorer",
  "gadgeteers": "IsGadgeteer",
};

/// regex to get tier from template id
RegExp tierRegex = RegExp(r"t([0-9]+)$");

/// regex to get rarity of schematic from template id
RegExp schematicRarityRegex = RegExp(r"_(c|uc|r|vr|sr|ur)_(?=(crystal|ore|t))");

/// regex to get if a schematic is ore or crystal or null
RegExp oreOrCrystalRegex = RegExp(r"(crystal|ore)_t[0-9]+");
