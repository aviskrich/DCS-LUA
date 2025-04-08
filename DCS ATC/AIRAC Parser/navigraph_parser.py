#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Navigraph AIRAC Parser для DCS World

Этот скрипт парсит данные Navigraph AIRAC и создает файлы с навигационными данными
для карт DCS World (Caucasus, Persian Gulf, Syria) и их аэропортов.

Автор: AVIskrich
Дата: Апрель 2025
"""

import os
import sys
import json
import argparse
import zipfile
import re
from collections import defaultdict
from datetime import datetime

# Версия парсера
VERSION = "1.0.0"

# Координаты регионов карт DCS World (примерные границы)
DCS_MAPS = {
    "Caucasus": {
        "lat_min": 41.0,
        "lat_max": 45.5,
        "lon_min": 37.0,
        "lon_max": 44.0,
        "airports": [
            "UGKO", "URKA", "URMM", "URSS", "URKK", "URKG", "URMG", "URMO", 
            "UGGG", "UGSB", "UGEE", "UGKS", "UGTB", "UGSA", "URKA", "URKH",
            "URKW", "URSS", "URWA", "URWI", "URWW"
        ]
    },
    "PersianGulf": {
        "lat_min": 22.0,
        "lat_max": 31.0,
        "lon_min": 50.0,
        "lon_max": 64.0,
        "airports": [
            "OIKB", "OIIE", "OISS", "OIKK", "OIFM", "OIKQ", "OICC", "OIII",
            "OBBI", "OBBS", "OMDW", "OMDB", "OMAA", "OMAL", "OMSJ", "OMRK",
            "OMDM", "OKBK", "OOKB", "OOMA", "OOTH", "OTBD", "OIBK", "OISS"
        ]
    },
    "Syria": {
        "lat_min": 32.0,
        "lat_max": 38.0,
        "lon_min": 32.0,
        "lon_max": 40.0,
        "airports": [
            "OSDI", "OSLK", "OSAP", "OSDZ", "OSKL", "OSLK", "OSPR", "LTAG",
            "LTAK", "LTCC", "LCRA", "LCEN", "LCPH", "LLBG", "LLJR", "LLHA",
            "OJAM", "OJAQ", "OJMF", "OLBA", "LCLK", "LCPH"
        ]
    }
}

class NavigraphParser:
    """Основной класс парсера данных Navigraph AIRAC"""
    
    def __init__(self, input_dir, output_dir):
        """
        Инициализация парсера
        
        Args:
            input_dir (str): Путь к директории с файлами Navigraph AIRAC
            output_dir (str): Путь к директории для сохранения результатов
        """
        self.input_dir = os.path.abspath(input_dir)
        self.output_dir = os.path.abspath(output_dir)
        
        # Пути к файлам данных
        self.fix_file = os.path.join(self.input_dir, "earth_fix.dat")
        self.nav_file = os.path.join(self.input_dir, "earth_nav.dat")
        self.awy_file = os.path.join(self.input_dir, "earth_awy.dat")
        self.cifp_dir = os.path.join(self.input_dir, "CIFP")
        self.cifp_zip = os.path.join(self.input_dir, "CIFP.zip")
        
        # Структуры данных для хранения результатов парсинга
        self.waypoints = {}  # Все путевые точки
        self.navaids = {}    # Все навигационные средства
        self.airways = {}    # Все воздушные трассы
        self.procedures = defaultdict(lambda: defaultdict(dict))  # Процедуры по аэропортам
        
        # Данные по картам
        self.map_data = defaultdict(lambda: defaultdict(dict))
        
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
        print(f"Navigraph AIRAC Parser v{VERSION}")
        print(f"Входная директория: {self.input_dir}")
        print(f"Выходная директория: {self.output_dir}")
        
        # Проверка наличия файлов
        self._check_files()
        
        # Распаковка CIFP.zip если нужно
        self._extract_cifp_if_needed()
        
        # Парсинг данных
        print("\nПарсинг данных...")
        self._parse_fixes()
        self._parse_navaids()
        self._parse_airways()
        self._parse_procedures()
        
        # Обработка данных по картам
        print("\nОбработка данных по картам DCS World...")
        self._process_map_data()
        
        # Сохранение результатов
        print("\nСохранение результатов...")
        self._save_results()
        
        print("\nПарсинг завершен успешно!")
        print(f"Результаты сохранены в директории: {self.output_dir}")
    
    def _check_files(self):
        """Проверка наличия необходимых файлов"""
        print("\nПроверка наличия файлов...")
        
        missing_files = []
        
        if not os.path.exists(self.fix_file):
            missing_files.append("earth_fix.dat")
        
        if not os.path.exists(self.nav_file):
            missing_files.append("earth_nav.dat")
        
        if not os.path.exists(self.awy_file):
            missing_files.append("earth_awy.dat")
        
        if not os.path.exists(self.cifp_dir) and not os.path.exists(self.cifp_zip):
            missing_files.append("CIFP (директория или архив CIFP.zip)")
        
        if missing_files:
            print("ОШИБКА: Отсутствуют следующие файлы:")
            for file in missing_files:
                print(f"  - {file}")
            print(f"\nУбедитесь, что все необходимые файлы находятся в директории: {self.input_dir}")
            sys.exit(1)
        
        print("Все необходимые файлы найдены.")
    
    def _extract_cifp_if_needed(self):
        """Распаковка архива CIFP.zip если директория CIFP отсутствует"""
        if not os.path.exists(self.cifp_dir) and os.path.exists(self.cifp_zip):
            print("\nРаспаковка архива CIFP.zip...")
            try:
                with zipfile.ZipFile(self.cifp_zip, 'r') as zip_ref:
                    zip_ref.extractall(self.input_dir)
                print("Архив CIFP.zip успешно распакован.")
            except Exception as e:
                print(f"ОШИБКА при распаковке архива CIFP.zip: {str(e)}")
                sys.exit(1)
    
    def _parse_fixes(self):
        """Парсинг путевых точек из файла earth_fix.dat"""
        print("Парсинг путевых точек (earth_fix.dat)...")
        
        count = 0
        try:
            with open(self.fix_file, 'r', encoding='utf-8') as f:
                for line in f:
                    if line.startswith('1 '):
                        parts = line.strip().split()
                        if len(parts) >= 6:
                            lat = float(parts[1])
                            lon = float(parts[2])
                            name = parts[5]
                            
                            self.waypoints[name] = {
                                'lat': lat,
                                'lon': lon,
                                'type': 'FIX'
                            }
                            count += 1
        except Exception as e:
            print(f"ОШИБКА при парсинге файла earth_fix.dat: {str(e)}")
            sys.exit(1)
        
        print(f"Обработано {count} путевых точек.")
    
    def _parse_navaids(self):
        """Парсинг навигационных средств из файла earth_nav.dat"""
        print("Парсинг навигационных средств (earth_nav.dat)...")
        
        count = 0
        try:
            with open(self.nav_file, 'r', encoding='utf-8') as f:
                for line in f:
                    first_char = line[0] if line else ''
                    
                    if first_char in ['2', '3', '4', '5', '6', '12', '13']:
                        parts = line.strip().split()
                        if len(parts) >= 9:
                            nav_type = parts[0]
                            lat = float(parts[1])
                            lon = float(parts[2])
                            elevation = float(parts[3])
                            frequency = float(parts[4])
                            range_nm = float(parts[5])
                            name = parts[7]
                            
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
                            
                            self.navaids[name] = {
                                'lat': lat,
                                'lon': lon,
                                'elevation': elevation,
                                'frequency': frequency,
                                'range': range_nm,
                                'type': type_name
                            }
                            count += 1
        except Exception as e:
            print(f"ОШИБКА при парсинге файла earth_nav.dat: {str(e)}")
            sys.exit(1)
        
        print(f"Обработано {count} навигационных средств.")
    
    def _parse_airways(self):
        """Парсинг воздушных трасс из файла earth_awy.dat"""
        print("Парсинг воздушных трасс (earth_awy.dat)...")
        
        count = 0
        try:
            with open(self.awy_file, 'r', encoding='utf-8') as f:
                for line in f:
                    if line.startswith('1 '):
                        parts = line.strip().split()
                        if len(parts) >= 4:
                            awy_name = parts[1]
                            fix1 = parts[2]
                            fix2 = parts[3]
                            
                            if awy_name not in self.airways:
                                self.airways[awy_name] = {
                                    'name': awy_name,
                                    'segments': []
                                }
                            
                            self.airways[awy_name]['segments'].append({
                                'from': fix1,
                                'to': fix2
                            })
                            count += 1
        except Exception as e:
            print(f"ОШИБКА при парсинге файла earth_awy.dat: {str(e)}")
            sys.exit(1)
        
        print(f"Обработано {count} сегментов воздушных трасс.")
    
    def _parse_procedures(self):
        """Парсинг процедур SID/STAR/Approach из файлов CIFP/*.dat"""
        print("Парсинг процедур SID/STAR/Approach (CIFP/*.dat)...")
        
        if not os.path.exists(self.cifp_dir):
            print("ОШИБКА: Директория CIFP не найдена.")
            return
        
        count = 0
        airports_count = 0
        
        # Получаем список всех аэропортов из всех карт
        all_dcs_airports = []
        for map_data in DCS_MAPS.values():
            all_dcs_airports.extend(map_data['airports'])
        
        # Удаляем дубликаты
        all_dcs_airports = list(set(all_dcs_airports))
        
        try:
            # Перебираем все файлы в директории CIFP
            for filename in os.listdir(self.cifp_dir):
                if not filename.endswith('.dat'):
                    continue
                
                airport_code = filename.split('.')[0]
                
                # Пропускаем аэропорты, которых нет в DCS World
                if airport_code not in all_dcs_airports:
                    continue
                
                airports_count += 1
                
                # Инициализация структуры для аэропорта
                if airport_code not in self.procedures:
                    self.procedures[airport_code] = {
                        'SID': {},
                        'STAR': {},
                        'APPROACH': {}
                    }
                
                file_path = os.path.join(self.cifp_dir, filename)
                
                with open(file_path, 'r', encoding='utf-8') as f:
                    current_proc = None
                    current_type = None
                    current_runway = None
                    
                    for line in f:
                        parts = line.strip().split()
                        
                        if len(parts) < 3 or parts[0] != 'SUSAP' or parts[1] != airport_code:
                            continue
                        
                        if parts[2] == 'RUNWAY':
                            # Информация о ВПП
                            current_runway = parts[3]
                            
                        elif parts[2] == 'SID' and len(parts) >= 5:
                            # SID процедура
                            current_type = 'SID'
                            if parts[3].startswith('RWY'):
                                current_runway = parts[3][3:]
                            else:
                                current_runway = None
                                
                            proc_name = parts[4]
                            
                            if proc_name not in self.procedures[airport_code]['SID']:
                                self.procedures[airport_code]['SID'][proc_name] = {
                                    'name': proc_name,
                                    'runway': current_runway,
                                    'waypoints': []
                                }
                            
                            current_proc = self.procedures[airport_code]['SID'][proc_name]
                            
                            # Добавление первой точки
                            if len(parts) > 5:
                                current_proc['waypoints'].append({
                                    'name': parts[5],
                                    'type': 'FLY_BY'
                                })
                            
                        elif parts[2] == 'STAR' and len(parts) >= 5:
                            # STAR процедура
                            current_type = 'STAR'
                            if parts[3].startswith('RWY'):
                                current_runway = parts[3][3:]
                            else:
                                current_runway = None
                                
                            proc_name = parts[4]
                            
                            if proc_name not in self.procedures[airport_code]['STAR']:
                                self.procedures[airport_code]['STAR'][proc_name] = {
                                    'name': proc_name,
                                    'runway': current_runway,
                                    'waypoints': []
                                }
                            
                            current_proc = self.procedures[airport_code]['STAR'][proc_name]
                            
                            # Добавление первой точки
                            if len(parts) > 5:
                                current_proc['waypoints'].append({
                                    'name': parts[5],
                                    'type': 'FLY_BY'
                                })
                            
                        elif parts[2] == 'APPROACH' and len(parts) >= 5:
                            # Процедура захода на посадку
                            current_type = 'APPROACH'
                            approach_type = parts[3]
                            
                            if len(parts) > 4 and parts[4].startswith('RWY'):
                                current_runway = parts[4][3:]
                            else:
                                current_runway = None
                            
                            if approach_type not in self.procedures[airport_code]['APPROACH']:
                                self.procedures[airport_code]['APPROACH'][approach_type] = {
                                    'name': approach_type,
                                    'runway': current_runway,
                                    'waypoints': []
                                }
                            
                            current_proc = self.procedures[airport_code]['APPROACH'][approach_type]
                            
                        elif current_proc and parts[2] == 'SEQPT' and len(parts) >= 5:
                            # Точка процедуры
                            current_proc['waypoints'].append({
                                'name': parts[4],
                                'type': 'FLY_BY'
                            })
                            count += 1
        
        except Exception as e:
            print(f"ОШИБКА при парсинге процедур: {str(e)}")
            sys.exit(1)
        
        print(f"Обработано {count} точек процедур для {airports_count} аэропортов.")
    
    def _process_map_data(self):
        """Обработка данных по картам DCS World"""
        for map_name, map_info in DCS_MAPS.items():
            print(f"Обработка карты {map_name}...")
            
            # Фильтрация путевых точек по координатам карты
            map_waypoints = {}
            for name, wp in self.waypoints.items():
                if (map_info['lat_min'] <= wp['lat'] <= map_info['lat_max'] and
                    map_info['lon_min'] <= wp['lon'] <= map_info['lon_max']):
                    map_waypoints[name] = wp
            
            # Фильтрация навигационных средств по координатам карты
            map_navaids = {}
            for name, nav in self.navaids.items():
                if (map_info['lat_min'] <= nav['lat'] <= map_info['lat_max'] and
                    map_info['lon_min'] <= nav['lon'] <= map_info['lon_max']):
                    map_navaids[name] = nav
            
            # Фильтрация воздушных трасс, проходящих через карту
            map_airways = {}
            for name, awy in self.airways.items():
                map_segments = []
                for segment in awy['segments']:
                    from_fix = segment['from']
                    to_fix = segment['to']
                    
                    # Проверяем, находятся ли точки в пределах карты
                    if (from_fix in map_waypoints or from_fix in map_navaids or
                        to_fix in map_waypoints or to_fix in map_navaids):
                        map_segments.append(segment)
                
                if map_segments:
                    map_airways[name] = {
                        'name': name,
                        'segments': map_segments
                    }
            
            # Фильтрация процедур для аэропортов карты
            map_procedures = {}
            for airport_code in map_info['airports']:
                if airport_code in self.procedures:
                    map_procedures[airport_code] = self.procedures[airport_code]
            
            # Сохранение данных карты
            self.map_data[map_name] = {
                'waypoints': map_waypoints,
                'navaids': map_navaids,
                'airways': map_airways,
                'procedures': map_procedures
            }
            
            print(f"  Путевые точки: {len(map_waypoints)}")
            print(f"  Навигационные средства: {len(map_navaids)}")
            print(f"  Воздушные трассы: {len(map_airways)}")
            print(f"  Аэропорты с процедурами: {len(map_procedures)}")
    
    def _save_results(self):
        """Сохранение результатов парсинга"""
        # Сохранение данных по картам
        for map_name, map_data in self.map_data.items():
            map_dir = os.path.join(self.output_dir, map_name)
            
            # Сохранение общих данных карты
            self._save_map_data(map_name, map_data, map_dir)
            
            # Сохранение данных по аэропортам
            for airport_code, procedures in map_data['procedures'].items():
                self._save_airport_data(map_name, airport_code, procedures, map_dir)
    
    def _save_map_data(self, map_name, map_data, map_dir):
        """Сохранение общих данных карты"""
        # Сохранение путевых точек
        waypoints_file = os.path.join(map_dir, f"{map_name}_waypoints.json")
        with open(waypoints_file, 'w', encoding='utf-8') as f:
            json.dump(map_data['waypoints'], f, indent=2, ensure_ascii=False)
        
        # Сохранение навигационных средств
        navaids_file = os.path.join(map_dir, f"{map_name}_navaids.json")
        with open(navaids_file, 'w', encoding='utf-8') as f:
            json.dump(map_data['navaids'], f, indent=2, ensure_ascii=False)
        
        # Сохранение воздушных трасс
        airways_file = os.path.join(map_dir, f"{map_name}_airways.json")
        with open(airways_file, 'w', encoding='utf-8') as f:
            json.dump(map_data['airways'], f, indent=2, ensure_ascii=False)
        
        # Сохранение списка аэропортов с процедурами
        airports_file = os.path.join(map_dir, f"{map_name}_airports.json")
        airports_list = list(map_data['procedures'].keys())
        with open(airports_file, 'w', encoding='utf-8') as f:
            json.dump(airports_list, f, indent=2, ensure_ascii=False)
        
        print(f"Сохранены общие данные для карты {map_name}.")
    
    def _save_airport_data(self, map_name, airport_code, procedures, map_dir):
        """Сохранение данных по аэропорту"""
        # Создание директории для аэропорта
        airport_dir = os.path.join(map_dir, airport_code)
        if not os.path.exists(airport_dir):
            os.makedirs(airport_dir)
        
        # Сохранение процедур SID
        sid_file = os.path.join(airport_dir, f"{airport_code}_SID.json")
        with open(sid_file, 'w', encoding='utf-8') as f:
            json.dump(procedures['SID'], f, indent=2, ensure_ascii=False)
        
        # Сохранение процедур STAR
        star_file = os.path.join(airport_dir, f"{airport_code}_STAR.json")
        with open(star_file, 'w', encoding='utf-8') as f:
            json.dump(procedures['STAR'], f, indent=2, ensure_ascii=False)
        
        # Сохранение процедур захода на посадку
        approach_file = os.path.join(airport_dir, f"{airport_code}_APPROACH.json")
        with open(approach_file, 'w', encoding='utf-8') as f:
            json.dump(procedures['APPROACH'], f, indent=2, ensure_ascii=False)
        
        # Сохранение общего файла с процедурами
        all_procedures_file = os.path.join(airport_dir, f"{airport_code}_procedures.json")
        with open(all_procedures_file, 'w', encoding='utf-8') as f:
            json.dump(procedures, f, indent=2, ensure_ascii=False)
        
        # Создание файла с информацией о путевых точках процедур
        procedure_waypoints = set()
        
        # Сбор всех путевых точек из процедур
        for proc_type in ['SID', 'STAR', 'APPROACH']:
            for proc_name, proc_data in procedures[proc_type].items():
                for waypoint in proc_data['waypoints']:
                    procedure_waypoints.add(waypoint['name'])
        
        # Сбор данных о путевых точках
        waypoints_data = {}
        for wp_name in procedure_waypoints:
            if wp_name in self.waypoints:
                waypoints_data[wp_name] = self.waypoints[wp_name]
            elif wp_name in self.navaids:
                waypoints_data[wp_name] = self.navaids[wp_name]
        
        # Сохранение данных о путевых точках
        waypoints_file = os.path.join(airport_dir, f"{airport_code}_waypoints.json")
        with open(waypoints_file, 'w', encoding='utf-8') as f:
            json.dump(waypoints_data, f, indent=2, ensure_ascii=False)
        
        print(f"Сохранены данные для аэропорта {airport_code} на карте {map_name}.")
        
        # Создание файла с данными в формате Lua для MOOSE
        self._create_moose_lua_file(map_name, airport_code, procedures, waypoints_data, airport_dir)
    
    def _create_moose_lua_file(self, map_name, airport_code, procedures, waypoints_data, airport_dir):
        """Создание файла с данными в формате Lua для MOOSE"""
        lua_file = os.path.join(airport_dir, f"{airport_code}_MOOSE.lua")
        
        with open(lua_file, 'w', encoding='utf-8') as f:
            # Заголовок файла
            f.write(f"-- Файл данных аэропорта {airport_code} для MOOSE Framework\n")
            f.write(f"-- Карта: {map_name}\n")
            f.write(f"-- Создан: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write(f"-- Navigraph AIRAC Parser v{VERSION}\n\n")
            
            # Объявление таблицы аэропорта
            f.write(f"{airport_code} = {{\n")
            
            # Путевые точки
            f.write("  Waypoints = {\n")
            for name, data in waypoints_data.items():
                f.write(f"    [\"{name}\"] = {{ lat = {data['lat']}, lon = {data['lon']}")
                if 'type' in data:
                    f.write(f", type = \"{data['type']}\"")
                if 'frequency' in data:
                    f.write(f", frequency = {data['frequency']}")
                f.write(" },\n")
            f.write("  },\n\n")
            
            # Процедуры SID
            f.write("  SID = {\n")
            for name, data in procedures['SID'].items():
                f.write(f"    [\"{name}\"] = {{\n")
                f.write(f"      name = \"{name}\",\n")
                if data['runway']:
                    f.write(f"      runway = \"{data['runway']}\",\n")
                f.write("      waypoints = {\n")
                for wp in data['waypoints']:
                    f.write(f"        {{ name = \"{wp['name']}\", type = \"{wp['type']}\" }},\n")
                f.write("      }\n")
                f.write("    },\n")
            f.write("  },\n\n")
            
            # Процедуры STAR
            f.write("  STAR = {\n")
            for name, data in procedures['STAR'].items():
                f.write(f"    [\"{name}\"] = {{\n")
                f.write(f"      name = \"{name}\",\n")
                if data['runway']:
                    f.write(f"      runway = \"{data['runway']}\",\n")
                f.write("      waypoints = {\n")
                for wp in data['waypoints']:
                    f.write(f"        {{ name = \"{wp['name']}\", type = \"{wp['type']}\" }},\n")
                f.write("      }\n")
                f.write("    },\n")
            f.write("  },\n\n")
            
            # Процедуры захода на посадку
            f.write("  APPROACH = {\n")
            for name, data in procedures['APPROACH'].items():
                f.write(f"    [\"{name}\"] = {{\n")
                f.write(f"      name = \"{name}\",\n")
                if data['runway']:
                    f.write(f"      runway = \"{data['runway']}\",\n")
                f.write("      waypoints = {\n")
                for wp in data['waypoints']:
                    f.write(f"        {{ name = \"{wp['name']}\", type = \"{wp['type']}\" }},\n")
                f.write("      }\n")
                f.write("    },\n")
            f.write("  }\n")
            
            # Закрытие таблицы аэропорта
            f.write("}\n\n")
            
            # Возврат таблицы
            f.write(f"return {airport_code}\n")
        
        print(f"Создан Lua файл для аэропорта {airport_code} на карте {map_name}.")


def main():
    """Основная функция"""
    # Парсинг аргументов командной строки
    parser = argparse.ArgumentParser(
        description=f"Navigraph AIRAC Parser v{VERSION} для DCS World",
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
        "-v", "--version", 
        action="version",
        version=f"Navigraph AIRAC Parser v{VERSION}"
    )
    
    args = parser.parse_args()
    
    # Запуск парсера
    parser = NavigraphParser(args.input, args.output)
    parser.run()


if __name__ == "__main__":
    main()
