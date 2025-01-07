env.info("TTI: CSAR initializing")

csar_tti_moose = CSAR:New(coalition.side.BLUE,"Downed Pilot","TTI CSAR")

csar_tti_moose.useprefix  = false
csar_tti_moose.enableForAI  = true 
csar_tti_moose.allowFARPRescue = true -- allows deliverie to FARPs and Airfields
csar_tti_moose.FARPRescueDistance = 1000 -- distance how close an aircraft has to be to the FARP/Airfield to deploy the rescued pilot
csar_tti_moose.invisiblecrew = true -- seems not working actually, intention of the param is to make the default DCS evacuated pilot invisible
csar_tti_moose.immortalcrew = true -- seems not working actually, intention of the param is to make the default DCS evacuated pilot invisible
csar_tti_moose.loadDistance = 30 -- distance how close ran rescued pilots to the aircraft, before they are boarding
csar_tti_moose.maxdownedpilots = 90 -- definition how many CSAR missions can be active simultaniously
csar_tti_moose.pilotmustopendoors = false -- definition if the cargo aircraft has to open door to board rescued pilots
csar_tti_moose.coordtype = 4 -- definition of what coordinate type CSAR is showing in the mission briefing | Use Lat/Long DDM (0), Lat/Long DMS (1), MGRS (2), Bullseye imperial (3) or Bullseye metric (4) for coordinates.
csar_tti_moose.autosmoke = true -- automatically smoke a downed pilot\'s location when a heli is near.
csar_tti_moose.autosmokedistance = 2000 -- distance for autosmoke
csar_tti_moose.radioSound = "beacon.ogg" -- the name of the sound file to use for the pilots\' radio beacons. 
csar_tti_moose.pilotRuntoExtractPoint = true -- Downed pilot will run to the rescue helicopter up to mycsar.extractDistance in meters. 
csar_tti_moose.extractDistance = 500 -- Distance the downed pilot will start to run to the rescue helicopter.
csar_tti_moose.rescuehoverheight = 1300 -- max height for a hovering rescue in meters
csar_tti_moose.rescuehoverdistance = 30 -- max distance for a hovering rescue in meters
csar_tti_moose.immortalcrew = true 
csar_tti_moose.csarOncrash = false
 -- Options of CSAR, only my needed once are set. Full list of available options can be found here: https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Documentation/Ops.CSAR.html 

--- TTI SP Functions
local BlueTempDatabaseCsarAir = {}

local BlueTempCsarInd = 0

local SpawnTempsCsarBlueAir = {
      [1] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = 8000,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = "Good",
                            ["speed"] = 300,
                            ["type"] = "F-5E-3",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "Blue_CSAR_Plane",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 0, -- Leave fuel at zero to force an EJECT
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },                    
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "Blue_CSAR_Plane",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
}

for i, Template in pairs(SpawnTempsCsarBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
        BlueTempCsarInd = BlueTempCsarInd + 1
        BlueTempDatabaseCsarAir[BlueTempCsarInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue csar aircraft " .. Template.name .. " template to the database." )
end

Blue_CSAR_Plane = SPAWN:New( "Blue_CSAR_Plane" )

function csar_mission_start()
	Blue_CSAR_Plane_Spawn = Blue_CSAR_Plane:SpawnInZone( CPS_HELO, true, 4000, 5000 )
end


function start_csar()
csar_tti_moose:__Start(5)
tti.debug("Starting MOOSE CSAR script!")
csar_started = true
end

if csar_load_method == "onMissionStart" then
start_csar()
end

env.info("TTI: CSAR Script loaded!")
tti_csar_script_loaded = true