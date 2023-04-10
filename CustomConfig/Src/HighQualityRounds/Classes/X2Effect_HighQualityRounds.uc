// By Mythrell, v1.0
// Adds effect to be used by High Quality Rounds
// AimMod can be configured in ini, adds accuracy bonus. 

class X2Effect_HighQualityRounds extends X2Effect_Persistent;

var int AimMod;
var int CritChance;
var int CritDamage;
var int Pierce;
var int PierceChance;

function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local ShotModifierInfo ModInfo;
	local XComGameState_Item SourceWeapon;

	SourceWeapon = AbilityState.GetSourceWeapon();
	if (SourceWeapon != none && SourceWeapon.LoadedAmmo.ObjectID == EffectState.ApplyEffectParameters.ItemStateObjectRef.ObjectID)
	{
		ModInfo.ModType = eHit_Success;
		ModInfo.Reason = FriendlyName;
		ModInfo.Value = AimMod;
		ShotModifiers.AddItem(ModInfo);

		ModInfo.ModType = eHit_Crit;
		ModInfo.Reason = FriendlyName;
		ModInfo.Value = CritChance;
		ShotModifiers.AddItem(ModInfo);
	}
}

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState)
{
	local XComGameState_Item SourceWeapon;
	local XComGameState_Unit TargetUnit;

	//  only add bonus damage on a crit
	if (AppliedData.AbilityResultContext.HitResult == eHit_Crit)
	{
		SourceWeapon = AbilityState.GetSourceWeapon();
		//  make sure the ammo that created this effect is loaded into the weapon
		if (SourceWeapon != none && SourceWeapon.LoadedAmmo.ObjectID == EffectState.ApplyEffectParameters.ItemStateObjectRef.ObjectID)
		{
			//  only provide bonus damage to organic units
			TargetUnit = XComGameState_Unit(TargetDamageable);
			if (TargetUnit != none && !TargetUnit.IsRobotic())
				return CritDamage;
		}
	}
	return 0;
}

function int GetExtraArmorPiercing(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData)
{
	local XComGameState_Item SourceWeapon;
	local int	Roll;

	SourceWeapon = AbilityState.GetSourceWeapon();
	//  make sure the ammo that created this effect is loaded into the weapon
	if (SourceWeapon != none && SourceWeapon.LoadedAmmo.ObjectID == EffectState.ApplyEffectParameters.ItemStateObjectRef.ObjectID)
	{
		Roll = class'Engine'.static.GetEngine().SyncRand(100, "RollForArmorPiercing");
		if (Roll < default.PierceChance)
		{
			return default.Pierce;
		}	
	}
	return 0;
}


DefaultProperties
{
	DuplicateResponse = eDupe_Ignore
}