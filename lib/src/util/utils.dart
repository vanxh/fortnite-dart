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
