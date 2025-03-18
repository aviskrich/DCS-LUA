local markerOpsAmmo = MARKEROPS_BASE:New("ammo", { "dia", "lim", "sec"}, true)
local markerOpsUnit = MARKEROPS_BASE:New("unit", { "dia","move"}, true)

local coalitions = { 
    [coalition.side.RED] = "red",
    [coalition.side.BLUE] = "blue"
}


local function _SendUnit(unit, course, distance, speed)                               
    local unitCoord = unit:GetCoordinate()
    local astar = ASTAR:New()
  
    -- Set start and end coordinates
    astar:SetStartCoordinate(unitCoord)
    astar:SetEndCoordinate(unitCoord:Translate(distance*1000, course))

    local boxwidth=distance*2*1000
    local spacex=distance*0.5
    local delta=distance/10
    
    -- Create a grid of nodes. We only want nodes of surface type water.
    astar:CreateGrid({land.SurfaceType.ROAD, land.SurfaceType.LAND}, boxwidth, spacex, delta, delta, false)
    
    -- Valid neighbour nodes need to have line of sight.
    astar:SetValidNeighbourLoS(200)
     -- Calculate path from start to end node.
    local path=astar:GetPath()
    
    if path then
      -- Loop over nodes in found path.
      local uid=unit:GetWaypointCurrent().uid -- ID of current waypoint.
      
      for i,_node in ipairs(path) do
        local node=_node --Core.Astar#ASTAR.Node
          
        -- Add waypoints along detour path to next waypoint.
        local wp=unit:AddWaypoint(node.coordinate, speed, uid)
        wp.astar=true
        
        -- Update id so the next wp is added after this one.
        uid=wp.uid

        -- Debug: smoke and mark path.
        node.coordinate:MarkToAll(string.format("Path node #%d", i))
      end
      
      return #path>0 
    else
      return false
    end
end

function markerOpsAmmo:OnAfterMarkChanged(From, Event, To, Text, Keywords, Coord, idx, coalition)
    
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

    -- Перебираем все юниты и находим те, что в радиусе radius км от маркера
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

function markerOpsUnit:OnAfterMarkChanged(From, Event, To, Text, Keywords, Coord, idx, coalition)
    local units = SET_UNIT:New():FilterCoalitions(coalitions[coalition]):FilterOnce()
    local nearbyUnits = {}
    
    -- Проверяем, есть ли в тексте маркера параметр "dia" (диаметр)
    local diameter = 1000 -- значение по умолчанию (1 км)    
    
    if Keywords and #Keywords > 0 then
        for _, keyword in ipairs(Keywords) do
            -- Ищем значение диаметра с помощью регулярного выражения
            -- Если в тексте маркера есть параметр "dia", то обновляем радиус поиска
            if keyword:lower() == "move" then
                -- Обрабатываем паттерн "unit move 130/4", где 130 - курс, 4 - дальность
                local headingPattern = "move%s+(%d+)/(%d+)"
                local heading, distance = string.match(Text, headingPattern)

                if heading then
                    diameter = 1000 -- переводим км в метры                    
                    if not distance then
                        distance = 10
                    end

                    -- Перебираем все юниты и находим те, что в радиусе radius км от маркера
                    for _, unit in pairs(units:GetSet()) do
                        local unitCoord = unit:GetCoordinate()
                        
                        if unitCoord and Coord:Get2DDistance(unitCoord) <= diameter/2 then                            
                            _SendUnit(unit, heading, distance*1000, 500)
                            -- unit:TaskRouteToVec2(unitCoord:Translate(distance, heading):GetVec2(), 500)
                        end
                    end
                end
            end            
        end
    end

end


