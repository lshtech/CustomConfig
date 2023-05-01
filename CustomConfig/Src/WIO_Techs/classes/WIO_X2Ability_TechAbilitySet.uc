class WIO_X2Ability_TechAbilitySet extends X2Ability_XPackAbilitySet config (WIO_Techs);

struct StatBonus
{
	var ECharStatType	StatType;
	var int				BonusValue;
};

var config array<StatBonus>	LightArmorBonuses;
var config array<StatBonus>	MediumArmorBonuses;
var config array<StatBonus>	HeavyArmorBonuses;

var config array<StatBonus>	ConventionalArmorBonuses;
var config array<StatBonus>	PlatedArmorBonuses;
var config array<StatBonus>	PoweredArmorBonuses;

var config array<StatBonus>	ReaperArmorBonuses;
var config array<StatBonus>	SkirmisherArmorBonuses;
var config array<StatBonus>	TemplarArmorBonuses;
var config array<StatBonus>	SparkArmorBonuses;

var config array<StatBonus>	ArmorBonuses;

var config int MEDIKIT_HEAL_BONUS;
var config int GRENADE_BREAKTHROUGH_BONUS;
var config int HEAVY_WEAPON_BREAKTHROUGH_BONUS;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(AddLightArmorTypeBreakthroughBonus());
	Templates.AddItem(AddMediumArmorTypeBreakthroughBonus());
	Templates.AddItem(AddHeavyArmorTypeBreakthroughBonus());

	Templates.AddItem(AddConventionalArmorTypeBreakthroughBonus());
	Templates.AddItem(AddPlatedArmorTypeBreakthroughBonus());
	Templates.AddItem(AddPoweredArmorTypeBreakthroughBonus());

	Templates.AddItem(AddReaperArmorTypeBreakthroughBonus());
	Templates.AddItem(AddSkirmisherArmorTypeBreakthroughBonus());
	Templates.AddItem(AddTemplarArmorTypeBreakthroughBonus());
	Templates.AddItem(AddSparkArmorTypeBreakthroughBonus());

	Templates.AddItem(AddArmorTechBreakthroughBonus());

	Templates.AddItem(AddGrenadeBreakthroughBonus());
	Templates.AddItem(AddHeavyWeaponBreakthroughBonus());
	Templates.AddItem(AddMedikitBreakthroughBonus());

	return Templates;
}

static function X2AbilityTemplate AddLightArmorTypeBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local StatBonus								Bonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LightArmorTypeBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	foreach default.LightArmorBonuses(Bonus)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(Bonus.StatType, Bonus.BonusValue);
	}	
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}
static function X2AbilityTemplate AddMediumArmorTypeBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local StatBonus								Bonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MediumArmorTypeBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	foreach default.MediumArmorBonuses(Bonus)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(Bonus.StatType, Bonus.BonusValue);
	}
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}
static function X2AbilityTemplate AddHeavyArmorTypeBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local StatBonus								Bonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HeavyArmorTypeBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	foreach default.HeavyArmorBonuses(Bonus)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(Bonus.StatType, Bonus.BonusValue);
	}
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

static function X2AbilityTemplate AddConventionalArmorTypeBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local StatBonus								Bonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ConventionalArmorTypeBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	foreach default.ConventionalArmorBonuses(Bonus)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(Bonus.StatType, Bonus.BonusValue);
	}
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}
static function X2AbilityTemplate AddPlatedArmorTypeBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local StatBonus								Bonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PlatedArmorTypeBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	foreach default.PlatedArmorBonuses(Bonus)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(Bonus.StatType, Bonus.BonusValue);
	}
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}
static function X2AbilityTemplate AddPoweredArmorTypeBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local StatBonus								Bonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'PoweredArmorTypeBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	foreach default.PoweredArmorBonuses(Bonus)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(Bonus.StatType, Bonus.BonusValue);
	}
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

static function X2AbilityTemplate AddReaperArmorTypeBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local StatBonus								Bonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ReaperArmorTypeBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	foreach default.ReaperArmorBonuses(Bonus)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(Bonus.StatType, Bonus.BonusValue);
	}
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}
static function X2AbilityTemplate AddSkirmisherArmorTypeBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local StatBonus								Bonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SkirmisherArmorTypeBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	foreach default.SkirmisherArmorBonuses(Bonus)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(Bonus.StatType, Bonus.BonusValue);
	}
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}
static function X2AbilityTemplate AddTemplarArmorTypeBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local StatBonus								Bonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'TemplarArmorTypeBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	foreach default.TemplarArmorBonuses(Bonus)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(Bonus.StatType, Bonus.BonusValue);
	}
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}
static function X2AbilityTemplate AddSparkArmorTypeBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local StatBonus								Bonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SparkArmorTypeBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	foreach default.SparkArmorBonuses(Bonus)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(Bonus.StatType, Bonus.BonusValue);
	}
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

static function X2AbilityTemplate AddArmorTechBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentStatChangeEffect;
	local StatBonus								Bonus;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ArmorTechBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	foreach default.ArmorBonuses(Bonus)
	{
		PersistentStatChangeEffect.AddPersistentStatChange(Bonus.StatType, Bonus.BonusValue);
	}	
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

static function X2AbilityTemplate AddMedikitBreakthroughBonus()
{
	local X2AbilityTemplate								Template;
	local WIO_X2Effect_ModifyHealAmount						HealModEffect;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'MedikitBreakthroughBonus');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_revive"; 
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.bCrossClassEligible = false;
		
	// Create effect to modify healing HP amounts for each proficiency level
	HealModEffect = new class'WIO_X2Effect_ModifyHealAmount';
	HealModEffect.HealModifier = default.MEDIKIT_HEAL_BONUS;
	HealModEffect.BuildPersistentEffect (1, true, false, false);
	Template.AddTargetEffect(HealModEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	return Template;
}
static function X2AbilityTemplate AddGrenadeBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local WIO_X2Effect_BonusGrenadeDamage		BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'GrenadeBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	BonusEffect = new class'WIO_X2Effect_BonusGrenadeDamage';
	BonusEffect.BuildPersistentEffect(1, true, true, true);
	BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, "", "", false );
	BonusEffect.BonusDmg = default.GRENADE_BREAKTHROUGH_BONUS;
	BonusEffect.bDisplayInSpecialDamageMessageUI = false;
	Template.AddTargetEffect(BonusEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}
static function X2AbilityTemplate AddHeavyWeaponBreakthroughBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_BonusWeaponDamage			BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HeavyWeaponBreakthroughBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	BonusEffect = new class'X2Effect_BonusWeaponDamage';
	BonusEffect.BuildPersistentEffect(1, true, true, true);
	BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, "", "", false );
	BonusEffect.BonusDmg = default.HEAVY_WEAPON_BREAKTHROUGH_BONUS;
	BonusEffect.bDisplayInSpecialDamageMessageUI = false;
	Template.AddTargetEffect(BonusEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

