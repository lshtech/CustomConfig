class XGCharacterGenerator_NoInvisibleHeadsOnRandoms extends XGCharacterGenerator Config(NoInvisibleHeadsOnRandoms);

var config array<Name> MatchNames;
var config int Tries;

function bool PartIsGood(Name PartName)
{
    local name Name;
    
    foreach default.MatchNames(Name)
    {
        if (Name == PartName)
            return false;      
    }
    
    return true;
}

function X2BodyPartTemplate RandomizeSetBodyPart(X2BodyPartTemplateManager PartTemplateManager, out name DataName, string PartTypeName, delegate<FilterCallback> CallbackFn, optional bool bCanBeEmpty = false)
{
	local X2BodyPartTemplate RandomPart;
    local int i;

	if(bCanBeEmpty)
	{
		DataName = '';
	}
    
    i = 0;
	do
	{
        i++;
		RandomPart = PartTemplateManager.GetRandomUberTemplate(PartTypeName, `XCOMGAME.SharedBodyPartFilter, CallbackFn);
        if (i > 1)
            `Log("CustomConfig: Retried " $ RandomPart.Name);
	} Until (PartIsGood(RandomPart.Name) || i == default.Tries);
		
	if(!bCanBeEmpty || (RandomPart != none))
	{
		DataName = (RandomPart != none) ? RandomPart.DataName : DefaultGetRandomUberTemplate_WarnAboutFilter(PartTypeName);
	}
	return RandomPart;
}
