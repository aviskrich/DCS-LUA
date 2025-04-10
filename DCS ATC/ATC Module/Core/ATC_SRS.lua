--[[
ATC_SRS.lua
Модуль для интеграции с SRS и распознавания речи для универсального ATC модуля
Автор: Andrey Iskrich
Дата: Апрель 2025
--]]

local ATC_SRS = {}

-- Настройки SRS
ATC_SRS.settings = {
    enabled = true,
    port = 5002,
    sttEnabled = true,
    confidenceThreshold = 0.7
}

-- Флаг, указывающий, инициализирован ли модуль
ATC_SRS.isInitialized = false

-- Таблица для хранения обработчиков распознанных фраз
ATC_SRS.phraseHandlers = {}

-- Логирование
ATC_SRS.log = function(message)
    if ATC_Config and ATC_Config.DEBUG then
        env.info("[ATC_SRS] " .. message)
    end
end

-- Инициализация модуля
ATC_SRS.init = function()
    if ATC_SRS.isInitialized then
        return true
    end
    
    -- Загрузка настроек из конфигурации
    if ATC_Config and ATC_Config.SRS then
        ATC_SRS.settings.enabled = ATC_Config.SRS.ENABLED
        ATC_SRS.settings.port = ATC_Config.SRS.PORT
        ATC_SRS.settings.sttEnabled = ATC_Config.SRS.STT_ENABLED
        ATC_SRS.settings.confidenceThreshold = ATC_Config.SRS.STT_CONFIDENCE_THRESHOLD
    end
    
    -- Проверка, включен ли SRS
    if not ATC_SRS.settings.enabled then
        ATC_SRS.log("SRS интеграция отключена в настройках")
        return false
    end
    
    -- Инициализация SRS API
    local success = ATC_SRS.initSRS()
    if not success then
        ATC_SRS.log("Ошибка при инициализации SRS API")
        return false
    end
    
    -- Инициализация STT, если включено
    if ATC_SRS.settings.sttEnabled then
        local sttSuccess = ATC_SRS.initSTT()
        if not sttSuccess then
            ATC_SRS.log("Ошибка при инициализации STT")
            return false
        end
    end
    
    ATC_SRS.isInitialized = true
    ATC_SRS.log("SRS модуль успешно инициализирован")
    return true
end

-- Инициализация SRS API
ATC_SRS.initSRS = function()
    -- Проверка наличия SRS API
    if not SRS then
        ATC_SRS.log("SRS API не найден")
        return false
    end
    
    -- Инициализация SRS API
    local success, result = pcall(function()
        return SRS.init(ATC_SRS.settings.port)
    end)
    
    if not success or not result then
        ATC_SRS.log("Ошибка при инициализации SRS API: " .. tostring(result))
        return false
    end
    
    ATC_SRS.log("SRS API успешно инициализирован на порту " .. ATC_SRS.settings.port)
    return true
end

-- Инициализация STT
ATC_SRS.initSTT = function()
    -- Проверка наличия SRS STT API
    if not SRS or not SRS.startSTT then
        ATC_SRS.log("SRS STT API не найден")
        return false
    end
    
    -- Инициализация SRS STT API
    local success, result = pcall(function()
        return SRS.startSTT(ATC_SRS.onSpeechRecognized)
    end)
    
    if not success or not result then
        ATC_SRS.log("Ошибка при инициализации SRS STT API: " .. tostring(result))
        return false
    end
    
    ATC_SRS.log("SRS STT API успешно инициализирован")
    return true
end

-- Обработчик распознанной речи
ATC_SRS.onSpeechRecognized = function(text, confidence, frequency, modulation, unit)
    if not text or text == "" then
        return
    end
    
    -- Проверка уровня уверенности
    if confidence < ATC_SRS.settings.confidenceThreshold then
        ATC_SRS.log("Распознанный текст отклонен из-за низкого уровня уверенности: " .. text .. " (" .. confidence .. ")")
        return
    end
    
    ATC_SRS.log("Распознан текст: " .. text .. " (уверенность: " .. confidence .. ", частота: " .. frequency .. ")")
    
    -- Получение информации о юните
    local unitName = "Unknown"
    local unitType = "Unknown"
    local isPlayer = false
    
    if unit then
        unitName = unit:getName() or "Unknown"
        unitType = unit:getTypeName() or "Unknown"
        isPlayer = unit:getPlayerName() ~= nil
    end
    
    ATC_SRS.log("Юнит: " .. unitName .. " (" .. unitType .. "), игрок: " .. tostring(isPlayer))
    
    -- Обработка распознанного текста
    ATC_SRS.processRecognizedText(text, {
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
ATC_SRS.processRecognizedText = function(text, info)
    -- Нормализация текста
    local normalizedText = ATC_SRS.normalizeText(text)
    
    -- Поиск подходящего обработчика
    for pattern, handler in pairs(ATC_SRS.phraseHandlers) do
        if string.match(normalizedText, pattern) then
            ATC_SRS.log("Найден обработчик для паттерна: " .. pattern)
            
            -- Вызов обработчика
            local success, result = pcall(function()
                return handler(normalizedText, info)
            end)
            
            if not success then
                ATC_SRS.log("Ошибка при вызове обработчика: " .. tostring(result))
            else
                ATC_SRS.log("Обработчик успешно выполнен")
                return true
            end
        end
    end
    
    ATC_SRS.log("Не найден обработчик для текста: " .. normalizedText)
    return false
end

-- Нормализация текста
ATC_SRS.normalizeText = function(text)
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
ATC_SRS.registerPhraseHandler = function(pattern, handler)
    if not pattern or not handler then
        ATC_SRS.log("Ошибка при регистрации обработчика: отсутствует паттерн или обработчик")
        return false
    end
    
    ATC_SRS.phraseHandlers[pattern] = handler
    ATC_SRS.log("Зарегистрирован обработчик для паттерна: " .. pattern)
    return true
end

-- Удаление обработчика фразы
ATC_SRS.unregisterPhraseHandler = function(pattern)
    if not pattern then
        ATC_SRS.log("Ошибка при удалении обработчика: отсутствует паттерн")
        return false
    end
    
    if ATC_SRS.phraseHandlers[pattern] then
        ATC_SRS.phraseHandlers[pattern] = nil
        ATC_SRS.log("Удален обработчик для паттерна: " .. pattern)
        return true
    else
        ATC_SRS.log("Обработчик для паттерна не найден: " .. pattern)
        return false
    end
end

-- Отправка текстового сообщения через SRS
ATC_SRS.sendTextMessage = function(message, frequency, modulation, coalition)
    if not ATC_SRS.isInitialized or not message or message == "" then
        return false
    end
    
    frequency = frequency or 124.0
    modulation = modulation or "AM"
    coalition = coalition or 0  -- 0 = все, 1 = красные, 2 = синие
    
    -- Проверка наличия SRS API
    if not SRS or not SRS.sendMessage then
        ATC_SRS.log("SRS API не найден или не поддерживает отправку сообщений")
        return false
    end
    
    -- Отправка сообщения
    local success, result = pcall(function()
        return SRS.sendMessage(message, frequency, modulation, coalition)
    end)
    
    if not success then
        ATC_SRS.log("Ошибка при отправке текстового сообщения: " .. tostring(result))
        return false
    end
    
    ATC_SRS.log("Отправлено текстовое сообщение: " .. message .. " (частота: " .. frequency .. ")")
    return true
end

-- Отправка голосового сообщения через SRS
ATC_SRS.sendVoiceMessage = function(message, frequency, modulation, coalition, voice)
    if not ATC_SRS.isInitialized or not message or message == "" then
        return false
    end
    
    frequency = frequency or 124.0
    modulation = modulation or "AM"
    coalition = coalition or 0  -- 0 = все, 1 = красные, 2 = синие
    voice = voice or "en-US-Standard-D"  -- Голос по умолчанию
    
    -- Проверка наличия SRS API
    if not SRS or not SRS.transmitTTS then
        ATC_SRS.log("SRS API не найден или не поддерживает отправку голосовых сообщений")
        return false
    end
    
    -- Отправка сообщения
    local success, result = pcall(function()
        return SRS.transmitTTS(message, frequency, modulation, coalition, voice)
    end)
    
    if not success then
        ATC_SRS.log("Ошибка при отправке голосового сообщения: " .. tostring(result))
        return false
    end
    
    ATC_SRS.log("Отправлено голосовое сообщение: " .. message .. " (частота: " .. frequency .. ")")
    return true
end

-- Получение частоты юнита
ATC_SRS.getUnitFrequency = function(unit)
    if not unit then
        return nil
    end
    
    -- Проверка наличия SRS API
    if not SRS or not SRS.getFrequency then
        ATC_SRS.log("SRS API не найден или не поддерживает получение частоты")
        return nil
    end
    
    -- Получение частоты
    local success, result = pcall(function()
        return SRS.getFrequency(unit)
    end)
    
    if not success or not result then
        ATC_SRS.log("Ошибка при получении частоты юнита: " .. tostring(result))
        return nil
    end
    
    return result
end

-- Проверка, настроен ли юнит на указанную частоту
ATC_SRS.isUnitTunedToFrequency = function(unit, frequency, tolerance)
    if not unit or not frequency then
        return false
    end
    
    tolerance = tolerance or 0.001  -- Допустимое отклонение частоты
    
    local unitFrequency = ATC_SRS.getUnitFrequency(unit)
    if not unitFrequency then
        return false
    end
    
    return math.abs(unitFrequency - frequency) <= tolerance
end

-- Регистрация стандартных обработчиков фраз
ATC_SRS.registerStandardPhraseHandlers = function(atcService)
    if not atcService then
        ATC_SRS.log("Ошибка при регистрации стандартных обработчиков: отсутствует служба ATC")
        return false
    end
    
    -- Запрос на руление
    ATC_SRS.registerPhraseHandler("request taxi", function(text, info)
        return atcService:handleTaxiRequest(info.unit)
    end)
    
    -- Запрос на взлет
    ATC_SRS.registerPhraseHandler("request takeoff", function(text, info)
        return atcService:handleTakeoffRequest(info.unit)
    end)
    
    -- Запрос на посадку
    ATC_SRS.registerPhraseHandler("request landing", function(text, info)
        return atcService:handleLandingRequest(info.unit)
    end)
    
    -- Запрос на заход
    ATC_SRS.registerPhraseHandler("request approach", function(text, info)
        return atcService:handleApproachRequest(info.unit)
    end)
    
    -- Запрос информации ATIS
    ATC_SRS.registerPhraseHandler("request atis", function(text, info)
        return atcService:handleATISRequest(info.unit)
    end)
    
    -- Запрос информации о погоде
    ATC_SRS.registerPhraseHandler("request weather", function(text, info)
        return atcService:handleWeatherRequest(info.unit)
    end)
    
    -- Запрос информации о трафике
    ATC_SRS.registerPhraseHandler("request traffic", function(text, info)
        return atcService:handleTrafficRequest(info.unit)
    end)
    
    -- Доклад о готовности к взлету
    ATC_SRS.registerPhraseHandler("ready for takeoff", function(text, info)
        return atcService:handleReadyForTakeoff(info.unit)
    end)
    
    -- Доклад о готовности к заходу
    ATC_SRS.registerPhraseHandler("ready for approach", function(text, info)
        return atcService:handleReadyForApproach(info.unit)
    end)
    
    -- Доклад о прибытии
    ATC_SRS.registerPhraseHandler("inbound", function(text, info)
        return atcService:handleInbound(info.unit)
    end)
    
    -- Доклад о выходе из зоны ответственности
    ATC_SRS.registerPhraseHandler("leaving your airspace", function(text, info)
        return atcService:handleLeavingAirspace(info.unit)
    end)
    
    ATC_SRS.log("Зарегистрированы стандартные обработчики фраз для службы ATC")
    return true
end

return ATC_SRS
