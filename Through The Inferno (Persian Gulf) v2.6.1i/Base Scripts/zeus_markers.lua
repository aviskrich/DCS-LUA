env.info('TTI: Beyond Support is loading')
SupportHandler = EVENTHANDLER:New()

spawnAltitude = 8500

Template_A2G_Zeus = {}
Template_A2A_Zeus = {}
Template_A2A_Helo_Zeus = {}
Template_A2G_Zeus_CUSTOM = {}
Template_A2S_Zeus_CUSTOM = {}
Template_A2A_Zeus_CUSTOM = {}
Template_A2A_Helo_Zeus_CUSTOM = {}

A2A_HELO_ZEUS = SPAWN:NewWithAlias( "A2A_Spawn_Init_HELO_ZEUS", "A2A_Spawn_Init_HELO_ZEUS" )
	:InitRandomizeTemplate( Template_A2A_Helo_Zeus )

A2A_ZEUS = SPAWN:NewWithAlias( "A2A_Spawn_Init_ZEUS_FAST", "A2A_Spawn_Init_ZEUS")
	:InitRandomizeTemplate( Template_A2A_Zeus )
	
A2G_ZEUS = SPAWN:NewWithAlias("A2G_Init", "A2G_Spawn_Init_ZEUS")
	:InitRandomizeTemplate( Template_A2G_Zeus )
	:InitHeading(0, 360)
	
A2G_ZEUS_CUSTOM = SPAWN:NewWithAlias("A2G_Init", "A2G_Spawn_Init_ZEUS_CUSTOM")
	:InitRandomizeTemplate( Template_A2G_Zeus_CUSTOM )
	
A2S_ZEUS_CUSTOM = SPAWN:NewWithAlias("A2G_Init", "A2S_Spawn_Init_ZEUS_CUSTOM")
	:InitRandomizeTemplate( Template_A2S_Zeus_CUSTOM )
	
A2A_ZEUS_CUSTOM = SPAWN:NewWithAlias("A2A_Spawn_Init_ZEUS", "A2A_Spawn_Init_ZEUS_CUSTOM")
	:InitRandomizeTemplate( Template_A2A_Zeus_CUSTOM )
	
A2A_HELO_ZEUS_CUSTOM = SPAWN:NewWithAlias( "A2A_Spawn_Init_HELO_ZEUS", "A2A_Spawn_Init_HELO_ZEUS_CUSTOM" )
	:InitRandomizeTemplate( Template_A2A_Helo_Zeus_CUSTOM )

function clearTable(tableToClear)
    for k in pairs(tableToClear) do
        tableToClear[k] = nil
    end
end

customAirZeusSpawn = {}
customGroundZeusSpawn = {}
customHeloZeusSpawn = {}
zeusAirSpawnNumber = 1
zeusHeloSpawnNumber = 1
zeusGroundSpawnNumber = 1

function handleSpawnRequest(text, coord)
	--RED
    if 	text:find("_aa_") or 
			text:find("_ua_") or 
			text:find("_ar_") or  
			text:find("_arty_") or  
			text:find("_inf_") or  
			text:find("_ship_") or
			text:find("_fort_") or
			text:find("_sub_") or
			text:find("convoy") or
			text:find("infantry") or
			text:find("custom_sea") or
			text:find("custom_ground") then
		local zeusGroundTemplateToSpawn = tostring(text:gsub("-create ",""))
			if text:find("convoy") then
				generateRedConvoyTemplate() -- generates new convoy layout
			end
		--trigger.action.outText("Group to spawn is named: " .. zeusGroundTemplateToSpawn, 10)
		customGroundZeusSpawn[#customGroundZeusSpawn+1] = SPAWN:NewWithAlias(zeusGroundTemplateToSpawn, "A2G_ZEUS_CUSTOM-" .. #customGroundZeusSpawn)
		customGroundZeusSpawn[#customGroundZeusSpawn]:OnSpawnGroup(
    function(SpawnGroup)
	env.info( "" .. text:gsub("-create ","") .. " on MAP MARKER succesfully CREATED.")
	trigger.action.outText( "" .. text:gsub("-create ","") .. " on MAP MARKER succesfully CREATED.", 10)
		SpawnGroup:OptionROEWeaponFree()
	end):SpawnFromVec3(coord:SetAltitude(spawnAltitude, true))

	elseif text:find("_cap_") or
			text:find("_cas_") or
			text:find("_transport_") or
			text:find("_antiship_") or
			text:find("_bombing_") or
			text:find("custom_air") then
		local zeusAirTemplateToSpawn = tostring(text:gsub("-create ",""))
		--trigger.action.outText("Group to spawn is named: " .. zeusAirTemplateToSpawn, 10)
		customAirZeusSpawn[#customAirZeusSpawn+1] = SPAWN:NewWithAlias(zeusAirTemplateToSpawn, "A2A_ZEUS_CUSTOM-" .. #customAirZeusSpawn)
		customAirZeusSpawn[#customAirZeusSpawn]:OnSpawnGroup(
    function(SpawnGroup)
	env.info( "" .. text:gsub("-create ","") .. " on MAP MARKER succesfully CREATED.")
	trigger.action.outText( "" .. text:gsub("-create ","") .. " on MAP MARKER succesfully CREATED.", 10)
		OrbitTask=SpawnGroup:TaskOrbit(coord, spawnAltitude,240)
		SpawnGroup:SetTask(OrbitTask,1)
		SpawnGroup:OptionROEWeaponFree()
	end):SpawnFromVec3(coord:SetAltitude(spawnAltitude, true))

	elseif text:find("_helo_") or
	 text:find("custom_helo") then
			local zeusHeloTemplateToSpawn = tostring(text:gsub("-create ",""))
		--trigger.action.outText("Group to spawn is named: " .. zeusHeloTemplateToSpawn, 10)
		customHeloZeusSpawn[#customHeloZeusSpawn+1] = SPAWN:NewWithAlias(zeusHeloTemplateToSpawn, "HELO_ZEUS_CUSTOM-" .. #customHeloZeusSpawn)
		customHeloZeusSpawn[#customHeloZeusSpawn]:OnSpawnGroup(
    function(SpawnGroup)
	env.info( "" .. text:gsub("-create ","") .. " on MAP MARKER succesfully CREATED.")
	trigger.action.outText( "" .. text:gsub("-create ","") .. " on MAP MARKER succesfully CREATED.", 10)
		OrbitTask=SpawnGroup:TaskOrbit(coord, 800,80)
		SpawnGroup:SetTask(OrbitTask,1)
		SpawnGroup:OptionROEWeaponFree()
	end):SpawnFromVec3(coord:SetAltitude(800, true))
		

	elseif text:find("jtac") then
	JTAC_ZEUS = JTAC_MQ_ZEUS:OnSpawnGroup(
    function(SpawnGroup)
        OrbitTask=SpawnGroup:TaskOrbitCircle(tti_config_jtac_altitude,80)
		SpawnGroup:SetTask(OrbitTask,1)
        SpawnGroup:SetCommand(tti_config_SetInvisible)
        SpawnGroup:SetCommand(tti_config_SetImmortal)
		SpawnGroup:CommandEPLRS(true)
		SpawnGroup:OptionRTBBingoFuel(false)
		SpawnGroup:OptionROTNoReaction()
		SpawnGroup:SetOption(AI.Option.Air.id.SILENCE, true)
        end):SpawnFromCoordinate( coord:SetAltitude(tti_config_jtac_altitude, true))
		JTAC_ZEUS_NAME = JTAC_ZEUS:GetName()
		JTACAutoLase(JTAC_ZEUS_NAME, jtac_laser_code, jtac_smoke_targets, "all")
		trigger.action.outText ( "JTAC:  ".. JTAC_ZEUS_NAME .." on station lasing "..jtac_laser_code.."\nNOTE: If you wish to delete Zeus-spawned JTACS use the map marker command -delete jtac", 60)
	end
	trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
end

function handleDebugRequest(text, coord)

end

function handleMissionStartRequest(text)
if allowMissionStartFromMapMarkerCommands == true then

	if text:find("a2g_easy") then
			A2G_MR_MenuStart()
		elseif text:find("a2g_hard") then
			A2G_HARD_MenuStart()
		elseif text:find("a2g_inf") then
			A2G_Helo_IA_MenuStart()
		elseif text:find("a2g_helo") then
			A2G_Helo_MenuStart()
		elseif text:find("a2g_sead") then
			A2G_SEAD_MenuStart()
		elseif text:find("a2g_antiship") then
			A2G_AS_MenuStart()
		elseif text:find("a2g_convoy") then
			A2G_Convoy_MenuStart()
		elseif text:find("a2g_shipconvoy") then
			A2G_AS_CONV_MenuStart()
		elseif text:find("a2a_easy") then
			A2A_Easy_MenuStart()
		elseif text:find("a2a_norm") then
			A2A_Normal_MenuStart()
		elseif text:find("a2a_hard") then
			A2A_Hard_MenuStart()
		elseif text:find("a2a_ace") then
			A2A_Ace_MenuStart()
		elseif text:find("a2a_random") then
			A2A_ALL_MenuStart()
		elseif text:find("a2a_all") then
			A2A_ALL_MenuStart()
		elseif text:find("a2a_bomber") then
			A2A_BOMBING_MenuStart()
		elseif text:find("a2a_helo") then
			A2A_HELO_MenuStart()
		
	end
	
	tti.debug("Attempting to start TTI Mission from MARKER COMMAND: " .. text,true)
	
end
end

function handleShowCommandsRequest()

local ttiShowCommandsMessage = ""
ttiShowCommandsMessage = ttiShowCommandsMessage ..

"Map Marker Commands: (commands that can be called when putting the following text commands in a Map Marker text box, then closing it to execute the command)" ..
"\n" ..
"\n[-create] - Will spawn a unit of your choice where the map marker is placed. Refer to the zeus spawning list in the briefing or in the documentation for reference. Example \"-create red_cap_su27\"" ..
"\n[-destroy] - Deletes/destroys units near where this marker is placed and executed" ..
"\n[-nuke] - Deletes/destroys units in a large radius where this marker is placed and executed" ..
"\n[-smoke {color text}] - Creates a smoke marker where the marker is placed and executed. Example: \"-smoke red\"" ..
"\n[-flare {color text}] - Creates a flare marker where the marker is placed and executed. Example: \"-smoke red\"" ..
"\n[-illum] - Creates an illumination bomb where the marker is placed and executed." ..
"\n[-drop troops here] - Spawns a troop transport near the marker, then it will drop off troops where the marker is placed and executed" ..
"\n[-start] - Starts a mission of your choice via the map marker command instead of using the menu. The location has nothing to do with the spawn Use a2g_easy, a2g_hard, a2a_easy, etc... see briefing or documentation for mission spawnable list" ..
"\n[-reset tankers] - Resets tankers via the map marker command instead of using the menu." ..
"\n[-reset awacs] - Resets AWACS via the map marker command instead of using the menu." ..
"\n"


trigger.action.outText(ttiShowCommandsMessage, 40)
tti.debug(ttiShowCommandsMessage)

end

local destroyZoneCount = 0
function handleDestroyRequest(text, coord)
    local destroyZoneName = string.format("destroy %d", destroyZoneCount)
    local zoneRadiusToDestroy = ZONE_RADIUS:New(destroyZoneName, coord:GetVec2(), 1000)
    destroyZoneCount = destroyZoneCount + 1
	trigger.action.outText("UNIT(S) on your MAP MARKER succesfully DESTROYED.", 10)
    local function destroyUnit(unit)
        unit:Destroy()
        return true
    end
    zoneRadiusToDestroy:SearchZone( destroyUnit , Object.Category.UNIT)
end

function handleDeleteJtacRequest()
	Group.getByName(JTAC_ZEUS_NAME):destroy()
	trigger.action.outText("ZEUS JTAC:  ".. JTAC_ZEUS_NAME .." deleted", 60)
end

function handleNukeRequest(text, coord)
	local destroyZoneName = string.format("destroy %d", destroyZoneCount)
	local zoneRadiusToDestroy = ZONE_RADIUS:New(destroyZoneName, coord:GetVec2(), 8050)
	destroyZoneCount = destroyZoneCount + 1

	local function destroyUnit(unit)
		if unit:GetTypeName() ~= "RQ-1A Predator" then
			unit:Destroy()
			return true
		end
	end
	zoneRadiusToDestroy:SearchZone( destroyUnit , Object.Category.UNIT)
end

function SmokeHandler (vec3_point, color)
	local Smoke = COORDINATE:NewFromVec3(vec3_point)
	local colorName
	if (color == "b") then
		Smoke:SmokeBlue()
		colorName = "Blue"
	elseif (color == "r") then
		Smoke:SmokeRed()
		colorName = "Red"
	elseif (color == "g") then
		Smoke:SmokeGreen()
		colorName = "Green"
	elseif (color == "w") then
		Smoke:SmokeWhite()
		colorName = "White"
	elseif (color == "o") then
		Smoke:SmokeOrange()
		colorName = "Orange"
	end
	trigger.action.outText(string.upper(colorName) .. " smoke marker created on MAP MARKER", 10)
	trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
end

function handleSmokeRequest(text, coord)
	if text:find("red")  then
			SmokeHandler(coord, "r")
		elseif text:find("green")  then
			SmokeHandler(coord, "g")
		elseif text:find("blue")  then
			SmokeHandler(coord, "b")
		elseif text:find("orange")  then
			SmokeHandler(coord, "o")
		elseif  text:find("white")  then
			SmokeHandler(coord, "w")
		else
			SmokeHandler(coord, "w")
		end
end


--Spawns flares at a designated vec passed from Zeus.
function flareHandler (coord, color)
	local colorName
	local Flare = COORDINATE:NewFromVec3(coord)
	if (color == "r") then
				colorName = "Red"
		SCHEDULER:New( nil,
			function()
				Flare:FlareRed()
			end,
		{ }, 0, 3, 0, 15)

	elseif (color == "g") then
				colorName = "Green"
		SCHEDULER:New( nil,
			function()
				Flare:FlareGreen()
			end,
		{ }, 0, 3, 0, 15)
	elseif (color == "y") then
				colorName = "Yellow"
		SCHEDULER:New( nil,
			function()
				Flare:FlareYellow()
			end,
		{ }, 0, 3, 0, 15)
	elseif (color == "w") then
				colorName = "White"
		SCHEDULER:New( nil,
			function()
				Flare:FlareWhite()
			end,
		{ }, 0, 3, 0, 15)	end
		trigger.action.outText("Launching " .. string.upper(colorName) .. " flare markers on MAP MARKER", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
end

function handleFlareRequest(text, coord)
	if text:find("red")  then
			flareHandler(coord, "r")
		elseif text:find("green")  then
			flareHandler(coord, "g")
		elseif  text:find("yellow")  then
			flareHandler(coord, "y")
		elseif  text:find("white")  then
			flareHandler(coord, "w")
		else
			flareHandler(coord, "r")
	end
end


--Fires 5 illumination flares into the air.
function handleIllumRequest(coord)
	local altitude = 900 --Meters ofc.
	for i = 1, 5 do
		local LightZone = ZONE_RADIUS:New("_zoneOfLight", coord:GetVec2(), math.random(500,2000))
		local point = LightZone:GetRandomVec3()
		trigger.action.illuminationBomb({x= point.x, y = altitude, z = point.z} , 1000000 )
	end
	trigger.action.outText("Lighting up the area with illumination rounds created on MAP MARKER", 10)
	trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
end

function markRemoved(Event)
    if Event.text~=nil then 
        local text = Event.text:lower()
		local FullVec3 = {z=Event.pos.z, x=Event.pos.x, y=land.getHeight({x=Event.pos.x,y=Event.pos.z})}
        local vec3 = {z=Event.pos.z, x=Event.pos.x}
        local coord = COORDINATE:NewFromVec3(vec3)
        local FullCoord = COORDINATE:NewFromVec3(FullVec3)
        if Event.text:lower():find("-create") then
				handleSpawnRequest(text, coord)
			elseif Event.text:lower():find("-debug") then
				handleDebugRequest(text, coord) 
			elseif Event.text:lower():find("-destroy") then
				handleDestroyRequest(text, FullCoord)
			elseif Event.text:lower():find("-delete jtac") then
				handleDeleteJtacRequest()
			elseif Event.text:lower():find("-nuke") then
				handleNukeRequest(text, FullCoord)
			elseif Event.text:lower():find("-smoke") then
				handleSmokeRequest(text, FullCoord)
			elseif Event.text:lower():find("-flare") then
				handleFlareRequest(text, FullCoord)
			elseif Event.text:lower():find("-illum") or Event.text:lower():find("-light") then
				handleIllumRequest(coord)
			--troop transport script
			elseif Event.text:find("-drop troops here") or Event.text:lower():find("drop troops here") then
				zeus_transport_handler(coord)
			elseif Event.text:lower():find("-start") then
				handleMissionStartRequest(text)
			elseif Event.text:lower():find("-show commands") then
				handleShowCommandsRequest()
			elseif Event.text:lower():find("-reset tankers") then
				reset_tankers()
			elseif Event.text:lower():find("-reset awacs") then
				reset_awacs()
        end
	end
end
	


function SupportHandler:onEvent(Event)
    if Event.id == world.event.S_EVENT_MARK_ADDED then
    elseif Event.id == world.event.S_EVENT_MARK_CHANGE then
    elseif Event.id == world.event.S_EVENT_MARK_REMOVED then
        markRemoved(Event)
    end
end

world.addEventHandler(SupportHandler)

tti_zeus_script_loaded = true