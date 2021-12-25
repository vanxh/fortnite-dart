/// item sets response
class ItemSetsResponse {
  /// result success of response
  late bool result = false;

  /// language of response
  late String lang = "en";

  /// item sets
  List<ItemSet> sets = [];

  ItemSetsResponse(dynamic res) {
    result = res["result"];
    lang = res["lang"];

    for (dynamic item in res["sets"]) {
      sets.add(
        ItemSet(
          name: item["name"] ?? "",
          id: item["id"] ?? "",
        ),
      );
    }
  }
}

/// fortnite item set
class ItemSet {
  /// item set id
  late String id;

  /// item set name
  late String name;

  ItemSet({
    required this.id,
    required this.name,
  });
}
