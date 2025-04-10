# Документация по ATC_Module

## Обзор
ATC_Module - это универсальный модуль для DCS World, предоставляющий реалистичное моделирование служб управления воздушным движением (ATC) для нескольких аэропортов одновременно с поддержкой разных коалиций. Модуль использует реальные данные аэронавигации из Navigraph для создания точных процедур SID, STAR и заходов на посадку.

## Основные возможности
- Поддержка нескольких аэропортов одновременно
- Разделение аэропортов по коалициям (синие/красные)
- Динамическая активация аэропортов при приближении игроков
- Интеграция с SRS для голосового взаимодействия
- Реалистичные процедуры SID, STAR и заходы на посадку
- Мониторинг выполнения процедур
- Интерактивное меню F10 с учетом коалиций

## Структура модуля

### Основные компоненты
- **ATC.lua** - Главный файл модуля
- **Core/ATC_AirportManager.lua** - Менеджер экземпляров аэропортов
- **Core/ATC_Config.lua** - Система конфигурации
- **Core/ATC_Navigraph.lua** - Интеграция с данными Navigraph
- **Core/ATC_Utils.lua** - Утилиты и вспомогательные функции
- **Core/ATC_SRS.lua** - Интеграция с SRS для голосового взаимодействия
- **Core/ATC_Procedures.lua** - Обработка процедур полета
- **Core/ATC_MonitoringManager.lua** - Мониторинг выполнения процедур
- **Core/ATC_CoalitionFilter.lua** - Фильтрация объектов по коалициям

### Сервисные компоненты
- **Services/ATC_Service.lua** - Базовый класс для всех служб ATC
- **Services/ATC_Tower.lua** - Служба Tower
- **Services/ATC_Approach.lua** - Служба Approach
- **Services/ATC_Departure.lua** - Служба Departure
- **Services/ATC_Menu.lua** - Система меню F10

### Инструменты
- **Tools/atc_parser.py** - Универсальный парсер данных Navigraph

### Данные
- **Data/ICAO_MOOSE.lua** - Файлы данных для аэропортов (например, UUWW_MOOSE.lua, KJFK_MOOSE.lua)

## Установка

1. Распакуйте архив ATC_Module.zip в папку Saved Games\DCS\Scripts\
2. Добавьте следующий код в файл mission init или в скрипт DO SCRIPT:

```lua
dofile(lfs.writedir() .. "Scripts/ATC_Module/ATC.lua")
```

## Конфигурация

Основная конфигурация модуля находится в файле `Core/ATC_Config.lua`. Для поддержки нескольких аэропортов используется массив `AIRPORTS`:

```lua
ATC_Config = {
    DEBUG = false,
    
    AIRPORTS = {
        {
            ICAO = "UUWW",
            COALITION = coalition.side.BLUE,
            NAVIGRAPH_DATA_PATH = "Scripts/ATC_Module/Data/UUWW_MOOSE.lua",
            ENABLED = true,
            FALLBACK_TO_EMBEDDED = true,
            ATC = {
                TOWER = {
                    ENABLED = true,
                    FREQUENCY = 118.900,
                    CALLSIGN = "Внуково Вышка",
                    RANGE = 10
                },
                APPROACH = {
                    ENABLED = true,
                    FREQUENCY = 124.000,
                    CALLSIGN = "Внуково Подход",
                    RANGE = 50
                },
                DEPARTURE = {
                    ENABLED = true,
                    FREQUENCY = 125.500,
                    CALLSIGN = "Внуково Круг",
                    RANGE = 50
                }
            }
        },
        {
            ICAO = "KJFK",
            COALITION = coalition.side.RED,
            NAVIGRAPH_DATA_PATH = "Scripts/ATC_Module/Data/KJFK_MOOSE.lua",
            ENABLED = true,
            FALLBACK_TO_EMBEDDED = true,
            ATC = {
                TOWER = {
                    ENABLED = true,
                    FREQUENCY = 118.700,
                    CALLSIGN = "Kennedy Tower",
                    RANGE = 10
                },
                APPROACH = {
                    ENABLED = true,
                    FREQUENCY = 124.200,
                    CALLSIGN = "Kennedy Approach",
                    RANGE = 50
                },
                DEPARTURE = {
                    ENABLED = true,
                    FREQUENCY = 125.700,
                    CALLSIGN = "Kennedy Departure",
                    RANGE = 50
                }
            }
        }
    },
    
    SRS = {
        ENABLED = true,
        PORT = 5002,
        HOST = "localhost"
    },
    
    MONITORING = {
        ENABLED = true,
        DEVIATION_THRESHOLD = 1.0,
        NOTIFICATION_INTERVAL = 10
    },
    
    PERFORMANCE = {
        DYNAMIC_ACTIVATION = true,
        ACTIVATION_RANGE = 100,
        UPDATE_INTERVAL = 10
    },
    
    MENU = {
        ENABLED = true
    }
}
```

Для каждого аэропорта можно указать:
- **ICAO** - Код ICAO аэропорта
- **COALITION** - Коалиция, которой принадлежит аэропорт (coalition.side.BLUE или coalition.side.RED)
- **NAVIGRAPH_DATA_PATH** - Путь к файлу данных Navigraph
- **ENABLED** - Включен ли аэропорт
- **FALLBACK_TO_EMBEDDED** - Использовать ли встроенные данные, если файл Navigraph не найден
- **ATC** - Настройки служб ATC (Tower, Approach, Departure)

## Добавление нового аэропорта

Для добавления нового аэропорта необходимо:

1. Создать файл данных аэропорта с помощью парсера:
```
python Tools/atc_parser.py --icao LXXX --output Data/LXXX_MOOSE.lua
```

2. Добавить конфигурацию аэропорта в массив `AIRPORTS` в файле `Core/ATC_Config.lua`

## Работа с коалициями

Модуль поддерживает разделение аэропортов по коалициям. Каждый аэропорт может быть назначен определенной коалиции (синей или красной). Службы ATC аэропорта будут взаимодействовать только с объектами своей коалиции.

Для настройки фильтрации по коалициям используется модуль `ATC_CoalitionFilter`:

```lua
-- Включение/выключение фильтрации по коалициям
ATC_CoalitionFilter.enable()
ATC_CoalitionFilter.disable()

-- Включение/выключение фильтрации нейтральных объектов
ATC_CoalitionFilter.setNeutralFiltering(true)
ATC_CoalitionFilter.setNeutralFiltering(false)
```

## Динамическая активация аэропортов

Модуль поддерживает динамическую активацию аэропортов на основе близости игроков. Это позволяет оптимизировать производительность, активируя только те аэропорты, которые находятся рядом с игроками.

Настройки динамической активации:
```lua
PERFORMANCE = {
    DYNAMIC_ACTIVATION = true,  -- Включить динамическую активацию
    ACTIVATION_RANGE = 100,     -- Радиус активации в морских милях
    UPDATE_INTERVAL = 10        -- Интервал обновления в секундах
}
```

## Интеграция с SRS

Модуль поддерживает интеграцию с SRS (Simple Radio Standalone) для голосового взаимодействия. Для этого необходимо:

1. Установить SRS с поддержкой Speech-to-Text
2. Настроить параметры SRS в конфигурации:
```lua
SRS = {
    ENABLED = true,
    PORT = 5002,
    HOST = "localhost"
}
```

## Мониторинг выполнения процедур

Модуль включает систему мониторинга выполнения процедур, которая отслеживает соблюдение самолетами заданных маршрутов и процедур.

Настройки мониторинга:
```lua
MONITORING = {
    ENABLED = true,
    DEVIATION_THRESHOLD = 1.0,  -- Порог отклонения в морских милях
    NOTIFICATION_INTERVAL = 10   -- Интервал уведомлений в секундах
}
```

## Меню F10

Модуль создает интерактивное меню F10 для каждой коалиции с информацией об аэропортах и службах ATC. Меню позволяет:

- Получать информацию о погоде
- Узнавать активную ВПП
- Просматривать доступные процедуры SID, STAR и заходы на посадку
- Управлять службами ATC
- Настраивать параметры модуля

## Тестирование

Для проверки работоспособности модуля используйте тестовый скрипт:
```lua
dofile(lfs.writedir() .. "Scripts/ATC_Module/ATC_Test_MultiAirport.lua")
```

Тестовый скрипт проверяет:
- Конфигурацию для нескольких аэропортов
- Инициализацию аэропортов
- Фильтрацию по коалициям
- Маршрутизацию сообщений
- Динамическую активацию аэропортов

## Устранение неполадок

### Проблемы с загрузкой данных Navigraph
- Убедитесь, что файл данных аэропорта существует по указанному пути
- Проверьте правильность формата файла данных
- Включите режим отладки для получения подробной информации

### Проблемы с активацией аэропортов
- Проверьте настройки ENABLED для аэропорта
- Убедитесь, что игроки находятся в радиусе активации
- Проверьте правильность указания коалиции

### Проблемы с меню F10
- Убедитесь, что MENU.ENABLED установлено в true
- Проверьте, что меню создается для правильной коалиции

## Версия и авторство
- Версия: 2.0.0
- Автор: Andrey Iskrich
- Дата: Апрель 2025
