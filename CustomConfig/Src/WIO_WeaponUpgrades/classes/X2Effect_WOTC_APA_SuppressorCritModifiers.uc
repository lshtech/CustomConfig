
class X2Effect_WOTC_APA_SuppressorCritModifiers extends X2Effect_Persistent;

var int			ConcealedCritModifier;
var int			RevealedCritModifier;


function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local XComGameState_Item SourceWeapon;
	local ShotModifierInfo ShotMod;

	SourceWeapon = AbilityState.GetSourceWeapon();
	if (SourceWeapon != none && !bIndirectFire)
	{
		// Attack must come from correct SourceWeapon
		if (AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
			return;

		if (Attacker.IsConcealed() && ConcealedCritModifier != 0)
		{
			ShotMod.ModType = eHit_Crit;
			ShotMod.Reason = FriendlyName;
			ShotMod.Value = ConcealedCritModifier;
			ShotModifiers.AddItem(ShotMod);
		}

		if (!Attacker.IsConcealed() && RevealedCritModifier != 0)
		{
			ShotMod.ModType = eHit_Crit;
			ShotMod.Reason = FriendlyName;
			ShotMod.Value = RevealedCritModifier;
			ShotModifiers.AddItem(ShotMod);
		}		
	}
}