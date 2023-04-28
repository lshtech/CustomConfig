class X2StrategyElement_Breakthroughs extends X2StrategyElement_DefaultTechs config(GameData);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	Techs.AddItem(CreateBreakthroughCoilWeaponDamageTemplate());
	Techs.AddItem(CreateBreakthroughLaserWeaponDamageTemplate());
	Techs.AddItem(CreateBreakthroughMedikitBonusTemplate());
	Techs.AddItem(CreateBreakthroughNanoMedikitBonusTemplate());
	
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

static function X2DataTemplate CreateBreakthroughMedikitBonusTemplate()
{
	local X2TechTemplate Template;
	local X2BreakthroughCondition_Medikit TechCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughMedikitBonus');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Medkit";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	TechCondition = new class'X2BreakthroughCondition_Medikit';
	Template.BreakthroughCondition = TechCondition;

	Template.RewardName = 'MedikitBreakthroughBonus';

	return Template;
}

static function X2DataTemplate CreateBreakthroughNanoMedikitBonusTemplate()
{
	local X2TechTemplate Template;
	local X2BreakthroughCondition_Medikit TechCondition;

	Template = CreateBreakthroughTechTemplate('BreakthroughNanoMedikitBonus');
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Medkit";
	Template.ResearchCompletedFn = BreakthroughItemTacticalBonusCompleted;

	Template.Requirements.RequiredTechs.AddItem('BreakthroughMedikitBonus');
	Template.Requirements.RequiredTechs.AddItem('BattlefieldMedicine');

	TechCondition = new class'X2BreakthroughCondition_Medikit';
	Template.BreakthroughCondition = TechCondition;

	Template.RewardName = 'MedikitBreakthroughBonus';

	return Template;
}

function BreakthroughItemTacticalBonusCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameState_HeadquartersXCom XComHQ;

	XComHQ = XComGameState_HeadquartersXCom( `XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom') );
	XComHQ = XComGameState_HeadquartersXCom( NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID) );
	XComHQ.TacticalTechBreakthroughs.AddItem( TechState.GetReference() );
}

static function X2TechTemplate CreateBreakthroughTechTemplate(name TechName)
{
	local X2TechTemplate Template;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, TechName);
	Template.PointsToComplete = StafferXDays(1, 5);
	Template.SortingTier = 1;
	Template.bBreakthrough = true;
	
	return Template;
}