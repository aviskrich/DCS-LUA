--- OMSJ_Config.lua
-- Конфигурационный файл для модуля диспетчерских служб аэропорта Шарджа
-- @module OMSJ_Config

--- Класс конфигурации
-- @type OMSJ_Config
OMSJ_Config = {
  ClassName = "OMSJ_Config",
  
  -- Общие настройки
  AirportName = "Sharjah International Airport",
  AirportICAO = "OMSJ",
  
  -- Настройки SRS
  SRS = {
    Path = "C:\\Program Files\\DCS-SimpleRadio-Standalone",
    Port = 5002,
    Label = "OMSJ_ATC",
    Voices = {
      TWR = { voice = "Microsoft David Desktop", gender = "male", culture = "en-US" },
      APP = { voice = "Microsoft Zira Desktop", gender = "female", culture = "en-US" },
      DEP = { voice = "Microsoft Mark Desktop", gender = "male", culture = "en-US" }
    }
  },
  
  -- Настройки диспетчерских служб
  Services = {
    TWR = {
      Callsign = "Sharjah Tower",
      Frequency = 118.60,
      Modulation = 0, -- 0 = AM, 1 = FM
      Coalition = 2   -- 0 = Neutral, 1 = Red, 2 = Blue
    },
    APP = {
      Callsign = "Sharjah Approach",
      Frequency = 120.25,
      Modulation = 0,
      Coalition = 2
    },
    DEP = {
      Callsign = "Sharjah Departure",
      Frequency = 126.20,
      Modulation = 0,
      Coalition = 2
    }
  },
  
  -- Настройки ВПП
  Runways = {
    ["12"] = {
      Heading = 120,
      ILS = {
        Frequency = 110.10,
        Course = 120
      },
      Elevation = 50, -- метры над уровнем моря
      Coordinates = {
        Threshold = { x = -92779, y = 50, z = -73245 },
        End = { x = -94579, y = 50, z = -72245 }
      }
    },
    ["30"] = {
      Heading = 300,
      ILS = {
        Frequency = 110.70,
        Course = 300
      },
      Elevation = 50,
      Coordinates = {
        Threshold = { x = -94579, y = 50, z = -72245 },
        End = { x = -92779, y = 50, z = -73245 }
      }
    }
  },
  
  -- Настройки меню F10
  Menu = {
    MainTitle = "OMSJ ATC Services",
    RefreshInterval = 60, -- секунды
    MaxSubMenuItems = 10
  },
  
  -- Настройки логирования
  Logging = {
    Enabled = true,
    Level = "info", -- debug, info, warning, error
    ToChat = true,
    ToFile = true,
    FilePath = nil -- будет установлен автоматически
  }
}

--- Создает новый экземпляр конфигурации
-- @return #OMSJ_Config
function OMSJ_Config:New()
  local self = BASE:Inherit(self, BASE:New())
  
  -- Установка пути к файлу лога
  if self.Logging.ToFile and not self.Logging.FilePath then
    self.Logging.FilePath = lfs.writedir() .. "Logs\\OMSJ_ATC_" .. os.date("%Y%m%d_%H%M%S") .. ".log"
  end
  
  return self
end

--- Получает настройки службы по имени
-- @param #string serviceName Имя службы (TWR, APP, DEP)
-- @return #table Настройки службы
function OMSJ_Config:GetServiceConfig(serviceName)
  return self.Services[serviceName]
end

--- Получает настройки ВПП по номеру
-- @param #string runwayNumber Номер ВПП (12, 30)
-- @return #table Настройки ВПП
function OMSJ_Config:GetRunwayConfig(runwayNumber)
  return self.Runways[runwayNumber]
end

--- Получает настройки SRS
-- @return #table Настройки SRS
function OMSJ_Config:GetSRSConfig()
  return self.SRS
end

--- Получает настройки голоса SRS для службы
-- @param #string serviceName Имя службы (TWR, APP, DEP)
-- @return #table Настройки голоса
function OMSJ_Config:GetSRSVoice(serviceName)
  return self.SRS.Voices[serviceName]
end

--- Получает настройки меню F10
-- @return #table Настройки меню
function OMSJ_Config:GetMenuConfig()
  return self.Menu
end

--- Получает настройки логирования
-- @return #table Настройки логирования
function OMSJ_Config:GetLoggingConfig()
  return self.Logging
end

--- Определяет активную ВПП на основе ветра
-- @return #string Номер активной ВПП
function OMSJ_Config:DetermineActiveRunway()
  -- Получение данных о ветре
  local wind = env.getWind()
  local windDir = math.deg(math.atan2(wind.z, wind.x))
  if windDir < 0 then windDir = windDir + 360 end
  
  -- Расчет угла между ветром и ВПП
  local angle12 = math.abs((windDir - self.Runways["12"].Heading + 180) % 360 - 180)
  local angle30 = math.abs((windDir - self.Runways["30"].Heading + 180) % 360 - 180)
  
  -- Выбор ВПП с наименьшим углом (наиболее встречный ветер)
  if angle12 < angle30 then
    return "12"
  else
    return "30"
  end
end

return OMSJ_Config
