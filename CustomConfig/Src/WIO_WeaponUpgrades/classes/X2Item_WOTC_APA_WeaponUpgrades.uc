class X2Item_WOTC_APA_WeaponUpgrades extends X2Item_DefaultUpgrades config(WOTC_APA_WeaponUpgrades);

var	config array<name>					BODY_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;
var	config array<name>					OPTIC_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;
var	config array<name>					BARREL_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;
var	config array<name>					MAGAZINE_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;
var	config array<name>					TRIGGER_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;

var config array<WeaponAttachment>		LIGHTWEIGHT_FRAME_WEAPON_ATTACHMENTS;
var config array<WeaponAttachment>		BEDDED_STOCK_WEAPON_ATTACHMENTS;

var config array<WeaponAttachment>		SCOPE_WEAPON_ATTACHMENTS;
var config array<WeaponAttachment>		REFLEX_SIGHT_WEAPON_ATTACHMENTS;
var config array<WeaponAttachment>		LASER_SIGHT_WEAPON_ATTACHMENTS;

var config array<WeaponAttachment>		BIPOD_WEAPON_ATTACHMENTS;
var config array<WeaponAttachment>		SUPPRESSOR_WEAPON_ATTACHMENTS;
var config array<WeaponAttachment>		FOREGRIP_WEAPON_ATTACHMENTS;

var config array<WeaponAttachment>		SPEEDLOADER_WEAPON_ATTACHMENTS;
var config array<WeaponAttachment>		EXPANDED_MAGAZINE_WEAPON_ATTACHMENTS;
var config array<WeaponAttachment>		WILDCAT_CARTRIDGES_WEAPON_ATTACHMENTS;

var config array<WeaponAttachment>		HAIR_TRIGGER_WEAPON_ATTACHMENTS;

var int 								RELOAD_EMPOWER_BONUS;
var int 								CLIP_SIZE_EMPOWER_BONUS;

delegate bool CanApplyUpgradeToWeaponDelegate(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, int SlotIndex);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	/**/`Log("WOTC_APA_WeaponUpgrades - Begin Adding Templates");

	// Body Upgrades:
	Templates.AddItem(CreateUpgrade_WOTC_APA_Basic_LightweightFrame());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Advanced_LightweightFrame());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Superior_LightweightFrame());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Prototype_LightweightFrame());
	
	Templates.AddItem(CreateUpgrade_WOTC_APA_Basic_BeddedStock());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Advanced_BeddedStock());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Superior_BeddedStock());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Prototype_BeddedStock());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Vektor_SkeletonizedStock());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Bullpup_Stock());

	// Optic Upgrades:
	Templates.AddItem(CreateUpgrade_WOTC_APA_Basic_Scope());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Advanced_Scope());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Superior_Scope());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Prototype_Scope());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Sniper_Scope());
	
	Templates.AddItem(CreateUpgrade_WOTC_APA_Basic_ReflexSight());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Advanced_ReflexSight());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Superior_ReflexSight());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Prototype_ReflexSight());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Pistol_IronSights());
	
	Templates.AddItem(CreateUpgrade_WOTC_APA_Basic_LaserSight());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Advanced_LaserSight());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Superior_LaserSight());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Prototype_LaserSight());

	// Barrel Upgrades:
	Templates.AddItem(CreateUpgrade_WOTC_APA_Basic_Suppressor());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Advanced_Suppressor());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Superior_Suppressor());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Prototype_Suppressor());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Cannon_HeavyBarrel());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Shotgun_SmoothboreBarrel());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Rifle_FullboreBarrel());
	
	Templates.AddItem(CreateUpgrade_WOTC_APA_Basic_Bipod());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Advanced_Bipod());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Superior_Bipod());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Prototype_Bipod());
	
	Templates.AddItem(CreateUpgrade_WOTC_APA_Basic_Foregrip());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Advanced_Foregrip());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Superior_Foregrip());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Prototype_Foregrip());	

	// Magazine Upgrades:
	Templates.AddItem(CreateUpgrade_WOTC_APA_Basic_ExpandedMag());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Advanced_ExpandedMag());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Superior_ExpandedMag());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Prototype_ExpandedMag());
	
	Templates.AddItem(CreateUpgrade_WOTC_APA_Basic_Speedloader());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Advanced_Speedloader());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Superior_Speedloader());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Prototype_Speedloader());
	
	Templates.AddItem(CreateUpgrade_WOTC_APA_Basic_WildcatCartridges());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Advanced_WildcatCartridges());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Superior_WildcatCartridges());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Prototype_WildcatCartridges());

	// Trigger Upgrades:
	Templates.AddItem(CreateUpgrade_WOTC_APA_Basic_HairTrigger());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Advanced_HairTrigger());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Superior_HairTrigger());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Prototype_HairTrigger());
	Templates.AddItem(CreateUpgrade_WOTC_APA_Sidearm_HeavyTrigger());

	/**/`Log("WOTC_APA_WeaponUpgrades - Finished Adding Templates");

	return Templates;
}

// Generic Setup Functions:

// T1 - Basic Bonus
static function SetUpT1WeaponUpgrade(out X2WeaponUpgradeTemplate Template)
{	
	Template.CanBeBuilt = false;
	Template.MaxQuantity = 1;
	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.WeapFragmentA';
	Template.TradingPostValue = 10;
	Template.Tier = 0;

	Template.BlackMarketTexts = default.UpgradeBlackMarketTexts;
}

// T2 - Advanced Bonus with an associated penalty
static function SetUpT2WeaponUpgrade(out X2WeaponUpgradeTemplate Template)
{
	Template.CanBeBuilt = false;
	Template.MaxQuantity = 1;
	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.WeapFragmentB';
	Template.TradingPostValue = 25;
	Template.Tier = 1;

	Template.BlackMarketTexts = default.UpgradeBlackMarketTexts;
}

// T3 - Advanced Bonus without the associated penalty
static function SetUpT3WeaponUpgrade(out X2WeaponUpgradeTemplate Template)
{
	Template.CanBeBuilt = false;
	Template.MaxQuantity = 1;
	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.WeapFragmentB';
	Template.TradingPostValue = 50;
	Template.Tier = 2;

	Template.BlackMarketTexts = default.UpgradeBlackMarketTexts;
}

// T4 - Prototype Bonus without the associated penalty
static function SetUpT4WeaponUpgrade(out X2WeaponUpgradeTemplate Template)
{
	Template.CanBeBuilt = false;
	Template.MaxQuantity = 1;
	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.WeapFragmentB';
	Template.TradingPostValue = 75;
	Template.Tier = 3;

	Template.BlackMarketTexts = default.UpgradeBlackMarketTexts;
}

// Create Body Upgrades:
// ---------------------


// Lightweight Frame:
// -----------------------------------------------------------------------------------------------

// Basic Lightweight Frame: +1 Mobility
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Basic_LightweightFrame()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Basic_LightweightFrame');

	SetUpT1WeaponUpgrade(Template);
	SetUpLightweightFrameUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_LightweightFrame_BasicBonus');

	return Template;
}

// Advanced Lightweight Frame: +2 Mobility, -25 Aim after moving
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Advanced_LightweightFrame()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Advanced_LightweightFrame');

	SetUpT2WeaponUpgrade(Template);
	SetUpLightweightFrameUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_LightweightFrame_AdvancedBonus');
	Template.BonusAbilities.AddItem('WOTC_APA_LightweightFrame_AdvancedPenalty');

	return Template;
}

// Superior Lightweight Frame: +2 Mobility, no penalty
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Superior_LightweightFrame()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Superior_LightweightFrame');

	SetUpT3WeaponUpgrade(Template);
	SetUpLightweightFrameUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_LightweightFrame_AdvancedBonus');

	return Template;
}

// Prototype Lightweight Frame: +4 Mobility, no penalty
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Prototype_LightweightFrame()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Prototype_LightweightFrame');

	SetUpT4WeaponUpgrade(Template);
	SetUpLightweightFrameUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_LightweightFrame_PrototypeBonus');
	Template.BonusAbilities.AddItem('WOTC_APA_Reposition');

	return Template;
}

// Lightweight Frame: Setup Upgrade Cosmetics
static function SetUpLightweightFrameUpgrade(out X2WeaponUpgradeTemplate Template)
{
	local WeaponAttachment		WeaponAttachment;

	Template.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
	Template.MutuallyExclusiveUpgrades = default.BODY_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockA_inv";

	foreach default.LIGHTWEIGHT_FRAME_WEAPON_ATTACHMENTS(WeaponAttachment)
	{
		if (WeaponAttachment.InventoryCategoryIcon == "")
		{
			WeaponAttachment.InventoryCategoryIcon = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_stock";
		}

		if (WeaponAttachment.InventoryIconName == "")
		{
			WeaponAttachment.InventoryIconName = "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockA_inv";
		}

		Template.UpgradeAttachments.AddItem(WeaponAttachment);
	}
}


// Bedded Stock:
// -----------------------------------------------------------------------------------------------

// Basic Bedded Stock: +10 Aim on additional shots against the last target
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Basic_BeddedStock()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Basic_BeddedStock');

	SetUpT1WeaponUpgrade(Template);
	SetUpBeddedStockUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_BeddedStock_BasicBonus');

	return Template;
}

// Advanced Bedded Stock: +10 Aim and Crit on additional shots against the last target, -10 Aim on reaction shots against a different enemy
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Advanced_BeddedStock()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Advanced_BeddedStock');

	SetUpT2WeaponUpgrade(Template);
	SetUpBeddedStockUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_BeddedStock_AdvancedBonus');

	return Template;
}

// Superior Bedded Stock: +10 Aim and Crit on additional shots against the last target, no penalty
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Superior_BeddedStock()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Superior_BeddedStock');

	SetUpT3WeaponUpgrade(Template);
	SetUpBeddedStockUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_BeddedStock_SuperiorBonus');

	return Template;
}

// Prototype Bedded Stock: +15 Aim and Crit on additional shots against the last target, no penalty
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Prototype_BeddedStock()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Prototype_BeddedStock');

	SetUpT4WeaponUpgrade(Template);
	SetUpBeddedStockUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_BeddedStock_PrototypeBonus');
	Template.BonusAbilities.AddItem('CoveringFire');

	return Template;
}

// Skeletonized Stock: +1 Mobility, 15% bonus to Detection Radius
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Vektor_SkeletonizedStock()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Vektor_SkeletonizedStock');

	SetUpT4WeaponUpgrade(Template);
	SetUpBeddedStockUpgrade(Template);

	Template.CanApplyUpgradeToWeaponFn = CanApplyVektorUpgradeToWeapon;
	Template.BonusAbilities.AddItem('WOTC_APA_SkeletonizedStock');

	return Template;
}

static function bool CanApplyVektorUpgradeToWeapon(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, int SlotIndex)
{
	local X2WeaponTemplate					WeaponTemplate;
	local name								TemplateName;

	// Must not be a weapon with a built-in Body upgrade
	WeaponTemplate = X2WeaponTemplate(Weapon.GetMyTemplate());

	if (WeaponTemplate.WeaponCat != 'vektor_rifle')
		return false;

	return CanApplyUpgradeToWeaponPatched(UpgradeTemplate, Weapon, SlotIndex);
}

// Bullpup Stock: +2 Mobility, Small boost to Reaction Fire accuracy (+5)
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Bullpup_Stock()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Bullpup_Stock');

	SetUpT4WeaponUpgrade(Template);
	SetUpBeddedStockUpgrade(Template);

	Template.CanApplyUpgradeToWeaponFn = CanApplyBullpupUpgradeToWeapon;
	Template.BonusAbilities.AddItem('WOTC_APA_BullpupStock');

	return Template;
}

static function bool CanApplyBullpupUpgradeToWeapon(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, int SlotIndex)
{
	local X2WeaponTemplate					WeaponTemplate;
	local name								TemplateName;

	// Must not be a weapon with a built-in Body upgrade
	WeaponTemplate = X2WeaponTemplate(Weapon.GetMyTemplate());

	if (WeaponTemplate.WeaponCat != 'bullpup')
		return false;

	return CanApplyUpgradeToWeaponPatched(UpgradeTemplate, Weapon, SlotIndex);
}

// Bedded Stock: Setup Upgrade Cosmetics
static function SetUpBeddedStockUpgrade(out X2WeaponUpgradeTemplate Template)
{
	local WeaponAttachment		WeaponAttachment;

	Template.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
	Template.MutuallyExclusiveUpgrades = default.BODY_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockB_inv";

	foreach default.BEDDED_STOCK_WEAPON_ATTACHMENTS(WeaponAttachment)
	{
		if (WeaponAttachment.InventoryCategoryIcon == "")
		{
			WeaponAttachment.InventoryCategoryIcon = "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_bedded_stock";
		}

		if (WeaponAttachment.InventoryIconName == "")
		{
			WeaponAttachment.InventoryIconName = "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_StockB_inv";
		}

		Template.UpgradeAttachments.AddItem(WeaponAttachment);
	}
}

// Create Optic Upgrades:
// ---------------------

// Scope:
// -----------------------------------------------------------------------------------------------

// Basic Scope: +5 Aim on Direct Shots. Small boost to Long Range accuracy.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Basic_Scope()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Basic_Scope');

	SetUpT1WeaponUpgrade(Template);
	SetUpScopeUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Scope_BasicBonus');

	return Template;
}

// Advanced Scope: +10 Aim on Direct Shots. Small boost to Long Range accuracy, Medium penalty to Close Range accuracy.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Advanced_Scope()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Advanced_Scope');

	SetUpT2WeaponUpgrade(Template);
	SetUpScopeUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Scope_AdvancedBonus');
	Template.BonusAbilities.AddItem('WOTC_APA_Scope_AdvancedPenalty');

	return Template;
}

// Superior Scope: +10 Aim on Direct Shots. Small boost to Long Range accuracy, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Superior_Scope()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Superior_Scope');

	SetUpT3WeaponUpgrade(Template);
	SetUpScopeUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Scope_AdvancedBonus');

	return Template;
}

// Prototype Scope: +15 Aim on Direct Shots. Small boost to Long Range accuracy, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Prototype_Scope()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Prototype_Scope');

	SetUpT4WeaponUpgrade(Template);
	SetUpScopeUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Scope_PrototypeBonus');
	Template.BonusAbilities.AddItem('WOTC_APA_Emplaced');

	return Template;
}

// Sniper Scope: Small boost to Direct Fire accuracy and Critical Hit chance (+10 Aim/Crit)
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Sniper_Scope()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Sniper_Scope');

	SetUpT4WeaponUpgrade(Template);
	SetUpScopeUpgrade(Template);

	Template.CanApplyUpgradeToWeaponFn = CanApplySniperUpgradeToWeapon;
	Template.BonusAbilities.AddItem('WOTC_APA_SniperScope');

	return Template;
}

static function bool CanApplySniperUpgradeToWeapon(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, int SlotIndex)
{
	local X2WeaponTemplate					WeaponTemplate;
	local name								TemplateName;

	// Must not be a weapon with a built-in Body upgrade
	WeaponTemplate = X2WeaponTemplate(Weapon.GetMyTemplate());

	if (WeaponTemplate.WeaponCat != 'sniper_rifle')
		return false;

	return CanApplyUpgradeToWeaponPatched(UpgradeTemplate, Weapon, SlotIndex);
}

static function SetUpScopeUpgrade(out X2WeaponUpgradeTemplate Template)
{
	local WeaponAttachment		WeaponAttachment;

	Template.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
	Template.MutuallyExclusiveUpgrades = default.OPTIC_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticB_inv";

	foreach default.SCOPE_WEAPON_ATTACHMENTS(WeaponAttachment)
	{
		if (WeaponAttachment.InventoryCategoryIcon == "")
		{
			WeaponAttachment.InventoryCategoryIcon = "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_scope";
		}

		if (WeaponAttachment.InventoryIconName == "")
		{
			WeaponAttachment.InventoryIconName = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticB_inv";
		}

		Template.UpgradeAttachments.AddItem(WeaponAttachment);
	}
}

// Reflex Sight:
// -----------------------------------------------------------------------------------------------

// Basic Reflex Sight: +5 Aim on Reaction Shots. Small boost to Short Range accuracy.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Basic_ReflexSight()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Basic_ReflexSight');

	SetUpT1WeaponUpgrade(Template);
	SetUpReflexSightUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_ReflexSight_BasicBonus');

	return Template;
}

// Advanced Reflex Sight: +10 Aim on Reaction Shots. Small boost to Short Range accuracy, Medium penalty to Long Range accuracy.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Advanced_ReflexSight()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Advanced_ReflexSight');

	SetUpT2WeaponUpgrade(Template);
	SetUpReflexSightUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_ReflexSight_AdvancedBonus');
	Template.BonusAbilities.AddItem('WOTC_APA_ReflexSight_AdvancedPenalty');

	return Template;
}

// Superior Reflex Sight: +10 Aim on Reaction Shots. Small boost to Short Range accuracy, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Superior_ReflexSight()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Superior_ReflexSight');

	SetUpT3WeaponUpgrade(Template);
	SetUpReflexSightUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_ReflexSight_AdvancedBonus');

	return Template;
}

// Prototype Reflex Sight: +15 Aim on Reaction Shots. Small boost to Short Range accuracy, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Prototype_ReflexSight()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Prototype_ReflexSight');

	SetUpT4WeaponUpgrade(Template);
	SetUpReflexSightUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_ReflexSight_PrototypeBonus');
	Template.BonusAbilities.AddItem('WOTC_APA_Sentinel');

	return Template;
}

// Pistol Iron Sightd: damage bonus, no crits
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Pistol_IronSights()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Pistol_IronSights');

	SetUpT4WeaponUpgrade(Template);
	SetUpReflexSightUpgrade(Template);

	Template.CanApplyUpgradeToWeaponFn = CanApplyPistolUpgradeToWeapon;
	Template.BonusAbilities.AddItem('WOTC_APA_IronSights');

	return Template;
}

static function bool CanApplyPistolUpgradeToWeapon(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, int SlotIndex)
{
	local X2WeaponTemplate					WeaponTemplate;
	local name								TemplateName;

	// Must not be a weapon with a built-in Body upgrade
	WeaponTemplate = X2WeaponTemplate(Weapon.GetMyTemplate());

	if (WeaponTemplate.WeaponCat != 'pistol')
		return false;

	return CanApplyUpgradeToWeaponPatched(UpgradeTemplate, Weapon, SlotIndex);
}

static function SetUpReflexSightUpgrade(out X2WeaponUpgradeTemplate Template)
{
	local WeaponAttachment		WeaponAttachment;

	Template.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
	Template.MutuallyExclusiveUpgrades = default.OPTIC_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticA_inv";

	foreach default.REFLEX_SIGHT_WEAPON_ATTACHMENTS(WeaponAttachment)
	{
		if (WeaponAttachment.InventoryCategoryIcon == "")
		{
			WeaponAttachment.InventoryCategoryIcon = "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_iron_sights";
		}

		if (WeaponAttachment.InventoryIconName == "")
		{
			WeaponAttachment.InventoryIconName = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticA_inv";
		}

		Template.UpgradeAttachments.AddItem(WeaponAttachment);
	}
}

// Laser Sight:
// -----------------------------------------------------------------------------------------------

// Basic Laser Sight: +5 Crit on attacks within 8 tiles. Small boost to Short Range accuracy.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Basic_LaserSight()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Basic_LaserSight');

	SetUpT1WeaponUpgrade(Template);
	SetUpLaserSightUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_LaserSight_BasicBonus');	

	return Template;
}

// Advanced Laser Sight: +10 Crit on attacks within 8 tiles. Small boost to Short Range accuracy, Medium penalty to Long Range accuracy.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Advanced_LaserSight()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Advanced_LaserSight');

	SetUpT2WeaponUpgrade(Template);
	SetUpLaserSightUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_LaserSight_AdvancedBonus');
	Template.BonusAbilities.AddItem('WOTC_APA_LaserSight_AdvancedPenalty');

	return Template;
}

// Superior Laser Sight: +10 Crit on attacks within 8 tiles. Small boost to Short Range accuracy, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Superior_LaserSight()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Superior_LaserSight');

	SetUpT3WeaponUpgrade(Template);
	SetUpLaserSightUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_LaserSight_AdvancedBonus');

	return Template;
}

// Prototype Laser Sight: +15 Crit on attacks within 10 tiles. Small boost to Short Range accuracy, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Prototype_LaserSight()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Prototype_LaserSight');

	SetUpT4WeaponUpgrade(Template);
	SetUpLaserSightUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_LaserSight_PrototypeBonus');
	Template.BonusAbilities.AddItem('HoloTargeting');

	return Template;
}

static function SetUpLaserSightUpgrade(out X2WeaponUpgradeTemplate Template)
{
	local WeaponAttachment		WeaponAttachment;

	Template.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
	Template.MutuallyExclusiveUpgrades = default.OPTIC_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticB_inv";

	foreach default.LASER_SIGHT_WEAPON_ATTACHMENTS(WeaponAttachment)
	{
		if (WeaponAttachment.InventoryCategoryIcon == "")
		{
			WeaponAttachment.InventoryCategoryIcon = "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_laser_sight";
		}

		if (WeaponAttachment.InventoryIconName == "")
		{
			WeaponAttachment.InventoryIconName = "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_OpticB_inv";
		}

		Template.UpgradeAttachments.AddItem(WeaponAttachment);
	}
}

// Create Barrel Upgrades:

// Bipod:
// -----------------------------------------------------------------------------------------------

// Basic Bipod: +3 Tiles weapon range and 25% lower Aim penalties from Long Range or Squadsight if the unit did not move last turn.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Basic_Bipod()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Basic_Bipod');

	SetUpT1WeaponUpgrade(Template);
	SetUpBipodUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Bipod_BasicBonus');

	return Template;
}

// Advanced Bipod: +3 Tiles weapon range and 50% lower Aim penalties from Long Range or Squadsight if the unit did not move last turn, -1 Mobility.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Advanced_Bipod()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Advanced_Bipod');

	SetUpT2WeaponUpgrade(Template);
	SetUpBipodUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Bipod_AdvancedBonus');
	Template.BonusAbilities.AddItem('WOTC_APA_Bipod_AdvancedPenalty');

	return Template;
}

// Superior Bipod: +3 Tiles weapon range and 50% lower Aim penalties from Long Range or Squadsight if the unit did not move last turn, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Superior_Bipod()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Superior_Bipod');

	SetUpT3WeaponUpgrade(Template);
	SetUpBipodUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Bipod_AdvancedBonus');

	return Template;
}

// Prototype Bipod: +4 Tiles weapon range and 70% lower Aim penalties from Long Range or Squadsight if the unit did not move last turn, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Prototype_Bipod()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Prototype_Bipod');

	SetUpT4WeaponUpgrade(Template);
	SetUpBipodUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Bipod_PrototypeBonus');
	Template.BonusAbilities.AddItem('Squadsight');

	return Template;
}

static function SetUpBipodUpgrade(out X2WeaponUpgradeTemplate Template)
{
	local WeaponAttachment		WeaponAttachment;

	Template.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
	Template.MutuallyExclusiveUpgrades = default.BARREL_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamShotgun_MagA_inv";

	foreach default.BIPOD_WEAPON_ATTACHMENTS(WeaponAttachment)
	{
		if (WeaponAttachment.InventoryCategoryIcon == "")
		{
			WeaponAttachment.InventoryCategoryIcon = "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_bipod";
		}

		if (WeaponAttachment.InventoryIconName == "")
		{
			WeaponAttachment.InventoryIconName = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamShotgun_MagA_inv";
		}

		Template.UpgradeAttachments.AddItem(WeaponAttachment);
	}
}

// Suppressor:
// -----------------------------------------------------------------------------------------------

// Basic Suppressor: 
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Basic_Suppressor()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Basic_Suppressor');

	SetUpT1WeaponUpgrade(Template);
	SetUpSuppressorUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Suppressor_BasicBonus');

	return Template;
}

// Advanced Suppressor: 
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Advanced_Suppressor()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Advanced_Suppressor');

	SetUpT2WeaponUpgrade(Template);
	SetUpSuppressorUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Suppressor_AdvancedBonus');
	Template.BonusAbilities.AddItem('WOTC_APA_Suppressor_AdvancedPenalty');

	return Template;
}

// Superior Suppressor: 
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Superior_Suppressor()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Superior_Suppressor');

	SetUpT3WeaponUpgrade(Template);
	SetUpSuppressorUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Suppressor_AdvancedBonus');

	return Template;
}

// Prototype Suppressor: 
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Prototype_Suppressor()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Prototype_Suppressor');

	SetUpT4WeaponUpgrade(Template);
	SetUpSuppressorUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Suppressor_PrototypeBonus');
	Template.BonusAbilities.AddItem('SilentKillPassive');

	return Template;
}

static function SetUpSuppressorUpgrade(out X2WeaponUpgradeTemplate Template)
{
	local WeaponAttachment		WeaponAttachment;

	Template.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
	Template.MutuallyExclusiveUpgrades = default.BARREL_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_SuppressorB_inv";

	foreach default.SUPPRESSOR_WEAPON_ATTACHMENTS(WeaponAttachment)
	{
		if (WeaponAttachment.InventoryCategoryIcon == "")
		{
			WeaponAttachment.InventoryCategoryIcon = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel";
		}

		if (WeaponAttachment.InventoryIconName == "")
		{
			WeaponAttachment.InventoryIconName = "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_SuppressorB_inv";
		}
		
		Template.UpgradeAttachments.AddItem(WeaponAttachment);
	}
}

// Foregrip:
// -----------------------------------------------------------------------------------------------

// Basic Foregrip: +5 Aim bonus on Reaction shots withing 8 Tiles.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Basic_Foregrip()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Basic_Foregrip');

	SetUpT1WeaponUpgrade(Template);
	SetUpForegripUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Foregrip_BasicBonus');

	return Template;
}

// Advanced Foregrip: +3 Tiles weapon range and 50% lower Aim penalties from Long Range or Squadsight if the unit did not move last turn, -1 Mobility.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Advanced_Foregrip()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Advanced_Foregrip');

	SetUpT2WeaponUpgrade(Template);
	SetUpForegripUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Foregrip_AdvancedBonus');
	Template.BonusAbilities.AddItem('WOTC_APA_Foregrip_AdvancedPenalty');

	return Template;
}

// Superior Foregrip: +3 Tiles weapon range and 50% lower Aim penalties from Long Range or Squadsight if the unit did not move last turn, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Superior_Foregrip()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Superior_Foregrip');

	SetUpT3WeaponUpgrade(Template);
	SetUpForegripUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Foregrip_AdvancedBonus');

	return Template;
}

// Prototype Foregrip: +4 Tiles weapon range and 70% lower Aim penalties from Long Range or Squadsight if the unit did not move last turn, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Prototype_Foregrip()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Prototype_Foregrip');

	SetUpT4WeaponUpgrade(Template);
	SetUpForegripUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Foregrip_PrototypeBonus');

	return Template;
}

static function SetUpForegripUpgrade(out X2WeaponUpgradeTemplate Template)
{
	local WeaponAttachment		WeaponAttachment;

	Template.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
	Template.MutuallyExclusiveUpgrades = default.BARREL_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;

	Template.strImage = "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Conv_Foregrip_Inv";

	foreach default.FOREGRIP_WEAPON_ATTACHMENTS(WeaponAttachment)
	{
		if (WeaponAttachment.InventoryCategoryIcon == "")
		{
			WeaponAttachment.InventoryCategoryIcon = "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_foregrip";
		}

		if (WeaponAttachment.InventoryIconName == "")
		{
			WeaponAttachment.InventoryIconName = "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Conv_Foregrip_Inv";
		}

		Template.UpgradeAttachments.AddItem(WeaponAttachment);
	}
}

// Cannon Heavy Barrel: -2 Mobility, +1 Armor Shred, Small boost to Long Range accuracy (Can't combine with a Bipod, but has long range bonuses built in)
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Cannon_HeavyBarrel()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Cannon_HeavyBarrel');

	SetUpT4WeaponUpgrade(Template);
	SetUpSuppressorUpgrade(Template);

	Template.CanApplyUpgradeToWeaponFn = CanApplyCannonUpgradeToWeapon;
	Template.BonusAbilities.AddItem('WOTC_APA_HeavyCannonBarrel');

	return Template;
}

static function bool CanApplyCannonUpgradeToWeapon(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, int SlotIndex)
{
	local X2WeaponTemplate					WeaponTemplate;

	// Must not be a weapon with a built-in Body upgrade
	WeaponTemplate = X2WeaponTemplate(Weapon.GetMyTemplate());

	if (WeaponTemplate.WeaponCat != 'cannon')
		return false;

	return CanApplyUpgradeToWeaponPatched(UpgradeTemplate, Weapon, SlotIndex);
}

// Shotgun Smoothbore Barrel: Missed shots still deal 1 Damage, but each point of Armor decreases chance to Crit and increases chance to Graze by 25%
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Shotgun_SmoothboreBarrel()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Shotgun_SmoothboreBarrel');

	SetUpT4WeaponUpgrade(Template);
	SetUpSuppressorUpgrade(Template);

	Template.CanApplyUpgradeToWeaponFn = CanApplyShotgunUpgradeToWeapon;
	Template.BonusAbilities.AddItem('WOTC_APA_SmoothboreBarrel');

	return Template;
}

static function bool CanApplyShotgunUpgradeToWeapon(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, int SlotIndex)
{
	local X2WeaponTemplate					WeaponTemplate;

	// Must not be a weapon with a built-in Body upgrade
	WeaponTemplate = X2WeaponTemplate(Weapon.GetMyTemplate());

	if (WeaponTemplate.WeaponCat != 'shotgun')
		return false;

	return CanApplyUpgradeToWeaponPatched(UpgradeTemplate, Weapon, SlotIndex);
}

// Rifle Fullbore Barrel:
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Rifle_FullboreBarrel()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Rifle_FullboreBarrel');

	SetUpT4WeaponUpgrade(Template);
	SetUpSuppressorUpgrade(Template);

	Template.CanApplyUpgradeToWeaponFn = CanApplyRifleUpgradeToWeapon;
	Template.BonusAbilities.AddItem('WOTC_APA_FullboreBarrel');

	return Template;
}

static function bool CanApplyRifleUpgradeToWeapon(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, int SlotIndex)
{
	local X2WeaponTemplate					WeaponTemplate;

	// Must not be a weapon with a built-in Body upgrade
	WeaponTemplate = X2WeaponTemplate(Weapon.GetMyTemplate());

	if (WeaponTemplate.WeaponCat != 'rifle')
		return false;

	return CanApplyUpgradeToWeaponPatched(UpgradeTemplate, Weapon, SlotIndex);
}

// Create Magazine Upgrades:

// Speedloader:
// -----------------------------------------------------------------------------------------------

// Basic Speedloader: 1 Free Reload.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Basic_Speedloader()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Basic_Speedloader');

	SetUpT1WeaponUpgrade(Template);
	SetUpSpeedloaderUpgrade(Template);
	
	Template.NumFreeReloads = class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SPEEDLOADER_BASIC_FREE_RELOADS;

	return Template;
}

// Advanced Speedloader: 2 Free Reloads, ???.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Advanced_Speedloader()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Advanced_Speedloader');

	SetUpT2WeaponUpgrade(Template);
	SetUpSpeedloaderUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_Speedloader_AdvancedPenalty');
	Template.NumFreeReloads = class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SPEEDLOADER_ADVANCED_FREE_RELOADS;

	return Template;
}

// Superior Speedloader: 2 Free Reloads, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Superior_Speedloader()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Superior_Speedloader');

	SetUpT3WeaponUpgrade(Template);
	SetUpSpeedloaderUpgrade(Template);

	Template.NumFreeReloads = class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SPEEDLOADER_ADVANCED_FREE_RELOADS;

	return Template;
}

// Prototype Speedloader: 4 Free Reloads, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Prototype_Speedloader()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Prototype_Speedloader');

	SetUpT4WeaponUpgrade(Template);
	SetUpSpeedloaderUpgrade(Template);

	Template.NumFreeReloads = class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SPEEDLOADER_PROTOTYPE_FREE_RELOADS;
	Template.BonusAbilities.AddItem('F_LockNLoa');

	return Template;
}

static function SetUpSpeedloaderUpgrade(out X2WeaponUpgradeTemplate Template)
{
	local WeaponAttachment		WeaponAttachment;

	Template.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
	Template.MutuallyExclusiveUpgrades = default.MAGAZINE_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;
	Template.GetBonusAmountFn = GetReloadBonusAmount;
	Template.FreeReloadCostFn = FreeReloadCost;
	Template.FriendlyRenameFn = Reload_FriendlyRenameAbilityDelegate;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagD_inv";

	foreach default.SPEEDLOADER_WEAPON_ATTACHMENTS(WeaponAttachment)
	{
		if (WeaponAttachment.InventoryCategoryIcon == "")
		{
			WeaponAttachment.InventoryCategoryIcon = "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_speedloader";
		}

		if (WeaponAttachment.InventoryIconName == "")
		{
			WeaponAttachment.InventoryIconName = "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagD_inv";
		}

		Template.UpgradeAttachments.AddItem(WeaponAttachment);
	}
}

static function int GetReloadBonusAmount(X2WeaponUpgradeTemplate UpgradeTemplate)
{
	return UpgradeTemplate.NumFreeReloads
		+ (class'X2Item_DefaultUpgrades'.static.AreUpgradesEmpowered() ? default.RELOAD_EMPOWER_BONUS : 0);
}

static function bool FreeReloadCost(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Ability ReloadAbility, XComGameState_Unit UnitState)
{
	local UnitValue FreeReloadValue;

	if (UpgradeTemplate.GetBonusAmountFn(UpgradeTemplate) > 0)
	{
		UnitState.GetUnitValue('FreeReload', FreeReloadValue);
		if (FreeReloadValue.fValue >= UpgradeTemplate.GetBonusAmountFn(UpgradeTemplate))
		{
			return false;
		}
		UnitState.SetUnitFloatValue('FreeReload', FreeReloadValue.fValue + 1, eCleanup_BeginTactical);
	}

	return true;
}

function string Reload_FriendlyRenameAbilityDelegate(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Ability AbilityState)
{
	local XComGameState_Unit UnitState;
	local UnitValue FreeReloadValue;

	if (AbilityState.GetMyTemplateName() == 'Reload')
	{
		if (UpgradeTemplate.GetBonusAmountFn(UpgradeTemplate) > 0)
		{
			UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
			UnitState.GetUnitValue('FreeReload', FreeReloadValue);
			if (FreeReloadValue.fValue >= UpgradeTemplate.GetBonusAmountFn(UpgradeTemplate))
				return "";
		}
		return class'X2Item_DefaultUpgrades'.default.FreeReloadAbilityName;
	}
	return "";
}


// Expanded Magazine:
// -----------------------------------------------------------------------------------------------

// Basic Expanded Magazine: +1 Ammo/Round in each magazine.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Basic_ExpandedMag()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Basic_ExpandedMag');

	SetUpT1WeaponUpgrade(Template);
	SetUpExpandedMagUpgrade(Template);
	
	Template.ClipSizeBonus = class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.EXPANDED_MAGAZINE_BASIC_AMMO_BONUS;

	return Template;
}

// Advanced Expanded Magazine: +2 Ammo/Rounds in each magazine, -1 Mobility.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Advanced_ExpandedMag()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Advanced_ExpandedMag');

	SetUpT2WeaponUpgrade(Template);
	SetUpExpandedMagUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_ExpandedMag_AdvancedPenalty');
	Template.ClipSizeBonus = class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.EXPANDED_MAGAZINE_ADVANCED_AMMO_BONUS;

	return Template;
}

// Superior Expanded Magazine: +2 Ammo/Rounds in each magazine, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Superior_ExpandedMag()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Superior_ExpandedMag');

	SetUpT3WeaponUpgrade(Template);
	SetUpExpandedMagUpgrade(Template);

	Template.ClipSizeBonus = class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.EXPANDED_MAGAZINE_ADVANCED_AMMO_BONUS;

	return Template;
}

// Prototype Expanded Magazine: +4 Ammo/Rounds in each magazine, no penalty.
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Prototype_ExpandedMag()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Prototype_ExpandedMag');

	SetUpT4WeaponUpgrade(Template);
	SetUpExpandedMagUpgrade(Template);

	Template.ClipSizeBonus = class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.EXPANDED_MAGAZINE_PROTOTYPE_AMMO_BONUS;
	Template.BonusAbilities.AddItem('HailofBullets');

	return Template;
}

static function SetUpExpandedMagUpgrade(out X2WeaponUpgradeTemplate Template)
{
	local WeaponAttachment		WeaponAttachment;

	Template.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
	Template.MutuallyExclusiveUpgrades = default.MAGAZINE_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;
	Template.GetBonusAmountFn = GetClipSizeBonusAmount;
	Template.AdjustClipSizeFn = AdjustClipSize;

	Template.strImage = "img:///UILibrary_XPACK_StrategyImages.ConvVektor_MagB_inv";

	foreach default.EXPANDED_MAGAZINE_WEAPON_ATTACHMENTS(WeaponAttachment)
	{
		if (WeaponAttachment.InventoryCategoryIcon == "")
		{
			WeaponAttachment.InventoryCategoryIcon = "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_expanded_mag";
		}

		if (WeaponAttachment.InventoryIconName == "")
		{
			WeaponAttachment.InventoryIconName = "img:///UILibrary_XPACK_StrategyImages.ConvVektor_MagB_inv";
		}

		Template.UpgradeAttachments.AddItem(WeaponAttachment);
	}
}

static function int GetClipSizeBonusAmount(X2WeaponUpgradeTemplate UpgradeTemplate)
{
	return UpgradeTemplate.ClipSizeBonus
		+ (class'X2Item_DefaultUpgrades'.static.AreUpgradesEmpowered() ? default.CLIP_SIZE_EMPOWER_BONUS : 0);
}

static function bool AdjustClipSize(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, const int CurrentClipSize, out int AdjustedClipSize)
{
	AdjustedClipSize = CurrentClipSize + UpgradeTemplate.GetBonusAmountFn(UpgradeTemplate);
	return true;
}


// Wildcat Cartridges:
// -----------------------------------------------------------------------------------------------

// Basic Wildcat Cartridges: 
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Basic_WildcatCartridges()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Basic_WildcatCartridges');

	SetUpT1WeaponUpgrade(Template);
	SetUpWildcatCartridgesUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_WildcatCartridges_BasicBonus');

	return Template;
}

// Advanced Wildcat Cartridges:
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Advanced_WildcatCartridges()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Advanced_WildcatCartridges');

	SetUpT2WeaponUpgrade(Template);
	SetUpWildcatCartridgesUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_WildcatCartridges_AdvancedBonus');

	return Template;
}

// Superior Wildcat Cartridges:
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Superior_WildcatCartridges()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Superior_WildcatCartridges');

	SetUpT3WeaponUpgrade(Template);
	SetUpWildcatCartridgesUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_WildcatCartridges_SuperiorBonus');

	return Template;
}

// Prototype Wildcat Cartridges:
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Prototype_WildcatCartridges()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Prototype_WildcatCartridges');

	SetUpT4WeaponUpgrade(Template);
	SetUpWildcatCartridgesUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_WildcatCartridges_PrototypeBonus');

	return Template;
}

static function SetUpWildcatCartridgesUpgrade(out X2WeaponUpgradeTemplate Template)
{
	local WeaponAttachment		WeaponAttachment;

	Template.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
	Template.MutuallyExclusiveUpgrades = default.MAGAZINE_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvCannon_MagB_inv";

	foreach default.WILDCAT_CARTRIDGES_WEAPON_ATTACHMENTS(WeaponAttachment)
	{
		if (WeaponAttachment.InventoryCategoryIcon == "")
		{
			WeaponAttachment.InventoryCategoryIcon = "img:///UILibrary_WOTC_APA_WeaponItemOverhaul.Inv_weaponIcon_wildcat_cartridges";
		}

		if (WeaponAttachment.InventoryIconName == "")
		{
			WeaponAttachment.InventoryIconName = "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvCannon_MagB_inv";
		}

		Template.UpgradeAttachments.AddItem(WeaponAttachment);
	}
}

// Create Trigger Upgrades:

// Hair Trigger:
// -----------------------------------------------------------------------------------------------

// Basic Hair Trigger
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Basic_HairTrigger()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Basic_HairTrigger');

	SetUpT1WeaponUpgrade(Template);
	SetUpHairTriggerUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_HairTrigger_BasicBonus');	

	return Template;
}

// Advanced Hair Trigger
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Advanced_HairTrigger()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Advanced_HairTrigger');

	SetUpT2WeaponUpgrade(Template);
	SetUpHairTriggerUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_HairTrigger_AdvancedBonus');
	Template.BonusAbilities.AddItem('WOTC_APA_HairTrigger_AdvancedPenaltry');

	return Template;
}

// Superior Hair Trigger
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Superior_HairTrigger()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Superior_HairTrigger');

	SetUpT3WeaponUpgrade(Template);
	SetUpHairTriggerUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_HairTrigger_AdvancedBonus');

	return Template;
}

// Prototype Hair Trigger
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Prototype_HairTrigger()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Prototype_HairTrigger');

	SetUpT4WeaponUpgrade(Template);
	SetUpHairTriggerUpgrade(Template);

	Template.BonusAbilities.AddItem('WOTC_APA_HairTrigger_PrototypeBonus');
	Template.BonusAbilities.AddItem('RapidFire');

	return Template;
}

// Sidearm Safety Trigger
static function X2WeaponUpgradeTemplate CreateUpgrade_WOTC_APA_Sidearm_HeavyTrigger()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'WOTC_APA_Sidearm_HeavyTrigger');

	SetUpT4WeaponUpgrade(Template);
	SetUpHairTriggerUpgrade(Template);

	Template.CanApplyUpgradeToWeaponFn = CanApplySidearmUpgradeToWeapon;
	Template.BonusAbilities.AddItem('WOTC_APA_HairTrigger_BasicBonus');	
	Template.BonusAbilities.AddItem('CoolUnderPressure');

	return Template;
}

static function bool CanApplySidearmUpgradeToWeapon(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, int SlotIndex)
{
	local X2WeaponTemplate					WeaponTemplate;
	local name								TemplateName;

	// Must not be a weapon with a built-in Body upgrade
	WeaponTemplate = X2WeaponTemplate(Weapon.GetMyTemplate());

	if (WeaponTemplate.WeaponCat != 'sidearm')
		return false;

	return CanApplyUpgradeToWeaponPatched(UpgradeTemplate, Weapon, SlotIndex);
}

static function SetUpHairTriggerUpgrade(out X2WeaponUpgradeTemplate Template)
{
	local WeaponAttachment		WeaponAttachment;

	Template.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
	Template.MutuallyExclusiveUpgrades = default.TRIGGER_MUTUALLY_EXCLUSIVE_WEAPON_UPGRADES;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_TriggerB_inv";

	foreach default.HAIR_TRIGGER_WEAPON_ATTACHMENTS(WeaponAttachment)
	{

		if (WeaponAttachment.InventoryIconName == "")
		{
			WeaponAttachment.InventoryIconName = "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_TriggerB_inv";
		}

		Template.UpgradeAttachments.AddItem(WeaponAttachment);
	}
}

static function bool CanApplyUpgradeToWeaponPatched(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, int SlotIndex)
{
	local X2WeaponTemplate WeaponTemplate;
	local array<name> DefaultRangedWeaponCategories;

	WeaponTemplate = X2WeaponTemplate(Weapon.GetMyTemplate());
	if (WeaponTemplate == none)
		return class'X2Item_DefaultUpgrades'.static.CanApplyUpgradeToWeapon(UpgradeTemplate, Weapon, SlotIndex);
		
	`LOG("CanApplyUpgradeToWeaponPatched:" @ WeaponTemplate.Name @ "|" @ WeaponTemplate.WeaponCat,,'CC');
	DefaultRangedWeaponCategories.AddItem('');
	DefaultRangedWeaponCategories.AddItem('pistol');
	DefaultRangedWeaponCategories.AddItem('rifle');
	DefaultRangedWeaponCategories.AddItem('shotgun');
	DefaultRangedWeaponCategories.AddItem('cannon');
	DefaultRangedWeaponCategories.AddItem('sniper_rifle');
	DefaultRangedWeaponCategories.AddItem('vektor_rifle');
	DefaultRangedWeaponCategories.AddItem('bullpup');
	DefaultRangedWeaponCategories.AddItem('sidearm');
	DefaultRangedWeaponCategories.AddItem('sparkrifle');
	DefaultRangedWeaponCategories.AddItem('iri_ordnance_launcher');

	//`LOG(default.Class.Name @ GetFuncName() @ WeaponTemplate.DataName,, 'ConfigureUpgradeSlots');

	if (WeaponTemplate != none && WeaponTemplate.RangeAccuracy.Length > 0 && WeaponTemplate.iRange == INDEX_NONE)
	{
		`LOG(WeaponTemplate.Name $ " | " $ WeaponTemplate.RangeAccuracy.Length $ " | " $ WeaponTemplate.iRange,,'CC');
		return class'X2Item_DefaultUpgrades'.static.CanApplyUpgradeToWeapon(UpgradeTemplate, Weapon, SlotIndex);
	}

	if (WeaponTemplate != none && DefaultRangedWeaponCategories.Find(WeaponTemplate.WeaponCat) != INDEX_NONE)
	{
		`LOG(WeaponTemplate.Name $ " | " $ WeaponTemplate.WeaponCat $ " | " $ DefaultRangedWeaponCategories.Find(WeaponTemplate.WeaponCat),,'CC');
		return class'X2Item_DefaultUpgrades'.static.CanApplyUpgradeToWeapon(UpgradeTemplate, Weapon, SlotIndex);
	}

	`LOG(default.Class.Name @ GetFuncName() @ WeaponTemplate.DataName @ "bail no ranged weapon",, 'CC');
	return false;
}