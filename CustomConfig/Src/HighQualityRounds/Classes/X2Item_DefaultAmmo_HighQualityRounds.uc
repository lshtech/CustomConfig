// This is an Unreal Script
class X2Item_DefaultAmmo_HighQualityRounds extends X2Item_DefaultAmmo
		config(HighQualityRounds);

var config int HQ_DMGMOD;
var config int SUPPLY_COST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Items;

	Items.AddItem(HighQualityRounds());

	return Items;
}

static function X2AmmoTemplate HighQualityRounds()
{
	local X2AmmoTemplate 	Template;
	local WeaponDamageValue DamageValue;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'HighQualityRounds');
	Template.strImage = "img:///HighQualityRounds_UILibrary_StrategyImages.Inv_Hq_Rounds";
	Template.Abilities.AddItem('HighQualityRoundsBonusAbility');
	DamageValue.Damage = default.HQ_DMGMOD;
	Template.AddAmmoDamageModifier(none, DamageValue);
	Template.CanBeBuilt = true;
	Template.TradingPostValue = 10;
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.EquipSound = "StrategyUI_Ammo_Equip";

	Template.SetUIStatMarkup(class'XLocalizedData'.default.DamageBonusLabel, , default.HQ_DMGMOD);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.AimLabel, eStat_Offense, class'X2Ability_ItemGrantedAbilitySet_HighQualityRounds'.default.HQ_AIM);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, eStat_ArmorPiercing, class'X2Ability_ItemGrantedAbilitySet_HighQualityRounds'.default.HQ_AP);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalChanceBonusLabel, eStat_CritChance, class'X2Ability_ItemGrantedAbilitySet_HighQualityRounds'.default.HQ_CRITCH);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CriticalDamageLabel, , class'X2Ability_ItemGrantedAbilitySet_HighQualityRounds'.default.HQ_CRITDMG);

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	//FX Reference
	Template.GameArchetype = "Ammo_Tracer.PJ_Tracer";
	
	return Template;
}
