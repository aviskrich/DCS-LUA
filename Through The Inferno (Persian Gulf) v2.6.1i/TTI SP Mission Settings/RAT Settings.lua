--ADJUST RANDOM AI AIR TRAFFIC SPAWN SETTINGS HERE
--READ THE MISSION SETTINGS --README FILE FOR MORE DETAILS


random_blue_large_civ_air_traffic = true
random_blue_large_mil_air_traffic = true
random_blue_fighter_air_traffic = true

-- # of civ aircraft spawns PER TYPE,


-- allow RAT F10 Menu for all players
enable_rat_f10_menu = true

-- set # of fighter aircraft spawns, for each type individually
blue_large_rat_spawns = 1
blue_fighter_1_rat_spawns = 1
blue_fighter_2_rat_spawns = 1
blue_fighter_3_rat_spawns = 1

blue_fighter_rat_f14a_spawns = 1
blue_fighter_rat_f14b_spawns = 1
blue_fighter_rat_f18_spawns = 1
blue_fighter_rat_su33_spawns = 1
blue_fighter_rat_av8b_spawns = 1
rat_random_lha_rat_helo_spawns = 1

-- set # of units in fighter groups, max 2
ratBlueFightersGroupSize = 1
ratBlueCvnFightersGroupSize = 2
ratBlueLhaFightersGroupSize = 1
ratBlueLhaHeloGroupSize = 1

air_traffic_flight_level = 300
--example:  200 = 20000ft

max_distance_destination = 380
--the max distance in KM 
--of the ai aircaft's final destination airfield, which are chosen at random

large_allow_immortal = false 
large_allow_invisible = false

fighter_jet_combat_mode = "return"
-- LEAVE IN QOUTES " " 
-- free is weapons free
-- hold is weapons hold
-- return is return firef

fighter_jet_immortal = false 
fighter_jet_invisible = false

--change takeoff setting for carrier ai aircraft
-- use "hot", "cold", or "runway"
cv_takeoff_mode = "hot"

-- enable or disable ai aircraft types that will spawn in (use true or false)
enable_large_civ_1 = true
enable_large_civ_2 = false
enable_large_mil_1 = true
enable_large_mil_2 = false

-- fighter jet

enable_fighter_1 = true
enable_fighter_2 = true
enable_fighter_3 = false

--carrier aircraft
enable_f14a = false
enable_f14b = true
enable_f18 = true
enable_s3b = true
enable_e2d = true

enable_av8b = true
enable_su33 = true

enable_random_cvn_rat_plane = false
enable_random_lha_rat_helo = true

su33_ai_traffic_start_on_su33_spawn = true
av8b_ai_traffic_start_on_av8b_spawn = true
cvn_ai_traffic_start_on_cvn_spawn = true

----RED RAT PLANES
random_red_air_large_civ_traffic = false
random_red_air_large_mil_traffic = true
random_red_air_fighter_traffic = false

rat_red_large_civ_spawns = 1
rat_red_large_mil_spawns = 1
rat_red_fighter_spawns = 1
ratRedFightersGroupSize = 1
ratRedLargeGroupSize = 1

TemplateTable_RAT_Large_Modern_Mil = {
----transports
--"blue_transport_an26b_ukr",
--"blue_transport_an26b_abk",
--"blue_transport_an26b_gr",
--"blue_transport_an30m",
"blue_transport_c130",
"blue_transport_c17a",
--"blue_transport_il76",
--"blue_transport_yak40_gr",
--"blue_transport_yak40_olympic",

----bombers
"blue_bombing_b1b",
--"blue_bombing_b52",
--"blue_bombing_tu22m3",
--"blue_bombing_h6j",
----bombers ww2
--"blue_bombing_a20g",
--"blue_bombing_mosquito",
}

TemplateTable_RAT_Large_Modern_Civ = {

----transports
"blue_transport_an26b_ukr",
"blue_transport_an26b_abk",
"blue_transport_an26b_gr",
"blue_transport_an30m",
--"blue_transport_c130",
--"blue_transport_c17a",
--"blue_transport_il76",
"blue_transport_yak40_gr",
"blue_transport_yak40_olympic",

----bombers
--"blue_bombing_b1b",
--"blue_bombing_b52",
--"blue_bombing_tu22m3",
--"blue_bombing_h6j",
----bombers ww2
--"blue_bombing_a20g",
--"blue_bombing_mosquito",
}

TemplateTable_RAT_Large_WW2_Civ = {

----transports
--"blue_transport_an26b_ukr",
--"blue_transport_an26b_abk",
--"blue_transport_an26b_gr",
--"blue_transport_an30m",
--"blue_transport_c130",
--"blue_transport_c17a",
--"blue_transport_il76",
--"blue_transport_yak40_gr",
--"blue_transport_yak40_olympic",

----bombers
--"blue_bombing_b1b",
--"blue_bombing_b52",
--"blue_bombing_tu22m3",
--"blue_bombing_h6j",
----bombers ww2
"blue_bombing_a20g",
--"blue_bombing_mosquito",
}

TemplateTable_RAT_Large_WW2_Mil = {

----transports
--"blue_transport_an26b_ukr",
--"blue_transport_an26b_abk",
--"blue_transport_an26b_gr",
--"blue_transport_an30m",
--"blue_transport_c130",
--"blue_transport_c17a",
--"blue_transport_il76",
--"blue_transport_yak40_gr",
--"blue_transport_yak40_olympic",

----bombers
--"blue_bombing_b1b",
--"blue_bombing_b52",
--"blue_bombing_tu22m3",
--"blue_bombing_h6j",
----bombers ww2
"blue_bombing_a20g",
"blue_bombing_mosquito",
}




TemplateTable_RAT_Large_Korean_War_Civ = {
----transports
--"blue_transport_an26b_ukr",
--"blue_transport_an26b_abk",
--"blue_transport_an26b_gr",
--"blue_transport_an30m",
--"blue_transport_c130",
--"blue_transport_c17a",
--"blue_transport_il76",
--"blue_transport_yak40_gr",
--"blue_transport_yak40_olympic",

----bombers
--"blue_bombing_b1b",
--"blue_bombing_b52",
--"blue_bombing_tu22m3",
--"blue_bombing_h6j",
----bombers ww2
"blue_bombing_a20g",
--"blue_bombing_mosquito",
}

TemplateTable_RAT_Large_Korean_War_Mil = {
----transports
--"blue_transport_an26b_ukr",
--"blue_transport_an26b_abk",
--"blue_transport_an26b_gr",
--"blue_transport_an30m",
--"blue_transport_c130",
--"blue_transport_c17a",
--"blue_transport_il76",
--"blue_transport_yak40_gr",
--"blue_transport_yak40_olympic",

----bombers
--"blue_bombing_b1b",
--"blue_bombing_b52",
--"blue_bombing_tu22m3",
--"blue_bombing_h6j",
----bombers ww2
--"blue_bombing_a20g",
"blue_bombing_mosquito",
}

TemplateTable_RAT_Large_Cold_War_Mil = {
----transports
"blue_transport_an26b_ukr",
"blue_transport_an26b_abk",
"blue_transport_an26b_gr",
"blue_transport_an30m",
"blue_transport_c130",
--"blue_transport_c17a",
--"blue_transport_il76",
"blue_transport_yak40_gr",
"blue_transport_yak40_olympic",

----bombers
--"blue_bombing_b1b",
--"blue_bombing_b52",
"blue_bombing_tu22m3",
--"blue_bombing_h6j",
----bombers ww2
--"blue_bombing_a20g",
--"blue_bombing_mosquito",
}

TemplateTable_RAT_Large_Cold_War_Civ = {
----transports
"blue_transport_an26b_ukr",
"blue_transport_an26b_abk",
"blue_transport_an26b_gr",
"blue_transport_an30m",
"blue_transport_c130",
--"blue_transport_c17a",
--"blue_transport_il76",
"blue_transport_yak40_gr",
"blue_transport_yak40_olympic",

----bombers
--"blue_bombing_b1b",
--"blue_bombing_b52",
--"blue_bombing_tu22m3",
--"blue_bombing_h6j",
----bombers ww2
--"blue_bombing_a20g",
--"blue_bombing_mosquito",
}


TemplateTable_RAT_Fighter_Modern = {
----USA
--"blue_cap_f18",
--"blue_cap_f4",
--"blue_cap_f14a",
"blue_cap_f15",
--"blue_cap_f16",
--"blue_cap_f14b",
"blue_cap_f5",

----trainer
"blue_cap_l39",
"blue_cap_c101",
"blue_cap_mb339",

----Multinational Modern
--"blue_cap_su27",
--"blue_cap_su30",
--"blue_cap_su33",
--"blue_cap_su34",
--"blue_cap_j11",
--"blue_cap_jf17",
--"blue_cap_mig25",
--"blue_cap_mig29s",
--"blue_cap_mig23",
"blue_cap_m2000",
--"blue_cap_m20005",
--"blue_cap_mf1",
--"blue_cap_mig29a",
--"blue_cap_mig31",
--"blue_cap_mig21",
--"blue_cap_su24mr",
--"blue_cap_su24m",
--"blue_cap_su17m4",
--"blue_cap_mig27k",
--"blue_cap_ajs37",

----Korean War
--"blue_cap_mig15",
--"blue_cap_mig19",
--"blue_cap_f86",

----WW2
--"blue_cap_spitfire",
--"blue_cap_p51",
--"blue_cap_p47",
--"blue_cap_bf109",
--"blue_cap_fw190",
--"blue_cap_i16",

----CAS
---USA
"blue_cas_av8b",
"blue_cas_f117a",
--"blue_cas_a10",
"blue_cas_f15e",
"blue_cas_f16",

--RUS, EU
--"blue_cas_su25",
--"blue_cas_su25t",
"blue_cas_ajs37",
"blue_cas_tornadoids",
"blue_cas_tornadogr4",

---drones
"blue_cas_mq9",
"blue_cas_mq1a",
}


TemplateTable_RAT_Fighter_WW2 = {
"blue_cap_spitfire",
"blue_cap_p51",
"blue_cap_p47",
--"blue_cap_bf109",
--"blue_cap_fw190",
--"blue_cap_i16",
}


TemplateTable_RAT_Fighter_Cold_War = {
----USA
--"blue_cap_f18",
"blue_cap_f4",
--"blue_cap_f14a",
--"blue_cap_f15",
--"blue_cap_f16",
--"blue_cap_f14b",
"blue_cap_f5",

----trainer
"blue_cap_l39",
"blue_cap_c101",
"blue_cap_mb339",

----Multinational Modern
--"blue_cap_su27",
--"blue_cap_su30",
--"blue_cap_su33",
--"blue_cap_su34",
--"blue_cap_j11",
--"blue_cap_jf17",
--"blue_cap_mig25",
--"blue_cap_mig29s",
--"blue_cap_mig23",
--"blue_cap_m2000",
--"blue_cap_m20005",
"blue_cap_mf1",
--"blue_cap_mig29a",
--"blue_cap_mig31",
--"blue_cap_mig21",
--"blue_cap_su24mr",
--"blue_cap_su24m",
--"blue_cap_su17m4",
--"blue_cap_mig27k",
--"blue_cap_ajs37",

----Korean War
--"blue_cap_mig15",
"blue_cap_mig19",
--"blue_cap_f86",

----WW2
--"blue_cap_spitfire",
--"blue_cap_p51",
--"blue_cap_p47",
--"blue_cap_bf109",
--"blue_cap_fw190",
--"blue_cap_i16",

----CAS
---USA
--"blue_cas_av8b",
--"blue_cas_f117a",
--"blue_cas_a10",
--"blue_cas_f15e",
--"blue_cas_f16",

--RUS, EU
--"blue_cas_su25",
--"blue_cas_su25t",
"blue_cas_ajs37",
--"blue_cas_tornadoids",
--"blue_cas_tornadogr4",

---drones
--"blue_cas_mq9",
--"blue_cas_mq1a",
}

TemplateTable_RAT_Fighter_Korean_War = {
"blue_cap_f86",
"blue_cap_p51",
--"blue_cap_mig19",
--"blue_cap_mig15",
}

TemplateTable_RAT_Red_Large_Modern_Civ = {
----transports
--"red_transport_an26b_ru",
--"red_transport_an26b_cn",
--"red_transport_an30m",
--"red_transport_c130",
--"red_transport_c17a",
--"red_transport_il76",
"red_transport_yak40_ru",
"red_transport_yak40_olympic",

----bombers
--"red_bombing_tu22m3",
--"red_bombing_b1b",
--"red_bombing_b52",
--"red_bombing_tornado",
--"red_bombing_h6j",
--"red_bombing_su34",
}

TemplateTable_RAT_Red_Large_Cold_War_Civ = {
----transports
--"red_transport_an26b_ru",
--"red_transport_an26b_cn",
--"red_transport_an30m",
--"red_transport_c130",
--"red_transport_c17a",
--"red_transport_il76",
"red_transport_yak40_ru",
"red_transport_yak40_olympic",

----bombers
--"red_bombing_tu22m3",
--"red_bombing_b1b",
--"red_bombing_b52",
--"red_bombing_tornado",
--"red_bombing_h6j",
--"red_bombing_su34",
}

TemplateTable_RAT_Red_Large_Korean_War_Civ = {
----transports
--"red_transport_an26b_ru",
--"red_transport_an26b_cn",
--"red_transport_an30m",
--"red_transport_c130",
--"red_transport_c17a",
--"red_transport_il76",
--"red_transport_yak40_ru",
--"red_transport_yak40_olympic",

----bombers
--"red_bombing_tu22m3",
--"red_bombing_b1b",
--"red_bombing_b52",
--"red_bombing_tornado",
--"red_bombing_h6j",
--"red_bombing_su34",
"red_bombing_a20g",
}

TemplateTable_RAT_Red_Large_WW2_Civ = {
----transports
--"red_transport_an26b_ru",
--"red_transport_an26b_cn",
--"red_transport_an30m",
--"red_transport_c130",
--"red_transport_c17a",
--"red_transport_il76",
--"red_transport_yak40_ru",
--"red_transport_yak40_olympic",

----bombers
--"red_bombing_tu22m3",
--"red_bombing_b1b",
--"red_bombing_b52",
--"red_bombing_tornado",
--"red_bombing_h6j",
--"red_bombing_su34",
"red_bombing_a20g",
}

TemplateTable_RAT_Red_Large_Modern_Mil = {

----transports
"red_transport_an26b_ru",
"red_transport_an26b_cn",
"red_transport_an30m",
"red_transport_c130",
--"red_transport_c17a",
"red_transport_il76_ru",
"red_transport_il76_cn",
--"red_transport_yak40_ru",
--"red_transport_yak40_olympic",
"red_transport_awacs_kj2000",
"red_transport_awacs_a50",

----bombers
"red_bombing_tu22m3",
--"red_bombing_b1b",
--"red_bombing_b52",
--"red_bombing_tornado",
"red_bombing_h6j",
--"red_bombing_su34",
}

TemplateTable_RAT_Red_Large_Cold_War_Mil = {

----transports
"red_transport_an26b_ru",
"red_transport_an26b_cn",
"red_transport_an30m",
"red_transport_c130",
--"red_transport_c17a",
--"red_transport_il76_ru",
--"red_transport_il76_cn",
--"red_transport_yak40_ru",
--"red_transport_yak40_olympic",
--"red_transport_awacs_kj2000",
--"red_transport_awacs_a50",

----bombers
--"red_bombing_tu22m3",
--"red_bombing_b1b",
--"red_bombing_b52",
--"red_bombing_tornado",
--"red_bombing_h6j",
--"red_bombing_su34",
}

TemplateTable_RAT_Red_Large_Korean_War_Mil = {

----transports
--"red_transport_an26b_ru",
--"red_transport_an26b_cn",
--"red_transport_an30m",
--"red_transport_c130",
--"red_transport_c17a",
--"red_transport_il76_ru",
--"red_transport_il76_cn",
--"red_transport_yak40_ru",
--"red_transport_yak40_olympic",
--"red_transport_awacs_kj2000",
--"red_transport_awacs_a50",

----bombers
--"red_bombing_tu22m3",
--"red_bombing_b1b",
--"red_bombing_b52",
--"red_bombing_tornado",
--"red_bombing_h6j",
--"red_bombing_su34",
"red_bombing_a20g",
}
TemplateTable_RAT_Red_Large_WW2_Mil = {

----transports
--"red_transport_an26b_ru",
--"red_transport_an26b_cn",
--"red_transport_an30m",
--"red_transport_c130",
--"red_transport_c17a",
--"red_transport_il76_ru",
--"red_transport_il76_cn",
--"red_transport_yak40_ru",
--"red_transport_yak40_olympic",
--"red_transport_awacs_kj2000",
--"red_transport_awacs_a50",

----bombers
--"red_bombing_tu22m3",
--"red_bombing_b1b",
--"red_bombing_b52",
--"red_bombing_tornado",
--"red_bombing_h6j",
"red_bombing_a20g",
}

TemplateTable_RAT_Red_Fighter_Modern = {
--CAP
----USA
--"red_cap_f18",
--"red_cap_f4",
--"red_cap_f14a",
--"red_cap_f15",
--"red_cap_f16",
--"red_cap_f14b",
"red_cap_f5",

----trainer
"red_cap_l39",
"red_cap_c101",
"red_cap_mb339",

----Multinational Modern
"red_cap_su27",
"red_cap_su30",
"red_cap_su33",
"red_cap_su34",
"red_cap_j11",
"red_cap_jf17",
"red_cap_mig25",
"red_cap_mig29s",
"red_cap_mig23",
"red_cap_m2000",
"red_cap_m20005",
"red_cap_mf1",
"red_cap_mf1_bd",
"red_cap_mig29a",
"red_cap_mig31",
"red_cap_mig21",
"red_cap_su24mr",
"red_cap_su24m",
"red_cap_su17m4",
"red_cap_mig27k",
"red_cap_ajs37",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",

--bombing
"red_bombing_su34",

--CAS
"red_cas_su25",
"red_cas_su25t",
"red_cas_su34",
"red_cas_ajs37",
"red_cas_av8b",
"red_cas_f117a",
"red_cas_mf1_bd",
"red_cas_tornadoids",
"red_cas_tornadogr4",
"red_cas_a10",
"red_cas_f15e",
"red_cas_f16",
"red_cas_wingloong",
}

TemplateTable_RAT_Red_Fighter_Cold_War = {
--CAP
----USA
--"red_cap_f18",
--"red_cap_f4",
--"red_cap_f14a",
--"red_cap_f15",
--"red_cap_f16",
--"red_cap_f14b",
--"red_cap_f5",

----trainer
--"red_cap_l39",
--"red_cap_c101",
--"red_cap_mb339",

----Multinational Modern
--"red_cap_su27",
--"red_cap_su30",
--"red_cap_su33",
--"red_cap_su34",
--"red_cap_j11",
--"red_cap_jf17",
"red_cap_mig25",
"red_cap_mig29s",
"red_cap_mig23",
--"red_cap_m2000",
--"red_cap_m20005",
"red_cap_mf1",
"red_cap_mf1_bd",
--"red_cap_mig29a",
--"red_cap_mig31",
"red_cap_mig21",
"red_cap_su24mr",
"red_cap_su24m",
"red_cap_su17m4",
"red_cap_mig27k",
"red_cap_ajs37",

----Korean War
--"red_cap_mig15",
"red_cap_mig19",
--"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",

--bombing
--"red_bombing_su34",

--CAS
"red_cas_su25",
--"red_cas_su25t",
--"red_cas_su34",
"red_cas_ajs37",
--"red_cas_av8b",
--"red_cas_f117a",
"red_cas_mf1_bd",
--"red_cas_tornadoids",
--"red_cas_tornadogr4",
--"red_cas_a10",
--"red_cas_f15e",
--"red_cas_f16",
--"red_cas_wingloong",
}

TemplateTable_RAT_Red_Fighter_Korean_War = {
--CAP
----USA
--"red_cap_f18",
--"red_cap_f4",
--"red_cap_f14a",
--"red_cap_f15",
--"red_cap_f16",
--"red_cap_f14b",
--"red_cap_f5",

----trainer
--"red_cap_l39",
--"red_cap_c101",
--"red_cap_mb339",

----Multinational Modern
--"red_cap_su27",
--"red_cap_su30",
--"red_cap_su33",
--"red_cap_su34",
--"red_cap_j11",
--"red_cap_jf17",
--"red_cap_mig25",
--"red_cap_mig29s",
--"red_cap_mig23",
--"red_cap_m2000",
--"red_cap_m20005",
--"red_cap_mf1",
--"red_cap_mf1_bd",
--"red_cap_mig29a",
--"red_cap_mig31",
--"red_cap_mig21",
--"red_cap_su24mr",
--"red_cap_su24m",
--"red_cap_su17m4",
--"red_cap_mig27k",
--"red_cap_ajs37",

----Korean War
"red_cap_mig15",
--"red_cap_mig19",
"red_cap_f86",

----WW2
--"red_cap_spitfire",
--"red_cap_p51",
--"red_cap_p47",
--"red_cap_bf109",
--"red_cap_fw190",
--"red_cap_i16",

--bombing
--"red_bombing_su34",

--CAS
--"red_cas_su25",
--"red_cas_su25t",
--"red_cas_su34",
--"red_cas_ajs37",
--"red_cas_av8b",
--"red_cas_f117a",
--"red_cas_mf1_bd",
--"red_cas_tornadoids",
--"red_cas_tornadogr4",
--"red_cas_a10",
--"red_cas_f15e",
--"red_cas_f16",
--"red_cas_wingloong",
}

TemplateTable_RAT_Red_Fighter_WW2 = {
--CAP
----USA
--"red_cap_f18",
--"red_cap_f4",
--"red_cap_f14a",
--"red_cap_f15",
--"red_cap_f16",
--"red_cap_f14b",
--"red_cap_f5",

----trainer
--"red_cap_l39",
--"red_cap_c101",
--"red_cap_mb339",

----Multinational Modern
--"red_cap_su27",
--"red_cap_su30",
--"red_cap_su33",
--"red_cap_su34",
--"red_cap_j11",
--"red_cap_jf17",
--"red_cap_mig25",
--"red_cap_mig29s",
--"red_cap_mig23",
--"red_cap_m2000",
--"red_cap_m20005",
--"red_cap_mf1",
--"red_cap_mf1_bd",
--"red_cap_mig29a",
--"red_cap_mig31",
--"red_cap_mig21",
--"red_cap_su24mr",
--"red_cap_su24m",
--"red_cap_su17m4",
--"red_cap_mig27k",
--"red_cap_ajs37",

----Korean War
--"red_cap_mig15",
--"red_cap_mig19",
--"red_cap_f86",

----WW2
"red_cap_spitfire",
"red_cap_p51",
"red_cap_p47",
"red_cap_bf109",
"red_cap_fw190",
"red_cap_i16",

--bombing
--"red_bombing_su34",

--CAS
--"red_cas_su25",
--"red_cas_su25t",
--"red_cas_su34",
--"red_cas_ajs37",
--"red_cas_av8b",
--"red_cas_f117a",
--"red_cas_mf1_bd",
--"red_cas_tornadoids",
--"red_cas_tornadogr4",
--"red_cas_a10",
--"red_cas_f15e",
--"red_cas_f16",
--"red_cas_wingloong",
}

TemplateTable_RAT_CVN_PLANE_Random = {
"blue_cap_f18",
"blue_cap_f14b",
"blue_cap_f14a",
"blue_cv_cas_s3b",
}

TemplateTable_RAT_LHA_HELO_Random = {
"blue_helo_ah1w",
--"blue_helo_ah64a",
--"blue_helo_ah64d",
--"blue_helo_ch74d",
"blue_helo_ch53e",
--"blue_helo_ka27",
--"blue_helo_ka50",
--"blue_helo_mi24v",
--"blue_helo_mi26",
--"blue_helo_mi28n",
--"blue_helo_mi8",
--"blue_helo_oh58d",
--"blue_helo_sa342m",
--"blue_helo_sa342l",
--"blue_helo_sa342mis",
"blue_helo_sh60b",
"blue_helo_uh1h",
"blue_helo_uh60",
}