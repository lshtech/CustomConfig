class OPTC_Grenades extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated()
{
	local X2ItemTemplateManager 			ItemTemplateManager;
	local X2DataTemplate					DifficultyTemplate;
	local array<X2DataTemplate>				DifficultyTemplates;
	local X2GrenadeTemplate					Grenade;

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	ItemTemplateManager.FindDataTemplateAllDifficulties('FragGrenade',DifficultyTemplates);
	foreach DifficultyTemplates(DifficultyTemplate) 
	{
		Grenade = X2GrenadeTemplate(DifficultyTemplate);
		if(Grenade != none)
		{
			Grenade.strImage = "img:///BetterIcons.Grenades.Inv_HE_Grenade";
		}
	}
}