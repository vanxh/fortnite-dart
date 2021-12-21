// ignore_for_file: non_constant_identifier_names

import 'endpoints.dart';
import 'fortnite_profile_ids.dart';

class MCP {
  final String _baseURL = Endpoints().mcp;

  /// account id to be used for mcp operations
  String accountId;

  /// profile id to be used for mcp operations
  FortniteProfile profileId;

  /// Get mcp request url
  MCP({required this.accountId, required this.profileId});

  /// Get mcp request url
  String url({
    String operation = "QueryProfile",
    String overrideProfile = "",
  }) {
    return "$_baseURL/$accountId/client/$operation?profileId=${overrideProfile == "" ? profileId : overrideProfile}";
  }

  String get QueryProfile => url(operation: "QueryProfile");
  String get ClaimLoginReward => url(operation: "ClaimLoginReward");
  String get ClientQuestLogin => url(operation: "ClientQuestLogin");
  String get PopulatePrerolledOffers =>
      url(operation: "PopulatePrerolledOffers");
  String get PurchaseCatalogEntry => url(operation: "PurchaseCatalogEntry");
  String get FortRerollDailyQuest => url(operation: "FortRerollDailyQuest");
  String get SetMtxPlatform => url(operation: "SetMtxPlatform");
  String get RecycleItemBatch => url(operation: "RecycleItemBatch");
  String get RecycleItem => url(operation: "RecycleItem");
  String get RefreshExpeditions => url(operation: "RefreshExpeditions");
  String get PurchaseHomebaseNode => url(operation: "PurchaseHomebaseNode");
  String get OpenCardPackBatch => url(operation: "OpenCardPackBatch");
  String get OpenCardPack => url(operation: "OpenCardPack");
}
