//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_BattleRiflesAndStrikeRiflesLWOTC.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_BattleRiflesAndStrikeRiflesWOTC extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}

// Don't need the stuff below anymore since the problem I was having with WSR went away by itself, but leaving it here just in case even though it didn't really do what it was supposed to

//static event OnPostTemplatesCreated()
//{   
//    local X2ItemTemplateManager ItemTemplateManager;

//    ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

//    UpdateMods(ItemTemplateManager);
//}

//static function UpdateMods(X2ItemTemplateManager ItemTemplateManager) 
//{

	// Battle Rifles

	// Heavy Barrels

  //  AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Bsc', 'Barrel', '', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'BRSR_BATTLERIFLE_Conventional', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
  //  AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Adv', 'Barrel', '', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'BRSR_BATTLERIFLE_Conventional', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
  //  AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Sup', 'Barrel', '', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'BRSR_BATTLERIFLE_Conventional', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

  //  AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Bsc', 'Barrel', '', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Suppressor", "", 'BRSR_BATTLERIFLE_Laser', , "", "img:///UILibraryLW_LaserPack.Inv_LaserRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
  //  AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Adv', 'Barrel', '', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Suppressor", "", 'BRSR_BATTLERIFLE_Laser', , "", "img:///UILibraryLW_LaserPack.Inv_LaserRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
  //  AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Sup', 'Barrel', '', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Suppressor", "", 'BRSR_BATTLERIFLE_Laser', , "", "img:///UILibraryLW_LaserPack.Inv_LaserRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

//	AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Bsc', 'Barrel', '', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorB", "", 'BRSR_BATTLERIFLE_Magnetic', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
 //   AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Adv', 'Barrel', '', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorB", "", 'BRSR_BATTLERIFLE_Magnetic', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
 //   AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Sup', 'Barrel', '', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorB", "", 'BRSR_BATTLERIFLE_Magnetic', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

//	AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Bsc', 'Barrel', '', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_Silencer", "", 'BRSR_BATTLERIFLE_Coil', , "", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMG_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
//    AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Adv', 'Barrel', '', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_Silencer", "", 'BRSR_BATTLERIFLE_Coil', , "", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMG_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
 //   AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Sup', 'Barrel', '', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_Silencer", "", 'BRSR_BATTLERIFLE_Coil', , "", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMG_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

//	AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Bsc', 'Barrel', '', "LW_SAW.SM_BeamSAW_SuppressorC", "", 'BRSR_BATTLERIFLE_Beam', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
//    AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Adv', 'Barrel', '', "LW_SAW.SM_BeamSAW_SuppressorC", "", 'BRSR_BATTLERIFLE_Beam', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
//    AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Sup', 'Barrel', '', "LW_SAW.SM_BeamSAW_SuppressorC", "", 'BRSR_BATTLERIFLE_Beam', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Speed Loaders

//	AddUpgrade(ItemTemplateManager, 'IRI_SpeedLoader_Upgrade', 'Mag', '', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagC", "", 'BRSR_BATTLERIFLE_Conventional', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssaultRifle_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_SpeedLoader_Upgrade', 'Foregrip', '', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_B", "", 'BRSR_BATTLERIFLE_Laser', , "", "img:///UILibraryLW_LaserPack.Inv_Laser_ForegripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_SpeedLoader_Upgrade', 'Mag', '', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagC", "", 'BRSR_BATTLERIFLE_Magnetic', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_SpeedLoader_Upgrade', 'Mag', '', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagC", "", 'BRSR_BATTLERIFLE_Coil', , "", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilSniper_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_SpeedLoader_Upgrade', 'AutoLoader', '', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagC", "", 'BRSR_BATTLERIFLE_Beam', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_AutoLoader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Experimental Magazines

//	AddUpgrade(ItemTemplateManager, 'IRI_ExperimentalMagazine_Upgrade', 'Mag', '', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_MagB", "", 'BRSR_BATTLERIFLE_Conventional', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_ExperimentalMagazine_Upgrade', 'Mag', '', "LWCannon_LS.Meshes.SK_LaserCannon_Mag_B", "", 'BRSR_BATTLERIFLE_Laser', , "", "img:///UILibrary_LW_LaserPack.Inv_Laser_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_ExperimentalMagazine_Upgrade', 'Mag', '', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagB", "", 'BRSR_BATTLERIFLE_Magnetic', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_ExperimentalMagazine_Upgrade', 'Mag', '', "LWCannon_CG.Meshes.LW_CoilCannon_MagB", "", 'BRSR_BATTLERIFLE_Coil', , "", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilCannon_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_ExperimentalMagazine_Upgrade', 'Mag', '', "BeamCannon.Meshes.SM_BeamCannon_MagA", "", 'BRSR_BATTLERIFLE_Beam', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Strike Rifles

	// Heavy Barrels

 //   AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Bsc', 'Barrel', '', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'BRSR_STRIKERIFLE_Conventional', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
 //   AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Adv', 'Barrel', '', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'BRSR_STRIKERIFLE_Conventional', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
 //   AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Sup', 'Barrel', '', "ConvAssaultRifle.Meshes.SM_ConvAssaultRifle_SuppressorB", "", 'BRSR_STRIKERIFLE_Conventional', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssault_SuppressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

//	AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Bsc', 'Barrel', '', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Suppressor", "", 'BRSR_STRIKERIFLE_Laser', , "", "img:///UILibraryLW_LaserPack.Inv_LaserRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
 //   AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Adv', 'Barrel', '', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Suppressor", "", 'BRSR_STRIKERIFLE_Laser', , "", "img:///UILibraryLW_LaserPack.Inv_LaserRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
 //   AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Sup', 'Barrel', '', "LWAssaultRifle_LS.Meshes.SK_LaserRifle_Suppressor", "", 'BRSR_STRIKERIFLE_Laser', , "", "img:///UILibraryLW_LaserPack.Inv_LaserRifle_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

//	AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Bsc', 'Barrel', '', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorB", "", 'BRSR_STRIKERIFLE_Magnetic', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
 //   AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Adv', 'Barrel', '', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorB", "", 'BRSR_STRIKERIFLE_Magnetic', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
//    AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Sup', 'Barrel', '', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_SuppressorB", "", 'BRSR_STRIKERIFLE_Magnetic', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

//	AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Bsc', 'Barrel', '', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_Silencer", "", 'BRSR_STRIKERIFLE_Coil', , "", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMG_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
//    AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Adv', 'Barrel', '', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_Silencer", "", 'BRSR_STRIKERIFLE_Coil', , "", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMG_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
//    AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Sup', 'Barrel', '', "LWAssaultRifle_CG.Meshes.LW_CoilRifle_Silencer", "", 'BRSR_STRIKERIFLE_Coil', , "", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilRifleSMG_Suppressor", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

//	AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Bsc', 'Barrel', '', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorB", "", 'BRSR_STRIKERIFLE_Beam', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
 //   AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Adv', 'Barrel', '', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorB", "", 'BRSR_STRIKERIFLE_Beam', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");
 //   AddUpgrade(ItemTemplateManager, 'SNHeavyBarrel_Sup', 'Barrel', '', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_SuppressorB", "", 'BRSR_STRIKERIFLE_Beam', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_SupressorB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_barrel");

	// Speed Loaders

//	AddUpgrade(ItemTemplateManager, 'IRI_SpeedLoader_Upgrade', 'Mag', '', "ConvSniper.Meshes.SM_ConvSniper_MagC", "", 'BRSR_BATTLERIFLE_Conventional', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvAssaultRifle_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_SpeedLoader_Upgrade', 'Foregrip', '', "LWAttachments_LS.Meshes.SK_Laser_Foregrip_B", "", 'BRSR_BATTLERIFLE_Laser', , "", "img:///UILibraryLW_LaserPack.Inv_Laser_ForegripB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_SpeedLoader_Upgrade', 'Mag', '', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagC", "", 'BRSR_BATTLERIFLE_Magnetic', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagC_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_SpeedLoader_Upgrade', 'Mag', '', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagC", "", 'BRSR_BATTLERIFLE_Coil', , "", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilSniper_MagC", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_SpeedLoader_Upgrade', 'AutoLoader', '', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagC", "", 'BRSR_BATTLERIFLE_Beam', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_AutoLoader_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

	// Experimental Magazines

//	AddUpgrade(ItemTemplateManager, 'IRI_ExperimentalMagazine_Upgrade', 'Mag', '', "ConvSniper.Meshes.SM_ConvSniper_MagB", "", 'BRSR_BATTLERIFLE_Conventional', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.ConvSniper_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_ExperimentalMagazine_Upgrade', 'Mag', '', "LWAttachments_LS.Meshes.SK_Laser_Mag_B", "", 'BRSR_BATTLERIFLE_Laser', , "", "img:///UILibrary_LW_LaserPack.Inv_Laser_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_ExperimentalMagazine_Upgrade', 'Mag', '', "MagAssaultRifle.Meshes.SM_MagAssaultRifle_MagB", "", 'BRSR_BATTLERIFLE_Magnetic', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.MagAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_ExperimentalMagazine_Upgrade', 'Mag', '', "LWSniperRifle_CG.Meshes.LW_CoilSniper_MagB", "", 'BRSR_BATTLERIFLE_Coil', , "", "img:///UILibrary_LW_Overhaul.InventoryArt.Inv_CoilSniperRifle_MagB", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");

//	AddUpgrade(ItemTemplateManager, 'IRI_ExperimentalMagazine_Upgrade', 'Mag', '', "BeamAssaultRifle.Meshes.SM_BeamAssaultRifle_MagB", "", 'BRSR_BATTLERIFLE_Beam', , "", "img:///UILibrary_StrategyImages.X2InventoryIcons.BeamAssaultRifle_MagB_inv", "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_weaponIcon_clip");
//}

//static function AddUpgrade(X2ItemTemplateManager ItemTemplateManager, Name UpgradeTemplateName, name Socket, name UIPawnLocation, string Mesh, string Projectile, name WeaponTemplateName, optional bool bAttachToPawn, optional string GreenIcon, optional string InventoryIcon, optional string SmallIcon)
//{
//    local X2WeaponUpgradeTemplate Template;

 //   Template = X2WeaponUpgradeTemplate(ItemTemplateManager.FindItemTemplate(UpgradeTemplateName));

//    Template.AddUpgradeAttachment(Socket, UIPawnLocation, Mesh, Projectile, WeaponTemplateName, bAttachToPawn, GreenIcon, InventoryIcon, SmallIcon);
//}