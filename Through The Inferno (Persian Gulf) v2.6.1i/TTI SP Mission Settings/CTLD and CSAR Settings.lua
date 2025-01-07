--ADJUST HELO CTLD AND CSAR SETTINGS HERE
--READ THE MISSION SETTINGS --README FILE FOR MORE DETAILS

---CTLD SETTINGS

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

--dropped vehicles and troops will automatically move towards nearest mission zone
moveDroppedUnitsToNearestMissionZone = true

--dropped vehicles and troops max distance in meters from zone so that they will move towards it automatically
maxDistanceToMoveDroppedUnits = 5000


--define real helo slingloading:
slingLoad = false

enableBuildableFARP = true
farpCratesRequired = 2
buildableFarpName = "AUXILIARY"
deploySmokeAtBuildableFarp = true
ctld_buildableFarpSmokeColor = "White" 
-- Red, Blue, White, Orange, Green are the colors you can choose

enableBuildableFOB = true
fobCratesRequired = 2

enableBuildableRepairVehicle = true
repairCratesRequired = 1

--Define Buildables only 8 MAX ENTRIES ALLOWED!
--Disable FOB/FARP/REPAIR if you want more entries
--ENTRY NAME - name in CTLD menu
--Unit in TTI database, refer to the mission briefing for zeus unit names, must be exact!, use BLUE or else it will spawn enemy units
--crates required to build this unit, crateKg is the weight, and crate stock is how many in stock for each ctate use nil instead of 0 for infinite


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



--------CSAR SETTINGS
--enable CSAR helo rescue script:
enable_csar = true

--load csar at start or wait for player to spawn in Helo
--use "onHeloSpawn" or "onMissionStart"
csar_load_method = "onHeloSpawn"