--- OMSJ_Approach.lua
-- Модуль диспетчерской службы Approach (APP) аэропорта Шарджа
-- @module OMSJ_Approach

--- Класс для диспетчерской службы Approach
-- @type OMSJ_Approach
OMSJ_Approach = {
  ClassName = "OMSJ_Approach",
  ServiceName = "APP",
  ActiveRunway = nil,       -- Активная ВПП
  ActiveSTARs = {},         -- Активные STAR
  ActiveApproaches = {},    -- Активные заходы на посадку
  MainMenu = nil,           -- Главное меню Approach
  SubMenus = {},            -- Подменю Approach
  ControlZoneRadius = 50000 -- Радиус зоны контроля в метрах
}

--- Создает новый экземпляр Approach
-- @param #OMSJ_Config config Конфигурация
-- @param #OMSJ_Utils utils Утилиты
-- @param #OMSJ_SRS srs SRS
-- @param #OMSJ_Procedures procedures Процедуры
-- @return #OMSJ_Approach
function OMSJ_Approach:New(config, utils, srs, procedures)
  local self = BASE:Inherit(self, OMSJ_ATC_Service:New(self.ServiceName, config, utils, srs, procedures))
  
  -- Определение активной ВПП
  self.ActiveRunway = config:DetermineActiveRunway()
  
  -- Инициализация активных STAR
  self:InitializeActiveSTARs()
  
  -- Инициализация активных заходов на посадку
  self:InitializeActiveApproaches()
  
  return self
end

--- Инициализирует активные STAR
function OMSJ_Approach:InitializeActiveSTARs()
  -- Получение всех STAR для активной ВПП
  local stars = self.Procedures:GetSTARsForRunway(self.ActiveRunway)
  
  -- Сохранение активных STAR
  self.ActiveSTARs = stars
  
  self.Utils:Log("Approach active STARs initialized for runway " .. self.ActiveRunway, "debug", self.Config)
end

--- Инициализирует активные заходы на посадку
function OMSJ_Approach:InitializeActiveApproaches()
  -- Получение всех заходов для активной ВПП
  local approaches = self.Procedures:GetApproachesForRunway(self.ActiveRunway)
  
  -- Сохранение активных заходов
  self.ActiveApproaches = approaches
  
  self.Utils:Log("Approach active approaches initialized for runway " .. self.ActiveRunway, "debug", self.Config)
end

--- Инициализирует службу
function OMSJ_Approach:Initialize()
  -- Вызов родительского метода
  OMSJ_ATC_Service.Initialize(self)
  
  -- Дополнительная инициализация для Approach
  self:SetupApproachEventHandlers()
  
  self.Utils:Log("Approach service initialized", "info", self.Config)
  
  return self
end

--- Настраивает обработчики событий для Approach
function OMSJ_Approach:SetupApproachEventHandlers()
  -- Обработчик события входа в зону контроля
  self:HandleEvent(EVENTS.EnteredZone, function(event)
    if event.initiator and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getCoalition() == self.Coalition then
      local client = CLIENT:Find(event.initiator)
      if client then
        self:OnPlayerEnterControlZone(client:GetPlayerName())
      end
    end
  end)
  
  -- Обработчик события выхода из зоны контроля
  self:HandleEvent(EVENTS.LeftZone, function(event)
    if event.initiator and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getCoalition() == self.Coalition then
      local client = CLIENT:Find(event.initiator)
      if client then
        self:OnPlayerLeaveControlZone(client:GetPlayerName())
      end
    end
  end)
end

--- Создает меню F10 для Approach
function OMSJ_Approach:CreateMenu()
  -- Получение конфигурации меню
  local menuConfig = self.Config:GetMenuConfig()
  
  -- Создание главного меню Approach
  self.MainMenu = MENU_GROUP:New(GROUP:FindByName("all"), "Approach (" .. self.Utils:FormatFrequency(self.Frequency) .. ")")
  
  -- Создание подменю для запроса STAR
  self.SubMenus.STAR = MENU_GROUP:New(GROUP:FindByName("all"), "Request STAR", self.MainMenu)
  
  -- Добавление пунктов меню для разных STAR
  for name, star in pairs(self.ActiveSTARs) do
    MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), star.description, self.SubMenus.STAR, self.HandleSTARRequest, self, {star = name})
  end
  
  -- Создание подменю для запроса захода на посадку
  self.SubMenus.Approach = MENU_GROUP:New(GROUP:FindByName("all"), "Request Approach", self.MainMenu)
  
  -- Добавление пунктов меню для разных типов захода
  for name, approach in pairs(self.ActiveApproaches) do
    MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), approach.description, self.SubMenus.Approach, self.HandleApproachRequest, self, {approach = name})
  end
  
  -- Создание подменю для запроса векторения
  self.SubMenus.Vectors = MENU_GROUP:New(GROUP:FindByName("all"), "Request Vectors", self.MainMenu)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "For ILS Approach", self.SubMenus.Vectors, self.HandleVectorsRequest, self, {type = "ILS"})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "For Visual Approach", self.SubMenus.Vectors, self.HandleVectorsRequest, self, {type = "VISUAL"})
  
  -- Создание подменю для запроса информации
  self.SubMenus.Info = MENU_GROUP:New(GROUP:FindByName("all"), "Request Information", self.MainMenu)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Weather Info", self.SubMenus.Info, self.HandleWeatherInfo, self, {})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Radio Check", self.SubMenus.Info, self.HandleRadioCheck, self, {})
  
  self.Utils:Log("Approach menu created", "debug", self.Config)
end

--- Обрабатывает запрос на STAR
-- @param #table args Аргументы запроса
function OMSJ_Approach:HandleSTARRequest(args)
  local playerName = self:GetPlayerName()
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  local starName = args.star
  
  -- Получение информации о STAR
  local star = self.Procedures:GetSTAR(starName)
  if not star then
    self.Utils:Log("STAR not found: " .. starName, "warning", self.Config)
    return
  end
  
  -- Получение информации о погоде
  local position = client:GetPosition().p
  local weatherInfo = self.Utils:GetWeatherInfo(position)
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, cleared for %s arrival, runway %s in use, descend to %s, QNH %s",
    callsign,
    self.Callsign,
    star.description,
    self.ActiveRunway,
    self.Utils:FormatAltitude(3000, true), -- 3000 метров в футах
    math.floor(weatherInfo.pressure * 0.750062 * 1000)
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    status = "star",
    star = starName,
    runway = self.ActiveRunway,
    starTime = os.time()
  })
  
  self.Utils:Log("STAR clearance issued to " .. playerName .. ": " .. starName, "info", self.Config)
end

--- Обрабатывает запрос на заход на посадку
-- @param #table args Аргументы запроса
function OMSJ_Approach:HandleApproachRequest(args)
  local playerName = self:GetPlayerName()
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  local approachName = args.approach
  
  -- Получение информации о заходе
  local approach = self.Procedures:GetApproach(approachName)
  if not approach then
    self.Utils:Log("Approach not found: " .. approachName, "warning", self.Config)
    return
  end
  
  -- Формирование сообщения в зависимости от типа захода
  local message = ""
  
  if approach.type == "ILS" then
    message = string.format(
      "%s, %s, cleared for ILS approach runway %s, maintain %s until established on localizer, frequency %s",
      callsign,
      self.Callsign,
      self.ActiveRunway,
      self.Utils:FormatAltitude(2000, true), -- 2000 метров в футах
      self.Utils:FormatFrequency(approach.frequency)
    )
  elseif approach.type == "VOR" then
    message = string.format(
      "%s, %s, cleared for VOR approach runway %s, maintain %s until established on final, frequency %s",
      callsign,
      self.Callsign,
      self.ActiveRunway,
      self.Utils:FormatAltitude(2000, true), -- 2000 метров в футах
      self.Utils:FormatFrequency(approach.frequency)
    )
  else -- RNAV или другой тип
    message = string.format(
      "%s, %s, cleared for %s approach runway %s, maintain %s until established on final",
      callsign,
      self.Callsign,
      approach.type,
      self.ActiveRunway,
      self.Utils:FormatAltitude(2000, true) -- 2000 метров в футах
    )
  end
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    status = "approach",
    approach = approachName,
    runway = self.ActiveRunway,
    approachTime = os.time()
  })
  
  self.Utils:Log("Approach clearance issued to " .. playerName .. ": " .. approachName, "info", self.Config)
  
  -- Планирование передачи управления в Tower
  SCHEDULER:New(nil, function()
    if self:IsPlayerActive(playerName) then
      self:TransferToTower(playerName)
    end
  end, {}, 60) -- Через 60 секунд передаем в Tower
end

--- Обрабатывает запрос на векторение
-- @param #table args Аргументы запроса
function OMSJ_Approach:HandleVectorsRequest(args)
  local playerName = self:GetPlayerName()
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  local vectorType = args.type or "ILS"
  
  -- Получение позиции игрока
  local position = client:GetPosition().p
  
  -- Получение курса на ВПП
  local runwayHeading = self.Config:GetRunwayConfig(self.ActiveRunway).Heading
  
  -- Расчет векторов для захода
  local heading1 = (runwayHeading - 90) % 360
  local heading2 = (runwayHeading - 180) % 360
  local heading3 = (runwayHeading + 90) % 360
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, vectors for %s approach runway %s, turn heading %03d, descend to %s",
    callsign,
    self.Callsign,
    vectorType,
    self.ActiveRunway,
    heading1,
    self.Utils:FormatAltitude(2000, true) -- 2000 метров в футах
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    status = "vectors",
    vectorType = vectorType,
    runway = self.ActiveRunway,
    vectorsTime = os.time(),
    vectorStage = 1,
    heading = heading1
  })
  
  -- Планирование следующих векторов
  SCHEDULER:New(nil, function()
    if self:IsPlayerActive(playerName) and self:GetPlayerData(playerName).vectorStage == 1 then
      self:SendNextVector(playerName, 2, heading2)
    end
  end, {}, 60) -- Через 60 секунд даем следующий вектор
  
  SCHEDULER:New(nil, function()
    if self:IsPlayerActive(playerName) and self:GetPlayerData(playerName).vectorStage == 2 then
      self:SendNextVector(playerName, 3, heading3)
    end
  end, {}, 120) -- Через 120 секунд даем следующий вектор
  
  SCHEDULER:New(nil, function()
    if self:IsPlayerActive(playerName) and self:GetPlayerData(playerName).vectorStage == 3 then
      self:SendFinalVector(playerName, runwayHeading)
    end
  end, {}, 180) -- Через 180 секунд даем финальный вектор
  
  self.Utils:Log("Vectors issued to " .. playerName .. " for " .. vectorType .. " approach", "info", self.Config)
end

--- Отправляет следующий вектор для захода
-- @param #string playerName Имя игрока
-- @param #number stage Этап векторения
-- @param #number heading Курс
function OMSJ_Approach:SendNextVector(playerName, stage, heading)
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, turn heading %03d, maintain %s",
    callsign,
    self.Callsign,
    heading,
    self.Utils:FormatAltitude(stage * 500, true) -- Снижение высоты с каждым вектором
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    vectorStage = stage,
    heading = heading
  })
  
  self.Utils:Log("Next vector issued to " .. playerName .. ": heading " .. heading, "debug", self.Config)
end

--- Отправляет финальный вектор для захода
-- @param #string playerName Имя игрока
-- @param #number finalHeading Финальный курс
function OMSJ_Approach:SendFinalVector(playerName, finalHeading)
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  local playerData = self:GetPlayerData(playerName)
  
  -- Определение типа захода
  local approachType = playerData.vectorType or "ILS"
  
  -- Формирование сообщения
  local message = ""
  
  if approachType == "ILS" then
    -- Получение частоты ILS
    local ilsFrequency = self.Config:GetRunwayConfig(self.ActiveRunway).ILS.Frequency
    
    message = string.format(
      "%s, %s, turn heading %03d for final approach, cleared for ILS approach runway %s, contact Tower on %s when established",
      callsign,
      self.Callsign,
      finalHeading,
      self.ActiveRunway,
      self.Utils:FormatFrequency(self.Config:GetServiceConfig("TWR").Frequency)
    )
  else
    message = string.format(
      "%s, %s, turn heading %03d for final approach, cleared for visual approach runway %s, contact Tower on %s when established",
      callsign,
      self.Callsign,
      finalHeading,
      self.ActiveRunway,
      self.Utils:FormatFrequency(self.Config:GetServiceConfig("TWR").Frequency)
    )
  end
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    vectorStage = 4,
    heading = finalHeading,
    status = "final"
  })
  
  -- Планирование передачи управления в Tower
  SCHEDULER:New(nil, function()
    if self:IsPlayerActive(playerName) then
      self:TransferToTower(playerName)
    end
  end, {}, 30) -- Через 30 секунд передаем в Tower
  
  self.Utils:Log("Final vector issued to " .. playerName .. ": heading " .. finalHeading, "info", self.Config)
end

--- Передает управление в Tower
-- @param #string playerName Имя игрока
function OMSJ_Approach:TransferToTower(playerName)
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local playerData = self:GetPlayerData(playerName)
  
  -- Передача управления в Tower
  self:TransferControl(playerName, "TWR", {
    status = "final",
    runway = self.ActiveRunway,
    approach = playerData.approach,
    vectorType = playerData.vectorType
  })
  
  self.Utils:Log("Control transferred to Tower for " .. playerName, "info", self.Config)
end

--- Обработчик входа игрока в зону контроля
-- @param #string playerName Имя игрока
function OMSJ_Approach:OnPlayerEnterControlZone(playerName)
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  
  -- Проверка, не находится ли игрок уже на связи
  if self:IsPlayerActive(playerName) then
    return
  end
  
  -- Получение информации о погоде
  local position = client:GetPosition().p
  local weatherInfo = self.Utils:GetWeatherInfo(position)
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, radar contact, %s, runway %s in use, QNH %s",
    callsign,
    self.Callsign,
    self.Utils:FormatAltitude(client:GetAltitude(), true),
    self.ActiveRunway,
    math.floor(weatherInfo.pressure * 0.750062 * 1000)
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Добавление игрока в активные
  self:AddPlayer(playerName, {
    status = "contact",
    contactTime = os.time()
  })
  
  self.Utils:Log("Player entered control zone: " .. playerName, "info", self.Config)
end

--- Обработчик выхода игрока из зоны контроля
-- @param #string playerName Имя игрока
function OMSJ_Approach:OnPlayerLeaveControlZone(playerName)
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

--- Получает имя текущего игрока
-- @return #string Имя игрока
function OMSJ_Approach:GetPlayerName()
  return CLIENT:GetPlayerName()
end

--- Устанавливает активную ВПП
-- @param #string runway Номер ВПП
function OMSJ_Approach:SetActiveRunway(runway)
  if runway == "12" or runway == "30" then
    self.ActiveRunway = runway
    
    -- Обновление активных STAR и заходов
    self:InitializeActiveSTARs()
    self:InitializeActiveApproaches()
    
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
function OMSJ_Approach:GetActiveRunway()
  return self.ActiveRunway
end

--- Получает активные STAR
-- @return #table Активные STAR
function OMSJ_Approach:GetActiveSTARs()
  return self.ActiveSTARs
end

--- Получает активные заходы на посадку
-- @return #table Активные заходы
function OMSJ_Approach:GetActiveApproaches()
  return self.ActiveApproaches
end

return OMSJ_Approach
