--- OMSJ_SRS.lua
-- Интеграция с SRS для модуля диспетчерских служб аэропорта Шарджа
-- @module OMSJ_SRS

--- Класс для интеграции с SRS
-- @type OMSJ_SRS
OMSJ_SRS = {
  ClassName = "OMSJ_SRS",
  SRSPath = nil,            -- Путь к SRS
  SRSPort = nil,            -- Порт SRS
  Voices = {},              -- Голоса для разных служб
  Label = "OMSJ_ATC",       -- Метка в SRS
  Config = nil,             -- Ссылка на конфигурацию
  Utils = nil               -- Ссылка на утилиты
}

--- Создает новый экземпляр OMSJ_SRS
-- @param #OMSJ_Config config Конфигурация
-- @param #OMSJ_Utils utils Утилиты
-- @return #OMSJ_SRS
function OMSJ_SRS:New(config, utils)
  local self = BASE:Inherit(self, BASE:New())
  
  self.Config = config
  self.Utils = utils
  
  local srsConfig = config:GetSRSConfig()
  self.SRSPath = srsConfig.Path
  self.SRSPort = srsConfig.Port
  self.Voices = srsConfig.Voices
  self.Label = srsConfig.Label
  
  self:Initialize()
  
  return self
end

--- Инициализирует SRS
function OMSJ_SRS:Initialize()
  -- Проверка наличия SRS
  local success = self:CheckSRSInstallation()
  if not success then
    self.Utils:Log("SRS not found at path: " .. self.SRSPath, "warning", self.Config)
    return false
  end
  
  self.Utils:Log("SRS initialized successfully", "info", self.Config)
  return true
end

--- Проверяет установку SRS
-- @return #boolean Установлен ли SRS
function OMSJ_SRS:CheckSRSInstallation()
  -- Проверка наличия файла DCS-SR-ExternalAudio.exe
  local externalAudioPath = self.SRSPath .. "\\DCS-SR-ExternalAudio.exe"
  local file = io.open(externalAudioPath, "r")
  if file then
    file:close()
    return true
  else
    return false
  end
end

--- Отправляет сообщение через SRS
-- @param #string message Сообщение
-- @param #number frequency Частота в МГц
-- @param #number modulation Модуляция (0 = AM, 1 = FM)
-- @param #string callsign Позывной
-- @param #number coalition Коалиция (0 = нейтральная, 1 = красная, 2 = синяя)
-- @param #table position Позиция передачи (опционально)
-- @return #boolean Успешность отправки
function OMSJ_SRS:SendMessage(message, frequency, modulation, callsign, coalition, position)
  -- Определение службы по позывному
  local service = "TWR"
  if string.find(callsign, "Approach") then
    service = "APP"
  elseif string.find(callsign, "Departure") then
    service = "DEP"
  end
  
  -- Получение голоса для службы
  local voice = self.Voices[service]
  
  -- Проверка наличия STTS
  if not STTS then
    self.Utils:Log("STTS not available. Message not sent: " .. message, "warning", self.Config)
    return false
  end
  
  -- Подготовка параметров позиции
  local positionParam = nil
  if position then
    positionParam = position
  end
  
  -- Отправка сообщения через STTS
  local success = STTS.TextToSpeech(
    message,
    tostring(frequency),
    modulation == 0 and "AM" or "FM",
    "1.0",
    callsign,
    coalition,
    positionParam,
    1,
    voice.gender,
    voice.culture,
    voice.voice
  )
  
  -- Логирование
  if success then
    self.Utils:Log("SRS message sent: " .. message .. " on " .. tostring(frequency) .. " MHz", "debug", self.Config)
  else
    self.Utils:Log("Failed to send SRS message: " .. message, "warning", self.Config)
  end
  
  return success
end

--- Отправляет сообщение через SRS для конкретной службы
-- @param #string serviceName Имя службы (TWR, APP, DEP)
-- @param #string message Сообщение
-- @param #table position Позиция передачи (опционально)
-- @return #boolean Успешность отправки
function OMSJ_SRS:SendServiceMessage(serviceName, message, position)
  local serviceConfig = self.Config:GetServiceConfig(serviceName)
  if not serviceConfig then
    self.Utils:Log("Service not found: " .. serviceName, "warning", self.Config)
    return false
  end
  
  return self:SendMessage(
    message,
    serviceConfig.Frequency,
    serviceConfig.Modulation,
    serviceConfig.Callsign,
    serviceConfig.Coalition,
    position
  )
end

--- Устанавливает голос для службы
-- @param #string serviceName Название службы (TWR, APP, DEP)
-- @param #string voice Название голоса
-- @param #string gender Пол (male, female)
-- @param #string culture Культура (en-US, ru-RU и т.д.)
function OMSJ_SRS:SetVoice(serviceName, voice, gender, culture)
  if not self.Voices[serviceName] then
    self.Voices[serviceName] = {}
  end
  
  self.Voices[serviceName].voice = voice
  self.Voices[serviceName].gender = gender
  self.Voices[serviceName].culture = culture
  
  self.Utils:Log("Voice set for " .. serviceName .. ": " .. voice, "debug", self.Config)
end

--- Получает голос для службы
-- @param #string serviceName Название службы (TWR, APP, DEP)
-- @return #table Настройки голоса
function OMSJ_SRS:GetVoice(serviceName)
  return self.Voices[serviceName]
end

--- Проверяет доступность SRS
-- @return #boolean Доступен ли SRS
function OMSJ_SRS:IsSRSAvailable()
  return STTS ~= nil
end

return OMSJ_SRS
