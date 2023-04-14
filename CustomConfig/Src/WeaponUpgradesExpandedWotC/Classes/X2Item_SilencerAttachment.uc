class X2Item_SilencerAttachment extends X2Item_DefaultUpgrades config(WUE);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Items;

	Items.AddItem(CreateBasicSilencerUpgrade());
	Items.AddItem(CreateAdvancedSilencerUpgrade());
	Items.AddItem(CreateSuperiorSilencerUpgrade());
    Items.AddItem(CreatePrototypeSilencerUpgrade());
	
	return Items;
}

static function X2DataTemplate CreateBasicSilencerUpgrade()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'SilencerUpgrade_Bsc');

	SetUpSilencerUpgrade(Template);
	SetUpTier1Upgrade(Template);
    Template.CanApplyUpgradeToWeaponFn = class'X2Item_ExpandedUpgrades'.static.CanApplyUpgradeToWeaponPatched;
    Template.BonusAbilities.addItem('Suppressor_Bsc_Ability');

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv";
	
	return Template;
}

static function X2DataTemplate CreateAdvancedSilencerUpgrade()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'SilencerUpgrade_Adv');
	
	SetUpSilencerUpgrade(Template);
	SetUpTier2Upgrade(Template);
    Template.CanApplyUpgradeToWeaponFn = class'X2Item_ExpandedUpgrades'.static.CanApplyUpgradeToWeaponPatched;
    Template.BonusAbilities.addItem('Suppressor_Adv_Ability');

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv";
	
	return Template;
}

static function X2DataTemplate CreateSuperiorSilencerUpgrade()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'SilencerUpgrade_Sup');

	SetUpSilencerUpgrade(Template);
	SetUpTier3Upgrade(Template);
    Template.CanApplyUpgradeToWeaponFn = class'X2Item_ExpandedUpgrades'.static.CanApplyUpgradeToWeaponPatched;
    Template.BonusAbilities.addItem('Suppressor_Sup_Ability');

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv";
	
	return Template;
}

static function X2DataTemplate CreatePrototypeSilencerUpgrade()
{
	local X2WeaponUpgradeTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponUpgradeTemplate', Template, 'SilencerUpgrade_Prt');

	SetUpSilencerUpgrade(Template);
	class'X2Item_ExpandedUpgrades'.static.SetUpTier4Upgrade(Template);
	Template.CanApplyUpgradeToWeaponFn = class'X2Item_ExpandedUpgrades'.Static.CanApplyUpgradeToWeaponPatched;
    Template.BonusAbilities.addItem('Suppressor_Prt_Ability');
    Template.BonusAbilities.addItem('WOTC_APA_Ghost');
    Template.BonusAbilities.addItem('Shadowstrike');

	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv";
	Template.GetBonusAmountFn = none;

	return Template;
}

static function SetUpSilencerUpgrade(out X2WeaponUpgradeTemplate Template)
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

    Template.BonusAbilities.AddItem('MusashiSilencer');
	Template.BonusAbilities.AddItem('MusashiAmbushSilencer');
	Template.BonusAbilities.AddItem('SilentKillPassive');
	
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
