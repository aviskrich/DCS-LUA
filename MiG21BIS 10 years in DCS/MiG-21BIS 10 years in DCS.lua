-- Создаем SET_GROUP для групп, начинающихся с 'PlayerGroup'
local PlayerGroups = SET_GROUP:New():FilterPrefixes('PlayerGroup'):FilterStart()

-- Предположим, что у нас есть зоны, обозначающие ППМ (Waypoints)
local waypoints = {'Waypoint1', 'Waypoint2', 'Waypoint3'} -- названия зон в миссии

-- Функция расчета расстояние от точки P до прямой AB в 3D
local function GetDistancePointToLine3D_MOOSE(A, B, P)
    -- Создаем POINT_VEC3 для точек A, B и P
    local pointA = POINT_VEC3:New(A.x, A.y, A.z)
    local pointB = POINT_VEC3:New(B.x, B.y, B.z)
    local pointP = POINT_VEC3:New(P.x, P.y, P.z)
    
    -- Векторы AB и AP
    local vectorAB = pointB:GetVec3Subtract(pointA)
    local vectorAP = pointP:GetVec3Subtract(pointA)
    
    -- Векторное произведение AB x AP
    local crossProduct = {
        x = vectorAB.y * vectorAP.z - vectorAB.z * vectorAP.y,
        y = vectorAB.z * vectorAP.x - vectorAB.x * vectorAP.z,
        z = vectorAB.x * vectorAP.y - vectorAB.y * vectorAP.x
    }
    
    -- Модуль векторного произведения (длина вектора crossProduct)
    local crossMag = math.sqrt(crossProduct.x^2 + crossProduct.y^2 + crossProduct.z^2)
    
    -- Модуль вектора AB
    local ABMag = pointA:Get3DDistance(pointB)
    
    -- Расстояние от точки P до прямой AB
    local distance = crossMag / ABMag
    
    return distance
end

-- Функция для отслеживания пролёта через зону
local function MonitorWaypoints()
    for _, groupName in ipairs(PlayerGroups:GetSetNames()) do
        local group = GROUP:FindByName(groupName)
        if group and group:IsAlive() then
            for _, wpName in ipairs(waypoints) do
                local zone = ZONE:FindByName(wpName)
                if zone and group:IsCompletelyInZone(zone) then
                    -- Отправляем сообщение игрокам в группе
                    group:MessageToGroup("Вы пролетели точку маршрута: " .. wpName, 15)
                    -- Можно добавить логирование или другие действия здесь
                end
            end
        end
    end
end

-- Запускаем функцию каждые 5 секунд
SCHEDULER:New(nil, MonitorWaypoints, {}, 0, 5)


-- Создаем SET_GROUP для групп-целей и групп игроков
local PlayerGroups = SET_GROUP:New():FilterPrefixes('PlayerGroup'):FilterStart()
local TargetGroups = SET_GROUP:New():FilterPrefixes('TargetGroup'):FilterStart()

-- Функция обработки событий 'Hit'
local function OnEventHit(EventData)
    if EventData.IniGroupName and EventData.TgtGroupName then
        local initiatorGroup = GROUP:FindByName(EventData.IniGroupName)
        local targetGroup = GROUP:FindByName(EventData.TgtGroupName)

        if PlayerGroups:IsIncludeGroup(initiatorGroup) and TargetGroups:IsIncludeGroup(targetGroup) then
            -- Отправляем сообщение всем игрокам
            MESSAGE:New("Группа " .. EventData.IniGroupName .. " повредила технику из группы " .. EventData.TgtGroupName, 15):ToAll()
        end
    end
end

-- Подписываемся на событие 'Hit'
world.addEventHandler({
    onEvent = function(self, EventData)
        if EventData.id == world.event.S_EVENT_HIT then
            OnEventHit(EventData)
        end
    end
})

-- Создаем список запрещенных зон
local RedZones = {
    ZONE:New('RED_ZONE1'),
    ZONE:New('RED_ZONE2'),
    -- Добавьте другие зоны по необходимости
}

-- Функция для проверки входа в запрещенные зоны
local function MonitorRedZones()
    PlayerGroups:ForEachGroupAlive(function(group)
        for _, zone in ipairs(RedZones) do
            if group:IsPartlyOrCompletelyInZone(zone) then
                -- Отправляем сообщение группе
                group:MessageToGroup("Вы вошли в запретную зону: " .. zone:GetName(), 15)
                -- Можно добавить другие действия (например, триггер предупреждения или штрафа)
            end
        end
    end)
end

-- Запускаем функцию каждые 5 секунд
SCHEDULER:New(nil, MonitorRedZones, {}, 0, 5)

-- Создаем таблицу разрешенных зон с минимальной высотой
local GreenZones = {
    {zone = ZONE:New('GREEN_ZONE1'), floor = 500}, -- высота в метрах
    {zone = ZONE:New('GREEN_ZONE2'), floor = 1000},
    -- Добавьте другие зоны по необходимости
}

-- Функция для мониторинга выходов из зон и высоты
local function MonitorGreenZones()
    PlayerGroups:ForEachGroupAlive(function(group)
        local isInZone = false

        for _, data in ipairs(GreenZones) do
            local zone = data.zone
            local floor = data.floor
            if group:IsPartlyOrCompletelyInZone(zone) then
                isInZone = true
                local altitude = group:GetAltitude(true) -- Получаем высоту над уровнем земли
                if altitude < floor then
                    group:MessageToGroup("Вы опустились ниже минимальной высоты в зоне " .. zone:GetName() .. ": " .. floor .. " м", 15)
                end
            end
        end

        if not isInZone then
            group:MessageToGroup("Вы вышли из разрешённой зоны!", 15)
        end
    end)
end

-- Запускаем функцию каждые 5 секунд
SCHEDULER:New(nil, MonitorGreenZones, {}, 0, 5)