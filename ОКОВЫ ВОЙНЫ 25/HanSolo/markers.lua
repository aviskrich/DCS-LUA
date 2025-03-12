local markerOps = MARKEROPS_BASE:New("ammo", { "dia", "lim", "sec" }, true)

local coalitions = { 
    [coalition.side.RED] = "red",
    [coalition.side.BLUE] = "blue"
}
function markerOps:OnAfterMarkChanged(From, Event, To, Text, Keywords, Coord, idx, coalition)
    
    -- Найдем ближайший юнит к координатам маркера
    local units = SET_UNIT:New():FilterCoalitions(coalitions[coalition]):FilterOnce()
    local nearbyUnits = {}
    
    -- Проверяем, есть ли в тексте маркера параметр "dia" (диаметр)
    local diameter = 1000 -- значение по умолчанию (1 км)
    local radius = diameter / 2 -- обновляем радиус поиска      
    local seconds = 15

    if Keywords and #Keywords > 0 then
        for _, keyword in ipairs(Keywords) do
            -- Ищем значение диаметра с помощью регулярного выражения
            -- Если в тексте маркера есть параметр "dia", то обновляем радиус поиска
            if keyword:lower() == "dia" then
                local diaPattern = "dia%s+(%d+)"                
                local diaMatch = string.match(Text, diaPattern)
                if diaMatch then
                    diameter = tonumber(diaMatch) * 1000 -- переводим км в метры
                    radius = diameter / 2 -- обновляем радиус поиска
                end
            end
            if keyword:lower() == "sec" then
                local secPattern = "sec%s+(%d+)"                
                local secMatch = string.match(Text, secPattern)
                if secMatch then
                    seconds = math.min(tonumber(secMatch), 60)
                end
            end
        end
    end

    -- Перебираем все юниты и находим те, что в радиусе 1 км от маркера
    for _, unit in pairs(units:GetSet()) do
        local unitCoord = unit:GetCoordinate()
        if unitCoord and Coord:Get2DDistance(unitCoord) <= radius then
            table.insert(nearbyUnits, unit)
        end
    end

    -- Создаем метки на каждом найденном юните с информацией о вооружении
    for _, unit in ipairs(nearbyUnits) do
        local unitCoord = unit:GetCoordinate()
        local unitName = unit:GetName()
        local ammoText = "Вооружение " .. unitName .. ":\n"

        -- Получаем информацию о вооружении
        local ammo = unit:GetAmmo()
        if ammo then
            for _, weapon in ipairs(ammo) do
                local weaponName = weapon.desc.displayName or "Неизвестное оружие"
                local count = weapon.count or 0
                ammoText = ammoText .. weaponName .. ": " .. count .. "\n"
            end
        else
            ammoText = ammoText .. "Нет информации о вооружении"
        end

        -- Создаем новую метку на позиции юнита
        MARKER:New(unitCoord, ammoText):ToCoalition(coalition):Remove(seconds)
    end
end
