import "client.dart";
import "mcp_profile.dart";

import "../structures/profile_item.dart";
import "../structures/stw_schematic.dart";
import "../structures/stw_ingredient.dart";
import "../structures/stw_world_item.dart";
import "../structures/stw_ammo.dart";

import "../../resources/fortnite_profile_ids.dart";
import "../../resources/mcp_operations.dart";

/// inventory profile manager library
class InventoryProfile extends McpProfile {
  /// [InventoryProfile] object.
  /// [profile] should be one of [FortniteProfile.theater0], [FortniteProfile.theater1], [FortniteProfile.theater2], [FortniteProfile.outpost0].
  InventoryProfile(Client client, FortniteProfile profile)
      : super(
          client,
          profile,
        );

  /// init the profile
  Future<dynamic> init() async {
    if (initialized == true) return;

    var res = await client.send(
      method: "POST",
      url: MCP(
        profileId,
        accountId: accountId,
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
      switch (item.value["templateId"].toString().split(":")[0]) {
        case "Weapon":
          items.add(
            STWWeapon(
              client,
              id: item.key,
              profileId: profileId,
              templateId: item.value["templateId"],
              attributes: item.value["attributes"],
              quantity: item.value["quantity"],
            ),
          );
          break;

        case "Trap":
          items.add(
            STWTrap(
              client,
              id: item.key,
              profileId: profileId,
              templateId: item.value["templateId"],
              attributes: item.value["attributes"],
              quantity: item.value["quantity"],
            ),
          );
          break;

        case "Ingredient":
          items.add(
            STWIngredient(
              client,
              id: item.key,
              profileId: profileId,
              templateId: item.value["templateId"],
              attributes: item.value["attributes"],
              quantity: item.value["quantity"],
            ),
          );
          break;

        case "WorldItem":
          items.add(
            STWWorldItem(
              client,
              id: item.key,
              profileId: profileId,
              templateId: item.value["templateId"],
              attributes: item.value["attributes"],
              quantity: item.value["quantity"],
            ),
          );
          break;

        case "Ammo":
          items.add(
            STWAmmo(
              client,
              id: item.key,
              profileId: profileId,
              templateId: item.value["templateId"],
              attributes: item.value["attributes"],
              quantity: item.value["quantity"],
            ),
          );
          break;

        default:
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
          break;
      }
    }

    initialized = true;
    client.log(
        LogLevel.info, "Inventory profile module initialized [$accountId]");
  }
}
