
class X2Effect_WOTC_APA_OpticRangeTableModifier extends X2Effect_Persistent;

var bool				bShortRangeBonus;
var bool				bShortRangePenalty;

var bool				bLongRangeBonus;
var bool				bLongRangePenalty;


function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local XComGameState_Item	SourceWeapon;
	local ShotModifierInfo		ShotInfo;
    local int					Tiles;
	local array<int>			RangeTable;
	local int					WeaponModifier;

	if (AbilityState != none)
	{
		SourceWeapon = AbilityState.GetSourceWeapon();    
		if (SourceWeapon != none)
		{
			// Attack must come from correct SourceWeapon
			if (AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
				return;

			Tiles = Attacker.TileDistanceBetween(Target);

			if (bShortRangeBonus)
			{
				RangeTable = class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.OPTIC_CLOSE_RANGE_BONUS;
				WeaponModifier += GetRangeTableModifier(Tiles, RangeTable);
			}

			if (bShortRangePenalty)
			{
				RangeTable = class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.OPTIC_CLOSE_RANGE_PENALTY;
				WeaponModifier += GetRangeTableModifier(Tiles, RangeTable);
			}

			if (bLongRangeBonus)
			{
				RangeTable = class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.OPTIC_LONG_RANGE_BONUS;
				WeaponModifier += GetRangeTableModifier(Tiles, RangeTable);
			}

			if (bLongRangePenalty)
			{
				RangeTable = class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.OPTIC_LONG_RANGE_PENALTY;
				WeaponModifier += GetRangeTableModifier(Tiles, RangeTable);
			}

			if (WeaponModifier != 0)
			{
				ShotInfo.Value = WeaponModifier;
				ShotInfo.ModType = eHit_Success;
				ShotInfo.Reason = FriendlyName;
				ShotModifiers.AddItem(ShotInfo);
}	}	}	}


function int GetRangeTableModifier(int Tiles, array<int> RangeTable)
{
	if (Tiles < RangeTable.Length)
	{
		return RangeTable[Tiles];
	}
	else // Use last value
	{
		return RangeTable[RangeTable.Length - 1];
}	}