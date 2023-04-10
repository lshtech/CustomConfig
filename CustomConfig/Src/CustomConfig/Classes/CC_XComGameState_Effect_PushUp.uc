class CC_XComGameState_Effect_PushUp extends XComGameState_Effect;// config(HybirdBulletsAmmoData);

var private array<name> ActivedAbilities;

function EventListenerReturn CCKineticPlatingListener(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
	local XComGameStateContext_Ability AbilityContext;
	local XComGameState NewGameState;
	local XComGameState_Unit UnitState;
	local CC_X2Effect_PushUpVestPersonalKineticShield PlatingEffect;
	
	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
	{
        if (AbilityContext.InputContext.SourceObject == ApplyEffectParameters.TargetStateObjectRef)
		{
			PlatingEffect = CC_X2Effect_PushUpVestPersonalKineticShield(GetX2Effect());
			UnitState = XComGameState_Unit(GameState.GetGameStateForObjectID(ApplyEffectParameters.TargetStateObjectRef.ObjectID));
			if (UnitState != none)
			{
				NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState(string(GetFuncName()));
				UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(UnitState.Class, UnitState.ObjectID));
				UnitState.ModifyCurrentStat(eStat_ShieldHP, 1);
				NewGameState.ModifyStateObject(class'XComGameState_Ability', ApplyEffectParameters.AbilityStateObjectRef.ObjectID);
				XComGameStateContext_ChangeContainer(NewGameState.GetContext()).BuildVisualizationFn = TriggerAbilityFlyoverVisualizationFn;
				SubmitNewGameState(NewGameState);
			}
		}
	}
	return ELR_NoInterrupt;
}

function EventListenerReturn OnRemoveEffectWhenTargetOfEventIsSourceOfEffect(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameState NewGameState;
	local XComGameStateHistory History;
	local XComGameStateContext_EffectRemoved EffectRemovedState;
	local X2TacticalGameRuleset TacticalRules;
	local XComGameState_Unit TargetUnit;

	History = `XCOMHISTORY;

	TargetUnit = XComGameState_Unit(EventData);
	if ( !bRemoved && TargetUnit != None && TargetUnit.ObjectID == ApplyEffectParameters.AbilityInputContext.SourceObject.ObjectID )
	{
		EffectRemovedState = class'XComGameStateContext_EffectRemoved'.static.CreateEffectRemovedContext(self);
		NewGameState = History.CreateNewGameState(true, EffectRemovedState);
		EffectRemovedState.SetAssociatedPlayTiming(SPT_AfterSequential);
		RemoveEffect(NewGameState, GameState);


		if (NewGameState.GetNumGameStateObjects() > 0)
		{
			TacticalRules = `TACTICALRULES;
				TacticalRules.SubmitGameState(NewGameState);

			//  effects may have changed action availability - if a unit died, took damage, etc.
		}
		else
		{
			History.CleanupPendingGameState(NewGameState);
		}
	}

	return ELR_NoInterrupt;
}

function EventListenerReturn ProximityMine_ObjectMoved(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameStateHistory  History;
	local XComGameState_Unit    MovedUnit, SourceUnit, SourceUnitAtTimeOfLaunch;	
	local TTile                 AffectedTile;
	local bool                  bTileMatches;

	if (bRemoved)
		return ELR_NoInterrupt;

	History = `XCOMHISTORY;
	SourceUnit = XComGameState_Unit(History.GetGameStateForObjectID(ApplyEffectParameters.SourceStateObjectRef.ObjectID));
	MovedUnit = XComGameState_Unit(EventData);
	if (MovedUnit != none && SourceUnit != none)
	{
		foreach ApplyEffectParameters.AbilityResultContext.RelevantEffectTiles(AffectedTile)
		{
			if (AffectedTile == MovedUnit.TileLocation)
			{
				bTileMatches = true;
				break;
			}
		}
		if (bTileMatches)
		{
			SourceUnitAtTimeOfLaunch = GetSourceUnitAtTimeOfApplication();

			if (MovedUnit.IsEnemyUnit(SourceUnitAtTimeOfLaunch) && MovedUnit.IsAlive())          //  friendlies will not trigger the proximity mine
			{
				DetonateProximityMine(SourceUnit, MovedUnit, GameState);
			}
		}
	}

	return ELR_NoInterrupt;
}

private function DetonateProximityMine(XComGameState_Unit SourceUnit, XComGameState_Unit TriggeringUnit, XComGameState RespondingToGameState)
{
	local XComGameState_Ability AbilityState;
	local AvailableAction Action;
	local AvailableTarget Target;
	local XComGameStateContext_EffectRemoved EffectRemovedState;
	local XComGameState NewGameState;
	local XComGameStateHistory History;
	local TTile                 AffectedTile;
	local XComGameState_Unit    UnitState;

	History = `XCOMHISTORY;
	Action.AbilityObjectRef = SourceUnit.FindAbility('KineticLevitationProximityMineDetonation');
	if (Action.AbilityObjectRef.ObjectID != 0)
	{
		AbilityState = XComGameState_Ability(History.GetGameStateForObjectID(Action.AbilityObjectRef.ObjectID));
		if (AbilityState != none)
		{
			//  manually check the unit states being modified by the event as they may not be properly updated in the world data until the event is complete
			foreach RespondingToGameState.IterateByClassType(class'XComGameState_Unit', UnitState)
			{
				foreach ApplyEffectParameters.AbilityResultContext.RelevantEffectTiles(AffectedTile)
				{
					if (UnitState.TileLocation == AffectedTile)
					{
						if (Target.AdditionalTargets.Find('ObjectID', UnitState.ObjectID) == INDEX_NONE)
							Target.AdditionalTargets.AddItem(UnitState.GetReference());

						break;      //  no need to keep checking tiles for this unit
					}
				}
			}

			Action.AvailableCode = 'AA_Success';
			AbilityState.GatherAdditionalAbilityTargetsForLocation(ApplyEffectParameters.AbilityInputContext.TargetLocations[0], Target);

			//Ensure that the triggering unit is caught in the blast.
			if (TriggeringUnit != None && Target.AdditionalTargets.Find('ObjectID', TriggeringUnit.ObjectID) == INDEX_NONE)
				Target.AdditionalTargets.AddItem(TriggeringUnit.GetReference());

			Action.AvailableTargets.AddItem(Target);

			if (class'XComGameStateContext_Ability'.static.ActivateAbility(Action, 0, ApplyEffectParameters.AbilityInputContext.TargetLocations))
			{
				EffectRemovedState = class'XComGameStateContext_EffectRemoved'.static.CreateEffectRemovedContext(self);
				NewGameState = History.CreateNewGameState(true, EffectRemovedState);
				RemoveEffect(NewGameState, RespondingToGameState);
				SubmitNewGameState(NewGameState);
			}
		}
	}
}

function EventListenerReturn KineticRoundListener(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
	local XComGameState_Unit AttackingUnit, TargetUnit;
	local XComGameStateHistory History;
    local X2Effect_PushUpKineticRoundsInit KineticRoundsEffect;
	local StateObjectReference AbilityRef;
	local XComGameState_Ability AbilityState;
    local X2AbilityTemplate AbilityTemplate;
	local XComGameStateContext_Ability AbilityContext;
    local XComGameState_Item AbilityWeapon;

	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
    if (AbilityContext != none)
    {
         //ensure the ability is offense and is not melee
         AbilityTemplate = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(AbilityContext.InputContext.AbilityTemplateName);
         if (AbilityTemplate != none && AbilityTemplate.Hostility == eHostility_Offensive && !AbilityTemplate.IsMelee())
         {
            // find the attack ability is correct ability source
            if(AbilityTemplate.AbilitySourceName == 'eAbilitySource_Standard' || AbilityTemplate.AbilitySourceName == 'eAbilitySource_Perk')
            {
                History = `XCOMHISTORY;
                // ensure the attacker is the correct player with Kinetic Round InitEffect
                if (History.GetGameStateForObjectID(ApplyEffectParameters.TargetStateObjectRef.ObjectID) == History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID))
                {
                    //Find the attacker
                    AttackingUnit = XComGameState_Unit(History.GetGameStateForObjectID(ApplyEffectParameters.TargetStateObjectRef.ObjectID));
                    if(AttackingUnit != none && AttackingUnit == class'X2TacticalGameRulesetDataStructures'.static.GetAttackingUnitState(GameState))
                    {
                        //find the target unit and ensure it is enemy to the attacker and is not dead yet
                        TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID));
                        if(TargetUnit != none && TargetUnit.IsEnemyUnit(AttackingUnit) &&!TargetUnit.IsDead())
                        {
                            KineticRoundsEffect = X2Effect_PushUpKineticRoundsInit(GetX2Effect());
                            `assert(KineticRoundsEffect != none);
                            AbilityRef = AttackingUnit.FindAbility(KineticRoundsEffect.AbilityToActivate);                          
                            AbilityState = XComGameState_Ability(History.GetGameStateForObjectID(AbilityRef.ObjectID));
                            if (AbilityState != none)
                            {
                                //Ensure find the attacker weapon 
                                AbilityWeapon = XComGameState_Item(History.GetGameStateForObjectID(AbilityContext.InputContext.ItemObject.ObjectID));           
                                if (AbilityWeapon !=none)
                                {
									if (AbilityWeapon.LoadedAmmo.ObjectID != ApplyEffectParameters.ItemStateObjectRef.ObjectID)
									{
										return ELR_NoInterrupt;
									}
									if(class'X2Effect_PushUpVestKineticManipulation'.default.WeaponCategories.Find(AbilityWeapon.GetWeaponCategory()) != INDEX_NONE)	
									{
										AbilityState.AbilityTriggerAgainstSingleTarget(TargetUnit.GetReference(), false);
									}
									else if(class'X2Effect_PushUpVestKineticManipulation'.default.StandardShotCategories.Find(AbilityWeapon.getmytemplatename()) != INDEX_NONE)	
									{
										AbilityState.AbilityTriggerAgainstSingleTarget(TargetUnit.GetReference(), false);
									}                      
                                }
                            }
                        }                    
                    }
                }
            }
         }
    }
	return ELR_NoInterrupt;
}	