-- Убедитесь, что MOOSE и MIST загружены перед этим скриптом.

-- Определяем радиус зоны SATAC в морских милях
local SATAC_Zone_Radius = 50  -- Установите желаемый радиус в морских милях

-- Создаём зону на основе статического объекта "SATAC_Center"
local centerStatic = StaticObject.getByName("SATAC_Center")
if centerStatic then
    local centerCoordinate = COORDINATE:NewFromVec3(centerStatic:getPoint())
    -- Создаём зону SATAC используя ZONE_RADIUS
    SATAC_Zone = ZONE_RADIUS:New("SATAC_ZONE", centerCoordinate:GetVec2(), UTILS.NMToMeters(SATAC_Zone_Radius))
    :DrawZone(-1, {1,0,0})
else
    env.error("Static object 'SATAC_Center' not found!")
    return  -- Останавливаем скрипт, если объект не найден
end

-- Создание наборов групп для каждой коалиции
redPlayerSet = SET_GROUP:New():FilterCoalitions("red"):FilterPrefixes({"=SATAC=", "Sochi", "Сочи"}):FilterStart()
bluePlayerSet = SET_GROUP:New():FilterCoalitions("blue"):FilterPrefixes({"=SATAC=", "Mozdok", "Моздок"}):FilterStart()

-- Инициализация переменных для отслеживания состояния игры
local gameActive = true
local gameStarted = false
local redEnteredZoneTime = nil
local blueEnteredZoneTime = nil
local startTimer = nil  -- Время, когда игра должна начаться через 120 секунд
local groupsOutsideZone = {}

-- Функция для отправки сообщений только участвующим группам с использованием MIST
local function SendMessageToParticipants(messageText, duration, messageTo)
    duration = duration or 10
    local _msgFor = nil
    if (type(messageTo)=='string') then 
        _msgFor = {units = {messageTo}}
    elseif (type(messageTo)=='table') then
        _msgFor = {units = messageTo}
    end

    local currentPlayerUnitNames = {}
    redPlayerSet:ForEachGroup(function(group)
        for i = 1, #group:GetUnits() do
            local unit = group:GetUnit( i )
            table.insert(currentPlayerUnitNames, unit:GetName())
        end  
    end)
    bluePlayerSet:ForEachGroup(function(group)
        for i = 1, #group:GetUnits() do
            local unit = group:GetUnit( i )
            table.insert(currentPlayerUnitNames, unit:GetName())
        end
    end)
    mist.message.add({
                name = 'SATAC Status',
                text = messageText,
                displayTime = duration,
                msgFor = _msgFor
    })
end

-- Функция для отображения статусной панели с использованием MIST
local function DisplayStatusPanel()
    local redAliveTotal = redPlayerSet:CountAlive()
    local blueAliveTotal = bluePlayerSet:CountAlive()

    -- Получаем количество живых групп в зоне
    local redGroupsAliveInZone = {}
    redPlayerSet:ForEachGroup(function(group)
        if group:IsAlive() and group:IsCompletelyInZone(SATAC_Zone) then
            table.insert(redGroupsAliveInZone, group)
        end
    end)

    local blueGroupsAliveInZone = {}
    bluePlayerSet:ForEachGroup(function(group)
        if group:IsAlive() and group:IsCompletelyInZone(SATAC_Zone) then
            table.insert(blueGroupsAliveInZone, group)
        end
    end)

    local redCountInZone = #redGroupsAliveInZone
    local blueCountInZone = #blueGroupsAliveInZone

    -- Формируем сообщение статусной панели
    local statusMessage = "SATAC 2.0 Status:\n--------------------------------\n"
    if gameStarted then
        statusMessage = statusMessage .. "Игра началась!\n"
    else
        statusMessage = statusMessage .. "Игра ещё не началась.\n"
    end

    statusMessage = statusMessage .. string.format("Красные: живых %d, в зоне %d\n",  redAliveTotal, redCountInZone)
    statusMessage = statusMessage .. string.format("Синие: живых %d, в зоне %d\n",  blueAliveTotal, blueCountInZone)

    -- Добавляем информацию о времени до начала игры, если применимо
    if not gameStarted and redEnteredZoneTime ~= nil and blueEnteredZoneTime ~= nil and startTimer ~= nil then
        local timeRemaining = math.floor(startTimer - timer.getTime())
        if timeRemaining > 0 then
            statusMessage = statusMessage .. string.format("Игра начнётся через %d секунд.\n", timeRemaining)
        else
            statusMessage = statusMessage .. "Игра скоро начнётся...\n"
        end
    end

    -- Отправляем статусную панель только участникам с использованием MIST
    local currentPlayerUnitNames = {}
    redPlayerSet:ForEachGroup(function(group)
        for i = 1, #group:GetUnits() do
            local unit = group:GetUnit( i )
            table.insert(currentPlayerUnitNames, unit:GetName())
        end
    end)
    bluePlayerSet:ForEachGroup(function(group)
        for i = 1, #group:GetUnits() do
            local unit = group:GetUnit( i )
            table.insert(currentPlayerUnitNames, unit:GetName())
        end
    end)
    mist.message.add({
        text = statusMessage,
        displayTime = 25,
        msgFor = {units = currentPlayerUnitNames},
        name = "StatusPanel_"
    })
end

-- Функция для проверки наличия живых групп вне зоны с неистёкшим таймером
local function AreGroupsOutsideZoneWithTimeRemaining(_GroupSet)
    local playerSet = _GroupSet
    -- if coalitionSide == coalition.side.RED then
    --     playerSet = redPlayerSet
    -- elseif coalitionSide == coalition.side.BLUE then
    --     playerSet = bluePlayerSet
    -- else
    --     return false
    -- end

    local hasGroupsWithTime = false
    playerSet:ForEachGroup(function(group)
        if group and group:IsAlive() then
            local groupName = group:GetName()
            if not group:IsCompletelyInZone(SATAC_Zone) then
                local timeRemaining = groupsOutsideZone[groupName] and (groupsOutsideZone[groupName] - timer.getTime()) or nil
                if timeRemaining and timeRemaining > 0 then
                    hasGroupsWithTime = true
                end
            end
        end
    end)
    return hasGroupsWithTime
end

-- Функция для сброса игры
local function ResetGame()
    -- Уведомляем игроков о перезапуске игры
    SendMessageToParticipants("Игра будет перезапущена через 30 секунд!", 30)

    -- Сбрасываем игровые переменные
    gameActive = true
    gameStarted = false
    redEnteredZoneTime = nil
    blueEnteredZoneTime = nil
    startTimer = nil
    groupsOutsideZone = {}

    -- Очищаем статусную панель для всех групп
    redPlayerSet:ForEachGroup(function(group)
        local groupName = group:GetName()
        mist.message.removeByName("StatusPanel_" .. groupName)
    end)
    bluePlayerSet:ForEachGroup(function(group)
        local groupName = group:GetName()
        mist.message.removeByName("StatusPanel_" .. groupName)
    end)

    -- Запланировать уведомление о начале нового раунда через 30 секунд
    SCHEDULER:New(nil, function()
        -- Уведомляем игроков о начале нового раунда
        SendMessageToParticipants("Новый раунд начался! Возвращайтесь в бой.", 10)
    end, {}, 30)
end

-- Функция для проверки состояния игры и обработки логики
local function CheckGroupsInZone()
    if not gameActive then
        return
    end

    -- Обновляем списки живых групп в зоне
    local redGroupsAliveInZone = {}
    redPlayerSet:ForEachGroup(function(group)
        if group and group:IsAlive() then
            if group:IsCompletelyInZone(SATAC_Zone) then
                table.insert(redGroupsAliveInZone, group)
            end
        end
    end)

    local blueGroupsAliveInZone = {}
    bluePlayerSet:ForEachGroup(function(group)
        if group and group:IsAlive() then
            if group:IsCompletelyInZone(SATAC_Zone) then
                table.insert(blueGroupsAliveInZone, group)
            end
        end
    end)

    local redCount = #redGroupsAliveInZone
    local blueCount = #blueGroupsAliveInZone

    local redAliveTotal = redPlayerSet:CountAlive()
    local blueAliveTotal = bluePlayerSet:CountAlive()

    local allRedInZone = (redCount == redAliveTotal) and (redAliveTotal > 0)
    local allBlueInZone = (blueCount == blueAliveTotal) and (blueAliveTotal > 0)

    -- Логика начала игры
    if not gameStarted then
        -- Обновляем время входа первых групп
        if redCount > 0 and redEnteredZoneTime == nil then
            redEnteredZoneTime = timer.getTime()
        end
        if blueCount > 0 and blueEnteredZoneTime == nil then
            blueEnteredZoneTime = timer.getTime()
        end

        if redEnteredZoneTime ~= nil and blueEnteredZoneTime ~= nil then
            if allRedInZone and allBlueInZone then
                -- Все группы обеих сторон в зоне
                gameStarted = true
                SendMessageToParticipants("Игра началась! Все самолёты вошли в зону.", 10)
            else
                -- Запускаем таймер на 120 секунд
                if startTimer == nil then
                    startTimer = math.max(redEnteredZoneTime, blueEnteredZoneTime) + 120
                end
                if timer.getTime() >= startTimer then
                    gameStarted = true
                    SendMessageToParticipants("Игра началась! 120 секунд прошло после входа первых самолётов обеих сторон.", 10)
                end
            end
        end
    end

    -- Обрабатываем логику игры только после начала игры
    if gameStarted then
        -- Проверяем красные группы
        redPlayerSet:ForEachGroup(function(group)
            if group and group:IsAlive() then
                local groupName = group:GetName()
                if group:IsCompletelyInZone(SATAC_Zone) then
                    -- Группа в зоне, сбрасываем таймер
                    groupsOutsideZone[groupName] = nil
                else
                    -- Группа вне зоны
                    if not groupsOutsideZone[groupName] then
                        groupsOutsideZone[groupName] = timer.getTime() + 60
                        -- Отправляем сообщение группе
                        mist.message.add({
                            text = groupName .. " покинул зону. У него есть 60 секунд, чтобы вернуться!",
                            displayTime = 10,
                            msgFor = {groups = {groupName}},
                            name = "OutsideWarning_" .. groupName
                        })
                    else
                        if timer.getTime() >= groupsOutsideZone[groupName] then
                            group:Explode(100)
                            SendMessageToParticipants(groupName .. " не вернулся в зону и был уничтожен!", 10)
                            groupsOutsideZone[groupName] = nil
                            mist.message.removeByName("OutsideWarning_" .. groupName)
                        end
                    end
                end
            end
        end)

        -- Проверяем синие группы
        bluePlayerSet:ForEachGroup(function(group)
            if group and group:IsAlive() then
                local groupName = group:GetName()
                if group:IsCompletelyInZone(SATAC_Zone) then
                    groupsOutsideZone[groupName] = nil
                else
                    if not groupsOutsideZone[groupName] then
                        groupsOutsideZone[groupName] = timer.getTime() + 60
                        -- Отправляем сообщение группе
                        mist.message.add({
                            text = groupName .. " покинул зону. У него есть 60 секунд, чтобы вернуться!",
                            displayTime = 10,
                            msgFor = {groups = {groupName}},
                            name = "OutsideWarning_" .. groupName
                        })
                    else
                        if timer.getTime() >= groupsOutsideZone[groupName] then
                            group:Explode(100)
                            SendMessageToParticipants(groupName .. " не вернулся в зону и был уничтожен!", 10)
                            groupsOutsideZone[groupName] = nil
                            mist.message.removeByName("OutsideWarning_" .. groupName)
                        end
                    end
                end
            end
        end)

        -- Проверяем условия победы
        if gameActive then
            redCount = #redGroupsAliveInZone
            blueCount = #blueGroupsAliveInZone

            if redCount > 0 and blueCount == 0 then
                local blueHasGroupsWithTime = AreGroupsOutsideZoneWithTimeRemaining(bluePlayerSet)
                if not blueHasGroupsWithTime then
                    -- Красные победили
                    SendMessageToParticipants("Красная коалиция победила!", 30)
                    gameActive = false
                    -- Запускаем сброс игры
                    ResetGame()
                end
            elseif blueCount > 0 and redCount == 0 then
                local redHasGroupsWithTime = AreGroupsOutsideZoneWithTimeRemaining(redPlayerSet)
                if not redHasGroupsWithTime then
                    -- Синие победили
                    SendMessageToParticipants("Синяя коалиция победила!", 30)
                    gameActive = false
                    -- Запускаем сброс игры
                    ResetGame()
                end
            elseif redCount == 0 and blueCount == 0 then
                -- Проверяем, есть ли живые группы с неистёкшим таймером
                local redHasGroupsWithTime = AreGroupsOutsideZoneWithTimeRemaining(redPlayerSet)
                local blueHasGroupsWithTime = AreGroupsOutsideZoneWithTimeRemaining(bluePlayerSet)

                if not redHasGroupsWithTime and not blueHasGroupsWithTime then
                    -- Ничья
                    SendMessageToParticipants("Ничья! Все самолёты были уничтожены.", 30)
                    gameActive = false
                    -- Запускаем сброс игры
                    ResetGame()
                end
            end
        end
    end
end

-- Планировщик для регулярной проверки состояния игры
SCHEDULER:New(nil, CheckGroupsInZone, {}, 0, 1)

-- Планировщик для обновления статусной панели каждые 5 секунд
SCHEDULER:New(nil, DisplayStatusPanel, {}, 0, 5)