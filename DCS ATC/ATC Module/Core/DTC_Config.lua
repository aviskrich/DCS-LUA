--[[
DTC_Config.lua
Конфигурационный файл для универсального ATC модуля
Автор: AVIskrich
Дата: Апрель 2025
--]]

DTC_Config = {
    -- Общие настройки
    DEBUG = true,
    VERBOSE_LOGGING = false,
    
    -- Настройки аэропорта
    AIRPORT = {
        ICAO = "URMT",  -- ICAO код аэропорта
        USE_NAVIGRAPH_DATA = true,  -- Использовать данные Navigraph
        NAVIGRAPH_DATA_PATH = lfs.writedir() .. "Scripts/Navigraph/",  -- Путь к данным Navigraph
        FALLBACK_TO_EMBEDDED = true  -- Использовать встроенные данные при отсутствии Navigraph
    },
    
    -- Настройки SRS
    SRS = {
        ENABLED = true,
        PORT = 5002,
        STT_ENABLED = true,
        STT_CONFIDENCE_THRESHOLD = 0.7
    },
    
    -- Настройки служб ATC
    ATC = {
        TOWER = {
            ENABLED = true,
            FREQUENCY = nil,  -- nil означает использование данных из файла аэропорта
            CALLSIGN = nil,  -- nil означает использование "ICAO Tower" (например, "URMT Tower")
            RANGE = 30  -- Дальность в морских милях
        },
        APPROACH = {
            ENABLED = true,
            FREQUENCY = nil,
            CALLSIGN = nil,
            RANGE = 50
        },
        DEPARTURE = {
            ENABLED = true,
            FREQUENCY = nil,
            CALLSIGN = nil,
            RANGE = 50
        }
    },
    
    -- Настройки мониторинга исполнения процедур
    MONITORING = {
        ENABLED = true,
        LATERAL_DEVIATION_THRESHOLD = 1.0,  -- Порог бокового отклонения в морских милях
        VERTICAL_DEVIATION_THRESHOLD = 500,  -- Порог вертикального отклонения в футах
        NOTIFICATION_INTERVAL = 30  -- Интервал уведомлений в секундах
    },
    
    -- Настройки меню F10
    MENU = {
        ENABLED = true,
        ROOT_MENU_NAME = nil  -- nil означает использование "ICAO ATC" (например, "URMT ATC")
    }
}

return DTC_Config
