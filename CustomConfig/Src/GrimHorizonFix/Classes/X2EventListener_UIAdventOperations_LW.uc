class X2EventListener_UIAdventOperations_LW extends X2EventListener;

// UIAdventOperations_LW updates its resource display based upon the screen being shown; unfortunately, it will update itself for
// the base Recruit Screen, UIRecruitSoldiers, but not our custom variant. Therefore, we need to create a listener which listens 
// for the Community Highlander event 'UpdateResources', so we can set up the resource display ourself.

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateListenerTemplate_UIAdventOperations_LW());
	
	return Templates;
}

static function CHEventListenerTemplate CreateListenerTemplate_UIAdventOperations_LW()
{
	local CHEventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'UIAdventOperations_LW');

	Template.RegisterInTactical = false;
	Template.RegisterInStrategy = true;

	Template.AddCHEvent('UpdateResources', OnUIAdventOperations_LW, ELD_Immediate);

	return Template;
}

static function EventListenerReturn OnUIAdventOperations_LW(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComHQPresentationLayer HQPres;

	HQPres = `HQPRES;

	// KDM : We are only interested when our custom Recruit Screen is on the top of the screen stack.
	if (HQPres.ScreenStack.GetCurrentClass() == class'UIAdventOperations_LW')
	{
		// KDM : Display the same information a normal Recruit Screen would show.
		HQPres.m_kAvengerHUD.UpdateMonthlySupplies();
		HQPres.m_kAvengerHUD.UpdateSupplies();
		HQPres.m_kAvengerHUD.UpdateIntel();
		HQPres.m_kAvengerHUD.ShowResources();
	}

	return ELR_NoInterrupt;
}
