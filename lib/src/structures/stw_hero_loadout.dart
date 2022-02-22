import "profile_item.dart";
import "stw_hero.dart";
import "../client/client.dart";
import "../../resources/fortnite_profile_ids.dart";

class STWHeroLoadout extends ProfileItem {
  late int loadoutIndex;
  late ProfileItem? teamPerk;
  late STWHero commander;
  List<STWHero> followers = [];
  late Iterable<STWGadget> gadgets;

  /// STW Hero Loadout
  STWHeroLoadout(
    Client client, {
    required String id,
    required FortniteProfile profileId,
    required String templateId,
    required Map<String, dynamic> attributes,
    required int quantity,
  }) : super(
          client,
          id: id,
          profileId: profileId,
          templateId: templateId,
          attributes: attributes,
          quantity: quantity,
        ) {
    loadoutIndex = attributes["loadout_index"];

    var _tpsearch =
        client.campaign.items.where((i) => i.id == attributes["team_perk"]);
    if (_tpsearch.isNotEmpty) {
      teamPerk = _tpsearch.first;
    }

    commander = client.campaign.heroes
        .firstWhere((h) => h.id == attributes["crew_members"]["commanderslot"]);

    Iterable _followers = (attributes["crew_members"] as Map)
        .values
        .where((id) => id != commander.id);
    for (final _f in _followers) {
      try {
        final _hero =
            client.campaign.heroes.firstWhere((h) => h.id == _f as String);
        followers.add(_hero);
      } catch (_) {
        // IGNORE
      }
    }

    gadgets = attributes["gadgets"].map<STWGadget>((gadget) =>
        STWGadget(id: gadget["gadget"] ?? "", slot: gadget["slot_index"]));
  }
}

class STWGadget {
  String id;
  int slot;

  /// STW Gadget
  STWGadget({
    required this.id,
    required this.slot,
  });
}
