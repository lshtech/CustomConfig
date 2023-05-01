class WIO_X2StrategyElement_Breakthroughs extends X2StrategyElement_XpackTechs config(GameData);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	Techs.AddItem(CreateBreakthroughCoilWeaponDamageTemplate());
	Techs.AddItem(CreateBreakthroughLaserWeaponDamageTemplate());
	Techs.AddItem(CreateBreakthroughMedikitBonusTemplate());
	Techs.AddItem(CreateBreakthroughNanoMedikitBonusTemplate());

	Techs.AddItem(CreateBreakthroughLightArmorBonusTemplate());
	Techs.AddItem(CreateBreakthroughMediumArmorBonusTemplate());
	Techs.AddItem(CreateBreakthroughHeavyArmorBonusTemplate());

	Techs.AddItem(CreateBreakthroughSparkArmorBonusTemplate());
	Techs.AddItem(CreateBreakthroughReaperArmorBonusTemplate());
	Techs.AddItem(CreateBreakthroughSkirmisherArmorBonusTemplate());
	Techs.AddItem(CreateBreakthroughTemplarArmorBonusTemplate());

	Techs.AddItem(CreateBreakthroughConventionalArmorBonusTemplate());
	Techs.AddItem(CreateBreakthroughPlatedArmorBonusTemplate());
	Techs.AddItem(CreateBreakthroughPoweredArmorBonusTemplate());

	// T1 & T2 Bridge Techs and T3 Mastery Tech
	Techs.AddItem(WOTC_APA_AlloyIntegration());
	Techs.AddItem(WOTC_APA_EleriumIntegration());
	Techs.AddItem(WOTC_APA_PlasmaIntegration());

	// Armor Tech-level Breakthroughs
	Techs.AddItem(WOTC_APA_KevlarArmorBreakthrough());
	Techs.AddItem(WOTC_APA_PlatedArmorBreakthrough());
	Techs.AddItem(WOTC_APA_PoweredArmorBreakthrough());

	// Weapon Tech-level Breakthroughs
	Techs.AddItem(WOTC_APA_CVWeaponBreakthrough());
	Techs.AddItem(WOTC_APA_MGWeaponBreakthrough());
	Techs.AddItem(WOTC_APA_BMWeaponBreakthrough());

	Techs.AddItem(CreateBreakthroughMedikitBonusTemplate());
	Techs.AddItem(CreateBreakthroughNanoMedikitBonusTemplate());
	Techs.AddItem(CreateBreakthroughSparkRifleDamageTemplate());
	Techs.AddItem(CreateBreakthroughSparkRifleWeaponUpgradeTemplate());
	//Techs.AddItem(CreateBreakthroughClaymoreDamageTemplate());
	Techs.AddItem(CreateBreakthroughWristBladeDamageTemplate());
	Techs.AddItem(CreateBreakthroughGauntletDamageTemplate());
	Techs.AddItem(CreateBreakthroughGrenadeDamageTemplate());
	Techs.AddItem(CreateBreakthroughHeavyDamageTemplate());
	
	return Techs;
}

static function X2DataTemplate CreateBreakthroughCoilWeaponDamageTemplate()
{
	local X2TechTemplate Template;
	local X2BreakthroughCondition_WeaponTech TechCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughCoilWeaponDamage');
	Template.strImage = "img:///UILibrary_XPACK_Common.BT_dmgmag";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.UnavailableIfResearched = 'PlasmaRifle';

	TechCondition = new class'X2BreakthroughCondition_WeaponTech';
	TechCondition.WeaponTechMatch = 'coil';
	Template.BreakthroughCondition = TechCondition;

	Template.RewardName = 'WeaponTechBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughLaserWeaponDamageTemplate()
{
	local X2TechTemplate Template;
	local X2BreakthroughCondition_WeaponTech TechCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughLaserWeaponDamage');
	Template.strImage = "img:///UILibrary_XPACK_Common.BT_dmgplas";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredTechs.AddItem('LaserWeaponsTech_LW');
    Template.UnavailableIfResearched = 'PlasmaRifle';

	TechCondition = new class'X2BreakthroughCondition_WeaponTech';
	TechCondition.WeaponTechMatch = 'laser';
	Template.BreakthroughCondition = TechCondition;

	Template.RewardName = 'WeaponTechBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughLightArmorBonusTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_ArmorClasses ArmorTypeCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughLightArmorBonus');
	Template.strImage = "img:///UILibrary_XPACK_Common.BT_armorlight";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');

	ArmorTypeCondition = new class'WIO_X2BreakthroughCondition_ArmorClasses';
	ArmorTypeCondition.ArmorTypeMatch.AddItem('light');
	Template.BreakthroughCondition = ArmorTypeCondition;

	Template.RewardName = 'LightArmorTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughMediumArmorBonusTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_ArmorClasses ArmorTypeCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughMediumArmorBonus');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_armormedium";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');

	ArmorTypeCondition = new class'WIO_X2BreakthroughCondition_ArmorClasses';
	ArmorTypeCondition.ArmorTypeMatch.AddItem('medium');
	ArmorTypeCondition.ArmorTypeMatch.AddItem('basic');
	Template.BreakthroughCondition = ArmorTypeCondition;

	Template.RewardName = 'MediumArmorTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughHeavyArmorBonusTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_ArmorClasses ArmorTypeCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughHeavyArmorBonus');
	Template.strImage = "img:///UILibrary_XPACK_Common.BT_armorheavy";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');

	ArmorTypeCondition = new class'WIO_X2BreakthroughCondition_ArmorClasses';
	ArmorTypeCondition.ArmorTypeMatch.AddItem('heavy');
	Template.BreakthroughCondition = ArmorTypeCondition;

	Template.RewardName = 'HeavyArmorTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughSparkArmorBonusTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_ArmorCats ArmorCatCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughSparkArmorBonus');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_armorspark";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredSoldierClass = 'Spark';

	ArmorCatCondition = new class'WIO_X2BreakthroughCondition_ArmorCats';
	ArmorCatCondition.ArmorTypeMatch.AddItem('spark');
	Template.BreakthroughCondition = ArmorCatCondition;

	Template.RewardName = 'SparkArmorTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughReaperArmorBonusTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_ArmorCats ArmorCatCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughReaperArmorBonus');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_armorreaper";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredSoldierClass = 'Reaper';

	ArmorCatCondition = new class'WIO_X2BreakthroughCondition_ArmorCats';
	ArmorCatCondition.ArmorTypeMatch.AddItem('reaper');
	Template.BreakthroughCondition = ArmorCatCondition;

	Template.RewardName = 'ReaperArmorTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughSkirmisherArmorBonusTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_ArmorCats ArmorCatCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughSkirmisherArmorBonus');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_armorskirmisher";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredSoldierClass = 'Skirmisher';

	ArmorCatCondition = new class'WIO_X2BreakthroughCondition_ArmorCats';
	ArmorCatCondition.ArmorTypeMatch.AddItem('skirmisher');
	Template.BreakthroughCondition = ArmorCatCondition;

	Template.RewardName = 'SkirmisherArmorTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughTemplarArmorBonusTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_ArmorCats ArmorCatCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughTemplarArmorBonus');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_armortemplar";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredSoldierClass = 'Templar';

	ArmorCatCondition = new class'WIO_X2BreakthroughCondition_ArmorCats';
	ArmorCatCondition.ArmorTypeMatch.AddItem('templar');
	Template.BreakthroughCondition = ArmorCatCondition;

	Template.RewardName = 'TemplarArmorTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughConventionalArmorBonusTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_ArmorTechs ArmorTechCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughConventionalArmorBonus');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_armorconventional";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.UnavailableIfResearched = 'PlatedArmor';

	ArmorTechCondition = new class'WIO_X2BreakthroughCondition_ArmorTechs';
	ArmorTechCondition.ArmorTypeMatch.AddItem('conventional');
	Template.BreakthroughCondition = ArmorTechCondition;

	Template.RewardName = 'ConventionalArmorTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughPlatedArmorBonusTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_ArmorTechs ArmorTechCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughPlatedArmorBonus');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_armorplated";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredTechs.AddItem('PlatedArmor');
	Template.UnavailableIfResearched = 'PoweredArmor';

	ArmorTechCondition = new class'WIO_X2BreakthroughCondition_ArmorTechs';
	ArmorTechCondition.ArmorTypeMatch.AddItem('plated');
	Template.BreakthroughCondition = ArmorTechCondition;

	Template.RewardName = 'PlatedArmorTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughPoweredArmorBonusTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_ArmorTechs ArmorTechCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughPoweredArmorBonus');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_armorpowered";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredTechs.AddItem('PoweredArmor');

	ArmorTechCondition = new class'WIO_X2BreakthroughCondition_ArmorTechs';
	ArmorTechCondition.ArmorTypeMatch.AddItem('powered');
	Template.BreakthroughCondition = ArmorTechCondition;

	Template.RewardName = 'PoweredArmorTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughMedikitBonusTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_Medikit TechCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughMedikitBonus');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Medkit";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	TechCondition = new class'WIO_X2BreakthroughCondition_Medikit';
	Template.BreakthroughCondition = TechCondition;

	Template.RewardName = 'MedikitBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughNanoMedikitBonusTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_Medikit TechCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughNanoMedikitBonus');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Medkit";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughMedikitBonus');
	Template.Requirements.RequiredTechs.AddItem('BattlefieldMedicine');

	TechCondition = new class'WIO_X2BreakthroughCondition_Medikit';
	Template.BreakthroughCondition = TechCondition;

	Template.RewardName = 'MedikitBreakthroughBonus';

	return Template;
}

// T1 Bridge Tech
static function X2DataTemplate WOTC_APA_AlloyIntegration()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'WOTC_APA_AlloyIntegration');
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_Magnetized_Weapons";
	Template.SortingTier = 1;
	Template.ResearchCompletedFn = WOTC_APA_AlloyIntegrationCompleted;
	Template.Requirements.RequiredTechs.AddItem('ModularWeapons');
	Template.Requirements.RequiredTechs.AddItem('HybridMaterials');
	Template.Requirements.RequiredTechs.AddItem('ResistanceCommunications');
	return Template;
}

function WOTC_APA_AlloyIntegrationCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameState_HeadquartersXCom XComHQ;

	XComHQ = XComGameState_HeadquartersXCom( `XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom') );
	XComHQ = XComGameState_HeadquartersXCom( NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID) );
	GiveBreakthrough('WOTC_APA_KevlarArmorBreakthrough' ,NewGameState, XComHQ);
	GiveBreakthrough('WOTC_APA_CVWeaponBreakthrough' ,NewGameState, XComHQ);
}


// T2 Bridge Tech
static function X2DataTemplate WOTC_APA_EleriumIntegration()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'WOTC_APA_EleriumIntegration');
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_Magnetized_Weapons";
	Template.SortingTier = 1;
	Template.ResearchCompletedFn = WOTC_APA_EleriumIntegrationCompleted;
	Template.Requirements.RequiredTechs.AddItem('Tech_Elerium');
	Template.Requirements.RequiredTechs.AddItem('PlatedArmor');
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredTechs.AddItem('GaussWeapons');
	Template.Requirements.RequiredTechs.AddItem('AlienEncryption');
	// All requirements are setup via config
	return Template;
}

function WOTC_APA_EleriumIntegrationCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameState_HeadquartersXCom XComHQ;

	XComHQ = XComGameState_HeadquartersXCom( `XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom') );
	XComHQ = XComGameState_HeadquartersXCom( NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID) );
	GiveBreakthrough('WOTC_APA_PlatedArmorBreakthrough' ,NewGameState, XComHQ);
	GiveBreakthrough('WOTC_APA_MGWeaponBreakthrough' ,NewGameState, XComHQ);
}

// T3 Mastery Tech
static function X2DataTemplate WOTC_APA_PlasmaIntegration()
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'WOTC_APA_PlasmaIntegration');
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_Magnetized_Weapons";
	Template.SortingTier = 1;
	Template.ResearchCompletedFn = WOTC_APA_PlasmaIntegrationCompleted;
	Template.Requirements.RequiredTechs.AddItem('PoweredArmor');
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');
	Template.Requirements.RequiredTechs.AddItem('PlasmaSniper');
	Template.Requirements.RequiredTechs.AddItem('HeavyPlasma');
	Template.Requirements.RequiredTechs.AddItem('AlloyCannon');
	Template.Requirements.RequiredTechs.AddItem('CodexBrainPt1');
	// All requirements are setup via config
	return Template;
}

function WOTC_APA_PlasmaIntegrationCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameState_HeadquartersXCom XComHQ;

	XComHQ = XComGameState_HeadquartersXCom( `XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom') );
	XComHQ = XComGameState_HeadquartersXCom( NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID) );
	GiveBreakthrough('WOTC_APA_PoweredArmorBreakthrough' ,NewGameState, XComHQ);
	GiveBreakthrough('WOTC_APA_BMWeaponBreakthrough' ,NewGameState, XComHQ);
}

function GiveBreakthrough(name TechName, XComGameState NewGameState, XComGameState_HeadquartersXCom XComHQ)
{
	local XComGameStateHistory History;
	local XComGameState_Tech TechState;

	History = `XCOMHISTORY;

	foreach History.IterateByClassType(class'XComGameState_Tech', TechState)
	{
		if(TechState.GetMyTemplateName() == TechName)
		{
			TechState = XComGameState_Tech(NewGameState.ModifyStateObject(class'XComGameState_Tech', TechState.ObjectID));
			TechState.TimesResearched++;
			XComHQ.TechsResearched.AddItem(TechState.GetReference());
			TechState.bSeenResearchCompleteScreen = true;

			if(TechState.GetMyTemplate().ResearchCompletedFn != none)
			{
				TechState.GetMyTemplate().ResearchCompletedFn(NewGameState, TechState);
			}

			`XEVENTMGR.TriggerEvent('ResearchCompleted', TechState, TechState, NewGameState);
			break;
		}
	}
}

// Armor Breakthroughs - these will be unavailable and only granted through the Bridge Techs
static function X2DataTemplate WOTC_APA_KevlarArmorBreakthrough()
{
	local X2TechTemplate								Template;
	local WIO_X2BreakthroughCondition_ArmorTechs		ArmorCondition;

	Template = CreateBreakthroughTechTemplate('WOTC_APA_KevlarArmorBreakthrough');
	Template.strImage = "img:///UILibrary_XPACK_Common.BT_armorlight";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;
	
	Template.Requirements.RequiredEngineeringScore = 99999;
	Template.Requirements.RequiredScienceScore = 99999;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = false;

	ArmorCondition = new class'WIO_X2BreakthroughCondition_ArmorTechs';
	ArmorCondition.ArmorTypeMatch.AddItem('conventional');
	Template.BreakthroughCondition = ArmorCondition;

	Template.RewardName = 'ArmorTechBreakthroughBonus';

	return Template;
}

static function X2DataTemplate WOTC_APA_PlatedArmorBreakthrough()
{
	local X2TechTemplate								Template;
	local WIO_X2BreakthroughCondition_ArmorTechs		ArmorCondition;

	Template = CreateBreakthroughTechTemplate('WOTC_APA_PlatedArmorBreakthrough');
	Template.strImage = "img:///UILibrary_XPACK_Common.BT_armorheavy";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;
	
	Template.Requirements.RequiredEngineeringScore = 99999;
	Template.Requirements.RequiredScienceScore = 99999;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = false;

	ArmorCondition = new class'WIO_X2BreakthroughCondition_ArmorTechs';
	ArmorCondition.ArmorTypeMatch.AddItem('plated');
	Template.BreakthroughCondition = ArmorCondition;

	Template.RewardName = 'ArmorTechBreakthroughBonus';

	return Template;
}

static function X2DataTemplate WOTC_APA_PoweredArmorBreakthrough()
{
	local X2TechTemplate								Template;
	local WIO_X2BreakthroughCondition_ArmorTechs		ArmorCondition;

	Template = CreateBreakthroughTechTemplate('WOTC_APA_PoweredArmorBreakthrough');
	Template.strImage = "img:///UILibrary_XPACK_Common.BT_armorheavy";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;
	
	Template.Requirements.RequiredEngineeringScore = 99999;
	Template.Requirements.RequiredScienceScore = 99999;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = false;

	ArmorCondition = new class'WIO_X2BreakthroughCondition_ArmorTechs';
	ArmorCondition.ArmorTypeMatch.AddItem('powered');
	Template.BreakthroughCondition = ArmorCondition;

	Template.RewardName = 'ArmorTechBreakthroughBonus';

	return Template;
}

static function X2DataTemplate WOTC_APA_CVWeaponBreakthrough()
{
	local X2TechTemplate								Template;
	local WIO_X2BreakthroughCondition_WeaponTechs		WeaponCondition;

	Template = CreateBreakthroughTechTemplate('WOTC_APA_CVWeaponBreakthrough');
	Template.strImage = "img:///UILibrary_XPACK_Common.BT_dmgconv";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;
	
	Template.Requirements.RequiredEngineeringScore = 99999;
	Template.Requirements.RequiredScienceScore = 99999;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = false;

	WeaponCondition = new class'WIO_X2BreakthroughCondition_WeaponTechs';
	WeaponCondition.WeaponTypeMatch.AddItem('conventional');
	Template.BreakthroughCondition = WeaponCondition;

	Template.RewardName = 'WeaponTechBreakthroughBonus';

	return Template;
}

static function X2DataTemplate WOTC_APA_MGWeaponBreakthrough()
{
	local X2TechTemplate								Template;
	local WIO_X2BreakthroughCondition_WeaponTechs		WeaponCondition;

	Template = CreateBreakthroughTechTemplate('WOTC_APA_MGWeaponBreakthrough');
	Template.strImage = "img:///UILibrary_XPACK_Common.BT_dmgmag";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;
	
	Template.Requirements.RequiredEngineeringScore = 99999;
	Template.Requirements.RequiredScienceScore = 99999;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = false;

	WeaponCondition = new class'WIO_X2BreakthroughCondition_WeaponTechs';
	WeaponCondition.WeaponTypeMatch.AddItem('magnetic');
	WeaponCondition.WeaponTypeMatch.AddItem('coil');
	WeaponCondition.WeaponTypeMatch.AddItem('coil_lw');
	Template.BreakthroughCondition = WeaponCondition;

	Template.RewardName = 'WeaponTechBreakthroughBonus';

	return Template;
}

static function X2DataTemplate WOTC_APA_BMWeaponBreakthrough()
{
	local X2TechTemplate								Template;
	local WIO_X2BreakthroughCondition_WeaponTechs		WeaponCondition;

	Template = CreateBreakthroughTechTemplate('WOTC_APA_BMWeaponBreakthrough');
	Template.strImage = "img:///UILibrary_XPACK_Common.BT_dmgplas";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;
	
	Template.Requirements.RequiredEngineeringScore = 99999;
	Template.Requirements.RequiredScienceScore = 99999;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = false;

	WeaponCondition = new class'WIO_X2BreakthroughCondition_WeaponTechs';
	WeaponCondition.WeaponTypeMatch.AddItem('beam');
	WeaponCondition.WeaponTypeMatch.AddItem('laser');
	WeaponCondition.WeaponTypeMatch.AddItem('laser_lw');
	Template.BreakthroughCondition = WeaponCondition;

	Template.RewardName = 'WeaponTechBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughSparkRifleDamageTemplate()
{
	local X2TechTemplate Template;
	local X2BreakthroughCondition_WeaponType WeaponTypeCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughSparkRifleDamage');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_dmgautocannon";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredSoldierClass = 'Spark';

	WeaponTypeCondition = new class'X2BreakthroughCondition_WeaponType';
	WeaponTypeCondition.WeaponTypeMatch = 'sparkrifle';
	Template.BreakthroughCondition = WeaponTypeCondition;

	Template.RewardName = 'WeaponTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughSparkRifleWeaponUpgradeTemplate()
{
	local X2TechTemplate Template;

	Template = CreateBreakthroughTechTemplate('BreakthroughSparkRifleWeaponUpgrade');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_modautocannon";
	Template.ResearchCompletedFn = BreakthroughWeaponUpgradeCompleted;
	Template.RewardName = 'sparkrifle';

	Template.Requirements.RequiredTechs.AddItem('ModularWeapons');
	Template.Requirements.RequiredSoldierClass = 'Spark';

	return Template;
}

// NOT WORKING
static function X2DataTemplate CreateBreakthroughClaymoreDamageTemplate()
{
	local X2TechTemplate Template;
	local X2BreakthroughCondition_WeaponType WeaponTypeCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughClaymoreDamage');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_dmggrenades";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredSoldierClass = 'Reaper';

	WeaponTypeCondition = new class'X2BreakthroughCondition_WeaponType';
	WeaponTypeCondition.WeaponTypeMatch = 'claymore';
	Template.BreakthroughCondition = WeaponTypeCondition;

	Template.RewardName = 'WeaponTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughWristBladeDamageTemplate()
{
	local X2TechTemplate Template;
	local X2BreakthroughCondition_WeaponType WeaponTypeCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughWristBladeDamage');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_dmgripjack";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredSoldierClass = 'Skirmisher';

	WeaponTypeCondition = new class'X2BreakthroughCondition_WeaponType';
	WeaponTypeCondition.WeaponTypeMatch = 'wristblade';
	Template.BreakthroughCondition = WeaponTypeCondition;

	Template.RewardName = 'WeaponTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughGauntletDamageTemplate()
{
	local X2TechTemplate Template;
	local X2BreakthroughCondition_WeaponType WeaponTypeCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughGauntletDamage');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_dmggauntlet";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredSoldierClass = 'Templar';

	WeaponTypeCondition = new class'X2BreakthroughCondition_WeaponType';
	WeaponTypeCondition.WeaponTypeMatch = 'gauntlet';
	Template.BreakthroughCondition = WeaponTypeCondition;

	Template.RewardName = 'WeaponTypeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughGrenadeDamageTemplate()
{
	local X2TechTemplate Template;
	local WIO_X2BreakthroughCondition_Grenade WeaponTypeCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughGrenadeDamage');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_dmggrenades";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	WeaponTypeCondition = new class'WIO_X2BreakthroughCondition_Grenade';
	WeaponTypeCondition.WeaponTypeMatch = 'grenade';
	Template.BreakthroughCondition = WeaponTypeCondition;

	Template.RewardName = 'GrenadeBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughHeavyDamageTemplate()
{
	local X2TechTemplate Template;
	local X2BreakthroughCondition_WeaponType WeaponTypeCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughHeavyDamage');
	Template.strImage = "img:///UILibrary_MoreBreakthroughs.BT_dmgheavyweapons";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredTechs.AddItem('PlatedArmor');

	WeaponTypeCondition = new class'X2BreakthroughCondition_WeaponType';
	WeaponTypeCondition.WeaponTypeMatch = 'heavy';
	Template.BreakthroughCondition = WeaponTypeCondition;

	Template.RewardName = 'HeavyWeaponBreakthroughBonus';

	return Template;
}

