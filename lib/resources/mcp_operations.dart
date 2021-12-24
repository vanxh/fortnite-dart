// ignore_for_file: non_constant_identifier_names

import "endpoints.dart";
import "fortnite_profile_ids.dart";

/// MCP operations object
class MCP {
  /// base url for mcp requests
  final String _baseURL = Endpoints().mcp;

  /// account id to be used for mcp operations
  String accountId;

  /// profile id to be used for mcp operations
  final FortniteProfile _profileId;

  /// profile id as string
  late String profileId;

  /// Get mcp request url
  MCP(this._profileId, {required this.accountId}) {
    switch (_profileId) {
      case FortniteProfile.athena:
        profileId = "athena";
        break;

      case FortniteProfile.campaign:
        profileId = "campaign";
        break;

      case FortniteProfile.common_core:
        profileId = "common_core";
        break;

      case FortniteProfile.common_public:
        profileId = "common_public";
        break;

      case FortniteProfile.outpost0:
        profileId = "outpost0";
        break;

      case FortniteProfile.theater0:
        profileId = "theater0";
        break;

      case FortniteProfile.theater1:
        profileId = "theater1";
        break;

      case FortniteProfile.theater2:
        profileId = "theater2";
        break;
    }
  }

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
  String get UnslotAllWorkers => url(operation: "UnslotAllWorkers");
  String get UnassignAllSquads => url(operation: "UnassignAllSquads");
  String get TransmogItem => url(operation: "TransmogItem");
  String get SkipTutorial => url(operation: "SkipTutorial");
  String get ModifyMission => url(operation: "ModifyMission");
  String get IssueFriendCode => url(operation: "IssueFriendCode");
  String get IncrementNamedCounterStat =>
      url(operation: "IncrementNamedCounterStat");
  String get GetMcpTimeForLogin => url(operation: "GetMcpTimeForLogin");
  String get EquipCharCosmetic => url(operation: "EquipCharCosmetic");
  String get EndPrimaryMission => url(operation: "EndPrimaryMission");
  String get EarnScore => url(operation: "EarnScore");
  String get ConvertItem => url(operation: "ConvertItem");
  String get ConsumeItems => url(operation: "ConsumeItems");
  String get CollectExpedition => url(operation: "CollectExpedition");
  String get ClaimMissionAlertRewards =>
      url(operation: "ClaimMissionAlertRewards");
  String get ClaimCollectionBookRewards =>
      url(operation: "ClaimCollectionBookRewards");
  String get ClaimCollectedResources =>
      url(operation: "ClaimCollectedResources");
  String get AssignWorkerToSquadBatch =>
      url(operation: "AssignWorkerToSquadBatch");
  String get AssignWorkerToSquad => url(operation: "AssignWorkerToSquad");
  String get ApplyAlteration => url(operation: "ApplyAlteration");
  String get ActivateConsumable => url(operation: "ActivateConsumable");
}
