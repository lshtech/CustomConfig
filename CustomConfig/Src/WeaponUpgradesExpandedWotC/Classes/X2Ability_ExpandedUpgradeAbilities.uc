//------------------------------------------------------------------------
//	FILE: X2Ability_ExpandedUpgradeAbilities.uc
//	AUTHORS: PrometheusDarko (No Fox Gaming), TheMediator, & BTernaryTau
//	PURPOSE: Adds stat modifiers and abilities for new upgrades
//
//------------------------------------------------------------------------

class X2Ability_ExpandedUpgradeAbilities extends X2Ability_ItemGrantedAbilitySet dependson(XComGameStateContext_Ability) config(WUE);

var config int 					CRIT_UPGRADE_PRT;
var config int 					AIM_UPGRADE_PRT;
var config int 					CLIP_SIZE_PRT;
var config int					FREE_FIRE_PRT;
var config int					FREE_RELOADS_PRT;
var config int					FREE_KILL_PRT;
var config int					MARK_TARGET_LOCAL_COOLDOWN;
var config int					HEADSHOT_COOLDOWN;
var config int 					STEADY_AIM_BONUS_M4;
var config int					HAIRTRIGGER_PRT_DAMAGE_VALUE;
var config int					SNHEAVYBARREL_PRT_DMG;
var config int					SNHEAVYBARREL_BOOST_DMG;
var config WeaponDamageValue	MISS_DAMAGE_PRT;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(LaserSight_Prt());
	Templates.AddItem(LaserSight_BonusSkill());
	Templates.Additem(Scope_BonusSkill());
	Templates.AddItem(AddAbiziSteadyWeaponM4());
	Templates.AddItem(HairTrigger_Prt());
	Templates.AddItem(AddSNHeavyBarrel_Prt_Ability());
	
	return Templates;
}

//********************************
//***********LASER SIGHT**********
//********************************

/*static function X2AbilityTemplate LaserSight_Prt()
{
	local X2AbilityTemplate Template;
	local X2Effect_LaserSight LaserSightEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LaserSight_Prt');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_hunter";

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	LaserSightEffect = new class'X2Effect_LaserSight';
	LaserSightEffect.BuildPersistentEffect(1, true, false, false);
	LaserSightEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
	LaserSightEffect.CritBonus = class'WUE_MCMListener'.default.CRIT_UPGRADE_PRT;
	LaserSightEffect.FriendlyName = Template.LocFriendlyName;
	Template.AddTargetEffect(LaserSightEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}*/

static function X2AbilityTemplate LaserSight_Prt()
{
	return LaserSight(default.CRIT_UPGRADE_PRT, 'LaserSight_Prt');
}

static function X2AbilityTemplate LaserSight_BonusSkill()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints ActionPointCost;
	local X2Condition_UnitProperty UnitPropertyCondition;
	local X2Condition_Visibility TargetVisibilityCondition;
	local X2Condition_UnitEffects UnitEffectsCondition;
	local X2AbilityTarget_Single SingleTarget;
	local X2AbilityTrigger_PlayerInput InputTrigger;
	local X2Effect_Persistent MarkedEffect;
	local X2AbilityCooldown_LocalAndGlobal Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LaserSight_BonusSkill');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_advent_marktarget";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.Hostility = eHostility_Offensive;

	Cooldown = new class'X2AbilityCooldown_LocalAndGlobal';
	Cooldown.iNumTurns = default.MARK_TARGET_LOCAL_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

	// The shooter cannot be mind controlled
	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2Effect_MindControl'.default.EffectName, 'AA_UnitIsMindControlled');
	Template.AbilityShooterConditions.AddItem(UnitEffectsCondition);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	// Target must be an enemy
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = true;
	UnitPropertyCondition.RequireWithinRange = false;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	// Target must be visible and may use squad sight
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bAllowSquadsight = true;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	// Target cannot already be marked
	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.MarkedName, 'AA_UnitIsMarked');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	// 100% chance to hit
	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	//// Create the Marked effect
	MarkedEffect = class'X2StatusEffects'.static.CreateMarkedEffect(2, false);

	Template.AddTargetEffect(MarkedEffect); //BMU - changing to an immediate execution for evaluation

	Template.CustomFireAnim = 'HL_SignalPoint';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = TargetGettingMarked_BuildVisualization;
	Template.CinescriptCameraType = "Mark_Target";
	Template.bFrameEvenWhenUnitIsHidden = true;
	
	return Template;
}

simulated function TargetGettingMarked_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory				History;
	local XComGameStateContext_Ability		Context;
	local StateObjectReference				ShooterUnitRef;
	local StateObjectReference				TargetUnitRef;
	local XComGameState_Ability				Ability;
	local X2AbilityTemplate					AbilityTemplate;
	local AbilityInputContext				AbilityContext;
	
	local VisualizationActionMetadata		EmptyTrack;
	local VisualizationActionMetadata		ActionMetadata;

	local X2Action_PlaySoundAndFlyOver		SoundAndFlyOver;	
	local X2Action_PlayAnimation            PlayAnimation;

	local Actor								TargetVisualizer, ShooterVisualizer;
	local X2VisualizerInterface				TargetVisualizerInterface, ShooterVisualizerInterface;
	local int								EffectIndex;

	local name								ApplyResult;
	

	History = `XCOMHISTORY;
	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());

	AbilityContext = Context.InputContext;
	Ability = XComGameState_Ability(History.GetGameStateForObjectID(AbilityContext.AbilityRef.ObjectID));
	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.AbilityTemplateName);
	
	//Configure the visualization track for the shooter
	//****************************************************************************************
	ShooterUnitRef = Context.InputContext.SourceObject;
	ShooterVisualizer = History.GetVisualizer(ShooterUnitRef.ObjectID);
	ShooterVisualizerInterface = X2VisualizerInterface(ShooterVisualizer);

	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(ShooterUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(ShooterUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(ShooterUnitRef.ObjectID);

	if (AbilityTemplate != None)
	{
		if (!AbilityTemplate.bSkipFireAction && !AbilityTemplate.bSkipExitCoverWhenFiring)
		{
			class'X2Action_ExitCover'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
		}
	}

	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, Ability.GetMyTemplate().LocFlyOverText, '', eColor_Bad);

	PlayAnimation = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	PlayAnimation.Params.AnimName = 'HL_SignalPoint';

	if (AbilityTemplate != None && AbilityTemplate.AbilityTargetEffects.Length > 0)			//There are effects to apply
	{
		//Add any X2Actions that are specific to this effect being applied. These actions would typically be instantaneous, showing UI world messages
		//playing any effect specific audio, starting effect specific effects, etc. However, they can also potentially perform animations on the 
		//track actor, so the design of effect actions must consider how they will look/play in sequence with other effects.
		for (EffectIndex = 0; EffectIndex < AbilityTemplate.AbilityTargetEffects.Length; ++EffectIndex)
		{
			ApplyResult = Context.FindTargetEffectApplyResult(AbilityTemplate.AbilityTargetEffects[EffectIndex]);

			// Source effect visualization
			AbilityTemplate.AbilityTargetEffects[EffectIndex].AddX2ActionsForVisualizationSource(VisualizeGameState, ActionMetadata, ApplyResult);
		}
	}

	if (ShooterVisualizerInterface != none)
	{
		ShooterVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
	}

	if (AbilityTemplate != None)
	{
		if (!AbilityTemplate.bSkipFireAction && !AbilityTemplate.bSkipExitCoverWhenFiring)
		{
			class'X2Action_EnterCover'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
		}
	}

		//****************************************************************************************

	//Configure the visualization track for the target
	//****************************************************************************************
	TargetUnitRef = Context.InputContext.PrimaryTarget;
	TargetVisualizer = History.GetVisualizer(AbilityContext.PrimaryTarget.ObjectID);
	TargetVisualizerInterface = X2VisualizerInterface(TargetVisualizer);

	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(TargetUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(TargetUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(TargetUnitRef.ObjectID);
					
	Ability = XComGameState_Ability(History.GetGameStateForObjectID(Context.InputContext.AbilityRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1));

	if (AbilityTemplate != None && AbilityTemplate.AbilityTargetEffects.Length > 0)			//There are effects to apply
	{
		//Add any X2Actions that are specific to this effect being applied. These actions would typically be instantaneous, showing UI world messages
		//playing any effect specific audio, starting effect specific effects, etc. However, they can also potentially perform animations on the 
		//track actor, so the design of effect actions must consider how they will look/play in sequence with other effects.
		for (EffectIndex = 0; EffectIndex < AbilityTemplate.AbilityTargetEffects.Length; ++EffectIndex)
		{
			ApplyResult = Context.FindTargetEffectApplyResult(AbilityTemplate.AbilityTargetEffects[EffectIndex]);

			// Target effect visualization
			AbilityTemplate.AbilityTargetEffects[EffectIndex].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, ApplyResult);
		}

		if (TargetVisualizerInterface != none)
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
		}
	}
	
		//****************************************************************************************
}

//********************************
//**************SCOPE*************
//********************************

static function X2AbilityTemplate Scope_BonusSkill()
{
	local X2AbilityTemplate Template;
	local X2AbilityCooldown Cooldown;
	local X2AbilityToHitCalc_StandardAim ToHitCalc;
	local X2Condition_Visibility TargetVisibilityCondition;
	local X2AbilityCost_Ammo AmmoCost;
	local X2AbilityCost_ActionPoints ActionPointCost;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Scope_BonusSkill');

	//Template.AdditionalAbilities.AddItem('Scope_BonusSkillDamage');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_deadeye";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	Template.TargetingMethod = class'X2TargetingMethod_OverTheShoulder';
	Template.bUsesFiringCamera = true;
	Template.CinescriptCameraType = "StandardGunFiring";

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.HEADSHOT_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bHitsAreCrits = true;
	Template.AbilityToHitCalc = ToHitCalc;

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 2;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bAllowSquadsight = true;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);

	//  Put holo target effect first because if the target dies from this shot, it will be too late to notify the effect.
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
	Template.AddTargetEffect(default.WeaponUpgradeMissDamage);

	Template.bAllowAmmoEffects = true;
	Template.bAllowBonusWeaponEffects = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.bCrossClassEligible = true;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

/*static function X2AbilityTemplate Scope_BonusSkillDamage()
{
	local X2AbilityTemplate Template;
	local X2Effect_DeadeyeDamage DamageEffect;

	// Icon Properties
	`CREATE_X2ABILITY_TEMPLATE(Template, 'Scope_BonusSkillDamage');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_momentum";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	DamageEffect = new class'X2Effect_DeadeyeDamage';
	DamageEffect.BuildPersistentEffect(1, true, false, false);
	DamageEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false,,Template.AbilitySourceName);
	Template.AddTargetEffect(DamageEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}*/

static function X2AbilityTemplate AddAbiziSteadyWeaponM4()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCooldown					Cooldown;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2Effect_AbiziSteadyWeapon		ToHitModifier;
	//local X2Condition_UnitEffects           SuppressedCondition;
    //local name                              SuppressionEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AbiziSteadyWeaponM4');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_aim";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.bSkipFireAction=true;
	Template.bShowActivation=true;
	Template.AbilityConfirmSound = "Unreal2DSounds_OverWatch";
	Template.bCrossClassEligible = false;
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;    
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.CinescriptCameraType = "Overwatch";
	ToHitModifier = new class'X2Effect_AbiziSteadyWeapon';
	ToHitModifier.BuildPersistentEffect(2, false, true, false, eGameRule_UseActionPoint);
	ToHitModifier.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,,Template.AbilitySourceName);
	ToHitModifier.Aim_Bonus = default.STEADY_AIM_BONUS_M4;
	ToHitModifier.DuplicateResponse=eDupe_Refresh;
	Template.AddTargetEffect(ToHitModifier);	
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	Template.bCrossClassEligible = false;
	Template.ActivationSpeech = 'HunkerDown';

	return Template;
}

static function X2AbilityTemplate HairTrigger_Prt() 
{

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;
	local X2AbilityTrigger Trigger;
	local X2Effect_BonusReactionFireDamage BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HairTrigger_Prt');

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
		BonusEffect = new class'X2Effect_BonusReactionFireDamage';
		BonusEffect.BonusDmg = default.HAIRTRIGGER_PRT_DAMAGE_VALUE;
		BonusEffect.BuildPersistentEffect(1, true, false, false);
		BonusEffect.DuplicateResponse = eDupe_Allow;
		BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, false,, Template.AbilitySourceName);
		
	Template.AddTargetEffect(BonusEffect);
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate AddSNHeavyBarrel_Prt_Ability()
{
	local X2AbilityTemplate Template;
	local SNHeavyBarrel_Attachment_CritDamageEffect DamageEffect;

	`CREATE_X2ABILITY_TEMPLATE (Template, 'SNHeavyBarrel_Prt_Ability');
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.bIsPassive = true;
	DamageEffect = new class'SNHeavyBarrel_Attachment_CritDamageEffect';
	DamageEffect.BonusCritDmg = default.SNHEAVYBARREL_Prt_DMG;
	DamageEffect.BuildPersistentEffect(1, true, false, false);
	DamageEffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(DamageEffect);
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;
}