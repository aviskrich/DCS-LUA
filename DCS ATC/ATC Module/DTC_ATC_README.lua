--[[
DTC_ATC_README.lua
Документация для универсального ATC модуля
Автор: AVIskrich
Дата: Апрель 2025
--]]

--[[
# Универсальный ATC модуль для DCS World

## Обзор
Универсальный ATC модуль (DTC_ATC_Module) - это расширение для DCS World, которое предоставляет реалистичное взаимодействие с диспетчерами УВД для любого аэропорта. Модуль использует данные Navigraph для создания точных процедур вылета (SID), прибытия (STAR) и захода на посадку (APPROACH) для любого аэропорта в DCS World.

## Основные возможности
- Поддержка любого аэропорта в DCS World через формат ICAO_MOOSE.lua
- Динамическая загрузка данных аэропорта
- Реалистичные службы УВД: Tower, Approach, Departure
- Интеграция с SRS для голосового взаимодействия
- Мониторинг выполнения процедур полета
- Оценка выполнения процедур пилотами
- Поддержка всех карт DCS World, включая Кольский полуостров
- Поддержка точек NDB и VOR из earth_nav.dat

## Требования
- DCS World 2.8 или выше
- MOOSE Framework 2.0 или выше
- SRS (опционально, для голосового взаимодействия)

## Установка
1. Распакуйте архив DTC_ATC_Module.zip в папку Saved Games\DCS\Scripts\
2. Добавьте следующую строку в файл Scripts\MissionScripting.lua:
   ```lua
   dofile(lfs.writedir() .. "Scripts/DTC_ATC/DTC_ATC.lua")
   ```
3. Для использования с конкретным аэропортом, создайте файл ICAO_MOOSE.lua в папке Scripts/DTC_ATC/Data/
   (где ICAO - код аэропорта, например, UUWW_MOOSE.lua для Внуково)

## Конфигурация
Настройки модуля находятся в файле Scripts/DTC_ATC/Core/DTC_Config.lua:

```lua
DTC_Config = {
    DEBUG = false,  -- Режим отладки
    
    AIRPORT = {
        ICAO = "UUWW",  -- Код ICAO аэропорта
        NAVIGRAPH_DATA_PATH = "Scripts/DTC_ATC/Data/UUWW_MOOSE.lua",  -- Путь к данным аэропорта
        FALLBACK_TO_EMBEDDED = true  -- Использовать встроенные данные, если файл не найден
    },
    
    ATC = {
        TOWER = {
            ENABLED = true,  -- Включить службу Tower
            FREQUENCY = 118.500,  -- Частота Tower
            CALLSIGN = "Внуково Вышка",  -- Позывной Tower
            RANGE = 30  -- Дальность в морских милях
        },
        
        APPROACH = {
            ENABLED = true,  -- Включить службу Approach
            FREQUENCY = 121.750,  -- Частота Approach
            CALLSIGN = "Внуково Подход",  -- Позывной Approach
            RANGE = 50  -- Дальность в морских милях
        },
        
        DEPARTURE = {
            ENABLED = true,  -- Включить службу Departure
            FREQUENCY = 125.250,  -- Частота Departure
            CALLSIGN = "Внуково Круг",  -- Позывной Departure
            RANGE = 50  -- Дальность в морских милях
        }
    },
    
    SRS = {
        ENABLED = true,  -- Включить интеграцию с SRS
        PORT = 5002,  -- Порт SRS
        HOST = "localhost"  -- Хост SRS
    },
    
    MONITORING = {
        ENABLED = true,  -- Включить мониторинг процедур
        LATERAL_DEVIATION_THRESHOLD = 1.0,  -- Порог бокового отклонения в морских милях
        VERTICAL_DEVIATION_THRESHOLD = 500,  -- Порог вертикального отклонения в футах
        NOTIFICATION_INTERVAL = 30  -- Интервал уведомлений в секундах
    },
    
    MENU = {
        ENABLED = true,  -- Включить меню
        ROOT_MENU_NAME = "ATC"  -- Название корневого меню
    }
}
```

## Создание данных для нового аэропорта
Для создания данных для нового аэропорта используйте скрипт dtc_parser.py:

```bash
python dtc_parser.py --cifp /path/to/CIFP --output /path/to/output --icao ICAO
```

Где:
- CIFP - путь к файлам CIFP от Navigraph
- output - путь для сохранения результата
- ICAO - код ICAO аэропорта

Пример:
```bash
python dtc_parser.py --cifp C:/Navigraph/CIFP --output C:/DCS/Scripts/DTC_ATC/Data --icao UUWW
```

## Использование в миссии
После установки и настройки модуль автоматически запускается при старте миссии. Игроки могут взаимодействовать с диспетчерами через меню F10 или через SRS.

### Доступные команды для пилотов:
- "request taxi" - запрос на руление
- "request takeoff" - запрос на взлет
- "request approach" - запрос на заход
- "request landing" - запрос на посадку
- "ready for takeoff" - готовность к взлету
- "ready for approach" - готовность к заходу
- "inbound" - доклад о прибытии
- "leaving airspace" - доклад о выходе из зоны ответственности
- "request weather" - запрос информации о погоде
- "request traffic" - запрос информации о трафике
- "request ATIS" - запрос информации ATIS

## Структура модуля
- Core/ - основные компоненты модуля
  - DTC_Config.lua - конфигурация модуля
  - DTC_Utils.lua - утилиты
  - DTC_Navigraph.lua - интеграция с Navigraph
  - DTC_SRS.lua - интеграция с SRS
  - DTC_Procedures.lua - работа с процедурами
  - DTC_MonitoringManager.lua - мониторинг выполнения процедур
- Services/ - службы УВД
  - DTC_ATC_Service.lua - базовый класс службы УВД
  - DTC_Tower.lua - служба Tower
  - DTC_Approach.lua - служба Approach
  - DTC_Departure.lua - служба Departure
  - DTC_Menu.lua - меню
- Data/ - данные аэропортов
  - ICAO_MOOSE.lua - данные для конкретного аэропорта
- Tools/ - инструменты
  - dtc_parser.py - парсер данных Navigraph

## Поддержка и обратная связь
По вопросам поддержки и обратной связи обращайтесь на форум ED: https://forums.eagle.ru/

## Лицензия
Данный модуль распространяется под лицензией MIT.

## Благодарности
- Команде MOOSE за отличный фреймворк
- Navigraph за предоставление данных аэронавигации
- Сообществу DCS World за поддержку и обратную связь
--]]

return {
    VERSION = "1.0.0",
    AUTHOR = "AVIskrich",
    DATE = "Апрель 2025"
}
