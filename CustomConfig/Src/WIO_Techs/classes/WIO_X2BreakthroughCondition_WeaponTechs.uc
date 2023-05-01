class WIO_X2BreakthroughCondition_WeaponTechs extends X2BreakthroughCondition
	editinlinenew
	hidecategories(Object);

var array<name> WeaponTypeMatch;

function bool MeetsCondition(XComGameState_BaseObject kTarget)
{
	local XComGameState_Item ItemState;
	local X2WeaponTemplate WeaponTemplate;

	ItemState = XComGameState_Item( kTarget );
	if (ItemState == none) // not an item
		return false;

	WeaponTemplate = X2WeaponTemplate( ItemState.GetMyTemplate() );
	if (WeaponTemplate == none) // not a weapon
		return false;

	// not a weapon-weapon
	if (WeaponTemplate.ItemCat != 'weapon')
		return false;

	return(WeaponTypeMatch.Find(WeaponTemplate.WeaponTech) != INDEX_NONE);
}