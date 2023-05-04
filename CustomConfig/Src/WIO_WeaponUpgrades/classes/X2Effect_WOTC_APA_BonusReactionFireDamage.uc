class X2Effect_WOTC_APA_BonusReactionFireDamage extends X2Effect_Persistent;

var int BonusDmg;

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState) {
	
	local XComGameState_Item AbilitySourceWeapon;
	local XComGameState_Item EffectSourceWeapon;
	local X2AbilityToHitCalc_StandardAim StandardHit; 
	local X2Effect_ApplyWeaponDamage DamageEffect;

	if (!class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult) || CurrentDamage <= 0) return 0; // Check if the ability actually hits before applying, otherwise the damage will be applied even w/ a miss
	
	AbilitySourceWeapon = AbilityState.GetSourceWeapon(); // Get the weapon this ability is being applied to

	EffectSourceWeapon = XComGameState_Item(`XCOMHISTORY.GetGameStateForObjectID(EffectState.ApplyEffectParameters.ItemStateObjectRef.ObjectID)); // Get the weapon this effect is being applied to
	if (AbilitySourceWeapon != none && AbilitySourceWeapon.ObjectID == EffectState.ApplyEffectParameters.ItemStateObjectRef.ObjectID) { // Check if the ability source weapon matches the weapon this effect will be applied to
		
		StandardHit = X2AbilityToHitCalc_StandardAim(AbilityState.GetMyTemplate().AbilityToHitCalc); // Get the shot type this ability is being applied to
		if (StandardHit != none && StandardHit.bReactionFire) { // Check if this is a reaction shot

			DamageEffect = X2Effect_ApplyWeaponDamage(class'X2Effect'.static.GetX2Effect(AppliedData.EffectRef)); // Get the damage effect that is being applied
			if (DamageEffect != none || !DamageEffect.bIgnoreBaseDamage) { // Only add the bonus damage when the damage effect is applying the weapon's base damage

				return BonusDmg;
			}
		}
	} // All else:
	
	return 0;
}