#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Универсальный парсер CIFP для DTC_ATC_Module

Этот скрипт парсит данные Navigraph AIRAC в формате CIFP и создает файлы
с навигационными данными для карт DCS World и их аэропортов в формате,
совместимом с DTC_ATC_Module.

Автор: AVIskrich
Дата: Апрель 2025
Версия: 1.5.0
"""

import os
import sys
import json
import argparse
import zipfile
import re
import logging
import csv
from collections import defaultdict
from datetime import datetime

# Версия парсера
VERSION = "1.5.0"

# Настройка логирования
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger('dtc_parser')

# Координаты регионов карт DCS World
DCS_MAPS = {
    "Caucasus": {
        "lat_min": 38.0,
        "lat_max": 47.0,
        "lon_min": 34.0,
        "lon_max": 47.0,
        "airports": [
            "UGKO", "URKA", "URMM", "URSS", "URKK", "URKG", "URMG", "URMO", 
            "UGGG", "UGSB", "UGEE", "UGKS", "UGTB", "UGSA", "URKA", "URKH",
            "URKW", "URSS", "URWA", "URWI", "URWW", "UGMS", "UGMM", "URMN",
            "URML", "URMT", "URRR", "URRT", "URWW", "URWI", "URKH", "URKW"
        ]
    },
    "PersianGulf": {
        "lat_min": 20.0,
        "lat_max": 33.0,
        "lon_min": 47.0,
        "lon_max": 67.0,
        "airports": [
            "OIKB", "OIIE", "OISS", "OIKK", "OIFM", "OIKQ", "OICC", "OIII",
            "OBBI", "OBBS", "OMDW", "OMDB", "OMAA", "OMAL", "OMSJ", "OMRK",
            "OMDM", "OKBK", "OOKB", "OOMA", "OOTH", "OTBD", "OIBK", "OISS",
            "OIAI", "OIAW", "OIBB", "OIBQ", "OIBS", "OIBV", "OIMB", "OIMN",
            "OINE", "OING", "OISL", "OISR", "OISS", "OITL", "OIYY", "OKBK",
            "OMAA", "OMAD", "OMAH", "OMAJ", "OMAL", "OMAM", "OMAR", "OMAS",
            "OMAZ", "OMDB", "OMDM", "OMDW", "OMFJ", "OMRK", "OMSJ", "OOKB",
            "OOMS", "OOSA", "OOSH", "OOTH", "ORAT", "ORBI", "ORNI", "ORSU"
        ]
    },
    "Syria": {
        "lat_min": 30.0,
        "lat_max": 40.0,
        "lon_min": 30.0,
        "lon_max": 42.0,
        "airports": [
            "OSDI", "OSLK", "OSAP", "OSDZ", "OSKL", "OSLK", "OSPR", "LTAG",
            "LTAK", "LTCC", "LCRA", "LCEN", "LCPH", "LLBG", "LLJR", "LLHA",
            "OJAM", "OJAQ", "OJMF", "OLBA", "LCLK", "LCPH", "LCCC", "LCEN",
            "LCGK", "LCPH", "LCRA", "LGTG", "LGTS", "LLBG", "LLBS", "LLEK",
            "LLJR", "LLSD", "LTAN", "LTAP", "LTAU", "LTAY", "LTBA", "LTBJ",
            "LTBS", "LTDA", "LTFJ", "OJAM", "OJAQ", "OJAI", "OJJR", "OJMF",
            "OLBA", "OSLK", "OSAP", "OSDI", "OSDZ", "OSKL", "OSLK", "OSPR"
        ]
    },
    "Nevada": {
        "lat_min": 35.0,
        "lat_max": 39.0,
        "lon_min": -117.0,
        "lon_max": -113.0,
        "airports": [
            "KLAS", "KLSV", "KINS", "KXTA", "KDRA", "KBTY", "KTPH", "KBIH",
            "KVEL", "KBJN", "KELY", "KBCE", "KPGA", "KCDC", "KGXF", "KHND",
            "KVGT", "KBYS", "KBFL", "KEDW", "KNFL", "KNID", "KNLC", "KNUC",
            "KPOC", "KPSP", "KRIV", "KSBD", "KSEE", "KTNX", "KVBG", "KWJF"
        ]
    },
    "Marianas": {
        "lat_min": 13.0,
        "lat_max": 15.0,
        "lon_min": 144.0,
        "lon_max": 146.0,
        "airports": [
            "PGUM", "PGUA", "PGWT", "PGRO", "PGAC", "PGNT", "PGSN", "PGTI"
        ]
    },
    "Kola": {
        "lat_min": 66.0,
        "lat_max": 70.0,
        "lon_min": 30.0,
        "lon_max": 40.0,
        "airports": [
            "ULMM", "ULML", "ULPB", "ULMN", "ULMO", "ULMS", "ULMK", "ULMT",
            "ULMA", "ULMG", "ULMI", "ULMR", "ULMV", "ULMY", "ULMZ", "ULNR",
            "ULNN", "ULNP", "ULNK", "ULNM", "ULNS", "ULNV", "ULNX", "ULNY"
        ]
    }
}

# Словарь для хранения координат путевых точек
# Будет заполняться из файлов earth_fix.dat и earth_nav.dat или вручную
WAYPOINTS = {}

# Словарь для хранения ручных координат путевых точек
MANUAL_WAYPOINTS = {
    # Пример: "ANVIX": {"lat": 25.123456, "lon": 55.654321, "type": "FIX"}
}

# Словарь для хранения статистики проверки координат
COORD_VERIFICATION_STATS = {
    'total_waypoints': 0,
    'valid_coordinates': 0,
    'zero_coordinates': 0,
    'invalid_coordinates': 0,
    'fixed_coordinates': 0
}

class DTCParser:
    """Универсальный парсер данных CIFP для аэропортов DCS World"""
    
    def __init__(self, input_dir, output_dir, icao=None, debug=False, no_filter=False, manual_data=None, verify=True):
        """
        Инициализация парсера
        
        Args:
            input_dir (str): Путь к директории с файлами Navigraph AIRAC
            output_dir (str): Путь к директории для сохранения результатов
            icao (str): ICAO код аэропорта для парсинга (если None, парсятся все аэропорты)
            debug (bool): Режим отладки с подробным выводом
            no_filter (bool): Отключение фильтрации по координатам
            manual_data (str): Путь к файлу с ручными данными о путевых точках
            verify (bool): Включение проверки и исправления координат
        """
        self.input_dir = os.path.abspath(input_dir)
        self.output_dir = os.path.abspath(output_dir)
        self.icao = icao
        self.debug = debug
        self.no_filter = no_filter
        self.manual_data = manual_data
        self.verify = verify
        
        # Настройка уровня логирования
        if self.debug:
            logger.setLevel(logging.DEBUG)
        
        # Пути к файлам данных
        self.fix_file = os.path.join(self.input_dir, "earth_fix.dat")
        self.nav_file = os.path.join(self.input_dir, "earth_nav.dat")
        self.cifp_dir = os.path.join(self.input_dir, "CIFP")
        self.cifp_zip = os.path.join(self.input_dir, "CIFP.zip")
        
        # Структуры данных для хранения результатов парсинга
        self.airports = {}
        
        # Статистика
        self.stats = {
            'total_airports': 0,
            'total_procedures': 0,
            'total_waypoints': 0,
            'maps': {}
        }
        
        for map_name in DCS_MAPS.keys():
            self.stats['maps'][map_name] = {
                'airports': 0,
                'procedures': 0,
                'waypoints': 0
            }
        
        # Проверка наличия директории для результатов
        if not os.path.exists(self.output_dir):
            os.makedirs(self.output_dir)
            
        # Создание директорий для каждой карты
        for map_name in DCS_MAPS.keys():
            map_dir = os.path.join(self.output_dir, map_name)
            if not os.path.exists(map_dir):
                os.makedirs(map_dir)
    
    def run(self):
        """Запуск процесса парсинга"""
        logger.info(f"Универсальный парсер CIFP для DTC_ATC_Module v{VERSION}")
        logger.info(f"Входная директория: {self.input_dir}")
        logger.info(f"Выходная директория: {self.output_dir}")
        if self.icao:
            logger.info(f"ICAO код аэропорта: {self.icao}")
        else:
            logger.info("Режим парсинга: все аэропорты")
        logger.info(f"Режим отладки: {'Включен' if self.debug else 'Выключен'}")
        logger.info(f"Фильтрация по координатам: {'Выключена' if self.no_filter else 'Включена'}")
        logger.info(f"Проверка координат: {'Включена' if self.verify else 'Выключена'}")
        
        # Проверка наличия файлов
        self._check_files()
        
        # Распаковка CIFP.zip если нужно
        self._extract_cifp_if_needed()
        
        # Загрузка ручных данных о путевых точках
        if self.manual_data:
            self._load_manual_waypoints()
        
        # Загрузка путевых точек из earth_fix.dat
        self._load_waypoints()
        
        # Загрузка навигационных средств из earth_nav.dat
        self._load_nav_aids()
        
        # Парсинг данных CIFP
        logger.info("\nПарсинг данных CIFP...")
        self._parse_cifp_data()
        
        # Проверка и исправление координат
        if self.verify:
            self._verify_coordinates()
        
        # Сохранение результатов
        logger.info("\nСохранение результатов...")
        self._save_results()
        
        # Вывод статистики
        self._print_stats()
        
        logger.info("\nПарсинг завершен успешно!")
        logger.info(f"Результаты сохранены в директории: {self.output_dir}")
    
    def _check_files(self):
        """Проверка наличия необходимых файлов"""
        logger.info("\nПроверка наличия файлов...")
        
        missing_files = []
        
        if not os.path.exists(self.fix_file):
            missing_files.append("earth_fix.dat")
            logger.warning("Файл earth_fix.dat не найден. Координаты путевых точек могут быть недоступны.")
        
        if not os.path.exists(self.nav_file):
            missing_files.append("earth_nav.dat")
            logger.warning("Файл earth_nav.dat не найден. Данные о навигационных средствах (NDB, VOR) могут быть недоступны.")
        
        if not os.path.exists(self.cifp_dir) and not os.path.exists(self.cifp_zip):
            missing_files.append("CIFP (директория или архив CIFP.zip)")
        
        if missing_files and "CIFP (директория или архив CIFP.zip)" in missing_files:
            logger.error("ОШИБКА: Отсутствуют следующие файлы:")
            for file in missing_files:
                logger.error(f"  - {file}")
            logger.error(f"\nУбедитесь, что все необходимые файлы находятся в директории: {self.input_dir}")
            sys.exit(1)
        
        logger.info("Все необходимые файлы найдены.")
    
    def _extract_cifp_if_needed(self):
        """Распаковка архива CIFP.zip если директория CIFP отсутствует"""
        if not os.path.exists(self.cifp_dir) and os.path.exists(self.cifp_zip):
            logger.info("\nРаспаковка архива CIFP.zip...")
            try:
                with zipfile.ZipFile(self.cifp_zip, 'r') as zip_ref:
                    zip_ref.extractall(self.input_dir)
                logger.info("Архив CIFP.zip успешно распакован.")
                
                # Проверка содержимого распакованной директории
                if os.path.exists(self.cifp_dir):
                    cifp_files = os.listdir(self.cifp_dir)
                    logger.debug(f"Распаковано {len(cifp_files)} файлов в директорию CIFP")
                    if self.debug and cifp_files:
                        logger.debug(f"Примеры файлов: {', '.join(cifp_files[:5])}")
            except Exception as e:
                logger.error(f"ОШИБКА при распаковке архива CIFP.zip: {str(e)}")
                sys.exit(1)
    
    def _load_manual_waypoints(self):
        """Загрузка ручных данных о путевых точках из CSV или JSON файла"""
        global MANUAL_WAYPOINTS
        
        if not os.path.exists(self.manual_data):
            logger.warning(f"Файл с ручными данными не найден: {self.manual_data}")
            return
        
        logger.info(f"\nЗагрузка ручных данных о путевых точках из {self.manual_data}...")
        
        try:
            # Определение формата файла по расширению
            file_ext = os.path.splitext(self.manual_data)[1].lower()
            
            if file_ext == '.json':
                # Загрузка из JSON
                with open(self.manual_data, 'r', encoding='utf-8') as f:
                    MANUAL_WAYPOINTS = json.load(f)
                logger.info(f"Загружено {len(MANUAL_WAYPOINTS)} путевых точек из JSON файла.")
            
            elif file_ext == '.csv':
                # Загрузка из CSV
                with open(self.manual_data, 'r', encoding='utf-8', newline='') as f:
                    reader = csv.DictReader(f)
                    count = 0
                    for row in reader:
                        if 'name' in row and 'lat' in row and 'lon' in row:
                            name = row['name']
                            try:
                                lat = float(row['lat'])
                                lon = float(row['lon'])
                                
                                # Проверка координат
                                if self._is_valid_coordinate(lat, lon):
                                    wp_data = {
                                        'lat': lat,
                                        'lon': lon,
                                        'type': row.get('type', 'FIX')
                                    }
                                    
                                    # Добавление дополнительных полей, если они есть
                                    if 'frequency' in row and row['frequency']:
                                        wp_data['frequency'] = float(row['frequency'])
                                    if 'elevation' in row and row['elevation']:
                                        wp_data['elevation'] = float(row['elevation'])
                                    
                                    MANUAL_WAYPOINTS[name] = wp_data
                                    count += 1
                                else:
                                    logger.warning(f"Недопустимые координаты для точки {name}: lat={lat}, lon={lon}")
                            except ValueError:
                                logger.warning(f"Ошибка при преобразовании координат для точки {name}")
                    
                    logger.info(f"Загружено {count} путевых точек из CSV файла.")
            
            else:
                logger.warning(f"Неподдерживаемый формат файла с ручными данными: {file_ext}")
                logger.warning("Поддерживаются форматы: .json, .csv")
        
        except Exception as e:
            logger.error(f"ОШИБКА при загрузке ручных данных: {str(e)}")
            import traceback
            logger.error(traceback.format_exc())
    
    def _load_waypoints(self):
        """Загрузка путевых точек из файла earth_fix.dat"""
        global WAYPOINTS, MANUAL_WAYPOINTS
        
        # Сначала добавляем ручные путевые точки
        for name, data in MANUAL_WAYPOINTS.items():
            WAYPOINTS[name] = data
            if self.debug:
                logger.debug(f"Добавлена ручная путевая точка: {name} - Lat: {data['lat']}, Lon: {data['lon']}")
        
        if os.path.exists(self.fix_file):
            logger.info("\nЗагрузка путевых точек из earth_fix.dat...")
            count = 0
            try:
                with open(self.fix_file, 'r', encoding='utf-8', errors='ignore') as f:
                    for line_num, line in enumerate(f, 1):
                        try:
                            # Проверяем формат строки
                            if re.match('^-?\d+\.\d+\s+-?\d+\.\d+', line.strip()):
                                # Стандартный формат X-Plane
                                parts = line.strip().split()
                                if len(parts) >= 6:
                                    lat = float(parts[0])
                                    lon = float(parts[1])
                                    name = parts[2]
                                    type = parts[3]
                                    
                                    # Проверка координат
                                    if self._is_valid_coordinate(lat, lon):
                                        # Не перезаписываем ручные путевые точки
                                        if name not in WAYPOINTS:
                                            WAYPOINTS[name] = {
                                                'lat': lat,
                                                'lon': lon,
                                                'type': type
                                            }
                                            count += 1
                                    else:
                                        logger.warning(f"Недопустимые координаты для точки {name} в строке {line_num}: lat={lat}, lon={lon}")
                            elif re.match('^\s*\d+\s+[NS]\d+', line):
                                # Альтернативный формат
                                parts = re.split(r'\s+', line.strip())
                                if len(parts) >= 4:
                                    lat_str = parts[1]
                                    lon_str = parts[2]
                                    name = parts[3]
                                    
                                    # Парсинг координат
                                    lat = self._parse_coordinate(lat_str)
                                    lon = self._parse_coordinate(lon_str)
                                    
                                    # Проверка координат
                                    if self._is_valid_coordinate(lat, lon):
                                        # Не перезаписываем ручные путевые точки
                                        if name not in WAYPOINTS:
                                            WAYPOINTS[name] = {
                                                'lat': lat,
                                                'lon': lon,
                                                'type': 'FIX'
                                            }
                                            count += 1
                                    else:
                                        logger.warning(f"Недопустимые координаты для точки {name} в строке {line_num}: lat={lat}, lon={lon}")
                            
                            if count % 10000 == 0 and count > 0:
                                logger.debug(f"Загружено {count} путевых точек...")
                            
                            if self.debug and count <= 5:
                                logger.debug(f"Пример путевой точки: {name} - Lat: {lat}, Lon: {lon}")
                        except Exception as e:
                            if self.debug:
                                logger.debug(f"Ошибка при обработке строки {line_num} в earth_fix.dat: {str(e)}")
                            continue
                
                logger.info(f"Загружено {count} путевых точек из earth_fix.dat.")
            
            except Exception as e:
                logger.error(f"ОШИБКА при загрузке путевых точек из earth_fix.dat: {str(e)}")
                import traceback
                logger.error(traceback.format_exc())
        else:
            logger.warning("Файл earth_fix.dat не найден. Координаты путевых точек могут быть недоступны.")
    
    def _load_nav_aids(self):
        """Загрузка навигационных средств (NDB, VOR) из файла earth_nav.dat"""
        global WAYPOINTS
        
        if os.path.exists(self.nav_file):
            logger.info("\nЗагрузка навигационных средств из earth_nav.dat...")
            count_ndb = 0
            count_vor = 0
            count_ils = 0
            count_dme = 0
            
            try:
                with open(self.nav_file, 'r', encoding='utf-8', errors='ignore') as f:
                    for line_num, line in enumerate(f, 1):
                        try:
                            # Проверяем формат строки
                            if line.strip().startswith('2 ') or line.strip().startswith('3 ') or line.strip().startswith('4 ') or line.strip().startswith('5 ') or line.strip().startswith('12 ') or line.strip().startswith('13 '):
                                # Стандартный формат X-Plane для навигационных средств
                                parts = line.strip().split()
                                if len(parts) >= 10:
                                    nav_type = int(parts[0])
                                    lat = float(parts[1])
                                    lon = float(parts[2])
                                    elevation = float(parts[3])
                                    frequency = float(parts[4])/100
                                    max_range = float(parts[5])
                                    name = parts[10]
                                    # ENRT (Enroute) – навигационные средства для полётов по маршрутам (трассовые VOR, NDB и т.д.).
                                    # TERM (Terminal) – навигационные средства для терминального района аэропорта (подход к аэропорту).
                                    # ILS – навигационные компоненты системы инструментального захода на посадку (LOC, GS, маркеры).
                                    # LCTR (Locator) – приводные радиостанции (NDB), используемые для захода на посадку.
                                    # LOM (Locator Outer Marker) – дальний приводной маркер (совмещённый с маркерным маяком).
                                    # LMM (Locator Middle Marker) – ближний приводной маркер.
                                    # VDME (DME, ассоциированное с VOR) – DME-станция в составе комплекса VOR/DME.
                                    # IDME (DME, ассоциированное с ILS) – DME-станция, используемая для ILS.
                                    ident = parts[11]
                                    
                                    # Проверка координат
                                    if self._is_valid_coordinate(lat, lon):
                                        # Не перезаписываем существующие путевые точки
                                        if ident not in WAYPOINTS:
                                            nav_type_str = ""
                                            
                                            # Определение типа навигационного средства
                                            if nav_type == 2:  # NDB
                                                nav_type_str = "NDB"
                                                count_ndb += 1
                                            elif nav_type == 3:  # VOR
                                                nav_type_str = "VOR"
                                                count_vor += 1
                                            elif nav_type == 4 or nav_type == 5 or nav_type == 6:  # ILS/LOC
                                                nav_type_str = "ILS"
                                                count_ils += 1
                                            elif nav_type == 12 or nav_type == 13: # DME
                                                nav_type_str = "DME"
                                                count_dme += 1
                                            
                                            WAYPOINTS[ident] = {
                                                'lat': lat,
                                                'lon': lon,
                                                'type': nav_type_str,
                                                'frequency': frequency,
                                                'elevation': elevation,
                                                'name': name,
                                                'range': max_range
                                            }
                                    else:
                                        logger.warning(f"Недопустимые координаты для навигационного средства {ident} в строке {line_num}: lat={lat}, lon={lon}")
                        except Exception as e:
                            if self.debug:
                                logger.debug(f"Ошибка при обработке строки {line_num} в earth_nav.dat: {str(e)}")
                            continue
                
                total_nav_aids = count_ndb + count_vor + count_ils + count_dme
                logger.info(f"Загружено {total_nav_aids} навигационных средств из earth_nav.dat:")
                logger.info(f"  - NDB: {count_ndb}")
                logger.info(f"  - VOR: {count_vor}")
                logger.info(f"  - ILS/LOC: {count_ils}")
                logger.info(f"  - Другие: {count_dme}")
            
            except Exception as e:
                logger.error(f"ОШИБКА при загрузке навигационных средств из earth_nav.dat: {str(e)}")
                import traceback
                logger.error(traceback.format_exc())
        else:
            logger.warning("Файл earth_nav.dat не найден. Данные о навигационных средствах (NDB, VOR) могут быть недоступны.")
    
    def _is_valid_coordinate(self, lat, lon):
        """Проверка валидности координат"""
        if lat == 0 and lon == 0:
            return False
        
        if lat < -90 or lat > 90 or lon < -180 or lon > 180:
            return False
        
        return True
    
    def _parse_coordinate(self, coord_str):
        """Парсинг координаты из строки формата N/S/E/W"""
        try:
            if coord_str.startswith('N') or coord_str.startswith('S'):
                # Широта
                direction = 1 if coord_str.startswith('N') else -1
                degrees = float(coord_str[1:3])
                minutes = float(coord_str[3:5])
                seconds = float(coord_str[5:]) if len(coord_str) > 5 else 0
                
                return direction * (degrees + minutes / 60 + seconds / 3600)
            
            elif coord_str.startswith('E') or coord_str.startswith('W'):
                # Долгота
                direction = 1 if coord_str.startswith('E') else -1
                degrees = float(coord_str[1:4])
                minutes = float(coord_str[4:6])
                seconds = float(coord_str[6:]) if len(coord_str) > 6 else 0
                
                return direction * (degrees + minutes / 60 + seconds / 3600)
            
            else:
                # Предполагаем, что это просто число
                return float(coord_str)
        
        except Exception as e:
            logger.warning(f"Ошибка при парсинге координаты {coord_str}: {str(e)}")
            return 0.0
    
    def _parse_cifp_data(self):
        """Парсинг данных CIFP для аэропортов"""
        if not os.path.exists(self.cifp_dir):
            logger.error(f"Директория CIFP не найдена: {self.cifp_dir}")
            return
        
        # Получение списка файлов CIFP
        cifp_files = [f for f in os.listdir(self.cifp_dir) if f.endswith('.dat')]
        
        if not cifp_files:
            logger.error(f"Файлы CIFP не найдены в директории: {self.cifp_dir}")
            return
        
        logger.info(f"Найдено {len(cifp_files)} файлов CIFP")
        
        # Фильтрация файлов по ICAO коду, если указан
        if self.icao:
            cifp_files = [f for f in cifp_files if f.startswith(self.icao)]
            if not cifp_files:
                logger.error(f"Файлы CIFP для аэропорта {self.icao} не найдены")
                return
            logger.info(f"Отфильтровано {len(cifp_files)} файлов CIFP для аэропорта {self.icao}")
        
        # Парсинг каждого файла CIFP
        for cifp_file in cifp_files:
            try:
                # Извлечение ICAO кода аэропорта из имени файла
                airport_icao = cifp_file[:4]
                
                # Проверка, находится ли аэропорт в одном из регионов DCS World
                if not self.no_filter and not self._is_airport_in_dcs_region(airport_icao):
                    if self.debug:
                        logger.debug(f"Аэропорт {airport_icao} не находится в регионах DCS World, пропускаем")
                    continue
                
                logger.info(f"Парсинг данных для аэропорта {airport_icao}...")
                
                # Инициализация структуры данных для аэропорта
                if airport_icao not in self.airports:
                    self.airports[airport_icao] = {
                        'metadata': {
                            'ICAO': airport_icao,
                            'Name': f"{airport_icao} Airport",
                            'Elevation': 0,
                            'MagVar': 0,
                            'Region': self._get_airport_region(airport_icao)
                        },
                        'waypoints': {},
                        'runways': {},
                        'SID': {},
                        'STAR': {},
                        'APPROACH': {},
                        'frequencies': {
                            'TOWER': 118.0,
                            'APPROACH': 121.0,
                            'DEPARTURE': 125.0,
                            'GROUND': 121.7,
                            'ATIS': 126.0
                        }
                    }
                
                # Парсинг файла CIFP
                self._parse_cifp_file(airport_icao, os.path.join(self.cifp_dir, cifp_file))
                
                # Обновление статистики
                self.stats['total_airports'] += 1
                region = self._get_airport_region(airport_icao)
                if region in self.stats['maps']:
                    self.stats['maps'][region]['airports'] += 1
            
            except Exception as e:
                logger.error(f"Ошибка при парсинге файла {cifp_file}: {str(e)}")
                import traceback
                logger.error(traceback.format_exc())
    
    def _is_airport_in_dcs_region(self, icao):
        """Проверка, находится ли аэропорт в одном из регионов DCS World"""
        for region_name, region_data in DCS_MAPS.items():
            if icao in region_data['airports']:
                return True
        
        return False
    
    def _get_airport_region(self, icao):
        """Определение региона DCS World для аэропорта"""
        for region_name, region_data in DCS_MAPS.items():
            if icao in region_data['airports']:
                return region_name
        
        return "Unknown"
    
    def translate_altitude(self, alt_str):
        if alt_str.startswith('FL'):
            alt_str = alt_str[2:]+'00'
            
        return int(alt_str)
    
    def _parse_cifp_file(self, airport_icao, cifp_file_path):
        """Парсинг файла CIFP для конкретного аэропорта"""
        try:
            with open(cifp_file_path, 'r', encoding='utf-8', errors='ignore') as f:
                for line_num, line in enumerate(f, 1):
                    try:
                        line = line.strip()
                        
                        # Пропуск пустых строк и комментариев
                        if not line or line.startswith('#'):
                            continue
                        
                        # Парсинг строки в зависимости от типа записи
                        record_type = line.split(':')[0].strip()
                        
                        if record_type == 'APT':
                            # Информация об аэропорте
                            self._parse_airport_record(airport_icao, line)
                        
                        elif record_type == 'RWY':
                            # Информация о ВПП
                            self._parse_runway_record(airport_icao, line)
                        
                        elif record_type == 'SID':
                            # Процедура SID
                            self._parse_sid_record(airport_icao, line)
                        
                        elif record_type == 'STAR':
                            # Процедура STAR
                            self._parse_star_record(airport_icao, line)
                        
                        elif record_type == 'APPCH':
                            # Процедура захода на посадку
                            self._parse_approach_record(airport_icao, line)
                    
                    except Exception as e:
                        logger.warning(f"Ошибка при парсинге строки {line_num} в файле {cifp_file_path}: {str(e)}")
                        if self.debug:
                            logger.debug(f"Проблемная строка: {line}")
                        continue
        
        except Exception as e:
            logger.error(f"Ошибка при открытии файла {cifp_file_path}: {str(e)}")
    
    def _parse_airport_record(self, airport_icao, line):
        """Парсинг записи с информацией об аэропорте"""
        try:
            # Формат: AICAO,NAME,ELEVATION,MAGVAR
            parts = line.split(',')
            if len(parts) >= 4:
                name = parts[1].strip()
                elevation = float(parts[2].strip())
                magvar = float(parts[3].strip())
                
                self.airports[airport_icao]['metadata']['Name'] = name
                self.airports[airport_icao]['metadata']['Elevation'] = elevation
                self.airports[airport_icao]['metadata']['MagVar'] = magvar
                
                if self.debug:
                    logger.debug(f"Аэропорт {airport_icao}: {name}, Высота: {elevation}, Магнитное склонение: {magvar}")
        
        except Exception as e:
            logger.warning(f"Ошибка при парсинге информации об аэропорте {airport_icao}: {str(e)}")
    
    def _parse_runway_record(self, airport_icao, line):
        """Парсинг записи с информацией о ВПП"""
        try:
            # Формат: RICAO,RWY,WIDTH,LENGTH,LAT,LON,HEADING
            # Проверяем, что строка начинается с 'RWY:'
            if not line.startswith('RWY:'):
                return
            # Разбиваем строку на блоки, разделенные ';'
            blocks = line.split(';')
            
            # Первый блок содержит информацию о ВПП
            runway_info = blocks[0].split(',')
            
            # Извлекаем идентификатор ВПП из первого элемента (убираем 'RWY:')
            runway_id = runway_info[0].replace('RWY:', '').strip()
            # Получаем курс ВПП из идентификатора
            heading = None
            if runway_id and len(runway_id.strip()) >= 2:
                # Извлекаем числовую часть из идентификатора ВПП (например, из "RW06" получаем "06")
                runway_number = ''.join(filter(str.isdigit, runway_id.strip()))
                if runway_number:
                    # Преобразуем в число и умножаем на 10 для получения магнитного курса
                    heading = int(runway_number) * 10
                    if self.debug:
                        logger.debug(f"Получен курс ВПП {runway_id}: {heading}°")
            
            # Получаем длину ВПП
            runway_length = float(runway_info[1].strip()) if runway_info[1].strip() else 0
            
            # Получаем ширину ВПП
            runway_width = float(runway_info[2].strip()) if runway_info[2].strip() else 0
            
            # Получаем высоту порога ВПП (если указана)
            threshold_elevation = float(runway_info[3].strip()) if runway_info[3].strip() else 0
            
            # Получаем навигационную систему (если указана)
            nav_system = runway_info[5].strip() if len(runway_info) > 5 and runway_info[5].strip() else None
            
            # Получаем индикатор направления (если указан)
            direction_indicator = int(runway_info[6].strip()) if len(runway_info) > 6 and runway_info[6].strip() else None
            
            # Если есть второй блок, извлекаем координаты
            if len(blocks) > 1 and blocks[1]:
                coord_info = blocks[1].split(',')
                
                # Парсим широту (формат: N43260357 -> 43°26'03.57"N)
                lat_str = coord_info[0].strip()
                if lat_str:
                    lat_deg = float(lat_str[1:3])
                    lat_min = float(lat_str[3:5])
                    lat_sec = float(lat_str[5:7] + '.' + lat_str[7:])
                    lat = lat_deg + lat_min/60 + lat_sec/3600
                    if lat_str[0] == 'S':
                        lat = -lat
                
                # Парсим долготу (формат: E039564046 -> 39°56'40.46"E)
                lon_str = coord_info[1].strip()
                if lon_str:
                    lon_deg = float(lon_str[1:4])
                    lon_min = float(lon_str[4:6])
                    lon_sec = float(lon_str[6:8] + '.' + lon_str[8:])
                    lon = lon_deg + lon_min/60 + lon_sec/3600
                    if lon_str[0] == 'W':
                        lon = -lon
                
                # Получаем смещение точки касания (если указано)
                displaced_threshold = float(coord_info[2].strip()) if len(coord_info) > 2 and coord_info[2].strip() else 0
                
                if self.debug:
                    logger.debug(f"Дополнительная информация о ВПП {runway_id}: Высота порога: {threshold_elevation}, "
                                f"Нав. система: {nav_system}, Направление: {direction_indicator}, "
                                f"Координаты: {lat},{lon}, Смещение: {displaced_threshold}")
                  
                # Расчет координат конца ВПП
                import math
                end_lat = lat + (runway_length / 6076.12) * math.cos(math.radians(heading))
                end_lon = lon + (runway_length / 6076.12) * math.sin(math.radians(heading)) / math.cos(math.radians(lat))
                
                self.airports[airport_icao]['runways'][runway_id] = {
                    'heading': heading,
                    'length': runway_length,
                    'width': runway_width,
                    'threshold': {
                        'lat': lat,
                        'lon': lon
                    },
                    'end': {
                        'lat': end_lat,
                        'lon': end_lon
                    }
                }
                
                if self.debug:
                    logger.debug(f"ВПП {runway_id} аэропорта {airport_icao}: Ширина: {runway_width}, Длина: {runway_length}, Порог: {lat},{lon}, Курс: {heading}")
        
        except Exception as e:
            logger.warning(f"Ошибка при парсинге информации о ВПП аэропорта {airport_icao}: {str(e)}")
    
    def _parse_sid_record(self, airport_icao, line):
        """Парсинг записи с информацией о процедуре SID"""
        try:
            # Формат: 
            parts = line.split(',')
            if len(parts) >= 6:
                name = parts[2].strip()
                runway = parts[3].strip()
                # sequence = int(parts[4].strip()) if parts[4].strip() else None
                fix = parts[4].strip()
                fix_type = parts[6].strip()
                
                
                alt_min, alt_max, speed = None, None, None
                
                # Опциональные параметры
                if parts[22].strip()=='B':
                    alt_min = self.translate_altitude(parts[24].strip()) if len(parts) > 6 and parts[24].strip() else None
                    alt_max = self.translate_altitude(parts[23].strip()) if len(parts) > 7 and parts[23].strip() else None
                    
                elif parts[22].strip()=='+':
                    alt_min = self.translate_altitude(parts[23].strip()) if len(parts) > 6 and parts[23].strip() else None
                    
                elif parts[22].strip()=='-':
                    alt_max = self.translate_altitude(parts[23].strip()) if len(parts) > 6 and parts[23].strip() else None

                if parts[27].strip():    
                    speed = float(parts[27].strip()) if len(parts) > 8 and parts[27].strip() else None
                
                # Создание записи о процедуре, если она еще не существует
                if name not in self.airports[airport_icao]['SID']:
                    self.airports[airport_icao]['SID'][name] = {
                        'name': name,
                        'runway': runway,
                        'waypoints': []
                    }
                
                # Добавление путевой точки
                waypoint = {
                    'name': fix,
                    'type': fix_type
                }
                
                if alt_min is not None:
                    waypoint['altitude_min'] = alt_min
                
                if alt_max is not None:
                    waypoint['altitude_max'] = alt_max
                
                if speed is not None:
                    waypoint['speed'] = speed
                
                # Добавление путевой точки в список
                self.airports[airport_icao]['SID'][name]['waypoints'].append(waypoint)
                
                # Обновление статистики
                self.stats['total_procedures'] += 1
                region = self._get_airport_region(airport_icao)
                if region in self.stats['maps']:
                    self.stats['maps'][region]['procedures'] += 1
                
                if self.debug:
                    logger.debug(f"SID {name} аэропорта {airport_icao}, ВПП {runway}, Точкa: {fix} ({fix_type})")
        
        except Exception as e:
            logger.warning(f"Ошибка при парсинге информации о SID аэропорта {airport_icao}: {str(e)}")
    
    def _parse_star_record(self, airport_icao, line):
        """Парсинг записи с информацией о процедуре STAR"""
        try:
            # Формат: TICAO,NAME,RWY,SEQUENCE,FIX,TYPE,ALT_MIN,ALT_MAX,SPEED
            parts = line.split(',')
            if len(parts) >= 6:
                name = parts[2].strip()
                runway = parts[3].strip()
                # sequence = int(parts[3].strip())
                fix = parts[4].strip()
                fix_type = parts[5].strip()
                
                # Опциональные параметры
                alt_min, alt_max, speed = None, None, None
                
                if parts[22].strip()=='B':
                    alt_min = self.translate_altitude(parts[24].strip()) if len(parts) > 6 and parts[24].strip() else None
                    alt_max = self.translate_altitude(parts[23].strip()) if len(parts) > 7 and parts[23].strip() else None
                    
                elif parts[22].strip()=='+':
                    alt_min = self.translate_altitude(parts[23].strip()) if len(parts) > 6 and parts[23].strip() else None
                    
                elif parts[22].strip()=='-':
                    alt_max = self.translate_altitude(parts[23].strip()) if len(parts) > 6 and parts[23].strip() else None

                if parts[27].strip():    
                    speed = float(parts[27].strip()) if len(parts) > 8 and parts[27].strip() else None
                
                # Создание записи о процедуре, если она еще не существует
                if name not in self.airports[airport_icao]['STAR']:
                    self.airports[airport_icao]['STAR'][name] = {
                        'name': name,
                        'runway': runway,
                        'waypoints': []
                    }
                
                # Добавление путевой точки
                waypoint = {
                    'name': fix,
                    'type': fix_type
                }
                
                if alt_min is not None:
                    waypoint['altitude_min'] = alt_min
                
                if alt_max is not None:
                    waypoint['altitude_max'] = alt_max
                
                if speed is not None:
                    waypoint['speed'] = speed
                
                # Добавление путевой точки в список
                self.airports[airport_icao]['STAR'][name]['waypoints'].append(waypoint)
                
                # Обновление статистики
                self.stats['total_procedures'] += 1
                region = self._get_airport_region(airport_icao)
                if region in self.stats['maps']:
                    self.stats['maps'][region]['procedures'] += 1
                
                if self.debug:
                    logger.debug(f"STAR {name} аэропорта {airport_icao}, ВПП {runway}, Точка: {fix} ({fix_type})")
        
        except Exception as e:
            logger.warning(f"Ошибка при парсинге информации о STAR аэропорта {airport_icao}: {str(e)}")
    
    def _parse_approach_record(self, airport_icao, line):
        """Парсинг записи с информацией о процедуре захода на посадку"""
        try:
            # Формат: PICAO,NAME,TYPE,RWY,SEQUENCE,FIX,FIX_TYPE,ALT_MIN,ALT_MAX,SPEED
            parts = line.split(',')
            if len(parts) >= 7:
                name = parts[2].strip()
                # A — Instrument Approach (инструментальный заход по приборам)
                # C — Circling Approach (визуальный заход по кругу)
                # L — Missed Approach (сегмент ухода на второй круг)
                # O — Overlay Approach (современный заход, перекрывающий старую навигацию, например, RNAV поверх NDB)
                # S — Visual Approach (визуальный заход — может использоваться как самостоятельный тип)
                # R — RNP AR (Required Navigation Performance with Authorization Required)
                # N — RNAV Approach (обычный RNAV заход без авторизации)
                # D — Military Approach (военная процедура)
                approach_type = parts[1].strip()
                runway = parts[2].strip()
                transition = parts[3].strip()
                # sequence = int(parts[4].strip())
                fix = parts[4].strip()
                fix_type = parts[5].strip()
                
                # Опциональные параметры
                alt_min, alt_max, speed = None, None, None
                
                if parts[22].strip()=='B':
                    alt_min = self.translate_altitude(parts[24].strip()) if len(parts) > 6 and parts[24].strip() else None
                    alt_max = self.translate_altitude(parts[23].strip()) if len(parts) > 7 and parts[23].strip() else None
                    
                elif parts[22].strip()=='+':
                    alt_min = self.translate_altitude(parts[23].strip()) if len(parts) > 6 and parts[23].strip() else None
                    
                elif parts[22].strip()=='-':
                    alt_max = self.translate_altitude(parts[23].strip()) if len(parts) > 6 and parts[23].strip() else None

                if parts[27].strip():    
                    speed = float(parts[27].strip()) if len(parts) > 8 and parts[27].strip() else None
                
                # Создание записи о процедуре, если она еще не существует
                if name not in self.airports[airport_icao]['APPROACH']:
                    self.airports[airport_icao]['APPROACH'][name] = {
                        'name': name,                        
                        'type': approach_type,
                        'runway': runway,
                        'waypoints': []
                    }
                
                # Добавление путевой точки
                waypoint = {
                    'transition': transition,
                    'name': fix,
                    'type': fix_type
                }
                
                if alt_min is not None:
                    waypoint['altitude_min'] = alt_min
                
                if alt_max is not None:
                    waypoint['altitude_max'] = alt_max
                
                if speed is not None:
                    waypoint['speed'] = speed
                
                # Добавление путевой точки в список
                self.airports[airport_icao]['APPROACH'][name]['waypoints'].append(waypoint)
                
                # Обновление статистики
                self.stats['total_procedures'] += 1
                region = self._get_airport_region(airport_icao)
                if region in self.stats['maps']:
                    self.stats['maps'][region]['procedures'] += 1
                
                if self.debug:
                    logger.debug(f"APPROACH {name} ({approach_type}) аэропорта {airport_icao}, ВПП {runway}, Точка: {fix} ({fix_type})")
        
        except Exception as e:
            logger.warning(f"Ошибка при парсинге информации о заходе на посадку аэропорта {airport_icao}: {str(e)}")
    
    def _verify_coordinates(self):
        """Проверка и исправление координат путевых точек"""
        global WAYPOINTS, COORD_VERIFICATION_STATS
        
        logger.info("\nПроверка и исправление координат путевых точек...")
        
        # Сброс статистики
        COORD_VERIFICATION_STATS = {
            'total_waypoints': 0,
            'valid_coordinates': 0,
            'zero_coordinates': 0,
            'invalid_coordinates': 0,
            'fixed_coordinates': 0
        }
        
        # Проверка каждого аэропорта
        for airport_icao, airport_data in self.airports.items():
            # Сбор всех путевых точек из процедур
            procedure_waypoints = set()
            
            # SID
            for sid_name, sid_data in airport_data['SID'].items():
                for wp in sid_data['waypoints']:
                    procedure_waypoints.add(wp['name'])
            
            # STAR
            for star_name, star_data in airport_data['STAR'].items():
                for wp in star_data['waypoints']:
                    procedure_waypoints.add(wp['name'])
            
            # APPROACH
            for app_name, app_data in airport_data['APPROACH'].items():
                for wp in app_data['waypoints']:
                    procedure_waypoints.add(wp['name'])
            
            # Проверка каждой путевой точки
            for wp_name in procedure_waypoints:
                COORD_VERIFICATION_STATS['total_waypoints'] += 1
                
                # Проверка наличия координат
                if wp_name in WAYPOINTS:
                    wp_data = WAYPOINTS[wp_name]
                    
                    # Проверка валидности координат
                    if self._is_valid_coordinate(wp_data['lat'], wp_data['lon']):
                        COORD_VERIFICATION_STATS['valid_coordinates'] += 1
                        
                        # Добавление путевой точки в аэропорт
                        airport_data['waypoints'][wp_name] = wp_data
                        
                        # Обновление статистики
                        self.stats['total_waypoints'] += 1
                        region = self._get_airport_region(airport_icao)
                        if region in self.stats['maps']:
                            self.stats['maps'][region]['waypoints'] += 1
                    
                    elif wp_data['lat'] == 0 and wp_data['lon'] == 0:
                        COORD_VERIFICATION_STATS['zero_coordinates'] += 1
                        logger.warning(f"Нулевые координаты для точки {wp_name} аэропорта {airport_icao}")
                    
                    else:
                        COORD_VERIFICATION_STATS['invalid_coordinates'] += 1
                        logger.warning(f"Недопустимые координаты для точки {wp_name} аэропорта {airport_icao}: lat={wp_data['lat']}, lon={wp_data['lon']}")
                
                else:
                    logger.warning(f"Не найдены координаты для точки {wp_name} аэропорта {airport_icao}")
        
        # Вывод статистики проверки координат
        logger.info(f"Статистика проверки координат:")
        logger.info(f"  Всего путевых точек: {COORD_VERIFICATION_STATS['total_waypoints']}")
        logger.info(f"  Валидные координаты: {COORD_VERIFICATION_STATS['valid_coordinates']}")
        logger.info(f"  Нулевые координаты: {COORD_VERIFICATION_STATS['zero_coordinates']}")
        logger.info(f"  Недопустимые координаты: {COORD_VERIFICATION_STATS['invalid_coordinates']}")
        logger.info(f"  Исправлено координат: {COORD_VERIFICATION_STATS['fixed_coordinates']}")
    
    def _save_results(self):
        """Сохранение результатов парсинга в файлы"""
        # Сохранение данных для каждого аэропорта
        for airport_icao, airport_data in self.airports.items():
            try:
                # Определение региона аэропорта
                region = self._get_airport_region(airport_icao)
                
                # Путь к файлу результатов
                output_file = os.path.join(self.output_dir, region, f"{airport_icao}_MOOSE.lua")
                
                # Создание директории, если она не существует
                os.makedirs(os.path.dirname(output_file), exist_ok=True)
                
                # Запись данных в файл
                with open(output_file, 'w', encoding='utf-8') as f:
                    f.write("local AirportData = {\n")
                    
                    # Метаданные
                    f.write("    -- Метаданные аэропорта\n")
                    f.write("    Metadata = {\n")
                    f.write(f"        ICAO = \"{airport_data['metadata']['ICAO']}\",\n")
                    f.write(f"        Name = \"{airport_data['metadata']['Name']}\",\n")
                    f.write(f"        Elevation = {airport_data['metadata']['Elevation']},\n")
                    f.write(f"        MagVar = {airport_data['metadata']['MagVar']},\n")
                    f.write(f"        Region = \"{airport_data['metadata']['Region']}\"\n")
                    f.write("    },\n\n")
                    
                    # Путевые точки
                    f.write("    -- Путевые точки\n")
                    f.write("    Waypoints = {\n")
                    for name, data in airport_data['waypoints'].items():
                        f.write(f"        [\"{name}\"] = {{ lat = {data['lat']}, lon = {data['lon']}, type = \"{data['type']}\"")
                        if 'frequency' in data:
                            f.write(f", frequency = {data['frequency']}")
                        if 'elevation' in data:
                            f.write(f", elevation = {data['elevation']}")
                        if 'name' in data:
                            f.write(f", name = \"{data['name']}\"")
                        if 'range' in data:
                            f.write(f", range = {data['range']}")
                        f.write(" },\n")
                    f.write("    },\n\n")
                    
                    # ВПП
                    f.write("    -- Данные ВПП\n")
                    f.write("    Runways = {\n")
                    for name, data in airport_data['runways'].items():
                        f.write(f"        [\"{name}\"] = {{\n")
                        f.write(f"            heading = {data['heading']},\n")
                        f.write(f"            length = {data['length']},\n")
                        f.write(f"            width = {data['width']},\n")
                        f.write(f"            rw_threshold = {{ lat = {data['threshold']['lat']}, lon = {data['threshold']['lon']} }},\n")
                        f.write(f"            rw_end = {{ lat = {data['end']['lat']}, lon = {data['end']['lon']} }}\n")
                        f.write("        },\n")
                    f.write("    },\n\n")
                    
                    # SID
                    f.write("    -- Процедуры SID\n")
                    f.write("    SID = {\n")
                    for name, data in airport_data['SID'].items():
                        f.write(f"        [\"{name}\"] = {{\n")
                        f.write(f"            name = \"{data['name']}\",\n")
                        f.write(f"            runway = \"{data['runway']}\",\n")
                        f.write("            waypoints = {\n")
                        for wp in data['waypoints']:
                            f.write(f"                {{ name = \"{wp['name']}\", type = \"{wp['type']}\"")
                            if 'altitude_min' in wp:
                                f.write(f", altitude_min = {wp['altitude_min']}")
                            if 'altitude_max' in wp:
                                f.write(f", altitude_max = {wp['altitude_max']}")
                            if 'speed' in wp:
                                f.write(f", speed = {wp['speed']}")
                            f.write(" },\n")
                        f.write("            }\n")
                        f.write("        },\n")
                    f.write("    },\n\n")
                    
                    # STAR
                    f.write("    -- Процедуры STAR\n")
                    f.write("    STAR = {\n")
                    for name, data in airport_data['STAR'].items():
                        f.write(f"        [\"{name}\"] = {{\n")
                        f.write(f"            name = \"{data['name']}\",\n")
                        f.write(f"            runway = \"{data['runway']}\",\n")
                        f.write("            waypoints = {\n")
                        for wp in data['waypoints']:
                            f.write(f"                {{ name = \"{wp['name']}\", type = \"{wp['type']}\"")
                            if 'altitude_min' in wp:
                                f.write(f", altitude_min = {wp['altitude_min']}")
                            if 'altitude_max' in wp:
                                f.write(f", altitude_max = {wp['altitude_max']}")
                            if 'speed' in wp:
                                f.write(f", speed = {wp['speed']}")
                            f.write(" },\n")
                        f.write("            }\n")
                        f.write("        },\n")
                    f.write("    },\n\n")
                    
                    # APPROACH
                    f.write("    -- Процедуры захода на посадку\n")
                    f.write("    APPROACH = {\n")
                    for name, data in airport_data['APPROACH'].items():
                        f.write(f"        [\"{name}\"] = {{\n")
                        # f.write(f"            transition = \"{data['transition']}\",\n")
                        f.write(f"            name = \"{data['name']}\",\n")
                        f.write(f"            type = \"{data['type']}\",\n")
                        f.write(f"            runway = \"{data['runway']}\",\n")
                        f.write("            waypoints = {\n")
                        for wp in data['waypoints']:
                            f.write(f"                {{ name = \"{wp['name']}\", transition = \"{wp['transition']}\", type = \"{wp['type']}\"")
                            if 'altitude_min' in wp:
                                f.write(f", altitude_min = {wp['altitude_min']}")
                            if 'altitude_max' in wp:
                                f.write(f", altitude_max = {wp['altitude_max']}")
                            if 'speed' in wp:
                                f.write(f", speed = {wp['speed']}")
                            f.write(" },\n")
                        f.write("            }\n")
                        f.write("        },\n")
                    f.write("    },\n\n")
                    
                    # Частоты
                    f.write("    -- Частоты\n")
                    f.write("    Frequencies = {\n")
                    for service, freq in airport_data['frequencies'].items():
                        f.write(f"        {service} = {freq},\n")
                    f.write("    }\n")
                    
                    f.write("}\n\n")
                    f.write("return AirportData\n")
                
                logger.info(f"Данные для аэропорта {airport_icao} сохранены в файл: {output_file}")
            
            except Exception as e:
                logger.error(f"Ошибка при сохранении данных для аэропорта {airport_icao}: {str(e)}")
                import traceback
                logger.error(traceback.format_exc())
    
    def _print_stats(self):
        """Вывод статистики парсинга"""
        logger.info("\nСтатистика парсинга:")
        logger.info(f"Всего аэропортов: {self.stats['total_airports']}")
        logger.info(f"Всего процедур: {self.stats['total_procedures']}")
        logger.info(f"Всего путевых точек: {self.stats['total_waypoints']}")
        
        logger.info("\nСтатистика по картам DCS World:")
        for map_name, map_stats in self.stats['maps'].items():
            if map_stats['airports'] > 0:
                logger.info(f"  {map_name}:")
                logger.info(f"    Аэропортов: {map_stats['airports']}")
                logger.info(f"    Процедур: {map_stats['procedures']}")
                logger.info(f"    Путевых точек: {map_stats['waypoints']}")

def main():
    """Основная функция"""
    parser = argparse.ArgumentParser(description='Универсальный парсер CIFP для DTC_ATC_Module')
    parser.add_argument('--input', '-i', required=True, help='Путь к директории с файлами Navigraph AIRAC')
    parser.add_argument('--output', '-o', required=True, help='Путь к директории для сохранения результатов')
    parser.add_argument('--icao', help='ICAO код аэропорта для парсинга (если не указан, парсятся все аэропорты)')
    parser.add_argument('--debug', '-d', action='store_true', help='Включить режим отладки')
    parser.add_argument('--no-filter', '-n', action='store_true', help='Отключить фильтрацию по координатам')
    parser.add_argument('--manual-data', '-m', help='Путь к файлу с ручными данными о путевых точках')
    parser.add_argument('--no-verify', action='store_true', help='Отключить проверку и исправление координат')
    parser.add_argument('--version', '-v', action='version', version=f'%(prog)s {VERSION}')
    

    # args = parser.parse_args()
    args = type('Args', (), {
        'input': "C:/Users/Aorus/Python Projects/AIRAC",
        'output': "C:/Users/Aorus/Python Projects/DCS Scripts/Missions/DCS-LUA/DCS ATC/AIRAC Data New",
        'icao': None,
        'debug': True,
        'no_filter': False,
        'manual_data': None,
        'no_verify': False
    })()
    
    # Создание и запуск парсера
    parser = DTCParser(
        input_dir=args.input,
        output_dir=args.output,
        icao=args.icao,
        debug=args.debug,
        no_filter=args.no_filter,
        manual_data=args.manual_data,
        verify=not args.no_verify
    )
    
    parser.run()

if __name__ == '__main__':
    main()
