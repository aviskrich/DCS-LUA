SpawnUser = EVENTHANDLER:New()
SpawnUser:HandleEvent(EVENTS.PlayerEnterAircraft)
DespawnUser = EVENTHANDLER:New()
DespawnUser:HandleEvent(EVENTS.PlayerLeaveUnit)

cargos = {}

function UnloadAll(unit)
end

--список грузов
set_cargo = SET_STATIC:New():FilterStart()

_cargoiterator = 0
function SpawnCargo(typeObject, weight, coordinate, heading, newName)
  _cargoiterator = _cargoiterator + 1
  local staticObj = typeObject.spawner:SpawnFromCoordinate( coordinate:Translate(24+math.random(-2,6),heading+math.random(-30, 30)), math.random(360), newName)
  staticObj.weight = weight
  staticObj.type = typeObject
  return staticObj
end

--Найти все подобные коробки в радиусе
function GetParts(fromCargo, range, num)
  local count = 0
  local distance = nil
  if range == nil then range = 50 end
  local parts = {}
  set_cargo:ForEach(function(cargo)
    if (cargo.weight ~= nil) then
      local tmpdistance = fromCargo:GetCoordinate():DistanceFromPointVec2(cargo:GetPointVec2())
      if (distance == nil or tmpdistance < distance) and tmpdistance < range and fromCargo.type.name == cargo.type.name then
        if fromCargo.type.parts > count then
          table.insert(parts, cargo)
          count = count + 1
        end
      end
    end
  end)
  return {count = count, parts = parts}
end

--найти ближайшую коробку
function GetNearestCargo(pointVec2, range)
  if (range == nil) then range = 30 end
  local closestCargo = nil
  local distance = nil
  set_cargo:ForEach(function(cargo)
    if (cargo.weight ~= nil) then
      local tmpdistance = pointVec2:DistanceFromPointVec2(cargo:GetPointVec2())
      if (distance == nil or tmpdistance < distance) and tmpdistance < range then
        closestCargo = cargo
      end      
    end
  end)
  return closestCargo
end

function CalculateMass(unit)
  local mass = 0
  for _,cargo in pairs(unit:GetCargo()) do
    mass = mass + cargo.weight
  end

  unit:SetUnitInternalCargo(mass)
  return unit
end

function LoadCargo(unit)
  local closestCargo = GetNearestCargo(unit:GetPointVec2())

  if unit:InAir(true) then MESSAGE:New('Погрузка в воздухе недопустима!', 20):ToUnit(unit) return nil end
  if closestCargo == nil then MESSAGE:New('Нечего загружать', 20):ToUnit(unit) end

  if (closestCargo)then
    unit:AddCargo(closestCargo)
    MESSAGE:New('Погружено '..closestCargo.weight..'кг.', 20):ToUnit(unit)
    closestCargo:Destroy(false)
    set_cargo:Remove(closestCargo:GetName())
    CalculateMass(unit)
  end
end

function UnloadCargo(unit)
  if unit:InAir(true) then MESSAGE:New('Выгрузка в воздухе недопустима!', 20):ToUnit(unit) return nil end

  if (unit:IsCargoEmpty()) then
    MESSAGE:New('Нечего выгружать', 20):ToUnit(unit)
  end

  for _,cargo in pairs(unit:GetCargo()) do
    unit:RemoveCargo(cargo)
    set_cargo:Remove(cargo:GetName(), true)
    SpawnCargo(cargo.type, cargo.weight, unit:GetCoordinate(), unit:GetHeading(), false, cargo:GetName())
    cargo:Destroy()
    CalculateMass(unit)
    MESSAGE:New('Выгружено '..cargo.weight..'кг.', 20):ToUnit(unit)
    break
  end
end

function UnpackCargo(unit)
  local closestCargo = GetNearestCargo(unit:GetPointVec2())
  if (closestCargo == nil) then MESSAGE:New('Рядом нечего распаковать', 20):ToUnit(unit) end
  local success = false

  if (closestCargo)then
    if closestCargo.type.parts ~= nil and closestCargo.type.parts > 1 then
      local result = GetParts(closestCargo, 50)
      if (result.count >= closestCargo.type.parts) then
        for _,cargo in pairs(result.parts) do
          cargo:Destroy()
          set_cargo:Remove(cargo:GetName(), true) 
        end
      else
        MESSAGE:New('Не хватает частей', 20):ToUnit(unit)
        return false
      end
    end

    if closestCargo.type.spawnerUnit ~= nil then
      local spawnedUnit = closestCargo.type.spawnerUnit:SpawnFromVec2(closestCargo:GetCoordinate():GetVec2())
      if closestCargo.type.static == nil then
        GroudRouteToZone(spawnedUnit, SelectCosesestZoneRed(spawnedUnit))
      end
      MESSAGE:New('Распаковано', 20):ToUnit(unit)
      closestCargo:Destroy(false)
      set_cargo:Remove(closestCargo:GetName(), true)
      success = true
      return true
    end

    for _, zone in ipairs(allZoneArray) do 
      if (unit:IsInZone(zone)) then
        if closestCargo.type.payload ~= nil then
          local storage = zone:GetAirbase():GetStorage()
          storage:AddLiquid(closestCargo.type.payload.type, closestCargo.type.payload.amount)
          closestCargo:Destroy()
          set_cargo:Remove(closestCargo:GetName(), true)
          MESSAGE:New('Снабжение базы распаковано', 20):ToUnit(unit)     
          success = true
          break
        else
          local cost = closestCargo.weight
          if (closestCargo.type.supply == nil) then cost = 0 end
          if (zone.supply + cost < suplyLimit and closestCargo.type.spawnerUnit == nil) then
            zone.supply = zone.supply + cost
            closestCargo:Destroy()
            set_cargo:Remove(closestCargo:GetName(), true)
            MESSAGE:New('Распаковано '..closestCargo.weight..'кг. припасов', 20):ToUnit(unit)          
          else
            MESSAGE:New('Невозможно распаковать припасы, склад полон', 20):ToUnit(unit)
          end
          success = true
          break
        end
      end
    end
  end

  if (success ~= true) then MESSAGE:New('Тут невозможно распаковать', 20):ToUnit(unit) end
end

function CreateSupply(object)
  local unit = object.unit
  local success = false

  for _, zone in ipairs(allZoneArray) do 
    if (unit:IsInZone(zone)) then
      if zone.side ~= coalition.side.BLUE then MESSAGE:New('Невозможно', 20):ToUnit(unit) return false end
      if object.type.payload ~= nil and zone.isHub == false then MESSAGE:New('Тут нельзя запросить груз', 20):ToUnit(unit) return false end
      if zone.supply >= object.type.cost then
        zone.supply = zone.supply - object.type.cost
        
        SpawnCargo(object.type, object.type.value, unit:GetCoordinate(), unit:GetHeading())
      else
        MESSAGE:New('Не хватает припасов', 20):ToUnit(unit)
      end
        success = true
      break
    end
  end

  if (success ~= true) then MESSAGE:New('Тут нельзя запросить груз', 20):ToUnit(unit) end
end

function CheckCargo(unit)
  local mass = 0
  for _,cargo in pairs(unit:GetCargo()) do
    if cargo.type.nameText ~= nil then
      MESSAGE:New(cargo.type.nameText.." - "..cargo.weight..'кг.', 20):ToUnit(unit)
    end
    mass = mass + cargo.weight
  end

  MESSAGE:New('Общая масса груза: '..mass..'кг.', 20):ToUnit(unit)
  return unit  
end

function DespawnUser:OnEventPlayerLeaveUnit(EventData)
  local unitMoose = UNIT:Find(EventData.IniDCSUnit)
  for _, zone in ipairs(airbasesArray) do 
    if (unitMoose:IsInZone(zone)) then
      unitZone = zone
      break
    end
  end  

  if (unitZone ~= nil and unitZone.side == coalition.side.BLUE) then
    local storage = unitZone:GetAirbase():GetStorage()
    storage:AddLiquid(STORAGE.Liquid.JETFUEL, unitMoose:GetTemplateFuel() / 2)
  end
end

function SpawnUser:OnEventPlayerEnterAircraft(EventData)
    local name = EventData.IniPlayerName
  
    local unitMoose = UNIT:Find(EventData.IniDCSUnit)

    local natoName = unitMoose:GetNatoReportingName()
    local unitZone = nil
    for _, zone in ipairs(airbasesArray) do 
      if (unitMoose:IsInZone(zone)) then
        unitZone = zone
        break
      end
    end
    -- проверка на суплай(добавить)
    if unitZone ~= nil and unitZone.side == coalition.side.BLUE then
      local storage = unitZone:GetAirbase():GetStorage()
      
      if tonumber(storage:GetLiquidAmount(STORAGE.Liquid.JETFUEL)) >= tonumber(unitMoose:GetTemplateFuel()) then
        storage:SetLiquid(STORAGE.Liquid.JETFUEL, storage:GetLiquidAmount(STORAGE.Liquid.JETFUEL) - tonumber(unitMoose:GetTemplateFuel()))
      else
        MESSAGE:New('Недостаточно топлива в зоне', 20):ToUnit(unit)
        --DESPAWN
        local client = CLIENT:FindByPlayerName(EventData.IniPlayerName)

        MasterObject = SCHEDULER:New( client )
        MasterObject:Schedule( client, function(client) 
          net.force_player_slot(tonumber(NET:GetPlayerIDFromClient(client)), 0, '' )
          --NET:ReturnToSpectators(client)
        end, {}, 1 )
      end
    else
      --DESPAWN
      local client = CLIENT:FindByPlayerName(EventData.IniPlayerName)

      MasterObject = SCHEDULER:New( client )
      MasterObject:Schedule( client, function(client) 
        net.force_player_slot(tonumber(NET:GetPlayerIDFromClient(client)), 0, '' )
        --NET:ReturnToSpectators(client)
      end, {}, 1 )

      --net.force_player_slot(tonumber(NET:GetPlayerIDFromClient(client)), 0, client.slot )

      --NET:ForceSlot(client, 0, client.slot)

      --client:Destroy( true )
      --unitMoose:Destroy(false, 0)
      return false
    end

    local message = string.format("%s занял слот %s.", name, unitMoose.GroupName)
  
    if (unitMoose:IsHelicopter() and natoName ~= "Apache" and natoName ~= "Mainstay") then
        unitMoose:ClearCargo()

        local supplyMenu = MENU_GROUP:New(unitMoose:GetGroup(), "Припасы")
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Запросить "..CARGOSTATIC.SUPPLY.CRATE.nameText, supplyMenu, CreateSupply, {unit = unitMoose, type = CARGOSTATIC.SUPPLY.CRATE})
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Запросить "..CARGOSTATIC.SUPPLY.CRATE300.nameText, supplyMenu, CreateSupply, {unit = unitMoose, type = CARGOSTATIC.SUPPLY.CRATE300})
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Запросить "..CARGOSTATIC.SUPPLY.CRATE1000.nameText, supplyMenu, CreateSupply, {unit = unitMoose, type = CARGOSTATIC.SUPPLY.CRATE1000})
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Запросить "..CARGOSTATIC.SUPPLY.CRATEJETFUEL.nameText, supplyMenu, CreateSupply, {unit = unitMoose, type = CARGOSTATIC.SUPPLY.CRATEJETFUEL})
        local landingMenu = MENU_GROUP:New(unitMoose:GetGroup(), "Техника")
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Запросить "..CARGOSTATIC.LANDING.INFANTRYCRATE.nameText.." ("..CARGOSTATIC.LANDING.INFANTRYCRATE.cost.." "..CARGOSTATIC.LANDING.INFANTRYCRATE.value.."кг.)", landingMenu, CreateSupply, {unit = unitMoose, value = CARGOSTATIC.LANDING.INFANTRYCRATE.value, type = CARGOSTATIC.LANDING.INFANTRYCRATE})
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Запросить "..CARGOSTATIC.LANDING.HMMWVCRATE.nameText.." ("..CARGOSTATIC.LANDING.HMMWVCRATE.cost.." "..CARGOSTATIC.LANDING.HMMWVCRATE.value.."кг.)", landingMenu, CreateSupply, {unit = unitMoose, value = CARGOSTATIC.LANDING.INFANTRYCRATE.value, type = CARGOSTATIC.LANDING.HMMWVCRATE})
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Запросить "..CARGOSTATIC.LANDING.LANDINGMAXXPROCRATE.nameText.." ("..CARGOSTATIC.LANDING.LANDINGMAXXPROCRATE.cost.." "..CARGOSTATIC.LANDING.LANDINGMAXXPROCRATE.value.."кг.)", landingMenu, CreateSupply, {unit = unitMoose, value = CARGOSTATIC.LANDING.LANDINGMAXXPROCRATE.value, type = CARGOSTATIC.LANDING.LANDINGMAXXPROCRATE})
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Запросить "..CARGOSTATIC.LANDING.LANDINGABRAMS.nameText.." ("..CARGOSTATIC.LANDING.LANDINGABRAMS.cost.." "..CARGOSTATIC.LANDING.LANDINGABRAMS.value.."кг.)", landingMenu, CreateSupply, {unit = unitMoose, type = CARGOSTATIC.LANDING.LANDINGABRAMS})
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Запросить "..CARGOSTATIC.LANDING.BRADLEYCRATE.nameText.." ("..CARGOSTATIC.LANDING.BRADLEYCRATE.cost.." "..CARGOSTATIC.LANDING.BRADLEYCRATE.value.."кг.)", landingMenu, CreateSupply, {unit = unitMoose, type = CARGOSTATIC.LANDING.BRADLEYCRATE})
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Запросить "..CARGOSTATIC.LANDING.LINEBRACKERCRATE.nameText.." ("..CARGOSTATIC.LANDING.LINEBRACKERCRATE.cost.." "..CARGOSTATIC.LANDING.LINEBRACKERCRATE.value.."кг.)", landingMenu, CreateSupply, {unit = unitMoose, type = CARGOSTATIC.LANDING.LINEBRACKERCRATE})
        local cargoMenu = MENU_GROUP:New(unitMoose:GetGroup(), "Груз")
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Погрузить груз", cargoMenu, LoadCargo, unitMoose)
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Выгрузить груз", cargoMenu, UnloadCargo, unitMoose)
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Распаковать груз", cargoMenu, UnpackCargo, unitMoose)
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Статус загрузки", cargoMenu, CheckCargo, unitMoose)
        local buildMenu = MENU_GROUP:New(unitMoose:GetGroup(), "Стройматериалы")
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Части форпоста 500кг. 1/3", buildMenu, CreateSupply, {unit = unitMoose, type = CARGOSTATIC.SUPPLY.CRATEBUILDER})

    end
    --local unitZone = unitMoose:IsInZone(Zone)
  
    trigger.action.outText(message, 10)
end

