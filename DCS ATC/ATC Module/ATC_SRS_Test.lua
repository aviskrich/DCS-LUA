--[[
ATC_SRS_Test.lua
Тестовый скрипт для проверки интеграции ATC_SRS с MSRS с поддержкой нескольких экземпляров
Автор: Manus AI
Дата: Апрель 2025
--]]

-- Загрузка необходимых модулей
local ATC_SRS = require("ATC_Module.Core.ATC_SRS")

-- Функция для логирования
local function log(message)
    env.info("[ATC_SRS_Test] " .. message)
end

-- Функция для тестирования инициализации
local function testInitialization()
    log("Тестирование инициализации ATC_SRS...")
    
    local success = ATC_SRS.init()
    
    if success then
        log("✓ Инициализация ATC_SRS успешна")
    else
        log("✗ Ошибка при инициализации ATC_SRS")
        return false
    end
    
    return true
end

-- Функция для тестирования создания нескольких экземпляров MSRS
local function testMultipleInstances()
    log("Тестирование создания нескольких экземпляров MSRS для разных частот...")
    
    -- Очистка всех экземпляров перед тестом
    ATC_SRS.clearAllInstances()
    
    -- Создание экземпляра для частоты 124.0 (Tower)
    local towerInstance = ATC_SRS.getMSRSInstance(124.0, radio.modulation.AM)
    
    if towerInstance then
        log("✓ Создан экземпляр MSRS для Tower (124.0 MHz)")
    else
        log("✗ Ошибка при создании экземпляра MSRS для Tower")
        return false
    end
    
    -- Создание экземпляра для частоты 125.0 (Approach)
    local approachInstance = ATC_SRS.getMSRSInstance(125.0, radio.modulation.AM)
    
    if approachInstance then
        log("✓ Создан экземпляр MSRS для Approach (125.0 MHz)")
    else
        log("✗ Ошибка при создании экземпляра MSRS для Approach")
        return false
    end
    
    -- Создание экземпляра для частоты 126.0 (Departure)
    local departureInstance = ATC_SRS.getMSRSInstance(126.0, radio.modulation.AM)
    
    if departureInstance then
        log("✓ Создан экземпляр MSRS для Departure (126.0 MHz)")
    else
        log("✗ Ошибка при создании экземпляра MSRS для Departure")
        return false
    end
    
    -- Проверка, что экземпляры разные
    if towerInstance ~= approachInstance and towerInstance ~= departureInstance and approachInstance ~= departureInstance then
        log("✓ Все экземпляры MSRS уникальны")
    else
        log("✗ Обнаружены дублирующиеся экземпляры MSRS")
        return false
    end
    
    -- Проверка получения существующего экземпляра
    local towerInstance2 = ATC_SRS.getMSRSInstance(124.0, radio.modulation.AM)
    
    if towerInstance == towerInstance2 then
        log("✓ Повторное получение экземпляра MSRS возвращает существующий экземпляр")
    else
        log("✗ Повторное получение экземпляра MSRS создает новый экземпляр")
        return false
    end
    
    -- Получение всех экземпляров
    local allInstances = ATC_SRS.getAllMSRSInstances()
    local count = 0
    
    for _, _ in pairs(allInstances) do
        count = count + 1
    end
    
    if count == 3 then
        log("✓ Получено правильное количество экземпляров MSRS: " .. count)
    else
        log("✗ Неверное количество экземпляров MSRS: " .. count .. " (ожидалось 3)")
        return false
    end
    
    return true
end

-- Функция для тестирования отправки голосовых сообщений через разные экземпляры
local function testVoiceMessagesMultipleInstances()
    log("Тестирование отправки голосовых сообщений через разные экземпляры MSRS...")
    
    -- Отправка сообщения через Tower (124.0)
    local success = ATC_SRS.sendVoiceMessage("Это сообщение от Tower на частоте 124.0", 124.0)
    
    if success then
        log("✓ Отправка сообщения через Tower успешна")
    else
        log("✗ Ошибка при отправке сообщения через Tower")
        return false
    end
    
    -- Отправка сообщения через Approach (125.0)
    success = ATC_SRS.sendVoiceMessage("Это сообщение от Approach на частоте 125.0", 125.0)
    
    if success then
        log("✓ Отправка сообщения через Approach успешна")
    else
        log("✗ Ошибка при отправке сообщения через Approach")
        return false
    end
    
    -- Отправка сообщения через Departure (126.0)
    success = ATC_SRS.sendVoiceMessage("Это сообщение от Departure на частоте 126.0", 126.0)
    
    if success then
        log("✓ Отправка сообщения через Departure успешна")
    else
        log("✗ Ошибка при отправке сообщения через Departure")
        return false
    end
    
    return true
end

-- Функция для тестирования настроек голоса для всех экземпляров
local function testVoiceSettingsMultipleInstances()
    log("Тестирование настроек голоса для всех экземпляров MSRS...")
    
    -- Установка голоса для всех экземпляров
    local success = ATC_SRS.setVoice("Microsoft Zira Desktop")
    
    if success then
        log("✓ Установка голоса для всех экземпляров успешна")
    else
        log("✗ Ошибка при установке голоса для всех экземпляров")
        return false
    end
    
    -- Отправка сообщений через разные экземпляры для проверки голоса
    success = ATC_SRS.sendVoiceMessage("Это сообщение от Tower с новым голосом", 124.0)
    if not success then
        log("✗ Ошибка при отправке сообщения через Tower с новым голосом")
        return false
    end
    
    success = ATC_SRS.sendVoiceMessage("Это сообщение от Approach с новым голосом", 125.0)
    if not success then
        log("✗ Ошибка при отправке сообщения через Approach с новым голосом")
        return false
    end
    
    -- Установка пола голоса для всех экземпляров
    success = ATC_SRS.setGender("female")
    
    if success then
        log("✓ Установка пола голоса для всех экземпляров успешна")
    else
        log("✗ Ошибка при установке пола голоса для всех экземпляров")
        return false
    end
    
    -- Установка культуры для всех экземпляров
    success = ATC_SRS.setCulture("en-US")
    
    if success then
        log("✓ Установка культуры для всех экземпляров успешна")
    else
        log("✗ Ошибка при установке культуры для всех экземпляров")
        return false
    end
    
    return true
end

-- Функция для тестирования очистки экземпляров
local function testClearInstances()
    log("Тестирование очистки экземпляров MSRS...")
    
    -- Очистка всех экземпляров
    local success = ATC_SRS.clearAllInstances()
    
    if success then
        log("✓ Очистка всех экземпляров MSRS успешна")
    else
        log("✗ Ошибка при очистке экземпляров MSRS")
        return false
    end
    
    -- Проверка, что все экземпляры очищены
    local allInstances = ATC_SRS.getAllMSRSInstances()
    local count = 0
    
    for _, _ in pairs(allInstances) do
        count = count + 1
    end
    
    if count == 0 then
        log("✓ Все экземпляры MSRS успешно очищены")
    else
        log("✗ Экземпляры MSRS не были очищены, осталось: " .. count)
        return false
    end
    
    -- Создание нового экземпляра после очистки
    local newInstance = ATC_SRS.getMSRSInstance(124.0, radio.modulation.AM)
    
    if newInstance then
        log("✓ Создание нового экземпляра MSRS после очистки успешно")
    else
        log("✗ Ошибка при создании нового экземпляра MSRS после очистки")
        return false
    end
    
    return true
end

-- Функция для запуска всех тестов
local function runAllTests()
    log("Запуск тестирования интеграции ATC_SRS с MSRS (поддержка нескольких экземпляров)...")
    
    local initSuccess = testInitialization()
    if not initSuccess then
        log("✗ Тестирование инициализации не пройдено. Прерывание тестов.")
        return false
    end
    
    local multipleInstancesSuccess = testMultipleInstances()
    if not multipleInstancesSuccess then
        log("✗ Тестирование создания нескольких экземпляров MSRS не пройдено. Прерывание тестов.")
        return false
    end
    
    local voiceMessagesSuccess = testVoiceMessagesMultipleInstances()
    if not voiceMessagesSuccess then
        log("✗ Тестирование отправки голосовых сообщений через разные экземпляры не пройдено.")
        return false
    end
    
    local voiceSettingsSuccess = testVoiceSettingsMultipleInstances()
    if not voiceSettingsSuccess then
        log("✗ Тестирование настроек голоса для всех экземпляров не пройдено.")
        return false
    end
    
    local clearInstancesSuccess = testClearInstances()
    if not clearInstancesSuccess then
        log("✗ Тестирование очистки экземпляров не пройдено.")
        return false
    end
    
    log("✓ Все тесты успешно пройдены!")
    return true
end

-- Запуск тестов
runAllTests()
