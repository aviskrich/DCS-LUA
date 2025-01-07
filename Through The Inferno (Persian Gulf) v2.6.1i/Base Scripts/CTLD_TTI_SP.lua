--[[ 
--settings to expose to users:

--enable CTLD Helo Script
enable_ctld = true

--load ctld at start or wait for player to spawn in Helo
--use "onHeloSpawn" or "onMissionStart"
ctld_load_method = "onHeloSpawn"

--enable smoke at loading areas where loading areas are
ctld_enableSmokeLoadingAreas = true
-- determine color of smoke at loading areas if enabled
ctld_pickupZonesSmokeColor = "White"

--distance of crate list and load
ctld_crateDistance = 50

--distance of pack distance
ctld_packDistance = 50

--mix and max hover height to load crates in METERS
minLoadHoverHeight = 2
maxLoadHoverHeight = 60

--build time of ctld units in SECONDS
ctld_buildTime = 30

--repair time of ctld units in SECONDS
ctld_repairTime = 60

--disable building within loadzones
disableBuildInLoadZones = false

--crate must be moved before they can be built
moveCrateBeforeAllowBuild = false

--general loading settings (global settings for all CTLD helos)
ctld_loadCrates = true
ctld_loadTroops = true
ctld_crateLoadLimit = 8
ctld_troopLoadLimit = 15
ctld_ropeLength = 20
ctld_cargoWeightLimit = 8000

--define real helo slingloading:
slingLoad = false

enableBuildableFob = true
fobCratesRequired = 4
--]]


local tti_ctld = CTLD:New(coalition.side.BLUE,{"Helicargo"},"TTI CTLD")
--tti_ctld:__Start(5)
function start_ctld()
if enable_ctld == true then
tti_ctld:__Start(5)
tti.debug("Starting MOOSE CTLD script!")
ctld_started = true
end
end

if ctld_load_method == "onMissionStart" then
start_ctld()
end
   
-- Add a zone of type LOAD to our setup. Players can load any troops and crates here as defined in 1.2 above.
-- "Loadzone" is the name of the zone from the ME. Players can load, if they are inside the zone.
-- Smoke and Flare color for this zone is blue, it is active (can be used) and has a radio beacon.

tti_ctld:AddCTLDZone("pickzone1",CTLD.CargoZoneType.LOAD,SMOKECOLOR.White,true,true)
tti_ctld:AddCTLDZone("pickzone2",CTLD.CargoZoneType.LOAD,SMOKECOLOR.White,true,true)
tti_ctld:AddCTLDZone("pickzone3",CTLD.CargoZoneType.LOAD,SMOKECOLOR.White,true,true)


tti_ctld:ActivateZone("pickzone1",CTLD.CargoZoneType.LOAD)
tti_ctld:ActivateZone("pickzone2",CTLD.CargoZoneType.LOAD)
tti_ctld:ActivateZone("pickzone3",CTLD.CargoZoneType.LOAD)


tti_ctld:AddCTLDZone("MR1", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("MR2", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("MR3", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("MR4", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("MR5", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("MR6", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("MR7", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("MR8", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("MR9", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("MR10", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)



tti_ctld:AddCTLDZone("AG1", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AG2", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AG3", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AG4", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AG5", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AG6", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AG7", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AG8", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AG9", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AG10", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)

tti_ctld:AddCTLDZone("AGH1", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AGH2", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AGH3", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AGH4", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AGH5", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AGH6", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AGH7", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AGH8", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AGH9", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("AGH10", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)


tti_ctld:AddCTLDZone("INFAS1", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("INFAS2", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("INFAS3", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("INFAS4", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("INFAS5", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("INFAS6", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("INFAS7", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("INFAS8", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("INFAS9", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("INFAS10", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)

tti_ctld:AddCTLDZone("SEAD1", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("SEAD2", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("SEAD3", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("SEAD4", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("SEAD5", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("SEAD6", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("SEAD7", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("SEAD8", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("SEAD9", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("SEAD10", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)


tti_ctld:AddCTLDZone("SAM1", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("SAM2", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)
tti_ctld:AddCTLDZone("SAM3", CTLD.CargoZoneType.MOVE, SMOKECOLOR.Orange, true, false)


-- get airbase names from ATIS script in Trigger List SP, based on map type
--tti_ctld:AddCTLDZoneFromAirbase(main_airbase_atis,CTLD.CargoZoneType.LOAD,SMOKECOLOR.White,true,true)
--tti_ctld:AddCTLDZoneFromAirbase(aux1_airbase_atis,CTLD.CargoZoneType.LOAD,SMOKECOLOR.White,true,true)
--tti_ctld:AddCTLDZoneFromAirbase(aux2_airbase_atis,CTLD.CargoZoneType.LOAD,SMOKECOLOR.White,true,true)


--[[
-- Add a zone of type DROP. Players can drop crates here.
-- Smoke and Flare color for this zone is blue, it is active (can be used) and has a radio beacon.
-- NOTE: Troops can be unloaded anywhere, also when hovering in parameters.
tti_ctld:AddCTLDZone("Dropzone",CTLD.CargoZoneType.DROP,SMOKECOLOR.Red,true,true)

-- Add two zones of type MOVE. Dropped troops and vehicles will move to the nearest one. See options.
-- Smoke and Flare color for this zone is blue, it is active (can be used) and has a radio beacon.
tti_ctld:AddCTLDZone("Movezone",CTLD.CargoZoneType.MOVE,SMOKECOLOR.Orange,false,false)

tti_ctld:AddCTLDZone("Movezone2",CTLD.CargoZoneType.MOVE,SMOKECOLOR.White,true,true)

-- Add a zone of type SHIP to our setup. Players can load troops and crates from this ship
-- "Tarawa" is the unitname (callsign) of the ship from the ME. Players can load, if they are inside the zone.
-- The ship is 240 meters long and 20 meters wide.
-- Note that you need to adjust the max hover height to deck height plus 5 meters or so for loading to work.
-- When the ship is moving, avoid forcing hoverload.
tti_ctld:AddCTLDZone("Tarawa",CTLD.CargoZoneType.SHIP,SMOKECOLOR.Blue,true,true,240,20)
--]]

if slingLoad == true then
tti_ctld.enableslingload = true -- allow cargos to be slingloaded - might not work for all cargo types
tti_ctld.forcehoverload = false -- Crates (not: troops) can **only** be loaded while hovering.
tti_ctld.hoverautoloading = false -- Crates in CrateDistance in a LOAD zone will be loaded automatically if space allows.
else
tti_ctld.enableslingload = false -- allow cargos to be slingloaded - might not work for all cargo types
tti_ctld.forcehoverload = true -- Crates (not: troops) can **only** be loaded while hovering.
tti_ctld.hoverautoloading = true -- Crates in CrateDistance in a LOAD zone will be loaded automatically if space allows.
end

tti_ctld.useprefix = false -- (DO NOT SWITCH THIS OFF UNLESS YOU KNOW WHAT YOU ARE DOING!) Adjust **before** starting CTLD. If set to false, *all* choppers of the coalition side will be enabled for CTLD.
tti_ctld.CrateDistance = ctld_crateDistance -- List and Load crates in this radius only.
tti_ctld.PackDistance = ctld_packDistance -- Pack crates in this radius only
tti_ctld.dropcratesanywhere = true -- Option to allow crates to be dropped anywhere.
tti_ctld.dropAsCargoCrate = false -- Parachuted herc cargo is not unpacked automatically but placed as crate to be unpacked. Needs a cargo with the same name defined like the cargo that was dropped.
tti_ctld.minimumHoverHeight = minLoadHoverHeight -- Hover min this low to load.
tti_ctld.maximumHoverHeight = maxLoadHoverHeight -- Hover max this high to load.
tti_ctld.smokedistance = 2000 -- Smoke or flares can be request for zones this far away (in meters).
tti_ctld.movetroopstowpzone = moveDroppedUnitsToNearestMissionZone -- Troops and vehicles will move to the nearest MOVE zone...
tti_ctld.movetroopsdistance = maxDistanceToMoveDroppedUnits -- .. but only if this far away (in meters)
tti_ctld.smokedistance = 2000 -- Only smoke or flare zones if requesting player unit is this far away (in meters)
tti_ctld.suppressmessMRs = false -- Set to true if you want to script your own messMRs.
tti_ctld.repairtime = ctld_repairTime -- Number of seconds it takes to repair a unit.
tti_ctld.buildtime = ctld_buildTime -- Number of seconds it takes to build a unit. Set to zero or nil to build instantly.
tti_ctld.cratecountry = country.id.CJTF_BLUE -- ID of crates. Will default to country.id.RUSSIA for RED coalition setups.
tti_ctld.allowcratepickupagain = true  -- allow re-pickup crates that were dropped.
tti_ctld.pilotmustopendoors = false -- force opening of doors
tti_ctld.SmokeColor = SMOKECOLOR.Orange -- default color to use when dropping smoke from heli 
tti_ctld.FlareColor = FLARECOLOR.Red -- color to use when flaring from heli
--tti_ctld.basetype = "container_cargo" -- default shape of the cargo container
tti_ctld.droppedbeacontimeout = 600 -- dropped beacon lasts 10 minutes
tti_ctld.usesubcats = false -- use sub-category names for crates, adds an extra menu layer in "Get Crates", useful if you have > 10 crate types.
tti_ctld.placeCratesAhead = false -- place crates straight ahead of the helicopter, in a random way. If true, crates are more neatly sorted.
tti_ctld.nobuildinloadzones = disableBuildInLoadZones -- forbid players to build stuff in LOAD zones if set to `true`
tti_ctld.movecratesbeforebuild = moveCrateBeforeAllowBuild -- crates must be moved once before they can be build. Set to false for direct builds.
tti_ctld.surfacetypes = {land.SurfaceType.LAND,land.SurfaceType.ROAD,land.SurfaceType.RUNWAY,land.SurfaceType.SHALLOW_WATER} -- surfaces for loading back objects.
tti_ctld.nobuildmenu = false -- if set to true effectively enforces to have engineers build/repair stuff for you.
tti_ctld.RadioSound = "beacon.ogg" -- -- this sound will be hearable if you tune in the beacon frequency. Add the sound file to your miz.
tti_ctld.RadioSoundFC3 = "beacon.ogg" -- this sound will be hearable by FC3 users (actually all UHF radios); change to something like "beaconsilent.ogg" and add the sound file to your miz if you don't want to annoy FC3 pilots.
tti_ctld.enableChinookGCLoading = true -- this will effectively suppress the crate load and drop for CTLD_CARGO.Enum.STATIc types for CTLD for the Chinook
tti_ctld.TroopUnloadDistGround = 1 -- If hovering, spawn dropped troops this far away in meters from the helo
tti_ctld.TroopUnloadDistHover = 5 -- If grounded, spawn dropped troops this far away in meters from the helo


--recommended settings
tti_ctld.basetype = "ammo_cargo"
--tti_ctld.pilotmustopendoors = true -- crew must open back loading door 50% (horizontal) or more
--tti_ctld.enableslingload = true -- will set cargo items as sling-loadable
--tti_ctld.enableChinookGCLoading = true -- will effectively suppress the crate load and drop menus for CTLD for the Chinook
--tti_ctld.movecratesbeforebuild = false -- cannot detect movement of crates at the moment
--tti_ctld.nobuildinloadzones = true -- don't build where you load.
tti_ctld.ChinookTroopCircleRadius = 5 -- Radius for troops dropping in a nice circle. Adjust to your planned squad size for the Chinook.
tti_ctld:AddTroopsCargo("General Infantry (5)",{"blue_inf_georgia_m4","blue_inf_m4","blue_inf_m249","blue_inf_paratrooper_rpg","blue_inf_m4"},CTLD_CARGO.Enum.TROOPS,5)
tti_ctld:AddTroopsCargo("General Infantry (10)",{"blue_inf_georgia_m4","blue_inf_m4","blue_inf_m249","blue_inf_paratrooper_rpg","blue_inf_m4","blue_inf_georgia_m4","blue_inf_m4","blue_inf_m249","blue_inf_paratrooper_rpg","blue_inf_m4"},CTLD_CARGO.Enum.TROOPS,10)
tti_ctld:AddTroopsCargo("Anti-Tank Small (2)",{"blue_inf_paratrooper_rpg","blue_inf_paratrooper_rpg"},CTLD_CARGO.Enum.TROOPS,2)
tti_ctld:AddTroopsCargo("Anti-Tank Small (3)",{"blue_inf_paratrooper_rpg","blue_inf_paratrooper_rpg","blue_inf_paratrooper_rpg"},CTLD_CARGO.Enum.TROOPS,3)

-- add infantry unit called "Anti-Tank" using templates "AA" and "AA"", of type TROOP with size 4. No weight. We only have 2 in stock:
tti_ctld:AddTroopsCargo("Anti-Air (2)",{"blue_aa_sam_tac_manpads","blue_aa_sam_tac_manpads"},CTLD_CARGO.Enum.TROOPS,2)

-- add an engineers unit called "Wrenches" using template "Engineers", of type ENGINEERS with size 2. Engineers can be loaded, dropped,
-- and extracted like troops. However, they will seek to build and/or repair crates found in a given radius. Handy if you can\'t stay
-- to build or repair or under fire.
tti_ctld:AddTroopsCargo("Wrenches (1)",{"blue_inf_m4"},CTLD_CARGO.Enum.ENGINEERS,1)
tti_ctld.EngineerSearch = 2000 -- teams will search for crates in this radius.

--[[
-- add vehicle called "Humvee" using template "Humvee", of type VEHICLE, size 2, i.e. needs two crates to be build
-- vehicles and FOB will be spawned as crates in a LOAD zone first. Once transported to DROP zones, they can be build into the objects
tti_ctld:AddCratesCargo("Mortar Team",{"blue_arty_mortar"},CTLD_CARGO.Enum.VEHICLE,1)
--tti_ctld:AddCratesCargo("HMV - Tow",{"blue_ar_hmv_tow"},CTLD_CARGO.Enum.VEHICLE,1)
tti_ctld:AddCratesCargo("HMV - MG",{"blue_ar_hmv_armed"},CTLD_CARGO.Enum.VEHICLE,1)
tti_ctld:AddCratesCargo("MBT - Bradley",{"blue_ar_bradley"},CTLD_CARGO.Enum.VEHICLE,1)
tti_ctld:AddCratesCargo("MBT - Abrams",{"blue_ar_mbt_abrams"},CTLD_CARGO.Enum.VEHICLE,1)
tti_ctld:AddCratesCargo("SAM TAC - Avenger",{"blue_aa_sam_tac_avenger"},CTLD_CARGO.Enum.VEHICLE,1)
--tti_ctld:AddCratesCargo("SAM TAC - Vulcan",{"blue_aa_aaa_vulcanm163"},CTLD_CARGO.Enum.VEHICLE,1)
tti_ctld:AddCratesCargo("SAM TAC - Linebacker",{"blue_aa_sam_tac_linebacker"},CTLD_CARGO.Enum.VEHICLE,2)
tti_ctld:AddCratesCargo("SAM - Hawk",{"blue_aa_sam_hawk"},CTLD_CARGO.Enum.VEHICLE,4)
--tti_ctld:AddCratesCargo("SAM - Patriot",{"blue_aa_sam_patriot"},CTLD_CARGO.Enum.VEHICLE,5)
--]]

--[[
BuildablesCtldList = {

{MenuName = "Mortar Team", CtldTemplate = "blue_arty_mortar", CrateRequired = 1, CrateKg = 0, CrateStock = nil},
{MenuName = "HMV-Tow", CtldTemplate = "blue_ar_hmv_tow", CrateRequired = 1, CrateKg = 0, CrateStock = nil},
{MenuName = "MBT-Bradley", CtldTemplate = "blue_ar_bradley", CrateRequired = 1, CrateKg = 0, CrateStock = nil},
{MenuName = "MBT-Abrams", CtldTemplate = "blue_ar_mbt_abrams", CrateRequired = 1, CrateKg = 0, CrateStock = nil},
{MenuName = "AAA-Vulcan", CtldTemplate = "blue_aa_aaa_vulcanm163", CrateRequired = 1, CrateKg = 0, CrateStock = nil},
{MenuName = "SAM-Avenger", CtldTemplate = "blue_aa_sam_tac_avenger", CrateRequired = 2, CrateKg = 0, CrateStock = nil},
{MenuName = "SAM-Linebacker", CtldTemplate = "blue_aa_sam_tac_linebacker", CrateRequired = 2, CrateKg = 0, CrateStock = nil},
{MenuName = "SAM-Hawk", CtldTemplate = "blue_aa_sam_hawk", CrateRequired = 3, CrateKg = 0, CrateStock = nil},

}
--]]

-- Loop through the table and generate the AddCratesCargo calls
--[[
for i = 1, #BuildablesCtldList do
    tti_ctld:AddCratesCargo(
        BuildablesCtldList[i].EntryName,
        {BuildablesCtldList[i].UnitName},
        CTLD_CARGO.Enum.VEHICLE,
        BuildablesCtldList[i].CrateRequired
    )
end
--]]


for i = 1, #BuildablesCtldList do
    tti_ctld:AddCratesCargo(
        BuildablesCtldList[i].MenuName,
        {BuildablesCtldList[i].CtldTemplate},
        CTLD_CARGO.Enum.VEHICLE,
        BuildablesCtldList[i].CrateRequired,
        BuildablesCtldList[i].CrateKg,
        BuildablesCtldList[i].CrateStock
    )
end




--[[
enableBuildableFARP = true
farpCratesRequired = 1
buildableFarpName = "AUXILIARY"
deploySmokeAtBuildableFarp = true
ctld_buildableFarpSmokeColor = "White" 
-- Red, Blue, White, Orange, Green are the colors you can choose

enableBuildableFOB = true
fobCratesRequired = 1

enableBuildableRepairVehicle = true
repairCratesRequired = 1
--]]

if enableBuildableFOB == true then
tti_ctld:AddCratesCargo("FOB",{"FOB"},CTLD_CARGO.Enum.FOB,fobCratesRequired)
tti.debug("CTLD - Forward Ops Base Added")
end

if enableBuildableFARP == true then
tti_ctld:AddCratesCargo("FARP",{"FOB"},CTLD_CARGO.Enum.FOB,farpCratesRequired)
tti.debug("CTLD - FARP Added")
end

--tti_ctld:AddCratesCargo("FOB",{"blue_inf_georgia_m4"},CTLD_CARGO.Enum.FOB,1)
--tti_ctld:AddCratesCargo("FOB",{"FOB"},CTLD_CARGO.Enum.FOB,1)
-- add crates to repair FOB or VEHICLE type units - the 2nd parameter needs to match the template you want to repair,
-- e.g. the "Humvee" here refers back to the "Humvee" crates cargo added above (same template!)
if enableBuildableRepairVehicle == true then
tti_ctld:AddCratesRepair("Humvee Repair","blue_ar_hmv_armed",CTLD_CARGO.Enum.REPAIR,repairCratesRequired)
end

local FARPFreq = 129
local FARPName = 1  --numbers 1..10

local FARPClearnames = {
       [1]="London",
       [2]="Dallas",
       [3]="Paris",
       [4]="Moscow",
       [5]="Berlin",
       [6]="Rome",
       [7]="Madrid",
       [8]="Warsaw",
       [9]="Dublin",
       [10]="Perth",
}

function BuildAFARP(Coordinate)
	local coord = Coordinate  --Core.Point#COORDINATE
	
	local FarpNameNumber = ((FARPName-1)%10)+1 -- make sure 11 becomes 1 etc
	local FName = FARPClearnames[FarpNameNumber] -- get clear namee
	
	FARPFreq = FARPFreq + 1
	FARPName = FARPName + 1
	
	FName = FName .. " " .. buildableFarpName .. " "..tostring(FARPFreq).."AM" -- make name unique
	
	-- Get a Zone for loading 
	local ZoneSpawn = ZONE_RADIUS:New("FARP "..FName,Coordinate:GetVec2(),150,false)
	
	if deploySmokeAtBuildableFarp == true then
		startCtldSmokeAtBuildableFarp = SCHEDULER:New(nil, SmokeZoneCenterCtld, {"FARP "..FName, ctld_buildableFarpSmokeColor}, 0, 300)
	end
	-- Spawn a FARP with our little helper and fill it up with resources (10t fuel each type, 10 pieces of each known equipment)
	UTILS.SpawnFARPAndFunctionalStatics(FName,Coordinate,ENUMS.FARPType.INVISIBLE,tti_ctld.coalition,country.id.USA,FarpNameNumber,FARPFreq,radio.modulation.AM,nil,nil,nil,10,10)
	
	-- add a loadzone to CTLD
	tti_ctld:AddCTLDZone("FARP "..FName,CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
	local m  = MESSMR:New(string.format("FARP %s in operation!",FName),15,"CTLD"):ToBlue() 
end

function tti_ctld:OnAfterCratesBuild(From,Event,To,Group,Unit,Vehicle)
	local name = Vehicle:GetName()
	if string.find(name,"FOB",1,true) then
		local Coord = Vehicle:GetCoordinate()
		Vehicle:Destroy(false)
		BuildAFARP(Coord) 
	end
end
-- add static cargo objects, e.g ammo chests - the name needs to refer to a STATIC object in the mission editor, 
-- here: it\'s the UNIT name (not the GROUP name!), the second parameter is the weight in kg.
--tti_ctld:AddStaticsCargo("Ammunition",500)

--[[
ctld_loadCrates = true
ctld_loadTroops = true
ctld_crateLoadLimit = 8
ctld_troopLoadLimit = 15
ctld_ropeLength = 20
ctld_cargoWeightLimit = 8000
--]]

-- Unit Capabilities
local unitCapabilities = {
    "SA342Mistral",
    "SA342L",
    "SA342M",
    "SA342Minigun",
    "UH-1H",
    "Mi-8MT",
    "Mi-8MTV2",
    "Ka-50",
    "Ka-50_3",
    "Mi-24P",
    "OH-58D",
    "CH-47Fbl1",
    "AH-64D_BLK_II"
}

for _, unit in ipairs(unitCapabilities) do
    tti_ctld:SetUnitCapabilities(unit, ctld_loadCrates, ctld_loadTroops, ctld_crateLoadLimit, ctld_troopLoadLimit, ctld_ropeLength, ctld_cargoWeightLimit)
end

--[[
tti_ctld:SetUnitCapabilities("SA342Mistral", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("SA342L", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("SA342M", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("SA342Minigun", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("UH-1H", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("Mi-8MT", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("Mi-8MTV2", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("Ka-50", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("Ka-50_3", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("Mi-24P", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("OH-58D", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("CH-47Fbl1", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("AH-64D_BLK_II", true, true, 12, 12, 12, 8000)
--]]


tti_ctld:SetUnitCapabilities("MH-60R", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("SH-60B", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("Bronco-OV-10A", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("OH-6A", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("Hercules", true, true, 12, 12, 12, 8000)
tti_ctld:SetUnitCapabilities("UH-60L", true, true, 12, 12, 12, 8000)

--[[
   ["SA342Mistral"] = {type="SA342Mistral", crates=false, troops=true, cratelimit = 0, trooplimit = 4, length = 12, cargoweightlimit = 400},
   ["SA342L"] = {type="SA342L", crates=false, troops=true, cratelimit = 0, trooplimit = 2, length = 12, cargoweightlimit = 400},
   ["SA342M"] = {type="SA342M", crates=false, troops=true, cratelimit = 0, trooplimit = 4, length = 12, cargoweightlimit = 400},
   ["SA342Minigun"] = {type="SA342Minigun", crates=false, troops=true, cratelimit = 0, trooplimit = 2, length = 12, cargoweightlimit = 400},
   ["UH-1H"] = {type="UH-1H", crates=true, troops=true, cratelimit = 1, trooplimit = 8, length = 15, cargoweightlimit = 700},
   ["Mi-8MT"] = {type="Mi-8MT", crates=true, troops=true, cratelimit = 2, trooplimit = 12, length = 15, cargoweightlimit = 3000},
   ["Mi-8MTV2"] = {type="Mi-8MTV2", crates=true, troops=true, cratelimit = 2, trooplimit = 12, length = 15, cargoweightlimit = 3000},
   ["Ka-50"] = {type="Ka-50", crates=false, troops=false, cratelimit = 0, trooplimit = 0, length = 15, cargoweightlimit = 0},
   ["Mi-24P"] = {type="Mi-24P", crates=true, troops=true, cratelimit = 2, trooplimit = 8, length = 18, cargoweightlimit = 700},
   ["Mi-24V"] = {type="Mi-24V", crates=true, troops=true, cratelimit = 2, trooplimit = 8, length = 18, cargoweightlimit = 700},
   ["Hercules"] = {type="Hercules", crates=true, troops=true, cratelimit = 7, trooplimit = 64, length = 25, cargoweightlimit = 19000},
   ["UH-60L"] = {type="UH-60L", crates=true, troops=true, cratelimit = 2, trooplimit = 20, length = 16, cargoweightlimit = 3500},
   ["AH-64D_BLK_II"] = {type="AH-64D_BLK_II", crates=false, troops=true, cratelimit = 0, trooplimit = 2, length = 17, cargoweightlimit = 200}, 
   ["MH-60R"] = {type="MH-60R", crates=true, troops=true, cratelimit = 2, trooplimit = 20, length = 16, cargoweightlimit = 3500}, -- 4t cargo, 20 (unsec) seats
   ["SH-60B"] = {type="SH-60B", crates=true, troops=true, cratelimit = 2, trooplimit = 20, length = 16, cargoweightlimit = 3500}, -- 4t cargo, 20 (unsec) seats
   ["Bronco-OV-10A"] = {type="Bronco-OV-10A", crates= false, troops=true, cratelimit = 0, trooplimit = 5, length = 13, cargoweightlimit = 1450},
   ["Bronco-OV-10A"] = {type="Bronco-OV-10A", crates= false, troops=true, cratelimit = 0, trooplimit = 5, length = 13, cargoweightlimit = 1450},
   ["OH-6A"] = {type="OH-6A", crates=false, troops=true, cratelimit = 0, trooplimit = 4, length = 7, cargoweightlimit = 550},
   ["OH-58D"] = {type="OH58D", crates=false, troops=false, cratelimit = 0, trooplimit = 0, length = 14, cargoweightlimit = 400},
   ["CH-47Fbl1"] = {type="CH-47Fbl1", crates=true, troops=true, cratelimit = 4, trooplimit = 31, length = 20, cargoweightlimit = 8000},
--]]

--[[
 * Ammo crate (type "ammo_cargo")
 * M117 bomb crate (type name "m117_cargo")
 * Dual shell fuel barrels (type name "barrels")
 * UH-1H net (type name "uh1h_cargo")
--]]

function convertSmokeEnumToString(colorString)
local smokeEnum
	if colorString == "Green" then
		smokeEnum = 0
	elseif colorString == "Red" then
		smokeEnum = 1
	elseif colorString == "White" then
		smokeEnum = 2
	elseif colorString == "Orange" then
		smokeEnum = 3
	elseif colorString == "Blue" then
		smokeEnum = 4
	end
return smokeEnum
end

-- Function to smoke the center of the zone
function SmokeZoneCenterCtld(zoneName, colorSmoke)
    local zoneObject = ZONE:FindByName(zoneName)
    local zoneCenter = zoneObject:GetVec3() -- Get the center of the zone
    trigger.action.smoke(zoneCenter, convertSmokeEnumToString(colorSmoke)) -- Smoke the center of the zone with red smoke
	tti.debug("Starting CTLD zone smoke at zone: " .. zoneName .. " with " .. string.upper(colorSmoke) .. " smoke!")
end

function StartSmokingCtldPickzones()
if enable_ctld == true then
	if ctld_enableSmokeLoadingAreas == true then 
		startCtldSmokePickzone1 = SCHEDULER:New(nil, SmokeZoneCenterCtld, {"pickzone1", ctld_pickupZonesSmokeColor}, 0, 300)
		startCtldSmokePickzone2 = SCHEDULER:New(nil, SmokeZoneCenterCtld, {"pickzone2", ctld_pickupZonesSmokeColor}, 0, 300)
		startCtldSmokePickzone3 = SCHEDULER:New(nil, SmokeZoneCenterCtld, {"pickzone3", ctld_pickupZonesSmokeColor}, 0, 300)
	else
	tti.debug("CTLD zone smoke is disabled")
	end
end
end


function StopSmokingZoneCenterCtld() -- Function to stop smoking the zone center
    if startCtldSmokePickzone1 then
        startCtldSmokePickzone1:Stop() -- Stop the scheduler
        startCtldSmokePickzone1 = nil -- Clear the scheduler reference
    end
	if startCtldSmokePickzone2 then
        startCtldSmokePickzone2:Stop() -- Stop the scheduler
        startCtldSmokePickzone2 = nil -- Clear the scheduler reference
    end
	if startCtldSmokePickzone3 then
        startCtldSmokePickzone3:Stop() -- Stop the scheduler
        startCtldSmokePickzone3 = nil -- Clear the scheduler reference
    end
end

StartSmokingCtldPickzones() --start smoke script when CTLD starts, option to enable is set in the function itself.


-- Example to stop the smoke after some time (e.g., 1200 seconds)
-- SCHEDULER:New(nil, StopSmokingZoneCenter, {}, 1200)


tti_ctld_script_loaded = true