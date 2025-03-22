-- Created by GreyGoo
-- Dashboard_BFM_V2.0
--
-- Описание скрипта:
-- Описание скрипта:
-- Данный скрипт генерирует дэшборд для BFM (Basic Fighter Maneuvers) 1vs1.  
-- Он отображает параметры оппонентов, включая:  
-- - TAS (Истинная воздушная скорость)  
-- - TRT (Скорость разворота)  
-- - Высоту (Altitude)  
-- - Угловое преимущество  
-- - Остаток топлива  
-- - Дистанцию между оппонентами
-- На основе этих параметров выполняется расчет позиции. 
--
-- Если требуется убрать какой-либо из параметров, закомментируйте соответствующую строку в функции PointSystem.  
--
-- Требования:
-- MIST (версия 4.5.126)
-- MOOSE
-- Для корректного отображения дэшбордов в MIST необходимо закомментировать строки, добавляющие '-------Combined Arms Message--------' в сообщения.
-- Для работы скрипта требуется добавить наименование слотов (групп и юнитов).
-- Названия групп и юнитов (там, где указаны пилот/имя юнита) должны содержать строки, совпадающие с ключами в таблице BFMArenas.
-- Скрипт использует эту информацию для привязки юнитов и групп к конкретным аренам BFM.
-- Убедитесь, что имена групп и юнитов соответствуют ключам в таблице BFMArenas для правильной работы скрипта.
--
-- Таблица BFMArenas также содержит параметр, определяющий видимость сообщений:
-- 0 - Только участники матча на арене
-- 1 - Только техника для мастеров игры, принадлежащая арене
-- 2 - Для участников матча и мастеров игры, принадлежащих арене
-- 3 - Всем
--
-- Если необходимо выводить сообщения только для мастеров игры, разместите наземный юнит,
-- который можно взять под управление с помощью модуля "Огненный рубеж", и назовите его так же, как слот, привязанный к арене.
-- Чтобы наземный юнит не уничтожался и скрипт работал корректно, рекомендуется сделать его бессмертным.
-- Это необходимо, если требуется выводить дэшборд для зрителя боя, а на сервере отключены внешние виды.
--
-- Пример наименования слотов (группы и юниты) и таблицы BFMArenas для корректной работы скрипта:
-- Рекомендуется писать ключ первым, а после него — пробел. В теории это будет работать и с подстрокой в имени, но у меня не находило юнитов с "BFM1-" (дефис мешал).

-- Пример наименования наземных юнитов:
--                   BLUE                                       RED
--   Имя группы             Имя юнита            Имя группы             Имя юнита
-- "BFM#1 MASTER B-1"   "BFM#1 MASTER B-1-1"   "BFM#1 MASTER R-1"   "BFM#1 MASTER R-1-1"
-- "BFM#2 MASTER B-1"   "BFM#2 MASTER B-1-1"   "BFM#2 MASTER R-1"   "BFM#2 MASTER R-1-1"
-- "BFM#3 MASTER B-1"   "BFM#3 MASTER B-1-1"   "BFM#3 MASTER R-1"   "BFM#3 MASTER R-1-1"
--
-- Пример наименования воздушных юнитов:
--
-- "BFM#1 F14 B-1"      "BFM#1 F14 B-1-1"      "BFM#1 F14 R-1"      "BFM#1 F14 R-1-1"
-- "BFM#2 F16 B-1"      "BFM#2 F16 B-1-1"      "BFM#2 F16 R-1"      "BFM#2 F16 R-1-1"
-- "BFM#3 F18 B-1"      "BFM#3 F18 B-1-1"      "BFM#3 F18 R-1"      "BFM#2 F18 R-1-1"

-- Пример таблицы BFMArenas:
--local BFMArenas = {
--   ["BFM#1"] = { msgFor = 0},  -- Только участники матча на арене
--   ["BFM#2"] = { msgFor = 2},  -- Для участников матча и мастеров игры, принадлежащих арене
--   ["BFM#3"] = { msgFor = 3}   -- Всем
--}

-- Также возможно добавление нескольких слотов для одной арены, например, если требуется добавить несколько различных самолетов на арену.
-- Важно, чтобы все они имели один ключ из таблицы BFMArenas.
-- Если на арене будет более двух клиентов, скрипт будет захватывать только первых клиентов из заполненной таблицы.

--Bugs:
--Мерцание дэшбордов, если выводится больше одного дэшборда одному клиенту
--

local BFMArenas = {
    ["18000"] = { msgFor = 1},
    ["3000"] = { msgFor = 1},
    ["1000"] = { msgFor = 1},
    ["7000"] = { msgFor = 1},
    --["BFM#2"] = { msgFor = 2},
    --["BFM#3"] = { msgFor = 3}
}

local EventHandlerBFM = {}
-- Таблица для хранения запущенных шедулеров
local BFM_Schedulers = {}
-- Таблица для хранения дэшбордов
local BFM_Dashboards = {}

-- Функция проверки, содержится ли строка в таблице
local function isStringInList(unitName, unitList)
    for _, keyword in ipairs(unitList) do
        if string.find(unitName, keyword) then
            return true
        end
    end
    return false
end

-- Функция для вывода в логи всех шедулеров и дэшбордов с их ID и именами
local function printSchedulersAndDashboards()
    -- Проверка на существование таблиц
    if not BFM_Schedulers or not BFM_Dashboards then
        env.info("Dasboard_BFM_LOGS: BFM_Schedulers or BFM_Dashboards is nil")
        return
    end

    -- Проверяем, есть ли данные в таблицах
    local schedulersFound = false
    local dashboardsFound = false

    -- Выводим все шедулеры
    env.info("Dasboard_BFM_LOGS: === Current Schedulers ===")
    for dashboardName, scheduler in pairs(BFM_Schedulers) do
        if scheduler then
            schedulersFound = true
            env.info("Dasboard_BFM_LOGS: Scheduler ID: " .. tostring(scheduler) .. ", Dashboard Name: " .. dashboardName)
        end
    end
    if not schedulersFound then
        env.info("Dasboard_BFM_LOGS: No schedulers found.")
    end

    -- Выводим все дэшборды
    env.info("Dasboard_BFM_LOGS: === Current Dashboards ===")
    for dashboardName, dashboard in pairs(BFM_Dashboards) do
        if dashboard then
            dashboardsFound = true
            env.info("Dasboard_BFM_LOGS: Dashboard ID: " .. tostring(dashboard) .. ", Dashboard Name: " .. dashboardName)
        end
    end
    if not dashboardsFound then
        env.info("Dasboard_BFM_LOGS: No dashboards found.")
    end
end

-- Функция расчета скорости юнита в узлах
-- Извлекает скорость юнита, вычисляет ее модуль в м/с и конвертирует в узлы.
local function getSpeedInKnots(unit)
    if not unit then return 0 end    
    local _unit = UNIT:Find(unit)
    return UTILS.MpsToKnots(_unit:GetAirspeedIndicated())
end

-- Функция создания текстового индикатора прогресса
-- Заполняет прогресс-бар символами "■" и "□" в зависимости от доли part от total.
local function createProgressBar(part, total, barLength)
    if total == 0 then
        return string.rep("□", barLength)
    end
    local filled = math.floor((part / total) * barLength)
    local empty = barLength - filled
    return string.rep("■", filled) .. string.rep("□", empty)
end

-- Функция вычисления угла между двумя векторами в 3D
-- Рассчитывает угол (в градусах) между векторами p1 -> p2 и q1 -> q2 с помощью скалярного произведения.
local function calculateAngle(p1, p2, q1, q2)
    if not (p1 and p2 and q1 and q2) then return nil end

    local Px, Py, Pz = p2.x - p1.x, p2.y - p1.y, p2.z - p1.z
    local Qx, Qy, Qz = q2.x - q1.x, q2.y - q1.y, q2.z - q1.z

    local dotProduct = Px * Qx + Py * Qy + Pz * Qz
    local lengthP = math.sqrt(Px^2 + Py^2 + Pz^2)
    local lengthQ = math.sqrt(Qx^2 + Qy^2 + Qz^2)

   
    if lengthP == 0 or lengthQ == 0 then return nil end

    
    local cosTheta = math.max(-1, math.min(1, dotProduct / (lengthP * lengthQ)))
    
    return math.deg(math.acos(cosTheta)) -- Угол в градусах
end

-- Функция проверки, находится ли значение в заданном диапазоне
-- Возвращает true, если value находится между lowerBound и upperBound (включительно).
local function isInRange(value, lowerBound, upperBound)
    return value >= lowerBound and value <= upperBound
end

-- Функция отправки сообщения в DCS
-- Формирует сообщение с указанными параметрами (текст, время отображения, получатели, звук) и отправляет его через MIST.
local function sendMessage(name, text, displayTime, recipients, sound)
    local msg = {
        name = name or "test",
        text = text or nil,
        displayTime = displayTime or 5, 
        msgFor = recipients or {coa = {'all'}}, 
        sound = sound or nil,
    }
    mist.message.add(msg)
end

-- Функция проверяет, произошло ли слияние двух юнитов на основе их расстояния и радиуса заданной сферы.
local function checkMerge(posA, posB, prevDist, radius)
    local isMerge = false
    local distance = math.sqrt((posA.x - posB.x)^2 + (posA.y - posB.y)^2 + (posA.z - posB.z)^2)
    local isIntersecting = distance <= (radius)
    local isDistanceIncreased = distance > prevDist 
    isMerge = (isIntersecting and isDistanceIncreased)
    return isMerge
end

-- Пока что супер простая модель для расчета. Планируется добавить правила...
-- Функция вычисляет и формирует строку с результатами для двух юнитов, основываясь на их скорости, угловом преимуществе, высоте, топливе, расстоянии и других параметрах.
-- Она также генерирует прогресс-бары для отображения этих значений.
local function PointSystem(spdKNOTS_a, spdKNOTS_b, angle_ab, angle_ba, altM_a, altM_b, trt_a, trt_b, dist_ab, current_fuel_a, current_fuel_b, start_fuel_a, start_fuel_b, isMerged)
    -- Инициализация переменных для очков каждого юнита
    local points_spd_a, points_spd_b
    local points_angle_a, points_angle_b
    local points_alt_a, points_alt_b
    local points_trt_a, points_trt_b  -- Пока не используется
    local points_fuel_a, points_fuel_b
    local pointssum_a
    local pointssum_b
    local result
    
    -- Инициализация очков для различных параметров
    local points_spd_a = 1
    local points_spd_b = 1
    local points_angle_a = 1
    local points_angle_b = 1
    local points_alt_a = 1
    local points_alt_b = 1
    local points_trt_a = 1
    local points_trt_b = 1
    local points_fuel_a = 1
    local points_fuel_b = 1 

    -- Коэффициент нормализации выполняет роль делителя, который масштабирует разницу между значениями до уровня, 
    -- позволяющего адекватно применять экспоненциальную функцию для вычисления коэффициента. 
    -- Он определяет степень чувствительности системы к изменениям, регулируя влияние этих изменений на итоговый результат 
    local coef_angle = 15
    local coef_fuel = 25
    local coef_spdKNOTS = 70
    local coef_altM = 400

    -- Пока не используется
    -- Максимальная и минимальная тактическая скорость для расчета
    local max_tac_spd = 450
    local min_tac_spd = 300

    -- Переменные для бонусов, которые начисляются в определенных условиях
    local bonus_a = 0
    local bonus_b = 0

    -- Проверка на расстояние между юнитами и расчет очков, если юниты находятся в радиусе 4000 м
    if (dist_ab <= 4000) then

        -- Расчет очков углового преимущества. Если угол angle_ab меньше angle_ba, очки для первого юнита (points_angle_a) увеличивается экспоненциально в зависимости от разницы углов. 
        -- Чем больше разница, тем больше очков. Если углы равны или угловое преимущество у второго юнита, очки для первого юнита остаются равными 1.
        -- По такому же приниципу расчитываются очки по другим параметрам
        if (angle_ab < angle_ba) then
            points_angle_a = math.exp(points_angle_a * (math.abs(angle_ab - angle_ba) / coef_angle))
        else
            points_angle_a = 1
        end
        
        if (angle_ab > angle_ba) then
            points_angle_b = math.exp(points_angle_b * (math.abs(angle_ab - angle_ba) / coef_angle))
        else
            points_angle_b = 1
        end
        
        -- Расчет очков для топлива
        if (current_fuel_a > current_fuel_b) then
            points_fuel_a = math.exp(points_fuel_a * (math.abs(current_fuel_a - current_fuel_b) / coef_fuel))
        else
            points_fuel_a = 1
        end
        
        if (current_fuel_a < current_fuel_b) then
            points_fuel_b = math.exp(points_fuel_b * (math.abs(current_fuel_a - current_fuel_b) / coef_fuel))
        else
            points_fuel_b = 1
        end
        
        -- Расчет очков для скорости
        if (spdKNOTS_a > spdKNOTS_b) then
            points_spd_a = math.exp(points_spd_a * (math.abs(spdKNOTS_a - spdKNOTS_b) / coef_spdKNOTS))
        else
            points_spd_a = 1
        end
        
        if (spdKNOTS_a < spdKNOTS_b) then
            points_spd_b = math.exp(points_spd_b * (math.abs(spdKNOTS_a - spdKNOTS_b) / coef_spdKNOTS))
        else
            points_spd_b = 1
        end
        
        -- Расчет очков для высоты
        if (altM_a > altM_b) then
            points_alt_a = math.exp(points_alt_a * (math.abs(altM_a - altM_b) / coef_altM))
        else
            points_alt_a = 1
        end
        
        if (altM_a < altM_b) then
            points_alt_b = math.exp(points_alt_b * (math.abs(altM_a - altM_b) / coef_altM))
        else
            points_alt_b = 1
        end
    end
    
    -- Если оба юнита расходуют топливо до нуля, начисляются бонусные очки в зависимости от их высоты и скорости
    if (current_fuel_a == 0) and (current_fuel_b == 0) and (math.abs(spdKNOTS_a - spdKNOTS_b) <= 60) and (math.abs(altM_a - altM_b) > 2000) and (altM_a > altM_b) then
        bonus_a = bonus_a + 100000
    end
    if (current_fuel_a == 0) and (current_fuel_b == 0) and (math.abs(spdKNOTS_a - spdKNOTS_b) <= 60) and (math.abs(altM_a - altM_b) > 2000) and (altM_a < altM_b) then
        bonus_b = bonus_b + 100000
    end

    -- Суммируем все очки для каждого юнита
    pointssum_a = points_spd_a + points_angle_a + points_alt_a + points_fuel_a
    pointssum_b = points_spd_b + points_angle_b + points_alt_b + points_fuel_b
    
    -- Рассчитываем итоговое значение результата, выраженное в процентах
    result = ((pointssum_a) / ((pointssum_a) + (pointssum_b))) * 100
    
    -- Создаем прогресс-бары для различных параметров. Конкретно для _a юнита 
    local progressBarSpd_a = createProgressBar(spdKNOTS_a / (spdKNOTS_a + spdKNOTS_b) * 100, 100, 30)
    local progressBarAngle_a = createProgressBar(100 - (angle_ab / (angle_ab + angle_ba) * 100), 100, 30)
    local progressBarTrt_a = createProgressBar(trt_a / (trt_a + trt_b) * 100, 100, 30)
    local progressBarAlt_a = createProgressBar(altM_a / (altM_a + altM_b) * 100, 100, 30)
    local progressBarFuel_a = createProgressBar(((current_fuel_a / start_fuel_a) / ((current_fuel_a / start_fuel_a) + (current_fuel_b / start_fuel_b))) * 100, 100, 30)
    local progressBarA = createProgressBar(result, 100, 30)

    -- Формируем строку сообщения с прогресс-барами и результатами
    local message = ""
    
    -- Определяем язык клиента (предполагается, что есть переменная clientLanguage)
    local clientLanguage = SETTINGS:GetLocale() or "ru" -- По умолчанию русский, если не определено
    
    if clientLanguage == "ru" then
         -- Русская версия сообщений
        message = message .. string.format("[%s] :IAS узлы: %.1f|%.1f\n", progressBarSpd_a, spdKNOTS_a, spdKNOTS_b)
        message = message .. string.format("[%s] :Угловое преимущество °: %.1f|%.1f\n", progressBarAngle_a, angle_ab, angle_ba)
        message = message .. string.format("[%s] :TRT °: %.1f|%.1f\n", progressBarTrt_a, trt_a, trt_b)
        message = message .. string.format("[%s] :Высота м: %.1f|%.1f\n", progressBarAlt_a, altM_a, altM_b)
        message = message .. string.format("[%s] :Топливо %%: %.1f|%.1f\n", progressBarFuel_a, (current_fuel_a / start_fuel_a) * 100, (current_fuel_b / start_fuel_b) * 100)

        -- Если произошел merge, добавляем информацию о позиции и очках
        if isMerged then
            message = message .. string.format("[%s] :Позиция\n", progressBarA)
            --message = message .. string.format("Очки blue: %.1f|%.1f \n", pointssum_a, result)
            --message = message .. string.format("Очки red : %.1f|%.1f \n", pointssum_b, 100 - result)
        end

        -- Добавляем информацию о расстоянии между юнитами
        message = message .. string.format("Расстояние между противниками м: %.1f\n", dist_ab)
    else
        -- Английская версия сообщений
        message = message .. string.format("[%s] :IAS knots: %.1f|%.1f\n", progressBarSpd_a, spdKNOTS_a, spdKNOTS_b)
        message = message .. string.format("[%s] :Angular advantage °: %.1f|%.1f\n", progressBarAngle_a, angle_ab, angle_ba)
        message = message .. string.format("[%s] :TRT °: %.1f|%.1f\n", progressBarTrt_a, trt_a, trt_b)
        message = message .. string.format("[%s] :Altitude m: %.1f|%.1f\n", progressBarAlt_a, altM_a, altM_b)
        message = message .. string.format("[%s] :Fuel %%: %.1f|%.1f\n", progressBarFuel_a, (current_fuel_a / start_fuel_a) * 100, (current_fuel_b / start_fuel_b) * 100)

        -- Если произошел merge, добавляем информацию о позиции и очках
        if isMerged then
            message = message .. string.format("[%s] :Position\n", progressBarA)
            --message = message .. string.format("Очки blue: %.1f|%.1f \n", pointssum_a, result)
            --message = message .. string.format("Очки red : %.1f|%.1f \n", pointssum_b, 100 - result)
        end

        -- Добавляем информацию о расстоянии между юнитами
        message = message .. string.format("Distance between units in meters: %.1f\n", dist_ab)
    end
    
    -- Возвращаем сформированное сообщение
    return message
end

-- Функция создаёт новый дэшборд с локальным состоянием для отслеживания информации о двух юнитах
local function createBFMDashBoard()
    -- Локальные переменные для хранения состояния дэшборда
    local dashboard = {
        counter = 0,
        distA = 0, distB = 0, distAB = 0,
        angleA = 0, angleB = 0, trtA = 0, trtB = 0,
        spdA = 0, spdB = 0, altA = 0, altB = 0,
        startfuelA = 0, startfuelB = 0,
        fuelA = 0, fuelB = 0,
        AoA_a = 0, AoA_b = 0,
        a1 = nil, a2 = nil, b1 = nil, b2 = nil,
        ca = nil, cb = nil,
        redUnit = nil, blueUnit = nil,
        isMerged = false,
        message = "",
    }
    -- Возвращаем замыкание, которое обновляет состояние дэшборда
    return function(dashboardName, NameSlots, MessageFor)

        local coalitionSides = {
            ["red"] = coalition.side.RED,
            ["blue"] = coalition.side.BLUE
        }

            local airUnitNames = {}   -- Имена воздушных юнитов
            local groundUnitNames = {} -- Имена наземных юнитов

        -- Проходим по каждой коалиции для обработки юнитов
        for side, coalitionId in pairs(coalitionSides) do
            local airUnits = {}
            local groundUnits = {}
    
            -- Перебираем все воздушные группы в коалиции
            local airGroups = coalition.getGroups(coalitionId, Group.Category.AIRPLANE)
            for _, group in ipairs(airGroups) do
                if string.find(group:getName(), NameSlots) then
                    local groupUnits = group:getUnits()
                    for _, unit in ipairs(groupUnits) do
                        table.insert(airUnits, unit)
                    end
                end
            end
            -- Перебираем все наземные группы в коалиции
            local groundGroups = coalition.getGroups(coalitionId, Group.Category.GROUND)
            for _, group in ipairs(groundGroups) do
                if string.find(group:getName(), NameSlots) then
                    local groupUnits = group:getUnits()
                    for _, unit in ipairs(groupUnits) do
                        table.insert(groundUnitNames, unit:getName()) -- Сохраняем имя юнита
                    end
                end
            end
            -- Присваиваем первым найденным воздушным юнитам из каждой коалиции (красной и синей) соответствующие переменные для дальнейшего отслеживания
            if side == "red" and #airUnits > 0 then
                dashboard.redUnit = airUnits[1]
                elseif side == "blue" and #airUnits > 0 then
                dashboard.blueUnit = airUnits[1]
            end
        end

        -- Если оба юнита существуют, обновляем их состояния
        if dashboard.blueUnit and dashboard.redUnit and dashboard.blueUnit:isExist() and dashboard.redUnit:isExist() then

            table.insert(airUnitNames, dashboard.redUnit:getName())
            table.insert(airUnitNames, dashboard.blueUnit:getName())

            dashboard.message = dashboardName .. ":\n               " .. (dashboard.blueUnit:getPlayerName() or dashboard.blueUnit:getName()) .. " vs " .. (dashboard.redUnit:getPlayerName() or dashboard.redUnit:getName()) .. "\n"
            local currentPosA = dashboard.blueUnit:getPoint()
            local currentPosB = dashboard.redUnit:getPoint()
            dashboard.fuelA = dashboard.blueUnit:getFuel() * 100
            dashboard.fuelB = dashboard.redUnit:getFuel() * 100
            dashboard.AoA_a = math.abs((mist.getAoA(dashboard.blueUnit) or 0) * (180 / math.pi))
            dashboard.AoA_b = math.abs((mist.getAoA(dashboard.redUnit) or 0) * (180 / math.pi))
            dashboard.altA, dashboard.altB = currentPosA.y, currentPosB.y
            dashboard.spdA, dashboard.spdB = getSpeedInKnots(dashboard.blueUnit), getSpeedInKnots(dashboard.redUnit)

            --Проверка на мердж
            if (dashboard.counter) > 1 and (not dashboard.isMerged) then
                dashboard.isMerged = checkMerge(currentPosA, currentPosB, dashboard.distAB, 2000)
                local deltaAlt = 0;
                if math.abs(currentPosA.y - currentPosB.y) <= 200 then
                    deltaAlt = math.abs(currentPosA.y - currentPosB.y)
                else
                    deltaAlt = 200
                end
                local deltaAngle = math.abs(dashboard.angleA + dashboard.angleB)

                mergeQuality = (((1 - (deltaAlt/200)) + (1 - ((deltaAngle)/360)))/2)*100

                -- Определяем язык клиента (предполагается, что есть переменная clientLanguage)
                local clientLanguage = SETTINGS:GetLocale() or "ru" -- По умолчанию русский, если не определено
                if clientLanguage == "ru" then
                    dashboard.message = dashboard.message .. string.format("Качество мерджа: %.1f\n", mergeQuality)                    
                else
                    dashboard.message = dashboard.message .. string.format("Merge quality: %.1f\n", mergeQuality)
                end

                if dashboard.isMerged then
                    -- В этом месте будет логика для обработки слияния
                end
            end
            -- Рассчитываем расстояние между юнитами
            dashboard.distAB = UTILS.VecDist3D(currentPosA, currentPosB)

            -- Расчет параметров юнитов
            if dashboard.counter > 0 then
                -- Чередование координат объектов для корректного вычисления параметров
                if dashboard.counter % 2 == 0 then
                    dashboard.ca, dashboard.cb = dashboard.a2, dashboard.b2
                    dashboard.a2, dashboard.b2 = currentPosA, currentPosB
                    if dashboard.a1 and dashboard.a2 and dashboard.b1 and dashboard.b2 then
                        dashboard.distA = UTILS.VecDist3D(dashboard.a1, dashboard.a2)
                        dashboard.distB = UTILS.VecDist3D(dashboard.b1, dashboard.b2)
                        dashboard.distAB = UTILS.VecDist3D(dashboard.a2, dashboard.b2)
                        dashboard.angleA = math.abs((calculateAngle(dashboard.a1, dashboard.a2, dashboard.a2, dashboard.b2) or 0) - dashboard.AoA_a)
                        dashboard.angleB = math.abs((calculateAngle(dashboard.b1, dashboard.b2, dashboard.b2, dashboard.a2) or 0) - dashboard.AoA_b)
                        dashboard.trtA = calculateAngle(dashboard.ca, dashboard.a1, dashboard.a1, dashboard.a2) or 0
                        dashboard.trtB = calculateAngle(dashboard.cb, dashboard.b1, dashboard.b1, dashboard.b2) or 0
                    end
                else
                    dashboard.ca, dashboard.cb = dashboard.a1, dashboard.b1
                    dashboard.a1, dashboard.b1 = currentPosA, currentPosB
                    if dashboard.a1 and dashboard.a2 and dashboard.b1 and dashboard.b2 then
                        dashboard.distA = UTILS.VecDist3D(dashboard.a2, dashboard.a1)
                        dashboard.distB = UTILS.VecDist3D(dashboard.b2, dashboard.b1)
                        dashboard.distAB = UTILS.VecDist3D(dashboard.a1, dashboard.b1)
                        dashboard.angleA = math.abs((calculateAngle(dashboard.a2, dashboard.a1, dashboard.a1, dashboard.b1) or 0) - dashboard.AoA_a) 
                        dashboard.angleB = math.abs((calculateAngle(dashboard.b2, dashboard.b1, dashboard.b1, dashboard.a1) or 0) - dashboard.AoA_b)
                        dashboard.trtA = calculateAngle(dashboard.ca, dashboard.a2, dashboard.a2, dashboard.a1) or 0
                        dashboard.trtB = calculateAngle(dashboard.cb, dashboard.b2, dashboard.b2, dashboard.b1) or 0
                    end
                end
            else
                -- Инициализация переменных топлива и координат при первом расчете
                dashboard.startfuelA = dashboard.blueUnit:getFuel() * 100
                dashboard.startfuelB = dashboard.redUnit:getFuel() * 100
                dashboard.a1, dashboard.b1 = currentPosA, currentPosB
            end

            -- Обновляем сообщение для отображения на дэшборде, если прошло достаточное количество циклов обновления
            if dashboard.counter > 2 then
                dashboard.message = dashboard.message .. PointSystem(dashboard.spdA, dashboard.spdB, dashboard.angleA, dashboard.angleB, dashboard.altA, dashboard.altB, dashboard.trtA * 10, dashboard.trtB * 10, dashboard.distAB, dashboard.fuelA, dashboard.fuelB, dashboard.startfuelA, dashboard.startfuelB, dashboard.isMerged) or 0 .. "\n"
            end
            dashboard.counter = dashboard.counter + 1
        else
            -- Если не найдено ни одного юнита, сбрасываем почти все переменные
            dashboard.message = dashboardName .. ": not found Players\n"
            dashboard.counter = 0
            dashboard.distA, dashboard.distB, dashboard.distAB = 0, 0, 0
            dashboard.angleA, dashboard.angleB, dashboard.trtA, dashboard.trtB = 0, 0, 0, 0
            dashboard.spdA, dashboard.spdB, dashboard.altA, dashboard.altB = 0, 0, 0, 0
            dashboard.fuelA, dashboard.fuelB = 0, 0
            dashboard.startfuelA, dashboard.startfuelB = 0, 0
            dashboard.AoA_a, dashboard.AoA_b = 0, 0
            dashboard.a1, dashboard.a2, dashboard.b1, dashboard.b2 = nil, nil, nil, nil
            dashboard.ca, dashboard.cb = nil, nil
            --dashboard.redUnit, dashboard.blueUnit = nil, nil
            dashboard.isMerged = false
        end
        
        -- Отправка сообщения в зависимости от параметра MessageFor
        -- Отправка сообщения только воздушным юнитам (MessageFor == 0)
        if MessageFor == 0 then 
            sendMessage(dashboardName, dashboard.message, 5, {units = airUnitNames})
        end

        -- Отправка сообщения каждому наземному юниту (MessageFor == 1)
        if MessageFor == 1 then 
            for _, unitName in ipairs(groundUnitNames) do
                local message = MESSAGE:New(dashboard.message, 5, nil, true)
                message:ToUnit(UNIT:FindByName(unitName))
            end
        end

        -- Отправка сообщения наземным юнитам и воздушным юнитам (MessageFor == 2)
        if MessageFor == 2 then 
            for _, unitName in ipairs(groundUnitNames) do
                local message = MESSAGE:New(dashboard.message, 5, nil, true)
                message:ToUnit(UNIT:FindByName(unitName))
            end
            sendMessage(dashboardName, dashboard.message, 5, {units = airUnitNames})
        end
        -- Отправка сообщения всем юнитам (MessageFor == 3)
        if MessageFor == 3 then 
            sendMessage(dashboardName, dashboard.message, 5, {coa = {"all"}})
        end
        
        -- Проверка наличия юнитов BFM матча для дэшборда
        if not (dashboard.blueUnit and dashboard.blueUnit:isExist()) and not (dashboard.redUnit and dashboard.redUnit:isExist()) then
            
            env.info("Dasboard_BFM_LOGS: Both units are missing, stopping scheduler for: " .. dashboardName)
            -- Удаление дэшборда, если оба юнита отсутствуют
            BFM_Dashboards[dashboardName] = nil
            env.info("Dasboard_BFM_LOGS: Dashboard " .. dashboardName .. " removed due to missing units.")
            -- Остановка шедулера
            if BFM_Schedulers[dashboardName] then
                BFM_Schedulers[dashboardName]:Stop()
                BFM_Schedulers[dashboardName] = nil
                env.info("Dasboard_BFM_LOGS: Scheduler stopped for " .. dashboardName)  -- Логирование в консоль
            end
            return
        end
        -- Сбрасываем данные для следующего обновления
        dashboard.redUnit, dashboard.blueUnit = nil, nil
        dashboard.message = ""
    end
end

-- Функция для запуска планировщика обновлений для каждого дэшборда. Возвращает шедулер
local function StartDashboardScheduler(dashboardName, nameSlot, recipients, interval)
    interval = interval or 1
    -- Создаём шедулер и сохраняем его
    local scheduler = SCHEDULER:New(nil, function()
        if BFM_Dashboards[dashboardName] then
            BFM_Dashboards[dashboardName](dashboardName, nameSlot, recipients)
        end
    end, {}, 0, interval)
    return scheduler
end

-- Обработчик события
function EventHandlerBFM:onEvent(event)
    if event.id == world.event.S_EVENT_BIRTH then
        local unit = event.initiator  
        if unit and unit:getName() then
            local unitName = unit:getName()
            for bfmArena, params in pairs(BFMArenas) do
                if string.find(unitName, bfmArena) then
                    env.info("Dasboard_BFM_LOGS: Unit spawned: " .. unitName)
                    local dashboardName = "Dashboard" .. bfmArena
                    found = True

                    if not BFM_Dashboards[dashboardName] then
                        BFM_Dashboards[dashboardName] = createBFMDashBoard()
                        env.info("Dasboard_BFM_LOGS: Dashboard created: " .. dashboardName)
                    end
                    if not BFM_Schedulers[dashboardName] then
                        local msgForValue = params.msgFor
                        BFM_Schedulers[dashboardName] = StartDashboardScheduler(dashboardName, bfmArena, msgForValue, 0.1)
                        env.info("Dasboard_BFM_LOGS: Scheduler started: " .. dashboardName .. " for unit: " .. bfmArena)
                    end
                    break
                end
            end
        end
    end
end
world.addEventHandler(EventHandlerBFM)