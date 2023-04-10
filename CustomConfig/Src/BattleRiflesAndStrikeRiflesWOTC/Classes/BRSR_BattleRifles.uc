class BRSR_BattleRifles extends X2Item_DefaultWeapons config(BRSR_BattleRifles_Options);

// Variables from config - GameData_WeaponData.ini
// ***** Damage arrays for attack actions  *****

var config WeaponDamageValue BRSR_BATTLERIFLE_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue BRSR_BATTLERIFLE_LASER_BASEDAMAGE;
var config WeaponDamageValue BRSR_BATTLERIFLE_MAGNETIC_BASEDAMAGE;
var config WeaponDamageValue BRSR_BATTLERIFLE_COIL_BASEDAMAGE;
var config WeaponDamageValue BRSR_BATTLERIFLE_BEAM_BASEDAMAGE;

var config array<int> BRSR_BATTLERIFLE_RANGE;

// ***** Core properties and variables for weapons *****
var config int BRSR_BATTLERIFLE_CONVENTIONAL_AIM;
var config int BRSR_BATTLERIFLE_CONVENTIONAL_CRITCHANCE;
var config int BRSR_BATTLERIFLE_CONVENTIONAL_ICLIPSIZE;
var config int BRSR_BATTLERIFLE_CONVENTIONAL_ISOUNDRANGE;
var config int BRSR_BATTLERIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int BRSR_BATTLERIFLE_CONVENTIONAL_UPGRADESLOTS;

var config int BRSR_BATTLERIFLE_LASER_AIM;
var config int BRSR_BATTLERIFLE_LASER_CRITCHANCE;
var config int BRSR_BATTLERIFLE_LASER_ICLIPSIZE;
var config int BRSR_BATTLERIFLE_LASER_ISOUNDRANGE;
var config int BRSR_BATTLERIFLE_LASER_IENVIRONMENTDAMAGE;
var config int BRSR_BATTLERIFLE_LASER_UPGRADESLOTS;

var config int BRSR_BATTLERIFLE_LASER_BLACKMARKET_VALUE;
var config array<name> BRSR_BATTLERIFLE_LASER_REQUIRED_TECHS;
var config array<name> BRSR_BATTLERIFLE_LASER_BUILD_COST_TYPE;
var config array<int> BRSR_BATTLERIFLE_LASER_BUILD_COST_QUANTITY;

var config int BRSR_BATTLERIFLE_MAGNETIC_AIM;
var config int BRSR_BATTLERIFLE_MAGNETIC_CRITCHANCE;
var config int BRSR_BATTLERIFLE_MAGNETIC_ICLIPSIZE;
var config int BRSR_BATTLERIFLE_MAGNETIC_ISOUNDRANGE;
var config int BRSR_BATTLERIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
var config int BRSR_BATTLERIFLE_MAGNETIC_UPGRADESLOTS;

var config int BRSR_BATTLERIFLE_MAGNETIC_BLACKMARKET_VALUE;
var config array<name> BRSR_BATTLERIFLE_MAGNETIC_REQUIRED_TECHS;
var config array<name> BRSR_BATTLERIFLE_MAGNETIC_BUILD_COST_TYPE;
var config array<int> BRSR_BATTLERIFLE_MAGNETIC_BUILD_COST_QUANTITY;

var config int BRSR_BATTLERIFLE_COIL_AIM;
var config int BRSR_BATTLERIFLE_COIL_CRITCHANCE;
var config int BRSR_BATTLERIFLE_COIL_ICLIPSIZE;
var config int BRSR_BATTLERIFLE_COIL_ISOUNDRANGE;
var config int BRSR_BATTLERIFLE_COIL_IENVIRONMENTDAMAGE;
var config int BRSR_BATTLERIFLE_COIL_UPGRADESLOTS;

var config int BRSR_BATTLERIFLE_COIL_BLACKMARKET_VALUE;
var config array<name> BRSR_BATTLERIFLE_COIL_REQUIRED_TECHS;
var config array<name> BRSR_BATTLERIFLE_COIL_BUILD_COST_TYPE;
var config array<int> BRSR_BATTLERIFLE_COIL_BUILD_COST_QUANTITY;

var config int BRSR_BATTLERIFLE_BEAM_AIM;
var config int BRSR_BATTLERIFLE_BEAM_CRITCHANCE;
var config int BRSR_BATTLERIFLE_BEAM_ICLIPSIZE;
var config int BRSR_BATTLERIFLE_BEAM_ISOUNDRANGE;
var config int BRSR_BATTLERIFLE_BEAM_IENVIRONMENTDAMAGE;
var config int BRSR_BATTLERIFLE_BEAM_UPGRADESLOTS;

var config int BRSR_BATTLERIFLE_BEAM_BLACKMARKET_VALUE;
var config array<name> BRSR_BATTLERIFLE_BEAM_REQUIRED_TECHS;
var config array<name> BRSR_BATTLERIFLE_BEAM_BUILD_COST_TYPE;
var config array<int> BRSR_BATTLERIFLE_BEAM_BUILD_COST_QUANTITY;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	Weapons.AddItem(CreateTemplate_BRSR_BATTLERIFLE_Conventional());
	Weapons.AddItem(CreateTemplate_BRSR_BATTLERIFLE_Laser());
	Weapons.AddItem(CreateTemplate_BRSR_BATTLERIFLE_Magnetic());
	Weapons.AddItem(CreateTemplate_BRSR_BATTLERIFLE_Coil());
	Weapons.AddItem(CreateTemplate_BRSR_BATTLERIFLE_Beam());
	
	return Weapons;
}

static function X2DataTemplate CreateTemplate_BRSR_BATTLERIFLE_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BRSR_BATTLERIFLE_CONVENTIONAL');
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_BRMeshPack.Base.AR_CV_Base";  
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.Tier = 0;

	Template.RangeAccuracy = default.BRSR_BATTLERIFLE_RANGE;
	Template.BaseDamage = default.BRSR_BATTLERIFLE_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.BRSR_BATTLERIFLE_CONVENTIONAL_AIM;
	Template.CritChance = default.BRSR_BATTLERIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.BRSR_BATTLERIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.BRSR_BATTLERIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BRSR_BATTLERIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BRSR_BATTLERIFLE_CONVENTIONAL_UPGRADESLOTS; 
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('BRSR_RussianRoulette');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LW_SAW.Archetypes.WP_SAW_CV";

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_MagA");
	Template.AddDefaultAttachment('Stock', "ConvSniper.Meshes.SM_ConvSniper_StockA", , "img:///UILibrary_Common.ConvSniper.ConvSniper_StockA");
	//Template.AddDefaultAttachment('Fore', "BRMeshPack.Meshes.SM_CV_Foregrip", , "img:///UILibrary_BRMeshPack.Attach.AR_CV_ForegripA");
	Template.AddDefaultAttachment('Handle', "BRMeshPack.Meshes.SM_CV_Handle", , "img:///UILibrary_BRMeshPack.Attach.SAW_CV_Handle");
	Template.AddDefaultAttachment('Reargrip', "ConvSniper.Meshes.SM_ConvSniper_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Trigger', "ConvSniper.Meshes.SM_ConvSniper_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "");

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = true;
	Template.bInfiniteItem = true; 
	Template.CanBeBuilt = false;
	Template.TradingPostValue = 0;
	
	Template.fKnockbackDamageAmount = 4.0f;
	Template.fKnockbackDamageRadius = 0.0f;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';
	
	return Template;
}

static function X2DataTemplate CreateTemplate_BRSR_BATTLERIFLE_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost	Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BRSR_BATTLERIFLE_LASER');

	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'laser_lw';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_WolfWeaponPack.UI_Laser_Battle_Rifle";  
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;

	Template.RangeAccuracy = default.BRSR_BATTLERIFLE_RANGE;
	Template.BaseDamage = default.BRSR_BATTLERIFLE_LASER_BASEDAMAGE;
	Template.Aim = default.BRSR_BATTLERIFLE_LASER_AIM;
	Template.CritChance = default.BRSR_BATTLERIFLE_LASER_CRITCHANCE;
	Template.iClipSize = default.BRSR_BATTLERIFLE_LASER_ICLIPSIZE;
	Template.iSoundRange = default.BRSR_BATTLERIFLE_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BRSR_BATTLERIFLE_LASER_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BRSR_BATTLERIFLE_LASER_UPGRADESLOTS; 
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('BRSR_RussianRoulette');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LW_SAW.Archetypes.WP_SAW_LS";

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWCannon_LS.Meshes.SK_LaserCannon_Mag_A");//, , "img:///UILibrary_LW_LaserPack.LaserCannon_MagA");
	Template.AddDefaultAttachment('Mag2', "LWCannon_LS.Meshes.SK_LaserCannon_Stock_A");//, , "img:///UILibrary_LW_LaserPack.LaserCannon_StockA");
	Template.AddDefaultAttachment('Stock', "LWShotgun_LS.Meshes.SK_LaserShotgun_Stock_A");//, , "img:///UILibrary_LW_LaserPack.LaserShotgun_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A");//, , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A");//, , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripA");

	Template.iPhysicsImpulse = 5;
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.BRSR_BATTLERIFLE_LASER_BLACKMARKET_VALUE;
	Template.Requirements.RequiredTechs = default.BRSR_BATTLERIFLE_LASER_REQUIRED_TECHS;

			for (i = 0; i < default.BRSR_BATTLERIFLE_LASER_BUILD_COST_TYPE.Length; i++)
			{
				if (default.BRSR_BATTLERIFLE_LASER_BUILD_COST_QUANTITY[i] > 0)
				{
	Resources.ItemTemplateName = default.BRSR_BATTLERIFLE_LASER_BUILD_COST_TYPE[i];
	Resources.Quantity = default.BRSR_BATTLERIFLE_LASER_BUILD_COST_QUANTITY[i];
	Template.Cost.ResourceCosts.AddItem(Resources);
				}
			}

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateTemplate_BRSR_BATTLERIFLE_Magnetic()
{
	local X2WeaponTemplate Template;
	local ArtifactCost	Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BRSR_BATTLERIFLE_MAGNETIC');

	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_WolfWeaponPack.UI_Mag_Battle_Rifle";  
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 3;

	Template.RangeAccuracy = default.BRSR_BATTLERIFLE_RANGE;
	Template.BaseDamage = default.BRSR_BATTLERIFLE_MAGNETIC_BASEDAMAGE;
	Template.Aim = default.BRSR_BATTLERIFLE_MAGNETIC_AIM;
	Template.CritChance = default.BRSR_BATTLERIFLE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = default.BRSR_BATTLERIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = default.BRSR_BATTLERIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BRSR_BATTLERIFLE_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BRSR_BATTLERIFLE_MAGNETIC_UPGRADESLOTS; 
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('BRSR_RussianRoulette');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LW_SAW.Archetypes.WP_SAW_MG";

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "BRMeshPack.Meshes.SM_BR_MG_MagA", , "UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagA");
	Template.AddDefaultAttachment('Mag2', "LWCannon_LS.Meshes.SK_LaserCannon_Stock_A");//, , "img:///UILibrary_LW_LaserPack.LaserCannon_StockA");
	Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA");//, , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagShotgun.Meshes.SM_MagShotgun_StockA");//, , "img:///UILibrary_BRPack.Attach.BR_MG_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA");//, , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");

	Template.iPhysicsImpulse = 5;
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.BRSR_BATTLERIFLE_MAGNETIC_BLACKMARKET_VALUE;
	Template.Requirements.RequiredTechs = default.BRSR_BATTLERIFLE_MAGNETIC_REQUIRED_TECHS;

			for (i = 0; i < default.BRSR_BATTLERIFLE_MAGNETIC_BUILD_COST_TYPE.Length; i++)
			{
				if (default.BRSR_BATTLERIFLE_MAGNETIC_BUILD_COST_QUANTITY[i] > 0)
				{
	Resources.ItemTemplateName = default.BRSR_BATTLERIFLE_MAGNETIC_BUILD_COST_TYPE[i];
	Resources.Quantity = default.BRSR_BATTLERIFLE_MAGNETIC_BUILD_COST_QUANTITY[i];
	Template.Cost.ResourceCosts.AddItem(Resources);
				}
			}

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateTemplate_BRSR_BATTLERIFLE_Coil()
{
	local X2WeaponTemplate Template;
	local ArtifactCost	Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BRSR_BATTLERIFLE_COIL');

	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'coilgun_lw';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_WolfWeaponPack.UI_Coil_Battle_Rifle";  
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 4;

	Template.RangeAccuracy = default.BRSR_BATTLERIFLE_RANGE;
	Template.BaseDamage = default.BRSR_BATTLERIFLE_COIL_BASEDAMAGE;
	Template.Aim = default.BRSR_BATTLERIFLE_COIL_AIM;
	Template.CritChance = default.BRSR_BATTLERIFLE_COIL_CRITCHANCE;
	Template.iClipSize = default.BRSR_BATTLERIFLE_COIL_ICLIPSIZE;
	Template.iSoundRange = default.BRSR_BATTLERIFLE_COIL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BRSR_BATTLERIFLE_COIL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BRSR_BATTLERIFLE_COIL_UPGRADESLOTS; 
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('BRSR_RussianRoulette');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('CoilgunBonusShredAbility');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LWAssaultRifle_CG.Archetypes.WP_AssaultRifle_CG";

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWCannon_CG.Meshes.LW_CoilCannon_MagA");//, ,"img:///UILibrary_LW_Overhaul.InventoryArt.CoilCannon_MagA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB");//, , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_StockA"); 
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA");//, , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_ReargripA"); 
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	Template.iPhysicsImpulse = 5;
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.BRSR_BATTLERIFLE_COIL_BLACKMARKET_VALUE;
	Template.Requirements.RequiredTechs = default.BRSR_BATTLERIFLE_COIL_REQUIRED_TECHS;

			for (i = 0; i < default.BRSR_BATTLERIFLE_COIL_BUILD_COST_TYPE.Length; i++)
			{
				if (default.BRSR_BATTLERIFLE_COIL_BUILD_COST_QUANTITY[i] > 0)
				{
	Resources.ItemTemplateName = default.BRSR_BATTLERIFLE_COIL_BUILD_COST_TYPE[i];
	Resources.Quantity = default.BRSR_BATTLERIFLE_COIL_BUILD_COST_QUANTITY[i];
	Template.Cost.ResourceCosts.AddItem(Resources);
				}
			}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	return Template;
}


defaultproperties
{
	bShouldCreateDifficultyVariants = true
}

static function X2DataTemplate CreateTemplate_BRSR_BATTLERIFLE_Beam()
{
	local X2WeaponTemplate Template;
	local ArtifactCost	Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BRSR_BATTLERIFLE_BEAM');

	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'beam';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_WolfWeaponPack.UI_Beam_Battle_Rifle";  
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = default.BRSR_BATTLERIFLE_RANGE;
	Template.BaseDamage = default.BRSR_BATTLERIFLE_BEAM_BASEDAMAGE;
	Template.Aim = default.BRSR_BATTLERIFLE_BEAM_AIM;
	Template.CritChance = default.BRSR_BATTLERIFLE_BEAM_CRITCHANCE;
	Template.iClipSize = default.BRSR_BATTLERIFLE_BEAM_ICLIPSIZE;
	Template.iSoundRange = default.BRSR_BATTLERIFLE_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BRSR_BATTLERIFLE_BEAM_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BRSR_BATTLERIFLE_BEAM_UPGRADESLOTS; 
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('BRSR_RussianRoulette');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LW_SAW.Archetypes.WP_SAW_BM";

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "BeamCannon.Meshes.SM_BeamCannon_MagA");//, , "img:///UILibrary_Common.UI_BeamCannon.BeamCannon_MagA");
	Template.AddDefaultAttachment('Mag2', "LWCannon_CG.Meshes.LW_CoilCannon_StockA");//, , "img:///UILibrary_LW_Coilguns.CoilCannon_StockA");
	Template.AddDefaultAttachment('Mag3', "LWCannon_CG.Meshes.LW_CoilCannon_StockSupportA");
	Template.AddDefaultAttachment('Suppressor', "LW_SAW.SM_BeamSAW_SuppressorB");//, , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Core', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_CoreA");//, , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_CoreA");
	Template.AddDefaultAttachment('HeatSink', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_HeatSinkA");//, , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_HeatsinkA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");

	Template.iPhysicsImpulse = 5;
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.BRSR_BATTLERIFLE_BEAM_BLACKMARKET_VALUE;
	Template.Requirements.RequiredTechs = default.BRSR_BATTLERIFLE_BEAM_REQUIRED_TECHS;

			for (i = 0; i < default.BRSR_BATTLERIFLE_BEAM_BUILD_COST_TYPE.Length; i++)
			{
				if (default.BRSR_BATTLERIFLE_BEAM_BUILD_COST_QUANTITY[i] > 0)
				{
	Resources.ItemTemplateName = default.BRSR_BATTLERIFLE_BEAM_BUILD_COST_TYPE[i];
	Resources.Quantity = default.BRSR_BATTLERIFLE_BEAM_BUILD_COST_QUANTITY[i];
	Template.Cost.ResourceCosts.AddItem(Resources);
				}
			}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	return Template;
}