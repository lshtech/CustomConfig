// Creates and configures the new upgrades

class X2Item_ExpandedUpgrades extends X2Item_DefaultUpgrades config(WUE);

var config int 					CRIT_UPGRADE_PRT;
var config int 					AIM_UPGRADE_PRT;
var config int 					CLIP_SIZE_PRT;
var config int					FREE_FIRE_PRT;
var config int					FREE_RELOADS_PRT;
var config int					FREE_KILL_Prt;
var config WeaponDamageValue	MISS_DAMAGE_PRT;

static function array<X2DataTemplate> CreateTemplates()
{
	local array <X2DataTemplate> Items;

	Items.AddItem(CreatePrototypeCritUpgrade());
	
	Items.Additem(CreatePrototypeAimUpgrade());

	Items.Additem(CreatePrototypeClipSizeUpgrade());

	Items.Additem(CreatePrototypeFreeFireUpgrade());

	Items.Additem(CreatePrototypeReloadUpgrade());

	Items.Additem(CreatePrototypeMissDamageUpgrade());

	Items.Additem(CreatePrototypeFreeKillUpgrade());

	Items.AddItem(CreatePrototypeSNHeavyBarrel());

	return Items;
}

// #######################################################################################
// -------------------- GENERIC SETUP FUNCTIONS ------------------------------------------
// #######################################################################################

static function SetUpTier4Upgrade(out X2WeaponUpgradeTemplate Template)
{
	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.WeapFragmentB';
	Template.TradingPostValue = 50;
	Template.Tier = 3;
}

// #######################################################################################
// -------------------- CRIT UPGRADES ----------------------------------------------------
// #######################################################################################

static function X2DataTemplate CreatePrototypeCritUpgrade()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'CritUpgrade_Prt');

	SetUpCritUpgrade(Template);
	SetUpTier4Upgrade(Template);
	Template.CanApplyUpgradeToWeaponFn =CanApplyUpgradeToWeaponPatched;

	Template.BonusAbilities.AddItem('LaserSight_Prt');
	Template.BonusAbilities.AddItem('LaserSight_BonusSkill');

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_OpticB_inv";
	Template.CritBonus = default.CRIT_UPGRADE_PRT;
	
	return Template;
}

// #######################################################################################
// --------------------- AIM UPGRADES ----------------------------------------------------
// #######################################################################################

static function X2DataTemplate CreatePrototypeAimUpgrade()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'AimUpgrade_Prt');

	SetUpAimBonusUpgrade(Template);
	SetUpTier4Upgrade(Template);
	Template.CanApplyUpgradeToWeaponFn =CanApplyUpgradeToWeaponPatched;

	Template.GetBonusAmountFn = none;
	Template.AddHitChanceModifierFn = none;
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamSniper_OpticC_inv";
	Template.AimBonus = 0;
	Template.BonusAbilities.AddItem('Scope_BonusSkill');
	Template.BonusAbilities.AddItem('CoveringFire');
	Template.BonusAbilities.AddItem('AbiziNoDodgeScope');
	
	return Template;
}

// #######################################################################################
// -------------------- EXPANDED MAG UPGRADES --------------------------------------------
// #######################################################################################

static function X2DataTemplate CreatePrototypeClipSizeUpgrade()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'ClipSizeUpgrade_Prt');

	SetUpClipSizeBonusUpgrade(Template);
	SetUpTier4Upgrade(Template);
	Template.CanApplyUpgradeToWeaponFn =CanApplyUpgradeToWeaponPatched;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_MagB_inv";
	Template.ClipSizeBonus = default.CLIP_SIZE_PRT;
	Template.BonusAbilities.AddItem('HailOfBullets');
	
	return Template;
}

// #######################################################################################
// -------------------- FREE FIRE UPGRADES -----------------------------------------------
// #######################################################################################

static function X2DataTemplate CreatePrototypeFreeFireUpgrade()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'FreeFireUpgrade_Prt');

	SetUpFreeFireBonusUpgrade(Template);
	SetUpTier4Upgrade(Template);
	Template.CanApplyUpgradeToWeaponFn =CanApplyUpgradeToWeaponPatched;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_TriggerB_inv";
	Template.FreeFireChance = default.FREE_FIRE_PRT;
	Template.GetBonusAmountFn = none;
	Template.BonusAbilities.AddItem('HairTrigger_Prt');
	Template.FreeFireChance = 0;
	Template.FreeFireCostFn = none;
	Template.BonusAbilities.AddItem('RapidFire');
	Template.BonusAbilities.AddItem('RapidFire2');
	
	return Template;
}

// #######################################################################################
// -------------------- RELOAD UPGRADES --------------------------------------------------
// #######################################################################################

static function X2DataTemplate CreatePrototypeReloadUpgrade()
{
	local X2WeaponUpgradeTemplate Template;
	
	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'ReloadUpgrade_Prt');

	SetUpReloadUpgrade(Template);
	SetUpTier4Upgrade(Template);
	Template.CanApplyUpgradeToWeaponFn =CanApplyUpgradeToWeaponPatched;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_AutoLoader_inv";
	Template.NumFreeReloads = default.FREE_RELOADS_PRT;
	
	return Template;
}

// #######################################################################################
// -------------------- MISS FIRE UPGRADES -----------------------------------------------
// #######################################################################################

static function X2DataTemplate CreatePrototypeMissDamageUpgrade()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'MissDamageUpgrade_Prt');

	SetUpMissDamageUpgrade(Template);
	SetUpTier4Upgrade(Template);
	Template.CanApplyUpgradeToWeaponFn =CanApplyUpgradeToWeaponPatched;

	Template.GetBonusAmountFn = none;
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_HeatsinkB_inv";
	Template.BonusAbilities.AddItem('EverVigilant');
	Template.BonusAbilities.AddItem('AbiziSteadyWeaponM4');
	
	return Template;
}

// #######################################################################################
// -------------------- FREE KILL UPGRADES -----------------------------------------------
// #######################################################################################

static function X2DataTemplate CreatePrototypeFreeKillUpgrade()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'FreeKillUpgrade_Prt');

	SetUpFreeKillUpgrade(Template);
	SetUpTier4Upgrade(Template);
	Template.CanApplyUpgradeToWeaponFn =CanApplyUpgradeToWeaponPatched;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv";
	Template.FreeKillChance = 0;
	Template.BonusAbilities.AddItem('ChainShot');
	Template.BonusAbilities.AddItem('ChainShot2');
	Template.BonusAbilities.AddItem('MusashiSilencer');
	Template.BonusAbilities.AddItem('MusashiAmbushSilencer');
	Template.BonusAbilities.AddItem('SilentKillPassive');
	Template.FreeKillChance = 0;
	Template.FreeKillFn = none;
	Template.GetBonusAmountFn = none;

	return Template;
}

static function X2DataTemplate CreatePrototypeSNHeavyBarrel()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'SNHeavyBarrel_Prt');

	SetUpHeavyBarrelUpgrade(Template);
	SetUpTier4Upgrade(Template);
	Template.CanApplyUpgradeToWeaponFn =CanApplyUpgradeToWeaponPatched;

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv";
	Template.BonusAbilities.AddItem('SNHeavyBarrel_Prt_Ability');
	Template.BonusAbilities.AddItem('Guardian');
	
	return Template;
}

static function PatchWeaponUpgrades()
{
	local X2WeaponUpgradeTemplate FirstTemplate, SecondTemplate;
	local X2ItemTemplateManager ItemTemplateManager;

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	FirstTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate('FreeKillUpgrade_Bsc'));
	SecondTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate('SNHeavyBarrel_Bsc'));

	if (FirstTemplate != none && SecondTemplate != none)
	{
		SetUpHeavyBarrelUpgrade(SecondTemplate);
		SecondTemplate.UpgradeAttachments = FirstTemplate.UpgradeAttachments;
		FirstTemplate.MutuallyExclusiveUpgrades.AddItem('SNHeavyBarrel_Prt');
	}

	FirstTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate('FreeKillUpgrade_Adv'));
	SecondTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate('SNHeavyBarrel_Adv'));

	if (FirstTemplate != none && SecondTemplate != none)
	{
		SetUpHeavyBarrelUpgrade(SecondTemplate);
		SecondTemplate.UpgradeAttachments = FirstTemplate.UpgradeAttachments;
		FirstTemplate.MutuallyExclusiveUpgrades.AddItem('SNHeavyBarrel_Prt');
	}

	FirstTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate('FreeKillUpgrade_Sup'));
	SecondTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate('SNHeavyBarrel_Sup'));

	if (FirstTemplate != none && SecondTemplate != none)
	{
		SetUpHeavyBarrelUpgrade(SecondTemplate);
		SecondTemplate.UpgradeAttachments = FirstTemplate.UpgradeAttachments;
		FirstTemplate.MutuallyExclusiveUpgrades.AddItem('SNHeavyBarrel_Prt');
	}

	FirstTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate('FreeKillUpgrade_Prt'));
	SecondTemplate = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate('SNHeavyBarrel_Prt'));

	if (FirstTemplate != none && SecondTemplate != none)
	{
		SecondTemplate.UpgradeAttachments = FirstTemplate.UpgradeAttachments;
		FirstTemplate.MutuallyExclusiveUpgrades.AddItem('SNHeavyBarrel_Bsc');
		FirstTemplate.MutuallyExclusiveUpgrades.AddItem('SNHeavyBarrel_Adv');
		FirstTemplate.MutuallyExclusiveUpgrades.AddItem('SNHeavyBarrel_Sup');
		FirstTemplate.MutuallyExclusiveUpgrades.AddItem('SNHeavyBarrel_Prt');
	}
}

static function SetUpHeavyBarrelUpgrade(out X2WeaponUpgradeTemplate Template)
{
	SetUpWeaponUpgrade(Template);

	Template.MutuallyExclusiveUpgrades.AddItem('FreeKillUpgrade');
	Template.MutuallyExclusiveUpgrades.AddItem('FreeKillUpgrade_Bsc');
	Template.MutuallyExclusiveUpgrades.AddItem('FreeKillUpgrade_Adv');
	Template.MutuallyExclusiveUpgrades.AddItem('FreeKillUpgrade_Sup');
	Template.MutuallyExclusiveUpgrades.AddItem('FreeKillUpgrade_Prt');
	Template.MutuallyExclusiveUpgrades.AddItem('SNHeavyBarrel');
	Template.MutuallyExclusiveUpgrades.AddItem('SNHeavyBarrel_Bsc');
	Template.MutuallyExclusiveUpgrades.AddItem('SNHeavyBarrel_Adv');
	Template.MutuallyExclusiveUpgrades.AddItem('SNHeavyBarrel_Sup');
	Template.MutuallyExclusiveUpgrades.AddItem('SNHeavyBarrel_Prt');
	
	// Assault Rifles
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'AssaultRifle_CV', , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorB", "", 'AssaultRifle_MG', , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_AssaultRifle_Suppressor', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorB", "", 'AssaultRifle_BM', , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', '', "", "", 'AssaultRifle_Central', , "", "", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Shotguns
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "ConvShotgun.Meshes.SM_ConvShotgun_SuppressorB", "", 'Shotgun_CV', , "img:///UILibrary_Common.ConvShotgun.ConvShotgun_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvShotgun_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "MagShotgun.Meshes.SM_MagShotgun_SuppressorB", "", 'Shotgun_MG', , "img:///UILibrary_Common.UI_MagShotgun.MagShotgun_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagShotgun_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "BeamShotgun.Meshes.SM_BeamShotgun_SuppressorB", "", 'Shotgun_BM', , "img:///UILibrary_Common.UI_BeamShotgun.BeamShotgun_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamShotgun_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Sniper Rifles
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Sniper_Suppressor', "ConvSniper.Meshes.SM_ConvSniper_SuppressorB", "", 'SniperRifle_CV', , "img:///UILibrary_Common.ConvSniper.ConvSniper_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Sniper_Suppressor', "MagSniper.Meshes.SM_MagSniper_SuppressorB", "", 'SniperRifle_MG', , "img:///UILibrary_Common.UI_MagSniper.MagSniper_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagSniper_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Sniper_Suppressor', "BeamSniper.Meshes.SM_BeamSniper_SuppressorB", "", 'SniperRifle_BM', , "img:///UILibrary_Common.UI_BeamSniper.BeamSniper_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamSniper_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Cannons
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Cannon_Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorB", "", 'Cannon_CV', , "img:///UILibrary_Common.ConvCannon.ConvCannon_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvCannon_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Cannon_Suppressor', "MagCannon.Meshes.SM_MagCannon_SuppressorB", "", 'Cannon_MG', , "img:///UILibrary_Common.UI_MagCannon.MagCannon_SuppressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagCannon_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Cannon_Suppressor', "BeamCannon.Meshes.SM_BeamCannon_SuppressorB", "", 'Cannon_BM', , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_SupressorB", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamCannon_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Bullpups
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "CnvSMG.Meshes.SM_HOR_Cnv_SMG_SuppressorB", "", 'Bullpup_CV', , "img:///UILibrary_XPACK_Common.ConvSMG_SuppressorB", "img:///UILibrary_XPACK_StrategyImages.ConvSMG_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "MagSMG.Meshes.SM_HOR_Mag_SMG_SuppressorB", "", 'Bullpup_MG', , "img:///UILibrary_XPACK_Common.MagSMG_SuppressorB", "img:///UILibrary_XPACK_StrategyImages.MagSMG_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Shotgun_Suppressor', "BemSMG.Meshes.SM_HOR_Bem_SMG_SuppressorB", "", 'Bullpup_BM', , "img:///UILibrary_XPACK_Common.BeamSMG_SuppressorB", "img:///UILibrary_XPACK_StrategyImages.BeamSMG_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Vektor Rifles
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Sniper_Suppressor', "CnvReaperRifle.Meshes.SM_HOR_Cnv_ReaperRifle_SuppressorB", "", 'VektorRifle_CV', , "img:///UILibrary_XPACK_Common.ConvVektor_SuppressorB", "img:///UILibrary_XPACK_StrategyImages.ConvVektor_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Sniper_Suppressor', "MagReaperRifle.Meshes.SM_HOR_Mag_ReaperRifle_SuppressorB", "", 'VektorRifle_MG', , "img:///UILibrary_XPACK_Common.MagVektor_SuppressorB", "img:///UILibrary_XPACK_StrategyImages.MagVektor_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', 'UIPawnLocation_WeaponUpgrade_Sniper_Suppressor', "BemReaperRifle.Meshes.SM_HOR_Bem_ReaperRifle_SuppressorB", "", 'VektorRifle_BM', , "img:///UILibrary_XPACK_Common.BeamVektor_SuppressorB", "img:///UILibrary_XPACK_StrategyImages.BeamVektor_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Chosen Weapons
	Template.AddUpgradeAttachment('Suppressor', '', "", "", 'ChosenRifle_XCOM', , "", "", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', '', "", "", 'ChosenSniperRifle_XCOM', , "", "", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
	Template.AddUpgradeAttachment('Suppressor', '', "", "", 'ChosenShotgun_XCOM', , "", "", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
}

static function bool CanApplyUpgradeToWeaponPatched(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, int SlotIndex)
{
	local X2WeaponTemplate WeaponTemplate;
	local array<name> DefaultRangedWeaponCategories;

	WeaponTemplate = X2WeaponTemplate(Weapon.GetMyTemplate());
	`LOG("CanApplyUpgradeToWeaponPatched: " $ WeaponTemplate.Name,,'CC');
	DefaultRangedWeaponCategories.AddItem('pistol');
	DefaultRangedWeaponCategories.AddItem('rifle');
	DefaultRangedWeaponCategories.AddItem('shotgun');
	DefaultRangedWeaponCategories.AddItem('cannon');
	DefaultRangedWeaponCategories.AddItem('sniper_rifle');
	DefaultRangedWeaponCategories.AddItem('vektor_rifle');
	DefaultRangedWeaponCategories.AddItem('bullpup');
	DefaultRangedWeaponCategories.AddItem('sidearm');

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