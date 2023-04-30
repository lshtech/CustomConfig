

class X2Effect_WOTC_APA_WildcatCartridges extends X2Effect_Persistent;

var int		BonusCritDmg;
var int		BonusChance;
var int		BonusDmg;

var int		GrazeChanceModifier;

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState) 
{
	local X2Effect_ApplyWeaponDamage		DamageEffect;
	local int								RandRoll;

	if (AbilityState != none)
	{   
		if (AbilityState.GetSourceWeapon() != none)
		{
			// Attack must come from correct SourceWeapon
			if (AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
				return 0;

			// Only apply when the damage effect is applying the weapon's base damage
			if (NewGameState != none)
			{
				DamageEffect = X2Effect_ApplyWeaponDamage(class'X2Effect'.static.GetX2Effect(AppliedData.EffectRef));
				if (DamageEffect == none || DamageEffect.bIgnoreBaseDamage)
				{
					return 0;
			}	}

			// Only show in the shot preview if the chance is 100
			if (NewGameState == none && BonusChance < 100)
				return 0;

			// Only apply when landing a Critical Hit
			if (AppliedData.AbilityResultContext.HitResult != eHit_Crit)
				return BonusDmg;

			// Roll for Bonus Crit Damage
			RandRoll = `SYNC_RAND(100);
			if (Randroll <= BonusChance)
            {
				return BonusCritDmg + BonusDmg;
	}	}	}

	return 0;
}


function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local XComGameState_Item				SourceWeapon;
	local ShotModifierInfo					ShotMod;

	SourceWeapon = AbilityState.GetSourceWeapon();
	if (SourceWeapon != none && !bIndirectFire)
	{
		// Attack must come from correct SourceWeapon
		if (AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
			return;
		
		// Add Graze modifiers
		if (GrazeChanceModifier != 0)
		{
			ShotMod.ModType = eHit_Graze;
			ShotMod.Reason = FriendlyName;
			ShotMod.Value = GrazeChanceModifier;
			ShotModifiers.AddItem(ShotMod);
		}
	}
}