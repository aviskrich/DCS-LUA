--TTI SP MT HOTFIX

if tti_sp_mt_hotfix == true then
enable_random_lha_rat_helo = false
tti.debug("TTI SP MT Hotfix Enabled!")
end

if env.mission.theatre == "Caucasus" then
airbase_blue_fighter_1 = "Gudauta"
airbase_blue_fighter_2 = "Gudauta"
airbase_blue_civ_1 = "Sochi-Adler"
airbase_blue_civ_2 = "Sochi-Adler"
--airbase_blue_civ_2 = "Tbilisi-Lochini"
airbase_blue_mil_1 = "Gudauta"
airbase_blue_mil_2 = "Gudauta"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "hot"
airbase_blue_mil_takeoff = "hot"

-----REDFOR

airbase_red_1 = "Krasnodar-Center"
airbase_red_2 = "Krasnodar-Pashkovsky"
airbase_red_3 = "Mozdok"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "SinaiMap" and sinai_map_type == "sinai_cairo" then
airbase_blue_fighter_1 = "Inshas Airbase"
airbase_blue_fighter_2 = "Bilbeis Air Base"
airbase_blue_civ_1 = "Cairo International Airport"
airbase_blue_civ_2 = "Cairo International Airport"
--airbase_blue_civ_2 = "Tbilisi-Lochini"
airbase_blue_mil_1 = "Inshas Airbase"
airbase_blue_mil_2 = "Bilbeis Air Base"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "hot"
airbase_blue_mil_takeoff = "hot"

-----REDFOR

airbase_red_1 = "Ovda"
airbase_red_2 = "Ovda"
airbase_red_3 = "St Catherine"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "SinaiMap" and sinai_map_type == "sinai_north" then
airbase_blue_fighter_1 = "Tel Nof"
airbase_blue_fighter_2 = "Tel Nof"
airbase_blue_civ_1 = "Ben-Gurion"
airbase_blue_civ_2 = "Hatzor"
--airbase_blue_civ_2 = "Tbilisi-Lochini"
airbase_blue_mil_1 = "Tel Nof"
airbase_blue_mil_2 = "Tel Nof"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "runway"
airbase_blue_mil_takeoff = "runway"

-----REDFOR

airbase_red_1 = "Al Mansurah"
airbase_red_2 = "Cairo West"
airbase_red_3 = "Cairo West"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end


if env.mission.theatre == "MarianaIslands" then
airbase_blue_fighter_1 = "Andersen AFB"
airbase_blue_fighter_2 = "Andersen AFB"
airbase_blue_civ_1 = "Antonio B. Won Pat Intl"
airbase_blue_civ_2 = "Antonio B. Won Pat Intl"
airbase_blue_mil_1 = "Andersen AFB"
airbase_blue_mil_2 = "Andersen AFB"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "hot"
airbase_blue_mil_takeoff = "hot"

-----REDFOR

airbase_red_1 = "Saipan Intl"
airbase_red_2 = "Saipan Intl"
airbase_red_3 = "Saipan Intl"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "Normandy" then
airbase_blue_fighter_1 = "Bazenville"
airbase_blue_fighter_2 = "Bazenville"
airbase_blue_civ_1 = "Sainte-Croix-sur-Mer"
airbase_blue_civ_2 = "Carpiquet"
airbase_blue_mil_1 = "Bazenville"
airbase_blue_mil_2 = "Sainte-Croix-sur-Mer"

airbase_blue_fighter_takeoff = "runway"
airbase_blue_civ_takeoff = "runway"
airbase_blue_mil_takeoff = "runway"


airbase_red_1 = "Chailey"
airbase_red_2 = "Ford_AF"
airbase_red_3 = "Tangmere"

airbase_red_fighter_takeoff = "runway"
airbase_red_civ_takeoff = "runway"
airbase_red_mil_takeoff = "runway"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "Nevada" then
airbase_blue_fighter_1 = "Nellis"
airbase_blue_fighter_2 = "Nellis"
airbase_blue_civ_1 = "McCarran International"
airbase_blue_civ_2 = "McCarran International"
--airbase_blue_civ_2 = "North Las Vegas" -- place holder for possible future use leave commented out
airbase_blue_mil_1 = "Nellis"
airbase_blue_mil_2 = "Nellis"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "hot"
airbase_blue_mil_takeoff = "hot"

-----REDFOR
airbase_red_1 = "Tonopah"
airbase_red_2 = "Tonopah"
airbase_red_3 = "Lincoln County"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "Afghanistan" and afghanistan_map_type == "kandahar" then
airbase_blue_fighter_1 = "Kandahar"
airbase_blue_fighter_2 = "Kandahar"
airbase_blue_civ_1 = "Camp Bastion"
airbase_blue_civ_2 = "Camp Bastion"
--airbase_blue_civ_2 = "North Las Vegas" -- place holder for possible future use leave commented out
airbase_blue_mil_1 = "Kandahar"
airbase_blue_mil_2 = "Kandahar"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "hot"
airbase_blue_mil_takeoff = "hot"

-----REDFOR

airbase_red_1 = "Qala i Naw"
airbase_red_2 = "Qala i Naw"
airbase_red_3 = "Maymana Zahiraddin Faryabi"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "PersianGulf" then
airbase_blue_fighter_1 = "Al Minhad AFB"
airbase_blue_fighter_2 = "Bandar Abbas Intl"
airbase_blue_civ_1 = "Dubai Intl"
airbase_blue_civ_2 = "Abu Dhabi Intl"
airbase_blue_mil_1 = "Al Minhad AFB"
airbase_blue_mil_2 = "Bandar Abbas Intl"

airbase_blue_fighter_takeoff = "runway"
airbase_blue_civ_takeoff = "runway"
airbase_blue_mil_takeoff = "hot"

-----REDFOR

airbase_red_1 = "Shiraz Intl"
airbase_red_2 = "Jiroft"
airbase_red_3 = "Kerman"

airbase_red_fighter_takeoff = "runway"
airbase_red_civ_takeoff = "runway"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "Iraq" and iraq_map_type == "iraq_baghdad" then
	airbase_blue_fighter_1 = "Balad Airbase"
	airbase_blue_fighter_2 = "Al-Salam Airbase"
	airbase_blue_civ_1 = "Baghdad International Airport"
	airbase_blue_civ_2 = "Baghdad International Airport"
	airbase_blue_mil_1 = "Balad Airbase"
	airbase_blue_mil_2 = "Al-Salam Airbase"
	
	airbase_blue_fighter_takeoff = "hot"
	airbase_blue_civ_takeoff = "runway"
	airbase_blue_mil_takeoff = "runway"
	
	-----REDFOR
	
	airbase_red_1 = "Qayyarah Airfield West"
	airbase_red_2 = "Bashur Airport"
	airbase_red_3 = "Bashur Airport"
	
	airbase_red_fighter_takeoff = "hot"
	airbase_red_civ_takeoff = "hot"
	airbase_red_mil_takeoff = "hot"
	
	carrier_main = "CVN-7X"
	carrier_tarawa = "LHA-1 Tarawa"
	carrier_kuznetzov = "CV Kuznetsov"
	end

if env.mission.theatre == "Syria" and syra_map_type == "syr_al" then
airbase_blue_fighter_1 = "Kuweires"
airbase_blue_fighter_2 = "Hatay"
airbase_blue_civ_1 = "Aleppo"
airbase_blue_civ_2 = "Aleppo"
airbase_blue_mil_1 = "Aleppo"
airbase_blue_mil_2 = "Aleppo"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "hot"
airbase_blue_mil_takeoff = "hot"

-----REDFOR

airbase_red_1 = "Akrotiri"
airbase_red_2 = "Mezzeh"
airbase_red_3 = "H3"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end


if env.mission.theatre == "Syria" and syra_map_type == "syr_dm" then
airbase_blue_fighter_1 = "Al-Dumayr"
airbase_blue_fighter_2 = "Mezzeh"
airbase_blue_civ_1 = "Beirut-Rafic Hariri"
airbase_blue_civ_2 = "Damascus"
airbase_blue_mil_1 = "Mezzeh"
airbase_blue_mil_2 = "Al-Dumayr"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "hot"
airbase_blue_mil_takeoff = "hot"

-----REDFOR

airbase_red_1 = "Larnaca"
airbase_red_2 = "Gaziantep"
airbase_red_3 = "Deir ez-Zor"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "Syria" and syra_map_type == "syr_cy" then
airbase_blue_fighter_1 = "Akrotiri"
airbase_blue_fighter_2 = "Larnaca"
airbase_blue_civ_1 = "Paphos"
airbase_blue_civ_2 = "Larnaca"
airbase_blue_mil_1 = "Akrotiri"
airbase_blue_mil_2 = "Akrotiri"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "hot"
airbase_blue_mil_takeoff = "hot"

-----REDFOR

airbase_red_1 = "Incirlik"
airbase_red_2 = "Aleppo"
airbase_red_3 = "Damascus"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "Falklands" and sa_map_type == "punta_arenas" then
airbase_blue_fighter_1 = "Punta Arenas"
airbase_blue_fighter_2 = "Porvenir Airfield"
airbase_blue_civ_1 = "Punta Arenas"
airbase_blue_civ_2 = "Punta Arenas"
airbase_blue_mil_1 = "Punta Arenas"
airbase_blue_mil_2 = "Punta Arenas"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "hot"
airbase_blue_mil_takeoff = "hot"

-----REDFOR

airbase_red_1 = "San Julian"
airbase_red_2 = "El Calafate"
airbase_red_3 = "Puerto Santa Cruz"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "Falklands" and sa_map_type == "mount_pleasant" then
airbase_blue_fighter_1 = "Mount Pleasant"
airbase_blue_fighter_2 = "Port Stanley"
airbase_blue_civ_1 = "Mount Pleasant"
airbase_blue_civ_2 = "Mount Pleasant"
airbase_blue_mil_1 = "Mount Pleasant"
airbase_blue_mil_2 = "Mount Pleasant"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "hot"
airbase_blue_mil_takeoff = "hot"

-----REDFOR

airbase_red_1 = "Puerto Santa Cruz"
airbase_red_2 = "Puerto Williams"
airbase_red_3 = "Porvenir Airfield"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "Kola" and kola_map_type == "kola_west" then
airbase_blue_fighter_1 = "Bodo"
airbase_blue_fighter_2 = "Bodo"
airbase_blue_civ_1 = "Bodo"
airbase_blue_civ_2 = "Bodo"
--airbase_blue_civ_2 = "Tbilisi-Lochini"
airbase_blue_mil_1 = "Bodo"
airbase_blue_mil_2 = "Bodo"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "hot"
airbase_blue_mil_takeoff = "hot"

-----REDFOR

airbase_red_1 = "Severomorsk1"
airbase_red_2 = "Severomorsk1"
airbase_red_3 = "Monchegorsk"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if env.mission.theatre == "Kola" and kola_map_type == "kola_east" then
airbase_blue_fighter_1 = "Severomorsk1"
airbase_blue_fighter_2 = "Severomorsk1"
airbase_blue_civ_1 = "Murmansk International"
airbase_blue_civ_2 = "Murmansk International"
--airbase_blue_civ_2 = "Tbilisi-Lochini"
airbase_blue_mil_1 = "Severomorsk1"
airbase_blue_mil_2 = "Severomorsk1"

airbase_blue_fighter_takeoff = "hot"
airbase_blue_civ_takeoff = "runway"
airbase_blue_mil_takeoff = "runway"

-----REDFOR

airbase_red_1 = "Bodo"
airbase_red_2 = "Kiruna"
airbase_red_3 = "Kiruna"

airbase_red_fighter_takeoff = "hot"
airbase_red_civ_takeoff = "hot"
airbase_red_mil_takeoff = "hot"

carrier_main = "CVN-7X"
carrier_tarawa = "LHA-1 Tarawa"
carrier_kuznetzov = "CV Kuznetsov"
end

if mission_era == "ww2" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_RAT_Large_WW2_Mil, "blue_bombing_b17g")
table.insert(TemplateTable_RAT_Red_Large_WW2_Mil, "red_bombing_b17g")
end

if mission_era == "korean_war" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_RAT_Large_WW2_Mil, "blue_bombing_b17g")
table.insert(TemplateTable_RAT_Red_Large_WW2_Mil, "red_bombing_b17g")
end

TemplateTable_RAT_F18 = {
"blue_cap_f18",
}

TemplateTable_RAT_E2D = {
"blue_cv_awacs_e2d",
}

TemplateTable_RAT_S3B = {
"blue_cv_cas_s3b",
}

TemplateTable_RAT_F14B = {
"blue_cap_f14b",
}

TemplateTable_RAT_F14A = {
"blue_cap_f14a",
}

TemplateTable_RAT_F4 = {
"blue_cap_f4",
}

TemplateTable_RAT_SU33 = {
"blue_cap_su33",
}

TemplateTable_RAT_AV8B = {
"blue_cas_av8b",
}


min_distance = 80
--max_distance_destination = 300
inactive_timer = 300

if fighter_jet_combat_mode == "hold" then
		roe_setting = "hold"
	elseif fighter_jet_combat_mode == "return" then
		roe_setting = "return"
	elseif fighter_jet_combat_mode == "free" then
		roe_setting = "free"
	elseif fighter_jet_combat_mode == true then
		roe_setting = "free"
	elseif fighter_jet_combat_mode == false then
		roe_setting = "hold"
end

fighter_jet_combat_mode_red = "free" -- temp allow RAT Red fighters to attack

if fighter_jet_combat_mode_red == "hold" then
		roe_setting_red = "hold"
	elseif fighter_jet_combat_mode == "return" then
		roe_setting_red = "return"
	elseif fighter_jet_combat_mode == "free" then
		roe_setting_red = "free"
	elseif fighter_jet_combat_mode == true then
		roe_setting_red = "free"
	elseif fighter_jet_combat_mode == false then
		roe_setting_red = "hold"
end


if mission_era == "modern" then
	 rat_large_civ_1=RAT:New("RAT_INIT", "RAT_LARGE_CIV_1"):InitRandomizeTemplate( TemplateTable_RAT_Large_Modern_Civ )
	elseif mission_era == "ww2" then
	 rat_large_civ_1=RAT:New("RAT_INIT", "RAT_LARGE_CIV_1"):InitRandomizeTemplate( TemplateTable_RAT_Large_WW2_Civ )
	elseif mission_era == "korean_war" then
	 rat_large_civ_1=RAT:New("RAT_INIT", "RAT_LARGE_CIV_1"):InitRandomizeTemplate( TemplateTable_RAT_Large_Korean_War_Civ )
	elseif mission_era == "cold_war" then
	 rat_large_civ_1=RAT:New("RAT_INIT", "RAT_LARGE_CIV_1"):InitRandomizeTemplate( TemplateTable_RAT_Large_Cold_War_Civ )
end
rat_large_civ_1:Commute()
rat_large_civ_1:InitRepeatOnEngineShutDown()
rat_large_civ_1:SetClimbRate(5000)
-- if env.mission.theatre == "Normandy" then
-- rat_large_civ_1:SetTakeoff("runway")
-- else
-- rat_large_civ_1:SetTakeoff("hot")
-- end
rat_large_civ_1:SetTakeoff(airbase_blue_civ_takeoff)
rat_large_civ_1:SetDeparture({airbase_blue_civ_1, airbase_blue_civ_2})
rat_large_civ_1:SetFLcruise(air_traffic_flight_level)
--rat_large_civ_1:SetDestination({"a2a_wpt_1", "a2a_wpt_2", "a2a_wpt_3", "a2a_wpt_4", "a2a_wpt_5"})
rat_large_civ_1:SetDestination({"rat_blue_large_01_wpt", "rat_blue_large_02_wpt",})
--rat_large_civ_1:SetMaxDistance(max_distance_destination)
rat_large_civ_1:ReturnZone()
rat_large_civ_1:TimeDestroyInactive(inactive_timer)
rat_large_civ_1:ATC_Messages(false)
--rat_large_civ_1:RadioOFF()
--rat_large_civ_1:RadioMenuON()
--rat_large_civ_1:MenuName("RAT_LARGE_CIV_1")
	if large_allow_immortal == true then
		rat_large_civ_1:Immortal()
	end
	if large_allow_invisible == true then
		rat_large_civ_1:Invisible()
	end
rat_large_civ_1:RespawnAfterLanding(185)
rat_large_civ_1:SetSpawnDelay(10)


if mission_era == "modern" then
 --rat_large_civ_2=RAT:New("RAT_LARGE_CIV_2")
	 rat_large_civ_2=RAT:New("RAT_INIT", "RAT_LARGE_CIV_2"):InitRandomizeTemplate( TemplateTable_RAT_Large_Modern_Civ )
	elseif mission_era == "ww2" then
	 rat_large_civ_2=RAT:New("RAT_INIT", "RAT_LARGE_CIV_2"):InitRandomizeTemplate( TemplateTable_RAT_Large_WW2_Civ )
	elseif mission_era == "korean_war" then
	 rat_large_civ_2=RAT:New("RAT_INIT", "RAT_LARGE_CIV_2"):InitRandomizeTemplate( TemplateTable_RAT_Large_Korean_War_Civ )
	elseif mission_era == "cold_war" then
	 rat_large_civ_2=RAT:New("RAT_INIT", "RAT_LARGE_CIV_2"):InitRandomizeTemplate( TemplateTable_RAT_Large_Cold_War_Civ )
end
rat_large_civ_2:Commute()
rat_large_civ_2:InitRepeatOnEngineShutDown()
rat_large_civ_2:SetClimbRate(5000)
-- if env.mission.theatre == "Normandy" then
-- rat_large_civ_2:SetTakeoff("runway")
-- else
-- rat_large_civ_2:SetTakeoff("hot")
-- end
rat_large_civ_2:SetTakeoff(airbase_blue_civ_takeoff)
rat_large_civ_2:SetDeparture({airbase_blue_civ_1, airbase_blue_civ_2})
rat_large_civ_2:SetFLcruise(air_traffic_flight_level)
--rat_large_civ_2:SetDestination({"a2a_wpt_1", "a2a_wpt_2", "a2a_wpt_3", "a2a_wpt_4", "a2a_wpt_5"})
rat_large_civ_2:SetDestination({"rat_blue_large_01_wpt", "rat_blue_large_02_wpt",})
--rat_large_civ_2:SetMaxDistance(max_distance_destination)
rat_large_civ_2:ReturnZone()
rat_large_civ_2:TimeDestroyInactive(inactive_timer)
rat_large_civ_2:ATC_Messages(false)
rat_large_civ_2:RadioOFF()
	if large_allow_immortal == true then
		rat_large_civ_2:Immortal()
	end
	if large_allow_invisible == true then
		rat_large_civ_2:Invisible()
	end
rat_large_civ_2:RespawnAfterLanding(185)
rat_large_civ_2:SetSpawnDelay(20)


if mission_era == "modern" then
 --rat_large_mil_1=RAT:New("RAT_LARGE_MIL_1")
	 rat_large_mil_1=RAT:New("RAT_INIT", "RAT_LARGE_MIL_1"):InitRandomizeTemplate( TemplateTable_RAT_Large_Modern_Mil )
	elseif mission_era == "ww2" then
	 rat_large_mil_1=RAT:New("RAT_INIT", "RAT_LARGE_MIL_1"):InitRandomizeTemplate( TemplateTable_RAT_Large_WW2_Mil )
	elseif mission_era == "korean_war" then
	 rat_large_mil_1=RAT:New("RAT_INIT", "RAT_LARGE_MIL_1"):InitRandomizeTemplate( TemplateTable_RAT_Large_Korean_War_Mil )
	elseif mission_era == "cold_war" then
	 rat_large_mil_1=RAT:New("RAT_INIT", "RAT_LARGE_MIL_1"):InitRandomizeTemplate( TemplateTable_RAT_Large_Cold_War_Mil )
end
rat_large_mil_1:Commute()
rat_large_mil_1:InitRepeatOnEngineShutDown()
rat_large_mil_1:SetClimbRate(5000)
-- if env.mission.theatre == "Syria" or env.mission.theatre == "Normandy" or env.mission.theatre == "Falklands" then
-- rat_large_mil_1:SetTakeoff("runway")
-- else
-- rat_large_mil_1:SetTakeoff("hot")
-- end
rat_large_mil_1:SetTakeoff(airbase_blue_mil_takeoff)
rat_large_mil_1:SetDeparture({airbase_blue_mil_1, airbase_blue_mil_2})
rat_large_mil_1:SetFLcruise(air_traffic_flight_level)
--rat_large_mil_1:SetDestination({"a2a_wpt_1", "a2a_wpt_2", "a2a_wpt_3", "a2a_wpt_4", "a2a_wpt_5"})
rat_large_mil_1:SetDestination({"rat_blue_large_01_wpt", "rat_blue_large_02_wpt",})
--rat_large_mil_1:SetMaxDistance(max_distance_destination)
rat_large_mil_1:ReturnZone()
rat_large_mil_1:TimeDestroyInactive(inactive_timer)
rat_large_mil_1:ATC_Messages(false)
rat_large_mil_1:RadioOFF()
	if large_allow_immortal == true then
		rat_large_mil_1:Immortal()
	end
	if large_allow_invisible == true then
		rat_large_mil_1:Invisible()
	end
rat_large_mil_1:RespawnAfterLanding(185)
rat_large_mil_1:SetSpawnDelay(30)

if mission_era == "modern" then
	 rat_large_mil_2=RAT:New("RAT_INIT", "RAT_LARGE_MIL_2"):InitRandomizeTemplate( TemplateTable_RAT_Large_Modern_Mil )
	elseif mission_era == "ww2" then
	 rat_large_mil_2=RAT:New("RAT_INIT", "RAT_LARGE_MIL_2"):InitRandomizeTemplate( TemplateTable_RAT_Large_WW2_Mil )
	elseif mission_era == "korean_war" then
	 rat_large_mil_2=RAT:New("RAT_INIT", "RAT_LARGE_MIL_2"):InitRandomizeTemplate( TemplateTable_RAT_Large_Korean_War_Mil )
	elseif mission_era == "cold_war" then
	 rat_large_mil_2=RAT:New("RAT_INIT", "RAT_LARGE_MIL_2"):InitRandomizeTemplate( TemplateTable_RAT_Large_Cold_War_Mil )
end
rat_large_mil_2:Commute()
rat_large_mil_2:InitRepeatOnEngineShutDown()
rat_large_mil_2:SetClimbRate(5000)
-- if env.mission.theatre == "Syria" or env.mission.theatre == "Normandy" or env.mission.theatre == "Falklands" then
-- rat_large_mil_2:SetTakeoff("runway")
-- else
-- rat_large_mil_2:SetTakeoff("hot")
-- end
rat_large_mil_2:SetTakeoff(airbase_blue_mil_takeoff)
rat_large_mil_2:SetDeparture({airbase_blue_mil_1, airbase_blue_mil_2})
rat_large_mil_2:SetFLcruise(air_traffic_flight_level)
rat_large_mil_2:SetDestination({"rat_blue_large_01_wpt", "rat_blue_large_02_wpt",})
rat_large_mil_2:ReturnZone()
rat_large_mil_2:TimeDestroyInactive(inactive_timer)
rat_large_mil_2:ATC_Messages(false)
rat_large_mil_2:RadioOFF()
	if large_allow_immortal == true then
		rat_large_mil_2:Immortal()
	end
	if large_allow_invisible == true then
		rat_large_mil_2:Invisible()
	end
rat_large_mil_2:RespawnAfterLanding(185)
rat_large_mil_2:SetSpawnDelay(40)

function startRandomBlueLargeMilAirTraffic()
	if enable_large_mil_1 == true then
		rat_large_mil_1:Spawn(blue_large_rat_spawns)
		rat_large_mil_1_spawned = true
	end
	if enable_large_mil_2 == true then
		rat_large_mil_2:Spawn(blue_large_rat_spawns)
		rat_large_mil_2_spawned = true
	end
end

function startRandomBlueLargeCivAirTraffic()
	if enable_large_civ_1 == true then
		rat_large_civ_1:Spawn(blue_large_rat_spawns)
		rat_large_civ_1_spawned = true
	end
	if enable_large_civ_2 == true then
		rat_large_civ_2:Spawn(blue_large_rat_spawns)
		rat_large_civ_2_spawned = true
	end
end

if random_blue_large_civ_air_traffic == true then
	startRandomBlueLargeCivAirTraffic() -- starts at mission start
end

if random_blue_large_mil_air_traffic == true then
	startRandomBlueLargeMilAirTraffic() -- starts at mission start
end
--[[ -- moved to script load validation.lua

timer.scheduleFunction(function() 
	trigger.action.outText("Random Civilian Air Traffic is ENABLED...", 10)
end, nil, timer.getTime() + 8  )




if random_blue_large_air_traffic == false then
	timer.scheduleFunction(function() 
	trigger.action.outText("Random Civilian Air Traffic is DISABLED...", 10)
	end, nil, timer.getTime() + 8  )

end

--]]


rat_f14b=RAT:New("RAT_INIT", "RAT_F14B"):InitRandomizeTemplate( TemplateTable_RAT_F14B ):InitGrouping(ratBlueCvnFightersGroupSize)
rat_f14b:Commute()
rat_f14b:Livery(f14b_cvn_blue_RAT_liveries)
rat_f14b:InitRepeatOnEngineShutDown()
rat_f14b:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
if carrierOpsTheatre == true then
rat_f14b:SetTakeoff(cv_takeoff_mode)
rat_f14b:SetDeparture({carrier_main})
else
rat_f14b:SetTakeoff("hot")
rat_f14b:SetDeparture({airbase_blue_fighter_1})
end
rat_f14b:SetFLcruise(air_traffic_flight_level)
rat_f14b:SetDestination({"rat_blue_fighter_01_wpt", "rat_blue_fighter_02_wpt"})
rat_f14b:ReturnZone()
rat_f14b:TimeDestroyInactive(inactive_timer)
rat_f14b:ATC_Messages(false)
rat_f14b:RadioOFF()
rat_f14b:SetROE(roe_setting)
rat_f14b:SetROT("evade")
	if fighter_jet_immortal == true then
		rat_f14b:Immortal()
	end
	if fighter_jet_invisible == true then
		rat_f14b:Invisible()
	end
rat_f14b:SetSpawnDelay(120)
rat_f14b:RespawnAfterLanding(90)

rat_f14a=RAT:New("RAT_INIT", "RAT_F14A"):InitRandomizeTemplate( TemplateTable_RAT_F14A ):InitGrouping(ratBlueCvnFightersGroupSize)
rat_f14a:Commute()
rat_f14a:Livery(f14a_cvn_blue_RAT_liveries)
rat_f14a:InitRepeatOnEngineShutDown()
rat_f14a:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
if carrierOpsTheatre == true then
rat_f14a:SetTakeoff(cv_takeoff_mode)
rat_f14a:SetDeparture({carrier_main})
else
rat_f14a:SetTakeoff("hot")
rat_f14a:SetDeparture({airbase_blue_fighter_1})
end
rat_f14a:SetFLcruise(air_traffic_flight_level)
rat_f14a:SetDestination({"rat_blue_fighter_01_wpt", "rat_blue_fighter_02_wpt"})
rat_f14a:ReturnZone()
rat_f14a:TimeDestroyInactive(inactive_timer)
rat_f14a:ATC_Messages(false)
rat_f14a:RadioOFF()
rat_f14a:SetROE(roe_setting)
rat_f14a:SetROT("evade")
	if fighter_jet_immortal == true then
		rat_f14a:Immortal()
	end
	if fighter_jet_invisible == true then
		rat_f14a:Invisible()
	end
rat_f14a:SetSpawnDelay(120)
rat_f14a:RespawnAfterLanding(90)


enable_f4 = false --cold war only
blue_fighter_rat_f4_spawns = 1

rat_f4=RAT:New("RAT_INIT", "RAT_F4"):InitRandomizeTemplate( TemplateTable_RAT_F4 ):InitGrouping(ratBlueCvnFightersGroupSize)
rat_f4:Commute()
rat_f4:Livery(f4_cvn_blue_RAT_liveries)
rat_f4:InitRepeatOnEngineShutDown()
rat_f4:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
if carrierOpsTheatre == true then
rat_f4:SetTakeoff(cv_takeoff_mode)
rat_f4:SetDeparture({carrier_main})
else
rat_f4:SetTakeoff("hot")
rat_f4:SetDeparture({airbase_blue_fighter_1})
end
rat_f4:SetFLcruise(air_traffic_flight_level)
rat_f4:SetDestination({"rat_blue_fighter_01_wpt", "rat_blue_fighter_02_wpt"})
rat_f4:ReturnZone()
rat_f4:TimeDestroyInactive(inactive_timer)
rat_f4:ATC_Messages(false)
rat_f4:RadioOFF()
rat_f4:SetROE(roe_setting)
rat_f4:SetROT("evade")
	if fighter_jet_immortal == true then
		rat_f4:Immortal()
	end
	if fighter_jet_invisible == true then
		rat_f4:Invisible()
	end
rat_f4:RespawnAfterLanding(90)


rat_f18=RAT:New("RAT_INIT", "RAT_F18"):InitRandomizeTemplate( TemplateTable_RAT_F18 ):InitGrouping(ratBlueCvnFightersGroupSize)
rat_f18:Commute()
rat_f18:Livery(f18c_cvn_blue_RAT_liveries)
rat_f18:InitRepeatOnEngineShutDown()
rat_f18:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
if carrierOpsTheatre == true then
rat_f18:SetTakeoff(cv_takeoff_mode)
rat_f18:SetDeparture({carrier_main})
else
rat_f18:SetTakeoff("hot")
rat_f18:SetDeparture({airbase_blue_fighter_1})
end
rat_f18:SetFLcruise(air_traffic_flight_level)
rat_f18:SetDestination({"rat_blue_fighter_01_wpt", "rat_blue_fighter_02_wpt"})
rat_f18:ReturnZone()
rat_f18:TimeDestroyInactive(inactive_timer)
rat_f18:ATC_Messages(false)
rat_f18:RadioOFF()
rat_f18:SetROE(roe_setting)
rat_f18:SetROT("evade")
	if fighter_jet_immortal == true then
		rat_f18:Immortal()
	end
	if fighter_jet_invisible == true then
		rat_f18:Invisible()
	end
rat_f18:RespawnAfterLanding(90)



rat_su33=RAT:New("RAT_INIT", "RAT_SU33"):InitRandomizeTemplate( TemplateTable_RAT_SU33 ):InitGrouping(ratBlueCvnFightersGroupSize)
rat_su33:Commute()
rat_su33:Livery(su33_kuz_blue_RAT_liveries)
rat_su33:InitRepeatOnEngineShutDown()
rat_su33:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
if carrierOpsTheatre == true then
rat_su33:SetTakeoff(cv_takeoff_mode)
rat_su33:SetDeparture({carrier_kuznetzov})
else
rat_su33:SetTakeoff("hot")
rat_su33:SetDeparture({airbase_blue_fighter_1})
end
rat_su33:SetFLcruise(air_traffic_flight_level)
rat_su33:SetDestination({"rat_blue_fighter_01_wpt", "rat_blue_fighter_02_wpt"})
rat_su33:ReturnZone()
rat_su33:TimeDestroyInactive(inactive_timer)
rat_su33:ATC_Messages(false)
rat_su33:RadioOFF()
rat_su33:SetROE(roe_setting)
rat_su33:SetROT("evade")
	if fighter_jet_immortal == true then
		rat_su33:Immortal()
	end
	if fighter_jet_invisible == true then
		rat_su33:Invisible()
	end
rat_su33:RespawnAfterLanding(90)

rat_av8b=RAT:New("RAT_INIT", "RAT_AV8B"):InitRandomizeTemplate( TemplateTable_RAT_AV8B ):InitGrouping(ratBlueLhaFightersGroupSize)
rat_av8b:Commute()
rat_av8b:Livery(av8b_lha_blue_RAT_liveries)
rat_av8b:InitRepeatOnEngineShutDown()
rat_av8b:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)

if carrierOpsTheatre == true then
rat_av8b:SetTakeoff(cv_takeoff_mode)
rat_av8b:SetDeparture({carrier_tarawa})
else
rat_av8b:SetTakeoff("hot")
rat_av8b:SetDeparture({airbase_blue_fighter_1})
end
rat_av8b:SetFLcruise(air_traffic_flight_level)
rat_av8b:SetDestination({"rat_blue_fighter_01_wpt", "rat_blue_fighter_02_wpt"})
rat_av8b:ReturnZone()
rat_av8b:SetMaxDistance(max_distance_destination)
rat_av8b:TimeDestroyInactive(inactive_timer)
rat_av8b:ATC_Messages(false)
rat_av8b:RadioOFF()
rat_av8b:SetROE(roe_setting)
rat_av8b:SetROT("evade")
	if fighter_jet_immortal == true then
		rat_av8b:Immortal()
	end
	if fighter_jet_invisible == true then
		rat_av8b:Invisible()
	end
rat_av8b:RespawnAfterLanding(90)

rat_s3b=RAT:New("RAT_INIT", "RAT_S3B"):InitRandomizeTemplate( TemplateTable_RAT_S3B ):InitGrouping(1)
rat_s3b:Commute()
rat_s3b:Livery(s3b_cvn_blue_RAT_liveries)
rat_s3b:InitRepeatOnEngineShutDown()
rat_s3b:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
if carrierOpsTheatre == true then
rat_s3b:SetTakeoff(cv_takeoff_mode)
rat_s3b:SetDeparture({carrier_main})
else
rat_s3b:SetTakeoff("hot")
rat_s3b:SetDeparture({airbase_blue_fighter_1})
end
rat_s3b:SetFLcruise(air_traffic_flight_level)
rat_s3b:SetDestination({"rat_blue_fighter_01_wpt", "rat_blue_fighter_02_wpt"})
rat_s3b:ReturnZone()
rat_s3b:TimeDestroyInactive(inactive_timer)
rat_s3b:ATC_Messages(false)
rat_s3b:RadioOFF()
rat_s3b:SetROE(roe_setting)
rat_s3b:SetROT("evade")
	if fighter_jet_immortal == true then
		rat_s3b:Immortal()
	end
	if fighter_jet_invisible == true then
		rat_s3b:Invisible()
	end
rat_s3b:RespawnAfterLanding(90)


rat_e2d=RAT:New("RAT_INIT", "RAT_E2D"):InitRandomizeTemplate( TemplateTable_RAT_E2D ):InitGrouping(1)
rat_e2d:Commute()
rat_e2d:Livery(e2d_cvn_blue_RAT_liveries)
rat_e2d:InitRepeatOnEngineShutDown()
rat_e2d:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
if carrierOpsTheatre == true then
rat_e2d:SetTakeoff(cv_takeoff_mode)
rat_e2d:SetDeparture({carrier_main})
else
rat_e2d:SetTakeoff("hot")
rat_e2d:SetDeparture({airbase_blue_fighter_1})
end
rat_e2d:SetFLcruise(air_traffic_flight_level)
rat_e2d:SetDestination({"rat_blue_large_01_wpt", "rat_blue_large_02_wpt",})
rat_e2d:ReturnZone()
rat_e2d:TimeDestroyInactive(inactive_timer)
rat_e2d:ATC_Messages(false)
rat_e2d:RadioOFF()
rat_e2d:SetROE(roe_setting)
rat_e2d:SetROT("evade")
	if fighter_jet_immortal == true then
		rat_e2d:Immortal()
	end
	if fighter_jet_invisible == true then
		rat_e2d:Invisible()
	end
rat_e2d:RespawnAfterLanding(90)

rat_random_lha_rat_helo=RAT:New("RAT_INIT", "RAT_RANDOM_CVN_HELO"):InitRandomizeTemplate( TemplateTable_RAT_LHA_HELO_Random ):InitGrouping(ratBlueLhaHeloGroupSize)
rat_random_lha_rat_helo:Commute()
rat_random_lha_rat_helo:SetMaxCruiseSpeed(500)
rat_random_lha_rat_helo:InitRepeatOnEngineShutDown()
rat_random_lha_rat_helo:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
if carrierOpsTheatre == true then
rat_random_lha_rat_helo:SetTakeoff(cv_takeoff_mode)
rat_random_lha_rat_helo:SetDeparture({carrier_tarawa})
else
rat_random_lha_rat_helo:SetTakeoff("hot")
rat_random_lha_rat_helo:SetDeparture({airbase_blue_fighter_1})
end
rat_random_lha_rat_helo:SetFLcruise(air_traffic_flight_level)
rat_random_lha_rat_helo:SetDestination({"rat_blue_carrier_helo_wpt_01"})
rat_random_lha_rat_helo:ReturnZone()
rat_random_lha_rat_helo:TimeDestroyInactive(inactive_timer)
rat_random_lha_rat_helo:ATC_Messages(false)
rat_random_lha_rat_helo:RadioOFF()
rat_random_lha_rat_helo:SetROE(roe_setting)
rat_random_lha_rat_helo:SetROT("evade")
	if fighter_jet_immortal == true then
		rat_random_lha_rat_helo:Immortal()
	end
	if fighter_jet_invisible == true then
		rat_random_lha_rat_helo:Invisible()
	end
rat_random_lha_rat_helo:RespawnAfterLanding(185)


rat_random_cvn_rat_plane=RAT:New("RAT_INIT", "RAT_RANDOM_CVN_PLANE"):InitRandomizeTemplate( TemplateTable_RAT_CVN_PLANE_Random ):InitGrouping(ratBlueCvnFightersGroupSize)
rat_random_cvn_rat_plane:Commute()
rat_random_cvn_rat_plane:InitRepeatOnEngineShutDown()
rat_random_cvn_rat_plane:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
if carrierOpsTheatre == true then
rat_random_cvn_rat_plane:SetTakeoff(cv_takeoff_mode)
rat_random_cvn_rat_plane:SetDeparture({carrier_main})
else
rat_random_cvn_rat_plane:SetTakeoff("hot")
rat_random_cvn_rat_plane:SetDeparture({airbase_blue_fighter_1})
end

rat_random_cvn_rat_plane:SetFLcruise(air_traffic_flight_level)
rat_random_cvn_rat_plane:SetDestination({"rat_blue_fighter_01_wpt", "rat_blue_fighter_02_wpt"})
rat_random_cvn_rat_plane:ReturnZone()
rat_random_cvn_rat_plane:TimeDestroyInactive(inactive_timer)
rat_random_cvn_rat_plane:ATC_Messages(false)
rat_random_cvn_rat_plane:RadioOFF()
rat_random_cvn_rat_plane:SetROE(roe_setting)
rat_random_cvn_rat_plane:SetROT("evade")
	if fighter_jet_immortal == true then
		rat_random_cvn_rat_plane:Immortal()
	end
	if fighter_jet_invisible == true then
		rat_random_cvn_rat_plane:Invisible()
	end
rat_random_cvn_rat_plane:RespawnAfterLanding(90)

function startRandomBlueCvAirTraffic()
	if cv_cvn_enable == true and cvn_ai_traffic_start_on_cvn_spawn == false then
		if enable_e2d == true then
			if mission_era == "modern" or mission_era == "cold_war" then
				rat_e2d:Spawn(blue_fighter_rat_e2d_spawns)
				rat_e2d_spawned = true
			end
		end
		if enable_f18 == true then
			if mission_era == "modern" or mission_era == "cold_war" then
				rat_f18:Spawn(blue_fighter_rat_f18_spawns)
				rat_f18_spawned = true
			end
		end
		if enable_f14b == true then
			if mission_era == "modern" or mission_era == "cold_war" then
			rat_f14b:Spawn(blue_fighter_rat_f14b_spawns)
			rat_f14b_spawned = true
			end
		end
		if enable_f14a == true then
			if mission_era == "modern" or mission_era == "cold_war" then
				rat_f14a:Spawn(blue_fighter_rat_f14a_spawns)
				rat_f14a_spawned = true
			end
		end
		if enable_f4 == true and mission_era == "cold_war" then
			rat_f4:Spawn(blue_fighter_rat_f4_spawns)
			rat_f4_spawned = true
		end
		if enable_s3b == true then
			if mission_era == "modern" or mission_era == "cold_war" then
				rat_s3b:Spawn(blue_fighter_rat_s3b_spawns)
				rat_s3b_spawned = true
			end
		end
		if enable_random_cvn_rat_plane == true and mission_era == "modern" then
			rat_random_cvn_rat_plane:Spawn(rat_random_cvn_rat_plane_spawns)
			rat_random_cvn_rat_plane_spawned = true
		end
	end
	if cv_kuz_enable == true and su33_ai_traffic_start_on_su33_spawn == false then
		if enable_su33 == true then
			if mission_era == "modern" or mission_era == "cold_war" then
				rat_su33:Spawn(blue_fighter_rat_su33_spawns)
				rat_su33_spawned = true
			end
		end
	end

	if cv_lha_enable == true and av8b_ai_traffic_start_on_av8b_spawn == false then	
		if enable_av8b == true then 
			if mission_era == "modern" or mission_era == "cold_war" then
				rat_av8b:Spawn(blue_fighter_rat_av8b_spawns)
				rat_av8b_spawned = true
			end
		end
		if enable_random_lha_rat_helo == true and mission_era == "modern" and tti_sp_mt_hotfix ~= true then
			rat_random_lha_rat_helo:Spawn(rat_random_lha_rat_helo_spawns)
			rat_random_lha_rat_helo_spawned = true
		end
	end
		
end

if carrierOpsTheatre == true then
	startRandomBlueCvAirTraffic() -- starts at mission start
end

function forceSu33RatSpawnOnPlayerSpawn()
	if carrierOpsTheatre == true then
	if mission_era == "modern" or mission_era == "cold_war" then
		if cv_kuz_enable == true and su33_ai_traffic_start_on_su33_spawn == true then
			if enable_su33 == true then
				rat_su33:Spawn(blue_fighter_rat_su33_spawns)
				rat_su33_spawned = true
			end
		end
	end
	end
end

function forceAv8bRatSpawnOnPlayerSpawn()
	if carrierOpsTheatre == true then
	if mission_era == "modern" or mission_era == "cold_war" then
		if cv_lha_enable == true and av8b_ai_traffic_start_on_av8b_spawn == true then	
			if enable_av8b == true then
				rat_av8b:Spawn(blue_fighter_rat_av8b_spawns)
				rat_av8b_spawned = true
			end
			if enable_random_lha_rat_helo == true and av8b_ai_traffic_start_on_av8b_spawn == true then
				rat_random_lha_rat_helo:Spawn(rat_random_lha_rat_helo_spawns)
				rat_random_lha_rat_helo_spawned = true
			end
		end	
	end
	end
end

function forceCvnRatSpawnOnPlayerSpawn()
	if carrierOpsTheatre == true then
		if mission_era == "modern" or mission_era == "cold_war" then
			if cv_cvn_enable == true and cvn_ai_traffic_start_on_cvn_spawn == true then
			tti.debug("RAT SCRIPT - First CVN Player Spawn detected starting CVN RAT aircraft on CVN")
				if enable_f18 == true and mission_era == "modern" then --extra check for modern
					rat_f18:Spawn(blue_fighter_rat_f18_spawns)
					rat_f18_spawned = true
				end
				if enable_f14b == true then
					rat_f14b:Spawn(blue_fighter_rat_f14b_spawns)
					rat_f14b_spawned = true
				end
				if enable_f14a == true then
					rat_f14a:Spawn(blue_fighter_rat_f14a_spawns)
					rat_f14a_spawned = true
				end
				if enable_e2d == true then
					rat_e2d:Spawn(blue_fighter_rat_e2d_spawns)
					rat_e2d_spawned = true
				end
				if enable_s3b == true then
					rat_s3b:Spawn(blue_fighter_rat_s3b_spawns)
					rat_s3b_spawned = true
				end
				if enable_f14a == true then
					rat_f14a:Spawn(blue_fighter_rat_f14a_spawns)
					rat_f14a_spawned = true
				end
				if enable_e2d == true then
					rat_e2d:Spawn(blue_fighter_rat_e2d_spawns)
					rat_e2d_spawned = true
				end
				if enable_s3b == true then
					rat_s3b:Spawn(blue_fighter_rat_s3b_spawns)
					rat_s3b_spawned = true
				end
				if enable_f4 == true then
					rat_f4:Spawn(blue_fighter_rat_f4_spawns)
					rat_f4_spawned = true
				end
				if enable_random_cvn_rat_plane == true then
					rat_random_cvn_rat_plane:Spawn(rat_random_cvn_rat_plane_spawns)
					rat_random_cvn_rat_plane_spawned = true
				end
			end
		end
	end
end


----------

if mission_era == "modern" then
	 rat_fighter_1=RAT:New("RAT_INIT", "RAT_FIGHTER_1"):InitRandomizeTemplate( TemplateTable_RAT_Fighter_Modern ):InitGrouping(ratBlueFightersGroupSize)
elseif mission_era == "ww2" then
	 rat_fighter_1=RAT:New("RAT_INIT", "RAT_FIGHTER_1"):InitRandomizeTemplate( TemplateTable_RAT_Fighter_WW2 ):InitGrouping(ratBlueFightersGroupSize)
elseif mission_era == "korean_war" then
	 rat_fighter_1=RAT:New("RAT_INIT", "RAT_FIGHTER_1"):InitRandomizeTemplate( TemplateTable_RAT_Fighter_Korean_War ):InitGrouping(ratBlueFightersGroupSize)
	 elseif mission_era == "cold_war" then
	 rat_fighter_1=RAT:New("RAT_INIT", "RAT_FIGHTER_1"):InitRandomizeTemplate( TemplateTable_RAT_Fighter_Cold_War ):InitGrouping(ratBlueFightersGroupSize)
end
rat_fighter_1:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
rat_fighter_1:Commute()
rat_fighter_1:InitRepeatOnEngineShutDown()
rat_fighter_1:SetTakeoff(airbase_blue_fighter_takeoff)
rat_fighter_1:SetDeparture({airbase_blue_fighter_1, airbase_blue_fighter_2})
rat_fighter_1:SetFLcruise(air_traffic_flight_level)
rat_fighter_1:SetDestination({"rat_blue_fighter_01_wpt", "rat_blue_fighter_02_wpt"})
rat_fighter_1:ReturnZone()
rat_fighter_1:TimeDestroyInactive(inactive_timer)
rat_fighter_1:ATC_Messages(false)
rat_fighter_1:RadioOFF()
rat_fighter_1:SetROE(roe_setting)
rat_fighter_1:SetROT("evade")
    if fighter_jet_immortal == true then
      rat_fighter_1:Immortal()
    end
    if fighter_jet_invisible == true then
      rat_fighter_1:Invisible()
    end
rat_fighter_1:RespawnAfterLanding(185)
--rat_fighter_1:SetSpawnDelay(45)


if mission_era == "modern" then
	rat_fighter_2=RAT:New("RAT_INIT", "RAT_FIGHTER_2"):InitRandomizeTemplate( TemplateTable_RAT_Fighter_Modern ):InitGrouping(ratBlueFightersGroupSize)
elseif mission_era == "ww2" then
	 rat_fighter_2=RAT:New("RAT_INIT", "RAT_FIGHTER_2"):InitRandomizeTemplate( TemplateTable_RAT_Fighter_WW2 ):InitGrouping(ratBlueFightersGroupSize)
elseif mission_era == "korean_war" then
	 rat_fighter_2=RAT:New("RAT_INIT", "RAT_FIGHTER_2"):InitRandomizeTemplate( TemplateTable_RAT_Fighter_Korean_War ):InitGrouping(ratBlueFightersGroupSize)
	 elseif mission_era == "cold_war" then
	 rat_fighter_2=RAT:New("RAT_INIT", "RAT_FIGHTER_2"):InitRandomizeTemplate( TemplateTable_RAT_Fighter_Cold_War ):InitGrouping(ratBlueFightersGroupSize)
end
rat_fighter_2:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
rat_fighter_2:Commute()
rat_fighter_2:InitRepeatOnEngineShutDown()
rat_fighter_2:SetTakeoff(airbase_blue_fighter_takeoff)
rat_fighter_2:SetDeparture({airbase_blue_fighter_1, airbase_blue_fighter_2})
rat_fighter_2:SetFLcruise(air_traffic_flight_level)
rat_fighter_2:SetDestination({"rat_blue_fighter_01_wpt", "rat_blue_fighter_02_wpt"})
rat_fighter_2:ReturnZone()
rat_fighter_2:TimeDestroyInactive(inactive_timer)
rat_fighter_2:ATC_Messages(false)
rat_fighter_2:RadioOFF()
rat_fighter_2:SetROE(roe_setting)
rat_fighter_2:SetROT("evade")
  if fighter_jet_immortal == true then
    rat_fighter_2:Immortal()
  end
  if fighter_jet_invisible == true then
    rat_fighter_2:Invisible()
  end
rat_fighter_2:RespawnAfterLanding(185)
--rat_fighter_2:SetSpawnDelay(55)

if mission_era == "modern" then
	 rat_fighter_3=RAT:New("RAT_INIT", "RAT_FIGHTER_3"):InitRandomizeTemplate( TemplateTable_RAT_Fighter_Modern ):InitGrouping(ratBlueFightersGroupSize)
elseif mission_era == "ww2" then
	 rat_fighter_3=RAT:New("RAT_INIT", "RAT_FIGHTER_3"):InitRandomizeTemplate( TemplateTable_RAT_Fighter_WW2 ):InitGrouping(ratBlueFightersGroupSize)
elseif mission_era == "korean_war" then
	 rat_fighter_3=RAT:New("RAT_INIT", "RAT_FIGHTER_3"):InitRandomizeTemplate( TemplateTable_RAT_Fighter_Korean_War ):InitGrouping(ratBlueFightersGroupSize)
	 elseif mission_era == "cold_war" then
	 rat_fighter_3=RAT:New("RAT_INIT", "RAT_FIGHTER_3"):InitRandomizeTemplate( TemplateTable_RAT_Fighter_Cold_War ):InitGrouping(ratBlueFightersGroupSize)
end
rat_fighter_3:SetTerminalType(AIRBASE.TerminalType.FighterAircraft)
rat_fighter_3:Commute()
rat_fighter_3:InitRepeatOnEngineShutDown()
rat_fighter_3:SetTakeoff(airbase_blue_fighter_takeoff)
rat_fighter_3:SetDeparture({airbase_blue_fighter_1, airbase_blue_fighter_2})
rat_fighter_3:SetDestination({"rat_blue_fighter_01_wpt", "rat_blue_fighter_02_wpt"})
rat_fighter_3:SetFLcruise(air_traffic_flight_level)
rat_fighter_3:ReturnZone()
rat_fighter_3:TimeDestroyInactive(inactive_timer)
rat_fighter_3:ATC_Messages(false)
rat_fighter_3:RadioOFF()
rat_fighter_3:SetROE(roe_setting)
rat_fighter_3:SetROT("evade")
if fighter_jet_immortal == true then
	rat_fighter_3:Immortal()
end
if fighter_jet_invisible == true then
	rat_fighter_3:Invisible()
end
rat_fighter_3:RespawnAfterLanding(185)
--rat_fighter_3:SetSpawnDelay(65)



function startRandomBlueFighterAirTraffic()
	if enable_fighter_1 == true then
		rat_fighter_1:Spawn(blue_fighter_1_rat_spawns)
		rat_fighter_1_spawned = true
	end
	if enable_fighter_1 == true then
		rat_fighter_2:Spawn(blue_fighter_2_rat_spawns)
		rat_fighter_2_spawned = true
	end
	if enable_fighter_1 == true then
		rat_fighter_3:Spawn(blue_fighter_3_rat_spawns)
		rat_fighter_3_spawned = true
	end
end

if random_blue_fighter_air_traffic == true then
	startRandomBlueFighterAirTraffic() -- start on start
end

--[[ -- moved to script load validation
if random_blue_fighter_air_traffic == true then

	timer.scheduleFunction(function() 
		trigger.action.outText("Random Fighter Air Traffic is ENABLED...", 10)
	end, nil, timer.getTime() + 8  )
	
	else

	timer.scheduleFunction(function() 
		trigger.action.outText("Random Fighter Air Traffic is DISABLED...", 10)
	end, nil, timer.getTime() + 8  )
end
--]]

if mission_era == "modern" then
	 rat_red_large_civ_1=RAT:New("RAT_INIT", "RAT_RED_LARGE_CIV_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Large_Modern_Civ ):InitGrouping(ratRedLargeGroupSize)
	elseif mission_era == "ww2" then
	rat_red_large_civ_1=RAT:New("RAT_INIT", "RAT_RED_LARGE_CIV_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Large_WW2_Civ ):InitGrouping(ratRedLargeGroupSize)
	elseif mission_era == "korean_war" then
	 rat_red_large_civ_1=RAT:New("RAT_INIT", "RAT_RED_LARGE_CIV_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Large_Korean_War_Civ ):InitGrouping(ratRedLargeGroupSize)
	elseif mission_era == "cold_war" then
	 rat_red_large_civ_1=RAT:New("RAT_INIT", "RAT_RED_LARGE_CIV_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Large_Cold_War_Civ ):InitGrouping(ratRedLargeGroupSize)
end
rat_red_large_civ_1:Commute()
rat_red_large_civ_1:InitRepeatOnEngineShutDown()
rat_red_large_civ_1:SetClimbRate(5000)
rat_red_large_civ_1:SetTakeoff(airbase_red_civ_takeoff)
rat_red_large_civ_1:SetDeparture({airbase_red_1, airbase_red_2, airbase_red_3,})
rat_red_large_civ_1:SetFLcruise(air_traffic_flight_level)
rat_red_large_civ_1:SetDestination({"rat_red_large_01_wpt", "rat_red_large_02_wpt",})
rat_red_large_civ_1:ReturnZone()
rat_red_large_civ_1:TimeDestroyInactive(inactive_timer)
rat_red_large_civ_1:ATC_Messages(false)
rat_red_large_civ_1:RespawnAfterLanding(185)

if mission_era == "modern" then
	 rat_red_large_mil_1=RAT:New("RAT_INIT", "RAT_RED_LARGE_MIL_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Large_Modern_Mil ):InitGrouping(ratRedLargeGroupSize)
	elseif mission_era == "ww2" then
	rat_red_large_mil_1=RAT:New("RAT_INIT", "RAT_RED_LARGE_MIL_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Large_WW2_Mil ):InitGrouping(ratRedLargeGroupSize)
	elseif mission_era == "korean_war" then
	 rat_red_large_mil_1=RAT:New("RAT_INIT", "RAT_RED_LARGE_MIL_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Large_Korean_War_Mil ):InitGrouping(ratRedLargeGroupSize)
	elseif mission_era == "cold_war" then
	 rat_red_large_mil_1=RAT:New("RAT_INIT", "RAT_RED_LARGE_MIL_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Large_Cold_War_Mil ):InitGrouping(ratRedLargeGroupSize)
end
rat_red_large_mil_1:Commute()
rat_red_large_mil_1:InitRepeatOnEngineShutDown()
rat_red_large_mil_1:SetClimbRate(5000)
rat_red_large_mil_1:SetTakeoff(airbase_red_mil_takeoff)
rat_red_large_mil_1:SetROE(roe_setting_red)
rat_red_large_mil_1:SetDeparture({airbase_red_1, airbase_red_2, airbase_red_3,})
rat_red_large_mil_1:SetFLcruise(air_traffic_flight_level)
rat_red_large_mil_1:SetDestination({"rat_red_large_01_wpt", "rat_red_large_02_wpt",})
rat_red_large_mil_1:ReturnZone()
rat_red_large_mil_1:TimeDestroyInactive(inactive_timer)
rat_red_large_mil_1:ATC_Messages(false)
rat_red_large_mil_1:RespawnAfterLanding(185)


rat_red_fighter_1=RAT:New("RAT_INIT", "RAT_RED_FIGHTER_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Fighter_Modern ):InitGrouping(ratRedFightersGroupSize)
if mission_era == "modern" then
		rat_red_fighter_1=RAT:New("RAT_INIT", "RAT_RED_FIGHTER_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Fighter_Modern ):InitGrouping(ratRedFightersGroupSize)
	elseif mission_era == "ww2" then
		rat_red_fighter_1=RAT:New("RAT_INIT", "RAT_RED_FIGHTER_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Fighter_WW2 ):InitGrouping(ratRedFightersGroupSize)
	elseif mission_era == "korean_war" then
		rat_red_fighter_1=RAT:New("RAT_INIT", "RAT_RED_FIGHTER_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Fighter_Korean_War ):InitGrouping(ratRedFightersGroupSize)
	elseif mission_era == "cold_war" then
		rat_red_fighter_1=RAT:New("RAT_INIT", "RAT_RED_FIGHTER_1"):InitRandomizeTemplate( TemplateTable_RAT_Red_Fighter_Cold_War ):InitGrouping(ratRedFightersGroupSize)
end
rat_red_fighter_1:Commute()
rat_red_fighter_1:InitRepeatOnEngineShutDown()
rat_red_fighter_1:SetClimbRate(5000)
rat_red_fighter_1:SetTakeoff(airbase_red_fighter_takeoff)
rat_red_fighter_1:SetROE(roe_setting_red)
rat_red_fighter_1:SetDeparture({airbase_red_1, airbase_red_2, airbase_red_3,})
rat_red_fighter_1:SetFLcruise(air_traffic_flight_level)
rat_red_fighter_1:SetDestination({"rat_red_fighter_01_wpt", "rat_red_fighter_02_wpt",})
rat_red_fighter_1:ReturnZone()
rat_red_fighter_1:TimeDestroyInactive(inactive_timer)
rat_red_fighter_1:ATC_Messages(false)
rat_red_fighter_1:RespawnAfterLanding(185)

function startRandomRedFighterAirTraffic()
rat_red_fighter_1:Spawn(rat_red_fighter_spawns)
rat_red_fighter_1_spawned = true
end

function startRandomRedCivLargeAirTraffic()
rat_red_large_civ_1:Spawn(rat_red_large_civ_spawns)
rat_red_large_civ_1_spawned = true
end

function startRandomRedMilLargeAirTraffic()
rat_red_large_mil_1:Spawn(rat_red_large_mil_spawns)
rat_red_large_mil_1_spawned = true
end

if random_red_air_large_civ_traffic == true then
startRandomRedCivLargeAirTraffic()
end

if random_red_air_large_mil_traffic == true then
startRandomRedMilLargeAirTraffic()
end

if random_red_air_fighter_traffic == true then
startRandomRedFighterAirTraffic()
end

---- FORCED RAT F10 Menu STUFF

function forceStartBlueRatLargeCivAirfield()
if rat_large_civ_1_spawned == nil or rat_large_civ_2_spawned == nil then
rat_large_civ_1:Spawn(blue_large_rat_spawns)
rat_large_civ_1_spawned = true
rat_large_civ_2:Spawn(blue_large_rat_spawns)
rat_large_civ_2_spawned = true
trigger.action.outText("RAT Script: Force Starting LARGE BLUE CIVILIAN RAT Planes", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: LARGE BLUE CIVILIAN RAT PLANES already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end

function forceStartBlueRatLargeMilAirfield()
if rat_large_mil_1_spawned == nil or rat_large_mil_2_spawned == nil then
rat_large_mil_1:Spawn(blue_large_rat_spawns)
rat_large_mil_1_spawned = true
rat_large_mil_2:Spawn(blue_large_rat_spawns)
rat_large_mil_2_spawned = true
trigger.action.outText("RAT Script: Force Starting LARGE BLUE MILITARY RAT Planes", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: LARGE BLUE MILITARY RAT PLANES already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end

function forceStartBlueRatFighterAirfield()
if rat_fighter_1_spawned == nil or rat_fighter_2_spawned == nil or rat_fighter_3_spawned == nil then
rat_fighter_1:Spawn(blue_fighter_1_rat_spawns)
rat_fighter_1_spawned = true
rat_fighter_2:Spawn(blue_fighter_2_rat_spawns)
rat_fighter_2_spawned = true
rat_fighter_3:Spawn(blue_fighter_3_rat_spawns)
rat_fighter_3_spawned = true
trigger.action.outText("RAT Script: Force Starting FIGHTER BLUE RAT Planes", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: FIGHTER BLUE RAT PLANES already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end

function forceStartBlueF18Cvn()
	if cv_cvn_enable == true and carrierOpsTheatre == true then
		if rat_f18_spawned == nil then
			rat_f18:Spawn(blue_fighter_rat_f18_spawns)
			rat_f18_spawned = true
			trigger.action.outText("RAT Script: Force Starting BLUE F/A-18C on CVN", 10)
			trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
		else
			trigger.action.outText("RAT Script: BLUE F/A-18C RAT PLANE already spawned, and can only be initialized once!", 10)
			trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
		end
	else
	trigger.action.outText("RAT Script: No carrier available for this spawn, check settings to enable carrier, and/or fly on carrier ops compatible map!", 10)
	trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	end
end

function forceStartBlueRatF14bCvn()
if cv_cvn_enable == true and carrierOpsTheatre == true then
if rat_f14b_spawned == nil then
rat_f14b:SetSpawnDelay(5)
rat_f14b:Spawn(blue_fighter_rat_f14b_spawns)
rat_f14b_spawned = true
trigger.action.outText("RAT Script: Force Starting F-14B on CVN", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: BLUE F-14B PLANES already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
else
trigger.action.outText("RAT Script: No carrier available for this spawn, check settings to enable carrier, and/or fly on carrier ops compatible map!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end

function forceStartBlueRatF14aCvn()
if cv_cvn_enable == true and carrierOpsTheatre == true then
if rat_f14a_spawned == nil then
rat_f14a:SetSpawnDelay(5)
rat_f14a:Spawn(blue_fighter_rat_f14a_spawns)
rat_f14a_spawned = true
trigger.action.outText("RAT Script: Force Starting F-14A on CVN", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: BLUE F-14A PLANES already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
else
trigger.action.outText("RAT Script: No carrier available for this spawn, check settings to enable carrier, and/or fly on carrier ops compatible map!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end

function forceStartBlueRatS3BCvn()
if cv_cvn_enable == true and carrierOpsTheatre == true then
if rat_s3b_spawned == nil then
rat_s3b:Spawn(blue_fighter_rat_s3b_spawns)
rat_s3b_spawned = true
trigger.action.outText("RAT Script: Force Starting BLUE S-3B on CVN", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: BLUE S-3B PLANES already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
else
trigger.action.outText("RAT Script: No carrier available for this spawn, check settings to enable carrier, and/or fly on carrier ops compatible map!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end

function forceStartBlueRatE2DCvn()
if cv_cvn_enable == true and carrierOpsTheatre == true then
if rat_e2d_spawned == nil then
rat_e2d:Spawn(blue_fighter_rat_e2d_spawns_spawns)
rat_e2d_spawned = true
trigger.action.outText("RAT Script: Force Starting BLUE E-2D on CVN", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: BLUE E-2D PLANES already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
else
trigger.action.outText("RAT Script: No carrier available for this spawn, check settings to enable carrier, and/or fly on carrier ops compatible map!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end

function forceStartBlueRatRandomCvn()
if cv_cvn_enable == true and carrierOpsTheatre == true then
if rat_random_cvn_rat_plane_spawned == nil then
rat_random_cvn_rat_plane:Spawn(rat_random_cvn_rat_plane_spawns)
rat_random_cvn_rat_plane_spawned = true
trigger.action.outText("RAT Script: Force Starting BLUE Random Aircraft on CVN", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: BLUE Random Aircraft on CVN already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
else
trigger.action.outText("RAT Script: No carrier available for this spawn, check settings to enable carrier, and/or fly on carrier ops compatible map!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end

function forceStartBlueRatAllCvn()
	if cv_cvn_enable == true and carrierOpsTheatre == true then
		-- if rat_random_cvn_rat_plane_spawned == nil then
			-- rat_random_cvn_rat_plane:Spawn(rat_random_cvn_rat_plane_spawns)
			-- rat_random_cvn_rat_plane_spawned = true
			-- trigger.action.outText("RAT Script: Force Starting BLUE Random Aircraft on CVN", 10)
			-- --trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
		-- else
			-- trigger.action.outText("RAT Script: BLUE Random Aircraft on CVN already spawned, and can only be initialized once!", 10)
			-- --trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
		-- end
		
		if rat_e2d_spawned == nil then
			rat_e2d:Spawn(blue_fighter_rat_e2d_spawns_spawns)
			rat_e2d_spawned = true
			trigger.action.outText("RAT Script: Force Starting BLUE E-2D on CVN", 10)
		else
			trigger.action.outText("RAT Script: BLUE E-2D PLANES already spawned, and can only be initialized once!", 10)
		end
		
		if rat_s3b_spawned == nil then
			rat_s3b:Spawn(blue_fighter_rat_s3b_spawns)
			rat_s3b_spawned = true
			trigger.action.outText("RAT Script: Force Starting BLUE S-3B on CVN", 10)
		else
			trigger.action.outText("RAT Script: BLUE S-3B PLANES already spawned, and can only be initialized once!", 10)
		end
		
		if rat_f14b_spawned == nil then
			rat_f14b:SetSpawnDelay(5)
			rat_f14b:Spawn(blue_fighter_rat_f14b_spawns)
			rat_f14b_spawned = true
			trigger.action.outText("RAT Script: Force Starting F-14B on CVN", 10)
		else
			trigger.action.outText("RAT Script: BLUE F-14B PLANES already spawned, and can only be initialized once!", 10)
		end
		
		if rat_f14a_spawned == nil then
			rat_f14a:SetSpawnDelay(5)
			rat_f14a:Spawn(blue_fighter_rat_f14a_spawns)
			rat_f14a_spawned = true
			trigger.action.outText("RAT Script: Force Starting F-14A on CVN", 10)
		else
			trigger.action.outText("RAT Script: BLUE F-14A PLANES already spawned, and can only be initialized once!", 10)
		end
	
		if rat_f18_spawned == nil then
			rat_f18:Spawn(blue_fighter_rat_f18_spawns)
			rat_f18_spawned = true
			trigger.action.outText("RAT Script: Force Starting BLUE F/A-18C on CVN", 10)
			trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
		else
			trigger.action.outText("RAT Script: BLUE F/A-18C RAT PLANE already spawned, and can only be initialized once!", 10)
		end
		
	trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )	
	
	else
		trigger.action.outText("RAT Script: No carrier available for this spawn, check settings to enable carrier, and/or fly on carrier ops compatible map!", 10)
		trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
	end
end

function forceStartBlueRatSu33Kuz()
if cv_kuz_enable == true and carrierOpsTheatre == true then
if rat_su33_spawned == nil then
rat_su33:Spawn(blue_fighter_rat_su33_spawns)
rat_su33_spawned = true
	trigger.action.outText("RAT Script: Force Starting BLUE Su-33 on Kuznetsov Carrier", 10)
	trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
	else
trigger.action.outText("RAT Script: BLUE Su-33 on Kuznetsov already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
else
trigger.action.outText("RAT Script: No carrier available for this spawn, check settings to enable carrier, and/or fly on carrier ops compatible map!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end

function forceStartBlueRatAv8bLha()
if cv_lha_enable == true and carrierOpsTheatre == true then
if rat_av8b_spawned == nil then
rat_av8b:Spawn(blue_fighter_rat_av8b_spawns)
rat_av8b_spawned = true
trigger.action.outText("RAT Script: Force Starting BLUE RAT AV-8B on LHA-1", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: BLUE RAT AV-8B on LHA-1 already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
else
trigger.action.outText("RAT Script: No carrier available for this spawn, check settings to enable carrier, and/or fly on carrier ops compatible map!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end


function forceStartBlueRatHeloLha()
if cv_lha_enable == true and carrierOpsTheatre == true and tti_sp_mt_hotfix ~= true then
if rat_random_lha_rat_helo_spawned == nil then
rat_random_lha_rat_helo:Spawn(rat_random_lha_rat_helo_spawns)
rat_random_lha_rat_helo_spawned = true
trigger.action.outText("RAT Script: Force Starting BLUE RAT HELO on LHA-1", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: BLUE RAT HELO on LHA-1 already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
else
trigger.action.outText("RAT Script: No carrier available for this spawn, check settings to enable carrier, and/or fly on carrier ops compatible map!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end

function forceStartRedRatLargeCivAirfield()
if rat_red_large_civ_1_spawned == nil then
rat_red_large_civ_1:Spawn(rat_red_large_civ_spawns)
rat_red_large_civ_1_spawned = true
trigger.action.outText("RAT Script: Force Starting LARGE RED CIVILIAN RAT Planes", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: LARGE RED CIVILIAN RAT PLANES already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end

function forceStartRedRatLargeMilAirfield()
if rat_red_large_mil_1_spawned == nil then
rat_red_large_mil_1:Spawn(rat_red_large_mil_spawns)
rat_red_large_mil_1_spawned = true
trigger.action.outText("RAT Script: Force Starting LARGE RED MILITARY RAT Planes", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: LARGE RED MILITARY RAT PLANES already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end

function forceStartRedRatFighterAirfield()
if rat_red_fighter_1_spawned == nil then
rat_red_fighter_1:Spawn(rat_red_fighter_spawns)
rat_red_fighter_1_spawned = true
trigger.action.outText("RAT Script: Force Starting FIGHTER RED RAT Planes", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
else
trigger.action.outText("RAT Script: FIGHTER RED RAT PLANES already spawned, and can only be initialized once!", 10)
trigger.action.outSound("TTI Soundfiles/BD_00006 back square.ogg" )
end
end




function destroyRedRatPlanes(allowReset)

--[[
rat_red_fighter_1:NoRespawn()
rat_red_large_civ_1:NoRespawn()
rat_red_large_mil_1:NoRespawn()
--]]

local groupName = nil
local units = nil
local ratRedGroups = coalition.getGroups(1, Group.Category.AIRPLANE)

for i = 1, #ratRedGroups do
    if ratRedGroups[i] ~= nil then
        groupName = ratRedGroups[i]:getName()
		units = getGroup(groupName)
		if string.find(groupName, "RAT_RED") then
			trigger.action.outText("Destroying RAT Red Group: " .. groupName, 10)
			Group.getByName(groupName):destroy()
		end    
	end
end

--[[
if allowReset == false then
	trigger.action.outText("RAT Script: Removing and disabling all RED RAT Aircraft for the remainder of the session.", 10)
	trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
	
	else
	
if random_red_air_large_civ_traffic == true then
startRandomRedCivLargeAirTraffic()
end

if random_red_air_large_mil_traffic == true then
startRandomRedMilLargeAirTraffic()
end

if random_red_air_fighter_traffic == true then
startRandomRedFighterAirTraffic()
end
	
	trigger.action.outText("RAT Script: Removing and resetting all RED RAT Aircraft", 10)
	trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
end
--]]
end



function destroyBlueRatPlanes(allowReset)
--[[
rat_large_civ_1
rat_large_civ_2
rat_large_mil_1
rat_large_mil_2
rat_fighter_1
rat_fighter_2
rat_fighter_3
--]]

local groupName = nil
local units = nil
local ratBlueGroups = coalition.getGroups(2, Group.Category.AIRPLANE)

for i = 1, #ratBlueGroups do
    if ratBlueGroups[i] ~= nil then
        groupName = ratBlueGroups[i]:getName()
		units = getGroup(groupName)
		if string.find(groupName, "RAT_") and not string.find(groupName, "RAT_INIT") then
			trigger.action.outText("Destroying RAT Blue Group: " .. groupName, 10)
			Group.getByName(groupName):destroy()
		end    
	end
end

trigger.action.outText("RAT Script: Removing and Disabling all BLUE RAT Aircraft for the remainder of the session.", 10)
trigger.action.outSound("TTI Soundfiles/BD_00007 single beep.ogg" )
end

function stopAllRatPlanes()
trigger.action.outText("RAT Script: Stopping all RAT FUNCTIONS", 10)
end


--[[
AIRBASE.Caucasus = {
  ["Anapa_Vityazevo"] = "Anapa-Vityazevo",
  ["Batumi"] = "Batumi",
  ["Beslan"] = "Beslan",
  ["Gelendzhik"] = "Gelendzhik",
  ["Gudauta"] = "Gudauta",
  ["Kobuleti"] = "Kobuleti",
  ["Krasnodar_Center"] = "Krasnodar-Center",
  ["Krasnodar_Pashkovsky"] = "Krasnodar-Pashkovsky",
  ["Krymsk"] = "Krymsk",
  ["Kutaisi"] = "Kutaisi",
  ["Maykop_Khanskaya"] = "Maykop-Khanskaya",
  ["Mineralnye_Vody"] = "Mineralnye Vody",
  ["Mozdok"] = "Mozdok",
  ["Nalchik"] = "Nalchik",
  ["Novorossiysk"] = "Novorossiysk",
  ["Senaki_Kolkhi"] = "Senaki-Kolkhi",
  ["Sochi_Adler"] = "Sochi-Adler",
  ["Soganlug"] = "Soganlug",
  ["Sukhumi_Babushara"] = "Sukhumi-Babushara",
  ["Tbilisi_Lochini"] = "Tbilisi-Lochini",
  ["Vaziani"] = "Vaziani",
}

-- @field Nevada
AIRBASE.Nevada = {
  ["Beatty"] = "Beatty",
  ["Boulder_City"] = "Boulder City",
  ["Creech"] = "Creech",
  ["Echo_Bay"] = "Echo Bay",
  ["Groom_Lake"] = "Groom Lake",
  ["Henderson_Executive"] = "Henderson Executive",
  ["Jean"] = "Jean",
  ["Laughlin"] = "Laughlin",
  ["Lincoln_County"] = "Lincoln County",
  ["McCarran_International"] = "McCarran International",
  ["Mesquite"] = "Mesquite",
  ["Mina"] = "Mina",
  ["Nellis"] = "Nellis",
  ["North_Las_Vegas"] = "North Las Vegas",
  ["Pahute_Mesa"] = "Pahute Mesa",
  ["Tonopah"] = "Tonopah",
  ["Tonopah_Test_Range"] = "Tonopah Test Range",
}

-- @field Normandy
AIRBASE.Normandy = {
  ["Abbeville_Drucat"] = "Abbeville Drucat",
  ["Amiens_Glisy"] = "Amiens-Glisy",
  ["Argentan"] = "Argentan",
  ["Avranches_Le_Val_Saint_Pere"] = "Avranches Le Val-Saint-Pere",
  ["Azeville"] = "Azeville",
  ["Barville"] = "Barville",
  ["Bazenville"] = "Bazenville",
  ["Beaumont_le_Roger"] = "Beaumont-le-Roger",
  ["Beauvais_Tille"] = "Beauvais-Tille",
  ["Beny_sur_Mer"] = "Beny-sur-Mer",
  ["Bernay_Saint_Martin"] = "Bernay Saint Martin",
  ["Beuzeville"] = "Beuzeville",
  ["Biggin_Hill"] = "Biggin Hill",
  ["Biniville"] = "Biniville",
  ["Broglie"] = "Broglie",
  ["Brucheville"] = "Brucheville",
  ["Cardonville"] = "Cardonville",
  ["Carpiquet"] = "Carpiquet",
  ["Chailey"] = "Chailey",
  ["Chippelle"] = "Chippelle",
  ["Conches"] = "Conches",
  ["Cormeilles_en_Vexin"] = "Cormeilles-en-Vexin",
  ["Creil"] = "Creil",
  ["Cretteville"] = "Cretteville",
  ["Cricqueville_en_Bessin"] = "Cricqueville-en-Bessin",
  ["Deanland"] = "Deanland",
  ["Deauville"] = "Deauville",
  ["Detling"] = "Detling",
  ["Deux_Jumeaux"] = "Deux Jumeaux",
  ["Dinan_Trelivan"] = "Dinan-Trelivan",
  ["Dunkirk_Mardyck"] = "Dunkirk-Mardyck",
  ["Essay"] = "Essay",
  ["Evreux"] = "Evreux",
  ["Farnborough"] = "Farnborough",
  ["Fecamp_Benouville"] = "Fecamp-Benouville",
  ["Flers"] = "Flers",
  ["Ford"] = "Ford",
  ["Friston"] = "Friston",
  ["Funtington"] = "Funtington",
  ["Goulet"] = "Goulet",
  ["Gravesend"] = "Gravesend",
  ["Guyancourt"] = "Guyancourt",
  ["Hauterive"] = "Hauterive",
  ["Heathrow"] = "Heathrow",
  ["High_Halden"] = "High Halden",
  ["Kenley"] = "Kenley",
  ["Lantheuil"] = "Lantheuil",
  ["Le_Molay"] = "Le Molay",
  ["Lessay"] = "Lessay",
  ["Lignerolles"] = "Lignerolles",
  ["Longues_sur_Mer"] = "Longues-sur-Mer",
  ["Lonrai"] = "Lonrai",
  ["Lymington"] = "Lymington",
  ["Lympne"] = "Lympne",
  ["Manston"] = "Manston",
  ["Maupertus"] = "Maupertus",
  ["Meautis"] = "Meautis",
  ["Merville_Calonne"] = "Merville Calonne",
  ["Needs_Oar_Point"] = "Needs Oar Point",
  ["Odiham"] = "Odiham",
  ["Orly"] = "Orly",
  ["Picauville"] = "Picauville",
  ["Poix"] = "Poix",
  ["Ronai"] = "Ronai",
  ["Rouen_Boos"] = "Rouen-Boos",
  ["Rucqueville"] = "Rucqueville",
  ["Saint_Andre_de_lEure"] = "Saint-Andre-de-lEure",
  ["Saint_Aubin"] = "Saint-Aubin",
  ["Saint_Omer_Wizernes"] = "Saint-Omer Wizernes",
  ["Saint_Pierre_du_Mont"] = "Saint Pierre du Mont",
  ["Sainte_Croix_sur_Mer"] = "Sainte-Croix-sur-Mer",
  ["Sainte_Laurent_sur_Mer"] = "Sainte-Laurent-sur-Mer",
  ["Sommervieu"] = "Sommervieu",
  ["Stoney_Cross"] = "Stoney Cross",
  ["Tangmere"] = "Tangmere",
  ["Triqueville"] = "Triqueville",
  ["Villacoublay"] = "Villacoublay",
  ["Vrigny"] = "Vrigny",
  ["West_Malling"] = "West Malling",
  ["Eastchurch"] = "Eastchurch",
  ["Headcorn"] = "Headcorn",
  ["Hawkinge"] = "Hawkinge",
}

-- @field PersianGulf
AIRBASE.PersianGulf = {
  ["Abu_Dhabi_Intl"] = "Abu Dhabi Intl",
  ["Abu_Musa_Island"] = "Abu Musa Island",
  ["Al_Ain_Intl"] = "Al Ain Intl",
  ["Al_Bateen"] = "Al-Bateen",
  ["Al_Dhafra_AFB"] = "Al Dhafra AFB",
  ["Al_Maktoum_Intl"] = "Al Maktoum Intl",
  ["Al_Minhad_AFB"] = "Al Minhad AFB",
  ["Bandar_Abbas_Intl"] = "Bandar Abbas Intl",
  ["Bandar_Lengeh"] = "Bandar Lengeh",
  ["Bandar_e_Jask"] = "Bandar-e-Jask",
  ["Dubai_Intl"] = "Dubai Intl",
  ["Fujairah_Intl"] = "Fujairah Intl",
  ["Havadarya"] = "Havadarya",
  ["Jiroft"] = "Jiroft",
  ["Kerman"] = "Kerman",
  ["Khasab"] = "Khasab",
  ["Kish_Intl"] = "Kish Intl",
  ["Lar"] = "Lar",
  ["Lavan_Island"] = "Lavan Island",
  ["Liwa_AFB"] = "Liwa AFB",
  ["Qeshm_Island"] = "Qeshm Island",
  ["Quasoura_airport"] = "Quasoura_airport",
  ["Ras_Al_Khaimah_Intl"] = "Ras Al Khaimah Intl",
  ["Sas_Al_Nakheel"] = "Sas Al Nakheel",
  ["Sharjah_Intl"] = "Sharjah Intl",
  ["Shiraz_Intl"] = "Shiraz Intl",
  ["Sir_Abu_Nuayr"] = "Sir Abu Nuayr",
  ["Sirri_Island"] = "Sirri Island",
  ["Tunb_Island_AFB"] = "Tunb Island AFB",
  ["Tunb_Kochak"] = "Tunb Kochak",
}

-- @field TheChannel
AIRBASE.TheChannel = {
  ["Abbeville_Drucat"] = "Abbeville Drucat",
  ["Biggin_Hill"] = "Biggin Hill",
  ["Detling"] = "Detling",
  ["Dunkirk_Mardyck"] = "Dunkirk Mardyck",
  ["Eastchurch"] = "Eastchurch",
  ["Hawkinge"] = "Hawkinge",
  ["Headcorn"] = "Headcorn",
  ["High_Halden"] = "High Halden",
  ["Lympne"] = "Lympne",
  ["Manston"] = "Manston",
  ["Merville_Calonne"] = "Merville Calonne",
  ["Saint_Omer_Longuenesse"] = "Saint Omer Longuenesse",
}

--@field Syria
AIRBASE.Syria={
  ["Abu_al_Duhur"] = "Abu al-Duhur",
  ["Adana_Sakirpasa"] = "Adana Sakirpasa",
  ["Akrotiri"] = "Akrotiri",
  ["Al_Dumayr"] = "Al-Dumayr",
  ["Al_Qusayr"] = "Al Qusayr",
  ["Aleppo"] = "Aleppo",
  ["Amman"] = "Amman",
  ["An_Nasiriyah"] = "An Nasiriyah",
  ["At_Tanf"] = "At Tanf",
  ["Bassel_Al_Assad"] = "Bassel Al-Assad",
  ["Beirut_Rafic_Hariri"] = "Beirut-Rafic Hariri",
  ["Damascus"] = "Damascus",
  ["Deir_ez_Zor"] = "Deir ez-Zor",
  ["Ercan"] = "Ercan",
  ["Eyn_Shemer"] = "Eyn Shemer",
  ["Gaziantep"] = "Gaziantep",
  ["Gazipasa"] = "Gazipasa",
  ["Gecitkale"] = "Gecitkale",
  ["H"] = "H",
  ["H3"] = "H3",
  ["H3_Northwest"] = "H3 Northwest",
  ["H3_Southwest"] = "H3 Southwest",
  ["H4"] = "H4",
  ["Haifa"] = "Haifa",
  ["Hama"] = "Hama",
  ["Hatay"] = "Hatay",
  ["Herzliya"] = "Herzliya",
  ["Incirlik"] = "Incirlik",
  ["Jirah"] = "Jirah",
  ["Khalkhalah"] = "Khalkhalah",
  ["Kharab_Ishk"] = "Kharab Ishk",
  ["King_Abdullah_II"] = "King Abdullah II",
  ["King_Hussein_Air_College"] = "King Hussein Air College",
  ["Kingsfield"] = "Kingsfield",
  ["Kiryat_Shmona"] = "Kiryat Shmona",
  ["Kuweires"] = "Kuweires",
  ["Lakatamia"] = "Lakatamia",
  ["Larnaca"] = "Larnaca",
  ["Marj_Ruhayyil"] = "Marj Ruhayyil",
  ["Marj_as_Sultan_North"] = "Marj as Sultan North",
  ["Marj_as_Sultan_South"] = "Marj as Sultan South",
  ["Megiddo"] = "Megiddo",
  ["Mezzeh"] = "Mezzeh",
  ["Minakh"] = "Minakh",
  ["Muwaffaq_Salti"] = "Muwaffaq Salti",
  ["Naqoura"] = "Naqoura",
  ["Nicosia"] = "Nicosia",
  ["Palmyra"] = "Palmyra",
  ["Paphos"] = "Paphos",
  ["Pinarbashi"] = "Pinarbashi",
  ["Prince_Hassan"] = "Prince Hassan",
  ["Qabr_as_Sitt"] = "Qabr as Sitt",
  ["Ramat_David"] = "Ramat David",
  ["Rayak"] = "Rayak",
  ["Rene_Mouawad"] = "Rene Mouawad",
  ["Rosh_Pina"] = "Rosh Pina",
  ["Ruwayshid"] = "Ruwayshid",
  ["Sanliurfa"] = "Sanliurfa",
  ["Sayqal"] = "Sayqal",
  ["Shayrat"] = "Shayrat",
  ["Tabqa"] = "Tabqa",
  ["Taftanaz"] = "Taftanaz",
  ["Tal_Siman"] = "Tal Siman",
  ["Tha_lah"] = "Tha'lah",
  ["Tiyas"] = "Tiyas",
  ["Wujah_Al_Hajar"] = "Wujah Al Hajar",
  ["Ben_Gurion"] = "Ben Gurion",
  ["Hatzor"] = "Hatzor",
  ["Palmashim"] = "Palmashim",
  ["Tel_Nof"] = "Tel Nof",
}

-- @field MarianaIslands
AIRBASE.MarianaIslands = {
  ["Andersen_AFB"] = "Andersen AFB",
  ["Antonio_B_Won_Pat_Intl"] = "Antonio B. Won Pat Intl",
  ["North_West_Field"] = "North West Field",
  ["Olf_Orote"] = "Olf Orote",
  ["Pagan_Airstrip"] = "Pagan Airstrip",
  ["Rota_Intl"] = "Rota Intl",
  ["Saipan_Intl"] = "Saipan Intl",
  ["Tinian_Intl"] = "Tinian Intl",
}

--@field SouthAtlantic
AIRBASE.SouthAtlantic={
  ["Almirante_Schroeders"] = "Almirante Schroeders",
  ["Comandante_Luis_Piedrabuena"] = "Comandante Luis Piedrabuena",
  ["Cullen"] = "Cullen",
  ["El_Calafate"] = "El Calafate",
  ["Franco_Bianco"] = "Franco Bianco",
  ["Gobernador_Gregores"] = "Gobernador Gregores",
  ["Goose_Green"] = "Goose Green",
  ["Gull_Point"] = "Gull Point",
  ["Hipico_Flying_Club"] = "Hipico Flying Club",
  ["Mount_Pleasant"] = "Mount Pleasant",
  ["O_Higgins"] = "O'Higgins",
  ["Pampa_Guanaco"] = "Pampa Guanaco",
  ["Port_Stanley"] = "Port Stanley",
  ["Porvenir"] = "Porvenir",
  ["Puerto_Natales"] = "Puerto Natales",
  ["Puerto_Santa_Cruz"] = "Puerto Santa Cruz",
  ["Puerto_Williams"] = "Puerto Williams",
  ["Punta_Arenas"] = "Punta Arenas",
  ["Rio_Chico"] = "Rio Chico",
  ["Rio_Gallegos"] = "Rio Gallegos",
  ["Rio_Grande"] = "Rio Grande",
  ["Rio_Turbio"] = "Rio Turbio",
  ["San_Carlos_FOB"] = "San Carlos FOB",
  ["San_Julian"] = "San Julian",
  ["Tolhuin"] = "Tolhuin",
  ["Ushuaia"] = "Ushuaia",
  ["Ushuaia_Helo_Port"] = "Ushuaia Helo Port",
}

-- @field Sinai
AIRBASE.Sinai = {
  ["Abu_Rudeis"] = "Abu Rudeis",
  ["Abu_Suwayr"] = "Abu Suwayr",
  ["Al_Bahr_al_Ahmar"] = "Al Bahr al Ahmar",
  ["Al_Ismailiyah"] = "Al Ismailiyah",
  ["Al_Khatatbah"] = "Al Khatatbah",
  ["Al_Mansurah"] = "Al Mansurah",
  ["Al_Rahmaniyah_Air_Base"] = "Al Rahmaniyah Air Base",
  ["As_Salihiyah"] = "As Salihiyah",
  ["AzZaqaziq"] = "AzZaqaziq",
  ["Baluza"] = "Baluza",
  ["Ben_Gurion"] = "Ben-Gurion",
  ["Beni_Suef"] = "Beni Suef",
  ["Bilbeis_Air_Base"] = "Bilbeis Air Base",
  ["Bir_Hasanah"] = "Bir Hasanah",
  ["Birma_Air_Base"] = "Birma Air Base",
  ["Borj_El_Arab_International_Airport"] = "Borj El Arab International Airport",
  ["Cairo_International_Airport"] = "Cairo International Airport",
  ["Cairo_West"] = "Cairo West",
  ["Difarsuwar_Airfield"] = "Difarsuwar Airfield",
  ["El_Arish"] = "El Arish",
  ["El_Gora"] = "El Gora",
  ["El_Minya"] = "El Minya",
  ["Fayed"] = "Fayed",
  ["Gebel_El_Basur_Air_Base"] = "Gebel El Basur Air Base",
  ["Hatzerim"] = "Hatzerim",
  ["Hatzor"] = "Hatzor",
  ["Hurghada_International_Airport"] = "Hurghada International Airport",
  ["Inshas_Airbase"] = "Inshas Airbase",
  ["Jiyanklis_Air_Base"] = "Jiyanklis Air Base",
  ["Kedem"] = "Kedem",
  ["Kibrit_Air_Base"] = "Kibrit Air Base",
  ["Kom_Awshim"] = "Kom Awshim",
  ["Melez"] = "Melez",
  ["Nevatim"] = "Nevatim",
  ["Ovda"] = "Ovda",
  ["Palmachim"] = "Palmachim",
  ["Quwaysina"] = "Quwaysina",
  ["Ramon_Airbase"] = "Ramon Airbase",
  ["Ramon_International_Airport"] = "Ramon International Airport",
  ["Sde_Dov"] = "Sde Dov",
  ["Sharm_El_Sheikh_International_Airport"] = "Sharm El Sheikh International Airport",
  ["St_Catherine"] = "St Catherine",
  ["Tel_Nof"] = "Tel Nof",
  ["Wadi_Abu_Rish"] = "Wadi Abu Rish",
  ["Wadi_al_Jandali"] = "Wadi al Jandali",
}


-- @field Kola
AIRBASE.Kola = {
  ["Banak"] = "Banak",
  ["Bodo"] = "Bodo",
  ["Ivalo"] = "Ivalo",
  ["Jokkmokk"] = "Jokkmokk",
  ["Kalixfors"] = "Kalixfors",
  ["Kallax"] = "Kallax",
  ["Kemi_Tornio"] = "Kemi Tornio",
  ["Kirkenes"] = "Kirkenes",
  ["Kiruna"] = "Kiruna",
  ["Kuusamo"] = "Kuusamo",
  ["Monchegorsk"] = "Monchegorsk",
  ["Murmansk_International"] = "Murmansk International",
  ["Olenya"] = "Olenya",
  ["Rovaniemi"] = "Rovaniemi",
  ["Severomorsk_1"] = "Severomorsk-1",
  ["Severomorsk_3"] = "Severomorsk-3",
  ["Vidsel"] = "Vidsel",
  ["Vuojarvi"] = "Vuojarvi",
  ["Andoya"] = "Andoya",
  ["Alakourtti"] = "Alakourtti",
}

-- @field Afghanistan
AIRBASE.Afghanistan = {
  ["Bost"] = "Bost",
  ["Camp_Bastion"] = "Camp Bastion",
  ["Camp_Bastion_Heliport"] = "Camp Bastion Heliport",
  ["Chaghcharan"] = "Chaghcharan",
  ["Dwyer"] = "Dwyer",
  ["Farah"] = "Farah",
  ["Herat"] = "Herat",
  ["Kandahar"] = "Kandahar",
  ["Kandahar_Heliport"] = "Kandahar Heliport",
  ["Maymana_Zahiraddin_Faryabi"] = "Maymana Zahiraddin Faryabi",
  ["Nimroz"] = "Nimroz",
  ["Qala_i_Naw"] = "Qala i Naw",
  ["Shindand"] = "Shindand",
  ["Shindand_Heliport"] = "Shindand Heliport",
  ["Tarinkot"] = "Tarinkot",
}
--]]

env.info('RAT Script complete')
tti_random_air_traffic_script_loaded = true