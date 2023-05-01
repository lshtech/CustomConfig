class WIO_X2BreakthroughCondition_ArmorCats extends X2BreakthroughCondition
	editinlinenew
	hidecategories(Object);

var array<name> ArmorTypeMatch;

function bool MeetsCondition(XComGameState_BaseObject kTarget)
{
	local XComGameState_Item ItemState;
	local X2ArmorTemplate ArmorTemplate;

	ItemState = XComGameState_Item( kTarget );
	if (ItemState == none) // not an item
		return false;

	ArmorTemplate = X2ArmorTemplate( ItemState.GetMyTemplate() );
	if (ArmorTemplate == none) // not a weapon
		return false;

	// not a weapon-weapon
	if (ArmorTemplate.ItemCat != 'armor')
		return false;

	return(ArmorTypeMatch.find(ArmorTemplate.ArmorCat) != INDEX_NONE);
}