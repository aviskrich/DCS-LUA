--[[
DTC_SRS.lua
Модуль для интеграции с SRS и распознавания речи для универсального ATC модуля
Автор: AVIskrich
Дата: Апрель 2025
--]]

local DTC_SRS = {}

-- Настройки SRS
DTC_SRS.settings = {
    enabled = true,
    port = 5002,
    sttEnabled = true,
    confidenceThreshold = 0.7
}

-- Флаг, указывающий, инициализирован ли модуль
DTC_SRS.isInitialized = false

-- Таблица для хранения обработчиков распознанных фраз
DTC_SRS.phraseHandlers = {}

-- Логирование
DTC_SRS.log = function(message)
    if DTC_Config and DTC_Config.DEBUG then
        env.info("[DTC_SRS] " .. message)
    end
end

-- Инициализация модуля
DTC_SRS.init = function()
    if DTC_SRS.isInitialized then
        return true
    end
    
    -- Загрузка настроек из конфигурации
    if DTC_Config and DTC_Config.SRS then
        DTC_SRS.settings.enabled = DTC_Config.SRS.ENABLED
        DTC_SRS.settings.port = DTC_Config.SRS.PORT
        DTC_SRS.settings.sttEnabled = DTC_Config.SRS.STT_ENABLED
        DTC_SRS.settings.confidenceThreshold = DTC_Config.SRS.STT_CONFIDENCE_THRESHOLD
    end
    
    -- Проверка, включен ли SRS
    if not DTC_SRS.settings.enabled then
        DTC_SRS.log("SRS интеграция отключена в настройках")
        return false
    end
    
    -- Инициализация SRS API
    local success = DTC_SRS.initSRS()
    if not success then
        DTC_SRS.log("Ошибка при инициализации SRS API")
        return false
    end
    
    -- Инициализация STT, если включено
    if DTC_SRS.settings.sttEnabled then
        local sttSuccess = DTC_SRS.initSTT()
        if not sttSuccess then
            DTC_SRS.log("Ошибка при инициализации STT")
            return false
        end
    end
    
    DTC_SRS.isInitialized = true
    DTC_SRS.log("SRS модуль успешно инициализирован")
    return true
end

-- Инициализация SRS API
DTC_SRS.initSRS = function()
    -- Проверка наличия SRS API
    if not SRS then
        DTC_SRS.log("SRS API не найден")
        return false
    end
    
    -- Инициализация SRS API
    local success, result = pcall(function()
        return SRS.init(DTC_SRS.settings.port)
    end)
    
    if not success or not result then
        DTC_SRS.log("Ошибка при инициализации SRS API: " .. tostring(result))
        return false
    end
    
    DTC_SRS.log("SRS API успешно инициализирован на порту " .. DTC_SRS.settings.port)
    return true
end

-- Инициализация STT
DTC_SRS.initSTT = function()
    -- Проверка наличия SRS STT API
    if not SRS or not SRS.startSTT then
        DTC_SRS.log("SRS STT API не найден")
        return false
    end
    
    -- Инициализация SRS STT API
    local success, result = pcall(function()
        return SRS.startSTT(DTC_SRS.onSpeechRecognized)
    end)
    
    if not success or not result then
        DTC_SRS.log("Ошибка при инициализации SRS STT API: " .. tostring(result))
        return false
    end
    
    DTC_SRS.log("SRS STT API успешно инициализирован")
    return true
end

-- Обработчик распознанной речи
DTC_SRS.onSpeechRecognized = function(text, confidence, frequency, modulation, unit)
    if not text or text == "" then
        return
    end
    
    -- Проверка уровня уверенности
    if confidence < DTC_SRS.settings.confidenceThreshold then
        DTC_SRS.log("Распознанный текст отклонен из-за низкого уровня уверенности: " .. text .. " (" .. confidence .. ")")
        return
    end
    
    DTC_SRS.log("Распознан текст: " .. text .. " (уверенность: " .. confidence .. ", частота: " .. frequency .. ")")
    
    -- Получение информации о юните
    local unitName = "Unknown"
    local unitType = "Unknown"
    local isPlayer = false
    
    if unit then
        unitName = unit:getName() or "Unknown"
        unitType = unit:getTypeName() or "Unknown"
        isPlayer = unit:getPlayerName() ~= nil
    end
    
    DTC_SRS.log("Юнит: " .. unitName .. " (" .. unitType .. "), игрок: " .. tostring(isPlayer))
    
    -- Обработка распознанного текста
    DTC_SRS.processRecognizedText(text, {
        confidence = confidence,
        frequency = frequency,
        modulation = modulation,
        unit = unit,
        unitName = unitName,
        unitType = unitType,
        isPlayer = isPlayer
    })
end

-- Обработка распознанного текста
DTC_SRS.processRecognizedText = function(text, info)
    -- Нормализация текста
    local normalizedText = DTC_SRS.normalizeText(text)
    
    -- Поиск подходящего обработчика
    for pattern, handler in pairs(DTC_SRS.phraseHandlers) do
        if string.match(normalizedText, pattern) then
            DTC_SRS.log("Найден обработчик для паттерна: " .. pattern)
            
            -- Вызов обработчика
            local success, result = pcall(function()
                return handler(normalizedText, info)
            end)
            
            if not success then
                DTC_SRS.log("Ошибка при вызове обработчика: " .. tostring(result))
            else
                DTC_SRS.log("Обработчик успешно выполнен")
                return true
            end
        end
    end
    
    DTC_SRS.log("Не найден обработчик для текста: " .. normalizedText)
    return false
end

-- Нормализация текста
DTC_SRS.normalizeText = function(text)
    -- Приведение к нижнему регистру
    local result = string.lower(text)
    
    -- Удаление лишних пробелов
    result = string.gsub(result, "%s+", " ")
    result = string.gsub(result, "^%s+", "")
    result = string.gsub(result, "%s+$", "")
    
    -- Замена чисел словами на цифры
    local numberWords = {
        ["zero"] = "0",
        ["one"] = "1",
        ["two"] = "2",
        ["three"] = "3",
        ["four"] = "4",
        ["five"] = "5",
        ["six"] = "6",
        ["seven"] = "7",
        ["eight"] = "8",
        ["nine"] = "9"
    }
    
    for word, digit in pairs(numberWords) do
        result = string.gsub(result, word, digit)
    end
    
    return result
end

-- Регистрация обработчика фразы
DTC_SRS.registerPhraseHandler = function(pattern, handler)
    if not pattern or not handler then
        DTC_SRS.log("Ошибка при регистрации обработчика: отсутствует паттерн или обработчик")
        return false
    end
    
    DTC_SRS.phraseHandlers[pattern] = handler
    DTC_SRS.log("Зарегистрирован обработчик для паттерна: " .. pattern)
    return true
end

-- Удаление обработчика фразы
DTC_SRS.unregisterPhraseHandler = function(pattern)
    if not pattern then
        DTC_SRS.log("Ошибка при удалении обработчика: отсутствует паттерн")
        return false
    end
    
    if DTC_SRS.phraseHandlers[pattern] then
        DTC_SRS.phraseHandlers[pattern] = nil
        DTC_SRS.log("Удален обработчик для паттерна: " .. pattern)
        return true
    else
        DTC_SRS.log("Обработчик для паттерна не найден: " .. pattern)
        return false
    end
end

-- Отправка текстового сообщения через SRS
DTC_SRS.sendTextMessage = function(message, frequency, modulation, coalition)
    if not DTC_SRS.isInitialized or not message or message == "" then
        return false
    end
    
    frequency = frequency or 124.0
    modulation = modulation or "AM"
    coalition = coalition or 0  -- 0 = все, 1 = красные, 2 = синие
    
    -- Проверка наличия SRS API
    if not SRS or not SRS.sendMessage then
        DTC_SRS.log("SRS API не найден или не поддерживает отправку сообщений")
        return false
    end
    
    -- Отправка сообщения
    local success, result = pcall(function()
        return SRS.sendMessage(message, frequency, modulation, coalition)
    end)
    
    if not success then
        DTC_SRS.log("Ошибка при отправке текстового сообщения: " .. tostring(result))
        return false
    end
    
    DTC_SRS.log("Отправлено текстовое сообщение: " .. message .. " (частота: " .. frequency .. ")")
    return true
end

-- Отправка голосового сообщения через SRS
DTC_SRS.sendVoiceMessage = function(message, frequency, modulation, coalition, voice)
    if not DTC_SRS.isInitialized or not message or message == "" then
        return false
    end
    
    frequency = frequency or 124.0
    modulation = modulation or "AM"
    coalition = coalition or 0  -- 0 = все, 1 = красные, 2 = синие
    voice = voice or "en-US-Standard-D"  -- Голос по умолчанию
    
    -- Проверка наличия SRS API
    if not SRS or not SRS.transmitTTS then
        DTC_SRS.log("SRS API не найден или не поддерживает отправку голосовых сообщений")
        return false
    end
    
    -- Отправка сообщения
    local success, result = pcall(function()
        return SRS.transmitTTS(message, frequency, modulation, coalition, voice)
    end)
    
    if not success then
        DTC_SRS.log("Ошибка при отправке голосового сообщения: " .. tostring(result))
        return false
    end
    
    DTC_SRS.log("Отправлено голосовое сообщение: " .. message .. " (частота: " .. frequency .. ")")
    return true
end

-- Получение частоты юнита
DTC_SRS.getUnitFrequency = function(unit)
    if not unit then
        return nil
    end
    
    -- Проверка наличия SRS API
    if not SRS or not SRS.getFrequency then
        DTC_SRS.log("SRS API не найден или не поддерживает получение частоты")
        return nil
    end
    
    -- Получение частоты
    local success, result = pcall(function()
        return SRS.getFrequency(unit)
    end)
    
    if not success or not result then
        DTC_SRS.log("Ошибка при получении частоты юнита: " .. tostring(result))
        return nil
    end
    
    return result
end

-- Проверка, настроен ли юнит на указанную частоту
DTC_SRS.isUnitTunedToFrequency = function(unit, frequency, tolerance)
    if not unit or not frequency then
        return false
    end
    
    tolerance = tolerance or 0.001  -- Допустимое отклонение частоты
    
    local unitFrequency = DTC_SRS.getUnitFrequency(unit)
    if not unitFrequency then
        return false
    end
    
    return math.abs(unitFrequency - frequency) <= tolerance
end

-- Регистрация стандартных обработчиков фраз
DTC_SRS.registerStandardPhraseHandlers = function(atcService)
    if not atcService then
        DTC_SRS.log("Ошибка при регистрации стандартных обработчиков: отсутствует служба ATC")
        return false
    end
    
    -- Запрос на руление
    DTC_SRS.registerPhraseHandler("request taxi", function(text, info)
        return atcService:handleTaxiRequest(info.unit)
    end)
    
    -- Запрос на взлет
    DTC_SRS.registerPhraseHandler("request takeoff", function(text, info)
        return atcService:handleTakeoffRequest(info.unit)
    end)
    
    -- Запрос на посадку
    DTC_SRS.registerPhraseHandler("request landing", function(text, info)
        return atcService:handleLandingRequest(info.unit)
    end)
    
    -- Запрос на заход
    DTC_SRS.registerPhraseHandler("request approach", function(text, info)
        return atcService:handleApproachRequest(info.unit)
    end)
    
    -- Запрос информации ATIS
    DTC_SRS.registerPhraseHandler("request atis", function(text, info)
        return atcService:handleATISRequest(info.unit)
    end)
    
    -- Запрос информации о погоде
    DTC_SRS.registerPhraseHandler("request weather", function(text, info)
        return atcService:handleWeatherRequest(info.unit)
    end)
    
    -- Запрос информации о трафике
    DTC_SRS.registerPhraseHandler("request traffic", function(text, info)
        return atcService:handleTrafficRequest(info.unit)
    end)
    
    -- Доклад о готовности к взлету
    DTC_SRS.registerPhraseHandler("ready for takeoff", function(text, info)
        return atcService:handleReadyForTakeoff(info.unit)
    end)
    
    -- Доклад о готовности к заходу
    DTC_SRS.registerPhraseHandler("ready for approach", function(text, info)
        return atcService:handleReadyForApproach(info.unit)
    end)
    
    -- Доклад о прибытии
    DTC_SRS.registerPhraseHandler("inbound", function(text, info)
        return atcService:handleInbound(info.unit)
    end)
    
    -- Доклад о выходе из зоны ответственности
    DTC_SRS.registerPhraseHandler("leaving your airspace", function(text, info)
        return atcService:handleLeavingAirspace(info.unit)
    end)
    
    DTC_SRS.log("Зарегистрированы стандартные обработчики фраз для службы ATC")
    return true
end

return DTC_SRS
