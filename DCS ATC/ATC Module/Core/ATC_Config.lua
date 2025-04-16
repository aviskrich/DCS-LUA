--[[
ATC_Config.lua
Конфигурационный файл для универсального ATC модуля
Автор: Manus AI
Дата: Апрель 2025
--]]

ATC_Config = {
    -- Общие настройки
    DEBUG = true,
    VERBOSE_LOGGING = false,
    
    -- Настройки аэропортов
    AIRPORTS = {
        {
            ICAO = "URSS",  -- ICAO код аэропорта
            COALITION = coalition.side.BLUE,  -- Коалиция (BLUE, RED или nil для обеих)
            ENABLED = true,  -- Включен ли аэропорт
            USE_NAVIGRAPH_DATA = true,  -- Использовать данные Navigraph
            NAVIGRAPH_DATA_PATH = project_path .. "Data/URSS_MOOSE.lua",  -- Путь к данным Navigraph
            FALLBACK_TO_EMBEDDED = false,  -- Использовать встроенные данные при отсутствии Navigraph
            
            -- Настройки служб ATC для этого аэропорта
            ATC = {
                TOWER = {
                    ENABLED = true,
                    FREQUENCY = 118.0,  -- nil означает использование данных из файла аэропорта
                    CALLSIGN = 'Sochi Tower',  -- nil означает использование "ICAO Tower" (например, "URMT Tower")
                    RANGE = 30  -- Дальность в морских милях
                },
                APPROACH = {
                    ENABLED = true,
                    FREQUENCY = 121.0,
                    CALLSIGN = 'Sochi Approach',
                    RANGE = 50
                },
                DEPARTURE = {
                    ENABLED = true,
                    FREQUENCY = 125.0,
                    CALLSIGN = 'Sochi Departure',
                    RANGE = 50
                }
            }
        },
        {
            ICAO = "UUWW",  -- ICAO код аэропорта (Внуково)
            COALITION = coalition.side.RED,  -- Коалиция (BLUE, RED или nil для обеих)
            ENABLED = true,  -- Включен ли аэропорт
            USE_NAVIGRAPH_DATA = false,  -- Использовать данные Navigraph
            NAVIGRAPH_DATA_PATH = project_path .. "Data/URKK_MOOSE.lua",  -- Путь к данным Navigraph
            FALLBACK_TO_EMBEDDED = true,  -- Использовать встроенные данные при отсутствии Navigraph
            
            -- Настройки служб ATC для этого аэропорта
            ATC = {
                TOWER = {
                    ENABLED = true,
                    FREQUENCY = 118.0,
                    CALLSIGN = 'Krasnodar Tower',
                    RANGE = 30
                },
                APPROACH = {
                    ENABLED = true,
                    FREQUENCY = 121.0,
                    CALLSIGN = 'Krasnodar Approach',
                    RANGE = 50
                },
                DEPARTURE = {
                    ENABLED = true,
                    FREQUENCY = 125.0,
                    CALLSIGN = 'Krasnodar Departure',
                    RANGE = 50
                }
            }
        },
        -- Можно добавить любое количество аэропортов
    },
    
    -- Настройки SRS (общие для всех аэропортов)
    SRS = {
        ENABLED = true,
        PORT = 5002,
        STT_ENABLED = true,
        STT_CONFIDENCE_THRESHOLD = 0.7
    },
    
    -- Настройки мониторинга исполнения процедур (общие для всех аэропортов)
    MONITORING = {
        ENABLED = true,
        LATERAL_DEVIATION_THRESHOLD = 1.0,  -- Порог бокового отклонения в морских милях
        VERTICAL_DEVIATION_THRESHOLD = 500,  -- Порог вертикального отклонения в футах
        NOTIFICATION_INTERVAL = 30  -- Интервал уведомлений в секундах
    },
    
    -- Настройки меню F10 (общие для всех аэропортов)
    MENU = {
        ENABLED = true,
        ROOT_MENU_NAME = "ATC Services",  -- Корневое меню для всех аэропортов
        GROUP_BY_COALITION = true  -- Группировать меню по коалициям
    },
    
    -- Настройки производительности
    PERFORMANCE = {
        DYNAMIC_ACTIVATION = true,  -- Динамическая активация аэропортов при приближении игроков
        ACTIVATION_RANGE = 100,  -- Дальность активации в морских милях
        UPDATE_INTERVAL = 10  -- Интервал обновления в секундах
    }
}

return ATC_Config
