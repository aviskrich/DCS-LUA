ScoringObject = SCORING:New( "Simple" )

local BLUE_TGT1 = SET_GROUP:New():FilterPrefixes( "BLUE_TGT1" ):FilterStart()
local BLUE_TGT2 = SET_GROUP:New():FilterPrefixes( "BLUE_TGT2" ):FilterStart()
local RED_TGT = SET_GROUP:New():FilterPrefixes( "RED_TGT" ):FilterStart()

-- adding the score groups
ScoringObject:AddScoreSetGroup( BLUE_TGT1, 100 )
ScoringObject:AddScoreSetGroup( BLUE_TGT2, 200 )
ScoringObject:AddScoreSetGroup( RED_TGT, 100 )

ScoringObject:SetScaleDestroyScore( 10 )

-- configuring messages to the team
SCORING:SetMessagesDestroy(false)
SCORING:SetMessagesHit(false)
-- SCORING:SetMessagesAddon(false)
-- SCORING:SetMessagesZone(false)

-- SCORING:SetMessagesToCoalition(true)
SCORING:SetMessagesToAll()


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