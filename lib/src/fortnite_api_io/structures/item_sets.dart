/// item sets response
class ItemSetsResponse {
  late bool result = false;
  late String lang = "en";
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
  late String id;
  late String name;

  ItemSet({
    required this.id,
    required this.name,
  });
}
