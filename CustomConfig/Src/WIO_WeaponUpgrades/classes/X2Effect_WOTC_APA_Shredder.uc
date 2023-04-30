class X2Effect_WOTC_APA_Shredder extends X2Effect_Persistent;

var int Shred;

defaultproperties
{
	Shred = 0
}

function int GetExtraShredValue(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData) 
{ 
	local XComGameState_Item SourceWeapon;

	if (!class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult)) {return 0;}

	SourceWeapon = AbilityState.GetSourceWeapon();
	//  make sure the ammo that created this effect is loaded into the weapon
	if (SourceWeapon != none)
	{
		return Shred;
	}

	return 0; 
}