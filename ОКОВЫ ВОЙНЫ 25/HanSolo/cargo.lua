-- Last update: 2021.10.10 20:00:00 MSK
--------------------------------------------------------------------------------------------------------------------------
--BASE:TraceClass("SPAWNSTATIC")
--BASE:TraceLevel(3)
--BASE:TraceOnOff( true )


SpawnUser = EVENTHANDLER:New()
SpawnUser:HandleEvent(EVENTS.PlayerEnterAircraft)
DespawnUser = EVENTHANDLER:New()
DespawnUser:HandleEvent(EVENTS.PlayerLeaveUnit)

local set_cargo = SET_STATIC:New():FilterStart()
local zonesCargo = {}
for _, zoneName in ipairs(zoneCargo) do
    local zoneModel = ZONE:FindByName(zoneName)
    table.insert(zonesCargo, zoneModel);
end  

--- Создает груз на координатах, указанного unit-a в object (object.unit)
-- @param object @type table. Таблица, содержащая объект UNIT, представляющий юнит, который запросил груз
-- @return STATIC, объект STATIC, представляющий созданный груз
function CreateSupply(object)
    local unit = object.unit
  
    for _, zone in ipairs(zonesCargo) do 
      if (unit:IsInZone(zone)) then
        --Проверка на принадлежность зоны отключена
        --if zone.side ~= coalition.side.BLUE then MESSAGE:New('Невозможно', 20):ToUnit(unit) return false end
        --if object.type.payload ~= nil and zone.isHub == false then MESSAGE:New('Тут нельзя запросить груз', 20):ToUnit(unit) return false end
        SpawnCargo(unit, object.type, object.type.value, unit:GetCoordinate(), unit:GetHeading())
        break
      end
    end

    -- если добрались сюда, то что-то пошло не так
    MESSAGE:New('Тут нельзя запросить груз', 20):ToUnit(unit)
end

function CalculateMass(unit)
    local mass = 0
    for _,cargo in pairs(unit:GetCargo()) do
        mass = mass + cargo.weight
    end

    unit:SetUnitInternalCargo(mass)
    return unit
end

local _cargoiterator = 0
--- Создает груз на координатах, указанных в параметрах.
-- @param unit @type UNIT. Объект UNIT, представляющий юнит, который запросил груз
-- @param typeObject @type CARGOSTATIC. Объект CARGOSTATIC, представляющий тип груза, который необходимо создать
-- @param weight Число, представляющее вес груза в килограммах
-- @param coordinate @type COORDINATE. Объект COORDINATE, представляющий координаты, где создается груз
-- @param heading Число, представляющее направление, в котором создается груз
-- @param newName Строка, представляющая новое имя для создаваемого груза
-- @return STATIC, объект STATIC, представляющий созданный груз
function SpawnCargo(unit, typeObject, weight, coordinate, heading, newName)
    _cargoiterator = _cargoiterator + 1
    local staticObj = typeObject.spawner:SpawnFromCoordinate( coordinate:Translate(24+math.random(-2,6),heading+math.random(-30, 30)), math.random(360), newName)
    staticObj.weight = weight
    staticObj.type = typeObject
    MESSAGE:New(typeObject.nameText..' весом '..weight..'кг. готов к погрузке', 20):ToUnit(unit)
    return staticObj
end

--- Возвращает ближайший груз к указанной точке.
-- @param pointVec2 Координаты Vec2, представляющие центральную точку поиска
-- @return STATIC, объект STATIC, представляющий ближайший груз к указанной точке
function LoadCargo(unit)
    local closestCargo = GetNearestCargo(unit:GetPointVec2())
  
    if unit:InAir(true) then MESSAGE:New('Погрузка в воздухе недопустима!', 20):ToUnit(unit) return nil end
    if closestCargo == nil then MESSAGE:New('Нечего загружать', 20):ToUnit(unit) end
  
    if (closestCargo)then
      unit:AddCargo(closestCargo)
      MESSAGE:New('Погружено ' ..closestCargo.type.nameText..' '..closestCargo.weight..'кг.', 20):ToUnit(unit)
      closestCargo:Destroy(false)
      set_cargo:Remove(closestCargo:GetName())
      CalculateMass(unit)
    end
end

-- Выполняет поиск груза в указанном радиусе от заданной точки.given point.
-- @param pointVec2 Координаты Vec2, представляющие центральную точку поиска
-- @param radius Число, представляющее радиус поиска в метрах
-- @return Таблица, содержащая объекты груза, найденные в указанном радиусе.cargoInRange
-- @return Объект груза, представляющий ближайший груз к указанной точке.closestCargo
-- @return Число, представляющее расстояние до ближайшего груза.distance
function GetCargoInRange(pointVec2, range)
    if (range == nil) then range = 30 end
    local cargoInRange = {}
    local closestCargo = nil
    local distance = nil
    
    set_cargo:ForEach(function(cargo)
      if (cargo.weight ~= nil) then
        local _distance = pointVec2:DistanceFromPointVec2(cargo:GetPointVec2())
        if distance < range then
            table.insert(cargoInRange, cargo)
            if (distance < distance) then
                closestCargo = cargo
                distance = _distance
            end
        end      
      end
    end)
    
    return cargoInRange, closestCargo, distance
end

-- Выводит сообщение с информацией о всех грузах в указанном радиусе от юнита.
-- @param unit @type UNIT. Объект UNIT, представляющий юнит, для которого выводится сообщение
-- @param range Число, представляющее радиус поиска в метрах (по умолчанию 50 метров)
-- @return Boolean, true если найдены грузы, false если грузов не найдено
function ListCargoInRange(unit, range)
    if (range == nil) then range = 50 end
    local cargos = GetCargoInRange(unit:GetPointVec2(), range)
    
    if #cargos == 0 then
        MESSAGE:New("Груз в радиусе " .. range .. " метров не обнаружен", 20):ToUnit(unit)
        return false
    else
        local message = "Обнаружены следующие грузы в радиусе " .. range .. " метров:\n"
        for i, cargo in ipairs(cargos) do
            local distance = math.floor(unit:GetPointVec2():DistanceFromPointVec2(cargo:GetPointVec2()))
            message = message .. i .. ". " .. cargo.type.nameText .. " (" .. cargo.weight .. " кг) - " .. distance .. " м\n"
        end
        MESSAGE:New(message, 20):ToUnit(unit)
        return true
    end
end

--- Возвращает ближайший аэродром к юниту.
-- @param unit @type UNIT. Объект UNIT, представляющий юнит, для которого ищется ближайший аэродром
-- @return AIRBASE, объект AIRBASE, представляющий ближайший аэродром
function GetNearestAirfield(unit)
    -- Получаем список всех аэродромов    
    local airbases = AIRBASE.GetAllAirbases()

    local nearestAirbase = nil
    local nearestDistance = math.huge

    -- Перебираем все аэродромы
    for _, airbase in pairs(airbases) do
        -- Вычисляем расстояние между юнитом и аэродромом
        local distance = UTILS.VecDist2D(unit:GetVec2(), airbase:GetVec2())

        -- Если это ближайший аэродром, обновляем переменные
        if distance < nearestDistance then
            nearestDistance = distance
            nearestAirbase = airbase
        end
    end

    return nearestAirbase, nearestDistance    
end
  
--- Выгружает груз из unit-a к указанной точке.
-- @param unit @type UNIT. Объект UNIT, представляющий юнит, из которого выгружается груз
-- @return STATIC, объект STATIC, представляющий созданный груз
function UnloadCargo(unit)
    if unit:InAir(true) then MESSAGE:New('Выгрузка в воздухе недопустима!', 20):ToUnit(unit) return nil end

    if (unit:IsCargoEmpty()) then
        MESSAGE:New('Нечего выгружать', 20):ToUnit(unit)
    end

    for _,cargo in pairs(unit:GetCargo()) do
        unit:RemoveCargo(cargo)
        -- set_cargo:Remove(cargo:GetName(), true)
        SpawnCargo(unit, cargo.type, cargo.weight, unit:GetCoordinate(), unit:GetHeading(), false, cargo:GetName())
        cargo:Destroy()
        CalculateMass(unit)
        MESSAGE:New('Выгружено '..cargo.type.nameText..' '..cargo.weight..'кг.', 20):ToUnit(unit)
        break
    end
end

-- RecalculateCoordinates = function(originalA, newA, groupCoords)
--     local dx = newA:GetX() - originalA:GetX()
--     local dy = newA:GetY() - originalA:GetY()  -- horizontal plane uses x/y in POINT_VEC2
--     local newGroupCoords = {}
--     for name, object in pairs(groupCoords) do
--         local staticObject = STATIC:FindByName(object.SpawnTemplatePrefix)
--         newGroupCoords[name] = POINT_VEC2:New(staticObject:GetPointVec2():GetX() + dx, staticObject:GetPointVec2():GetY() + dy)
--     end
--     return newGroupCoords
--   end

local counter = 10
function NameGenerator(name, locCounter)    
    return name .. ' #' .. locCounter    
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

function RotateAndTranslateCoordinates(originalPointVec2, newPointVec2, headingAngle, objects)
    local result = {}
    local radians = math.rad(headingAngle)
    local cosAngle = math.cos(radians)
    local sinAngle = math.sin(radians)
    
    for name, objIdentifier in pairs(objects) do
        local staticObj
        
        staticObj = STATIC:FindByName(objIdentifier.SpawnTemplatePrefix)
        
        if staticObj then
            local objVec2 = staticObj:GetPointVec2()
            
            -- Calculate object's position relative to originalPointVec2
            local relX = objVec2:GetX() - originalPointVec2:GetX()
            local relY = objVec2:GetY() - originalPointVec2:GetY()
            
            -- Rotate relative position
            local rotatedX = relX * cosAngle - relY * sinAngle
            local rotatedY = relX * sinAngle + relY * cosAngle
            
            -- Translate to new reference point
            result[name] = POINT_VEC2:New(
                newPointVec2:GetX() + rotatedX, 
                newPointVec2:GetY() + rotatedY
            )
        end
    end
    
    return result
end

function CalculateCoordsForFARPSTUFF(zone)
    local zoneCoordinate = zone:GetCoordinate()

    local heading = zoneCoordinate:GetHeading()
    local rightHeading = heading + 90
    local result = zoneCoordinate:Translate(20, rightHeading)
    result:SetHeading(heading+45)

    return result
end

local freeADFFrequencies = {
    625, 650, 675, 700, 725, 750, 775, 800, 825, 850, 875, 900, 925, 950, 975, 1000    
}

--- Распаковывает груз, расположенный рядом с unit-ом рядом с unit-ом.
-- @param unit @type UNIT. Объект UNIT, представляющий юнит, который распаковывает груз
-- @return Boolean, true если груз был распакован, false если груз не был распакован
function UnpackCargo(unit)
    local _, closestCargo = GetCargoInRange(unit:GetPointVec2(), 50)
    if (closestCargo == nil) then MESSAGE:New('Рядом нечего распаковать', 20):ToUnit(unit) end

    local closestZone, closestZoneRange = GetNearestAirfield(unit)
    local function _RemoveAndDestroyCargo(cargo)
        cargo:Destroy(false)
        set_cargo:Remove(cargo:GetName(), true)
    end

    if (closestCargo) then
        --------------------------------------------------------------------------------------------------------------------------
        -- SPAWN FARP площадки 
        --------------------------------------------------------------------------------------------------------------------------
        if closestCargo and closestCargo.type.constructionSpawner ~= nil then -- может быть еще проверить на тип, чтобы он был таблицей?
            -- преде чем создать FARP надо посчитать, сколько уже их на карте. Если больше 3, то не создавать
            -- также проверить, что расстояние до ближайшего FARP больше 20 км
            local FARPs = AIRBASE.GetAllAirbases(unit:GetDCSObject():getCoalition(), Airbase.Category.HELIPAD)
            if #FARPs > maxFARPCount[unit:GetDCSObject():getCoalition()] then
                MESSAGE:New('Невозможно создать больше фарпов', 20):ToUnit(unit)
                return false
            elseif closestZoneRange < 20000 then
                MESSAGE:New('Слишком близко к аэродрому или FARP-у', 20):ToUnit(unit)
                return false
            end
            
            -- получить новые координаты
            local newPoints = RotateAndTranslateCoordinates(
                STATIC:FindByName(closestCargo.type.constructionSpawner['spawnFarp'].SpawnTemplatePrefix):GetPointVec2(),
                    closestCargo:GetPointVec2(),
                    unit:GetHeading(),
                    closestCargo.type.constructionSpawner)
            
            -- Задаем частоту маяка нового ФАРПа
            local ADF = freeADFFrequencies[1]
            local ADFName = closestCargo.type.cargoType ..  "ADF " .. tostring(ADF).."KHz"
            table.remove(freeADFFrequencies, 1)                                    
            trigger.action.radioTransmission("l10n/DEFAULT/beacon.ogg", closestCargo:GetVec3(), 0, true, ADF*1000, 250, ADFName)            
            MARKER:New(closestCargo:GetCoordinate(), "ФАРП: ".."ADF " .. tostring(ADF).."KHz"):ToCoalition(unit:GetDCSObject():getCoalition())
            
            -- Создаем статики
            counter = counter + 1
            for name, point in pairs(newPoints) do
                local generatedStatic = closestCargo.type.constructionSpawner[name]:SpawnFromPointVec2(point, unit:GetHeading(), NameGenerator(name, counter))
                if name == 'spawnFarp' then
                    generatedStatic.ADFFreq = ADF
                    generatedStatic.ADFName = ADFName
                end
            end

            MESSAGE:New('Распаковано '..closestCargo.type.nameText, 20):ToUnit(unit)
            _RemoveAndDestroyCargo(closestCargo)
            return true
        end

        if closestCargo.type.parts ~= nil and closestCargo.type.parts > 1 then
            local result = GetParts(closestCargo, 50)
            if (result.count >= closestCargo.type.parts) then
                for _,cargo in pairs(result.parts) do
                    _RemoveAndDestroyCargo(cargo)
                end
            else
                MESSAGE:New('Не хватает частей', 20):ToUnit(unit)
                return false
            end
        end
        ------------------------------------------------------------------------------------------------------------------------
        -- SPAWN юнитов
        ------------------------------------------------------------------------------------------------------------------------
        if closestCargo and closestCargo.type.spawnerUnit and closestZone then
            -- Если этот юнит, который может выставляться только в зоне от базы, то тогда проверяем расстояние
            -- Если расстояние больше, то выводим сообщене и не создаем юнит
            if closestCargo.type.limitedDistanceFromBASE ~= nil then
                if UTILS.VecDist2D(unit:GetVec2(), closestZone:GetVec2()) > closestCargo.type.limitedDistanceFromBASE then
                    MESSAGE:New('Слишком далеко от базы', 20):ToUnit(unit)
                    return false
                end
            end
            
            -- Для машинок специальный код спавна, их нужно поставить справа от ближайшего ФАРПа
            local spawnedUnit = nil
            if closestCargo.type.cargoType == 'FARPSTUFF' then
                local newPoint = CalculateCoordsForFARPSTUFF(closestZone)
                spawnedUnit = closestCargo.type.spawnerUnit:SpawnFromCoordinate(newPoint)
            else
                spawnedUnit = closestCargo.type.spawnerUnit:SpawnFromVec2(closestCargo:GetCoordinate():GetVec2())
            end

            -- проверим на лимиты юнитов
            if spawnedUnit == nil then
                MESSAGE:New('Не удалось создать юнит. Возможно достигнут лимит юнитов этого типа', 20):ToUnit(unit)
                return false
            end

            -- если у груза есть время жизни, то установить таймер на удаление юнита, который появился
            if closestCargo.type.unitLifetime ~= nil then
                TIMER:New(spawnedUnit.Destroy, spawnedUnit, true):Start(closestCargo.type.unitLifetime)                
            end
        
            -- if closestCargo.type.static == nil then
            --    GroudRouteToZone(spawnedUnit, SelectCosesestZoneRed(spawnedUnit))
            -- end
            MESSAGE:New('Распаковано '..closestCargo.type.nameText, 20):ToUnit(unit)
            _RemoveAndDestroyCargo(closestCargo)
            return true
        end

        ------------------------------------------------------------------------------------------------------------------------
        --- SPAWN запасов
        ------------------------------------------------------------------------------------------------------------------------
        if closestZone and closestCargo and closestZoneRange <= 150 then
            if closestCargo.type.cargoType == "liquid" then
                local storage=closestZone:GetStorage()
                for _,cargo in pairs(closestCargo.type.content) do
                    storage:AddLiquid(cargo.type, cargo.count)
                end
                _RemoveAndDestroyCargo(closestCargo)
                MESSAGE:New('Топливо добавлено на фарп', 20):ToUnit(unit)
                return true
            end

            if closestCargo and closestCargo.type.cargoType == "ammo" then
                local storage=closestZone:GetStorage()
                for _,cargo in pairs(closestCargo.type.content) do
                    storage:AddItem(cargo.type, cargo.count)
                end
                _RemoveAndDestroyCargo(closestCargo)
                MESSAGE:New('Вооружение добавлено на фарп', 20):ToUnit(unit)
                return true
            end
        end
        --for _, zone in ipairs(allZoneArray) do 
        --if (unit:IsInZone(zone)) then
        --    if closestCargo.type.payload ~= nil then
        --    local storage = zone:GetAirbase():GetStorage()
        --    storage:AddLiquid(closestCargo.type.payload.type, closestCargo.type.payload.amount)
        --    closestCargo:Destroy()
        --    set_cargo:Remove(closestCargo:GetName(), true)
        --    MESSAGE:New('Снабжение базы распаковано', 20):ToUnit(unit)     
        --    success = true
        --    break
        --    else
        --    local cost = closestCargo.weight
        --    if (closestCargo.type.supply == nil) then cost = 0 end
        --    if (zone.supply + cost < suplyLimit and closestCargo.type.spawnerUnit == nil) then
        --        zone.supply = zone.supply + cost
        --        closestCargo:Destroy()
        --        set_cargo:Remove(closestCargo:GetName(), true)
        --       MESSAGE:New('Распаковано '..closestCargo.weight..'кг. припасов', 20):ToUnit(unit)          
        --    else
        --        MESSAGE:New('Невозможно распаковать припасы, склад полон', 20):ToUnit(unit)
        --    end
        --    success = true
        --    break
        --    end
        --end
        --end
    end

    if (success ~= true) then MESSAGE:New('Тут невозможно распаковать', 20):ToUnit(unit) end
end

function RestartMission()
    MESSAGE:New("Миссия будет перезапущена через 10 секунд.", 10):ToAll()

    -- Задержка перед перезапуском миссии
    TIMER:New(function()
        trigger.action.setUserFlag("9001", true)
    end):Start(10)
end

function GetFARPList(unit)
    -- Получаем коалицию юнита
    local coalition = unit:GetCoalition()
    
    -- Получаем все ФАРПы для данной коалиции
    local FARPs = AIRBASE.GetAllAirbases(coalition, Airbase.Category.HELIPAD)
    
    if #FARPs == 0 then
        MESSAGE:New("ФАРПы не обнаружены", 20):ToUnit(unit)
        return
    end
    
    local str = "Список ФАРПов:\n"
    
    -- Перебираем все ФАРПы
    for _, farp in pairs(FARPs) do
        -- Ищем соответствующий статический объект
        local static = STATIC:FindByName(farp:GetName())
        
        if static then
            -- Если у объекта есть частота ADF, добавляем информацию в сообщение
            if static.ADFFreq then
                str = str .. string.format("ФАРП: %s (ADF %d KHz)\n", farp:GetName(), static.ADFFreq)
            else
                str = str .. string.format("ФАРП: %s (без маяка)\n", farp:GetName())
            end
        end
    end
    
    -- Отправляем сообщение игроку
    MESSAGE:New(str, 20):ToUnit(unit)
end 

--- Обработчик события входа игрока в юнит.
-- @param EventData @type table. Таблица, содержащая информацию о событии
function SpawnUser:OnEventPlayerEnterAircraft(EventData)
    local name = EventData.IniPlayerName
    local unitMoose = UNIT:FindByName(EventData.IniDCSUnitName)
    local natoName = unitMoose:GetNatoReportingName()   
    local client = CLIENT:FindByPlayerName(EventData.IniPlayerName)

    unitMoose:ClearCargo()
    if (unitMoose:IsHelicopter() and
        (natoName == "Hip" or natoName == "Huey" or natoName == "Chinook")) then
        unitMoose:ClearCargo()
        
        -- Оставил для теста разворачивания базы
        -- SpawnCargo(CARGOSTATIC.RED.CRATEFARP, 100, unitMoose:GetCoordinate(), unitMoose:GetHeading())

        -- По умолчанию - набор для красных
        local cargoStaticMenu = CARGOSTATIC.RED
        local cargoUnitsMenu = CARGOUNITS.RED

        -- 1 красные
        -- 2 синие
        if unitMoose:GetCoalition() == 2 then
            cargoStaticMenu = CARGOSTATIC.BLUE
            cargoUnitsMenu = CARGOUNITS.BLUE
        end

        local supplyMenu = MENU_GROUP:New(unitMoose:GetGroup(), "ФАРП и Снабжение")
        for _,cargo in pairs(cargoStaticMenu) do
            MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), cargo.nameText, supplyMenu, CreateSupply, {unit = unitMoose, value = cargo.value, type = cargo})
        end

        local supplyMenuUnits = MENU_GROUP:New(unitMoose:GetGroup(), "Пехота и Техника")
        for _,cargo in pairs(cargoUnitsMenu) do
            MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), cargo.nameText, supplyMenuUnits, CreateSupply, {unit = unitMoose, value = cargo.value, type = cargo})
        end

        local cargoMenu = MENU_GROUP:New(unitMoose:GetGroup(), "Действие c грузом")
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Погрузить груз", cargoMenu, LoadCargo, unitMoose)
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Выгрузить груз", cargoMenu, UnloadCargo, unitMoose)
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Распаковать груз", cargoMenu, UnpackCargo, unitMoose)
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Статус загрузки", cargoMenu, CheckCargo, unitMoose)   
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Перечислить груз рядом", cargoMenu, ListCargoInRange, unitMoose, 100)
        MENU_GROUP_COMMAND:New(unitMoose:GetGroup(), "Список ФАРП", cargoMenu, GetFARPList, unitMoose)
    end
end

_SETTINGS:SetPlayerMenuOff()
local missionMenu = MENU_MISSION:New("Управление миссией")
        MENU_MISSION_COMMAND:New("Перезапустить миссию", missionMenu, RestartMission)