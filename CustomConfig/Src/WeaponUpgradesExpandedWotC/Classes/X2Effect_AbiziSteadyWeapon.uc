class X2Effect_AbiziSteadyWeapon extends X2Effect_Persistent config(Game);

var config int EMPOWERSTEADY_AIM;
var int Aim_Bonus;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager EventMgr;
	local XComGameState_Unit UnitState;
	local Object EffectObj;

	EventMgr = `XEVENTMGR;

	EffectObj = EffectGameState;
	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));

	EventMgr.RegisterForEvent(EffectObj, 'UnitTakeEffectDamage', SteadyWeaponWoundListener, ELD_OnStateSubmitted, 75, UnitState,, EffectObj);
	EventMgr.RegisterForEvent(EffectObj, 'ImpairingEffect', SteadyWeaponWoundListener, ELD_OnStateSubmitted, 75, UnitState,, EffectObj);
	EventMgr.RegisterForEvent(EffectObj, 'AbilityActivated', SteadyWeaponActionListener, ELD_OnStateSubmitted, 75, UnitState,, EffectObj);
}

function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
    local ShotModifierInfo ShotInfo;

    if(!bMelee && AbilityState.SourceWeapon == EffectState.ApplyEffectParameters.ItemStateObjectRef)
    {
        ShotInfo.ModType = eHit_Success;
        ShotInfo.Reason = FriendlyName;
        ShotInfo.Value = Aim_Bonus + (AreUpgradesEmpowered() ? default.EMPOWERSTEADY_AIM:0);
        ShotModifiers.AddItem(ShotInfo);

    }
}

static function EventListenerReturn SteadyWeaponWoundListener(Object EventData, Object EventSource, XComGameState GameState, Name InEventID, Object CallbackData)
{
    local XComGameStateContext_EffectRemoved RemoveContext;
    local XComGameState NewGameState;
	local XComGameState_Effect EffectState;

    //`LOG("SteadyWeapon SteadyWeaponWoundListener triggered...");

    EffectState = XComGameState_Effect(CallbackData);
    if (EffectState != none && !EffectState.bRemoved)
    {
        RemoveContext = class'XComGameStateContext_EffectRemoved'.static.CreateEffectRemovedContext(EffectState);
        NewGameState = `XCOMHISTORY.CreateNewGameState(true, RemoveContext);
        EffectState.RemoveEffect(NewGameState, NewGameState);
        `TACTICALRULES.SubmitGameState(NewGameState);
        //`LOG("SteadyWeapon removing...");
    }
    return ELR_NoInterrupt;
}

static function EventListenerReturn SteadyWeaponActionListener(Object EventData, Object EventSource, XComGameState GameState, Name InEventID, Object CallbackData)
{
    local XComGameState_Ability AbilityState;
    local XComGameStateContext_EffectRemoved RemoveContext;
    local XComGameState NewGameState;
    local X2AbilityCost Cost;
    local bool CostlyAction;
	local XComGameState_Effect EffectState;

    //`LOG("SteadyWeapon SteadyWeaponActionListener triggered...");

    AbilityState = XComGameState_Ability(EventData);
    if (AbilityState != none)
    {
        //`LOG("SteadyWeapon AbilityState valid...");
        foreach AbilityState.GetMyTemplate().AbilityCosts(Cost)
        {
            CostlyAction = false;
            if (Cost.IsA('X2AbilityCost_ActionPoints') && !X2AbilityCost_ActionPoints(Cost).bFreeCost)
                CostlyAction = true;
            if (Cost.IsA('X2AbilityCost_ReserveActionPoints') && !X2AbilityCost_ReserveActionPoints(Cost).bFreeCost)
                CostlyAction = true;
            if (Cost.IsA('X2AbilityCost_HeavyWeaponActionPoints') && !X2AbilityCost_HeavyWeaponActionPoints(Cost).bFreeCost)
                CostlyAction = true;
            if (Cost.IsA('X2AbilityCost_QuickdrawActionPoints') && !X2AbilityCost_QuickdrawActionPoints(Cost).bFreeCost)
                CostlyAction = true;
           // if (AbilityState.GetMyTemplateName() == 'LW2WotC_CloseCombatSpecialistAttack')
             //   CostlyAction = true;
            if (AbilityState.GetMyTemplateName() == 'BladestormAttack')
                CostlyAction = true;
            if (AbilityState.GetMyTemplateName() == 'LightningHands')
                CostlyAction = true;
            if(CostlyAction) 
            {
                if (AbilityState.GetMyTemplateName() == 'AbiziSteadyWeaponM4')
                    return ELR_NoInterrupt;

                //`LOG("SteadyWeapon action is costly...");
                EffectState = XComGameState_Effect(CallbackData);
                if (EffectState != none && !EffectState.bRemoved)
                {
                    RemoveContext = class'XComGameStateContext_EffectRemoved'.static.CreateEffectRemovedContext(EffectState);
                    NewGameState = `XCOMHISTORY.CreateNewGameState(true, RemoveContext);
                    EffectState.RemoveEffect(NewGameState, NewGameState);
                    `TACTICALRULES.SubmitGameState(NewGameState);
                    //`LOG("SteadyWeapon removing...");
                }
            }
        }
    }
    return ELR_NoInterrupt;
}

static function bool AreUpgradesEmpowered()
{
	local XComGameState_HeadquartersXCom XComHQ;

	// Start Issue #1086
	// Pass "true" as second argument to GetSingleGameStateObjectForClass() to prevent the redscreen and log warning if XComHQ doesn't exist.
	XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom', true));

	// Add "none" check for XComHQ before accessing bEmpoweredUpgrades.
	return XComHQ != none && XComHQ.bEmpoweredUpgrades;
	// End Issue #1086
}

defaultproperties
{
    EffectName="SteadyWeapon"
}


