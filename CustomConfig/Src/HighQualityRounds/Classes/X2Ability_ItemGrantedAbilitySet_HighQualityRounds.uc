// This is an Unreal Script
// 
class X2Ability_ItemGrantedAbilitySet_HighQualityRounds extends X2Ability_ItemGrantedAbilitySet
	config(HighQualityRounds);

var config int HQ_AIM;
var config int HQ_CRITCH;
var config int HQ_CRITDMG;
var config int HQ_AP;
var config int HQ_AP_CHANCE;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Super.CreateTemplates();

	Templates.AddItem(HighQualityRoundsBonusAbility());

	return(Templates);
}

static function X2AbilityTemplate HighQualityRoundsBonusAbility()
{
	local X2AbilityTemplate             Template;
	local X2Effect_HighQualityRounds    Effect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HighQualityRoundsBonusAbility');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	Effect = new class'X2Effect_HighQualityRounds';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);

	Effect.AimMod = default.HQ_AIM;

	Effect.CritChance = default.HQ_CRITCH;

	Effect.CritDamage = default.HQ_CRITDMG;
	Effect.Pierce = default.HQ_AP;
	Effect.PierceChance = default.HQ_AP_CHANCE;	

	Template.AddShooterEffect(Effect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}