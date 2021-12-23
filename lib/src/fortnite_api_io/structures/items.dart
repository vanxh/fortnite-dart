/// fortnite items response
class ItemsResponse {
  late bool result = false;
  List<Item> items = [];

  ItemsResponse(dynamic res) {
    result = res["result"] as bool;

    for (dynamic item in res["items"]) {
      items.add(Item(item));
    }
  }
}

/// fortnite item
class Item {
  late String mainId;
  late String id;
  late dynamic type;
  late String name;
  late String description;
  late dynamic rarity;
  late dynamic series;
  late int price;
  late dynamic added;
  late dynamic builtInEmote;
  late bool copyrightedAudio;
  late bool upcoming;
  late bool reactive;
  late dynamic releaseDate;
  late dynamic lastAppearance;
  late double interest;
  late dynamic icon;
  late dynamic featured;
  late dynamic bg;
  late dynamic fullBg;
  late dynamic video;
  late dynamic audio;
  late List<dynamic> gameplayTags;
  late List<dynamic> apiTags;
  late dynamic battlepass;
  late dynamic itemSet;
  late List<dynamic> shopHistory;
  late dynamic displayAssets;
  late dynamic styles;

  Item(dynamic item) {
    if (item["interest"] is int) {
      item["interest"] = item["interest"].toDouble();
    }
    id = item["id"] as String;
    type = item["type"];
    name = item["name"] as String;
    description = item["description"] as String;
    rarity = item["rarity"];
    series = item["series"];
    price = item["price"] as int;
    added = item["added"];
    builtInEmote = item["builtInEmote"];
    copyrightedAudio = item["copyrightedAudio"] as bool;
    upcoming = item["upcoming"] as bool;
    reactive = item["reactive"] as bool;
    releaseDate = item["releaseDate"];
    lastAppearance = item["lastAppearance"];
    interest = item["interest"];
    icon = item["images"]["icon"] ?? "";
    featured = item["images"]["featured"] ?? "";
    bg = item["images"]["background"] ?? "";
    fullBg = item["images"]["full_background"] ?? "";
    video = item["video"] ?? "";
    audio = item["audio"] ?? "";
    gameplayTags = item["gameplayTags"] ?? [];
    apiTags = item["apiTags"] ?? [];
    battlepass = item["battlepass"];
    itemSet = item["set"];
    if (item["shopHistory"] != null && item["shopHistory"] is List) {
      shopHistory = item["shopHistory"];
    } else {
      shopHistory = [];
    }
    displayAssets = item["displayAssets"];
    styles = item["styles"];
  }
}
