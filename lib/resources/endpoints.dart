import 'epic_services.dart';

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

  String get brStats => "${EpicServices().statsService}/statsproxy/api/statsv2";

  String get fortniteStatus =>
      "${EpicServices().lightswitchService}/lightswitch/api/service/bulk/status?serviceId=Fortnite";
  String get fortniteCatalog =>
      "${EpicServices().fortniteService}/fortnite/api/storefront/v2/catalog";
  String get eventFlags =>
      "${EpicServices().fortniteService}/fortnite/api/calendar/v1/timeline";
}
