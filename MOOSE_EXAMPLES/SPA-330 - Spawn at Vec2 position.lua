local AI_GROUP_NAME = "BVR1-F16-ai"
local PLAYER_GROUP_NAME = "BVR1-F16-player"

SpawnFighters = SPAWN:New(AI_GROUP_NAME):InitLimit( 1, 50 )

spawnParams = {position = nil, heading = 0}

-- @param GROUP
-- @returns spawnParams
local function getSpawnParams ( playerGroup )
  local playerUnitPos = playerGroup:GetPositionVec3()
  local playerUnitVel = playerGroup:GetVelocityVec3()
  -- @type POINT_VEC3
  local aiRespPos = UTILS.VecTranslate(playerUnitPos, UTILS.NMToMeters(15), UTILS.VecHdg(playerUnitVel))
  aiRespPos.y = 4000
  local aiUnitHeading = math.fmod(UTILS.VecHdg(playerUnitVel)+180, 360)
  return {position = aiRespPos, heading = aiUnitHeading}
end

local function spawnFighterFromPlayer ( playerGroup )
  -- @class GROPU @type GROUP
  local playerPlaneGroup = GROUP:FindByName(PLAYER_GROUP_NAME)
  spawnParams = getSpawnParams (playerPlaneGroup)
  SpawnFighters:InitHeading(spawnParams.heading, spawnParams.heading)
  SpawnFighters:InitSpeedMps(600)
  local spawnedGroup = SpawnFighters:SpawnFromVec3(spawnParams.position)
  if spawnedGroup ~= nil then
    MESSAGE:New("F16 spawned at distance "..tostring(UTILS.VecDist3D(playerGroup:GetPositionVec3(), spawnedGroup:GetPositionVec3())),
      5, "INFO"):ToLog():ToAll()
  end
end

SCHEDULER:New(nil, function () 
    spawnFighterFromPlayer(GROUP:FindByName(PLAYER_GROUP_NAME))
  end, {}, 10, 3)