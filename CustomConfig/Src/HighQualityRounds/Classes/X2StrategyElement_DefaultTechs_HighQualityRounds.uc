// Added:
// High Quality Ammo as a base requirement for creating Experimental Ammo

class X2StrategyElement_DefaultTechs_HighQualityRounds extends X2StrategyElement_DefaultTechs
	config(HighQualityRounds);

var config bool ExperimentalAmmoReq; // If High Quality Rounds should be required to build Experimental Ammo

/*static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	Super.CreateTemplates();

	Techs.AddItem(CreateExperimentalAmmoTemplate_AVS());

	return Techs;
}*/

static function X2DataTemplate CreateExperimentalAmmoTemplate()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	if(default.ExperimentalAmmoReq)
	{

		`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'ExperimentalAmmo');

		Super.CreateExperimentalAmmoTemplate();

		// Cost
		//Resources.ItemTemplateName = 'Supplies';
	// 	Resources.Quantity = 25;
	// 	Template.Cost.ResourceCosts.AddItem(Resources);
		Artifacts.ItemTemplateName = 'HighQualityRounds';
		Artifacts.Quantity = 1;
		Template.Cost.ArtifactCosts.AddItem(Artifacts);

		return Template;
	}
}