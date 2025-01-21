ScoringObject = SCORING:New( "Simple" )

--local StaticSet_BLUE_CC = SET_UNIT:New():FilterPrefixes( "StaticSet_BLUE_CC" ):FilterStart()
--local BLUE_LP = SET_GROUP:New():FilterPrefixes( "BLUE_LP" ):FilterStart()
--local RED_CC = SET_GROUP:New():FilterPrefixes( "RED_CC" ):FilterStart()
--local BLUE_CC = SET_GROUP:New():FilterPrefixes( "BLUE_CC" ):FilterStart()


--ScoringStatic = SCORING:AddStaticScore("Static #1")

--local TOWER = SCORING:AddStaticScore():FilterPrefixes( "TOWER" ):FilterStart()

local TOWERS = STATIC:FindAllByMatching("[%w_]*TOWER[%w_]*")
for _i,tower in ipairs(TOWERS) do
  ScoringObject:AddStaticScore( tower, 1000 )
end

local BLUE_PAT = SET_GROUP:New():FilterPrefixes( "BLUE_PAT" ):FilterStart()
local BLUE_EWR = SET_GROUP:New():FilterPrefixes( "BLUE_EWR" ):FilterStart()
local BLUE_DOT = SET_GROUP:New():FilterPrefixes( "BLUE_DOT" ):FilterStart()
local BLUE_SEAD = SET_GROUP:New():FilterPrefixes( "BLUE_SEAD" ):FilterStart()
local BLUE_TANK = SET_GROUP:New():FilterPrefixes( "BLUE_TANK" ):FilterStart()
local BLUE_AVH = SET_GROUP:New():FilterPrefixes( "BLUE_AVH" ):FilterStart()
local BLUE_HSAM = SET_GROUP:New():FilterPrefixes( "BLUE_HSAM" ):FilterStart()
local BLUE_ZSU = SET_GROUP:New():FilterPrefixes( "BLUE_ZSU" ):FilterStart()
local BLUE_SUP = SET_GROUP:New():FilterPrefixes( "BLUE_SUP" ):FilterStart()
local BLUE_AK = SET_GROUP:New():FilterPrefixes( "BLUE_AK" ):FilterStart()

local RED_PAT = SET_GROUP:New():FilterPrefixes( "RED_PAT" ):FilterStart()
local RED_EWR = SET_GROUP:New():FilterPrefixes( "RED_EWR" ):FilterStart()
local RED_DOT = SET_GROUP:New():FilterPrefixes( "RED_DOT" ):FilterStart()
local RED_SEAD = SET_GROUP:New():FilterPrefixes( "RED_SEAD" ):FilterStart()
local RED_TANK = SET_GROUP:New():FilterPrefixes( "RED_TANK" ):FilterStart()
local RED_AVH = SET_GROUP:New():FilterPrefixes( "RED_AVH" ):FilterStart()
local RED_HSAM = SET_GROUP:New():FilterPrefixes( "RED_HSAM" ):FilterStart()
local RED_ZSU = SET_GROUP:New():FilterPrefixes( "RED_ZSU" ):FilterStart()
local RED_SUP = SET_GROUP:New():FilterPrefixes( "RED_SUP" ):FilterStart()
local RED_AK = SET_GROUP:New():FilterPrefixes( "RED_AK" ):FilterStart()


-- adding the score groups


--ScoringObject:AddScoreSetGroup( StaticSet_BLUE_CC, 500 )
--ScoringObject:AddScoreSetGroup( BLUE_LP, 250 ) Счет для пусковых патриотов

ScoringObject:AddScoreSetGroup( BLUE_PAT, 500 )
ScoringObject:AddScoreSetGroup( BLUE_EWR, 400 )
ScoringObject:AddScoreSetGroup( BLUE_DOT, 150 )
ScoringObject:AddScoreSetGroup( BLUE_SEAD, 100 )
ScoringObject:AddScoreSetGroup( BLUE_TANK, 60 )
ScoringObject:AddScoreSetGroup( BLUE_AVH, 40 )
ScoringObject:AddScoreSetGroup( BLUE_HSAM, 30 )
ScoringObject:AddScoreSetGroup( BLUE_ZSU, 20 )
ScoringObject:AddScoreSetGroup( BLUE_SUP, 10 )
ScoringObject:AddScoreSetGroup( BLUE_AK, 5 )

ScoringObject:AddScoreSetGroup( RED_PAT, 500 )
ScoringObject:AddScoreSetGroup( RED_EWR, 400 )
ScoringObject:AddScoreSetGroup( RED_DOT, 150 )
ScoringObject:AddScoreSetGroup( RED_SEAD, 100 )
ScoringObject:AddScoreSetGroup( RED_TANK, 60 )
ScoringObject:AddScoreSetGroup( RED_AVH, 40 )
ScoringObject:AddScoreSetGroup( RED_HSAM, 30 )
ScoringObject:AddScoreSetGroup( RED_ZSU, 20 )
ScoringObject:AddScoreSetGroup( RED_SUP, 10 )
ScoringObject:AddScoreSetGroup( RED_AK, 5 )

--ScoringObject:AddScoreSetGroup( BLUE_CAP_TANK, 60)
--ScoringObject:AddScoreSetGroup( BLUE_TOWER, 600)

--ScoringObject:AddScoreSetGroup( RED_TGT, 100 )

--ScoringObject:SetScaleDestroyScore( 10 )

--configuring messages to the team
SCORING:SetCoalitionChangePenalty(false)
SCORING:SetMessagesDestroy(false)
SCORING:SetMessagesHit(false)
SCORING:SetMessagesScore(true)
--SCORING:SetMessagesZone(false)

SCORING:SetMessagesToCoalition(true)
SCORING:SetMessagesToAll(false)


function ShowMyStats()
  for playerName, val in pairs(ScoringObject.Players) do
      local name = playerName
      local score = val['Score']
      MESSAGE:New(name .. " - " .. score, 10, "Score Update \n", true):ToClient(CLIENT:FindByPlayerName(playerName))
  end
  return 0
end

function ShowCoalitionStats()
  local message = ""
  for playerName, val in pairs(ScoringObject.Players) do
    local name = playerName
    message = message .. name .. " - " .. val['Score'] .. "\n"
  end
  MESSAGE:New(message, 10, "Score Update \n", true):ToAll()
end

local CommandMenu = MENU_MISSION:New("Управление миссией")
local ShowMyStatsCommand = MENU_MISSION_COMMAND:New("Моя статистика", CommandMenu, ShowMyStats)
local ShowCoalitionStatsCommand = MENU_MISSION_COMMAND:New("Общая статистика", CommandMenu, ShowCoalitionStats)

-- For debugging purposes
SCHEDULER:New( nil, function()
  ScoringObject:E( "Simple Scoring" )
end, {}, 0, 60 )