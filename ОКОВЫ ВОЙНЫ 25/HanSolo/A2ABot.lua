-- A2A defense around Bandar Abbas using MOOSE EASYGCICAP.
-- Uses mission editor names only (EWR/AWACS and squadron templates).

local function log(msg)
  env.info(string.format("[A2ABot] %s", msg))
end

-- Fallback colors for zone drawing so we don't error if globals are absent.
local FillColor = _G.FillColor or { 0, 0, 0 }
local FillAlpha = _G.FillAlpha or 0.2

local BANDAR_AIRBASE = AIRBASE.PersianGulf.Bandar_Abbas_Intl

-- Mission editor template names.
local SQUADRON_TEMPLATES = {
  F14 = "SQ IRAN F14B",
  MIG29 = "SQ IRAN MIG29A"
}

-- Optional squadron names for tracking/logging.
local SQUADRON_NAMES = {
  F14 = "Abbas_F14",
  MIG29 = "Abbas_MiG29"
}

log("Starting EASYGCICAP setup for Bandar Abbas")

local bandarAirbase = AIRBASE:FindByName(BANDAR_AIRBASE)
if not bandarAirbase then
  log("Bandar Abbas airbase not found, aborting.")
  return
end

-- EASYGCICAP requires a warehouse static named exactly like the airbase.
-- If it's missing in the mission, create a placeholder so the wing can initialize.
local function ensureWarehouseStatic(name, airbase)
  if STATIC:FindByName(name, false) or UNIT:FindByName(name) then
    return
  end
  local coord = airbase:GetCoordinate()
  if not coord then
    log("Cannot create warehouse static: no coordinate for " .. tostring(name))
    return
  end
  local static = {
    category = "Warehouses",
    type = "Warehouse",
    name = name,
    heading = 0,
    x = coord.x,
    y = coord.z,
    canBeHidden = true,
    dead = false,
  }
  coalition.addStaticObject(country.id.IRAN, static)
  log("Spawned warehouse static for airbase: " .. tostring(name))
end

ensureWarehouseStatic("Bandar Abbas Intl", bandarAirbase)

local bandarCoord = bandarAirbase:GetCoordinate()
-- Simple circular zones around the base for CAP/accept/reject.
local capZone = ZONE_RADIUS:New("BANDAR_CAP", bandarCoord:GetVec2(), 90000)
local borderZone = ZONE_RADIUS:New("BANDAR_BORDER", bandarCoord:GetVec2(), 150000)

-- Draw helper (optional on map).
capZone:DrawZone(-1, { 0, 0, 1 }, 1, FillColor, FillAlpha, 1, true)
borderZone:DrawZone(-1, { 1, 0, 0 }, 1, FillColor, FillAlpha, 2, true)

-- Single wing defending Bandar Abbas.
local wing = EASYGCICAP:New("Bandar CAP Operations", BANDAR_AIRBASE, "red", "IRAN EWR 1")
wing:SetDefaultCAPSpeed(400)
wing:SetDefaultCAPAlt(35000)
wing:SetDefaultCAPDirection(180)
wing:SetDefaultCAPGrouping(4)
wing:SetDefaultMissionRange(200)
wing:SetMaxAliveMissions(6)
wing:SetDefaultTakeOffType("air") -- keep CAP on-station in the air (EASYGCICAP supports only hot/cold/air)

-- Patrol track over Bandar.
wing:AddPatrolPointCAP(BANDAR_AIRBASE, bandarCoord, 35000, 420, 90, 25)

-- Squadrons (mission editor late-activated templates).
wing:AddSquadron(SQUADRON_TEMPLATES.F14, SQUADRON_NAMES.F14, BANDAR_AIRBASE, 6, AI.Skill.EXCELLENT, 127, nil, "RU")
wing:AddSquadron(SQUADRON_TEMPLATES.MIG29, SQUADRON_NAMES.MIG29, BANDAR_AIRBASE, 10, AI.Skill.EXCELLENT, 127, nil, "RU")

-- Accept/reject coverage around Bandar.
wing:AddAcceptZone(borderZone)

log(string.format("EASYGCICAP ready: F14 template '%s', MiG29 template '%s', EWR prefix 'IRAN EWR'",
  SQUADRON_TEMPLATES.F14, SQUADRON_TEMPLATES.MIG29))

wing.debug = true
wing.Monitor = true
