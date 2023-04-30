
class X2Condition_WOTC_APA_AdvancedSpeedloaderNoAmmo extends X2Condition;

event name CallAbilityMeetsCondition(XComGameState_Ability kAbility, XComGameState_BaseObject kTarget)
{
	local XComGameState_Unit	TargetUnit;
	local XComGameState_Item	InventoryItem;

	TargetUnit = XComGameState_Unit(kTarget);
	if (TargetUnit == none)
		return 'AA_NotAUnit';

	if (TargetUnit.AffectedByEffectNames.Find('WOTC_APA_Speedloader_AdvancedPenalty') != -1)
	{
		InventoryItem = XComGameState_Item(`XCOMHISTORY.GetGameStateForObjectID(kAbility.SourceWeapon.ObjectID));
		if (InventoryItem.Ammo > 0)
		{
			return 'AA_AmmoAlreadyFull';
	}	}

	return 'AA_Success';
}