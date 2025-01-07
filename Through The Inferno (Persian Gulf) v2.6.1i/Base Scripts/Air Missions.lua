----

--maxActiveEnemyAirGroups = 10 -- set max air groups of each a2a spawn type that can exist at once

---

CPS 		= 	ZONE:New("CPS")
CPS1		=	ZONE:New("CPS-1")
CPS2		=	ZONE:New("CPS-2")
CPS3		=	ZONE:New("CPS-3")
CPS4		=	ZONE:New("CPS-4")
CPS5		=	ZONE:New("CPS-5")
CPS6		=	ZONE:New("CPS-6")
CPS7		=	ZONE:New("CPS-7")
CPS8		=	ZONE:New("CPS-8")
CPS9		=	ZONE:New("CPS-9")
CPS10		=	ZONE:New("CPS-10")

CPS_bomb1	=	ZONE:New("CPS_bomb1")
CPS_bomb2	=	ZONE:New("CPS_bomb2")
CPS_bomb3	=	ZONE:New("CPS_bomb3")
CPS_HELO	=	ZONE:New("CPS_HELO")


a2a_bombing_target_1 = ZONE:New( "a2a_bombing_target_1" ) 
a2a_bombing_target_1_vec2 = a2a_bombing_target_1:GetVec2()

if mission_era == "modern" or mission_era == "cold_war" then
	a2a_min_alt = 5000
	a2a_max_alt = 10000
	else
	a2a_min_alt = 1000
	a2a_max_alt = 4000
end

CPS_vec		= CPS:GetVec3()
CPS1_vec	= CPS1:GetVec3()
CPS2_vec	= CPS2:GetVec3()
CPS3_vec	= CPS3:GetVec3()
CPS4_vec	= CPS4:GetVec3()
CPS5_vec	= CPS5:GetVec3()
CPS6_vec	= CPS6:GetVec3()
CPS7_vec	= CPS7:GetVec3()
CPS8_vec	= CPS8:GetVec3()
CPS9_vec	= CPS9:GetVec3()
CPS10_vec	= CPS10:GetVec3()

cps_id = {}
function create_cps_markers()
	cps_id[1] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[1],"CPS",CPS_vec,true)
	
	cps_id[2] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[2],"CPS1",CPS1_vec,true)
	
	cps_id[3] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[3],"CPS2",CPS2_vec,true)
	
	cps_id[4] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[4],"CPS3",CPS3_vec,true)
	
	cps_id[5] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[5],"CPS4",CPS4_vec,true)
	
	cps_id[6] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[6],"CPS5",CPS5_vec,true)
	
	cps_id[7] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[7],"CPS6",CPS6_vec,true)
	
	cps_id[8] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[8],"CPS7",CPS7_vec,true)
	
	cps_id[9] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[9],"CPS8",CPS8_vec,true)
	
	cps_id[10] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[10],"CPS9",CPS9_vec,true)
	
	cps_id[11] = UTILS.GetMarkID()
	trigger.action.markToAll(cps_id[11],"CPS10",CPS10_vec,true)
end

TemplateTable_Blue_Backup_Airfield_2 = {
"Blue_CAP_Backup_Airfield_2",
}

TemplateTable_Blue_Backup_Airfield_3 = {
"Blue_CAP_Backup_Airfield_3",
}

if mission_era == "cold_war" then
TemplateTable_Blue_Backup_CV_1 = {
--"blue_cap_f18",
"blue_cap_f4",
--"blue_cap_f14a",
--"blue_cap_f14b",
}
elseif mission_era == "modern" then
TemplateTable_Blue_Backup_CV_1 = {
"blue_cap_f18",
--"blue_cap_f4",
"blue_cap_f14a",
"blue_cap_f14b",
}
end

TemplateTable_Blue_Backup_CV_KUZ_1 = {
"blue_cap_su33",
}

TemplateTable_Blue_Backup_CV_2 = {
"Blue_CAP_Backup_CV_2",
}

---- DEBUG SETTINGS ----

enable_carrier_bombers = false
ship_bomber_amount = 1

a2a_ace_autospawn_enable = false
a2a_ace_respawn_time_min = 2400
a2a_ace_respawn_time_max = 2400

----------------
if mission_era ~= "ww2" then
capSpawnAirZones = {
CPS1,
CPS2,
CPS3,
CPS4,
CPS5,
CPS6,
CPS7,
CPS8,
CPS9,
CPS10,
}
elseif mission_era == "ww2" then
capSpawnAirZones = {CPS_HELO}
end

bomberSpawnAirZones = {
CPS_bomb1,
CPS_bomb2,
CPS_bomb3,
}

function randomizeAirZone()
	if mission_era ~= "ww2" then
		 switchAirZone = math.random (1,10)
	else
		 switchAirZone = math.random (11,11)
	end
	if switchAirZone == 1 then
		currentAirZone = CPS1
	elseif switchAirZone ==2 then
		currentAirZone = CPS2
	elseif switchAirZone ==3 then
		currentAirZone = CPS3
	elseif switchAirZone ==4 then
		currentAirZone = CPS4
	elseif switchAirZone ==5 then
		currentAirZone = CPS5
	elseif switchAirZone ==6 then
		currentAirZone = CPS6
	elseif switchAirZone ==7 then
		currentAirZone = CPS7
	elseif switchAirZone ==8 then
		currentAirZone = CPS8
	elseif switchAirZone ==9 then
		currentAirZone = CPS9
	elseif switchAirZone ==10 then
		currentAirZone = CPS10
	elseif switchAirZone == 11 then
		currentAirZone = CPS_HELO
	end
end

function randomizeBombAirZone()
	local switchBombAirZone = math.random (1,3)
	if switchBombAirZone == 1 then
		currentBombAirZone = CPS_bomb1
	elseif switchBombAirZone ==2 then
		currentBombAirZone = CPS_bomb2
	elseif switchBombAirZone ==3 then
		currentBombAirZone = CPS_bomb3
	end
end

--bombing add
showBackupSpawnDebugText = false
cap_backup_airfield_id = {}
cap_backup_cvn_id = {}
cap_backup_kuz_id = {}
timeToRemoveCapSupportMarker = 25
-- BACKUPS ARE DELETED WITH cleanupLandedBlue local function
--[[
function a2a_wingman_backup_1_start(coord, playerName, toPlayer)
-- toPlayer true or false
	local strFriendlySquadronCallsign = string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1"
	
		_G[strFriendlySquadronCallsign] = SPAWN:NewWithAlias( "A2A_Spawn_Init_Modern", strFriendlySquadronCallsign )
	
	tti.debug("CAP Airfield Backup Callsign is: " .. strFriendlySquadronCallsign, showBackupSpawnDebugText)
	
	local A2A_BLUE_BACKUP_WINGMAN_1_SPAWN = _G[strFriendlySquadronCallsign]:OnSpawnGroup(
		function ( SpawnGroup )
			
				local coordVec2 = COORDINATE:NewFromVec3(coord):GetVec2()
				local coordVec3 = COORDINATE:NewFromVec3(coord):GetVec3()
				local A2A_BLUE_BACKUP_WINGMAN_1 = a2aEscortBomberSpawn[#a2aEscortBomberSpawn]:SpawnFromVec3(A2A_BOMBING_1_ESCORT_VEC)
				local A2A_BLUE_BACKUP_WINGMAN_1_PV3 = POINT_VEC3:New(-1000, 200, 500)
				local A2A_BLUE_BACKUP_WINGMAN_1_TASK = A2A_BOMBING_ESCORT_1:TaskFollow(A2A_BOMBING_1, A2A_BOMBING_ESCORT_1_PV3:GetVec3())
				local A2A_BLUE_BACKUP_WINGMAN_1:SetTask(A2A_BOMBING_ESCORT_1_TASK, 1)
				
				local taskOrbitAtPlayer = SpawnGroup:TaskOrbitCircleAtVec2(coordVec2, 6096, 160)
				SpawnGroup:SetTask(taskOrbitAtPlayer, 1)			
	
		
		end)
		:InitRandomizeTemplate( TemplateTable_Blue_Backup_Airfield_1 )
		:Spawn()

	local A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_UNIT = A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN:GetUnit(1)
	local A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_TYPE_NAME = A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_UNIT:GetTypeName()
	local A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_GROUP_NAME = A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN:GetName()
	tti.debug("Backup from ground name is: " .. A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_GROUP_NAME)
	randomFriendlyCAPLaunchRequest(playerName, toPlayer)
	randomFriendlyLaunchNotification(A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_TYPE_NAME, "main airbase", strFriendlySquadronCallsign, 4)
	
end
--]]

--[[
function a2a_backup_wingman_1_start(clientName, groupPlayerName, groupId, coord)
-- toPlayer true or false
	local strFriendlySquadronCallsign = string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1"
		--_G[strFriendlySquadronCallsign] = SPAWN:NewWithAlias( "A2A_Spawn_Init_ZEUS", strFriendlySquadronCallsign )
		_G[strFriendlySquadronCallsign] = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_Airfield_ToPlayer_INIT", strFriendlySquadronCallsign )
	tti.debug("CAP Airfield Backup Callsign is: " .. strFriendlySquadronCallsign, showBackupSpawnDebugText)
	
	local A2A_BLUE_BACKUP_WINGMAN_1_SPAWN = _G[strFriendlySquadronCallsign]:OnSpawnGroup(
		function ( SpawnGroup )
			
				--local coordVec2 = COORDINATE:NewFromVec3(coord):GetVec2()
				--local coordVec3 = COORDINATE:NewFromVec3(coord):GetVec3()
				--local playerGroup = GROUP:FindByName(clientName)
				--local playerGroup_VEC = GROUP:FindByName(clientName):GetPointVec3()
				--local coordVec3 = COORDINATE:NewFromVec3(coord):GetVec3()
				--local playerGroup_ESCORT_VEC = playerGroup_VEC:AddX( 1000 ):AddY(200):AddZ( 400 ):GetVec3()
				local playerGroup_PV3 = POINT_VEC3:New(-1000, 200, 500)
				local taskFollowPlayer = A2A_BLUE_BACKUP_WINGMAN_1_SPAWN:TaskFollow(GROUP:FindByName(clientName), playerGroup_PV3:GetVec3())
				--local taskOrbitAtPlayer = SpawnGroup:TaskOrbitCircleAtVec2(coordVec2, 6096, 160)
				SpawnGroup:SetTask(taskFollowPlayer, 1)			
	
			
			
		end)
		:InitRandomizeTemplate( TemplateTable_Blue_Backup_Airfield_1 )
		:Spawn()
		--:SpawnFromVec3(playerGroup_ESCORT_VEC)
		
	local A2A_BLUE_BACKUP_WINGMAN_1_SPAWN_UNIT = A2A_BLUE_BACKUP_WINGMAN_1_SPAWN:GetUnit(1)
	local A2A_BLUE_BACKUP_WINGMAN_1_SPAWN_TYPE_NAME = A2A_BLUE_BACKUP_WINGMAN_1_SPAWN_UNIT:GetTypeName()
		
	--randomFriendlyCAPLaunchRequest(playerName, toPlayer)
	trigger.action.outText(groupPlayerName .." is Requesting escort for CAP support!",15)
	randomFriendlyLaunchNotification(A2A_BLUE_BACKUP_WINGMAN_1_SPAWN_TYPE_NAME, "main airbase", strFriendlySquadronCallsign, 4)

		
end
--]]




function a2a_backup_1_start(coord, playerName, toPlayer)
-- toPlayer true or false
	local strFriendlySquadronCallsign = string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1"
	if toPlayer == true then
		_G[strFriendlySquadronCallsign] = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_Airfield_ToPlayer_INIT", strFriendlySquadronCallsign )
	else
		_G[strFriendlySquadronCallsign] = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_Airfield_INIT", strFriendlySquadronCallsign )
	end
	tti.debug("CAP Airfield Backup Callsign is: " .. strFriendlySquadronCallsign, showBackupSpawnDebugText)
	
	local A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN = _G[strFriendlySquadronCallsign]:OnSpawnGroup(
		function ( SpawnGroup )
			if toPlayer == true then
				local coordVec2 = COORDINATE:NewFromVec3(coord):GetVec2()
				local coordVec3 = COORDINATE:NewFromVec3(coord):GetVec3()
				local taskOrbitAtPlayer = SpawnGroup:TaskOrbitCircleAtVec2(coordVec2, 6096, 160)
				SpawnGroup:SetTask(taskOrbitAtPlayer, 1)			
	
			else
			--nothing
			end
		end)
		:InitRandomizeTemplate( TemplateTable_Blue_Backup_Airfield_1 )
		:Spawn()
		
	local capSupportStartTime = timer.getTime()
		
	local A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_UNIT = A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN:GetUnit(1)
	local A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_TYPE_NAME = A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_UNIT:GetTypeName()
	local A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_GROUP_NAME = A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN:GetName()
	tti.debug("Backup from ground name is: " .. A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_GROUP_NAME)
	randomFriendlyCAPLaunchRequest(playerName, toPlayer)
	randomFriendlyLaunchNotification(A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_TYPE_NAME, "main airbase", strFriendlySquadronCallsign, 4)
	
	if toPlayer == true then
		if cap_backup_airfield_id[1] ~= nil then
			trigger.action.removeMark(cap_backup_airfield_id[1])	
		end	
		cap_backup_airfield_id[1] = UTILS.GetMarkID()
		local capAirfieldSupportRequestText = playerName ..": Requesting CAP support at this location\nCAP ASSIGNED TO: \n" .. strFriendlySquadronCallsign .. " [" .. A2A_BLUE_BACKUP_AIRFIELD_1_SPAWN_TYPE_NAME .. "]"
		trigger.action.markToAll(cap_backup_airfield_id[1], capAirfieldSupportRequestText, coord:GetVec3(), false)	
	end
	
	timer.scheduleFunction(function()
		local capSupportFinishTime = timer.getTime()
		local capSupportElapsedTime = capSupportFinishTime - capSupportStartTime
		if capSupportElapsedTime >= (timeToRemoveCapSupportMarker * 60) and cap_backup_airfield_id[1] ~=nil then
			trigger.action.removeMark(cap_backup_airfield_id[1])	
			trigger.action.outText(playerName .. " is no longer requesting CAP support. Removing map marker.", 60)
		end
	end, nil, timer.getTime() + (timeToRemoveCapSupportMarker * 60)  )
end

function a2a_backup_cv_1_start(coord, playerName, toPlayer)
	if cv_cvn_spawned == true then
		local strFriendlySquadronCallsign = string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1"
		if toPlayer == true then
			_G[strFriendlySquadronCallsign] = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_ToPlayer_CV_INIT", strFriendlySquadronCallsign )
		else
			_G[strFriendlySquadronCallsign] = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_CV_INIT", strFriendlySquadronCallsign )	
		end
		tti.debug("CAP US Carrier Backup Callsign is: " .. strFriendlySquadronCallsign, showBackupSpawnDebugText)
		local A2A_BLUE_BACKUP_CV_1_SPAWN = _G[strFriendlySquadronCallsign]:OnSpawnGroup(
			function ( SpawnGroup )
			
			if toPlayer == true then
				local coordVec2 = COORDINATE:NewFromVec3(coord):GetVec2()
				local coordVec3 = COORDINATE:NewFromVec3(coord):GetVec3()
				local taskOrbitAtPlayer = SpawnGroup:TaskOrbitCircleAtVec2(coordVec2, 6096, 160)
				SpawnGroup:SetTask(taskOrbitAtPlayer, 1)		
				
			else
			--nothing
			end
			
			end)
			:InitRandomizeTemplate( TemplateTable_Blue_Backup_CV_1 )
			:Spawn()
			
		local capSupportStartTime = timer.getTime()	
			
		local A2A_BLUE_BACKUP_CV_1_SPAWN_UNIT = A2A_BLUE_BACKUP_CV_1_SPAWN:GetUnit(1)
		local A2A_BLUE_BACKUP_CV_1_SPAWN_TYPE_NAME = A2A_BLUE_BACKUP_CV_1_SPAWN_UNIT:GetTypeName()
		randomFriendlyCAPLaunchRequest(playerName, toPlayer)
		randomFriendlyLaunchNotification(A2A_BLUE_BACKUP_CV_1_SPAWN_TYPE_NAME, Unit.getByName("CVN-7X"):getTypeName(), strFriendlySquadronCallsign, 4)
		
		
	if toPlayer == true then

		if cap_backup_cvn_id[1] ~= nil then
			trigger.action.removeMark(cap_backup_cvn_id[1])	
		end	
		cap_backup_cvn_id[1] = UTILS.GetMarkID()
		local capAirfieldSupportRequestText = playerName ..": Requesting CAP support at this location\nCAP ASSIGNED TO: \n" .. strFriendlySquadronCallsign .. " [" .. A2A_BLUE_BACKUP_CV_1_SPAWN_TYPE_NAME .. "]"
		trigger.action.markToAll(cap_backup_cvn_id[1], capAirfieldSupportRequestText, coordVec3, false)	
	end
	
	timer.scheduleFunction(function()
		local capSupportFinishTime = timer.getTime()
		local capSupportElapsedTime = capSupportFinishTime - capSupportStartTime
		if capSupportElapsedTime >= (timeToRemoveCapSupportMarker * 60) and cap_backup_cvn_id[1] ~= nil then
			trigger.action.removeMark(cap_backup_cvn_id[1])	
			trigger.action.outText(playerName .. " is no longer requesting CAP support. Removing map marker.", 60)
		end
	end, nil, timer.getTime() + (timeToRemoveCapSupportMarker * 60)  )
		
	else
		tti.debug("Cannot spawn CVN CAP Backup, CVN carrier is unavailable.",true)
	end
end

function a2a_backup_cv_kuz_1_start(coord, playerName, toPlayer)
	if cv_kuz_spawned == true then
		local strFriendlySquadronCallsign = string.upper(friendlySquadronCallsign[math.random(1,#friendlySquadronCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1"
		if toPlayer == true then
		_G[strFriendlySquadronCallsign] = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_ToPlayer_CV_KUZ_INIT", strFriendlySquadronCallsign, 4 )
		else
		_G[strFriendlySquadronCallsign] = SPAWN:NewWithAlias( "Blue_CAP_A2A_Backup_CV_KUZ_INIT", strFriendlySquadronCallsign, 4 )
		end
		tti.debug("CAP RU Carrier Backup Callsign is: " .. strFriendlySquadronCallsign, showBackupSpawnDebugText)

		local A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN = _G[strFriendlySquadronCallsign]:OnSpawnGroup(
			function ( SpawnGroup )
			
			if toPlayer == true then
				local coordVec2 = COORDINATE:NewFromVec3(coord):GetVec2()
				local coordVec3 = COORDINATE:NewFromVec3(coord):GetVec3()
				local taskOrbitAtPlayer = SpawnGroup:TaskOrbitCircleAtVec2(coordVec2, 6096, 160)
				SpawnGroup:SetTask(taskOrbitAtPlayer, 1)	
			else
			--nothing
			end			
			
			end)
			:InitRandomizeTemplate( TemplateTable_Blue_Backup_CV_KUZ_1 )
			:Spawn()
			
		local capSupportStartTime = timer.getTime()	
		
		local A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN_UNIT = A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN:GetUnit(1)
		local A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN_TYPE_NAME = A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN_UNIT:GetTypeName()
		randomFriendlyCAPLaunchRequest(playerName, toPlayer)
		randomFriendlyLaunchNotification(A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN_TYPE_NAME, Unit.getByName("CV Kuznetsov"):getTypeName(), strFriendlySquadronCallsign, 4)
		
		if toPlayer == true then
			if cap_backup_kuz_id[1] ~= nil then
				trigger.action.removeMark(cap_backup_kuz_id[1])	
			end	
			cap_backup_kuz_id[1] = UTILS.GetMarkID()
			local capAirfieldSupportRequestText = playerName ..": Requesting CAP support at this location\nCAP ASSIGNED TO: \n" .. strFriendlySquadronCallsign .. " [" .. A2A_BLUE_BACKUP_CV_KUZ_1_SPAWN_TYPE_NAME .. "]"
			trigger.action.markToAll(cap_backup_kuz_id[1], capAirfieldSupportRequestText, coordVec3, false)	
		end
		
	timer.scheduleFunction(function()
		local capSupportFinishTime = timer.getTime()
		local capSupportElapsedTime = capSupportFinishTime - capSupportStartTime
		if capSupportElapsedTime >= (timeToRemoveCapSupportMarker * 60) and cap_backup_kuz_id[1] ~=nil then
			trigger.action.removeMark(cap_backup_kuz_id[1])	
			trigger.action.outText(playerName .. " is no longer requesting CAP support. Removing map marker.", 60)
		end
	end, nil, timer.getTime() + (timeToRemoveCapSupportMarker * 60)  )
	
	
	else
	tti.debug("Cannot spawn KUZ CAP Backup, KUZ carrier is unavailable.",true)
	end
end

if mission_era == "ww2" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_EASY_WW2, "red_cap_b17g")
table.insert(TemplateTable_EASY_WW2, "red_cap_ju88a4")

table.insert(TemplateTable_NORMAL_WW2, "red_cap_b17g")
table.insert(TemplateTable_NORMAL_WW2, "red_cap_ju88a4")

table.insert(TemplateTable_HARD_WW2, "red_cap_b17g")
table.insert(TemplateTable_HARD_WW2, "red_cap_ju88a4")

table.insert(TemplateTable_ALL_WW2, "red_cap_b17g")
table.insert(TemplateTable_ALL_WW2, "red_cap_ju88a4")

table.insert(TemplateTable_Bombing_WW2, "red_bomber_route_ju88a4")
table.insert(TemplateTable_Bombing_WW2, "red_bomber_route_b17g")
end

if mission_era == "korean_war" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_EASY_KOREANWAR, "red_cap_b17g")
table.insert(TemplateTable_EASY_KOREANWAR, "red_cap_ju88a4")

table.insert(TemplateTable_NORMAL_KOREANWAR, "red_cap_b17g")
table.insert(TemplateTable_NORMAL_KOREANWAR, "red_cap_ju88a4")

table.insert(TemplateTable_HARD_KOREANWAR, "red_cap_b17g")
table.insert(TemplateTable_HARD_KOREANWAR, "red_cap_ju88a4")

table.insert(TemplateTable_ALL_KOREANWAR, "red_cap_b17g")
table.insert(TemplateTable_ALL_KOREANWAR, "red_cap_ju88a4")

table.insert(TemplateTable_Bombing_KOREANWAR, "red_bomber_route_ju88a4")
table.insert(TemplateTable_Bombing_KOREANWAR, "red_bomber_route_b17g")
end

a2aEasySpawn = {}
a2aNormSpawn = {}
a2aHardSpawn = {}
a2aAllSpawn = {}
a2aConstantSpawn = {}
a2aHeloSpawn = {}
--DETERMINE SPAWN SETUP BASED ON ERA
if mission_era == "modern" or mission_era == "cold_war" then
	initAirEraTemplate = "A2A_Spawn_Init_Modern"
	elseif mission_era == "ww2" or mission_era == "korean_war" then
	initAirEraTemplate = "A2A_Spawn_Init_15k"
end

TemplateTable_EASY = {}
TemplateTable_NORMAL = {}
TemplateTable_ALL = {}
TemplateTable_Bombing_Escort = {}
TemplateTable_Antiship_Escort = {}
TemplateTable_Bombing = {}
TemplateTable_Antiship = {}
TemplateTable_Helo = {}
TemplateTable_Blue_Backup_Airfield_1 = {}

if mission_era == "modern" then
TemplateTable_EASY = TemplateTable_EASY_MODERN
TemplateTable_NORMAL = TemplateTable_NORMAL_MODERN
TemplateTable_HARD = TemplateTable_HARD_MODERN
TemplateTable_ALL = TemplateTable_ALL_MODERN
TemplateTable_Bombing_Escort = TemplateTable_Bombing_Escort_MODERN
TemplateTable_Antiship_Escort = TemplateTable_Antiship_Escort_MODERN
TemplateTable_Bombing = TemplateTable_Bombing_MODERN
TemplateTable_Antiship = TemplateTable_Antiship_MODERN
TemplateTable_Helo = TemplateTable_Helo_MODERN
TemplateTable_Blue_Backup_Airfield_1 = TemplateTable_Blue_Backup_Airfield_1_MODERN
end

if mission_era == "cold_war" then
TemplateTable_EASY = TemplateTable_EASY_COLDWAR
TemplateTable_NORMAL = TemplateTable_NORMAL_COLDWAR
TemplateTable_HARD = TemplateTable_HARD_COLDWAR
TemplateTable_ALL = TemplateTable_ALL_COLDWAR
TemplateTable_Bombing_Escort = TemplateTable_Bombing_Escort_COLDWAR
TemplateTable_Antiship_Escort = TemplateTable_Antiship_Escort_COLDWAR
TemplateTable_Bombing = TemplateTable_Bombing_COLDWAR
TemplateTable_Antiship = TemplateTable_Antiship_COLDWAR
TemplateTable_Helo = TemplateTable_Helo_COLDWAR
TemplateTable_Blue_Backup_Airfield_1 = TemplateTable_Blue_Backup_Airfield_1_COLDWAR
end

if mission_era == "korean_war" then
TemplateTable_EASY = TemplateTable_EASY_KOREANWAR
TemplateTable_NORMAL = TemplateTable_NORMAL_KOREANWAR
TemplateTable_HARD = TemplateTable_HARD_KOREANWAR
TemplateTable_ALL = TemplateTable_ALL_KOREANWAR
TemplateTable_Bombing_Escort = TemplateTable_Bombing_Escort_KOREANWAR
TemplateTable_Antiship_Escort = TemplateTable_Antiship_Escort_KOREANWAR
TemplateTable_Bombing = TemplateTable_Bombing_KOREANWAR
TemplateTable_Antiship = TemplateTable_Antiship_KOREANWAR
TemplateTable_Helo = TemplateTable_Helo_KOREANWAR
TemplateTable_Blue_Backup_Airfield_1 = TemplateTable_Blue_Backup_Airfield_1_KOREANWAR
end

if mission_era == "ww2" then
TemplateTable_EASY = TemplateTable_EASY_WW2
TemplateTable_NORMAL = TemplateTable_NORMAL_WW2
TemplateTable_HARD = TemplateTable_HARD_WW2
TemplateTable_ALL = TemplateTable_ALL_WW2
TemplateTable_Bombing_Escort = TemplateTable_Bombing_Escort_WW2
TemplateTable_Antiship_Escort = TemplateTable_Antiship_Escort_WW2
TemplateTable_Bombing = TemplateTable_Bombing_WW2
TemplateTable_Antiship = TemplateTable_Antiship_WW2
TemplateTable_Helo = TemplateTable_Helo_WW2
TemplateTable_Blue_Backup_Airfield_1 = TemplateTable_Blue_Backup_Airfield_1_WW2
end

function a2a_easy_start()  --1 per group
	a2aEasySpawn[#a2aEasySpawn+1] = SPAWN:NewWithAlias( initAirEraTemplate, "A2A_EASY-"..#a2aEasySpawn )
		:InitGrouping(a2aEasyMaxGroupSize)
		:InitRandomizeTemplate( TemplateTable_EASY )
		:InitRandomizeRoute( 1, 1, 20000 )
		:InitLimit( maxActiveEnemyAirGroups, 0 )
	a2aEasySpawn[#a2aEasySpawn]:SpawnInZone( capSpawnAirZones[math.random(1,#capSpawnAirZones)], true, a2a_min_alt, a2a_max_alt )
end

function a2a_norm_start()  --2 per group
	a2aNormSpawn[#a2aNormSpawn+1] = SPAWN:NewWithAlias( initAirEraTemplate, "A2A_NORM-"..#a2aNormSpawn )
		:InitGrouping(a2aNormMaxGroupSize)
		:InitRandomizeTemplate( TemplateTable_NORMAL )
		:InitRandomizeRoute( 1, 1, 20000 ) 	
		:InitLimit( maxActiveEnemyAirGroups, 0 )
	a2aNormSpawn[#a2aNormSpawn]:SpawnInZone( capSpawnAirZones[math.random(1,#capSpawnAirZones)], true, a2a_min_alt, a2a_max_alt )
end

function a2a_hard_start()  --2 per group
	a2aHardSpawn[#a2aHardSpawn+1] = SPAWN:NewWithAlias( initAirEraTemplate, "A2A_HARD-"..#a2aHardSpawn )
		:InitGrouping(a2aHardMaxGroupSize)
		:InitRandomizeTemplate( TemplateTable_HARD )
		:InitRandomizeRoute( 1, 1, 20000 ) 	
		:InitLimit( maxActiveEnemyAirGroups, 0 )
	a2aHardSpawn[#a2aHardSpawn]:SpawnInZone( capSpawnAirZones[math.random(1,#capSpawnAirZones)], true, a2a_min_alt, a2a_max_alt )
end

function a2a_all_start() --2 per group
	a2aAllSpawn[#a2aAllSpawn+1] = SPAWN:NewWithAlias( initAirEraTemplate, "A2A_ALL-"..#a2aAllSpawn )
		:InitGrouping(a2aNormMaxGroupSize)
		:InitRandomizeTemplate( TemplateTable_ALL )
		:InitRandomizeRoute( 1, 1, 20000 )
		:InitLimit( maxActiveEnemyAirGroups, 0 )
	a2aAllSpawn[#a2aAllSpawn]:SpawnInZone( capSpawnAirZones[math.random(1,#capSpawnAirZones)], true, a2a_min_alt, a2a_max_alt )
end

a2a_constant_groups = {}
a2a_constant_debug = false
a2a_constant_alive = false
constantA2aSpawnMain = {}

startedConstantDetection = false
function main_constant_a2a()
	if a2a_autospawn_enable == true then  --25 min
		timer.scheduleFunction(function()
			if a2a_constant_alive == false then
				a2a_constant_start(maxConstantAirGroupsAllowed)
				tti.debug("A2A Constant Spawn Initiated!",a2a_constant_debug)
			else
			tti.debug("A2A Constant Spawn skipped due to [a2a_constant_alive] being false!",a2a_constant_debug)
			end
		end, nil, timer.getTime() + constantAirSpawnDelayAfterKilled  )
	end
end

function a2a_constant_start(numConstantA2Agroups)

    numConstantA2Agroups = numConstantA2Agroups or 1  -- Default to 1 if no argument is provided
	
    for i = 1, numConstantA2Agroups do
		
		local constantSpawnObject
		constantA2aSpawnMain[#constantA2aSpawnMain + 1] = constantSpawnObject
		constantSpawnObject = SPAWN:NewWithAlias(initAirEraTemplate, "A2A_CONSTANT-" .. i)
            :InitGrouping(a2aNormMaxGroupSize)
            :InitRandomizeTemplate(TemplateTable_ALL)
            :InitRandomizeRoute(1, 1, 20000)
            :InitLimit(maxActiveEnemyAirGroups, 0)

        -- Add the spawn object to the array
       -- constantA2aSpawnMain[#constantA2aSpawnMain + 1] = constantSpawnObject

        -- Set up the OnSpawnGroup handler correctly
        constantSpawnObject:OnSpawnGroup(function(SpawnGroup)
            constantA2aSpawnGroupName = SpawnGroup:GetName()
        end)

        -- Finally, spawn in zone
		local spawnAirGroup = constantSpawnObject:SpawnInZone(capSpawnAirZones[math.random(1, #capSpawnAirZones)], true, a2a_min_alt, a2a_max_alt)
		--constantSpawnObject:SpawnInZone(capSpawnAirZones[math.random(1, #capSpawnAirZones)], true, a2a_min_alt, a2a_max_alt)
			
		a2a_constant_alive = true
		a2a_constant_spawned = true
        -- Track the spawned group
        table.insert(a2a_constant_groups, spawnAirGroup)
		
    end
	
	if startedConstantDetection == false then
		timer.scheduleFunction(function()
			main_detection_constant_a2a()
			tti.debug("A2A Constant Spawn Detection Started!",a2a_constant_debug)
		end, nil, timer.getTime() + 5  )
	end

	trigger.action.outText( "<< Enemy fighters are in the area! >>", 7)
	trigger.action.outSound("TTI Soundfiles/AC04 Beep.ogg" )
 

end

function main_detection_constant_a2a()
startedConstantDetection = true
--timer.scheduleFunction(main_detection_constant_a2a, {}, timer.getTime() + main_detection_time)
main_detection_constant_a2a_timer = timer.scheduleFunction(main_detection_constant_a2a, {}, timer.getTime() + 65)

    -- Iterate through the list backwards to safely remove elements
	
	local aliveGroups = tti.tableFilter(a2a_constant_groups, function(group) return group:IsAlive() end)
	tti.debug("Detecting A2A Constant Group Objects: [" .. #a2a_constant_groups .. "] A2A Constant Groups remain out of [" .. maxConstantAirGroupsAllowed .. "] max groups allowed.",a2a_constant_debug)
    -- Check if the list is now empty
   if #aliveGroups == 0 then
		a2a_constant_alive = false
        main_constant_a2a()  -- Notify function
        a2a_constant_cooled_down = false
        a2a_constant_spawned = false
        --tti.debug(constantA2aSpawnGroupName .. " is not alive! Respawning now!")
		a2a_constant_groups = {}
		timer.removeFunction(main_detection_constant_a2a_timer)
        tti.debug("Constant group was destroyed, respawning A2A Constant in " .. constantAirSpawnDelayAfterKilled .. " seconds.",a2a_constant_debug)
    else
        tti.debug("a2a_constant_groups groups are still alive! Respawn skipped...",a2a_constant_debug)
		a2a_constant_alive = true
    end
end

function a2a_helo_start() --2 per group
	a2aHeloSpawn[#a2aHeloSpawn+1] = SPAWN:NewWithAlias( "A2A_Spawn_Init_HELO", "A2A_HELO-"..#a2aHeloSpawn )
		:InitGrouping(a2aNormMaxGroupSize)
		:InitRandomizeTemplate( TemplateTable_Helo )
		:InitRandomizeRoute( 1, 1, 20000 )
		:InitLimit( maxActiveEnemyAirGroups, 0 )
	a2aHeloSpawn[#a2aHeloSpawn]:SpawnInZone( CPS_HELO, true, 2100, 2200 )
end

function a2a_ace_start_kill_count()
	if a2a_ace_started ~= true then
		playerAircraftKillCount = 0
		
		timer.scheduleFunction(function()
			trigger.action.outText("<< Status Report - Air Superiority Update >>\n\nGreat work out there! Our fighters are really putting a lot of pressure on the enemy's airspace! However, we have intel that they will be sending out their elite squadron soon!\n", 17) 
			trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
		end, nil, timer.getTime() + 6  )
	
		timer.scheduleFunction(function()
			a2a_ace_menu_start()
		end, nil, timer.getTime() + 23  )
	
	end
end

function a2a_ace_start() --2 per group
	a2a_ace_started = true
	currentEnemyAceSquadronCallsign = string.upper(enemySquadronCallsign[math.random(1,#enemySquadronCallsign)])
	strEnemySquadronCallsign = currentEnemyAceSquadronCallsign .." ".. tostring(math.random (1,9)) .. "-1"
	tti.debug("A2A Ace Callsign is: " .. strEnemySquadronCallsign, showBackupSpawnDebugText)
	
--if mission_era == "modern" or mission_era == "cold_war" then
	_G[strEnemySquadronCallsign] = SPAWN:NewWithAlias( initAirEraTemplate, strEnemySquadronCallsign )

	A2A_Ace_Spawn = _G[strEnemySquadronCallsign]:OnSpawnGroup(
	function( SpawnGroup )
		--A2A_Ace_Spawn_Group_Name = SpawnGroup:GetName()
	end)
	:InitRandomizeTemplate( TemplateTable_HARD )
	:InitRandomizeRoute( 1, 1, 20000 ) 		
	:SpawnInZone( capSpawnAirZones[math.random(1,#capSpawnAirZones)], true, a2a_min_alt, a2a_max_alt )

--end

	A2A_Ace_Spawn_Unit = A2A_Ace_Spawn:GetUnit(1)
	A2A_Ace_Spawn_Group_Name = A2A_Ace_Spawn:GetName()
	A2A_Ace_Spawn_Type_Name = A2A_Ace_Spawn_Unit:GetTypeName()
	a2aAceLaunchNotification(A2A_Ace_Spawn_Type_Name, A2A_Ace_Spawn_Group_Name)
	
	
	timer.scheduleFunction(function() 
	a2a_ace_alive_check()
	end, nil, timer.getTime() + 2 )

end


function a2a_ace_alive_check()
local aliveCheckFunction = timer.scheduleFunction(a2a_ace_alive_check, {}, timer.getTime() + 5) 
	Current_A2A_Ace_Group_Name = A2A_Ace_Spawn_Group_Name
	Current_A2A_Ace_Type_Name = A2A_Ace_Spawn_Type_Name
	
	--timer.scheduleFunction(function()
		if a2a_ace_started == true then
			env.info("TTI: A2A Ace Group: " .. Current_A2A_Ace_Group_Name .." status:")
			if A2A_Ace_Spawn:IsAlive() == true then
			--if A2A_Ace_Spawn:GetUnits() <= 1 then
				env.info("TTI: A2A Ace Group: " .. Current_A2A_Ace_Group_Name .." is alive!")
			else
				env.info("TTI: A2A Ace Group: " .. Current_A2A_Ace_Group_Name .." is destroyed!")
				a2aAceDefeatedNotification(currentEnemyAceSquadronCallsign, Current_A2A_Ace_Type_Name)
				a2a_ace_started = false
				timer.removeFunction(aliveCheckFunction)
			end
		end
--end, nil, timer.getTime() + 5 )
end

-- X - direction in parallel to object heading
-- Y - altitude/elevation/height above ground
-- Z - direction perpenidcular to object heading.

 -- So -1000,200,500 should be 1000m behind, 200m above, and 500m to one side. 
--bombing add
a2aBombingSpawn = {}
a2aAntishipSpawn = {}
a2aEscortBomberSpawn = {}
a2aEscortAntishipSpawn = {}

TemplateTable_Bombing_ALL_Test = {
"red_bomber_route_tu23m",
"red_bomber_route_hj6",
"red_bomber_route_b1b",
"red_bomber_route_b52h",
"red_bomber_route_a20g",
"red_bomber_route_su25",
"red_bomber_route_su34",
"red_bomber_route_tornadogr4",
"red_bomber_route_mosquito",
"red_bomber_route_a10c",
}

--TemplateTable_Bombing = TemplateTable_Bombing_ALL_Test

function a2a_bombing_start()
	if enable_airbase_bombers == true then
	
		a2aBombingSpawn[#a2aBombingSpawn+1] = SPAWN:NewWithAlias( TemplateTable_Bombing[math.random(1,#TemplateTable_Bombing)], "A2A_Bomber-"..#a2aBombingSpawn )
		--a2aBombingSpawn[#a2aBombingSpawn+1] = SPAWN:NewWithAlias( a2a_bomber_template_unit, "A2A_Bomber-"..#a2aBombingSpawn )
		--a2aBombingSpawn[#a2aBombingSpawn+1] = SPAWN:NewWithAlias( "A2A_Spawn_Init_Bombing", "A2A_Bomber-"..#a2aBombingSpawn )
		--a2aBombingSpawn[#a2aBombingSpawn+1] = SPAWN:NewWithAlias( "A2A_Spawn_Init_Bombing_SinglePoint", "A2A_Bomber-"..#a2aBombingSpawn )
		--:InitRandomizeTemplate( TemplateTable_Bombing )
		for i=1, ground_bomber_amount do
		A2A_BOMBING_1 = a2aBombingSpawn[#a2aBombingSpawn]:SpawnInZone( bomberSpawnAirZones[math.random(1,#bomberSpawnAirZones)], true, 8000, 8000 )
		A2A_BOMBING_1_VEC = A2A_BOMBING_1:GetPointVec3()
		--A2A_BOMBING_1_TASK = A2A_BOMBING_1:TaskBombing(a2a_bombing_target_1_vec2)
		--A2A_BOMBING_1:SetTask(A2A_BOMBING_1_TASK,1)
		A2A_BOMBING_1_ESCORT_VEC = A2A_BOMBING_1_VEC:AddX( 1000 ):AddY(200):AddZ( 400 ):GetVec3()
		end
	end
	
	if enable_carrier_bombers == true then
		if carrierOpsTheatre == true then
			a2aAntishipSpawn[#a2aAntishipSpawn+1] = SPAWN:NewWithAlias( "A2A_Spawn_Init_ANTISHIP", "A2A_Antiship-"..#a2aAntishipSpawn )
			:InitRandomizeTemplate( TemplateTable_Antiship )
			for i=1, ship_bomber_amount do
			A2A_ANTISHIP_1 = a2aAntishipSpawn[#a2aAntishipSpawn]:SpawnInZone( bomberSpawnAirZones[math.random(1,#bomberSpawnAirZones)], true, 8000, 8000 )
			A2A_ANTISHIP_1_VEC = A2A_ANTISHIP_1:GetPointVec3()
			A2A_ANTISHIP_1_ESCORT_VEC = A2A_ANTISHIP_1_VEC:AddX( 1000 ):AddY(200):AddZ( 400 ):GetVec3()
			end
		end
	end
	
	if enable_airbase_bombers == true and enable_bomber_escorts == true then
		env.info("A2A_Bombing_Escort: " .. UTILS.OneLineSerialize(A2A_BOMBING_ESCORT))
		a2aEscortBomberSpawn[#a2aEscortBomberSpawn+1] = SPAWN:NewWithAlias( "A2A_Spawn_Init_Bombing_Escort", "A2A_Bomber_Escort-"..#a2aEscortBomberSpawn )
		:InitRandomizeTemplate( TemplateTable_Bombing_Escort )
		A2A_BOMBING_ESCORT_1 = a2aEscortBomberSpawn[#a2aEscortBomberSpawn]:SpawnFromVec3(A2A_BOMBING_1_ESCORT_VEC)
		A2A_BOMBING_ESCORT_1_PV3 = POINT_VEC3:New(-1000, 200, 500)
		A2A_BOMBING_ESCORT_1_TASK = A2A_BOMBING_ESCORT_1:TaskFollow(A2A_BOMBING_1, A2A_BOMBING_ESCORT_1_PV3:GetVec3())
		A2A_BOMBING_ESCORT_1:SetTask(A2A_BOMBING_ESCORT_1_TASK, 1)
	end
	
	if enable_carrier_bombers == true and enable_bomber_escorts == true then
		if carrierOpsTheatre == true then
		a2aEscortAntishipSpawn[#a2aEscortAntishipSpawn+1] = SPAWN:NewWithAlias( "A2A_Spawn_Init_ANTISHIP_Escort", "A2A_Antiship_Escort-"..#a2aEscortAntishipSpawn )
		:InitRandomizeTemplate( TemplateTable_Antiship_Escort )
		A2A_ANTISHIP_ESCORT_1 = a2aEscortAntishipSpawn[#a2aEscortAntishipSpawn]:SpawnFromVec3(A2A_ANTISHIP_1_ESCORT_VEC)
		A2A_ANTISHIP_ESCORT_1_PV3 = POINT_VEC3:New(-1000, 200, 500)
		A2A_ANTISHIP_ESCORT_1_TASK = A2A_ANTISHIP_ESCORT_1:TaskFollow(A2A_ANTISHIP_1, A2A_ANTISHIP_ESCORT_1_PV3:GetVec3())
		A2A_ANTISHIP_ESCORT_1:SetTask(A2A_ANTISHIP_ESCORT_1_TASK, 1)
		end
	end
end


friendlySquadronCallsign = {
"Shark",
"Jackal",
"Pandion",
"Demon",
"Condor",
"Kestrel",
"Ghost",
"Bear",
"Ember",
"Inferno",
"Defender",
"Slayer",
"Dragon",
"Spiker",
"Blackwing",
"Darkwing",
"Shadow",
"Chaos",
"Nebula",
"Crimson",
"Vampire",
"Killer",
"Mobius",
"Scarface",
"Crow",
"Shield",
"Spectre",
"Hokage",
"Savage",
"Raveger",
"Penetrator",
"Wanderer",
"Seagull",
"Predator",
"Slicer",
"Slasher",
"Wild",
"Weasel",
"Steel",
--IRL
"Royal",
"Stinger",
"Screaming Eagle",
"Trail Blazer",
"Red Devil",
"Gambler",
"Headhunter",
"Lobo",
"Vulture",
"Panther",
"Warhawk",
"Grim Reaper",
"Reaper",
"Valkyrie",
"Bull Dog",
"Skull",
"Ghost Rider",
"Star Warrior",
"Gray Wolf",
"Cougar",
"Yellowjacket",
"Rook",
"Gauntlet",
"Black Raven",
"Wizard",
"Viking",
"Scorpion",
--AC
"Spare",
"Strider",
"Razgriz",
--"Grabacr",
"Warwolf",
"Wardog",
"Garuda",
"Galm",
"Gault",
"Grun",
"Grendel",
--"Sol",
--"Strigon",
"Lancer",
--"Yellow",
"Gryphus",
"Varona",
"Lion",
"Avalanche",
}

enemySquadronCallsign = {
--"Shark",
--"Jackal",
--"Pandion",
--"Demon",
--"Condor",
--"Kestrel",
--"Ghost",
--"Bear",
--"Ember",
--"Inferno",
--"Defender",
--"Slayer",
--"Dragon",
--"Spiker",
--"Blackwing",
--"Darkwing",
--"Shadow",
--"Chaos",
--"Nebula",
--"Crimson",
--"Vampire",
--"Killer",
"Wrath",
"Wraith",
"Siren",
"Kraken",
"Megalith Defense",
"Heartless",
"Organization XII",
"Star Wolf",
"G.U.N.",
"Talon",
"Blackwatch",
"Edgelord",
"Cerberus",
"Hydra",
--"Incel",
"Uruk-Hai",
"Akatsuki",
--"Generic Evil",
"Principality of Zeon",
"Republic of Zeon",
"Zeon",
"OPA",
"Shinra",
"Syndicate",
"Umbrella Corp",
"Cobra Command",
"Decepticon",

--AC
--"Spare",
--"Strider",
--"Razgriz",
"Grabacr",
"Schnee",
--"Warwolf",
--"Wardog",
--"Garuda",
--"Galm",
--"Gault",
--"Grun",
--"Grendel",
"Sol",
"SOLG",
"Strigon",
--"Lancer",
"Yellow",
--"Gryphus",
--"Varona",
--"Lion",
}

playerAircraftKillCount = 0

function a2aAceLaunchNotification(planeType, currentEnemyAceSquadronCallsign)

--currentEnemyAceSquadronCallsign = enemySquadronCallsign[math.random(1,#enemySquadronCallsign)]
--currentEnemyAceSquadronCallsign = enemySquadronCallsign[math.random(1,#enemySquadronCallsign)]

local switch = math.random (1,8)
	if switch == 1 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"Eject while you can still talk!\"\n", 14)
		if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC04-EjectWhileYouCanStillTalk.ogg")
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 2 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"Sweep them from our skies!\"\n", 14)
		if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC04-SweepThemFromOurSkies.ogg")
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 3 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"Engage as a formation. No single-ship attacks.\"\n", 14)
			if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC04-EngageAsAFormationNoSingleShipAttacks.ogg")
				elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 4 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"It's time for you to die!\"\n", 14)
			if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-ItsTimeForYouToDie.ogg")
						elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 5 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"We will decide once and for all who is superior!\"\n", 14)
			if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-WeWillDecideOnceAndForAllWhoIsSuperior.ogg")
				elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 6 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"It's over! Say your prayers!\"\n", 14)
			if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-ItsOverSayYourPrayers.ogg")
				elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 7 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"I'm going to finish this now, once and for all!\"\n", 14)
			if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-ImGoingToFinishThisNowOnceAndForAll.ogg")
				elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 8 then
		trigger.action.outText( 
			"<< ++ Enemy Ace [" .. planeType .. "] Squadron Approaching ++ >>" ..
			"\n" ..
			"\n" .. string.upper(currentEnemyAceSquadronCallsign) .." SQUADRON PILOT:\n\"Proceed as planned.\"\n", 14)
			if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-ProceedAsPlanned.ogg")
				elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	end
end

function a2aAceDefeatedNotification(groupCallsign, typeName)
	local switch = math.random (1,4)
	if switch == 1 then
		trigger.action.outText( "<< Enemy Ace [" .. typeName .. "] Squadron Status: >>\n++ \"" .. string.upper(groupCallsign) .. " SQUADRON\" destroyed! ++\n" ..
		"\n[MISSION ACCOMPLISHED]\n" ..
		"\n" .. string.upper(groupCallsign) .. " SQUADRON PILOT:\n\"We'll be back. You can count on it.\"\n", 14)
		if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-WellBeBackYouCanCountOnIt.ogg" )
						elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 2 then
		trigger.action.outText( "<< Enemy Ace [" .. typeName .. "] Squadron Status: >>\n++ \"" .. string.upper(groupCallsign) .. " SQUADRON\" destroyed! ++\n" ..
		"\n[MISSION ACCOMPLISHED]\n" ..
		"\n" .. string.upper(groupCallsign) .. " SQUADRON PILOT:\n\"Our fate is sealed...\"\n", 14)
		if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-OurFateIsSealed.ogg" )
						elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 3 then
		trigger.action.outText( "<< Enemy Ace [" .. typeName .. "] Squadron Status: >>\n++ \"" .. string.upper(groupCallsign) .. " SQUADRON\" destroyed! ++\n" ..
		"\n[MISSION ACCOMPLISHED]\n" ..
		"\n" .. string.upper(groupCallsign) .. " SQUADRON PILOT:\n\"Let them celebrate for now...\"\n", 14)
		if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-LetThemCelebrateForNow.ogg" )
						elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	elseif switch == 4 then
		trigger.action.outText( "<< Enemy Ace [" .. typeName .. "] Squadron Status: >>\n++ \"" .. string.upper(groupCallsign) .. " SQUADRON\" destroyed! ++\n" ..
		"\n[MISSION ACCOMPLISHED]\n" ..
		"\n" .. string.upper(groupCallsign) .. " SQUADRON PILOT:\n\"These guys are even better than I imagined!\"\n", 14)
		if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/AC5-TheseGuysAreEvenBetterThanIImagined.ogg" )
						elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
	end
	
	timer.scheduleFunction(function()
		trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
	end, nil, timer.getTime() + 3  )
	--playerAircraftKillCount = 0
end

function randomFriendlyCAPLaunchRequest(playerName, toPlayer)

local switch = math.random (1,3)
	if switch == 1 then
	trigger.action.outText("<< Requesting friendly CAP Reinforcements >>\nScramble additional fighters to the AO!",5)
	if toPlayer == true then
	trigger.action.outText("CAP Requested by: " .. playerName .. "\nCAP will scramble to " .. playerName .. "'s position where the request was made, marked on the F10 Map",10)
	else
	end
	if voice_lines_audio == "enabled" then
	trigger.action.outSound("TTI Soundfiles/ScrambleAdditionalFightersToTheAO.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
	elseif voice_lines_audio == "silent" then
	end
	elseif switch == 2 then
	trigger.action.outText("<< Requesting friendly CAP Reinforcements >>\nLaunch additional fighter aircraft!",5)
	if toPlayer == true then
	trigger.action.outText("CAP Requested by: " .. playerName .. "\nCAP will scramble to their last known position, marked on the F10 Map",10)
	else
	end
	if voice_lines_audio == "enabled" then
	trigger.action.outSound("TTI Soundfiles/LaunchAdditionalFighterAircraft.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
	elseif switch == 3 then
	trigger.action.outText("< Requesting friendly CAP Reinforcements >>\nWe need to reclaim air superiority!",5)
	if toPlayer == true then
	trigger.action.outText("CAP Requested by: " .. playerName .. "\nCAP will scramble to their last known position, marked on the F10 Map",10)
	else
	end
	if voice_lines_audio == "enabled" then
	trigger.action.outSound("TTI Soundfiles/WeNeedToReclaimAirSuperiority.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
end
end

function randomFriendlyLaunchNotification(planeType, location, strCallsign, delay)
timer.scheduleFunction(function()

	local switch = math.random (1,5)
	
		if switch == 1 then
			trigger.action.outText( 
				"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
				--"\n" ..
				"\n" .. strCallsign .. " [" .. planeType .. "]: Commencing attack.", 10)
					if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC0-CommencingAttack.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 2 then
			trigger.action.outText( 
				"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
				--"\n" ..
				"\n" .. strCallsign .. " [" .. planeType .. "]: Roger.", 10)
					if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC0-Roger.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 3 then
			trigger.action.outText( 
				"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
				--"\n" ..
				"\n" .. strCallsign .. " [" .. planeType .. "]: Roger. Commencing attack.", 10)
					if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC0-RogerCommencingAttack.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 4 then
			trigger.action.outText( 
				"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
				--"\n" ..
				"\n" .. strCallsign .. " [" .. planeType .. "]: Roger. We'll do our best!", 10)
					if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC0-RogerWellDoOurBest.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 5 then
			trigger.action.outText( 
				"<< Friendly CAP reinforcements inbound from ".. location .." >>" ..
				--"\n" ..
				"\n" .. strCallsign .. " [" .. planeType .. "]: Roger.", 10)
					if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC05-Roger.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		end
		
		
end, nil, timer.getTime() + delay  )
end

tti.a2a = {}

tti.a2a.friendlyBackupLaunchSound = {
"TTI Soundfiles/AC0-CommencingAttack.ogg", 
"TTI Soundfiles/AC0-Roger.ogg", 
"TTI Soundfiles/AC0-RogerCommencingAttack.ogg", 
"TTI Soundfiles/AC0-RogerWellDoOurBest.ogg", 
"TTI Soundfiles/AC05-Roger.ogg", 
}

tti.a2a.killMSG = {
"Hostile is going down. Good kill, ",
"Good Kill! Good kill, ",
"Target hit. Nice shot, ",
"Contact vanished. Good kill, ",
"Kill confirmed! Nice work, "
}

tti.a2a.killSound = { 
"TTI Soundfiles/Kill 1.ogg",
"TTI Soundfiles/Kill 3.ogg",
"TTI Soundfiles/Kill 4.ogg", 
"TTI Soundfiles/Kill 5.ogg",
"TTI Soundfiles/Kill 6.ogg",
"TTI Soundfiles/Kill 7.ogg",
"TTI Soundfiles/Good hit.ogg",
"TTI Soundfiles/One splash one splash.ogg",
"TTI Soundfiles/That's a confirmed kill!.ogg", 
"TTI Soundfiles/BF3-Direct Hit He's Going Down.ogg", 
"TTI Soundfiles/BF3-Good Kill 1.ogg", 
"TTI Soundfiles/BF3-Good Kill 2.ogg", 
"TTI Soundfiles/BF3-Good Kill He's Going Down.ogg", 
"TTI Soundfiles/BF3-Good Kill Splash One.ogg", 
"TTI Soundfiles/BF3-Splash One.ogg", 
"TTI Soundfiles/AC0-Bandit is down.ogg", 
"TTI Soundfiles/AC0-We've got a kill.ogg", 
"TTI Soundfiles/AC0-Splash One.ogg", 
"TTI Soundfiles/AC04-EnemyCraftTotalled.ogg", 
"TTI Soundfiles/AC0-NiceKill.ogg", 
"TTI Soundfiles/JFA-EatHotLead.ogg", 
"TTI Soundfiles/JFA-GoodKill.ogg", 
"TTI Soundfiles/JFA-HesBreakingUp.ogg", 
"TTI Soundfiles/JFA-SplashOne.ogg", 
"TTI Soundfiles/JFA-SplashOneBandit1.ogg", 
"TTI Soundfiles/JFA-SplashOneBandit2.ogg", 
}

tti.a2a.killFriendlySound  = {
"TTI Soundfiles/AC0-Hold your Fire were your allies.ogg",
"TTI Soundfiles/AC4-Friendly Fire.ogg",
"TTI Soundfiles/AC4-Hold your Fire Friendly.ogg",
"TTI Soundfiles/AC4-Cease Fire Friendly.ogg",
"TTI Soundfiles/AC05-WhatAreYouDoingNuggets.ogg",
}

tti.a2a.friendlyKilledSound = {
"TTI Soundfiles/AC04-ImHitEjecting.ogg",
"TTI Soundfiles/AC04-Eject.ogg",
"TTI Soundfiles/AC04-OneOfOursWentDown.ogg",
"TTI Soundfiles/AC04-DamnThatWasOneOfOurs.ogg",
"TTI Soundfiles/AC05-ImHitEject.ogg",
"TTI Soundfiles/AC5-DamnItsNoUseImHit.ogg",
}



function delayedFriendlyAircraftKilledMessageToAll(iniGroup, tgtUnit, weapon, msgDisplayTime, delayedTime)
	a2aKillFeedMessageIsPlaying = true
	local switch = math.random (1,6)
	
	timer.scheduleFunction(function()
	
		if switch == 1 then
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE " .. tgtUnit .. " pilot]: I'm hit! Ejecting!", msgDisplayTime)	
				if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC04-ImHitEjecting.ogg")	
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end			
		elseif switch == 2 then
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE " .. tgtUnit .. " pilot]: Eject!", msgDisplayTime)
	if voice_lines_audio == "enabled" then			
			trigger.action.outSound("TTI Soundfiles/AC04-Eject.ogg")	
										elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 3 then
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE] " .. tgtUnit .. " destroyed! - One of ours went down!", msgDisplayTime)	
				if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC04-OneOfOursWentDown.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end			
		elseif switch == 4 then		
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE] " .. tgtUnit .. " destroyed! - Damn! That was one of ours!", msgDisplayTime)	
				if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC04-DamnThatWasOneOfOurs.ogg")	
										elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 5 then		
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE " .. tgtUnit .. " pilot]: I'm hit! Eject!", msgDisplayTime)	
				if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC05-ImHitEject.ogg")	
										elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end
		elseif switch == 6 then		
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE " .. tgtUnit .. " pilot]: Damn! It's no use, I'm hit!", msgDisplayTime)	
				if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC5-DamnItsNoUseImHit.ogg")			
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end			
		end
	
	end, nil, timer.getTime() + delayedTime  )
end


function delayedFriendlyUavKilledMessageToAll(iniGroup, tgtUnit, weapon, msgDisplayTime, delayedTime)
	a2aKillFeedMessageIsPlaying = true
	local switch = math.random (1,2)
	
	timer.scheduleFunction(function()
	
		if switch == 1 then
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE] " .. tgtUnit .. " destroyed! - One of ours went down!", msgDisplayTime)	
				if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC04-OneOfOursWentDown.ogg")
							elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end			
		elseif switch == 2 then		
			trigger.action.outText( 
			"<< Friendly AI was shot down by an enemy [" .. iniGroup .."] with [".. weapon .."] >>" ..
			"\n" ..
			"\n [BLUE] " .. tgtUnit .. " destroyed! - Damn! That was one of ours!", msgDisplayTime)	
				if voice_lines_audio == "enabled" then
			trigger.action.outSound("TTI Soundfiles/AC04-DamnThatWasOneOfOurs.ogg")	
										elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
	end


	end
	
	end, nil, timer.getTime() + delayedTime  )
end

a2aKillFeedMessageCooldownTime = 5
a2aKillFeedKillMessageDelay = 2
killFeedCoolDownTime = 5
killFeedDisplayDelayTime = 10

a2aMessageCooldownTime = 5
a2aKillMessageDelay = 2

function delayedA2aKillMessageToGroup(iniGroup, tgtUnit, msg, msgDisplayTime, snd, delayedTime)
a2aMessageIsPlaying = true
	timer.scheduleFunction(function()
		trigger.action.outTextForGroup(iniGroup, msg, msgDisplayTime)
		if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, snd)
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSoundForGroup(iniGroup, tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end
		tti.debug("A2A message is cooled down and will play a sound/message.")
		--trigger.action.outText("A2G message is cooled down and will play a sound/message.", 5)
	end, nil, timer.getTime() + delayedTime  )
end

function delayedA2aKillMessageToAll(killFeedA2aMsg, killFeedA2aMsgDisplayTime, delayedTime, killFeedA2aSoundName)
a2aKillFeedMessageIsPlaying = true
	timer.scheduleFunction(function()
		trigger.action.outText(killFeedA2aMsg, killFeedA2aMsgDisplayTime)
		if enable_global_killfeed_sound == true then
			trigger.action.outSound(killFeedA2aSoundName)
		elseif enable_global_killfeed_sound == true and killFeedA2aSoundName == nil then
			trigger.action.outSound("TTI Soundfiles/AC6-AWACS Alert 1.ogg")
		end
		tti.debug("A2A killfeed message is cooled down and will play a sound/message.")

	end, nil, timer.getTime() + delayedTime  )
end

tti.a2a.eventHandlerKill = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(tti.a2a.eventHandlerKill) -- Subscribe to World Events.

tti.a2a.eventHandlerHit = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(tti.a2a.eventHandlerHit) -- Subscribe to World Events.

--[[
function tti.a2a.eventHandlerKill:onEvent(EventData) -- Parse World Events function.
	if EventData.id == world.event.S_EVENT_KILL then
		tti.serialize(EventData, "EventDataForKill")

		local tgtUnit = EventData.target or EventData.TgtDCSUnit
		local tgtUnitTypeName = tgtUnit:getTypeName()
		local tgtUnitGroupName = tgtUnit:getName()
		local tgtUnitDesc = tgtUnit:getDesc()
		local iniUnit = EventData.initiator or EventData.IniDCSUnit
		local iniUnitTypeName = iniUnit:getTypeName()
		local iniUnitGroupName = iniUnit:getName()
		local iniUnitDesc = iniUnit:getDesc()
		
		local weapon = EventData.weapon_name or EventData.WeaponName

		

		if tgtUnitDesc ~= nil then
			--if tgtUnitDesc.attributes.Air == true then -- for air units
			if tgtUnit:hasAttribute("Planes") == true or tgtUnit:hasAttribute("Helicopters") == true then
				if iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 1 then -- if shooter is blue, target is red, and if option enabled.
				success, err  = pcall( 
					function()
						tti.debug("**************** A2A Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")	
						
						if iniUnit:getPlayerName() then
								playerAircraftKillCount = playerAircraftKillCount + 1
								tti.debug("Current Player A2A Kill Count is: " .. playerAircraftKillCount)
								if playerAircraftKillCount == a2aAceKillCountThreshold and spawn_a2a_ace_on_kill_count == true then
									a2a_ace_start_kill_count()
								end
							local killerID = iniUnit:getGroup():getID()
							tti.debug(iniUnit:getPlayerName() .. " killed " .. tgtUnitTypeName)
									if a2aKillFeedMessageIsPlaying ~= true then
										if enable_player_global_killfeed == true and enable_a2a_kill_messages == true then
											delayedA2aKillMessageToAll("[BLUE] " .. iniUnitTypeName .. " (" .. iniUnit:getPlayerName() ..") ► ["..  weapon .."] ► [RED] " .. tgtUnitTypeName, 8, killFeedDisplayDelayTime, "TTI Soundfiles/AC6-AWACS Alert 1.ogg")
										end
									end
									timer.scheduleFunction(function()
										if a2aKillFeedMessageIsPlaying == true then
											a2aKillFeedMessageIsPlaying = false
											tti.debug("A2A kill field message cool down finished...")
											--trigger.action.outText("A2A message cool down finished...",5)
										end
									end, nil, timer.getTime() + killFeedCoolDownTime  )
									
									if a2aMessageIsPlaying ~= true and enable_a2a_kill_messages == true then
										 delayedA2aKillMessageToGroup(killerID, tgtUnitTypeName, "Enemy [" .. tgtUnitTypeName.. "] destroyed! - " .. tti.a2a.killMSG[math.random(1,#tti.a2a.killMSG)] .. iniUnit:getPlayerName() .. "!", 10, tti.a2a.killSound[math.random(1,#tti.a2a.killSound)], a2aKillMessageDelay)

										else
										tti.debug("A2A message is NOT cooled down and will NOT play a sound/message.")
										--trigger.action.outText("A2A message is NOT cooled down and will NOT play a sound/message.", 5)
									end
								timer.scheduleFunction(function()
									if a2aMessageIsPlaying == true then
										a2aMessageIsPlaying = false
										tti.debug("A2A message cool down finished...")
										--trigger.action.outText("A2A message cool down finished...",5)
									end
								end, nil, timer.getTime() + a2aMessageCooldownTime  )
						else -- AI friendly A2A kills
							if enable_player_global_killfeed == true and enable_a2a_kill_messages == true and enable_ai_a2a_kill_messages == true then
								--delayedA2aKillMessageToAll("[BLUE] " .. iniUnitTypeName .. " (Friendly AI) ► ["..  weapon .."] ► [RED] " .. tgtUnitTypeName, 8, killFeedDisplayDelayTime, nil)
								trigger.action.outText("[BLUE] " .. iniUnitTypeName .. " (Friendly AI) ► ["..  weapon .."] ► [RED] " .. tgtUnitTypeName, 10)
								trigger.action.outSound("TTI Soundfiles\TTI_GenericRadio_Transmit_ClickStatic_01.ogg")
							end
						end
					end
				)
				elseif iniUnit:getCoalition() == 1 and tgtUnit:getCoalition() == 2 and enable_a2a_kill_messages == true then -- friendly AI aircraft dying.
				success, err  = pcall( 
					function()
						tti.debug("**************** A2A Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
						if not tgtUnit:getPlayerName() then
							local killerID = iniUnit:getGroup():getID()
							tti.debug(iniUnitTypeName .. " killed " .. tgtUnitTypeName)
									if a2aKillFeedMessageIsPlaying ~= true then
										if enable_ai_global_killfeed == true then
											--delayedA2aKillMessageToAll("Friendly AI Aircraft Shot down!\n\n[RED] " .. iniUnitTypeName .. " ► ["..  weapon .."] ► [BLUE AI] " .. tgtUnitTypeName, 3, killFeedDisplayDelayTime, tti.a2a.friendlyKilledSound[math.random(1,#tti.a2a.friendlyKilledSound)])
											if tgtUnitTypeName == "WingLoong-I" or tgtUnitTypeName == "RQ-1A Predator" or tgtUnitTypeName == "MQ-9 Reaper" then
												delayedFriendlyUavKilledMessageToAll(iniUnitTypeName, tgtUnitTypeName, weapon, killFeedDisplayDelayTime, 3)
											else
												delayedFriendlyAircraftKilledMessageToAll(iniUnitTypeName, tgtUnitTypeName, weapon, killFeedDisplayDelayTime, 3)
											end
										end
									end
									timer.scheduleFunction(function()
										if a2aKillFeedMessageIsPlaying == true then
											a2aKillFeedMessageIsPlaying = false
											tti.debug("A2A kill field message cool down finished...")
											--trigger.action.outText("A2A message cool down finished...",5)
										end
									end, nil, timer.getTime() + killFeedCoolDownTime  )
									
									if a2aMessageIsPlaying ~= true then
										 --delayedA2aKillMessageToGroup(killerID, tgtUnitTypeName, "Enemy [" .. tgtUnitTypeName.. "] destroyed! - " .. tti.a2a.killMSG[math.random(1,#tti.a2a.killMSG)] .. iniUnit:getPlayerName() .. "!", 10, tti.a2a.killSound[math.random(1,#tti.a2a.killSound)], a2aKillMessageDelay)

										else
										tti.debug("A2A message is NOT cooled down and will NOT play a sound/message.")
										--trigger.action.outText("A2A message is NOT cooled down and will NOT play a sound/message.", 5)
									end
								timer.scheduleFunction(function()
									if a2aMessageIsPlaying == true then
										a2aMessageIsPlaying = false
										tti.debug("A2A message cool down finished...")
										--trigger.action.outText("A2A message cool down finished...",5)
									end
								end, nil, timer.getTime() + a2aMessageCooldownTime  )
						end	
					end
				)
			elseif iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 2 and enable_a2a_kill_messages == true then -- friendly AI aircraft dying.
				success, err  = pcall( 
					function()
						tti.debug("**************** A2A Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
							if iniUnit:getPlayerName() then
						local killerID = iniUnit:getGroup():getID()
						tti.debug(iniUnit:getPlayerName() .. " killed " .. tgtUnitTypeName)
								if a2aMessageIsPlaying ~= true then
									delayedA2aKillMessageToGroup(killerID, tgtUnitTypeName, "Cease fire " .. iniUnit:getPlayerName() .. "! Friendly fire on [BLUE " .. tgtUnitTypeName.. "] with [".. weapon .."]", 10, tti.a2a.killFriendlySound[math.random(1,#tti.a2a.killFriendlySound)], 1)
									else
									tti.debug("A2A message is NOT cooled down and will NOT play a sound/message.")
									--trigger.action.outText("A2A message is NOT cooled down and will NOT play a sound/message.", 5)
								end
							timer.scheduleFunction(function()
								if a2aMessageIsPlaying == true then
									a2aMessageIsPlaying = false
									tti.debug("A2A message cool down finished...")
									--trigger.action.outText("A2A message cool down finished...",5)
								end
							end, nil, timer.getTime() + a2aMessageCooldownTime  )
					end	
					end
				)
				end
			end
						
			if err then 
				tti.debug("Problem with getting the group!" .. err)
			end
		end
	end

		
end
--]]

function tti.a2a.eventHandlerKill:onEvent(EventData) -- Parse World Events function.
    if EventData.id == world.event.S_EVENT_KILL then
        tti.serialize(EventData, "EventDataForKill")

        local tgtUnit = EventData.target or EventData.TgtDCSUnit
        local iniUnit = EventData.initiator or EventData.IniDCSUnit

        if not (tgtUnit and iniUnit) then
            tti.debug("Error: tgtUnit or iniUnit is nil.")
            return
        end

        local weapon = EventData.weapon_name or EventData.WeaponName

        if tgtUnit:getDesc() then
            -- Check if the target is an air unit
            if tgtUnit:hasAttribute("Planes") or tgtUnit:hasAttribute("Helicopters") then
                if iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 1 then -- Blue shooter, Red target
                    success, err = pcall(function()
                        --tti.debug("**************** A2A Kill Event Handling: " .. iniUnit:getName() .. "(" .. iniUnit:getTypeName() .. ")" .. " killed " .. tgtUnit:getTypeName() .. "(" .. tgtUnit:getName() .. ")" .. " with " .. weapon .. " ****************")
                        tti.debug("**************** A2A Kill Event Handling: " .. iniUnit:getGroup():getName() .. "(" .. iniUnit:getTypeName() .. ")" .. " killed " .. tgtUnit:getTypeName() .. "(" .. tgtUnit:getName() .. ")" .. " with " .. weapon .. " ****************")
						--tti.points.kill("A2A") -- points kill A2A
                        if iniUnit:getPlayerName() then
                            playerAircraftKillCount = playerAircraftKillCount + 1
							--tti.points.kill("A2A") -- points kill A2A
                            tti.debug("Current Player A2A Kill Count is: " .. playerAircraftKillCount)
                            if playerAircraftKillCount == a2aAceKillCountThreshold and spawn_a2a_ace_on_kill_count then
                                a2a_ace_start_kill_count()
                            end
                            local killerID = iniUnit:getGroup():getID()
                            tti.debug(iniUnit:getPlayerName() .. " killed " .. tgtUnit:getTypeName())

                            if not a2aKillFeedMessageIsPlaying then
                                if enable_player_global_killfeed and enable_a2a_kill_messages then
                                    delayedA2aKillMessageToAll("[BLUE] " .. iniUnit:getTypeName() .. " (" .. iniUnit:getPlayerName() .. ") ► [".. weapon .."] ► [RED] " .. tgtUnit:getTypeName(), 8, killFeedDisplayDelayTime, "TTI Soundfiles/AC6-AWACS Alert 1.ogg")
                                end
                            end

                            timer.scheduleFunction(function()
                                if a2aKillFeedMessageIsPlaying then
                                    a2aKillFeedMessageIsPlaying = false
                                    tti.debug("A2A kill feed message cooldown finished...")
                                end
                            end, nil, timer.getTime() + killFeedCoolDownTime)

                            if not a2aMessageIsPlaying and enable_a2a_kill_messages then
                                delayedA2aKillMessageToGroup(killerID, tgtUnit:getTypeName(), "Enemy [" .. tgtUnit:getTypeName() .. "] destroyed! - " .. tti.a2a.killMSG[math.random(1, #tti.a2a.killMSG)] .. iniUnit:getPlayerName() .. "!", 10, tti.a2a.killSound[math.random(1, #tti.a2a.killSound)], a2aKillMessageDelay)
                            else
                                tti.debug("A2A message is NOT cooled down and will NOT play a sound/message.")
                            end

                            timer.scheduleFunction(function()
                                if a2aMessageIsPlaying then
                                    a2aMessageIsPlaying = false
                                    tti.debug("A2A message cooldown finished...")
                                end
                            end, nil, timer.getTime() + a2aMessageCooldownTime)

                        else -- AI friendly A2A kills
                            if enable_player_global_killfeed and enable_a2a_kill_messages and enable_ai_a2a_kill_messages then
                                trigger.action.outText("[BLUE] " .. iniUnit:getTypeName() .. " (Friendly AI) ► [".. weapon .."] ► [RED] " .. tgtUnit:getTypeName(), 10)
                                trigger.action.outSound("TTI Soundfiles/TTI_GenericRadio_Transmit_ClickStatic_01.ogg")
                            end
                        end
                    end)

                elseif iniUnit:getCoalition() == 1 and tgtUnit:getCoalition() == 2 and enable_a2a_kill_messages then -- Friendly AI aircraft dying
                    success, err = pcall(function()
                        --tti.debug("**************** A2A Kill Event Handling: " .. iniUnit:getName() .. "(" .. iniUnit:getTypeName() .. ")" .. " killed " .. tgtUnit:getTypeName() .. "(" .. tgtUnit:getName() .. ")" .. " with " .. weapon .. " ****************")
                        tti.debug("**************** A2A Kill Event Handling: " .. iniUnit:getGroup():getName() .. "(" .. iniUnit:getTypeName() .. ")" .. " killed " .. tgtUnit:getTypeName() .. "(" .. tgtUnit:getName() .. ")" .. " with " .. weapon .. " ****************")
                        if not tgtUnit:getPlayerName() then
                            local killerID = iniUnit:getGroup():getID()
                            tti.debug(iniUnit:getTypeName() .. " killed " .. tgtUnit:getTypeName())

                            if not a2aKillFeedMessageIsPlaying then
                                if enable_ai_global_killfeed then
                                    if tgtUnit:getTypeName() == "WingLoong-I" or tgtUnit:getTypeName() == "RQ-1A Predator" or tgtUnit:getTypeName() == "MQ-9 Reaper" then
                                        delayedFriendlyUavKilledMessageToAll(iniUnit:getTypeName(), tgtUnit:getTypeName(), weapon, killFeedDisplayDelayTime, 3)
                                    else
                                        delayedFriendlyAircraftKilledMessageToAll(iniUnit:getTypeName(), tgtUnit:getTypeName(), weapon, killFeedDisplayDelayTime, 3)
                                    end
                                end
                            end

                            timer.scheduleFunction(function()
                                if a2aKillFeedMessageIsPlaying then
                                    a2aKillFeedMessageIsPlaying = false
                                    tti.debug("A2A kill feed message cooldown finished...")
                                end
                            end, nil, timer.getTime() + killFeedCoolDownTime)

                            if not a2aMessageIsPlaying then
                                -- Delayed message logic could be added here if needed
                            else
                                tti.debug("A2A message is NOT cooled down and will NOT play a sound/message.")
                            end

                            timer.scheduleFunction(function()
                                if a2aMessageIsPlaying then
                                    a2aMessageIsPlaying = false
                                    tti.debug("A2A message cooldown finished...")
                                end
                            end, nil, timer.getTime() + a2aMessageCooldownTime)
                        end
                    end)

                elseif iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 2 and enable_a2a_kill_messages then -- Friendly AI aircraft dying
                    success, err = pcall(function()
                        --tti.debug("**************** A2A Kill Event Handling: " .. iniUnit:getName() .. "(" .. iniUnit:getTypeName() .. ")" .. " killed " .. tgtUnit:getTypeName() .. "(" .. tgtUnit:getName() .. ")" .. " with " .. weapon .. " ****************")
                        tti.debug("**************** A2A Kill Event Handling: " .. iniUnit:getGroup():getName() .. "(" .. iniUnit:getTypeName() .. ")" .. " killed " .. tgtUnit:getTypeName() .. "(" .. tgtUnit:getName() .. ")" .. " with " .. weapon .. " ****************")
                        if iniUnit:getPlayerName() then
                            local killerID = iniUnit:getGroup():getID()
                            tti.debug(iniUnit:getPlayerName() .. " killed " .. tgtUnit:getTypeName())

                            if not a2aMessageIsPlaying then
                                delayedA2aKillMessageToGroup(killerID, tgtUnit:getTypeName(), "Cease fire " .. iniUnit:getPlayerName() .. "! Friendly fire on [BLUE " .. tgtUnit:getTypeName() .. "] with [" .. weapon .. "]", 10, tti.a2a.killFriendlySound[math.random(1, #tti.a2a.killFriendlySound)], 1)
                            else
                                tti.debug("A2A message is NOT cooled down and will NOT play a sound/message.")
                            end

                            timer.scheduleFunction(function()
                                if a2aMessageIsPlaying then
                                    a2aMessageIsPlaying = false
                                    tti.debug("A2A message cooldown finished...")
                                end
                            end, nil, timer.getTime() + a2aMessageCooldownTime)
                        end
                    end)
                end
            end

            if err then
                tti.debug("Problem with event handling: " .. err)
            end
        end
    end
end


local function getGroupCategory(unit)
	local unitDB = mist.DBs.unitsById[tonumber(unit:getID())]
	 if unitDB ~= nil and unitDB.category then
        return unitDB.category
    end

    return nil
end

--------------------- AIR CLEAN UP SCRIPTS
--Cleanup landed RED AIR

aircraftCleanupDebug = false -- show debug messaages in-game

cleanupLandedRed = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(cleanupLandedRed) -- Subscribe to World Events.

function cleanupLandedRed:onEvent(event)
	if( event.id == world.event.S_EVENT_LAND and event.initiator) then
		local timeToDeleteLandedGroup = 180
		local landedUnit = event.initiator
		local landedUnitName = landedUnit:getName()
		local landedUnitCategory = getGroupCategory(landedUnit)
		local landedGroup = Unit.getGroup(landedUnit)
		local landedGroupName = landedGroup:getName()
		local landedGroupLeadUnit = landedGroup:getUnits(1)
		
			if(Unit.getPlayerName(landedUnit) == nil) and landedUnit:getCoalition() == 1 then
				tti.debug("Red Aircraft Cleanup Script - Will clean up landed AI RED AIR FIXED WING UNIT: " .. landedUnitName .. " (".. landedGroupName ..") in " .. timeToDeleteLandedGroup .. " seconds.", aircraftCleanupDebug)
				timer.scheduleFunction(function()
					if landedUnit ~= nil then
						landedUnit:destroy()
						tti.debug("Red Aircraft Cleanup Script - Cleaned up landed AI RED AIR FIXED WING UNIT: " .. landedGroupName .. " \nCategory: " .. landedUnitCategory, aircraftCleanupDebug)
					else
						tti.debug("Red Aircraft Cleanup Script - landedGroup has landed and is nil, skipping cleanup...")
					end
				end, nil, timer.getTime() + timeToDeleteLandedGroup  )
		else
			if landedUnit:getCoalition() == 1 then
				tti.debug("Red Aircraft Cleanup Script - Skipping Landed Red Plane Cleanup: " .. landedGroupName .. " is a player aircraft.", aircraftCleanupDebug)
				--tti.debug("Red Aircraft Cleanup Script - Skipping Landed Red Plane Cleanup: " .. landedGroupName .. " is a player: ".. Unit.getPlayerName(landedUnit), aircraftCleanupDebug)
			end
		end
	
	end
end
--mist.addEventHandler(cleanupLandedRed)

cleanupLandedBlueFixedWing = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(cleanupLandedBlueFixedWing) -- Subscribe to World Events.

-- Cleanup landed BLUE AI AIR FIXED WING, NON RAT
function cleanupLandedBlueFixedWing:onEvent(event) -- this has a specific function to clean up landed blue PLANES that are NOT RAT (named group) planes. 
--:hasAttribute("Helicopters") == true --- Use this another time
	if( event.id == world.event.S_EVENT_LAND and event.initiator) then
		tti.serialize(event, "EventDataForBlueAiLand")
		local timeToDeleteLandedGroup = 180
		local landedUnit = event.initiator
		local landedUnitName = landedUnit:getName()
		local landedUnitTypeName = landedUnit:getTypeName()
		local landedUnitCategory = getGroupCategory(landedUnit)
		local landedGroup = Unit.getGroup(landedUnit)
		local landedGroupName = landedGroup:getName()
		local landedGroupLeadUnit = landedGroup:getUnits(1)
		
		if(Unit.getPlayerName(landedUnit) == nil) and landedUnit:getCoalition() == 2 and landedUnitCategory == "plane" then
			if landedGroupName:find("Transport_Helo") then
				--tti.debug("Landed ["..landedUnitCategory .."] group name contained \"RAT\" or \"Transport Helo\": " .. landedGroupName .. " - Group will NOT be removed since RAT script handles deletion of these aircraft.")
				tti.debug("Blue Aircraft Cleanup Script - Landed ["..landedUnitCategory .."] group name contained \"Transport Helo\": " .. landedUnitTypeName .. ": " .. landedGroupName .. " - Group will NOT be removed since Transport helo script handles deletion of these aircraft.", aircraftCleanupDebug)
			else
			
			if landedUnitTypeName == "FA-18C_hornet" or				
				landedUnitTypeName == "S-3B" or				
				landedUnitTypeName == "E-2C" or				
				landedUnitTypeName == "VSN_F35C" or				
				landedUnitTypeName == "A-4E-C" or				
				landedUnitTypeName == "T-45" or				
				landedUnitTypeName == "Su-33" or				
				landedUnitTypeName == "VSN_F4B" or				
				landedUnitTypeName == "F-14A-135-GR" or				
				landedUnitTypeName == "F-14B" then
			
				timeToDeleteLandedGroup = 30 --makes despawning quicker for carrier aircraft type to avoid traffic on carrier decks		
			
			end
			
				tti.debug("Blue Aircraft Cleanup Script - Will clean up landed AI BLUE AIR FIXED WING UNIT: " .. landedUnitTypeName .. ": " .. landedUnitName .. " (".. landedGroupName ..") in " .. timeToDeleteLandedGroup .. " seconds.", aircraftCleanupDebug)

				
				timer.scheduleFunction(function()
					if landedUnit ~= nil then
						landedUnit:destroy()
						tti.debug("Blue Aircraft Cleanup Script - Cleaned up landed AI BLUE AIR FIXED WING UNIT: " .. landedGroupName .. " \nCategory: " .. landedUnitCategory, aircraftCleanupDebug)
					else
						tti.debug("Blue Aircraft Cleanup Script - landedGroup has landed and is nil, skipping cleanup...", aircraftCleanupDebug)
					end
				end, nil, timer.getTime() + timeToDeleteLandedGroup  )
			end
		else
			if landedUnit:getCoalition() == 2 then
				tti.debug("Blue Aircraft Cleanup Script - Skipping Landed Blue Plane Cleanup: " .. landedGroupName .. " is a player aircraft.", aircraftCleanupDebug)
				--tti.debug("Blue Aircraft Cleanup Script - Skipping Landed Red Plane Cleanup: " .. landedGroupName .. " is a player: ".. Unit.getPlayerName(landedUnit), aircraftCleanupDebug)
			end
		end
	end
end


env.info('Deadly AIR scripting complete')
tti_air_missions_script_loaded = true