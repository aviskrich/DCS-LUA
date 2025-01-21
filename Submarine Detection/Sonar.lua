-- Выключили ненужные меню
_SETTINGS:SetPlayerMenuOff()

----------------------------------------------------------------
-- ПАРАМЕТРЫ
----------------------------------------------------------------
local HELI_PREFIX         = "HELI_ASW"       -- Имя группы вертолёта (в Миссион Эдиторе)
local SUB_PREFIX        = "BLUE_SM"        -- Префикс групп подводных лодок
local CHECK_INTERVAL    = 10               -- Интервал (с) проверки в SCHEDULER
local PASSIVE_BUOY_RADIUS = UTILS.NMToMeters(5)           -- Радиус пассивного буя
local PASSIVE_SINGLE_PROB = 0.4            -- Базовая вероятность обнаружения одним пассивным буем
local ACTIVE_SONAR_MAX_RANGE = UTILS.NMToMeters(15)        -- Максимальная эффективная дальность активного сонара (м)
local ACTIVE_SONAR_PROB = 0.8              -- Базовая вероятность обнаружения в пределах MaxRange
local SIGNAL_TRAVEL_SPEED = 1500           -- Условная скорость распространения сигнала (м/с)
local DOPPLER_FACTOR    = 0.5              -- Коэффициент влияния скорости субмарины (доплер)
local SONAR_PING_INTERVAL = 15             -- Период «пингов» (если активный сонар включён)
local ALT_LIMIT         = 200              -- Макс. высота (м), на которой вертолёт может использовать сонар
local SPEED_LIMIT       = 100              -- Макс. скорость (км/ч) для использования сонара
local MULTIPLE_PASSIVE_MARKER_PROB = 0.6   -- Вероятность постановки маркера при обнаружении >=2 пассивными буями


----------------------------------------------------------------
-- Конфигурация буев (имя, тип, имя зоны, радиус)
----------------------------------------------------------------
local Buoys = {
  -- {
  --   name      = "PS_1",
  --   type      = "PASSIVE",
  --   zoneName  = "PS_1",
  --   zoneObj   = nil,
  --   radius    = UTILS.NMToMeters(10)
  -- },
  -- {
  --   name      = "PS_2",
  --   type      = "PASSIVE",
  --   zoneName  = "PS_2",
  --   radius    = UTILS.NMToMeters(10)
  -- },
  -- {
  --   name      = "AS_1",
  --   type      = "ACTIVE",
  --   zoneName  = "AS_1",
  --   radius    = UTILS.NMToMeters(15)
  -- },
  -- Добавляйте другие буи аналогично
}

--------------------------------------------------------------------------------
-- ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ
--------------------------------------------------------------------------------
local Buoys = {}                 -- Список всех буев (пассивных)
local ActiveSonarOn = false      -- Флаг включения активного сонара
local heliGroupSet = SET_GROUP:New():FilterPrefixes(HELI_PREFIX):FilterStart()
local SubSet = SET_GROUP:New():FilterPrefixes(SUB_PREFIX):FilterStart()


--------------------------------------------------------------------------------
-- ФУНКЦИЯ: СОЗДАТЬ ПАССИВНЫЙ БУЙ НА МЕСТЕ ВЕРТОЛЁТА
--------------------------------------------------------------------------------
local function DeployPassiveBuoy(heliGroup)
  if not heliGroup then return end
  
  -- Координаты вертолёта
  local heliCoord = heliGroup:GetCoordinate()
  
  -- Присваиваем уникальное имя буя
  local buoyIndex = #Buoys + 1
  local buoyName  = string.format("PassiveBuoy_%d", buoyIndex)
  
  -- Создаём виртуальную «зону» вокруг координат вертолёта
  local zoneObj   = ZONE_RADIUS:New(buoyName, heliCoord:GetVec3(), PASSIVE_BUOY_RADIUS)
  
  -- Сохраняем в таблице
  table.insert(Buoys, {
    name   = buoyName,
    coords = heliCoord:GetCoordinate(),
    zone   = zoneObj,
    radius = PASSIVE_BUOY_RADIUS,
    type   = "PASSIVE",
  })
  heliCoord:CircleToAll(PASSIVE_BUOY_RADIUS, heliGroup:GetCoalition())
  heliCoord:CircleToAll(100, heliGroup:GetCoalition())

  MESSAGE:New("Развернут пассивный буй: "..buoyName):ToGroup(heliGroup)
end

--------------------------------------------------------------------------------
-- ФУНКЦИИ ВКЛ./ВЫКЛ. АКТИВНОГО СОНАРА
--------------------------------------------------------------------------------
local function EnableActiveSonar(heliGroup)
  ActiveSonarOn = true
  MESSAGE:New("Активный сонар включён"):ToGroup(heliGroup)
end

local function DisableActiveSonar(heliGroup)
  ActiveSonarOn = false
  MESSAGE:New("Активный сонар отключён"):ToGroup(heliGroup)
end

--------------------------------------------------------------------------------
-- ОСНОВНАЯ ФУНКЦИЯ ПРОВЕРКИ (РАЗ В CHECK_INTERVAL СЕК)
--------------------------------------------------------------------------------
-- Здесь обрабатываем логику пассивных и (при включении) активного сонаров
--------------------------------------------------------------------------------
local function CheckSubDetection(Object, heliGroup)

  ------------------------------------------------------------------------------
  -- СНАЧАЛА ПРОВЕРЯЕМ УСЛОВИЯ ДЛЯ АКТИВНОГО СОНАРА (скорость / высота)
  ------------------------------------------------------------------------------
  if ActiveSonarOn and heliGroup then
    local heliSpeed = heliGroup:GetVelocityKMH() or 0
    local heliAlt   = heliGroup:GetAltitude()    or 0 -- барометрическая или можно AGL
    
    if (heliSpeed > SPEED_LIMIT) or (heliAlt > ALT_LIMIT) then
      -- Превышили лимиты — отключаем
      DisableActiveSonar()
      MESSAGE:New(
        string.format(
          "Активный сонар отключён!\nПревышены лимиты: скорость=%.1f (>%d), высота=%.1f (>%d)",
          heliSpeed, SPEED_LIMIT, heliAlt, ALT_LIMIT
        )
      ):ToGroup(heliGroup)
    end
  end

   ------------------------------------------------------------------------------
  -- ДЛЯ КАЖДОЙ СУБМАРИНЫ
  ------------------------------------------------------------------------------
  for _, subGroup in pairs(SubSet:GetSet()) do
    local subCoord = subGroup:GetCoordinate()
    local subSpeed = subGroup:GetVelocityKMH() or 0
    
    ----------------------------------------------------------------------------
    -- 1) ПАССИВНЫЕ БУИ: СЛОЖЕНИЕ ВЕРОЯТНОСТЕЙ
    ----------------------------------------------------------------------------
    local passiveCount = 0
    for _, buoy in ipairs(Buoys) do
      if buoy.type == "PASSIVE" then
        local dist = UTILS.VecDist2D(subCoord:GetVec2(), buoy.coords:GetVec2())
        if dist <= buoy.radius then
          passiveCount = passiveCount + 1
        end
      end
    end
    
    if passiveCount > 0 then
      local combinedProb = 1 - (1 - PASSIVE_SINGLE_PROB)^passiveCount
      if math.random() < combinedProb then
        local msg = string.format(
          "\n\n\nПассивные буи обнаружили субмарину (%d буев).\nВероятность=%.2f",
          passiveCount, combinedProb
        )
        MESSAGE:New(msg):ToAll()
        
        -- Если >=2 буев, с вероятностью MULTIPLE_PASSIVE_MARKER_PROB ставим маркер
        if passiveCount > 1 and math.random() < MULTIPLE_PASSIVE_MARKER_PROB then
          local marker = MARKER:New(subCoord, "Пассивное обнаружение (триангуляция)"):ToAll()
          marker:Remove(CHECK_INTERVAL) -- Удаляем через цикл планировщика
        end
      end
    end
      ----------------------------------------------------------------------------
    -- 2) АКТИВНЫЙ СОНАР (если включён)
    --    Каждые SONAR_PING_INTERVAL секунд делаем «пинг»:
    --    Для упрощения, проверяем прямо в этом же цикле (или можно отдельный таймер).
    ----------------------------------------------------------------------------
    if ActiveSonarOn and heliGroup then
      -- Считаем время пути сигнала (туда-обратно)
      local heliCoord = heliGroup:GetCoordinate()
      local distance  = heliCoord:Get3DDistance(subCoord)
      
      -- Если за пределами максимальной дистанции — не услышим
      if distance <= ACTIVE_SONAR_MAX_RANGE then
        local signalTime = (distance * 2) / SIGNAL_TRAVEL_SPEED
        
        -- Создаём отложенный вызов на "эхо"
        SCHEDULER:New(nil, function()
          -- Учитываем доплер
          local dopplerAdjustment = 1 - (subSpeed * DOPPLER_FACTOR / 100)
          if dopplerAdjustment < 0 then dopplerAdjustment = 0 end
          
          local distFactor = 1 - (distance / ACTIVE_SONAR_MAX_RANGE)
          local detectProb = ACTIVE_SONAR_PROB * dopplerAdjustment * distFactor
          
          if math.random() < detectProb then
            local bearing = UTILS.HdgTo(heliCoord:GetVec3(), subCoord:GetVec3())
            local msg = string.format(
              "АКТИВНЫЙ СОНАР: контакт!\n" ..
              "Дальность=%.0f м\nПеленг=%d°\nСкорость цели=%.1f км/ч",
              distance, math.floor(bearing), subSpeed
            )
            MESSAGE:New(msg):ToAll()
            
            -- Ставим маркер при обнаружении
            local marker = MARKER:New(subCoord, "Активное обнаружение"):ToAll()
            marker:Remove(CHECK_INTERVAL)
          else
            -- Можно выводить/не выводить сообщение об отсутствии эха
            MESSAGE:New("Активный сонар: эхо не распознано..."):ToGroup(heliGroup)
          end
        end, {}, signalTime)
      end
    end
  end
end

--------------------------------------------------------------------------------
-- ЗАПУСК ЕДИНОГО ПЛАНИРОВЩИКА
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- СОЗДАНИЕ МЕНЮ ДЛЯ ВЕРТОЛЁТА
--------------------------------------------------------------------------------
local mainMenu = nil

for _, heliGroup in pairs(heliGroupSet:GetSet()) do
  if heliGroup then
    mainMenu = MENU_GROUP:New(heliGroup, "ASW System")
  end

  if mainMenu then
    MENU_GROUP_COMMAND:New(heliGroup, "Развернуть пассивный буй", mainMenu, DeployPassiveBuoy, {heliGroup})
    MENU_GROUP_COMMAND:New(heliGroup, "Включить активный сонар", mainMenu, EnableActiveSonar, {heliGroup})
    MENU_GROUP_COMMAND:New(heliGroup, "Выключить активный сонар", mainMenu, DisableActiveSonar, {heliGroup})
  end
  
  SCHEDULER:New(heliGroup, CheckSubDetection(Object, heliGroup), {heliGroup}, 0, CHECK_INTERVAL) 
end

