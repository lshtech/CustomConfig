class WIO_X2DownloadableContentInfo_Techs extends X2DownloadableContentInfo config(WIO_Techs);

var const config bool bRemoveAvengerBreakthroughs;

struct TechReqEntry
{
	var name	TechName;
	var name	RequiredTech;
	var bool	bRemoveRequirement;
};

var config array<TechReqEntry>		TECH_REQUIREMENT_CHANGES;

static event OnLoadedSavedGame()
{
	UpdateTechRequirements();
	AddNewBreakthroughsToHistory();
	if (default.bRemoveAvengerBreakthroughs) {
		RemoveAvengerBreakthroughs();
	}
}

static event OnLoadedSavedGameToStrategy()
{
	AddNewBreakthroughsToHistory();
	if (default.bRemoveAvengerBreakthroughs) {
		RemoveAvengerBreakthroughs();
	}
}

static event OnPostTemplatesCreated()
{
	local X2StrategyElementTemplateManager StrategyElementTemplateManager;
	local X2TechTemplate TechTemplate;

	StrategyElementTemplateManager = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	DisableTech('BreakthroughLightArmorHealth');
	DisableTech('BreakthroughMediumArmorHealth');
	DisableTech('BreakthroughHeavyArmorHealth');
	DisableTech('BreakthroughSparkArmorHealth');
	DisableTech('BreakthroughReaperArmorHealth');
	DisableTech('BreakthroughSkirmisherArmorHealth');
	DisableTech('BreakthroughTemplarArmorHealth');
	DisableTech('BreakthroughConventionalArmorHealth');
	DisableTech('BreakthroughPlatedArmorHealth');
	DisableTech('BreakthroughPoweredArmorHealth');

	UpdateArmorTemplates();
}

static function DisableTech(name TechName)
{
	local X2StrategyElementTemplateManager StrategyElementTemplateManager;
	local X2TechTemplate TechTemplate;

	StrategyElementTemplateManager = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	TechTemplate = X2TechTemplate(StrategyElementTemplateManager.FindStrategyElementTemplate(TechName));

	TechTemplate.Requirements.RequiredEngineeringScore = 99999;
	TechTemplate.Requirements.RequiredScienceScore = 99999;
	TechTemplate.Requirements.bVisibleIfPersonnelGatesNotMet = false;
}

// Add ArmorClass to DLC armor
static function UpdateArmorTemplates() {
	UpdateArmorClass('LightAlienArmor','light');
	UpdateArmorClass('LightAlienArmorMk2','light');
	UpdateArmorClass('HeavyAlienArmor','heavy');
	UpdateArmorClass('HeavyAlienArmorMk2','heavy');
	UpdateArmorClass('MediumAlienArmor','medium');
}

// Add ItemCat and WeaponCat to Frost Bomb
static function UpdateArmorClass(name ItemName, name ArmorClass) {
	local X2ItemTemplateManager				ItemManager;
	local array<X2DataTemplate>				TemplateAllDifficulties;
	local X2DataTemplate					Template;
	local X2ArmorTemplate					ArmorTemplate;

	ItemManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	ItemManager.FindDataTemplateAllDifficulties(ItemName,TemplateAllDifficulties);

	// Edit the templates
	foreach TemplateAllDifficulties(Template)
	{
		ArmorTemplate = X2ArmorTemplate(Template);
		if (ArmorTemplate != none) {
			ArmorTemplate.ArmorClass = ArmorClass;
		}
	}
}

// Check if we've already injected the tech templates
static function bool IsResearchInHistory(name ResearchName) {
	
	local XComGameState_Tech TechState;
	
	foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Tech', TechState)
	{
		if ( TechState.GetMyTemplateName() == ResearchName )
		{
			return true;
		}
	}
	return false;
}

// Add tech template if not injected
static function AddToHistoryIfMissing(name ResearchName, XComGameState NewGameState) {
	
	local X2StrategyElementTemplateManager StrategyElementTemplateManager;
	local X2TechTemplate TechTemplate;

	if ( !IsResearchInHistory(ResearchName) )
	{
		StrategyElementTemplateManager = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
		TechTemplate = X2TechTemplate(StrategyElementTemplateManager.FindStrategyElementTemplate(ResearchName));
		NewGameState.CreateNewStateObject(class'XComGameState_Tech', TechTemplate);
	}
}

//Update the breakthroughs in the current campaign
static function AddNewBreakthroughsToHistory() {

	local XComGameState NewGameState;

	//Create a pending game state change
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding New Breakthrough Templates");

	AddToHistoryIfMissing('BreakthroughCoilWeaponDamage', NewGameState);
	AddToHistoryIfMissing('BreakthroughLaserWeaponDamage', NewGameState);
	AddToHistoryIfMissing('BreakthroughLightArmorBonus', NewGameState);
	AddToHistoryIfMissing('BreakthroughMediumArmorBonus', NewGameState);
	AddToHistoryIfMissing('BreakthroughHeavyArmorBonus', NewGameState);
	AddToHistoryIfMissing('BreakthroughSparkArmorBonus', NewGameState);
	AddToHistoryIfMissing('BreakthroughReaperArmorBonus', NewGameState);
	AddToHistoryIfMissing('BreakthroughSkirmisherArmorBonus', NewGameState);
	AddToHistoryIfMissing('BreakthroughTemplarArmorBonus', NewGameState);
	AddToHistoryIfMissing('BreakthroughConventionalArmorBonus', NewGameState);
	AddToHistoryIfMissing('BreakthroughPlatedArmorBonus', NewGameState);
	AddToHistoryIfMissing('BreakthroughPoweredArmorBonus', NewGameState);
	AddToHistoryIfMissing('BreakthroughMedikitBonus', NewGameState);
	AddToHistoryIfMissing('BreakthroughNanoMedikitBonus', NewGameState);
	AddToHistoryIfMissing('WOTC_APA_KevlarArmorBreakthrough', NewGameState);
	AddToHistoryIfMissing('WOTC_APA_PlatedArmorBreakthrough', NewGameState);
	AddToHistoryIfMissing('WOTC_APA_PoweredArmorBreakthrough', NewGameState);
	AddToHistoryIfMissing('WOTC_APA_CVWeaponBreakthrough', NewGameState);
	AddToHistoryIfMissing('WOTC_APA_MGWeaponBreakthrough', NewGameState);
	AddToHistoryIfMissing('WOTC_APA_BMWeaponBreakthrough', NewGameState);
	AddToHistoryIfMissing('BreakthroughSparkRifleDamage', NewGameState);
	AddToHistoryIfMissing('BreakthroughSparkRifleWeaponUpgrade', NewGameState);
	//AddToHistoryIfMissing('BreakthroughClaymoreDamage', NewGameState);
	AddToHistoryIfMissing('BreakthroughWristBladeDamage', NewGameState);
	AddToHistoryIfMissing('BreakthroughGauntletDamage', NewGameState);
	AddToHistoryIfMissing('BreakthroughGrenadeDamage', NewGameState);
	AddToHistoryIfMissing('BreakthroughHeavyDamage', NewGameState);

	//Commit the state change into the history.
	`XCOMHISTORY.AddGameStateToHistory(NewGameState);
}

// Remove tech template if injected
static function RemoveFromHistoryIfExists(name ResearchName, XComGameState NewGameState) {
	
	local XComGameState_Tech TechState;
	
	foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Tech', TechState)
	{
		if ( TechState.GetMyTemplateName() == ResearchName )
		{
			NewGameState.RemoveStateObject(TechState.ObjectID);
		}
	}
}

static function RemoveAvengerBreakthroughs() {
	
	local XComGameState NewGameState;

	//Create a pending game state change
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Removing Avenger Breakthrough Templates");

	RemoveFromHistoryIfExists('BreakthroughLaboratoryCostReduction', NewGameState);
	RemoveFromHistoryIfExists('BreakthroughWorkshopCostReduction', NewGameState);
	//Commit the state change into the history.
	`XCOMHISTORY.AddGameStateToHistory(NewGameState);
}

static function UpdateTechRequirements()
{
	local X2ItemTemplateManager					ItemTemplateManager;
	local X2StrategyElementTemplateManager		StrategyTemplateMgr;
	local X2ItemTemplate						ItemTemplate;
	local X2TechTemplate						TechTemplate;
	local X2DataTemplate						DataTemplate;
	local array<X2DataTemplate>					DataTemplates;
	local TechReqEntry							TechRequirementEntry;
	local name									TemplateName;

	StrategyTemplateMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	foreach default.TECH_REQUIREMENT_CHANGES(TechRequirementEntry)
	{
		StrategyTemplateMgr.FindDataTemplateAllDifficulties(TechRequirementEntry.TechName, DataTemplates);
		foreach DataTemplates(DataTemplate)
		{
			TechTemplate = X2TechTemplate(DataTemplate);
			if (TechTemplate != none)
			{
				if (TechRequirementEntry.RequiredTech != '')
				{
					if (TechRequirementEntry.bRemoveRequirement)
					{
						TechTemplate.Requirements.RequiredTechs.RemoveItem(TechRequirementEntry.RequiredTech);
					}
					else
					{
						TechTemplate.Requirements.RequiredTechs.AddItem(TechRequirementEntry.RequiredTech);
			}	}	}
	}	}

	StrategyTemplateMgr.FindDataTemplateAllDifficulties('ResistanceCommunications', DataTemplates);
	foreach DataTemplates(DataTemplate)
	{
		TechTemplate = X2TechTemplate(DataTemplate);
		if (TechTemplate != none)
		{
			TechTemplate.Requirements.RequiredObjectives.RemoveItem('T2_M0_CompleteGuerillaOps');
	}	}

	StrategyTemplateMgr.FindDataTemplateAllDifficulties('ResistanceRadio', DataTemplates);
	foreach DataTemplates(DataTemplate)
	{
		TechTemplate = X2TechTemplate(DataTemplate);
		if (TechTemplate != none)
		{
			TechTemplate.Requirements.RequiredObjectives.AddItem('T2_M0_CompleteGuerillaOps');
	}	}

	// Add visibility to weapon/armor research after bridge techs have been completed to see autopsy requirements
	StrategyTemplateMgr.FindDataTemplateAllDifficulties('CoilGunTech_LW', DataTemplates);
	foreach DataTemplates(DataTemplate)
	{
		TechTemplate = X2TechTemplate(DataTemplate);
		if (TechTemplate != none && TechTemplate.Requirements.SpecialRequirementsFn == none)
		{
			TechTemplate.Requirements.SpecialRequirementsFn = IsT2BridgeTechComplete;
			TechTemplate.Requirements.bVisibleIfTechsNotMet = true;
	}	}

	StrategyTemplateMgr.FindDataTemplateAllDifficulties('AdvancedCoilGunTech_LW', DataTemplates);
	foreach DataTemplates(DataTemplate)
	{
		TechTemplate = X2TechTemplate(DataTemplate);
		if (TechTemplate != none && TechTemplate.Requirements.SpecialRequirementsFn == none)
		{
			TechTemplate.Requirements.SpecialRequirementsFn = IsMagWeaponsComplete;
			TechTemplate.Requirements.bVisibleIfTechsNotMet = true;
	}	}

	StrategyTemplateMgr.FindDataTemplateAllDifficulties('PlatedArmor', DataTemplates);
	foreach DataTemplates(DataTemplate)
	{
		TechTemplate = X2TechTemplate(DataTemplate);
		if (TechTemplate != none && TechTemplate.Requirements.SpecialRequirementsFn == none)
		{
			TechTemplate.Requirements.SpecialRequirementsFn = IsT2BridgeTechComplete;
			TechTemplate.Requirements.bVisibleIfTechsNotMet = true;
	}	}

	StrategyTemplateMgr.FindDataTemplateAllDifficulties('PlasmaRifle', DataTemplates);
	foreach DataTemplates(DataTemplate)
	{
		TechTemplate = X2TechTemplate(DataTemplate);
		if (TechTemplate != none && TechTemplate.Requirements.SpecialRequirementsFn == none)
		{
			TechTemplate.Requirements.SpecialRequirementsFn = IsT3BridgeTechComplete;
			TechTemplate.Requirements.bVisibleIfTechsNotMet = true;
	}	}

	StrategyTemplateMgr.FindDataTemplateAllDifficulties('PlasmaSniper', DataTemplates);
	foreach DataTemplates(DataTemplate)
	{
		TechTemplate = X2TechTemplate(DataTemplate);
		if (TechTemplate != none && TechTemplate.Requirements.SpecialRequirementsFn == none)
		{
			TechTemplate.Requirements.SpecialRequirementsFn = IsPlasmaWeaponsComplete;
			TechTemplate.Requirements.bVisibleIfTechsNotMet = true;
	}	}

	StrategyTemplateMgr.FindDataTemplateAllDifficulties('HeavyPlasma', DataTemplates);
	foreach DataTemplates(DataTemplate)
	{
		TechTemplate = X2TechTemplate(DataTemplate);
		if (TechTemplate != none && TechTemplate.Requirements.SpecialRequirementsFn == none)
		{
			TechTemplate.Requirements.SpecialRequirementsFn = IsPlasmaWeaponsComplete;
			TechTemplate.Requirements.bVisibleIfTechsNotMet = true;
	}	}

	StrategyTemplateMgr.FindDataTemplateAllDifficulties('AlloyCannon', DataTemplates);
	foreach DataTemplates(DataTemplate)
	{
		TechTemplate = X2TechTemplate(DataTemplate);
		if (TechTemplate != none && TechTemplate.Requirements.SpecialRequirementsFn == none)
		{
			TechTemplate.Requirements.SpecialRequirementsFn = IsPlasmaWeaponsComplete;
			TechTemplate.Requirements.bVisibleIfTechsNotMet = true;
	}	}

	StrategyTemplateMgr.FindDataTemplateAllDifficulties('PoweredArmor', DataTemplates);
	foreach DataTemplates(DataTemplate)
	{
		TechTemplate = X2TechTemplate(DataTemplate);
		if (TechTemplate != none && TechTemplate.Requirements.SpecialRequirementsFn == none)
		{
			TechTemplate.Requirements.SpecialRequirementsFn = IsT3BridgeTechComplete;
			TechTemplate.Requirements.bVisibleIfTechsNotMet = true;
	}	}
}

static function bool IsT2BridgeTechComplete()
{
	local array<name> TechNames;

	TechNames.AddItem('WOTC_APA_AlloyIntegration');

	return AreTechRequirementsMet(TechNames);
}

static function bool IsMagWeaponsComplete()
{
	local array<name> TechNames;

	TechNames.AddItem('CoilGunTech_LW');

	return AreTechRequirementsMet(TechNames);
}

static function bool IsT3BridgeTechComplete()
{
	local array<name> TechNames;

	TechNames.AddItem('WOTC_APA_EleriumIntegration');

	return AreTechRequirementsMet(TechNames);
}

static function bool IsPlasmaWeaponsComplete()
{
	local array<name> TechNames;

	TechNames.AddItem('PlasmaRifle');

	return AreTechRequirementsMet(TechNames);
}

static function bool AreTechRequirementsMet(array<name> TechNames)
{
	local XComGameState_HeadquartersXCom XComHQ;

	XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	return XComHQ.MeetsTechRequirements(TechNames);
}
