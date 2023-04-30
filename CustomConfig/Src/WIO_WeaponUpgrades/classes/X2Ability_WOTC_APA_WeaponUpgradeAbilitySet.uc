class X2Ability_WOTC_APA_WeaponUpgradeAbilitySet extends X2Ability config(WOTC_APA_WeaponUpgrades);

// Body Upgrade Variables:
var config int				LIGHTWEIGHT_FRAME_BASIC_MOBILITY_BONUS;
var config int				LIGHTWEIGHT_FRAME_ADVANCED_MOBILITY_BONUS;
var config int				LIGHTWEIGHT_FRAME_ADVANCED_AIM_PENALTY;
var config int				LIGHTWEIGHT_FRAME_PROTOTYPE_MOBILITY_BONUS;

var config int				BEDDED_STOCK_BASIC_AIM_BONUS;
var config int				BEDDED_STOCK_ADVANCED_AIM_CRIT_BONUS;
var config int				BEDDED_STOCK_ADVANCED_AIM_PENALTY;
var config int				BEDDED_STOCK_PROTOTYPE_AIM_CRIT_BONUS;
var config int				SKELETONIZED_STOCK_MOBILITY_BONUS;
var config float			SKELETONIZED_STOCK_DETECTION_RADIUS_BONUS;
var config int				BULLPUP_STOCK_MOBILITY_BONUS;
var config int				BULLPUP_STOCK_REACTION_BONUS;

// Optic Upgrade Variables:
var config int				SCOPE_BASIC_DIRECT_SHOT_AIM_BONUS;
var config int				SCOPE_ADVANCED_DIRECT_SHOT_AIM_BONUS;
var config int				SCOPE_PROTOTYPE_DIRECT_SHOT_AIM_BONUS;
var config int				SNIPER_SCOPE_AIM_CRIT_CHANCE_BONUS;

var config int				REFLEX_SIGHT_BASIC_REACTION_SHOT_AIM_BONUS;
var config int				REFLEX_SIGHT_ADVANCED_REACTION_SHOT_AIM_BONUS;
var config int				REFLEX_SIGHT_PROTOTYPE_REACTION_SHOT_AIM_BONUS;
var config int				IRON_SIGHTS_DAMAGE_BONUS;
var config int				IRON_SIGHTS_CRIT_CHANCE_PENALTY;

var config int				LASER_SIGHT_EFFECTIVE_TILE_RANGE;
var config int				LASER_SIGHT_BASIC_CRIT_CHANCE_BONUS;
var config int				LASER_SIGHT_ADVANCED_CRIT_CHANCE_BONUS;
var config int				LASER_SIGHT_PROTOTYPE_CRIT_CHANCE_BONUS;

var config array<int>		OPTIC_LONG_RANGE_BONUS;
var config array<int>		OPTIC_LONG_RANGE_PENALTY;
var config array<int>		OPTIC_CLOSE_RANGE_BONUS;
var config array<int>		OPTIC_CLOSE_RANGE_PENALTY;

// Barrel Upgrade Variables:
var config int				SUPPRESSOR_SOUND_RANGE_REDUCTION;
var config int				SUPPRESSOR_BASIC_CONCEALED_CRIT_CHANCE;
var config int				SUPPRESSOR_ADVANCED_CONCEALED_CRIT_CHANCE;
var config int				SUPPRESSOR_ADVANCED_REACTION_SHOT_AIM_PENALTY;
var config int				SUPPRESSOR_PROTOTYPE_CONCEALED_CRIT_CHANCE;

var config int				BIPOD_TILE_RANGE_BONUS;
var config float			BIPOD_BASIC_RANGE_ACCURACY_MOD;
var config float			BIPOD_ADVANCED_RANGE_ACCURACY_MOD;
var config int				BIPOD_ADVANCED_MOBILITY_PENALTY;
var config float			BIPOD_PROTOTYPE_RANGE_ACCURACY_MOD;

var config int				FOREGRIP_EFFECTIVE_TILE_RANGE;
var config int				FOREGRIP_BASIC_REACTION_SHOT_AIM_BONUS;
var config float			FOREGRIP_ADVANCED_RANGE_ACCURACY_MOD;
var config int				FOREGRIP_ADVANCED_AIM_PENALTY;
var config float			FOREGRIP_PROTOTYPE_RANGE_ACCURACY_MOD;

var config int				HEAVY_CANNON_BARREL_MOBILITY_PENALTY;
var config int				HEAVY_CANNON_BARREL_SHRED_BONUS;

var config int				FULLBORE_BARREL_PIERCE_BONUS;

var config int				SMOOTHBORE_BARREL_CHANCE_MOD_PER_ARMOR;

// Magazine Upgrade Variables:
var config int				EXPANDED_MAGAZINE_BASIC_AMMO_BONUS;
var config int				EXPANDED_MAGAZINE_ADVANCED_AMMO_BONUS;
var config int				EXPANDED_MAGAZINE_ADVANCED_MOBILITY_PENALTY;
var config int				EXPANDED_MAGAZINE_PROTOTYPE_AMMO_BONUS;

var config int				SPEEDLOADER_BASIC_FREE_RELOADS;
var config int				SPEEDLOADER_ADVANCED_FREE_RELOADS;
var config int				SPEEDLOADER_PROTOTYPE_FREE_RELOADS;

var config int				WILDCAT_CARTRIDGE_BONUS_CRIT_DAMAGE;
var config int				WILDCAT_CARTRIDGE_BASIC_CRIT_DAMAGE_CHANCE;
var config int				WILDCAT_CARTRIDGE_ADVANCED_CRIT_DAMAGE_CHANCE;
var config int				WILDCAT_CARTRIDGE_ADVANCED_GRAZE_CHANCE;
var config int				WILDCAT_CARTRIDGE_PROTOTYPE_CRIT_DAMAGE_CHANCE;
var config int				WILDCAT_CARTRIDGE_BONUS_DAMAGE;

// Trigger Upgrade Variables:
var config int 				HAIRTRIGGER_BASIC_DAMAGE_VALUE;
var config int 				HAIRTRIGGER_ADVANCED_DAMAGE_VALUE;
var config int 				HAIRTRIGGER_ADVANCED_AIM_PENALTY;
var config int 				HAIRTRIGGER_PROTOTYPE_DAMAGE_VALUE;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(WOTC_APA_LightweightFrame_BasicBonus());
	Templates.AddItem(WOTC_APA_LightweightFrame_AdvancedBonus());
	Templates.AddItem(WOTC_APA_LightweightFrame_AdvancedPenalty());
	Templates.AddItem(WOTC_APA_LightweightFrame_PrototypeBonus());

	Templates.AddItem(WOTC_APA_BeddedStock_BasicBonus());
	Templates.AddItem(WOTC_APA_BeddedStock_AdvancedBonus());
	Templates.AddItem(WOTC_APA_BeddedStock_SuperiorBonus());
	Templates.AddItem(WOTC_APA_BeddedStock_PrototypeBonus());
	Templates.AddItem(WOTC_APA_SkeletonizedStock());
	Templates.AddItem(WOTC_APA_BullpupStock());

	Templates.AddItem(WOTC_APA_Scope_BasicBonus());
	Templates.AddItem(WOTC_APA_Scope_AdvancedBonus());
	Templates.AddItem(WOTC_APA_Scope_AdvancedPenalty());
	Templates.AddItem(WOTC_APA_Scope_PrototypeBonus());
	Templates.AddItem(WOTC_APA_SniperScope());

	Templates.AddItem(WOTC_APA_ReflexSight_BasicBonus());
	Templates.AddItem(WOTC_APA_ReflexSight_AdvancedBonus());
	Templates.AddItem(WOTC_APA_ReflexSight_AdvancedPenalty());
	Templates.AddItem(WOTC_APA_ReflexSight_PrototypeBonus());

	Templates.AddItem(WOTC_APA_LaserSight_BasicBonus());
	Templates.AddItem(WOTC_APA_LaserSight_AdvancedBonus());
	Templates.AddItem(WOTC_APA_LaserSight_AdvancedPenalty());
	Templates.AddItem(WOTC_APA_LaserSight_PrototypeBonus());

	Templates.AddItem(WOTC_APA_Bipod_BasicBonus());
	Templates.AddItem(WOTC_APA_Bipod_AdvancedBonus());
	Templates.AddItem(WOTC_APA_Bipod_AdvancedPenalty());
	Templates.AddItem(WOTC_APA_Bipod_PrototypeBonus());

	Templates.AddItem(WOTC_APA_Suppressor_BasicBonus());
	Templates.AddItem(WOTC_APA_Suppressor_AdvancedBonus());
	Templates.AddItem(WOTC_APA_Suppressor_AdvancedPenalty());
	Templates.AddItem(WOTC_APA_Suppressor_PrototypeBonus());

	Templates.AddItem(WOTC_APA_Foregrip_BasicBonus());
	Templates.AddItem(WOTC_APA_Foregrip_AdvancedBonus());
	Templates.AddItem(WOTC_APA_Foregrip_AdvancedPenalty());
	Templates.AddItem(WOTC_APA_Foregrip_PrototypeBonus());

	Templates.AddItem(WOTC_APA_HeavyCannonBarrel());

	Templates.AddItem(WOTC_APA_SmoothboreBarrel());

	Templates.AddItem(WOTC_APA_FullboreBarrel());

	Templates.AddItem(WOTC_APA_ExpandedMag_AdvancedPenalty());

	Templates.AddItem(WOTC_APA_Speedloader_AdvancedPenalty());

	Templates.AddItem(WOTC_APA_WildcatCartridges_BasicBonus());
	Templates.AddItem(WOTC_APA_WildcatCartridges_AdvancedBonus());
	Templates.AddItem(WOTC_APA_WildcatCartridges_SuperiorBonus());
	Templates.AddItem(WOTC_APA_WildcatCartridges_PrototypeBonus());

	Templates.AddItem(WOTC_APA_HairTrigger_BasicBonus());
	Templates.AddItem(WOTC_APA_HairTrigger_AdvancedBonus());
	Templates.AddItem(WOTC_APA_HairTrigger_AdvancedPenalty());
	Templates.AddItem(WOTC_APA_HairTrigger_PrototypeBonus());

	return Templates;
}

// -----------------------------------------------------------------------------------------------

// Helper function to setup basic framework for passive abilities
static function X2AbilityTemplate CreatePassiveAbility(name AbilityName, optional string IconString, optional name IconEffectName = AbilityName, optional bool bDisplayIcon = true)
{	
	local X2AbilityTemplate					Template;
	local X2Effect_Persistent				IconEffect;
	
	`CREATE_X2ABILITY_TEMPLATE (Template, AbilityName);
	Template.IconImage = IconString;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.bCrossClassEligible = false;
	Template.bUniqueSource = true;
	Template.bIsPassive = true;

	// Dummy effect to show a passive icon in the tactical UI for the SourceUnit
	IconEffect = new class'X2Effect_Persistent';
	IconEffect.BuildPersistentEffect(1, true, false);
	IconEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, bDisplayIcon,, Template.AbilitySourceName);
	IconEffect.EffectName = IconEffectName;
	Template.AddTargetEffect(IconEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	return Template;
}

// -----------------------------------------------------------------------------------------------

// Lightweight Frame: Basic Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_LightweightFrame_BasicBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_PersistentStatChange								Effect;

	Template = CreatePassiveAbility('WOTC_APA_LightweightFrame_BasicBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that adds [default: 1] mobility
	Effect = new class 'X2Effect_PersistentStatChange';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.AddPersistentStatChange(eStat_Mobility, default.LIGHTWEIGHT_FRAME_BASIC_MOBILITY_BONUS);
	Template.AddTargetEffect(Effect);

	// Add UI stat markups corresponding to effect stat boosts
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.LIGHTWEIGHT_FRAME_BASIC_MOBILITY_BONUS);

	return Template;
}

// Lightweight Frame: Advanced Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_LightweightFrame_AdvancedBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_PersistentStatChange								Effect;

	Template = CreatePassiveAbility('WOTC_APA_LightweightFrame_AdvancedBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that adds [default: 2] mobility
	Effect = new class 'X2Effect_PersistentStatChange';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.AddPersistentStatChange(eStat_Mobility, default.LIGHTWEIGHT_FRAME_ADVANCED_MOBILITY_BONUS);
	Template.AddTargetEffect(Effect);

	// Add UI stat markups corresponding to effect stat boosts
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.LIGHTWEIGHT_FRAME_ADVANCED_MOBILITY_BONUS);

	return Template;
}

// Lightweight Frame: Advanced Penalty - Passive:
static function X2AbilityTemplate WOTC_APA_LightweightFrame_AdvancedPenalty()
{
	local X2AbilityTemplate											Template;
	local X2AbilityTrigger_EventListener							EventTrigger;
	local X2Effect_PersistentStatChange								StatEffect;

	Template = CreatePassiveAbility('WOTC_APA_LightweightFrame_AdvancedPenalty',,, false);
	Template.AbilityTriggers.Length = 0;

	// Trigger on movement
	EventTrigger = new class'X2AbilityTrigger_EventListener';
	EventTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	EventTrigger.ListenerData.EventID = 'UnitMoveFinished';
	EventTrigger.ListenerData.Filter = eFilter_Unit;
	Template.AbilityTriggers.AddItem(EventTrigger);

	// Create a persistent stat change effect that handles built-in stat modifiers
	StatEffect = new class 'X2Effect_PersistentStatChange';
	StatEffect.EffectName = 'WOTC_APA_LightweightFrame_AdvancedPenaltyEffect';
	StatEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	StatEffect.AddPersistentStatChange(eStat_Offense, default.LIGHTWEIGHT_FRAME_ADVANCED_AIM_PENALTY);
	StatEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage,,, Template.AbilitySourceName);
	StatEffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(StatEffect);

	return Template;
}

// Lightweight Frame: Prototype Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_LightweightFrame_PrototypeBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_PersistentStatChange								Effect;

	Template = CreatePassiveAbility('WOTC_APA_LightweightFrame_PrototypeBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that adds [default: 4] mobility
	Effect = new class 'X2Effect_PersistentStatChange';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.AddPersistentStatChange(eStat_Mobility, default.LIGHTWEIGHT_FRAME_Prototype_MOBILITY_BONUS);
	Template.AddTargetEffect(Effect);

	// Add UI stat markups corresponding to effect stat boosts
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.LIGHTWEIGHT_FRAME_PROTOTYPE_MOBILITY_BONUS);

	return Template;
}

// -----------------------------------------------------------------------------------------------

// Bedded Stock: Basic Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_BeddedStock_BasicBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_BeddedStockModifier						HitEffect;

	Template = CreatePassiveAbility('WOTC_APA_BeddedStock_BasicBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that adds [default: 1] mobility
	HitEffect = new class'X2Effect_WOTC_APA_BeddedStockModifier';
	HitEffect.BuildPersistentEffect(1, true, false, false);
	HitEffect.AimModifier = default.BEDDED_STOCK_BASIC_AIM_BONUS;
	HitEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitEffect);

	return Template;
}

// Bedded Stock: Advanced Bonus & Penalty - Passive:
static function X2AbilityTemplate WOTC_APA_BeddedStock_AdvancedBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_BeddedStockModifier						HitEffect;

	Template = CreatePassiveAbility('WOTC_APA_BeddedStock_AdvancedBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that adds [default: 1] mobility
	HitEffect = new class'X2Effect_WOTC_APA_BeddedStockModifier';
	HitEffect.BuildPersistentEffect(1, true, false, false);
	HitEffect.AimModifier = default.BEDDED_STOCK_ADVANCED_AIM_CRIT_BONUS;
	HitEffect.CritModifier = default.BEDDED_STOCK_ADVANCED_AIM_CRIT_BONUS;
	HitEffect.PenalizeAimModifier = default.BEDDED_STOCK_ADVANCED_AIM_PENALTY;
	HitEffect.bPenalizeDifferentTarget = true;
	HitEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitEffect);

	return Template;
}

// Bedded Stock: Superior Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_BeddedStock_SuperiorBonus()
{	
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_BeddedStockModifier						HitEffect;

	Template = CreatePassiveAbility('WOTC_APA_BeddedStock_SuperiorBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that adds [default: 1] mobility
	HitEffect = new class'X2Effect_WOTC_APA_BeddedStockModifier';
	HitEffect.BuildPersistentEffect(1, true, false, false);
	HitEffect.AimModifier = default.BEDDED_STOCK_ADVANCED_AIM_CRIT_BONUS;
	HitEffect.CritModifier = default.BEDDED_STOCK_ADVANCED_AIM_CRIT_BONUS;
	HitEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitEffect);

	return Template;
}

// Bedded Stock: Prototype Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_BeddedStock_PrototypeBonus()
{	
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_BeddedStockModifier						HitEffect;

	Template = CreatePassiveAbility('WOTC_APA_BeddedStock_PrototypeBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that adds [default: 1] mobility
	HitEffect = new class'X2Effect_WOTC_APA_BeddedStockModifier';
	HitEffect.BuildPersistentEffect(1, true, false, false);
	HitEffect.AimModifier = default.BEDDED_STOCK_PROTOTYPE_AIM_CRIT_BONUS;
	HitEffect.CritModifier = default.BEDDED_STOCK_PROTOTYPE_AIM_CRIT_BONUS;
	HitEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitEffect);

	return Template;
}

// Skeletonized Stock - Passive:
static function X2AbilityTemplate WOTC_APA_SkeletonizedStock()
{
	local X2AbilityTemplate											Template;
	local X2Effect_PersistentStatChange								StatEffect;

	Template = CreatePassiveAbility('WOTC_APA_SkeletonizedStock', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that handles built-in stat modifiers
	StatEffect = new class 'X2Effect_PersistentStatChange';
	StatEffect.BuildPersistentEffect(1, true, false, false);
	StatEffect.AddPersistentStatChange(eStat_Mobility, default.SKELETONIZED_STOCK_MOBILITY_BONUS);
	StatEffect.AddPersistentStatChange(eStat_DetectionModifier, default.SKELETONIZED_STOCK_DETECTION_RADIUS_BONUS);
	Template.AddTargetEffect(StatEffect);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.SKELETONIZED_STOCK_MOBILITY_BONUS);

	return Template;
}

// Bullpup Stock - Passive:
static function X2AbilityTemplate WOTC_APA_BullpupStock()
{
	local X2AbilityTemplate											Template;
	local X2Effect_PersistentStatChange								StatEffect;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;

	Template = CreatePassiveAbility('WOTC_APA_BullpupStock', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that handles built-in stat modifiers
	StatEffect = new class 'X2Effect_PersistentStatChange';
	StatEffect.BuildPersistentEffect(1, true, false, false);
	StatEffect.AddPersistentStatChange(eStat_Mobility, default.BULLPUP_STOCK_MOBILITY_BONUS);
	Template.AddTargetEffect(StatEffect);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.BULLPUP_STOCK_MOBILITY_BONUS);

	// Create a persistent effect to increase chance to hit for Reaction Attacks
	AimEffect = new class 'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToReactionShots = true;
	AimEffect.AimModifier = default.BULLPUP_STOCK_REACTION_BONUS;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	return Template;
}

// -----------------------------------------------------------------------------------------------

// Scope: Basic Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_Scope_BasicBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;
	local X2Effect_WOTC_APA_OpticRangeTableModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_Scope_BasicBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to hit for Direct Attacks
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToDirectShots = true;
	AimEffect.AimModifier = default.SCOPE_BASIC_DIRECT_SHOT_AIM_BONUS;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	// Create a persistent effect to increase long range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_OpticRangeTableModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.bLongRangeBonus = true;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocHelpText, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Scope: Advanced Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_Scope_AdvancedBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;
	local X2Effect_WOTC_APA_OpticRangeTableModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_Scope_AdvancedBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to hit for Direct Attacks
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToDirectShots = true;
	AimEffect.AimModifier = default.SCOPE_ADVANCED_DIRECT_SHOT_AIM_BONUS;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	// Create a persistent effect to increase long range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_OpticRangeTableModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.bLongRangeBonus = true;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocHelpText, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Scope: Advanced Penalty - Passive:
static function X2AbilityTemplate WOTC_APA_Scope_AdvancedPenalty()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_OpticRangeTableModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_Scope_AdvancedPenalty', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase long range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_OpticRangeTableModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.bShortRangePenalty = true;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Scope: Prototype Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_Scope_PrototypeBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;
	local X2Effect_WOTC_APA_OpticRangeTableModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_Scope_PrototypeBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to hit for Direct Attacks
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToDirectShots = true;
	AimEffect.AimModifier = default.SCOPE_PROTOTYPE_DIRECT_SHOT_AIM_BONUS;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	// Create a persistent effect to increase long range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_OpticRangeTableModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.bLongRangeBonus = true;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocHelpText, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Sniper Scope - Passive:
static function X2AbilityTemplate WOTC_APA_SniperScope()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;

	Template = CreatePassiveAbility('WOTC_APA_SniperScope', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to hit for Direct Attacks
	AimEffect = new class 'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToDirectShots = true;
	AimEffect.AimModifier = default.SNIPER_SCOPE_AIM_CRIT_CHANCE_BONUS;
	AimEffect.CritModifier = default.SNIPER_SCOPE_AIM_CRIT_CHANCE_BONUS;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	return Template;
}

// -----------------------------------------------------------------------------------------------

// Reflex Sight: Basic Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_ReflexSight_BasicBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;
	local X2Effect_WOTC_APA_OpticRangeTableModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_Scope_ReflexSight', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to hit for Reaction Attacks
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToReactionShots = true;
	AimEffect.AimModifier = default.REFLEX_SIGHT_BASIC_REACTION_SHOT_AIM_BONUS;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	// Create a persistent effect to increase short range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_OpticRangeTableModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.bShortRangeBonus = true;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Reflex Sight: Advanced Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_ReflexSight_AdvancedBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;
	local X2Effect_WOTC_APA_OpticRangeTableModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_ReflexSight_AdvancedBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to hit for Reaction Attacks
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToReactionShots = true;
	AimEffect.AimModifier = default.REFLEX_SIGHT_ADVANCED_REACTION_SHOT_AIM_BONUS;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	// Create a persistent effect to increase long range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_OpticRangeTableModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.bShortRangeBonus = true;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Reflex Sight: Advanced Penalty - Passive:
static function X2AbilityTemplate WOTC_APA_ReflexSight_AdvancedPenalty()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_OpticRangeTableModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_ReflexSight_AdvancedPenalty', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase long range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_OpticRangeTableModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.bLongRangePenalty = true;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Reflex Sight: Prototype Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_ReflexSight_PrototypeBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;
	local X2Effect_WOTC_APA_OpticRangeTableModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_ReflexSight_PrototypeBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to hit for Reaction Attacks
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToReactionShots = true;
	AimEffect.AimModifier = default.REFLEX_SIGHT_PROTOTYPE_REACTION_SHOT_AIM_BONUS;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	// Create a persistent effect to increase long range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_OpticRangeTableModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.bShortRangeBonus = true;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Pistol Iron Sights Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_IronSights()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WildcatCartridges						HitEffect;

	Template = CreatePassiveAbility('WOTC_APA_IronSights', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that adds chance to increase Crit damage
	HitEffect = new class'X2Effect_WOTC_APA_WildcatCartridges';
	HitEffect.BuildPersistentEffect(1, true, false, false);
	HitEffect.BonusDmg = default.IRON_SIGHTS_DAMAGE_BONUS;
	HitEffect.BonusCritDmg = 0;
	HitEffect.BonusChance = default.IRON_SIGHTS_CRIT_CHANCE_PENALTY;
	HitEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitEffect);

	return Template;
}

// -----------------------------------------------------------------------------------------------

// Laser Sight: Basic Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_LaserSight_BasicBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;
	local X2Effect_WOTC_APA_OpticRangeTableModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_LaserSight_BasicBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to crit for attacks within [default: 8 Tiles]
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToDirectShots = true;
	AimEffect.bApplyToReactionShots = true;
	AimEffect.TileLimitCeiling = default.LASER_SIGHT_EFFECTIVE_TILE_RANGE;
	AimEffect.CritModifier = default.LASER_SIGHT_BASIC_CRIT_CHANCE_BONUS;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	// Create a persistent effect to increase short range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_OpticRangeTableModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.bShortRangeBonus = true;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Laser Sight: Advanced Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_LaserSight_AdvancedBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;
	local X2Effect_WOTC_APA_OpticRangeTableModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_LaserSight_AdvancedBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to crit for attacks within [default: 8 Tiles]
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToDirectShots = true;
	AimEffect.bApplyToReactionShots = true;
	AimEffect.TileLimitCeiling = default.LASER_SIGHT_EFFECTIVE_TILE_RANGE;
	AimEffect.CritModifier = default.LASER_SIGHT_ADVANCED_CRIT_CHANCE_BONUS;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	// Create a persistent effect to increase long range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_OpticRangeTableModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.bShortRangeBonus = true;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Laser Sight: Advanced Penalty - Passive:
static function X2AbilityTemplate WOTC_APA_LaserSight_AdvancedPenalty()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_OpticRangeTableModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_LaserSight_AdvancedPenalty', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase long range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_OpticRangeTableModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.bLongRangePenalty = true;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Laser Sight: Prototype Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_LaserSight_PrototypeBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;
	local X2Effect_WOTC_APA_OpticRangeTableModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_LaserSight_PrototypeBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to crit for attacks within [default: 8 Tiles]
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToDirectShots = true;
	AimEffect.bApplyToReactionShots = true;
	AimEffect.TileLimitCeiling = default.LASER_SIGHT_EFFECTIVE_TILE_RANGE + 2;
	AimEffect.CritModifier = default.LASER_SIGHT_PROTOTYPE_CRIT_CHANCE_BONUS;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	// Create a persistent effect to increase long range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_OpticRangeTableModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.bShortRangeBonus = true;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// -----------------------------------------------------------------------------------------------

// Bipod: Basic Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_Bipod_BasicBonus()
{
	local X2AbilityTemplate								Template;
	local X2Effect_WOTC_APA_BipodRangeModifiers			HitModEffect;
	local X2Effect_Persistent							PersistentEffect;
	local X2Effect_WOTC_APA_RemovedOnMoveStatChange		StatChangeEffect;
	local X2Condition_UnitValue							ValueCondition;
	local X2Condition_PlayerTurns						TurnsCondition;

	Template = CreatePassiveAbility('WOTC_APA_Bipod_BasicBonus', "img:///UILibrary_WOTC_APA_Class_Pack.perk_Emplaced",, false);

	// This effect handles the reduction of aim penalties due to range tables/squadsight
	HitModEffect = new class'X2Effect_WOTC_APA_BipodRangeModifiers';
	HitModEffect.BuildPersistentEffect(1, true, false, false);
	HitModEffect.RequiredEffectNames.AddItem('WOTC_APA_BasicBipodEffect');
	HitModEffect.bLimitToLongRange = true;
	HitModEffect.RangePenaltyPercentNegated = default.BIPOD_BASIC_RANGE_ACCURACY_MOD;
	HitModEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitModEffect);

	// This effect stays on the unit indefinitely
	PersistentEffect = new class'X2Effect_Persistent';
	PersistentEffect.EffectName = 'BipodEffect';
	PersistentEffect.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnBegin);

	// At the start of each turn, this effect is applied if conditions are met. Moving will remove the effect.
	StatChangeEffect = new class'X2Effect_WOTC_APA_RemovedOnMoveStatChange';
	StatChangeEffect.EffectName = 'WOTC_APA_BasicBipodEffect';
	StatChangeEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	StatChangeEffect.AddPersistentStatChange(eStat_SightRadius, default.BIPOD_TILE_RANGE_BONUS);
	StatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, true);
	
	// This condition check that the unit did not move last turn before allowing the bonus to be applied
	ValueCondition = new class'X2Condition_UnitValue';
	ValueCondition.AddCheckValue('MovesThisTurn', 1, eCheck_LessThan);
	StatChangeEffect.TargetConditions.AddItem(ValueCondition);

	// This condition guarantees the player has started more than 1 turn. the first turn of the game does not count, as there was no "previous" turn.
	TurnsCondition = new class'X2Condition_PlayerTurns';
	TurnsCondition.NumTurnsCheck.CheckType = eCheck_GreaterThan;
	TurnsCondition.NumTurnsCheck.Value = 1;
	StatChangeEffect.TargetConditions.AddItem(TurnsCondition);

	PersistentEffect.ApplyOnTick.AddItem(StatChangeEffect);
	Template.AddShooterEffect(PersistentEffect);

	return Template;
}

// Bipod: Advanced Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_Bipod_AdvancedBonus()
{
	local X2AbilityTemplate								Template;
	local X2Effect_WOTC_APA_BipodRangeModifiers			HitModEffect;
	local X2Effect_Persistent							PersistentEffect;
	local X2Effect_WOTC_APA_RemovedOnMoveStatChange		StatChangeEffect;
	local X2Condition_UnitValue							ValueCondition;
	local X2Condition_PlayerTurns						TurnsCondition;

	Template = CreatePassiveAbility('WOTC_APA_Bipod_AdvancedBonus', "img:///UILibrary_WOTC_APA_Class_Pack.perk_Emplaced",, false);

	// This effect handles the reduction of aim penalties due to range tables/squadsight
	HitModEffect = new class'X2Effect_WOTC_APA_BipodRangeModifiers';
	HitModEffect.BuildPersistentEffect(1, true, false, false);
	HitModEffect.RequiredEffectNames.AddItem('WOTC_APA_AdvancedBipodEffect');
	HitModEffect.bLimitToLongRange = true;
	HitModEffect.RangePenaltyPercentNegated = default.BIPOD_ADVANCED_RANGE_ACCURACY_MOD;
	HitModEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitModEffect);

	// This effect stays on the unit indefinitely
	PersistentEffect = new class'X2Effect_Persistent';
	PersistentEffect.EffectName = 'BipodEffect';
	PersistentEffect.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnBegin);
	PersistentEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, false,, Template.AbilitySourceName);

	// At the start of each turn, this effect is applied if conditions are met. Moving will remove the effect.
	StatChangeEffect = new class'X2Effect_WOTC_APA_RemovedOnMoveStatChange';
	StatChangeEffect.EffectName = 'WOTC_APA_AdvancedBipodEffect';
	StatChangeEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	StatChangeEffect.AddPersistentStatChange(eStat_SightRadius, default.BIPOD_TILE_RANGE_BONUS);
	StatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, true);
	
	// This condition check that the unit did not move last turn before allowing the bonus to be applied
	ValueCondition = new class'X2Condition_UnitValue';
	ValueCondition.AddCheckValue('MovesThisTurn', 1, eCheck_LessThan);
	StatChangeEffect.TargetConditions.AddItem(ValueCondition);

	// This condition guarantees the player has started more than 1 turn. the first turn of the game does not count, as there was no "previous" turn.
	TurnsCondition = new class'X2Condition_PlayerTurns';
	TurnsCondition.NumTurnsCheck.CheckType = eCheck_GreaterThan;
	TurnsCondition.NumTurnsCheck.Value = 1;
	StatChangeEffect.TargetConditions.AddItem(TurnsCondition);

	PersistentEffect.ApplyOnTick.AddItem(StatChangeEffect);
	Template.AddShooterEffect(PersistentEffect);

	return Template;
}

// Bipod: Advanced Penalty - Passive:
static function X2AbilityTemplate WOTC_APA_Bipod_AdvancedPenalty()
{
	local X2AbilityTemplate											Template;
	local X2Effect_PersistentStatChange								Effect;

	Template = CreatePassiveAbility('WOTC_APA_Bipod_AdvancedPenalty',,, false);

	// Create a persistent stat change effect that adds [default: -1] mobility
	Effect = new class 'X2Effect_PersistentStatChange';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.AddPersistentStatChange(eStat_Mobility, default.BIPOD_ADVANCED_MOBILITY_PENALTY);
	Template.AddTargetEffect(Effect);

	// Add UI stat markups corresponding to effect stat boosts
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.BIPOD_ADVANCED_MOBILITY_PENALTY);

	return Template;
}

// Bipod: Prototype Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_Bipod_PrototypeBonus()
{
	local X2AbilityTemplate								Template;
	local X2Effect_WOTC_APA_BipodRangeModifiers			HitModEffect;
	local X2Effect_Persistent							PersistentEffect;
	local X2Effect_WOTC_APA_RemovedOnMoveStatChange		StatChangeEffect;
	local X2Condition_UnitValue							ValueCondition;
	local X2Condition_PlayerTurns						TurnsCondition;

	Template = CreatePassiveAbility('WOTC_APA_Bipod_PrototypeBonus', "img:///UILibrary_WOTC_APA_Class_Pack.perk_Emplaced",, false);

	// This effect handles the reduction of aim penalties due to range tables/squadsight
	HitModEffect = new class'X2Effect_WOTC_APA_BipodRangeModifiers';
	HitModEffect.BuildPersistentEffect(1, true, false, false);
	HitModEffect.RequiredEffectNames.AddItem('WOTC_APA_PrototypeBipodEffect');
	HitModEffect.bLimitToLongRange = true;
	HitModEffect.RangePenaltyPercentNegated = default.BIPOD_PROTOTYPE_RANGE_ACCURACY_MOD;
	HitModEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitModEffect);

	// This effect stays on the unit indefinitely
	PersistentEffect = new class'X2Effect_Persistent';
	PersistentEffect.EffectName = 'BipodEffect';
	PersistentEffect.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnBegin);
	PersistentEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, false,, Template.AbilitySourceName);

	// At the start of each turn, this effect is applied if conditions are met. Moving will remove the effect.
	StatChangeEffect = new class'X2Effect_WOTC_APA_RemovedOnMoveStatChange';
	StatChangeEffect.EffectName = 'WOTC_APA_PrototypeBipodEffect';
	StatChangeEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	StatChangeEffect.AddPersistentStatChange(eStat_SightRadius, default.BIPOD_TILE_RANGE_BONUS);
	StatChangeEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, true);
	
	// This condition check that the unit did not move last turn before allowing the bonus to be applied
	ValueCondition = new class'X2Condition_UnitValue';
	ValueCondition.AddCheckValue('MovesThisTurn', 1, eCheck_LessThan);
	StatChangeEffect.TargetConditions.AddItem(ValueCondition);

	// This condition guarantees the player has started more than 1 turn. the first turn of the game does not count, as there was no "previous" turn.
	TurnsCondition = new class'X2Condition_PlayerTurns';
	TurnsCondition.NumTurnsCheck.CheckType = eCheck_GreaterThan;
	TurnsCondition.NumTurnsCheck.Value = 1;
	StatChangeEffect.TargetConditions.AddItem(TurnsCondition);

	PersistentEffect.ApplyOnTick.AddItem(StatChangeEffect);
	Template.AddShooterEffect(PersistentEffect);

	return Template;
}

// -----------------------------------------------------------------------------------------------

// Suppressor: Basic Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_Suppressor_BasicBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_SuppressorCritModifiers					CritEffect;

	Template = CreatePassiveAbility('WOTC_APA_Suppressor_BasicBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that changes Crit Chance based on concealment
	CritEffect = new class'X2Effect_WOTC_APA_SuppressorCritModifiers';
	CritEffect.BuildPersistentEffect(1, true, false, false);
	CritEffect.ConcealedCritModifier = default.SUPPRESSOR_BASIC_CONCEALED_CRIT_CHANCE;
	CritEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(CritEffect);

	return Template;
}

// Suppressor: Advanced Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_Suppressor_AdvancedBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_SuppressorCritModifiers					CritEffect;

	Template = CreatePassiveAbility('WOTC_APA_Suppressor_AdvancedBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that changes Crit Chance based on concealment
	CritEffect = new class'X2Effect_WOTC_APA_SuppressorCritModifiers';
	CritEffect.BuildPersistentEffect(1, true, false, false);
	CritEffect.ConcealedCritModifier = default.SUPPRESSOR_ADVANCED_CONCEALED_CRIT_CHANCE;
	CritEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(CritEffect);

	return Template;
}

// Suppressor: Advanced Penalty - Passive:
static function X2AbilityTemplate WOTC_APA_Suppressor_AdvancedPenalty()
{	
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;

	Template = CreatePassiveAbility('WOTC_APA_Suppressor_AdvancedPenalty', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to hit for Reaction Attacks
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToReactionShots = true;
	AimEffect.AimModifier = default.SUPPRESSOR_ADVANCED_REACTION_SHOT_AIM_PENALTY;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	return Template;
}

// Suppressor: Prototype Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_Suppressor_PrototypeBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_SuppressorCritModifiers					CritEffect;

	Template = CreatePassiveAbility('WOTC_APA_Suppressor_PrototypeBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that changes Crit Chance based on concealment
	CritEffect = new class'X2Effect_WOTC_APA_SuppressorCritModifiers';
	CritEffect.BuildPersistentEffect(1, true, false, false);
	CritEffect.ConcealedCritModifier = default.SUPPRESSOR_PROTOTYPE_CONCEALED_CRIT_CHANCE;
	CritEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(CritEffect);

	return Template;
}

// -----------------------------------------------------------------------------------------------

// Foregrip: Basic Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_Foregrip_BasicBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;

	Template = CreatePassiveAbility('WOTC_APA_Foregrip_BasicBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to hit for Reaction Attacks within effective range [default: 8 Tiles]
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToReactionShots = true;
	AimEffect.AimModifier = default.FOREGRIP_BASIC_REACTION_SHOT_AIM_BONUS;
	AimEffect.TileLimitCeiling = default.FOREGRIP_EFFECTIVE_TILE_RANGE;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	return Template;
}

// Foregrip: Advanced Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_Foregrip_AdvancedBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;
	local X2Effect_WOTC_APA_ForegripRangeModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_Foregrip_AdvancedBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to hit for Reaction Attacks within effective range [default: 8 Tiles]
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToReactionShots = true;
	AimEffect.AimModifier = default.FOREGRIP_BASIC_REACTION_SHOT_AIM_BONUS;
	AimEffect.TileLimitCeiling = default.FOREGRIP_EFFECTIVE_TILE_RANGE;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	// Create a persistent effect to increase short range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_ForegripRangeModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.RangePenaltyPercentNegated = default.FOREGRIP_ADVANCED_RANGE_ACCURACY_MOD;
	RangeEffect.ShortRangeTileCutoff = default.FOREGRIP_EFFECTIVE_TILE_RANGE;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Foregrip: Advanced Penalty - Passive:
static function X2AbilityTemplate WOTC_APA_Foregrip_AdvancedPenalty()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;

	Template = CreatePassiveAbility('WOTC_APA_Foregrip_AdvancedPenalty', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to decrease chance to hit any shot above effective range [default: 8 Tiles]
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToDirectShots = true;
	AimEffect.bApplyToReactionShots = true;
	AimEffect.AimModifier = default.FOREGRIP_ADVANCED_AIM_PENALTY;
	AimEffect.TileLimitFloor = default.FOREGRIP_EFFECTIVE_TILE_RANGE + 1;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	return Template;
}

// Foregrip: Prototype Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_Foregrip_PrototypeBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;
	local X2Effect_WOTC_APA_ForegripRangeModifier					RangeEffect;

	Template = CreatePassiveAbility('WOTC_APA_Foregrip_PrototypeBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent effect to increase chance to hit for Reaction Attacks within effective range [default: 8 Tiles]
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToReactionShots = true;
	AimEffect.AimModifier = default.FOREGRIP_BASIC_REACTION_SHOT_AIM_BONUS;
	AimEffect.TileLimitCeiling = default.FOREGRIP_EFFECTIVE_TILE_RANGE + 2;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	// Create a persistent effect to increase short range accuracy
	RangeEffect = new class'X2Effect_WOTC_APA_ForegripRangeModifier';
	RangeEffect.BuildPersistentEffect(1, true, false, false);
	RangeEffect.RangePenaltyPercentNegated = default.FOREGRIP_PROTOTYPE_RANGE_ACCURACY_MOD;
	RangeEffect.ShortRangeTileCutoff = default.FOREGRIP_EFFECTIVE_TILE_RANGE + 2;
	RangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(RangeEffect);

	return Template;
}

// Heavy Cannon Barrel - Passive:
static function X2AbilityTemplate WOTC_APA_HeavyCannonBarrel()
{
	local X2AbilityTemplate											Template;
	local X2Effect_PersistentStatChange								Effect;
	local X2Effect_WOTC_APA_BipodRangeModifiers						HitModEffect;
	local X2Effect_Persistent										PersistentEffect;
	local X2Effect_WOTC_APA_Shredder								ShredderEffect;

	Template = CreatePassiveAbility('WOTC_APA_HeavyCannonBarrel', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that handles built-in stat modifiers
	Effect = new class 'X2Effect_PersistentStatChange';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.AddPersistentStatChange(eStat_Mobility, default.HEAVY_CANNON_BARREL_MOBILITY_PENALTY);
	Template.AddTargetEffect(Effect);

	// This effect handles the reduction of aim penalties due to range tables/squadsight
	HitModEffect = new class'X2Effect_WOTC_APA_BipodRangeModifiers';
	HitModEffect.BuildPersistentEffect(1, true, false, false);
	HitModEffect.RequiredEffectNames.AddItem('WOTC_APA_AdvancedBipodEffect');
	HitModEffect.bLimitToLongRange = true;
	HitModEffect.RangePenaltyPercentNegated = default.BIPOD_ADVANCED_RANGE_ACCURACY_MOD;
	HitModEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitModEffect);

	ShredderEffect = new class'X2Effect_WOTC_APA_Shredder';
	ShredderEffect.BuildPersistentEffect(1, true, false, false);
	ShredderEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
	ShredderEffect.Shred = default.HEAVY_CANNON_BARREL_SHRED_BONUS;
	Template.AddShooterEffect(ShredderEffect);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.HEAVY_CANNON_BARREL_MOBILITY_PENALTY);
	
	return Template;
}

// Smoothbore Barrel - Passive:
static function X2AbilityTemplate WOTC_APA_SmoothboreBarrel()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_SmoothboreBarrelModifiers				AimEffect;

	Template = CreatePassiveAbility('WOTC_APA_SmoothboreBarrel', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that handles built-in stat modifiers
	AimEffect = new class 'X2Effect_WOTC_APA_SmoothboreBarrelModifiers';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	return Template;
}

// Fullbore Barrel - Passive:
static function X2AbilityTemplate WOTC_APA_FullboreBarrel()
{
	local X2AbilityTemplate											Template;
	local X2Effect_APRounds             							Effect;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;

	Template = CreatePassiveAbility('WOTC_APA_FullboreBarrel', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	Effect = new class'X2Effect_APRounds';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
	Effect.CritDamage = 0;
	Effect.CritChance = 0;
	Effect.Pierce = default.FULLBORE_BARREL_PIERCE_BONUS;
	Template.AddShooterEffect(Effect);

	// Create a persistent effect to increase chance to hit for Direct Attacks
	AimEffect = new class 'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToDirectShots = true;
	AimEffect.AimModifier = 0;
	AimEffect.CritModifier = default.LASER_SIGHT_ADVANCED_CRIT_CHANCE_BONUS;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

// -----------------------------------------------------------------------------------------------

// Expanded Magazine: Advanced Penalty - Passive:
static function X2AbilityTemplate WOTC_APA_ExpandedMag_AdvancedPenalty()
{
	local X2AbilityTemplate											Template;
	local X2Effect_PersistentStatChange								Effect;

	Template = CreatePassiveAbility('WOTC_APA_Bipod_ExpandedMag_AdvancedPenalty',,, false);

	// Create a persistent stat change effect that adds [default: -1] mobility
	Effect = new class 'X2Effect_PersistentStatChange';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.AddPersistentStatChange(eStat_Mobility, default.EXPANDED_MAGAZINE_ADVANCED_MOBILITY_PENALTY);
	Template.AddTargetEffect(Effect);

	// Add UI stat markups corresponding to effect stat boosts
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.BIPOD_ADVANCED_MOBILITY_PENALTY);

	return Template;
}

// -----------------------------------------------------------------------------------------------

// Speedloader Magazine: Advanced Penalty - Passive:
static function X2AbilityTemplate WOTC_APA_Speedloader_AdvancedPenalty()
{
	local X2AbilityTemplate											Template;

	Template = CreatePassiveAbility('WOTC_APA_Speedloader_AdvancedPenalty',,, false);

	return Template;
}

// -----------------------------------------------------------------------------------------------

// Wildcat Cartridges: Basic Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_WildcatCartridges_BasicBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WildcatCartridges						HitEffect;

	Template = CreatePassiveAbility('WOTC_APA_WildcatCartridges_BasicBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that adds chance to increase Crit damage
	HitEffect = new class'X2Effect_WOTC_APA_WildcatCartridges';
	HitEffect.BuildPersistentEffect(1, true, false, false);
	HitEffect.BonusDmg = 0;
	HitEffect.BonusCritDmg = default.WILDCAT_CARTRIDGE_BONUS_CRIT_DAMAGE;
	HitEffect.BonusChance = default.WILDCAT_CARTRIDGE_BASIC_CRIT_DAMAGE_CHANCE;
	HitEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitEffect);

	return Template;
}

// Wildcat Cartridges: Advanced Bonus & Penalty - Passive:
static function X2AbilityTemplate WOTC_APA_WildcatCartridges_AdvancedBonus()
{
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WildcatCartridges						HitEffect;

	Template = CreatePassiveAbility('WOTC_APA_WildcatCartridges_AdvancedBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that adds chance to increase Crit damage
	HitEffect = new class'X2Effect_WOTC_APA_WildcatCartridges';
	HitEffect.BuildPersistentEffect(1, true, false, false);
	HitEffect.BonusDmg = 0;
	HitEffect.BonusCritDmg = default.WILDCAT_CARTRIDGE_BONUS_CRIT_DAMAGE;
	HitEffect.BonusChance = default.WILDCAT_CARTRIDGE_ADVANCED_CRIT_DAMAGE_CHANCE;
	HitEffect.GrazeChanceModifier = default.WILDCAT_CARTRIDGE_ADVANCED_GRAZE_CHANCE;
	HitEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitEffect);

	return Template;
}

// Wildcat Cartridges: Superior Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_WildcatCartridges_SuperiorBonus()
{	
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WildcatCartridges						HitEffect;

	Template = CreatePassiveAbility('WOTC_APA_WildcatCartridges_SuperiorBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that adds chance to increase Crit damage
	HitEffect = new class'X2Effect_WOTC_APA_WildcatCartridges';
	HitEffect.BuildPersistentEffect(1, true, false, false);
	HitEffect.BonusDmg = 0;
	HitEffect.BonusCritDmg = default.WILDCAT_CARTRIDGE_BONUS_CRIT_DAMAGE;
	HitEffect.BonusChance = default.WILDCAT_CARTRIDGE_ADVANCED_CRIT_DAMAGE_CHANCE;
	HitEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitEffect);

	return Template;
}

// Wildcat Cartridges: Prototype Bonus - Passive:
static function X2AbilityTemplate WOTC_APA_WildcatCartridges_PrototypeBonus()
{	
	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_WildcatCartridges						HitEffect;

	Template = CreatePassiveAbility('WOTC_APA_WildcatCartridges_PrototypeBonus', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Battlelord",, false);

	// Create a persistent stat change effect that adds chance to increase Crit damage
	HitEffect = new class'X2Effect_WOTC_APA_WildcatCartridges';
	HitEffect.BuildPersistentEffect(1, true, false, false);
	HitEffect.BonusDmg = default.WILDCAT_CARTRIDGE_BONUS_DAMAGE;
	HitEffect.BonusCritDmg = default.WILDCAT_CARTRIDGE_BONUS_CRIT_DAMAGE;
	HitEffect.BonusChance = default.WILDCAT_CARTRIDGE_PROTOTYPE_CRIT_DAMAGE_CHANCE;
	HitEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(HitEffect);

	return Template;
}

// -----------------------------------------------------------------------------------------------

static function X2AbilityTemplate WOTC_APA_HairTrigger_BasicBonus() 
{
	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;
	local X2AbilityTrigger Trigger;
	local X2Effect_WOTC_APA_BonusReactionFireDamage BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_HairTrigger_BasicBonus');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;
	Template.bUniqueSource = false; 

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	// + Damage with Reaction Fire:
	BonusEffect = new class'X2Effect_WOTC_APA_BonusReactionFireDamage';
	BonusEffect.BonusDmg = default.HAIRTRIGGER_BASIC_DAMAGE_VALUE;
	BonusEffect.BuildPersistentEffect(1, true, false, false);
	BonusEffect.DuplicateResponse = eDupe_Allow;
	BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	
	Template.AddTargetEffect(BonusEffect);
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate WOTC_APA_HairTrigger_AdvancedBonus() 
{
	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;
	local X2AbilityTrigger Trigger;
	local X2Effect_WOTC_APA_BonusReactionFireDamage BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_HairTrigger_AdvancedBonus');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;
	Template.bUniqueSource = false;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	// + Damage with Reaction Fire:
	BonusEffect = new class'X2Effect_WOTC_APA_BonusReactionFireDamage';
	BonusEffect.BonusDmg = default.HAIRTRIGGER_ADVANCED_DAMAGE_VALUE;
	BonusEffect.BuildPersistentEffect(1, true, false, false);
	BonusEffect.DuplicateResponse = eDupe_Allow;
	BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	
	Template.AddTargetEffect(BonusEffect);
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate WOTC_APA_HairTrigger_AdvancedPenalty() 
{
	local X2AbilityTemplate 										Template;
	local X2AbilityTarget_Self 										TargetStyle;
	local X2AbilityTrigger 											Trigger;
	local X2Effect_WOTC_APA_WeaponHitModifier						AimEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_HairTrigger_AdvancedPenalty');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;
	Template.bUniqueSource = false;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	// Create a persistent effect to increase chance to hit for Direct Attacks
	AimEffect = new class'X2Effect_WOTC_APA_WeaponHitModifier';
	AimEffect.BuildPersistentEffect(1, true, false, false);
	AimEffect.bApplyToDirectShots = true;
	AimEffect.AimModifier = default.HAIRTRIGGER_ADVANCED_AIM_PENALTY;
	AimEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	Template.AddTargetEffect(AimEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate WOTC_APA_HairTrigger_PrototypeBonus() 
{
	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;
	local X2AbilityTrigger Trigger;
	local X2Effect_WOTC_APA_BonusReactionFireDamage BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_HairTrigger_PrototypeBonus');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;
	Template.bUniqueSource = false;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	// + Damage with Reaction Fire:
	BonusEffect = new class'X2Effect_WOTC_APA_BonusReactionFireDamage';
	BonusEffect.BonusDmg = default.HAIRTRIGGER_PROTOTYPE_DAMAGE_VALUE;
	BonusEffect.BuildPersistentEffect(1, true, false, false);
	BonusEffect.DuplicateResponse = eDupe_Allow;
	BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
	
	Template.AddTargetEffect(BonusEffect);
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}