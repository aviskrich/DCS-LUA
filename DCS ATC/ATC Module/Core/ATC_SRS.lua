--[[
ATC_SRS.lua
Модуль для интеграции с SRS через MSRS (MOOSE) для универсального ATC модуля
Автор: Manus AI
Дата: Апрель 2025
--]]

BASE:TraceClass("MSRS")
BASE:TraceLevel(3)
BASE:TraceOnOff( true )

-- Select the alternate DCS-gRPC backend for new MSRS instances
GRPC.load()
MSRS.SetDefaultBackendGRPC()

-- Whether the `Eval` method is enabled or not.
GRPC.evalEnabled = false
-- Whether debug logging is enabled or not.
GRPC.debug = true
-- Limit of calls per second that are executed inside of the mission scripting environment.
GRPC.throughputLimit = 600

local ATC_SRS = {}

-- Настройки SRS
ATC_SRS.settings = {
    enabled = true,
    path = "C:\\Program Files\\DCS-SimpleRadio-Standalone",
    defaultVoice = "Microsoft David Desktop",
    defaultCoalition = 0 -- 0 = все, 1 = красные, 2 = синие
}

-- Таблица для хранения экземпляров MSRS для разных частот
-- Ключ: частота_модуляция (например, "124.0_0" для 124.0 MHz AM)
ATC_SRS.msrsInstances = {}

-- Флаг, указывающий, инициализирован ли модуль
ATC_SRS.isInitialized = false

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
        ATC_SRS.settings.path = ATC_Config.SRS.PATH or ATC_SRS.settings.path
        ATC_SRS.settings.defaultVoice = ATC_Config.SRS.DEFAULT_VOICE or ATC_SRS.settings.defaultVoice
        ATC_SRS.settings.defaultCoalition = ATC_Config.SRS.DEFAULT_COALITION or ATC_SRS.settings.defaultCoalition
    end
    
    -- Проверка, включен ли SRS
    if not ATC_SRS.settings.enabled then
        ATC_SRS.log("SRS интеграция отключена в настройках")
        return false
    end
    
    -- Проверка наличия MSRS класса
    if not MSRS then
        ATC_SRS.log("MSRS класс не найден. Убедитесь, что MOOSE загружен корректно.")
        return false
    end
    
    ATC_SRS.isInitialized = true
    ATC_SRS.log("SRS модуль успешно инициализирован")
    return true
end

-- Получение или создание экземпляра MSRS для указанной частоты и модуляции
ATC_SRS.getMSRSInstance = function(frequency, modulation)
    if not ATC_SRS.isInitialized then
        ATC_SRS.log("ATC_SRS не инициализирован")
        return nil
    end
    
    frequency = frequency or 124.0
    modulation = modulation or radio.modulation.AM
    
    -- Создаем ключ для хранения экземпляра
    local key = tostring(frequency) .. "_" .. tostring(modulation)
    
    -- Проверяем, существует ли уже экземпляр для этой частоты/модуляции
    if not ATC_SRS.msrsInstances[key] then
        ATC_SRS.log("Создание нового экземпляра MSRS для частоты " .. frequency .. " и модуляции " .. tostring(modulation))
        
        -- Создаем новый экземпляр MSRS
        local success, result = pcall(function()
            return MSRS:New(
                ATC_SRS.settings.path,
                frequency,
                modulation
            )
        end)
        
        if not success or not result then
            ATC_SRS.log("Ошибка при создании экземпляра MSRS: " .. tostring(result))
            return nil
        end
        
        -- Настройка голоса и коалиции
        result:SetVoice(ATC_SRS.settings.defaultVoice)
        result:SetCoalition(ATC_SRS.settings.defaultCoalition)
        
        -- Сохраняем экземпляр в таблицу
        ATC_SRS.msrsInstances[key] = result
    end
    
    return ATC_SRS.msrsInstances[key]
end

-- Отправка голосового сообщения через MSRS
ATC_SRS.sendVoiceMessage = function(message, frequency, modulation, coalition, voice)
    if not ATC_SRS.isInitialized or not message or message == "" then
        return false
    end
    
    -- Получаем экземпляр MSRS для указанной частоты и модуляции
    local msrsInstance = ATC_SRS.getMSRSInstance(frequency, modulation)
    
    if not msrsInstance then
        ATC_SRS.log("Не удалось получить экземпляр MSRS для частоты " .. tostring(frequency) .. " и модуляции " .. tostring(modulation))
        return false
    end
    
    -- Создание текстового сообщения
    local soundText = SOUNDTEXT:New(message)
    
    -- Настройка голоса, если указан
    if voice then
        soundText:SetVoice(voice)
    end
    
    -- Установка коалиции, если указана
    if coalition then
        msrsInstance:SetCoalition(coalition)
    end
    
    -- Отправка сообщения
    msrsInstance:PlaySoundText(soundText, 0)
    
    ATC_SRS.log("Отправлено голосовое сообщение через MSRS: " .. message .. " (частота: " .. tostring(frequency) .. ")")
    return true
end

-- Отправка текстового сообщения (через голосовое сообщение, так как MSRS не имеет отдельного метода для текста)
ATC_SRS.sendTextMessage = function(message, frequency, modulation, coalition)
    return ATC_SRS.sendVoiceMessage(message, frequency, modulation, coalition)
end

-- Установка голоса для всех экземпляров MSRS
ATC_SRS.setVoice = function(voice)
    if not ATC_SRS.isInitialized then
        return false
    end
    
    ATC_SRS.settings.defaultVoice = voice
    
    -- Обновляем голос для всех существующих экземпляров
    for key, msrsInstance in pairs(ATC_SRS.msrsInstances) do
        msrsInstance:SetVoice(voice)
    end
    
    ATC_SRS.log("Установлен голос для всех экземпляров MSRS: " .. voice)
    return true
end

-- Установка пола голоса для всех экземпляров MSRS
ATC_SRS.setGender = function(gender)
    if not ATC_SRS.isInitialized then
        return false
    end
    
    -- Обновляем пол голоса для всех существующих экземпляров
    for key, msrsInstance in pairs(ATC_SRS.msrsInstances) do
        msrsInstance:SetGender(gender)
    end
    
    ATC_SRS.log("Установлен пол голоса для всех экземпляров MSRS: " .. gender)
    return true
end

-- Установка культуры (языка) для всех экземпляров MSRS
ATC_SRS.setCulture = function(culture)
    if not ATC_SRS.isInitialized then
        return false
    end
    
    -- Обновляем культуру для всех существующих экземпляров
    for key, msrsInstance in pairs(ATC_SRS.msrsInstances) do
        msrsInstance:SetCulture(culture)
    end
    
    ATC_SRS.log("Установлена культура голоса для всех экземпляров MSRS: " .. culture)
    return true
end

-- Установка коалиции по умолчанию для всех экземпляров MSRS
ATC_SRS.setDefaultCoalition = function(coalition)
    if not coalition then
        return false
    end
    
    ATC_SRS.settings.defaultCoalition = coalition
    
    -- Обновляем коалицию для всех существующих экземпляров
    for key, msrsInstance in pairs(ATC_SRS.msrsInstances) do
        msrsInstance:SetCoalition(coalition)
    end
    
    ATC_SRS.log("Установлена коалиция по умолчанию для всех экземпляров MSRS: " .. coalition)
    return true
end

-- Получение всех экземпляров MSRS
ATC_SRS.getAllMSRSInstances = function()
    return ATC_SRS.msrsInstances
end

-- Проверка, инициализирован ли модуль
ATC_SRS.isModuleInitialized = function()
    return ATC_SRS.isInitialized
end

-- Получение настроек
ATC_SRS.getSettings = function()
    return ATC_SRS.settings
end

-- Очистка всех экземпляров MSRS
ATC_SRS.clearAllInstances = function()
    ATC_SRS.msrsInstances = {}
    ATC_SRS.log("Все экземпляры MSRS очищены")
    return true
end

return ATC_SRS
