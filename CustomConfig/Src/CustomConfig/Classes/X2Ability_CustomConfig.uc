class X2Ability_CustomConfig extends X2Ability;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

    Templates.AddItem(PurePassive('ExtraGrenade'));
	
	return Templates;
}