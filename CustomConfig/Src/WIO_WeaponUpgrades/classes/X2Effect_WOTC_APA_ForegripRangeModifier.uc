
class X2Effect_WOTC_APA_ForegripRangeModifier extends X2Effect_Persistent;

var float				RangePenaltyPercentNegated;
var int					ShortRangeTileCutoff;			// Tile range where bonuses end and penalties begin

var array<name>			RequiredEffectNames;


function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local XComGameState_Item	SourceWeapon;
	local X2WeaponTemplate		WeaponTemplate;
	local ShotModifierInfo		ShotInfo;
    local int					i, Tiles, NormalRange;
	local float					WeaponModifier, SquadsightModifier;
	local array<int>			RangeTable;
	local bool					bEffectCheck;

	if (AbilityState != none)
	{
		SourceWeapon = AbilityState.GetSourceWeapon();    
		if (SourceWeapon != none)
		{
			// Attack must come from correct SourceWeapon
			if (AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
				return;

			if (RequiredEffectNames.length == 0)
			{
				bEffectCheck = true;
			}
			else
			{
				for (i = 0; i < RequiredEffectNames.Length; ++i)
				{
					if (Attacker.AffectedByEffectNames.Find(RequiredEffectNames[i]) != Index_None)
					{
						bEffectCheck = true;
						break;
			}	}	}

			if (bEffectCheck)
			{
				WeaponTemplate = X2WeaponTemplate(SourceWeapon.GetMyTemplate());
				RangeTable = WeaponTemplate.RangeAccuracy;
				Tiles = Attacker.TileDistanceBetween(Target);

				if (Tiles < RangeTable.Length)
				{
					i = Tiles;
				}
				else // Use last value
				{
					i = RangeTable.Length - 1;
				}


				if (Tiles <= ShortRangeTileCutoff)
				{
					WeaponModifier = Abs(RangeTable[i]);
					WeaponModifier *= RangePenaltyPercentNegated;
				
					if (round(WeaponModifier) > 0)
					{
						ShotInfo.Value = int(WeaponModifier);
						ShotInfo.ModType = eHit_Success;
						ShotInfo.Reason = FriendlyName;
						ShotModifiers.AddItem(ShotInfo);
}	}	}	}	}	}