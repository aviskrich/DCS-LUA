---dcsme
local AircraftTypes = {
  ["B52"] = "B-52H",
  ["KC135"] = "KC-135",
  ["E2"] = "E-2C",
  ["E3"] = "E-3A",
  ["KC130"] = "KC130",
  ["A50"] = "A-50",
  ["SU24"] = "Su-24M",
  ["S3"] = "S-3B Tanker"
}

---@param input string
local function parseCoordinates(input)
  local latDir = "([NSns])"
  local longDir = "([EWew])"
  local ddmLat = "(%d%d)[^%d]+(%d%d?)[^%d]+(%d%d%d?%d?)"
  local ddmLong = "(%d%d%d?)[^%d]+(%d%d?)[^%d]+(%d%d%d?%d?)"

  local regexp = string.format(".*%s.-%s.*%s.-%s.*", latDir, ddmLat, longDir, ddmLong)

  local latN, latD, latM, latDM, longE, longD, longM, longDM = input:match(regexp)
  latM = latM .. '.' .. latDM
  longM = longM .. '.' .. longDM
  if latN then
    local lat = {
      direction = latN:upper(),
      degrees = tonumber(latD),
      minutes = tonumber(latM),
    }
    local long = {
      direction = longE:upper(),
      degrees = tonumber(longD),
      minutes = tonumber(longM),
    }
    local latRes = lat.degrees + lat.minutes / 60
    local longRes = long.degrees + long.minutes / 60
    if lat.direction == 'S' then
      latRes = -1 * latRes
    end
    if long.direction == 'W' then
      longRes = -1 * longRes
    end
    return latRes, longRes
  else
    return nil
  end
end

---comment
---@param routePoints Miz.Plane.Group.Route.Point[]
---@param addendPoints Miz.Plane.Group.Route.Point[]
local function appendWaypoints(routePoints, addendPoints)
  for _, p in ipairs(addendPoints) do
    routePoints[#routePoints + 1] = p
  end
  return routePoints
end

local function makeComboTask(...)
  local comboTask = {
    id = 'ComboTask',
    params = {
      tasks = {},
    }
  }
  for _, val in ipairs(arg) do
    comboTask.params.tasks[#comboTask.params.tasks + 1] = val
  end

  return comboTask
end

Side = coalition.side

---@class BotGroup
---@field type string
---@field id string --e.g. KC130-D
---@field name string
---@field templateData Miz.Plane.Group
---@field countryId country.id
BotGroup = {}
BotGroup.__index = BotGroup
---comment
---@param id string
---@param countryId country.id
---@return BotGroup
function BotGroup.new(id, countryId)
  local newObj = setmetatable({ id = id }, BotGroup)
  newObj.name = id
  newObj.countryId = countryId
  return newObj
end

---@param groupData Miz.Plane.Group
function BotGroup:setTemplate(groupData)
  self.templateData = groupData
  self.templateData.gropuId = 0
  self.templateData.lateActivation = false
  self.templateData.uncontrollable = true
  self.name = string.format("%s | %s | %s", self.id, self.templateData.frequency, self:getTacan())
  self.templateData.name = self.name

  self.type = self.templateData.units[1].type
end

function BotGroup:getTacan()
  for _, task in ipairs(self.templateData.route.points[1].task.params.tasks) do
    if task.id == "WrappedAction" then
      if task.params.action.id == "ActivateBeacon" then
        local p = task.params.action.params
        return string.format("%d%s", p.channel, p.modeChannel)
      end
    end
  end
  return ""
end

function BotGroup:spawn()
  coalition.addGroup(self.countryId, Group.Category.AIRPLANE, self.templateData)
end

---@param points Miz.Plane.Group.Route.Point[]
function BotGroup:spawnWithWaypoints(points)
  ---@type Miz.Plane.Group
  local data = LuaTools.deepCopy(self.templateData)
  appendWaypoints(data.route.points, points)
  coalition.addGroup(self.countryId, Group.Category.AIRPLANE, data)
  self:deleteStaticOnTakeoff()
  self:addAWACStoIADS()
end

function BotGroup:addAWACStoIADS()
  DbgTools.logInfo(string.format("AWACS id = %s", self.id))
  local iads
  if self.id == "E3A-A" or
      self.id == "E3A-B" or
      self.id == "E2D-A" or
      self.id == "E2D-B" or
      self.id == "E2D-C" or
      self.id == "E2D-D" then
    --DbgTools.logInfo("There are blue IADS")
    local group = Group.getByName(self.name)
    if group and TheBlueIADS then
      local name = group:getUnit(1):getName()
      TheBlueIADS:addEarlyWarningRadar(name)
      DbgTools.logInfo(string.format("%s has been added to IADS", name))
    end
  end

  if self.id == "KJ-A" or
      self.id == "KJ-B" then
    --DbgTools.logInfo("There are red IADS")
    local group = Group.getByName(self.name)
    if group and TheRedIADS then
      local name = group:getUnit(1):getName()
      TheRedIADS:addEarlyWarningRadar(name)
      DbgTools.logInfo(string.format("%s has been added to IADS", name))
    end
  end
end

function BotGroup:deleteStaticOnTakeoff()
  local group = Group.getByName(self.name)
  if group then
    for _, unit in ipairs(group:getUnits()) do
      local staticName = unit:getName() .. 'S'
      local staticUnit = StaticObject.getByName(staticName)
      if staticUnit then
        staticUnit:destroy()
      end
    end
  end
end

function BotGroup:getTankerEnrouteTasks()
  local tasks = {}
  tasks[#tasks + 1] = { id = 'Tanker', params = {} }
  return tasks
end

function BotGroup:getAwacsEnrouteTasks()
  local tasks = {}
  tasks[#tasks + 1] = { id = "AWACS", params = {} }
  return tasks
end

function BotGroup:getEmptyEnrouteTask()
  return {}
end

function BotGroup:getEnrouteTasks()
  local taskMap = {
    ["KC130"] = self.getTankerEnrouteTasks,
    ["S-3B Tanker"] = self.getTankerEnrouteTasks,
    ["KC-135"] = self.getTankerEnrouteTasks,
    ["KC135MPRS"] = self.getTankerEnrouteTasks,
    ["E-2C"] = self.getAwacsEnrouteTasks,
    ["E-3A"] = self.getAwacsEnrouteTasks,
    ["KJ-2000"] = self.getAwacsEnrouteTasks,
    ["A-50"] = self.getAwacsEnrouteTasks,
    ["B-52H"] = self.getEmptyEnrouteTask,
    ["B-1B"] = self.getEmptyEnrouteTask,
    ["C-130"] = self.getEmptyEnrouteTask,
    ["C-17A"] = self.getEmptyEnrouteTask,
    ["Su-24M"] = self.getEmptyEnrouteTask,
  }

  return taskMap[self.type](self)
end

local function makeFireAtPointTask(x, y, quantity)
  local fire = {
    ["enabled"] = true,
    ["id"] = "FireAtPoint",
    ["params"] =
    {
      ["y"] = y,
      ["templateId"] = "",
      ["expendQtyEnabled"] = true,
      ["alt_type"] = 1,
      ["expendQty"] = quantity,
      ["x"] = x,
      ["weaponType"] = Weapon.flag.CruiseMissile,
      ["zoneRadius"] = 0,
    }, -- end of ["params"]
  }
  return fire
end

---@return Miz.Plane.Group.Route.Point
local function makeWaypoint(x, y, alt, speed)
  ---@type Miz.Plane.Group.Route.Point
  local point = {
    x = x or 0,
    y = y or 0,
    alt = alt or 0,
    alt_type = AI.Task.AltitudeType.BARO,
    speed = speed or 180, ---TODO
    speed_locked = true,
    type = AI.Task.WaypointType.TURNING_POINT,
    action = AI.Task.WaypointType.TURNING_POINT,
  }
  return point
end

local function makeOrbitTask(alt, speed, pattern)
  local raceTrackTask = {
    ["enabled"] = true,
    ["auto"] = false,
    ["id"] = "Orbit",
    ["number"] = 1,
    ["params"] =
    {
      ["altitude"] = alt,
      ["pattern"] = pattern or AI.Task.OrbitPattern.RACE_TRACK,
      ["speed"] = speed or 180,
      ["speedEdited"] = true,
    }, -- end of ["params"]
  }
  return raceTrackTask
end

local function makeBombingTask(targets, weaponType)
  local expendMap = {
    [1] = "One",
    [2] = "Two",
    [4] = "Four",
    [8] = "All",
  }

  local bomb = {
    ["number"] = 1,
    ["auto"] = false,
    ["id"] = "Bombing",
    ["enabled"] = true,
    ["params"] =
    {
      ["direction"] = 0,
      ["attackQtyLimit"] = false,
      ["attackQty"] = 1,
      ["expend"] = "Two",
      ["altitude"] = 2000,
      ["directionEnabled"] = false,
      ["groupAttack"] = false,
      ["y"] = 0,
      ["altitudeEnabled"] = false,
      ["weaponType"] = weaponType or Weapon.flag.CruiseMissile,
      ["x"] = 0,
    }, -- end of ["params"]
  }

  local tasks = {}
  for i, target in ipairs(targets) do
    local newTask = LuaTools.deepCopy(bomb)
    newTask.params.x = target.point.x
    newTask.params.y = target.point.y
    newTask.params.expend = expendMap[tonumber(target.expend)]
    newTask.params.groupAttack = target.groupAttack
    newTask.number = i
    tasks[#tasks + 1] = newTask
  end
  DbgTools.logInfo(Inspect(tasks))
  return tasks
end

function BotGroup:executeOrbit(cmd)
  local raceTrackTask = makeOrbitTask(cmd.startPoint.y, cmd.speed)
  local raceTrackWaypoints = {} ---@type Miz.Plane.Group.Route.Point[]
  raceTrackWaypoints[1] =
      makeWaypoint(cmd.startPoint.x, cmd.startPoint.z, cmd.startPoint.y, cmd.speed)
  raceTrackWaypoints[1].task = makeComboTask(raceTrackTask)
  raceTrackWaypoints[2] =
      makeWaypoint(cmd.endPoint.x, cmd.endPoint.z, cmd.endPoint.y, cmd.speed)

  if self:isInAir() then
    local group = Group.getByName(self.name)
    if group and group:isExist() then
      local controller = group:getController()
      local routePoints = {}
      routePoints[1] = self:waypointFromCurrentPosition()
      routePoints[1].task = makeComboTask(unpack(self:getEnrouteTasks()))
      appendWaypoints(routePoints, raceTrackWaypoints)
      local mission = {
        id = 'Mission',
        params = {
          airborne = true,
          route = {
            points = routePoints,
          }
        }
      }

      DbgTools.logInfo(Inspect(mission))
      controller:setTask(mission)
    end
  else
    self:spawnWithWaypoints(raceTrackWaypoints)
    return
  end
end

---comment
---@param group Group
local function makeDespawnTask(group)
  local script = string.format("Group.getByName(\"%s\"):destroy()", group:getName())
  local wrappedAction = {
    ["number"] = 1,
    ["auto"] = false,
    ["id"] = "WrappedAction",
    ["enabled"] = true,
    ["params"] =
    {
      ["action"] =
      {
        ["id"] = "Script",
        ["params"] =
        {
          ["command"] = script
        }, -- end of ["params"]
      },   -- end of ["action"]
    },     -- end of ["params"]
  }
  return wrappedAction
end

local function makeAiOption(name, value)
  local wrappedAction = {
    ["id"] = "WrappedAction",
    ["number"] = 1,
    ["params"] =
    {
      ["action"] =
      {
        ["id"] = "Option",
        ["params"] =
        {
          ["value"] = value,
          ["name"] = name,
        }, -- end of ["params"]
      },   -- end of ["action"]
    },     -- end of ["params"]
  }
  return wrappedAction
end

function BotGroup:isInAir()
  local group = Group.getByName(self.name)
  local inAir = true
  if group and group:isExist() then
    if #group:getUnits() == 0 then
      return false
    end
    for _, unit in ipairs(group:getUnits()) do
      inAir = inAir and unit:inAir()
    end
  else
    inAir = false
  end
  
  return inAir
end

function BotGroup:executeLanding(cmd)
  local group = Group.getByName(self.name)
  if group and group:isExist() then
    local inAir = true
    for _, unit in ipairs(group:getUnits()) do
      inAir = inAir and unit:inAir()
    end
    if inAir then
      ---@type Airbase
      local airbase = cmd.airbase
      ---@type Miz.Plane.Group.Route.Point
      local landWaypoint = {
        x = airbase:getPoint().x,
        y = airbase:getPoint().z,
        alt = airbase:getPoint().y,
        alt_type = AI.Task.AltitudeType.BARO,
        type = AI.Task.WaypointType.LAND,
        action = "Landing",
        speed = 140,
        task = {},
        airdromeId = airbase:getID(),
      }
      if airbase:getCategoryEx() == Airbase.Category.SHIP then
        landWaypoint = makeWaypoint(airbase:getPoint().x, airbase:getPoint().z, 244)
        landWaypoint.task = makeComboTask(makeDespawnTask(group))
      end

      local intermittentWP = makeWaypoint(cmd.markPoint.x, cmd.markPoint.z, 2000)

      local routePoints = {}
      routePoints[1] = intermittentWP
      routePoints[2] = landWaypoint
      local mission = {
        id = 'Mission',
        params = {
          airborne = true,
          route = {
            points = routePoints,
          }
        }
      }
      DbgTools.logInfo(Inspect(mission))
      group:getController():setTask(mission)
    end
  end
end

function BotGroup:executeStrike(cmd)
  local group = Group.getByName(self.name)
  local weaponType

  if cmd.groupId:find("B1") then
    weaponType = Weapon.flag.AnyASM
  end

  local waypoints = {} ---@type Miz.Plane.Group.Route.Point[]
  waypoints[1] = makeWaypoint(cmd.point.x, cmd.point.z, cmd.point.y)
  waypoints[1].task = makeComboTask(unpack(makeBombingTask(cmd.targets, weaponType)))

  DbgTools.logInfo(Inspect(waypoints[1]))

  local inAir = true
  if group and group:isExist() then
    for _, unit in ipairs(group:getUnits()) do
      inAir = inAir and unit:inAir()
    end
  else
    inAir = false
  end

  if inAir then
    local mission = {
      id = 'Mission',
      params = {
        airborne = true,
        route = {
          points = waypoints,
        }
      }
    }
    group:getController():setTask(mission)
  else
    self:spawnWithWaypoints(waypoints)
  end
end

local function getAntiShipEnrouteTask()
  local antiShipEnroute = {
    ["number"] = 1,
    ["key"] = "AntiShip",
    ["id"] = "EngageTargets",
    ["auto"] = false,
    ["enabled"] = true,
    ["params"] =
    {
      ["targetTypes"] =
      {
        [1] = "Ships",
      }, -- end of ["targetTypes"]
      ["priority"] = 0,
    },   -- end of ["params"]
  }
  return antiShipEnroute
end

local function getEngageShipsTask()
  local engageShips = {
    ["enabled"] = true,
    ["auto"] = false,
    ["id"] = "EngageTargets",
    ["number"] = 2,
    ["params"] =
    {
      ["targetTypes"] =
      {
        [1] = "Naval",
      }, -- end of ["targetTypes"]
      ["noTargetTypes"] =
      {
      }, -- end of ["noTargetTypes"]
      ["value"] = "Naval;",
      ["priority"] = 0,
      ["maxDistEnabled"] = false,
      ["maxDist"] = 15000,
    }, -- end of ["params"]
  }
  return engageShips
end

function BotGroup:executeAntiShip(cmd)
  local waypoints = {} ---@type Miz.Plane.Group.Route.Point[]
  waypoints[1] = makeWaypoint(cmd.point.x, cmd.point.z, cmd.point.y, cmd.speed)

  waypoints[1].task = makeComboTask(getAntiShipEnrouteTask(), getEngageShipsTask())

  DbgTools.logInfo(Inspect(waypoints[1]))

  if self:isInAir() then
    local mission = {
      id = 'Mission',
      params = {
        airborne = true,
        route = {
          points = waypoints,
        }
      }
    }
    local group = Group.getByName(self.name)
    group:getController():setTask(mission)
  else
    self:spawnWithWaypoints(waypoints)
  end
end

local function getSeadEnrouteTask()
  local sead = {
    ["enabled"] = true,
    ["key"] = "SEAD",
    ["id"] = "EngageTargets",
    ["number"] = 1,
    ["auto"] = true,
    ["params"] =
    {
      ["targetTypes"] =
      {
        [1] = "Air Defence",
      }, -- end of ["targetTypes"]
      ["priority"] = 0,
    },   -- end of ["params"]
  }
end

function BotGroup:executeSead(cmd)
  local waypoints = {} ---@type Miz.Plane.Group.Route.Point[]
  waypoints[1] = makeWaypoint(cmd.point.x, cmd.point.z, cmd.point.y, cmd.speed)

  waypoints[1].task = makeComboTask(getSeadEnrouteTask())

  DbgTools.logInfo(Inspect(waypoints[1]))

  if self:isInAir() then
    local mission = {
      id = 'Mission',
      params = {
        airborne = true,
        route = {
          points = waypoints,
        }
      }
    }
    local group = Group.getByName(self.name)
    group:getController():setTask(mission)
  else
    self:spawnWithWaypoints(waypoints)
  end
end

function BotGroup:executeShipLaunch(cmd)
  local group = Group.getByName(self.name)
  if group and group:isExist() then
    local aiController = group:getController()
    for _, target in ipairs(cmd.targets) do
      local task = makeFireAtPointTask(target.point.x, target.point.y, tonumber(target.expend))
      DbgTools.logInfo(Inspect(task))
      aiController:pushTask(task)
    end
  end
end

function BotGroup:execute(cmd)
  if cmd.cmdId == "orbit" then
    self:executeOrbit(cmd)
  elseif cmd.cmdId == "land" then
    self:executeLanding(cmd)
  elseif cmd.cmdId == "strike" then
    self:executeStrike(cmd)
  elseif cmd.cmdId == "antiship" then
    self:executeAntiShip(cmd)
  elseif cmd.cmdId == "sead" then
    self:executeSead(cmd)
  elseif cmd.cmdId == "shiplaunch" then
    self:executeShipLaunch(cmd)
  end
end

---@return Miz.Plane.Group.Route.Point
function BotGroup:waypointFromCurrentPosition()
  local group = Group.getByName(self.name)
  if group and group:isExist() then
    local unit
    for i = 1, 4, 1 do
      unit = group:getUnit(i)
      if unit and unit:isExist() and unit:inAir() then
        break
      end
    end

    local curPoint = unit:getPoint()
    ---@type Miz.Plane.Group.Route.Point
    local waypoint = {
      x = curPoint.x,
      y = curPoint.z,
      alt = curPoint.y,
      alt_type = AI.Task.AltitudeType.BARO,
      speed_locked = true,
      speed = 180,
      action = AI.Task.WaypointType.TURNING_POINT,
      type = AI.Task.WaypointType.TURNING_POINT,
    }
    return waypoint
  end
end

---@class BotController
---@field side coalition.side
---@field list table<string, BotGroup>
BotController = {}
BotController.__index = BotController

---@param side coalition.side
---@return BotController
function BotController.new(side)
  local newCntl = setmetatable({}, BotController)
  newCntl.side = side
  newCntl.list = {}
  return newCntl
end

function BotController:addGroup(id)
  local countryId
  if self.side == Side.BLUE then
    countryId = country.id.USA
  elseif self.side == Side.RED then
    countryId = country.id.IRAN
  end
  self.list[id] = BotGroup.new(id, countryId)
end

function BotController:getMizCoalition()
  if self.side == Side.RED then
    return env.mission.coalition.red
  elseif self.side == Side.BLUE then
    return env.mission.coalition.blue
  end
end

function BotController:loadTemplates()
  DbgTools.logInfo("Loading templates for " .. tostring(self.side))
  local coalition = self:getMizCoalition()
  for _, country in ipairs(coalition.country) do
    if country["plane"] then
      for _, group in ipairs(country["plane"]["group"]) do
        local botGroup = self.list[group.name]
        if botGroup then
          DbgTools.logInfo(group.name .. " was found")
          botGroup:setTemplate(LuaTools.deepCopy(group))
        end
      end
    end
  end
end

---@param id string
---@return boolean
function BotController:contains(id)
  local upperId = id:upper()
  DbgTools.logInfo(Inspect(self.list))
  if self.list[upperId] then
    return true
  else
    return false
  end
end

---@param cmd table
function BotController:onCommand(cmd)
  local botGroup = self.list[cmd.groupId]
  if not botGroup then
    return
  end

  botGroup:execute(cmd)
end

Main = {
  red = BotController.new(Side.RED),
  blue = BotController.new(Side.BLUE),
}

Main.blueAI = {
  "KC130-A",
  "KC130-B",
  "KC130-C",
  "KC130-D",
  "KC135-A",
  "KC135-B",
  "KC135-C",
  "KC135-D",
  "KC135M-A",
  "KC135M-B",
  "KC135M-C",
  "KC135M-D",
  "E2D-A",
  "E2D-B",
  "E2D-C",
  "E2D-D",
  "E3A-A",
  "E3A-B",
  "S3B-A",
  "S3B-B",
  "S3B-C",
  "S3B-D",
  "B52-A",
  "B52-B",
  "B1-A",
  "B1-B",
  "AB-A",
  "AB-B",
  "AB-C",
  "AB-D",
  "C17-A",
  "C17-B",
}

Main.redAI = {
  "SU24-A",
  "SU24-B",
  "SU24-C",
  "SU24-D",
  "KC135M-E",
  "KC135M-F",
  "KC135-E",
  "KC135-F",
  "KJ-A",
  "KJ-B",
  "C130-A",
  "C130-B",
  "C130-C",
  "C130-D",
  "C130-E",
  "C130-F",
  "A50-A",
}

function Main:main()
  for _, val in ipairs(self.blueAI) do
    self.blue:addGroup(val)
  end
  self.blue:loadTemplates()

  for _, val in ipairs(self.redAI) do
    self.red:addGroup(val)
  end
  self.red:loadTemplates()
end

function Main:getController(side)
  if side == Side.RED then
    return self.red
  elseif side == Side.BLUE then
    return self.blue
  end
end

---@class Command
Command = {}


---@param mark EventMark
function Command.parse(mark)
  local lines = {} ---@type string[]
  local parts = {} ---@type string[]
  for l in mark.text:gmatch("[^\r\n]+") do
    lines[#lines + 1] = l
  end

  if #lines >= 1 then
    for w in lines[1]:gmatch("%S+") do
      parts[#parts + 1] = w
    end

    DbgTools.logInfo(parts)

    if #parts < 2 then
      return nil
    end

    local cntl = Main:getController(mark.coalition)
    parts[1] = parts[1]:upper()
    if cntl and cntl:contains(parts[1]) then
      DbgTools.logInfo("Found a group " .. parts[1])
    else
      return nil
    end

    local partTwo = parts[2]
    if partTwo then
      partTwo = partTwo:lower()
    end

    local cmd
    DbgTools.logInfo(parts[2])
    DbgTools.logInfo(partTwo)
    if partTwo and partTwo:find('w') then
      --make the waypoint cmd
      cmd = Command.makeStrike(mark, parts, lines)
    elseif partTwo and partTwo:find('s') then
      cmd = Command.makeAntiShip(mark, parts)
    elseif partTwo and partTwo:find('r') then
      cmd = Command.makeSead(mark, parts)
    elseif partTwo and partTwo:find('m') then
      cmd = Command.makeShipLaunch(mark, parts, lines)
    elseif partTwo and partTwo:find('land') then
      --make the land cmd
      cmd = Command.makeLand(mark, parts)
    else
      --make the orbit cmd
      cmd = Command.makeOrbit(mark, parts)
    end
    if cmd then
      DbgTools.logInfo(Inspect(cmd))
      cntl:onCommand(cmd)
    end
  end
end

---@param a Vec3
---@param b Vec3
local function calcVec3HorizontalDistance(a, b)
  return ((a.x - b.x) ^ 2 + (a.z - b.z) ^ 2) ^ 0.5
end


---comment
---@param mark EventMark
---@param parts string[]
function Command.makeLand(mark, parts)
  local landing = { cmdId = "land" }
  local bases = world.getAirbases(mark.coalition)

  table.sort(bases, function(a, b)
    return calcVec3HorizontalDistance(mark.pos, a:getPoint()) <
        calcVec3HorizontalDistance(mark.pos, b:getPoint())
  end)

  landing.groupId = parts[1]
  landing.airbase = bases[1]
  landing.markPoint = mark.pos
  DbgTools.logInfo(landing.airbase:getName())
  return landing
end

---@param mark EventMark
---@param parts string[]
function Command.makeAntiShip(mark, parts)
  local antiShip = { cmdId = "antiship" }
  antiShip.groupId = parts[1]
  local tokens = {}

  local input = parts[2]
  for token in input:gmatch("[^/]+") do
    tokens[#tokens + 1] = token
  end
  local alt = tonumber(tokens[2])
  local mach = tonumber(tokens[3]) or 0.8

  if not alt or not mach then
    return
  end

  antiShip.point = mark.pos
  antiShip.point.y = ConvTools.ft2m(alt * 100)
  antiShip.speed = ConvTools.mach2ms(mach, antiShip.point)
  return antiShip
end

---@param mark EventMark
---@param parts string[]
function Command.makeSead(mark, parts)
  local antiShip = { cmdId = "sead" }
  antiShip.groupId = parts[1]
  local tokens = {}

  local input = parts[2]
  for token in input:gmatch("[^/]+") do
    tokens[#tokens + 1] = token
  end
  local alt = tonumber(tokens[2])
  local mach = tonumber(tokens[3]) or 0.8

  if not alt or not mach then
    return
  end

  antiShip.point = mark.pos
  antiShip.point.y = ConvTools.ft2m(alt * 100)
  antiShip.speed = ConvTools.mach2ms(mach, antiShip.point)
  return antiShip
end

---@param mark EventMark
---@param parts string[]
---@param lines string[]
function Command.makeStrike(mark, parts, lines)
  local strike = { cmdId = "strike" }
  strike.groupId = parts[1]

  local tokens = {}
  local input = parts[2]
  for token in input:gmatch("[^/]+") do
    tokens[#tokens + 1] = token
  end
  local alt = tonumber(tokens[2])
  local mach = tonumber(tokens[3]) or 0.8

  if not alt or not mach then
    return
  end
  strike.point = mark.pos
  strike.point.y = ConvTools.ft2m(alt * 100)
  strike.speed = ConvTools.mach2ms(mach, strike.point)

  --lines[i] = N26.31.907 E53.58.495 #1 g

  strike.targets = {}
  DbgTools.logInfo(mark.text)
  if #lines > 1 then
    for i = 2, #lines, 1 do
      DbgTools.logInfo(lines[i])
      local lat, long = parseCoordinates(lines[i])
      local expend = lines[i]:match("#(%d+)")
      local containstGroupFlag = lines[i]:find('g')
      local groupAttack = false
      if containstGroupFlag then
        groupAttack = true
      end
      local t = coord.LLtoLO(lat, long, 0)
      strike.targets[#strike.targets + 1] = {
        point = { x = t.x, y = t.z },
        expend = expend or 1,
        groupAttack = groupAttack,
      }
    end
  end

  return strike
end

---@param mark EventMark
---@param parts string[]
---@param lines string[]
function Command.makeShipLaunch(mark, parts, lines)
  local launch = { cmdId = "shiplaunch" }
  launch.groupId = parts[1]

  launch.targets = {}
  DbgTools.logInfo(#lines)
  if #lines > 1 then
    for i = 2, #lines, 1 do
      DbgTools.logInfo(lines[i])
      local lat, long = parseCoordinates(lines[i])
      local expend = lines[i]:match("#(%d+)")
      local t = coord.LLtoLO(lat, long, 0)
      launch.targets[#launch.targets + 1] = {
        point = { x = t.x, y = t.z },
        expend = expend or 1,
      }
    end
  end

  return launch
end

---comment
---@param mark EventMark
---@param parts string[]
function Command.makeOrbit(mark, parts)
  local orbit = { cmdId = "orbit" }
  local input = parts[2]
  orbit.groupId = parts[1]
  local tokens = {}
  for token in input:gmatch("[^/]+") do
    tokens[#tokens + 1] = token
  end
  local bearing = tonumber(tokens[1])
  local leg = tonumber(tokens[2])
  local alt = tonumber(tokens[3])
  local mach = tonumber(tokens[4]) or 0.5

  if not bearing or not leg or not alt or not mach then
    return
  end

  orbit.startPoint = mark.pos
  orbit.startPoint.y = ConvTools.ft2m(alt * 100)

  orbit.endPoint = GeoTools.projectPoint(orbit.startPoint, math.rad(bearing), ConvTools.nm2m(leg))
  orbit.speed = ConvTools.mach2ms(mach, orbit.startPoint)
  return orbit
end

Usermarks = {}

--[[
KC130 id 271/20/245/0.55
------------------------------
B52 id4 w/350/0.8
N24.24.360 E35.35.412 =2
------------------------------
SU24AS id 180/30/350/0.9
SU24AS id 2
--]]
function Usermarks:onEvent(event)
  if event.id == world.event.S_EVENT_MARK_CHANGE then
    local e = event --[[@as EventMark]]
    --DbgTools.print(e)
    Command.parse(e)
  elseif event.id == world.event.S_EVENT_UNIT_LOST then
    --DbgTools.logInfo(Inspect(event))
  elseif event.id == world.event.S_EVENT_LAND then
    --DbgTools.logInfo(Inspect(event))
  end
end

world.addEventHandler(Usermarks)

Main:main()
