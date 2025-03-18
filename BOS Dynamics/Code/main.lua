local khasab = AIRBASE:FindByID(10)
local storage = khasab:GetStorage()
--local warhouse = khasab:GetWarehouse()
local inventory = storage:GetInventory()
--UTILS.PrintTableToLog(storage)

--print(storage:GetLiquidAmount(STORAGE.Liquid.JETFUEL))
--UTILS.PrintTableToLog(storage:GetLiquidAmount(STORAGE.Liquid.DIESEL))
--trigger.action.outText(Result, 10)

function MyCommand(text)
  trigger.action.outText("Вы выбрали команду!" .. text, 10)
  -- Здесь можно добавить логику, выполняемую при выборе пункта меню
end

--local blueCoalitionMenu = MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Синее меню", null, MyCommand, 'TEST')

--список грузов
set_zone = SET_ZONE:New():FilterStart()

if #hubs > 0 then
  for _, hubName in ipairs(hubs) do

      local zone = ZONE:FindByName(hubName)

      set_zone:ForEachZone(function(zoneother)
        if zone:IsCoordinateInZone(zoneother:GetCoordinate(0)) and zone:GetName() ~= zoneother:GetName() then
          zone.spawnzone = zoneother
        end        
      end)

      if (zone) then
        zone.side = coalition.side.NEUTRAL
        zone.supply = 0
        zone.isHub = true
        zone:Scan({Object.Category.UNIT},{Unit.Category.GROUND_UNIT})
        zone:DrawZone(coalition.side.ALL, SideColor.NEUTRAL, 1, SideColor.NEUTRAL, Alpha, 1, true)
        table.insert(hubsArray, zone)        
        table.insert(allZoneArray, zone)
        zone.textId = zone:GetCoordinate():Translate(3000, 320):TextToAll("Supply: "..zone.supply, coalition.side.ALL, SideColor.BLUE, 1, nil, 0, 20, true)     
      end
  end
end

if #airbases > 0 then
  for _, baseName in ipairs(airbases) do
      local zone = ZONE_AIRBASE:New(baseName, AirbaseRadius)

      set_zone:ForEachZone(function(zoneother)
        if zone:IsCoordinateInZone(zoneother:GetCoordinate(0)) and zone:GetName() ~= zoneother:GetName() then
          zone.spawnzone = zoneother
        end        
      end)      
      
      if (zone) then
        zone.side = coalition.side.NEUTRAL
        zone.supply = 0
        zone.isHub = false
        if (zone.isAirdrome) then
          zone:GetAirbase():SetCoalition(coalition.side.NEUTRAL)
        end
        zone:Scan({Object.Category.UNIT},{Unit.Category.GROUND_UNIT})
        zone:DrawZone(coalition.side.ALL, SideColor.NEUTRAL, 1, SideColor.NEUTRAL, Alpha, 1, true)
        table.insert(airbasesArray, zone)
        table.insert(allZoneArray, zone)
        zone.textId = zone:GetCoordinate():Translate(6000, 320):TextToAll("Supply: "..zone.supply, coalition.side.ALL, SideColor.BLUE, 1, nil, 0, 20, true)     
      end
  end
end

function addPlayerToList(unitOject)
end

function removePlayerFromList(unitObject)
end

--for _, hub in ipairs(hubsArray) do 
--  trigger.action.outText("Добавлен хаб: " .. hub:GetName(), 10)
--end

--for _, airbase in ipairs(airbasesArray) do 
--  trigger.action.outText("Добавлен хаб: " .. airbase:GetName(), 10)
--end


--function UnloadAll(unit)
--  local vec3 = unit:GetPositionVec3()
--  local crateSpawn = SPAWNSTATIC:NewFromStatic("Crate1", country.id.USA)
--  crateSpawn:SpawnFromPointVec2(POINT_VEC2:New( vec3.x, vec3.z + 20 ), 0)
--  trigger.action.outText('Cargo unloaded', 10)
--end

function Upload(unit)
  -- logic for upload
end

--function DespawnUser:OnEventPlayerLeaveUnit(EventData)
--  local name = EventData.IniPlayerName
--  local unitMoose = UNIT:Find(EventData.IniDCSUnit)
--  trigger.action.outText(message, 10)
--end
local firstCheck = true

function Tick()
  --print("TICK")
  for _, airbase in ipairs(airbasesArray) do 
    CheckZone(airbase)    
    if firstCheck == true then
      airbase.supply = 1500
    end
  end
  for _, hub in ipairs(hubsArray) do 
    CheckZone(hub)
    if firstCheck == true then
      hub.supply = 500
    end
  end
  firstCheck = false
end


function AddSupply(self, supply, limit, autoresupply)
  if ((self.isAirdrome == isHub or self.side ~= coalition.side.BLUE or autoresupply ~= nil) and self.side ~=coalition.side.NEUTRAL) then
    if ((self.supply + supply) <= limit) then
      self.supply = self.supply + supply
    else
      self.supply = limit
    end
  end
end

--------------------ПРОВЕРКА ЗОНЫ--------------------------------
function CheckZone(zone)
  zone:Scan({Object.Category.UNIT},{Unit.Category.GROUND_UNIT})

  AddSupply(zone, suplaySurplus, suplyLimit)

  if zone.side == coalition.side.RED and zone.isHub == false then
    local storage = zone:GetAirbase():GetStorage()
    storage:SetLiquid(STORAGE.Liquid.JETFUEL, 200000)
  end

  if (zone.side ~= coalition.side.BLUE and zone:IsAllInZoneOfCoalition(coalition.side.BLUE)) then
    zone.side = coalition.side.BLUE
    if (zone.isAirdrome) then
      zone:GetAirbase():SetCoalition(coalition.side.BLUE)
    end    
    trigger.action.outText("Синие захватили "..zone:GetName(), 30)  
  end

  if (zone.side ~= coalition.side.RED and zone:IsAllInZoneOfCoalition(coalition.side.RED)) then
    if (zone.isAirdrome) then
      zone:GetAirbase():SetCoalition(coalition.side.RED)
    end    
    zone.side = coalition.side.RED

    --Не работает, разобраться
    zone:SearchZone(function(unit) 
      local sch = SCHEDULER:ScheduleOnce(60, function(unit)
        print(unit)
        unit:Destroy()
      end, unit)
      sch:Start()
    end)

    trigger.action.outText("Красные захватили "..zone:GetName(), 30)  
  end

  if ((zone.side ~= coalition.side.NEUTRAL and zone:IsSomeInZoneOfCoalition(coalition.side.RED) and zone:IsSomeInZoneOfCoalition(coalition.side.BLUE)) or (zone.side ~= coalition.side.NEUTRAL and zone:IsNoneInZoneOfCoalition(coalition.side.RED) and zone:IsNoneInZoneOfCoalition(coalition.side.BLUE))) then
    zone.oldSide = zone.side
    if (zone.isAirdrome) then
      zone:GetAirbase():SetCoalition(coalition.side.NEUTRAL)
    end    
    zone.side = coalition.side.NEUTRAL
    trigger.action.outText("Начался бой за "..zone:GetName(), 30)  
  end

  if zone.oldSide ~= zone.side then
    zone.oldSide = zone.side
    zone.supply = 0
  end

  COORDINATE:RemoveMark(zone.textId)
  local range = 6000
  if (zone.isAirdrome ~= true) then
    range = 3000
  end
  local fuel = ""

  if zone.isHub == false then
    local storage = zone:GetAirbase():GetStorage()
    local fuelt = math.floor(storage:GetLiquidAmount(STORAGE.Liquid.JETFUEL) / 1000)
    fuel = "\nFuel: "..fuelt..'t.'
  end

  local color = SideColor.NEUTRAL

  if zone.side == coalition.side.RED then color = SideColor.RED end
  if zone.side == coalition.side.BLUE then color = SideColor.BLUE end

  zone.textId = zone:GetCoordinate():Translate(range/2, 90):TextToAll(zone:GetName().."\nSupply: "..zone.supply..fuel, coalition.side.ALL, SideColor.BLUE, 1, SideColor.WHITE, 0.5, 15, true)     
  zone:UndrawZone()
  zone:DrawZone(coalition.side.ALL, color, 1, color, Alpha, 1, true)

end

SCHEDULER:New(nil, Tick, nil, 0, ZoneInterval)
SCHEDULER:New(nil, AiTick, nil, 0, AiInterval)

trigger.action.outText("Server started", 10)