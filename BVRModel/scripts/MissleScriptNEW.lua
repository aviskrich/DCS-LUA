-- Функция для рекурсивного вывода содержимого таблицы в лог
function logTable(tbl, indent)
    indent = indent or ""
    for key, value in pairs(tbl) do
        -- Пропускаем поле arena, чтобы избежать рекурсии
        if key ~= "arena" then
            if type(value) == "table" then
                env.info(indent .. tostring(key) .. " = {")
                logTable(value, indent .. "    ")
                env.info(indent .. "}")
            else
                env.info(indent .. tostring(key) .. " = " .. tostring(value))
            end
        end
    end
end

-- Функция для вывода всех таблиц арены
function logArenaState(arena)
    env.info("===== DEBUG ARENA STATE =====")
    env.info("Арена: " .. arena.name)
    logTable(arena)
    env.info("===== END DEBUG =====")
end

-- Функция для создания прогресс-бара
local function createProgressBar(part, total, barLength)
    if total == 0 then
        return string.rep("□", barLength)
    end
    local filled = math.floor((part / total) * barLength)
    local empty = barLength - filled
    return string.rep("■", filled) .. string.rep("□", empty)
end

-- Класс арены
Arena = {}
Arena.__index = Arena

function Arena:new(name)
    local instance = setmetatable({}, Arena)
    instance.name = name
    instance.playerMessages = {}  -- Таблица для хранения сообщений всех игроков
    -- Создаем команды и передаем им ссылку на арену
    instance.blueTeam = Team:new(name .. " Blue", "blue", instance)
    instance.redTeam = Team:new(name .. " Red", "red", instance)
    return instance
end

-- Класс команды
Team = {}
Team.__index = Team

-- Обработчик событий
EventHandler = {}

function Team:new(name, side, arena)
    local self = setmetatable({}, Team)
    self.name = name
    self.side = side
    self.arena = arena
    self.players = {}
    self.playersCount = 0
    self.missilesCount = 0
    self.points = 0
    self.orphanedMissiles = {}
    self.unitGroups = {} -- Группы юнитов с их центральными точками
    env.info("DEBUG Team:new | Создана команда: " .. name .. " (сторона: " .. side .. ")")
    return self
end

function Team:addPlayer(unit)
    local playerName = unit:getName()

    -- Добавляем игрока в таблицу
    self.players[playerName] = {
        name = playerName,
        unit = unit,
        ammo = {
            shells = {},
            missiles = {},
        },
        activeMissiles = {},
        activeMissileCounter = 0,
        fuel = unit:getFuel(),
        radarPoints = 0,
        controlledTargetsCount = 0,
        -- Новые поля для отслеживания курса
        groupId = nil,  -- ID группы, к которой принадлежит юнит
        courseType = "cold",  -- Тип курса (hot/cold)
        courseAngle = 0,  -- Угол курса относительно ближайшей группы противника
        nearestEnemyGroup = nil  -- Индекс ближайшей группы противника
    }
    self.playersCount = self.playersCount + 1

    env.info("DEBUG addPlayer | Игрок добавлен: " .. playerName .. " (ID: " .. playerName .. ")")
end

-- Функция для удаления игроков, которые не существуют (умерли или вышли)
function Team:removeNonExistingPlayer()
    env.info("DEBUG removeNonExistingPlayer | Проверка на несуществующих игроков...")

    for playerName, player in pairs(self.players) do
        -- Проверяем через MOOSE
        local unit = UNIT:FindByName(playerName)
        if not unit or not unit:IsAlive() then
            -- Проверяем активные ракеты игрока перед его удалением
            if player.activeMissiles then
                for missileKey, missileData in pairs(player.activeMissiles) do
                    local weapon = missileData.weapon
                    -- Если ракета всё ещё существует, переносим её в orphanedMissiles 
                    if weapon and weapon:isExist() then
                        env.info("DEBUG removeNonExistingPlayer | Ракета " .. missileKey .. " перенесена в orphanedMissiles")
                        self.orphanedMissiles[missileKey] = missileData
                    end
                end
            end
            
            -- Если юнит не существует, удаляем игрока
            env.info("DEBUG removeNonExistingPlayer | Игрок " .. player.name .. " удален (юнит не существует или уничтожен).")
            self.players[playerName] = nil
            self.playersCount = self.playersCount - 1
        end
    end
end

-- Функция для удаления несуществующих ракет
function Team:removeNonExistingMissiles()
    env.info("DEBUG removeNonExistingMissiles | Проверка на несуществующие ракеты...")

    -- Проходим по всем игрокам
    for playerName, player in pairs(self.players) do
        -- Проверяем наличие таблицы активных ракет
        if player.activeMissiles then
            -- Проходим по всем ракетам игрока
            for missileKey, missileData in pairs(player.activeMissiles) do
                local weapon = missileData.weapon
                -- Проверяем существование ракеты
                if not weapon or not weapon:isExist() then
                    -- Если ракета не существует, удаляем её
                    env.info("DEBUG removeNonExistingMissiles | Ракета " .. missileKey .. " удалена (ракета не существует).")
                    player.activeMissiles[missileKey] = nil
                end
            end
        end
    end

    -- Проверяем "осиротевшие" ракеты
    for missileKey, missileData in pairs(self.orphanedMissiles) do
        local weapon = missileData.weapon
        -- Проверяем существование ракеты
        if not weapon or not weapon:isExist() then
            -- Если ракета не существует, удаляем её
            env.info("DEBUG removeNonExistingMissiles | Осиротевшая ракета " .. missileKey .. " удалена (ракета не существует).")
            self.orphanedMissiles[missileKey] = nil
        end
    end
end

-- Функция для обновления боеприпасов и топлива игрока
function Team:updateAmmoForPlayer(playerName, unit)
    local player = self.players[playerName]
    if not player then
        env.info("DEBUG updateAmmoForPlayer | Ошибка: игрок " .. playerName .. " не найден!")
        return
    end

    local ammoTable = unit:getAmmo()
    if not ammoTable then
        env.info("DEBUG updateAmmoForPlayer | Ошибка: unit:getAmmo() вернул nil для юнита " .. unit:getName())
        return
    end

    -- Обновляем данные о боеприпасах
    for _, ammo in ipairs(ammoTable) do
        local weaponType = ammo.desc.typeName
        local weaponCount = ammo.count
        local weaponName = string.match(weaponType, "%.([^.]+)$") or weaponType

        if string.find(weaponType, "weapons.shells.") then
            player.ammo.shells[weaponName] = { id = weaponName, weapon = weaponName, count = weaponCount }
            env.info("DEBUG updateAmmoForPlayer | " .. player.name .. " обновил снаряды " .. weaponName .. ": " .. weaponCount)
        elseif string.find(weaponType, "weapons.missiles.") then
            player.ammo.missiles[weaponName] = { id = weaponName, weapon = weaponName, count = weaponCount }
            env.info("DEBUG updateAmmoForPlayer | " .. player.name .. " обновил ракеты " .. weaponName .. ": " .. weaponCount)
        else
            env.info("DEBUG updateAmmoForPlayer | Неизвестный боеприпас: " .. weaponType)
        end
    end

    -- Обновляем данные о топливе
    player.fuel = unit:getFuel()
    env.info("DEBUG updateAmmoForPlayer | " .. player.name .. " обновил топливо: " .. player.fuel)
end

-- Функция для проверки состояния боеприпасов и топлива
function Team:checkAmmo()
    env.info("DEBUG checkAmmo | Проверка состояния боеприпасов...")

    for playerName, player in pairs(self.players) do
        env.info("DEBUG checkAmmo | Игрок: " .. player.name)

        -- Проверяем наличие юнита в игре
        local unit = Unit.getByName(player.name)
        if unit then
            self:updateAmmoForPlayer(playerName, unit)
        else
            env.info("DEBUG checkAmmo | Юнит для игрока " .. player.name .. " не найден!")
        end

        -- Вывод информации о снарядах
        env.info("DEBUG checkAmmo | Снаряды:")
        for weaponType, shell in pairs(player.ammo.shells) do
            env.info("DEBUG checkAmmo |  - " .. weaponType .. ": " .. shell.count)
        end

        -- Вывод информации о ракетах
        env.info("DEBUG checkAmmo | Ракеты:")
        for weaponType, missile in pairs(player.ammo.missiles) do
            env.info("DEBUG checkAmmo |  - " .. weaponType .. ": " .. missile.count)
        end

        -- Вывод информации о топливе
        env.info("DEBUG checkAmmo | Топливо: " .. player.fuel)
    end
end

function Team:addActiveMissile(unit, weapon)
    if not unit or not weapon then
        env.info("DEBUG addActiveMissile | Ошибка: unit или weapon = nil!")
        return
    end

    local unitName = unit:getName()
    local weaponName = weapon:getTypeName()

    -- Проверяем, есть ли игрок
    if not self.players[unitName] then
        env.info("DEBUG addActiveMissile | Ошибка: игрок " .. unitName .. " не найден!")
        return
    end

    -- Получаем таблицу запущенных ракет игрока
    local playerActiveMissiles = self.players[unitName].activeMissiles
    if not playerActiveMissiles then
        playerActiveMissiles = {}  -- Если таблица пуста, создаем новую
    end

    -- Создаем счетчик ракет для каждого игрока, если его еще нет
    if not self.players[unitName].activeMissileCounter then
        self.players[unitName].activeMissileCounter = 0
    end

    -- Увеличиваем счетчик ракет
    self.players[unitName].activeMissileCounter = self.players[unitName].activeMissileCounter + 1
    local missileNumber = self.players[unitName].activeMissileCounter

    -- Генерируем уникальный ключ ракеты
    local missileKey = unitName .. " " .. weaponName .. " " .. missileNumber

    -- Получаем цель ракеты
    local target = weapon:getTarget()
    local targetName = target and target:getName() or "Нет цели"

    -- Создаем запись о ракете
    local missileData = {
        weaponName = weaponName,
        owner = unitName,
        weapon = weapon,
        target = target,
        lastTarget = target,  -- Сначала цель совпадает с последней
        missileNumber = missileNumber,
        startPosition = weapon:getPoint(),
        trackingData = {
            missileAngle = 0,
            distanceToPlayer = 0,
            relativeSpeed = 0,
            missileSpeed = 0,
            aircraftSpeed = 0,
            targetInfo = "Нет цели",
            missileHeight = 0,
            aircraftHeight = 0,
            timeToDeath = 0,
            relativeAcceleration = 0,
            deltaTimeToDeath = 0,
            points = 0,
            prevRelativeSpeed = 0,  -- Инициализация предшествующего значения скорости
            prevTimeToDeath = 0  -- Инициализация предшествующего времени до смерти
        },
        lastTrackingData = {  -- Добавляем таблицу с предыдущими значениями
            missileAngle = 0,  -- Можете добавить расчет угла, если нужно
            missileSpeed = 0,
            relativeSpeed = 0,
            distanceToPlayer = 0,
            targetInfo = "Нет цели",
            relativeAcceleration = 0,
            timeToDeath = math.huge,
            deltaTimeToDeath = 0,
            targetHeight = 0,
            missileHeight = 0,
            points = 0,
            targetSpeed = 0
        }
    }


    -- Добавляем ракету в таблицу игрока
    playerActiveMissiles[missileKey] = missileData

    -- Обновляем таблицу активных ракет игрока
    self.players[unitName].activeMissiles = playerActiveMissiles

    -- Логируем
    env.info("DEBUG addActiveMissile | Ракета добавлена: " .. missileKey .. " (Цель: " .. targetName .. ")")
end

local function getMissileTrackingData(missileData)
    local missile = missileData.weapon
    local target = missileData.target

    -- Если ракета или цель не существуют, возвращаем дефолтные значения
    if not missile or not missile:isExist() or not target or not target:isExist() then
        return {
            missileAngle = 0,
            distanceToPlayer = 0,
            relativeSpeed = 0,
            missileSpeed = 0,
            targetSpeed = 0,
            targetInfo = "Нет захвата",
            missileHeight = 0,
            targetHeight = 0,
            timeToDeath = math.huge,
            relativeAcceleration = 0,
            deltaTimeToDeath = 0,
            points = 0
        }
    end

   -- Цель ракеты
    local targetInfo = target and target:getName() or "Нет захвата"
    -- Получаем скорости и позиции
    local vMissile = missile:getVelocity()
    local vTarget = target:getVelocity()
    local missilePos = missile:getPoint()
    local targetPos = target:getPoint()

    -- Вектор от цели к ракете
    local toMissileX = missilePos.x - targetPos.x
    local toMissileY = missilePos.y - targetPos.y
    local toMissileZ = missilePos.z - targetPos.z

    -- Длины векторов
    local toMissileLength = math.sqrt(toMissileX^2 + toMissileY^2 + toMissileZ^2)
    local targetVelocityLength = math.sqrt(vTarget.x^2 + vTarget.y^2 + vTarget.z^2)

    -- Скалярное произведение векторов
    local dotProduct = toMissileX * vTarget.x + toMissileY * vTarget.y + toMissileZ * vTarget.z

    -- Расчет угла в градусах (угол аспекта)
    local missileAngle = math.deg(math.acos(math.max(-1, math.min(1, dotProduct / (toMissileLength * targetVelocityLength)))))

    -- Вектор расстояния между ракетой и целью (используем уже посчитанное)
    local distance = toMissileLength

    -- Скорости
    local missileSpeed = math.sqrt(vMissile.x^2 + vMissile.y^2 + vMissile.z^2)
    local targetSpeed = math.sqrt(vTarget.x^2 + vTarget.y^2 + vTarget.z^2)

    -- Вектор относительной скорости
    local rvX = vMissile.x - vTarget.x
    local rvY = vMissile.y - vTarget.y
    local rvZ = vMissile.z - vTarget.z
    local relativeSpeed = math.sqrt(rvX^2 + rvY^2 + rvZ^2)

    -- Берем предыдущее значение скорости из lastTrackingData
    local prevRelativeSpeed = missileData.lastTrackingData.relativeSpeed or 0
    local prevTimeToDeath = missileData.lastTrackingData.timeToDeath or math.huge

    -- Рассчитываем относительное ускорение
    local relativeAcceleration = (relativeSpeed - prevRelativeSpeed) / 0.1

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
    local deltaTimeToDeath = prevTimeToDeath - timeToDeath

    -- Начисление очков
    local points = 0
    if timeToDeath == math.huge or targetInfo == "Нет захвата" then
        points = 0
    elseif timeToDeath > 15 then
        points = 1
    else
        points = 1 + (15 - timeToDeath) / 15
    end

    -- Ограничиваем диапазон очков
    points = math.max(0, math.min(2, points))

 

        -- Перезаписываем последние данные
    missileData.lastTrackingData = {
        missileAngle = missileAngle,  -- Обновленное значение угла
        missileSpeed = missileSpeed,
        relativeSpeed = relativeSpeed,
        distanceToPlayer = distance,
        targetInfo = targetInfo,
        missileHeight = missilePos.y,
        targetHeight = targetPos.y,
        relativeAcceleration = relativeAcceleration,
        timeToDeath = timeToDeath,
        deltaTimeToDeath = deltaTimeToDeath,
        points = points,
        targetSpeed = targetSpeed
    }

    -- Возвращаем trackingData с правильными значениями, но без предыдущих данных
    return {
        missileAngle = missileAngle,  -- Обновленное значение угла
        missileSpeed = missileSpeed,
        relativeSpeed = relativeSpeed,
        distanceToPlayer = distance,
        targetInfo = targetInfo,
        missileHeight = missilePos.y,
        targetHeight = targetPos.y,
        relativeAcceleration = relativeAcceleration,
        timeToDeath = timeToDeath,
        deltaTimeToDeath = deltaTimeToDeath,
        points = points,
        targetSpeed = targetSpeed
    }
end


function Team:updateActiveMissiles()
    env.info("DEBUG updateActiveMissiles | Обновление целей ракет...")
    
    -- Создаем временную таблицу для группировки сообщений по целям
    local targetMessages = {}
    local missilesCount = 0

    -- Функция для обработки ракеты и добавления её информации в текст
    local function processMissile(missileKey, missileData, ownerName)
        local weapon = missileData.weapon
        if weapon then
            missilesCount = missilesCount + 1
            
            -- Получаем текущую цель
            local target = weapon:getTarget()
            local targetName = target and target:getName() or "Нет цели"

            -- Если ракета потеряла цель, но у нее была старая цель, не сбрасываем её
            if not target and missileData.lastTarget then
                target = missileData.lastTarget
                targetName = target:getName()
            end

            -- Если ракета взяла новую цель, обновляем lastTarget
            if target and target ~= missileData.lastTarget then
                missileData.lastTarget = target
            end

            -- Обновляем данные ракеты в таблице
            missileData.target = target

            -- Если у ракеты есть цель, добавляем информацию в сообщение
            if target then
                -- Рассчитываем параметры ракеты
                local trackingData = getMissileTrackingData(missileData)

                -- Обновляем trackingData у ракеты
                missileData.trackingData = trackingData

                -- Рассчитываем дистанцию до цели
                local startDist = UTILS.VecDist3D(missileData.startPosition, target:getPoint())
                local progressBar = createProgressBar(startDist - trackingData.distanceToPlayer, startDist, 30)

                -- Формируем текст для конкретной ракеты
                local missileText = string.format("!!! ВНИМАНИЕ !!! Ракета летит в вас от %s\n", ownerName)
                
                -- Добавляем дэшборд опасности
                local dangerBar = createProgressBar(trackingData.points * 10, 20, 20)
                missileText = missileText .. string.format("Опасность: %.1f/2.0 [%s]\n", trackingData.points, dangerBar)
                
                -- Добавляем детальную информацию
                missileText = missileText .. string.format("\nУгол подхода: %.1f°\n", trackingData.missileAngle)
                missileText = missileText .. string.format("Скорость ракеты: %.1f м/с Высота: %.1f м\n", trackingData.missileSpeed, trackingData.missileHeight)
                missileText = missileText .. string.format("До столкновения: %.1f сек\n", trackingData.timeToDeath)
                missileText = missileText .. string.format("%s :Дистанция: %.1f м\n", progressBar, trackingData.distanceToPlayer)

                -- Добавляем сообщение в арену для цели
                self.arena:addPlayerMessage(targetName, missileText)

                -- Логируем обновление цели и параметров ракеты
                env.info(string.format(
                    "DEBUG updateActiveMissiles | Ракета: %s | Цель: %s | Дистанция: %.2f м | Скорость ракеты: %.2f м/с | Время до удара: %.2f сек",
                    missileKey, targetName, trackingData.distanceToPlayer, trackingData.missileSpeed, trackingData.timeToDeath
                ))
            end
        end
    end

    -- Проходим по всем игрокам в команде
    for playerName, playerData in pairs(self.players) do
        local activeMissiles = playerData.activeMissiles
        -- Проходим по всем активным ракетам игрока
        for missileKey, missileData in pairs(activeMissiles) do
            processMissile(missileKey, missileData, playerName)
        end
    end

    -- Проходим по всем "осиротевшим" ракетам
    for missileKey, missileData in pairs(self.orphanedMissiles) do
        processMissile(missileKey, missileData, missileData.owner)
    end
end

-- Функция для поиска и добавления ботов
function Arena:addBots()
    local function findBotByArenaName(namePrefix)
        -- Ищем группы на синей стороне
        local airGroups = coalition.getGroups(coalition.side.BLUE, Group.Category.AIRPLANE)
        env.info("DEBUG addBots | Ищем ботов для синей стороны...")
        for _, group in ipairs(airGroups) do
            if string.find(group:getName(), namePrefix) then
                local groupUnits = group:getUnits()
                for _, unit in ipairs(groupUnits) do
                    if not unit:getPlayerName() then
                        self.blueTeam:addPlayer(unit)  -- Добавляем бота на синюю сторону
                        env.info("[ARENA] Добавлен бот на синюю сторону: " .. unit:getName())
                    else
                        self.blueTeam:addPlayer(unit)  -- Добавляем бота на синюю сторону
                        env.info("[ARENA] Добавлен Игрок на синюю сторону: " .. unit:getName())
                    end
                end
            end
        end

        -- Ищем группы на красной стороне
        airGroups = coalition.getGroups(coalition.side.RED, Group.Category.AIRPLANE)
        env.info("DEBUG addBots | Ищем ботов для красной стороны...")
        for _, group in ipairs(airGroups) do
            if string.find(group:getName(), namePrefix) then
                local groupUnits = group:getUnits()
                for _, unit in ipairs(groupUnits) do
                    if not unit:getPlayerName() then
                        self.redTeam:addPlayer(unit)  -- Добавляем бота на красную сторону
                        env.info("[ARENA] Добавлен бот на красную сторону: " .. unit:getName())
                    end
                end
            end
        end
    end

    -- Ищем ботов по имени арены
    findBotByArenaName(self.name)
end

-- Функция для проверки, находится ли цель в конусе радара
local function isTargetInRadarCone(observerPos, observerDir, targetPos)
    -- Вектор от наблюдателя к цели
    local toTargetX = targetPos.x - observerPos.x
    local toTargetY = targetPos.y - observerPos.y
    local toTargetZ = targetPos.z - observerPos.z
    
    -- Нормализуем вектор направления наблюдателя
    local dirLength = math.sqrt(observerDir.x^2 + observerDir.y^2 + observerDir.z^2)
    local normalizedDirX = observerDir.x / dirLength
    local normalizedDirY = observerDir.y / dirLength
    local normalizedDirZ = observerDir.z / dirLength
    
    -- Нормализуем вектор к цели
    local toTargetLength = math.sqrt(toTargetX^2 + toTargetY^2 + toTargetZ^2)
    local normalizedToTargetX = toTargetX / toTargetLength
    local normalizedToTargetY = toTargetY / toTargetLength
    local normalizedToTargetZ = toTargetZ / toTargetLength
    
    -- Скалярное произведение
    local dotProduct = normalizedDirX * normalizedToTargetX + 
                      normalizedDirY * normalizedToTargetY + 
                      normalizedDirZ * normalizedToTargetZ
    
    -- Угол в градусах
    local angle = math.deg(math.acos(math.max(-1, math.min(1, dotProduct))))
    
    -- Проверяем, находится ли цель в конусе +-60 градусов
    return angle <= 60
end

-- Функция подсчета очков радарного преимущества
function Team:updateRadarPoints()
    -- Получаем противоположную команду
    local oppositeTeam = nil
    if self.side == "blue" then
        oppositeTeam = self.arena.redTeam
    else
        oppositeTeam = self.arena.blueTeam
    end
    
    -- Для каждого игрока в команде
    for playerName, player in pairs(self.players) do
        if player.unit and player.unit:isExist() then
            local playerPos = player.unit:getPoint()
            local playerDir = player.unit:getPosition().x
            local controlledTargets = 0
            
            -- Проверяем все цели из противоположной команды
            for targetName, target in pairs(oppositeTeam.players) do
                if target.unit and target.unit:isExist() then
                    local targetPos = target.unit:getPoint()
                    
                    -- Проверяем, находится ли цель в конусе радара
                    if isTargetInRadarCone(playerPos, playerDir, targetPos) then
                        controlledTargets = controlledTargets + 1
                    end
                end
            end
            
            -- Обновляем очки игрока
            player.controlledTargetsCount = controlledTargets
            if oppositeTeam.playersCount > 0 then
                player.radarPoints = controlledTargets / oppositeTeam.playersCount
            else
                player.radarPoints = 0
            end
            
            env.info(string.format("DEBUG updateRadarPoints | Игрок %s контролирует %d из %d целей (%.2f очков)", 
                playerName, controlledTargets, oppositeTeam.playersCount, player.radarPoints))
        end
    end
end

-- Функция для расчета расстояния между двумя точками в милях
local function getDistanceInNM(pos1, pos2)
    local dx = pos1.x - pos2.x
    local dy = pos1.y - pos2.y
    local dz = pos1.z - pos2.z
    -- Переводим метры в морские мили (1 морская миля = 1852 метра)
    return math.sqrt(dx^2 + dy^2 + dz^2) / 1852
end

-- Функция для расчета центральной точки группы
local function calculateGroupCenter(units)
    local sumX, sumY, sumZ = 0, 0, 0
    local count = 0
    
    for _, unit in pairs(units) do
        if unit.unit and unit.unit:isExist() then
            local pos = unit.unit:getPoint()
            sumX = sumX + pos.x
            sumY = sumY + pos.y
            sumZ = sumZ + pos.z
            count = count + 1
        end
    end
    
    if count > 0 then
        return {
            x = sumX / count,
            y = sumY / count,
            z = sumZ / count
        }
    end
    return nil
end

-- Функция группировки юнитов
function Team:updateUnitGroups()
    -- Очищаем предыдущие группы
    self.unitGroups = {}
    
    -- Создаем таблицу соседей для каждого юнита
    local neighbors = {}
    local allUnits = {}
    
    -- Сначала находим всех соседей для каждого юнита
    for playerName, player in pairs(self.players) do
        if player.unit and player.unit:isExist() then
            neighbors[playerName] = {}
            allUnits[playerName] = player
            
            -- Проверяем расстояние до всех других юнитов
            for otherName, otherPlayer in pairs(self.players) do
                if otherName ~= playerName and otherPlayer.unit and otherPlayer.unit:isExist() then
                    local dist = getDistanceInNM(
                        player.unit:getPoint(),
                        otherPlayer.unit:getPoint()
                    )
                    if dist <= 30 then
                        table.insert(neighbors[playerName], otherName)
                    end
                end
            end
        end
    end
    
    -- Функция для рекурсивного добавления связанных юнитов в группу
    local function addConnectedUnits(unitName, currentGroup, processedUnits)
        if processedUnits[unitName] then return end
        
        processedUnits[unitName] = true
        currentGroup.units[unitName] = allUnits[unitName]
        
        -- Добавляем всех соседей
        for _, neighborName in ipairs(neighbors[unitName]) do
            if not processedUnits[neighborName] then
                addConnectedUnits(neighborName, currentGroup, processedUnits)
            end
        end
    end
    
    -- Формируем группы на основе связей
    local processedUnits = {}
    
    -- Проходим по всем юнитам
    for unitName, _ in pairs(allUnits) do
        if not processedUnits[unitName] then
            -- Создаем новую группу
            local newGroup = {
                units = {},
                center = nil
            }
            
            -- Добавляем все связанные юниты рекурсивно
            addConnectedUnits(unitName, newGroup, processedUnits)
            
            -- Рассчитываем центр группы
            newGroup.center = calculateGroupCenter(newGroup.units)
            
            -- Обновляем groupId для каждого юнита в группе
            local groupId = #self.unitGroups + 1
            for name, _ in pairs(newGroup.units) do
                self.players[name].groupId = groupId
            end
            
            -- Добавляем группу в список
            table.insert(self.unitGroups, newGroup)
            
            -- Логируем информацию о группе
            local unitNames = {}
            for name, _ in pairs(newGroup.units) do
                table.insert(unitNames, name)
            end
            env.info(string.format("DEBUG updateUnitGroups | Создана группа %d с юнитами: %s", 
                #self.unitGroups, table.concat(unitNames, ", ")))
        end
    end
end

-- Функция для расчета угла между векторами
local function getAngleBetweenVectors(vec1, vec2)
    -- Нормализуем векторы
    local length1 = math.sqrt(vec1.x^2 + vec1.y^2 + vec1.z^2)
    local length2 = math.sqrt(vec2.x^2 + vec2.y^2 + vec2.z^2)
    
    -- Защита от деления на ноль
    if length1 == 0 or length2 == 0 then return 0 end
    
    local normalized1 = {
        x = vec1.x / length1,
        y = vec1.y / length1,
        z = vec1.z / length1
    }
    
    local normalized2 = {
        x = vec2.x / length2,
        y = vec2.y / length2,
        z = vec2.z / length2
    }
    
    -- Скалярное произведение
    local dotProduct = normalized1.x * normalized2.x + 
                      normalized1.y * normalized2.y + 
                      normalized1.z * normalized2.z
    
    -- Защита от ошибок округления
    dotProduct = math.max(-1, math.min(1, dotProduct))
    
    -- Возвращаем угол в градусах
    return math.deg(math.acos(dotProduct))
end

-- Функция обновления углов до центров групп
function Team:updateCourseAngles()
    -- Получаем противоположную команду
    local oppositeTeam = nil
    if self.side == "blue" then
        oppositeTeam = self.arena.redTeam
    else
        oppositeTeam = self.arena.blueTeam
    end
    
    -- Для каждого игрока
    for playerName, player in pairs(self.players) do
        if player.unit and player.unit:isExist() then
            local playerPos = player.unit:getPoint()
            local playerVel = player.unit:getVelocity()
            
            -- Находим ближайший центр противоположной команды
            local minDist = math.huge
            local nearestCenter = nil
            local nearestGroupId = nil
            
            for groupId, group in pairs(oppositeTeam.unitGroups) do
                if group.center then
                    local dist = getDistanceInNM(playerPos, group.center)
                    if dist < minDist then
                        minDist = dist
                        nearestCenter = group.center
                        nearestGroupId = groupId
                    end
                end
            end
            
            -- Если нашли ближайший центр, вычисляем угол
            if nearestCenter then
                -- Вектор к центру группы (только X и Z)
                local toCenterX = nearestCenter.x - playerPos.x
                local toCenterZ = nearestCenter.z - playerPos.z
                
                -- Длины векторов (только X и Z)
                local toCenterLength = math.sqrt(toCenterX^2 + toCenterZ^2)
                local playerVelLength = math.sqrt(playerVel.x^2 + playerVel.z^2)
                
                -- Защита от деления на ноль
                if toCenterLength == 0 or playerVelLength == 0 then
                    env.info(string.format("DEBUG updateCourseAngles | Нулевая длина вектора для игрока %s", playerName))
                    return
                end
                
                -- Скалярное произведение (только X и Z)
                local dotProduct = toCenterX * playerVel.x + toCenterZ * playerVel.z
                
                -- Вычисляем угол
                local angle = math.deg(math.acos(math.max(-1, math.min(1, dotProduct / (toCenterLength * playerVelLength)))))
                
                -- Обновляем данные игрока
                player.courseAngle = angle
                player.courseType = angle <= 90 and "hot" or "cold"
                player.nearestEnemyGroup = nearestGroupId
                
                -- Создаем сообщение для дебага
                local debugMessage = string.format(
                    "\nДЕБАГ ИНФОРМАЦИЯ:\n" ..
                    "Ваша группа: %d\n" ..
                    "Ближайшая группа противника: %d\n" ..
                    "Угол до группы: %.1f° (%s)\n" ..
                    "Дистанция: %.1f морских миль",
                    player.groupId or 0,
                    nearestGroupId,
                    angle,
                    player.courseType,
                    minDist
                )
                
                -- Добавляем сообщение в очередь
                self.arena:addPlayerMessage(playerName, debugMessage)
                
                env.info(string.format("DEBUG updateCourseAngles | Игрок %s (группа %d) имеет %s курс (%.1f°) к группе противника %d", 
                    playerName, player.groupId or 0, player.courseType, angle, nearestGroupId))
            end
        end
    end
end

-- Обновляем шедулер
function startScheduler(arena)
    if not arena.blueTeam or not arena.redTeam then
        env.error("[ERROR] blueTeam or redTeam is nil! Scheduler will not start.")
        return
    end
    local scheduler = SCHEDULER:New(nil, function()
        
        arena.blueTeam:removeNonExistingPlayer()
        arena.redTeam:removeNonExistingPlayer()
        
        arena.blueTeam:removeNonExistingMissiles()
        arena.redTeam:removeNonExistingMissiles()
        
        arena.blueTeam:checkAmmo()
        arena.redTeam:checkAmmo()

        -- Обновляем группы юнитов
        arena.blueTeam:updateUnitGroups()
        arena.redTeam:updateUnitGroups()

        -- Обновляем углы курса
        arena.blueTeam:updateCourseAngles()
        arena.redTeam:updateCourseAngles()

        -- Добавляем обновление радарных очков
        arena.blueTeam:updateRadarPoints()
        arena.redTeam:updateRadarPoints()

        arena.blueTeam:updateActiveMissiles()
        arena.redTeam:updateActiveMissiles()
        
        logArenaState(arena)
        
        arena:sendAllMessages()
        
    end, {}, 1, 0.1)
    env.info("DEBUG startScheduler | Шедуллер запущен для проверки ракет, боеприпасов, групп и курсов каждую секунду.")
end

-- Таблица для хранения всех арен
local arenas = {}

-- Функция для создания новой арены
function createArena(name)
    local arena = Arena:new(name)
    arenas[name] = arena
    return arena
end

-- Функция для получения арены по имени группы
local function getArenaByGroupName(groupName)
    for arenaName, arena in pairs(arenas) do
        if string.find(groupName, arenaName) then
            return arena
        end
    end
    return nil
end

-- Инициализация арены и добавление ботов
local bvr1 = createArena("BVR#1")

-- Добавляем ботов на арены
bvr1:addBots()

-- Запускаем шедуллер
startScheduler(bvr1)

-- Обработчик событий
function EventHandler:onEvent(event)
    if event.id == world.event.S_EVENT_BIRTH then
        local unit = event.initiator

        if not unit or not unit:getName() then
            env.info("DEBUG EventHandler:onEvent | Ошибка: юнит не найден или у него нет имени.")
            return
        end

        -- Получаем группу юнита и ищем соответствующую арену
        local group = unit:getGroup()
        if not group then return end
        
        local arena = getArenaByGroupName(group:getName())
        if not arena then
            env.info("DEBUG EventHandler:onEvent | Арена не найдена для группы: " .. group:getName())
            return
        end

        -- Добавляем игрока в соответствующую команду
        if unit:getCoalition() == coalition.side.BLUE then
            arena.blueTeam:addPlayer(unit)
            env.info("DEBUG EventHandler:onEvent | Игрок " .. unit:getName() .. " добавлен в синюю команду арены " .. arena.name)
        elseif unit:getCoalition() == coalition.side.RED then
            arena.redTeam:addPlayer(unit)
            env.info("DEBUG EventHandler:onEvent | Игрок " .. unit:getName() .. " добавлен в красную команду арены " .. arena.name)
        end

    elseif event.id == world.event.S_EVENT_SHOT then
        local unit = event.initiator
        local weapon = event.weapon
    
        -- Проверка валидности данных
        if not unit or not unit:getName() or not weapon then
            env.info("DEBUG S_EVENT_SHOT | Ошибка: некорректный unit или weapon!")
            return
        end
    
        -- Получаем группу юнита и ищем соответствующую арену
        local group = unit:getGroup()
        if not group then return end
        
        local arena = getArenaByGroupName(group:getName())
        if not arena then
            env.info("DEBUG S_EVENT_SHOT | Арена не найдена для группы: " .. group:getName())
            return
        end
    
        -- Определяем команду игрока
        local team = nil
        if unit:getCoalition() == coalition.side.BLUE then
            team = arena.blueTeam
        elseif unit:getCoalition() == coalition.side.RED then
            team = arena.redTeam
        end
    
        -- Добавляем ракету, если команда определена
        if team then
            team:addActiveMissile(unit, weapon)
            env.info("DEBUG S_EVENT_SHOT | Ракета добавлена в арене " .. arena.name .. ": " .. unit:getName())
        else
            env.info("DEBUG S_EVENT_SHOT | Ошибка: команда не найдена для " .. unit:getName())
        end
    end
end

world.addEventHandler(EventHandler)

-- Метод для добавления сообщения игроку
function Arena:addPlayerMessage(playerName, message)
    if not self.playerMessages[playerName] then
        self.playerMessages[playerName] = ""
    end
    -- Добавляем разделитель, если сообщение не пустое
    if self.playerMessages[playerName] ~= "" then
        self.playerMessages[playerName] = self.playerMessages[playerName] .. "\n----------------------------------------\n"
    end
    self.playerMessages[playerName] = self.playerMessages[playerName] .. message
end

-- Метод для отправки всех накопленных сообщений
function Arena:sendAllMessages()
    for playerName, messageText in pairs(self.playerMessages) do
        if messageText and messageText ~= "" then
            -- Используем MOOSE для поиска юнита по имени
            local unit = UNIT:FindByName(playerName)
            -- Проверяем существование юнита через MOOSE IsAlive
            if unit and unit:IsAlive() then
                local message = MESSAGE:New(messageText, 1, nil, true)
                message:ToUnit(unit)
            else
                env.info(string.format("DEBUG sendAllMessages | Юнит %s не существует или уничтожен, сообщение не отправлено", playerName))
            end
        end
    end
    
    -- Очищаем сообщения после отправки
    self.playerMessages = {}
end
