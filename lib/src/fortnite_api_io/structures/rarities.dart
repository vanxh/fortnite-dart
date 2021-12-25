/// fortnite rarities response
class RaritiesResponse {
  /// result success of response
  late bool result = false;

  /// response language
  late String lang = "en";

  /// list of rarities
  List<Rarity> rarities = [];

  RaritiesResponse(dynamic res) {
    result = res["result"];
    lang = res["lang"];

    for (dynamic item in res["rarities"]) {
      rarities.add(
        Rarity(
          name: item["name"] ?? "",
          id: item["id"] ?? "",
          translationID: item["translation_id"] ?? "",
          image: item["image"] ?? "",
          colors: item["colors"] ?? {},
        ),
      );
    }

    for (dynamic item in res["series"]) {
      rarities.add(
        Rarity(
          name: item["name"] ?? "",
          id: item["id"] ?? "",
          translationID: item["translation_id"] ?? "",
          image: item["image"] ?? "",
          colors: item["colors"] ?? {},
        ),
      );
    }
  }
}

/// fortnite rarity
class Rarity {
  /// id of the rarity
  late String id;

  /// name of the rarity
  late String name;

  /// translation id of the rarity
  late dynamic translationID;

  /// colors object of the rarity
  late Map colors;

  /// image of the rarity
  late dynamic image;

  Rarity({
    required this.id,
    required this.name,
    required this.translationID,
    required this.colors,
    required this.image,
  });
}
