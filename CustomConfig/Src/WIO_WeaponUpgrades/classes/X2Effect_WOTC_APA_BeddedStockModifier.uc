
class X2Effect_WOTC_APA_BeddedStockModifier extends X2Effect_Persistent;

var int			AimModifier;
var int			CritModifier;

var bool		bPenalizeDifferentTarget;
var int			PenalizeAimModifier;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager EventMgr;
	local Object EffectObj;

	EventMgr = `XEVENTMGR;
	EffectObj = EffectGameState;
	EventMgr.RegisterForEvent(EffectObj, 'AbilityActivated', BeddedStockListener, ELD_OnStateSubmitted, , `XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
}


static function EventListenerReturn BeddedStockListener(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameStateContext_Ability AbilityContext;
	local XComGameState_Ability AbilityState;
	local XComGameState_Unit UnitState;
	local XComGameState NewGameState;
	local UnitValue TargetValue;
	local int TargetID;

	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	AbilityState = XComGameState_Ability(EventData);
	UnitState = XComGameState_Unit(EventSource);

	if (AbilityContext != none && AbilityState != none && UnitState != none)
	{
		if (AbilityState.GetMyTemplate().Hostility == eHostility_Offensive)
		{
			UnitState.GetUnitValue('WOTC_APA_BeddedStockTarget', TargetValue);
			TargetID = AbilityContext.InputContext.PrimaryTarget.ObjectID;
			if (int(TargetValue.fValue) != TargetID)
			{
				NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("ID WOTC_APA_BeddedStockTarget");
				UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(UnitState.Class, UnitState.ObjectID));
				UnitState.SetUnitFloatValue('WOTC_APA_BeddedStockTarget', TargetID, eCleanup_BeginTactical);
				`TACTICALRULES.SubmitGameState(NewGameState);
	}	}	}
		
	return ELR_NoInterrupt;
}



function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local XComGameState_Item SourceWeapon;
	local ShotModifierInfo ShotMod;
	local UnitValue TargetValue;
	local X2AbilityToHitCalc_StandardAim AttackToHit;

	SourceWeapon = AbilityState.GetSourceWeapon();
	if (SourceWeapon != none && !bIndirectFire)
	{
		// Attack must come from correct SourceWeapon
		if (AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
			return;

		Attacker.GetUnitValue('WOTC_APA_BeddedStockTarget', TargetValue);
		
		if (int(TargetValue.fValue) == Target.ObjectID)
		{
			if (CritModifier != 0)
			{
				ShotMod.ModType = eHit_Crit;
				ShotMod.Reason = FriendlyName;
				ShotMod.Value = CritModifier;
				ShotModifiers.AddItem(ShotMod);
			}

			if (AimModifier != 0)
			{
				ShotMod.ModType = eHit_Success;
				ShotMod.Reason = FriendlyName;
				ShotMod.Value = AimModifier;
				ShotModifiers.AddItem(ShotMod);
			}

			return;
		}

		AttackToHit = X2AbilityToHitCalc_StandardAim(AbilityState.GetMyTemplate().AbilityToHitCalc);
		if (AttackToHit != none)
		{
			if (bPenalizeDifferentTarget && AttackToHit.bReactionFire && TargetValue.fValue != 0)
			{
				if (PenalizeAimModifier != 0)
				{
					ShotMod.ModType = eHit_Success;
					ShotMod.Reason = FriendlyName;
					ShotMod.Value = PenalizeAimModifier;
					ShotModifiers.AddItem(ShotMod);
				}
			}
		}
	}
}