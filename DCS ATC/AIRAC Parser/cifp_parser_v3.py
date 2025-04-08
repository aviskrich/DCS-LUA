#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Специализированный парсер CIFP для DCS World

Этот скрипт парсит данные Navigraph AIRAC в формате CIFP и создает файлы
с навигационными данными для карт DCS World и их аэропортов в формате,
совместимом с MOOSE Framework.

Автор: AVIskrich
Дата: Апрель 2025
Версия: 1.3.0
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
VERSION = "1.3.0"

# Настройка логирования
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger('cifp_parser')

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
    }
}

# Словарь для хранения координат путевых точек
# Будет заполняться из файла earth_fix.dat или вручную
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

class CIFPParser:
    """Парсер данных CIFP для аэропортов DCS World"""
    
    def __init__(self, input_dir, output_dir, debug=False, no_filter=False, manual_data=None, verify=True):
        """
        Инициализация парсера
        
        Args:
            input_dir (str): Путь к директории с файлами Navigraph AIRAC
            output_dir (str): Путь к директории для сохранения результатов
            debug (bool): Режим отладки с подробным выводом
            no_filter (bool): Отключение фильтрации по координатам
            manual_data (str): Путь к файлу с ручными данными о путевых точках
            verify (bool): Включение проверки и исправления координат
        """
        self.input_dir = os.path.abspath(input_dir)
        self.output_dir = os.path.abspath(output_dir)
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
        logger.info(f"Специализированный парсер CIFP v{VERSION}")
        logger.info(f"Входная директория: {self.input_dir}")
        logger.info(f"Выходная директория: {self.output_dir}")
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
                            if line.startswith('1 '):
                                # Стандартный формат X-Plane
                                parts = line.strip().split()
                                if len(parts) >= 6:
                                    lat = float(parts[1])
                                    lon = float(parts[2])
                                    name = parts[3]
                                    
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
                            elif re.match('^-?\d+\.\d+\s+-?\d+\.\d+\s+\w+\s+\w+\s+\w+\s+\d+\s+\w+$', line.strip()):
                                # Альтернативный формат
                                parts = re.split(r'\s+', line.strip())
                                if len(parts) >= 4:
                                    lat_str = parts[0]
                                    lon_str = parts[1]
                                    name = parts[2]
                                    
                                    # Парсинг координат
                                    # lat = self._parse_coordinate(lat_str)
                                    # lon = self._parse_coordinate(lon_str)
                                    lat = float(lat_str)
                                    lon = float(lon_str)
                                    
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
                            logger.warning(f"Ошибка при обработке строки {line_num} в earth_fix.dat: {str(e)}")
                            if self.debug:
                                logger.debug(f"Проблемная строка: {line.strip()}")
            except Exception as e:
                logger.error(f"ОШИБКА при загрузке файла earth_fix.dat: {str(e)}")
            
            logger.info(f"Загружено {count} путевых точек из earth_fix.dat.")
            self.stats['total_waypoints'] = count + len(MANUAL_WAYPOINTS)
        else:
            logger.warning("Файл earth_fix.dat не найден. Будут использованы только ручные координаты путевых точек.")
            self.stats['total_waypoints'] = len(MANUAL_WAYPOINTS)
            
        # Загрузка навигационных средств как путевых точек
        if os.path.exists(self.nav_file):
            logger.info("\nЗагрузка навигационных средств из earth_nav.dat...")
            count = 0
            try:
                with open(self.nav_file, 'r', encoding='utf-8', errors='ignore') as f:
                    for line_num, line in enumerate(f, 1):
                        try:
                            # Проверяем формат строки
                            if line and line[0] in ['2', '3', '4', '5', '6', '12', '13']:
                                # Стандартный формат X-Plane
                                parts = line.strip().split()
                                if len(parts) >= 9:
                                    nav_type = parts[0]
                                    lat = float(parts[1])
                                    lon = float(parts[2])
                                    elevation = float(parts[3])
                                    frequency = float(parts[4])
                                    name = parts[7]
                                    
                                    # Проверка координат
                                    if self._is_valid_coordinate(lat, lon):
                                        # Определение типа навигационного средства
                                        if nav_type == '2':
                                            type_name = 'NDB'
                                        elif nav_type == '3':
                                            type_name = 'VOR'
                                        elif nav_type in ['4', '5']:
                                            type_name = 'ILS'
                                        elif nav_type == '6':
                                            type_name = 'GS'
                                        elif nav_type == '12':
                                            type_name = 'DME'
                                        elif nav_type == '13':
                                            type_name = 'TACAN'
                                        else:
                                            type_name = 'UNKNOWN'
                                        
                                        # Не перезаписываем ручные путевые точки
                                        if name not in WAYPOINTS:
                                            WAYPOINTS[name] = {
                                                'lat': lat,
                                                'lon': lon,
                                                'elevation': elevation,
                                                'frequency': frequency,
                                                'type': type_name
                                            }
                                            count += 1
                                    else:
                                        logger.warning(f"Недопустимые координаты для навигационного средства {name} в строке {line_num}: lat={lat}, lon={lon}")
                            elif re.match(r'^\s*\d+\s+[NS]\d+', line):
                                # Альтернативный формат
                                parts = re.split(r'\s+', line.strip())
                                if len(parts) >= 6:
                                    nav_type = parts[0]
                                    lat_str = parts[1]
                                    lon_str = parts[2]
                                    name = parts[5]
                                    
                                    # Парсинг координат
                                    lat = self._parse_coordinate(lat_str)
                                    lon = self._parse_coordinate(lon_str)
                                    
                                    # Проверка координат
                                    if self._is_valid_coordinate(lat, lon):
                                        # Определение типа навигационного средства
                                        if nav_type == '2':
                                            type_name = 'NDB'
                                        elif nav_type == '3':
                                            type_name = 'VOR'
                                        elif nav_type in ['4', '5']:
                                            type_name = 'ILS'
                                        else:
                                            type_name = 'UNKNOWN'
                                        
                                        # Не перезаписываем ручные путевые точки
                                        if name not in WAYPOINTS:
                                            WAYPOINTS[name] = {
                                                'lat': lat,
                                                'lon': lon,
                                                'type': type_name
                                            }
                                            count += 1
                                    else:
                                        logger.warning(f"Недопустимые координаты для навигационного средства {name} в строке {line_num}: lat={lat}, lon={lon}")
                            
                            if count % 1000 == 0 and count > 0:
                                logger.debug(f"Загружено {count} навигационных средств...")
                            
                            if self.debug and count <= 5:
                                logger.debug(f"Пример навигационного средства: {name} - Тип: {type_name}, Lat: {lat}, Lon: {lon}")
                        except Exception as e:
                            logger.warning(f"Ошибка при обработке строки {line_num} в earth_nav.dat: {str(e)}")
                            if self.debug:
                                logger.debug(f"Проблемная строка: {line.strip()}")
            except Exception as e:
                logger.error(f"ОШИБКА при загрузке файла earth_nav.dat: {str(e)}")
            
            logger.info(f"Загружено {count} навигационных средств.")
            self.stats['total_waypoints'] += count
        
        # Вывод информации о загруженных путевых точках
        logger.info(f"\nВсего загружено {len(WAYPOINTS)} путевых точек.")
        
        # Проверка наличия путевых точек
        if len(WAYPOINTS) == 0:
            logger.warning("ВНИМАНИЕ: Не загружено ни одной путевой точки!")
            logger.warning("Результаты парсинга будут содержать нулевые координаты.")
    
    def _is_valid_coordinate(self, lat, lon):
        """Проверка валидности координат"""
        # Проверка на NaN и бесконечность
        if (isinstance(lat, float) and (math.isnan(lat) or math.isinf(lat))) or \
           (isinstance(lon, float) and (math.isnan(lon) or math.isinf(lon))):
            return False
        
        # Проверка диапазона координат
        if lat < -90 or lat > 90 or lon < -180 or lon > 180:
            return False
        
        # Проверка на нулевые координаты (0,0)
        if lat == 0 and lon == 0:
            return False
        
        return True
    
    def _parse_coordinate(self, coord_str, lat_lon):
        """Парсинг координаты из строки в различных форматах"""
        # Формат N/S/E/W + градусы
        match = re.match(r'([NS])(\d+)\.(\d+)', coord_str)
        if match:
            direction = match.group(1)
            degrees = float(f"{match.group(2)}.{match.group(3)}")
            return degrees if direction == 'N' else -degrees
        
        match = re.match(r'([EW])(\d+)\.(\d+)', coord_str)
        if match:
            direction = match.group(1)
            degrees = float(f"{match.group(2)}.{match.group(3)}")
            return degrees if direction == 'E' else -degrees
        
        # Формат N/S/E/W + градусы + минуты + секунды
        match = re.match(r'([NS])(\d+)(\d{2})(\d{2})', coord_str)
        if match:
            direction = match.group(1)
            degrees = int(match.group(2))
            minutes = int(match.group(3))
            seconds = int(match.group(4))
            decimal = degrees + minutes/60 + seconds/3600
            return decimal if direction == 'N' else -decimal
        
        match = re.match(r'([EW])(\d+)(\d{2})(\d{2})', coord_str)
        if match:
            direction = match.group(1)
            degrees = int(match.group(2))
            minutes = int(match.group(3))
            seconds = int(match.group(4))
            decimal = degrees + minutes/60 + seconds/3600
            return decimal if direction == 'E' else -decimal
        
        # Если не удалось распознать формат, возвращаем 0
        logger.warning(f"Не удалось распознать формат координаты: {coord_str}")
        return 0.0
    
    def _parse_cifp_data(self):
        """Парсинг данных CIFP для аэропортов"""
        if not os.path.exists(self.cifp_dir):
            logger.error("ОШИБКА: Директория CIFP не найдена.")
            return
        
        # Получаем список всех аэропортов из всех карт
        all_dcs_airports = []
        for map_data in DCS_MAPS.values():
            all_dcs_airports.extend(map_data['airports'])
        
        # Удаляем дубликаты
        all_dcs_airports = list(set(all_dcs_airports))
        
        logger.debug(f"Всего аэропортов DCS World для обработки: {len(all_dcs_airports)}")
        if self.debug:
            logger.debug(f"Примеры аэропортов: {', '.join(all_dcs_airports[:10])}")
        
        # Перебираем все файлы в директории CIFP
        cifp_files = os.listdir(self.cifp_dir)
        logger.debug(f"Всего файлов в директории CIFP: {len(cifp_files)}")
        
        # Если режим без фильтрации, обрабатываем все файлы
        if self.no_filter:
            logger.debug("Режим без фильтрации: обработка всех аэропортов")
            for filename in cifp_files:
                if not filename.endswith('.dat'):
                    continue
                
                airport_code = filename.split('.')[0]
                self._parse_airport_cifp(airport_code)
        else:
            # Фильтрация по аэропортам DCS World
            for airport_code in all_dcs_airports:
                filename = f"{airport_code}.dat"
                file_path = os.path.join(self.cifp_dir, filename)
                
                if not os.path.exists(file_path):
                    logger.debug(f"Файл для аэропорта {airport_code} не найден")
                    continue
                
                self._parse_airport_cifp(airport_code)
        
        self.stats['total_airports'] = len(self.airports)
    
    def _parse_airport_cifp(self, airport_code):
        """Парсинг данных CIFP для конкретного аэропорта"""
        file_path = os.path.join(self.cifp_dir, f"{airport_code}.dat")
        if not os.path.exists(file_path):
            logger.warning(f"Файл для аэропорта {airport_code} не найден")
            return
        
        logger.info(f"Обработка аэропорта {airport_code}...")
        
        # Инициализация структуры для аэропорта
        self.airports[airport_code] = {
            'SID': {},
            'STAR': {},
            'APPROACH': {},
            'RUNWAY': {},
            'waypoints': {}
        }
        
        # Парсинг файла CIFP
        try:
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
                
                # Парсинг SID процедур
                self._parse_sid_procedures(airport_code, content)
                
                # Парсинг STAR процедур
                self._parse_star_procedures(airport_code, content)
                
                # Парсинг APPROACH процедур
                self._parse_approach_procedures(airport_code, content)
                
                # Парсинг информации о ВПП
                self._parse_runway_info(airport_code, content)
                
                # Сбор всех путевых точек, используемых в процедурах
                self._collect_procedure_waypoints(airport_code)
        except Exception as e:
            logger.error(f"ОШИБКА при парсинге файла {file_path}: {str(e)}")
            import traceback
            logger.error(traceback.format_exc())
    
    def _parse_sid_procedures(self, airport_code, content):
        """Парсинг SID процедур из содержимого файла CIFP"""
        # Регулярное выражение для поиска SID процедур
        sid_pattern = r'SID:(\d+),\d+,([^,]+),([^,]+),([^,]+)'
        
        # Словарь для хранения процедур SID
        sid_procedures = {}
        
        # Поиск всех строк SID
        sid_lines = re.findall(r'SID:.*?;', content, re.MULTILINE)
        
        if self.debug:
            logger.debug(f"Найдено {len(sid_lines)} строк SID для аэропорта {airport_code}")
            if sid_lines:
                logger.debug(f"Пример строки SID: {sid_lines[0]}")
        
        # Группировка строк по имени процедуры и ВПП
        for line in sid_lines:
            match = re.search(sid_pattern, line)
            if match:
                seq_num = match.group(1)
                proc_name = match.group(2)
                runway = match.group(3)
                waypoint = match.group(4)
                
                # Ключ для процедуры: имя + ВПП
                proc_key = f"{proc_name}_{runway}"
                
                if proc_key not in sid_procedures:
                    sid_procedures[proc_key] = {
                        'name': proc_name,
                        'runway': runway,
                        'waypoints': []
                    }
                
                # Добавление путевой точки, если она не пустая
                if waypoint and waypoint.strip() != '':
                    # Парсинг дополнительных параметров
                    altitude_min = self._extract_altitude_min(line)
                    altitude_max = self._extract_altitude_max(line)
                    speed = self._extract_speed(line)
                    
                    waypoint_data = {
                        'name': waypoint,
                        'type': 'FLY_BY'
                    }
                    
                    if altitude_min:
                        waypoint_data['altitude_min'] = altitude_min
                    
                    if altitude_max:
                        waypoint_data['altitude_max'] = altitude_max
                    
                    if speed:
                        waypoint_data['speed'] = speed
                    
                    sid_procedures[proc_key]['waypoints'].append(waypoint_data)
        
        # Сохранение процедур SID в структуре аэропорта
        for proc_key, proc_data in sid_procedures.items():
            proc_name = proc_data['name']
            self.airports[airport_code]['SID'][proc_name] = proc_data
        
        logger.debug(f"Аэропорт {airport_code}: Обработано {len(sid_procedures)} SID процедур")
        self.stats['total_procedures'] += len(sid_procedures)
    
    def _parse_star_procedures(self, airport_code, content):
        """Парсинг STAR процедур из содержимого файла CIFP"""
        # Регулярное выражение для поиска STAR процедур
        star_pattern = r'STAR:(\d+),\d+,([^,]+),([^,]+),([^,]+)'
        
        # Словарь для хранения процедур STAR
        star_procedures = {}
        
        # Поиск всех строк STAR
        star_lines = re.findall(r'STAR:.*?;', content, re.MULTILINE)
        
        if self.debug:
            logger.debug(f"Найдено {len(star_lines)} строк STAR для аэропорта {airport_code}")
            if star_lines:
                logger.debug(f"Пример строки STAR: {star_lines[0]}")
        
        # Группировка строк по имени процедуры и ВПП
        for line in star_lines:
            match = re.search(star_pattern, line)
            if match:
                seq_num = match.group(1)
                proc_name = match.group(2)
                runway = match.group(3)
                waypoint = match.group(4)
                
                # Ключ для процедуры: имя + ВПП
                proc_key = f"{proc_name}_{runway}"
                
                if proc_key not in star_procedures:
                    star_procedures[proc_key] = {
                        'name': proc_name,
                        'runway': runway,
                        'waypoints': []
                    }
                
                # Добавление путевой точки, если она не пустая
                if waypoint and waypoint.strip() != '':
                    # Парсинг дополнительных параметров
                    altitude_min = self._extract_altitude_min(line)
                    altitude_max = self._extract_altitude_max(line)
                    speed = self._extract_speed(line)
                    
                    waypoint_data = {
                        'name': waypoint,
                        'type': 'FLY_BY'
                    }
                    
                    if altitude_min:
                        waypoint_data['altitude_min'] = altitude_min
                    
                    if altitude_max:
                        waypoint_data['altitude_max'] = altitude_max
                    
                    if speed:
                        waypoint_data['speed'] = speed
                    
                    star_procedures[proc_key]['waypoints'].append(waypoint_data)
        
        # Сохранение процедур STAR в структуре аэропорта
        for proc_key, proc_data in star_procedures.items():
            proc_name = proc_data['name']
            self.airports[airport_code]['STAR'][proc_name] = proc_data
        
        logger.debug(f"Аэропорт {airport_code}: Обработано {len(star_procedures)} STAR процедур")
        self.stats['total_procedures'] += len(star_procedures)
    
    def _parse_approach_procedures(self, airport_code, content):
        """Парсинг APPROACH процедур из содержимого файла CIFP"""
        # Регулярное выражение для поиска APPROACH процедур
        approach_pattern = r'APPCH:(\d+),([^,]+),([^,]+),([^,]*),([^,]+)'
        
        # Словарь для хранения процедур APPROACH
        approach_procedures = {}
        
        # Поиск всех строк APPCH
        approach_lines = re.findall(r'APPCH:.*?;', content, re.MULTILINE)
        
        if self.debug:
            logger.debug(f"Найдено {len(approach_lines)} строк APPROACH для аэропорта {airport_code}")
            if approach_lines:
                logger.debug(f"Пример строки APPROACH: {approach_lines[0]}")
        
        # Группировка строк по имени процедуры
        for line in approach_lines:
            match = re.search(approach_pattern, line)
            if match:
                seq_num = match.group(1)
                approach_type = match.group(2)
                proc_name = match.group(3)
                transition = match.group(4)
                waypoint = match.group(5)
                
                # Ключ для процедуры: имя
                proc_key = proc_name
                
                if proc_key not in approach_procedures:
                    approach_procedures[proc_key] = {
                        'name': proc_name,
                        'type': approach_type,
                        'waypoints': []
                    }
                
                # Добавление путевой точки, если она не пустая
                if waypoint and waypoint.strip() != '':
                    # Парсинг дополнительных параметров
                    altitude_min = self._extract_altitude_min(line)
                    altitude_max = self._extract_altitude_max(line)
                    speed = self._extract_speed(line)
                    
                    waypoint_data = {
                        'name': waypoint,
                        'type': 'FLY_BY'
                    }
                    
                    if altitude_min:
                        waypoint_data['altitude_min'] = altitude_min
                    
                    if altitude_max:
                        waypoint_data['altitude_max'] = altitude_max
                    
                    if speed:
                        waypoint_data['speed'] = speed
                    
                    approach_procedures[proc_key]['waypoints'].append(waypoint_data)
        
        # Сохранение процедур APPROACH в структуре аэропорта
        for proc_key, proc_data in approach_procedures.items():
            self.airports[airport_code]['APPROACH'][proc_key] = proc_data
        
        logger.debug(f"Аэропорт {airport_code}: Обработано {len(approach_procedures)} APPROACH процедур")
        self.stats['total_procedures'] += len(approach_procedures)
    
    def _parse_runway_info(self, airport_code, content):
        """Парсинг информации о ВПП из содержимого файла CIFP"""
        # Регулярное выражение для поиска информации о ВПП
        runway_pattern = r'RWY:([^,]+).*?;([^;]+);'
        
        # Поиск всех строк RWY
        runway_matches = re.findall(runway_pattern, content)
        
        if self.debug:
            logger.debug(f"Найдено {len(runway_matches)} строк RWY для аэропорта {airport_code}")
            if runway_matches:
                logger.debug(f"Пример строки RWY: RWY:{runway_matches[0][0]}...;{runway_matches[0][1]};")
        
        # Обработка информации о ВПП
        for match in runway_matches:
            runway_name = match[0].strip()
            coords_str = match[1].strip()
            
            # Парсинг координат
            coords_match = re.search(r'N(\d+)W(\d+)|N(\d+)E(\d+)|S(\d+)W(\d+)|S(\d+)E(\d+)', coords_str)
            if coords_match:
                lat = 0.0
                lon = 0.0
                
                # Определение широты и долготы
                if coords_match.group(1) and coords_match.group(2):  # N/W
                    lat = self._parse_dms_to_decimal(coords_match.group(1))
                    lon = -self._parse_dms_to_decimal(coords_match.group(2))
                elif coords_match.group(3) and coords_match.group(4):  # N/E
                    lat = self._parse_dms_to_decimal(coords_match.group(3))
                    lon = self._parse_dms_to_decimal(coords_match.group(4))
                elif coords_match.group(5) and coords_match.group(6):  # S/W
                    lat = -self._parse_dms_to_decimal(coords_match.group(5))
                    lon = -self._parse_dms_to_decimal(coords_match.group(6))
                elif coords_match.group(7) and coords_match.group(8):  # S/E
                    lat = -self._parse_dms_to_decimal(coords_match.group(7))
                    lon = self._parse_dms_to_decimal(coords_match.group(8))
                
                # Проверка координат
                if self._is_valid_coordinate(lat, lon):
                    # Сохранение информации о ВПП
                    self.airports[airport_code]['RUNWAY'][runway_name] = {
                        'name': runway_name,
                        'lat': lat,
                        'lon': lon
                    }
                    
                    # Добавление ВПП как путевой точки
                    WAYPOINTS[runway_name] = {
                        'lat': lat,
                        'lon': lon,
                        'type': 'RWY'
                    }
                else:
                    logger.warning(f"Недопустимые координаты для ВПП {runway_name}: lat={lat}, lon={lon}")
        
        logger.debug(f"Аэропорт {airport_code}: Обработано {len(self.airports[airport_code]['RUNWAY'])} ВПП")
    
    def _collect_procedure_waypoints(self, airport_code):
        """Сбор всех путевых точек, используемых в процедурах аэропорта"""
        waypoints = set()
        
        # Сбор путевых точек из SID процедур
        for proc_name, proc_data in self.airports[airport_code]['SID'].items():
            for waypoint in proc_data['waypoints']:
                waypoints.add(waypoint['name'])
        
        # Сбор путевых точек из STAR процедур
        for proc_name, proc_data in self.airports[airport_code]['STAR'].items():
            for waypoint in proc_data['waypoints']:
                waypoints.add(waypoint['name'])
        
        # Сбор путевых точек из APPROACH процедур
        for proc_name, proc_data in self.airports[airport_code]['APPROACH'].items():
            for waypoint in proc_data['waypoints']:
                waypoints.add(waypoint['name'])
        
        # Сохранение информации о путевых точках
        for waypoint_name in waypoints:
            if waypoint_name in WAYPOINTS:
                self.airports[airport_code]['waypoints'][waypoint_name] = WAYPOINTS[waypoint_name]
            else:
                # Если координаты путевой точки неизвестны, создаем заглушку
                self.airports[airport_code]['waypoints'][waypoint_name] = {
                    'name': waypoint_name,
                    'type': 'FIX',
                    'lat': 0.0,
                    'lon': 0.0
                }
                
                # Выводим предупреждение о неизвестной путевой точке
                logger.warning(f"Аэропорт {airport_code}: Неизвестные координаты для путевой точки {waypoint_name}")
        
        logger.debug(f"Аэропорт {airport_code}: Собрано {len(self.airports[airport_code]['waypoints'])} путевых точек")
    
    def _verify_coordinates(self):
        """Проверка и исправление координат путевых точек"""
        global COORD_VERIFICATION_STATS
        
        logger.info("\nПроверка координат путевых точек...")
        
        # Сброс статистики
        COORD_VERIFICATION_STATS = {
            'total_waypoints': 0,
            'valid_coordinates': 0,
            'zero_coordinates': 0,
            'invalid_coordinates': 0,
            'fixed_coordinates': 0
        }
        
        # Проверка координат для всех аэропортов
        for airport_code, airport_data in self.airports.items():
            logger.debug(f"Проверка координат для аэропорта {airport_code}...")
            
            # Проверка координат путевых точек
            for waypoint_name, waypoint_data in airport_data['waypoints'].items():
                COORD_VERIFICATION_STATS['total_waypoints'] += 1
                
                lat = waypoint_data.get('lat', 0.0)
                lon = waypoint_data.get('lon', 0.0)
                
                # Проверка на нулевые координаты
                if lat == 0.0 and lon == 0.0:
                    COORD_VERIFICATION_STATS['zero_coordinates'] += 1
                    
                    # Попытка исправить координаты
                    fixed = self._fix_waypoint_coordinates(airport_code, waypoint_name)
                    if fixed:
                        COORD_VERIFICATION_STATS['fixed_coordinates'] += 1
                    
                    if self.debug:
                        if fixed:
                            logger.debug(f"Исправлены координаты для точки {waypoint_name}: lat={self.airports[airport_code]['waypoints'][waypoint_name]['lat']}, lon={self.airports[airport_code]['waypoints'][waypoint_name]['lon']}")
                        else:
                            logger.debug(f"Не удалось исправить координаты для точки {waypoint_name}")
                
                # Проверка на некорректные координаты
                elif not self._is_valid_coordinate(lat, lon):
                    COORD_VERIFICATION_STATS['invalid_coordinates'] += 1
                    
                    # Попытка исправить координаты
                    fixed = self._fix_waypoint_coordinates(airport_code, waypoint_name)
                    if fixed:
                        COORD_VERIFICATION_STATS['fixed_coordinates'] += 1
                    
                    if self.debug:
                        if fixed:
                            logger.debug(f"Исправлены координаты для точки {waypoint_name}: lat={self.airports[airport_code]['waypoints'][waypoint_name]['lat']}, lon={self.airports[airport_code]['waypoints'][waypoint_name]['lon']}")
                        else:
                            logger.debug(f"Не удалось исправить координаты для точки {waypoint_name}")
                else:
                    COORD_VERIFICATION_STATS['valid_coordinates'] += 1
        
        # Вывод статистики проверки координат
        logger.info(f"Всего проверено путевых точек: {COORD_VERIFICATION_STATS['total_waypoints']}")
        logger.info(f"Валидные координаты: {COORD_VERIFICATION_STATS['valid_coordinates']}")
        logger.info(f"Нулевые координаты: {COORD_VERIFICATION_STATS['zero_coordinates']}")
        logger.info(f"Некорректные координаты: {COORD_VERIFICATION_STATS['invalid_coordinates']}")
        logger.info(f"Исправлено координат: {COORD_VERIFICATION_STATS['fixed_coordinates']}")
    
    def _fix_waypoint_coordinates(self, airport_code, waypoint_name):
        """Попытка исправить координаты путевой точки"""
        # Проверка наличия точки в глобальном словаре WAYPOINTS
        if waypoint_name in WAYPOINTS:
            wp_data = WAYPOINTS[waypoint_name]
            lat = wp_data.get('lat', 0.0)
            lon = wp_data.get('lon', 0.0)
            
            # Проверка координат
            if self._is_valid_coordinate(lat, lon):
                # Обновление координат в данных аэропорта
                self.airports[airport_code]['waypoints'][waypoint_name]['lat'] = lat
                self.airports[airport_code]['waypoints'][waypoint_name]['lon'] = lon
                return True
        
        # Попытка найти координаты в данных ВПП
        if waypoint_name in self.airports[airport_code]['RUNWAY']:
            runway_data = self.airports[airport_code]['RUNWAY'][waypoint_name]
            lat = runway_data.get('lat', 0.0)
            lon = runway_data.get('lon', 0.0)
            
            # Проверка координат
            if self._is_valid_coordinate(lat, lon):
                # Обновление координат в данных аэропорта
                self.airports[airport_code]['waypoints'][waypoint_name]['lat'] = lat
                self.airports[airport_code]['waypoints'][waypoint_name]['lon'] = lon
                return True
        
        # Попытка найти координаты в данных других аэропортов
        for other_airport, other_data in self.airports.items():
            if other_airport == airport_code:
                continue
            
            if waypoint_name in other_data['waypoints']:
                other_wp_data = other_data['waypoints'][waypoint_name]
                lat = other_wp_data.get('lat', 0.0)
                lon = other_wp_data.get('lon', 0.0)
                
                # Проверка координат
                if self._is_valid_coordinate(lat, lon):
                    # Обновление координат в данных аэропорта
                    self.airports[airport_code]['waypoints'][waypoint_name]['lat'] = lat
                    self.airports[airport_code]['waypoints'][waypoint_name]['lon'] = lon
                    return True
        
        # Не удалось исправить координаты
        return False
    
    def _extract_altitude_min(self, line):
        """Извлечение минимальной высоты из строки CIFP"""
        match = re.search(r',\+,(\d+),', line)
        if match:
            return int(match.group(1))
        return None
    
    def _extract_altitude_max(self, line):
        """Извлечение максимальной высоты из строки CIFP"""
        match = re.search(r',(\d+),\s*,\s*,', line)
        if match:
            return int(match.group(1))
        return None
    
    def _extract_speed(self, line):
        """Извлечение ограничения скорости из строки CIFP"""
        match = re.search(r',-,(\d+),', line)
        if match:
            return int(match.group(1))
        return None
    
    def _parse_dms_to_decimal(self, dms_str):
        """Преобразование координат из формата DMS в десятичный формат"""
        if len(dms_str) >= 7:
            degrees = int(dms_str[0:2])
            minutes = int(dms_str[2:4])
            seconds = int(dms_str[4:6])
            decimal = float(f"0.{dms_str[6:]}")
            
            return degrees + minutes/60 + (seconds + decimal)/3600
        elif len(dms_str) >= 5:
            degrees = int(dms_str[0:2])
            minutes = int(dms_str[2:4])
            seconds = int(dms_str[4:])
            
            return degrees + minutes/60 + seconds/3600
        else:
            return float(dms_str)
    
    def _save_results(self):
        """Сохранение результатов парсинга"""
        # Определение принадлежности аэропортов к картам
        map_airports = defaultdict(list)
        
        for map_name, map_info in DCS_MAPS.items():
            for airport_code in map_info['airports']:
                if airport_code in self.airports:
                    map_airports[map_name].append(airport_code)
        
        # Сохранение данных по картам
        for map_name, airports_list in map_airports.items():
            map_dir = os.path.join(self.output_dir, map_name)
            
            # Сохранение списка аэропортов
            airports_file = os.path.join(map_dir, f"{map_name}_airports.json")
            with open(airports_file, 'w', encoding='utf-8') as f:
                json.dump(airports_list, f, indent=2, ensure_ascii=False)
            
            # Сохранение данных по аэропортам
            for airport_code in airports_list:
                self._save_airport_data(map_name, airport_code, map_dir)
            
            self.stats['maps'][map_name]['airports'] = len(airports_list)
            logger.info(f"Карта {map_name}: Сохранено данных для {len(airports_list)} аэропортов")
    
    def _save_airport_data(self, map_name, airport_code, map_dir):
        """Сохранение данных по аэропорту"""
        # Создание директории для аэропорта
        airport_dir = os.path.join(map_dir, airport_code)
        if not os.path.exists(airport_dir):
            os.makedirs(airport_dir)
        
        # Сохранение процедур SID
        sid_file = os.path.join(airport_dir, f"{airport_code}_SID.json")
        with open(sid_file, 'w', encoding='utf-8') as f:
            json.dump(self.airports[airport_code]['SID'], f, indent=2, ensure_ascii=False)
        
        # Сохранение процедур STAR
        star_file = os.path.join(airport_dir, f"{airport_code}_STAR.json")
        with open(star_file, 'w', encoding='utf-8') as f:
            json.dump(self.airports[airport_code]['STAR'], f, indent=2, ensure_ascii=False)
        
        # Сохранение процедур APPROACH
        approach_file = os.path.join(airport_dir, f"{airport_code}_APPROACH.json")
        with open(approach_file, 'w', encoding='utf-8') as f:
            json.dump(self.airports[airport_code]['APPROACH'], f, indent=2, ensure_ascii=False)
        
        # Сохранение информации о ВПП
        runway_file = os.path.join(airport_dir, f"{airport_code}_RUNWAY.json")
        with open(runway_file, 'w', encoding='utf-8') as f:
            json.dump(self.airports[airport_code]['RUNWAY'], f, indent=2, ensure_ascii=False)
        
        # Сохранение информации о путевых точках
        waypoints_file = os.path.join(airport_dir, f"{airport_code}_waypoints.json")
        with open(waypoints_file, 'w', encoding='utf-8') as f:
            json.dump(self.airports[airport_code]['waypoints'], f, indent=2, ensure_ascii=False)
        
        # Сохранение общего файла с данными аэропорта
        airport_file = os.path.join(airport_dir, f"{airport_code}_data.json")
        with open(airport_file, 'w', encoding='utf-8') as f:
            json.dump(self.airports[airport_code], f, indent=2, ensure_ascii=False)
        
        # Создание файла с данными в формате Lua для MOOSE
        self._create_moose_lua_file(map_name, airport_code, airport_dir)
        
        # Обновление статистики
        self.stats['maps'][map_name]['procedures'] += (
            len(self.airports[airport_code]['SID']) +
            len(self.airports[airport_code]['STAR']) +
            len(self.airports[airport_code]['APPROACH'])
        )
        self.stats['maps'][map_name]['waypoints'] += len(self.airports[airport_code]['waypoints'])
    
    def _create_moose_lua_file(self, map_name, airport_code, airport_dir):
        """Создание файла с данными в формате Lua для MOOSE"""
        lua_file = os.path.join(airport_dir, f"{airport_code}_MOOSE.lua")
        
        with open(lua_file, 'w', encoding='utf-8') as f:
            # Заголовок файла
            f.write(f"-- Файл данных аэропорта {airport_code} для MOOSE Framework\n")
            f.write(f"-- Карта: {map_name}\n")
            f.write(f"-- Создан: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write(f"-- Специализированный парсер CIFP v{VERSION}\n\n")
            
            # Объявление таблицы аэропорта
            f.write(f"{airport_code} = {{\n")
            
            # Путевые точки
            f.write("  Waypoints = {\n")
            for name, data in self.airports[airport_code]['waypoints'].items():
                f.write(f"    [\"{name}\"] = {{ lat = {data['lat']}, lon = {data['lon']}")
                if 'type' in data:
                    f.write(f", type = \"{data['type']}\"")
                if 'frequency' in data:
                    f.write(f", frequency = {data['frequency']}")
                f.write(" },\n")
            f.write("  },\n\n")
            
            # ВПП
            f.write("  Runways = {\n")
            for name, data in self.airports[airport_code]['RUNWAY'].items():
                f.write(f"    [\"{name}\"] = {{ lat = {data['lat']}, lon = {data['lon']}, name = \"{name}\" }},\n")
            f.write("  },\n\n")
            
            # Процедуры SID
            f.write("  SID = {\n")
            for name, data in self.airports[airport_code]['SID'].items():
                f.write(f"    [\"{name}\"] = {{\n")
                f.write(f"      name = \"{data['name']}\",\n")
                f.write(f"      runway = \"{data['runway']}\",\n")
                f.write("      waypoints = {\n")
                for wp in data['waypoints']:
                    f.write(f"        {{ name = \"{wp['name']}\", type = \"{wp['type']}\"")
                    if 'altitude_min' in wp:
                        f.write(f", altitude_min = {wp['altitude_min']}")
                    if 'altitude_max' in wp:
                        f.write(f", altitude_max = {wp['altitude_max']}")
                    if 'speed' in wp:
                        f.write(f", speed = {wp['speed']}")
                    f.write(" },\n")
                f.write("      }\n")
                f.write("    },\n")
            f.write("  },\n\n")
            
            # Процедуры STAR
            f.write("  STAR = {\n")
            for name, data in self.airports[airport_code]['STAR'].items():
                f.write(f"    [\"{name}\"] = {{\n")
                f.write(f"      name = \"{data['name']}\",\n")
                f.write(f"      runway = \"{data['runway']}\",\n")
                f.write("      waypoints = {\n")
                for wp in data['waypoints']:
                    f.write(f"        {{ name = \"{wp['name']}\", type = \"{wp['type']}\"")
                    if 'altitude_min' in wp:
                        f.write(f", altitude_min = {wp['altitude_min']}")
                    if 'altitude_max' in wp:
                        f.write(f", altitude_max = {wp['altitude_max']}")
                    if 'speed' in wp:
                        f.write(f", speed = {wp['speed']}")
                    f.write(" },\n")
                f.write("      }\n")
                f.write("    },\n")
            f.write("  },\n\n")
            
            # Процедуры APPROACH
            f.write("  APPROACH = {\n")
            for name, data in self.airports[airport_code]['APPROACH'].items():
                f.write(f"    [\"{name}\"] = {{\n")
                f.write(f"      name = \"{data['name']}\",\n")
                f.write(f"      type = \"{data['type']}\",\n")
                f.write("      waypoints = {\n")
                for wp in data['waypoints']:
                    f.write(f"        {{ name = \"{wp['name']}\", type = \"{wp['type']}\"")
                    if 'altitude_min' in wp:
                        f.write(f", altitude_min = {wp['altitude_min']}")
                    if 'altitude_max' in wp:
                        f.write(f", altitude_max = {wp['altitude_max']}")
                    if 'speed' in wp:
                        f.write(f", speed = {wp['speed']}")
                    f.write(" },\n")
                f.write("      }\n")
                f.write("    },\n")
            f.write("  }\n")
            
            # Закрытие таблицы аэропорта
            f.write("}\n\n")
            
            # Возврат таблицы
            f.write(f"return {airport_code}\n")
    
    def _print_stats(self):
        """Вывод статистики парсинга"""
        logger.info("\n=== Статистика парсинга ===")
        logger.info(f"Всего обработано:")
        logger.info(f"  Аэропортов: {self.stats['total_airports']}")
        logger.info(f"  Процедур: {self.stats['total_procedures']}")
        logger.info(f"  Путевых точек: {self.stats['total_waypoints']}")
        
        logger.info("\nСтатистика по картам:")
        for map_name, map_stats in self.stats['maps'].items():
            if map_stats['airports'] > 0:
                logger.info(f"\n  {map_name}:")
                logger.info(f"    Аэропортов: {map_stats['airports']}")
                logger.info(f"    Процедур: {map_stats['procedures']}")
                logger.info(f"    Путевых точек: {map_stats['waypoints']}")
        
        if self.verify:
            logger.info("\n=== Статистика проверки координат ===")
            logger.info(f"Всего проверено путевых точек: {COORD_VERIFICATION_STATS['total_waypoints']}")
            logger.info(f"Валидные координаты: {COORD_VERIFICATION_STATS['valid_coordinates']}")
            logger.info(f"Нулевые координаты: {COORD_VERIFICATION_STATS['zero_coordinates']}")
            logger.info(f"Некорректные координаты: {COORD_VERIFICATION_STATS['invalid_coordinates']}")
            logger.info(f"Исправлено координат: {COORD_VERIFICATION_STATS['fixed_coordinates']}")


def create_manual_waypoints_template():
    """Создание шаблона CSV файла для ручного ввода координат путевых точек"""
    template_file = "manual_waypoints_template.csv"
    
    with open(template_file, 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(['name', 'lat', 'lon', 'type', 'frequency', 'elevation'])
        writer.writerow(['ANVIX', '25.123456', '55.654321', 'FIX', '', ''])
        writer.writerow(['GONVI', '25.234567', '55.765432', 'FIX', '', ''])
        writer.writerow(['RAV', '25.345678', '55.876543', 'VOR', '114.9', '100'])
        writer.writerow(['ISRE', '25.456789', '55.987654', 'ILS', '110.3', '50'])
    
    print(f"Шаблон для ручного ввода координат создан: {template_file}")
    print("Заполните его и используйте с опцией -m / --manual")


def main():
    """Основная функция"""
    # Парсинг аргументов командной строки
    parser = argparse.ArgumentParser(
        description=f"Специализированный парсер CIFP v{VERSION} для DCS World",
        formatter_class=argparse.RawTextHelpFormatter
    )
    
    parser.add_argument(
        "-i", "--input", 
        required=True,
        help="Путь к директории с файлами Navigraph AIRAC"
    )
    
    parser.add_argument(
        "-o", "--output", 
        required=True,
        help="Путь к директории для сохранения результатов"
    )
    
    parser.add_argument(
        "-d", "--debug",
        action="store_true",
        help="Включить режим отладки с подробным выводом"
    )
    
    parser.add_argument(
        "-n", "--no-filter",
        action="store_true",
        help="Отключить фильтрацию по координатам карт DCS World"
    )
    
    parser.add_argument(
        "-m", "--manual",
        help="Путь к файлу с ручными данными о путевых точках (CSV или JSON)"
    )
    
    parser.add_argument(
        "-v", "--verify",
        action="store_true",
        help="Включить проверку и исправление координат"
    )
    
    parser.add_argument(
        "-t", "--template",
        action="store_true",
        help="Создать шаблон CSV файла для ручного ввода координат путевых точек"
    )
    
    parser.add_argument(
        "--version", 
        action="version",
        version=f"Специализированный парсер CIFP v{VERSION}"
    )
    
    # args = parser.parse_args()
    args = type('Args', (), {
        'input': "/Users/aviskrich/Downloads",
        'output': "/Users/aviskrich/PROJECTS/DCS/Missions/DCS-LUA/DCS ATC/AIRAC Data",
        'debug': False,
        'no_filter': False,
        'manual': None,
        'template': None,
        'verify': False
    })()

    # Создание шаблона для ручного ввода координат
    if args.template:
        create_manual_waypoints_template()
        return    

    parser = CIFPParser(args.input, args.output, args.debug, args.no_filter, args.manual, args.verify)
    parser.run()


if __name__ == "__main__":
    # Импорт модуля math для проверки координат
    import math
    main()
