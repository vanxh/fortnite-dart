import "package:dio/dio.dart";
import "./structures/items.dart";
import "./structures/challenges.dart";
import "./structures/item_sets.dart";
import "./structures/rarities.dart";
import "./structures/shop.dart";

class FortniteApiIo {
  /// The base URL for the API.
  final String _apiURL = "https://fortniteapi.io";

  /// get your api key from [fortniteapi.io](https://dashboard.fortniteapi.io/)
  late String apiKey;

  /// language to use for the api.
  /// default is english.
  ///
  /// Supported languages: en, ar, de, es, es-419, fr, it, ja, ko, pl, pt-BR, ru, tr, zh-CN, zh-Hant
  late String language;

  /// constructor for fortnite api io object
  FortniteApiIo({
    required this.apiKey,
    this.language = "en",
  }) {
    [
      "en",
      "ar",
      "de",
      "es",
      "es-419",
      "fr",
      "it",
      "ja",
      "ko",
      "pl",
      "pt-BR",
      "ru",
      "tr",
      "zh-CN",
      "zh-Hant",
    ].contains(language)
        ? null
        : throw Exception("Language not supported");
  }

  /// send a request to api
  Future<dynamic> _send({
    String apiVersion = "v2",
    required String endpoint,
    List<String> query = const [],
    int retries = 0,
  }) async {
    query.add("lang=$language");
    final String url = "$_apiURL/$apiVersion/$endpoint?${query.join("&")}";

    try {
      Response res = await Dio().fetch(
        RequestOptions(
          method: "GET",
          path: url,
          headers: {
            "Authorization": apiKey,
          },
        ),
      );

      return res.data;
    } on DioError catch (e) {
      int statusCode = e.response?.statusCode ?? 0;

      if (statusCode.toString().startsWith("5")) {
        if (retries < 5) {
          await Future.delayed(
            Duration(seconds: 5),
            () async {
              return await _send(
                apiVersion: apiVersion,
                endpoint: endpoint,
                query: query,
                retries: retries + 1,
              );
            },
          );
        } else {
          throw Exception("fortniteapi.io is currently down");
        }
      }

      throw Exception(e.response?.data ?? "Unknown error");
    }
  }

  /// get current challenges
  Future<ChallengeResponse> getChallenges({
    String season = "current",
  }) async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "challenges",
      query: ["season=$season"],
    );

    return ChallengeResponse(data);
  }

  /// get all items
  Future<ItemsResponse> getItems() async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "items/list",
      query: [],
    );

    return ItemsResponse(data);
  }

  /// get all upcoming items
  Future<ItemsResponse> getUpcomingItems() async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "items/upcoming",
      query: [],
    );

    return ItemsResponse(data);
  }

  /// get a specific item data
  Future<Item> getItemData(String itemId) async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "items/get?id=$itemId",
      query: [],
    );

    return Item(data["item"]);
  }

  /// get all item sets
  Future<ItemSetsResponse> getItemSets() async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "items/sets",
      query: [],
    );

    return ItemSetsResponse(data);
  }

  /// get all rarities
  Future<RaritiesResponse> getRarities() async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "rarities",
      query: [],
    );

    return RaritiesResponse(data);
  }

  /// get current shop
  Future<ShopResponse> getShop() async {
    final data = await _send(
      apiVersion: "v2",
      endpoint: "shop",
      query: [],
    );

    return ShopResponse(data);
  }
}
