-- Статистика для тренировок 9g с использованием MOOSE
-- Требует MOOSE (ветка Develop) и доступ к библиотеке io для работы с файлами.
-- Логирование ведется в папку Logs. Если файл существует, создается новый с добавлением даты и времени.

-- Глобальные таблицы для накопления данных
local Stats = {}
Stats.shots = {}       -- Таблица незавершённых пусков
Stats.shotCounter = 0  -- Уникальный идентификатор для пусков
Stats.logBuffer = {}   -- Буфер для строк CSV
Stats.logInterval = 1800  -- Интервал сброса в секундах (30 минут)

-- Функция для определения, управляется ли юнит игроком (используем наличие CLIENT)
local function IsPlayer(unit)
    return unit and unit:GetClient() ~= nil
end

-- Функция вычисления дистанции между двумя юнитами в милях
local function GetDistanceInNM(unit1, unit2)
    if not unit1 or not unit2 then
        return nil
    end

    local pos1 = unit1:GetPointVec3()
    local pos2 = unit2:GetPointVec3()
    if not pos1 or not pos2 then
        return nil
    end

    local distanceMeters = UTILS.VecDist3D(pos1, pos2)
    local distanceNM = UTILS.MetersToNM(distanceMeters)
    return distanceNM
end
-- Функция вычисления аспекта цели.
-- Вычисляется угол между направлением цели и вектором от цели к стрелку.
-- Возвращается строковое значение аспекта и числовой коэффициент A для формулы эффективности.
local function ComputeAspect(shooter, target)
    -- Получаем угол направления цели (предполагаем, что GetHeading возвращает радианы)
    local targetHeading = target:GetHeading() * 57.2958  -- перевод в градусы
    local vector = shooter:GetPointVec2() - target:GetPointVec2()
    local vectorAngle = vector:GetAngle() * 57.2958  -- градусы
    local diff = math.abs(targetHeading - vectorAngle)
    if diff > 180 then diff = 360 - diff end

    if diff <= 45 then 
        return "горячая", 1.0
    elseif diff <= 85 then
        return "фланкующая-горячая", 0.8
    elseif diff <= 135 then
        return "фланкующая-холодная", 0.5
    else
        return "холодная", 0.2
    end
end

-- Обработка события пуска ракеты
function Stats:OnEventShot(EventData)
    -- Если в событии нет оружия, выходим
    if not EventData.weapon then return end

    local shooter = EventData.initiator
    local target  = EventData.target
    if not shooter or not target then return end

    -- Фиксируем только пуски, инициированные игроками
    if not IsPlayer(shooter) then return end

    -- Получаем время пуска (используем timer.getTime(), доступную в DCS)
    local shotTime = timer.getTime()

    -- Вычисляем дистанцию между стрелком и целью (в милях)
    local distance = GetDistanceInNM(shooter, target)

    -- Вычисляем аспект цели и коэффициент A
    local aspect, aspectCoeff = ComputeAspect(shooter, target)

    -- Определяем ожидаемое время полёта ракеты: (расстояние в метрах / скорость ракеты)
    local missileSpeed = EventData.weapon:GetSpeed() or 300  -- если скорость не доступна, берем значение по умолчанию (м/с)
    local flightTime = (distance * 1609.34) / missileSpeed
    if flightTime < 1 then flightTime = 1 end

    -- Формируем запись пуска
    self.shotCounter = self.shotCounter + 1
    local shotRecord = {
         shotID           = self.shotCounter,
         shooterName      = shooter:GetName(),  -- можно также получить имя через shooter:GetClient():GetName()
         shooterUnitID    = shooter:GetID(),
         targetName       = target:GetName(),
         targetUnitID     = target:GetID(),
         shotTime         = shotTime,
         expectedFlightTime = flightTime,
         distance         = distance,
         aspect           = aspect,
         aspectCoeff      = aspectCoeff,
         response         = false,   -- флаг ответного пуска (по умолчанию false)
         hit              = false,   -- попадание: обновится при событии HIT
         efficiency       = 0,       -- рассчитанная эффективность (заполнится при HIT)
         missileName      = EventData.weapon:GetWeaponName() or "Unknown"
    }
    self.shots[shotRecord.shotID] = shotRecord
    env.info("Статистика: зафиксирован пуск #" .. shotRecord.shotID .. " стрелок: " .. shotRecord.shooterName .. " цель: " .. shotRecord.targetName)
end

-- Обработка события пуска, инициированного целью (ответный пуск).
-- Если в пределах ожидаемого времени полёта от пуска по цели та же единица совершает пуск, считаем, что был ответный пуск.
function Stats:OnEventResponse(EventData)
    local shooter = EventData.initiator
    if not shooter then return end

    local eventTime = timer.getTime()
    for id, shot in pairs(self.shots) do
         if not shot.response and shot.targetUnitID == shooter:GetID() then
             if eventTime >= shot.shotTime and eventTime <= (shot.shotTime + shot.expectedFlightTime) then
                  shot.response = true
                  env.info("Статистика: зафиксирован ответный пуск для пуска #" .. id)
             end
         end
    end
end

-- Обработка события HIT
-- При попадании обновляем запись пуска, вычисляем эффективность и добавляем запись в CSV-буфер.
function Stats:OnEventHit(EventData)
    if not EventData.weapon then return end

    local shooter = EventData.initiator
    if not shooter or not IsPlayer(shooter) then return end

    local eventTime = timer.getTime()
    -- Ищем соответствующий пуск по стрелку (сравниваем ID и время)
    for id, shot in pairs(self.shots) do
         if shot.shooterUnitID == shooter:GetID() then
             if eventTime >= shot.shotTime and eventTime <= (shot.shotTime + shot.expectedFlightTime + 5) then
                  shot.hit = true
                  local C = shot.response and 0.5 or 1.0
                  shot.efficiency = shot.aspectCoeff * (1 - shot.distance / 20) * C
                  self:LogShot(shot)
                  self.shots[id] = nil  -- удаляем обработанную запись
                  break
             end
         end
    end
end

-- Запись записи пуска в CSV-буфер
function Stats:LogShot(shot)
    -- Формат строки CSV: shotID,shotTime,shooterName,targetName,distance,aspect,response,efficiency,missileName
    local line = string.format("%d,%.2f,%s,%s,%.2f,%s,%s,%.2f,%s",
         shot.shotID,
         shot.shotTime,
         shot.shooterName,
         shot.targetName,
         shot.distance,
         shot.aspect,
         tostring(shot.response),
         shot.efficiency,
         shot.missileName
    )
    table.insert(self.logBuffer, line)
    env.info("Статистика: запись пуска в буфер: " .. line)
end

-- Функция сброса буфера в CSV-файл.
function Stats:FlushLog()
    if #self.logBuffer == 0 then return end

    local fileName = "Logs/stats_" .. os.date("%Y%m%d_%H%M%S") .. ".csv"
    local file = io.open(fileName, "w")
    if file then
         file:write("shotID,shotTime,shooterName,targetName,distance,aspect,response,efficiency,missileName\n")
         for _, line in ipairs(self.logBuffer) do
             file:write(line .. "\n")
         end
         file:close()
         env.info("Статистика: данные выгружены в файл " .. fileName)
         self.logBuffer = {}  -- очищаем буфер
    else
         env.error("Статистика: не удалось открыть файл " .. fileName .. " для записи")
    end
end

-- Запускаем таймер для периодической выгрузки (каждые 30 минут)
timer.scheduleFunction(
  function()
      Stats:FlushLog()
      return timer.getTime() + Stats.logInterval
  end,
  nil,
  timer.getTime() + Stats.logInterval
)

-- Основной обработчик событий
local StatsEventHandler = {}
function StatsEventHandler:onEvent(EventData)
    if EventData.id == world.event.S_EVENT_SHOT then
         -- Обрабатываем пуск, если присутствует цель
         if EventData.target then
             Stats:OnEventShot(EventData)
         else
             -- Если цели нет, возможно это ответный пуск от цели
             Stats:OnEventResponse(EventData)
         end
    elseif EventData.id == world.event.S_EVENT_HIT then
         Stats:OnEventHit(EventData)
    end
end

-- Регистрируем обработчик событий через MOOSE
local StatsHandler = EVENTHANDLER:New(StatsEventHandler)
env.info("Статистика для тренировок 9g запущена.")
