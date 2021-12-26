import "client.dart";
import "mcp_profile.dart";
import "../structures/profile_item.dart";
import "../../resources/fortnite_profile_ids.dart";
import "../../resources/mcp_operations.dart";

/// campaign profile manager library
class CampaignProfile extends McpProfile {
  /// campaign profile object
  CampaignProfile(Client client)
      : super(
          client,
          FortniteProfile.campaign,
        );

  /// init the profile
  Future<dynamic> init() async {
    if (initialized == true) return;

    var res = await client.send(
      method: "POST",
      url: MCP(
        FortniteProfile.campaign,
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
      if (item.value["templateId"].toString().startsWith("AccountResource:")) {
        items.add(
          AccountResource(
            client,
            id: item.key,
            profileId: profileId,
            templateId: item.value["templateId"],
            attributes: item.value["attributes"],
            quantity: item.value["quantity"],
          ),
        );
      } else if (item.value["templateId"].toString().startsWith("Hero:")) {
        items.add(
          STWHero(
            client,
            id: item.key,
            profileId: profileId,
            templateId: item.value["templateId"],
            attributes: item.value["attributes"],
            quantity: item.value["quantity"],
          ),
        );
      } else {
        print(item.value["templateId"]);
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
        "Campaign profile module initialized [${client.accountId}]");
  }
}
