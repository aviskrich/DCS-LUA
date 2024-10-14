
oprint = print -- origin print 
print = function (...)
    if (... == true) then return trigger.action.outText("true", 40) end
    if (... == false) then return trigger.action.outText("false", 40) end
    if type(...) == "table" then
        local str = ''
        local amount = 0
        for i,v in pairs(...) do
            amount=amount+1
            local pre = type(i) == "string" and i.."=" or ""
            str = str .. pre..tostring(v) .. "\t"
        end
        trigger.action.outText(str, 40)
    else
      trigger.action.outText(..., 40)
    end
end

set_unit = SET_UNIT:New():FilterStart()

function Chance(percentage)
    local randomValue = math.random(100) -- Генерирует случайное число от 1 до 100
    return randomValue <= percentage
end

-- Полный вылет для бота воздух-земля??
function AirRouteToZone( Vehicle, ZoneRoute, Altitude, CAPCoord)
    if Altitude == nil then Altitude = 3000 end
    local Route = {}
  
    local FromCoord = Vehicle:GetCoordinate()
    local ToCoord = nil
    if CAPCoord ~= nil then
        --ToCoord = CAPCoord
    else
        ToCoord = ZoneRoute:GetCoordinate():SetAltitude(6000)
    end
    local unitsInZone = {}
    if ZoneRoute ~= nil then
        ZoneRoute:SearchZone(function(unit)
            unitsInZone[#unitsInZone+1] = {unit = unit, threat = unit:GetThreatLevel()}
        end)
        table.sort(unitsInZone, function(a,b) return a.threat > b.threat end)
    end

    if CAPCoord == nil then
        if #unitsInZone > 0 then
            local group = unitsInZone[1].unit:GetGroup()

            local task = Vehicle:TaskAttackGroup(group)
            
            Route[1] = FromCoord:WaypointAirTakeOffRunway(COORDINATE.WaypointAltType.BARO, 800)
            Route[2] = ToCoord:WaypointAirTurningPoint(COORDINATE.WaypointAltType.BARO, 800, {task})
            Route[2].alt = Altitude
        else
            Vehicle:Destroy(false, 0)
            return false
        end
        
        Vehicle:Route( Route )
    end

    for _,unit in pairs(Vehicle:GetUnits()) do
        unit:HandleEvent(EVENTS.EngineShutdown)
        function unit:OnEventEngineShutdown(EventData) 
            self:Destroy(false, 0)
        end
    end
    

    return true
end

-- Полный запуск техники
function GroudRouteToZone(Vehicle, ZoneRoute)
    local Route = {}
    local TargetZone = ZoneRoute
    if ZoneRoute.spawnzone ~= nil then TargetZone = ZoneRoute.spawnzone end
  
    local FromCoord = Vehicle:GetCoordinate()
    local ToCoord = TargetZone:GetCoordinate():GetRandomCoordinateInRadius(1500)

    local unitsInZone = {}
    ZoneRoute:SearchZone(function(unit)
        unitsInZone[#unitsInZone+1] = {unit = unit, threat = unit:GetThreatLevel()}
    end, {Object.Category.UNIT})

    table.sort(unitsInZone, function(a,b) return a.threat > b.threat end)

    task = {}
    if #unitsInZone > 0 then
        local group = unitsInZone[1].unit:GetGroup()
        table.insert(task, Vehicle:TaskAttackGroup(group))
    end

    Route[1] = FromCoord:WaypointGround(60, "On Road")
    Route[2] = ToCoord:WaypointGround(60, "On Road", task)
    Vehicle:Route( Route )
end

function SelectCosesestZoneRed(Vehicle)
    local closesZone = nil
    local distance = nil
    for _, zone in ipairs(airbasesArray) do
        local tmpdistance = Vehicle:GetCoordinate():Get2DDistance(zone:GetCoordinate())
        if distance == nil or (tmpdistance < distance and zone.side ~= coalition.side.BLUE) then
            distance = tmpdistance
            closesZone = zone
        end
    end

    for _, hub in ipairs(hubsArray) do
        local tmpdistance = Vehicle:GetCoordinate():Get2DDistance(hub:GetCoordinate())
        if distance == nil or (tmpdistance < distance and hub.side ~= coalition.side.BLUE) then
            distance = tmpdistance
            closesZone = hub
        end
    end    

    return closesZone
end

-- Функция для создания на аэродроме
function SpawnAirAtAirbase(spawner, airbase)  
    if airbase then
        return spawner:SpawnAtAirbase(airbase, SPAWN.Takeoff.Cold)
    end
end

-- Функция для создания юнита в зоне
function SpawnInZone(spawner, airbase) 
    local spawnbase = airbase
    if airbase then
        if airbase.spawnzone then spawnbase = airbase.spawnzone end
        return spawner:SpawnInZone(spawnbase, true)
    end
end

function DespawnUnit()

end
