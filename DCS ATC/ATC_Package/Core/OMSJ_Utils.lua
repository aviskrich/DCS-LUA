--- OMSJ_Utils.lua
-- Вспомогательные функции для модуля диспетчерских служб аэропорта Шарджа
-- @module OMSJ_Utils

--- Класс утилит
-- @type OMSJ_Utils
OMSJ_Utils = {
  ClassName = "OMSJ_Utils"
}

--- Создает новый экземпляр утилит
-- @return #OMSJ_Utils
function OMSJ_Utils:New()
  local self = BASE:Inherit(self, BASE:New())
  return self
end

--- Логирует сообщение
-- @param #string message Сообщение для логирования
-- @param #string level Уровень логирования (debug, info, warning, error)
-- @param #OMSJ_Config config Конфигурация
function OMSJ_Utils:Log(message, level, config)
  level = level or "info"
  
  if not config or not config.Logging or not config.Logging.Enabled then
    return
  end
  
  local logConfig = config:GetLoggingConfig()
  
  -- Проверка уровня логирования
  local levels = {debug = 1, info = 2, warning = 3, error = 4}
  if levels[level] < levels[logConfig.Level] then
    return
  end
  
  -- Форматирование сообщения
  local timestamp = os.date("%Y-%m-%d %H:%M:%S")
  local formattedMessage = string.format("[%s] [%s] %s", timestamp, level:upper(), message)
  
  -- Вывод в чат
  if logConfig.ToChat then
    MESSAGE:New(formattedMessage, 10):ToAll()
  end
  
  -- Запись в файл
  if logConfig.ToFile and logConfig.FilePath then
    local file = io.open(logConfig.FilePath, "a")
    if file then
      file:write(formattedMessage .. "\n")
      file:close()
    end
  end
end

--- Конвертирует координаты из формата DCS в географические координаты
-- @param #table dcsCoords Координаты в формате DCS {x, y, z}
-- @return #table Географические координаты {lat, lon, alt}
function OMSJ_Utils:ConvertCoordsToGeo(dcsCoords)
  local lat, lon, alt = coord.LOtoLL(dcsCoords.x, dcsCoords.z)
  return {lat = lat, lon = lon, alt = dcsCoords.y}
end

--- Конвертирует географические координаты в формат DCS
-- @param #table geoCoords Географические координаты {lat, lon, alt}
-- @return #table Координаты в формате DCS {x, y, z}
function OMSJ_Utils:ConvertGeoToCoords(geoCoords)
  local x, z = coord.LLtoLO(geoCoords.lat, geoCoords.lon)
  return {x = x, y = geoCoords.alt, z = z}
end

--- Вычисляет расстояние между двумя точками в метрах
-- @param #table point1 Первая точка {x, y, z}
-- @param #table point2 Вторая точка {x, y, z}
-- @return #number Расстояние в метрах
function OMSJ_Utils:GetDistance(point1, point2)
  local dx = point1.x - point2.x
  local dy = point1.y - point2.y
  local dz = point1.z - point2.z
  return math.sqrt(dx*dx + dy*dy + dz*dz)
end

--- Вычисляет курс от одной точки к другой
-- @param #table fromPoint Начальная точка {x, y, z}
-- @param #table toPoint Конечная точка {x, y, z}
-- @return #number Курс в градусах (0-359)
function OMSJ_Utils:GetHeading(fromPoint, toPoint)
  local dx = toPoint.x - fromPoint.x
  local dz = toPoint.z - fromPoint.z
  local heading = math.deg(math.atan2(dz, dx))
  heading = (heading + 90) % 360
  return heading
end

--- Форматирует частоту для отображения
-- @param #number frequency Частота в МГц
-- @return #string Отформатированная частота
function OMSJ_Utils:FormatFrequency(frequency)
  return string.format("%.2f", frequency)
end

--- Форматирует высоту для отображения
-- @param #number altitude Высота в метрах
-- @param #boolean inFeet Вернуть в футах
-- @return #string Отформатированная высота
function OMSJ_Utils:FormatAltitude(altitude, inFeet)
  if inFeet then
    altitude = altitude * 3.28084 -- конвертация в футы
    return string.format("%d feet", math.floor(altitude))
  else
    return string.format("%d meters", math.floor(altitude))
  end
end

--- Форматирует скорость для отображения
-- @param #number speed Скорость в м/с
-- @param #string unit Единица измерения (kts, kmh, ms)
-- @return #string Отформатированная скорость
function OMSJ_Utils:FormatSpeed(speed, unit)
  unit = unit or "kts"
  
  if unit == "kts" then
    speed = speed * 1.94384 -- конвертация в узлы
    return string.format("%d knots", math.floor(speed))
  elseif unit == "kmh" then
    speed = speed * 3.6 -- конвертация в км/ч
    return string.format("%d km/h", math.floor(speed))
  else
    return string.format("%d m/s", math.floor(speed))
  end
end

--- Получает текущее время в формате HH:MM
-- @return #string Текущее время
function OMSJ_Utils:GetTimeString()
  return os.date("%H:%M")
end

--- Получает информацию о погоде в аэропорту
-- @param #table position Позиция аэропорта {x, y, z}
-- @return #table Информация о погоде
function OMSJ_Utils:GetWeatherInfo(position)
  local wind = env.getWind(position)
  local windDir = math.deg(math.atan2(wind.z, wind.x))
  if windDir < 0 then windDir = windDir + 360 end
  windDir = (windDir + 180) % 360 -- конвертация в метеорологический формат
  
  local windSpeed = math.sqrt(wind.x^2 + wind.z^2)
  local temperature = env.getTemperature(position)
  local pressure = env.getPressure(position)
  
  return {
    windDirection = math.floor(windDir),
    windSpeed = windSpeed,
    temperature = temperature,
    pressure = pressure
  }
end

--- Форматирует информацию о погоде для передачи пилоту
-- @param #table weatherInfo Информация о погоде
-- @return #string Отформатированная информация о погоде
function OMSJ_Utils:FormatWeatherInfo(weatherInfo)
  local windDir = string.format("%03d", weatherInfo.windDirection)
  local windSpeed = self:FormatSpeed(weatherInfo.windSpeed, "kts")
  local temperature = string.format("%d", math.floor(weatherInfo.temperature))
  local qnh = string.format("%.0f", weatherInfo.pressure * 0.750062 * 1000) -- конвертация в мм рт.ст.
  
  return string.format("Wind %s at %s, temperature %s degrees, QNH %s", 
                      windDir, 
                      windSpeed:match("(%d+)"), 
                      temperature, 
                      qnh)
end

--- Получает тип самолета игрока
-- @param #CLIENT client Объект клиента
-- @return #string Тип самолета
function OMSJ_Utils:GetAircraftType(client)
  if not client then return "Unknown" end
  
  local unitType = client:GetClientCategory()
  if unitType == 1 then -- самолет
    return "Aircraft"
  elseif unitType == 2 then -- вертолет
    return "Helicopter"
  else
    return "Unknown"
  end
end

--- Получает позывной игрока
-- @param #CLIENT client Объект клиента
-- @return #string Позывной
function OMSJ_Utils:GetCallsign(client)
  if not client then return "Unknown" end
  
  local callsign = client:GetCallsign()
  if callsign and callsign ~= "" then
    return callsign
  else
    return "Unknown"
  end
end

--- Проверяет, находится ли игрок в зоне ответственности аэропорта
-- @param #CLIENT client Объект клиента
-- @param #table airportPosition Позиция аэропорта {x, y, z}
-- @param #number radius Радиус зоны ответственности в метрах
-- @return #boolean Находится ли игрок в зоне
function OMSJ_Utils:IsInAirportZone(client, airportPosition, radius)
  if not client then return false end
  
  local clientPosition = client:GetPosition().p
  local distance = self:GetDistance(clientPosition, airportPosition)
  
  return distance <= radius
end

return OMSJ_Utils
