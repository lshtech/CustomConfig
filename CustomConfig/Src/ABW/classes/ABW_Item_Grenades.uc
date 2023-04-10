class ABW_Item_Grenades extends X2Item_DefaultGrenades config(GameData_WeaponData);


var config WeaponDamageValue FLECHETTEGRENADE_BASEDAMAGE;

var config int FLECHETTEGRENADE_IENVIRONMENTDAMAGE;
var config int FLECHETTEGRENADE_RADIUS;


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Grenades;

	Grenades.AddItem(CreateFlechetteGrenade());

	return Grenades;
}

static function X2DataTemplate CreateFlechetteGrenade()
{
	local X2GrenadeTemplate Template;
	local X2Effect_ApplyWeaponDamage WeaponDamageEffect;
	local X2Effect_Knockback KnockbackEffect;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, 'FlechetteGrenade');

	Template.strImage = "img:///BetterIcons.Grenades.Inv_Flech_Grenade";
	Template.EquipSound = "StrategyUI_Grenade_Equip";
	Template.iRange = default.FRAGGRENADE_RANGE;
	Template.iRadius = default.FLECHETTEGRENADE_RADIUS;

	Template.BaseDamage = default.FLECHETTEGRENADE_BASEDAMAGE;
	Template.iSoundRange = default.FRAGGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.FLECHETTEGRENADE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = default.FRAGGRENADE_TRADINGPOSTVALUE;
	Template.iClipSize = default.FRAGGRENADE_ICLIPSIZE;
	Template.DamageTypeTemplateName = 'Explosion';
	Template.Tier = 0;

	Template.Abilities.AddItem('ThrowGrenade');
	Template.Abilities.AddItem('GrenadeFuse');

	Template.GameArchetype = "WP_Grenade_Frag.WP_Grenade_Frag";

	Template.iPhysicsImpulse = 10;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = true;
	Template.ThrownGrenadeEffects.AddItem(WeaponDamageEffect);
	Template.LaunchedGrenadeEffects.AddItem(WeaponDamageEffect);

	Template.HideIfResearched = 'PlasmaGrenade';

	Template.OnThrowBarkSoundCue = 'ThrowGrenade';

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 2;
	Template.ThrownGrenadeEffects.AddItem(KnockbackEffect);
	Template.LaunchedGrenadeEffects.AddItem(KnockbackEffect);

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.FRAGGRENADE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.FLECHETTEGRENADE_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.FLECHETTEGRENADE_BASEDAMAGE.Pierce);

	return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}
