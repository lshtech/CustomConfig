class X2Ability_CustomConfig extends X2Ability;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

    Templates.AddItem(PurePassive('ExtraGrenade'));
	Templates.AddItem(MedikitBreakthroughBonusAbility());
	
	return Templates;
}

// Medical Specialist - Base Class Proficiency Ability
static function X2AbilityTemplate MedikitBreakthroughBonusAbility()
{
	
	local X2AbilityTemplate								Template;
	local X2Effect_ModifyHealAmount						HealModEffect;
	
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
	HealModEffect = new class'X2Effect_ModifyHealAmount';
	HealModEffect.HealModifier = 1;
	HealModEffect.BuildPersistentEffect (1, true, false, false);
	Template.AddTargetEffect(HealModEffect);


	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	return Template;
}