class X2DownloadableContentInfo_WOTC_WeaponItemOverhaul extends X2DownloadableContentInfo config(WOTC_APA_WeaponUpgrades);

struct DefaultAttachmentsEntry
{
	var name					TemplateName;
	var array<WeaponAttachment>	Attachments;
};

// Moved to another config file to declutter main config variables
var config(WOTC_APA_WeaponAttachments) array<DefaultAttachmentsEntry> WEAPON_DEFAULT_ATTACHMENTS;

var config array<name>				BASIC_WEAPON_UPGRADES_TO_REMOVE;
var config array<name>				ADVANCED_WEAPON_UPGRADES_TO_REMOVE;
var config array<name>				SUPERIOR_WEAPON_UPGRADES_TO_REMOVE;

var config array<name>				BASIC_WEAPON_UPGRADES_TO_ADD;
var config array<name>				ADVANCED_WEAPON_UPGRADES_TO_ADD;
var config array<name>				SUPERIOR_WEAPON_UPGRADES_TO_ADD;
var config array<name>				PROTOTYPE_WEAPON_UPGRADES_TO_ADD;

static event OnPostTemplatesCreated()
{
	UpdateWeaponCosmetics();
	ReviseLootTables();
	PatchFreeReloadAbility();
	ChainAbilityTag();
}

static function UpdateWeaponCosmetics()
{
	local X2ItemTemplateManager					ItemTemplateManager;
	local array<X2DataTemplate>					DifficultyVariants;
	local X2DataTemplate						ItemTemplate;
	local X2WeaponTemplate						WeaponTemplate;
	local X2WeaponUpgradeTemplate				WeaponUpgradeTemplate;
	local DefaultAttachmentsEntry				DefaultAttachmentEntry;
	local array<WeaponAttachment>				UpgradeAttachments, NewUpgradeAttachments;
	local WeaponAttachment						WeaponAttachment;

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	foreach default.WEAPON_DEFAULT_ATTACHMENTS(DefaultAttachmentEntry)
	{
		ItemTemplateManager.FindDataTemplateAllDifficulties(DefaultAttachmentEntry.TemplateName, DifficultyVariants);
		foreach DifficultyVariants(ItemTemplate)
		{
			WeaponTemplate = X2WeaponTemplate(ItemTemplate);
			if (WeaponTemplate != none)
			{
				WeaponTemplate.DefaultAttachments.Length = 0;
				foreach DefaultAttachmentEntry.Attachments(WeaponAttachment)
				{
					WeaponTemplate.DefaultAttachments.AddItem(WeaponAttachment);
	}	}	}	}

	// Copy over all UpgradeAttachment entries from old WeaponUpgrades:
	UpdateUpgradeTemplate(ItemTemplateManager, 'MissDamageUpgrade_Bsc', 'WOTC_APA_Basic_LightweightFrame', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockA_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	UpdateUpgradeTemplate(ItemTemplateManager, 'MissDamageUpgrade_Adv', 'WOTC_APA_Advanced_LightweightFrame', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockA_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	UpdateUpgradeTemplate(ItemTemplateManager, 'MissDamageUpgrade_Sup', 'WOTC_APA_Superior_LightweightFrame', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockA_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	UpdateUpgradeTemplate(ItemTemplateManager, 'MissDamageUpgrade_Sup', 'WOTC_APA_Prototype_LightweightFrame', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockA_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	UpdateUpgradeTemplate(ItemTemplateManager, 'MissDamageUpgrade_Bsc', 'WOTC_APA_Basic_BeddedStock', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_bedded_stock");
	UpdateUpgradeTemplate(ItemTemplateManager, 'MissDamageUpgrade_Adv', 'WOTC_APA_Advanced_BeddedStock', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_bedded_stock");
	UpdateUpgradeTemplate(ItemTemplateManager, 'MissDamageUpgrade_Sup', 'WOTC_APA_Superior_BeddedStock', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_bedded_stock");
	UpdateUpgradeTemplate(ItemTemplateManager, 'MissDamageUpgrade_Sup', 'WOTC_APA_Prototype_BeddedStock', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_bedded_stock");

	UpdateUpgradeTemplate(ItemTemplateManager, 'MissDamageUpgrade_Sup', 'WOTC_APA_Vektor_SkeletonizedStock', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockA_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");
	UpdateUpgradeTemplate(ItemTemplateManager, 'MissDamageUpgrade_Sup', 'WOTC_APA_Bullpup_Stock', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockA_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock");

	UpdateUpgradeTemplate(ItemTemplateManager, 'AimUpgrade_Bsc', 'WOTC_APA_Basic_Scope', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_scope");
	UpdateUpgradeTemplate(ItemTemplateManager, 'AimUpgrade_Adv', 'WOTC_APA_Advanced_Scope', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_scope");
	UpdateUpgradeTemplate(ItemTemplateManager, 'AimUpgrade_Sup', 'WOTC_APA_Superior_Scope', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_scope");
	UpdateUpgradeTemplate(ItemTemplateManager, 'AimUpgrade_Sup', 'WOTC_APA_Prototype_Scope', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_scope");

	UpdateUpgradeTemplate(ItemTemplateManager, 'AimUpgrade_Sup', 'WOTC_APA_Sniper_Scope', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_scope");

	UpdateUpgradeTemplate(ItemTemplateManager, 'CritUpgrade_Bsc', 'WOTC_APA_Basic_ReflexSight', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticA_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_iron_sights");
	UpdateUpgradeTemplate(ItemTemplateManager, 'CritUpgrade_Adv', 'WOTC_APA_Advanced_ReflexSight', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticA_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_iron_sights");
	UpdateUpgradeTemplate(ItemTemplateManager, 'CritUpgrade_Sup', 'WOTC_APA_Superior_ReflexSight', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticA_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_iron_sights");
	UpdateUpgradeTemplate(ItemTemplateManager, 'CritUpgrade_Sup', 'WOTC_APA_Prototype_ReflexSight', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticA_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_iron_sights");
		
	UpdateUpgradeTemplate(ItemTemplateManager, 'CritUpgrade_Sup', 'WOTC_APA_Pistol_IronSights', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticA_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_iron_sights");

	UpdateUpgradeTemplate(ItemTemplateManager, 'CritUpgrade_Bsc', 'WOTC_APA_Basic_LaserSight', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_laser_sight");
	UpdateUpgradeTemplate(ItemTemplateManager, 'CritUpgrade_Adv', 'WOTC_APA_Advanced_LaserSight', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_laser_sight");
	UpdateUpgradeTemplate(ItemTemplateManager, 'CritUpgrade_Sup', 'WOTC_APA_Superior_LaserSight', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_laser_sight");
	UpdateUpgradeTemplate(ItemTemplateManager, 'CritUpgrade_Sup', 'WOTC_APA_Prototype_LaserSight', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_laser_sight");
		
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Bsc', 'WOTC_APA_Basic_Suppressor', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Adv', 'WOTC_APA_Advanced_Suppressor', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Sup', 'WOTC_APA_Superior_Suppressor', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Sup', 'WOTC_APA_Prototype_Suppressor', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
		
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Sup', 'WOTC_APA_Cannon_HeavyBarrel', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Sup', 'WOTC_APA_Shotgun_SmoothboreBarrel', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Sup', 'WOTC_APA_Rifle_FullboreBarrel', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Bsc', 'WOTC_APA_Basic_Bipod', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamShotgun_MagA_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_bipod");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Adv', 'WOTC_APA_Advanced_Bipod', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamShotgun_MagA_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_bipod");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Sup', 'WOTC_APA_Superior_Bipod', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamShotgun_MagA_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_bipod");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Sup', 'WOTC_APA_Prototype_Bipod', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.BeamShotgun_MagA_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_bipod");
		
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Bsc', 'WOTC_APA_Basic_Foregrip', 
		"img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Conv_Foregrip_Inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_foregrip");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Adv', 'WOTC_APA_Advanced_Foregrip', 
		"img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Conv_Foregrip_Inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_foregrip");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Sup', 'WOTC_APA_Superior_Foregrip', 
		"img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Conv_Foregrip_Inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_foregrip");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeKillUpgrade_Sup', 'WOTC_APA_Prototype_Foregrip', 
		"img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Conv_Foregrip_Inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_foregrip");

	UpdateUpgradeTemplate(ItemTemplateManager, 'ReloadUpgrade_Bsc', 'WOTC_APA_Basic_Speedloader', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagD_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_speedloader");
	UpdateUpgradeTemplate(ItemTemplateManager, 'ReloadUpgrade_Adv', 'WOTC_APA_Advanced_Speedloader', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagD_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_speedloader");
	UpdateUpgradeTemplate(ItemTemplateManager, 'ReloadUpgrade_Sup', 'WOTC_APA_Superior_Speedloader', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagD_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_speedloader");
	UpdateUpgradeTemplate(ItemTemplateManager, 'ReloadUpgrade_Sup', 'WOTC_APA_Prototype_Speedloader', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagD_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_speedloader");

	UpdateUpgradeTemplate(ItemTemplateManager, 'ClipSizeUpgrade_Bsc', 'WOTC_APA_Basic_ExpandedMag', 
		"img:///UILibrary_XPACK_StrategyImages.ConvVektor_MagB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_expanded_mag");
	UpdateUpgradeTemplate(ItemTemplateManager, 'ClipSizeUpgrade_Adv', 'WOTC_APA_Advaced_ExpandedMag', 
		"img:///UILibrary_XPACK_StrategyImages.ConvVektor_MagB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_expanded_mag");
	UpdateUpgradeTemplate(ItemTemplateManager, 'ClipSizeUpgrade_Sup', 'WOTC_APA_Superior_ExpandedMag', 
		"img:///UILibrary_XPACK_StrategyImages.ConvVektor_MagB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_expanded_mag");
	UpdateUpgradeTemplate(ItemTemplateManager, 'ClipSizeUpgrade_Sup', 'WOTC_APA_Prototype_ExpandedMag', 
		"img:///UILibrary_XPACK_StrategyImages.ConvVektor_MagB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_expanded_mag");

	UpdateUpgradeTemplate(ItemTemplateManager, 'ClipSizeUpgrade_Bsc', 'WOTC_APA_Basic_WildcatCartridges', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvCannon_MagB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_wildcat_cartridges");
	UpdateUpgradeTemplate(ItemTemplateManager, 'ClipSizeUpgrade_Adv', 'WOTC_APA_Advanced_WildcatCartridges', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvCannon_MagB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_wildcat_cartridges");
	UpdateUpgradeTemplate(ItemTemplateManager, 'ClipSizeUpgrade_Sup', 'WOTC_APA_Superior_WildcatCartridges', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvCannon_MagB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_wildcat_cartridges");
	UpdateUpgradeTemplate(ItemTemplateManager, 'ClipSizeUpgrade_Sup', 'WOTC_APA_Prototype_WildcatCartridges', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.ConvCannon_MagB_inv", "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_wildcat_cartridges");

	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeFireUpgrade_Bsc', 'WOTC_APA_Basic_HairTrigger', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_TriggerB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeFireUpgrade_Adv', 'WOTC_APA_Advanced_HairTrigger', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_TriggerB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeFireUpgrade_Sup', 'WOTC_APA_Superior_HairTrigger', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_TriggerB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeFireUpgrade_Sup', 'WOTC_APA_Prototype_HairTrigger', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_TriggerB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");

	UpdateUpgradeTemplate(ItemTemplateManager, 'FreeFireUpgrade_Sup', 'WOTC_APA_Sidearm_HeavyTrigger', 
		"img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_TriggerB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_trigger");
}

static function UpdateUpgradeTemplate(X2ItemTemplateManager ItemTemplateManager, name oldUpgrade, name newUpgrade, string iconName, string iconCategory)
{
	local X2WeaponUpgradeTemplate				WeaponUpgradeTemplate;
	local array<WeaponAttachment>				UpgradeAttachments, NewUpgradeAttachments;
	local WeaponAttachment						WeaponAttachment;

	WeaponUpgradeTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(oldUpgrade));
	UpgradeAttachments = WeaponUpgradeTemplate.UpgradeAttachments;
	foreach UpgradeAttachments(WeaponAttachment)
	{	// Update Category and Inventory Icons
		WeaponAttachment.InventoryIconName = iconName;
		WeaponAttachment.InventoryCategoryIcon = iconCategory;
		NewUpgradeAttachments.AddItem(WeaponAttachment);
	}
		// Move existing UpgradeAttachment entries to the end of the array so they will apply last (i.e., "win" any conflict)
	WeaponUpgradeTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(newUpgrade));
	if (WeaponUpgradeTemplate != none)
	{
		foreach WeaponUpgradeTemplate.UpgradeAttachments(WeaponAttachment)
		{
			NewUpgradeAttachments.AddItem(WeaponAttachment);
	}	}
		// Replace UpgradeAttachment array with constructed array
	WeaponUpgradeTemplate.UpgradeAttachments = NewUpgradeAttachments;
}

static function ReviseLootTables()
{
	local name						EntryName;
	local LootTableEntry			TableEntry;
	local int						i;
	
	// Remove existing Weapon Upgrade loot entries
	foreach default.BASIC_WEAPON_UPGRADES_TO_REMOVE(EntryName)
	{
		`LOG("Removing attachment" @ EntryName @ "from loot tables",,'WIO');
		for (i = 0; i < 6; i++)
		{
			TableEntry.RollGroup = i;
			TableEntry.TemplateName = EntryName;
			class'X2LootTableManager'.static.RemoveEntryStatic('BasicWeaponUpgrades', TableEntry, false);
			class'X2LootTableManager'.static.RemoveEntryStatic('BlackMarketUpgrades_01', TableEntry, false);
	}	}

	foreach default.ADVANCED_WEAPON_UPGRADES_TO_REMOVE(EntryName)
	{
		`LOG("Removing attachment" @ EntryName @ "from loot tables",,'WIO');
		for (i = 0; i < 6; i++)
		{
			TableEntry.RollGroup = i;
			TableEntry.TemplateName = EntryName;
			class'X2LootTableManager'.static.RemoveEntryStatic('AdvancedWeaponUpgrades', TableEntry, false);
			class'X2LootTableManager'.static.RemoveEntryStatic('BlackMarketUpgrades_02', TableEntry, false);
	}	}

	foreach default.SUPERIOR_WEAPON_UPGRADES_TO_REMOVE(EntryName)
	{
		`LOG("Removing attachment" @ EntryName @ "from loot tables",,'WIO');
		for (i = 0; i < 6; i++)
		{
			TableEntry.RollGroup = i;
			TableEntry.TemplateName = EntryName;
			class'X2LootTableManager'.static.RemoveEntryStatic('SuperiorWeaponUpgrades', TableEntry, false);
			class'X2LootTableManager'.static.RemoveEntryStatic('BlackMarketUpgrades_03', TableEntry, false);
	}	}


	// Add new weapon upgrade loot entries with an even chance
	TableEntry.Chance = 1;
	TableEntry.ChanceModPerExistingItem = 0.85;
	TableEntry.MinCount = 1;
	TableEntry.MaxCount = 1;
	TableEntry.RollGroup = 1;

	foreach default.BASIC_WEAPON_UPGRADES_TO_ADD(EntryName)
	{
		`LOG("Adding attachment" @ EntryName @ "to loot tables",,'WIO');
		TableEntry.TemplateName = EntryName;
		class'X2LootTableManager'.static.AddEntryStatic('BasicWeaponUpgrades', TableEntry, false);
	}

	foreach default.ADVANCED_WEAPON_UPGRADES_TO_ADD(EntryName)
	{
		`LOG("Adding attachment" @ EntryName @ "to loot tables",,'WIO');
		TableEntry.TemplateName = EntryName;
		class'X2LootTableManager'.static.AddEntryStatic('AdvancedWeaponUpgrades', TableEntry, false);
	}

	foreach default.SUPERIOR_WEAPON_UPGRADES_TO_ADD(EntryName)
	{
		`LOG("Adding attachment" @ EntryName @ "to loot tables",,'WIO');
		TableEntry.TemplateName = EntryName;
		class'X2LootTableManager'.static.AddEntryStatic('SuperiorWeaponUpgrades', TableEntry, false);
	}

	foreach default.PROTOTYPE_WEAPON_UPGRADES_TO_ADD(EntryName)
	{
		`LOG("Adding attachment" @ EntryName @ "to loot tables",,'WIO');
		TableEntry.TemplateName = EntryName;
		class'X2LootTableManager'.static.AddEntryStatic('PrototypeWeaponUpgrades', TableEntry, false);
	}

	
	// Remove and Redistribute chances for each Tier in Enemy and Blackmarket LootTables
	TableEntry.TemplateName = '';
	for (i = 0; i < 6; i++)
	{
		TableEntry.RollGroup = i;
		TableEntry.TableRef='BasicWeaponUpgrades';
		class'X2LootTableManager'.static.RemoveEntryStatic('EarlyADVENTWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('MidADVENTWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('LateADVENTWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('EarlyAlienWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('MidAlienWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('LateAlienWeaponUpgrades', TableEntry, false);

		TableEntry.TableRef='AdvancedWeaponUpgrades';
		class'X2LootTableManager'.static.RemoveEntryStatic('EarlyADVENTWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('MidADVENTWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('LateADVENTWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('EarlyAlienWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('MidAlienWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('LateAlienWeaponUpgrades', TableEntry, false);

		TableEntry.TableRef='SuperiorWeaponUpgrades';
		class'X2LootTableManager'.static.RemoveEntryStatic('EarlyADVENTWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('MidADVENTWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('LateADVENTWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('EarlyAlienWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('MidAlienWeaponUpgrades', TableEntry, false);
		class'X2LootTableManager'.static.RemoveEntryStatic('LateAlienWeaponUpgrades', TableEntry, false);
	}

	TableEntry.ChanceModPerExistingItem = 1.0;
	TableEntry.RollGroup = 1;

	// Assign Basic Weapon Upgrades to Enemy and Blackmarket LootTables
	TableEntry.TableRef='BasicWeaponUpgrades';
	TableEntry.Chance = 80;
	class'X2LootTableManager'.static.AddEntryStatic('EarlyADVENTWeaponUpgrades', TableEntry, false);
	class'X2LootTableManager'.static.AddEntryStatic('EarlyAlienWeaponUpgrades', TableEntry, false);
	class'X2LootTableManager'.static.AddEntryStatic('MidADVENTWeaponUpgrades', TableEntry, false);
	class'X2LootTableManager'.static.AddEntryStatic('MidAlienWeaponUpgrades', TableEntry, false);
	class'X2LootTableManager'.static.AddEntryStatic('LateADVENTWeaponUpgrades', TableEntry, false);
	class'X2LootTableManager'.static.AddEntryStatic('LateAlienWeaponUpgrades', TableEntry, false);

	TableEntry.Chance = 100;
	TableEntry.RollGroup = 1;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_01', TableEntry, false);
	TableEntry.Chance = 70;
	TableEntry.RollGroup = 2;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_01', TableEntry, false);
	TableEntry.Chance = 50;
	TableEntry.RollGroup = 3;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_01', TableEntry, false);

	TableEntry.Chance = 100;
	TableEntry.RollGroup = 1;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_02', TableEntry, false);
	TableEntry.Chance = 50;
	TableEntry.RollGroup = 2;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_02', TableEntry, false);
	TableEntry.Chance = 30;
	TableEntry.RollGroup = 3;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_02', TableEntry, false);

	TableEntry.Chance = 50;
	TableEntry.RollGroup = 1;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_03', TableEntry, false);
	TableEntry.Chance = 30;
	TableEntry.RollGroup = 2;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_03', TableEntry, false);
	TableEntry.Chance = 15;
	TableEntry.RollGroup = 3;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_03', TableEntry, false);

	// Assign Advanced Weapon Upgrades to Enemy and Blackmarket LootTables
	TableEntry.TableRef='AdvancedWeaponUpgrades';
	TableEntry.RollGroup = 1;
	TableEntry.Chance = 20;
	class'X2LootTableManager'.static.AddEntryStatic('EarlyADVENTWeaponUpgrades', TableEntry, false);
	class'X2LootTableManager'.static.AddEntryStatic('EarlyAlienWeaponUpgrades', TableEntry, false);
	TableEntry.Chance = 40;
	class'X2LootTableManager'.static.AddEntryStatic('MidADVENTWeaponUpgrades', TableEntry, false);
	class'X2LootTableManager'.static.AddEntryStatic('MidAlienWeaponUpgrades', TableEntry, false);
	TableEntry.Chance = 60;
	class'X2LootTableManager'.static.AddEntryStatic('LateADVENTWeaponUpgrades', TableEntry, false);
	class'X2LootTableManager'.static.AddEntryStatic('LateAlienWeaponUpgrades', TableEntry, false);

	TableEntry.Chance = 30;
	TableEntry.RollGroup = 2;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_01', TableEntry, false);
	TableEntry.Chance = 50;
	TableEntry.RollGroup = 3;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_01', TableEntry, false);

	TableEntry.Chance = 50;
	TableEntry.RollGroup = 2;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_02', TableEntry, false);
	TableEntry.Chance = 60;
	TableEntry.RollGroup = 3;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_02', TableEntry, false);

	TableEntry.Chance = 50;
	TableEntry.RollGroup = 1;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_03', TableEntry, false);
	TableEntry.Chance = 60;
	TableEntry.RollGroup = 2;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_03', TableEntry, false);
	TableEntry.Chance = 60;
	TableEntry.RollGroup = 3;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_03', TableEntry, false);

	// Assign Superior Weapon Upgrades to Enemy and Blackmarket LootTables
	TableEntry.TableRef='SuperiorWeaponUpgrades';
	TableEntry.Chance = 10;
	TableEntry.RollGroup = 3;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_02', TableEntry, false);

	TableEntry.Chance = 10;
	TableEntry.RollGroup = 2;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_03', TableEntry, false);
	TableEntry.Chance = 25;
	TableEntry.RollGroup = 3;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_03', TableEntry, false);

	// Assign Prototype Weapon Upgrades to Enemy and Blackmarket LootTables
	TableEntry.TableRef='PrototypeWeaponUpgrades';
	TableEntry.Chance = 2;
	TableEntry.RollGroup = 3;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_02', TableEntry, false);

	TableEntry.Chance = 2;
	TableEntry.RollGroup = 2;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_03', TableEntry, false);
	TableEntry.Chance = 5;
	TableEntry.RollGroup = 3;
	class'X2LootTableManager'.static.AddEntryStatic('BlackMarketUpgrades_03', TableEntry, false);

	// Recalculate all tables
	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('BasicWeaponUpgrades');
	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('AdvancedWeaponUpgrades');
	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('SuperiorWeaponUpgrades');
	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('PrototypeWeaponUpgrades');

	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('BlackMarketUpgrades_01');
	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('BlackMarketUpgrades_02');
	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('BlackMarketUpgrades_03');

	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('EarlyADVENTWeaponUpgrades');
	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('MidADVENTWeaponUpgrades');
	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('LateADVENTWeaponUpgrades');
	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('EarlyAlienWeaponUpgrades');
	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('MidAlienWeaponUpgrades');
	class'X2LootTableManager'.static.RecalculateLootTableChanceStatic('LateAlienWeaponUpgrades');
}

static function PatchFreeReloadAbility()
{
	local X2AbilityTemplateManager				AbilityTemplateMgr;
	local array<X2AbilityTemplate>				AbilityTemplateArray;
	local X2AbilityTemplate						AbilityTemplate;

	AbilityTemplateMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	AbilityTemplateMgr.FindAbilityTemplateAllDifficulties('FreeReload', AbilityTemplateArray);
	foreach AbilityTemplateArray(AbilityTemplate)
	{
		AbilityTemplate.AbilityTargetConditions.AddItem(new class'X2Condition_WOTC_APA_AdvancedSpeedloaderNoAmmo');
	}
}

// Handle all the Localization tags
static function ChainAbilityTag()
{
	local XComEngine								Engine;
	local X2AbilityTag_WOTC_APA_WeaponItemOverhaul	NewAbilityTag;
	local X2AbilityTag								OldAbilityTag;
	local int idx;

	Engine = `XENGINE;

	OldAbilityTag = Engine.AbilityTag;
	
	NewAbilityTag = new class'X2AbilityTag_WOTC_APA_WeaponItemOverhaul';
	NewAbilityTag.WrappedTag = OldAbilityTag;

	idx = Engine.LocalizeContext.LocalizeTags.Find(Engine.AbilityTag);
	Engine.AbilityTag = NewAbilityTag;
	Engine.LocalizeContext.LocalizeTags[idx] = NewAbilityTag;
}