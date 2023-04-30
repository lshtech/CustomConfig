
class X2Effect_WOTC_APA_RemovedOnMoveStatChange extends X2Effect_PersistentStatChange;


// Register for the UnitMovedFinished Event Trigger
function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager						EventManager;
	local Object								EffectObj, TargetObj;
	
	EventManager = `XEVENTMGR;
	EffectObj = EffectGameState;
	TargetObj = `XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID);

	EventManager.RegisterForEvent(EffectObj, 'UnitMoveFinished', RemoveEffectOnMove, ELD_OnStateSubmitted,,TargetObj,, EffectObj);
}

// Only one set of stat effects are allowed to apply to a target.
function bool UniqueToHitModifiers() { return true; }


// Remove the StatChange effect when the unit moves (or falls)
static function EventListenerReturn RemoveEffectOnMove(Object EventData, Object EventSource, XComGameState NewGameState, Name InEventID, Object CallbackData)
{
	local XComGameState_Effect					EffectState;
	local XComGameStateContext_EffectRemoved	EffectRemovedContext;
	local XComGameState							EffectRemovedGameState;
	
	EffectState = XComGameState_Effect(CallbackData);

	EffectRemovedContext = class'XComGameStateContext_EffectRemoved'.static.CreateEffectRemovedContext(EffectState);	
	EffectRemovedGameState = `XCOMHISTORY.CreateNewGameState(true, EffectRemovedContext);
	EffectState.RemoveEffect(EffectRemovedGameState, EffectRemovedGameState);
	`TACTICALRULES.SubmitGameState(EffectRemovedGameState);	
	
	return ELR_NoInterrupt;
}


defaultproperties
{
	bRemoveWhenSourceDies=true
}