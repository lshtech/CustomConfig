class WIO_X2BreakthroughCondition_Medikit extends X2BreakthroughCondition_WeaponType
	editinlinenew
	hidecategories(Object);

function bool MeetsCondition(XComGameState_BaseObject kTarget)
{
	local XComGameState_Item ItemState;
	local X2WeaponTemplate WeaponTemplate;
	
	// not an item
	ItemState = XComGameState_Item( kTarget );
	if (ItemState == none) 
		return false;

	// not a weapon
	//WeaponTemplate = X2WeaponTemplate( ItemState.GetMyTemplate() );
	//if (WeaponTemplate == none) 
	//	return false;

	return WeaponTemplate.WeaponCat == 'medikit' || WeaponTemplate.WeaponCat == 'UtilityCatHeal';
}