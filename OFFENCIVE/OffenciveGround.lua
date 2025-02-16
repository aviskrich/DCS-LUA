-- Убедитесь, что MOOSE, MIST, TIMER и SET_GROUP загружены перед этим скриптом.
if not TIMER then
  require("TIMER")
end
if not SET_GROUP then
  require("SET_GROUP")
end

-- Определяем радиус зоны SATAC в морских милях
local SATAC_Zone_Radius = 7.5  -- Установите желаемый радиус в морских милях
local SATAC_Zone = nil
local BLUE_GROUND_GROUP_NAME = "BlueGround"
local RED_GROUND_GROUP_NAME = "RedGround"
local BLUE_SMOKE_GROUP_NAME = "BlueSmoke"
local RED_SMOKE_GROUP_NAME = "RedSmoke"
local BLUE_GROUND_ZONE = "BlueGroundZone"
local RED_GROUND_ZONE = "RedGroundZone"
local i = 0 -- Счетчик раундов

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
local redPlayerSet = SET_GROUP:New():FilterCoalitions("red"):FilterPrefixes({"off"}):FilterStart()
local bluePlayerSet = SET_GROUP:New():FilterCoalitions("blue"):FilterPrefixes({"off"}):FilterStart()
local redUnitSet = SET_UNIT:New():FilterCoalitions("red"):FilterPrefixes({"off"}):FilterStart()
local blueUnitSet = SET_UNIT:New():FilterCoalitions("blue"):FilterPrefixes({"off"}):FilterStart()
local redGroundSet = SET_GROUP:New():FilterCoalitions("red"):FilterPrefixes(RED_GROUND_GROUP_NAME):FilterStart()
local blueGroundSet = SET_GROUP:New():FilterCoalitions("blue"):FilterPrefixes(BLUE_GROUND_GROUP_NAME):FilterStart()
local redGroundGroup = nil
local blueGroundGroup = nil
local redStaticGroup = nil
local blueStaticGroup = nil

-- Инициализация переменных для отслеживания состояния игры
local gameActive = true
local gameStarted = false
local redEnteredZoneTime = nil
local blueEnteredZoneTime = nil
local startTimer = nil  -- Время, когда игра должна начаться через 120 секунд
local groupsOutsideZone = {}
local redTargetTimer = nil  -- Таймер для красной цели
local blueTargetTimer = nil  -- Таймер для синей цели
local ScoringSession = nil -- Сессия подсчета очков, будет инициализирована позже

msrs = MSRS:New('', 305.00, 0, MSRS.Backend.SRSEXE):SetCoalition(coalition.side.NEUTRAL):SetVoice("ru-RU-Standard-B")

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
        
        redPlayerSet:ForEachGroup(function(group)
            for i = 1, #group:GetUnits() do
                local unit = group:GetUnit( i )
                table.insert(currentPlayers, unit:GetName())
            end  
        end)
        bluePlayerSet:ForEachGroup(function(group)
            for i = 1, #group:GetUnits() do
                local unit = group:GetUnit( i )
                table.insert(currentPlayers, unit:GetName())
            end
        end)
    end
    mist.message.add({
                name = _msgName,
                text = messageText,
                displayTime = duration,
                msgFor = _msgFor,
                sound = _sound
    })   
end

local function SendMessageToParticipants_new(messageText, duration, messageTo, messageName, soundName)
    if (not messageTo or (type(messageTo)=='number' and messageTo == 0)) then
        MESSAGE:New(messageText, duration, "Detailed report"):ToAll()
    elseif (type(messageTo)=='string') then 
        MESSAGE:New(messageText, duration, "Detailed report"):ToUnit(UNIT:FindByName( messageTo ))
    elseif (type(messageTo)=='table') then
        for i, unitName in ipairs(messageTo) do
            local unit = UNIT:FindByName(unitName)
            if unit then
                MESSAGE:New(messageText, duration, messageName):ToUnit(unit)
            end
        end
    end
end

-- Функция для отображения статусной панели с использованием MIST
local function DisplayStatusPanel()

    local redAliveTotal = redUnitSet:CountAlive()
    local blueAliveTotal = blueUnitSet:CountAlive()

    -- Получаем количество живых групп в зоне
    local redUnitsAliveInZone = {}
    redUnitSet:ForEachUnit(function(unit)
        if unit:IsAlive() and unit:IsInZone(SATAC_Zone) then
            table.insert(redUnitsAliveInZone, unit)
        end
    end)

    local blueUnitsAliveInZone = {}
    blueUnitSet:ForEachUnit(function(unit)
        if unit:IsAlive() and unit:IsInZone(SATAC_Zone) then
            table.insert(blueUnitsAliveInZone, unit)
        end
    end)

    local redCountInZone = #redUnitsAliveInZone
    local blueCountInZone = #blueUnitsAliveInZone
    local redScore = 0
    local blueScore = 0

    -- Формируем сообщение статусной панели
    local statusMessage = "OFFENCVIE Status:\n--------------------------------\n"
    if not gameActive then 
        statusMessage = statusMessage .. "Игра перезапускается! Подождите...\n"
    else
        if gameStarted then
            statusMessage = statusMessage .. "Игра началась!\n"
        else
            statusMessage = statusMessage .. "Игра ещё не началась.\n"
        end
    end
    
    -- считаем очки красных
    redScore = 0
    blueScore = 0
    for playerName, val in pairs(ScoringSession.Players) do
        local name = playerName
        if val['UnitCoalition'] == 1 then
            redScore = redScore + val['Score']
        elseif val['UnitCoalition'] == 2 then
            blueScore = blueScore + val['Score']
        end
    end
    
    statusMessage = statusMessage .. string.format("Красные: живых %d, в зоне %d\n",  redAliveTotal, redCountInZone)
    statusMessage = statusMessage .. string.format("Синие: живых %d, в зоне %d\n",  blueAliveTotal, blueCountInZone)
    statusMessage = statusMessage .. "\nСЧЕТ:\n"    
    statusMessage = statusMessage .. string.format("Красные: %d\n", redScore)
    statusMessage = statusMessage .. string.format("Синие: %d\n", blueScore)

    -- Добавляем информацию о времени до начала игры, если применимо
    if not gameStarted and (redEnteredZoneTime ~= nil or blueEnteredZoneTime ~= nil) and startTimer ~= nil then
        local timeRemaining = math.floor(startTimer - timer.getTime())
        if timeRemaining > 0 then
            statusMessage = statusMessage .. string.format("-------------------------------------\nИгра начнётся через %d секунд по таймеру.\n", timeRemaining)
        else
            statusMessage = statusMessage .. "-------------------------------------\nИгра скоро начнётся...\n"
        end
    end
    SendMessageToParticipants(statusMessage, 25, 0, "StatusPanel_")
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

-- Фнукция конструктор системы подсчета очков
local function setScoring() 
    local ScoringObject = SCORING:New("OFFENCVIE"..i)
    i = i + 1
  --configuring messages to the team
    SCORING:SetCoalitionChangePenalty(false)
    SCORING:SetMessagesDestroy(false)
    SCORING:SetMessagesHit(false)
    SCORING:SetMessagesScore(false)
    --SCORING:SetMessagesZone(false)

    SCORING:SetMessagesToCoalition(false)
    SCORING:SetMessagesToAll(false)

    ScoringObject:AddScoreSetGroup(redPlayerSet, 10)
    ScoringObject:AddScoreSetGroup(bluePlayerSet, 10)
    ScoringObject:AddScoreSetGroup(redGroundSet, 30)
    ScoringObject:AddScoreSetGroup(blueGroundSet, 30)
    return ScoringObject
end

-- Функция для сброса игры
local function ResetGame()
    -- Уведомляем игроков о перезапуске игры
    SendMessageToParticipants("Игра будет перезапущена через 20 секунд!", 30, 0, "StatusPanel_")

    -- Пройти по спискам живых юнитов и взорвать их
    -- Красные
    redUnitSet:ForEachUnit(function(unit)
        if unit and unit:IsAlive() then
            unit:Explode(100)
        end
    end)
    -- Синие
    blueUnitSet:ForEachUnit(function(unit)
        if unit and unit:IsAlive() then
            unit:Explode(100)
        end
    end)

    -- Сбрасываем игровые переменные
    TIMER:New(function()
        gameActive = true
        gameStarted = false
        redEnteredZoneTime = nil
        blueEnteredZoneTime = nil
        startTimer = nil
        groupsOutsideZone = {}

        -- Уничтожаем наземные группы redGroundGroup и blueGroundGroup
        local function DestroyGroundGroup(groundGroup)
            if groundGroup then
                for i, unit in ipairs(groundGroup:GetUnits()) do
                    if unit then
                        unit:Explode(100)
                    end
                end
                groundGroup:Destroy()
            end
            return nil
        end
        

        redGroundGroup = DestroyGroundGroup(redGroundGroup)
        blueGroundGroup = DestroyGroundGroup(blueGroundGroup)
        DestroyGroundGroup(GROUP:FindByName(RED_SMOKE_GROUP_NAME))
        DestroyGroundGroup(GROUP:FindByName(BLUE_SMOKE_GROUP_NAME))      
        
        ScoringSession = setScoring()

        SendMessageToParticipants("Игра перезапущена", 10, 0, "StatusPanel_")
    end):Start(20, nil)
end

-- Функция для проверки состояния игры и обработки логики
local function CheckGroupsInZone()
    if not gameActive then
        return
    end
    
    -- Как только игра началась, создаем наземные группы
    if redGroundGroup == nil then
        local spawnRedGround = SPAWN:New(RED_GROUND_GROUP_NAME)
        redGroundGroup = spawnRedGround:SpawnInZone(ZONE:FindByName(RED_GROUND_ZONE), true)
        redGroundGroup:GetCoordinate():SmokeRed()
        -- redStaticGroup = SPAWNSTATIC:NewFromStatic(BLUE_SMOKE_GROUP_NAME):SpawnFromPointVec2(redGroundGroup:GetPointVec2())
    end
    if blueGroundGroup == nil then
        local spawnBlueGround = SPAWN:New(BLUE_GROUND_GROUP_NAME)
        blueGroundGroup = spawnBlueGround:SpawnInZone(ZONE:FindByName(BLUE_GROUND_ZONE), true)
        blueGroundGroup:GetCoordinate():SmokeBlue()
        -- blueStaticGroup = SPAWNSTATIC:NewFromStatic(RED_SMOKE_GROUP_NAME):SpawnFromPointVec2(blueGroundGroup:GetPointVec2())
    end

    -- Обновляем списки живых групп в зоне
    local redUnitsAliveInZone = {}
    redUnitSet:ForEachUnit(function(unit)
        if unit and unit:IsAlive() then
            if unit:IsInZone(SATAC_Zone) then
                table.insert(redUnitsAliveInZone, unit)
            end
        end
    end)

    local blueUnitsAliveInZone = {}
    blueUnitSet:ForEachUnit(function(unit)
        if unit and unit:IsAlive() then
            if unit:IsInZone(SATAC_Zone) then
                table.insert(blueUnitsAliveInZone, unit)
            end
        end
    end)

    local redCount = #redUnitsAliveInZone
    local blueCount = #blueUnitsAliveInZone

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
                msrs:PlayText("Игра началась!", 1)
                SendMessageToParticipants("Игра началась! Все самолёты вошли в зону.", 10)         
                USERSOUND:New("top-gun-bell.ogg"):ToAll()                
            else
                -- Запускаем таймер на 120 секунд
                if startTimer == nil then
                    startTimer = math.max(redEnteredZoneTime or 0, blueEnteredZoneTime or 0) + 120
                    msrs:PlayText("Как минимум один самолет с каждой стороны зашел в зону. Таймер старта игры запущен! До старта 2 минуты!", 2)
                end
                if timer.getTime() >= startTimer then
                    gameStarted = true
                    msrs:PlayText("Игра началась!", 1)
                    USERSOUND:New("top-gun-bell.ogg"):ToAll()
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
                        if group:GetUnits()[1]:GetPlayerName() ~= nil then
                            SendMessageToParticipants(string.format("%s покинул зону. У него есть %i секунд, чтобы вернуться!", group:GetUnits()[1]:GetPlayerName(), groupsOutsideZone[groupName] - timer.getTime()), 
                            10, 
                            group:GetUnits()[1]:GetName(),
                            "OutsideWarning_" .. groupName)
                            USERSOUND:New("warning.wav"):ToGroup(GROUP:FindByName( groupName ))
                        end
                    else
                        -- Отправляем сообщение группе
                        if group:GetUnits()[1]:GetPlayerName() ~= nil then
                            SendMessageToParticipants(string.format("%s покинул зону. У него есть %i секунд, чтобы вернуться!", group:GetUnits()[1]:GetPlayerName(), groupsOutsideZone[groupName] - timer.getTime()), 
                            10, 
                            group:GetUnits()[1]:GetName(),
                            "OutsideWarning_" .. groupName)
                            USERSOUND:New("warning.wav"):ToGroup(GROUP:FindByName( groupName ))
                        end
                        if timer.getTime() >= groupsOutsideZone[groupName] then
                            group:Explode(100)                            
                            groupsOutsideZone[groupName] = nil
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
                        if group:GetUnits()[1]:GetPlayerName() ~= nil then
                            SendMessageToParticipants(string.format("%s покинул зону. У него есть %i секунд, чтобы вернуться!", group:GetUnits()[1]:GetPlayerName(), groupsOutsideZone[groupName] - timer.getTime()), 
                            10, 
                            group:GetUnits()[1]:GetName(),
                            "OutsideWarning_" .. groupName)     
                            USERSOUND:New("warning.wav"):ToGroup(GROUP:FindByName( groupName ))                   
                        end
                    else
                        -- Отправляем сообщение группе
                        if group:GetUnits()[1]:GetPlayerName() ~= nil then
                            SendMessageToParticipants(string.format("%s покинул зону. У него есть %i секунд, чтобы вернуться!", group:GetUnits()[1]:GetPlayerName(), groupsOutsideZone[groupName] - timer.getTime()), 
                            10, 
                            group:GetUnits()[1]:GetName(),
                            "OutsideWarning_" .. groupName)
                            USERSOUND:New("warning.wav"):ToGroup(GROUP:FindByName( groupName))
                        end
                        if timer.getTime() >= groupsOutsideZone[groupName] then
                            group:Explode(100)
                            groupsOutsideZone[groupName] = nil
                        end
                    end
                end
            end
        end)

        -- Проверяем условия победы
        if gameActive then
            redCount = #redUnitsAliveInZone
            blueCount = #blueUnitsAliveInZone

            ---- МЕНЯЕМ УСЛОВИЯ ПОБЕДЫ: ПОСЛЕ СМЕРТИ ВСЕХ САМОЛЕТОВ ОДНОЙ КОАЛИЦИИ СТАРТУЕТ ТАЙМЕР НА 2 МИНУТЫ, ЧТОБЫ УНИЧТОЖИТЬ ГРУЗОВИК
            ---  ЕСЛИ ГРУЗОВИК УНИЧТОЖЕН, ТО ПОБЕДА
            if redCount > 0 and blueCount == 0 then
                local blueHasGroupsWithTime = AreGroupsOutsideZoneWithTimeRemaining(bluePlayerSet)
                if not blueHasGroupsWithTime then
                    if not redTargetTimer then
                        redTargetTimer = timer.getTime() + 120
                        SendMessageToParticipants("У Красных есть " .. math.floor(redTargetTimer - timer.getTime()) .. " секунд, чтобы уничтожить наземную цель!", 30, 0, "TargetTimer_")
                    elseif timer.getTime() < redTargetTimer and blueGroundGroup:IsAlive() then
                        SendMessageToParticipants("У Красных есть " .. math.floor(redTargetTimer - timer.getTime()) .. " секунд, чтобы уничтожить наземную цель!", 30, 0, "TargetTimer_")
                    elseif timer.getTime() >= redTargetTimer or not blueGroundGroup:IsAlive() then                                            
                        SendMessageToParticipants("OFFENCVIE: Раунд завершен, подсчет очков! Покиньте слот!", 30, 0, "TargetTimer_")
                        USERSOUND:New("win-game-sound.ogg"):ToAll()                        
                    
                        gameActive = false
                        redTargetTimer = nil

                        ResetGame()
                    end
                end
            elseif blueCount > 0 and redCount == 0 then
                local redHasGroupsWithTime = AreGroupsOutsideZoneWithTimeRemaining(redPlayerSet)
                if not redHasGroupsWithTime then
                    if not blueTargetTimer then
                        blueTargetTimer = timer.getTime() + 120                       
                        SendMessageToParticipants("У Синих есть " .. math.floor(blueTargetTimer - timer.getTime()) .. " секунд, чтобы уничтожить наземную цель!", 30, 0, "TargetTimer_")
                    elseif timer.getTime() < blueTargetTimer and redGroundGroup:IsAlive() then
                        SendMessageToParticipants("У Синих есть " .. math.floor(blueTargetTimer - timer.getTime()) .. " секунд, чтобы уничтожить наземную цель!", 30, 0, "TargetTimer_")
                    elseif timer.getTime() >= blueTargetTimer or not redGroundGroup:IsAlive() then                        
                        SendMessageToParticipants("OFFENCVIE: Раунд завершен, подсчет очков! Покиньте слот!", 30, 0, "TargetTimer_")
                        USERSOUND:New("win-game-sound.ogg"):ToAll()
                        
                        gameActive = false
                        blueTargetTimer = nil

                        ResetGame()
                    end
                end
            elseif redCount == 0 and blueCount == 0 then
                -- Проверяем, есть ли живые группы с неистёкшим таймером
                local redHasGroupsWithTime = AreGroupsOutsideZoneWithTimeRemaining(redPlayerSet)
                local blueHasGroupsWithTime = AreGroupsOutsideZoneWithTimeRemaining(bluePlayerSet)

                if not redHasGroupsWithTime and not blueHasGroupsWithTime then
                    -- Ничья
                    -- SendMessageToParticipants("OFFENCVIE: Ничья! Все самолёты были уничтожены.", 30, 0)
                    MESSAGE:New("OFFENCVIE: Раунд завершен, подсчет очков! Покиньте слот!", 30):ToAll()
                    USERSOUND:New("win-game-sound.ogg"):ToAll()
                    msrs:PlayText("В раунде OFFENCVIE ничья!", 1)
                    gameActive = false
                    blueTargetTimer = nil
                    redTargetTimer = nil
                    -- Запускаем сброс игры
                    ResetGame()
                end
            end
        end
    end
end

--- ДОБАВИТЬ СЧЕТЧИК ОЧКОВ И ВЫВОДИТЬ ЕГО НА ПАНЕЛЬ
--- 
ScoringSession = setScoring()

-- Планировщик для регулярной проверки состояния игры
SCHEDULER:New(nil, CheckGroupsInZone, {}, 0, 2)

-- Планировщик для обновления статусной панели каждые 5 секунд
SCHEDULER:New(nil, DisplayStatusPanel, {}, 0, 2)

---------------------------------------------------
-- ОБРАБОТКА СООБЩЕНИЙ ЧАТА ДЛЯ НАСТРОЙКИ МИССИИ --
---------------------------------------------------

-- Функция для перезапуска миссии
function RestartMission()
    -- Отправляем сообщение всем игрокам
    MESSAGE:New("Миссия будет перезапущена через 5 секунд.", 5):ToAll()

    -- Задержка перед перезапуском миссии
    TIMER:New(function()
        trigger.action.setUserFlag("9001", true)
    end):Start(5)
end

function SetZoneRadius(radius)
    SATAC_Zone_Radius = radius
    SATAC_Zone:UndrawZone()
    SATAC_Zone:SetRadius(UTILS.NMToMeters(SATAC_Zone_Radius))
    SATAC_Zone:DrawZone(-1, {1,0,0})
    MESSAGE:New("Радиус зоны OFFENCVIE установлен в ".. radius .." морских миль.", 10):ToAll()
end

-- Создание меню управления миссией
CommandMenu = MENU_MISSION:New("Управление миссией")
EnableAWACSCommand = MENU_MISSION_COMMAND:New("Зона - 30", CommandMenu, SetZoneRadius, 15)
EnableAWACSCommand = MENU_MISSION_COMMAND:New("Зона - 60", CommandMenu, SetZoneRadius, 30)
RestartMissionDayCommand = MENU_MISSION_COMMAND:New("Перезапуск миссии", CommandMenu, RestartMission)

