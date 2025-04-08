--- OMSJ_Departure.lua
-- Модуль диспетчерской службы Departure (DEP) аэропорта Шарджа
-- @module OMSJ_Departure

--- Класс для диспетчерской службы Departure
-- @type OMSJ_Departure
OMSJ_Departure = {
  ClassName = "OMSJ_Departure",
  ServiceName = "DEP",
  ActiveRunway = nil,       -- Активная ВПП
  ActiveSIDs = {},          -- Активные SID
  MainMenu = nil,           -- Главное меню Departure
  SubMenus = {},            -- Подменю Departure
  ControlZoneRadius = 80000 -- Радиус зоны контроля в метрах
}

--- Создает новый экземпляр Departure
-- @param #OMSJ_Config config Конфигурация
-- @param #OMSJ_Utils utils Утилиты
-- @param #OMSJ_SRS srs SRS
-- @param #OMSJ_Procedures procedures Процедуры
-- @return #OMSJ_Departure
function OMSJ_Departure:New(config, utils, srs, procedures)
  local self = BASE:Inherit(self, OMSJ_ATC_Service:New(self.ServiceName, config, utils, srs, procedures))
  
  -- Определение активной ВПП
  self.ActiveRunway = config:DetermineActiveRunway()
  
  -- Инициализация активных SID
  self:InitializeActiveSIDs()
  
  return self
end

--- Инициализирует активные SID
function OMSJ_Departure:InitializeActiveSIDs()
  -- Получение всех SID для активной ВПП
  local sids = self.Procedures:GetSIDsForRunway(self.ActiveRunway)
  
  -- Сохранение активных SID
  self.ActiveSIDs = sids
  
  self.Utils:Log("Departure active SIDs initialized for runway " .. self.ActiveRunway, "debug", self.Config)
end

--- Инициализирует службу
function OMSJ_Departure:Initialize()
  -- Вызов родительского метода
  OMSJ_ATC_Service.Initialize(self)
  
  -- Дополнительная инициализация для Departure
  self:SetupDepartureEventHandlers()
  
  self.Utils:Log("Departure service initialized", "info", self.Config)
  
  return self
end

--- Настраивает обработчики событий для Departure
function OMSJ_Departure:SetupDepartureEventHandlers()
  -- Обработчик события выхода из зоны контроля
  self:HandleEvent(EVENTS.LeftZone, function(event)
    if event.initiator and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getCoalition() == self.Coalition then
      local client = CLIENT:Find(event.initiator)
      if client then
        self:OnPlayerLeaveControlZone(client:GetPlayerName())
      end
    end
  end)
  
  -- Обработчик события достижения определенной высоты
  self:HandleEvent(EVENTS.AltitudeChange, function(event)
    if event.initiator and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getCoalition() == self.Coalition then
      local client = CLIENT:Find(event.initiator)
      if client and client:GetAltitude() > 3000 then -- 3000 метров
        self:OnPlayerReachCruiseAltitude(client:GetPlayerName())
      end
    end
  end)
end

--- Создает меню F10 для Departure
function OMSJ_Departure:CreateMenu()
  -- Получение конфигурации меню
  local menuConfig = self.Config:GetMenuConfig()
  
  -- Создание главного меню Departure
  self.MainMenu = MENU_GROUP:New(GROUP:FindByName("all"), "Departure (" .. self.Utils:FormatFrequency(self.Frequency) .. ")")
  
  -- Создание подменю для запроса SID
  self.SubMenus.SID = MENU_GROUP:New(GROUP:FindByName("all"), "Request SID", self.MainMenu)
  
  -- Добавление пунктов меню для разных SID
  for name, sid in pairs(self.ActiveSIDs) do
    MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), sid.description, self.SubMenus.SID, self.HandleSIDRequest, self, {sid = name})
  end
  
  -- Создание подменю для запроса набора высоты
  self.SubMenus.Climb = MENU_GROUP:New(GROUP:FindByName("all"), "Request Climb", self.MainMenu)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "To FL100", self.SubMenus.Climb, self.HandleClimbRequest, self, {altitude = 10000})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "To FL200", self.SubMenus.Climb, self.HandleClimbRequest, self, {altitude = 20000})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "To FL300", self.SubMenus.Climb, self.HandleClimbRequest, self, {altitude = 30000})
  
  -- Создание подменю для запроса информации
  self.SubMenus.Info = MENU_GROUP:New(GROUP:FindByName("all"), "Request Information", self.MainMenu)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Weather Info", self.SubMenus.Info, self.HandleWeatherInfo, self, {})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Radio Check", self.SubMenus.Info, self.HandleRadioCheck, self, {})
  
  self.Utils:Log("Departure menu created", "debug", self.Config)
end

--- Обрабатывает запрос на SID
-- @param #table args Аргументы запроса
function OMSJ_Departure:HandleSIDRequest(args)
  local playerName = self:GetPlayerName()
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  local sidName = args.sid
  
  -- Получение информации о SID
  local sid = self.Procedures:GetSID(sidName)
  if not sid then
    self.Utils:Log("SID not found: " .. sidName, "warning", self.Config)
    return
  end
  
  -- Получение информации о погоде
  local position = client:GetPosition().p
  local weatherInfo = self.Utils:GetWeatherInfo(position)
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, cleared %s departure, climb to %s, squawk %s",
    callsign,
    self.Callsign,
    sid.description,
    self.Utils:FormatAltitude(5000, true), -- 5000 метров в футах
    "2000" -- Пример кода ответчика
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    status = "sid",
    sid = sidName,
    runway = self.ActiveRunway,
    sidTime = os.time(),
    clearanceAltitude = 5000
  })
  
  self.Utils:Log("SID clearance issued to " .. playerName .. ": " .. sidName, "info", self.Config)
end

--- Обрабатывает запрос на набор высоты
-- @param #table args Аргументы запроса
function OMSJ_Departure:HandleClimbRequest(args)
  local playerName = self:GetPlayerName()
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  local altitude = args.altitude or 10000 -- По умолчанию FL100
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, climb to %s",
    callsign,
    self.Callsign,
    self.Utils:FormatAltitude(altitude, true) -- Высота в футах
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    clearanceAltitude = altitude,
    climbTime = os.time()
  })
  
  self.Utils:Log("Climb clearance issued to " .. playerName .. " to " .. altitude .. " feet", "info", self.Config)
  
  -- Если высота достаточно большая, планируем передачу в Enroute
  if altitude >= 20000 then
    SCHEDULER:New(nil, function()
      if self:IsPlayerActive(playerName) then
        self:TransferToEnroute(playerName)
      end
    end, {}, 120) -- Через 120 секунд передаем в Enroute
  end
end

--- Передает управление в Enroute (Center)
-- @param #string playerName Имя игрока
function OMSJ_Departure:TransferToEnroute(playerName)
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, contact Emirates Center on 124.50, good day",
    callsign,
    self.Callsign
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Удаление игрока из активных
  self:RemovePlayer(playerName)
  
  self.Utils:Log("Player transferred to Enroute: " .. playerName, "info", self.Config)
end

--- Обработчик выхода игрока из зоны контроля
-- @param #string playerName Имя игрока
function OMSJ_Departure:OnPlayerLeaveControlZone(playerName)
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  -- Проверка, находится ли игрок на связи
  if not self:IsPlayerActive(playerName) then
    return
  end
  
  local callsign = self.Utils:GetCallsign(client)
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, radar service terminated, frequency change approved, good day",
    callsign,
    self.Callsign
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Удаление игрока из активных
  self:RemovePlayer(playerName)
  
  self.Utils:Log("Player left control zone: " .. playerName, "info", self.Config)
end

--- Обработчик достижения игроком крейсерской высоты
-- @param #string playerName Имя игрока
function OMSJ_Departure:OnPlayerReachCruiseAltitude(playerName)
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  -- Проверка, находится ли игрок на связи
  if not self:IsPlayerActive(playerName) then
    return
  end
  
  local playerData = self:GetPlayerData(playerName)
  
  -- Проверка, не было ли уже сообщения о достижении высоты
  if playerData.reachedCruise then
    return
  end
  
  local callsign = self.Utils:GetCallsign(client)
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, maintain %s, proceed on course",
    callsign,
    self.Callsign,
    self.Utils:FormatAltitude(client:GetAltitude(), true) -- Текущая высота в футах
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    reachedCruise = true,
    cruiseAltitude = client:GetAltitude(),
    cruiseTime = os.time()
  })
  
  -- Планирование передачи в Enroute
  SCHEDULER:New(nil, function()
    if self:IsPlayerActive(playerName) then
      self:TransferToEnroute(playerName)
    end
  end, {}, 60) -- Через 60 секунд передаем в Enroute
  
  self.Utils:Log("Player reached cruise altitude: " .. playerName, "info", self.Config)
end

--- Получает имя текущего игрока
-- @return #string Имя игрока
function OMSJ_Departure:GetPlayerName()
  return CLIENT:GetPlayerName()
end

--- Устанавливает активную ВПП
-- @param #string runway Номер ВПП
function OMSJ_Departure:SetActiveRunway(runway)
  if runway == "12" or runway == "30" then
    self.ActiveRunway = runway
    
    -- Обновление активных SID
    self:InitializeActiveSIDs()
    
    -- Обновление меню
    self:CreateMenu()
    
    self.Utils:Log("Active runway set to " .. runway, "info", self.Config)
    return true
  else
    self.Utils:Log("Invalid runway: " .. tostring(runway), "warning", self.Config)
    return false
  end
end

--- Получает активную ВПП
-- @return #string Номер активной ВПП
function OMSJ_Departure:GetActiveRunway()
  return self.ActiveRunway
end

--- Получает активные SID
-- @return #table Активные SID
function OMSJ_Departure:GetActiveSIDs()
  return self.ActiveSIDs
end

return OMSJ_Departure
