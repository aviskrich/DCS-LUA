Arena = {}
Arena.__index = Arena

-- Обработчик событий
EventHandler = {}
-- Функция для создания прогресс-бара
local function createProgressBar(part, total, barLength)
    if total == 0 then
        return string.rep("□", barLength)
    end
    local filled = math.floor((part / total) * barLength)
    local empty = barLength - filled
    return string.rep("■", filled) .. string.rep("□", empty)
end
-- Конструктор для арены
function Arena:new(name)
    local instance = setmetatable({}, Arena)
    instance.name = name
    instance.bluePlayers = {}  -- Список игроков синих
    instance.redPlayers = {}   -- Список игроков красных
    instance.bluePlayersCount = 0  -- Храним количество игроков синих
    instance.redPlayersCount = 0   -- Храним количество игроков красных
    instance.blueMissiles = {}  -- Ракеты синих
    instance.redMissiles = {}   -- Ракеты красных
    return instance
end

local function isInRange(value, lowerBound, upperBound)
    return value >= lowerBound and value <= upperBound
end

-- Функция для добавления ботов на арену, используя имя арены
function Arena:addBots()
    -- Функция для поиска игроков, чьи имена начинаются с имени арены
    local function findBotByArenaName(namePrefix)
        -- Перебираем все группы воздушных юнитов синей стороны
        local airGroups = coalition.getGroups(coalition.side.BLUE, Group.Category.AIRPLANE)
        for _, group in ipairs(airGroups) do
            if string.find(group:getName(), namePrefix) then  -- Ищем группы, начинающиеся с имени арены
                local groupUnits = group:getUnits()  -- Получаем юнитов из группы
                for _, unit in ipairs(groupUnits) do
                    -- Проверяем, если getPlayerName вернул nil, значит это бот
                    if not unit:getPlayerName() then
                        self:addPlayer(unit)  -- Добавляем юнита на арену
                        env.info("[ARENA] Added bot: " .. unit:getName())
                    else
                        self:addPlayer(unit)
                    end
                end
            end
        end

        -- Повторяем то же самое для красной стороны
        airGroups = coalition.getGroups(coalition.side.RED, Group.Category.AIRPLANE)
        for _, group in ipairs(airGroups) do
            if string.find(group:getName(), namePrefix) then  -- Ищем группы, начинающиеся с имени арены
                local groupUnits = group:getUnits()  -- Получаем юнитов из группы
                for _, unit in ipairs(groupUnits) do
                    -- Проверяем, если getPlayerName вернул nil, значит это бот
                    if not unit:getPlayerName() then
                        self:addPlayer(unit)  -- Добавляем юнита на арену
                        env.info("[ARENA] Added bot: " .. unit:getName())
                    end
                end
            end
        end
    end

    -- Используем имя арены (например, BVR#1) для поиска ботов
    findBotByArenaName(self.name)  -- self.name содержит имя арены (например, "BVR#1")
end

function Arena:addMissile(unit, weapon)
    local ownerName = unit:getName()  -- Получаем имя владельца ракеты (игрока)
    local weaponType = weapon:getTypeName()  -- Получаем тип ракеты

    -- Инициализация счетчика ракет для конкретного игрока и типа
    if not self.missileCounters then
        self.missileCounters = {}  -- Счетчики по каждому игроку
    end

    if not self.missileCounters[ownerName] then
        self.missileCounters[ownerName] = {}  -- Инициализация счетчика для игрока
    end

    if not self.missileCounters[ownerName][weaponType] then
        self.missileCounters[ownerName][weaponType] = 0  -- Инициализация счетчика для типа ракеты
    end

    -- Увеличиваем счетчик для данного типа ракеты у игрока
    self.missileCounters[ownerName][weaponType] = self.missileCounters[ownerName][weaponType] + 1
    local missileID = ownerName .. " " .. weaponType .. " " .. self.missileCounters[ownerName][weaponType]  -- Генерация уникального ID ракеты

    -- Проверка на существование оружия
    if weapon and weapon:isExist() then
        local startPos = weapon:getPoint()  -- Получаем координаты старта ракеты

        -- Проверяем, что startPos не nil
        if startPos then
            -- Создаём структуру для хранения информации о ракете
            local missileData = {
                owner = ownerName,
                weapon = weapon,
                startPos = startPos,  -- Сохраняем координаты запуска ракеты
                previousPos = nil,     -- Будет заполнено в процессе отслеживания
                currentPos = startPos,  -- Инициализируем текущую позицию как стартовую
                prevRelativeSpeed = 0
            }

            -- Проверяем, какой стороне принадлежит игрок
            if self.bluePlayers[ownerName] then
                self.blueMissiles[missileID] = missileData  -- Добавляем ракету в список синих
                env.info("[ARENA] Blue missile added: " .. weapon:getTypeName() .. " from " .. ownerName)
            elseif self.redPlayers[ownerName] then
                self.redMissiles[missileID] = missileData  -- Добавляем ракету в список красных
                env.info("[ARENA] Red missile added: " .. weapon:getTypeName() .. " from " .. ownerName)
            end
        else
            env.error("[ERROR] Missile start position is nil for " .. weapon:getTypeName() .. " from " .. ownerName)
        end
    else
        env.error("[ERROR] Attempting to add a non-existing missile.")  -- Если ракета не существует, выводим ошибку
    end

    self:printAllMissiles()  -- Выводим список всех ракет
end

-- Метод для добавления игрока
function Arena:addPlayer(unit)
    if not unit or not unit:getName() then
        env.error("[ERROR] Attempt to add nil or unnamed unit")
        return
    end

    local unitName = unit:getName()
    local coalition = unit:getCoalition()  
    local side

    if coalition == 2 then
        side = "blue"  
    elseif coalition == 1 then
        side = "red"   
    else
        env.error("[ERROR] Unknown coalition for unit: " .. unitName)
        return
    end

    local player = { 
        unit = unit, 
        missiles = {}  -- Таблица для ракет, нацеленных на этого игрока
    }

    if side == "blue" then
        if not self.bluePlayers[unitName] then  -- Проверяем, чтобы не добавлять дубликаты
            self.bluePlayers[unitName] = player
            self.bluePlayersCount = self.bluePlayersCount + 1  -- Увеличиваем счетчик
        end
    else
        if not self.redPlayers[unitName] then
            self.redPlayers[unitName] = player
            self.redPlayersCount = self.redPlayersCount + 1  -- Увеличиваем счетчик
        end
    end

    env.info("[ARENA] Player added: " .. unitName .. " (" .. side .. ")")
end

-- Метод для удаления несуществующих игроков
function Arena:removeNonExistingPlayers()
    local function removePlayerFromSide(sidePlayers)
        local removedCount = 0
        for unitName, player in pairs(sidePlayers) do
            if not player.unit or not player.unit:isExist() then
                env.info("[ARENA] Removing non-existing player: " .. unitName)
                sidePlayers[unitName] = nil
                removedCount = removedCount + 1
            end
        end
        return removedCount
    end

    -- Удаляем несуществующих игроков и корректируем счетчики
    self.bluePlayersCount = self.bluePlayersCount - removePlayerFromSide(self.bluePlayers)
    self.redPlayersCount = self.redPlayersCount - removePlayerFromSide(self.redPlayers)

    self:printAllPlayers()
end

-- Метод для удаления ракеты по её ID
function Arena:removeMissileByID(missileID)
    local function removeMissileFromPlayers(playerList)
        for _, player in pairs(playerList) do
            if player.missiles and player.missiles[missileID] then
                player.missiles[missileID] = nil
                env.info("[ARENA] Missile " .. missileID .. " removed from player.")
            end
        end
    end

    -- Удаляем ракету из глобальных таблиц активных ракет
    if self.blueMissiles[missileID] then
        env.info("[ARENA] Blue missile removed: " .. missileID)
        self.blueMissiles[missileID] = nil
        removeMissileFromPlayers(self.bluePlayers)
        removeMissileFromPlayers(self.redPlayers)  -- Если ракета может быть в списке игрока другой стороны
    elseif self.redMissiles[missileID] then
        env.info("[ARENA] Red missile removed: " .. missileID)
        self.redMissiles[missileID] = nil
        removeMissileFromPlayers(self.bluePlayers)
        removeMissileFromPlayers(self.redPlayers)
    else
        env.warn("[ARENA] Missile ID not found: " .. missileID)
    end

    -- Выводим обновленный список ракет
    self:printAllMissiles()
end


local function getMissileTrackingData(missile, aircraft)
    if not missile.weapon or not missile.weapon:isExist() or not aircraft or not aircraft:isExist() then
        return {
            missileAngle = 0,
            distanceToPlayer = 0,
            relativeSpeed = 0,
            missileSpeed = 0,
            aircraftSpeed = 0,
            targetInfo = "Нет захвата",
            missileHeight = 0,
            aircraftHeight = 0,
            timeToDeath = math.huge,
            relativeAcceleration = 0,
            deltaTimeToDeath = 0,
            points = 0,
        }
    end

    -- Получаем текущие скорости и позиции
    local vMissile = missile.weapon:getVelocity()
    local vAircraft = aircraft:getVelocity()
    local missilePos = missile.weapon:getPoint()
    local aircraftPos = aircraft:getPoint()

    -- Вектор расстояния между самолетом и ракетой
    local dx = missilePos.x - aircraftPos.x
    local dy = missilePos.y - aircraftPos.y
    local dz = missilePos.z - aircraftPos.z
    local distance = math.sqrt(dx^2 + dy^2 + dz^2)

    -- Скорости
    local missileSpeed = math.sqrt(vMissile.x^2 + vMissile.y^2 + vMissile.z^2)
    local aircraftSpeed = math.sqrt(vAircraft.x^2 + vAircraft.y^2 + vAircraft.z^2)

    -- Вектор относительной скорости
    local rvX = vMissile.x - vAircraft.x
    local rvY = vMissile.y - vAircraft.y
    local rvZ = vMissile.z - vAircraft.z
    local relativeSpeed = math.sqrt(rvX^2 + rvY^2 + rvZ^2)

    -- Рассчитываем относительное ускорение
    local relativeAcceleration = 0
    if missile.prevRelativeSpeed ~= nil then
        local deltaSpeed = relativeSpeed - missile.prevRelativeSpeed
        relativeAcceleration = deltaSpeed / 0.1  
    end
    missile.prevRelativeSpeed = relativeSpeed

    -- Время до возможного удара
    local timeToDeath = math.huge
    if relativeAcceleration ~= 0 then
        local discriminant = relativeSpeed^2 + 2 * relativeAcceleration * distance
        if discriminant >= 0 then
            local t1 = (-relativeSpeed + math.sqrt(discriminant)) / relativeAcceleration
            local t2 = (-relativeSpeed - math.sqrt(discriminant)) / relativeAcceleration
    
            if t1 > 0 and t2 > 0 then
                timeToDeath = math.min(t1, t2)
            elseif t1 > 0 then
                timeToDeath = t1
            elseif t2 > 0 then
                timeToDeath = t2
            end
        end
    elseif relativeSpeed > 0 then
        timeToDeath = distance / relativeSpeed
    end

    -- Изменение времени до смерти (первая производная)
    local prevTimeToDeath = missile.prevTimeToDeath or timeToDeath
    local deltaTimeToDeath = prevTimeToDeath - timeToDeath
    missile.prevTimeToDeath = timeToDeath

    -- Начисление очков в зависимости от timeToDeath
    local points = 0
    if timeToDeath == math.huge then
        points = 0
    elseif timeToDeath > 15 then
        points = 1
    else
        points = 1 + (15 - timeToDeath) / 15
    end

    -- Ограничиваем диапазон очков
    points = math.max(0, math.min(2, points))

    -- Логирование
    env.info(string.format(
        "[MISSILE DEBUG] \n" ..
        "TimeToDeath: %.2f сек\n" ..
        "PrevTimeToDeath: %.2f сек\n" ..
        "ΔTimeToDeath: %.2f сек (Первая производная)\n" ..
        "Очки за ракету: %.2f\n",
        timeToDeath, prevTimeToDeath, deltaTimeToDeath, points
    ))

    -- Цель ракеты
    local target = missile.weapon:getTarget()
    local targetInfo = target and target:getName() or "Нет захвата"

    return {
        missileAngle = 0,
        distanceToPlayer = distance,
        relativeSpeed = relativeSpeed,
        missileSpeed = missileSpeed,
        aircraftSpeed = aircraftSpeed,
        targetInfo = targetInfo,
        missileHeight = missilePos.y,
        aircraftHeight = aircraftPos.y,
        timeToDeath = timeToDeath,
        relativeAcceleration = relativeAcceleration,
        deltaTimeToDeath = deltaTimeToDeath,
        points = points
    }
end


function Arena:notifyPlayersAboutMissiles()
    
    local messageTextToAll = self:calculateAngleAdvantage()
    local messageText = messageTextToAll .. string.format("\n")
    for _, playerList in pairs({self.bluePlayers, self.redPlayers}) do
        for playerName, playerData in pairs(playerList) do
            if playerData.missiles and next(playerData.missiles) then
                local unit = playerData.unit  -- Получаем юнита напрямую из таблицы игрока
                if unit and unit:isExist() then
                    env.info("[ARENA] Информация о ракетах для " .. playerName .. ":")
                    
                    for missileID, missileInfo in pairs(playerData.missiles) do
                        local missile = missileInfo.weapon
                        if missile and missile:isExist() then
                            messageText = messageText .. string.format("%s\n", missileInfo.weapon:getTypeName())

                            local trackingData = getMissileTrackingData(missileInfo, unit)
                            


                            local startDist = UTILS.VecDist3D(missileInfo.startPos, unit:getPoint())
                            local progressBar = createProgressBar(startDist - trackingData.distanceToPlayer, startDist, 30)
                            local progressBarPointsMissle = createProgressBar(trackingData.points, 2, 30)
                            -- Формируем строку сообщения с прогресс-барами и результатами

                            if (trackingData.missileHeight > trackingData.aircraftHeight) then
                                messageText = messageText .. string.format("Ground↑:■ ")
                            else
                                messageText = messageText .. string.format("Ground↓:□ ")
                            end
                            if (isInRange(trackingData.missileAngle, 87, 93)) then
                                messageText = messageText .. string.format("Angle±3:■ ")
                            else 
                                messageText = messageText .. string.format("Angle±3:□ ")
                            end
                            if (trackingData.targetInfo == "Нет захвата") then
                                messageText = messageText .. string.format("Track-:■\n")
                            else 
                                messageText = messageText .. string.format("Track+:□\n")
                            end
                            messageText = messageText .. string.format("AngleNotch: %.1f\n", trackingData.missileAngle)
                            messageText = messageText .. string.format("TAS: %.1f Alt: %.1f RelSpd: %.1f\n", trackingData.missileSpeed, trackingData.aircraftHeight, trackingData.relativeSpeed)
                            messageText = messageText .. string.format("Приммерное время до смерти: %.1f\n", trackingData.timeToDeath)
                            messageText = messageText .. string.format("%s :Дистанция: %.1f\n", progressBar, trackingData.distanceToPlayer)
                            messageText = messageText .. string.format(":relativeAcceleration: %.1f\n", trackingData.relativeAcceleration)
                            messageText = messageText .. string.format(":deltaTimeToDeath: %.1f\n", trackingData.deltaTimeToDeath)
                            messageText = messageText .. string.format("%s :points: %.1f\n", progressBarPointsMissle, trackingData.points)
                             -- Удаление ракеты, если её скорость меньше скорости самолёта и она потеряла захват
                            if (trackingData.missileSpeed < trackingData.aircraftSpeed) and (trackingData.targetInfo == "Нет захвата") then
                                env.info("[ARENA] Removing missile " .. missileID .. ": Speed lower than aircraft and no lock")
                                self:removeMissileByID(missileID)
                            end
                        end
                    end

                    
                else
                    env.info("[ERROR] Unit for player " .. playerName .. " does not exist.")
                end
            end
            --if unit and unit:isExist() then
                env.info("[ARENA] Sending message to player " .. playerName)
                local message = MESSAGE:New(messageText, 1, nil, true)
                message:ToUnit(UNIT:FindByName(playerName))
            --end
        end
    end
end

function Arena:trackMissiles()

    self:removeNonExistingPlayers()

    for missileID, missileData in pairs(self.blueMissiles) do
        self:processMissileTracking(missileID, missileData)
    end

    for missileID, missileData in pairs(self.redMissiles) do
        self:processMissileTracking(missileID, missileData)
    end

    -- Теперь вызываем метод для вывода списка ракет у игроков
    --self:displayPlayerMissiles()
    --self:trackMissileCoordinates()
    self:notifyPlayersAboutMissiles()
    --self:calculateAngleAdvantage()
    --self:displayPlayerMissiles()
end

function Arena:processMissileTracking(missileID, missileData)
    local missile = missileData.weapon
    if missile and missile:isExist() then
        local target = missile:getTarget()
        if target and target:isExist() then
            local targetUnitName = target:getName()
            env.info("[DEBUG] Missile " .. missileID .. " has target: " .. targetUnitName)

            -- Используем вспомогательную функцию для нахождения игрока
            local playerList = self:getPlayerListByTarget(targetUnitName)

            if playerList then
                env.info("[DEBUG] Found player: " .. targetUnitName)

                if not playerList[targetUnitName].missiles then
                    playerList[targetUnitName].missiles = {}
                    env.info("[DEBUG] Created missiles table for " .. targetUnitName)
                end

                -- Если ракета еще не добавлена
                if not playerList[targetUnitName].missiles[missileID] then
                    -- Передаем информацию о ракете, включая стартовую позицию и другие данные
                    playerList[targetUnitName].missiles[missileID] = {
                        owner = missileData.owner,
                        weapon = missile,
                        startPos = missileData.startPos,
                        previousPos = missileData.previousPos,
                        currentPos = missileData.currentPos,
                        prevRelativeSpeed = 0,  -- Для хранения предыдущей относительной скорости
                    }
                    
                    env.info("[ARENA] Missile " .. missileID .. " added to " .. targetUnitName .. "'s missile list.")
                else
                    env.info("[DEBUG] Missile " .. missileID .. " already exists in " .. targetUnitName .. "'s missile list.")
                end
            else
                env.info("[DEBUG] Not found player: " .. targetUnitName)
            end
        else
            env.info("[DEBUG] Missile " .. missileID .. " has no valid target.")
        end
    else
        -- Если ракета больше не существует, удаляем её
        self:removeMissileByID(missileID)
        env.info("[ARENA] Missile " .. missileID .. " no longer exists.")
    end
end

-- Вспомогательная функция для получения списка игроков по имени цели
function Arena:getPlayerListByTarget(targetUnitName)
    -- Проверяем среди всех игроков (и синих, и красных)
    if self.bluePlayers[targetUnitName] then
        return self.bluePlayers
    elseif self.redPlayers[targetUnitName] then
        return self.redPlayers
    else
        return nil
    end
end

function Arena:calculateAngleAdvantage()
    local blueScore = 0
    local redScore = 0
    local messageText = ""  -- Строка для накопления сообщений

    -- Функция для вычисления угла
    local function calculateAdvantage(playerA, playerB)
        local vA = playerA.unit:getVelocity()
        local vB = playerB.unit:getVelocity()
        local posA = playerA.unit:getPoint()
        local posB = playerB.unit:getPoint()

        -- Вектор до цели
        local dx = posB.x - posA.x
        local dy = posB.y - posA.y
        local dz = posB.z - posA.z
        local distance = math.sqrt(dx^2 + dy^2 + dz^2)

        -- Нормализованный вектор направления движения playerA
        local magnitudeA = math.sqrt(vA.x^2 + vA.y^2 + vA.z^2)
        local dirAX = vA.x / magnitudeA
        local dirAY = vA.y / magnitudeA
        local dirAZ = vA.z / magnitudeA

        -- Нормализованный вектор на playerB
        local dirBX = dx / distance
        local dirBY = dy / distance
        local dirBZ = dz / distance

        -- Вычисляем угол между векторами
        local dotProduct = dirAX * dirBX + dirAY * dirBY + dirAZ * dirBZ
        local angle = math.deg(math.acos(dotProduct))
        if isInRange(angle, 0, 50) then
            angle = 0
        end

        return angle
    end

    -- Считаем очки для синей команды
    for _, playerA in pairs(self.bluePlayers) do
        local angleSum = 0
        for _, playerB in pairs(self.redPlayers) do
            local angle = calculateAdvantage(playerA, playerB)
            angleSum = angleSum + angle
            -- Добавляем информацию о расчете угла в строку
            messageText = messageText .. string.format("[ARENA] Blue player %s - Angle to Red player %s: %.2f\n", playerA.unit:getName(), playerB.unit:getName(), angle)
        end
        if self.redPlayersCount > 0 then
            blueScore = blueScore + ((180 * self.redPlayersCount) - angleSum) / (180 * self.redPlayersCount)
        end
    end

    if self.bluePlayersCount > 0 then
        blueScore = blueScore / self.bluePlayersCount
    end

    -- Считаем очки для красной команды
    for _, playerA in pairs(self.redPlayers) do
        local angleSum = 0
        for _, playerB in pairs(self.bluePlayers) do
            local angle = calculateAdvantage(playerA, playerB)
            angleSum = angleSum + angle
            -- Добавляем информацию о расчете угла в строку
            messageText = messageText .. string.format("[ARENA] Red player %s - Angle to Blue player %s: %.2f\n", playerA.unit:getName(), playerB.unit:getName(), angle)
        end
        if self.bluePlayersCount > 0 then
            redScore = redScore + ((180 * self.bluePlayersCount) - angleSum) / (180 * self.bluePlayersCount)
        end
    end

    if self.redPlayersCount > 0 then
        redScore = redScore / self.redPlayersCount
    end

    -- Общий вывод для всех
    local summaryMessage = string.format("[ARENA] Angle Advantage - Blue: %.2f, Red: %.2f", blueScore, redScore)
    messageText = messageText .. summaryMessage

    -- Отправляем все накопленные сообщения
    env.info(summaryMessage)
    return messageText
end


-- Создаём арену
bvr1 = Arena:new("BVR#1")  

bvr1:addBots()

-- Функция для запуска шедулера
function startScheduler()
    if not bvr1 then
        env.error("[ERROR] bvr1 is nil! Scheduler will not start.")
        return
    end

    local scheduler = SCHEDULER:New(nil, function()
        bvr1:trackMissiles()
    end, {}, 0, 0.1)  
end

startScheduler()

-- Обработчик событий
function EventHandler:onEvent(event)
    if event.id == world.event.S_EVENT_BIRTH then
        local unit = event.initiator

        if not unit or not unit:getName() then
            env.error("[ERROR] S_EVENT_BIRTH: Received invalid unit")
            return
        end

        local unitName = unit:getName()
        local arena = getArenaByName("BVR#1")
        if arena then
            --arena:addPlayer(unit)
        else
            env.info("[ARENA] Arena not found for player: " .. unitName)
        end

    elseif event.id == world.event.S_EVENT_SHOT then
        local unit = event.initiator
        local weapon = event.weapon

        if not unit or not unit:getName() or not weapon then
            env.error("[ERROR] S_EVENT_SHOT: Invalid unit or weapon")
            return
        end

        local unitName = unit:getName()
        local weaponName = weapon:getTypeName()
        local arena = getArenaByName("BVR#1")
        if arena then
            arena:addMissile(unit, weapon)
        else
            env.info("[ARENA] Arena not found for missile from: " .. unitName)
        end
    end
end





-- Функция для получения арены по имени
function getArenaByName(name)
    if name == "BVR#1" then
        return bvr1
    else
        return nil
    end
end

-- Метод для вывода всех игроков на обеих сторонах
function Arena:printAllPlayers()
    -- Проверяем наличие игроков в обеих сторонах
    env.info("[ARENA] Players in Arena " .. self.name .. ":")

    -- Выводим информацию о синей стороне
    env.info("[ARENA] Blue Side: " .. table.length(self.bluePlayers) .. " players")
    for unitName, player in pairs(self.bluePlayers) do
        env.info("  - " .. unitName)  -- Выводим имя игрока
    end

    -- Выводим информацию о красной стороне
    env.info("[ARENA] Red Side: " .. table.length(self.redPlayers) .. " players")
    for unitName, player in pairs(self.redPlayers) do
        env.info("  - " .. unitName)  -- Выводим имя игрока
    end
end


-- Метод для вывода всех игроков на обеих сторонах
function Arena:printAllMissiles()
    env.info("[ARENA] Missiles in Arena " .. self.name .. ":")

    -- Выводим ракеты синих
    local blueMissilesCount = 0
    env.info("[ARENA] Blue Side Missiles:")
    for missileKey, missileData in pairs(self.blueMissiles) do
        local missile = missileData.weapon  -- Это уже weapon, 
        if missile and missile:isExist() then  -- Проверяем, существует ли ракета
            blueMissilesCount = blueMissilesCount + 1
            env.info("  - " .. missileKey .. " (" .. missile:getTypeName() .. ", Owner: " .. missileData.owner .. ")")
        else
            env.info("[ARENA] Invalid missile: " .. missileKey)  -- Если ракета не существует, выводим сообщение
        end
    end
    env.info("[ARENA] Total Blue Side Missiles: " .. blueMissilesCount)

    -- Выводим ракеты красных
    local redMissilesCount = 0
    env.info("[ARENA] Red Side Missiles:")
    for missileKey, missileData in pairs(self.redMissiles) do
        local missile = missileData.weapon
        if missile and missile:isExist() then
            redMissilesCount = redMissilesCount + 1
            env.info("  - " .. missileKey .. " (" .. missile:getTypeName() .. ", Owner: " .. missileData.owner .. ")")
        else
            env.info("[ARENA] Invalid missile: " .. missileKey)
        end
    end
    env.info("[ARENA] Total Red Side Missiles: " .. redMissilesCount)
end


-- Метод для вывода списка всех ракет на игроках
function Arena:displayPlayerMissiles()
    local messages = {}
    
    -- Перебираем всех игроков на обеих сторонах (синих и красных)
    for side, playerList in pairs({Blue = self.bluePlayers, Red = self.redPlayers}) do
        for playerName, playerData in pairs(playerList) do
            if playerData.missiles and next(playerData.missiles) then
                local missileListString = playerName .. " has the following missiles targeting them:"
                for missileID, missileData in pairs(playerData.missiles) do
                    local weaponType = "Unknown"
                    if missileData.weapon and missileData.weapon:isExist() then
                        weaponType = missileData.weapon:getTypeName()
                    end
                    missileListString = missileListString .. "\n  - Missile ID: " .. missileID ..
                        ", Owner: " .. missileData.owner ..
                        ", Weapon Type: " .. weaponType
                end
                table.insert(messages, missileListString)
                env.info(missileListString)
            else
                local msg = playerName .. " has no missiles targeting them."
                table.insert(messages, msg)
                env.info(msg)
            end
        end
    end

    local outputMessage = table.concat(messages, "\n")
    trigger.action.outText(outputMessage, 10)  -- Вывод на экран игры на 10 секунд
end

world.addEventHandler(EventHandler)
