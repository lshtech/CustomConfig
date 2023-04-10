class X2Ability_RichardsAbilities extends X2Ability config(GameData_SoldierSkills);

var config int MUTERS_CHARGES;
var config int STILLNESSRS_CHARGES;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

    Templates.AddItem(MuteRS());
	Templates.AddItem(HealRS());			
	Templates.AddItem(StabilizeRS());		
	Templates.AddItem(StillnessRS());
	Templates.AddItem(StillnessRSCharges());
    Templates.AddItem(VanishRS());
	
	return Templates;
}

//#############################################################
// Heal - Non Gremlin Medic Heal
//#############################################################
static function X2AbilityTemplate HealRS()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_UnitStatCheck         UnitStatCheckCondition;
	local X2Condition_UnitEffects           UnitEffectsCondition;
	local X2Effect_ApplyMedikitHeal         MedikitHeal;
	local array<name>                       SkipExclusions;

	Template= new(None, string('HealRS')) class'X2AbilityTemplate'; Template.SetTemplateName('HealRS');;;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;	
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	SingleTarget.bIncludeSelf = false;
	SingleTarget.bShowAOE = true;
	Template.AbilityTargetStyle = SingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = false; //Hack: See following comment.
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeTurret = true;
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.WithinRange = 192; // 96 is about 1 tile
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	//Hack: Do this instead of ExcludeDead, to only exclude properly-dead or bleeding-out units.
	UnitStatCheckCondition = new class'X2Condition_UnitStatCheck';
	UnitStatCheckCondition.AddCheckStat(eStat_HP, 0, eCheck_GreaterThan);
	Template.AbilityTargetConditions.AddItem(UnitStatCheckCondition);

	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect(class'X2StatusEffects'.default.BleedingOutName, 'AA_UnitIsImpaired');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition);

	MedikitHeal = new class'X2Effect_ApplyMedikitHeal';
	MedikitHeal.PerUseHP = class'X2Ability_DefaultAbilitySet'.default.MEDIKIT_PERUSEHP;
	MedikitHeal.IncreasedHealProject = 'BattlefieldMedicine';
	MedikitHeal.IncreasedPerUseHP = class'X2Ability_DefaultAbilitySet'.default.NANOMEDIKIT_PERUSEHP;
	Template.AddTargetEffect(MedikitHeal);

	Template.AddTargetEffect(RemoveAllEffectsByDamageType());

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_medkit";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MEDIKIT_HEAL_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.ActivationSpeech = 'HealingAlly';

	Template.bOverrideWeapon = false;
	Template.CustomFireAnim = 'HL_Revive';
	Template.CustomSelfFireAnim = 'HL_Revive';

	return Template;
}

//#############################################################
// Stabilize - Non Gremlin Stabilize
//#############################################################
static function X2AbilityTemplate StabilizeRS()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTarget_Single            SingleTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Effect_RemoveEffects            RemoveEffects;

	Template= new(None, string('StabilizeRS')) class'X2AbilityTemplate'; Template.SetTemplateName('StabilizeRS');;;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Template.AbilityToHitCalc = default.DeadEye;

	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = false;
	UnitPropertyCondition.ExcludeAlive = false;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.IsBleedingOut = true;
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.WithinRange = 192; // 96 is about 1 tile
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2StatusEffects'.default.BleedingOutName);
	Template.AddTargetEffect(RemoveEffects);
	Template.AddTargetEffect(class'X2StatusEffects'.static.CreateUnconsciousStatusEffect(, true));

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_stabilize";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STABILIZE_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	Template.bDisplayInUITooltip = false;
	Template.bLimitTargetIcons = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';

	Template.ActivationSpeech = 'StabilizingAlly';

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.bOverrideWeapon = false;
	Template.CustomFireAnim = 'HL_Revive';
	Template.CustomSelfFireAnim = 'HL_Revive';

	return Template;
}

//#############################################################
// Stillness - an improved version of conceal & carry but unique to the Assassin
//#############################################################
static function X2AbilityTemplate StillnessRS()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentEffect;
	local X2Effect_Persistent                   Effect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'StillnessRS');
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_vanishingwind";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	//Stealth Effect
	PersistentEffect = new class'X2Effect_PersistentStatChange';
	PersistentEffect.BuildPersistentEffect(1, true, false);
	PersistentEffect.AddPersistentStatChange(eStat_DetectionModifier, 0.80f);
	PersistentEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	Template.AddTargetEffect(PersistentEffect);

	//Phantom
	Template.AdditionalAbilities.AddItem('Phantom'); //Adds Phantom as a precaution
	Effect = new class'X2Effect_StayConcealed';
	Effect.BuildPersistentEffect(1, true, false);
	Template.AddTargetEffect(Effect);

	//Grant the Charges of "Stillness" to reenter concealment
	Template.AdditionalAbilities.AddItem('StillnessRSCharges');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	//AWC Allow
	Template.bCrossClassEligible = false;

	return Template;
}

static function X2AbilityTemplate StillnessRSCharges()
{
	local X2AbilityTemplate						Template;
	local X2Effect_RangerStealth                StealthEffect;
	local X2AbilityCharges                      Charges;
	local X2AbilityCost_Charges					ChargeCost;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'StillnessRSCharges');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_vanishingwind";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityCosts.AddItem(default.FreeActionCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.STILLNESSRS_CHARGES;
	Charges.AddBonusCharge('MuteRS', default.MUTERS_CHARGES);
	Template.AbilityCharges = Charges;
	
	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	ChargeCost.SharedAbilityCharges.AddItem('VanishRS');
	Template.AbilityCosts.AddItem(ChargeCost);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityShooterConditions.AddItem(new class'X2Condition_Stealth');
	Template.AddShooterEffectExclusions();

	StealthEffect = new class'X2Effect_RangerStealth';
	StealthEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	StealthEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, true);
	StealthEffect.bRemoveWhenTargetConcealmentBroken = true;
	Template.AddTargetEffect(StealthEffect);

	Template.AddTargetEffect(class'X2Effect_Spotted'.static.CreateUnspottedEffect());

	Template.ActivationSpeech = 'ActivateConcealment';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;

	return Template;
}

//#############################################################
// Mute - Grants extra charges of stillness to the Assassin
//#############################################################

static function X2AbilityTemplate MuteRS()
{
	return PurePassive('MuteRS', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_mountainmist", false, 'eAbilitySource_Perk', true);
}

//#############################################################
// Vanish - Allows the Asssassin to essentially move anywhere in squadsight and conceal (ends turn, shares charges with stillness)
//#############################################################
static function X2DataTemplate VanishRS()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityTarget_Cursor CursorTarget;
	local X2AbilityMultiTarget_Radius RadiusMultiTarget;
	local X2AbilityTrigger_PlayerInput InputTrigger;

	Template= new(None, string('VanishRS')) class'X2AbilityTemplate'; Template.SetTemplateName('VanishRS');;;

	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_ghost";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.Hostility = eHostility_Defensive;
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.STILLNESSRS_CHARGES;
	Charges.AddBonusCharge('MuteRS', default.MUTERS_CHARGES);
	Template.AbilityCharges = Charges;
	
	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	ChargeCost.SharedAbilityCharges.AddItem('StillnessRSCharges');
	Template.AbilityCosts.AddItem(ChargeCost);

	Template.TargetingMethod = class'X2TargetingMethod_Teleport';

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.AbilityToHitCalc = default.DeadEye;

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToSquadsightRange = true;
//	CursorTarget.FixedAbilityRange = default.CYBERUS_TELEPORT_RANGE;     // yes there is.
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = 0.25; // small amount so it just grabs one tile
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	// Shooter Conditions
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	//// Damage Effect
	Template.AbilityMultiTargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);
	//TeleportDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	//TeleportDamageEffect.EffectDamageValue = class'X2Item_DefaultWeapons'.default.CYBERUS_TELEPORT_BASEDAMAGE;
	//TeleportDamageEffect.EnvironmentalDamageAmount = default.TELEPORT_ENVIRONMENT_DAMAGE_AMOUNT;
	//TeleportDamageEffect.EffectDamageValue.DamageType = 'Melee';
	//Template.AddMultiTargetEffect(TeleportDamageEffect);

	Template.ActivationSpeech = 'ActivateConcealment';
	Template.ModifyNewContextFn = Teleport_ModifyActivatedAbilityContext;
	Template.BuildNewGameStateFn = Teleport_BuildGameState;
	Template.BuildVisualizationFn = Teleport_BuildVisualization;
	Template.bSkipFireAction = true;	

	return Template;
}

static function X2Effect_RemoveEffectsByDamageType RemoveAllEffectsByDamageType()
{
	local X2Effect_RemoveEffectsByDamageType RemoveEffectTypes;
	local name HealType;

	RemoveEffectTypes = new class'X2Effect_RemoveEffectsByDamageType';
	foreach class'X2Ability_DefaultAbilitySet'.default.MedikitHealEffectTypes(HealType)
	{
		RemoveEffectTypes.DamageTypesToRemove.AddItem(HealType);
	}
	return RemoveEffectTypes;
}

static simulated function Teleport_ModifyActivatedAbilityContext(XComGameStateContext Context)
{
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameStateHistory History;
	local PathPoint NextPoint, EmptyPoint;
	local PathingInputData InputData;
	local XComWorldData World;
	local vector NewLocation;
	local TTile NewTileLocation;

	History = class'XComGameStateHistory'.static.GetGameStateHistory();
	World = class'XComWorldData'.static.GetWorldData();

	AbilityContext = XComGameStateContext_Ability(Context);
	Assert(AbilityContext.InputContext.TargetLocations.Length > 0);
	
	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));

	// Build the MovementData for the path
	// First posiiton is the current location
	InputData.MovementTiles.AddItem(UnitState.TileLocation);

	NextPoint.Position = World.GetPositionFromTileCoordinates(UnitState.TileLocation);
	NextPoint.Traversal = eTraversal_Teleport;
	NextPoint.PathTileIndex = 0;
	InputData.MovementData.AddItem(NextPoint);

	// Second posiiton is the cursor position
	Assert(AbilityContext.InputContext.TargetLocations.Length == 1);

	NewLocation = AbilityContext.InputContext.TargetLocations[0];
	NewTileLocation = World.GetTileCoordinatesFromPosition(NewLocation);
	NewLocation = World.GetPositionFromTileCoordinates(NewTileLocation);

	NextPoint = EmptyPoint;
	NextPoint.Position = NewLocation;
	NextPoint.Traversal = eTraversal_Landing;
	NextPoint.PathTileIndex = 1;
	InputData.MovementData.AddItem(NextPoint);
	InputData.MovementTiles.AddItem(NewTileLocation);

    //Now add the path to the input context
	InputData.MovingUnitRef = UnitState.GetReference();
	AbilityContext.InputContext.MovementPaths.AddItem(InputData);
}

static simulated function XComGameState Teleport_BuildGameState(XComGameStateContext Context)
{
	local XComGameState NewGameState;
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local vector NewLocation;
	local TTile NewTileLocation;
	local XComWorldData World;
	local X2EventManager EventManager;
	local int LastElementIndex;

	World = class'XComWorldData'.static.GetWorldData();
	EventManager = class'X2EventManager'.static.GetEventManager();

	//Build the new game state frame
	NewGameState = TypicalAbility_BuildGameState(Context);

	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());	
	UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', AbilityContext.InputContext.SourceObject.ObjectID));

	LastElementIndex = AbilityContext.InputContext.MovementPaths[0].MovementData.Length - 1;

	// Set the unit's new location
	// The last position in MovementData will be the end location
	Assert(LastElementIndex > 0);
	NewLocation = AbilityContext.InputContext.MovementPaths[0].MovementData[LastElementIndex].Position;
	NewTileLocation = World.GetTileCoordinatesFromPosition(NewLocation);
	UnitState.SetVisibilityLocation(NewTileLocation);

	AbilityContext.ResultContext.bPathCausesDestruction = MoveAbility_StepCausesDestruction(UnitState, AbilityContext.InputContext, 0, AbilityContext.InputContext.MovementPaths[0].MovementTiles.Length - 1);
	MoveAbility_AddTileStateObjects(NewGameState, UnitState, AbilityContext.InputContext, 0, AbilityContext.InputContext.MovementPaths[0].MovementTiles.Length - 1);

	EventManager.TriggerEvent('ObjectMoved', UnitState, UnitState, NewGameState);
	EventManager.TriggerEvent('UnitMoveFinished', UnitState, UnitState, NewGameState);

	//Return the game state we have created
	return NewGameState;
}

simulated function Teleport_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  AbilityContext;
	local StateObjectReference InteractingUnitRef;
	local X2AbilityTemplate AbilityTemplate;
	local VisualizationActionMetadata EmptyTrack, ActionMetadata;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;
	local int i, j;
	local XComGameState_WorldEffectTileData WorldDataUpdate;
	local X2Action_MoveTurn MoveTurnAction;
	local X2VisualizerInterface TargetVisualizerInterface;
	
	History = class'XComGameStateHistory'.static.GetGameStateHistory();

	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = AbilityContext.InputContext.SourceObject;

	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.InputContext.AbilityTemplateName);

	//****************************************************************************************
	//Configure the visualization track for the source
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, AbilityTemplate.LocFlyOverText, '', eColor_Bad);

	// Turn to face the target action. The target location is the center of the ability's radius, stored in the 0 index of the TargetLocations
	MoveTurnAction = X2Action_MoveTurn(class'X2Action_MoveTurn'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
	MoveTurnAction.m_vFacePoint = AbilityContext.InputContext.TargetLocations[0];

	// move action
	class'X2VisualizerHelpers'.static.ParsePath(AbilityContext, ActionMetadata);

		
	//****************************************************************************************

	foreach VisualizeGameState.IterateByClassType(class'XComGameState_WorldEffectTileData', WorldDataUpdate)
	{
		ActionMetadata = EmptyTrack;
		ActionMetadata.VisualizeActor = none;
		ActionMetadata.StateObject_NewState = WorldDataUpdate;
		ActionMetadata.StateObject_OldState = WorldDataUpdate;

		for (i = 0; i < AbilityTemplate.AbilityTargetEffects.Length; ++i)
		{
			AbilityTemplate.AbilityTargetEffects[i].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, AbilityContext.FindTargetEffectApplyResult(AbilityTemplate.AbilityTargetEffects[i]));
		}

			}

	//****************************************************************************************
	//Configure the visualization track for the targets
	//****************************************************************************************
	for( i = 0; i < AbilityContext.InputContext.MultiTargets.Length; ++i )
	{
		InteractingUnitRef = AbilityContext.InputContext.MultiTargets[i];
		ActionMetadata = EmptyTrack;
		ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
		ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
		ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, AbilityContext);
		for( j = 0; j < AbilityContext.ResultContext.MultiTargetEffectResults[i].Effects.Length; ++j )
		{
			AbilityContext.ResultContext.MultiTargetEffectResults[i].Effects[j].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, AbilityContext.ResultContext.MultiTargetEffectResults[i].ApplyResults[j]);
		}

		TargetVisualizerInterface = X2VisualizerInterface(ActionMetadata.VisualizeActor);
		if( TargetVisualizerInterface != none )
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
		}
	}
}