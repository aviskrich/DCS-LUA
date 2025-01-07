TTI_Menus = {}
TTI_Menus.playerData = {}
TTI_Menus.radioMenusAdded = {}
TTI_Menus.blueCoalition = "blue"
TTI_Menus.redCoalition = "red"


function csar_MenuStart()
	if csar_started == true then
	trigger.action.outText( "<< Initializing CSAR Mission! >>", 10)
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
	csar_mission_start()
	else
		trigger.action.outText( "CSAR MISSION ERROR: Cannot start CSAR Mission. CSAR Script not initiated!", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	end
end

function A2A_Easy_MenuStart()
	if a2a_manual_spawn_stacking == false and A2A_Easy_Spawn ~= nil and A2A_Easy_Spawn:IsAlive() then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_easy_menu_start()
	end
end

function A2A_Normal_MenuStart()
	if a2a_manual_spawn_stacking == false and A2A_Norm_Spawn ~= nil and A2A_Norm_Spawn:IsAlive() then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_normal_menu_start()
end
end

function A2A_Hard_MenuStart()
	if a2a_manual_spawn_stacking == false and A2A_Hard_Spawn ~= nil and A2A_Hard_Spawn:IsAlive() then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_hard_menu_start()
end
end

function A2A_Ace_MenuStart()
		if a2a_manual_spawn_stacking == false and a2a_ace_started ~= true then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_ace_menu_start()
end
end

function A2A_ALL_MenuStart()
	if a2a_manual_spawn_stacking == false and A2A_All_Spawn ~= nil and A2A_All_Spawn:IsAlive() then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_random_menu_start()
end
end

--bombing add
function A2A_BOMBING_MenuStart()
	if a2a_manual_spawn_stacking == false and A2A_BOMBING_1 ~= nil and A2A_BOMBING_1:IsAlive() then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_intercept_menu_start()
end
end

--helo add
function A2A_HELO_MenuStart()
	if a2a_manual_spawn_stacking == false and A2A_Helo_Spawn ~= nil and A2A_Helo_Spawn:IsAlive() then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_helo_menu_start()
end
end

function A2A_AutoStartON()
	if a2a_autospawn_enable == false then
		a2a_autospawn_enable = true
		trigger.action.outText( "A2A Auto-Spawns ENABLED", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
		if a2a_constant_spawned == false then
			main_constant_a2a()
		end
	else
		trigger.action.outText( "A2A Auto-Spawns already enabled!", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	end
end

function A2A_AutoStartOFF()
	if a2a_autospawn_enable == true then
		a2a_autospawn_enable = false
		trigger.action.outText( "A2A Auto-Spawns DISABLED", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
	else
		trigger.action.outText( "A2A Auto-Spawns already disabled!", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	end
end

a2g_mission_spawn_lock = true
timer.scheduleFunction(function()
tti.debug("Setting A2G Mission Menu Spawn Lock: " .. tostring(a2g_mission_spawn_lock), false)
end, nil, timer.getTime() + 5  )


timer.scheduleFunction(function()
a2g_mission_spawn_lock = false
tti.debug("Setting A2G Mission Menu Spawn Lock: " .. tostring(a2g_mission_spawn_lock), false)
end, nil, timer.getTime() + 125  )

-- A2G
function A2G_HARD_MenuStart(args)
local MissionNumSelect = args[1]
if a2g_mission_spawn_lock == false then
	if trigger.misc.getUserFlag("AG-STARTING") == 0 then
	a2g_hard_initialize_spawn(MissionNumSelect)
	else
	a2gj_text_fail()
	end
else
A2G_Mission_Started_Too_Early()
end
end

-- A2G
function A2G_SEAD_MenuStart(args)
local MissionNumSelect = args[1]
if a2g_mission_spawn_lock == false then
	if trigger.misc.getUserFlag("SEAD-STARTING") == 0 then
	a2g_sead_initialize_spawn(MissionNumSelect)
	else
	a2gsead_text_fail()
	end
else
A2G_Mission_Started_Too_Early()
end
end

function A2G_MR_MenuStart(args)
local MissionNumSelect = args[1]
if a2g_mission_spawn_lock == false then
	if trigger.misc.getUserFlag("MR-STARTING") == 0 then
	 a2g_easy_initialize_spawn(MissionNumSelect)
	else
	mr_text_fail()
end
else
A2G_Mission_Started_Too_Early()
end
end

function A2G_Helo_MenuStart(args)
local MissionNumSelect = args[1]
if a2g_mission_spawn_lock == false then
	if trigger.misc.getUserFlag("AGH-STARTING") == 0 then
	a2g_helo_initialize_spawn(MissionNumSelect)
	else
	a2gh_text_fail()
end
else
A2G_Mission_Started_Too_Early()
end
end

function A2G_Helo_IA_MenuStart(args)
local MissionNumSelect = args[1]
if a2g_mission_spawn_lock == false then
if trigger.misc.getUserFlag("AGHIA-STARTING") == 0 then
	a2g_infas_initialize_spawn(MissionNumSelect)
	else
	a2gia_text_fail()
end
else
A2G_Mission_Started_Too_Early()
end
end

function A2G_Convoy_MenuStart(args)
local MissionNumSelect = args[1]
if a2g_mission_spawn_lock == false then
if trigger.misc.getUserFlag("CONVOY-STARTING") == 0 then
	a2g_convoy_initialize_spawn(MissionNumSelect)
	else
	a2g_convoy_text_fail()
end
else
A2G_Mission_Started_Too_Early()
end
end

function A2G_Mission_Started_Too_Early()
trigger.action.outText( "<< Auto-start Ground Missions are still initializing! >>\n\nPlease wait another minute or so before attempting to manually spawn-in a ground mission.\n", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end

function A2G_AS_MenuStart(args)
local MissionNumSelect = args[1]
if trigger.misc.getUserFlag("AS-STARTING") == 0 then
	a2g_as_initialize_spawn(MissionNumSelect)
	else
	a2gas_text_fail()
end
end

function A2G_AS_CONV_MenuStart()
if trigger.misc.getUserFlag("SHIP-CONVOY-STARTING") == 0 then
	a2g_ship_convoy_initialize_spawn()
	else
	a2g_ship_convoy_text_fail()
end
end

function LOCATION_INTEL(args)
	local groupId = args[1]
	local missionTypeForIntel = args[2]
	local displayIntelTime = args[3]
	main_intel(groupId, missionTypeForIntel, displayIntelTime)
end

function JTAC_TARGET_INTEL(args)
	local groupId = args[1]
	local jtacStatusDisplayTime = args[2]
	getJTACStatus(groupId,jtacStatusDisplayTime)
end

function SMOKE_INTEL()
	deployActiveMissionZoneSmokeFlare()
end

function CONVOY_GROUND_FLARE_INTEL()
	deployActiveGroundConvoyFlares()
end

function CONVOY_SHIP_FLARE_INTEL()
	deployActiveShipConvoyFlares()
end

function AWACS_RESET()
	reset_awacs()
end

function TANKERS_RESET()
	reset_tankers()
end

function TANKERS_FORCESPAWN_BOOM_FAST()
	forceSpawnTankerBoomFast()
end

function TANKERS_FORCESPAWN_BOOM_SLOW()
	forceSpawnTankerBoomSlow()
end

function TANKERS_FORCESPAWN_BASKET()
	forceSpawnTankerBasket()
end



function END_MISSION()
	trigger.action.setUserFlag (667, true )
end

function destroyRedFighters()
local groupName = nil
local units = nil
local unit = nil
local redFighterGroups = coalition.getGroups(1, Group.Category.AIRPLANE)
local redGroupDestroyedWorked = false

for i = 1, #redFighterGroups do
    if redFighterGroups[i] ~= nil then
        groupName = redFighterGroups[i]:getName()
		units = getGroup(groupName)
		--unit = Group.getByName(groupName):getUnit(i)
		if not string.find(groupName, "RAT_") and Group.getByName(groupName):getUnit(i) then
			trigger.action.outText("Destroying Red Fighter Group: " .. groupName, 10)
			tti.debug("Destroying Red Fighter Group: " .. groupName)
			Group.getByName(groupName):destroy()
			redGroupDestroyedWorked = true
		end    
	end
end

if redGroupDestroyedWorked == true then
	tti.debug("Red fighter groups were destroyed via debug, attempting to start another A2A constant...")
	--restarts constat a2a if a2a autospawn enabled, and when using a force remove
	-- other aircraft will be removved but those are on manual spawns on timers.
	timer.scheduleFunction(function()
		a2a_constant_start()
	end, nil, timer.getTime() + 60  )
end

end

function a2a_fighter_autospawn_enable_menuSetting(setting_bool)

a2a_autospawn_enable = setting_bool
trigger.action.outText("Enemy A2A Fighters Auto-Spawn set to: [" .. string.upper(tostring(a2a_autospawn_enable)) .. "]", 10)

end

function a2a_bomber_autospawn_enable_menuSetting(setting_bool)

a2a_intercept_autospawn_enable = setting_bool
trigger.action.outText("Enemy A2A Bombers (Intercept Mission) Auto-Spawn set to: [" .. string.upper(tostring(a2a_intercept_autospawn_enable)) .. "]", 10)

end

function a2a_helo_autospawn_enable_menuSetting(setting_bool)

a2a_helo_autospawn_enable = setting_bool
trigger.action.outText("Enemy A2A Helos Auto-Spawn set to: [" .. string.upper(tostring(a2a_helo_autospawn_enable)) .. "]", 10)

end

function a2a_blue_cap_backup_enable_menuSetting(setting_bool)

enable_blue_cap_backup = setting_bool
trigger.action.outText("Friendly CAP Backup Auto-Spawn set to: [" .. string.upper(tostring(enable_blue_cap_backup)) .. "]", 10)

end


---ground missions
function a2g_easy_autospawn_enable_menuSetting(setting_bool)

if setting_bool == true then
a2g_easy_autostart = true
else
a2g_easy_autostart = false
end

trigger.action.outText("A2G Easy Mission Auto-Spawn set to: [" .. string.upper(tostring(a2g_easy_autostart)) .. "]", 10)
end

function a2g_hard_autospawn_enable_menuSetting(setting_bool)

if setting_bool == true then
a2g_hard_autostart = true
else
a2g_hard_autostart = false
end

trigger.action.outText("A2G Hard Mission Auto-Spawn set to: [" .. string.upper(tostring(a2g_hard_autostart)) .. "]", 10)
end

function a2g_sead_autospawn_enable_menuSetting(setting_bool)
if setting_bool == true then
a2g_sead_autostart = true
else
a2g_sead_autostart = false
end

trigger.action.outText("A2G SEAD Mission Auto-Spawn set to: [" .. string.upper(tostring(a2g_sead_autostart)) .. "]", 10)
end

function a2g_helo_autospawn_enable_menuSetting(setting_bool)

if setting_bool == true then
a2g_helo_autostart = true
else
a2g_helo_autostart = false
end

trigger.action.outText("A2G Helo Mission Auto-Spawn set to: [" .. string.upper(tostring(a2g_helo_autostart)) .. "]", 10)
end

function a2g_inf_autospawn_enable_menuSetting(setting_bool)

if setting_bool == true then
a2g_helo_inf_autostart = true
else
a2g_helo_inf_autostart = false
end

trigger.action.outText("A2G Infantry Mission Auto-Spawn set to: [" .. string.upper(tostring(a2g_helo_inf_autostart)) .. "]", 10)
end

function antiship_autospawn_enable_menuSetting(setting_bool)

if setting_bool == true then
antiship_autostart = true
else
antiship_autostart = false
end

trigger.action.outText("Anti-Ship Mission Auto-Spawn set to: [" .. string.upper(tostring(antiship_autostart)) .. "]", 10)
end

function showTtiMissionSettingMenuStatus()
--local ttiStatusInitMessage = "TTI Script and Settings Initialization Status:\n"
local ttiMissionSettingsStatusMessage = ""

ttiMissionSettingsStatusMessage = ttiMissionSettingsStatusMessage ..

--"TTI Scripts and Settings Loaded Successfully: ...  " .. string.upper(tostring(script_files_loaded_successfully)) ..
"Current TTI Air/Ground Mission Settings:" ..
"\n" ..
"\nCurrent Air Mission Settings:" ..
"\n" ..
"\nEnemy A2A Auto-Spawn Fighters Enabled: ... " .. string.upper(tostring(a2a_autospawn_enable))..
"\nEnemy A2A Auto-Spawn Bombers Enabled: ... " .. string.upper(tostring(a2a_intercept_autospawn_enable))..
"\nEnemy A2A Auto-Spawn Helos Enabled: ... " .. string.upper(tostring(a2a_helo_autospawn_enable))..
"\n" ..
"\nCurrent Ground Mission Settings:" ..
"\n(Auto-Spawn Ground Mission settings only available when Single Mission Mode is DISABLED)" ..
"\n" ..
"\nRequire Accept First Auto-Spawn Ground Mission Through F10 Other Menu: ... " .. string.upper(tostring(requireAcceptFirstAutoStartMission))..
"\nRequire Accept Auto-Spawn Next Ground Mission Through F10 Other Menu: ... " .. string.upper(tostring(enableAcceptNextMissionMenu))..
"\nEnemy A2G Easy Auto-Spawn Enabled: ... " .. string.upper(tostring(a2g_easy_autostart))..
"\nEnemy A2G Hard Auto-Spawn Enabled: ... " .. string.upper(tostring(a2g_hard_autostart))..
"\nEnemy A2G SEAD Auto-Spawn Enabled: ... " .. string.upper(tostring(a2g_sead_autostart))..
"\nEnemy A2G Helo Auto-Spawn Enabled: ... " .. string.upper(tostring(a2g_helo_autostart))..
"\nEnemy A2G Infantry Auto-Spawn Enabled: ... " .. string.upper(tostring(a2g_helo_inf_autostart))..
"\nEnemy Anti-Ship Auto-Spawn Enabled: ... " .. string.upper(tostring(antiship_autostart))..
"\n"

trigger.action.outText(ttiMissionSettingsStatusMessage, 40)

tti.debug(ttiMissionSettingsStatusMessage)
end

--function AIRFIELDBACKUP1(vec3, groupPlayerName)
function WINGMANBACKUP1(args)
	local clientName = args[1]
	local groupPlayerName = args[2]
	local groupId = args[3]
	--local vec3 = GROUP:FindByName(clientName):GetPointVec3()
	--tti.debug(groupPlayerName .. " requesting the following: \nVec 3 X is: " .. vec3.x .. "\nVec 3 Y is: " .. vec3.y .. "\nVec 3 Z is: " .. vec3.z)
	
	local coord = {}

	local playerUnit = coalition.getPlayers(coalition.side.BLUE)[1]  
	if playerUnit then -- Check if a player was found
		local vec3 = playerUnit:getPosition().p
		coord = COORDINATE:NewFromVec3(vec3)
	end
	
	a2a_backup_wingman_1_start(clientName, groupPlayerName, groupId, coord)
end

function AIRFIELDBACKUP1(args)
	local clientName = args[1]
	local groupPlayerName = args[2]
	local toPlayer = args[3]
	--local vec3 = GROUP:FindByName(clientName):GetPointVec3()
	--tti.debug(groupPlayerName .. " requesting the following: \nVec 3 X is: " .. vec3.x .. "\nVec 3 Y is: " .. vec3.y .. "\nVec 3 Z is: " .. vec3.z)
	
	local coord = {}
	
	local playerUnit = coalition.getPlayers(coalition.side.BLUE)[1]  
	if playerUnit then -- Check if a player was found
		local vec3 = playerUnit:getPosition().p
		coord = COORDINATE:NewFromVec3(vec3)
	end
	
	
	a2a_backup_1_start(coord, groupPlayerName, toPlayer)
end

function CVBACKUP1(args)
	local clientName = args[1]
	local groupPlayerName = args[2]
	local toPlayer = args[3]
	--local vec3 = GROUP:FindByName(clientName):GetPointVec3()
	--tti.debug(groupPlayerName .. " requesting the following: \nVec 3 X is: " .. vec3.x .. "\nVec 3 Y is: " .. vec3.y .. "\nVec 3 Z is: " .. vec3.z)
	--local coord = COORDINATE:NewFromVec3(vec3)
	local coord = {}
	
	local playerUnit = coalition.getPlayers(coalition.side.BLUE)[1]  
	if playerUnit then -- Check if a player was found
		local vec3 = playerUnit:getPosition().p
		coord = COORDINATE:NewFromVec3(vec3)
	end
	a2a_backup_cv_1_start(coord, groupPlayerName, toPlayer)
end

function CVBACKUP2(args)
	local clientName = args[1]
	local groupPlayerName = args[2]
	local toPlayer = args[3]
	--local vec3 = GROUP:FindByName(clientName):GetPointVec3()
	--tti.debug(groupPlayerName .. " requesting the following: \nVec 3 X is: " .. vec3.x .. "\nVec 3 Y is: " .. vec3.y .. "\nVec 3 Z is: " .. vec3.z)
	--local coord = COORDINATE:NewFromVec3(vec3)
	
	local coord = {}
	
	local playerUnit = coalition.getPlayers(coalition.side.BLUE)[1]  
	if playerUnit then -- Check if a player was found
		local vec3 = playerUnit:getPosition().p
		coord = COORDINATE:NewFromVec3(vec3)
	end
	a2a_backup_cv_kuz_1_start(coord, groupPlayerName, toPlayer)
end

--[[
function A2A_BOMBING_MenuStart_TEST()
	if a2a_manual_spawn_stacking == false and A2A_BOMBING_1 ~= nil and A2A_BOMBING_1:IsAlive() then
		trigger.action.outText( "<< There is already an A2A mission of this type currently active. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	else
	a2a_intercept_menu_start()
end
end

function Menu_Item_Text_PopUp_1(args)
local groupID = args[1]
local bool = args[2]
trigger.action.outTextForGroup(groupID, "Hello! Menu Item Text PopUp 1 is: " .. tostring(bool), 10 )
end

function Test_Vec3_Text(args)
local groupID = args[1]
local clientName = args[2]
local clientPlayerName = args[3]
local vec3 = GROUP:FindByName(clientName):GetPointVec3()

trigger.action.outTextForGroup(groupID, clientPlayerName .. " is requesting the following: \nVec 3 X is: " .. vec3.x .. "\nVec 3 Y is: " .. vec3.y .. "\nVec 3 Z is: " .. vec3.z, 20)
-- local coord = COORDINATE:NewFromVec3(vec3), 10 )
end
--]]

function TTI_Menus.setupClients()
timer.scheduleFunction(TTI_Menus.setupClients, {}, timer.getTime() + 30)

    local TTI_bluePlayerClients = SET_CLIENT:New():FilterCoalitions(TTI_Menus.blueCoalition):FilterActive(true):FilterOnce()
    TTI_bluePlayerClients:ForEachClient(
            function(client)
                local playerGroupId = client:GetClientGroupID()
                if TTI_Menus.radioMenusAdded[playerGroupId] == nil then
                    TTI_Menus.setupClientsHelper(playerGroupId, client, TTI_Menus.blueCoalition)
                end
				
				local clientName = TTI_Menus.playerData[playerGroupId]["clientName"]
				local clientUserName = client:GetPlayerName()
				local clientPreferences = TTI_Menus.playerData[playerGroupId]
				local clientUnit = UNIT:FindByName(clientName)
				local clientTypeName = clientUnit:GetTypeName()		
            end	
    )
    -- local redPlayerClients = SET_CLIENT:New():FilterCoalitions(TTI_Menus.redCoalition):FilterActive(true):FilterOnce()
    -- redPlayerClients:ForEachClient(
            -- function(client)
                -- local playerGroupId = client:GetClientGroupID()
                -- if TTI_Menus.radioMenusAdded[playerGroupId] == nil then
                    -- TTI_Menus.setupClientsHelper(playerGroupId, client, TTI_Menus.redCoalition)
                -- end
            -- end
    -- )
	
	env.info(string.format("TTI Menus SetupClients client setup for group %s %s", playerGroupId, client:GetName()))
	
end

function TTI_Menus.setupClientsHelper(playerGroupId, client, playerCoalition)

        env.info(string.format("TTI Menus setupClientsHelper client setup for group %s %s", playerGroupId, client:GetName()))
    
    TTI_Menus.playerData[playerGroupId] = {
        groupID = playerGroupId,
        clientName = client:GetName(),
        --clientGroup = GROUP:FindByName(clientName),
        groupPlayerName = client:GetPlayerName(),
        --groupVec3 = clientGroup:GetPointVec3(),
        playerCoalition = playerCoalition,
		clientUnit = UNIT:FindByName(clientName),
    }


---MENUS
--[[
    local MenuRoot = missionCommands.addSubMenuForGroup(playerGroupId, client:GetPlayerName() .. "'s Test Dedicated Server Menu")
    missionCommands.addCommandForGroup(playerGroupId, "Menu Item 1", MenuRoot, Menu_Item_Text_PopUp_1, {playerGroupId, true})
    missionCommands.addCommandForGroup(playerGroupId, "Test VEC3", MenuRoot, Test_Vec3_Text, {playerGroupId, client:GetName(), client:GetPlayerName()})
    missionCommands.addCommandForGroup(playerGroupId, "A2A Intercept Start", MenuRoot, A2A_BOMBING_MenuStart_TEST, {playerGroupId})
--]]

local mainMenuSpawning = missionCommands.addSubMenuForGroup(playerGroupId, "MISSION SPAWNING MENU")
local mainMenuIntel = missionCommands.addSubMenuForGroup(playerGroupId, "MISSION LOCATION INTEL MENU")

if allow_debug_menu == true then
	debugmenu = missionCommands.addSubMenuForGroup(playerGroupId,"DEBUG MENU")
	if mission_era == "modern" or mission_era == "cold_war" then
		missionCommands.addCommandForGroup(playerGroupId, "[[ Reset AWACS ]]", debugmenu, AWACS_RESET,{playerGroupId})
		missionCommands.addCommandForGroup(playerGroupId, "[[ Reset Tankers ]]", debugmenu, TANKERS_RESET,{playerGroupId})
		missionCommands.addCommandForGroup(playerGroupId, "[[ Force Spawn Tanker Boom (Fast) ]]", debugmenu, TANKERS_FORCESPAWN_BOOM_FAST,{playerGroupId})
		missionCommands.addCommandForGroup(playerGroupId, "[[ Force Spawn Tanker Boom (Slow) ]]", debugmenu, TANKERS_FORCESPAWN_BOOM_SLOW,{playerGroupId})
		missionCommands.addCommandForGroup(playerGroupId, "[[ Force Spawn Tanker Basket ]]", debugmenu, TANKERS_FORCESPAWN_BASKET,{playerGroupId})
	end
	missionCommands.addCommandForGroup(playerGroupId, "[[ Remove all Enemy A2A ]]", debugmenu, destroyRedFighters,{})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Remove/Stop Red RAT Planes ]]",debugmenu,destroyRedRatPlanes,{false})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Remove/Stop Blue RAT Planes ]]",debugmenu,destroyBlueRatPlanes,{false})
	missionCommands.addCommandForGroup(playerGroupId, "[[ End Mission ]]", debugmenu, END_MISSION,{playerGroupId})
	
	removeGroundMissionsDebugRoot = missionCommands.addSubMenuForGroup(playerGroupId,"[ FORCE REMOVE Ground Missions Menu ]", debugmenu, {})
	missionCommands.addCommandForGroup(playerGroupId, "[ Remove A2G Easy ]",removeGroundMissionsDebugRoot,force_remove_mr,{})
	missionCommands.addCommandForGroup(playerGroupId, "[ Remove A2G Hard ]",removeGroundMissionsDebugRoot,force_remove_ag,{})
	missionCommands.addCommandForGroup(playerGroupId, "[ Remove A2G Helo ]",removeGroundMissionsDebugRoot,force_remove_helo,{})
	missionCommands.addCommandForGroup(playerGroupId, "[ Remove A2G Infantry As. ]",removeGroundMissionsDebugRoot,force_remove_inf,{})
	missionCommands.addCommandForGroup(playerGroupId, "[ Remove A2G Anti-Ship ]",removeGroundMissionsDebugRoot,force_remove_as,{})
	missionCommands.addCommandForGroup(playerGroupId, "[ Remove A2G SEAD ]",removeGroundMissionsDebugRoot,force_remove_sead,{})
	
end

--intelMainMenu = missionCommands.addSubMenuForGroup(playerGroupId, "Mission Location & Intel Menu/Tools", mainMenu)

local activeGroundMissionIntelMenu = missionCommands.addSubMenuForGroup(playerGroupId, "[Ground Mission Location Intel]", mainMenuIntel)

--missionCommands.addCommandForGroup(playerGroupId, "[Active JTAC/AFAC Target Reports]", mainMenuIntel, getJTACStatus, playerGroupId)
local activeJtacTargetsIntelMenu = missionCommands.addSubMenuForGroup(playerGroupId, "[Show JTAC/AFAC Target Reports]", mainMenuIntel)
missionCommands.addCommandForGroup(playerGroupId, "Display 30 Seconds", activeJtacTargetsIntelMenu, JTAC_TARGET_INTEL,{playerGroupId, 30})
missionCommands.addCommandForGroup(playerGroupId, "Display 60 Seconds", activeJtacTargetsIntelMenu, JTAC_TARGET_INTEL,{playerGroupId, 60})
missionCommands.addCommandForGroup(playerGroupId, "Display 90 Seconds", activeJtacTargetsIntelMenu, JTAC_TARGET_INTEL,{playerGroupId, 90})
missionCommands.addCommandForGroup(playerGroupId, "Display 2 Minutes", activeJtacTargetsIntelMenu, JTAC_TARGET_INTEL,{playerGroupId, 120})
missionCommands.addCommandForGroup(playerGroupId, "Display 3 Minutes", activeJtacTargetsIntelMenu, JTAC_TARGET_INTEL,{playerGroupId, 180})
missionCommands.addCommandForGroup(playerGroupId, "Display 4 Minutes", activeJtacTargetsIntelMenu, JTAC_TARGET_INTEL,{playerGroupId, 240})


missionCommands.addCommandForGroup(playerGroupId, "[Smoke Active Ground Mission Zones]", mainMenuIntel, SMOKE_INTEL,{playerGroupId})
missionCommands.addCommandForGroup(playerGroupId, "[Flare Ground Convoy Position]", mainMenuIntel, CONVOY_GROUND_FLARE_INTEL,{playerGroupId})

if carrierOpsTheatre == true then
missionCommands.addCommandForGroup(playerGroupId, "[Flare Ship Convoy Position]", mainMenuIntel, CONVOY_SHIP_FLARE_INTEL,{playerGroupId})
end

local activeAllGroundMissionsIntelMenu = missionCommands.addSubMenuForGroup(playerGroupId, "Intel for ALL Ground Missions", activeGroundMissionIntelMenu)
missionCommands.addCommandForGroup(playerGroupId, "Display 30 Seconds", activeAllGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "all", 30})
missionCommands.addCommandForGroup(playerGroupId, "Display 60 Seconds", activeAllGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "all", 60})
missionCommands.addCommandForGroup(playerGroupId, "Display 90 Seconds", activeAllGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "all", 90})
missionCommands.addCommandForGroup(playerGroupId, "Display 2 Minutes", activeAllGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "all", 120})
missionCommands.addCommandForGroup(playerGroupId, "Display 3 Minutes", activeAllGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "all", 180})
missionCommands.addCommandForGroup(playerGroupId, "Display 4 Minutes", activeAllGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "all", 240})

local activeEasyGroundMissionsIntelMenu =  missionCommands.addSubMenuForGroup(playerGroupId, "Intel for A2G Easy Missions", activeGroundMissionIntelMenu)
missionCommands.addCommandForGroup(playerGroupId, "Display 30 Seconds", activeEasyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "mr", 30})
missionCommands.addCommandForGroup(playerGroupId, "Display 60 Seconds", activeEasyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "mr", 60})
missionCommands.addCommandForGroup(playerGroupId, "Display 90 Seconds", activeEasyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "mr", 90})
missionCommands.addCommandForGroup(playerGroupId, "Display 2 Minutes", activeEasyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "mr", 120})
missionCommands.addCommandForGroup(playerGroupId, "Display 3 Minutes", activeEasyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "mr", 180})
missionCommands.addCommandForGroup(playerGroupId, "Display 4 Minutes", activeEasyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "mr", 240})

local activeHardGroundMissionsIntelMenu =  missionCommands.addSubMenuForGroup(playerGroupId, "Intel for A2G Hard Missions", activeGroundMissionIntelMenu)
missionCommands.addCommandForGroup(playerGroupId, "Display 30 Seconds", activeHardGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "ag", 30})
missionCommands.addCommandForGroup(playerGroupId, "Display 60 Seconds", activeHardGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "ag", 60})
missionCommands.addCommandForGroup(playerGroupId, "Display 90 Seconds", activeHardGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "ag", 90})
missionCommands.addCommandForGroup(playerGroupId, "Display 2 Minutes", activeHardGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "ag", 120})
missionCommands.addCommandForGroup(playerGroupId, "Display 3 Minutes", activeHardGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "ag", 180})
missionCommands.addCommandForGroup(playerGroupId, "Display 4 Minutes", activeHardGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "ag", 240})

if mission_era == "modern" or mission_era == "cold_war" then
local activeSeadGroundMissionsIntelMenu =  missionCommands.addSubMenuForGroup(playerGroupId, "Intel for A2G SEAD Missions", activeGroundMissionIntelMenu)
missionCommands.addCommandForGroup(playerGroupId, "Display 30 Seconds", activeSeadGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "sead", 30})
missionCommands.addCommandForGroup(playerGroupId, "Display 60 Seconds", activeSeadGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "sead", 60})
missionCommands.addCommandForGroup(playerGroupId, "Display 90 Seconds", activeSeadGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "sead", 90})
missionCommands.addCommandForGroup(playerGroupId, "Display 2 Minutes", activeSeadGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "sead", 120})
missionCommands.addCommandForGroup(playerGroupId, "Display 3 Minutes", activeSeadGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "sead", 180})
missionCommands.addCommandForGroup(playerGroupId, "Display 4 Minutes", activeSeadGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "sead", 240})
end

local activeHeloGroundMissionsIntelMenu =  missionCommands.addSubMenuForGroup(playerGroupId, "Intel for A2G Helo Missions", activeGroundMissionIntelMenu)
missionCommands.addCommandForGroup(playerGroupId, "Display 30 Seconds", activeHeloGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "agh", 30})
missionCommands.addCommandForGroup(playerGroupId, "Display 60 Seconds", activeHeloGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "agh", 60})
missionCommands.addCommandForGroup(playerGroupId, "Display 90 Seconds", activeHeloGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "agh", 90})
missionCommands.addCommandForGroup(playerGroupId, "Display 2 Minutes", activeHeloGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "agh", 120})
missionCommands.addCommandForGroup(playerGroupId, "Display 3 Minutes", activeHeloGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "agh", 180})
missionCommands.addCommandForGroup(playerGroupId, "Display 4 Minutes", activeHeloGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "agh", 240})

local activeInfantryGroundMissionsIntelMenu =  missionCommands.addSubMenuForGroup(playerGroupId, "Intel for A2G Infantry Missions", activeGroundMissionIntelMenu)
missionCommands.addCommandForGroup(playerGroupId, "Display 30 Seconds", activeInfantryGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "infas", 30})
missionCommands.addCommandForGroup(playerGroupId, "Display 60 Seconds", activeInfantryGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "infas", 60})
missionCommands.addCommandForGroup(playerGroupId, "Display 90 Seconds", activeInfantryGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "infas", 90})
missionCommands.addCommandForGroup(playerGroupId, "Display 2 Minutes", activeInfantryGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "infas", 120})
missionCommands.addCommandForGroup(playerGroupId, "Display 3 Minutes", activeInfantryGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "infas", 180})
missionCommands.addCommandForGroup(playerGroupId, "Display 4 Minutes", activeInfantryGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "infas", 240})

local activeAntiShipGroundMissionsIntelMenu =  missionCommands.addSubMenuForGroup(playerGroupId, "Intel for Anti-Ship Missions", activeGroundMissionIntelMenu)
missionCommands.addCommandForGroup(playerGroupId, "Display 30 Seconds", activeAntiShipGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "ass", 30})
missionCommands.addCommandForGroup(playerGroupId, "Display 60 Seconds", activeAntiShipGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "ass", 60})
missionCommands.addCommandForGroup(playerGroupId, "Display 90 Seconds", activeAntiShipGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "ass", 90})
missionCommands.addCommandForGroup(playerGroupId, "Display 2 Minutes", activeAntiShipGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "ass", 120})
missionCommands.addCommandForGroup(playerGroupId, "Display 3 Minutes", activeAntiShipGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "ass", 180})
missionCommands.addCommandForGroup(playerGroupId, "Display 4 Minutes", activeAntiShipGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "ass", 240})

local activeShipConvoyGroundMissionsIntelMenu =  missionCommands.addSubMenuForGroup(playerGroupId, "Intel for Ship Convoy Missions", activeGroundMissionIntelMenu)
missionCommands.addCommandForGroup(playerGroupId, "Display 30 Seconds", activeShipConvoyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "shipconvoy", 30})
missionCommands.addCommandForGroup(playerGroupId, "Display 60 Seconds", activeShipConvoyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "shipconvoy", 60})
missionCommands.addCommandForGroup(playerGroupId, "Display 90 Seconds", activeShipConvoyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "shipconvoy", 90})
missionCommands.addCommandForGroup(playerGroupId, "Display 2 Minutes", activeShipConvoyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "shipconvoy", 120})
missionCommands.addCommandForGroup(playerGroupId, "Display 3 Minutes", activeShipConvoyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "shipconvoy", 180})
missionCommands.addCommandForGroup(playerGroupId, "Display 4 Minutes", activeShipConvoyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "shipconvoy", 240})

local activeConvoyGroundMissionsIntelMenu =  missionCommands.addSubMenuForGroup(playerGroupId, "Intel for Ground Convoy Missions", activeGroundMissionIntelMenu)
missionCommands.addCommandForGroup(playerGroupId, "Display 30 Seconds", activeConvoyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "convoy", 30})
missionCommands.addCommandForGroup(playerGroupId, "Display 60 Seconds", activeConvoyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "convoy", 60})
missionCommands.addCommandForGroup(playerGroupId, "Display 90 Seconds", activeConvoyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "convoy", 90})
missionCommands.addCommandForGroup(playerGroupId, "Display 2 Minutes", activeConvoyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "convoy", 120})
missionCommands.addCommandForGroup(playerGroupId, "Display 3 Minutes", activeConvoyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "convoy", 180})
missionCommands.addCommandForGroup(playerGroupId, "Display 4 Minutes", activeConvoyGroundMissionsIntelMenu, LOCATION_INTEL,{playerGroupId, "convoy", 240})


if singleRandomMissionModeEnabled ~= true then
	local a2gMenu = missionCommands.addSubMenuForGroup(playerGroupId,"Air-to-Ground Missions", mainMenuSpawning)
	
	local a2gEasyMenu = missionCommands.addSubMenuForGroup(playerGroupId, "[[ A2G Easy Mission ]]", a2gMenu)
	missionCommands.addCommandForGroup(playerGroupId, "[[ A2G Easy Mission - Random ]]", a2gEasyMenu,A2G_MR_MenuStart,{})
	local a2gEasyMenuSelect = missionCommands.addSubMenuForGroup(playerGroupId, "[[ A2G Easy Mission - Select Mission No. ]]", a2gEasyMenu)
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 1 ]]", a2gEasyMenuSelect,A2G_MR_MenuStart,{1})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 2 ]]", a2gEasyMenuSelect,A2G_MR_MenuStart,{2})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 3 ]]", a2gEasyMenuSelect,A2G_MR_MenuStart,{3})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 4 ]]", a2gEasyMenuSelect,A2G_MR_MenuStart,{4})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 5 ]]", a2gEasyMenuSelect,A2G_MR_MenuStart,{5})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 6 ]]", a2gEasyMenuSelect,A2G_MR_MenuStart,{6})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 7 ]]", a2gEasyMenuSelect,A2G_MR_MenuStart,{7})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 8 ]]", a2gEasyMenuSelect,A2G_MR_MenuStart,{8})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 9 ]]", a2gEasyMenuSelect,A2G_MR_MenuStart,{9})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 10 ]]", a2gEasyMenuSelect,A2G_MR_MenuStart,{10})
	
	local a2gHardMenu = missionCommands.addSubMenuForGroup(playerGroupId, "[[ A2G Hard Mission ]]", a2gMenu)
	missionCommands.addCommandForGroup(playerGroupId, "[[ A2G Hard Mission - Random ]]", a2gHardMenu,A2G_HARD_MenuStart,{})
	local a2gHardMenuSelect = missionCommands.addSubMenuForGroup(playerGroupId, "[[ A2G Hard Mission - Select Mission No. ]]", a2gHardMenu)
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 1 ]]", a2gHardMenuSelect,A2G_HARD_MenuStart,{1})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 2 ]]", a2gHardMenuSelect,A2G_HARD_MenuStart,{2})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 3 ]]", a2gHardMenuSelect,A2G_HARD_MenuStart,{3})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 4 ]]", a2gHardMenuSelect,A2G_HARD_MenuStart,{4})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 5 ]]", a2gHardMenuSelect,A2G_HARD_MenuStart,{5})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 6 ]]", a2gHardMenuSelect,A2G_HARD_MenuStart,{6})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 7 ]]", a2gHardMenuSelect,A2G_HARD_MenuStart,{7})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 8 ]]", a2gHardMenuSelect,A2G_HARD_MenuStart,{8})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 9 ]]", a2gHardMenuSelect,A2G_HARD_MenuStart,{9})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 10 ]]", a2gHardMenuSelect,A2G_HARD_MenuStart,{10})

if mission_era == "modern" or mission_era == "cold_war" then
	local a2gSeadMenu = missionCommands.addSubMenuForGroup(playerGroupId, "[[ A2G SEAD Mission ]]", a2gMenu)
	missionCommands.addCommandForGroup(playerGroupId, "[[ A2G SEAD Mission - Random ]]", a2gSeadMenu,A2G_SEAD_MenuStart,{})
	local a2gSeadMenuSelect = missionCommands.addSubMenuForGroup(playerGroupId, "[[ A2G SEAD Mission - Select Mission No. ]]", a2gSeadMenu)
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 1 ]]", a2gSeadMenuSelect,A2G_SEAD_MenuStart,{1})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 2 ]]", a2gSeadMenuSelect,A2G_SEAD_MenuStart,{2})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 3 ]]", a2gSeadMenuSelect,A2G_SEAD_MenuStart,{3})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 4 ]]", a2gSeadMenuSelect,A2G_SEAD_MenuStart,{4})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 5 ]]", a2gSeadMenuSelect,A2G_SEAD_MenuStart,{5})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 6 ]]", a2gSeadMenuSelect,A2G_SEAD_MenuStart,{6})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 7 ]]", a2gSeadMenuSelect,A2G_SEAD_MenuStart,{7})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 8 ]]", a2gSeadMenuSelect,A2G_SEAD_MenuStart,{8})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 9 ]]", a2gSeadMenuSelect,A2G_SEAD_MenuStart,{9})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 10 ]]", a2gSeadMenuSelect,A2G_SEAD_MenuStart,{10})
	
	
end

	local a2gHeloMenu = missionCommands.addSubMenuForGroup(playerGroupId, "[[ A2G Helo Mission ]]", a2gMenu)
	missionCommands.addCommandForGroup(playerGroupId, "[[ A2G Helo Mission - Random ]]", a2gHeloMenu,A2G_Helo_MenuStart,{})
	local a2gHeloMenuSelect = missionCommands.addSubMenuForGroup(playerGroupId, "[[ A2G Helo Mission - Select Mission No. ]]", a2gHeloMenu)
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 1 ]]", a2gHeloMenuSelect,A2G_Helo_MenuStart,{1})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 2 ]]", a2gHeloMenuSelect,A2G_Helo_MenuStart,{2})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 3 ]]", a2gHeloMenuSelect,A2G_Helo_MenuStart,{3})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 4 ]]", a2gHeloMenuSelect,A2G_Helo_MenuStart,{4})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 5 ]]", a2gHeloMenuSelect,A2G_Helo_MenuStart,{5})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 6 ]]", a2gHeloMenuSelect,A2G_Helo_MenuStart,{6})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 7 ]]", a2gHeloMenuSelect,A2G_Helo_MenuStart,{7})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 8 ]]", a2gHeloMenuSelect,A2G_Helo_MenuStart,{8})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 9 ]]", a2gHeloMenuSelect,A2G_Helo_MenuStart,{9})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 10 ]]", a2gHeloMenuSelect,A2G_Helo_MenuStart,{10})
	
	local a2gInfMenu = missionCommands.addSubMenuForGroup(playerGroupId, "[[ A2G Infantry Assault Mission ]]", a2gMenu)
	missionCommands.addCommandForGroup(playerGroupId, "[[ A2G Infantry Assault Mission - Random ]]", a2gInfMenu,A2G_Helo_IA_MenuStart,{})
	local a2gInfMenuSelect = missionCommands.addSubMenuForGroup(playerGroupId, "[[ A2G Infantry Assault Mission - Select Mission No. ]]", a2gInfMenu)
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 1 ]]", a2gInfMenuSelect,A2G_Helo_IA_MenuStart,{1})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 2 ]]", a2gInfMenuSelect,A2G_Helo_IA_MenuStart,{2})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 3 ]]", a2gInfMenuSelect,A2G_Helo_IA_MenuStart,{3})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 4 ]]", a2gInfMenuSelect,A2G_Helo_IA_MenuStart,{4})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 5 ]]", a2gInfMenuSelect,A2G_Helo_IA_MenuStart,{5})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 6 ]]", a2gInfMenuSelect,A2G_Helo_IA_MenuStart,{6})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 7 ]]", a2gInfMenuSelect,A2G_Helo_IA_MenuStart,{7})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 8 ]]", a2gInfMenuSelect,A2G_Helo_IA_MenuStart,{8})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 9 ]]", a2gInfMenuSelect,A2G_Helo_IA_MenuStart,{9})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 10 ]]", a2gInfMenuSelect,A2G_Helo_IA_MenuStart,{10})
	
	local a2gConvMenu = missionCommands.addSubMenuForGroup(playerGroupId, "[[ A2G Convoy Hunt Mission ]]", a2gMenu)
	missionCommands.addCommandForGroup(playerGroupId, "[[ A2G Convoy Hunt Mission - Random ]]", a2gConvMenu,A2G_Convoy_MenuStart,{})
	local a2gConvMenuSelect = missionCommands.addSubMenuForGroup(playerGroupId, "[[ A2G Convoy Hunt Mission - Select Mission No. ]]", a2gConvMenu)
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 1 ]]", a2gConvMenuSelect,A2G_Convoy_MenuStart,{1})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 2 ]]", a2gConvMenuSelect,A2G_Convoy_MenuStart,{2})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 3 ]]", a2gConvMenuSelect,A2G_Convoy_MenuStart,{3})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 4 ]]", a2gConvMenuSelect,A2G_Convoy_MenuStart,{4})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 5 ]]", a2gConvMenuSelect,A2G_Convoy_MenuStart,{5})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 6 ]]", a2gConvMenuSelect,A2G_Convoy_MenuStart,{6})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 7 ]]", a2gConvMenuSelect,A2G_Convoy_MenuStart,{7})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 8 ]]", a2gConvMenuSelect,A2G_Convoy_MenuStart,{8})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 9 ]]", a2gConvMenuSelect,A2G_Convoy_MenuStart,{9})
	missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 10 ]]", a2gConvMenuSelect,A2G_Convoy_MenuStart,{10})
	
	if carrierOpsTheatre == true then
		local a2gShipMenu = missionCommands.addSubMenuForGroup(playerGroupId,"Anti-Ship Missions", mainMenuSpawning)
		
		--missionCommands.addCommandForGroup(playerGroupId, "[[ Anti-Ship Static Mission ]]", a2gShipMenu, A2G_AS_MenuStart,{playerGroupId})
		local a2gShipStaticMenu = missionCommands.addSubMenuForGroup(playerGroupId, "[[ Anti-Ship Static Mission ]]", a2gMenu)
		missionCommands.addCommandForGroup(playerGroupId, "[[ Anti-Ship Static Mission - Random ]]", a2gShipStaticMenu,A2G_AS_MenuStart,{})
		local a2gShipStaticMenuSelect = missionCommands.addSubMenuForGroup(playerGroupId, "[[ Anti-Ship Static Mission - Select Mission No. ]]", a2gShipStaticMenu)
		missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 1 ]]", a2gShipStaticMenuSelect,A2G_AS_MenuStart,{1})
		missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 2 ]]", a2gShipStaticMenuSelect,A2G_AS_MenuStart,{2})
		missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 3 ]]", a2gShipStaticMenuSelect,A2G_AS_MenuStart,{3})
		missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 4 ]]", a2gShipStaticMenuSelect,A2G_AS_MenuStart,{4})
		missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 5 ]]", a2gShipStaticMenuSelect,A2G_AS_MenuStart,{5})
		--missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 6 ]]", a2gShipMenuSelect,A2G_AS_MenuStart,{6})
		--missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 7 ]]", a2gShipMenuSelect,A2G_AS_MenuStart,{7})
		--missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 8 ]]", a2gShipMenuSelect,A2G_AS_MenuStart,{8})
		--missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 9 ]]", a2gShipMenuSelect,A2G_AS_MenuStart,{9})
		--missionCommands.addCommandForGroup(playerGroupId, "[[ Mission No. 10 ]]", a2gShipMenuSelect,A2G_AS_MenuStart,{10})
		
		
		
		missionCommands.addCommandForGroup(playerGroupId, "[[ Anti-Ship Convoy Mission ]]", a2gShipMenu, A2G_AS_CONV_MenuStart,{playerGroupId})
	end
	
end

local a2aMenu = missionCommands.addSubMenuForGroup(playerGroupId,"Air-to-Air Missions",mainMenuSpawning)
missionCommands.addCommandForGroup(playerGroupId, "[[ A2A Easy Mission ]]", a2aMenu, A2A_Easy_MenuStart,{playerGroupId})
missionCommands.addCommandForGroup(playerGroupId, "[[ A2A Normal Mission ]]", a2aMenu, A2A_Normal_MenuStart,{playerGroupId})
missionCommands.addCommandForGroup(playerGroupId, "[[ A2A Hard Mission ]]", a2aMenu, A2A_Hard_MenuStart,{playerGroupId})
missionCommands.addCommandForGroup(playerGroupId, "[[ A2A Enemy Elite Sqn Mission ]]", a2aMenu, A2A_Ace_MenuStart,{playerGroupId})
missionCommands.addCommandForGroup(playerGroupId, "[[ A2A Intercept Bomber Mission ]]", a2aMenu, A2A_BOMBING_MenuStart,{playerGroupId})
--helo add
missionCommands.addCommandForGroup(playerGroupId, "[[ A2A Helo Mission ]]", a2aMenu, A2A_HELO_MenuStart )
missionCommands.addCommandForGroup(playerGroupId, "[[ A2A Random Mission ]]", a2aMenu, A2A_ALL_MenuStart,{playerGroupId})
missionCommands.addCommandForGroup(playerGroupId, "[[ Set A2A Auto-Spawn On ]]", a2aMenu, A2A_AutoStartON,{playerGroupId})
missionCommands.addCommandForGroup(playerGroupId, "[[ Set A2A Auto-Spawn Off ]]", a2aMenu, A2A_AutoStartOFF,{playerGroupId})

if enable_blue_cap_backup == true then
a2abackupMenu = missionCommands.addSubMenuForGroup(playerGroupId,"Friendly Air Reinforcements", mainMenuSpawning)
--missionCommands.addCommandForGroup(playerGroupId, "[Request CAP Wingman Escort-Airfield]", a2abackupMenu, WINGMANBACKUP1,{client:GetName(), client:GetPlayerName(),playerGroupId})
a2abackupMenuAirfield = missionCommands.addSubMenuForGroup(playerGroupId,"[Request CAP Backup-Airfield]", a2abackupMenu)
missionCommands.addCommandForGroup(playerGroupId, "Scramble to: MY CURRENT POSITION", a2abackupMenuAirfield, AIRFIELDBACKUP1,{client:GetName(), client:GetPlayerName(), true})
missionCommands.addCommandForGroup(playerGroupId, "Scramble to: NORMAL CAP ROUTE", a2abackupMenuAirfield, AIRFIELDBACKUP1,{client:GetName(), client:GetPlayerName(), false})
	if mission_era == "modern" or mission_era == "cold_war" then
	if carrierOpsTheatre == true then
		--missionCommands.addCommandForGroup(playerGroupId, "[Request CAP Backup - US Carrier]", a2abackupMenu, CVBACKUP1,{playerGroupId})
		if cv_cvn_enable == true then
		a2abackupMenuCvn = missionCommands.addSubMenuForGroup(playerGroupId,"[Request CAP Backup-US Carrier]", a2abackupMenu)
			missionCommands.addCommandForGroup(playerGroupId, "Scramble to: MY CURRENT POSITION", a2abackupMenuCvn, CVBACKUP1,{client:GetName(), client:GetPlayerName(), true})
			missionCommands.addCommandForGroup(playerGroupId, "Scramble to: NORMAL CAP ROUTE", a2abackupMenuCvn, CVBACKUP1,{client:GetName(), client:GetPlayerName(), false})
		--missionCommands.addCommandForGroup(playerGroupId, "[Request CAP Backup - RU Carrier]", a2abackupMenu, CVBACKUP2,{playerGroupId})
		end
		if cv_kuz_enable == true then
		a2abackupMenuKuz = missionCommands.addSubMenuForGroup(playerGroupId,"[Request CAP Backup-RU Carrier]", a2abackupMenu)
			missionCommands.addCommandForGroup(playerGroupId, "Scramble to: MY CURRENT POSITION", a2abackupMenuKuz, CVBACKUP2,{client:GetName(), client:GetPlayerName(), true})
			missionCommands.addCommandForGroup(playerGroupId, "Scramble to: NORMAL CAP ROUTE", a2abackupMenuKuz, CVBACKUP2,{client:GetName(), client:GetPlayerName(), false})
		end
	end
	end
end

local csarMissionMenu = missionCommands.addSubMenuForGroup(playerGroupId,"CSAR Missions",mainMenuSpawning)
missionCommands.addCommandForGroup(playerGroupId, "[[ Start CSAR Mission ]]", csarMissionMenu, csar_MenuStart,{playerGroupId})


--allow_autospawn_menu_settings = true
if allow_autospawn_menu_settings == true then

--autoSpawnMenuSettings = missionCommands.addSubMenuForGroup(playerGroupId,"Air/Ground Mission Auto-Spawn Settings", utilsToolsMenu)
autoSpawnMenuSettings = missionCommands.addSubMenuForGroup(playerGroupId,"Air/Ground Mission Auto-Spawn Settings", mainMenuSpawning)

	autoSpawnMenuSettings_air = missionCommands.addSubMenuForGroup(playerGroupId,"A2A Missions Auto-Spawn Settings", autoSpawnMenuSettings)
		autoSpawnMenuSettings_a2a_fighter_autospawn = missionCommands.addSubMenuForGroup(playerGroupId,"Enemy A2A Fighter Auto-Spawn", autoSpawnMenuSettings_air)
			missionCommands.addCommandForGroup(playerGroupId, "Set TRUE", autoSpawnMenuSettings_a2a_fighter_autospawn,a2a_fighter_autospawn_enable_menuSetting,{setting_bool = true})
			missionCommands.addCommandForGroup(playerGroupId, "Set FALSE", autoSpawnMenuSettings_a2a_fighter_autospawn,a2a_fighter_autospawn_enable_menuSetting,{setting_bool = false})
		autoSpawnMenuSettings_a2a_bomber_autospawn = missionCommands.addSubMenuForGroup(playerGroupId,"Enemy A2A Bomber Auto-Spawn", autoSpawnMenuSettings_air)
			missionCommands.addCommandForGroup(playerGroupId, "Set TRUE", autoSpawnMenuSettings_a2a_bomber_autospawn,a2a_bomber_autospawn_enable_menuSetting,{setting_bool = true})
			missionCommands.addCommandForGroup(playerGroupId, "Set FALSE", autoSpawnMenuSettings_a2a_bomber_autospawn,a2a_bomber_autospawn_enable_menuSetting,{setting_bool = false})
		autoSpawnMenuSettings_a2a_helo_autospawn = missionCommands.addSubMenuForGroup(playerGroupId,"Enemy A2A Helo Auto-Spawn", autoSpawnMenuSettings_air)
			missionCommands.addCommandForGroup(playerGroupId, "Set TRUE", autoSpawnMenuSettings_a2a_helo_autospawn,a2a_helo_autospawn_enable_menuSetting,{setting_bool = true})
			missionCommands.addCommandForGroup(playerGroupId, "Set FALSE", autoSpawnMenuSettings_a2a_helo_autospawn,a2a_helo_autospawn_enable_menuSetting,{setting_bool = false})
		autoSpawnMenuSettings_blue_cap_backup_autospawn = missionCommands.addSubMenuForGroup(playerGroupId,"Friendly A2A CAP Backup Auto-Spawn", autoSpawnMenuSettings_air)
			missionCommands.addCommandForGroup(playerGroupId, "Set TRUE", autoSpawnMenuSettings_blue_cap_backup_autospawn,a2a_blue_cap_backup_enable_menuSetting,{setting_bool = true})
			missionCommands.addCommandForGroup(playerGroupId, "Set FALSE", autoSpawnMenuSettings_blue_cap_backup_autospawn,a2a_blue_cap_backup_enable_menuSetting,{setting_bool = false})

if singleRandomMissionModeEnabled == false then	
	autoSpawnMenuSettings_ground = missionCommands.addSubMenuForGroup(playerGroupId,"A2G Missions Auto-Spawn Settings", autoSpawnMenuSettings)
		autoSpawnMenuSettings_a2g_easy_autospawn = missionCommands.addSubMenuForGroup(playerGroupId,"A2G EASY Settings", autoSpawnMenuSettings_ground)
			missionCommands.addCommandForGroup(playerGroupId, "Set TRUE", autoSpawnMenuSettings_a2g_easy_autospawn,a2g_easy_autospawn_enable_menuSetting,{setting_bool = true})
			missionCommands.addCommandForGroup(playerGroupId, "Set FALSE", autoSpawnMenuSettings_a2g_easy_autospawn,a2g_easy_autospawn_enable_menuSetting,{setting_bool = false})
			missionCommands.addCommandForGroup(playerGroupId, "Force Remove Mission", autoSpawnMenuSettings_a2g_easy_autospawn,force_remove_mr,{})
		autoSpawnMenuSettings_a2g_hard_autospawn = missionCommands.addSubMenuForGroup(playerGroupId,"A2G HARD Settings", autoSpawnMenuSettings_ground)
			missionCommands.addCommandForGroup(playerGroupId, "Set TRUE", autoSpawnMenuSettings_a2g_hard_autospawn,a2g_hard_autospawn_enable_menuSetting,{setting_bool = true})
			missionCommands.addCommandForGroup(playerGroupId, "Set FALSE", autoSpawnMenuSettings_a2g_hard_autospawn,a2g_hard_autospawn_enable_menuSetting,{setting_bool = false})
			missionCommands.addCommandForGroup(playerGroupId, "Force Remove Mission", autoSpawnMenuSettings_a2g_hard_autospawn,force_remove_ag,{})
		autoSpawnMenuSettings_a2g_sead_autospawn = missionCommands.addSubMenuForGroup(playerGroupId,"A2G SEAD Settings", autoSpawnMenuSettings_ground)
			missionCommands.addCommandForGroup(playerGroupId, "Set TRUE", autoSpawnMenuSettings_a2g_sead_autospawn,a2g_sead_autospawn_enable_menuSetting,{setting_bool = true})
			missionCommands.addCommandForGroup(playerGroupId, "Set FALSE", autoSpawnMenuSettings_a2g_sead_autospawn,a2g_sead_autospawn_enable_menuSetting,{setting_bool = false})
			missionCommands.addCommandForGroup(playerGroupId, "Force Remove Mission", autoSpawnMenuSettings_a2g_sead_autospawn,force_remove_sead,{})
		autoSpawnMenuSettings_a2g_helo_autospawn = missionCommands.addSubMenuForGroup(playerGroupId,"A2G HELO Settings", autoSpawnMenuSettings_ground)
			missionCommands.addCommandForGroup(playerGroupId, "Set TRUE", autoSpawnMenuSettings_a2g_helo_autospawn,a2g_helo_autospawn_enable_menuSetting,{setting_bool = true})
			missionCommands.addCommandForGroup(playerGroupId, "Set FALSE", autoSpawnMenuSettings_a2g_helo_autospawn,a2g_helo_autospawn_enable_menuSetting,{setting_bool = false})
			missionCommands.addCommandForGroup(playerGroupId, "Force Remove Mission", autoSpawnMenuSettings_a2g_helo_autospawn,force_remove_helo,{})
		autoSpawnMenuSettings_a2g_inf_autospawn = missionCommands.addSubMenuForGroup(playerGroupId,"A2G INFANTRY Settings", autoSpawnMenuSettings_ground)
			missionCommands.addCommandForGroup(playerGroupId, "Set TRUE", autoSpawnMenuSettings_a2g_inf_autospawn,a2g_inf_autospawn_enable_menuSetting,{setting_bool = true})
			missionCommands.addCommandForGroup(playerGroupId, "Set FALSE", autoSpawnMenuSettings_a2g_inf_autospawn,a2g_inf_autospawn_enable_menuSetting,{setting_bool = false})
			missionCommands.addCommandForGroup(playerGroupId, "Force Remove Mission", autoSpawnMenuSettings_a2g_inf_autospawn,force_remove_inf,{})
	if carrierOpsTheatre == true then
		autoSpawnMenuSettings_antiship_autospawn = missionCommands.addSubMenuForGroup(playerGroupId,"ANTI-SHIP Settings", autoSpawnMenuSettings_ground)
			missionCommands.addCommandForGroup(playerGroupId, "Set TRUE", autoSpawnMenuSettings_antiship_autospawn,antiship_autospawn_enable_menuSetting,{setting_bool = true})
			missionCommands.addCommandForGroup(playerGroupId, "Set FALSE", autoSpawnMenuSettings_antiship_autospawn,antiship_autospawn_enable_menuSetting,{setting_bool = false})
			missionCommands.addCommandForGroup(playerGroupId, "Force Remove Mission", autoSpawnMenuSettings_antiship_autospawn,force_remove_as,{})
	
	end
end
		
autoSpawnMenuSettingsDisplay = missionCommands.addCommandForGroup(playerGroupId,"Display current Air/Ground Mission Auto-Spawn Settings", mainMenuSpawning,showTtiMissionSettingMenuStatus,{})

end

	
    TTI_Menus.radioMenusAdded[playerGroupId] = true
end

-- reschedule for users that change slot or coalition
-- local TTI_Menus_ClientSetupScheduler = TIMER:New(TTI_Menus.setupClients)
-- TTI_Menus_ClientSetupScheduler:Start(5, 30)

-- timer.scheduleFunction(function() 
-- local TTI_Menus_ClientSetupScheduler = timer.scheduleFunction(TTI_Menus.setupClients, {}, timer.getTime() + 30)
-- end, nil, timer.getTime() + 5  )

-- timer.scheduleFunction(function() --TTI MP ADD
-- TTI_Menus.setupClients()
-- end, nil, timer.getTime() + 6  )

-- cleanup schedulers of users that are dead or left the mission
TTI_Menus_CleanupScheduler = SCHEDULER:New(nil,
        function()
            for groupId, clientPreferences in pairs(TTI_Menus.playerData) do
                local clientName = clientPreferences["clientName"]
                local client = CLIENT:FindByName(clientName, nil, false)
                if client == nil or not client:IsPlayer() then
                    env.info(string.format("TTI Menu stopping scheduler for %s, %s", clientPreferences["groupId"], clientPreferences["clientName"]))
                    TTI_Menus.playerData[groupId] = nil
                    TTI_Menus.radioMenusAdded[groupId] = nil
                end
            end
end, {}, 0, 60, 0)

tti.debug("TTI Main Menus LUA file loaded ... OK")