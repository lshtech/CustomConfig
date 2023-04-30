class X2AbilityTag_WOTC_APA_WeaponItemOverhaul extends X2AbilityTag;

// Modified and Implemented from Xylith's XModBase

// The previous X2AbilityTag. We save it so we can just call it to handle any tag we don't
// recognize, so we don't have to include a copy of the regular X2AbilityTag code. This also
// makes it so we will play well with any other mods that replace X2AbilityTag this way.
var X2AbilityTag WrappedTag;

simulated static function TrimTrailingZerosFromFloat(float InputValue, out string text)
{
	text = string(InputValue);

	while ((Len(text) > 0) && (InStr(text, "0", true) == Len(text) - 1))
		text = left(text, Len(text) - 1);
	while ((Len(text) > 0) && (InStr(text, ".", true) == Len(text) - 1))
		text = left(text, Len(text) - 1);
}

event ExpandHandler(string InString, out string OutString)
{
	local name						Type;
	local XComGameStateHistory		History;
	local XComGameState_Unit		TargetUnitState, SourceUnitState;
	local XComGameState_Item		ItemState;
	local X2WeaponTemplate			WeaponTemplate;
	local X2SoldierClassTemplate	ClassTemplate;
	local XComGameState_Effect		EffectState;
	local XComGameState_Ability		AbilityState;
	local X2AbilityTemplate			AbilityTemplate;
	local UnitValue					UnitValue;
	local name						nName;
	local string					sStr;
	local float						fVal;
	local int						iVal;

	Type = name(InString);
	History = `XCOMHISTORY;

	switch (Type)
	{			
		case 'LIGHTWEIGHT_FRAME_BASIC_MOBILITY_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.LIGHTWEIGHT_FRAME_BASIC_MOBILITY_BONUS);
			break;
		case 'LIGHTWEIGHT_FRAME_ADVANCED_MOBILITY_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.LIGHTWEIGHT_FRAME_ADVANCED_MOBILITY_BONUS);
			break;
		case 'LIGHTWEIGHT_FRAME_ADVANCED_AIM_PENALTY':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.LIGHTWEIGHT_FRAME_ADVANCED_AIM_PENALTY);
			break;
		case 'LIGHTWEIGHT_FRAME_PROTOTYPE_MOBILITY_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.LIGHTWEIGHT_FRAME_PROTOTYPE_MOBILITY_BONUS);
			break;

		case 'BEDDED_STOCK_BASIC_AIM_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.BEDDED_STOCK_BASIC_AIM_BONUS);
			break;
		case 'BEDDED_STOCK_ADVANCED_AIM_CRIT_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.BEDDED_STOCK_ADVANCED_AIM_CRIT_BONUS);
			break;
		case 'BEDDED_STOCK_ADVANCED_AIM_PENALTY':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.BEDDED_STOCK_ADVANCED_AIM_PENALTY);
			break;
		case 'BEDDED_STOCK_PROTOTYPE_AIM_CRIT_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.BEDDED_STOCK_PROTOTYPE_AIM_CRIT_BONUS);
			break;
		case 'BULLPUP_STOCK_MOBILITY_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.BULLPUP_STOCK_MOBILITY_BONUS);
			break;
		case 'BULLPUP_STOCK_REACTION_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.BULLPUP_STOCK_REACTION_BONUS);
			break;
		case 'SKELETONIZED_STOCK_MOBILITY_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SKELETONIZED_STOCK_MOBILITY_BONUS);
			break;
		case 'SKELETONIZED_STOCK_DETECTION_RADIUS_BONUS':
			OutString = string(int(100 * class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SKELETONIZED_STOCK_DETECTION_RADIUS_BONUS));
			break;

		case 'SCOPE_BASIC_DIRECT_SHOT_AIM_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SCOPE_BASIC_DIRECT_SHOT_AIM_BONUS);
			break;
		case 'SCOPE_ADVANCED_DIRECT_SHOT_AIM_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SCOPE_ADVANCED_DIRECT_SHOT_AIM_BONUS);
			break;
		case 'SCOPE_PROTOTYPE_DIRECT_SHOT_AIM_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SCOPE_PROTOTYPE_DIRECT_SHOT_AIM_BONUS);
			break;
		case 'SNIPER_SCOPE_AIM_CRIT_CHANCE_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SNIPER_SCOPE_AIM_CRIT_CHANCE_BONUS);
			break;

		case 'REFLEX_SIGHT_BASIC_REACTION_SHOT_AIM_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.REFLEX_SIGHT_BASIC_REACTION_SHOT_AIM_BONUS);
			break;
		case 'REFLEX_SIGHT_ADVANCED_REACTION_SHOT_AIM_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.REFLEX_SIGHT_ADVANCED_REACTION_SHOT_AIM_BONUS);
			break;
		case 'REFLEX_SIGHT_PROTOTYPE_REACTION_SHOT_AIM_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.REFLEX_SIGHT_PROTOTYPE_REACTION_SHOT_AIM_BONUS);
			break;
		case 'IRON_SIGHTS_DAMAGE_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.IRON_SIGHTS_DAMAGE_BONUS);
			break;
		case 'IRON_SIGHTS_CRIT_CHANCE_PENALTY':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.IRON_SIGHTS_CRIT_CHANCE_PENALTY);
			break;

		case 'LASER_SIGHT_EFFECTIVE_TILE_RANGE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.LASER_SIGHT_EFFECTIVE_TILE_RANGE);
			break;
		case 'LASER_SIGHT_BASIC_CRIT_CHANCE_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.LASER_SIGHT_BASIC_CRIT_CHANCE_BONUS);
			break;
		case 'LASER_SIGHT_ADVANCED_CRIT_CHANCE_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.LASER_SIGHT_ADVANCED_CRIT_CHANCE_BONUS);
			break;
		case 'LASER_SIGHT_PROTOTYPE_CRIT_CHANCE_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.LASER_SIGHT_PROTOTYPE_CRIT_CHANCE_BONUS);
			break;

		case 'BIPOD_TILE_RANGE_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.BIPOD_TILE_RANGE_BONUS);
			break;
		case 'BIPOD_BASIC_RANGE_ACCURACY_MOD':
			OutString = string(int(100 * class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.BIPOD_BASIC_RANGE_ACCURACY_MOD));
			break;
		case 'BIPOD_ADVANCED_RANGE_ACCURACY_MOD':
			OutString = string(int(100 * class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.BIPOD_ADVANCED_RANGE_ACCURACY_MOD));
			break;
		case 'BIPOD_ADVANCED_MOBILITY_PENALTY':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.BIPOD_ADVANCED_MOBILITY_PENALTY);
			break;
		case 'BIPOD_PROTOTYPE_RANGE_ACCURACY_MOD':
			OutString = string(int(100 * class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.BIPOD_PROTOTYPE_RANGE_ACCURACY_MOD));
			break;

		case 'SUPPRESSOR_SOUND_RANGE_REDUCTION':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SUPPRESSOR_SOUND_RANGE_REDUCTION);
			break;
		case 'SUPPRESSOR_BASIC_CONCEALED_CRIT_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SUPPRESSOR_BASIC_CONCEALED_CRIT_CHANCE);
			break;
		case 'SUPPRESSOR_ADVANCED_CONCEALED_CRIT_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SUPPRESSOR_ADVANCED_CONCEALED_CRIT_CHANCE);
			break;
		case 'SUPPRESSOR_ADVANCED_REACTION_SHOT_AIM_PENALTY':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SUPPRESSOR_ADVANCED_REACTION_SHOT_AIM_PENALTY);
			break;
		case 'SUPPRESSOR_PROTOTYPE_CONCEALED_CRIT_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SUPPRESSOR_PROTOTYPE_CONCEALED_CRIT_CHANCE);
			break;
		case 'HEAVY_CANNON_BARREL_MOBILITY_PENALTY':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.HEAVY_CANNON_BARREL_MOBILITY_PENALTY);
			break;
		case 'HEAVY_CANNON_BARREL_SHRED_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.HEAVY_CANNON_BARREL_SHRED_BONUS);
			break;
		case 'FULLBORE_BARREL_PIERCE_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.FULLBORE_BARREL_PIERCE_BONUS);
			break;
		case 'SMOOTHBORE_BARREL_CHANCE_MOD_PER_ARMOR':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SMOOTHBORE_BARREL_CHANCE_MOD_PER_ARMOR);
			break;

		case 'FOREGRIP_EFFECTIVE_TILE_RANGE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.FOREGRIP_EFFECTIVE_TILE_RANGE);
			break;
		case 'FOREGRIP_BASIC_REACTION_SHOT_AIM_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.FOREGRIP_BASIC_REACTION_SHOT_AIM_BONUS);
			break;
		case 'FOREGRIP_ADVANCED_RANGE_ACCURACY_MOD':
			OutString = string(int(100 * class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.FOREGRIP_ADVANCED_RANGE_ACCURACY_MOD));
			break;
		case 'FOREGRIP_ADVANCED_AIM_PENALTY':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.FOREGRIP_ADVANCED_AIM_PENALTY);
			break;
		case 'FOREGRIP_PROTOTYPE_RANGE_ACCURACY_MOD':
			OutString = string(int(100 * class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.FOREGRIP_PROTOTYPE_RANGE_ACCURACY_MOD));
			break;

		case 'EXPANDED_MAGAZINE_BASIC_AMMO_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.EXPANDED_MAGAZINE_BASIC_AMMO_BONUS);
			break;
		case 'EXPANDED_MAGAZINE_ADVANCED_AMMO_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.EXPANDED_MAGAZINE_ADVANCED_AMMO_BONUS);
			break;
		case 'EXPANDED_MAGAZINE_ADVANCED_MOBILITY_PENALTY':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.EXPANDED_MAGAZINE_ADVANCED_MOBILITY_PENALTY);
			break;
		case 'EXPANDED_MAGAZINE_PROTOTYPE_AMMO_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.EXPANDED_MAGAZINE_PROTOTYPE_AMMO_BONUS);
			break;

		case 'SPEEDLOADER_BASIC_FREE_RELOADS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SPEEDLOADER_BASIC_FREE_RELOADS);
			break;
		case 'SPEEDLOADER_ADVANCED_FREE_RELOADS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SPEEDLOADER_ADVANCED_FREE_RELOADS);
			break;
		case 'SPEEDLOADER_PROTOTYPE_FREE_RELOADS':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.SPEEDLOADER_PROTOTYPE_FREE_RELOADS);
			break;

		case 'WILDCAT_CARTRIDGE_BONUS_CRIT_DAMAGE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.WILDCAT_CARTRIDGE_BONUS_CRIT_DAMAGE);
			break;
		case 'WILDCAT_CARTRIDGE_BASIC_CRIT_DAMAGE_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.WILDCAT_CARTRIDGE_BASIC_CRIT_DAMAGE_CHANCE);
			break;
		case 'WILDCAT_CARTRIDGE_ADVANCED_CRIT_DAMAGE_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.WILDCAT_CARTRIDGE_ADVANCED_CRIT_DAMAGE_CHANCE);
			break;
		case 'WILDCAT_CARTRIDGE_ADVANCED_GRAZE_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.WILDCAT_CARTRIDGE_ADVANCED_GRAZE_CHANCE);
			break;
		case 'WILDCAT_CARTRIDGE_PROTOTYPE_CRIT_DAMAGE_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.WILDCAT_CARTRIDGE_PROTOTYPE_CRIT_DAMAGE_CHANCE);
			break;
		case 'WILDCAT_CARTRIDGE_BONUS_DAMAGE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.WILDCAT_CARTRIDGE_BONUS_DAMAGE);
			break;
		
		case 'HAIRTRIGGER_BASIC_DAMAGE_VALUE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.HAIRTRIGGER_BASIC_DAMAGE_VALUE);
			break;
		case 'HAIRTRIGGER_ADVANCED_DAMAGE_VALUE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.HAIRTRIGGER_ADVANCED_DAMAGE_VALUE);
			break;
		case 'HAIRTRIGGER_ADVANCED_AIM_PENALTY':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.HAIRTRIGGER_ADVANCED_AIM_PENALTY);
			break;
		case 'HAIRTRIGGER_PROTOTYPE_DAMAGE_VALUE':
			OutString = string(class'X2Ability_WOTC_APA_WeaponUpgradeAbilitySet'.default.HAIRTRIGGER_PROTOTYPE_DAMAGE_VALUE);
			break;

		// We don't handle this tag, check the wrapped tag.
		default:
			WrappedTag.ParseObj = ParseObj;
			WrappedTag.StrategyParseObj = StrategyParseObj;
			WrappedTag.GameState = GameState;
			WrappedTag.ExpandHandler(InString, OutString);
			// clear them out again (the 3 lines below are the part updated from 2.0.0 to prevent garbage collection-related crashes after missions)
			WrappedTag.ParseObj = none;
			WrappedTag.StrategyParseObj = none;
			WrappedTag.GameState = none;  
			return;
	}
}