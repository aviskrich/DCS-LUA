-- Файл для тестирования модуля OMSJ_ATC
-- @module OMSJ_ATC_Test

env.info("Starting OMSJ ATC module test...")

-- Проверка наличия MOOSE
if not MOOSE then
  error("MOOSE framework is required for OMSJ ATC module")
  return
end

-- Загрузка модуля OMSJ_ATC
local success, OMSJ_ATC_Module = pcall(require, "OMSJ_ATC")
if not success then
  env.error("Failed to load OMSJ_ATC module: " .. tostring(OMSJ_ATC_Module))
  return
end

-- Тестовая миссия для OMSJ ATC
OMSJ_ATC_Test = {
  ClassName = "OMSJ_ATC_Test",
  Version = "1.0.0",
  TestResults = {}
}

--- Запускает тестирование модуля
function OMSJ_ATC_Test:Start()
  env.info("OMSJ ATC Test: Starting tests...")
  
  -- Тестирование инициализации модуля
  self:TestInitialization()
  
  -- Тестирование конфигурации
  self:TestConfiguration()
  
  -- Тестирование служб
  self:TestServices()
  
  -- Тестирование процедур
  self:TestProcedures()
  
  -- Тестирование меню
  self:TestMenu()
  
  -- Тестирование SRS
  self:TestSRS()
  
  -- Вывод результатов тестирования
  self:ReportResults()
  
  env.info("OMSJ ATC Test: All tests completed")
end

--- Тестирует инициализацию модуля
function OMSJ_ATC_Test:TestInitialization()
  env.info("OMSJ ATC Test: Testing initialization...")
  
  -- Проверка инициализации модуля
  local isInitialized = OMSJ_ATC.IsInitialized
  
  if isInitialized then
    self:AddResult("Initialization", "PASS", "Module initialized successfully")
  else
    self:AddResult("Initialization", "FAIL", "Module not initialized")
  end
  
  -- Проверка версии модуля
  local version = OMSJ_ATC:GetVersion()
  
  if version and version ~= "" then
    self:AddResult("Version Check", "PASS", "Version: " .. version)
  else
    self:AddResult("Version Check", "FAIL", "Version not found")
  end
end

--- Тестирует конфигурацию модуля
function OMSJ_ATC_Test:TestConfiguration()
  env.info("OMSJ ATC Test: Testing configuration...")
  
  -- Получение конфигурации
  local config = OMSJ_ATC:GetConfig()
  
  if config then
    self:AddResult("Configuration", "PASS", "Configuration loaded")
    
    -- Проверка активной ВПП
    local activeRunway = OMSJ_ATC:GetActiveRunway()
    
    if activeRunway and (activeRunway == "12" or activeRunway == "30") then
      self:AddResult("Active Runway", "PASS", "Active runway: " .. activeRunway)
    else
      self:AddResult("Active Runway", "FAIL", "Invalid active runway: " .. tostring(activeRunway))
    end
    
    -- Проверка настроек служб
    local twr = config:GetServiceConfig("TWR")
    local app = config:GetServiceConfig("APP")
    local dep = config:GetServiceConfig("DEP")
    
    if twr and app and dep then
      self:AddResult("Service Configs", "PASS", "All service configurations loaded")
    else
      self:AddResult("Service Configs", "FAIL", "Missing service configurations")
    end
  else
    self:AddResult("Configuration", "FAIL", "Configuration not loaded")
  end
end

--- Тестирует службы ATC
function OMSJ_ATC_Test:TestServices()
  env.info("OMSJ ATC Test: Testing ATC services...")
  
  -- Проверка службы Tower
  local tower = OMSJ_ATC:GetTower()
  
  if tower then
    self:AddResult("Tower Service", "PASS", "Tower service loaded")
    
    -- Проверка частоты Tower
    local towerFreq = tower:GetFrequency()
    
    if towerFreq and towerFreq > 100 then
      self:AddResult("Tower Frequency", "PASS", "Tower frequency: " .. towerFreq)
    else
      self:AddResult("Tower Frequency", "FAIL", "Invalid Tower frequency: " .. tostring(towerFreq))
    end
  else
    self:AddResult("Tower Service", "FAIL", "Tower service not loaded")
  end
  
  -- Проверка службы Approach
  local approach = OMSJ_ATC:GetApproach()
  
  if approach then
    self:AddResult("Approach Service", "PASS", "Approach service loaded")
    
    -- Проверка активных STAR
    local activeSTARs = approach:GetActiveSTARs()
    
    if activeSTARs and next(activeSTARs) then
      self:AddResult("Active STARs", "PASS", "Active STARs loaded")
    else
      self:AddResult("Active STARs", "FAIL", "No active STARs found")
    end
  else
    self:AddResult("Approach Service", "FAIL", "Approach service not loaded")
  end
  
  -- Проверка службы Departure
  local departure = OMSJ_ATC:GetDeparture()
  
  if departure then
    self:AddResult("Departure Service", "PASS", "Departure service loaded")
    
    -- Проверка активных SID
    local activeSIDs = departure:GetActiveSIDs()
    
    if activeSIDs and next(activeSIDs) then
      self:AddResult("Active SIDs", "PASS", "Active SIDs loaded")
    else
      self:AddResult("Active SIDs", "FAIL", "No active SIDs found")
    end
  else
    self:AddResult("Departure Service", "FAIL", "Departure service not loaded")
  end
end

--- Тестирует процедуры
function OMSJ_ATC_Test:TestProcedures()
  env.info("OMSJ ATC Test: Testing procedures...")
  
  -- Получение процедур
  local procedures = OMSJ_ATC:GetProcedures()
  
  if procedures then
    self:AddResult("Procedures", "PASS", "Procedures module loaded")
    
    -- Проверка путевых точек
    local waypointCount = procedures:CountWaypoints()
    
    if waypointCount > 0 then
      self:AddResult("Waypoints", "PASS", waypointCount .. " waypoints loaded")
    else
      self:AddResult("Waypoints", "FAIL", "No waypoints found")
    end
    
    -- Проверка SID
    local sidCount = procedures:CountSIDs()
    
    if sidCount > 0 then
      self:AddResult("SIDs", "PASS", sidCount .. " SIDs loaded")
    else
      self:AddResult("SIDs", "FAIL", "No SIDs found")
    end
    
    -- Проверка STAR
    local starCount = procedures:CountSTARs()
    
    if starCount > 0 then
      self:AddResult("STARs", "PASS", starCount .. " STARs loaded")
    else
      self:AddResult("STARs", "FAIL", "No STARs found")
    end
    
    -- Проверка заходов на посадку
    local approachCount = procedures:CountApproaches()
    
    if approachCount > 0 then
      self:AddResult("Approaches", "PASS", approachCount .. " approaches loaded")
    else
      self:AddResult("Approaches", "FAIL", "No approaches found")
    end
  else
    self:AddResult("Procedures", "FAIL", "Procedures module not loaded")
  end
end

--- Тестирует систему меню
function OMSJ_ATC_Test:TestMenu()
  env.info("OMSJ ATC Test: Testing menu system...")
  
  -- Получение меню
  local menu = OMSJ_ATC:GetMenu()
  
  if menu then
    self:AddResult("Menu System", "PASS", "Menu system loaded")
  else
    self:AddResult("Menu System", "FAIL", "Menu system not loaded")
  end
end

--- Тестирует интеграцию с SRS
function OMSJ_ATC_Test:TestSRS()
  env.info("OMSJ ATC Test: Testing SRS integration...")
  
  -- Получение SRS
  local srs = OMSJ_ATC:GetSRS()
  
  if srs then
    self:AddResult("SRS Integration", "PASS", "SRS module loaded")
    
    -- Проверка доступности SRS
    local srsAvailable = srs:IsSRSAvailable()
    
    if srsAvailable then
      self:AddResult("SRS Availability", "PASS", "SRS is available")
    else
      self:AddResult("SRS Availability", "WARNING", "SRS is not available, but module loaded")
    end
  else
    self:AddResult("SRS Integration", "FAIL", "SRS module not loaded")
  end
end

--- Добавляет результат теста
-- @param #string testName Название теста
-- @param #string result Результат (PASS, FAIL, WARNING)
-- @param #string details Детали результата
function OMSJ_ATC_Test:AddResult(testName, result, details)
  table.insert(self.TestResults, {
    name = testName,
    result = result,
    details = details
  })
  
  env.info("OMSJ ATC Test: " .. testName .. " - " .. result .. " - " .. details)
end

--- Выводит результаты тестирования
function OMSJ_ATC_Test:ReportResults()
  env.info("OMSJ ATC Test: Test Results Summary")
  env.info("==================================")
  
  local passCount = 0
  local failCount = 0
  local warningCount = 0
  
  for _, result in ipairs(self.TestResults) do
    env.info(result.name .. ": " .. result.result .. " - " .. result.details)
    
    if result.result == "PASS" then
      passCount = passCount + 1
    elseif result.result == "FAIL" then
      failCount = failCount + 1
    elseif result.result == "WARNING" then
      warningCount = warningCount + 1
    end
  end
  
  env.info("==================================")
  env.info("Total tests: " .. #self.TestResults)
  env.info("Passed: " .. passCount)
  env.info("Failed: " .. failCount)
  env.info("Warnings: " .. warningCount)
  env.info("==================================")
  
  -- Вывод в игровой чат
  if MESSAGE then
    MESSAGE:New("OMSJ ATC Test Results: " .. passCount .. " passed, " .. failCount .. " failed, " .. warningCount .. " warnings", 30):ToAll()
  end
end

-- Запуск тестирования
OMSJ_ATC_Test:Start()

return OMSJ_ATC_Test
