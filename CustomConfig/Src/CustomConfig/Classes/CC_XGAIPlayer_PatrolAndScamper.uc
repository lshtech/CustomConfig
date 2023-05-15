class CC_XGAIPlayer_PatrolAndScamper extends XGAIPlayer;

// Update - green alert units should do their patrol movement.
function bool ShouldUnitPatrol( XComGameState_Unit UnitState )
{
	if( IsMindControlled(UnitState) )
	{
		return false;
	}

	if(!IsScampering(UnitState.ObjectID) )
	{
		// Only leaders direct movement in patrols
		if( UnitState.GetGroupMembership().m_arrMembers[0].ObjectID == UnitState.ObjectID ) {
			return true;
		}
	}

	return false;
}

function OnBTRunCompletePostExecute(int UnitID)
{
	local XComGameStateHistory History;
	local XComGameState_Unit ScamperUnit;
	local XComGameState_AIGroup ScamperGroup;
	local bool bWaitingForOtherScamperGroupMembers;
	local X2AIBTBehaviorTree BTMgr;
	BTMgr = `BEHAVIORTREEMGR;

	if( `TACTICALRULES.UnitActionPlayerIsAI() )
	{
		if( m_arrWaitForScamper.RemoveItem(UnitID) > 0 )
		{
			GatherUnitsToMove();
		}
	}

	//Perform special logic so that scamper moves can be bookended by the proper game states
	if( BTMgr.IsScampering(UnitID, false) )
	{		
		//See if anyone else from our scamper group is still scampering
		History = `XCOMHISTORY;
		ScamperUnit = XComGameState_Unit(History.GetGameStateForObjectID(UnitID));
		ScamperGroup = ScamperUnit.GetGroupMembership();
		bWaitingForOtherScamperGroupMembers = BTMgr.IsGroupScampering(ScamperGroup);

		//If not, then mark our scamper group as done!
		if(!bWaitingForOtherScamperGroupMembers)
		{
			//`Log("Completing scamper");
			//`RedScreen("Completing scamper");
			ScamperRestoreMovementOrActions();
			ScamperGroup.OnScamperComplete();
		}
	}
}


function ScamperRestoreMovementOrActions() 
{
    local XComGameStateHistory History;
    local XComGameState_Unit Unit;

    History = `XCOMHISTORY;
	
    foreach History.IterateByClassType(class'XComGameState_Unit', Unit)
    {
		// If the unit belongs to the player and isn't removed from play, dead, panicked, mind controlled, or incapacitated, then restore APs
        if ( Unit.IsPlayerControlled() && !Unit.bRemovedFromPlay && Unit.IsAlive() && 
		!Unit.bPanicked && !Unit.IsMindControlled() && !Unit.IsIncapacitated() && !Unit.IsHunkeredDown())
         {
			// Restore one movement point to the XCOM player unit if they aren't already maxed out on points.
			if (Unit.ActionPoints.length == 0 && Unit.ReserveActionPoints.length == 0)
			{
                `Log("Awarding 1 movement point");
                `RedScreen("Awarding 1 movement point");
                //Unit.ActionPoints.AddItem(class'X2CharacterTemplateManager'.default.MoveActionPoint);
                Unit.ActionPoints.AddItem('scamper');
			}
         }
    }		
}




