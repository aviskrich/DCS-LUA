GeoTools = {}

---Calculates coordinates with bearing and range from given point
---Keeps the same altitude that center has
---@param center Vec3
---@param bearingRad number #in radians
---@param rangeMeters number #in meters
---@return Vec3
function GeoTools.projectPoint(center, bearingRad, rangeMeters)
  ---@type Vec3
  DbgTools.logInfo("Angle is " .. tostring(math.deg(bearingRad)))
  local point = {
    x = math.cos(bearingRad) * rangeMeters + center.x,
    z = math.sin(bearingRad) * rangeMeters + center.z,
    y = center.y,
  }
  DbgTools.logInfo(center)
  DbgTools.logInfo(point)
  return point
end

---Returns distance in meters between two Vec3 points
---Ignores altitude
---@param a Vec3
---@param b Vec3
---@return number
function GeoTools.getDistance(a, b)
  return ((a.x - b.x) ^ 2 + (a.z - b.z) ^ 2) ^ 0.5
end

---Returns slant distance between two Vec3 points
---@param a Vec3
---@param b Vec3
---@return number
function GeoTools.getSlantDistance(a, b)
  return ((a.x - b.x) ^ 2 +
    (a.y - b.y) ^ 2 +
    (a.z - b.z) ^ 2) ^ 0.5
end

LuaTools = {}
function LuaTools.deepCopy(src)
  local dest
  if type(src) == "table" then
    dest = {}
    for key, value in next, src, nil do
      dest[LuaTools.deepCopy(key)] = LuaTools.deepCopy(value)
    end
    setmetatable(dest, LuaTools.deepCopy(getmetatable(src)))
  else
    dest = src
  end
  return dest
end

DbgTools = {}
function DbgTools.value2string(arg)
  local msg = ""
  if type(arg) == "string" then
    msg = arg
  elseif type(arg) == "number" then
    msg = string.format("%.2f", arg)
  elseif type(arg) == "table" then
    for key, value in pairs(arg) do
      msg = msg .. '["' .. key .. '"] = ' .. tostring(value) .. ',\n'
    end
  end
  return msg
end

function DbgTools.print(arg, seconds, clear)
  clear = clear or false
  seconds = seconds or 30
  local msg = DbgTools.value2string(arg)
  trigger.action.outText(msg, seconds, clear)
end

function DbgTools.logInfo(arg)
  local msg = DbgTools.value2string(arg)
  env.info(msg)
end

function DbgTools.logError(arg)
  local msg = DbgTools.value2string(arg)
  env.error(msg)
end

ConvTools = {}

function ConvTools.m2nm(m)
  return m / 1852
end

function ConvTools.nm2m(nm)
  return nm * 1852
end

function ConvTools.m2ft(m)
  return m * 3.28084
end

function ConvTools.ft2m(ft)
  return ft * 0.3048
end

---comment
---@param p Vec3
function ConvTools.mach2ms(mach, p)
  local k = atmosphere.getTemperatureAndPressure(p)
  local t = k - 273.15
  local soundVelocity = 20 * (t + 273.15) ^ 0.5
  local speed = ((mach * 1000 + 0.5) / 1000) * soundVelocity
  local soundSpeed = 331.3 * (1 + t / 273.15) ^ 0.5
  DbgTools.logInfo(string.format(
    "Sound speed dcs = %.2f, wiki = %.2f", soundVelocity, soundSpeed))
  DbgTools.logInfo(string.format("Speed = %.2f", speed))
  return speed
end
