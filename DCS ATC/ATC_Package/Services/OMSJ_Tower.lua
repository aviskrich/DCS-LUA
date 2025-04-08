--- OMSJ_Tower.lua
-- Модуль диспетчерской службы Tower (TWR) аэропорта Шарджа
-- @module OMSJ_Tower

--- Класс для диспетчерской службы Tower
-- @type OMSJ_Tower
OMSJ_Tower = {
  ClassName = "OMSJ_Tower",
  ServiceName = "TWR",
  ActiveRunway = nil,       -- Активная ВПП
  TaxiRoutes = {},          -- Маршруты руления
  ParkingSpots = {},        -- Места стоянок
  MainMenu = nil,           -- Главное меню Tower
  SubMenus = {}             -- Подменю Tower
}

--- Создает новый экземпляр Tower
-- @param #OMSJ_Config config Конфигурация
-- @param #OMSJ_Utils utils Утилиты
-- @param #OMSJ_SRS srs SRS
-- @param #OMSJ_Procedures procedures Процедуры
-- @return #OMSJ_Tower
function OMSJ_Tower:New(config, utils, srs, procedures)
  local self = BASE:Inherit(self, OMSJ_ATC_Service:New(self.ServiceName, config, utils, srs, procedures))
  
  -- Определение активной ВПП
  self.ActiveRunway = config:DetermineActiveRunway()
  
  -- Инициализация маршрутов руления
  self:InitializeTaxiRoutes()
  
  -- Инициализация мест стоянок
  self:InitializeParkingSpots()
  
  return self
end

--- Инициализирует маршруты руления
function OMSJ_Tower:InitializeTaxiRoutes()
  -- Маршруты руления для ВПП 12
  self.TaxiRoutes["12"] = {
    ["A"] = {
      description = "Taxiway Alpha to Runway 12",
      holdingPoint = "A1"
    },
    ["B"] = {
      description = "Taxiway Bravo to Runway 12",
      holdingPoint = "B1"
    },
    ["C"] = {
      description = "Taxiway Charlie to Runway 12",
      holdingPoint = "C1"
    }
  }
  
  -- Маршруты руления для ВПП 30
  self.TaxiRoutes["30"] = {
    ["A"] = {
      description = "Taxiway Alpha to Runway 30",
      holdingPoint = "A2"
    },
    ["B"] = {
      description = "Taxiway Bravo to Runway 30",
      holdingPoint = "B2"
    },
    ["C"] = {
      description = "Taxiway Charlie to Runway 30",
      holdingPoint = "C2"
    }
  }
  
  self.Utils:Log("Tower taxi routes initialized", "debug", self.Config)
end

--- Инициализирует места стоянок
function OMSJ_Tower:InitializeParkingSpots()
  self.ParkingSpots = {
    ["A1"] = { description = "Apron A, Spot 1", type = "civil" },
    ["A2"] = { description = "Apron A, Spot 2", type = "civil" },
    ["A3"] = { description = "Apron A, Spot 3", type = "civil" },
    ["B1"] = { description = "Apron B, Spot 1", type = "military" },
    ["B2"] = { description = "Apron B, Spot 2", type = "military" },
    ["C1"] = { description = "Apron C, Spot 1", type = "helicopter" },
    ["C2"] = { description = "Apron C, Spot 2", type = "helicopter" }
  }
  
  self.Utils:Log("Tower parking spots initialized", "debug", self.Config)
end

--- Инициализирует службу
function OMSJ_Tower:Initialize()
  -- Вызов родительского метода
  OMSJ_ATC_Service.Initialize(self)
  
  -- Дополнительная инициализация для Tower
  self:SetupTowerEventHandlers()
  
  self.Utils:Log("Tower service initialized", "info", self.Config)
  
  return self
end

--- Настраивает обработчики событий для Tower
function OMSJ_Tower:SetupTowerEventHandlers()
  -- Обработчик события посадки
  self:HandleEvent(EVENTS.Land, function(event)
    if event.initiator and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getCoalition() == self.Coalition then
      local client = CLIENT:Find(event.initiator)
      if client then
        self:OnPlayerLand(client:GetPlayerName())
      end
    end
  end)
  
  -- Обработчик события взлета
  self:HandleEvent(EVENTS.Takeoff, function(event)
    if event.initiator and event.initiator:getCategory() == Object.Category.UNIT and event.initiator:getCoalition() == self.Coalition then
      local client = CLIENT:Find(event.initiator)
      if client then
        self:OnPlayerTakeoff(client:GetPlayerName())
      end
    end
  end)
end

--- Создает меню F10 для Tower
function OMSJ_Tower:CreateMenu()
  -- Получение конфигурации меню
  local menuConfig = self.Config:GetMenuConfig()
  
  -- Создание главного меню Tower
  self.MainMenu = MENU_GROUP:New(GROUP:FindByName("all"), "Tower (" .. self.Utils:FormatFrequency(self.Frequency) .. ")")
  
  -- Создание подменю для запроса запуска двигателей
  self.SubMenus.Startup = MENU_GROUP:New(GROUP:FindByName("all"), "Request Engine Start", self.MainMenu)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Request Engine Start", self.SubMenus.Startup, self.HandleStartupRequest, self, {})
  
  -- Создание подменю для запроса руления
  self.SubMenus.Taxi = MENU_GROUP:New(GROUP:FindByName("all"), "Request Taxi", self.MainMenu)
  
  -- Добавление пунктов меню для руления к разным ВПП
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "To Runway " .. self.ActiveRunway, self.SubMenus.Taxi, self.HandleTaxiRequest, self, {runway = self.ActiveRunway})
  
  -- Если есть альтернативная ВПП, добавляем и ее
  local alternateRunway = self.ActiveRunway == "12" and "30" or "12"
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "To Runway " .. alternateRunway, self.SubMenus.Taxi, self.HandleTaxiRequest, self, {runway = alternateRunway})
  
  -- Создание подменю для запроса взлета
  self.SubMenus.Takeoff = MENU_GROUP:New(GROUP:FindByName("all"), "Request Takeoff", self.MainMenu)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Runway " .. self.ActiveRunway, self.SubMenus.Takeoff, self.HandleTakeoffRequest, self, {runway = self.ActiveRunway})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Runway " .. alternateRunway, self.SubMenus.Takeoff, self.HandleTakeoffRequest, self, {runway = alternateRunway})
  
  -- Создание подменю для запроса посадки
  self.SubMenus.Landing = MENU_GROUP:New(GROUP:FindByName("all"), "Request Landing", self.MainMenu)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Runway " .. self.ActiveRunway, self.SubMenus.Landing, self.HandleLandingRequest, self, {runway = self.ActiveRunway})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Runway " .. alternateRunway, self.SubMenus.Landing, self.HandleLandingRequest, self, {runway = alternateRunway})
  
  -- Создание подменю для запроса информации
  self.SubMenus.Info = MENU_GROUP:New(GROUP:FindByName("all"), "Request Information", self.MainMenu)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Weather Info", self.SubMenus.Info, self.HandleWeatherInfo, self, {})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Radio Check", self.SubMenus.Info, self.HandleRadioCheck, self, {})
  
  self.Utils:Log("Tower menu created", "debug", self.Config)
end

--- Обрабатывает запрос на запуск двигателей
-- @param #table args Аргументы запроса
function OMSJ_Tower:HandleStartupRequest(args)
  local playerName = self:GetPlayerName()
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  local position = client:GetPosition().p
  
  -- Определение места стоянки
  local parkingSpot = "unknown"
  local nearestDistance = 1000
  
  for spotName, spotData in pairs(self.ParkingSpots) do
    -- Здесь должна быть логика определения ближайшего места стоянки
    -- Для примера используем случайное место
    if math.random() > 0.5 then
      parkingSpot = spotName
      break
    end
  end
  
  -- Получение информации о погоде
  local weatherInfo = self.Utils:GetWeatherInfo(position)
  local formattedWeather = self.Utils:FormatWeatherInfo(weatherInfo)
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, startup approved at %s, %s, runway in use %s, QNH %s",
    callsign,
    self.Callsign,
    parkingSpot,
    formattedWeather:match("Wind ([^,]+)"),
    self.ActiveRunway,
    weatherInfo.pressure * 0.750062 * 1000
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    status = "startup",
    parkingSpot = parkingSpot,
    startupTime = os.time()
  })
  
  self.Utils:Log("Startup approved for " .. playerName .. " at " .. parkingSpot, "info", self.Config)
end

--- Обрабатывает запрос на руление
-- @param #table args Аргументы запроса
function OMSJ_Tower:HandleTaxiRequest(args)
  local playerName = self:GetPlayerName()
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  local runway = args.runway or self.ActiveRunway
  
  -- Определение маршрута руления
  local taxiRoute = nil
  local holdingPoint = nil
  
  -- Выбор случайного маршрута руления для указанной ВПП
  local routes = self.TaxiRoutes[runway]
  if routes then
    local routeNames = {}
    for name, _ in pairs(routes) do
      table.insert(routeNames, name)
    end
    
    if #routeNames > 0 then
      local randomRoute = routeNames[math.random(1, #routeNames)]
      taxiRoute = randomRoute
      holdingPoint = routes[randomRoute].holdingPoint
    end
  end
  
  if not taxiRoute or not holdingPoint then
    self.Utils:Log("No taxi route found for runway " .. runway, "warning", self.Config)
    return
  end
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, taxi to holding point %s via taxiway %s for runway %s",
    callsign,
    self.Callsign,
    holdingPoint,
    taxiRoute,
    runway
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    status = "taxiing",
    runway = runway,
    taxiRoute = taxiRoute,
    holdingPoint = holdingPoint,
    taxiTime = os.time()
  })
  
  self.Utils:Log("Taxi clearance issued to " .. playerName .. " for runway " .. runway .. " via " .. taxiRoute, "info", self.Config)
end

--- Обрабатывает запрос на взлет
-- @param #table args Аргументы запроса
function OMSJ_Tower:HandleTakeoffRequest(args)
  local playerName = self:GetPlayerName()
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  local runway = args.runway or self.ActiveRunway
  
  -- Получение информации о погоде
  local position = client:GetPosition().p
  local weatherInfo = self.Utils:GetWeatherInfo(position)
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, wind %03d at %s, runway %s, cleared for takeoff",
    callsign,
    self.Callsign,
    weatherInfo.windDirection,
    self.Utils:FormatSpeed(weatherInfo.windSpeed, "kts"):match("(%d+)"),
    runway
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    status = "takeoff",
    runway = runway,
    takeoffTime = os.time()
  })
  
  self.Utils:Log("Takeoff clearance issued to " .. playerName .. " for runway " .. runway, "info", self.Config)
end

--- Обрабатывает запрос на посадку
-- @param #table args Аргументы запроса
function OMSJ_Tower:HandleLandingRequest(args)
  local playerName = self:GetPlayerName()
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  local runway = args.runway or self.ActiveRunway
  
  -- Получение информации о погоде
  local position = client:GetPosition().p
  local weatherInfo = self.Utils:GetWeatherInfo(position)
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, wind %03d at %s, runway %s, cleared to land",
    callsign,
    self.Callsign,
    weatherInfo.windDirection,
    self.Utils:FormatSpeed(weatherInfo.windSpeed, "kts"):match("(%d+)"),
    runway
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    status = "landing",
    runway = runway,
    approachTime = os.time()
  })
  
  self.Utils:Log("Landing clearance issued to " .. playerName .. " for runway " .. runway, "info", self.Config)
end

--- Обработчик события посадки игрока
-- @param #string playerName Имя игрока
function OMSJ_Tower:OnPlayerLand(playerName)
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  
  -- Определение места стоянки
  local parkingSpot = "A1" -- Для примера используем фиксированное место
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, welcome to Sharjah, taxi to parking %s via taxiway Alpha",
    callsign,
    self.Callsign,
    parkingSpot
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Обновление статуса игрока
  self:UpdatePlayerData(playerName, {
    status = "landed",
    landingTime = os.time(),
    assignedParking = parkingSpot
  })
  
  self.Utils:Log("Player landed: " .. playerName, "info", self.Config)
end

--- Обработчик события взлета игрока
-- @param #string playerName Имя игрока
function OMSJ_Tower:OnPlayerTakeoff(playerName)
  local client = CLIENT:FindByName(playerName)
  if not client then return end
  
  local callsign = self.Utils:GetCallsign(client)
  
  -- Формирование сообщения
  local message = string.format(
    "%s, %s, contact Departure on %s, good day",
    callsign,
    self.Callsign,
    self.Utils:FormatFrequency(self.Config:GetServiceConfig("DEP").Frequency)
  )
  
  -- Отправка сообщения
  self:SendMessage(playerName, message)
  
  -- Передача управления в Departure
  self:TransferControl(playerName, "DEP", {
    status = "departed",
    departureTime = os.time(),
    runway = self:GetPlayerData(playerName).runway
  })
  
  self.Utils:Log("Player took off: " .. playerName .. ", transferred to Departure", "info", self.Config)
end

--- Получает имя текущего игрока
-- @return #string Имя игрока
function OMSJ_Tower:GetPlayerName()
  return CLIENT:GetPlayerName()
end

--- Получает маршрут руления для ВПП
-- @param #string runway Номер ВПП
-- @param #string taxiway Название рулежной дорожки (опционально)
-- @return #table Маршрут руления
function OMSJ_Tower:GetTaxiRoute(runway, taxiway)
  local routes = self.TaxiRoutes[runway]
  if not routes then return nil end
  
  if taxiway then
    return routes[taxiway]
  else
    -- Возвращаем первый доступный маршрут
    for name, route in pairs(routes) do
      return route
    end
  end
  
  return nil
end

--- Получает информацию о месте стоянки
-- @param #string spotName Название места стоянки
-- @return #table Информация о месте стоянки
function OMSJ_Tower:GetParkingSpot(spotName)
  return self.ParkingSpots[spotName]
end

--- Устанавливает активную ВПП
-- @param #string runway Номер ВПП
function OMSJ_Tower:SetActiveRunway(runway)
  if runway == "12" or runway == "30" then
    self.ActiveRunway = runway
    self.Utils:Log("Active runway set to " .. runway, "info", self.Config)
    return true
  else
    self.Utils:Log("Invalid runway: " .. tostring(runway), "warning", self.Config)
    return false
  end
end

--- Получает активную ВПП
-- @return #string Номер активной ВПП
function OMSJ_Tower:GetActiveRunway()
  return self.ActiveRunway
end

return OMSJ_Tower
