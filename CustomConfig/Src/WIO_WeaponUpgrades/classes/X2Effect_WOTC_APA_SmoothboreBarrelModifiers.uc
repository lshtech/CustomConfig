
class X2Effect_WOTC_APA_SmoothboreBarrelModifiers extends X2Effect_Persistent;


function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local XComGameStateHistory				History;
	local XComGameState_Item				SourceWeapon, LoadedAmmo;
	local ShotModifierInfo					ShotMod;
	local X2Effect_ApplyWeaponDamage		DamageEffect;
	local StateObjectReference				EffectRef;
	local XComGameState_Effect				TestEffectState;
	local X2Effect_Persistent				EffectTemplate;
	local WeaponDamageValue					BaseDamageValue, ExtraDamageValue, BonusEffectDamageValue, AmmoDamageValue, UpgradeTemplateBonusDamage, UpgradeDamageValue;
	local X2AmmoTemplate					AmmoTemplate;
	local array<X2WeaponUpgradeTemplate>	WeaponUpgradeTemplates;
	local X2WeaponUpgradeTemplate			WeaponUpgradeTemplate;
	local int								ArmorMitigation, ArmorPiercing;

	History = `XCOMHISTORY;

	SourceWeapon = XComGameState_Item(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.ItemStateObjectRef.ObjectID));		
	//SourceWeapon = AbilityState.GetSourceWeapon();
	if (SourceWeapon != none && !bIndirectFire)
	{
		// Attack must come from correct SourceWeapon
		if (AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
			return;

		// Get Armor Piercing values and target's Armor Mitigation
		DamageEffect = X2Effect_ApplyWeaponDamage(class'X2Effect'.static.GetX2Effect(EffectState.ApplyEffectParameters.EffectRef));
		if (!DamageEffect.bIgnoreBaseDamage)
		{
			SourceWeapon.GetBaseWeaponDamageValue(Target, BaseDamageValue);
		}
		if (DamageEffect.DamageTag != '')
		{
			SourceWeapon.GetWeaponDamageValue(Target, DamageEffect.DamageTag, ExtraDamageValue);
		}
		if (SourceWeapon.HasLoadedAmmo() && !DamageEffect.bIgnoreBaseDamage)
		{
			LoadedAmmo = XComGameState_Item(History.GetGameStateForObjectID(SourceWeapon.LoadedAmmo.ObjectID));
			AmmoTemplate = X2AmmoTemplate(LoadedAmmo.GetMyTemplate());
			if (AmmoTemplate != none)
			{
				AmmoTemplate.GetTotalDamageModifier(LoadedAmmo, Attacker, Target, AmmoDamageValue);
			}
			else
			{
				LoadedAmmo.GetBaseWeaponDamageValue(Target, AmmoDamageValue);
			}
		}
		if (DamageEffect.bAllowWeaponUpgrade)
		{
			WeaponUpgradeTemplates = SourceWeapon.GetMyWeaponUpgradeTemplates();
			foreach WeaponUpgradeTemplates(WeaponUpgradeTemplate)
			{
				if (WeaponUpgradeTemplate.BonusDamage.Tag == DamageEffect.DamageTag)
				{
					UpgradeTemplateBonusDamage = WeaponUpgradeTemplate.BonusDamage;
					UpgradeDamageValue.Pierce += UpgradeTemplateBonusDamage.Pierce;
				}
			}
		}

		WeaponUpgradeTemplates = SourceWeapon.GetMyWeaponUpgradeTemplates();
		foreach WeaponUpgradeTemplates(WeaponUpgradeTemplate)
		{
			if ((!DamageEffect.bIgnoreBaseDamage && DamageEffect.DamageTag == '') || WeaponUpgradeTemplate.CHBonusDamage.Tag == DamageEffect.DamageTag)
			{
				UpgradeTemplateBonusDamage = WeaponUpgradeTemplate.CHBonusDamage;
				UpgradeDamageValue.Pierce += UpgradeTemplateBonusDamage.Pierce;
			}
		}

		BonusEffectDamageValue = DamageEffect.GetBonusEffectDamageValue(AbilityState, Attacker, SourceWeapon, Target.GetReference());
	
		ArmorMitigation = Target.GetArmorMitigationForUnitFlag();
		ArmorPiercing = BaseDamageValue.Pierce + ExtraDamageValue.Pierce + BonusEffectDamageValue.Pierce + AmmoDamageValue.Pierce + UpgradeDamageValue.Pierce;
		
		foreach Attacker.AffectedByEffects(EffectRef)
		{
			TestEffectState = XComGameState_Effect(History.GetGameStateForObjectID(EffectRef.ObjectID));
			EffectTemplate = TestEffectState.GetX2Effect();

			ArmorPiercing += EffectTemplate.GetExtraArmorPiercing(EffectState, Attacker, Target, AbilityState, EffectState.ApplyEffectParameters);
		}

		// If the target has unmitigated Armor, apply modifiers
		ArmorMitigation = Max(0, ArmorMitigation - ArmorPiercing);
		if (ArmorMitigation > 0)
		{
			// Add appropriate Graze/Crit modifiers
			ShotMod.ModType = eHit_Graze;
			ShotMod.Reason = FriendlyName;
			ShotMod.Value = ArmorMitigation * class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SMOOTHBORE_BARREL_CHANCE_MOD_PER_ARMOR;
			ShotModifiers.AddItem(ShotMod);

			ShotMod.ModType = eHit_Crit;
			ShotMod.Reason = FriendlyName;
			ShotMod.Value = ArmorMitigation * -class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SMOOTHBORE_BARREL_CHANCE_MOD_PER_ARMOR;
			ShotModifiers.AddItem(ShotMod);
		}
	}
}


DefaultProperties
{
	DuplicateResponse = eDupe_Ignore
	bDisplayInSpecialDamageMessageUI = true
}