----[[ ##### SCRIPT CONFIGURATION ##### ]]----

splash_damage_options = {
  static_damage_boost = 500,
  wave_explosions = true,
  larger_explosions = true,
  damage_model = true,
  blast_search_radius = 100,
  cascade_damage_threshold = 0.1,
  game_messages = false,
  blast_stun = false,
  unit_disabled_health = 30,
  unit_cant_fire_health = 50,
  infantry_cant_fire_health = 90,
  debug = false,
  weapon_missing_message = false,
  rocket_multiplier = 1.3,
}

local script_enable = 1
refreshRate = 0.1

----[[ ##### EXPLOSIVE TABLE ##### ]]----

explTable = {
  ["FAB_100"] = 25,
  ["FAB_250"] = 50,
  ["FAB_250M54TU"] = 50,
  ["FAB_500"] = 100,
  ["FAB_1500"] = 350,
  ["BetAB_500"] = 35,
  ["BetAB_500ShP"] = 35,
  ["KH-66_Grom"] = 20,
  ["Mk_81"] = 25,
  ["Mk_82"] = 40,
  ["Mk_83"] = 100,
  ["Mk_84"] = 220,
  ["MK_82AIR"] = 40,
  ["MK_82SNAKEYE"] = 40,
  ["GBU_10"] = 220,
  ["GBU_12"] = 40,
  ["GBU_16"] = 100,
  ["GBU_8_B"] = 100,
  ["KAB_1500Kr"] = 350,
  ["KAB_500Kr"] = 100,
  ["KAB_500"] = 100,
  ["GBU_31"] = 220,
  ["GBU_31_V_3B"] = 120,
  ["GBU_31_V_2B"] = 120,
  ["GBU_31_V_4B"] = 120,
  ["GBU_32_V_2B"] = 120,
  ["GBU_38"] = 40,
  ["AGM_62"] = 210,
  ["AGM_62_I"] = 20,
  ["GBU_24"] = 120,
  ["AGM_154C"] = 50,
  ["S-24A"] = 15,
  ["S-24B"] = 10,
  ["S-25OF"] = 30,
  ["S-25OFM"] = 30,
  ["S-25O"] = 30,
  ["S_25L"] = 30,
  ["MK-81SE"] = 25,
  ["GBU_54_V_1B"] = 40,
  ["SCUD_RAKETA"] = 712,
}

----[[ ##### UTILITY FUNCTIONS ##### ]]----

local function tableHasKey(t, key)
  return t[key] ~= nil
end

local function getDistance(p1, p2)
  local dx = p1.x - p2.x
  local dz = p1.z - p2.z
  return math.sqrt(dx * dx + dz * dz)
end

local function vec3Mag(v)
  return math.sqrt(v.x * v.x + v.y * v.y + v.z * v.z)
end

local function lookahead(speedVec)
  return vec3Mag(speedVec) * refreshRate * 1.5
end

function getWeaponExplosive(name)
  return explTable[name] or 0
end

----[[ ##### WEAPON TRACKING ##### ]]----

tracked_weapons = {}
WpnHandler = {}

local function track_wpns()
  for id, wpnData in pairs(tracked_weapons) do
    if wpnData.wpn:isExist() then
      wpnData.pos = wpnData.wpn:getPosition().p
      wpnData.dir = wpnData.wpn:getPosition().x
      wpnData.speed = wpnData.wpn:getVelocity()
    else
      local ip = land.getIP(wpnData.pos, wpnData.dir, lookahead(wpnData.speed))
      local impactPoint = ip or wpnData.pos

      local explosive = getWeaponExplosive(wpnData.name)
      if wpnData.cat == Weapon.Category.ROCKET then
        explosive = explosive * splash_damage_options.rocket_multiplier
      end

      if splash_damage_options.larger_explosions then
        trigger.action.explosion(impactPoint, explosive)
      end

      blastWave(impactPoint, splash_damage_options.blast_search_radius, wpnData.ordnance, explosive)
      tracked_weapons[id] = nil
    end
  end
end

local function onWpnEvent(event)
  if event.id ~= world.event.S_EVENT_SHOT or not event.weapon then return end

  local ordnance = event.weapon
  local desc = ordnance:getDesc()
  if not desc or not desc.warhead then return end
  if string.find(ordnance:getTypeName(), "weapons.shells") then return end

  tracked_weapons[ordnance.id_] = {
    wpn = ordnance,
    ordnance = ordnance,
    pos = ordnance:getPoint(),
    dir = ordnance:getPosition().x,
    speed = ordnance:getVelocity(),
    name = ordnance:getTypeName(),
    cat = ordnance:getCategory()
  }
end

function WpnHandler:onEvent(event)
  local ok, err = pcall(onWpnEvent, event)
  if not ok then
    env.warning("Splash Damage error: " .. tostring(err), true)
  end
end

----[[ ##### DAMAGE MODEL ##### ]]----

function modelUnitDamage(units)
  for _, unit in ipairs(units) do
    if unit:isExist() then
      local health = (unit:getLife() / unit:getDesc().life) * 100

      if unit:hasAttribute("Infantry") then
        if health <= splash_damage_options.infantry_cant_fire_health then
          unit:getController():setOption(AI.Option.Ground.id.ROE, AI.Option.Ground.val.ROE.WEAPON_HOLD)
        end
      elseif unit:getDesc().category == Unit.Category.GROUND_UNIT then
        if health <= splash_damage_options.unit_cant_fire_health then
          unit:getController():setOption(AI.Option.Ground.id.ROE, AI.Option.Ground.val.ROE.WEAPON_HOLD)
        end
        if health <= splash_damage_options.unit_disabled_health then
          unit:getController():setTask({ id = "Hold", params = {} })
          unit:getController():setOnOff(false)
        end
      end
    end
  end
end

----[[ ##### BLAST WAVE ##### ]]----

function blastWave(point, radius, weapon, power)
  local foundUnits = {}

  local vol = {
    id = world.VolumeType.SPHERE,
    params = { point = point, radius = radius }
  }

  local function ifFound(obj)
    if not obj:isExist() then return true end

    if obj:getCategory() == Object.Category.UNIT then
      foundUnits[#foundUnits + 1] = obj
    end

    if splash_damage_options.wave_explosions and obj:getDesc().box then
      local objPos = obj:getPoint()
      local distance = getDistance(point, objPos)
      local depth = math.abs(obj:getDesc().box.max.z - obj:getDesc().box.min.z)
      local surface_distance = math.max(distance - depth / 2, 1)

      local intensity = power / (4 * math.pi * surface_distance * surface_distance)
      local explosion_size = math.min(intensity * splash_damage_options.static_damage_boost, power)

      if explosion_size > splash_damage_options.cascade_damage_threshold then
        timer.scheduleFunction(
          trigger.action.explosion,
          { objPos, explosion_size },
          timer.getTime() + distance / 500
        )
      end
    end
    return true
  end

  world.searchObjects(Object.Category.UNIT, vol, ifFound)
  world.searchObjects(Object.Category.STATIC, vol, ifFound)
  world.searchObjects(Object.Category.SCENERY, vol, ifFound)

  if splash_damage_options.damage_model then
    timer.scheduleFunction(modelUnitDamage, foundUnits, timer.getTime() + 1.5)
  end
end

----[[ ##### START SCRIPT ##### ]]----

if script_enable == 1 then
  env.info("SPLASH DAMAGE SCRIPT RUNNING")
  timer.scheduleFunction(function()
    track_wpns()
    return timer.getTime() + refreshRate
  end, {}, timer.getTime() + refreshRate)

  world.addEventHandler(WpnHandler)
end
