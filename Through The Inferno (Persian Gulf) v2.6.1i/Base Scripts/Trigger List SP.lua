--Trigger list for SP

----------AIR MISSIONS!-----------------------------------------------------------
--a2a easy
function a2a_easy_menu_start()
	trigger.action.outText( "<< A2A [Easy] Mission Active >>", 7)
	trigger.action.outSound("TTI Soundfiles/AC04 Beep.ogg" )
	a2a_easy_start()
	trigger.action.setUserFlag('1', false)
end

function a2a_normal_menu_start()
	trigger.action.outText( "<< A2A [Normal] Mission Active >>", 7)
	trigger.action.outSound("TTI Soundfiles/AC04 Beep.ogg" )
	a2a_norm_start()
	trigger.action.setUserFlag('2', false)
end

function a2a_hard_menu_start()
	trigger.action.outText( "<< A2A [Hard] Mission Active >>", 7)
	trigger.action.outSound("TTI Soundfiles/AC04 Beep.ogg" )
	a2a_hard_start()
	trigger.action.setUserFlag('2', false)
end

--a2a hard
function a2a_ace_menu_start()
	if a2a_ace_started ~= true then
	trigger.action.outText( "<< A2A [Ace] Mission Active - Enemy Ace Squadron Approaching >>", 5)
	--trigger.action.outSound("TTI Soundfiles/AC04 Beep.ogg" )
	trigger.action.outSound("TTI Soundfiles/ShoutFX.com - Air Raid.ogg" )
	
	timer.scheduleFunction(function()
	a2a_ace_start()
	end, nil, timer.getTime() + 6  )
	
	trigger.action.setUserFlag('3', false)
	else
		trigger.action.outText( "<< A2A Hard (Enemy Elite/Ace Squadron Missions) cannot be stacked. >>\n \nYou can only spawn one of each A2A mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end
 --bombing add
function a2a_intercept_menu_start()
	if enable_bomber_escorts == true then
		trigger.action.outText( "<< A2A Bomber Intercept (with escorts) Mission Active >>", 7)
	elseif enable_bomber_escorts == false then
		trigger.action.outText( "<< A2A Bomber Intercept Mission Active >>", 7)
	end
	
	trigger.action.outSound("TTI Soundfiles/AC04 Beep.ogg" )
	a2a_bombing_start()
	trigger.action.setUserFlag('intercept', false)
end

--a2a random
function a2a_random_menu_start()
	trigger.action.outText( "<< A2A [Random] Mission Active >>", 7)
	trigger.action.outSound("TTI Soundfiles/AC04 Beep.ogg" )
	a2a_all_start()
	trigger.action.setUserFlag('4', false)
end
--helo add
function a2a_helo_menu_start()
	trigger.action.outText( "<< A2A [Helo] Mission Active >>", 7)
	trigger.action.outSound("TTI Soundfiles/AC04 Beep.ogg" )
	a2a_helo_start()
	trigger.action.setUserFlag('5', false)
end

----------Ground missions!-----------------------------------------------------------

--a2g hard
function a2g_hard_initialize_spawn(MissionNumSelect)
--if trigger.misc.getUserFlag('61') == 1 then
	a2gj_start(MissionNumSelect)
	--[[
	trigger.action.outText( "<< A2G Hard Mission: \""..HardMissionName.."\" Active >>", 7)
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
	trigger.action.setUserFlag('61', false)
	--]]
end

--a2g easy
function a2g_easy_initialize_spawn(MissionNumSelect)
--if trigger.misc.getUserFlag('71') == 1 then
	a2gmr_start(MissionNumSelect)
	--[[
	trigger.action.outText( "<< A2G Easy Mission: \""..EasyMissionName.."\" Active >>", 7)
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
	trigger.action.setUserFlag('71', false)
	--]]
end

--a2g helo
function a2g_helo_initialize_spawn(MissionNumSelect)
--if trigger.misc.getUserFlag('81') == 1 then
	a2gh_start(MissionNumSelect)
	--[[
	trigger.action.outText( "<< A2G Helo Mission: \""..HeloMissionName.."\" Active >>", 7)
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
	trigger.action.setUserFlag('81', false)
	--]]
end

--a2g ia
function a2g_infas_initialize_spawn(MissionNumSelect)
--if trigger.misc.getUserFlag('111') == 1 then
	a2gia_start(MissionNumSelect)
	--[[
	trigger.action.outText( "<< Infantry Assault Mission: \""..InfMissionName.."\" Active >>", 7)
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
	trigger.action.setUserFlag('111', false)
	--]]
end

--a2g as
function a2g_as_initialize_spawn(MissionNumSelect)
--if trigger.misc.getUserFlag('91') == 1 then
	a2gas_start(MissionNumSelect)
	--[[
	trigger.action.outText( "<< Anti-Ship Mission: \""..ShipMissionName.."\" Active >>", 7)
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
	if enemy_ship_ai == true then
		trigger.action.outText( ">Enemy ships are WEAPONS FREE and will ATTACK/DEFEND<\nYou can change this setting in the mission settings.", 7)
	elseif enemy_ship_ai == false then
		trigger.action.outText( ">Enemy ships are set WEAPONS HOLD and will not ATTACK<\nYou can change this setting in the mission settings.", 7)
	end
	trigger.action.setUserFlag('91', false)
	--]]
end

--a2g sead
function a2g_sead_initialize_spawn(MissionNumSelect)
--if trigger.misc.getUserFlag('61') == 1 then
	a2gsead_start(MissionNumSelect)
	--[[
	trigger.action.outText( "<< A2G Hard Mission: \""..HardMissionName.."\" Active >>", 7)
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
	trigger.action.setUserFlag('61', false)
	--]]
end

--a2g convoy
function a2g_convoy_initialize_spawn(MissionNumSelect)
--if trigger.misc.getUserFlag('15') == 1 then
if requireAcceptFirstAutoStartMission == true and Convoy_alive ~= true then
		addMissionAcceptMenu("CONV")
	else
	if Convoy_alive ~= true then
		trigger.action.outText( "<< A2G Convoy Mission Active >>", 7)
		trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
		random_convoy_start(MissionNumSelect)
	elseif Convoy_alive == true then
		trigger.action.outText( "<< There is already a mission of this type currently active. >>\n \nYou can only spawn one of each A2G mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	end
	trigger.action.setUserFlag('15', false)
	
end
end

--a2g ship convoy
function a2g_ship_convoy_initialize_spawn()
--if trigger.misc.getUserFlag('15') == 1 then
if carrierOpsTheatre == true then
	if Ship_Convoy_alive ~= true then
		trigger.action.outText( "<< A2S Ship Convoy Mission Active >>", 7)
		trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
		random_ship_convoy_start()
	elseif Ship_Convoy_alive == true then
		trigger.action.outText( "<< There is already a mission of this type currently active. >>\n \nYou can only spawn one of each A2G mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	end
	trigger.action.setUserFlag('15', false)
end
end

----------DEBUG AND LOGISTICS!-----------------------------------------------------------

resetAwacsTime = 14400

function reset_awacs()

	if awacs_timer ~= nil then 
		timer.removeFunction(awacs_timer)
	end
	
	awacs_timer = timer.scheduleFunction(reset_awacs, {}, timer.getTime() + resetAwacsTime)
	trigger.action.outText( "<< AWACS Reset >>", 7)
	sp("USA AWACS")
	--awacs_group = SPAWN:New("USA AWACS")
	--awacs_group:Spawn()
	--Group.getByName("USA AWACS"):activate()
end

-- enable_friendly_airbase_aa_1 = true
-- mainAirbaseAntiAirType_Modern_1 = "blue_aa_sam_hawk"
-- mainAirbaseAntiAirType_ColdWar_1 = "blue_aa_sam_tac_avenger"
-- mainAirbaseAntiAirType_KoreanWar_1 = "blue_aa_aaa_bofors40"
-- mainAirbaseAntiAirType_WW2_1 = "blue_aa_aaa_bofors40"

-- enable_friendly_airbase_aa_2 = true
-- mainAirbaseAntiAirType_Modern_2 = "blue_aa_aaa_vulcanm163"
-- mainAirbaseAntiAirType_ColdWar_2 = "blue_aa_aaa_vulcanm163"
-- mainAirbaseAntiAirType_KoreanWar_2 = "blue_aa_aaa_bofors40"
-- mainAirbaseAntiAirType_WW2_2 = "blue_aa_aaa_bofors40"

--airbase anti air spawn
if enable_friendly_airbase_aa_1 == true then

airbase_anti_air_spawn_1 = ZONE:New( "airbase_anti_air_spawn_1" )
--[[
	mainAirbaseAntiAirType_Modern_1 = "blue_aa_sam_hawk"
	mainAirbaseAntiAirType_ColdWar_1 = "blue_aa_sam_tac_avenger"
	mainAirbaseAntiAirType_KoreanWar_1 = "blue_aa_aaa_bofors40"
	mainAirbaseAntiAirType_WW2_1 = "blue_aa_aaa_bofors40"
--]]

	if mission_era == "modern" then
		mainAirbaseAntiAirGroup1 = mainAirbaseAntiAirType_Modern_1
	elseif  mission_era == "cold_war" then
		mainAirbaseAntiAirGroup1 = mainAirbaseAntiAirType_ColdWar_1
	elseif  mission_era == "korean_war" then
		mainAirbaseAntiAirGroup1 = mainAirbaseAntiAirType_KoreanWar_1
	elseif  mission_era == "ww2" then
		mainAirbaseAntiAirGroup1 = mainAirbaseAntiAirType_WW2_1
	end
	
airbase_anti_air_spawn_group_1 = SPAWN:New(mainAirbaseAntiAirGroup1)
airbase_anti_air_spawn_group_1:SpawnInZone(airbase_anti_air_spawn_1, true )
tti.debug("Spawning Main Airbase Anti-Air: " .. tostring(mainAirbaseAntiAirGroup1), false)
end

if enable_friendly_airbase_aa_1 == true then

airbase_anti_air_spawn_2 = ZONE:New( "airbase_anti_air_spawn_2" )

--[[
mainAirbaseAntiAirType_Modern_2 = "blue_aa_aaa_vulcanm163"
mainAirbaseAntiAirType_ColdWar_2 = "blue_aa_aaa_vulcanm163"
mainAirbaseAntiAirType_KoreanWar_2 = "blue_aa_aaa_bofors40"
mainAirbaseAntiAirType_WW2_2 = "blue_aa_aaa_bofors40"
--]]


	if mission_era == "modern" then
		mainAirbaseAntiAirGroup2 = mainAirbaseAntiAirType_Modern_2
	elseif  mission_era == "cold_war" then
		mainAirbaseAntiAirGroup2 = mainAirbaseAntiAirType_ColdWar_2
	elseif  mission_era == "korean_war" then
		mainAirbaseAntiAirGroup2 = mainAirbaseAntiAirType_KoreanWar_2
	elseif  mission_era == "ww2" then
		mainAirbaseAntiAirGroup2 = mainAirbaseAntiAirType_WW2_2
	end


airbase_anti_air_spawn_group_2 = SPAWN:New(mainAirbaseAntiAirGroup2)
airbase_anti_air_spawn_group_2:SpawnInZone(airbase_anti_air_spawn_2, true )
tti.debug("Spawning Main Airbase Anti-Air: " .. tostring(mainAirbaseAntiAirGroup2), false)

end

--------------------EW FOR RED AI AIRCRAFT AND IADS!--------------

-- Group.getByName("REW_Main"):activate()
-- tti.debug("Now spawning Red EW")

------------MISSION SCRIPTS SETUP!------------------

if enable_ctld == true and ctld_load_method == "onMissionStart" then
--trigger.action.setUserFlag('START-CTLD', true)
start_ctld()
start_csar()
tti.debug("Starting CTLD, from mission start!")
else
tti.debug("Not starting CTLD from mission start!")
end

----------Ground missions Single Mission Mode (SMM)!-----------------------------------------------------------

--[[
singleRandomMissionModeEnabled = false
a2g_easy_smm_enable = true
a2g_hard_smm_enable = true
a2g_helo_smm_enable = true
a2g_inf_smm_enable = true
a2g_cnv_smm_enable = true
a2g_ship_cnv_smm_enable = true
a2g_as_smm_enable = true
--]]

singleMissionsList = {}

if singleRandomMissionModeEnabled == true then
a2g_easy_autostart = false
a2g_hard_autostart = false
a2g_sead_autostart = false
a2g_helo_autostart = false
a2g_helo_inf_autostart = false
antiship_autostart = false
convoy_missions_autostart = false
ship_convoy_missions_autostart = false
end

-- Force remove antiship on NEVADA or non-carrier map
if carrierOpsTheatre == true then
a2g_as_smm_enable = false
a2g_ship_convoy_smm_enable = false
end

-- Force remove SEAD mission on ww2 and korean_war
if mission_era == "korean_war" or mission_era == "ww2" then
a2g_sead_autostart = false
a2g_sead_smm_enable = false
end

if a2g_easy_smm_enable == true then
	table.insert(singleMissionsList, "a2g_easy")
end

if a2g_hard_smm_enable == true then
	table.insert(singleMissionsList, "a2g_hard")
end

if a2g_sead_smm_enable == true then
	table.insert(singleMissionsList, "a2g_sead")
end

if a2g_helo_smm_enable == true then
	table.insert(singleMissionsList, "a2g_helo")
end

if a2g_inf_smm_enable == true then
	table.insert(singleMissionsList, "a2g_inf")
end
if a2g_convoy_smm_enable == true then
	table.insert(singleMissionsList, "a2g_cnv")
end
if a2g_ship_convoy_smm_enable == true and carrierOpsTheatre == true then
	table.insert(singleMissionsList, "a2g_ship_cnv")
end
if a2g_as_smm_enable == true then
	table.insert(singleMissionsList, "a2g_as")
end

--firstRandomSingleMission = "a2g_easy"

function startSingleRandomMission()

	--if firstRandomSingleMission == "random" then
		
		--[[
		local randomMissionToSpawn;
		repeat
			randomMissionToSpawn = singleMissionsList[math.random(1,#singleMissionsList)]
		until randomMissionToSpawn ~= lastRandomMissionToSpawn;
		lastRandomMissionToSpawn = randomMissionToSpawn;
		--]]
		local randomMissionToSpawn;
		randomMissionToSpawn = singleMissionsList[math.random(1,#singleMissionsList)]
	
	--else
		--local randomMissionToSpawn
		--randomMissionToSpawn = firstRandomSingleMission
		--tti.debug("First SMM Mission Choice is: " .. tostring(randomMissionToSpawn))
	--end
	
	tti.debug("New Random Single Mission Starting: " .. tostring(randomMissionToSpawn), true)
	
	if randomMissionToSpawn == "a2g_easy" then
		a2g_easy_initialize_spawn()
	elseif randomMissionToSpawn == "a2g_hard" then
		a2g_hard_initialize_spawn()
	elseif randomMissionToSpawn == "a2g_sead" then
		a2g_sead_initialize_spawn()
	elseif randomMissionToSpawn == "a2g_helo" then
		a2g_helo_initialize_spawn()
	elseif randomMissionToSpawn == "a2g_inf" then
		a2g_infas_initialize_spawn()
	elseif randomMissionToSpawn == "a2g_cnv" then
		a2g_convoy_initialize_spawn()
	elseif randomMissionToSpawn == "a2g_ship_cnv" then
		a2g_ship_convoy_initialize_spawn()
	elseif randomMissionToSpawn == "a2g_as" then
		a2g_as_initialize_spawn()
	end

end

--[[ moved to script load validation.lua
if singleRandomMissionModeEnabled == true then
	trigger.action.outText("Single Random Ground Mission Mode [ENABLED]\nThis means only one Ground Mission type will be active at any given time. Once the mission is complete a new random mission type will spawn. You can change this option in the settings, see documentation for details.", 25)
else
	trigger.action.outText("Single Random Ground Mission Mode [DISABLED]\nMultiple auto or manually spawned missions are allowed. Consider enabling it for performance improvements or for more focused mission tasking challenges. You can change this option in the settings, see documentation for details.", 25)
end
--]]

-----------------------------------------------------------

-- tanker_boom_slow_force_spawn_at_start  = false
-- tanker_basket_force_spawn_at_start = false
-- tanker_boom_fast_force_spawn_at_start = false


--- DO NOT CHANGE THESE
tanker_boom_slow_autostart  = false
tanker_basket_autostart = false
tanker_boom_fast_autostart = false
startTankerForRelevantAircraft = true


function reset_tankers()
--SETUP TANKERS
ArcoTankerTemplateSpawn = "TANKER-KC135-SLOW-256am-39Y-ARCO"
ArcoTankerTacanChannel = 39
ArcoTankerTacanFrequency = "256 AM"
ArcoTankerTacanBand = "Y"
ArcoTankerTacanCallsign = "ARC"
AcroTankerType = "(BOOM/SLOW)"

TexTankerTemplateSpawn = "TANKER-KC135-FAST-255am-41Y-TEX"
TexTankerTacanChannel = 41
TexTankerTacanFrequency = "255 AM"
TexTankerTacanBand = "Y"
TexTankerTacanCallsign = "TEX"
TexTankerType = "(BOOM/FAST)"

ShellTankerTemplateSpawn = "TANKER-135MPRS-254am-40Y-SHELL"
ShellTankerTacanChannel = 40
ShellTankerTacanFrequency = "254 AM"
ShellTankerTacanBand = "Y"
ShellTankerTacanCallsign = "SHL"
ShellTankerType = "(BASKET)"

--if trigger.misc.getUserFlag('51') == 1 and mission_era ~= "ww2" and mission_era ~= "korean_war" then
if mission_era ~= "ww2" and mission_era ~= "korean_war" then
	--trigger.action.outText( "<< Tankers Reset >>", 7)
	
		if startTankerForRelevantAircraft == true and
			tanker_boom_slow_autostart  == false and
			tanker_basket_autostart == false and
			tanker_boom_fast_autostart == false then
			--trigger.action.outText( "<< Tankers are set to spawn in when tanker-compatible aircraft are player-occupied. >>", 20) script load validation.lua
		else
			trigger.action.outText( "<< Tankers Reset >>", 7)
		end
	--if firstSpawnedTankers == true then

		if ArcoTankerName ~= nil then
		--if tanker_boom_slow_autostart == true and ArcoTankerName ~= nil then
			timer.scheduleFunction(function() 
			Group.getByName(ArcoTankerName):destroy()
			env.info("Deleting Tanker Group: ".. ArcoTankerName)
			end, nil, timer.getTime() + 5  )
		end	

		if ShellTankerName ~= nil then
		--if tanker_basket_autostart == true and ShellTankerName ~= nil then
			timer.scheduleFunction(function() 
			Group.getByName(ShellTankerName):destroy()
			env.info("Deleting Tanker Group: ".. ShellTankerName)
			end, nil, timer.getTime() + 4  )
		end
				
		if TexTankerName ~= nil then
		--if tanker_boom_fast_autostart == true and TexTankerName ~= nil then
			timer.scheduleFunction(function() 
			Group.getByName(TexTankerName):destroy()
			env.info("Deleting Tanker Group: ".. TexTankerName)
			end, nil, timer.getTime() + 6  )
		end
		
	--end
	
	timer.scheduleFunction(function() 
	--sp("TANKER-KC135-SLOW-256am-39Y-ARCO")
	if tanker_boom_slow_autostart == true or ArcoTankerInitSpawned == true  then
		ArcoTanker = SPAWN:New(ArcoTankerTemplateSpawn)
		:OnSpawnGroup(
			function(SpawnGroup)
				SpawnGroup:CommandEPLRS(true)
				--SpawnGroup:CommandSetCallsign(CALLSIGN.Tanker.Arco, 1)
				--SpawnGroupUnit = SpawnGroup:GetUnit(1)
				local myBeacon = SpawnGroup:GetBeacon()
				--myBeacon:AATACAN(39, "ARC", true)
				myBeacon:ActivateTACAN(ArcoTankerTacanChannel, ArcoTankerTacanBand, ArcoTankerTacanCallsign, true)
			end):Spawn()
		ArcoTankerName = ArcoTanker:GetName()
		ArcoTankerUnit = ArcoTanker:GetUnit(1)
		ArcoTankerTypeName = ArcoTankerUnit:GetTypeName()
		if ArcoTankerInitSpawned == true then
			trigger.action.outText( "<< Respawning compatible tanker: BOOM Tanker (Slow) >>", 7)
		end		
		--DRAW TANKER LINE
		if enable_map_info_boxes == true and tankerInfoDoOnce ~= true then
			local StartCoord = tanker_boom_slow_01_init:GetCoordinate()
			local EndCoord = tanker_boom_slow_01_wpt:GetCoordinate()
			local Distance = StartCoord:Get2DDistance(EndCoord)
			local DirVec3 = StartCoord:GetDirectionVec3(EndCoord)
			local Angle = COORDINATE:GetAngleDegrees(DirVec3)
			local TextCoord = StartCoord:Translate(Distance/2,Angle)
			local InfoBoxText = ArcoTankerTypeName .. " TANKER " .. AcroTankerType .. "\nCallsign: \"" .. ArcoTankerTacanCallsign ..  "\" TCN: "  .. ArcoTankerTacanChannel .. "Y" .. "\nFrequency: " .. ArcoTankerTacanFrequency
			
			local TankerTextBox = TextCoord:TextToAll(InfoBoxText, -1, tti.color.white, 1 , tti.color.black, 0.3, 9, false)
			local DrawTankerLine =  StartCoord:LineToAll(EndCoord, -1, tti.color.white, 0.5, 6)
			local DrawTankerLineCircleStart = StartCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
			local DrawTankerLineCircleEnd = EndCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
			local tankerInfoDoOnce = true
		end
	end	
	end, nil, timer.getTime() + 8  )
	
	timer.scheduleFunction(function() 
	--sp("TANKER-135MPRS-254am-40Y-SHELL")
	if tanker_basket_autostart == true or ShellTankerInitSpawned == true then
		ShellTanker = SPAWN:New(ShellTankerTemplateSpawn)
		:OnSpawnGroup(
			function(SpawnGroup)
				SpawnGroup:CommandEPLRS(true)
				--SpawnGroup:CommandSetCallsign(CALLSIGN.Tanker.Shell, 1)
				--SpawnGroupUnit = SpawnGroup:GetUnit(1)
				local myBeacon = SpawnGroup:GetBeacon()
				--myBeacon:AATACAN(40, "SHL", true)
				myBeacon:ActivateTACAN(ShellTankerTacanChannel, ShellTankerTacanBand, ShellTankerTacanCallsign, true)
			end):Spawn()
		ShellTankerName = ShellTanker:GetName()
		ShellTankerUnit = ShellTanker:GetUnit(1)
		ShellTankerTypeName = ShellTankerUnit:GetTypeName()
		if ShellTankerInitSpawned == true then
			trigger.action.outText( "<< Respawning compatible tanker: BASKET Tanker >>", 7)
		end
		--DRAW TANKER LINE
		if enable_map_info_boxes == true and tankerInfoDoOnce ~= true then
			local StartCoord = tanker_basket_01_init:GetCoordinate()
			local EndCoord = tanker_basket_01_wpt:GetCoordinate()
			local Distance = StartCoord:Get2DDistance(EndCoord)
			local DirVec3 = StartCoord:GetDirectionVec3(EndCoord)
			local Angle = COORDINATE:GetAngleDegrees(DirVec3)
			local TextCoord = StartCoord:Translate(Distance/2,Angle)
			local InfoBoxText = ShellTankerTypeName .. " TANKER " .. ShellTankerType .. "\nCallsign: \"" .. ShellTankerTacanCallsign ..  "\" TCN: "  .. ShellTankerTacanChannel .. "Y" .. "\nFrequency: " .. ShellTankerTacanFrequency
			
			local TankerTextBox = TextCoord:TextToAll(InfoBoxText, -1, tti.color.white, 1 , tti.color.black, 0.3, 9, false)
			local DrawTankerLine =  StartCoord:LineToAll(EndCoord, -1, tti.color.white, 0.5, 6)
			local DrawTankerLineCircleStart = StartCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
			local DrawTankerLineCircleEnd = EndCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
			local tankerInfoDoOnce = true
		end
	end
	end, nil, timer.getTime() + 9  )
	
	timer.scheduleFunction(function() 
	--sp("TANKER-KC135-FAST-255am-41Y-TEX")
	if tanker_boom_fast_autostart == true or TexTankerInitSpawned == true then
		TexTanker = SPAWN:New(TexTankerTemplateSpawn)
		:OnSpawnGroup(
			function(SpawnGroup)
				SpawnGroup:CommandEPLRS(true)
				--SpawnGroup:CommandSetCallsign(CALLSIGN.Tanker.Texaco, 1)
				--SpawnGroupUnit = SpawnGroup:GetUnit(1)
				local myBeacon = SpawnGroup:GetBeacon()
				--myBeacon:AATACAN(41, "TEX", true)
				myBeacon:ActivateTACAN(TexTankerTacanChannel, TexTankerTacanBand, TexTankerTacanCallsign, true)
			end):Spawn()
		TexTankerName = TexTanker:GetName()
		TexTankerUnit = TexTanker:GetUnit(1)
		TexTankerTypeName = TexTankerUnit:GetTypeName()
		if TexTankerInitSpawned == true then
			trigger.action.outText( "<< Respawning compatible tanker: BOOM Tanker (Fast) >>", 7)
		end	
		--DRAW TANKER LINE
		if enable_map_info_boxes == true and tankerInfoDoOnce ~= true then
			local StartCoord = tanker_boom_fast_01_init:GetCoordinate()
			local EndCoord = tanker_boom_fast_01_wpt:GetCoordinate()
			local Distance = StartCoord:Get2DDistance(EndCoord)
			local DirVec3 = StartCoord:GetDirectionVec3(EndCoord)
			local Angle = COORDINATE:GetAngleDegrees(DirVec3)
			local TextCoord = StartCoord:Translate(Distance/2,Angle)
			local InfoBoxText = TexTankerTypeName .. " TANKER " .. TexTankerType .. "\nCallsign: \"" .. TexTankerTacanCallsign ..  "\" TCN: "  .. TexTankerTacanChannel .. "Y" .. "\nFrequency: " .. TexTankerTacanFrequency
			
			local TankerTextBox = TextCoord:TextToAll(InfoBoxText, -1, tti.color.white, 1 , tti.color.black, 0.3, 9, false)
			local DrawTankerLine =  StartCoord:LineToAll(EndCoord, -1, tti.color.white, 0.5, 6)
			local DrawTankerLineCircleStart = StartCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
			local DrawTankerLineCircleEnd = EndCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
			local tankerInfoDoOnce = true
		end
	end
	end, nil, timer.getTime() + 10  )
	
	--firstSpawnedTankers = true
	trigger.action.setUserFlag('51', false)
		
end
end
reset_tankers() --immediate tanker spawn

function force_spawn_tanker_boom_slow(spawnByPlayerSpawn)
--SETUP TANKERS
tanker_boom_slow_autostart = true -- to allow resets to occur properly

ArcoTankerTemplateSpawn = "TANKER-KC135-SLOW-256am-39Y-ARCO"
ArcoTankerTacanChannel = 39
ArcoTankerTacanFrequency = "256 AM"
ArcoTankerTacanBand = "Y"
ArcoTankerTacanCallsign = "ARC"
AcroTankerType = "(BOOM/SLOW)"



--if trigger.misc.getUserFlag('51') == 1 and mission_era ~= "ww2" and mission_era ~= "korean_war" then
if mission_era ~= "ww2" and mission_era ~= "korean_war" and tanker_boom_slow_enable == true then
	tti.debug("First A-10 Player Spawn detected, spawning Slow Tanker", false)
	
	if spawnByPlayerSpawn == true then
	trigger.action.outText( "<< Boom (Slow) Tanker Aircraft Detected. Spawning compatible tanker. >>", 7)
	else
	trigger.action.outText( "<< Force Spawning Tanker Boom (Slow) >>", 7)
	end
		
	--end
	

	--sp("TANKER-KC135-SLOW-256am-39Y-ARCO")

		ArcoTanker = SPAWN:New(ArcoTankerTemplateSpawn)
		:OnSpawnGroup(
			function(SpawnGroup)
				SpawnGroup:CommandEPLRS(true)
				--SpawnGroup:CommandSetCallsign(CALLSIGN.Tanker.Arco, 1)
				--SpawnGroupUnit = SpawnGroup:GetUnit(1)
				local myBeacon = SpawnGroup:GetBeacon()
				--myBeacon:AATACAN(39, "ARC", true)
				myBeacon:ActivateTACAN(ArcoTankerTacanChannel, ArcoTankerTacanBand, ArcoTankerTacanCallsign, true)
			end):Spawn()
		ArcoTankerName = ArcoTanker:GetName()
		ArcoTankerUnit = ArcoTanker:GetUnit(1)
		ArcoTankerTypeName = ArcoTankerUnit:GetTypeName()
		ArcoTankerInitSpawned = true
		--DRAW TANKER LINE
		if enable_map_info_boxes == true and tankerInfoDoOnce ~= true then
			local StartCoord = tanker_boom_slow_01_init:GetCoordinate()
			local EndCoord = tanker_boom_slow_01_wpt:GetCoordinate()
			local Distance = StartCoord:Get2DDistance(EndCoord)
			local DirVec3 = StartCoord:GetDirectionVec3(EndCoord)
			local Angle = COORDINATE:GetAngleDegrees(DirVec3)
			local TextCoord = StartCoord:Translate(Distance/2,Angle)
			local InfoBoxText = ArcoTankerTypeName .. " TANKER " .. AcroTankerType .. "\nCallsign: \"" .. ArcoTankerTacanCallsign ..  "\" TCN: "  .. ArcoTankerTacanChannel .. "Y" .. "\nFrequency: " .. ArcoTankerTacanFrequency
			
			local TankerTextBox = TextCoord:TextToAll(InfoBoxText, -1, tti.color.white, 1 , tti.color.black, 0.3, 9, false)
			local DrawTankerLine =  StartCoord:LineToAll(EndCoord, -1, tti.color.white, 0.5, 6)
			local DrawTankerLineCircleStart = StartCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
			local DrawTankerLineCircleEnd = EndCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
			local tankerInfoDoOnce = true
		end
	
	
	
	--firstSpawnedTankers = true
	trigger.action.setUserFlag('51', false)
end
end


function force_spawn_tanker_boom_fast(spawnByPlayerSpawn)
--SETUP TANKERS

TexTankerTemplateSpawn = "TANKER-KC135-FAST-255am-41Y-TEX"
TexTankerTacanChannel = 41
TexTankerTacanFrequency = "255 AM"
TexTankerTacanBand = "Y"
TexTankerTacanCallsign = "TEX"
TexTankerType = "(BOOM/FAST)"



--if trigger.misc.getUserFlag('51') == 1 and mission_era ~= "ww2" and mission_era ~= "korean_war" then
if mission_era ~= "ww2" and mission_era ~= "korean_war" and tanker_boom_fast_enable == true then

	if spawnByPlayerSpawn == true then
	trigger.action.outText( "<< Boom (Fast) Tanker Aircraft Detected. Spawning compatible tanker. >>", 7)
	else
	trigger.action.outText( "<< Force Spawning Tanker Boom (Fast) >>", 7)
	end
	

	
	

	--sp("TANKER-KC135-FAST-255am-41Y-TEX")
	
		TexTanker = SPAWN:New(TexTankerTemplateSpawn)
		:OnSpawnGroup(
			function(SpawnGroup)
				SpawnGroup:CommandEPLRS(true)
				--SpawnGroup:CommandSetCallsign(CALLSIGN.Tanker.Texaco, 1)
				--SpawnGroupUnit = SpawnGroup:GetUnit(1)
				local myBeacon = SpawnGroup:GetBeacon()
				--myBeacon:AATACAN(41, "TEX", true)
				myBeacon:ActivateTACAN(TexTankerTacanChannel, TexTankerTacanBand, TexTankerTacanCallsign, true)
			end):Spawn()
		TexTankerName = TexTanker:GetName()
		TexTankerUnit = TexTanker:GetUnit(1)
		TexTankerTypeName = TexTankerUnit:GetTypeName()
		TexTankerInitSpawned = true
		--DRAW TANKER LINE
		if enable_map_info_boxes == true and tankerInfoDoOnce ~= true then
			local StartCoord = tanker_boom_fast_01_init:GetCoordinate()
			local EndCoord = tanker_boom_fast_01_wpt:GetCoordinate()
			local Distance = StartCoord:Get2DDistance(EndCoord)
			local DirVec3 = StartCoord:GetDirectionVec3(EndCoord)
			local Angle = COORDINATE:GetAngleDegrees(DirVec3)
			local TextCoord = StartCoord:Translate(Distance/2,Angle)
			local InfoBoxText = TexTankerTypeName .. " TANKER " .. TexTankerType .. "\nCallsign: \"" .. TexTankerTacanCallsign ..  "\" TCN: "  .. TexTankerTacanChannel .. "Y" .. "\nFrequency: " .. TexTankerTacanFrequency
			
			local TankerTextBox = TextCoord:TextToAll(InfoBoxText, -1, tti.color.white, 1 , tti.color.black, 0.3, 9, false)
			local DrawTankerLine =  StartCoord:LineToAll(EndCoord, -1, tti.color.white, 0.5, 6)
			local DrawTankerLineCircleStart = StartCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
			local DrawTankerLineCircleEnd = EndCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
			local tankerInfoDoOnce = true
		end
	
	
	--firstSpawnedTankers = true
	trigger.action.setUserFlag('51', false)
end
end

function force_spawn_tanker_basket(spawnByPlayerSpawn)
--SETUP TANKERS

ShellTankerTemplateSpawn = "TANKER-135MPRS-254am-40Y-SHELL"
ShellTankerTacanChannel = 40
ShellTankerTacanFrequency = "254 AM"
ShellTankerTacanBand = "Y"
ShellTankerTacanCallsign = "SHL"
ShellTankerType = "(BASKET)"

--if trigger.misc.getUserFlag('51') == 1 and mission_era ~= "ww2" and mission_era ~= "korean_war" then
if mission_era ~= "ww2" and mission_era ~= "korean_war" and tanker_basket_enable == true then
	if spawnByPlayerSpawn == true then
	trigger.action.outText( "<< Basket Tanker Aircraft Detected. Spawning compatible tanker. >>", 7)
	else
	trigger.action.outText( "<< Force Spawning Tanker Basket >>", 7)
	end
	--end
	timer.scheduleFunction(function() 
	--sp("TANKER-135MPRS-254am-40Y-SHELL")
	
		ShellTanker = SPAWN:New(ShellTankerTemplateSpawn)
		:OnSpawnGroup(
			function(SpawnGroup)
				SpawnGroup:CommandEPLRS(true)
				--SpawnGroup:CommandSetCallsign(CALLSIGN.Tanker.Shell, 1)
				--SpawnGroupUnit = SpawnGroup:GetUnit(1)
				local myBeacon = SpawnGroup:GetBeacon()
				--myBeacon:AATACAN(40, "SHL", true)
				myBeacon:ActivateTACAN(ShellTankerTacanChannel, ShellTankerTacanBand, ShellTankerTacanCallsign, true)
			end):Spawn()
		ShellTankerName = ShellTanker:GetName()
		ShellTankerUnit = ShellTanker:GetUnit(1)
		ShellTankerTypeName = ShellTankerUnit:GetTypeName()
		ShellTankerInitSpawned = true
		--DRAW TANKER LINE
		if enable_map_info_boxes == true and tankerInfoDoOnce ~= true then
			local StartCoord = tanker_basket_01_init:GetCoordinate()
			local EndCoord = tanker_basket_01_wpt:GetCoordinate()
			local Distance = StartCoord:Get2DDistance(EndCoord)
			local DirVec3 = StartCoord:GetDirectionVec3(EndCoord)
			local Angle = COORDINATE:GetAngleDegrees(DirVec3)
			local TextCoord = StartCoord:Translate(Distance/2,Angle)
			local InfoBoxText = ShellTankerTypeName .. " TANKER " .. ShellTankerType .. "\nCallsign: \"" .. ShellTankerTacanCallsign ..  "\" TCN: "  .. ShellTankerTacanChannel .. "Y" .. "\nFrequency: " .. ShellTankerTacanFrequency
			
			local TankerTextBox = TextCoord:TextToAll(InfoBoxText, -1, tti.color.white, 1 , tti.color.black, 0.3, 9, false)
			local DrawTankerLine =  StartCoord:LineToAll(EndCoord, -1, tti.color.white, 0.5, 6)
			local DrawTankerLineCircleStart = StartCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
			local DrawTankerLineCircleEnd = EndCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
			local tankerInfoDoOnce = true
		end
	
	end, nil, timer.getTime() + 9  )

	
end
end

if tanker_boom_slow_force_spawn_at_start == true then
timer.scheduleFunction(function()
force_spawn_tanker_boom_slow(false)
playerFirstSpawnedTankerBoomSlow = true
tti.debug("Tanker Boom Slow force spawning at start!")
end, nil, timer.getTime() + 15  )
end

if tanker_boom_fast_force_spawn_at_start == true then
timer.scheduleFunction(function()
force_spawn_tanker_boom_fast(false)
playerFirstSpawnedTankerBoomFast = true
tti.debug("Tanker Boom Fast force spawning at start!")
end, nil, timer.getTime() + 15  )
end

if tanker_basket_force_spawn_at_start == true then
timer.scheduleFunction(function()
force_spawn_tanker_basket(false)
playerFirstSpawnedTankerBasket = true
tti.debug("Tanker Basket force spawning at start!")
end, nil, timer.getTime() + 15  )
end

function forceSpawnTankerBoomSlow()
force_spawn_tanker_boom_slow(false)
playerFirstSpawnedTankerBoomSlow = true
tti.debug("Tanker Boom Slow force spawning via menu!")
end

function forceSpawnTankerBoomFast()
force_spawn_tanker_boom_fast(false)
playerFirstSpawnedTankerBoomFast = true
tti.debug("Tanker Boom Fast force spawning via menu!")
end

function forceSpawnTankerBasket()
force_spawn_tanker_basket(false)
playerFirstSpawnedTankerBasket = true
tti.debug("Tanker Basket force spawning via menu!")
end
--loops
function main_ambient()
	if respawnA2aConstantMethod == "time" then
		timer.scheduleFunction(main_ambient, {}, timer.getTime() + math.random(a2a_respawn_time_min, a2a_respawn_time_max))
	--timer.scheduleFunction(main_ambient, {}, timer.getTime() + math.random(30, 30))
		if a2a_autospawn_enable == true then  --25 min
			if a2a_auto_spawn_stacking == true then
				a2a_all_start()
				trigger.action.outText( "<< Enemy fighters are in the area! >>", 7)
				trigger.action.outSound("TTI Soundfiles/AC04 Beep.ogg" )	
			else
				if A2A_All_Spawn == nil or A2A_All_Spawn:IsAlive() == false then
					tti.debug("A2A Ambient Spawn: A2A ALL Group is dead, starting A2A ALL spawn!")
					a2a_all_start()
					trigger.action.outText( "<< Enemy fighters are in the area! >>", 7)
					trigger.action.outSound("TTI Soundfiles/AC04 Beep.ogg" )
				elseif A2A_All_Spawn:IsAlive() == true then
					tti.debug("A2A Ambient Spawn: A2A ALL Group is still alive, skipping spawn!")
				end
			end
		end
	end
end



function main_a2a_hard()
timer.scheduleFunction(main_a2a_hard, {}, timer.getTime() + math.random(a2a_hard_respawn_time_min, a2a_hard_respawn_time_max))
	if a2a_hard_autospawn_enable == true and a2a_hard_started ~= true then  --25 min
		a2a_hard_start()
	end
end

function main_cap_backup()
timer.scheduleFunction(main_cap_backup, {}, timer.getTime() + math.random(backup_respawn_time_min, backup_respawn_time_max))
	if backup_cap_autospawn_enable == true and carrierOpsTheatre == true and mission_era ~= "ww2" and mission_era ~= "korean_war" then
		local switch = math.random(1,3)
		if switch == 1 then
			a2a_backup_1_start(nil, nil, false)
		elseif switch == 2 then
			if cv_cvn_spawned == true then
			a2a_backup_cv_1_start(nil, nil, false)
			else
			tti.debug("Tried to start blue cap backup on CVN, but CVN not spawned")
			a2a_backup_1_start(nil, nil, false)
			end
		elseif switch == 3 then
			if cv_kuz_spawned == true then
			a2a_backup_cv_kuz_1_start(nil, nil, false)
			tti.debug("Tried to start blue cap backup on KUZ, but KUZ not spawned")
			else
			a2a_backup_1_start(nil, nil, false)
			end
		end
	elseif backup_cap_autospawn_enable == true and env.mission.theatre == "Nevada" then
		a2a_backup_1_start(nil, nil, false)
	end
	
	tti.debug("Spawning friendly CAP backup - Loop triggered!")
end

--bombing add
function main_bombing()
timer.scheduleFunction(main_bombing, {}, timer.getTime() + math.random(a2a_intercept_respawn_time_min, a2a_intercept_respawn_time_max))
--timer.scheduleFunction(main_bombing, {}, timer.getTime() + math.random(30, 30))
	if a2a_autospawn_enable == true then  --25 min
		if a2a_auto_spawn_stacking == true then
			a2a_bombing_start()
			if enable_bomber_escorts == true then
				trigger.action.outText( "<< Enemy Bombers with escorts are in the area! >>", 7)
			elseif enable_bomber_escorts == false then
				trigger.action.outText( "<< Enemy Bombers are in the area! >>", 7)
			end
		else
			if A2A_BOMBING_1 == nil or A2A_BOMBING_1:IsAlive() == false then
				tti.debug("A2A Bomber Intercept Spawn: A2A Bomber Intercept Group is dead, starting A2A Bomber Intercept spawn!")
					a2a_bombing_start()
				if enable_bomber_escorts == true then
					trigger.action.outText( "<< Enemy Bombers with escorts are in the area! >>", 7)
				elseif enable_bomber_escorts == false then
					trigger.action.outText( "<< Enemy Bombers are in the area! >>", 7)
				end
					trigger.action.outSound("TTI Soundfiles/AC04 Beep.ogg" )
			elseif A2A_BOMBING_1:IsAlive() == true then
				tti.debug("A2A Bomber Intercept Spawn: A2A Bomber Intercept Group is still alive, skipping spawn!")
			end
		end
	end
end

--helo add
function main_a2a_helo()
timer.scheduleFunction(main_a2a_helo, {}, timer.getTime() + math.random(a2a_helo_respawn_time_min, a2a_helo_respawn_time_max))
if a2a_helo_autospawn_enable == true then  --25 min
a2a_helo_start()
	trigger.action.outText( "<< Enemy helicopters are in the area! >>", 7)
	trigger.action.outSound("TTI Soundfiles/AC04 Beep.ogg" )
end
end


function main_sam()
timer.scheduleFunction(main_sam, {}, timer.getTime() + sam_respawn_time )  --120 min
if sam_enable == true then
a2g_sam_start()
end
end


---- THINGS TO HAPPEN BASED ON SPAWN IN TYPES:

--[[ moved to script load validation.lua
--Let players know whats happening with carrier RAT planes!
if su33_ai_traffic_start_on_su33_spawn == true or av8b_ai_traffic_start_on_av8b_spawn == true or cvn_ai_traffic_start_on_cvn_spawn == true then
	timer.scheduleFunction(function()
		if random_blue_fighter_air_traffic == true then
			--trigger.action.outText( "<< Random Air Traffic (Carrier Planes) are set to only spawn when a player spawns on the corresponding carrier. >>", 10)
			--above moved to script load validation
			rat_cv_spawns_based_on_player_spawn = true
		end
	end, nil, timer.getTime() + 4  )
	else

end
--]]
if su33_ai_traffic_start_on_su33_spawn == true or av8b_ai_traffic_start_on_av8b_spawn == true or cvn_ai_traffic_start_on_cvn_spawn == true then
	rat_cv_spawns_based_on_player_spawn = true
end	

showPlayerSpawnTypeDectionDebugMsgs = false
tti.playerSpawn = {}
tti.playerSpawn.eventHandlerPlayerBirth = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(tti.playerSpawn.eventHandlerPlayerBirth) -- Subscribe to World Events.

--[[
function tti.playerSpawn.eventHandlerPlayerBirth:onEvent(EventData) -- Parse World Events function.
	if EventData.id == world.event.S_EVENT_BIRTH then
		tti.serialize(EventData, "EventDataForPlayerBirth")
		local iniUnit = EventData.initiator or EventData.IniDCSUnit
		
	--if iniUnit:getCategory() == 1 then
	if Object.getCategory(iniUnit) == 1 then
		local iniUnitTypeName = iniUnit:getTypeName()
		local iniUnitName = iniUnit:getName()
		local iniUnitGroup = iniUnit:getGroup()
		local iniUnitGroupName = iniUnitGroup:getName()
		local iniUnitDesc = iniUnit:getDesc()
		
		if iniUnitDesc ~= nil then
			if not iniUnit:getPlayerName() and iniUnit:hasAttribute("Planes") == true then
			tti.debug("***** AI PLANE BIRTH EVENT HANDLING: " .. iniUnitGroupName .. " has spawned into a(n): [" .. iniUnitTypeName .. "]", false)
			end
			if iniUnit:getPlayerName() then
				
				if iniUnit:hasAttribute("Planes") == true or iniUnit:hasAttribute("Helicopters") == true then
					tti.debug("***** PLAYER BIRTH EVENT HANDLING: " .. iniUnit:getPlayerName() .. " has spawned into a(n): [" .. iniUnitTypeName .. "]", showPlayerSpawnTypeDectionDebugMsgs)
											
					if playerFirstSpawned_helo == nil and iniUnit:hasAttribute("Helicopters") == true then			
						tti.debug("First Helicopter Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnitTypeName .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						--tti.debug("First Helicopter Player Spawn detected, starting HELO SCRIPTS", true)
						if enable_csar == true and csar_load_method == "onHeloSpawn" then
						timer.scheduleFunction(function()
						--trigger.action.setUserFlag('START-CSAR', true)
						end, nil, timer.getTime() + 4  )
						start_csar()
						tti.debug("First Helicopter Player Spawn detected, starting HELO CSAR SCRIPT")
						end
						if enable_ctld == true and ctld_load_method == "onHeloSpawn" then
						timer.scheduleFunction(function()
							--trigger.action.setUserFlag('START-CTLD', true)
							start_ctld()
						end, nil, timer.getTime() + 4  )
						timer.scheduleFunction(function()
							--table.insert(ctld.transportPilotNames, iniUnitName)
							tti.debug("adding " .. iniUnit:getPlayerName() .. "'s helo to ctld.transportPilotNames list")
						end, nil, timer.getTime() + 5  )
						tti.debug("First Helicopter Player Spawn detected, starting HELO CTLD SCRIPT")
						end
						playerFirstSpawned_helo = true
					end
					
					if iniUnit:hasAttribute("Helicopters") == true and trigger.misc.getUserFlag('START-CTLD') == 1 then
						--table.insert(ctld.transportPilotNames, iniUnitName)
						--tti.debug("adding " .. iniUnit:getPlayerName() .. "'s helo to ctld.transportPilotNames list",true)
					end
					
					if playerFirstSpawned_su33 == nil and iniUnitTypeName == "Su-33" then			
						tti.debug("First Su-33 Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnitTypeName .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if spawn_kuz_carrier_on_kuz_player_spawn == true then
							forceKuzSpawnOnPlayerSpawn()			
							tti.debug("First Su-33 Player Spawn detected, spawning Kuznetsov carrier", true)
						end	
						if su33_ai_traffic_start_on_su33_spawn == true then
							timer.scheduleFunction(function()
								forceSu33RatSpawnOnPlayerSpawn()
								tti.debug("First Su-33 Player Spawn detected, starting Su-33 RAT aircraft on Kuznetsov", true)
							end, nil, timer.getTime() + 4  )
						end
						playerFirstSpawned_su33 = true
					end
					
					if playerFirstSpawned_av8b == nil and iniUnitTypeName == "AV8BNA" then					
						tti.debug("First AV-8B Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnitTypeName .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if spawn_lha_carrier_on_lha_player_spawn == true then
							forceLhaSpawnOnPlayerSpawn()
							tti.debug("First AV-8B Player Spawn detected, spawning LHA-1 carrier", true)
						end
						if av8b_ai_traffic_start_on_av8b_spawn == true then
							timer.scheduleFunction(function()
							forceAv8bRatSpawnOnPlayerSpawn()
							tti.debug("First AV-8B Player Spawn detected, starting AV-8B RAT aircraft on LHA-1 Tarawa", true)
							end, nil, timer.getTime() + 4  )
						end
						playerFirstSpawned_av8b = true
					end
					
					if playerFirstSpawned_cvn == nil and iniUnitTypeName == "FA-18C_hornet" or				
					playerFirstSpawned_cvn == nil and iniUnitTypeName == "VSN_F35C" or				
					playerFirstSpawned_cvn == nil and iniUnitTypeName == "A-4E-C" or				
					playerFirstSpawned_cvn == nil and iniUnitTypeName == "T-45" or				
					playerFirstSpawned_cvn == nil and iniUnitTypeName == "VSN_F4B" or				
					playerFirstSpawned_cvn == nil and iniUnitTypeName == "F-14A-135-GR" or				
					playerFirstSpawned_cvn == nil and iniUnitTypeName == "F-14B" then
					timer.scheduleFunction(function()					
						tti.debug("First CVN Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnitTypeName .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if spawn_cvn_carrier_on_cvn_player_spawn == true then
							forceCvnSpawnOnPlayerSpawn()					
						end
						if cvn_ai_traffic_start_on_cvn_spawn == true then
							timer.scheduleFunction(function()
								forceCvnRatSpawnOnPlayerSpawn()
							end, nil, timer.getTime() + 4  )
						end
						if airboss_enable == true then
							timer.scheduleFunction(function()
							--startAirbossOnCvnSpawn()
							--trigger.action.setUserFlag('START-AIRBOSS', true)
							--tti.debug("First CVN Player Spawn detected, starting AIRBOSS SCRIPT", true)
							end, nil, timer.getTime() + 8  )
						end
						playerFirstSpawned_cvn = true
					end, nil, timer.getTime() + 5  )
					
						--spawnCvnDeckTemplate() -- spawns redkite deck template - checks are in this function in the deck template lua file
						
					end
					
					-- TANKER SPAWNS BASED ON PLAYER SPAWN
					if playerFirstSpawnedTankerBoomSlow == nil and iniUnitTypeName == "A-10A" or					
					playerFirstSpawnedTankerBoomSlow == nil and iniUnitTypeName == "A-10C" or					
					playerFirstSpawnedTankerBoomSlow == nil and iniUnitTypeName == "A-10C_2" then					
						tti.debug("First A-10 Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnitTypeName .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if startTankerForRelevantAircraft == true then
							force_spawn_tanker_boom_slow(true)
						end
						playerFirstSpawnedTankerBoomSlow = true
					end
					
					if playerFirstSpawnedTankerBoomFast == nil and iniUnitTypeName == "F-16C_50" or
					playerFirstSpawnedTankerBoomFast == nil and iniUnitTypeName == "F-4E-45MC" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnitTypeName == "VSN_F4C" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnitTypeName == "F-22A" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnitTypeName == "VSN_F35A" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnitTypeName == "VSN_F35B" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnitTypeName == "VSN_F35C" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnitTypeName == "F-15C" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnitTypeName == "F-15ESE" then					
						tti.debug("First Tanker Boom Fast Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnitTypeName .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if startTankerForRelevantAircraft == true then
							force_spawn_tanker_boom_fast(true)
						end
						playerFirstSpawnedTankerBoomFast = true
					end
					
					if playerFirstSpawnedTankerBasket == nil and iniUnitTypeName == "FA-18C_hornet" or
					playerFirstSpawnedTankerBasket == nil and iniUnitTypeName == "F-14A-135-GR" or					
					playerFirstSpawnedTankerBasket == nil and iniUnitTypeName == "F-14B" or					
					playerFirstSpawnedTankerBasket == nil and iniUnitTypeName == "Su-33" or					
					playerFirstSpawnedTankerBasket == nil and iniUnitTypeName == "A-4E-C" or
					playerFirstSpawnedTankerBasket == nil and iniUnitTypeName == "VSN_F4B" or						
					playerFirstSpawnedTankerBasket == nil and iniUnitTypeName == "JF-17" or					
					playerFirstSpawnedTankerBasket == nil and iniUnitTypeName == "Mirage-F1EE" or					
					playerFirstSpawnedTankerBasket == nil and iniUnitTypeName == "M-2000C" or					
					playerFirstSpawnedTankerBasket == nil and iniUnitTypeName == "AV8BNA" then					
						tti.debug("First Tanker Boom Fast Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnitTypeName .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if startTankerForRelevantAircraft == true then
							force_spawn_tanker_basket(true)
						end
						playerFirstSpawnedTankerBasket = true
					end
					
					if iniUnitTypeName == "Su-33" or			
					iniUnitTypeName == "Su-27" or			
					iniUnitTypeName == "J-11A" or			
					iniUnitTypeName == "Su-25" or			
					iniUnitTypeName == "Su-25T" or			
					iniUnitTypeName == "A-10A" or			
					iniUnitTypeName == "F-15C" or			
					iniUnitTypeName == "MiG-29S" or			
					iniUnitTypeName == "MiG-29A" or			
					iniUnitTypeName == "MiG-29G" then			
					tti.debug("First FC3 Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnitTypeName .. "]", showPlayerSpawnTypeDectionDebugMsgs)
					playerFirstSpawned_Fc3 = true
						if stop_atis_on_fc3_spawn == true and atis_on == true then
							stop_atis_main()			
							tti.debug("FC3 Player Spawn detected, stopping ATIS. You can manually turn on ATIS again via the F10 Menu.")
							trigger.action.outText("FC3 Player Spawn detected, attempting to stop ATIS, since FC3 cannot switch radios in-game. You can manually turn on ATIS again via the F10 Menu. (This might not work due to a bug!)\nIf you plan to co-op fly with FC3 pilots with Non-FC3 aircraft pilots, consider disabling ATIS altogether in the settings.", 25)
							--playerFirstSpawned_Fc3 = true
						end
					else
					tti.debug("First Non-FC3 Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnitTypeName .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if auto_start_atis == true then
							start_atis_auto_main()
							tti.debug("Non-FC3 Player Spawn detected, starting ATIS.")
						end
					end		
				end
			end
		end
	end
	else
	tti.debug("Spawned object is not a UNIT, skipping BIRTH EVENT handling")
	end
end
--]]

playerFirstSpawned_general = false
tti.debug("playerFirstSpawned_general is FALSE")

function tti.playerSpawn.eventHandlerPlayerBirth:onEvent(EventData) -- Parse World Events function.
	if EventData.id == world.event.S_EVENT_BIRTH then
		tti.serialize(EventData, "EventDataForPlayerBirth")
		local iniUnit = EventData.initiator or EventData.IniDCSUnit
		
	--if iniUnit:getCategory() == 1 then
	if Object.getCategory(iniUnit) == 1 then
		
		if iniUnit:getDesc() ~= nil then
			if not iniUnit:getPlayerName() and iniUnit:hasAttribute("Planes") == true then
				tti.debug("***** AI PLANE BIRTH EVENT HANDLING: " .. iniUnit:getGroup():getName() .. " has spawned into a(n): [" .. iniUnit:getTypeName() .. "]", false)
			end
			if iniUnit:getPlayerName() then		
				env.info("****PLAYER EVENT BIRTH EVENT CONFIRMED: ")
				
				--[[
				timer.scheduleFunction(function() --TTI MP ADD
					if playerFirstSpawned_general ~= true then
						scheduleReportsForAllActivePlayers()
						tti.debug("Running EWRS function scheduleReportsForAllActivePlayers()")
						tti.debug("playerFirstSpawned_general was false, but is now true. scheduleReportsForAllActivePlayers() should not be repeated from now on! (detected a player spawn)")
					end
				end, nil, timer.getTime() + 60  )
				
				timer.scheduleFunction(function() --TTI MP ADD
				if playerFirstSpawned_general ~= true then
						TTI_Menus.setupClients()
						tti.debug("Running TTI Menus Function TTI_Menus.setupClients()")
						tti.debug("playerFirstSpawned_general was false, but is now true. TTI_Menus.setupClients() should not be repeated from now on! (detected a player spawn)")
					end
				end, nil, timer.getTime() + 6  )
				--]]
				
						
				if playerFirstSpawned_general == false then
					--scheduleReportsForAllActivePlayers()
					--tti.debug("Running EWRS function scheduleReportsForAllActivePlayers()")
					--tti.debug("playerFirstSpawned_general was false, but is now true. scheduleReportsForAllActivePlayers() should not be repeated from now on! (detected a player spawn)")
					timer.scheduleFunction(function()
						TTI_Menus.setupClients()
						tti.debug("Running TTI Menus Function TTI_Menus.setupClients()")
						tti.debug("playerFirstSpawned_general was false, but is now true. TTI_Menus.setupClients() should not be repeated from now on! (detected a player spawn)")
					end, nil, timer.getTime() + 6  )	
				
					playerFirstSpawned_general = true
				end
			
				
					
				
				
				
				if iniUnit:hasAttribute("Planes") == true or iniUnit:hasAttribute("Helicopters") == true then
					tti.debug("***** PLAYER BIRTH EVENT HANDLING: " .. iniUnit:getPlayerName() .. " has spawned into a(n): [" .. iniUnit:getTypeName() .. "]", showPlayerSpawnTypeDectionDebugMsgs)
					
					if playerFirstSpawned_helo == nil and iniUnit:hasAttribute("Helicopters") == true then			
						tti.debug("First Helicopter Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnit:getTypeName() .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if enable_csar == true and csar_load_method == "onHeloSpawn" then
							timer.scheduleFunction(function()
								start_csar()
								tti.debug("First Helicopter Player Spawn detected, starting HELO CSAR SCRIPT")
							end, nil, timer.getTime() + 4)
						end
						if enable_ctld == true and ctld_load_method == "onHeloSpawn" then
							timer.scheduleFunction(function()
								start_ctld()
								tti.debug("First Helicopter Player Spawn detected, starting HELO CTLD SCRIPT")
							end, nil, timer.getTime() + 4)
						end
						playerFirstSpawned_helo = true
					end
					
					if iniUnit:hasAttribute("Helicopters") == true and trigger.misc.getUserFlag('START-CTLD') == 1 then
						-- Further logic for CTLD Helicopter handling
					end
					
					if playerFirstSpawned_su33 == nil and iniUnit:getTypeName() == "Su-33" and carrierOpsTheatre == true then			
						tti.debug("First Su-33 Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnit:getTypeName() .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if spawn_kuz_carrier_on_kuz_player_spawn == true then
							forceKuzSpawnOnPlayerSpawn()			
							tti.debug("First Su-33 Player Spawn detected, spawning Kuznetsov carrier", true)
						end	
						if su33_ai_traffic_start_on_su33_spawn == true then
							timer.scheduleFunction(function()
								forceSu33RatSpawnOnPlayerSpawn()
								tti.debug("First Su-33 Player Spawn detected, starting Su-33 RAT aircraft on Kuznetsov", true)
							end, nil, timer.getTime() + 4)
						end
						playerFirstSpawned_su33 = true
					end
					
					if playerFirstSpawned_av8b == nil and iniUnit:getTypeName() == "AV8BNA" and carrierOpsTheatre == true then					
						tti.debug("First AV-8B Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnit:getTypeName() .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if spawn_lha_carrier_on_lha_player_spawn == true then
							forceLhaSpawnOnPlayerSpawn()
							tti.debug("First AV-8B Player Spawn detected, spawning LHA-1 carrier", true)
						end
						if av8b_ai_traffic_start_on_av8b_spawn == true then
							timer.scheduleFunction(function()
								forceAv8bRatSpawnOnPlayerSpawn()
								tti.debug("First AV-8B Player Spawn detected, starting AV-8B RAT aircraft on LHA-1 Tarawa", true)
							end, nil, timer.getTime() + 4)
						end
						playerFirstSpawned_av8b = true
					end
					
					if iniUnit:getTypeName() == "Su-33" or			
					iniUnit:getTypeName() == "Su-27" or			
					iniUnit:getTypeName() == "J-11A" or			
					iniUnit:getTypeName() == "Su-25" or			
					iniUnit:getTypeName() == "Su-25T" or			
					iniUnit:getTypeName() == "A-10A" or			
					iniUnit:getTypeName() == "F-15C" or			
					iniUnit:getTypeName() == "MiG-29S" or			
					iniUnit:getTypeName() == "MiG-29A" or			
					iniUnit:getTypeName() == "MiG-29G" then			
					tti.debug("First FC3 Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnit:getTypeName() .. "]", showPlayerSpawnTypeDectionDebugMsgs)
					playerFirstSpawned_Fc3 = true
						if stop_atis_on_fc3_spawn == true and atis_on == true then
							stop_atis_main()			
							tti.debug("FC3 Player Spawn detected, stopping ATIS. You can manually turn on ATIS again via the F10 Menu.")
							trigger.action.outText("FC3 Player Spawn detected, attempting to stop ATIS, since FC3 cannot switch radios in-game. You can manually turn on ATIS again via the F10 Menu. (This might not work due to a bug!)\nIf you plan to co-op fly with FC3 pilots with Non-FC3 aircraft pilots, consider disabling ATIS altogether in the settings.", 25)
							--playerFirstSpawned_Fc3 = true
						end
					else
				--	tti.debug("First Non-FC3 Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnitTypeName .. "]", showPlayerSpawnTypeDectionDebugMsgs)
					--	if auto_start_atis == true then
					--		start_atis_auto_main()
					--		tti.debug("Non-FC3 Player Spawn detected, starting ATIS.")
					--	end
					end		
					
					if playerFirstSpawned_cvn == nil and (iniUnit:getTypeName() == "FA-18C_hornet" or
					iniUnit:getTypeName() == "VSN_F35C" or
					iniUnit:getTypeName() == "A-4E-C" or
					iniUnit:getTypeName() == "T-45" or
					iniUnit:getTypeName() == "VSN_F4B" or
					iniUnit:getTypeName() == "F-14A-135-GR" or
					iniUnit:getTypeName() == "F-14B") and 
					carrierOpsTheatre == true then
						timer.scheduleFunction(function()					
							tti.debug("First CVN Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnit:getTypeName() .. "]", showPlayerSpawnTypeDectionDebugMsgs)
							if spawn_cvn_carrier_on_cvn_player_spawn == true then
								forceCvnSpawnOnPlayerSpawn()					
							end
							if cvn_ai_traffic_start_on_cvn_spawn == true then
								timer.scheduleFunction(function()
									forceCvnRatSpawnOnPlayerSpawn()
								end, nil, timer.getTime() + 4)
							end
							if airboss_enable == true then
								timer.scheduleFunction(function()
									--startAirbossOnCvnSpawn()
									--trigger.action.setUserFlag('START-AIRBOSS', true)
								end, nil, timer.getTime() + 8)
							end
							playerFirstSpawned_cvn = true
						end, nil, timer.getTime() + 5)
					end
				
					
					
					-- TANKER SPAWNS BASED ON PLAYER SPAWN
					if playerFirstSpawnedTankerBoomSlow == nil and iniUnit:getTypeName() == "A-10A" or					
					playerFirstSpawnedTankerBoomSlow == nil and iniUnit:getTypeName() == "A-10C" or					
					playerFirstSpawnedTankerBoomSlow == nil and iniUnit:getTypeName() == "A-10C_2" then					
						tti.debug("First A-10 Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnit:getTypeName() .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if startTankerForRelevantAircraft == true then
							force_spawn_tanker_boom_slow(true)
						end
						playerFirstSpawnedTankerBoomSlow = true
					end
					
					if playerFirstSpawnedTankerBoomFast == nil and iniUnit:getTypeName() == "F-16C_50" or
					playerFirstSpawnedTankerBoomFast == nil and iniUnit:getTypeName() == "F-4E-45MC" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnit:getTypeName() == "VSN_F4C" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnit:getTypeName() == "F-22A" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnit:getTypeName() == "VSN_F35A" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnit:getTypeName() == "VSN_F35B" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnit:getTypeName() == "VSN_F35C" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnit:getTypeName() == "F-15C" or					
					playerFirstSpawnedTankerBoomFast == nil and iniUnit:getTypeName() == "F-15ESE" then					
						tti.debug("First Tanker Boom Fast Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnit:getTypeName() .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if startTankerForRelevantAircraft == true then
							force_spawn_tanker_boom_fast(true)
						end
						playerFirstSpawnedTankerBoomFast = true
					end
					
					if playerFirstSpawnedTankerBasket == nil and iniUnit:getTypeName() == "FA-18C_hornet" or
					playerFirstSpawnedTankerBasket == nil and iniUnit:getTypeName() == "F-14A-135-GR" or					
					playerFirstSpawnedTankerBasket == nil and iniUnit:getTypeName() == "F-14B" or					
					playerFirstSpawnedTankerBasket == nil and iniUnit:getTypeName() == "Su-33" or					
					playerFirstSpawnedTankerBasket == nil and iniUnit:getTypeName() == "A-4E-C" or
					playerFirstSpawnedTankerBasket == nil and iniUnit:getTypeName() == "VSN_F4B" or						
					playerFirstSpawnedTankerBasket == nil and iniUnit:getTypeName() == "JF-17" or					
					playerFirstSpawnedTankerBasket == nil and iniUnit:getTypeName() == "Mirage-F1EE" or					
					playerFirstSpawnedTankerBasket == nil and iniUnit:getTypeName() == "M-2000C" or					
					playerFirstSpawnedTankerBasket == nil and iniUnit:getTypeName() == "AV8BNA" then					
						tti.debug("First Tanker Boom Fast Player Spawn detected: [" .. iniUnit:getPlayerName() .. "] via: [" .. iniUnit:getTypeName() .. "]", showPlayerSpawnTypeDectionDebugMsgs)
						if startTankerForRelevantAircraft == true then
							force_spawn_tanker_basket(true)
						end
						playerFirstSpawnedTankerBasket = true
					end
					
				end
			end
		end
	end
	else
		tti.debug("Spawned object is not a UNIT, skipping BIRTH EVENT handling")
	end
end




---ZONES

arrayZoneMR = {
	{"MR1", "914", "MR1-Inside", false, "MR", 1, 1},
	{"MR2", "914", "MR2-Inside", false, "MR", 2, 2},
	{"MR3", "914", "MR3-Inside", false, "MR", 3, 3},
	{"MR4", "914", "MR4-Inside", false, "MR", 4, 4},
	{"MR5", "914", "MR5-Inside", false, "MR", 5, 5},
	{"MR6", "914", "MR6-Inside", false, "MR", 6, 6},
	{"MR7", "914", "MR7-Inside", false, "MR", 7, 7},
	{"MR8", "914", "MR8-Inside", false, "MR", 8, 8},
	{"MR9", "914", "MR9-Inside", false, "MR", 9, 9},
	{"MR10","914", "MR10-Inside",false, "MR", 10,10},
};

-- if env.mission.theatre ~= "Syria" then
arrayZoneAG = {
	{"AG1", "914", "AG1-Inside", false, "AG", 1, 11},
	{"AG2", "914", "AG2-Inside", false, "AG", 2, 12},
	{"AG3", "914", "AG3-Inside", false, "AG", 3, 13},
	{"AG4", "914", "AG4-Inside", false, "AG", 4, 14},
	{"AG5", "914", "AG5-Inside", false, "AG", 5, 15},
	{"AG6", "914", "AG6-Inside", false, "AG", 6, 16},
	{"AG7", "914", "AG7-Inside", false, "AG", 7, 17},
	{"AG8", "914", "AG8-Inside", false, "AG", 8, 18},
	{"AG9", "914", "AG9-Inside", false, "AG", 9, 19},
	{"AG10","914", "AG10-Inside",false, "AG", 10,20},
};
	-- else
	-- arrayZoneAG = {
		-- {"AG1", "914", "AG1-Inside", false, "AG", 1, 11},
		-- {"AG2", "914", "AG2-Inside", false, "AG", 2, 12},
		-- {"AG3", "914", "AG3-Inside", false, "AG", 3, 13},
		-- {"AG4", "914", "AG4-Inside", false, "AG", 4, 14},
		-- {"AG5", "914", "AG5-Inside", false, "AG", 5, 15},
		-- {"AG6", "914", "AG6-Inside", false, "AG", 6, 16},
		-- {"AG7", "914", "AG7-Inside", false, "AG", 7, 17},
		-- {"AG8", "914", "AG8-Inside", false, "AG", 8, 18},
		-- {"AG9", "914", "AG9-Inside", false, "AG", 9, 19},
		-- {"AG10","1829", "AG10-Inside",false, "AG", 10,20},
		-- env.info("TTI: Syria ground mission sizes defined")
	-- };
-- end

arrayZoneSEAD = {
	{"SEAD1", "914", "SEAD1-Inside", false, "SEAD", 1, 0},
	{"SEAD2", "914", "SEAD2-Inside", false, "SEAD", 2, 0},
	{"SEAD3", "914", "SEAD3-Inside", false, "SEAD", 3, 0},
	{"SEAD4", "914", "SEAD4-Inside", false, "SEAD", 4, 0},
	{"SEAD5", "914", "SEAD5-Inside", false, "SEAD", 5, 0},
	{"SEAD6", "914", "SEAD6-Inside", false, "SEAD", 6, 0},
	{"SEAD7", "914", "SEAD7-Inside", false, "SEAD", 7, 0},
	{"SEAD8", "914", "SEAD8-Inside", false, "SEAD", 8, 0},
	{"SEAD9", "914", "SEAD9-Inside", false, "SEAD", 9, 0},
	{"SEAD10","914", "SEAD10-Inside",false, "SEAD", 10,0},
};

arrayZoneAGH = {
	{"AGH1", "914", "AGH1-Inside", false, "AGH", 1, 21},
	{"AGH2", "914", "AGH2-Inside", false, "AGH", 2, 22},
	{"AGH3", "914", "AGH3-Inside", false, "AGH", 3, 23},
	{"AGH4", "914", "AGH4-Inside", false, "AGH", 4, 24},
	{"AGH5", "914", "AGH5-Inside", false, "AGH", 5, 25},
	{"AGH6", "914", "AGH6-Inside", false, "AGH", 6, 26},
	{"AGH7", "914", "AGH7-Inside", false, "AGH", 7, 27},
	{"AGH8", "914", "AGH8-Inside", false, "AGH", 8, 28},
	{"AGH9", "914", "AGH9-Inside", false, "AGH", 9, 29},
	{"AGH10","914", "AGH10-Inside",false, "AGH", 10, 30},

};

arrayZoneINFAS = {
	{"INFAS1", "914", "INFAS1-Inside", false, "INF", 1, 31},
	{"INFAS2", "914", "INFAS2-Inside", false, "INF", 2, 32},
	{"INFAS3", "914", "INFAS3-Inside", false, "INF", 3, 33},
	{"INFAS4", "914", "INFAS4-Inside", false, "INF", 4, 34},
	{"INFAS5", "914", "INFAS5-Inside", false, "INF", 5, 35},
	{"INFAS6", "914", "INFAS6-Inside", false, "INF", 6, 36},
	{"INFAS7", "914", "INFAS7-Inside", false, "INF", 7, 37},
	{"INFAS8", "914", "INFAS8-Inside", false, "INF", 8, 38},
	{"INFAS9", "914", "INFAS9-Inside", false, "INF", 9, 39},
	{"INFAS10","914", "INFAS10-Inside",false, "INF", 10, 40},
};

arrayZoneASS = {
	{"ASS1", "3000", "ASS1-Inside", false, "AS", 1, 0},
	{"ASS2", "3000", "ASS2-Inside", false, "AS", 2, 0},
	{"ASS3", "3000", "ASS3-Inside", false, "AS", 3, 0},
	{"ASS4", "3000", "ASS4-Inside", false, "AS", 4, 0},
	{"ASS5", "3000", "ASS5-Inside", false, "AS", 5, 0},
};

allow_mr_agl_search = true
allow_ag_agl_search = true
allow_agh_agl_search = true
allow_inf_agl_search = true

unitCountThreshold_main = groundMissionUnitThreshold
unitCountThreshold_inf = groundMissionInfantryThreshold
unitCountThreshold_as = shipMissionUnitThreshold

detectionDebugMessages = false
main_detection_time = 30


missionGroups_MR = {}
missionGroups_AG = {}
missionGroups_SEAD = {}
missionGroups_AGH = {}
missionGroups_INF = {}
missionGroups_AS = {}
missionGroups_CONVOY = {}
missionGroups_SHIPCONVOY = {}


function addMissionAcceptMenu(missionType)

	if singleRandomMissionModeEnabled == true and missionType == "SM" then 

		if a2g_easy_smm_enable == true then
		mrMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2G Easy]", missionAcceptMenuRoot, mr_text_start_auto,{})
		end

		if a2g_hard_smm_enable == true then
		agMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2G Hard]", missionAcceptMenuRoot, a2g_hard_initialize_spawn,{})
		end

		if a2g_sead_smm_enable == true then
		seadMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2G SEAD]", missionAcceptMenuRoot, a2g_sead_initialize_spawn,{})
		end

		if a2g_helo_smm_enable == true then
		aghMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2G Helo]", missionAcceptMenuRoot, a2g_helo_initialize_spawn,{})
		end
		if a2g_inf_smm_enable == true then
		infMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2G Infantry]", missionAcceptMenuRoot, a2g_infas_initialize_spawn,{})
		end
		if a2g_convoy_smm_enable == true then
		convMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2G Convoy]", missionAcceptMenuRoot, a2g_convoy_initialize_spawn,{})
		end
		if a2g_ship_convoy_smm_enable == true and carrierOpsTheatre == true then
		asconvMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2S Ship Convoy]", missionAcceptMenuRoot, a2g_ship_convoy_initialize_spawn,{})
		end
	
		if a2g_as_smm_enable == true then
		asMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: Anti-Ship]", missionAcceptMenuRoot, a2g_as_initialize_spawn,{})
		end
		
		smMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: RANDOM]", missionAcceptMenuRoot, startSingleRandomMission,{})
		
		trigger.action.outText( "<< Next Single Mission awaiting [MISSION ACCEPT] Authorization in the F10 - Other Menu", 30)

	else
	
		if missionType == "MR" then
			trigger.action.outText( "<< A2G Easy Mission Awaiting [MISSION ACCEPT] Authorization in the F10 - Other Menu", 30)
			mrMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2G Easy]", missionAcceptMenuRoot, mr_text_start_auto,{})
		elseif missionType == "AG" then
			trigger.action.outText( "<< A2G Hard Mission Awaiting [MISSION ACCEPT] Authorization in the F10 - Other Menu", 30)
			agMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2G Hard]", missionAcceptMenuRoot, a2gj_text_start_auto,{})
		elseif missionType == "AGH" then
			trigger.action.outText( "<< A2G Helo Mission Awaiting [MISSION ACCEPT] Authorization in the F10 - Other Menu", 30)
			aghMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2G Helo]", missionAcceptMenuRoot, a2gh_text_start_auto,{})
		elseif missionType == "INF" then
			trigger.action.outText( "<< A2G Infantry Assault Mission Awaiting [MISSION ACCEPT] Authorization in the F10 - Other Menu", 30)
			infMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2G Infantry Assault]", missionAcceptMenuRoot, mr_text_start_auto,{})
		elseif missionType == "ASS" then
			trigger.action.outText( "<< Anti-Ship Mission Awaiting [MISSION ACCEPT] Authorization in the F10 - Other Menu", 30)
			asMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: Anti-Ship]", missionAcceptMenuRoot, a2gas_text_start_auto,{})
		--elseif missionType == "SAM"
			--mrMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: <<<A2G SAM>>]", missionAcceptMenuRoot, mr_text_start_auto,{})
		elseif missionType == "SEAD" then
			trigger.action.outText( "<< A2G SEAD Mission Awaiting [MISSION ACCEPT] Authorization in the F10 - Other Menu", 30)
			seadMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2G SEAD]", missionAcceptMenuRoot, a2gsead_text_start_auto,{})
		elseif missionType == "CONV" then
			trigger.action.outText( "<< Convoy Mission Awaiting [MISSION ACCEPT] Authorization in the F10 - Other Menu", 30)
			convMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: A2G Convoy]", missionAcceptMenuRoot, random_convoy_start,{})
		elseif missionType == "SHIPCONV" then
			trigger.action.outText( "<< Ship Convoy Mission Awaiting [MISSION ACCEPT] Authorization in the F10 - Other Menu", 30)
			convMissionAcceptMenuRoot = missionCommands.addCommand("[ACCEPT NEXT MISSION: Ship Convoy]", missionAcceptMenuRoot, random_ship_convoy_start,{})
		end
	
	end
	trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
end

missionAcceptVariableList = {
    "mrMissionAcceptMenuRoot",
    "agMissionAcceptMenuRoot",
    "asMissionAcceptMenuRoot",
    "aghMissionAcceptMenuRoot",
    "infMissionAcceptMenuRoot",
    "seadMissionAcceptMenuRoot",
    "convMissionAcceptMenuRoot",
    "smMissionAcceptMenuRoot",
}

function removeRandomMissionMenuAcceptList()
    -- Iterate over each variable name in the list
    for _, varName in ipairs(missionAcceptVariableList) do
        -- Check if the global variable with that name exists
        if _G[varName] then
            -- Remove the item using missionCommands.removeItem()
            missionCommands.removeItem(_G[varName])
            -- Debug message indicating which variable was removed
            tti.debug("Removing Mission Accept Menu Item: " .. varName)
        else
            -- Debug message indicating that the variable was not found
            tti.debug("Variable not found: " .. varName)
        end
    end
end


function main_detection_mr()
	timer.scheduleFunction(main_detection_mr, {}, timer.getTime() + main_detection_time )  
		--tti.serialize(missionGroups_MR, "missionGroups_MR: ")
		currentCountMR = 0
		
		for i = 1,#arrayZoneMR,1 do
			if arrayZoneMR[i][4] == true then
				--currentMR_aliveGroups = tti.tableFilter(missionGroups_MR, function(group) return group:IsAlive() end)
				local aliveGroups = tti.tableFilter(missionGroups_MR, function(group) return group:IsAlive() end)
				local unitCount = tti.getGroupsUnitCount(aliveGroups)
			
			if unitCount <= unitCountThreshold_main then
				tti.debug("Unit Threshold of [".. unitCountThreshold_main .."] units at " .. arrayZoneMR[i][1] .." reached, destroying last units!")
				for _, group in pairs(aliveGroups) do
					group:Destroy()
				end
				aliveGroups = {}
				--currentMR_aliveGroups = {}
			end
			
			missionGroups_MR.unitCount = unitCount
			currentCountMR = unitCount
			
			if #aliveGroups == 0 then
				if mrMissionsCompleted == false then
					trigger.action.outText( "<< A2G Easy Mission: \""..EasyMissionName.."\" complete! >>", 10)
				else
					trigger.action.outText( "<< A2G Easy Mission: \""..EasyMissionName.."\" complete! >> \n << ALL A2G Easy Missions Completed! Mission Sequence Reset! >>", 30)
					mrMissionsCompleted = true
					mrMissionsCompletedCount = 0
				end
				trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
				remove_mr_markers(arrayZoneMR[i][6])
				destroy_MR_jtacs()
				trigger.action.setUserFlag('MR-STARTING', false)	
				trigger.action.setUserFlag(arrayZoneMR[i][3], false)	
				arrayZoneMR[i][4] = false
				missionGroups_MR = {}
				
---- mission sequence script start
				
				if a2g_easy_autostart == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("MR")
					else
						mr_text_start_auto()
					end
				end
				if singleRandomMissionModeEnabled == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("SM")
					else
						startSingleRandomMission()
						tti.debug("Starting Single Random Mission...")
					end				
				end
---- mission sequence script end
				
			else
				trigger.action.setUserFlag(arrayZoneMR[i][3],true)
				tti.debug("Detecting active Mission: [" .. arrayZoneMR[i][1] .. "], [" .. unitCount .. "] units remain, threshold is set to [" .. unitCountThreshold_main .. "]", detectionDebugMessages)
			end
			
		end
	end
end

function force_remove_mr()
	for i = 1,#arrayZoneMR,1 do
		if arrayZoneMR[i][4] == true then
				--currentMR_aliveGroups = tti.tableFilter(missionGroups_MR, function(group) return group:IsAlive() end)
			local aliveGroups = tti.tableFilter(missionGroups_MR, function(group) return group:IsAlive() end)
			local unitCount = tti.getGroupsUnitCount(aliveGroups)
			
			for _, group in pairs(aliveGroups) do
				group:Destroy()
			end
		
		trigger.action.outText("A2G Easy Mission is now being manually removed...", 10)
		
		end	
	end
end


function main_detection_ag()
timer.scheduleFunction(main_detection_ag, {}, timer.getTime() + main_detection_time ) 
	currentCountAG = 0
			for i = 1,#arrayZoneAG,1 do
			if arrayZoneAG[i][4] == true then
				--currentAG_aliveGroups = tti.tableFilter(missionGroups_AG, function(group) return group:IsAlive() end)
				--tti.serialize(currentMR_aliveGroups, "CurrentMR")
				local aliveGroups = tti.tableFilter(missionGroups_AG, function(group) return group:IsAlive() end)
				local unitCount = tti.getGroupsUnitCount(aliveGroups)
			
			if unitCount <= unitCountThreshold_main then
				tti.debug("Unit Threshold of [".. unitCountThreshold_main .."] units at " .. arrayZoneAG[i][1] .." reached, destroying last units!")
				for _, group in pairs(aliveGroups) do
					group:Destroy()
				end
				aliveGroups = {}
				--currentAG_aliveGroups = {}
			end
			
			missionGroups_AG.unitCount = unitCount
			currentCountAG = unitCount
			
			if #aliveGroups == 0 then
				trigger.action.outText( "<< A2G Hard Mission: \""..HardMissionName.."\" complete! >>", 10)
				trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg")
				remove_ag_markers(arrayZoneAG[i][6])
				destroy_AG_jtacs()
				trigger.action.setUserFlag('AG-STARTING', false)					
				trigger.action.setUserFlag(arrayZoneAG[i][3], false)
				arrayZoneAG[i][4] = false
				missionGroups_AG = {}
				
---- mission sequence script start
				
				if a2g_hard_autostart == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("AG")
					else
						a2gj_text_start_auto()
					end
				end
				if singleRandomMissionModeEnabled == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("SM")
					else
						startSingleRandomMission()
						tti.debug("Starting Single Random Mission...")
					end				
				end
---- mission sequence script end

			else
				trigger.action.setUserFlag(arrayZoneAG[i][3],true)
				tti.debug("Detecting active Mission: [" .. arrayZoneAG[i][1] .. "], [" .. unitCount .. "] units remain, threshold is set to [" .. unitCountThreshold_main .. "]", detectionDebugMessages)
			end
		end
	end
end

function force_remove_ag()
	for i = 1,#arrayZoneAG,1 do
		if arrayZoneAG[i][4] == true then
				--currentMR_aliveGroups = tti.tableFilter(missionGroups_MR, function(group) return group:IsAlive() end)
			local aliveGroups = tti.tableFilter(missionGroups_AG, function(group) return group:IsAlive() end)
			local unitCount = tti.getGroupsUnitCount(aliveGroups)
			
			for _, group in pairs(aliveGroups) do
				group:Destroy()
			end
		
		trigger.action.outText("A2G Hard Mission is now being manually removed...", 10)
		
		end	
	end
end

function main_detection_sead()
timer.scheduleFunction(main_detection_sead, {}, timer.getTime() + main_detection_time ) 
	currentCountSEAD = 0
			for i = 1,#arrayZoneSEAD,1 do
			if arrayZoneSEAD[i][4] == true then
				--currentAG_aliveGroups = tti.tableFilter(missionGroups_SEAD, function(group) return group:IsAlive() end)
				--tti.serialize(currentMR_aliveGroups, "CurrentMR")
				local aliveGroups = tti.tableFilter(missionGroups_SEAD, function(group) return group:IsAlive() end)
				local unitCount = tti.getGroupsUnitCount(aliveGroups)
			
			if unitCount <= unitCountThreshold_main then
				tti.debug("Unit Threshold of [".. unitCountThreshold_main .."] units at " .. arrayZoneSEAD[i][1] .." reached, destroying last units!")
				for _, group in pairs(aliveGroups) do
					group:Destroy()
				end
				aliveGroups = {}
				--currentAG_aliveGroups = {}
			end
			
			missionGroups_SEAD.unitCount = unitCount
			currentCountSEAD = unitCount
			
			if #aliveGroups == 0 then
				trigger.action.outText( "<< A2G SEAD Mission: \""..SeadMissionName.."\" complete! >>", 10)
				trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg")
				remove_sead_markers(arrayZoneSEAD[i][6])
				destroy_SEAD_jtacs()
				trigger.action.setUserFlag('SEAD-STARTING', false)					
				trigger.action.setUserFlag(arrayZoneSEAD[i][3], false)
				arrayZoneSEAD[i][4] = false
				missionGroups_SEAD = {}
				
---- mission sequence script start
				
				if a2g_sead_autostart == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("SEAD")
					else
						a2gsead_text_start_auto()
					end
				end
				if singleRandomMissionModeEnabled == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("SM")
					else
						startSingleRandomMission()
						tti.debug("Starting Single Random Mission...")
					end				
				end
---- mission sequence script end
				

			else
				trigger.action.setUserFlag(arrayZoneSEAD[i][3],true)
				tti.debug("Detecting active Mission: [" .. arrayZoneSEAD[i][1] .. "], [" .. unitCount .. "] units remain, threshold is set to [" .. unitCountThreshold_main .. "]", detectionDebugMessages)
			end
		end
	end
end

function force_remove_sead()
	for i = 1,#arrayZoneSEAD,1 do
		if arrayZoneSEAD[i][4] == true then
				--currentMR_aliveGroups = tti.tableFilter(missionGroups_MR, function(group) return group:IsAlive() end)
			local aliveGroups = tti.tableFilter(missionGroups_SEAD, function(group) return group:IsAlive() end)
			local unitCount = tti.getGroupsUnitCount(aliveGroups)
			
			for _, group in pairs(aliveGroups) do
				group:Destroy()
			end
		
		trigger.action.outText("A2G Sead Mission is now being manually removed...", 10)
		
		end	
	end
end

function main_detection_agh()
timer.scheduleFunction(main_detection_agh, {}, timer.getTime() + main_detection_time ) 
	currentCountAGH = 0
			for i = 1,#arrayZoneAGH,1 do
			if arrayZoneAGH[i][4] == true then
				--currentAGH_aliveGroups = tti.tableFilter(missionGroups_AGH, function(group) return group:IsAlive() end)
				local aliveGroups = tti.tableFilter(missionGroups_AGH, function(group) return group:IsAlive() end)
				local unitCount = tti.getGroupsUnitCount(aliveGroups)
			
			if unitCount <= unitCountThreshold_main then
				tti.debug("Unit Threshold of [".. unitCountThreshold_main .."] units at " .. arrayZoneAGH[i][1] .." reached, destroying last units!")
				for _, group in pairs(aliveGroups) do
					group:Destroy()
				end
				aliveGroups = {}
				--currentAGH_aliveGroups = {}
			end
			
			missionGroups_AGH.unitCount = unitCount
			currentCountAGH = unitCount
			
			if #aliveGroups == 0 then
				trigger.action.outText( "<< A2G Helo Mission: \""..HeloMissionName.."\" complete! >>", 10)
				trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg")
				remove_agh_markers(arrayZoneAGH[i][6])
				destroy_AGH_jtacs()
				trigger.action.setUserFlag(arrayZoneAGH[i][3], false)					
				trigger.action.setUserFlag('AGH-STARTING', false)
				arrayZoneAGH[i][4] = false
				missionGroups_AGH = {}
				
---- mission sequence script start
				
				if a2g_helo_autostart == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("AGH")
					else
						a2gh_text_start_auto()
					end
				end
				if singleRandomMissionModeEnabled == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("SM")	
					else
						startSingleRandomMission()
						tti.debug("Starting Single Random Mission...")
					end				
				end
---- mission sequence script end
				

			else
				trigger.action.setUserFlag(arrayZoneAGH[i][3],true)
				tti.debug("Detecting active Mission: [" .. arrayZoneAGH[i][1] .. "], [" .. unitCount .. "] units remain, threshold is set to [" .. unitCountThreshold_main .. "]", detectionDebugMessages)
			end

		end
	end
end

function force_remove_helo()
	for i = 1,#arrayZoneAGH,1 do
		if arrayZoneAGH[i][4] == true then
				--currentMR_aliveGroups = tti.tableFilter(missionGroups_MR, function(group) return group:IsAlive() end)
			local aliveGroups = tti.tableFilter(missionGroups_AGH, function(group) return group:IsAlive() end)
			local unitCount = tti.getGroupsUnitCount(aliveGroups)
			
			for _, group in pairs(aliveGroups) do
				group:Destroy()
			end
		
		trigger.action.outText("A2G Helo Mission is now being manually removed...", 10)
		
		end	
	end
end

function main_detection_inf()
timer.scheduleFunction(main_detection_inf, {}, timer.getTime() + main_detection_time )  
	currentCountAGHIA = 0
			for i = 1,#arrayZoneINFAS,1 do
			if arrayZoneINFAS[i][4] == true then
				--currentAGHIA_aliveGroups = tti.tableFilter(missionGroups_INF, function(group) return group:IsAlive() end)
				local aliveGroups = tti.tableFilter(missionGroups_INF, function(group) return group:IsAlive() end)
				local unitCount = tti.getGroupsUnitCount(aliveGroups)
				
			if unitCount <= unitCountThreshold_inf then
				tti.debug("Unit Threshold of [".. unitCountThreshold_inf .."] units at " .. arrayZoneINFAS[i][1] .." reached, destroying last units!")
				for _, group in pairs(aliveGroups) do
					group:Destroy()
				end
				aliveGroups = {}
				--currentAGHIA_aliveGroups = {}
			end
			
			missionGroups_INF.unitCount = unitCount
			currentCountAGHIA = unitCount
			
			if #aliveGroups == 0 then
				trigger.action.outText( "<< Infantry Assault Mission: \""..InfMissionName.."\" complete! >>", 10)
				trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg")
				remove_inf_markers(arrayZoneINFAS[i][6])
				destroy_INF_jtacs()
				trigger.action.setUserFlag(arrayZoneINFAS[i][3], false)					
				trigger.action.setUserFlag('AGHIA-STARTING', false)	
				arrayZoneINFAS[i][4] = false
				missionGroups_INF = {}
				
---- mission sequence script start
				
				if a2g_helo_inf_autostart == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("INF")
					else
						a2gia_text_start_auto()
					end
				end
				if singleRandomMissionModeEnabled == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("SM")
					else
						startSingleRandomMission()
						tti.debug("Starting Single Random Mission...")
					end				
				end
---- mission sequence script end
				
			else
				trigger.action.setUserFlag(arrayZoneINFAS[i][3],true)
				tti.debug("Detecting active Mission: [" .. arrayZoneINFAS[i][1] .. "], [" .. unitCount .. "] units remain, threshold is set to [" .. unitCountThreshold_inf .. "]", detectionDebugMessages)
			end
		end
	end
end

function force_remove_inf()
	for i = 1,#arrayZoneINFAS,1 do
		if arrayZoneINFAS[i][4] == true then
				--currentMR_aliveGroups = tti.tableFilter(missionGroups_MR, function(group) return group:IsAlive() end)
			local aliveGroups = tti.tableFilter(missionGroups_INF, function(group) return group:IsAlive() end)
			local unitCount = tti.getGroupsUnitCount(aliveGroups)
			
			for _, group in pairs(aliveGroups) do
				group:Destroy()
			end
		
		trigger.action.outText("A2G Infantry Mission is now being manually removed...", 10)
		
		end	
	end
end

function main_detection_as()
timer.scheduleFunction(main_detection_as, {}, timer.getTime() + main_detection_time )  
	currentCountAS = 0
	if carrierOpsTheatre == true then
		for i = 1,#arrayZoneASS,1 do
			if arrayZoneASS[i][4] == true then
				local aliveGroups = tti.tableFilter(missionGroups_AS, function(group) return group:IsAlive() end)
				local unitCount = tti.getGroupsUnitCount(aliveGroups)
			
			if unitCount <= unitCountThreshold_as then
				tti.debug("Unit Threshold of [".. unitCountThreshold_as .."] units at " .. arrayZoneASS[i][1] .." reached, destroying last units!")
				for _, group in pairs(aliveGroups) do
					group:Destroy()
				end
				aliveGroups = {}
			end
			
			missionGroups_AS.unitCount = unitCount
			currentCountAS = unitCount
			
			if #aliveGroups == 0 then
				trigger.action.outText( "<< Anti-Ship Mission: \""..ShipMissionName.."\" complete! >>", 10)
				trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg")
				remove_as_markers(arrayZoneASS[i][6])							
				trigger.action.setUserFlag(arrayZoneASS[i][3], false)				
				trigger.action.setUserFlag('AS-STARTING', false)
				arrayZoneASS[i][4] = false
				missionGroups_AS = {}
				
---- mission sequence script start
				
				if antiship_autostart == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("AS")
					else
						a2gas_text_start_auto()
					end
				end
				if singleRandomMissionModeEnabled == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("SM")
					else
						startSingleRandomMission()
						tti.debug("Starting Single Random Mission...")
					end				
				end
---- mission sequence script end
				
			else
				trigger.action.setUserFlag(arrayZoneASS[i][3],true)
				tti.debug("Detecting active Mission: [" .. arrayZoneASS[i][1] .. "], [" .. unitCount .. "] units remain, threshold is set to [" .. unitCountThreshold_as .. "]", detectionDebugMessages)
			end
			
			end
		end
	end
end

function force_remove_as()
	if carrierOpsTheatre == true then
	for i = 1,#arrayZoneASS,1 do
		if arrayZoneASS[i][4] == true then
				--currentMR_aliveGroups = tti.tableFilter(missionGroups_MR, function(group) return group:IsAlive() end)
			local aliveGroups = tti.tableFilter(missionGroups_AS, function(group) return group:IsAlive() end)
			local unitCount = tti.getGroupsUnitCount(aliveGroups)
			
			for _, group in pairs(aliveGroups) do
				group:Destroy()
			end
		
		trigger.action.outText("Anti-Ship Mission is now being manually removed...", 10)
		
		end	
	end
end
end

function main_detection_convoy()
dectection_convoy_function_loop = timer.scheduleFunction(main_detection_convoy, {}, timer.getTime() + main_detection_time )

	local aliveGroups = tti.tableFilter(missionGroups_CONVOY, function(group) return group:IsAlive() end)
	local unitCount = tti.getGroupsUnitCount(aliveGroups)
	
		if unitCount <= 0 then
			tti.debug("Unit Threshold of [".. 0 .."] units at " .. "convoy mission" .. " reached, destroying last units!")
		for _, group in pairs(aliveGroups) do
			group:Destroy()
		end
			aliveGroups = {}
		end
		
			missionGroups_CONVOY.unitCount = unitCount
			currentCountCONVOY = unitCount
			
		if #aliveGroups == 0 then	
			Convoy_alive = false
			env.info("TTI: " .. "Convoy" .." group is destroyed!")
			missionGroups_CONVOY = {}
			
---- mission sequence script start
				
				if convoy_missions_autostart == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("CONV")
					else
						random_convoy_start()
					end
				end
				if singleRandomMissionModeEnabled == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("SM")
					else
						startSingleRandomMission()
						tti.debug("Starting Single Random Mission...")
					end				
				end
---- mission sequence script end
			
			trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
			trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
			
			if cnv_id[1] ~= nil then
				trigger.action.removeMark(cnv_id[1])
			end
			if cnv_text_id[1] ~= nil and cnv_circle_id[1] ~= nil then
				trigger.action.removeMark(cnv_circle_id[1])
				trigger.action.removeMark(cnv_text_id[1])
			end
			trigger.action.setUserFlag('CONVOY-STARTING', false)
			timer.removeFunction(dectection_convoy_function_loop)

		else
			Convoy_alive = true
			tti.debug("Detecting active Mission: [" .. "Convoy Mission" .. "], [" .. unitCount .. "] units remain, threshold is set to [" .. 0 .. "]", detectionDebugMessages)
		end
end

function main_detection_ship_convoy()
dectection_ship_convoy_function_loop = timer.scheduleFunction(main_detection_ship_convoy, {}, timer.getTime() + main_detection_time )

	local aliveGroups = tti.tableFilter(missionGroups_SHIPCONVOY, function(group) return group:IsAlive() end)
	local unitCount = tti.getGroupsUnitCount(aliveGroups)
	
		if unitCount <= 0 then
			tti.debug("Unit Threshold of [".. 0 .."] units at " .. "ship convoy mission" .. " reached, destroying last units!")
		for _, group in pairs(aliveGroups) do
			group:Destroy()
		end
			aliveGroups = {}
		end
		
			missionGroups_SHIPCONVOY.unitCount = unitCount
			currentCountSHIPCONVOY = unitCount
			
		if #aliveGroups == 0 then	
			Ship_Convoy_alive = false
			env.info("TTI: " .. "Ship Convoy" .." group is destroyed!")
			missionGroups_SHIPCONVOY = {}
			
---- mission sequence script start
				
				if ship_convoy_missions_autostart == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("SHIPCONV")
					else
						random_ship_convoy_start()
					end
				end
				if singleRandomMissionModeEnabled == true then
					if enableAcceptNextMissionMenu == true then
						addMissionAcceptMenu("SM")
					else
						startSingleRandomMission()
						tti.debug("Starting Single Random Mission...")
					end				
				end
---- mission sequence script end
			
			trigger.action.outText( "<< Ship Convoy Hunt Mission: \""..ShipConvoyMissionName.."\" complete! >>", 10)
			trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
			if ship_cnv_id[1] ~= nil then
				trigger.action.removeMark(ship_cnv_id[1])
			end
			if ship_cnv_text_id[1] ~= nil and ship_cnv_circle_id[1] ~= nil then
				trigger.action.removeMark(ship_cnv_circle_id[1])
				trigger.action.removeMark(ship_cnv_text_id[1])
			end
			trigger.action.setUserFlag('SHIP-CONVOY-STARTING', false)

			timer.removeFunction(dectection_ship_convoy_function_loop)
				if singleRandomMissionModeEnabled == true then
					startSingleRandomMission()
					tti.debug("Starting Single Random Mission...")
				end
		else
			Ship_Convoy_alive = true
			tti.debug("Detecting active Mission: [" .. "Ship Convoy Mission" .. "], [" .. unitCount .. "] units remain, threshold is set to [" .. 0 .. "]", detectionDebugMessages)
		end
end

function deployActiveMissionZoneSmokeFlare()
	for i = 1,#arrayZoneMR,1
	do
	if arrayZoneMR[i][4] == true then
		_zone = trigger.misc.getZone(arrayZoneMR[i][1])
		_zone.point = mist.utils.makeVec3GL(_zone.point)
		trigger.action.smoke(_zone.point, 3)
		trigger.action.signalFlare(_zone.point, 1, 0 )	
	end
	end
	
	for i = 1,#arrayZoneAG,1
	do
	if arrayZoneAG[i][4] == true then
		_zone = trigger.misc.getZone(arrayZoneAG[i][1])
		_zone.point = mist.utils.makeVec3GL(_zone.point)
		trigger.action.smoke(_zone.point, 3)
		trigger.action.signalFlare(_zone.point, 1, 0 )	
	end
	end
	
	for i = 1,#arrayZoneAGH,1
	do
	if arrayZoneAGH[i][4] == true then
		_zone = trigger.misc.getZone(arrayZoneAGH[i][1])
		_zone.point = mist.utils.makeVec3GL(_zone.point)
		trigger.action.smoke(_zone.point, 3)
		trigger.action.signalFlare(_zone.point, 1, 0 )	
	end
	end
	
	for i = 1,#arrayZoneINFAS,1
	do
	if arrayZoneINFAS[i][4] == true then
		_zone = trigger.misc.getZone(arrayZoneINFAS[i][1])
		_zone.point = mist.utils.makeVec3GL(_zone.point)
		trigger.action.smoke(_zone.point, 3)
		trigger.action.signalFlare(_zone.point, 1, 0 )
	end
	end
	
	trigger.action.outText( "---> SMOKE/FLARES DEPLOYED AT ALL ACTIVE A2G ZONES.", 8)
end

convoyFlareLoopTime = 20

function convoy_flare_loop_start()
convoy_flare_loop_timer_start = timer.scheduleFunction(convoy_flare_loop_start, {}, timer.getTime() + 1 )
convoy_flares_are_deploying = true
ConvoyZone_coord:FlareRed()
tti.debug("Ground Convoy Flare Loop STARTED!")
end

function deployActiveGroundConvoyFlares()
	if Convoy_alive == true then
		create_convoy_marker()
		if ConvoyZone_coord ~= nil and convoy_flares_are_deploying ~= true then
			trigger.action.outText( "---> FLARES DEPLOYED NEAR ACTIVE ENEMY CONVOY.", 8)
			convoy_flare_loop_start()
			timer.scheduleFunction(function()
				timer.removeFunction(convoy_flare_loop_timer_start)
				convoy_flares_are_deploying = false
				tti.debug("Ground Convoy Flare Loop STOPPED!")
			end, nil, timer.getTime() + convoyFlareLoopTime  )
			
		else
			tti.debug( "ERROR: Unable to deploy Convoy Flares, COORD is missing!",true)
		end
	else
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg")
		trigger.action.outText( "---> UNABLE TO DEPLOY FLARES. NO CONVOY MISSION ACTIVE.", 8)
	end
end

function convoy_ship_flare_loop_start()
convoy_ship_flare_loop_timer_start = timer.scheduleFunction(convoy_ship_flare_loop_start, {}, timer.getTime() + 1 )
convoy_ship_flares_are_deploying = true
ShipConvoyZone_coord:FlareRed()
tti.debug("Ship Convoy Flare Loop STARTED!")
end

function deployActiveShipConvoyFlares()
	if Ship_Convoy_alive == true then
		auto_update_ship_convoy_marker()
		if ShipConvoyZone_coord ~= nil and convoy_ship_flares_are_deploying ~= true then
			trigger.action.outText( "---> FLARES DEPLOYED NEAR ACTIVE ENEMY SHIP CONVOY.", 8)
			convoy_ship_flare_loop_start()
			timer.scheduleFunction(function()
				timer.removeFunction(convoy_ship_flare_loop_timer_start)
				convoy_ship_flares_are_deploying = false
				tti.debug("Ship Convoy Flare Loop STOPPED!")
			end, nil, timer.getTime() + convoyFlareLoopTime  )
			
		else
			tti.debug( "ERROR: Unable to deploy SHIP Convoy Flares, COORD is missing!",true)
		end
	else
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg")
		trigger.action.outText( "---> UNABLE TO DEPLOY FLARES. NO SHIP CONVOY MISSION ACTIVE.", 8)
	end
end

minSpawnHeight = -20 --for floatingRedGroundUnitCheck() to delete anything below this spawn height
function floatingRedGroundUnitCheck()

if remove_ground_units_on_buildings == true then
	for i = 1,#arrayZoneMR,1 do
		if arrayZoneMR[i][4] == true then
			
			
			_zone = trigger.misc.getZone(arrayZoneMR[i][1])
			_zone.point = mist.utils.makeVec3GL(_zone.point)
			_zone.point.y = _zone.point.y + 1 -- offset center by 10KM
			_volume = {
				id = world.VolumeType.SPHERE,
				params = {
					point = _zone.point, 
					radius = arrayZoneMR[i][2]  -- radius in meters from the size of the zone
				}
			}
			_foundRed = false
			_foundBlue = true
			_search = function(_unit, _coa)
				pcall(function()        

						unitGroup = _unit:getGroup()
						unitGroupName = _unit:getName()
						pos = _unit:getPosition().p
						height = pos.y - land.getHeight({ x= pos.x, y = pos.z})
						--unitGroupNameMoose = GROUP.FindByName(unitGroupName)
						--table.insert(missionGroups_MR, unitGroupName)
						
						if height > maxSpawnHeight  or height < minSpawnHeight then
							if _unit ~= nil	and _unit:isExist() and  _unit:isActive() and _unit:getLife() > 0 and unitGroup:getCategory() == 2 and _unit:getCoalition() == 1 then
								if show_delete_unit_above_ground_msg == true then
									trigger.action.outText( "TTI: Destroying group above ground: ".. unitGroupName .. " AGL: ".. round(height,3), 10)
								end
								env.info( "TTI: Destroying group above ground: ".. unitGroupName .. " AGL: ".. round(height,3))
								Group.destroy(unitGroup)
							end
						end
					
		
				end)
				return true
			end
			world.searchObjects(Object.Category.UNIT, _volume, _search)
			



		end
	--tti.debug(dump(missionGroups_MR), true)
	end 




	--A2G HARD
	for i = 1,#arrayZoneAG,1 do
		if arrayZoneAG[i][4] == true then

			_zone = trigger.misc.getZone(arrayZoneAG[i][1])
			_zone.point = mist.utils.makeVec3GL(_zone.point)
			_zone.point.y = _zone.point.y + 1 -- offset center by 10KM
			_volume = {
				id = world.VolumeType.SPHERE,
				params = {
					point = _zone.point, 
					radius = arrayZoneAG[i][2]  -- radius in meters from the size of the zone
				}
			}
			_foundRed = false
			_foundBlue = true
			_search = function(_unit, _coa)
				pcall(function()        
						unitGroup = _unit:getGroup()
						unitGroupName = _unit:getName()
						pos = _unit:getPosition().p
						height = pos.y - land.getHeight({ x= pos.x, y = pos.z})
						
						if height > maxSpawnHeight  or height < minSpawnHeight then
							if _unit ~= nil	and _unit:isExist() and  _unit:isActive() and _unit:getLife() > 0 and unitGroup:getCategory() == 2 and _unit:getCoalition() == 1 then
								if show_delete_unit_above_ground_msg == true then
									trigger.action.outText( "TTI: Destroying group above ground: ".. unitGroupName .. " AGL: ".. round(height,3), 10)
								end
								env.info( "TTI: Destroying group above ground: ".. unitGroupName .. " AGL: ".. round(height,3))
								Group.destroy(unitGroup)
							end
						end		
									
				end)
				return true
			end
			world.searchObjects(Object.Category.UNIT, _volume, _search)

	end
	end
	
--A2G HELO
	for i = 1,#arrayZoneAGH,1 do
		if arrayZoneAGH[i][4] == true then
			_zone = trigger.misc.getZone(arrayZoneAGH[i][1])
			_zone.point = mist.utils.makeVec3GL(_zone.point)
			_zone.point.y = _zone.point.y + 1 -- offset center by 10KM
			_volume = {
				id = world.VolumeType.SPHERE,
				params = {
					point = _zone.point, 
					radius = arrayZoneAGH[i][2]  -- radius in meters from the size of the zone
				}
			}
			_foundRed = false
			_foundBlue = true
			_search = function(_unit, _coa)
				pcall(function()        

						unitGroup = _unit:getGroup()
						unitGroupName = _unit:getName()
						pos = _unit:getPosition().p
						height = pos.y - land.getHeight({ x= pos.x, y = pos.z})
						
						if height > maxSpawnHeight  or height < minSpawnHeight then
							if _unit ~= nil	and _unit:isExist() and  _unit:isActive() and _unit:getLife() > 0 and unitGroup:getCategory() == 2 and _unit:getCoalition() == 1 then
								if show_delete_unit_above_ground_msg == true then
									trigger.action.outText( "TTI: Destroying group above ground: ".. unitGroupName .. " AGL: ".. round(height,3), 10)
								end
								env.info( "TTI: Destroying group above ground: ".. unitGroupName .. " AGL: ".. round(height,3))
								Group.destroy(unitGroup)
							end
						end
					
					
				
				end)
				return true
			end
			world.searchObjects(Object.Category.UNIT, _volume, _search)

		end

	end

	--INFANTRY ASSAULT
	for i = 1,#arrayZoneINFAS,1 do
		if arrayZoneINFAS[i][4] == true then
			_zone = trigger.misc.getZone(arrayZoneINFAS[i][1])
			_zone.point = mist.utils.makeVec3GL(_zone.point)
			_zone.point.y = _zone.point.y + 1 -- offset center by 10KM
			_volume = {
				id = world.VolumeType.SPHERE,
				params = {
					point = _zone.point, 
					radius = arrayZoneINFAS[i][2]  -- radius in meters from the size of the zone
				}
			}
			_search = function(_unit, _coa)
				pcall(function()        
						unitGroup = _unit:getGroup()
						unitGroupName = _unit:getName()
						pos = _unit:getPosition().p
						height = pos.y - land.getHeight({ x= pos.x, y = pos.z})				
						if height > maxSpawnHeight  or height < minSpawnHeight then
							if _unit ~= nil	and _unit:isExist() and  _unit:isActive() and _unit:getLife() > 0 and unitGroup:getCategory() == 2 and _unit:getCoalition() == 1 then
								if show_delete_unit_above_ground_msg == true then
									trigger.action.outText( "TTI: Destroying group above ground: ".. unitGroupName .. " AGL: ".. round(height,3), 10)
								end
								env.info( "TTI: Destroying group above ground: ".. unitGroupName .. " AGL: ".. round(height,3))
								Group.destroy(unitGroup)
							end
						end
					
				end)
				return true
			end
			world.searchObjects(Object.Category.UNIT, _volume, _search)
		end
		end
					
	end
end


function main_intel(groupId, missionTypeForIntel, displayIntelTime)

if missionTypeForIntel == "mr" then
	missionTypeForIntelTextStr = "A2G Easy Missions"
elseif missionTypeForIntel == "ag" then
	missionTypeForIntelTextStr = "A2G Hard Missions"
elseif missionTypeForIntel == "sead" then
	missionTypeForIntelTextStr = "A2G SEAD Missions"
elseif missionTypeForIntel == "agh" then
	missionTypeForIntelTextStr = "A2G Helo Missions"
elseif missionTypeForIntel == "infas" then
	missionTypeForIntelTextStr = "Infantry Assault Missions"
elseif missionTypeForIntel == "ass" then
	missionTypeForIntelTextStr = "Anti-Ship Missions"
elseif missionTypeForIntel == "convoy" then
	missionTypeForIntelTextStr = "Convoy Hunt Missions"
elseif missionTypeForIntel == "shipconvoy" then
	missionTypeForIntelTextStr = "Ship Convoy Hunt Missions"
elseif missionTypeForIntel == "all" then
	missionTypeForIntelTextStr = "ALL ACTIVE GROUND MISSIONS"
end


trigger.action.outTextForGroup(groupId,  "LOCATION INTEL REQUEST: [".. missionTypeForIntelTextStr .. "]\nDisplaying location intel for requested ground mission type (if any are available)", 8)
trigger.action.outSoundForGroup(groupId, "TTI Soundfiles/intel.ogg")
		if missionTypeForIntel == "all" or missionTypeForIntel == "mr" then
			for i = 1,#arrayZoneMR,1
			do
				if trigger.misc.getUserFlag(arrayZoneMR[i][3]) == 1 then
					trigger.action.outTextForGroup(groupId,  abv_mrMissionTypeStr .. "\"".. EasyMissionName .. "\"\n" .. getZoneIntel(arrayZoneMR[i][5],_G[arrayZoneMR[i][1]],arrayZoneMR[i][6],arrayZoneMR[i][7]) .. "\n" .. getZoneCoords(_G[arrayZoneMR[i][1]]),  displayIntelTime)
				end
			end
		end
	
		if missionTypeForIntel == "all" or missionTypeForIntel == "ag" then
			for i = 1,#arrayZoneAG,1
			do
				if trigger.misc.getUserFlag(arrayZoneAG[i][3]) == 1 then
					trigger.action.outTextForGroup(groupId,  abv_agMissionTypeStr .. "\"".. HardMissionName .. "\"\n" .. getZoneIntel(arrayZoneAG[i][5],_G[arrayZoneAG[i][1]],arrayZoneAG[i][6],arrayZoneAG[i][7]) .. "\n" .. getZoneCoords(_G[arrayZoneAG[i][1]]),  displayIntelTime)
				end
			end
		end
		
		if missionTypeForIntel == "all" or missionTypeForIntel == "sead" then
			for i = 1,#arrayZoneSEAD,1
			do
				if trigger.misc.getUserFlag(arrayZoneSEAD[i][3]) == 1 then
					trigger.action.outTextForGroup(groupId,  abv_seadMissionTypeStr .. "\"".. SeadMissionName .. "\"\n" .. getZoneIntel(arrayZoneSEAD[i][5],_G[arrayZoneSEAD[i][1]],arrayZoneSEAD[i][6],arrayZoneSEAD[i][7]) .. "\n" .. getZoneCoords(_G[arrayZoneSEAD[i][1]]),  displayIntelTime)
				end
			end
		end
		
		if missionTypeForIntel == "all" or missionTypeForIntel == "agh" then		
			for i = 1,#arrayZoneAGH,1
			do
				if trigger.misc.getUserFlag(arrayZoneAGH[i][3]) == 1 then
					trigger.action.outTextForGroup(groupId,  abv_aghMissionTypeStr .. "\"".. HeloMissionName .. "\"\n" .. getZoneIntel(arrayZoneAGH[i][5],_G[arrayZoneAGH[i][1]],arrayZoneAGH[i][6],arrayZoneAGH[i][7]) .. "\n" .. getZoneCoords(_G[arrayZoneAGH[i][1]]),  displayIntelTime)
				end
			end
		end
		
		if missionTypeForIntel == "all" or missionTypeForIntel == "infas" then
			for i = 1,#arrayZoneINFAS,1
			do
				if trigger.misc.getUserFlag(arrayZoneINFAS[i][3]) == 1 then
					trigger.action.outTextForGroup(groupId,  abv_infasMissionTypeStr .. "\"".. InfMissionName .. "\"\n" .. getZoneIntel(arrayZoneINFAS[i][5],_G[arrayZoneINFAS[i][1]],arrayZoneINFAS[i][6],arrayZoneINFAS[i][7]) .. "\n" .. getZoneCoords(_G[arrayZoneINFAS[i][1]]),  displayIntelTime)
				end
			end
		end
			
		if missionTypeForIntel == "all" or missionTypeForIntel == "ass" then
			for i = 1,#arrayZoneASS,1
			do
				if trigger.misc.getUserFlag(arrayZoneASS[i][3]) == 1 then
					trigger.action.outTextForGroup(groupId,  abv_asMissionTypeStr .. "\"".. ShipMissionName .. "\"\n" .. getZoneIntel(arrayZoneASS[i][5],_G[arrayZoneASS[i][1]],arrayZoneASS[i][6],arrayZoneASS[i][7]) .. "\n" .. getZoneCoords(_G[arrayZoneASS[i][1]]),  displayIntelTime)
				end
			end
		end
		
		if missionTypeForIntel == "all" or missionTypeForIntel == "convoy" then		
			if Convoy_alive == true then
				if convoy_map_markers == true then
					trigger.action.outTextForGroup(groupId, "Convoy Hunt Mission \"".. ConvoyMissionName .."\"\n-INTEL-> Convoy's last known position: " .. "\n" .. getZoneCoords(ConvoyZone).. "\n[Convoy Map Marker Updated]", displayIntelTime)
					create_convoy_marker() -- Updates last known position map marker
				else
					trigger.action.outTextForGroup(groupId, "Convoy Hunt Mission \"".. ConvoyMissionName .."\"\n-INTEL-> Convoy's last known position: " .. "\n" .. getZoneCoords(ConvoyZone).. "\n[Convoy Map Marker Updated]", displayIntelTime)
				end                                                               
			end                                                               														
		end
		
		if missionTypeForIntel == "all" or missionTypeForIntel == "shipconvoy" then		
			if Ship_Convoy_alive == true then
				if ship_convoy_map_markers == true then
					trigger.action.outTextForGroup(groupId, "Ship Convoy Hunt Mission \"".. ShipConvoyMissionName .."\"\n-INTEL-> Ship Convoy's last known position: " .. "\n" .. getZoneCoords(ShipConvoyZone).. "\n[Ship Convoy Map Marker Updated]", displayIntelTime)
					create_ship_convoy_marker() -- Updates last known position map marker
				else
					trigger.action.outTextForGroup(groupId, "Ship Convoy Hunt Mission \"".. ShipConvoyMissionName .."\"\n-INTEL-> Ship Convoy's last known position: " .. "\n" .. getZoneCoords(ShipConvoyZone).. "\n[Ship Convoy Map Marker Updated]", displayIntelTime)
				end                                                               
			end                                                               														
		end
		
		
end

--a2g jet
function a2gj_text_start()
trigger.action.outText( "<< Air to Ground Hard Mission Initializing >>", 10)
trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
a2g_hard_initialize_spawn()
trigger.action.setUserFlag('61', true)
trigger.action.setUserFlag('6', false)
trigger.action.setUserFlag('AG-STARTING', true)
end

function a2gj_text_start_auto()
timer.scheduleFunction(function() 
trigger.action.outText( "<< Air to Ground Hard Mission Auto-Starting >>", 10)
trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
end, nil, timer.getTime() + 2  )
trigger.action.setUserFlag('AG-STARTING', true)
timer.scheduleFunction(function()
a2g_hard_initialize_spawn()
trigger.action.setUserFlag('61', true)
trigger.action.setUserFlag('6', false)
end, nil, timer.getTime() + 3  )

if agMissionAcceptMenuRoot then
	missionCommands.removeItem(agMissionAcceptMenuRoot)
	tti.debug("Removing Mission Accept Menu Item - AG")
end

if singleRandomMissionModeEnabled == true then
	removeRandomMissionMenuAcceptList()
end

end

function a2gj_text_fail()
trigger.action.outText( "<< There is already a mission of this type currently active. >>\n \nYou can only spawn one of each A2G mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
trigger.action.setUserFlag('6', false)
end

--a2g sead
function a2gsead_text_start()
trigger.action.outText( "<< Air to Ground SEAD Mission Initializing >>", 10)
trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
a2g_sead_initialize_spawn()
trigger.action.setUserFlag('SEAD-STARTING', true)
end

function a2gsead_text_start_auto()
timer.scheduleFunction(function() 
trigger.action.outText( "<< Air to Ground SEAD Mission Auto-Starting >>", 10)
trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
end, nil, timer.getTime() + 2  )
trigger.action.setUserFlag('SEAD-STARTING', true)
timer.scheduleFunction(function()
a2g_sead_initialize_spawn()
end, nil, timer.getTime() + 3  )

if seadMissionAcceptMenuRoot then
	missionCommands.removeItem(seadMissionAcceptMenuRoot)
	tti.debug("Removing Mission Accept Menu Item - SEAD")
end

if singleRandomMissionModeEnabled == true then
	removeRandomMissionMenuAcceptList()
end

end

function a2gsead_text_fail()
trigger.action.outText( "<< There is already a mission of this type currently active. >>\n \nYou can only spawn one of each A2G mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end

--MR
function mr_text_start()
trigger.action.outText( "<< Air to Ground Easy Mission Initializing >>", 10)
trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
a2g_easy_initialize_spawn()
trigger.action.setUserFlag('71', true)
trigger.action.setUserFlag('7', false)
trigger.action.setUserFlag('MR-STARTING', true)
end

function mr_text_start_auto()
timer.scheduleFunction(function() 
trigger.action.outText( "<< Air to Ground Easy Mission Auto-Starting >>", 10)
trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
end, nil, timer.getTime() + 2  )
trigger.action.setUserFlag('MR-STARTING', true)
timer.scheduleFunction(function() 
a2g_easy_initialize_spawn()
trigger.action.setUserFlag('71', true)
trigger.action.setUserFlag('7', false)
end, nil, timer.getTime() + 3  )

if mrMissionAcceptMenuRoot then
	missionCommands.removeItem(mrMissionAcceptMenuRoot)
	tti.debug("Removing Mission Accept Menu Item - MR")
end

if singleRandomMissionModeEnabled == true then
	removeRandomMissionMenuAcceptList()
end

end



function mr_text_fail()
trigger.action.outText( "<< There is already a mission of this type currently active. >>\n \nYou can only spawn one of each A2G mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
trigger.action.setUserFlag('7', false)
end

--helo
function a2gh_text_start()
trigger.action.outText( "<< Air to Ground Mission [Helos] Initializing >>", 10)
trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
a2g_helo_initialize_spawn()
trigger.action.setUserFlag('81', true)
trigger.action.setUserFlag('8', false)
trigger.action.setUserFlag('AGH-STARTING', true)
end

function a2gh_text_start_auto()
timer.scheduleFunction(function() 
trigger.action.outText( "<< Air to Ground Mission [Helos] Auto-Starting >>", 10)
trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
end, nil, timer.getTime() + 2  )
trigger.action.setUserFlag('AGH-STARTING', true)
timer.scheduleFunction(function()
a2g_helo_initialize_spawn()
trigger.action.setUserFlag('81', true)
trigger.action.setUserFlag('8', false)
end, nil, timer.getTime() + 3  )

if aghMissionAcceptMenuRoot then
	missionCommands.removeItem(aghMissionAcceptMenuRoot)
	tti.debug("Removing Mission Accept Menu Item - AGH")
end

if singleRandomMissionModeEnabled == true then
	removeRandomMissionMenuAcceptList()
end

end


function a2gh_text_fail()
trigger.action.outText( "<< There is already a mission of this type currently active. >>\n \nYou can only spawn one of each A2G mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
trigger.action.setUserFlag('8', false)
end

--helo ia
function a2gia_text_start()
trigger.action.setUserFlag('10', false)
trigger.action.setUserFlag('AGHIA-STARTING', true)
trigger.action.outText( "<< Infantry Assault Mission [Helos] Initializing >>", 10)
trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
a2g_infas_initialize_spawn()
trigger.action.setUserFlag('111', true)
end

function a2gia_text_start_auto()
timer.scheduleFunction(function() 
trigger.action.outText( "<< Infantry Assault Mission [Helos] Auto-Starting >>", 10)
trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
end, nil, timer.getTime() + 2  )
trigger.action.setUserFlag('AGHIA-STARTING', true)
timer.scheduleFunction(function()
a2g_infas_initialize_spawn()
trigger.action.setUserFlag('111', true)
trigger.action.setUserFlag('10', false)
end, nil, timer.getTime() + 3  )

if infMissionAcceptMenuRoot then
	missionCommands.removeItem(infMissionAcceptMenuRoot)
	tti.debug("Removing Mission Accept Menu Item - INF")
end

if singleRandomMissionModeEnabled == true then
	removeRandomMissionMenuAcceptList()
end

end

function a2gia_text_fail()
trigger.action.outText( "<< There is already a mission of this type currently active. >>\n \nYou can only spawn one of each A2G mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
trigger.action.setUserFlag('10', false)
end

--as
function a2gas_text_start()
trigger.action.outText( "<< Anti-Ship Mission Initializing >>", 10)
trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
a2g_as_initialize_spawn()
trigger.action.setUserFlag('91', true)
trigger.action.setUserFlag('9', false)
trigger.action.setUserFlag('AS-STARTING', true)
end

function a2gas_text_start_auto()
timer.scheduleFunction(function() 
trigger.action.outText( "<< Anti-Ship Mission Auto-Starting >>", 10)
trigger.action.outSound("TTI Soundfiles/radio click.ogg" )
end, nil, timer.getTime() + 2  )
trigger.action.setUserFlag('AS-STARTING', true)
timer.scheduleFunction(function()
a2g_as_initialize_spawn()
trigger.action.setUserFlag('91', true)
trigger.action.setUserFlag('9', false)
end, nil, timer.getTime() + 3  )

if asMissionAcceptMenuRoot then
	missionCommands.removeItem(asMissionAcceptMenuRoot)
	tti.debug("Removing Mission Accept Menu Item - AS")
end

if singleRandomMissionModeEnabled == true then
	removeRandomMissionMenuAcceptList()
end

end

function a2gas_text_fail()
trigger.action.outText( "<< There is already a mission of this type currently active. >>\n \nYou can only spawn one of each A2G mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
trigger.action.setUserFlag('9', false)
end

function a2g_convoy_text_fail()
trigger.action.outText( "<< There is already a mission of this type currently active. >>\n \nYou can only spawn one of each A2G mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end

function a2g_ship_convoy_text_fail()
trigger.action.outText( "<< There is already a mission of this type currently active. >>\n \nYou can only spawn one of each A2G mission type at a time.\n \nPlease complete this mission type before spawning a new one.", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end

trigger.action.setUserFlag('INIT_TIME', true)
--trigger.action.setUserFlag('MISSONS_START_COMPLETE', true)

if trigger.misc.getUserFlag('INIT_TIME') == 1 then

	timer.scheduleFunction(function() 
	trigger.action.outText(	"<< Mission Tasking/Spawning Menu Added to your F10 - Other Menu >>", 15)
	end, nil, timer.getTime() + 5  )
	
	if a2g_hard_autostart == true then
		timer.scheduleFunction(function()
			if requireAcceptFirstAutoStartMission == true then
				addMissionAcceptMenu("AG")	
			else
				a2gj_text_start_auto()
			end
		end, nil, timer.getTime() + 20  )
	end
	
	if a2g_sead_autostart == true then
		timer.scheduleFunction(function() 
			if requireAcceptFirstAutoStartMission == true then
				addMissionAcceptMenu("SEAD")
			else
				a2gsead_text_start_auto()
			end
		end, nil, timer.getTime() + 35  )
	end
	
	if singleRandomMissionModeEnabled == true then
		timer.scheduleFunction(function() 
			startSingleRandomMission()
		tti.debug("First INIT Single Random Mission Start...")
	end, nil, timer.getTime() + 25  )
	end
	
	if a2g_helo_autostart == true then
		timer.scheduleFunction(function()
			if requireAcceptFirstAutoStartMission == true then
				addMissionAcceptMenu("AGH")
			else
				a2gh_text_start_auto()
			end
		end, nil, timer.getTime() + 30  )
	end
	
	if a2g_helo_inf_autostart == true then
		timer.scheduleFunction(function() 
			if requireAcceptFirstAutoStartMission == true then
				addMissionAcceptMenu("INF")
			else
				a2gia_text_start_auto()
			end
		end, nil, timer.getTime() + 40  )
	end
	
	if a2g_easy_autostart == true then
		timer.scheduleFunction(function() 
			if requireAcceptFirstAutoStartMission == true then
				addMissionAcceptMenu("MR")
			else
				mr_text_start_auto()
			end
		end, nil, timer.getTime() + 50  )
	end
	
	timer.scheduleFunction(function() 
		if ship_convoy_missions_autostart == true and carrierOpsTheatre == true then
			if requireAcceptFirstAutoStartMission == true then
				addMissionAcceptMenu("SHIPCONV")
			else
			random_ship_convoy_start()
			end
			env.info( "TTI: A2G Ship Convoy Started" )
		end
	end, nil, timer.getTime() + 90  )
	
	timer.scheduleFunction(function() 
		if convoy_missions_autostart == true then
			if requireAcceptFirstAutoStartMission == true then
				addMissionAcceptMenu("CONV")
			else
				random_convoy_start()
			end
			env.info( "TTI: A2G Convoy Started" )
		end
	end, nil, timer.getTime() + 120  )
	
	if antiship_autostart == true then
		if carrierOpsTheatre == true then
			timer.scheduleFunction(function() 
				if requireAcceptFirstAutoStartMission == true then
					addMissionAcceptMenu("ASS")
				else
					a2gas_text_start_auto()
				end
			end, nil, timer.getTime() + 60  ) --supposed to be 200
		end
	end
	
	timer.scheduleFunction(function() 
		if requireAcceptFirstAutoStartMission == true then
			trigger.action.outText(	"<< REMINDER: Auto-Start Missions are set to only start through the MISSION ACCEPT LIST in the F10 - Other menu. >> \n\nYou can change this setting in the mission settings (check documentation for details)", 30)
		end
	end, nil, timer.getTime() + 180  )
	
	
	timer.scheduleFunction(function() 
		main_cap_backup()
	end, nil, timer.getTime() + math.random(600,1800)  )
	
	
	timer.scheduleFunction(function() 
	trigger.action.setUserFlag('MISSONS_START_COMPLETE', true)
	trigger.action.outText(	"<< If auto-spawning missions are disabled, you can now manually start ground missions as desired. >>", 15)
	end, nil, timer.getTime() + 87  )
	
	timer.scheduleFunction(function()
		if respawnA2aConstantMethod == "kill" then
			main_constant_a2a()
		elseif respawnA2aConstantMethod == "time" then
			main_ambient()
		end
	end, nil, timer.getTime() + 20  )
	
	--bombing add
	timer.scheduleFunction(function() 
	main_bombing()
	end, nil, timer.getTime() + 2700  )
	
	--helo add
	timer.scheduleFunction(function() 
	main_a2a_helo()
	end, nil, timer.getTime() + 1000  )
	
	timer.scheduleFunction(function() 
	main_sam()
	end, nil, timer.getTime() + 600  )

	
end

spawn_cvn_carrier_on_cvn_player_spawn = false
spawn_kuz_carrier_on_kuz_player_spawn = false
spawn_lha_carrier_on_lha_player_spawn = false

if mission_era == "modern" or mission_era == "cold_war" then
	if carrierOpsTheatre == true then
		carrier_ops_info_text =	ZONE:New( "carrier_ops_info_text" ) 
	
		
		timer.scheduleFunction(function()
			if cv_lha_enable == true and spawn_lha_carrier_on_lha_player_spawn == false then
				Group.getByName("LHA-1 Tarawa"):activate()
				cv_lha_spawned = true
				tti.debug("LHA-1 Tarawa, spawning")
				createCarrierOpsInfoText()
			else
				tti.debug("LHA-1 Tarawa disabled, not spawning")
			end
		end, nil, timer.getTime() + 2  )
		
		timer.scheduleFunction(function()
			if cv_kuz_enable == true and spawn_kuz_carrier_on_kuz_player_spawn == false then
				Group.getByName("CV Kuznetsov"):activate()
				cv_kuz_spawned = true
				tti.debug("CV Kuznetsov enabled, spawning")
				createCarrierOpsInfoText()
			else
				tti.debug("CV Kuznetsov disabled, not spawning")
			end
		end, nil, timer.getTime() + 4  )
		
		timer.scheduleFunction(function() 
			if cv_cvn_enable == true and spawn_cvn_carrier_on_cvn_player_spawn == false then
				Group.getByName("CVN-7X"):activate()
				cvnTypeName = Group.getByName("CVN-7X"):getUnit(1):getTypeName()
				tti.debug("CVN type name is: " .. cvnTypeName)
				cv_cvn_spawned = true
				tti.debug("CVN-7X enabled, spawning")
				createCarrierOpsInfoText()
				else
				tti.debug("CVN-7X disabled, not spawning")
			end
		end, nil, timer.getTime() + 1  )
	end
end

function createCarrierOpsInfoText()
	if enable_map_info_boxes == true and carrierOpsInfoTextBoxCreated ~= true then
		carrier_ops_info_text =	ZONE:New( "carrier_ops_info_text" ) 
		local TextCoord = carrier_ops_info_text:GetCoordinate()
		local InfoBoxText = "CVN-7X - TACAN: 43X\nATC: 225.5 AM \nICLS - 5\nACLS: 336.0\n\nLHA-1 Tarawa - TACAN: 42X\nATC: 126.5 AM\n\nKuznetsov\nATC: 127.5 AM"
		local CarrierTextBox = TextCoord:TextToAll(InfoBoxText, -1, tti.color.white, 1 , tti.color.black, 0.3, 9, false)
		carrierOpsInfoTextBoxCreated = true
	end
end

function forceCvnSpawnOnPlayerSpawn()
	if mission_era == "modern" or mission_era == "cold_war" then
		if carrierOpsTheatre == true then
			if cv_cvn_enable == true and spawn_cvn_carrier_on_cvn_player_spawn == true then
				Group.getByName("CVN-7X"):activate()
				cv_cvn_spawned = true
				tti.debug("First CVN Player Spawn detected, spawning CVN carrier", true)
				tti.debug("CVN-7X enabled, and spawn start enabled, spawning")
				createCarrierOpsInfoText()
				if airboss_enable == true then
					startCvnxRelay()
				end
			end
		end	
	end
end

function forceKuzSpawnOnPlayerSpawn()
	if mission_era == "modern" or mission_era == "cold_war" then
		if carrierOpsTheatre == true then
			if cv_kuz_enable == true and spawn_cvn_carrier_on_cvn_player_spawn == true then
				Group.getByName("CV Kuznetsov"):activate()
				cv_kuz_spawned = true
				tti.debug("CV Kuznetsov enabled, spawning")
				createCarrierOpsInfoText()
			end
	
		end
	end
end

function forceLhaSpawnOnPlayerSpawn()
	if mission_era == "modern" or mission_era == "cold_war" then
		if carrierOpsTheatre == true then
			if cv_lha_enable == true and spawn_lha_carrier_on_lha_player_spawn == true then
				Group.getByName("LHA-1 Tarawa"):activate()
				cv_lha_spawned = true
				tti.debug("LHA-1 Tarawa, spawning")
				createCarrierOpsInfoText()
			end
		end
	end
end

if mission_era == "cold_war" or mission_era == "modern" then --initiate AWACS
	timer.scheduleFunction(function() 
	reset_awacs()
	tti.debug("AWACS Spawning - Era set to: [" .. mission_era .. "] and will allow for it to spawn")
	--trigger.action.setUserFlag('50', true)
	if enable_map_info_boxes == true then
		local StartCoord = awacs_01_init:GetCoordinate()
		local EndCoord = awacs_01_wpt:GetCoordinate()
		local Distance = StartCoord:Get2DDistance(EndCoord)
		local DirVec3 = StartCoord:GetDirectionVec3(EndCoord)
		local Angle = COORDINATE:GetAngleDegrees(DirVec3)
		local TextCoord = StartCoord:Translate(Distance/2,Angle)
		local InfoBoxText = usa_awacs_type .. " AWACS \"Overlord\"\nFrequency: " .. awacs_frequency .." AM"
		
		local TankerTextBox = TextCoord:Translate(1500, 45):TextToAll(InfoBoxText, -1, tti.color.white, 1, tti.color.black, 0.3, 9, false)
		local DrawTankerLine =  StartCoord:LineToAll(EndCoord, -1, tti.color.white, 0.5, 6)
		local DrawTankerLineCircleStart = StartCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
		local DrawTankerLineCircleEnd = EndCoord:CircleToAll(500, -1, tti.color.white, 0.5, tti.color.black, 0.15, 3, false)
	end
	
	end, nil, timer.getTime() + 8  )
end

if mission_era == "ww2" or mission_era == "korean_war" then
	timer.scheduleFunction(function() 
	--[[
	EWRS_GROUND_SPAWN = SPAWN:New( "ewrs_ground" )
	EWRS_GROUND_SPAWN:SpawnInZone("ewrs_ground_spawn")
	--]]
	Group.getByName("ewrs_ground"):activate()
	end, nil, timer.getTime() + 2  )
end

if 	singleRandomMissionModeEnabled == false then
	if a2g_hard_autostart == true or
	a2g_helo_autostart == true or
	a2g_sead_autostart == true or
	a2g_helo_inf_autostart == true or
	a2g_easy_autostart == true or
	antiship_autostart == true then
	several_ground_missions_autostart_message = true
	end
end

tti.debug("TTI map is: " .. env.mission.theatre)

--ATIS TESTING
if env.mission.theatre ~= "Normandy" then
	local airbases=AIRBASE.GetAllAirbases()
	for _,_airbase in pairs(airbases) do
	local airbase=_airbase --Wrapper.Airbase#AIRBASE
	airbase:GetRunwayData(nil, false)
	end
end

if env.mission.theatre == "Caucasus" then
		main_airbase_atis = AIRBASE.Caucasus.Gudauta
		main_airbase_name = "Gudauta"
		main_airbase_tower_freq_1 = 130
		main_airbase_tower_freq_2 = 259
		aux1_airbase_atis = AIRBASE.Caucasus.Sochi_Adler
		aux2_airbase_atis = AIRBASE.Caucasus.Sukhumi_Babushara
	elseif env.mission.theatre == "Nevada" then
		main_airbase_atis = AIRBASE.Nevada.Nellis
		main_airbase_name = "Nellis"
		main_airbase_tower_freq_1 = 327.000
		main_airbase_tower_freq_2 = 132.550
		aux1_airbase_atis = AIRBASE.Nevada.Creech
		aux2_airbase_atis = AIRBASE.Nevada.North_Las_Vegas
	elseif env.mission.theatre == "PersianGulf" then
		main_airbase_atis = AIRBASE.PersianGulf.Al_Minhad_AFB
		main_airbase_name = "Al Minhad AFB"
		main_airbase_tower_freq_1 = 118.550
		main_airbase_tower_freq_2 = 250.100
		aux1_airbase_atis = AIRBASE.PersianGulf.Havadarya
		aux2_airbase_atis = AIRBASE.PersianGulf.Dubai_Intl
	elseif env.mission.theatre == "Afghanistan" and afghanistan_map_type == "kandahar" then
		main_airbase_atis = AIRBASE.Afghanistan.Camp_Bastion
		main_airbase_name = "Kandahar"
		main_airbase_tower_freq_1 = 360.200
		main_airbase_tower_freq_2 = 125.500	
		-- main_airbase_atis = AIRBASE.Afghanistan.Camp_Bastion
		-- main_airbase_name = "Camp Bastion"
		-- main_airbase_tower_freq_1 = 250.100
		-- main_airbase_tower_freq_2 = 123.300	
		aux1_airbase_atis = AIRBASE.Afghanistan.Camp_Bastion_Heliport
		aux2_airbase_atis = AIRBASE.Afghanistan.Bost

	elseif env.mission.theatre == "Iraq" and iraq_map_type == "iraq_baghdad" then
		main_airbase_atis = AIRBASE.Iraq.Balad_Airbase
		main_airbase_name = "Balad Airbase"
		main_airbase_tower_freq_1 = 250.550
		main_airbase_tower_freq_2 = 119.800	
		-- main_airbase_atis = AIRBASE.Afghanistan.Camp_Bastion
		-- main_airbase_name = "Camp Bastion"
		-- main_airbase_tower_freq_1 = 250.100
		-- main_airbase_tower_freq_2 = 123.300	
		aux1_airbase_atis = AIRBASE.Iraq.Al_Salam_Airbase
		aux2_airbase_atis = AIRBASE.Iraq.Baghdad_International_Airport
		
		
	elseif env.mission.theatre == "SinaiMap" and sinai_map_type == "sinai_cairo" then
		tti.debug("TTI Map variation is: " .. sinai_map_type)
		main_airbase_atis = AIRBASE.Sinai.Inshas_Airbase
		main_airbase_name = "Inshas Airbase"
		main_airbase_tower_freq_1 = 118.450
		main_airbase_tower_freq_2 = 250.500
		aux1_airbase_atis = AIRBASE.Sinai.Cairo_International_Airport
		aux2_airbase_atis = AIRBASE.Sinai.Bilbeis_Air_Base
		
	elseif env.mission.theatre == "SinaiMap" and sinai_map_type == "sinai_north" then
		tti.debug("TTI Map variation is: " .. sinai_map_type)
		main_airbase_atis = AIRBASE.Sinai.Tel_Nof
		main_airbase_name = "Tel Nof"
		main_airbase_tower_freq_1 = 118.750
		main_airbase_tower_freq_2 = 250.750
		aux1_airbase_atis = AIRBASE.Sinai.Hatzor
		aux2_airbase_atis = AIRBASE.Sinai.Palmachim
		
	elseif env.mission.theatre == "Normandy" then
		main_airbase_atis = AIRBASE.Normandy.Bazenville
		--main_airbase_atis = AIRBASE.Normandy.B2_Bazenville
		main_airbase_name = "Bazenville"
		main_airbase_tower_freq_1 = 118.550
		main_airbase_tower_freq_2 = 250.550
		aux1_airbase_atis = AIRBASE.Normandy.Sainte_Croix_sur_Mer
		aux2_airbase_atis = AIRBASE.Normandy.Lantheuil	

		
	elseif env.mission.theatre == "MarianaIslands" then
		main_airbase_atis = AIRBASE.MarianaIslands.Andersen_AFB
		main_airbase_name = "Andersen AFB"
		main_airbase_tower_freq_1 = 126.200
		main_airbase_tower_freq_2 = 250.100
		aux1_airbase_atis = AIRBASE.MarianaIslands.Antonio_B_Won_Pat_Intl
		aux2_airbase_atis = AIRBASE.MarianaIslands.Olf_Orote
	elseif env.mission.theatre == "Syria" and syra_map_type == "syr_al" then
		main_airbase_atis = AIRBASE.Syria.Kuweires
		main_airbase_name = "Kuweires"
		main_airbase_tower_freq_1 = 120.500
		main_airbase_tower_freq_2 = 251.100
	
		
		syr_ak_airbase_atis = AIRBASE.Syria.Akrotiri
		syr_ak_airbase_name = "Akrotiri"
		syr_ak_airbase_tower_freq_1 = 128.000
		syr_ak_airbase_tower_freq_2 = 251.750

		
		syr_inck_airbase_atis = AIRBASE.Syria.Incirlik
		syr_inck_airbase_name = "Incirlik"
		syr_inck_airbase_tower_freq_1 = 122.100
		syr_inck_airbase_tower_freq_2 = 360.100

		
		syr_rmt_airbase_atis = AIRBASE.Syria.Ramat_David
		syr_rmt_airbase_name = "Ramat David"
		syr_rmt_airbase_tower_freq_1 = 118.600
		syr_rmt_airbase_tower_freq_2 = 251.050

		aux1_airbase_atis = AIRBASE.Syria.Aleppo
		aux2_airbase_atis = AIRBASE.Syria.Jirah	

	elseif env.mission.theatre == "Syria" and syra_map_type == "syr_cy" then
		main_airbase_atis = AIRBASE.Syria.Akrotiri
		main_airbase_name = "Akrotiri"
		main_airbase_tower_freq_1 = 128
		main_airbase_tower_freq_2 = 251.750
		
		syr_ak_airbase_atis = AIRBASE.Syria.Akrotiri
		syr_ak_airbase_name = "Akrotiri"
		syr_ak_airbase_tower_freq_1 = 128.000
		syr_ak_airbase_tower_freq_2 = 251.750
		
		syr_inck_airbase_atis = AIRBASE.Syria.Incirlik
		syr_inck_airbase_name = "Incirlik"
		syr_inck_airbase_tower_freq_1 = 122.100
		syr_inck_airbase_tower_freq_2 = 360.100
		
		syr_rmt_airbase_atis = AIRBASE.Syria.Ramat_David
		syr_rmt_airbase_name = "Ramat David"
		syr_rmt_airbase_tower_freq_1 = 118.600
		syr_rmt_airbase_tower_freq_2 = 251.050
		
		aux1_airbase_atis = AIRBASE.Syria.Paphos
		aux2_airbase_atis = AIRBASE.Syria.Larnaca	
		
	elseif env.mission.theatre == "Syria" and syra_map_type == "syr_dm" then
		main_airbase_atis = AIRBASE.Syria.Al_Dumayr
		main_airbase_name = "Al-Dumayr"
		main_airbase_tower_freq_1 = 120.300
		main_airbase_tower_freq_2 = 252.750	
		
		syr_ak_airbase_atis = AIRBASE.Syria.Akrotiri
		syr_ak_airbase_name = "Akrotiri"
		syr_ak_airbase_tower_freq_1 = 128.000
		syr_ak_airbase_tower_freq_2 = 251.750
		
		syr_inck_airbase_atis = AIRBASE.Syria.Incirlik
		syr_inck_airbase_name = "Incirlik"
		syr_inck_airbase_tower_freq_1 = 122.100
		syr_inck_airbase_tower_freq_2 = 360.100
		
		syr_rmt_airbase_atis = AIRBASE.Syria.Ramat_David
		syr_rmt_airbase_name = "Ramat David"
		syr_rmt_airbase_tower_freq_1 = 118.600
		syr_rmt_airbase_tower_freq_2 = 251.050
		
		aux1_airbase_atis = AIRBASE.Syria.Marj_as_Sultan_North
		aux2_airbase_atis = AIRBASE.Syria.Marj_as_Sultan_South	
		
	elseif env.mission.theatre == "Falklands" and sa_map_type == "punta_arenas" then
		main_airbase_atis = AIRBASE.SouthAtlantic.Punta_Arenas
		main_airbase_name = "Punta Arenas"
		main_airbase_tower_freq_1 = 118.700
		main_airbase_tower_freq_2 = 250.850
		aux1_airbase_atis = AIRBASE.SouthAtlantic.Porvenir
		aux2_airbase_atis = AIRBASE.SouthAtlantic.Franco_Bianco	
	elseif env.mission.theatre == "Falklands" and sa_map_type == "mount_pleasant" then
		main_airbase_atis = AIRBASE.SouthAtlantic.Mount_Pleasant
		main_airbase_name = "Mount Pleasant"
		main_airbase_tower_freq_1 = 133.350
		main_airbase_tower_freq_2 = 250.550
		aux1_airbase_atis = AIRBASE.SouthAtlantic.Port_Stanley
		aux2_airbase_atis = AIRBASE.SouthAtlantic.Goose_Green	
		
	elseif env.mission.theatre == "Kola" and kola_map_type == "kola_west" then
		tti.debug("TTI Map variation is: " .. kola_map_type)
		main_airbase_atis = AIRBASE.Kola.Bodo
		main_airbase_name = "Bodo"
		main_airbase_tower_freq_1 = 118.300
		main_airbase_tower_freq_2 = 250.450
		aux1_airbase_atis = AIRBASE.Kola.Kiruna
		aux2_airbase_atis = AIRBASE.Kola.Kalixfors	
		
	elseif env.mission.theatre == "Kola" and kola_map_type == "kola_east" then
		tti.debug("TTI Map variation is: " .. kola_map_type)
		main_airbase_atis = AIRBASE.Kola.Murmansk_International
		main_airbase_name = "Murmansk International"
		main_airbase_tower_freq_1 = 118.350
		main_airbase_tower_freq_2 = 250.500
		aux1_airbase_atis = AIRBASE.Kola.Severomorsk_1
		aux2_airbase_atis = AIRBASE.Kola.Severomorsk_3	
end


if env.mission.theatre ~= "Normandy" then
atisTTI_Main=ATIS:New(main_airbase_atis, main_airbase_atis_freq)
atisTTI_Main:SetRadioRelayUnitName("Radio Relay Main")
atisTTI_Main:SetTowerFrequencies({main_airbase_tower_freq_1, main_airbase_tower_freq_2})
atisTTI_Main:SetMapMarks(true)
atisTTI_info_full = "[" .. main_airbase_name .. " ATIS - " .. main_airbase_atis_freq .. " Mhz AM] \n[" .. main_airbase_name .."] TWR - " .. main_airbase_tower_freq_1 .. " Mhz AM // " .. main_airbase_tower_freq_2 .. " Mhz AM"
atisTTI_info_short = "[" .. main_airbase_name .. " ATIS - " .. main_airbase_atis_freq .. " Mhz AM]"
end

if env.mission.theatre == "Syria" then
syr_ak_airbase_atis_freq = 144.00
syr_inck_airbase_atis_freq = 145.00
syr_rmt_airbase_atis_freq = 146.00
atisTTI_syr_ak=ATIS:New(syr_ak_airbase_atis, syr_ak_airbase_atis_freq)
atisTTI_syr_ak:SetRadioRelayUnitName("Radio Relay AK")
atisTTI_syr_ak:SetTowerFrequencies({syr_ak_airbase_tower_freq_1, syr_ak_airbase_tower_freq_2})
atisTTI_syr_ak:SetMapMarks(true)
atisTTI_syr_ak_info_full = "[" .. syr_ak_airbase_name .. " ATIS - " .. syr_ak_airbase_atis_freq .. " Mhz AM] \n[" .. syr_ak_airbase_name .."] TWR - " .. syr_ak_airbase_tower_freq_1 .. " Mhz AM // " .. syr_ak_airbase_tower_freq_2 .. " Mhz AM"
atisTTI_syr_ak_info_short = "[" .. syr_ak_airbase_name .. " ATIS - " .. syr_ak_airbase_atis_freq .. " Mhz AM]"

atisTTI_syr_inck=ATIS:New(syr_inck_airbase_atis, syr_inck_airbase_atis_freq)
atisTTI_syr_inck:SetRadioRelayUnitName("Radio Relay INCK")
atisTTI_syr_inck:SetTowerFrequencies({syr_inck_airbase_tower_freq_1, syr_inck_airbase_tower_freq_2})
atisTTI_syr_inck:SetMapMarks(true)
atisTTI_syr_inck_info_full = "[" .. syr_inck_airbase_name .. " ATIS - " .. syr_inck_airbase_atis_freq .. " Mhz AM] \n[" .. syr_inck_airbase_name .."] TWR - " .. syr_inck_airbase_tower_freq_1 .. " Mhz AM // " .. syr_inck_airbase_tower_freq_2 .. " Mhz AM"
atisTTI_syr_inck_info_short = "[" .. syr_inck_airbase_name .. " ATIS - " .. syr_inck_airbase_atis_freq .. " Mhz AM]"

atisTTI_syr_rmt=ATIS:New(syr_rmt_airbase_atis, syr_rmt_airbase_atis_freq)
atisTTI_syr_rmt:SetRadioRelayUnitName("Radio Relay RMT")
atisTTI_syr_rmt:SetTowerFrequencies({syr_rmt_airbase_tower_freq_1, syr_rmt_airbase_tower_freq_2})
atisTTI_syr_rmt:SetMapMarks(true)
atisTTI_syr_rmt_info_full = "[" .. syr_rmt_airbase_name .. " ATIS - " .. syr_rmt_airbase_atis_freq .. " Mhz AM] \n[" .. syr_rmt_airbase_name .."] TWR - " .. syr_rmt_airbase_tower_freq_1 .. " Mhz AM // " .. syr_rmt_airbase_tower_freq_2 .. " Mhz AM"
atisTTI_syr_rmt_info_short = "[" .. syr_rmt_airbase_name .. " ATIS - " .. syr_rmt_airbase_atis_freq .. " Mhz AM]"
end

--atisTTI_Main:Start()
function start_atis_main()
atisTTI_Main:Start()
tti.debug("ATIS - Starting!")
trigger.action.outText ("ATIS Starting: " .. atisTTI_info_short, 15)
atis_on = true
end

function start_atis_syria_ak()
atisTTI_syr_ak:Start()
tti.debug("ATIS - Starting!")
trigger.action.outText ("ATIS Starting: " .. atisTTI_syr_ak_info_short, 15)
atis_on = true
end

function start_atis_syria_inck()
atisTTI_syr_inck:Start()
tti.debug("ATIS - Starting!")
trigger.action.outText ("ATIS Starting: " .. atisTTI_syr_inck_info_short, 15)
atis_on = true
end

function start_atis_syria_rmt()
atisTTI_syr_rmt:Start()
tti.debug("ATIS - Starting!")
trigger.action.outText ("ATIS Starting: " .. atisTTI_syr_rmt_info_short, 15)
atis_on = true
end

function start_atis_syria_all()
start_atis_syria_inck()
start_atis_syria_rmt()
start_atis_syria_ak()
end

function stop_atis_syria_all()
trigger.action.outText ("ATIS Stopping: ALL SYRIA EXTRA ATIS CHANNELS", 15)
atisTTI_syr_inck:Stop()
atisTTI_syr_rmt:Stop()
atisTTI_Main:Stop()
atisTTI_syr_ak:Stop()
atis_on = false
end

function start_atis_auto_main()
	if atis_enable == true and playerFirstSpawned_Fc3 ~= true then -- will not start ATIS if FC3 is occupied within the first 45 seconds
		atisTTI_Main:Start()
			--if env.mission.theatre == "Syria" then
				--start_atis_syria_all()
			--end
		tti.debug("ATIS - Starting!")
		trigger.action.outText("ATIS Starting: " .. atisTTI_info_short, 15)
		atis_on = true
	else
		tti.debug("ATIS - Skipping, since FC3 is occupied")
	end
end

function stop_atis_main()
atisTTI_Main:Stop()
	if env.mission.theatre == "Syria" then
		stop_atis_syria_all()
	end
tti.debug("ATIS - stopping!")
trigger.action.outText ("ATIS Stopping: ".. atisTTI_info_short, 15)
atis_on = false
end

function displayAtisInfo()
trigger.action.outText("Displaying ATIS Information: \n" .. atisTTI_info_full, 30)
if env.mission.theatre == "Syria" then
trigger.action.outText("Displaying SYRIA EXTRA ATIS Information: \n" .. atisTTI_info_full, 30)
end
end

timer.scheduleFunction(function()
if auto_start_atis == true then 
start_atis_auto_main()
tti.debug("ATIS - Auto-starting!")
end
end, nil, timer.getTime() + 45  )


------- MISSION POINTS SYSTEM --- WIP

enableMissionPointsSystem = false

tti.points = {}
tti.points.kill = {}
tti.points.a2a = {}
tti.points.a2g = {}
tti.points.missionComplete = {}

tti_points_a2a = 0
tti_points_a2g = 0
tti_points_missionComplete = 0

tti_points_value_a2a_high = 5
tti_points_value_a2a_med = 5
tti_points_value_a2a_low = 5

tti_points_value_a2g_high = 5
tti_points_value_a2g_med = 5
tti_points_value_a2g_low = 5

tti_points_value_missionComplete_easy = 5
tti_points_value_missionComplete_hard = 5
tti_points_value_missionComplete_helo = 5
tti_points_value_missionComplete_infantry = 5
tti_points_value_missionComplete_sead = 5
tti_points_value_missionComplete_convoy = 5
tti_points_value_missionComplete_antiship = 5

function displayMissionPointsStatus()
tti.debug("Mission Points System - Function called displayMissionPointsStatus()\nMission points system still WIP",true)
end

--------------------------------



env.info('TRIGGER LUA FILE LOAD SUCCESSFUL... ok')
tti_trigger_list_script_loaded = true