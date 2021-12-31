// Auto-generated file. Do not edit.

// ignore_for_file: non_constant_identifier_names

/// Rarity enum
enum Rarity {
  common,
  uncommon,
  rare,
  epic,
  legendary,
}

/// Item class object
class Item {
  /// id of item
  String id;

  ///  name of item
  String name;

  /// description of item
  String description;

  /// rarity enum of item
  Rarity rarityEnum;

  /// virtual image path of item
  String virtualImagePath;

  ///  image path of item
  String imagePath;

  ///  image url of the item
  String imageUrl;

  ///  game files path of item
  String path;

  /// amount of item
  int amount;

  /// item object
  Item(
    this.id,
    this.name,
    this.description,
    this.rarityEnum,
    this.virtualImagePath,
    this.imagePath,
    this.imageUrl,
    this.path,
    this.amount,
  );

  /// get rarity of item
  String get rarity {
    switch (rarityEnum) {
      case Rarity.common:
        return "common";
      case Rarity.uncommon:
        return "uncommon";
      case Rarity.rare:
        return "rare";
      case Rarity.epic:
        return "epic";
      case Rarity.legendary:
        return "legendary";
      default:
        return "common";
    }
  }
}

/// Mini Reward Llama item
Item voucher_basicpack = Item(
  "voucher_basicpack",
  "Mini Reward Llama",
  "Claim your free reward llama in the Loot tab.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-VoucherBasic.T-Items-VoucherBasic",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-VoucherBasic.T-Items-VoucherBasic",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_BasicPack.uasset",
  0,
);

/// Schematic XP item
Item schematicxp = Item(
  "schematicxp",
  "Schematic XP",
  "Used to level schematics. Can be found in llamas and by recycling schematics.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-SchematicXP.T-Items-SchematicXP",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-SchematicXP.T-Items-SchematicXP",
  "null",
  "FortniteGame/Content/Items/PersistentResources/SchematicXP.uasset",
  0,
);

/// Survivor XP item
Item personnelxp = Item(
  "personnelxp",
  "Survivor XP",
  "Used to level survivors. Can be found in llamas and by retiring survivors.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-CrewXP.T-CrewXP",
  "/Game/UI/Foundation/Textures/Icons/Items/T-CrewXP.T-CrewXP",
  "null",
  "FortniteGame/Content/Items/PersistentResources/PersonnelXP.uasset",
  0,
);

/// Hero XP item
Item heroxp = Item(
  "heroxp",
  "Hero XP",
  "Used to level heroes and defenders. Can be found in llamas and by retiring heroes or defenders.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-HeroXP.T-HeroXP",
  "/Game/UI/Foundation/Textures/Icons/Items/T-HeroXP.T-HeroXP",
  "null",
  "FortniteGame/Content/Items/PersistentResources/HeroXP.uasset",
  0,
);

/// 2021 Birthday Llama Token item
Item voucher_cardpack_2021anniversary = Item(
  "voucher_cardpack_2021anniversary",
  "2021 Birthday Llama Token",
  "Trade in for a 2021 Birthday Llama!",
  Rarity.legendary,
  "/Game/UI/Frontend/Store/Textures/PinataAnniversaryPack_128.PinataAnniversaryPack_128",
  "/Game/UI/Frontend/Store/Textures/PinataAnniversaryPack_128.PinataAnniversaryPack_128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_CardPack_2021Anniversary.uasset",
  0,
);

/// Daily Coins item
Item specialcurrency_daily = Item(
  "specialcurrency_daily",
  "Daily Coins",
  "Special currency used to purchase items from the Event Store. You can earn this currency by completing Daily Quests.",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-DailyCoin.T-Items-DailyCoin",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-DailyCoin.T-Items-DailyCoin",
  "null",
  "FortniteGame/Content/Items/PersistentResources/SpecialCurrency_Daily.uasset",
  0,
);

/// Pure Drop of Rain item
Item reagent_c_t01 = Item(
  "reagent_c_t01",
  "Pure Drop of Rain",
  "Resource used to evolve all types of items.",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-C-T01.T-Items-Reagent-C-T01",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-C-T01.T-Items-Reagent-C-T01",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_C_T01.uasset",
  0,
);

/// Rare PERK-UP! item
Item reagent_alteration_upgrade_r = Item(
  "reagent_alteration_upgrade_r",
  "Rare PERK-UP!",
  "Resource used to upgrade schematic perks. Found in Canny Valley.",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkUp-Rare.T-Items-WeaponPerkUp-Rare",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkUp-Rare.T-Items-WeaponPerkUp-Rare",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Alteration_Upgrade_R.uasset",
  0,
);

/// RE-PERK! item
Item reagent_alteration_generic = Item(
  "reagent_alteration_generic",
  "RE-PERK!",
  "Resource used to modify schematic perks. Found in Plankerton and above.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkUp-Generic.T-Items-WeaponPerkUp-Generic",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkUp-Generic.T-Items-WeaponPerkUp-Generic",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Alteration_Generic.uasset",
  0,
);

/// X-Ray Tickets item
Item currency_xrayllama = Item(
  "currency_xrayllama",
  "X-Ray Tickets",
  "Can be traded for llamas in the X-Ray shop.",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Currency-X-RayLlama.T-Items-Currency-X-RayLlama",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Currency-X-RayLlama.T-Items-Currency-X-RayLlama",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Currency_XRayLlama.uasset",
  0,
);

/// Campaign Event Currency item
Item campaign_event_currency = Item(
  "campaign_event_currency",
  "Campaign Event Currency",
  "Given out as part of Save the World Events",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Storm.T-Items-EventCurrency-Storm",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Storm.T-Items-EventCurrency-Storm",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Campaign_Event_Currency.uasset",
  0,
);

/// Snowflake Tickets item
Item eventcurrency_snowballs = Item(
  "eventcurrency_snowballs",
  "Snowflake Tickets",
  "Currency earned by completing missions and quests during the Winterfest season. Traded for event Loot Llamas in the Llama Shop.",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Snowballs.T-Items-EventCurrency-Snowballs",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Snowballs.T-Items-EventCurrency-Snowballs",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_Snowballs.uasset",
  0,
);

/// Gold item
Item eventcurrency_scaling = Item(
  "eventcurrency_scaling",
  "Gold",
  "Special currency earned by completing missions and opening mini llamas. Can be traded for items in the Event Store.",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Item-GoldBars.T-Item-GoldBars",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Item-GoldBars.T-Item-GoldBars",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_Scaling.uasset",
  0,
);

/// Founder's Coins item
Item eventcurrency_founders = Item(
  "eventcurrency_founders",
  "Founder's Coins",
  "Can be traded for special llamas, only available during Founder's Month! Found by completing quests and in other llamas.",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/Boost/T-Icon-FoundersBadge-128.T-Icon-FoundersBadge-128",
  "/Game/UI/Foundation/Textures/Icons/Boost/T-Icon-FoundersBadge-128.T-Icon-FoundersBadge-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_Founders.uasset",
  0,
);

/// Candy item
Item eventcurrency_candy = Item(
  "eventcurrency_candy",
  "Candy",
  "Currency earned by completing missions, dungeons, and quests during the Fortnitemares season. Traded for event Loot Llamas in the Llama Shop.",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Candy.T-Items-EventCurrency-Candy",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Candy.T-Items-EventCurrency-Candy",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_Candy.uasset",
  0,
);

/// Weapon Research Voucher item
Item voucher_item_buyback = Item(
  "voucher_item_buyback",
  "Weapon Research Voucher",
  "This token can be redeemed for Legendary or Mythic event Weapons in the Collection Book!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Currency-WeaponVoucher.T-Items-Currency-WeaponVoucher",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Currency-WeaponVoucher.T-Items-Currency-WeaponVoucher",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Item_Buyback.uasset",
  0,
);

/// Hero Recruitment Voucher item
Item voucher_herobuyback = Item(
  "voucher_herobuyback",
  "Hero Recruitment Voucher",
  "This token can be redeemed for Legendary or Mythic event Heroes in the Collection Book!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Currency-HeroRecruitmentVoucher.T-Items-Currency-HeroRecruitmentVoucher",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Currency-HeroRecruitmentVoucher.T-Items-Currency-HeroRecruitmentVoucher",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_HeroBuyback.uasset",
  0,
);

/// Epic Survivor Token item
Item voucher_generic_worker_vr = Item(
  "voucher_generic_worker_vr",
  "Epic Survivor Token",
  "Trade for a loot llama!",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/Workers/Generic/GenericWorker.GenericWorker",
  "/Game/UI/Foundation/Textures/Icons/Workers/Generic/GenericWorker.GenericWorker",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Worker_VR.uasset",
  0,
);

/// Legendary Survivor Token item
Item voucher_generic_worker_sr = Item(
  "voucher_generic_worker_sr",
  "Legendary Survivor Token",
  "Trade for a loot llama!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Workers/Generic/GenericWorker_128.GenericWorker_128",
  "/Game/UI/Foundation/Textures/Icons/Workers/Generic/GenericWorker_128.GenericWorker_128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Worker_SR.uasset",
  0,
);

/// Rare Survivor Token item
Item voucher_generic_worker_r = Item(
  "voucher_generic_worker_r",
  "Rare Survivor Token",
  "Trade for a loot llama!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Workers/Generic/GenericWorker_128.GenericWorker_128",
  "/Game/UI/Foundation/Textures/Icons/Workers/Generic/GenericWorker_128.GenericWorker_128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Worker_R.uasset",
  0,
);

/// Epic Weapon Token item
Item voucher_generic_weapon_vr = Item(
  "voucher_generic_weapon_vr",
  "Epic Weapon Token",
  "Trade for a loot llama!",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/Workers/T-Icon-Weapon-Skill-128.T-Icon-Weapon-Skill-128",
  "/Game/UI/Foundation/Textures/Icons/Workers/T-Icon-Weapon-Skill-128.T-Icon-Weapon-Skill-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Weapon_VR.uasset",
  0,
);

/// Legendary Weapon Token item
Item voucher_generic_weapon_sr = Item(
  "voucher_generic_weapon_sr",
  "Legendary Weapon Token",
  "Trade for a loot llama!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Workers/T-Icon-Weapon-Skill-128.T-Icon-Weapon-Skill-128",
  "/Game/UI/Foundation/Textures/Icons/Workers/T-Icon-Weapon-Skill-128.T-Icon-Weapon-Skill-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Weapon_SR.uasset",
  0,
);

/// Rare Weapon Token item
Item voucher_generic_weapon_r = Item(
  "voucher_generic_weapon_r",
  "Rare Weapon Token",
  "Trade for a loot llama!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Workers/T-Icon-Weapon-Skill-128.T-Icon-Weapon-Skill-128",
  "/Game/UI/Foundation/Textures/Icons/Workers/T-Icon-Weapon-Skill-128.T-Icon-Weapon-Skill-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Weapon_R.uasset",
  0,
);

/// Epic Trap Token item
Item voucher_generic_trap_vr = Item(
  "voucher_generic_trap_vr",
  "Epic Trap Token",
  "Trade for a loot llama!",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Traps-128.T-Icon-Traps-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Traps-128.T-Icon-Traps-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Trap_VR.uasset",
  0,
);

/// Legendary Trap Token item
Item voucher_generic_trap_sr = Item(
  "voucher_generic_trap_sr",
  "Legendary Trap Token",
  "Trade for a loot llama!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Traps-128.T-Icon-Traps-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Traps-128.T-Icon-Traps-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Trap_SR.uasset",
  0,
);

/// Rare Trap Token item
Item voucher_generic_trap_r = Item(
  "voucher_generic_trap_r",
  "Rare Trap Token",
  "Trade for a loot llama!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Traps-128.T-Icon-Traps-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Traps-128.T-Icon-Traps-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Trap_R.uasset",
  0,
);

/// Epic Schematic Token item
Item voucher_generic_schematic_vr = Item(
  "voucher_generic_schematic_vr",
  "Epic Schematic Token",
  "Trade for a loot llama!",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Schematic-128.T-Icon-Schematic-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Schematic-128.T-Icon-Schematic-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Schematic_VR.uasset",
  0,
);

/// Legendary Schematic Token item
Item voucher_generic_schematic_sr = Item(
  "voucher_generic_schematic_sr",
  "Legendary Schematic Token",
  "Trade for a loot llama!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Schematic-128.T-Icon-Schematic-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Schematic-128.T-Icon-Schematic-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Schematic_SR.uasset",
  0,
);

/// Rare Schematic Token item
Item voucher_generic_schematic_r = Item(
  "voucher_generic_schematic_r",
  "Rare Schematic Token",
  "Trade for a loot llama!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Schematic-128.T-Icon-Schematic-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Schematic-128.T-Icon-Schematic-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Schematic_R.uasset",
  0,
);

/// Epic Ranged Weapon Token item
Item voucher_generic_ranged_vr = Item(
  "voucher_generic_ranged_vr",
  "Epic Ranged Weapon Token",
  "Trade for a loot llama!",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Ranged-128.T-Icon-Ranged-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Ranged-128.T-Icon-Ranged-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Ranged_VR.uasset",
  0,
);

/// Legendary Ranged Weapon Token item
Item voucher_generic_ranged_sr = Item(
  "voucher_generic_ranged_sr",
  "Legendary Ranged Weapon Token",
  "Trade for a loot llama!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Ranged-128.T-Icon-Ranged-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Ranged-128.T-Icon-Ranged-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Ranged_SR.uasset",
  0,
);

/// Rare Ranged Weapon Token item
Item voucher_generic_ranged_r = Item(
  "voucher_generic_ranged_r",
  "Rare Ranged Weapon Token",
  "Trade for a loot llama!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Ranged-128.T-Icon-Ranged-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Ranged-128.T-Icon-Ranged-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Ranged_R.uasset",
  0,
);

/// Epic Melee Weapon Token item
Item voucher_generic_melee_vr = Item(
  "voucher_generic_melee_vr",
  "Epic Melee Weapon Token",
  "Trade for a loot llama!",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Melee-128.T-Icon-Melee-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Melee-128.T-Icon-Melee-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Melee_VR.uasset",
  0,
);

/// Legendary Melee Weapon Token item
Item voucher_generic_melee_sr = Item(
  "voucher_generic_melee_sr",
  "Legendary Melee Weapon Token",
  "Trade for a loot llama!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Melee-128.T-Icon-Melee-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Melee-128.T-Icon-Melee-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Melee_SR.uasset",
  0,
);

/// Rare Melee Weapon Token item
Item voucher_generic_melee_r = Item(
  "voucher_generic_melee_r",
  "Rare Melee Weapon Token",
  "Trade for a loot llama!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Melee-128.T-Icon-Melee-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Melee-128.T-Icon-Melee-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Melee_R.uasset",
  0,
);

/// Epic Lead Survivor Token item
Item voucher_generic_manager_vr = Item(
  "voucher_generic_manager_vr",
  "Epic Lead Survivor Token",
  "Trade for a loot llama!",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/ItemTypes/T-Icon-Survivor-Leader-128.T-Icon-Survivor-Leader-128",
  "/Game/UI/Foundation/Textures/Icons/ItemTypes/T-Icon-Survivor-Leader-128.T-Icon-Survivor-Leader-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Manager_VR.uasset",
  0,
);

/// Legendary Lead Survivor Token item
Item voucher_generic_manager_sr = Item(
  "voucher_generic_manager_sr",
  "Legendary Lead Survivor Token",
  "Trade for a loot llama!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/ItemTypes/T-Icon-Survivor-Leader-128.T-Icon-Survivor-Leader-128",
  "/Game/UI/Foundation/Textures/Icons/ItemTypes/T-Icon-Survivor-Leader-128.T-Icon-Survivor-Leader-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Manager_SR.uasset",
  0,
);

/// Rare Lead Survivor Token item
Item voucher_generic_manager_r = Item(
  "voucher_generic_manager_r",
  "Rare Lead Survivor Token",
  "Trade for a loot llama!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/ItemTypes/T-Icon-Survivor-Leader-128.T-Icon-Survivor-Leader-128",
  "/Game/UI/Foundation/Textures/Icons/ItemTypes/T-Icon-Survivor-Leader-128.T-Icon-Survivor-Leader-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Manager_R.uasset",
  0,
);

/// Epic Hero Token item
Item voucher_generic_hero_vr = Item(
  "voucher_generic_hero_vr",
  "Epic Hero Token",
  "Trade for a loot llama!",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Hero-128.T-Icon-Hero-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Hero-128.T-Icon-Hero-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Hero_VR.uasset",
  0,
);

/// Legendary Hero Token item
Item voucher_generic_hero_sr = Item(
  "voucher_generic_hero_sr",
  "Legendary Hero Token",
  "Trade for a loot llama!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Hero-128.T-Icon-Hero-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Hero-128.T-Icon-Hero-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Hero_SR.uasset",
  0,
);

/// Rare Hero Token item
Item voucher_generic_hero_r = Item(
  "voucher_generic_hero_r",
  "Rare Hero Token",
  "Trade for a loot llama!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Hero-128.T-Icon-Hero-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Hero-128.T-Icon-Hero-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Hero_R.uasset",
  0,
);

/// Epic Defender Token item
Item voucher_generic_defender_vr = Item(
  "voucher_generic_defender_vr",
  "Epic Defender Token",
  "Trade for a loot llama!",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Defenders-128.T-Icon-Defenders-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Defenders-128.T-Icon-Defenders-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Defender_VR.uasset",
  0,
);

/// Legendary Defender Token item
Item voucher_generic_defender_sr = Item(
  "voucher_generic_defender_sr",
  "Legendary Defender Token",
  "Trade for a loot llama!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Defenders-128.T-Icon-Defenders-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Defenders-128.T-Icon-Defenders-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Defender_SR.uasset",
  0,
);

/// Rare Defender Token item
Item voucher_generic_defender_r = Item(
  "voucher_generic_defender_r",
  "Rare Defender Token",
  "Trade for a loot llama!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Defenders-128.T-Icon-Defenders-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Defenders-128.T-Icon-Defenders-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Generic_Defender_R.uasset",
  0,
);

/// Founders Starter Weapons Token item
Item voucher_founders_starterweapons_bundle = Item(
  "voucher_founders_starterweapons_bundle",
  "Founders Starter Weapons Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Schematic-128.T-Icon-Schematic-128",
  "/Game/UI/Foundation/Textures/Icons/ItemCategories/T-Icon-Schematic-128.T-Icon-Schematic-128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_StarterWeapons_Bundle.uasset",
  0,
);

/// Founders Soldier Epic Weapon Token item
Item voucher_founders_soldier_weapon_vr = Item(
  "voucher_founders_soldier_weapon_vr",
  "Founders Soldier Epic Weapon Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-Drum-Assault-Rifle.T-Icon-Weapons-SK-Drum-Assault-Rifle",
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-Drum-Assault-Rifle.T-Icon-Weapons-SK-Drum-Assault-Rifle",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_Soldier_Weapon_VR.uasset",
  0,
);

/// Founders Soldier Legendary Weapon Token item
Item voucher_founders_soldier_weapon_sr = Item(
  "voucher_founders_soldier_weapon_sr",
  "Founders Soldier Legendary Weapon Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-Drum-Assault-Rifle.T-Icon-Weapons-SK-Drum-Assault-Rifle",
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-Drum-Assault-Rifle.T-Icon-Weapons-SK-Drum-Assault-Rifle",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_Soldier_Weapon_SR.uasset",
  0,
);

/// Founders Soldier Bundle Token item
Item voucher_founders_soldier_bundle = Item(
  "voucher_founders_soldier_bundle",
  "Founders Soldier Bundle Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/CardPacks/T-Founder-SR-SoliderPack.T-Founder-SR-SoliderPack",
  "/Game/UI/Foundation/Textures/CardPacks/T-Founder-SR-SoliderPack.T-Founder-SR-SoliderPack",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_Soldier_Bundle.uasset",
  0,
);

/// Founders Outlander Epic Weapon Token item
Item voucher_founders_outlander_weapon_vr = Item(
  "voucher_founders_outlander_weapon_vr",
  "Founders Outlander Epic Weapon Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-Machine-Pistol.T-Icon-Weapons-SK-Machine-Pistol",
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-Machine-Pistol.T-Icon-Weapons-SK-Machine-Pistol",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_Outlander_Weapon_VR.uasset",
  0,
);

/// Founders Outlander Legendary Weapon Token item
Item voucher_founders_outlander_weapon_sr = Item(
  "voucher_founders_outlander_weapon_sr",
  "Founders Outlander Legendary Weapon Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-Machine-Pistol.T-Icon-Weapons-SK-Machine-Pistol",
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-Machine-Pistol.T-Icon-Weapons-SK-Machine-Pistol",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_Outlander_Weapon_SR.uasset",
  0,
);

/// Founders Outlander Bundle Token item
Item voucher_founders_outlander_bundle = Item(
  "voucher_founders_outlander_bundle",
  "Founders Outlander Bundle Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/CardPacks/T-Founder-SR-OutlanderPack.T-Founder-SR-OutlanderPack",
  "/Game/UI/Foundation/Textures/CardPacks/T-Founder-SR-OutlanderPack.T-Founder-SR-OutlanderPack",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_Outlander_Bundle.uasset",
  0,
);

/// Founders Ninja Epic Weapon Token item
Item voucher_founders_ninja_weapon_vr = Item(
  "voucher_founders_ninja_weapon_vr",
  "Founders Ninja Epic Weapon Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-ninja-sword-katana-01.T-Icon-Weapons-SK-ninja-sword-katana-01",
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-ninja-sword-katana-01.T-Icon-Weapons-SK-ninja-sword-katana-01",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_Ninja_Weapon_VR.uasset",
  0,
);

/// Founders Ninja Legendary Weapon Token item
Item voucher_founders_ninja_weapon_sr = Item(
  "voucher_founders_ninja_weapon_sr",
  "Founders Ninja Legendary Weapon Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-ninja-sword-katana-01.T-Icon-Weapons-SK-ninja-sword-katana-01",
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-ninja-sword-katana-01.T-Icon-Weapons-SK-ninja-sword-katana-01",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_Ninja_Weapon_SR.uasset",
  0,
);

/// Founders Ninja Bundle Token item
Item voucher_founders_ninja_bundle = Item(
  "voucher_founders_ninja_bundle",
  "Founders Ninja Bundle Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/CardPacks/T-Founder-SR-NinjaPack.T-Founder-SR-NinjaPack",
  "/Game/UI/Foundation/Textures/CardPacks/T-Founder-SR-NinjaPack.T-Founder-SR-NinjaPack",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_Ninja_Bundle.uasset",
  0,
);

/// Founders Constructor Epic Weapon Token item
Item voucher_founders_constructor_weapon_vr = Item(
  "voucher_founders_constructor_weapon_vr",
  "Founders Constructor Epic Weapon Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-constructor-pump-shotgun.T-Icon-Weapons-SK-constructor-pump-shotgun",
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-constructor-pump-shotgun.T-Icon-Weapons-SK-constructor-pump-shotgun",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_Constructor_Weapon_VR.uasset",
  0,
);

/// Founders Constructor Legendary Weapon Token item
Item voucher_founders_constructor_weapon_sr = Item(
  "voucher_founders_constructor_weapon_sr",
  "Founders Constructor Legendary Weapon Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-constructor-pump-shotgun.T-Icon-Weapons-SK-constructor-pump-shotgun",
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-constructor-pump-shotgun.T-Icon-Weapons-SK-constructor-pump-shotgun",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_Constructor_Weapon_SR.uasset",
  0,
);

/// Founders Constructor Bundle Token item
Item voucher_founders_constructor_bundle = Item(
  "voucher_founders_constructor_bundle",
  "Founders Constructor Bundle Token",
  "Trade in at the Loot menu to get two Legendary Ninja Heroes and one upgradeable weapon!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/CardPacks/T-Founder-SR-ConstructorPack.T-Founder-SR-ConstructorPack",
  "/Game/UI/Foundation/Textures/CardPacks/T-Founder-SR-ConstructorPack.T-Founder-SR-ConstructorPack",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Founders_Constructor_Bundle.uasset",
  0,
);

/// Firecracker Token item
Item voucher_custom_firecracker_r = Item(
  "voucher_custom_firecracker_r",
  "Firecracker Token",
  "Trade for a loot llama!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-FireCrackerGun.T-Icon-Weapons-SK-FireCrackerGun",
  "/Game/UI/Foundation/Textures/Icons/Weapons/Items/T-Icon-Weapons-SK-FireCrackerGun.T-Icon-Weapons-SK-FireCrackerGun",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_Custom_Firecracker_R.uasset",
  0,
);

/// Legendary Troll Stash Llama Token item
Item voucher_cardpack_jackpot = Item(
  "voucher_cardpack_jackpot",
  "Legendary Troll Stash Llama Token",
  "Trade in for a Legendary Troll Stash Llama!",
  Rarity.legendary,
  "/Game/UI/Frontend/Store/PinataStandardPack-Upgrade_128.PinataStandardPack-Upgrade_128",
  "/Game/UI/Frontend/Store/PinataStandardPack-Upgrade_128.PinataStandardPack-Upgrade_128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_CardPack_Jackpot.uasset",
  0,
);

/// Upgrade Llama Token item
Item voucher_cardpack_bronze = Item(
  "voucher_cardpack_bronze",
  "Upgrade Llama Token",
  "Trade in for an Upgrade Llama!",
  Rarity.common,
  "/Game/UI/Frontend/Store/PinataStandardPack-Upgrade_128.PinataStandardPack-Upgrade_128",
  "/Game/UI/Frontend/Store/PinataStandardPack-Upgrade_128.PinataStandardPack-Upgrade_128",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Voucher_CardPack_Bronze.uasset",
  0,
);

/// Weapon Designs item
Item reagent_weapons = Item(
  "reagent_weapons",
  "Weapon Designs",
  "Designs used to evolve weapons. Found by recycling weapons or as mission rewards.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-Weapons.T-Items-Reagent-Weapons",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-Weapons.T-Items-Reagent-Weapons",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Weapons.uasset",
  0,
);

/// Trap Designs item
Item reagent_traps = Item(
  "reagent_traps",
  "Trap Designs",
  "Designs used to evolve traps. Found by recycling traps or as mission rewards.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-Traps.T-Items-Reagent-Traps",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-Traps.T-Items-Reagent-Traps",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Traps.uasset",
  0,
);

/// Weapon Supercharger item
Item reagent_promotion_weapons = Item(
  "reagent_promotion_weapons",
  "Weapon Supercharger",
  "Used to promote weapon schematics, increasing their max level. Can be earned by gaining Venture Levels.",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Weapon-PromotionCurrency.T-Items-Weapon-PromotionCurrency",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Weapon-PromotionCurrency.T-Items-Weapon-PromotionCurrency",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Promotion_Weapons.uasset",
  0,
);

/// Trap Supercharger item
Item reagent_promotion_traps = Item(
  "reagent_promotion_traps",
  "Trap Supercharger",
  "Used to promote trap schematics, increasing their max level. Can be earned by gaining Venture Levels.",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Trap-PromotionCurrency.T-Items-Trap-PromotionCurrency",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Trap-PromotionCurrency.T-Items-Trap-PromotionCurrency",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Promotion_Traps.uasset",
  0,
);

/// Survivor Supercharger item
Item reagent_promotion_survivors = Item(
  "reagent_promotion_survivors",
  "Survivor Supercharger",
  "Used to promote Survivors and Leads, increasing their max level. Can be earned by gaining Venture Levels.",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Survivor-PromotionCurrency.T-Items-Survivor-PromotionCurrency",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Survivor-PromotionCurrency.T-Items-Survivor-PromotionCurrency",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Promotion_Survivors.uasset",
  0,
);

/// Hero Supercharger item
Item reagent_promotion_heroes = Item(
  "reagent_promotion_heroes",
  "Hero Supercharger",
  "Used to promote heroes, increasing their max level. Can be earned by gaining Venture Levels.",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Hero-PromotionCurrency.T-Items-Hero-PromotionCurrency",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Hero-PromotionCurrency.T-Items-Hero-PromotionCurrency",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Promotion_Heroes.uasset",
  0,
);

/// Training Manual item
Item reagent_people = Item(
  "reagent_people",
  "Training Manual",
  "Books full of knowledge, used to evolve survivors and heroes. Can be found by retiring survivors and heroes or in mission rewards.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-People.T-Items-Reagent-People",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-People.T-Items-Reagent-People",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_People.uasset",
  0,
);

/// Epic Flux item
Item reagent_evolverarity_vr = Item(
  "reagent_evolverarity_vr",
  "Epic Flux",
  "Collect Epic Flux to upgrade a Rare Hero or Schematic to Epic rarity!",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Evolverarity-Epic.T-Items-Evolverarity-Epic",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Evolverarity-Epic.T-Items-Evolverarity-Epic",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_EvolveRarity_VR.uasset",
  0,
);

/// Legendary Flux item
Item reagent_evolverarity_sr = Item(
  "reagent_evolverarity_sr",
  "Legendary Flux",
  "Collect Legendary Flux to upgrade an Epic Hero or Schematic to Legendary rarity!",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Evolverarity-Legend.T-Items-Evolverarity-Legend",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Evolverarity-Legend.T-Items-Evolverarity-Legend",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_EvolveRarity_SR.uasset",
  0,
);

/// Rare Flux item
Item reagent_evolverarity_r = Item(
  "reagent_evolverarity_r",
  "Rare Flux",
  "Collect Rare Flux to upgrade an Uncommon Hero or Schematic to Rare rarity!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Evolverarity-Rare.T-Items-Evolverarity-Rare",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Evolverarity-Rare.T-Items-Evolverarity-Rare",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_EvolveRarity_R.uasset",
  0,
);

/// Storm Shard item
Item reagent_c_t04 = Item(
  "reagent_c_t04",
  "Storm Shard",
  "Resource used to evolve all types of items. Found primarily in Twine Peaks.",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-C-T04.T-Items-Reagent-C-T04",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-C-T04.T-Items-Reagent-C-T04",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_C_T04.uasset",
  0,
);

/// Eye of the Storm item
Item reagent_c_t03 = Item(
  "reagent_c_t03",
  "Eye of the Storm",
  "Resource used to evolve all types of items. Found primarily in Canny Valley.",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-C-T03.T-Items-Reagent-C-T03",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-C-T03.T-Items-Reagent-C-T03",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_C_T03.uasset",
  0,
);

/// Lightning in a Bottle item
Item reagent_c_t02 = Item(
  "reagent_c_t02",
  "Lightning in a Bottle",
  "Resource used to evolve all types of items. Found primarily in Plankerton.",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-C-T02.T-Items-Reagent-C-T02",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-Reagent-C-T02.T-Items-Reagent-C-T02",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_C_T02.uasset",
  0,
);

/// Epic PERK-UP! item
Item reagent_alteration_upgrade_vr = Item(
  "reagent_alteration_upgrade_vr",
  "Epic PERK-UP!",
  "Resource used to upgrade schematic perks. Found in Canny Valley and Twine Peaks.",
  Rarity.epic,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkup-Epic.T-Items-WeaponPerkup-Epic",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkup-Epic.T-Items-WeaponPerkup-Epic",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Alteration_Upgrade_VR.uasset",
  0,
);

/// Uncommon PERK-UP! item
Item reagent_alteration_upgrade_uc = Item(
  "reagent_alteration_upgrade_uc",
  "Uncommon PERK-UP!",
  "Resource used to upgrade schematic perks. Found in Plankerton and Canny Valley.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkUp-Uncommon.T-Items-WeaponPerkUp-Uncommon",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkUp-Uncommon.T-Items-WeaponPerkUp-Uncommon",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Alteration_Upgrade_UC.uasset",
  0,
);

/// Legendary PERK-UP! item
Item reagent_alteration_upgrade_sr = Item(
  "reagent_alteration_upgrade_sr",
  "Legendary PERK-UP!",
  "Resource used to upgrade schematic perks. Found in Twine Peaks.",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkup-Legendary.T-Items-WeaponPerkup-Legendary",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkup-Legendary.T-Items-WeaponPerkup-Legendary",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Alteration_Upgrade_SR.uasset",
  0,
);

/// Core RE-PERK! item
Item reagent_alteration_gameplay_generic = Item(
  "reagent_alteration_gameplay_generic",
  "Core RE-PERK!",
  "Resource used to modify weapon perks. Earned by gaining Venture Levels.",
  Rarity.legendary,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponRePerk-Resource.T-Items-WeaponRePerk-Resource",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponRePerk-Resource.T-Items-WeaponRePerk-Resource",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Alteration_Gameplay_Generic.uasset",
  0,
);

/// FROST-UP! item
Item reagent_alteration_ele_water = Item(
  "reagent_alteration_ele_water",
  "FROST-UP!",
  "Used to make items deal water damage. Found by eliminating water husks and completing Ice Storm mission alerts.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkUp-Water.T-Items-WeaponPerkUp-Water",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkUp-Water.T-Items-WeaponPerkUp-Water",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Alteration_Ele_Water.uasset",
  0,
);

/// AMP-UP! item
Item reagent_alteration_ele_nature = Item(
  "reagent_alteration_ele_nature",
  "AMP-UP!",
  "Used to make items deal nature damage. Found by eliminating nature husks and completing Lightning Storm mission alerts.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkUp-Nature.T-Items-WeaponPerkUp-Nature",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkUp-Nature.T-Items-WeaponPerkUp-Nature",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Alteration_Ele_Nature.uasset",
  0,
);

/// FIRE-UP! item
Item reagent_alteration_ele_fire = Item(
  "reagent_alteration_ele_fire",
  "FIRE-UP!",
  "Used to make items deal fire damage. Found by eliminating fire husks and completing Fire Storm mission alerts.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkUp-Fire.T-Items-WeaponPerkUp-Fire",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-WeaponPerkUp-Fire.T-Items-WeaponPerkUp-Fire",
  "null",
  "FortniteGame/Content/Items/PersistentResources/Reagent_Alteration_Ele_Fire.uasset",
  0,
);

/// Venture XP item
Item phoenixxp_reward = Item(
  "phoenixxp_reward",
  "Venture XP",
  "Advances your Venture Level. Earned by completing missions, mission alerts, or challenge quests in a Venture Zone.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/XP/Icon-SeasonalXP-L.Icon-SeasonalXP-L",
  "/Game/UI/Foundation/Textures/Icons/XP/Icon-SeasonalXP-L.Icon-SeasonalXP-L",
  "null",
  "FortniteGame/Content/Items/PersistentResources/PhoenixXP_Reward.uasset",
  0,
);

/// Venture XP item
Item phoenixxp = Item(
  "phoenixxp",
  "Venture XP",
  "Advances your Venture Level. Earned by completing missions, mission alerts, or challenge quests in a Venture Zone.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/XP/Icon-SeasonalXP-L.Icon-SeasonalXP-L",
  "/Game/UI/Foundation/Textures/Icons/XP/Icon-SeasonalXP-L.Icon-SeasonalXP-L",
  "null",
  "FortniteGame/Content/Items/PersistentResources/PhoenixXP.uasset",
  0,
);

/// People item
Item peopleresource = Item(
  "peopleresource",
  "People",
  "Survivors who have decided to join  your Homebase. Used to Transform Heroes, Survivors, and Defenders.",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Currency/T-Icon-People.T-Icon-People",
  "/Game/UI/Foundation/Textures/Icons/Currency/T-Icon-People.T-Icon-People",
  "null",
  "FortniteGame/Content/Items/PersistentResources/PeopleResource.uasset",
  0,
);

/// Summer Tickets item
Item eventcurrency_summer = Item(
  "eventcurrency_summer",
  "Summer Tickets",
  "Can be traded for special llamas, only available during this event!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Summer.T-Items-EventCurrency-Summer",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Summer.T-Items-EventCurrency-Summer",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_Summer.uasset",
  0,
);

/// Storm Tickets item
Item eventcurrency_stormzone = Item(
  "eventcurrency_stormzone",
  "Storm Tickets",
  "Can be traded for special llamas, only available during the Storm Event!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Storm.T-Items-EventCurrency-Storm",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Storm.T-Items-EventCurrency-Storm",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_StormZone.uasset",
  0,
);

/// Spring Tickets item
Item eventcurrency_spring = Item(
  "eventcurrency_spring",
  "Spring Tickets",
  "Can be traded for special llamas, only available during the Spring Event!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Spring2019.T-Items-EventCurrency-Spring2019",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Spring2019.T-Items-EventCurrency-Spring2019",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_Spring.uasset",
  0,
);

/// Scavenger Tickets item
Item eventcurrency_scavenger = Item(
  "eventcurrency_scavenger",
  "Scavenger Tickets",
  "Can be traded for special llamas, only available during the Scavenger Event!",
  Rarity.rare,
  "/Game/T-Items-EventCurrency-Scavenger.T-Items-EventCurrency-Scavenger",
  "/Game/T-Items-EventCurrency-Scavenger.T-Items-EventCurrency-Scavenger",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_Scavenger.uasset",
  0,
);

/// Road Trip Tickets item
Item eventcurrency_roadtrip = Item(
  "eventcurrency_roadtrip",
  "Road Trip Tickets",
  "Currency earned by completing missions and quests during the Blasted Badlands season. Traded for event Loot Llamas in the Llama Shop.",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Season5Horde.T-Items-EventCurrency-Season5Horde",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Season5Horde.T-Items-EventCurrency-Season5Horde",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_RoadTrip.uasset",
  0,
);

/// Material - Pumpkin Warhead item
Item eventcurrency_pumpkinwarhead = Item(
  "eventcurrency_pumpkinwarhead",
  "Material - Pumpkin Warhead",
  "Pumpkin Warheads.  These Warheads are necessary to develop the Jack-O-Launcher!",
  Rarity.common,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Icon-pumpkin.T-Icon-pumpkin",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Icon-pumpkin.T-Icon-pumpkin",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_PumpkinWarhead.uasset",
  0,
);

/// Lunar Tickets item
Item eventcurrency_lunar = Item(
  "eventcurrency_lunar",
  "Lunar Tickets",
  "Currency earned by completing missions and quests during the Mild Meadows season. Traded for event Loot Llamas in the Llama Shop.",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Spring2019.T-Items-EventCurrency-Spring2019",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Spring2019.T-Items-EventCurrency-Spring2019",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_Lunar.uasset",
  0,
);

/// Blockbuster Tickets item
Item eventcurrency_blockbuster = Item(
  "eventcurrency_blockbuster",
  "Blockbuster Tickets",
  "Can be traded for special llamas, only available during the Blockbuster Event!",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Blockbuster.T-Items-EventCurrency-Blockbuster",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Blockbuster.T-Items-EventCurrency-Blockbuster",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_Blockbuster.uasset",
  0,
);

/// Pirate Tickets item
Item eventcurrency_adventure = Item(
  "eventcurrency_adventure",
  "Pirate Tickets",
  "Currency earned by completing missions, dungeons, and quests during the Scurvy Shoals season. Traded for event Loot Llamas in the Llama Shop.",
  Rarity.rare,
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Summer.T-Items-EventCurrency-Summer",
  "/Game/UI/Foundation/Textures/Icons/Items/T-Items-EventCurrency-Summer.T-Items-EventCurrency-Summer",
  "null",
  "FortniteGame/Content/Items/PersistentResources/EventCurrency_Adventure.uasset",
  0,
);

List<Item> accountResources = [
  voucher_basicpack,
  schematicxp,
  personnelxp,
  heroxp,
  voucher_cardpack_2021anniversary,
  specialcurrency_daily,
  reagent_c_t01,
  reagent_alteration_upgrade_r,
  reagent_alteration_generic,
  currency_xrayllama,
  campaign_event_currency,
  eventcurrency_snowballs,
  eventcurrency_scaling,
  eventcurrency_founders,
  eventcurrency_candy,
  voucher_item_buyback,
  voucher_herobuyback,
  voucher_generic_worker_vr,
  voucher_generic_worker_sr,
  voucher_generic_worker_r,
  voucher_generic_weapon_vr,
  voucher_generic_weapon_sr,
  voucher_generic_weapon_r,
  voucher_generic_trap_vr,
  voucher_generic_trap_sr,
  voucher_generic_trap_r,
  voucher_generic_schematic_vr,
  voucher_generic_schematic_sr,
  voucher_generic_schematic_r,
  voucher_generic_ranged_vr,
  voucher_generic_ranged_sr,
  voucher_generic_ranged_r,
  voucher_generic_melee_vr,
  voucher_generic_melee_sr,
  voucher_generic_melee_r,
  voucher_generic_manager_vr,
  voucher_generic_manager_sr,
  voucher_generic_manager_r,
  voucher_generic_hero_vr,
  voucher_generic_hero_sr,
  voucher_generic_hero_r,
  voucher_generic_defender_vr,
  voucher_generic_defender_sr,
  voucher_generic_defender_r,
  voucher_founders_starterweapons_bundle,
  voucher_founders_soldier_weapon_vr,
  voucher_founders_soldier_weapon_sr,
  voucher_founders_soldier_bundle,
  voucher_founders_outlander_weapon_vr,
  voucher_founders_outlander_weapon_sr,
  voucher_founders_outlander_bundle,
  voucher_founders_ninja_weapon_vr,
  voucher_founders_ninja_weapon_sr,
  voucher_founders_ninja_bundle,
  voucher_founders_constructor_weapon_vr,
  voucher_founders_constructor_weapon_sr,
  voucher_founders_constructor_bundle,
  voucher_custom_firecracker_r,
  voucher_cardpack_jackpot,
  voucher_cardpack_bronze,
  reagent_weapons,
  reagent_traps,
  reagent_promotion_weapons,
  reagent_promotion_traps,
  reagent_promotion_survivors,
  reagent_promotion_heroes,
  reagent_people,
  reagent_evolverarity_vr,
  reagent_evolverarity_sr,
  reagent_evolverarity_r,
  reagent_c_t04,
  reagent_c_t03,
  reagent_c_t02,
  reagent_alteration_upgrade_vr,
  reagent_alteration_upgrade_uc,
  reagent_alteration_upgrade_sr,
  reagent_alteration_gameplay_generic,
  reagent_alteration_ele_water,
  reagent_alteration_ele_nature,
  reagent_alteration_ele_fire,
  phoenixxp_reward,
  phoenixxp,
  peopleresource,
  eventcurrency_summer,
  eventcurrency_stormzone,
  eventcurrency_spring,
  eventcurrency_scavenger,
  eventcurrency_roadtrip,
  eventcurrency_pumpkinwarhead,
  eventcurrency_lunar,
  eventcurrency_blockbuster,
  eventcurrency_adventure,
];
