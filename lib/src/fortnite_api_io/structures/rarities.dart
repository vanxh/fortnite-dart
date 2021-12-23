/// fortnite rarities response
class RaritiesResponse {
  late bool result = false;
  late String lang = "en";
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
  late String id;
  late String name;
  late dynamic translationID;
  late Map colors;
  late dynamic image;

  Rarity({
    required this.id,
    required this.name,
    required this.translationID,
    required this.colors,
    required this.image,
  });
}
