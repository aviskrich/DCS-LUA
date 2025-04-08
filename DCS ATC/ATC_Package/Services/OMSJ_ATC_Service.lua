--- OMSJ_ATC_Service.lua
-- Базовый класс для всех диспетчерских служб аэропорта Шарджа
-- @module OMSJ_ATC_Service

--- Базовый класс для всех диспетчерских служб
-- @type OMSJ_ATC_Service
OMSJ_ATC_Service = {
  ClassName = "OMSJ_ATC_Service",
  Callsign = nil,           -- Позывной службы
  Frequency = nil,          -- Основная частота
  AlternateFrequencies = {}, -- Альтернативные частоты
  Modulation = 0,           -- Модуляция (0 = AM, 1 = FM)
  ActivePlayers = {},       -- Активные игроки на связи
  Coalition = 2,            -- Коалиция (0 = нейтральная, 1 = красная, 2 = синяя)
  MenuF10 = nil,            -- Меню F10
  Config = nil,             -- Ссылка на конфигурацию
  Utils = nil,              -- Ссылка на утилиты
  SRS = nil,                -- Ссылка на SRS
  Procedures = nil          -- Ссылка на процедуры
}

--- Создает новый экземпляр ATC_Service
-- @param #string serviceName Имя службы (TWR, APP, DEP)
-- @param #OMSJ_Config config Конфигурация
-- @param #OMSJ_Utils utils Утилиты
-- @param #OMSJ_SRS srs SRS
-- @param #OMSJ_Procedures procedures Процедуры
-- @return #OMSJ_ATC_Service
function OMSJ_ATC_Service:New(serviceName, config, utils, srs, procedures)
  local self = BASE:Inherit(self, BASE:New())
  
  self.Config = config
  self.Utils = utils
  self.SRS = srs
  self.Procedures = procedures
  
  -- Загрузка конфигурации службы
  local serviceConfig = config:GetServiceConfig(serviceName)
  if serviceConfig then
    self.Callsign = serviceConfig.Callsign
    self.Frequency = serviceConfig.Frequency
    self.Modulation = serviceConfig.Modulation
    self.Coalition = serviceConfig.Coalition
  else
    self.Utils:Log("Service configuration not found for: " .. serviceName, "warning", self.Config)
  end
  
  self.ActivePlayers = {}
  
  return self
end

--- Инициализирует службу
function OMSJ_ATC_Service:Initialize()
  -- Создание меню F10
  self:CreateMenu()
  
  -- Настройка обработчиков событий
  self:SetupEventHandlers()
  
  self.Utils:Log(self.Callsign .. " initialized", "info", self.Config)
  
  return self
end

--- Настраивает обработчики событий
function OMSJ_ATC_Service:SetupEventHandlers()
  -- Обработчик события появления игрока
  self:HandleEvent(EVENTS.Birth, function(event)
    if event.initiator and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getCoalition() == self.Coalition then
      local client = CLIENT:Find(event.initiator)
      if client then
        self:OnPlayerEnter(client:GetPlayerName())
      end
    end
  end)
  
  -- Обработчик события ухода игрока
  self:HandleEvent(EVENTS.RemoveUnit, function(event)
    if event.initiator and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getCoalition() == self.Coalition then
      local client = CLIENT:Find(event.initiator)
      if client then
        self:OnPlayerLeave(client:GetPlayerName())
      end
    end
  end)
end

--- Обрабатывает запрос от игрока
-- @param #string playerName Имя игрока
-- @param #string requestType Тип запроса
-- @param #table requestData Данные запроса
function OMSJ_ATC_Service:HandleRequest(playerName, requestType, requestData)
  self.Utils:Log(self.Callsign .. " received request: " .. requestType .. " from " .. playerName, "debug", self.Config)
  
  -- Проверка наличия игрока
  local client = CLIENT:FindByName(playerName)
  if not client then
    self.Utils:Log("Client not found: " .. playerName, "warning", self.Config)
    return false
  end
  
  -- Добавление игрока в активные, если его там нет
  if not self.ActivePlayers[playerName] then
    self:AddPlayer(playerName)
  end
  
  -- Обработка запроса в зависимости от типа
  if requestType == "radio_check" then
    return self:HandleRadioCheck(playerName, requestData)
  elseif requestType == "weather_info" then
    return self:HandleWeatherInfo(playerName, requestData)
  else
    self.Utils:Log("Unknown request type: " .. requestType, "warning", self.Config)
    return false
  end
end

--- Обрабатывает запрос проверки радиосвязи
-- @param #string playerName Имя игрока
-- @param #table requestData Данные запроса
-- @return #boolean Успешность обработки
function OMSJ_ATC_Service:HandleRadioCheck(playerName, requestData)
  local client = CLIENT:FindByName(playerName)
  if not client then return false end
  
  local callsign = self.Utils:GetCallsign(client)
  local message = callsign .. ", " .. self.Callsign .. ", reading you five by five"
  
  return self:SendMessage(playerName, message)
end

--- Обрабатывает запрос информации о погоде
-- @param #string playerName Имя игрока
-- @param #table requestData Данные запроса
-- @return #boolean Успешность обработки
function OMSJ_ATC_Service:HandleWeatherInfo(playerName, requestData)
  local client = CLIENT:FindByName(playerName)
  if not client then return false end
  
  local callsign = self.Utils:GetCallsign(client)
  local position = client:GetPosition().p
  local weatherInfo = self.Utils:GetWeatherInfo(position)
  local formattedWeather = self.Utils:FormatWeatherInfo(weatherInfo)
  
  local activeRunway = self.Config:DetermineActiveRunway()
  local message = callsign .. ", " .. self.Callsign .. ", " .. formattedWeather .. ", runway in use " .. activeRunway
  
  return self:SendMessage(playerName, message)
end

--- Отправляет сообщение игроку через SRS
-- @param #string playerName Имя игрока
-- @param #string message Сообщение
-- @return #boolean Успешность отправки
function OMSJ_ATC_Service:SendMessage(playerName, message)
  local client = CLIENT:FindByName(playerName)
  if not client then return false end
  
  local position = client:GetPosition().p
  
  local success = self.SRS:SendMessage(
    message,
    self.Frequency,
    self.Modulation,
    self.Callsign,
    self.Coalition,
    position
  )
  
  if success then
    self.Utils:Log("Message sent to " .. playerName .. ": " .. message, "debug", self.Config)
  else
    self.Utils:Log("Failed to send message to " .. playerName, "warning", self.Config)
  end
  
  return success
end

--- Добавляет игрока в список активных
-- @param #string playerName Имя игрока
-- @param #table initialData Начальные данные (опционально)
function OMSJ_ATC_Service:AddPlayer(playerName, initialData)
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  self.ActivePlayers[playerName] = initialData or {
    status = "new",
    lastContact = os.time()
  }
  
  self.Utils:Log("Player added to " .. self.Callsign .. ": " .. playerName, "debug", self.Config)
end

--- Удаляет игрока из списка активных
-- @param #string playerName Имя игрока
function OMSJ_ATC_Service:RemovePlayer(playerName)
  if self.ActivePlayers[playerName] then
    self.ActivePlayers[playerName] = nil
    self.Utils:Log("Player removed from " .. self.Callsign .. ": " .. playerName, "debug", self.Config)
  end
end

--- Обновляет данные игрока
-- @param #string playerName Имя игрока
-- @param #table data Данные для обновления
function OMSJ_ATC_Service:UpdatePlayerData(playerName, data)
  if not self.ActivePlayers[playerName] then
    self:AddPlayer(playerName)
  end
  
  for key, value in pairs(data) do
    self.ActivePlayers[playerName][key] = value
  end
  
  self.ActivePlayers[playerName].lastContact = os.time()
  
  self.Utils:Log("Player data updated for " .. playerName, "debug", self.Config)
end

--- Получает данные игрока
-- @param #string playerName Имя игрока
-- @return #table Данные игрока
function OMSJ_ATC_Service:GetPlayerData(playerName)
  return self.ActivePlayers[playerName]
end

--- Проверяет, активен ли игрок
-- @param #string playerName Имя игрока
-- @return #boolean Активен ли игрок
function OMSJ_ATC_Service:IsPlayerActive(playerName)
  return self.ActivePlayers[playerName] ~= nil
end

--- Создает меню F10 для службы
function OMSJ_ATC_Service:CreateMenu()
  -- Базовая реализация, переопределяется в дочерних классах
  self.Utils:Log("Base CreateMenu called for " .. self.Callsign, "debug", self.Config)
end

--- Обработчик входа игрока в зону ответственности
-- @param #string playerName Имя игрока
function OMSJ_ATC_Service:OnPlayerEnter(playerName)
  self.Utils:Log("Player entered " .. self.Callsign .. " area: " .. playerName, "debug", self.Config)
  self:AddPlayer(playerName)
end

--- Обработчик выхода игрока из зоны ответственности
-- @param #string playerName Имя игрока
function OMSJ_ATC_Service:OnPlayerLeave(playerName)
  self.Utils:Log("Player left " .. self.Callsign .. " area: " .. playerName, "debug", self.Config)
  self:RemovePlayer(playerName)
end

--- Передает управление в другую службу
-- @param #string playerName Имя игрока
-- @param #string targetService Имя целевой службы (TWR, APP, DEP)
-- @param #table transferData Данные для передачи (опционально)
-- @return #boolean Успешность передачи
function OMSJ_ATC_Service:TransferControl(playerName, targetService, transferData)
  local client = CLIENT:FindByName(playerName)
  if not client then return false end
  
  local callsign = self.Utils:GetCallsign(client)
  local targetServiceObj = nil
  
  -- Определение целевой службы
  if targetService == "TWR" then
    targetServiceObj = OMSJ_ATC.Tower
  elseif targetService == "APP" then
    targetServiceObj = OMSJ_ATC.Approach
  elseif targetService == "DEP" then
    targetServiceObj = OMSJ_ATC.Departure
  else
    self.Utils:Log("Unknown target service: " .. targetService, "warning", self.Config)
    return false
  end
  
  if not targetServiceObj then
    self.Utils:Log("Target service object not found: " .. targetService, "warning", self.Config)
    return false
  end
  
  -- Получение данных о целевой службе
  local targetConfig = self.Config:GetServiceConfig(targetService)
  if not targetConfig then
    self.Utils:Log("Target service configuration not found: " .. targetService, "warning", self.Config)
    return false
  end
  
  -- Формирование сообщения о передаче управления
  local message = string.format(
    "%s, contact %s on %s, good day",
    callsign,
    targetConfig.Callsign,
    self.Utils:FormatFrequency(targetConfig.Frequency)
  )
  
  -- Отправка сообщения
  local success = self:SendMessage(playerName, message)
  
  if success then
    -- Передача данных игрока в целевую службу
    local playerData = self.ActivePlayers[playerName] or {}
    local transferDataFull = transferData or {}
    
    for key, value in pairs(playerData) do
      if transferDataFull[key] == nil then
        transferDataFull[key] = value
      end
    end
    
    -- Добавление игрока в целевую службу
    targetServiceObj:AddPlayer(playerName, transferDataFull)
    
    -- Удаление игрока из текущей службы
    self:RemovePlayer(playerName)
    
    self.Utils:Log("Control transferred for " .. playerName .. " from " .. self.Callsign .. " to " .. targetConfig.Callsign, "info", self.Config)
  end
  
  return success
end

--- Получает частоту службы
-- @return #number Частота в МГц
function OMSJ_ATC_Service:GetFrequency()
  return self.Frequency
end

--- Получает позывной службы
-- @return #string Позывной
function OMSJ_ATC_Service:GetCallsign()
  return self.Callsign
end

--- Получает количество активных игроков
-- @return #number Количество игроков
function OMSJ_ATC_Service:CountActivePlayers()
  local count = 0
  for _ in pairs(self.ActivePlayers) do count = count + 1 end
  return count
end

return OMSJ_ATC_Service
