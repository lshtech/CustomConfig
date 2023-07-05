class GrimHorizonFix_X2DownloadableContentInfo extends X2DownloadableContentInfo;

var localized string PYCAssassin_Desc;
var localized string PYCAssassin_Tooltip;

var localized string PYCHunter_Desc;
var localized string PYCHunter_Tooltip;

var localized string PYCWarlock_Desc;
var localized string PYCWarlock_Tooltip;

static event OnPostTemplatesCreated()
{
	EditDarkEvent_SignalJamming();
	UpdateSecondWaveOptionsList();
}

static function EditDarkEvent_SignalJamming()
{
	local X2DarkEventTemplate Template;
	local X2StrategyElementTemplateManager StratMgr;
	
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	Template = X2DarkEventTemplate(StratMgr.FindStrategyElementTemplate('DarkEvent_SignalJamming'));
	
	if (Template == none)
	{
		`log("Could not find template: DarkEvent_SignalJamming");
		return;
	}
	// Add function that runs when dark event is removed so that the end times can be reset
	Template.OnDeactivatedFn = DeactivateSignalJamming;
}

static function DeactivateSignalJamming(XComGameState NewGameState, StateObjectReference InRef)
{
	RemoveSignalJamming(NewGameState);
}

static function RemoveSignalJamming(XComGameState NewGameState)
{
	local XComGameState_HeadquartersXCom XComHQ;
	local ScanRateMod ScanRateModifier;
	local float SignalJammingModifier;
	local int idx;

	XComHQ = class'X2StrategyElement_DefaultDarkEvents'.static.GetAndAddXComHQ(NewGameState);
	SignalJammingModifier = class'X2StrategyElement_XpackDarkEvents'.static.GetSignalJammingIncrease();

	for (idx = 0; idx < XComHQ.ScanRateMods.Length; idx++)
	{
		ScanRateModifier = XComHQ.ScanRateMods[idx];
		// Search for the array of scan rate mods and find the duration that matches Signal Jamming set in the config
		if (ScanRateModifier.Modifier == SignalJammingModifier)
		{
			`log("Found Signal Jamming Dark Event");
			XComHQ.CurrentScanRate /= ScanRateModifier.Modifier;
			XComHQ.UpdateScanSiteTimes(NewGameState, (1.0 / ScanRateModifier.Modifier));
			XComHQ.ScanRateMods.Remove(idx, 1); // The scan mod was deactivated, so remove it from the list

			if (XComHQ.ScanRateMods.Length == 0)
			{
				XComHQ.CurrentScanRate = 1.0; // If there are no mods left, reset the scan time to the default
			}
			else
			{
				idx--; // Drop the index to account for the removed mod
			}			
		}
	}	
}

static function UpdateSecondWaveOptionsList()
{
	local array<Object>			UIShellDifficultyArray;
	local Object				ArrayObject;
	local UIShellDifficulty		UIShellDifficulty;
    local SecondWaveOption		AssassinStart, WarlockStart, HunterStart;
	
	AssassinStart.ID = 'AssassinStart';
	AssassinStart.DifficultyValue = 0;

	HunterStart.ID = 'HunterStart';
	HunterStart.DifficultyValue = 0;

	WarlockStart.ID = 'WarlockStart';
	WarlockStart.DifficultyValue = 0;

	UIShellDifficultyArray = class'XComEngine'.static.GetClassDefaultObjects(class'UIShellDifficulty');
	foreach UIShellDifficultyArray(ArrayObject)
	{
		UIShellDifficulty = UIShellDifficulty(ArrayObject);
		`log("Adding second wave option"@AssassinStart.ID,,'SecondWavePickYourChosen');
		UIShellDifficulty.SecondWaveOptions.AddItem(AssassinStart);
		UIShellDifficulty.SecondWaveDescriptions.AddItem(default.PYCAssassin_Desc);
		UIShellDifficulty.SecondWaveToolTips.AddItem(default.PYCAssassin_Tooltip);
		`log("Adding second wave option"@HunterStart.ID,,'SecondWavePickYourChosen');
		UIShellDifficulty.SecondWaveOptions.AddItem(HunterStart);
		UIShellDifficulty.SecondWaveDescriptions.AddItem(default.PYCHunter_Desc);
		UIShellDifficulty.SecondWaveToolTips.AddItem(default.PYCHunter_Tooltip);
		`log("Adding second wave option"@WarlockStart.ID,,'SecondWavePickYourChosen');
		UIShellDifficulty.SecondWaveOptions.AddItem(WarlockStart);
		UIShellDifficulty.SecondWaveDescriptions.AddItem(default.PYCWarlock_Desc);
		UIShellDifficulty.SecondWaveToolTips.AddItem(default.PYCWarlock_Tooltip);
	}
}