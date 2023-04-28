class X2DownloadableContentInfo_WeaponUpgradesExpandedWotC extends X2DownloadableContentInfo;

var config array<LootTable> LootEntry;
var config int STEADY_AIM_BONUS_M4;

static event OnPostTemplatesCreated()
{
	AddLootTables();
	class'X2Item_ExpandedUpgrades'.static.PatchWeaponUpgrades();
}

static function AddLootTables()
{
	local X2LootTableManager	LootManager;
	local LootTable				LootBag;
	local LootTableEntry		Entry;
	
	LootManager = X2LootTableManager(class'Engine'.static.FindClassDefaultObject("X2LootTableManager"));

	Foreach default.LootEntry(LootBag)
	{
		if ( LootManager.default.LootTables.Find('TableName', LootBag.TableName) != INDEX_NONE )
		{
			foreach LootBag.Loots(Entry)
			{
				class'X2LootTableManager'.static.AddEntryStatic(LootBag.TableName, Entry, false);
				`LOG("Adding " @ Entry.TableRef @ " to " @ LootBag.TableName,,'WeaponUpgradesExpandedWotC');
			}
		}	
	}
}

static function bool AbilityTagExpandHandler(string InString, out string OutString)
{
	local name TagText;
	TagText = name(InString);
	switch(TagText)
	{
		case 'ABIZI_STEADY_M4':
			OutString = string(default.STEADY_AIM_BONUS_M4 + (class'X2Effect_AbiziSteadyWeapon'.static.AreUpgradesEmpowered() ? class'X2Effect_AbiziSteadyWeapon'.default.EMPOWERSTEADY_AIM:0));
			return true;
		case 'BONUSREACTIONFIREDAMAGESUP':
			OutString = string(class'X2Ability_ExpandedUpgradeAbilities'.default.HAIRTRIGGER_PRT_DAMAGE_VALUE + class'X2Effect_BonusReactionFireDamage'.static.AreUpgradesEmpowered() ? class'X2Effect_BonusReactionFireDamage'.default.HAIRTRIGGER_BONUS_VALUE : 0);
			return true;
		case 'SNHEAVYBARRELT4DMG':
            OutString = string(class'X2Ability_ExpandedUpgradeAbilities'.default.SNHEAVYBARREL_PRT_DMG);
            return true;
		default:
			return false;
	}
}