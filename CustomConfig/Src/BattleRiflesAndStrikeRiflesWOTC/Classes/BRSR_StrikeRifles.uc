class BRSR_StrikeRifles extends X2Item_DefaultWeapons config(BRSR_StrikeRifles_Options);

// Variables from config - GameData_WeaponData.ini
// ***** Damage arrays for attack actions  *****

var config WeaponDamageValue BRSR_STRIKERIFLE_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue BRSR_STRIKERIFLE_LASER_BASEDAMAGE;
var config WeaponDamageValue BRSR_STRIKERIFLE_MAGNETIC_BASEDAMAGE;
var config WeaponDamageValue BRSR_STRIKERIFLE_COIL_BASEDAMAGE;
var config WeaponDamageValue BRSR_STRIKERIFLE_BEAM_BASEDAMAGE;

var config array<int> BRSR_STRIKERIFLE_RANGE;

// ***** Core properties and variables for weapons *****
var config int BRSR_STRIKERIFLE_CONVENTIONAL_AIM;
var config int BRSR_STRIKERIFLE_CONVENTIONAL_CRITCHANCE;
var config int BRSR_STRIKERIFLE_CONVENTIONAL_ICLIPSIZE;
var config int BRSR_STRIKERIFLE_CONVENTIONAL_ISOUNDRANGE;
var config int BRSR_STRIKERIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int BRSR_STRIKERIFLE_CONVENTIONAL_UPGRADESLOTS;

var config int BRSR_STRIKERIFLE_LASER_AIM;
var config int BRSR_STRIKERIFLE_LASER_CRITCHANCE;
var config int BRSR_STRIKERIFLE_LASER_ICLIPSIZE;
var config int BRSR_STRIKERIFLE_LASER_ISOUNDRANGE;
var config int BRSR_STRIKERIFLE_LASER_IENVIRONMENTDAMAGE;
var config int BRSR_STRIKERIFLE_LASER_UPGRADESLOTS;

var config int BRSR_STRIKERIFLE_LASER_BLACKMARKET_VALUE;
var config array<name> BRSR_STRIKERIFLE_LASER_REQUIRED_TECHS;
var config array<name> BRSR_STRIKERIFLE_LASER_BUILD_COST_TYPE;
var config array<int> BRSR_STRIKERIFLE_LASER_BUILD_COST_QUANTITY;

var config int BRSR_STRIKERIFLE_MAGNETIC_AIM;
var config int BRSR_STRIKERIFLE_MAGNETIC_CRITCHANCE;
var config int BRSR_STRIKERIFLE_MAGNETIC_ICLIPSIZE;
var config int BRSR_STRIKERIFLE_MAGNETIC_ISOUNDRANGE;
var config int BRSR_STRIKERIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
var config int BRSR_STRIKERIFLE_MAGNETIC_UPGRADESLOTS;

var config int BRSR_STRIKERIFLE_MAGNETIC_BLACKMARKET_VALUE;
var config array<name> BRSR_STRIKERIFLE_MAGNETIC_REQUIRED_TECHS;
var config array<name> BRSR_STRIKERIFLE_MAGNETIC_BUILD_COST_TYPE;
var config array<int> BRSR_STRIKERIFLE_MAGNETIC_BUILD_COST_QUANTITY;

var config int BRSR_STRIKERIFLE_COIL_AIM;
var config int BRSR_STRIKERIFLE_COIL_CRITCHANCE;
var config int BRSR_STRIKERIFLE_COIL_ICLIPSIZE;
var config int BRSR_STRIKERIFLE_COIL_ISOUNDRANGE;
var config int BRSR_STRIKERIFLE_COIL_IENVIRONMENTDAMAGE;
var config int BRSR_STRIKERIFLE_COIL_UPGRADESLOTS;

var config int BRSR_STRIKERIFLE_COIL_BLACKMARKET_VALUE;
var config array<name> BRSR_STRIKERIFLE_COIL_REQUIRED_TECHS;
var config array<name> BRSR_STRIKERIFLE_COIL_BUILD_COST_TYPE;
var config array<int> BRSR_STRIKERIFLE_COIL_BUILD_COST_QUANTITY;

var config int BRSR_STRIKERIFLE_BEAM_AIM;
var config int BRSR_STRIKERIFLE_BEAM_CRITCHANCE;
var config int BRSR_STRIKERIFLE_BEAM_ICLIPSIZE;
var config int BRSR_STRIKERIFLE_BEAM_ISOUNDRANGE;
var config int BRSR_STRIKERIFLE_BEAM_IENVIRONMENTDAMAGE;
var config int BRSR_STRIKERIFLE_BEAM_UPGRADESLOTS;

var config int BRSR_STRIKERIFLE_BEAM_BLACKMARKET_VALUE;
var config array<name> BRSR_STRIKERIFLE_BEAM_REQUIRED_TECHS;
var config array<name> BRSR_STRIKERIFLE_BEAM_BUILD_COST_TYPE;
var config array<int> BRSR_STRIKERIFLE_BEAM_BUILD_COST_QUANTITY;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	Weapons.AddItem(CreateTemplate_BRSR_STRIKERIFLE_Conventional());
	Weapons.AddItem(CreateTemplate_BRSR_STRIKERIFLE_Laser());
	Weapons.AddItem(CreateTemplate_BRSR_STRIKERIFLE_Magnetic());
	Weapons.AddItem(CreateTemplate_BRSR_STRIKERIFLE_Coil());
	Weapons.AddItem(CreateTemplate_BRSR_STRIKERIFLE_Beam());
	
	return Weapons;
}

static function X2DataTemplate CreateTemplate_BRSR_STRIKERIFLE_Conventional()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BRSR_STRIKERIFLE_CONVENTIONAL');
	Template.EquipSound = "Conventional_Weapon_Equip";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_BRMeshPack.Base.AR_CV_Long_Base";  
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.Tier = 0;
	Template.iTypicalActionCost = 2;

	Template.RangeAccuracy = default.BRSR_STRIKERIFLE_RANGE;
	Template.BaseDamage = default.BRSR_STRIKERIFLE_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.BRSR_STRIKERIFLE_CONVENTIONAL_AIM;
	Template.CritChance = default.BRSR_STRIKERIFLE_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.BRSR_STRIKERIFLE_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.BRSR_STRIKERIFLE_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BRSR_STRIKERIFLE_CONVENTIONAL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BRSR_STRIKERIFLE_CONVENTIONAL_UPGRADESLOTS; 
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('BRSR_NoScope');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LW_DMR.Archetypes.WP_DMR_CV";

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "ConvSniper.Meshes.SM_ConvSniper_MagA", , "img:///UILibrary_BRPack.Attach.BR_CV_MagA");
	Template.AddDefaultAttachment('Optic', "MagSniper.Meshes.SM_MagSniper_OpticA", , "img:///UILibrary_BRPack.Attach.BR_CV_OpticA");
	Template.AddDefaultAttachment('Reargrip', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_ReargripA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_ReargripA");
	Template.AddDefaultAttachment('Stock', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_StockA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_StockA");
	Template.AddDefaultAttachment('Trigger', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_TriggerA", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight", , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");

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

static function X2DataTemplate CreateTemplate_BRSR_STRIKERIFLE_Laser()
{
	local X2WeaponTemplate Template;
	local ArtifactCost	Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BRSR_STRIKERIFLE_LASER');

	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'laser_lw';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_WolfWeaponPack.UI_Laser_Strike_Rifle";  
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 2;
	Template.iTypicalActionCost = 2;

	Template.RangeAccuracy = default.BRSR_STRIKERIFLE_RANGE;
	Template.BaseDamage = default.BRSR_STRIKERIFLE_LASER_BASEDAMAGE;
	Template.Aim = default.BRSR_STRIKERIFLE_LASER_AIM;
	Template.CritChance = default.BRSR_STRIKERIFLE_LASER_CRITCHANCE;
	Template.iClipSize = default.BRSR_STRIKERIFLE_LASER_ICLIPSIZE;
	Template.iSoundRange = default.BRSR_STRIKERIFLE_LASER_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BRSR_STRIKERIFLE_LASER_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BRSR_STRIKERIFLE_LASER_UPGRADESLOTS; 
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('BRSR_NoScope');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LW_DMR.Archetypes.WP_DMR_LS";

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWAttachments_LS.Meshes.SK_Laser_Mag_A");//, , "img:///UILibrary_LW_LaserPack.LaserRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWAttachments_LS.Meshes.SK_Laser_Stock_A");//, , "img:///UILibrary_LW_LaserPack.LaserRifle_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAttachments_LS.Meshes.SK_Laser_Trigger_A");//, , "img:///UILibrary_LW_LaserPack.LaserRifle_TriggerA");
	Template.AddDefaultAttachment('Foregrip', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_A");//, , "img:///UILibrary_LW_LaserPack.LaserRifle_ForegripA");
	Template.AddDefaultAttachment('Optic', "LWSniperRifle_LS.Meshes.SK_LaserSniper_Optic_A");//, , "img:///UILibrary_BRPack.Attach.BR_LS_OpticA");

	Template.iPhysicsImpulse = 5;
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.BRSR_STRIKERIFLE_LASER_BLACKMARKET_VALUE;
	Template.Requirements.RequiredTechs = default.BRSR_STRIKERIFLE_LASER_REQUIRED_TECHS;

			for (i = 0; i < default.BRSR_STRIKERIFLE_LASER_BUILD_COST_TYPE.Length; i++)
			{
				if (default.BRSR_STRIKERIFLE_LASER_BUILD_COST_QUANTITY[i] > 0)
				{
	Resources.ItemTemplateName = default.BRSR_STRIKERIFLE_LASER_BUILD_COST_TYPE[i];
	Resources.Quantity = default.BRSR_STRIKERIFLE_LASER_BUILD_COST_QUANTITY[i];
	Template.Cost.ResourceCosts.AddItem(Resources);
				}
			}

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateTemplate_BRSR_STRIKERIFLE_Magnetic()
{
	local X2WeaponTemplate Template;
	local ArtifactCost	Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BRSR_STRIKERIFLE_MAGNETIC');

	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'magnetic';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_WolfWeaponPack.UI_Mag_Strike_Rifle";  
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 3;
	Template.iTypicalActionCost = 2;

	Template.RangeAccuracy = default.BRSR_STRIKERIFLE_RANGE;
	Template.BaseDamage = default.BRSR_STRIKERIFLE_MAGNETIC_BASEDAMAGE;
	Template.Aim = default.BRSR_STRIKERIFLE_MAGNETIC_AIM;
	Template.CritChance = default.BRSR_STRIKERIFLE_MAGNETIC_CRITCHANCE;
	Template.iClipSize = default.BRSR_STRIKERIFLE_MAGNETIC_ICLIPSIZE;
	Template.iSoundRange = default.BRSR_STRIKERIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BRSR_STRIKERIFLE_MAGNETIC_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BRSR_STRIKERIFLE_MAGNETIC_UPGRADESLOTS; 
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('BRSR_NoScope');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LW_DMR.Archetypes.WP_DMR_MG";

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagA");//, , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_MagA");
	Template.AddDefaultAttachment('Optic', "MagSniper.Meshes.SM_MagSniper_OpticA");//, , "img:///UILibrary_BRPack.Attach.BR_MG_OpticA");
	Template.AddDefaultAttachment('Suppressor', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorA");//, , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Reargrip', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_ReargripA", , /* included with TriggerA */);
	Template.AddDefaultAttachment('Stock', "MagSniper.Meshes.SM_MagSniper_StockA");//, , "img:///UILibrary_BRPack.Attach.MR_MG_StockA");
	Template.AddDefaultAttachment('Trigger', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_TriggerA");//, , "img:///UILibrary_Common.UI_MagAssaultRifle.MagAssaultRifle_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.BRSR_STRIKERIFLE_MAGNETIC_BLACKMARKET_VALUE;
	Template.Requirements.RequiredTechs = default.BRSR_STRIKERIFLE_MAGNETIC_REQUIRED_TECHS;

			for (i = 0; i < default.BRSR_STRIKERIFLE_MAGNETIC_BUILD_COST_TYPE.Length; i++)
			{
				if (default.BRSR_STRIKERIFLE_MAGNETIC_BUILD_COST_QUANTITY[i] > 0)
				{
	Resources.ItemTemplateName = default.BRSR_STRIKERIFLE_MAGNETIC_BUILD_COST_TYPE[i];
	Resources.Quantity = default.BRSR_STRIKERIFLE_MAGNETIC_BUILD_COST_QUANTITY[i];
	Template.Cost.ResourceCosts.AddItem(Resources);
				}
			}

	Template.DamageTypeTemplateName = 'Projectile_MagXCom';

	return Template;
}

static function X2DataTemplate CreateTemplate_BRSR_STRIKERIFLE_Coil()
{
	local X2WeaponTemplate Template;
	local ArtifactCost	Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BRSR_STRIKERIFLE_COIL');

	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'coilgun_lw';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_WolfWeaponPack.UI_Coil_Strike_Rifle";  
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Magnetic_Weapon_Equip";
	Template.Tier = 4;
	Template.iTypicalActionCost = 2;

	Template.RangeAccuracy = default.BRSR_STRIKERIFLE_RANGE;
	Template.BaseDamage = default.BRSR_STRIKERIFLE_COIL_BASEDAMAGE;
	Template.Aim = default.BRSR_STRIKERIFLE_COIL_AIM;
	Template.CritChance = default.BRSR_STRIKERIFLE_COIL_CRITCHANCE;
	Template.iClipSize = default.BRSR_STRIKERIFLE_COIL_ICLIPSIZE;
	Template.iSoundRange = default.BRSR_STRIKERIFLE_COIL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BRSR_STRIKERIFLE_COIL_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BRSR_STRIKERIFLE_COIL_UPGRADESLOTS; 
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('BRSR_NoScope');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	Template.Abilities.AddItem('CoilgunBonusShredAbility');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LW_DMR.Archetypes.WP_DMR_CG";

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagA");//, , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_MagA");
	Template.AddDefaultAttachment('Stock', "LWAccessories_CG.Meshes.LW_Coil_StockB");//, , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_StockA");
	Template.AddDefaultAttachment('Reargrip', "LWAccessories_CG.Meshes.LW_Coil_ReargripA");//, , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilRifle_ReargripA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight"); //);//, , "img:///UILibrary_Common.ConvAssaultRifle.ConvAssault_LightA");  // re-use common conventional flashlight
	Template.AddDefaultAttachment('Optic', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_OpticC");//, , "img:///UILibrary_LW_Overhaul.InventoryArt.CoilSniperRifle_OpticA");

	Template.iPhysicsImpulse = 5;
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.BRSR_STRIKERIFLE_COIL_BLACKMARKET_VALUE;
	Template.Requirements.RequiredTechs = default.BRSR_STRIKERIFLE_COIL_REQUIRED_TECHS;

			for (i = 0; i < default.BRSR_STRIKERIFLE_COIL_BUILD_COST_TYPE.Length; i++)
			{
				if (default.BRSR_STRIKERIFLE_COIL_BUILD_COST_QUANTITY[i] > 0)
				{
	Resources.ItemTemplateName = default.BRSR_STRIKERIFLE_COIL_BUILD_COST_TYPE[i];
	Resources.Quantity = default.BRSR_STRIKERIFLE_COIL_BUILD_COST_QUANTITY[i];
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

static function X2DataTemplate CreateTemplate_BRSR_STRIKERIFLE_Beam()
{
	local X2WeaponTemplate Template;
	local ArtifactCost	Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'BRSR_STRIKERIFLE_BEAM');

	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'beam';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///UILibrary_WolfWeaponPack.UI_Beam_Strike_Rifle";  
	Template.WeaponPanelImage = "_MagneticRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = "Beam_Weapon_Equip";
	Template.Tier = 5;
	Template.iTypicalActionCost = 2;

	Template.RangeAccuracy = default.BRSR_STRIKERIFLE_RANGE;
	Template.BaseDamage = default.BRSR_STRIKERIFLE_BEAM_BASEDAMAGE;
	Template.Aim = default.BRSR_STRIKERIFLE_BEAM_AIM;
	Template.CritChance = default.BRSR_STRIKERIFLE_BEAM_CRITCHANCE;
	Template.iClipSize = default.BRSR_STRIKERIFLE_BEAM_ICLIPSIZE;
	Template.iSoundRange = default.BRSR_STRIKERIFLE_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.BRSR_STRIKERIFLE_BEAM_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = default.BRSR_STRIKERIFLE_BEAM_UPGRADESLOTS; 
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('BRSR_NoScope');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "LW_DMR.Archetypes.WP_DMR_BM";

	//Parameters are : 	AttachSocket, UIArmoryCameraPointTag, MeshName, ProjectileName, MatchWeaponTemplate, AttachToPawn, IconName, InventoryIconName, InventoryCategoryIcon, ValidateAttachmentFn
	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.AddDefaultAttachment('Mag', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagA");//, , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_MagA");
	Template.AddDefaultAttachment('Optic', "BeamSniper.Meshes.SM_BeamSniper_OpticA");//, , "img:///UILibrary_BRPack.Attach.BR_BM_OpticA");
	Template.AddDefaultAttachment('Suppressor', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorA");//, , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_SupressorA");
	Template.AddDefaultAttachment('Core', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_CoreA");//, , "img:///UILibrary_Common.UI_BeamAssaultRifle.BeamAssaultRifle_CoreA");
	Template.AddDefaultAttachment('HeatSink', "BeamSniper.Meshes.SM_BeamSniper_HeatSinkA");//, , "img:///UILibrary_Common.UI_BeamSniper.BeamSniper_HeatSinkA");
	Template.AddDefaultAttachment('Light', "BeamAttachments.Meshes.BeamFlashLight");
	Template.iPhysicsImpulse = 5;
	
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = default.BRSR_STRIKERIFLE_BEAM_BLACKMARKET_VALUE;
	Template.Requirements.RequiredTechs = default.BRSR_STRIKERIFLE_BEAM_REQUIRED_TECHS;

			for (i = 0; i < default.BRSR_STRIKERIFLE_BEAM_BUILD_COST_TYPE.Length; i++)
			{
				if (default.BRSR_STRIKERIFLE_BEAM_BUILD_COST_QUANTITY[i] > 0)
				{
	Resources.ItemTemplateName = default.BRSR_STRIKERIFLE_BEAM_BUILD_COST_TYPE[i];
	Resources.Quantity = default.BRSR_STRIKERIFLE_BEAM_BUILD_COST_QUANTITY[i];
	Template.Cost.ResourceCosts.AddItem(Resources);
				}
			}

	Template.DamageTypeTemplateName = 'Projectile_BeamXCom';

	return Template;
}