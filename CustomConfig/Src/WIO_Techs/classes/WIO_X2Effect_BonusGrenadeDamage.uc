class WIO_X2Effect_BonusGrenadeDamage extends X2Effect_BonusWeaponDamage;

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
	local XComGameState_Item SourceWeapon;
	local X2GrenadeTemplate GrenadeTemplate;
	local X2Effect_ApplyWeaponDamage DamageEffect;

	SourceWeapon = AbilityState.GetSourceWeapon();

	if (SourceWeapon != none)
	{
		GrenadeTemplate = X2GrenadeTemplate(SourceWeapon.GetMyTemplate());

		if (GrenadeTemplate == none)
		{
			GrenadeTemplate = X2GrenadeTemplate(SourceWeapon.GetLoadedAmmoTemplate(AbilityState));
		}

		if (GrenadeTemplate != none && GrenadeTemplate.bAllowVolatileMix)
		{
			//	no game state means it's for damage preview
			if (NewGameState == none)
			{				
				return BonusDmg;
			}

			//	only add the bonus damage when the damage effect is applying the weapon's base damage
			DamageEffect = X2Effect_ApplyWeaponDamage(class'X2Effect'.static.GetX2Effect(AppliedData.EffectRef));
			if (DamageEffect != none && !DamageEffect.bIgnoreBaseDamage)
			{
				return BonusDmg;
			}			
		}
	}
	return 0;
}

DefaultProperties
{
	DuplicateResponse = eDupe_Ignore
	bDisplayInSpecialDamageMessageUI = true
}
