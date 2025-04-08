--- OMSJ_ATC.lua
-- Основной модуль диспетчерских служб аэропорта Шарджа
-- @module OMSJ_ATC

env.info("Loading OMSJ ATC module...")

-- Проверка наличия MOOSE
if not MOOSE then
  error("MOOSE framework is required for OMSJ ATC module")
  return
end

-- Создание глобального объекта OMSJ_ATC
OMSJ_ATC = {
  ClassName = "OMSJ_ATC",
  Version = "1.0.0",
  Config = nil,             -- Конфигурация
  Utils = nil,              -- Утилиты
  SRS = nil,                -- Интеграция с SRS
  Procedures = nil,         -- Процедуры
  Tower = nil,              -- Служба Tower
  Approach = nil,           -- Служба Approach
  Departure = nil,          -- Служба Departure
  Menu = nil,               -- Система меню
  IsInitialized = false     -- Флаг инициализации
}

--- Инициализирует модуль OMSJ_ATC
-- @return #OMSJ_ATC
function OMSJ_ATC:Initialize()
  if self.IsInitialized then
    env.info("OMSJ ATC module already initialized")
    return self
  end
  
  env.info("Initializing OMSJ ATC module...")
  
  -- Загрузка необходимых модулей
  self:LoadModules()
  
  -- Инициализация компонентов
  self:InitializeComponents()
  
  -- Установка флага инициализации
  self.IsInitialized = true
  
  env.info("OMSJ ATC module initialized successfully")
  
  return self
end

--- Загружает необходимые модули
function OMSJ_ATC:LoadModules()
  env.info("Loading OMSJ ATC modules...")
  
  -- Загрузка модулей Core
  local coreModules = {
    "OMSJ_Config",
    "OMSJ_Utils",
    "OMSJ_SRS",
    "OMSJ_Procedures"
  }
  
  for _, moduleName in ipairs(coreModules) do
    env.info("Loading module: " .. moduleName)
    local success, module = pcall(require, moduleName)
    if not success then
      env.error("Failed to load module: " .. moduleName .. ", error: " .. tostring(module))
    end
  end
  
  -- Загрузка модулей Services
  local serviceModules = {
    "OMSJ_ATC_Service",
    "OMSJ_Tower",
    "OMSJ_Approach",
    "OMSJ_Departure",
    "OMSJ_Menu"
  }
  
  for _, moduleName in ipairs(serviceModules) do
    env.info("Loading module: " .. moduleName)
    local success, module = pcall(require, moduleName)
    if not success then
      env.error("Failed to load module: " .. moduleName .. ", error: " .. tostring(module))
    end
  end
  
  env.info("All OMSJ ATC modules loaded")
end

--- Инициализирует компоненты модуля
function OMSJ_ATC:InitializeComponents()
  env.info("Initializing OMSJ ATC components...")
  
  -- Инициализация конфигурации
  self.Config = OMSJ_Config:New()
  
  -- Инициализация утилит
  self.Utils = OMSJ_Utils:New()
  
  -- Инициализация SRS
  self.SRS = OMSJ_SRS:New(self.Config, self.Utils)
  
  -- Инициализация процедур
  self.Procedures = OMSJ_Procedures:New(self.Config, self.Utils)
  
  -- Инициализация служб
  self.Tower = OMSJ_Tower:New(self.Config, self.Utils, self.SRS, self.Procedures)
  self.Approach = OMSJ_Approach:New(self.Config, self.Utils, self.SRS, self.Procedures)
  self.Departure = OMSJ_Departure:New(self.Config, self.Utils, self.SRS, self.Procedures)
  
  -- Инициализация меню
  self.Menu = OMSJ_Menu:New(self.Config, self.Utils)
  
  -- Инициализация каждого компонента
  self.Tower:Initialize()
  self.Approach:Initialize()
  self.Departure:Initialize()
  
  -- Инициализация меню с ссылками на службы
  self.Menu:Initialize({
    TWR = self.Tower,
    APP = self.Approach,
    DEP = self.Departure
  })
  
  env.info("OMSJ ATC components initialized")
end

--- Обновляет активную ВПП для всех служб
-- @param #string runway Номер ВПП (12, 30)
function OMSJ_ATC:SetActiveRunway(runway)
  if runway ~= "12" and runway ~= "30" then
    self.Utils:Log("Invalid runway: " .. tostring(runway), "warning", self.Config)
    return false
  end
  
  -- Обновление ВПП в каждой службе
  self.Tower:SetActiveRunway(runway)
  self.Approach:SetActiveRunway(runway)
  self.Departure:SetActiveRunway(runway)
  
  -- Обновление меню
  self.Menu:RefreshMenus()
  
  self.Utils:Log("Active runway set to " .. runway .. " for all services", "info", self.Config)
  return true
end

--- Получает активную ВПП
-- @return #string Номер активной ВПП
function OMSJ_ATC:GetActiveRunway()
  return self.Tower:GetActiveRunway()
end

--- Получает версию модуля
-- @return #string Версия модуля
function OMSJ_ATC:GetVersion()
  return self.Version
end

--- Получает статус инициализации
-- @return #boolean Инициализирован ли модуль
function OMSJ_ATC:IsInitialized()
  return self.IsInitialized
end

--- Получает службу Tower
-- @return #OMSJ_Tower Служба Tower
function OMSJ_ATC:GetTower()
  return self.Tower
end

--- Получает службу Approach
-- @return #OMSJ_Approach Служба Approach
function OMSJ_ATC:GetApproach()
  return self.Approach
end

--- Получает службу Departure
-- @return #OMSJ_Departure Служба Departure
function OMSJ_ATC:GetDeparture()
  return self.Departure
end

--- Получает систему меню
-- @return #OMSJ_Menu Система меню
function OMSJ_ATC:GetMenu()
  return self.Menu
end

--- Получает конфигурацию
-- @return #OMSJ_Config Конфигурация
function OMSJ_ATC:GetConfig()
  return self.Config
end

--- Получает утилиты
-- @return #OMSJ_Utils Утилиты
function OMSJ_ATC:GetUtils()
  return self.Utils
end

--- Получает SRS
-- @return #OMSJ_SRS SRS
function OMSJ_ATC:GetSRS()
  return self.SRS
end

--- Получает процедуры
-- @return #OMSJ_Procedures Процедуры
function OMSJ_ATC:GetProcedures()
  return self.Procedures
end

--- Останавливает модуль
function OMSJ_ATC:Stop()
  if not self.IsInitialized then
    env.info("OMSJ ATC module not initialized")
    return
  end
  
  env.info("Stopping OMSJ ATC module...")
  
  -- Удаление меню
  if self.Menu then
    self.Menu:RemoveAllMenus()
  end
  
  -- Сброс флага инициализации
  self.IsInitialized = false
  
  env.info("OMSJ ATC module stopped")
end

--- Перезапускает модуль
function OMSJ_ATC:Restart()
  env.info("Restarting OMSJ ATC module...")
  
  -- Остановка модуля
  self:Stop()
  
  -- Инициализация модуля
  self:Initialize()
  
  env.info("OMSJ ATC module restarted")
end

-- Автоматическая инициализация модуля
OMSJ_ATC:Initialize()

-- Возвращаем модуль
return OMSJ_ATC
