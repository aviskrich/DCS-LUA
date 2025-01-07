---- mission accept Menu

if enableAcceptNextMissionMenu == true then
	missionAcceptMenuRoot = missionCommands.addSubMenu("MISSION ACCEPT LIST MENU")
end

if enableMissionsSequence == true or enableMissionPointsSystem == true then

	if enableMissionPointsSystem == true then
	missionSequencePointsMenuRoot = missionCommands.addSubMenu("MISSION SEQUENCE/POINTS STATUS MENU")
	else
	missionSequencePointsMenuRoot = missionCommands.addSubMenu("MISSION SEQUENCE STATUS MENU")
	end

	if enableMissionsSequence == true then
		missionSequenceStatusMenuOption = missionCommands.addCommand('Display Mission Completion Sequence Status', missionSequencePointsMenuRoot, displayMissionCompletionSequenceStatus, nil)	
	end

	if enableMissionPointsSystem == true then
		missionPointsStatusMenuOption = missionCommands.addCommand('Display Mission Points Status', missionSequencePointsMenuRoot, displayMissionPointsStatus, nil)	
	end

end

utilsToolsMenu = missionCommands.addSubMenu('Misc Mission Tools + Utils')

local function SHOW_TTI_STATUS()
showTtiMissionSettingInitStatus()
end

local function DESTROY_RAT_RED_PLANES()
destroyRedRatPlanes()
end

if enable_mep == true then
function enhancer.setEnhancerMenu()
	menuPrinc = missionCommands.addSubMenu('Mission Enhancer Menu', utilsToolsMenu)
	enhancer.N1 = missionCommands.addSubMenu('DRONE LASE', menuPrinc)
	enhancer.N11 = missionCommands.addCommand('Request Drone', enhancer.N1, enhancer.requestDrone, nil)	
	
	enhancer.N2 = missionCommands.addCommand('Recon my target', menuPrinc, enhancer.requestSatellite, nil)
	
	enhancer.N3 = missionCommands.addCommand('Strike on my target', menuPrinc, enhancer.requestStrike, nil)	
	
	enhancer.N4 = missionCommands.addSubMenu('SEAD', menuPrinc)
	enhancer.N41 = missionCommands.addCommand('Request SEAD package', enhancer.N4, enhancer.requestSEAD, nil)	
	--enhancer.N43 = missionCommands.addCommand('Test destroy unit', enhancer.N4, destroyUnit, nil)	
	
	enhancer.N5 = missionCommands.addSubMenu('GROUND ATTACK', menuPrinc)
	enhancer.N51 = missionCommands.addCommand('Request Ground Attack package', enhancer.N5, enhancer.requestGrAttack, nil)	
	
	enhancer.N6 = missionCommands.addSubMenu('SWEEP', menuPrinc)
	enhancer.N61 = missionCommands.addCommand('Request fighter sweep package', enhancer.N6, enhancer.requestFighterSweep, nil)	
	
	enhancer.N7 = missionCommands.addSubMenu('SCOUT.', menuPrinc)
	enhancer.N71 = missionCommands.addCommand('Request scout package', enhancer.N7, enhancer.requestScout, nil)

	enhancer.N8 = missionCommands.addSubMenu('ESCORT', menuPrinc)
	enhancer.N81 = missionCommands.addCommand('Request escort package', enhancer.N8, enhancer.requestEscort, nil)	
	
	enhancer.N9 = missionCommands.addSubMenu('DISMISS', menuPrinc)
	
end;
enhancer.setEnhancerMenu()
end


if carrierOpsTheatre == true then
if mission_era == "modern" or mission_era == "cold_war" then

function addCarrierStaticMenu()
mainMenuSc = missionCommands.addSubMenu("Super Carrier Deck Layout Menu", utilsToolsMenu)

spawn4Menu = missionCommands.addSubMenu("4 Spawns", mainMenuSc)
missionCommands.addCommand( "[Blocked]", spawn4Menu,sc4SpawnsBlocked,{})
missionCommands.addCommand( "[Clear Deck]", spawn4Menu,sc4SpawnsClearDeck,{})
missionCommands.addCommand( "[Remove Statics Blocking AI]", spawn4Menu, sc4RemoveTemplateBlockingStaticsForAI,{})
missionCommands.addCommand( "[Remove 4 Spawns Statics]", spawn4Menu, sc4RemoveAllDeckStatics,{})
missionCommands.addCommand( "[Remove ALL Statics]", spawn4Menu, removeAllStatics,{})

spawn8Menu = missionCommands.addSubMenu("8 Spawns", mainMenuSc)
missionCommands.addCommand( "[Blocked]", spawn8Menu,sc8SpawnsBlocked,{})
missionCommands.addCommand( "[Clear Deck]", spawn8Menu,sc8SpawnsClearDeck,{})
missionCommands.addCommand( "[Remove Statics Blocking AI]", spawn8Menu, sc8RemoveTemplateBlockingStaticsForAI,{})
missionCommands.addCommand( "[Remove 8 Spawns Statics]", spawn8Menu, sc8RemoveAllDeckStatics,{})
missionCommands.addCommand( "[Remove ALL Statics]", spawn8Menu, removeAllStatics,{})


spawn16Menu = missionCommands.addSubMenu("16 Spawns", mainMenuSc)
missionCommands.addCommand( "[Blocked]", spawn16Menu,sc16SpawnsBlocked,{})
missionCommands.addCommand( "[Clear Deck]", spawn16Menu,sc16SpawnsClearDeck,{})
missionCommands.addCommand( "[Remove Statics Blocking AI]", spawn16Menu, sc16RemoveTemplateBlockingStaticsForAI,{})
missionCommands.addCommand( "[Remove 16 Spawns Statics]", spawn16Menu, sc16RemoveAllDeckStatics,{})
missionCommands.addCommand( "[Remove ALL Statics]", spawn16Menu, removeAllStatics,{})


massLaunchMenu = missionCommands.addSubMenu("Mass Launch", mainMenuSc)
missionCommands.addCommand( "[Aft Hornets]", massLaunchMenu,massLaunchAftHornets,{})
missionCommands.addCommand( "[Aft Tomcats]", massLaunchMenu,massLaunchAftTomcats,{})
missionCommands.addCommand( "[Remove Mass Launch Statics]", massLaunchMenu,massLaunchRemoveStatics,{})
missionCommands.addCommand( "[Remove ALL Statics]", massLaunchMenu, removeAllStatics,{})


massRecoveryMenu = missionCommands.addSubMenu("Mass Recovery", mainMenuSc)
missionCommands.addCommand( "[Cat 1 Hornets]", massRecoveryMenu,massRecoveryCat1Hornets,{})
missionCommands.addCommand( "[Cat 1 Tomcats]", massRecoveryMenu,massRecoveryCat1Tomcats,{})
missionCommands.addCommand( "[Cat 2 Hornets]", massRecoveryMenu,massRecoveryCat2Hornets,{})
missionCommands.addCommand( "[Cat 2 Tomcats]", massRecoveryMenu,massRecoveryCat2Tomcats,{})
missionCommands.addCommand( "[Remove Cat 1 Statics]", massRecoveryMenu,massRecoveryRemoveCat1Statics,{})
missionCommands.addCommand( "[Remove Cat 2 Statics]", massRecoveryMenu,massRecoveryRemoveCat2Statics,{})
missionCommands.addCommand( "[Remove Mass Recovery Statics]", massRecoveryMenu,massRecoveryRemoveStatics,{})
missionCommands.addCommand( "[Remove ALL Statics]", massRecoveryMenu, removeAllStatics,{})
end

if shipID ~=nil then
addCarrierStaticMenu()
end

if env.mission.theatre ~= "Normandy" then
atisMenu = missionCommands.addSubMenu("ATIS Menu", utilsToolsMenu)
missionCommands.addCommand( "START ATIS for ".. atisTTI_info_short, atisMenu, start_atis_main)
missionCommands.addCommand( "STOP ATIS for " .. atisTTI_info_short, atisMenu, stop_atis_main)
missionCommands.addCommand( "Display ATIS Information", atisMenu, displayAtisInfo)

if env.mission.theatre == "Syria" then
missionCommands.addCommand( "START SYRIA ATIS Akrotiri", atisMenu, start_atis_syria_ak)
missionCommands.addCommand( "START SYRIA ATIS Incirlik", atisMenu, start_atis_syria_inck)
missionCommands.addCommand( "START SYRIA ATIS Ramat David", atisMenu, start_atis_syria_rmt)
missionCommands.addCommand( "STOP ALL SYRIA ATIS", atisMenu, stop_atis_syria_all)
end

end


end
end

if enable_rat_f10_menu == true then

rat_f10_menu = missionCommands.addSubMenu("Random Air Traffic In-Game Menu", utilsToolsMenu)
--rat_f10_menu = missionCommands.addSubMenu("Random Air Traffic In-Game Menu")

rat_blue_spawning_f10_menu = missionCommands.addSubMenu("BLUE Air Traffic Spawns", rat_f10_menu)
missionCommands.addCommand( "Force Start Blue Large Civilian Air Traffic (Airbase)", rat_blue_spawning_f10_menu, forceStartBlueRatLargeCivAirfield)
missionCommands.addCommand( "Force Start Blue Large Military Air Traffic (Airbase)", rat_blue_spawning_f10_menu, forceStartBlueRatLargeMilAirfield)
missionCommands.addCommand( "Force Start Blue Fighter Air Traffic (Airbase)", rat_blue_spawning_f10_menu, forceStartBlueRatFighterAirfield)

if cv_cvn_enable == true then
	if mission_era == "modern" or mission_era == "cold_war" then
		if carrierOpsTheatre == true then
			rat_blue_spawning_cvn_menu = missionCommands.addSubMenu( "Force Start Blue CVN Air Traffic", rat_blue_spawning_f10_menu)
			missionCommands.addCommand( "Force Start F/A-18C on CVN", rat_blue_spawning_cvn_menu, forceStartBlueF18Cvn)
			missionCommands.addCommand( "Force Start F-14A on CVN", rat_blue_spawning_cvn_menu, forceStartBlueRatF14aCvn)
			missionCommands.addCommand( "Force Start F-14B on CVN", rat_blue_spawning_cvn_menu, forceStartBlueRatF14bCvn)
			missionCommands.addCommand( "Force Start S-3B on CVN", rat_blue_spawning_cvn_menu, forceStartBlueRatS3BCvn)
			missionCommands.addCommand( "Force Start E-2D on CVN", rat_blue_spawning_cvn_menu, forceStartBlueRatE2DCvn)
			missionCommands.addCommand( "Force Start Random Aircraft on CVN", rat_blue_spawning_cvn_menu, forceStartBlueRatRandomCvn)
			missionCommands.addCommand( "Force Start All Aircraft on CVN", rat_blue_spawning_cvn_menu, forceStartBlueRatAllCvn)
		end
	end
end

if cv_kuz_enable == true then
	if mission_era == "modern" or mission_era == "cold_war" then 
		if carrierOpsTheatre == true then
			rat_blue_spawning_kuz_menu = missionCommands.addSubMenu( "Force Start Blue KUZ Air Traffic", rat_blue_spawning_f10_menu)
			missionCommands.addCommand( "Force Start Su-33 on Kuznetsov", rat_blue_spawning_kuz_menu, forceStartBlueRatSu33Kuz)
		end
	end
end

if cv_lha_enable == true then
	if mission_era == "modern" or mission_era == "cold_war" then 
		if carrierOpsTheatre == true then
			rat_blue_spawning_lha_menu = missionCommands.addSubMenu( "Force Start Blue LHA-1 Air Traffic", rat_blue_spawning_f10_menu)
			missionCommands.addCommand( "Force Start AV-8B on LHA-1", rat_blue_spawning_lha_menu, forceStartBlueRatAv8bLha)
			missionCommands.addCommand( "Force Start Random Helo on LHA-1", rat_blue_spawning_lha_menu, forceStartBlueRatHeloLha)
		end
	end
end


rat_red_spawning_f10_menu = missionCommands.addSubMenu("RED Air Traffic Spawns", rat_f10_menu)
missionCommands.addCommand( "Force Start Red Large Civilian Air Traffic (Airbase)", rat_red_spawning_f10_menu, forceStartRedRatLargeCivAirfield)
missionCommands.addCommand( "Force Start Red Large Military Air Traffic (Airbase)", rat_red_spawning_f10_menu, forceStartRedRatLargeMilAirfield)
missionCommands.addCommand( "Force Start Red Fighter Air Traffic (Airbase)", rat_red_spawning_f10_menu, forceStartRedRatFighterAirfield)

--missionCommands.addCommand( "Destroy All Red Random Air Traffic", rat_f10_menu, destroyRedRatPlanes)
--missionCommands.addCommand( "Destroy All Blue Random Air Traffic", rat_f10_menu, destroyBlueRatPlanes)
--missionCommands.addCommand( "Stop Random Air Traffic Script", rat_f10_menu, stopAllRatPlanes)
end

missionCommands.addCommand( "Display TTI Script and Settings Status",utilsToolsMenu,SHOW_TTI_STATUS)
missionCommands.addCommand( "Display Map Marker Help Command List Text",utilsToolsMenu,handleShowCommandsRequest)



env.info('TTI Menus Consolidation file ... LOADED!')
tti_menu_consolidation_script_loaded = true