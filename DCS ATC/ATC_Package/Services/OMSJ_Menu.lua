--- OMSJ_Menu.lua
-- Система меню F10 для модуля диспетчерских служб аэропорта Шарджа
-- @module OMSJ_Menu

--- Класс для управления меню F10
-- @type OMSJ_Menu
OMSJ_Menu = {
  ClassName = "OMSJ_Menu",
  MainMenu = nil,           -- Главное меню
  ServiceMenus = {},        -- Меню служб
  SubMenus = {},            -- Подменю
  Config = nil,             -- Ссылка на конфигурацию
  Utils = nil,              -- Ссылка на утилиты
  Services = {}             -- Ссылки на службы
}

--- Создает новый экземпляр OMSJ_Menu
-- @param #OMSJ_Config config Конфигурация
-- @param #OMSJ_Utils utils Утилиты
-- @return #OMSJ_Menu
function OMSJ_Menu:New(config, utils)
  local self = BASE:Inherit(self, BASE:New())
  
  self.Config = config
  self.Utils = utils
  
  return self
end

--- Инициализирует систему меню
-- @param #table services Таблица служб {TWR = towerService, APP = approachService, DEP = departureService}
function OMSJ_Menu:Initialize(services)
  self.Services = services
  
  -- Создание главного меню
  self:CreateMainMenu()
  
  -- Создание меню для каждой службы
  self:CreateServiceMenus()
  
  -- Настройка обновления меню
  self:SetupMenuRefresh()
  
  self.Utils:Log("Menu system initialized", "info", self.Config)
end

--- Создает главное меню
function OMSJ_Menu:CreateMainMenu()
  -- Получение конфигурации меню
  local menuConfig = self.Config:GetMenuConfig()
  
  -- Создание главного меню
  self.MainMenu = MENU_GROUP:New(GROUP:FindByName("all"), menuConfig.MainTitle)
  
  self.Utils:Log("Main menu created", "debug", self.Config)
end

--- Создает меню для служб
function OMSJ_Menu:CreateServiceMenus()
  -- Создание меню для Tower
  if self.Services.TWR then
    self.ServiceMenus.TWR = MENU_GROUP:New(GROUP:FindByName("all"), "Tower (" .. self.Utils:FormatFrequency(self.Services.TWR:GetFrequency()) .. ")", self.MainMenu)
    self:CreateTowerMenu()
  end
  
  -- Создание меню для Approach
  if self.Services.APP then
    self.ServiceMenus.APP = MENU_GROUP:New(GROUP:FindByName("all"), "Approach (" .. self.Utils:FormatFrequency(self.Services.APP:GetFrequency()) .. ")", self.MainMenu)
    self:CreateApproachMenu()
  end
  
  -- Создание меню для Departure
  if self.Services.DEP then
    self.ServiceMenus.DEP = MENU_GROUP:New(GROUP:FindByName("all"), "Departure (" .. self.Utils:FormatFrequency(self.Services.DEP:GetFrequency()) .. ")", self.MainMenu)
    self:CreateDepartureMenu()
  end
  
  -- Создание общего меню информации
  self.SubMenus.Info = MENU_GROUP:New(GROUP:FindByName("all"), "Information", self.MainMenu)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Weather Info", self.SubMenus.Info, self.HandleWeatherInfo, self, {})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Radio Check", self.SubMenus.Info, self.HandleRadioCheck, self, {})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Active Runway", self.SubMenus.Info, self.HandleActiveRunwayInfo, self, {})
  
  self.Utils:Log("Service menus created", "debug", self.Config)
end

--- Создает меню для Tower
function OMSJ_Menu:CreateTowerMenu()
  -- Создание подменю для запроса запуска двигателей
  self.SubMenus.Startup = MENU_GROUP:New(GROUP:FindByName("all"), "Request Engine Start", self.ServiceMenus.TWR)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Request Engine Start", self.SubMenus.Startup, self.HandleStartupRequest, self, {service = "TWR"})
  
  -- Создание подменю для запроса руления
  self.SubMenus.Taxi = MENU_GROUP:New(GROUP:FindByName("all"), "Request Taxi", self.ServiceMenus.TWR)
  
  -- Добавление пунктов меню для руления к разным ВПП
  local activeRunway = self.Services.TWR:GetActiveRunway()
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "To Runway " .. activeRunway, self.SubMenus.Taxi, self.HandleTaxiRequest, self, {service = "TWR", runway = activeRunway})
  
  -- Если есть альтернативная ВПП, добавляем и ее
  local alternateRunway = activeRunway == "12" and "30" or "12"
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "To Runway " .. alternateRunway, self.SubMenus.Taxi, self.HandleTaxiRequest, self, {service = "TWR", runway = alternateRunway})
  
  -- Создание подменю для запроса взлета
  self.SubMenus.Takeoff = MENU_GROUP:New(GROUP:FindByName("all"), "Request Takeoff", self.ServiceMenus.TWR)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Runway " .. activeRunway, self.SubMenus.Takeoff, self.HandleTakeoffRequest, self, {service = "TWR", runway = activeRunway})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Runway " .. alternateRunway, self.SubMenus.Takeoff, self.HandleTakeoffRequest, self, {service = "TWR", runway = alternateRunway})
  
  -- Создание подменю для запроса посадки
  self.SubMenus.Landing = MENU_GROUP:New(GROUP:FindByName("all"), "Request Landing", self.ServiceMenus.TWR)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Runway " .. activeRunway, self.SubMenus.Landing, self.HandleLandingRequest, self, {service = "TWR", runway = activeRunway})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "Runway " .. alternateRunway, self.SubMenus.Landing, self.HandleLandingRequest, self, {service = "TWR", runway = alternateRunway})
  
  self.Utils:Log("Tower menu created", "debug", self.Config)
end

--- Создает меню для Approach
function OMSJ_Menu:CreateApproachMenu()
  -- Создание подменю для запроса STAR
  self.SubMenus.STAR = MENU_GROUP:New(GROUP:FindByName("all"), "Request STAR", self.ServiceMenus.APP)
  
  -- Добавление пунктов меню для разных STAR
  local activeSTARs = self.Services.APP:GetActiveSTARs()
  for name, star in pairs(activeSTARs) do
    MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), star.description, self.SubMenus.STAR, self.HandleSTARRequest, self, {service = "APP", star = name})
  end
  
  -- Создание подменю для запроса захода на посадку
  self.SubMenus.Approach = MENU_GROUP:New(GROUP:FindByName("all"), "Request Approach", self.ServiceMenus.APP)
  
  -- Добавление пунктов меню для разных типов захода
  local activeApproaches = self.Services.APP:GetActiveApproaches()
  for name, approach in pairs(activeApproaches) do
    MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), approach.description, self.SubMenus.Approach, self.HandleApproachRequest, self, {service = "APP", approach = name})
  end
  
  -- Создание подменю для запроса векторения
  self.SubMenus.Vectors = MENU_GROUP:New(GROUP:FindByName("all"), "Request Vectors", self.ServiceMenus.APP)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "For ILS Approach", self.SubMenus.Vectors, self.HandleVectorsRequest, self, {service = "APP", type = "ILS"})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "For Visual Approach", self.SubMenus.Vectors, self.HandleVectorsRequest, self, {service = "APP", type = "VISUAL"})
  
  self.Utils:Log("Approach menu created", "debug", self.Config)
end

--- Создает меню для Departure
function OMSJ_Menu:CreateDepartureMenu()
  -- Создание подменю для запроса SID
  self.SubMenus.SID = MENU_GROUP:New(GROUP:FindByName("all"), "Request SID", self.ServiceMenus.DEP)
  
  -- Добавление пунктов меню для разных SID
  local activeSIDs = self.Services.DEP:GetActiveSIDs()
  for name, sid in pairs(activeSIDs) do
    MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), sid.description, self.SubMenus.SID, self.HandleSIDRequest, self, {service = "DEP", sid = name})
  end
  
  -- Создание подменю для запроса набора высоты
  self.SubMenus.Climb = MENU_GROUP:New(GROUP:FindByName("all"), "Request Climb", self.ServiceMenus.DEP)
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "To FL100", self.SubMenus.Climb, self.HandleClimbRequest, self, {service = "DEP", altitude = 10000})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "To FL200", self.SubMenus.Climb, self.HandleClimbRequest, self, {service = "DEP", altitude = 20000})
  MENU_GROUP_COMMAND:New(GROUP:FindByName("all"), "To FL300", self.SubMenus.Climb, self.HandleClimbRequest, self, {service = "DEP", altitude = 30000})
  
  self.Utils:Log("Departure menu created", "debug", self.Config)
end

--- Настраивает периодическое обновление меню
function OMSJ_Menu:SetupMenuRefresh()
  -- Получение конфигурации меню
  local menuConfig = self.Config:GetMenuConfig()
  
  -- Настройка периодического обновления
  SCHEDULER:New(nil, function()
    self:RefreshMenus()
  end, {}, menuConfig.RefreshInterval, menuConfig.RefreshInterval)
  
  self.Utils:Log("Menu refresh scheduled every " .. menuConfig.RefreshInterval .. " seconds", "debug", self.Config)
end

--- Обновляет меню
function OMSJ_Menu:RefreshMenus()
  -- Удаление старых меню
  self:RemoveAllMenus()
  
  -- Создание новых меню
  self:CreateMainMenu()
  self:CreateServiceMenus()
  
  self.Utils:Log("Menus refreshed", "debug", self.Config)
end

--- Удаляет все меню
function OMSJ_Menu:RemoveAllMenus()
  -- Удаление главного меню (удалит и все подменю)
  if self.MainMenu then
    self.MainMenu:Remove()
    self.MainMenu = nil
  end
  
  -- Очистка ссылок на меню
  self.ServiceMenus = {}
  self.SubMenus = {}
  
  self.Utils:Log("All menus removed", "debug", self.Config)
end

--- Обрабатывает запрос информации о погоде
-- @param #table args Аргументы запроса
function OMSJ_Menu:HandleWeatherInfo(args)
  local serviceName = args.service or "TWR"
  local service = self.Services[serviceName]
  
  if service then
    service:HandleRequest(CLIENT:GetPlayerName(), "weather_info", {})
  else
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
  end
end

--- Обрабатывает запрос проверки радиосвязи
-- @param #table args Аргументы запроса
function OMSJ_Menu:HandleRadioCheck(args)
  local serviceName = args.service or "TWR"
  local service = self.Services[serviceName]
  
  if service then
    service:HandleRequest(CLIENT:GetPlayerName(), "radio_check", {})
  else
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
  end
end

--- Обрабатывает запрос информации об активной ВПП
-- @param #table args Аргументы запроса
function OMSJ_Menu:HandleActiveRunwayInfo(args)
  local serviceName = args.service or "TWR"
  local service = self.Services[serviceName]
  
  if service then
    local activeRunway = service:GetActiveRunway()
    local message = "Active runway is " .. activeRunway
    
    MESSAGE:New(message, 10):ToClient(CLIENT:GetClient())
    
    self.Utils:Log("Active runway info provided to " .. CLIENT:GetPlayerName(), "debug", self.Config)
  else
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
  end
end

--- Обрабатывает запрос на запуск двигателей
-- @param #table args Аргументы запроса
function OMSJ_Menu:HandleStartupRequest(args)
  local serviceName = args.service or "TWR"
  local service = self.Services[serviceName]
  
  if service then
    service:HandleStartupRequest({})
  else
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
  end
end

--- Обрабатывает запрос на руление
-- @param #table args Аргументы запроса
function OMSJ_Menu:HandleTaxiRequest(args)
  local serviceName = args.service or "TWR"
  local service = self.Services[serviceName]
  
  if service then
    service:HandleTaxiRequest({runway = args.runway})
  else
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
  end
end

--- Обрабатывает запрос на взлет
-- @param #table args Аргументы запроса
function OMSJ_Menu:HandleTakeoffRequest(args)
  local serviceName = args.service or "TWR"
  local service = self.Services[serviceName]
  
  if service then
    service:HandleTakeoffRequest({runway = args.runway})
  else
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
  end
end

--- Обрабатывает запрос на посадку
-- @param #table args Аргументы запроса
function OMSJ_Menu:HandleLandingRequest(args)
  local serviceName = args.service or "TWR"
  local service = self.Services[serviceName]
  
  if service then
    service:HandleLandingRequest({runway = args.runway})
  else
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
  end
end

--- Обрабатывает запрос на STAR
-- @param #table args Аргументы запроса
function OMSJ_Menu:HandleSTARRequest(args)
  local serviceName = args.service or "APP"
  local service = self.Services[serviceName]
  
  if service then
    service:HandleSTARRequest({star = args.star})
  else
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
  end
end

--- Обрабатывает запрос на заход на посадку
-- @param #table args Аргументы запроса
function OMSJ_Menu:HandleApproachRequest(args)
  local serviceName = args.service or "APP"
  local service = self.Services[serviceName]
  
  if service then
    service:HandleApproachRequest({approach = args.approach})
  else
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
  end
end

--- Обрабатывает запрос на векторение
-- @param #table args Аргументы запроса
function OMSJ_Menu:HandleVectorsRequest(args)
  local serviceName = args.service or "APP"
  local service = self.Services[serviceName]
  
  if service then
    service:HandleVectorsRequest({type = args.type})
  else
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
  end
end

--- Обрабатывает запрос на SID
-- @param #table args Аргументы запроса
function OMSJ_Menu:HandleSIDRequest(args)
  local serviceName = args.service or "DEP"
  local service = self.Services[serviceName]
  
  if service then
    service:HandleSIDRequest({sid = args.sid})
  else
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
  end
end

--- Обрабатывает запрос на набор высоты
-- @param #table args Аргументы запроса
function OMSJ_Menu:HandleClimbRequest(args)
  local serviceName = args.service or "DEP"
  local service = self.Services[serviceName]
  
  if service then
    service:HandleClimbRequest({altitude = args.altitude})
  else
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
  end
end

return OMSJ_Menu
