import "epic_services.dart";

class Endpoints {
  String get _oAuth => "${EpicServices().accountService}/account/api/oauth";

  String get oauthTokenCreate => "$_oAuth/token";
  String get oauthTokenVerify => "$_oAuth/verify";
  String get oauthTokenDelete => "$_oAuth/sessions/kill";
  String get oauthTokenDeleteMultiple => "$_oAuth/sessions/kill";
  String get oauthExchange => "$_oAuth/exchange";
  String get oauthDeviceAuth =>
      "${EpicServices().accountService}/account/api/public/account";
  String get oauthDeviceCode => "$_oAuth/deviceAuthorization";
  String get calderaToken =>
      "${EpicServices().calderaService}/caldera/api/v1/launcher/racp";

  String get accountMultiple =>
      "${EpicServices().accountService}/account/api/public/account";
  String get accountDisplayName =>
      "${EpicServices().accountService}/account/api/public/account/displayName";
  String get accountId =>
      "${EpicServices().accountService}/account/api/public/account";
  String get accountEmail =>
      "${EpicServices().accountService}/account/api/public/account/email";
  String get userSearch => "${EpicServices().userSearchService}/api/v1/search";

  String get brStats => "${EpicServices().statsService}/statsproxy/api/statsv2";
  String get mcp =>
      "${EpicServices().fortniteService}/fortnite/api/game/v2/profile";

  String get fortniteStatus =>
      "${EpicServices().lightswitchService}/lightswitch/api/service/bulk/status?serviceId=Fortnite";
  String get fortniteCatalog =>
      "${EpicServices().fortniteService}/fortnite/api/storefront/v2/catalog";
  String get eventFlags =>
      "${EpicServices().fortniteService}/fortnite/api/calendar/v1/timeline";

  String get fortniteParty =>
      "${EpicServices().partyService}/party/api/v1/Fortnite";

  String get friends => "${EpicServices().friendService}/friends/api/v1";
  String get addFriend =>
      "${EpicServices().friendService}/friends/api/public/friends";
  String get removeFriend => "${EpicServices().friendService}/friends/api/v1";
  String get blockFriend =>
      "${EpicServices().friendService}/friends/api/public/blocklist";
}
