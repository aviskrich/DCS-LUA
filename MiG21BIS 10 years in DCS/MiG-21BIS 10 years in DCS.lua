-- Создаем SET_GROUP для групп, начинающихся с 'PlayerGroup'
local playerGroups = SET_GROUP:New():FilterPrefixes('Wing'):FilterStart()

-- Предположим, что у нас есть зоны, обозначающие ППМ (Waypoints)
-- local waypoints = {'Waypoint1', 'Waypoint2', 'Waypoint3'} -- названия зон в миссии

-- Функция для вычисления отклонения от прямой и отклонения по высоте
function computeDeviation(A, B, GrPos)
    -- Извлекаем координаты точек
    local x0, z0 = GrPos.x, GrPos.z  -- Используем x и z для горизонтальной плоскости
    local x1, z1 = A.x, A.y          -- POINT_VEC2 имеет свойства x и y (y здесь соответствует z в DCS)
    local x2, z2 = B.x, B.y

    -- Вычисляем числитель и знаменатель по формуле расстояния от точки до прямой
    local numerator = math.abs((z2 - z1)*(x1 - x0) - (x2 - x1)*(z1 - z0))
    local denominator = math.sqrt((x2 - x1)^2 + (z2 - z1)^2)

    -- Вычисляем горизонтальное отклонение (расстояние до линии курса)
    local lateralDeviation = numerator / denominator

    -- Вычисляем вертикальное отклонение от 2000 метров
    local altitudeDeviation = math.abs(GrPos.y - 2000)  -- GrPos.y — это высота в метрах

    -- Возвращаем таблицу с двумя элементами
    return { lateralDeviation, altitudeDeviation }
end


-- -- Функция для отслеживания пролёта через зону
-- local function MonitorWaypoints()
--     for _, groupName in ipairs(playerGroups:GetSetNames()) do
--         local group = GROUP:FindByName(groupName)
--         if group and group:IsAlive() then
--             for _, wpName in ipairs(waypoints) do
--                 local zone = ZONE:FindByName(wpName)
--                 if zone and group:IsCompletelyInZone(zone) then
--                     -- Отправляем сообщение игрокам в группе
--                     group:MessageToGroup("Вы пролетели точку маршрута: " .. wpName, 15)
--                     -- Можно добавить логирование или другие действия здесь
--                 end
--             end
--         end
--     end
-- end

-- -- Запускаем функцию каждые 5 секунд
-- SCHEDULER:New(nil, MonitorWaypoints, {}, 0, 5)


-- -- Создаем SET_GROUP для групп-целей и групп игроков
-- local PlayerGroups = SET_GROUP:New():FilterPrefixes('PlayerGroup'):FilterStart()
-- local TargetGroups = SET_GROUP:New():FilterPrefixes('TargetGroup'):FilterStart()

-- -- Функция обработки событий 'Hit'
-- local function OnEventHit(EventData)
--     if EventData.IniGroupName and EventData.TgtGroupName then
--         local initiatorGroup = GROUP:FindByName(EventData.IniGroupName)
--         local targetGroup = GROUP:FindByName(EventData.TgtGroupName)

--         if PlayerGroups:IsIncludeGroup(initiatorGroup) and TargetGroups:IsIncludeGroup(targetGroup) then
--             -- Отправляем сообщение всем игрокам
--             MESSAGE:New("Группа " .. EventData.IniGroupName .. " повредила технику из группы " .. EventData.TgtGroupName, 15):ToAll()
--         end
--     end
-- end

-- -- Подписываемся на событие 'Hit'
-- world.addEventHandler({
--     onEvent = function(self, EventData)
--         if EventData.id == world.event.S_EVENT_HIT then
--             OnEventHit(EventData)
--         end
--     end
-- })

-- Cоздаем зону оценки отклонения
local deviationZone = ZONE:New('Zone 3 (Control)')
local playerDeviations = {}

-- Функция мониторинга зоны deviationZone и расчета отклонения для каждого зашедшего самолета из группы playerGroups
SCHEDULER:New(nil, function ()
        -- @type COORDINATE
        local legStartCoord = ZONE:New('DevCourse Entry Point'):GetCoordinate(2000)
        local legEndCoord = ZONE:New('DevCourse Exit Point'):GetCoordinate(2000)
        
        playerGroups:ForEachGroupAlive(function(group)
            if group:IsCompletelyInZone(deviationZone) and playerDeviations[group:GetName()] == nil then
                local deviation = computeDeviation(legStartCoord:GetVec2(), legEndCoord:GetVec2(), group:GetPositionVec3())
                playerDeviations[group:GetName()] = deviation
                MESSAGE:New(string.format("Отклонение группы %s: %d в метрах по горионтали и %d в метрах по высоте", group:GetName(), deviation[1], deviation[2]), 15):ToAll()
            end
        end)
    end, {}, 10, 3)

-- -- Создаем список запрещенных зон
-- local RedZones = {
--     ZONE:New('RED_ZONE1'),
--     ZONE:New('RED_ZONE2'),
--     -- Добавьте другие зоны по необходимости
-- }

-- -- Функция для проверки входа в запрещенные зоны
-- local function MonitorRedZones()
--     PlayerGroups:ForEachGroupAlive(function(group)
--         for _, zone in ipairs(RedZones) do
--             if group:IsPartlyOrCompletelyInZone(zone) then
--                 -- Отправляем сообщение группе
--                 group:MessageToGroup("Вы вошли в запретную зону: " .. zone:GetName(), 15)
--                 -- Можно добавить другие действия (например, триггер предупреждения или штрафа)
--             end
--         end
--     end)
-- end

-- -- Запускаем функцию каждые 5 секунд
-- SCHEDULER:New(nil, MonitorRedZones, {}, 0, 5)

-- -- Создаем таблицу разрешенных зон с минимальной высотой
-- local GreenZones = {
--     {zone = ZONE:New('GREEN_ZONE1'), floor = 500}, -- высота в метрах
--     {zone = ZONE:New('GREEN_ZONE2'), floor = 1000},
--     -- Добавьте другие зоны по необходимости
-- }

-- -- Функция для мониторинга выходов из зон и высоты
-- local function MonitorGreenZones()
--     PlayerGroups:ForEachGroupAlive(function(group)
--         local isInZone = false

--         for _, data in ipairs(GreenZones) do
--             local zone = data.zone
--             local floor = data.floor
--             if group:IsPartlyOrCompletelyInZone(zone) then
--                 isInZone = true
--                 local altitude = group:GetAltitude(true) -- Получаем высоту над уровнем земли
--                 if altitude < floor then
--                     group:MessageToGroup("Вы опустились ниже минимальной высоты в зоне " .. zone:GetName() .. ": " .. floor .. " м", 15)
--                 end
--             end
--         end

--         if not isInZone then
--             group:MessageToGroup("Вы вышли из разрешённой зоны!", 15)
--         end
--     end)
-- end

-- -- Запускаем функцию каждые 5 секунд
-- SCHEDULER:New(nil, MonitorGreenZones, {}, 0, 5)
