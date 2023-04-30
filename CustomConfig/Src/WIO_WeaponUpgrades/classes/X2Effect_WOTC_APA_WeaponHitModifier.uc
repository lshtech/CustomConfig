
class X2Effect_WOTC_APA_WeaponHitModifier extends X2Effect_Persistent;

var int			AimModifier;
var int			CritModifier;
var int			TileLimitCeiling;	// Effect is only active up to this tile limit
var int			TileLimitFloor;		// Effect is only active above this tile limit

var bool		bApplyToDirectShots;
var bool		bApplyToReactionShots;


function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local XComGameState_Item				SourceWeapon;
	local X2AbilityToHitCalc_StandardAim	AttackToHit;
	local ShotModifierInfo					ShotMod;
	local int								Tiles;

	SourceWeapon = AbilityState.GetSourceWeapon();
	if (SourceWeapon != none && !bIndirectFire)
	{
		// Attack must come from correct SourceWeapon
		if (AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
			return;

		AttackToHit = X2AbilityToHitCalc_StandardAim(AbilityState.GetMyTemplate().AbilityToHitCalc);
		if (AttackToHit != none)
		{
			// Dont respond to reaction fire unless specified
			if (AttackToHit.bReactionFire && !bApplyToReactionShots)
				return;

			// Dont respond to direct attact unless specified
			if (!AttackToHit.bReactionFire && !bApplyToDirectShots)
				return;
		}
		
		if (TileLimitCeiling > 0)
		{
			Tiles = Attacker.TileDistanceBetween(Target);
			if (Tiles > TileLimitCeiling)
				return;
		}

		if (TileLimitFloor > 0)
		{
			Tiles = Attacker.TileDistanceBetween(Target);
			if (Tiles < TileLimitFloor)
				return;
		}
		
		// Add appropriate Aim/Crit modifiers
		if (AimModifier != 0)
		{
			ShotMod.ModType = eHit_Success;
			ShotMod.Reason = FriendlyName;
			ShotMod.Value = AimModifier;
			ShotModifiers.AddItem(ShotMod);
		}

		if (CritModifier != 0)
		{
			ShotMod.ModType = eHit_Crit;
			ShotMod.Reason = FriendlyName;
			ShotMod.Value = CritModifier;
			ShotModifiers.AddItem(ShotMod);
		}
	}
}