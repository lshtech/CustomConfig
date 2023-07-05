class GrimHorizonFix_HeadquartersAlien extends XComGameState_HeadquartersAlien config(GrimHorizonFix);

var config array<name> ExcludedDarkEvents;

function UpdateDarkEvents()
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersAlien AlienHQ;
	local XComGameState NewGameState;
	local XComGameState_DarkEvent DarkEventState;
	local StateObjectReference ActivatedEventRef;
	local int idx;
	local bool bUpdateHQ, bPermanent;

	History = `XCOMHISTORY;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Activate Dark Event");
	AlienHQ = XComGameState_HeadquartersAlien(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersAlien', self.ObjectID));
	bUpdateHQ = false;

	// Check Active Dark Events for the need to deactivate
	for(idx = 0; idx < AlienHQ.ActiveDarkEvents.Length; idx++)
	{
		DarkEventState = XComGameState_DarkEvent(History.GetGameStateForObjectID(AlienHQ.ActiveDarkEvents[idx].ObjectID));
		bPermanent = False;
		//Check for Grim Horizon exclusion list
		if ( `SecondWaveEnabled('PlayingForKeeps') )
		{
			bPermanent = true;
			if (ExcludedDarkEvents.Find(DarkEventState.GetMyTemplateName()) >= 0)
			{
				bPermanent = false;
			}
		}

		if( !bPermanent && //Grim Horizon Fix
			DarkEventState != none && 
			!DarkEventState.GetMyTemplate().bInfiniteDuration &&
			!DarkEventState.GetMyTemplate().bLastsUntilNextSupplyDrop
			&& class'X2StrategyGameRulesetDataStructures'.static.LessThan(DarkEventState.EndDateTime, `STRATEGYRULES.GameTime))
		{
			DarkEventState = XComGameState_DarkEvent(NewGameState.ModifyStateObject(class'XComGameState_DarkEvent', DarkEventState.ObjectID));
			DarkEventState.OnDeactivated(NewGameState);
			AlienHQ.ActiveDarkEvents.Remove(idx, 1);
			bUpdateHQ = true;
			idx--;
		}
	}

	// Check Chosen Dark Events for the need to activate
	for(idx = 0; idx < AlienHQ.ChosenDarkEvents.Length; idx++)
	{
		DarkEventState = XComGameState_DarkEvent(History.GetGameStateForObjectID(AlienHQ.ChosenDarkEvents[idx].ObjectID));
		// bTemporarilyBlockActivation is for temporary compatibility with Convert Infiltration and will be avaibable in a future release of the CHL
		// Check CHL for a bTemporarilyBlockActivation variable, if so, check for flag and skip activation of this DE
		if(Property'XComGame.XComGameState_DarkEvent.bTemporarilyBlockActivation' != none)
		{
			if(DarkEventState.bTemporarilyBlockActivation)
			 continue;
		}
		
		if(DarkEventState != none && class'X2StrategyGameRulesetDataStructures'.static.LessThan(DarkEventState.EndDateTime, `STRATEGYRULES.GameTime))
		{
			DarkEventState = XComGameState_DarkEvent(NewGameState.ModifyStateObject(class'XComGameState_DarkEvent', DarkEventState.ObjectID));

			if(DarkEventState.CanComplete())
			{
				ActivatedEventRef = DarkEventState.GetReference();
				DarkEventState.TimesSucceeded++;
				DarkEventState.Weight += DarkEventState.GetMyTemplate().WeightDeltaPerActivate;
				DarkEventState.Weight = Clamp(DarkEventState.Weight, DarkEventState.GetMyTemplate().MinWeight, DarkEventState.GetMyTemplate().MaxWeight);
				DarkEventState.OnActivated(NewGameState);

				if(DarkEventState.GetMyTemplate().MaxDurationDays > 0 || DarkEventState.GetMyTemplate().bLastsUntilNextSupplyDrop || DarkEventState.GetMyTemplate().bInfiniteDuration)
				{
					AlienHQ.ActiveDarkEvents.AddItem(DarkEventState.GetReference());

					if(DarkEventState.GetMyTemplate().MaxDurationDays > 0)
					{
						DarkEventState.StartDurationTimer();
					}
				}
			}
			else
			{
				// Clear data if can't complete event
				DarkEventState.bSecretEvent = false;
				DarkEventState.RevealCost.ResourceCosts.Length = 0;
				DarkEventState.RevealCost.ArtifactCosts.Length = 0;
			}

			AlienHQ.ChosenDarkEvents.Remove(idx, 1);
			bUpdateHQ = true;
			break;
			
		}
	}

	if(!bUpdateHQ)
	{
		NewGameState.PurgeGameStateForObjectID(AlienHQ.ObjectID);
	}

	if(NewGameState.GetNumGameStateObjects() > 0)
	{
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);

		if(ActivatedEventRef.ObjectID != 0)
		{
			`GAME.GetGeoscape().Pause();
			`HQPRES.UIDarkEventActivated(ActivatedEventRef);
		}
	}
	else
	{
		History.CleanupPendingGameState(NewGameState);
	}
}

function DeactivateEndOfMonthEvents(XComGameState NewGameState)
{
	local XComGameStateHistory History;
	local XComGameState_DarkEvent DarkEventState;
	local int idx;
	local bool bPermanent;
	local name DarkEvent;

	History = `XCOMHISTORY;

	for(idx = 0; idx < ActiveDarkEvents.Length; idx++)
	{
		DarkEventState = XComGameState_DarkEvent(History.GetGameStateForObjectID(ActiveDarkEvents[idx].ObjectID));

		//Check for Grim Horizon exclusion list
		bPermanent = false;
		if ( `SecondWaveEnabled('PlayingForKeeps') )
		{
			bPermanent = true;
			if (ExcludedDarkEvents.Find(DarkEventState.GetMyTemplateName()) >= 0)
			{
				bPermanent = false;
			}
		}
		if(!bPermanent && DarkEventState != none && DarkEventState.GetMyTemplate().bLastsUntilNextSupplyDrop)
		{
			DarkEventState = XComGameState_DarkEvent(NewGameState.ModifyStateObject(class'XComGameState_DarkEvent', DarkEventState.ObjectID));
			DarkEventState.OnDeactivated(NewGameState);
			ActiveDarkEvents.Remove(idx, 1);
		}
	}
}

function SetUpAdventChosen(XComGameState StartState)
{
	local XComGameState_AdventChosen ChosenState;
	local int idx, RandIndex, i;
	local array<XComGameState_ResistanceFaction> AllFactions;
	local XComGameState_ResistanceFaction FactionState;
	local array<X2AdventChosenTemplate> AllChosen;
	local X2AdventChosenTemplate ChosenTemplate;
	local array<name> ExcludeStrengths, ExcludeWeaknesses;
	local bool bNarrative, bAssassinStart, bHunterStart, bWarlockStart;

	// Grab Chosen Templates
	AllChosen = GetAllChosenTemplates();
	bNarrative = XComGameState_CampaignSettings(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_CampaignSettings')).bXPackNarrativeEnabled;
	
	bAssassinStart = `SecondWaveEnabled('AssassinStart');
	bHunterStart = bAssassinStart ? false : `SecondWaveEnabled('HunterStart');
	bWarlockStart = (bAssassinStart || bHunterStart)?  false : `SecondWaveEnabled('WarlockStart');

	if(bNarrative || !(bAssassinStart || bHunterStart || bWarlockStart))
	{
		super.SetUpAdventChosen(StartState);
		return;
	}
	// Grab all faction states
	foreach StartState.IterateByClassType(class'XComGameState_ResistanceFaction', FactionState)
	{
		AllFactions.AddItem(FactionState);
	}
	
	for(idx = 0; idx < default.NumAdventChosen; idx++)
	{
		if(idx == 0)
		{
			for(i = 0; i < AllChosen.Length; i++)
			{
				if (
					(bAssassinStart && AllChosen[i].DataName == 'Chosen_Assassin')
					|| (bHunterStart && AllChosen[i].DataName == 'Chosen_Hunter')
					|| (bWarlockStart && AllChosen[i].DataName == 'Chosen_Warlock')
				)
				{
					`log("Setting"@AllChosen[i].DataName@"as starting Chosen.",,'SecondWavePickYourChosen');
					RandIndex = i;
					break;
				}
			}
		}
		else
		{
			RandIndex = `SYNC_RAND(AllChosen.Length);
		}

		ChosenTemplate = AllChosen[RandIndex];
		ChosenState = ChosenTemplate.CreateInstanceFromTemplate(StartState);
		AdventChosen.AddItem(ChosenState.GetReference());
		AllChosen.Remove(RandIndex, 1);

		// Assign Rival Faction
		ChosenState.RivalFaction = AllFactions[idx].GetReference();
		AllFactions[idx].RivalChosen = ChosenState.GetReference();

		// Assign Traits
		ChosenState.AssignStartingTraits(ExcludeStrengths, ExcludeWeaknesses, AllFactions[idx], bNarrative);

		// Give them a name
		ChosenState.GenerateChosenName();

		//Generate an icon 
		ChosenState.GenerateChosenIcon();
	}
}