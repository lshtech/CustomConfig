class WIO_X2BreakthroughCondition_Grenade extends X2BreakthroughCondition_WeaponType
	editinlinenew
	hidecategories(Object);

function bool MeetsCondition(XComGameState_BaseObject kTarget)
{
	local XComGameState_Item ItemState;
	local X2GrenadeTemplate GrenadeTemplate;
	
	// not an item
	ItemState = XComGameState_Item( kTarget );
	if (ItemState == none) 
		return false;

	// not a weapon
	GrenadeTemplate = X2GrenadeTemplate( ItemState.GetMyTemplate() );
	if (GrenadeTemplate == none) 
		return false;

	// not a grenade-weapon
	if (GrenadeTemplate.ItemCat != 'grenade')
		return false;

	// no damage
	if (GrenadeTemplate.BaseDamage.Damage < 1)
		return false;

	return GrenadeTemplate.WeaponCat == WeaponTypeMatch;
}