class CC_X2Effect_PushUpVestPersonalKineticShield extends X2Effect_PersistentStatChange config(PushUpVestData);

var int ShieldPerCharge;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager EventMan;
	local CC_XComGameState_Effect_PushUp EffectState;
	local Object EffectObj;

	EffectState = CC_XComGameState_Effect_PushUp(EffectGameState);
	`assert(EffectState != none);
	EventMan = `XEVENTMGR;
	EffectObj = EffectGameState;
	//EventMan.RegisterForEvent(EffectObj, 'PushUpActivated', class'CC_XComGameState_Effect_PushUp'.static.CCKineticPlatingListener, ELD_OnStateSubmitted);
	EventMan.RegisterForEvent(EffectObj, 'PushUpActivated', EffectState.CCKineticPlatingListener, ELD_OnStateSubmitted);
}

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local int FullShield;

	super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);
	//`Log("CC: Added kinetic shield effect");
	FullShield = XComGameState_Unit(kNewTargetState).GetCurrentStat(eStat_ShieldHP);
	XComGameState_Unit(kNewTargetState).SetCurrentStat(eStat_ShieldHP, FullShield - class'X2Ability_PushUpVest'.default.MaxShieldAmount);
}

function int GetDefendingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, optional XComGameState NewGameState)
{
	local array<name> IncomingTypes;
	local name ImmuneType;
	local XComGameState_Unit UnitState;
	local int DamageMod;
	UnitState = XComGameState_Unit(TargetDamageable);
	ImmuneType = 'Mental';
	WeaponDamageEffect.GetEffectDamageTypes(NewGameState, AppliedData, IncomingTypes);
	DamageMod = UnitState.GetCurrentStat(eStat_ShieldHP);
	if (CurrentDamage < DamageMod)
		DamageMod -= 1;
	if (IncomingTypes.Find(ImmuneType) != INDEX_NONE)
		return 0;
	return -DamageMod;
}	

DefaultProperties
{
	DuplicateResponse = eDupe_Ignore
	EffectName = "CCPersonalKineticShieldEffect"
	GameStateEffectClass = class'CC_XComGameState_Effect_PushUp'
}