---
-- Name: AID-A2A-100 - Demonstration
-- Author: FlightControl
-- Date Created: 30 May 2017

local HQ_Group = GROUP:FindByName( "HQ" )
local HQ_CC = COMMANDCENTER:New( HQ_Group, "HQ" )

-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
-- Here we build the network with all the groups that have a name starting with DF IRAN AWACS and DF IRAN EWR.
local DetectionSetGroup = SET_GROUP:New():FilterPrefixes( { "IRAN AWACS", "IRAN EWR" } ):FilterStart()

local Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
A2ADispatcher:SetCommandCenter( HQ_CC )

-- Enable the tactical display panel.
A2ADispatcher:SetTacticalDisplay( false )
A2ADispatcher:SetTacticalMenu( "Dispatchers", "A2A" )

-- Initialize the dispatcher, setting up a border zone. This is a polygon, 
-- which takes the waypoints of a late activated group with the name IRAN Border as the boundaries of the border area.
-- Any enemy crossing this border will be engaged.
IRANBorderZone = ZONE_POLYGON:New( "IRAN Border", GROUP:FindByName( "IRAN Border" ) )
A2ADispatcher:SetBorderZone( IRANBorderZone )

-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
A2ADispatcher:SetEngageRadius( 200000 )

-- Setup the squadrons.
A2ADispatcher:SetSquadron( "Qeshm", AIRBASE.PersianGulf.Qeshm_Island, { "SQ IRAN MIG29A" }, 8 )
A2ADispatcher:SetSquadron( "Abbas", AIRBASE.PersianGulf.Bandar_Abbas_Intl, { "SQ IRAN F14B","SQ IRAN MIG29A" }, 10 )
A2ADispatcher:SetSquadron( "Lengeh", AIRBASE.PersianGulf.Bandar_Lengeh, { "SQ IRAN F14B","SQ IRAN MIG29A" }, 6 )

-- Setup the overhead
A2ADispatcher:SetSquadronOverhead( "Abbas", 1.2 )
A2ADispatcher:SetSquadronOverhead( "Qeshm", 1 )
A2ADispatcher:SetSquadronOverhead( "Lengeh", 1.5 )

-- Setup the Grouping
A2ADispatcher:SetSquadronGrouping( "Abbas", 2 )
A2ADispatcher:SetSquadronGrouping( "Qeshm", 2 )
A2ADispatcher:SetSquadronGrouping( "Lengeh", 2 )

-- Setup the Takeoff methods
A2ADispatcher:SetSquadronTakeoff( "Qeshm", AI_A2A_DISPATCHER.Takeoff.Runway )
A2ADispatcher:SetSquadronTakeoff( "Lengeh", AI_A2A_DISPATCHER.Takeoff.Runway )
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "Abbas" )

-- Setup the Landing methods
A2ADispatcher:SetSquadronLandingAtRunway( "Qeshm" )
A2ADispatcher:SetSquadronLanding( "Lengeh", AI_A2A_DISPATCHER.Landing.AtRunway )
A2ADispatcher:SetSquadronLanding( "Abbas", AI_A2A_DISPATCHER.Landing.AtRunway )

-- CAP Squadron execution.
CAPZoneWest = ZONE_POLYGON:New( "CAP Zone West", GROUP:FindByName( "CAP Zone West" ) )
A2ADispatcher:SetSquadronCap2( "Lengeh", 700, 2200, 1500, 14000, 'BARO', CAPZoneWest, 500, 800, 6000, 10000, 'BARO')
-- A2ADispatcher:SetSquadronCap( "Lengeh", CAPZoneWest, 4000, 8000, 600, 800, 800, 1200, "BARO" )
-- A2ADispatcher:SetSquadronCapInterval( "Lengeh", 2, 30, 120, 1 )

CAPZoneMiddle = ZONE_POLYGON:New( "CAP Zone Mid", GROUP:FindByName( "CAP Zone Mid" ))
A2ADispatcher:SetSquadronCap2( "Abbas", 700, 2200, 1500, 14000, 'BARO', CAPZoneMiddle, 500, 800, 6000, 10000, 'BARO')
-- A2ADispatcher:SetSquadronCap( "Abbas", CAPZoneMiddle, 4000, 8000, 600, 800, 800, 1200, "RADIO" )
-- A2ADispatcher:SetSquadronCapInterval( "Abbas", 2, 30, 120, 1 )

-- GCI Squadron execution.
A2ADispatcher:SetSquadronGci2( "Abbas", 900, 1200, 100, 100, "RADIO" )
A2ADispatcher:SetSquadronGci2( "Qeshm", 900, 2100, 100, 100, "RADIO" )
A2ADispatcher:SetSquadronGci2( "Lengeh", 900, 1200, 200, 200, "RADIO" )

-- Set the language of the squadrons to Russian.
A2ADispatcher:SetSquadronLanguage( "Abbas", "RU" )
A2ADispatcher:SetSquadronLanguage( "Qeshm", "RU" )
A2ADispatcher:SetSquadronLanguage( "Lengeh", "RU" )

A2ADispatcher:SetSquadronRadioFrequency( "Abbas", 127.5 )
A2ADispatcher:SetSquadronRadioFrequency( "Qeshm", 127.5 )
A2ADispatcher:SetSquadronRadioFrequency( "Lengeh", 127.5 )


-- Set the squadrons visible before startup.
--A2ADispatcher:SetSquadronVisible( "Mineralnye" )
--A2ADispatcher:SetSquadronVisible( "Sochi" )
--A2ADispatcher:SetSquadronVisible( "Mozdok" )
--A2ADispatcher:SetSquadronVisible( "Maykop" )
--A2ADispatcher:SetSquadronVisible( "Novo" )


--CleanUp = CLEANUP_AIRBASE:New( { AIRBASE.Caucasus.Novorossiysk } )


-- Blue attack simulation
-- local Frequency = 300

-- BlueSpawn1 = SPAWN
--   :New( "RT NATO #1" )
--   :InitLimit( 2, 10 )
--   :InitRandomizeTemplate( { "SQ NATO F18", "SQ NATO F16" } )
--   :InitRandomizeRoute( 0, 0, 30000 )
--   --:InitDelayOn()
--   :SpawnScheduled( Frequency, 0.4 )

-- BlueSpawn2 = SPAWN
--   :New( "RT NATO #2" )
--   :InitLimit( 2, 10 )
--   :InitRandomizeTemplate( { "SQ NATO F18", "SQ NATO F16" } )
--   :InitRandomizeRoute( 0, 0, 30000 )
--   --:InitDelayOn()
--   :SpawnScheduled( Frequency, 0.4 )

-- BlueSpawn3 = SPAWN
--   :New( "RT NATO #3" )
--   :InitLimit( 2, 10 )
--   :InitRandomizeTemplate( { "SQ NATO F18", "SQ NATO F16" } )
--   :InitRandomizeRoute( 0, 0, 30000 )
--   --:InitDelayOn()
--   :SpawnScheduled( Frequency, 0.4 )

-- BlueSpawn4 = SPAWN
--   :New( "RT NATO 4" )
--   :InitLimit( 2, 10 )
--   :InitRandomizeTemplate( { "SQ NATO A-10C", "SQ NATO F-15C", "SQ NATO F-16A", "SQ NATO F/A-18", "SQ NATO F-16C" } )
--   :InitRandomizeRoute( 0, 0, 30000 )
--   --:InitDelayOn()
--   :SpawnScheduled( Frequency, 0.4 )