-- Выключили ненужные меню
_SETTINGS:SetPlayerMenuOff()

----------------------------------------------------------------
-- ПАРАМЕТРЫ
----------------------------------------------------------------
local SUB_PREFIX        = "BLUE_SM"        -- Префикс групп подводных лодок
local PASSIVE_BUOY_RADIUS = UTILS.NMToMeters(5)           -- Радиус пассивного буя
local PASSIVE_SINGLE_PROB = 0.4            -- Базовая вероятность обнаружения одним пассивным буем
local ACTIVE_SONAR_MAX_RANGE = UTILS.NMToMeters(15)        -- Максимальная эффективная дальность активного сонара (м)
local ACTIVE_SONAR_PROB = 0.8              -- Базовая вероятность обнаружения в пределах MaxRange
local SIGNAL_TRAVEL_SPEED = 1500           -- Условная скорость распространения сигнала (м/с)
local DOPPLER_FACTOR    = 0.5              -- Коэффициент влияния скорости субмарины (доплер)
local SONAR_PING_INTERVAL = 15             -- Период «пингов» (если активный сонар включён)
local PASSIVE_INTERVAL    = 10               -- Интервал (с) проверки в SCHEDULER
local ALT_LIMIT         = 200              -- Макс. высота (м), на которой вертолёт может использовать сонар
local SPEED_LIMIT       = 100              -- Макс. скорость (км/ч) для использования сонара
local MULTIPLE_PASSIVE_MARKER_PROB = 0.6   -- Вероятность постановки маркера при обнаружении >=2 пассивными буями


----------------------------------------------------------------
-- Конфигурация буев (имя, тип, имя зоны, радиус)
----------------------------------------------------------------
-- local Buoys = {
  -- {
  --   name      = "PS_1",
  --   type      = "PASSIVE",
  --   zoneName  = "PS_1",
  --   zoneObj   = nil,
  --   radius    = UTILS.NMToMeters(10)
  -- }
-- }

--------------------------------------------------------------------------------
-- ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ
--------------------------------------------------------------------------------
local Buoys = {}                 -- Список всех буев (пассивных)
local ActiveSonarOn = false      -- Флаг включения активного сонара
local RedHeliClients  = SET_CLIENT:New():FilterCoalitions("red"):FilterCategories("helicopter"):FilterStart()
local HeliStates = {}
local SubSet = SET_GROUP:New():FilterPrefixes(SUB_PREFIX):FilterStart()



------------------------------------------------------------------------------
-- ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ
------------------------------------------------------------------------------

-- Создаём фигуру круга (или овала) вокруг координат
local function DrawBuoyShape(buoyName, centerCoord, radius)
  local shapeObj = OVAL:New(centerCoord:GetVec2(), radius, radius, 0)
  shapeObj:Draw(0, nil)
  return shapeObj
end

--------------------------------------------------------------------------------
-- ФУНКЦИИ-МЕНЮ (вызваются, когда пользователь нажимает пункт в F10)
--------------------------------------------------------------------------------

-- Создать/сбросить пассивный буй
local function DeployPassiveBuoy(Group, Client)
  local cname     = Client:GetName()
  local cgroup    = Client:GetGroup()
  if not cgroup or not cgroup:IsAlive() then return end
  
  -- Инициализируем состояние (если вдруг не было)
  if not HeliStates[cname] then
    HeliStates[cname] = {
      ActiveSonarOn = false,
      Buoys         = {}
    }
  end
  
  local state     = HeliStates[cname]
  local heliCoord = cgroup:GetCoordinate()
  
  local buoyIndex = #state.Buoys + 1
  local buoyName  = string.format("PassiveBuoy_%s_%d", cname, buoyIndex)

  local zoneObj   = ZONE_RADIUS:New(buoyName, heliCoord:GetVec2(), PASSIVE_BUOY_RADIUS):DrawZone(cgroup:GetCoalition(), {1,0,0})
  
  table.insert(state.Buoys, {
    name     = buoyName,
    zone     = zoneObj,
    radius   = PASSIVE_BUOY_RADIUS,
    type     = "PASSIVE"    
  })
  
  MESSAGE:New("Сброшен пассивный буй: " .. buoyName):ToClient(Client)
end

-- Включить активный сонар
local function EnableActiveSonar(Group, Client)
  local cname = Client:GetName()
  if not HeliStates[cname] then
    HeliStates[cname] = { ActiveSonarOn = false, Buoys = {} }
  end
  
  HeliStates[cname].ActiveSonarOn = true
  MESSAGE:New("Активный сонар включён"):ToClient(Client)
end

-- Выключить активный сонар
local function DisableActiveSonar(Group, Client)
  local cname = Client:GetName()
  if HeliStates[cname] then
    HeliStates[cname].ActiveSonarOn = false
    MESSAGE:New("Активный сонар отключён"):ToClient(Client)
  end
end

--------------------------------------------------------------------------------
-- CLIENTMENU_MANAGER: Создаём меню для всех "RedHeliClients"
--------------------------------------------------------------------------------
local RedMenuManager = CLIENTMENUMANAGER:New(RedHeliClients, "Sonar")

-- Создаём корневое подменю
local mainSubMenu = RedMenuManager:NewEntry("Sonar Menu")

-- Добавляем команды:
--   :AddCommandForEach(MenuText, ParentMenu, FunctionCallback, ArgumentForFunction, ...)
--   Функция коллбэка получает (Menu, Client) в качестве аргументов
RedMenuManager:NewEntry("Сбросить пассивный буй", mainSubMenu, DeployPassiveBuoy)
RedMenuManager:NewEntry("Включить активный сонар", mainSubMenu, EnableActiveSonar)
RedMenuManager:NewEntry("Выключить активный сонар", mainSubMenu, DisableActiveSonar)
RedMenuManager:Propagate()
RedMenuManager:InitAutoPropagation()

--------------------------------------------------------------------------------
-- ОБРАБОТЧИК СОБЫТИЙ (Birth, Dead, Crash, PlayerLeaveUnit)
-- для инициализации/удаления состояния
--------------------------------------------------------------------------------
local EventHandler = EVENTHANDLER:New()

-- Инициализация состояния
local function InitClientState(client)
  if client then
    local cname = client:GetName()
    if not HeliStates[cname] then
      HeliStates[cname] = {
        ActiveSonarOn = false,
        Buoys         = {}
      }
    end
  end
end

local function RemoveClientState(unitName)
  if HeliStates[unitName] then
    -- Удаляем Shape-объекты
    for _, buoy in ipairs(HeliStates[unitName].Buoys) do
      if buoy.shapeObj then
        buoy.shapeObj:Remove()
      end
    end
    HeliStates[unitName] = nil
  end
end

function EventHandler:OnEventBirth(EventData)
  if EventData.IniPlayerName then
    local unitName = EventData.IniUnitName
    local client = CLIENT:FindByName(unitName)
    if client then
      InitClientState(client)
    end
  end
end

function EventHandler:OnEventDead(EventData)
  if EventData.IniPlayerName then
    RemoveClientState(EventData.IniUnitName)
  end
end

function EventHandler:OnEventCrash(EventData)
  if EventData.IniPlayerName then
    RemoveClientState(EventData.IniUnitName)
  end
end

function EventHandler:OnEventPlayerLeaveUnit(EventData)
  if EventData.IniPlayerName then
    RemoveClientState(EventData.IniUnitName)
  end
end

EventHandler:HandleEvent(EVENTS.Birth, EVENTS.Dead, EVENTS.Crash, EVENTS.PlayerLeaveUnit)

----------------------------------------------------------------
-- 1) ПАССИВНОЕ ОБНАРУЖЕНИЕ
----------------------------------------------------------------
local function PassiveCheck()
  for _, subGroup in pairs(SubSet:GetSet()) do
    local subCoord = subGroup:GetCoordinate()
    local passiveCount = 0
    
    -- Считаем, сколько пассивных буев «слышит» субмарину
    for _, buoy in ipairs(Buoys) do
      if buoy.type == "PASSIVE" then
        local dist = subCoord:Get2DDistance(buoy.zone:GetCoordinate())
        if dist <= buoy.radius then
          passiveCount = passiveCount + 1
        end
      end
    end
    
    if passiveCount > 0 then
      local combinedProb = 1 - (1 - PASSIVE_SINGLE_PROB)^passiveCount
      if math.random() < combinedProb then
        -- Сообщение для всех живых красных вертолётов
        local msg = string.format(
          "[ПАССИВНО] Обнаружена субмарина (%d буев).",
          passiveCount
        )
        
        for _, clientData in pairs(RedHeliClients:GetSet()) do
          local cgroup = clientData:GetGroup()
          if cgroup and cgroup:IsAlive() then
            MESSAGE:New(msg):ToGroup(cgroup)
          end
        end
        
        -- Если буев >=2, ставим маркер
        if passiveCount > 1 and math.random() < MULTIPLE_PASSIVE_MARKER_PROB then
          local marker = MARKER:New(subCoord, "Пассивное обнаружение"):ToAll()
          marker:Remove(PASSIVE_INTERVAL)
        end
      end
    end
  end
end
----------------------------------------------------------------
-- 2) АКТИВНОЕ ОБНАРУЖЕНИЕ
----------------------------------------------------------------
local function ActiveCheck()
  for _, clientData in pairs(RedHeliClients:GetSet()) do
    local client   = clientData
    local cgroup   = client:GetGroup()
    if cgroup and cgroup:IsAlive() then
      local cname = client:GetName()
      local state = HeliStates[cname]
      
      if state and state.ActiveSonarOn then
        -- Проверяем лимиты
        local heliSpeed = cgroup:GetVelocityKMH() or 0
        local heliAlt   = cgroup:GetAltitude() or 0
        
        if heliSpeed > SPEED_LIMIT or heliAlt > ALT_LIMIT then
          state.ActiveSonarOn = false
          MESSAGE:New(
            string.format(
              "Сонар %s отключен! Превышен лимит (V=%.1f / H=%.0f)",
              cname, heliSpeed, heliAlt
            )
          ):ToGroup(cgroup)
        else
          -- Собираем инфо об обнаруженных субмаринах
          local foundSubs = {}
          local heliCoord = cgroup:GetCoordinate()
          
          for _, subGroup in pairs(SubSet:GetSet()) do
            local subCoord = subGroup:GetCoordinate()
            local subSpeed = subGroup:GetVelocityKMH() or 0
            local distance = heliCoord:Get3DDistance(subCoord)
            
            if distance <= ACTIVE_SONAR_MAX_RANGE then
              -- Пример упрощённой вероятности (без задержки эха)
              local dopplerAdj = 1 - (subSpeed * DOPPLER_FACTOR / 100)
              if dopplerAdj < 0 then dopplerAdj = 0 end
              
              local distFactor = 1 - (distance / ACTIVE_SONAR_MAX_RANGE)
              local detectProb = ACTIVE_SONAR_PROB * dopplerAdj * distFactor
              
              if math.random() < detectProb then
                local bearing = UTILS.HdgTo(heliCoord:GetVec3(), subCoord:GetVec3())
                table.insert(foundSubs, {
                  name     = subGroup:GetName(),
                  distance = distance,
                  bearing  = math.floor(bearing),
                  speed    = subSpeed
                })
                local marker = MARKER:New(subCoord, "Активное обнаружение (".. subGroup:GetName() ..")"):ToAll()
                marker:Remove(SONAR_PING_INTERVAL)
              end
            end
          end
          
          if #foundSubs > 0 then
            local msg = string.format("АКТИВНЫЙ сонар %s:\nОбнаружено целей: %d\n", cname, #foundSubs)
            for _, subInfo in ipairs(foundSubs) do
              msg = msg .. string.format(
                "- %s: Д=%.0f м, П=%d°, V=%.1f\n",
                subInfo.name, subInfo.distance, subInfo.bearing, subInfo.speed
              )
            end
            MESSAGE:New(msg):ToGroup(cgroup)
          end
        end
      end
    end
  end
end

----------------------------------------------------------------
-- ЗАПУСК ДВУХ ПЛАНИРОВЩИКОВ
----------------------------------------------------------------
SCHEDULER:New(nil, PassiveCheck, {}, 0, PASSIVE_INTERVAL)
SCHEDULER:New(nil, ActiveCheck,  {}, 0, SONAR_PING_INTERVAL)