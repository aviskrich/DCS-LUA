--[[
ATC_CoalitionFilter.lua
Модуль фильтрации объектов по коалициям для универсального ATC модуля
Автор: Andrey Iskrich
Дата: Апрель 2025
--]]

local ATC_CoalitionFilter = {}

-- Настройки фильтрации
ATC_CoalitionFilter.settings = {
    enabled = true,
    filterNeutral = false -- Если true, нейтральные объекты не будут обрабатываться
}

-- Проверка принадлежности объекта к коалиции
ATC_CoalitionFilter.isObjectInCoalition = function(object, targetCoalition)
    if not ATC_CoalitionFilter.settings.enabled then
        return true -- Если фильтрация отключена, все объекты проходят
    end
    
    if not object or not object:isExist() then
        return false
    end
    
    -- Если коалиция не указана, пропускаем все объекты
    if not targetCoalition then
        return true
    end
    
    local objectCoalition = object:getCoalition()
    
    -- Проверка на нейтральные объекты
    if objectCoalition == coalition.side.NEUTRAL then
        return not ATC_CoalitionFilter.settings.filterNeutral
    end
    
    -- Проверка соответствия коалиции
    return objectCoalition == targetCoalition
end

-- Получение списка объектов, принадлежащих указанной коалиции
ATC_CoalitionFilter.filterObjectsByCoalition = function(objects, targetCoalition)
    if not objects or type(objects) ~= "table" then
        return {}
    end
    
    local filteredObjects = {}
    
    for _, object in pairs(objects) do
        if ATC_CoalitionFilter.isObjectInCoalition(object, targetCoalition) then
            table.insert(filteredObjects, object)
        end
    end
    
    return filteredObjects
end

-- Получение списка игроков, принадлежащих указанной коалиции
ATC_CoalitionFilter.getPlayersInCoalition = function(targetCoalition)
    local players = {}
    
    -- Получение всех игроков
    local allPlayers = mist.getPlayersTable()
    
    if not allPlayers then
        return players
    end
    
    -- Фильтрация игроков по коалиции
    for _, player in pairs(allPlayers) do
        if player and player.unit and player.unit:isExist() then
            local unit = player.unit
            
            if ATC_CoalitionFilter.isObjectInCoalition(unit, targetCoalition) then
                table.insert(players, player)
            end
        end
    end
    
    return players
end

-- Проверка наличия игроков указанной коалиции в заданном радиусе от точки
ATC_CoalitionFilter.arePlayersInRadius = function(coordinate, radius, targetCoalition)
    if not coordinate then
        return false
    end
    
    -- Получение игроков указанной коалиции
    local players = ATC_CoalitionFilter.getPlayersInCoalition(targetCoalition)
    
    for _, player in pairs(players) do
        if player and player.unit and player.unit:isExist() then
            local unit = player.unit
            local unitCoord = unit:getPoint()
            
            -- Преобразование в MOOSE координаты для расчета расстояния
            local unitMooseCoord = COORDINATE:New(unitCoord.x, unitCoord.y, unitCoord.z)
            
            -- Расчет расстояния
            local distance = coordinate:Get2DDistance(unitMooseCoord)
            
            -- Если игрок в радиусе, возвращаем true
            if distance <= radius then
                return true
            end
        end
    end
    
    return false
end

-- Включение фильтрации по коалициям
ATC_CoalitionFilter.enable = function()
    ATC_CoalitionFilter.settings.enabled = true
end

-- Выключение фильтрации по коалициям
ATC_CoalitionFilter.disable = function()
    ATC_CoalitionFilter.settings.enabled = false
end

-- Включение/выключение фильтрации нейтральных объектов
ATC_CoalitionFilter.setNeutralFiltering = function(enabled)
    ATC_CoalitionFilter.settings.filterNeutral = enabled
end

return ATC_CoalitionFilter
