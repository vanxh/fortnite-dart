/// fortnite items response
class ItemsResponse {
  /// result success of response
  late bool result = false;

  /// list of items
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
  /// item id
  late String id;

  /// item type
  late dynamic type;

  /// item name
  late String name;

  /// item description
  late String description;

  /// item rarity
  late dynamic rarity;

  /// item series
  late dynamic series;

  /// item price
  late int price;

  /// data on when item was added
  late dynamic added;

  /// built in emote data for the item
  late dynamic builtInEmote;

  /// does the item has a copyrighted audio
  late bool copyrightedAudio;

  /// is the item gonna be released in future
  late bool upcoming;

  /// is the item reactive
  late bool reactive;

  /// release date for item
  late dynamic releaseDate;

  /// last apperance for item
  late dynamic lastAppearance;

  /// interest for item
  late double interest;

  /// icon url for item
  late dynamic icon;

  /// featured icon url for item
  late dynamic featured;

  /// background icon for item
  late dynamic bg;

  /// full background icon for item
  late dynamic fullBg;

  /// video hash for item. https://youtube.com/watch?v=<hash>
  late dynamic video;

  /// audio data for item
  late dynamic audio;

  /// gameplay tags of item
  late List<dynamic> gameplayTags;

  /// api tags of item
  late List<dynamic> apiTags;

  /// battle pass data for item if any
  late dynamic battlepass;

  /// item set data for item
  late dynamic itemSet;

  /// shop history for item
  late List<dynamic> shopHistory;

  /// display assets render data for item
  late dynamic displayAssets;

  /// styles data for item
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
