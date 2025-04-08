--- OMSJ_Procedures.lua
-- Управление процедурами SID/STAR/Approach для аэропорта Шарджа
-- @module OMSJ_Procedures

--- Класс для управления процедурами
-- @type OMSJ_Procedures
OMSJ_Procedures = {
  ClassName = "OMSJ_Procedures",
  SIDs = {},                -- Схемы SID
  STARs = {},               -- Схемы STAR
  Approaches = {},          -- Схемы захода на посадку
  Waypoints = {},           -- Путевые точки
  Config = nil,             -- Ссылка на конфигурацию
  Utils = nil               -- Ссылка на утилиты
}

--- Создает новый экземпляр OMSJ_Procedures
-- @param #OMSJ_Config config Конфигурация
-- @param #OMSJ_Utils utils Утилиты
-- @return #OMSJ_Procedures
function OMSJ_Procedures:New(config, utils)
  local self = BASE:Inherit(self, BASE:New())
  
  self.Config = config
  self.Utils = utils
  
  self:Initialize()
  
  return self
end

--- Инициализирует процедуры
function OMSJ_Procedures:Initialize()
  -- Инициализация путевых точек
  self:InitializeWaypoints()
  
  -- Инициализация SID
  self:InitializeSIDs()
  
  -- Инициализация STAR
  self:InitializeSTARs()
  
  -- Инициализация Approach
  self:InitializeApproaches()
  
  self.Utils:Log("Procedures initialized successfully", "info", self.Config)
end

--- Инициализирует путевые точки
function OMSJ_Procedures:InitializeWaypoints()
  -- Основные путевые точки аэропорта Шарджа
  self.Waypoints = {
    -- Путевые точки для SID
    ["ANVIX"] = { x = -92000, y = 5000, z = -80000 },
    ["DESDI"] = { x = -85000, y = 5000, z = -85000 },
    ["EMERU"] = { x = -100000, y = 5000, z = -65000 },
    ["GIDIS"] = { x = -110000, y = 5000, z = -70000 },
    ["IVURO"] = { x = -80000, y = 5000, z = -90000 },
    ["LAGSA"] = { x = -95000, y = 5000, z = -60000 },
    
    -- Путевые точки для STAR
    ["ULDOT"] = { x = -120000, y = 5000, z = -50000 },
    ["RABLA"] = { x = -130000, y = 5000, z = -60000 },
    ["TONVO"] = { x = -140000, y = 5000, z = -70000 },
    ["IMDIL"] = { x = -150000, y = 5000, z = -80000 },
    ["GETBO"] = { x = -160000, y = 5000, z = -90000 },
    
    -- Путевые точки для Approach
    ["OMDB"] = { x = -100000, y = 5000, z = -100000 }, -- Dubai
    ["OMAA"] = { x = -150000, y = 5000, z = -120000 }, -- Abu Dhabi
    ["OMDW"] = { x = -120000, y = 5000, z = -110000 }, -- Al Maktoum
    
    -- Точки финального захода
    ["RW12_FAF"] = { x = -90000, y = 1000, z = -75000 }, -- Final Approach Fix для ВПП 12
    ["RW30_FAF"] = { x = -97000, y = 1000, z = -70000 }  -- Final Approach Fix для ВПП 30
  }
  
  self.Utils:Log("Waypoints initialized: " .. self:CountWaypoints() .. " waypoints", "debug", self.Config)
end

--- Инициализирует SID
function OMSJ_Procedures:InitializeSIDs()
  -- SID для ВПП 12
  self.SIDs["ANVIX1C"] = {
    runway = "12",
    waypoints = { "ANVIX" },
    description = "ANVIX ONE CHARLIE DEPARTURE"
  }
  
  self.SIDs["DESDI1C"] = {
    runway = "12",
    waypoints = { "DESDI" },
    description = "DESDI ONE CHARLIE DEPARTURE"
  }
  
  self.SIDs["EMERU1C"] = {
    runway = "12",
    waypoints = { "EMERU" },
    description = "EMERU ONE CHARLIE DEPARTURE"
  }
  
  -- SID для ВПП 30
  self.SIDs["GIDIS1T"] = {
    runway = "30",
    waypoints = { "GIDIS" },
    description = "GIDIS ONE TANGO DEPARTURE"
  }
  
  self.SIDs["IVURO1T"] = {
    runway = "30",
    waypoints = { "IVURO" },
    description = "IVURO ONE TANGO DEPARTURE"
  }
  
  self.SIDs["LAGSA1T"] = {
    runway = "30",
    waypoints = { "LAGSA" },
    description = "LAGSA ONE TANGO DEPARTURE"
  }
  
  self.Utils:Log("SIDs initialized: " .. self:CountSIDs() .. " SIDs", "debug", self.Config)
end

--- Инициализирует STAR
function OMSJ_Procedures:InitializeSTARs()
  -- STAR для ВПП 12
  self.STARs["ULDOT1C"] = {
    runway = "12",
    waypoints = { "ULDOT", "RABLA", "RW12_FAF" },
    description = "ULDOT ONE CHARLIE ARRIVAL"
  }
  
  self.STARs["TONVO1C"] = {
    runway = "12",
    waypoints = { "TONVO", "RABLA", "RW12_FAF" },
    description = "TONVO ONE CHARLIE ARRIVAL"
  }
  
  -- STAR для ВПП 30
  self.STARs["IMDIL1T"] = {
    runway = "30",
    waypoints = { "IMDIL", "GETBO", "RW30_FAF" },
    description = "IMDIL ONE TANGO ARRIVAL"
  }
  
  self.STARs["GETBO1T"] = {
    runway = "30",
    waypoints = { "GETBO", "RW30_FAF" },
    description = "GETBO ONE TANGO ARRIVAL"
  }
  
  self.Utils:Log("STARs initialized: " .. self:CountSTARs() .. " STARs", "debug", self.Config)
end

--- Инициализирует Approach
function OMSJ_Procedures:InitializeApproaches()
  -- ILS подходы
  self.Approaches["ILS12"] = {
    runway = "12",
    type = "ILS",
    waypoints = { "RW12_FAF" },
    frequency = 110.10,
    course = 120,
    description = "ILS APPROACH RUNWAY 12"
  }
  
  self.Approaches["ILS30"] = {
    runway = "30",
    type = "ILS",
    waypoints = { "RW30_FAF" },
    frequency = 110.70,
    course = 300,
    description = "ILS APPROACH RUNWAY 30"
  }
  
  -- VOR подходы
  self.Approaches["VOR12"] = {
    runway = "12",
    type = "VOR",
    waypoints = { "RW12_FAF" },
    frequency = 114.90,
    course = 120,
    description = "VOR APPROACH RUNWAY 12"
  }
  
  self.Approaches["VOR30"] = {
    runway = "30",
    type = "VOR",
    waypoints = { "RW30_FAF" },
    frequency = 114.90,
    course = 300,
    description = "VOR APPROACH RUNWAY 30"
  }
  
  -- RNAV подходы
  self.Approaches["RNAV12"] = {
    runway = "12",
    type = "RNAV",
    waypoints = { "RW12_FAF" },
    description = "RNAV APPROACH RUNWAY 12"
  }
  
  self.Approaches["RNAV30"] = {
    runway = "30",
    type = "RNAV",
    waypoints = { "RW30_FAF" },
    description = "RNAV APPROACH RUNWAY 30"
  }
  
  self.Utils:Log("Approaches initialized: " .. self:CountApproaches() .. " approaches", "debug", self.Config)
end

--- Добавляет схему SID
-- @param #string name Название SID
-- @param #table waypoints Путевые точки
-- @param #string runway ВПП (12, 30)
-- @param #string description Описание (опционально)
function OMSJ_Procedures:AddSID(name, waypoints, runway, description)
  self.SIDs[name] = {
    runway = runway,
    waypoints = waypoints,
    description = description or name
  }
  
  self.Utils:Log("SID added: " .. name, "debug", self.Config)
end

--- Добавляет схему STAR
-- @param #string name Название STAR
-- @param #table waypoints Путевые точки
-- @param #string runway ВПП (12, 30)
-- @param #string description Описание (опционально)
function OMSJ_Procedures:AddSTAR(name, waypoints, runway, description)
  self.STARs[name] = {
    runway = runway,
    waypoints = waypoints,
    description = description or name
  }
  
  self.Utils:Log("STAR added: " .. name, "debug", self.Config)
end

--- Добавляет схему захода на посадку
-- @param #string name Название схемы
-- @param #string type Тип схемы (ILS, VOR, RNAV)
-- @param #table waypoints Путевые точки
-- @param #string runway ВПП (12, 30)
-- @param #number frequency Частота (для ILS, VOR)
-- @param #number course Курс (для ILS, VOR)
-- @param #string description Описание (опционально)
function OMSJ_Procedures:AddApproach(name, type, waypoints, runway, frequency, course, description)
  self.Approaches[name] = {
    runway = runway,
    type = type,
    waypoints = waypoints,
    frequency = frequency,
    course = course,
    description = description or name
  }
  
  self.Utils:Log("Approach added: " .. name, "debug", self.Config)
end

--- Получает схему SID
-- @param #string name Название SID
-- @return #table Схема SID
function OMSJ_Procedures:GetSID(name)
  return self.SIDs[name]
end

--- Получает схему STAR
-- @param #string name Название STAR
-- @return #table Схема STAR
function OMSJ_Procedures:GetSTAR(name)
  return self.STARs[name]
end

--- Получает схему захода на посадку
-- @param #string name Название схемы
-- @return #table Схема захода на посадку
function OMSJ_Procedures:GetApproach(name)
  return self.Approaches[name]
end

--- Получает путевую точку
-- @param #string name Название точки
-- @return #table Координаты точки
function OMSJ_Procedures:GetWaypoint(name)
  return self.Waypoints[name]
end

--- Получает все SID для указанной ВПП
-- @param #string runway Номер ВПП (12, 30)
-- @return #table Список SID
function OMSJ_Procedures:GetSIDsForRunway(runway)
  local result = {}
  
  for name, sid in pairs(self.SIDs) do
    if sid.runway == runway then
      result[name] = sid
    end
  end
  
  return result
end

--- Получает все STAR для указанной ВПП
-- @param #string runway Номер ВПП (12, 30)
-- @return #table Список STAR
function OMSJ_Procedures:GetSTARsForRunway(runway)
  local result = {}
  
  for name, star in pairs(self.STARs) do
    if star.runway == runway then
      result[name] = star
    end
  end
  
  return result
end

--- Получает все заходы для указанной ВПП
-- @param #string runway Номер ВПП (12, 30)
-- @return #table Список заходов
function OMSJ_Procedures:GetApproachesForRunway(runway)
  local result = {}
  
  for name, approach in pairs(self.Approaches) do
    if approach.runway == runway then
      result[name] = approach
    end
  end
  
  return result
end

--- Получает количество путевых точек
-- @return #number Количество точек
function OMSJ_Procedures:CountWaypoints()
  local count = 0
  for _ in pairs(self.Waypoints) do count = count + 1 end
  return count
end

--- Получает количество SID
-- @return #number Количество SID
function OMSJ_Procedures:CountSIDs()
  local count = 0
  for _ in pairs(self.SIDs) do count = count + 1 end
  return count
end

--- Получает количество STAR
-- @return #number Количество STAR
function OMSJ_Procedures:CountSTARs()
  local count = 0
  for _ in pairs(self.STARs) do count = count + 1 end
  return count
end

--- Получает количество заходов
-- @return #number Количество заходов
function OMSJ_Procedures:CountApproaches()
  local count = 0
  for _ in pairs(self.Approaches) do count = count + 1 end
  return count
end

--- Загружает процедуры из файла
-- @param #string filePath Путь к файлу
-- @return #boolean Успешность загрузки
function OMSJ_Procedures:LoadFromFile(filePath)
  -- Проверка наличия файла
  local file = io.open(filePath, "r")
  if not file then
    self.Utils:Log("Failed to load procedures from file: " .. filePath, "warning", self.Config)
    return false
  end
  
  -- Чтение содержимого файла
  local content = file:read("*all")
  file:close()
  
  -- Попытка загрузки как JSON
  local success, data = pcall(function() return JSON:decode(content) end)
  if not success then
    self.Utils:Log("Failed to parse procedures file as JSON", "warning", self.Config)
    return false
  end
  
  -- Загрузка путевых точек
  if data.waypoints then
    for name, coords in pairs(data.waypoints) do
      self.Waypoints[name] = coords
    end
  end
  
  -- Загрузка SID
  if data.sids then
    for name, sid in pairs(data.sids) do
      self.SIDs[name] = sid
    end
  end
  
  -- Загрузка STAR
  if data.stars then
    for name, star in pairs(data.stars) do
      self.STARs[name] = star
    end
  end
  
  -- Загрузка Approach
  if data.approaches then
    for name, approach in pairs(data.approaches) do
      self.Approaches[name] = approach
    end
  end
  
  self.Utils:Log("Procedures loaded from file: " .. filePath, "info", self.Config)
  return true
end

--- Сохраняет процедуры в файл
-- @param #string filePath Путь к файлу
-- @return #boolean Успешность сохранения
function OMSJ_Procedures:SaveToFile(filePath)
  -- Подготовка данных
  local data = {
    waypoints = self.Waypoints,
    sids = self.SIDs,
    stars = self.STARs,
    approaches = self.Approaches
  }
  
  -- Преобразование в JSON
  local content = JSON:encode(data)
  
  -- Запись в файл
  local file = io.open(filePath, "w")
  if not file then
    self.Utils:Log("Failed to save procedures to file: " .. filePath, "warning", self.Config)
    return false
  end
  
  file:write(content)
  file:close()
  
  self.Utils:Log("Procedures saved to file: " .. filePath, "info", self.Config)
  return true
end

return OMSJ_Procedures
