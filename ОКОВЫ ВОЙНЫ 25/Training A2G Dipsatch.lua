local HQ_Group = GROUP:FindByName( "IRAN HQ" )
local HQ_CC = COMMANDCENTER:New( HQ_Group, "IRAN HQ" )

-- 
local DetectionSetGroup = SET_GROUP:New():FilterPrefixes( {"RECCE","Rotary"} ):FilterStart()

local Detection = DETECTION_AREAS:New( DetectionSetGroup, 60000 )

-- Setup the A2A dispatcher, and initialize it.
A2GDispatcher = AI_A2G_DISPATCHER:New( Detection )

-- The HQ is the defense point, so this point will be defended.
A2GDispatcher:AddDefenseCoordinate( "HQ", HQ_Group:GetCoordinate() )
A2GDispatcher:SetDefenseReactivityHigh() -- High defense reactivity. So far proximity of a threat will trigger a defense action.
A2GDispatcher:SetDefenseRadius( 300000 ) -- Defense radius wide enough to also trigger defenses far away.

-- Communication to the players within the coalition. The HQ services the communication of the defense actions.
A2GDispatcher:SetCommandCenter( HQ_CC )

-- Show a tactical display.
A2GDispatcher:SetTacticalDisplay( true )

-- Setup the squadrons.
-- A2GDispatcher:SetSquadron( "Helo", 'DP07 FARP', { "SQ IRAN MI24 CAS"}, 8)
-- A2GDispatcher:SetSquadronBai2( "Helo", 200, 250, 300, 500, "RADIO" )
-- A2GDispatcher:SetSquadronTakeoffFromParkingHot( "Helo" )
-- A2GDispatcher:SetSquadronOverhead( "Helo", 0.25 )
-- A2GDispatcher:SetSquadronGrouping( "Helo", 2 )

A2GDispatcher:SetSquadron( "Abbas CAS", AIRBASE.PersianGulf.Bandar_Abbas_Intl, { "SQ IRAN SU25 CAS" }, 4 )
A2GDispatcher:SetSquadronCas2( "Abbas CAS", 200, 250, 300, 500, "RADIO" )
A2GDispatcher:SetSquadronTakeoffFromParkingHot( "Abbas CAS" )
A2GDispatcher:SetSquadronOverhead( "Abbas CAS", 0.25 )
A2GDispatcher:SetSquadronGrouping( "Abbas CAS", 2 )

A2GDispatcher:SetSquadron( "Abbas BAI", AIRBASE.PersianGulf.Bandar_Abbas_Intl, { "SQ IRAN SU25 BAI" }, 4 )
A2GDispatcher:SetSquadronBai2( "Abbas BAI", 200, 250, 300, 500, "RADIO" )
A2GDispatcher:SetSquadronTakeoffFromParkingHot( "Abbas BAI" )
A2GDispatcher:SetSquadronOverhead( "Abbas BAI", 0.25 )
A2GDispatcher:SetSquadronGrouping( "Abbas BAI", 2 )

A2GDispatcher:SetSquadron( "Abbas SEAD", AIRBASE.PersianGulf.Bandar_Abbas_Intl, { "SQ IRAN SU25 SEAD" }, 4 )
A2GDispatcher:SetSquadronSead2( "Abbas SEAD", 600, 800, 2000, 2000, "RADIO" )
A2GDispatcher:SetSquadronTakeoffFromParkingHot( "Abbas SEAD" )
A2GDispatcher:SetSquadronOverhead( "Abbas SEAD", 0.2 )
A2GDispatcher:SetSquadronGrouping( "Abbas SEAD", 2 )


-- We set for each squadron a takeoff interval, as each helicopter will launch from a FARP.
-- This to prevent helicopters to clutter.
-- Each helicopter group is taking off the FARP in hot start.
-- A2GDispatcher:SetSquadronTakeoffInterval( "Helo", 10 )
-- A2GDispatcher:SetSquadronTakeoffInterval( "Maykop CAS", 60 )
-- A2GDispatcher:SetSquadronTakeoffInterval( "Maykop BAI", 60 )