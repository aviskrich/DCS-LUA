-- Определяем радиус зоны SATAC в морских милях
local SATAC_Zone_Radius = 20  -- Установите желаемый радиус в морских милях
local SATAC_Zones = {}  -- Таблица для хранения всех зон
local activeZoneIndex = 1  -- Индекс активной зоны

-- Создаём зоны на основе статических объектов "SATAC_Center 1", "SATAC_Center 2" и т.д.
local zoneCount = 0
local zoneIndex = 1

-- Ищем все центры зон
while true do
    local centerStatic = STATIC:FindByName("SATAC_Center " .. zoneIndex, false)
    if not centerStatic then
        -- Если не нашли зону с текущим индексом, пробуем найти без индекса (для обратной совместимости)
        if zoneIndex == 1 then
            centerStatic = STATIC:FindByName("SATAC_Center")
            if not centerStatic then
                break
            end
        else
            break
        end
    end
    
    local centerCoordinate = centerStatic:GetCoordinate()
    -- Создаём зону SATAC используя ZONE_RADIUS
    local zoneName = "SATAC_ZONE " .. zoneIndex
    local newZone = ZONE_RADIUS:New(zoneName, centerCoordinate:GetVec2(), UTILS.NMToMeters(SATAC_Zone_Radius))
    
    -- Добавляем зону в таблицу
    table.insert(SATAC_Zones, newZone)
    zoneCount = zoneCount + 1
    zoneIndex = zoneIndex + 1
end

if zoneCount == 0 then
    env.error("No SATAC_Center objects found!")
    return  -- Останавливаем скрипт, если объекты не найдены
end

-- Отрисовываем только активную зону
local function DrawActiveZone()
    -- Сначала убираем отрисовку всех зон
    for _, zone in pairs(SATAC_Zones) do
        zone:UndrawZone()
    end
    -- Отрисовываем только активную зону
    SATAC_Zones[activeZoneIndex]:DrawZone(-1, {1,0,0})
end

DrawActiveZone()

-- Создание наборов групп для каждой коалиции
redPlayerSet = SET_GROUP:New():FilterCoalitions("red"):FilterPrefixes({"fox"}):FilterStart()
bluePlayerSet = SET_GROUP:New():FilterCoalitions("blue"):FilterPrefixes({"fox"}):FilterStart()

-- Инициализация переменных для отслеживания состояния игры
local gameActive = true
local gameStarted = false
local redEnteredZoneTime = nil
local blueEnteredZoneTime = nil
local startTimer = nil  -- Время, когда игра должна начаться через 120 секунд
local groupsOutsideZone = {}

-- Инициализируем MSRS только один раз
msrs = MSRS:New('', 305.00, 0, MSRS.Backend.SRSEXE):SetCoalition(coalition.side.NEUTRAL):SetVoice("en-US-Standard-B")

-- Кэшируем часто используемые звуки
local warningSound = USERSOUND:New("warning.wav")
local bellSound = USERSOUND:New("top-gun-bell.ogg")
local chooseSound = USERSOUND:New("choose_triple-bell.wav")

-- Функция для отправки сообщений только участвующим группам с использованием MIST
local function SendMessageToParticipants(messageText, duration, messageTo, messageName, soundName)
    duration = duration or 10
    local _msgName = messageName or "SATAC Status"
    local _msgFor = messageTo
    local _sound = soundName or nil
    
    if _msgFor ~= nil then
        if (type(messageTo)=='string') then 
            _msgFor = {units = {messageTo}}
        elseif (type(messageTo)=='table') then
            _msgFor = {units = messageTo}
        elseif (not messageTo or (type(messageTo)=='number' and messageTo == 0)) then
            _msgFor = {coa = {'all'}}
        end
    else
        local currentPlayers = {}
        _msgFor = {units = currentPlayers}
        
        -- Оптимизация: собираем имена юнитов за один проход по каждому набору
        local function collectUnitNames(group)
            for i = 1, #group:GetUnits() do
                table.insert(currentPlayers, group:GetUnit(i):GetName())
            end
        end
        
        redPlayerSet:ForEachGroup(collectUnitNames)
        bluePlayerSet:ForEachGroup(collectUnitNames)
    end
    
    mist.message.add({
        name = _msgName,
        text = messageText,
        displayTime = duration,
        msgFor = _msgFor,
        sound = _sound
    })
end

-- Функция для отображения статусной панели с использованием MIST
local function DisplayStatusPanel()
    local activeZone = SATAC_Zones[activeZoneIndex]
    local redAliveTotal = redPlayerSet:CountAlive()
    local blueAliveTotal = bluePlayerSet:CountAlive()

    -- Получаем количество живых групп в зоне
    local redCountInZone = 0
    local blueCountInZone = 0
    
    redPlayerSet:ForEachGroup(function(group)
        if group:IsAlive() and group:IsCompletelyInZone(activeZone) then
            redCountInZone = redCountInZone + 1
        end
    end)

    bluePlayerSet:ForEachGroup(function(group)
        if group:IsAlive() and group:IsCompletelyInZone(activeZone) then
            blueCountInZone = blueCountInZone + 1
        end
    end)

    -- Формируем сообщение статусной панели
    local statusMessage = "ATTACK STATUS:\n--------------------------------\n"
    statusMessage = statusMessage .. string.format("Active zone: %d of %d\n", activeZoneIndex, zoneCount)
    
    if gameStarted then
        statusMessage = statusMessage .. "Game has started!\n"
    else
        statusMessage = statusMessage .. "Game has not started yet.\n"
    end

    statusMessage = statusMessage .. string.format("Red: alive %d, in zone %d\n",  redAliveTotal, redCountInZone)
    statusMessage = statusMessage .. string.format("Blue: alive %d, in zone %d\n",  blueAliveTotal, blueCountInZone)

    -- Добавляем информацию о времени до начала игры, если применимо
    if not gameStarted and (redEnteredZoneTime ~= nil or blueEnteredZoneTime ~= nil) and startTimer ~= nil then
        local timeRemaining = math.floor(startTimer - timer.getTime())
        if timeRemaining > 0 then
            statusMessage = statusMessage .. string.format("-------------------------------------\nGame will start in %d seconds.\n", timeRemaining)
        else
            statusMessage = statusMessage .. "-------------------------------------\nGame will start soon...\n"
        end
    end

    -- Отправляем статусную панель только участникам
    local currentPlayerUnitNames = {}
    
    -- Оптимизация: собираем имена юнитов за один проход по каждому набору
    local function collectUnitNames(group)
        for i = 1, #group:GetUnits() do
            table.insert(currentPlayerUnitNames, group:GetUnit(i):GetName())
        end
    end
    
    redPlayerSet:ForEachGroup(collectUnitNames)
    bluePlayerSet:ForEachGroup(collectUnitNames)
    
    SendMessageToParticipants(statusMessage, 25, currentPlayerUnitNames, "StatusPanel_")
end

-- Функция для сброса игры
local function ResetGame()
    -- Сбрасываем игровые переменные
    gameActive = true
    gameStarted = false
    redEnteredZoneTime = nil
    blueEnteredZoneTime = nil
    startTimer = nil
    groupsOutsideZone = {}
end

-- Функция для проверки состояния игры и обработки логики
local function CheckGroupsInZone()
    if not gameActive then
        return
    end

    local activeZone = SATAC_Zones[activeZoneIndex]
    local currentTime = timer.getTime()

    -- Обновляем списки живых групп в зоне
    local redCount = 0
    local blueCount = 0
    
    -- Оптимизация: считаем группы в зоне за один проход
    redPlayerSet:ForEachGroup(function(group)
        if group and group:IsAlive() then
            if group:IsCompletelyInZone(activeZone) then
                redCount = redCount + 1
            end
        end
    end)

    bluePlayerSet:ForEachGroup(function(group)
        if group and group:IsAlive() then
            if group:IsCompletelyInZone(activeZone) then
                blueCount = blueCount + 1
            end
        end
    end)

    local redAliveTotal = redPlayerSet:CountAlive()
    local blueAliveTotal = bluePlayerSet:CountAlive()

    local allRedInZone = (redCount == redAliveTotal) and (redAliveTotal > 0)
    local allBlueInZone = (blueCount == blueAliveTotal) and (blueAliveTotal > 0)

    -- Логика начала игры
    if not gameStarted then
        -- Обновляем время входа первых групп
        if redCount > 0 and redEnteredZoneTime == nil then
            redEnteredZoneTime = currentTime
        end
        if blueCount > 0 and blueEnteredZoneTime == nil then
            blueEnteredZoneTime = currentTime
        end

        if redEnteredZoneTime ~= nil and blueEnteredZoneTime ~= nil then
            if allRedInZone and allBlueInZone then
                -- Все группы обеих сторон в зоне
                gameStarted = true
                msrs:PlayText("Game started!", 1)
                SendMessageToParticipants("Game started! All aircraft have entered the zone.", 10)         
                bellSound:ToAll()                
            else
                -- Запускаем таймер на 120 секунд
                if startTimer == nil then
                    startTimer = math.max(redEnteredZoneTime or 0, blueEnteredZoneTime or 0) + 120
                    msrs:PlayText("At least one aircraft from each side has entered the zone. Game start timer initiated! 2 minutes until start!", 2)
                end
                if currentTime >= startTimer then
                    gameStarted = true
                    msrs:PlayText("Game started!", 1)
                    bellSound:ToAll()
                    SendMessageToParticipants("Game started! 120 seconds have passed since the first aircraft from both sides entered the zone.", 10)                    
                end
            end
        end
    end

    -- Обрабатываем логику игры только после начала игры
    if gameStarted then
        -- Переменные для отслеживания наличия активных игроков в бою
        local redActiveInCombat = false
        local blueActiveInCombat = false
        
        -- Общая функция для проверки групп вне зоны
        local function checkGroupOutsideZone(group)
            if group and group:IsAlive() then
                local groupName = group:GetName()
                
                if group:IsCompletelyInZone(activeZone) then
                    -- Группа в зоне, сбрасываем таймер
                    groupsOutsideZone[groupName] = nil
                    
                    -- Отмечаем, что есть активные игроки в зоне
                    if group:GetCoalition() == coalition.side.RED then
                        redActiveInCombat = true
                    else
                        blueActiveInCombat = true
                    end
                else
                    -- Группа вне зоны
                    local unit = group:GetUnits()[1]
                    local playerName = unit and unit:GetPlayerName()
                    
                    if not groupsOutsideZone[groupName] then
                        groupsOutsideZone[groupName] = currentTime + 60
                        -- Отправляем сообщение группе только если это игрок
                        if playerName then
                            SendMessageToParticipants(
                                string.format("%s has left the zone. You have %i seconds to return!", 
                                playerName, 60), 
                                10, 
                                unit:GetName(),
                                "OutsideWarning_" .. groupName
                            )
                            warningSound:ToGroup(GROUP:FindByName(groupName))
                        end
                    else
                        -- Отправляем сообщение группе только если это игрок
                        if playerName then
                            local timeLeft = math.floor(groupsOutsideZone[groupName] - currentTime)
                            SendMessageToParticipants(
                                string.format("%s has left the zone. You have %i seconds to return!", 
                                playerName, timeLeft), 
                                10, 
                                unit:GetName(),
                                "OutsideWarning_" .. groupName
                            )
                            warningSound:ToGroup(GROUP:FindByName(groupName))
                        end
                        
                        -- Если таймер еще не истек, считаем группу активной в бою
                        if currentTime < groupsOutsideZone[groupName] then
                            if group:GetCoalition() == coalition.side.RED then
                                redActiveInCombat = true
                            else
                                blueActiveInCombat = true
                            end
                        end
                        
                        if currentTime >= groupsOutsideZone[groupName] then
                            group:Explode(100)                            
                            groupsOutsideZone[groupName] = nil
                        end
                    end
                end
            end
        end

        -- Проверяем все группы
        redPlayerSet:ForEachGroup(checkGroupOutsideZone)
        bluePlayerSet:ForEachGroup(checkGroupOutsideZone)
        
        -- Проверяем, есть ли активные игроки в бою
        if not (redActiveInCombat and blueActiveInCombat) then
            -- Если нет активных игроков хотя бы с одной стороны, сбрасываем игру
            SendMessageToParticipants("No active players left in the zone. Game reset.", 10)
            msrs:PlayText("No active players left in the zone. Game reset.", 2)
            ResetGame()
        end
    end
end

-- Планировщик для регулярной проверки состояния игры
SCHEDULER:New(nil, CheckGroupsInZone, {}, 0, 2)

-- Планировщик для обновления статусной панели каждые 5 секунд
SCHEDULER:New(nil, DisplayStatusPanel, {}, 0, 5)

---------------------------------------------------
-- ОБРАБОТКА СООБЩЕНИЙ ЧАТА ДЛЯ НАСТРОЙКИ МИССИИ --
---------------------------------------------------

-- Таблица для хранения информации о выключенных AWACS
DisabledAWACS = {}

-- Функция для отключения всех AWACS
function DisableAllAWACS()
    local awacsSet = SET_GROUP:New():FilterPrefixes("AWACS"):FilterStart()
    awacsSet:ForEachGroup(function(group)
        local groupName = group:GetName()
        local groupTemplate = group:GetTemplate()
        -- Сохраняем шаблон группы для последующего включения
        DisabledAWACS[groupName] = groupTemplate
        group:Explode(100)
        if (group) then 
            group:Destroy()
        end
    end)
    MESSAGE:New("ATTACK: All AWACS disabled.", 10):ToAll()
end

-- Функция для включения всех AWACS
function EnableAllAWACS()
    for groupName, groupTemplate in pairs(DisabledAWACS) do
        -- Создаем объект SPAWN с использованием сохраненного шаблона
        GROUP:FindByName(groupName):Respawn(nil, true)
    end
    -- Очищаем таблицу после возрождения групп
    DisabledAWACS = {}
    MESSAGE:New("ATTACK: All AWACS enabled.", 10):ToAll()
end

-- Функция для перезапуска миссии
function RestartMission()
    -- Отправляем сообщение всем игрокам
    MESSAGE:New("ATTACK: Mission will restart in 10 seconds.", 10):ToAll()

    -- Задержка перед перезапуском миссии
    TIMER:New(function()
        trigger.action.setUserFlag("9001", true)
    end):Start(10)
end

function SetZoneRadius(radius)
    SATAC_Zone_Radius = radius
    
    -- Обновляем радиус для всех зон
    for i, zone in ipairs(SATAC_Zones) do
        zone:UndrawZone()
        zone:SetRadius(UTILS.NMToMeters(SATAC_Zone_Radius))
    end
    
    -- Перерисовываем активную зону
    DrawActiveZone()
    
    MESSAGE:New("ATTACK: SATAC zone radius set to ".. radius .." nautical miles.", 10):ToAll()
end

-- Функция для случайного выбора активной зоны
function SelectRandomZone()
    
    local oldZoneIndex = activeZoneIndex
    chooseSound:ToAll()

    -- Отправляем сообщение о начале процесса выбора
    MESSAGE:New("ATTACK: Initiating new combat zone selection process...", 5):ToAll(nil, 0)
    
    -- Добавляем небольшую задержку для создания эффекта "размышления"
    SCHEDULER:New(nil, function()
        MESSAGE:New("ATTACK: Analyzing tactical situation...", 5):ToAll(nil, 1)
        
        SCHEDULER:New(nil, function()
            MESSAGE:New("ATTACK: Processing weather data and terrain...", 5):ToAll(nil, 2)
            
            SCHEDULER:New(nil, function()
                -- Выбираем случайную зону, отличную от текущей, если у нас больше одной зоны
                if #SATAC_Zones > 1 then
                    MESSAGE:New("ATTACK: We have " .. #SATAC_Zones .. " possible zones. Selecting the optimal one...", 5):ToAll(nil, 2.5)
                    
                    repeat
                        activeZoneIndex = math.random(1, #SATAC_Zones)
                    until activeZoneIndex ~= oldZoneIndex
                    
                    MESSAGE:New("ATTACK: Zone #" .. activeZoneIndex .. " selected! Previous zone was #" .. oldZoneIndex, 5):ToAll(nil, 3)
                else
                    activeZoneIndex = 1
                    MESSAGE:New("ATTACK: Only one zone available. Choice is obvious!", 5):ToAll(nil, 2)
                end
                
                ResetGame()
                
                -- Отрисовываем новую активную зону
                DrawActiveZone()
                
                -- Финальное сообщение с небольшой задержкой
                SCHEDULER:New(nil, function()
                    MESSAGE:New("ATTACK: Zone #" .. activeZoneIndex .. " activated! Everyone take combat positions!", 10):ToAll(nil, 1.5)
                    msrs:PlayText("Attention! New SATAC zone activated! Prepare for combat!", 1)
                end, {}, 2)
                
                -- Обновляем глобальную переменную SATAC_Zone
                SATAC_Zone = SATAC_Zones[activeZoneIndex]
            end, {}, 3)
        end, {}, 3)
    end, {}, 2)

    return SATAC_Zone
end

local function callRestService()
    -- Создаем JSON данные для отправки
    local jsonData = {}
    local jsonString = net.lua2json(jsonData)
    
    -- Настраиваем параметры запроса
    local url = "http://localhost:8080/test"
    local method = "POST"
    local headers = {
        ["Content-Type"] = "application/json",
        ["Content-Length"] = string.len(jsonString)
    }
    
    -- Выполняем HTTP запрос
    local response, status, headers = socket.http.request(url, jsonString, {
        method = method,
        headers = headers
    })
    
    -- Обрабатываем ответ
    if status == 200 then
        env.info("REST запрос выполнен успешно. Ответ: " .. tostring(response))
        return response
    else
        env.info("Ошибка при выполнении REST запроса. Статус: " .. tostring(status))
        return nil
    end
end


-- Создаем меню F10 для выбора случайной зоны
function CreateF10Menu()
    -- Создаем корневое меню для администраторов
    local adminMenu = MENU_MISSION:New("ATTACK Management")
    
    -- Добавляем пункт меню для выбора случайной зоны
    local randomZoneMenu = MENU_MISSION_COMMAND:New("Select random zone", adminMenu, SelectRandomZone)
    
    -- Добавляем пункты меню для управления AWACS
    -- MENU_MISSION_COMMAND:New("Отключить все AWACS", adminMenu, DisableAllAWACS)
    
    -- MENU_MISSION_COMMAND:New("Включить все AWACS", adminMenu, EnableAllAWACS)
    
    -- Добавляем пункт меню для перезапуска миссии
    MENU_MISSION_COMMAND:New("Restart mission", adminMenu, RestartMission)
    
    -- Добавляем подменю для изменения радиуса зоны
    local radiusMenu = MENU_MISSION:New("Change zone radius", adminMenu)

    local sendRestMenu = MENU_MISSION_COMMAND:New("Send REST", adminMenu, callRestService)
    
    -- Добавляем различные варианты радиуса
    local radiusOptions = {10, 20, 30, 40, 50}
    for _, radius in ipairs(radiusOptions) do
        MENU_MISSION_COMMAND:New(radius .. " nautical miles", radiusMenu, function() SetZoneRadius(radius) end)
    end
end

_SETTINGS:SetPlayerMenuOff() -- НЕ УДАЛЯТЬ!!! 
CreateF10Menu()



