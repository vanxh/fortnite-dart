import "client.dart";
import "mcp_profile.dart";
import "../structures/profile_item.dart";
import "../../resources/fortnite_profile_ids.dart";
import "../../resources/mcp_operations.dart";

/// common core profile manager library
class CommonCoreProfile extends McpProfile {
  /// common core profile object
  CommonCoreProfile(Client client)
      : super(
          client,
          FortniteProfile.common_core,
        );

  /// init the profile
  Future<dynamic> init() async {
    if (initialized == true) return;

    var res = await client.send(
      method: "POST",
      url: MCP(
        FortniteProfile.common_core,
        accountId: client.accountId,
      ).QueryProfile,
      body: {},
    );

    created = DateTime.parse(res["profileChanges"][0]["profile"]["created"]);
    updated = DateTime.parse(res["profileChanges"][0]["profile"]["updated"]);
    serverTime = DateTime.parse(res["serverTime"]);
    rvn = res["profileChanges"][0]["profile"]["rvn"];
    Map<String, dynamic> _items = res["profileChanges"][0]["profile"]["items"];
    stats = res["profileChanges"][0]["profile"]["stats"]["attributes"];

    for (var item in _items.entries) {
      if (item.value["templateId"].toString().startsWith("Currency:Mtx")) {
        items.add(
          MtxItem(
            client,
            id: item.key,
            profileId: profileId,
            templateId: item.value["templateId"],
            attributes: item.value["attributes"],
            quantity: item.value["quantity"],
          ),
        );
      } else {
        items.add(
          ProfileItem(
            client,
            id: item.key,
            profileId: profileId,
            templateId: item.value["templateId"],
            attributes: item.value["attributes"],
            quantity: item.value["quantity"],
          ),
        );
      }
    }

    initialized = true;
    client.log(LogLevel.info,
        "Common core profile module initialized [${client.accountId}]");
  }

  /// get vbucks breakdown of profile
  List<MtxItem> get vbucksBreakdown {
    confirmInitialized();

    return items.whereType<MtxItem>().toList();
  }

  /// get total vbucks of profile
  int get totalVbucks {
    confirmInitialized();

    return vbucksBreakdown.map((e) => e.quantity).reduce((a, b) => a + b);
  }

  /// get total vbucks purchased till now of profile in breakdown
  Map<dynamic, dynamic> get vbucksPurchased {
    confirmInitialized();

    if (stats["in_app_purchases"]?["fulfillmentCounts"] == null) {
      return {};
    }

    List _purchases =
        (stats["in_app_purchases"]["fulfillmentCounts"] as Map<String, dynamic>)
            .entries
            .where((element) => element.key.startsWith("FN_"))
            .toList();

    if (_purchases.isEmpty) {
      return {};
    }

    return _purchases
        .map((p) => {p.key.split("_")[1]: p.value})
        .reduce((value, element) => {...value, ...element});
  }

  /// get total vbucks purchased till now of profile
  int get totalVbucksPurchased {
    confirmInitialized();

    if (stats["in_app_purchases"]?["fulfillmentCounts"] == null) {
      return 0;
    }

    List<num> _purchases =
        (stats["in_app_purchases"]["fulfillmentCounts"] as Map<String, dynamic>)
            .entries
            .where((element) => element.key.startsWith("FN_"))
            .map((e) => int.parse(e.key.split("_")[1]) * e.value)
            .toList();

    if (_purchases.isEmpty) {
      return 0;
    }

    return _purchases.reduce((a, b) => a + b).toInt();
  }

  /// get epic purchase receipts for the profile
  List<String> get receipts {
    confirmInitialized();

    if (stats["in_app_purchases"]?["receipts"] == null) {
      return [];
    }

    return (stats["in_app_purchases"]["receipts"] as List<dynamic>)
        .cast<String>();
  }

  /// get currently supported creator by the profile.
  /// it is an empty string if no creator is supported by the profile.
  String get supportedCreator {
    confirmInitialized();

    if (stats["mtx_affiliate"] == null) {
      return "";
    }

    return stats["mtx_affiliate"];
  }
}
