class X2DownloadableContentInfo_CustomConfig extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated()
{
	UpdateForScamper();
	UpdateKineticVests();
	AssignAmmoSlotToAmmo();
	AssignVestSlotToVest();
	//UpdateAlloyweveVest();
	//HideItem('ReinforcedVest');
	//HideItem('SavLightVest');
}

static event InstallNewCampaign(XComGameState StartState)
{
	DisableVests();
	UpdateCrates();
}

static event OnLoadedSavedGame()
{
	DisableVests();
	UpdateCrates();
}

static function DisableVests()
{
	local X2ItemTemplateManager		ItemMgr;
	local X2DataTemplate			DataTemplate;
	local X2EquipmentTemplate		EquipmentTemplate;

	// Access Item Template Manager
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Access all Data Templates
	foreach ItemMgr.IterateTemplates(DataTemplate, none)
	{
		if (DataTemplate.Class.Name == 'X2EquipmentTemplate')
		{
			EquipmentTemplate = X2EquipmentTemplate(DataTemplate);
			`LOG("Trying to update" @ EquipmentTemplate.name @ "|" @ EquipmentTemplate.bInfiniteItem @ "|" @ EquipmentTemplate.StartingItem,,'CC');
			if (EquipmentTemplate != none && (EquipmentTemplate.Name == 'ReinforcedVest' || EquipmentTemplate.Name == 'SavLightVest'))
			{
				EquipmentTemplate.bInfiniteItem = false;
				EquipmentTemplate.StartingItem = false;
			}
		}
	}
}

static function UpdateForScamper()
{
	local X2AbilityTemplateManager						AbilityMgr;
	local X2AbilityTemplate								AbilityTemplate;
	local X2AbilityCost_ActionPoints					ActionPointCost;

	AbilityMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	AbilityTemplate = AbilityMgr.FindAbilityTemplate('StandardMove');
	if (AbilityTemplate != none)
	{
		ActionPointCost = X2AbilityCost_ActionPoints(AbilityTemplate.AbilityCosts[0]);
		ActionPointCost.AllowedTypes.AddItem('scamper');
	}

	AbilityTemplate = AbilityMgr.FindAbilityTemplate('HunkerDown');
	if (AbilityTemplate != none)
	{
		ActionPointCost = X2AbilityCost_ActionPoints(AbilityTemplate.AbilityCosts[0]);
		ActionPointCost.AllowedTypes.AddItem('scamper');
	}
}

static function UpdateKineticVests()
{
	local X2AbilityTemplateManager						AbilityMgr;
	local X2AbilityTemplate								AbilityTemplate;
	local int											i;
	local CC_X2Effect_PushUpVestPersonalKineticShield	PersonalKineticShield;

	AbilityMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	AbilityTemplate = AbilityMgr.FindAbilityTemplate('PushUpShield');
	if (AbilityTemplate != none)
	{
		for (i = 0; i < AbilityTemplate.AbilityTargetEffects.Length; i++)
		{
			if(X2Effect_PushUpVestPersonalKineticShield(AbilityTemplate.AbilityTargetEffects[i]) != None )
			{	
				PersonalKineticShield = new class'CC_X2Effect_PushUpVestPersonalKineticShield';
				PersonalKineticShield.AddPersistentStatChange(eStat_ShieldHP, class'X2Ability_PushUpVest'.default.MaxShieldAmount);
				PersonalKineticShield.SetDisplayInfo(ePerkBuff_Bonus, class'X2Ability_PushUpVest'.default.PersonalKineticShieldName, class'X2Ability_PushUpVest'.default.PersonalKineticShieldDesc, "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest");
				PersonalKineticShield.ShieldPerCharge = class'X2Ability_PushUpVest'.default.ShieldPerCharge;
				PersonalKineticShield.BuildPersistentEffect(1, true, false, false);
				AbilityTemplate.AbilityTargetEffects[i] = PersonalKineticShield;
			}
		}
	}
}

static function AssignAmmoSlotToAmmo()
{
	local X2ItemTemplateManager		ItemMgr;
	local X2DataTemplate			DataTemplate;
	local X2AmmoTemplate			AmmoTemplate;

	// Access Item Template Manager
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Access all Data Templates
	foreach ItemMgr.IterateTemplates(DataTemplate, none)
	{
		if (DataTemplate.Class.Name == 'X2AmmoTemplate')
		{
			// Access Ammo
			AmmoTemplate = X2AmmoTemplate(DataTemplate);
			if (AmmoTemplate != none)
			{
				// Assign Ammo Slot to Ammo
				AmmoTemplate.InventorySlot = eInvSlot_AmmoPocket;
			}
		}
	}
}

static function AssignVestSlotToVest()
{
	local X2ItemTemplateManager		ItemMgr;
	local X2DataTemplate			DataTemplate;
	local X2EquipmentTemplate		EquipmentTemplate;

	// Access Item Template Manager
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Access all Data Templates
	foreach ItemMgr.IterateTemplates(DataTemplate, none)
	{
		if (DataTemplate.Class.Name == 'X2EquipmentTemplate')
		{
			// Access Vest
			EquipmentTemplate = X2EquipmentTemplate(DataTemplate);
			if (EquipmentTemplate != none && EquipmentTemplate.ItemCat == 'defense')
			{
				// Assign Vest Slot to Vest
				EquipmentTemplate.InventorySlot = 33;
			}
		}
	}
}

static function UpdateAlloyweveVest()
{
	local X2ItemTemplateManager 		ItemTemplateMgr;
	local X2AbilityTemplateManager		AbilityTempalteMgr;
	local X2EquipmentTemplate 			EquipmentTemplate;
	local X2AbilityTemplate				AbilityTemplate;
	local X2Effect_PersistentStatChange	PersistentStatChangeEffect;
	local array<X2DataTemplate> 		DataTemplates;
	local X2DataTemplate 				DataTemplate;

	ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	ItemTemplateMgr.FindDataTemplateAllDifficulties('AlloyweveVest', DataTemplates);
	foreach DataTemplates(DataTemplate)
	{
		EquipmentTemplate = X2EquipmentTemplate(DataTemplate);
		if (EquipmentTemplate != none)
		{	
			EquipmentTemplate.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, -2);
		}
	}

	AbilityTempalteMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	AbilityTemplate = AbilityTempalteMgr.FindAbilityTemplate('AlloyweveVestBonus');
	
	if (AbilityTemplate != none)
	{
		PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
		PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, -2);
		AbilityTemplate.AddTargetEffect(PersistentStatChangeEffect);
	}
}

static function HideItem(name TemplateName)
{
	local X2EquipmentTemplate	Template;
	local X2SchematicTemplate 	SchematicTemplate;
	local X2ItemTemplateManager ItemMgr;
	
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	Template = X2EquipmentTemplate(ItemMgr.FindItemTemplate(TemplateName));
	if(Template == None)
		return;

	Template.BaseItem = '';
	Template.StartingItem = false;
	Template.CanBeBuilt = false;	
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;

	//	and their templates
	if (Template.CreatorTemplateName != '')
	{
		SchematicTemplate = X2SchematicTemplate(ItemMgr.FindItemTemplate(Template.CreatorTemplateName));

		if (SchematicTemplate != none)
		{
			SchematicTemplate.CanBeBuilt = false;	
			Template.CreatorTemplateName = '';
		}
	}
}

static function UpdateCrates()
{
	local X2StrategyElementTemplateManager	StrategyMgr;
	local X2DataTemplate					DataTemplate;
	local X2TechTemplate					TechTemplate;
	local int								i;

	// Access Item Template Manager
	StrategyMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	// Access all Data Templates
	foreach StrategyMgr.IterateTemplates(DataTemplate, none)
	{
		if (DataTemplate.Name == 'SAVAdventCrateUnlock' || DataTemplate.Name == 'SAVAdventHeavyCrateUnlock')
		{
			TechTemplate = X2TechTemplate(DataTemplate);

			for (i = 0; i < TechTemplate.ItemRewards.Length; i++)
			{
				if (TechTemplate.ItemRewards[i] == 'NanoScaleVest')
					TechTemplate.ItemRewards[i] = 'TRArmorUpgrade_NanoScaleVest';
				else if (TechTemplate.ItemRewards[i] == 'PlatedVest')
					TechTemplate.ItemRewards[i] = 'TRArmorUpgrade_PlatedVest';
				else if (TechTemplate.ItemRewards[i] == 'HazmatVest')
					TechTemplate.ItemRewards[i] = 'TRArmorUpgrade_HazmatVest';
				else if (TechTemplate.ItemRewards[i] == 'AlloyweveVest')
					TechTemplate.ItemRewards[i] = 'TRArmorUpgrade_AlloyweveVest';
			}
		}
	}
}