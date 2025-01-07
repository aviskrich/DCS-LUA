env.info('Initiating Custom GROUND MOOSE for TTI ok')

--[[
---mission sequence settings
enableMissionsSequence = false
enableAcceptNextMissionMenu = true
enableMissionPointsSystem = false -- NOT WORKING YET

mrMaxMissionA2gSequence = 5
agMaxMissionA2gSequence = 5
aghMaxMissionA2gSequence = 5
infMaxMissionA2gSequence = 5
asMaxMissionA2gSequence = 5
seadMaxMissionA2gSequence = 5
convMaxMissionA2gSequence = 5
shipconvMaxMissionA2gSequence = 5

firstRandomSingleMission = "a2g_easy"
--"random", "a2g_easy", "a2g_hard", "a2g_sead", "a2g_helo", "a2g_inf", "a2g_cnv", "a2g_ship_cnv", "a2g_as"
--]]



search_agl_time = 30

function clearTemplate(templateToClear)
    for k in pairs(templateToClear) do
        templateToClear[k] = nil
    end
end

TemplateTable_GROUND = {}
TemplateTable_HELO_GROUND = {}
TemplateTable_EASY_GROUND = {}
TemplateTable_INF_GROUND = {}
TemplateTable_EASY_SAM = {}
TemplateTable_HARD_SAM = {}
TemplateTable_EASY_SEAD = {}
TemplateTable_HARD_SEAD = {}
TemplateTable_AA = {}
TemplateTable_INF_MISC = {}
TemplateTable_SEA = {}
TemplateTable_RED_GROUNDCONVOY = {}
TemplateTable_RED_SEACONVOY = {}
TemplateTable_BLUE_GROUNDCONVOY = {}

if mission_era == "modern" then
	TemplateTable_INF_GROUND = { 
	"red_inf_georgia_m4",
	--"red_inf_m4",
	"red_inf_ak",
	"red_inf_m249",
	--"red_inf_insurgent_sol",
	--"red_inf_rus_sol",
	"red_inf_paratrooper_aks",
	"red_inf_paratrooper_rpg",
	}
end

if mission_era == "cold_war" then
	TemplateTable_INF_GROUND = { 
	--"red_inf_georgia_m4",
	--"red_inf_m4",
	"red_inf_ak",
	--"red_inf_m249",
	--"red_inf_insurgent_sol",
	--"red_inf_rus_sol",
	--"red_inf_paratrooper_aks",
	"red_inf_paratrooper_rpg",
	}
end

if mission_era == "ww2" and ww2_asset_pack_enable == false then
	TemplateTable_INF_GROUND = { 
	--"red_inf_georgia_m4",
	--"red_inf_m4",
	"red_inf_ak",
	--"red_inf_m249",
	--"red_inf_insurgent_sol",
	--"red_inf_rus_sol",
	--"red_inf_paratrooper_aks",
	--"red_inf_paratrooper_rpg",
	}
	tti.debug("Loaded WW2 Free Infantry Units")
end
	
if mission_era == "ww2" and ww2_asset_pack_enable == true then
	TemplateTable_INF_GROUND = { 
	"red_inf_soldier_wwii_br",
	"red_inf_soldier_wwii_gr",
	"red_inf_soldier_wwii_us",
	} 
	tti.debug("Loaded WW2 Asset Pack Infantry Units")
end

if mission_era == "korean_war" and ww2_asset_pack_enable == false then
	TemplateTable_INF_GROUND = { 
	--"red_inf_georgia_m4",
	--"red_inf_m4",
	"red_inf_ak",
	--"red_inf_m249",
	--"red_inf_insurgent_sol",
	--"red_inf_rus_sol",
	--"red_inf_paratrooper_aks",
	--"red_inf_paratrooper_rpg",
	} 
end

if mission_era == "korean_war" and ww2_asset_pack_enable == true then
	TemplateTable_INF_GROUND = { 
	"red_inf_soldier_wwii_br",
	"red_inf_soldier_wwii_gr",
	"red_inf_soldier_wwii_us",
	} 
end



--INSERT Paid WW2 Units
if mission_era == "ww2" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_GROUND_WW2, "red_ar_m8_greyhound")
table.insert(TemplateTable_GROUND_WW2, "red_ar_daimler")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_centaur")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_churchhill")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_cromwell")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_tiger2")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_tiger1")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_sherman_ff")
table.insert(TemplateTable_GROUND_WW2, "red_ar_puma")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_jagdpanther")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_jagpz")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_pzvpanther")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_stug")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_elefant")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_m10gmc")
table.insert(TemplateTable_GROUND_WW2, "red_ar_mbt_sturmpziv")
table.insert(TemplateTable_GROUND_WW2, "red_ar_tetrarch")

table.insert(TemplateTable_GROUND_WW2, "red_arty_m12_gmc")

table.insert(TemplateTable_GROUND_WW2, "red_ua_cckw")
table.insert(TemplateTable_GROUND_WW2, "red_ua_m4tractor")
table.insert(TemplateTable_GROUND_WW2, "red_ua_kubelwagen")
table.insert(TemplateTable_GROUND_WW2, "red_ua_kfz2")
table.insert(TemplateTable_GROUND_WW2, "red_ua_horch")
table.insert(TemplateTable_GROUND_WW2, "red_ua_kfz7")
table.insert(TemplateTable_GROUND_WW2, "red_ua_m30cc")
table.insert(TemplateTable_GROUND_WW2, "red_ua_willysmb")
--[[
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_br")
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_gr")
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_us")
--]]
table.insert(TemplateTable_AA_WW2, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_AA_WW2, "red_aa_aaa_qf37")
table.insert(TemplateTable_AA_WW2, "red_aa_aaa_m45quad")
table.insert(TemplateTable_AA_WW2, "red_aa_aaa_flak30")
table.insert(TemplateTable_AA_WW2, "red_aa_aaa_flak38")
table.insert(TemplateTable_AA_WW2, "red_aa_aaa_m137")
table.insert(TemplateTable_AA_WW2, "red_aa_aaa_flak41")
table.insert(TemplateTable_AA_WW2, "red_aa_aaa_flak37")
table.insert(TemplateTable_AA_WW2, "red_aa_aaa_flak36")

table.insert(TemplateTable_EASY_SAM_WW2, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_EASY_SAM_WW2, "red_aa_aaa_qf37")
table.insert(TemplateTable_EASY_SAM_WW2, "red_aa_aaa_m45quad")
table.insert(TemplateTable_EASY_SAM_WW2, "red_aa_aaa_flak30")
table.insert(TemplateTable_EASY_SAM_WW2, "red_aa_aaa_flak38")
table.insert(TemplateTable_EASY_SAM_WW2, "red_aa_aaa_m137")
table.insert(TemplateTable_EASY_SAM_WW2, "red_aa_aaa_flak41")
table.insert(TemplateTable_EASY_SAM_WW2, "red_aa_aaa_flak37")
table.insert(TemplateTable_EASY_SAM_WW2, "red_aa_aaa_flak36")

table.insert(TemplateTable_HARD_SAM_WW2, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_HARD_SAM_WW2, "red_aa_aaa_qf37")
table.insert(TemplateTable_HARD_SAM_WW2, "red_aa_aaa_m45quad")
table.insert(TemplateTable_HARD_SAM_WW2, "red_aa_aaa_flak30")
table.insert(TemplateTable_HARD_SAM_WW2, "red_aa_aaa_flak38")
table.insert(TemplateTable_HARD_SAM_WW2, "red_aa_aaa_m137")
table.insert(TemplateTable_HARD_SAM_WW2, "red_aa_aaa_flak41")
table.insert(TemplateTable_HARD_SAM_WW2, "red_aa_aaa_flak37")
table.insert(TemplateTable_HARD_SAM_WW2, "red_aa_aaa_flak36")

table.insert(TemplateTable_EASY_SEAD_WW2, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_EASY_SEAD_WW2, "red_aa_aaa_qf37")
table.insert(TemplateTable_EASY_SEAD_WW2, "red_aa_aaa_m45quad")
table.insert(TemplateTable_EASY_SEAD_WW2, "red_aa_aaa_flak30")
table.insert(TemplateTable_EASY_SEAD_WW2, "red_aa_aaa_flak38")
table.insert(TemplateTable_EASY_SEAD_WW2, "red_aa_aaa_m137")
table.insert(TemplateTable_EASY_SEAD_WW2, "red_aa_aaa_flak41")
table.insert(TemplateTable_EASY_SEAD_WW2, "red_aa_aaa_flak37")
table.insert(TemplateTable_EASY_SEAD_WW2, "red_aa_aaa_flak36")

table.insert(TemplateTable_HARD_SEAD_WW2, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_HARD_SEAD_WW2, "red_aa_aaa_qf37")
table.insert(TemplateTable_HARD_SEAD_WW2, "red_aa_aaa_m45quad")
table.insert(TemplateTable_HARD_SEAD_WW2, "red_aa_aaa_flak30")
table.insert(TemplateTable_HARD_SEAD_WW2, "red_aa_aaa_flak38")
table.insert(TemplateTable_HARD_SEAD_WW2, "red_aa_aaa_m137")
table.insert(TemplateTable_HARD_SEAD_WW2, "red_aa_aaa_flak41")
table.insert(TemplateTable_HARD_SEAD_WW2, "red_aa_aaa_flak37")
table.insert(TemplateTable_HARD_SEAD_WW2, "red_aa_aaa_flak36")

table.insert(TemplateTable_SEA_WW2, "red_ship_ww2_uss_samuel_chase")
table.insert(TemplateTable_SEA_WW2, "red_ship_ww2_lstmk2")
table.insert(TemplateTable_SEA_WW2, "red_ship_ww2_uboatviic")
table.insert(TemplateTable_SEA_WW2, "red_ship_ww2_schnellboot")
table.insert(TemplateTable_SEA_WW2, "red_ship_ww2_higgins")


--convoys
table.insert(TemplateTable_RED_SEACONVOY_WW2, "red_ship_ww2_uss_samuel_chase")
table.insert(TemplateTable_RED_SEACONVOY_WW2, "red_ship_ww2_lstmk2")
table.insert(TemplateTable_RED_SEACONVOY_WW2, "red_ship_ww2_uboatviic")
table.insert(TemplateTable_RED_SEACONVOY_WW2, "red_ship_ww2_schnellboot")
table.insert(TemplateTable_RED_SEACONVOY_WW2, "red_ship_ww2_higgins")


table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_m8_greyhound")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_daimler")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_centaur")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_churchhill")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_cromwell")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_tiger2")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_tiger1")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_sherman_ff")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_puma")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_jagdpanther")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_jagpz")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_pzvpanther")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_stug")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_elefant")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_m10gmc")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_mbt_sturmpziv")
table.insert(TemplateTable_RED_GROUNDCONVOY_WW2, "red_ar_tetrarch")

table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_m8_greyhound")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_daimler")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_centaur")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_churchhill")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_cromwell")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_tiger2")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_tiger1")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_sherman_ff")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_puma")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_jagdpanther")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_jagpz")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_pzvpanther")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_stug")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_elefant")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_m10gmc")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_mbt_sturmpziv")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_WW2, "blue_ar_tetrarch")
end

--INSERT Paid WW2 Units
if mission_era == "korean_war" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_m8_greyhound")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_daimler")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_centaur")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_churchhill")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_cromwell")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_tiger2")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_tiger1")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_sherman_ff")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_puma")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_jagdpanther")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_jagpz")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_pzvpanther")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_stug")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_elefant")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_m10gmc")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_mbt_sturmpziv")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ar_tetrarch")

table.insert(TemplateTable_GROUND_KOREANWAR, "red_arty_m12_gmc")

table.insert(TemplateTable_GROUND_KOREANWAR, "red_ua_cckw")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ua_m4tractor")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ua_kubelwagen")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ua_kfz2")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ua_horch")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ua_kfz7")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ua_m30cc")
table.insert(TemplateTable_GROUND_KOREANWAR, "red_ua_willysmb")
--[[
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_br")
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_gr")
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_us")
--]]
table.insert(TemplateTable_AA_KOREANWAR, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_AA_KOREANWAR, "red_aa_aaa_qf37")
table.insert(TemplateTable_AA_KOREANWAR, "red_aa_aaa_m45quad")
table.insert(TemplateTable_AA_KOREANWAR, "red_aa_aaa_flak30")
table.insert(TemplateTable_AA_KOREANWAR, "red_aa_aaa_flak38")
table.insert(TemplateTable_AA_KOREANWAR, "red_aa_aaa_m137")
table.insert(TemplateTable_AA_KOREANWAR, "red_aa_aaa_flak41")
table.insert(TemplateTable_AA_KOREANWAR, "red_aa_aaa_flak37")
table.insert(TemplateTable_AA_KOREANWAR, "red_aa_aaa_flak36")

table.insert(TemplateTable_EASY_SAM_KOREANWAR, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_EASY_SAM_KOREANWAR, "red_aa_aaa_qf37")
table.insert(TemplateTable_EASY_SAM_KOREANWAR, "red_aa_aaa_m45quad")
table.insert(TemplateTable_EASY_SAM_KOREANWAR, "red_aa_aaa_flak30")
table.insert(TemplateTable_EASY_SAM_KOREANWAR, "red_aa_aaa_flak38")
table.insert(TemplateTable_EASY_SAM_KOREANWAR, "red_aa_aaa_m137")
table.insert(TemplateTable_EASY_SAM_KOREANWAR, "red_aa_aaa_flak41")
table.insert(TemplateTable_EASY_SAM_KOREANWAR, "red_aa_aaa_flak37")
table.insert(TemplateTable_EASY_SAM_KOREANWAR, "red_aa_aaa_flak36")

table.insert(TemplateTable_HARD_SAM_KOREANWAR, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_HARD_SAM_KOREANWAR, "red_aa_aaa_qf37")
table.insert(TemplateTable_HARD_SAM_KOREANWAR, "red_aa_aaa_m45quad")
table.insert(TemplateTable_HARD_SAM_KOREANWAR, "red_aa_aaa_flak30")
table.insert(TemplateTable_HARD_SAM_KOREANWAR, "red_aa_aaa_flak38")
table.insert(TemplateTable_HARD_SAM_KOREANWAR, "red_aa_aaa_m137")
table.insert(TemplateTable_HARD_SAM_KOREANWAR, "red_aa_aaa_flak41")
table.insert(TemplateTable_HARD_SAM_KOREANWAR, "red_aa_aaa_flak37")
table.insert(TemplateTable_HARD_SAM_KOREANWAR, "red_aa_aaa_flak36")

table.insert(TemplateTable_EASY_SEAD_KOREANWAR, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_EASY_SEAD_KOREANWAR, "red_aa_aaa_qf37")
table.insert(TemplateTable_EASY_SEAD_KOREANWAR, "red_aa_aaa_m45quad")
table.insert(TemplateTable_EASY_SEAD_KOREANWAR, "red_aa_aaa_flak30")
table.insert(TemplateTable_EASY_SEAD_KOREANWAR, "red_aa_aaa_flak38")
table.insert(TemplateTable_EASY_SEAD_KOREANWAR, "red_aa_aaa_m137")
table.insert(TemplateTable_EASY_SEAD_KOREANWAR, "red_aa_aaa_flak41")
table.insert(TemplateTable_EASY_SEAD_KOREANWAR, "red_aa_aaa_flak37")
table.insert(TemplateTable_EASY_SEAD_KOREANWAR, "red_aa_aaa_flak36")

table.insert(TemplateTable_HARD_SEAD_KOREANWAR, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_HARD_SEAD_KOREANWAR, "red_aa_aaa_qf37")
table.insert(TemplateTable_HARD_SEAD_KOREANWAR, "red_aa_aaa_m45quad")
table.insert(TemplateTable_HARD_SEAD_KOREANWAR, "red_aa_aaa_flak30")
table.insert(TemplateTable_HARD_SEAD_KOREANWAR, "red_aa_aaa_flak38")
table.insert(TemplateTable_HARD_SEAD_KOREANWAR, "red_aa_aaa_m137")
table.insert(TemplateTable_HARD_SEAD_KOREANWAR, "red_aa_aaa_flak41")
table.insert(TemplateTable_HARD_SEAD_KOREANWAR, "red_aa_aaa_flak37")
table.insert(TemplateTable_HARD_SEAD_KOREANWAR, "red_aa_aaa_flak36")

table.insert(TemplateTable_SEA_KOREANWAR, "red_ship_ww2_uss_samuel_chase")
table.insert(TemplateTable_SEA_KOREANWAR, "red_ship_ww2_lstmk2")
table.insert(TemplateTable_SEA_KOREANWAR, "red_ship_ww2_uboatviic")
table.insert(TemplateTable_SEA_KOREANWAR, "red_ship_ww2_schnellboot")
table.insert(TemplateTable_SEA_KOREANWAR, "red_ship_ww2_higgins")

--convoys
table.insert(TemplateTable_RED_SEACONVOY_KOREANWAR, "red_ship_ww2_uss_samuel_chase")
table.insert(TemplateTable_RED_SEACONVOY_KOREANWAR, "red_ship_ww2_lstmk2")
table.insert(TemplateTable_RED_SEACONVOY_KOREANWAR, "red_ship_ww2_uboatviic")
table.insert(TemplateTable_RED_SEACONVOY_KOREANWAR, "red_ship_ww2_schnellboot")
table.insert(TemplateTable_RED_SEACONVOY_KOREANWAR, "red_ship_ww2_higgins")


table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_m8_greyhound")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_daimler")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_centaur")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_churchhill")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_cromwell")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_tiger2")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_tiger1")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_sherman_ff")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_puma")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_jagdpanther")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_jagpz")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_pzvpanther")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_stug")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_elefant")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_m10gmc")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_mbt_sturmpziv")
table.insert(TemplateTable_RED_GROUNDCONVOY_KOREANWAR, "red_ar_tetrarch")

table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_m8_greyhound")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_daimler")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_centaur")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_churchhill")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_cromwell")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_tiger2")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_tiger1")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_sherman_ff")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_puma")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_jagdpanther")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_jagpz")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_pzvpanther")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_stug")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_elefant")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_m10gmc")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_mbt_sturmpziv")
table.insert(TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR, "blue_ar_tetrarch")
end


if mission_era == "modern" then
TemplateTable_GROUND = TemplateTable_GROUND_MODERN
TemplateTable_HELO_GROUND = TemplateTable_HELO_GROUND_MODERN
TemplateTable_EASY_GROUND = TemplateTable_EASY_GROUND_MODERN
TemplateTable_EASY_SEAD = TemplateTable_EASY_SEAD_MODERN
TemplateTable_HARD_SEAD = TemplateTable_HARD_SEAD_MODERN
TemplateTable_INF_MISC = TemplateTable_INF_MISC_MODERN
--TemplateTable_INF_GROUND = TemplateTable_INF_GROUND_MODERN
TemplateTable_SEA = TemplateTable_SEA_MODERN
TemplateTable_AA = TemplateTable_AA_MODERN
TemplateTable_EASY_SAM = TemplateTable_EASY_SAM_MODERN
TemplateTable_HARD_SAM = TemplateTable_HARD_SAM_MODERN
TemplateTable_RED_GROUNDCONVOY = TemplateTable_RED_GROUNDCONVOY_MODERN
TemplateTable_RED_SEACONVOY = TemplateTable_RED_SEACONVOY_MODERN
TemplateTable_BLUE_GROUNDCONVOY = TemplateTable_BLUE_GROUNDCONVOY_MODERN
end

if mission_era == "cold_war" then
TemplateTable_GROUND = TemplateTable_GROUND_COLDWAR
TemplateTable_HELO_GROUND = TemplateTable_HELO_GROUND_COLDWAR
TemplateTable_EASY_GROUND = TemplateTable_EASY_GROUND_COLDWAR
TemplateTable_EASY_SEAD = TemplateTable_EASY_SEAD_COLDWAR
TemplateTable_HARD_SEAD = TemplateTable_HARD_SEAD_COLDWAR
TemplateTable_INF_MISC = TemplateTable_INF_MISC_COLDWAR
--TemplateTable_INF_GROUND = TemplateTable_INF_GROUND_COLDWAR
TemplateTable_SEA = TemplateTable_SEA_COLDWAR
TemplateTable_AA = TemplateTable_AA_COLDWAR
TemplateTable_EASY_SAM = TemplateTable_EASY_SAM_COLDWAR
TemplateTable_HARD_SAM = TemplateTable_HARD_SAM_COLDWAR
TemplateTable_RED_GROUNDCONVOY = TemplateTable_RED_GROUNDCONVOY_COLDWAR
TemplateTable_RED_SEACONVOY = TemplateTable_RED_SEACONVOY_COLDWAR
TemplateTable_BLUE_GROUNDCONVOY = TemplateTable_BLUE_GROUNDCONVOY_COLDWAR
end

if mission_era == "korean_war" then
TemplateTable_GROUND = TemplateTable_GROUND_KOREANWAR
TemplateTable_HELO_GROUND = TemplateTable_HELO_GROUND_KOREANWAR
TemplateTable_EASY_GROUND = TemplateTable_EASY_GROUND_KOREANWAR
TemplateTable_EASY_SEAD = TemplateTable_EASY_SEAD_KOREANWAR
TemplateTable_HARD_SEAD = TemplateTable_HARD_SEAD_KOREANWAR
TemplateTable_INF_MISC = TemplateTable_INF_MISC_KOREANWAR
--TemplateTable_INF_GROUND = TemplateTable_INF_GROUND_KOREANWAR
TemplateTable_SEA = TemplateTable_SEA_KOREANWAR
TemplateTable_AA = TemplateTable_AA_KOREANWAR
TemplateTable_EASY_SAM = TemplateTable_EASY_SAM_KOREANWAR
TemplateTable_HARD_SAM = TemplateTable_HARD_SAM_KOREANWAR
TemplateTable_RED_GROUNDCONVOY = TemplateTable_RED_GROUNDCONVOY_KOREANWAR
TemplateTable_RED_SEACONVOY = TemplateTable_RED_SEACONVOY_KOREANWAR
TemplateTable_BLUE_GROUNDCONVOY = TemplateTable_BLUE_GROUNDCONVOY_KOREANWAR
end

if mission_era == "ww2" then
TemplateTable_GROUND = TemplateTable_GROUND_WW2
TemplateTable_HELO_GROUND = TemplateTable_HELO_GROUND_WW2
TemplateTable_EASY_GROUND = TemplateTable_EASY_GROUND_WW2
TemplateTable_EASY_SEAD = TemplateTable_EASY_SEAD_WW2
TemplateTable_HARD_SEAD = TemplateTable_HARD_SEAD_WW2
TemplateTable_INF_MISC = TemplateTable_INF_MISC_WW2
--TemplateTable_INF_GROUND = TemplateTable_INF_GROUND_WW2
TemplateTable_SEA = TemplateTable_SEA_WW2
TemplateTable_AA = TemplateTable_AA_WW2
TemplateTable_EASY_SAM = TemplateTable_EASY_SAM_WW2
TemplateTable_HARD_SAM = TemplateTable_HARD_SAM_WW2
TemplateTable_RED_GROUNDCONVOY = TemplateTable_RED_GROUNDCONVOY_WW2
TemplateTable_RED_SEACONVOY = TemplateTable_RED_SEACONVOY_WW2
TemplateTable_BLUE_GROUNDCONVOY = TemplateTable_BLUE_GROUNDCONVOY_WW2
end

AAA_ZONE 			= 		ZONE:New( "AAA_ZONE" ) 
klsv 				= 		ZONE:New( "klsv" )

function createVariables(prefix, numZones, loadPolyZone)
    -- Dynamically create global variables for each list
    _G[prefix .. "_zone_list"] = {}
    _G[prefix .. "_vec3_list"] = {}
    _G[prefix .. "_vec2_list"] = {}
    _G[prefix .. "_poly_zone_list"] = {}

    for i = 1, numZones do
        -- Create the ZONE variable
        _G[prefix..i] = ZONE:New(prefix..i)

        -- Add to the global _zone_list
        _G[prefix .. "_zone_list"][i] = _G[prefix..i]

        -- Create the Vec3 variable and add to the global _vec3_list
        _G[prefix..i.."_vec"] = _G[prefix..i]:GetVec3()
        _G[prefix .. "_vec3_list"][i] = _G[prefix..i.."_vec"]

        -- Create the Vec2 variable and add to the global _vec2_list
        _G[prefix..i.."_vec2"] = _G[prefix..i]:GetVec2()
        _G[prefix .. "_vec2_list"][i] = _G[prefix..i.."_vec2"]

        -- Handle ZONE_POLYGON or regular assignment for poly_zone_list
        if loadPolyZone == true then
            if enable_polygon_mission_zones == true then
                _G["poly_"..prefix..i] = ZONE_POLYGON:NewFromGroupName("poly_"..prefix..i, "poly_"..prefix..i)
            else
                _G["poly_"..prefix..i] = _G[prefix..i]
            end
            -- Add to the global poly_zone_list after assignment
            _G[prefix .. "_poly_zone_list"][i] = _G["poly_"..prefix..i]

        else


        end
		
    end

    -- Return the global lists
			    return _G[prefix .. "_zone_list"], _G[prefix .. "_vec3_list"], _G[prefix .. "_vec2_list"], _G[prefix .. "_poly_zone_list"]
end

---zone counts need to be exact no. of zones in the editor
AG_zone_count = 10
MR_zone_count = 10
AGH_zone_count = 10
INFAS_zone_count = 10
SEAD_zone_count = 10
SAM_zone_count = 3

AG_zone_list, AG_vec3_list, AG_vec2_list, AG_poly_zone_list = createVariables("AG", AG_zone_count, true)
MR_zone_list, MR_vec3_list, MR_vec2_list, MR_poly_zone_list = createVariables("MR", MR_zone_count, true)
AGH_zone_list, AGH_vec3_list, AGH_vec2_list, AGH_poly_zone_list = createVariables("AGH", AGH_zone_count, true)
INFAS_zone_list, INFAS_vec3_list, INFAS_vec2_list, INFAS_poly_zone_list = createVariables("INFAS", INFAS_zone_count, true)
SEAD_zone_list, SEAD_vec3_list, SEAD_vec2_list = createVariables("SEAD", SEAD_zone_count, false)
SAM_zone_list, SAM_vec3_list, SAM_vec2_list = createVariables("SAM", SAM_zone_count, false)

if carrierOpsTheatre == true then
	ASS_zone_count = 5
	ASS_zone_list, ASS_vec3_list, ASS_vec2_list = createVariables("ASS", ASS_zone_count, false)
end

env.info('Zone ground init ok')

--NORMAL
A2GJ = SPAWN:New( "A2G_Init" )
	--:InitRandomizeTemplate( TemplateTable_HARD_GROUND )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)
	
A2GSEAD_MISC = SPAWN:NewWithAlias( "A2G_Init", "SEAD_MISC_INIT" )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)

A2GAS = SPAWN:New( "A2GAS_Init" )
	:InitRandomizeTemplate( TemplateTable_SEA )
	:InitHeading(0, 360)
	
A2GAS_Disabled = SPAWN:New( "A2GAS_Init_Disabled" )
	:InitRandomizeTemplate( TemplateTable_SEA )
	:InitHeading(0, 360)

A2GMR = SPAWN:New( "A2GMR_Init" )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)
	
A2GH = SPAWN:New( "A2GH_Init" )
	--:InitRandomizeTemplate( TemplateTable_HELO_GROUND )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)
	
A2GIA = SPAWN:New( "A2GIA_Init" )
	:InitRandomizeTemplate( TemplateTable_INF_GROUND )
	:InitHeading(0, 360)

A2GIAM = SPAWN:New( "A2GIAMISC_Init" )
	--:InitRandomizeTemplate( TemplateTable_INF_MISC )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)
	
A2G_AA_EASY = SPAWN:NewWithAlias( "AA_Init", "AA_Easy_Init" )
	:InitRandomizeTemplate( TemplateTable_AA )
	:InitHeading(0, 360)
	
A2G_AA_HARD = SPAWN:NewWithAlias( "AA_Init", "AA_Hard_Init" )
	:InitRandomizeTemplate( TemplateTable_AA )
	:InitHeading(0, 360)

A2G_AA_HELO = SPAWN:NewWithAlias( "AA_Init", "AA_Helo_Init" )
	:InitRandomizeTemplate( TemplateTable_AA )
	:InitHeading(0, 360)
	
A2G_AA_INF = SPAWN:NewWithAlias( "AA_Init", "AA_Inf_Init" )
	:InitRandomizeTemplate( TemplateTable_AA )
	:InitHeading(0, 360)

A2G_SAM_EASY = SPAWN:NewWithAlias( "SAM_Init", "SAM_Easy_Init" )
--A2G_SAM_EASY = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_EASY_SAM )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitHeading(0, 360)

	
A2G_SAM_HARD = SPAWN:NewWithAlias( "SAM_Init", "SAM_Hard_Init" )
	:InitRandomizeTemplate( TemplateTable_HARD_SAM )
	:InitHeading(0, 360)
	
A2G_SEAD_EASY = SPAWN:NewWithAlias( "SAM_Init", "SEAD_Easy_Init" )
--A2G_SAM_EASY = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_EASY_SEAD )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitHeading(0, 360)

	
A2G_SEAD_HARD = SPAWN:NewWithAlias( "SAM_Init", "SEAD_Hard_Init" )
	:InitRandomizeTemplate( TemplateTable_HARD_SEAD )
	:InitHeading(0, 360)
	
A2G_SAM_MR_EASY = SPAWN:NewWithAlias( "SAM_Init", "SAM_MR_Easy_Init" )
--A2G_SAM_EASY = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_EASY_SAM )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitHeading(0, 360)
	
A2G_SAM_MR_HARD = SPAWN:NewWithAlias( "SAM_Init", "SAM_MR_Hard_Init" )
--A2G_SAM_EASY = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_HARD_SAM )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitHeading(0, 360)
	
A2G_SAM_A2GJ_EASY = SPAWN:NewWithAlias( "SAM_Init", "SAM_A2GJ_Easy_Init" )
--A2G_SAM_EASY = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_EASY_SAM )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitHeading(0, 360)
	
A2G_SAM_A2GJ_HARD = SPAWN:NewWithAlias( "SAM_Init", "SAM_A2GJ_Hard_Init" )
--A2G_SAM_EASY = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_HARD_SAM )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitHeading(0, 360)
	
A2G_SAM_HELO_EASY = SPAWN:NewWithAlias( "SAM_Init", "SAM_Helo_Easy_Init" )
--A2G_SAM_EASY = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_EASY_SAM )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitHeading(0, 360)
	
A2G_SAM_HELO_HARD = SPAWN:NewWithAlias( "SAM_Init", "SAM_Helo_Hard_Init" )
--A2G_SAM_EASY = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_HARD_SAM )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitHeading(0, 360)
	
A2G_SAM_INF_EASY = SPAWN:NewWithAlias( "SAM_Init", "SAM_Inf_Easy_Init" )
--A2G_SAM_EASY = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_EASY_SAM )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitHeading(0, 360)
	
A2G_SAM_INF_HARD = SPAWN:NewWithAlias( "SAM_Init", "SAM_Inf_Hard_Init" )
--A2G_SAM_EASY = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_HARD_SAM )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitHeading(0, 360)

--A2G_BLUE_BATTALION = SPAWN:New("Blue_Ground_Battalion_1")
env.info('spawn objects ground init co ok')

--SAM ADD
function a2g_sam_start()
	local switch = math.random(1, SAM_zone_count)
	
	a2gsam_spawn(switch)
	
	trigger.action.outText( ">> An enemy SAM site has been detected in the area.<< \nRequesting SEAD aircraft to locate and destroy the SAM Site.", 10)
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
end
--SAM ADD
function a2gsam_spawn(missionNumber) --1 per group
	for i = 1, random_sam_hard_amount do
		local group = A2G_SAM_HARD:SpawnInZone(SAM_zone_list[missionNumber], true)
		env.info('Group Has Been Spawned!')
		if iads_script_enable == true then
			redIADS:addSAMSite(group.GroupName)
		end
		env.info('Group Has Been Added!')
	end
	for i = 1, random_sam_easy_amount do
		local group = A2G_SAM_EASY:SpawnInZone(SAM_zone_list[missionNumber], true)
		if iads_script_enable == true then
			redIADS:addSAMSite(group.GroupName)
		end
	end
activate_SAM_jtac(missionNumber)
end




------------------------ mission seq vars

mrMissionsCompleted = false
mrEnableMissionsSequenceSwitchList = {}
mrMissionsCompletedCount = 0


agMissionsCompleted = false
agEnableMissionsSequenceSwitchList = {}
agMissionsCompletedCount = 0


aghMissionsCompleted = false
aghEnableMissionsSequenceSwitchList = {}
aghMissionsCompletedCount = 0


infMissionsCompleted = false
infEnableMissionsSequenceSwitchList = {}
infMissionsCompletedCount = 0


asMissionsCompleted = false
asEnableMissionsSequenceSwitchList = {}
asMissionsCompletedCount = 0


seadMissionsCompleted = false
seadEnableMissionsSequenceSwitchList = {}
seadMissionsCompletedCount = 0

convMissionsCompleted = false
convEnableMissionsSequenceSwitchList = {}
convMissionsCompletedCount = 0

shipconvMissionsCompleted = false
shipconvEnableMissionsSequenceSwitchList = {}
shipconvMissionsCompletedCount = 0

--[[
if maxA2gMissionSequence > 10 or maxA2gMissionSequence < 0 or maxA2gMissionSequence == nil  then
tti.debug("maxA2gMissionSequence is set to: " .. tostring(maxA2gMissionSequence))
tti.debug("maxA2gMissionSequence entry was not a whole number between 1 and 10. Fixing this issue and setting this value to 10. Please double check the entry you made for this setting",true)
maxA2gMissionSequence = 10
end
--]]

local function isInList(number, list)
    for _, v in ipairs(list) do
        if v == number then
            return true
        end
    end
    return false
end

-- Function to get a random number between 1-10 that is not in the list
function getMissionSequenceNumber(missionSequenceList, missionsCompleteBool, maxA2gMissionSequenceArg, maxMissionTypeMissions)
    if #missionSequenceList >= maxA2gMissionSequenceArg then
        missionsCompleteBool = true
        return nil -- No number to return if all numbers are in the list
    end

    local number
    repeat
        number = math.random(1, maxMissionTypeMissions)
    until not isInList(number, missionSequenceList)

    table.insert(missionSequenceList, number)
    return number
end

-- function getMissionCompletionStatusText(missionType)

-- local introText = "\nCompletion Status: Mission "
-- if enableMissionsSequence == true then
	-- if missionType == "MR" then
		-- local missionCompletionDisplayText 
		-- missionCompletionDisplayText = introText .. mrMissionsCompletedCount .. " of " .. mrMaxMissionA2gSequence
	-- elseif missionType == "AG" then
		-- local missionCompletionDisplayText 
		-- missionCompletionDisplayText = introText .. agMissionsCompletedCount .. " of " .. agMaxMissionA2gSequence
	-- elseif missionType == "AGH" then
		-- local missionCompletionDisplayText 
		-- missionCompletionDisplayText = introText .. aghMissionsCompletedCount .. " of " .. aghMaxMissionA2gSequence
	-- elseif missionType == "INF" then
		-- local missionCompletionDisplayText 
		-- missionCompletionDisplayText = introText .. infMissionsCompletedCount .. " of " .. infMaxMissionA2gSequence
	-- elseif missionType == "ASS" then
		-- local missionCompletionDisplayText 
		-- missionCompletionDisplayText = introText .. asMissionsCompletedCount .. " of " .. asMaxMissionA2gSequence
	-- elseif missionType == "SEAD" then
		-- local missionCompletionDisplayText 
		-- missionCompletionDisplayText = introText .. seadMissionsCompletedCount .. " of " .. seadMaxMissionA2gSequence
	-- end
	
	-- return missionCompletionDisplayText
	-- else
	-- local missionCompletionDisplayText
	-- return missionCompletionDisplayText == ""
-- end
-- end

function getMissionCompletionStatusText(missionType)
    local introText = "\nActive Mission in Sequence: Mission "
    local missionCompletionDisplayText = ""
    
    if enableMissionsSequence == true then
        if missionType == "MR" then
            missionCompletionDisplayText = introText .. mrMissionsCompletedCount .. " of " .. mrMaxMissionA2gSequence
        elseif missionType == "AG" then
            missionCompletionDisplayText = introText .. agMissionsCompletedCount .. " of " .. agMaxMissionA2gSequence
        elseif missionType == "AGH" then
            missionCompletionDisplayText = introText .. aghMissionsCompletedCount .. " of " .. aghMaxMissionA2gSequence
        elseif missionType == "INF" then
            missionCompletionDisplayText = introText .. infMissionsCompletedCount .. " of " .. infMaxMissionA2gSequence
        elseif missionType == "ASS" then
            missionCompletionDisplayText = introText .. asMissionsCompletedCount .. " of " .. asMaxMissionA2gSequence
        elseif missionType == "SEAD" then
            missionCompletionDisplayText = introText .. seadMissionsCompletedCount .. " of " .. seadMaxMissionA2gSequence
        elseif missionType == "CONV" then
            missionCompletionDisplayText = introText .. convMissionsCompletedCount .. " of " .. convMaxMissionA2gSequence
        elseif missionType == "SHIPCONV" then
            missionCompletionDisplayText = introText .. shipconvMissionsCompletedCount .. " of " .. shipconvMaxMissionA2gSequence
        end
        
        return missionCompletionDisplayText
    else
        return ""
    end
end


MissionSelectDebugText = true -- text for mission number specific select

function a2gmr_start(MissionNumSelect)
--main_detection(15)
--if mrMissionsCompleted == false then

unitThresholdMR = false
allow_mr_agl_search = true

timer.scheduleFunction(function() --Stop searching for above AGL spawned units
	allow_mr_agl_search = false
end, nil, timer.getTime() + search_agl_time )

EasyMissionNameGen()
trigger.action.setUserFlag('MR-STARTING', true)

------ start mission sequence ----------------------

	if enableMissionsSequence == true then	
		local missionSeqSwitch = getMissionSequenceNumber(mrEnableMissionsSequenceSwitchList, mrMissionsCompleted, mrMaxMissionA2gSequence, MR_zone_count)
		arrayZoneMR[missionSeqSwitch][4] = true
		a2gmr_spawn(missionSeqSwitch) --spawn mission
		a2gmr_wpt_no = missionSeqSwitch
		mrMissionsCompletedCount = mrMissionsCompletedCount + 1
		mrMissionsCompletedStatusText = "Mission Sequence Status: Mission " .. mrMissionsCompletedCount .. " of " .. mrMaxMissionA2gSequence
		
		trigger.action.outText( "<< A2G Easy Mission: \""..EasyMissionName.."\" [WPT-".. a2gmr_wpt_no .."] Active >>" .. getMissionCompletionStatusText("MR"), 12)
	else
		local switch;
		repeat
			switch = math.random (1,MR_zone_count)
		until switch ~= lastMR;
		lastMR = switch;
		
		if MissionNumSelect ~= nil then
			tti.debug("Mission Num A2G Easy select for: " .. EasyMissionName .. " is: " .. MissionNumSelect, MissionSelectDebugText)
			switch = MissionNumSelect
		else
			tti.debug("Mission Num select A2G Easy is nil", false)
		end
		
		arrayZoneMR[switch][4] = true
		a2gmr_spawn(switch) --spawn mission
		a2gmr_wpt_no = switch
		
		trigger.action.outText( "<< A2G Easy Mission: \""..EasyMissionName.."\" [WPT-".. a2gmr_wpt_no .."] Active >>", 7)
	end
	
------ end mission sequence ----------------------


	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
	trigger.action.setUserFlag('71', false)

local RandomRedReinforcementStartTime = math.random(300,1200)
tti.debug("Red Battalion will reinforce A2G Easy Mission in " ..  RandomRedReinforcementStartTime .. " seconds!")

if ai_troops_transport_location == "a2g easy" then
	timer.scheduleFunction(function() 
		helo_transport("mr")
	end, nil, timer.getTime() + heloTransportDelayTime  )
end

timer.scheduleFunction(function() 
	for i = 1,#arrayZoneMR,1
		do
		if trigger.misc.getUserFlag(arrayZoneMR[i][3]) == 1 and blue_ground_battalion_easy == true then
			start_blue_ground_battalion(_G[arrayZoneMR[i][1]], EasyMissionName, "A2G Easy")
		end
	end
end, nil, timer.getTime() + delayStartBlueBattalionTime  )

timer.scheduleFunction(function() 
	for i = 1,#arrayZoneMR,1
		do
		if trigger.misc.getUserFlag(arrayZoneMR[i][3]) == 1 and red_veh_battalion_easy == true then
			start_red_veh_battalion(_G[arrayZoneMR[i][1]], EasyMissionName, "A2G Easy")
		end
	end
end, nil, timer.getTime() + RandomRedReinforcementStartTime  )
--end, nil, timer.getTime() + 10  )

main_detection_mr()
floatingRedGroundUnitCheck()

--else
--trigger.action.outText( "<< All A2G Easy Missions COMPLETE for this session >>\nRestart the session or use the F10 - Other Menu to restart the mission cycle.", 7)
--trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
--end

end

function a2gmr_spawn(missionNumber)
for i=1, a2g_easy_misc do
	local group = A2GMR:SpawnInZone( MR_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_MR, group)
end
for i=1, a2g_easy_aa do
	local group = A2G_AA_EASY:SpawnInZone( MR_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_MR, group)
end
for i=1, a2g_easy_sam_easy do
	local group = A2G_SAM_MR_EASY:SpawnInZone( MR_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_MR, group)
end
for i=1, a2g_easy_sam_hard do
	local group = A2G_SAM_MR_HARD:SpawnInZone( MR_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_MR, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end

activate_MR_jtac(missionNumber)
	
timer.scheduleFunction(function() -- delay marker generation to allow for proper mission seq string generation
create_mr_marker(missionNumber)
end, nil, timer.getTime() + 2  )

end

function a2gj_start(MissionNumSelect)
--main_detection(15)
unitThresholdAG = false
-- To allow searching for units above AGL to despawn them.
--allow_mr_agl_search = true
allow_ag_agl_search = true

timer.scheduleFunction(function() --Stop searching for above AGL spawned units
	--allow_mr_agl_search = true
	allow_ag_agl_search = false
	--allow_agh_agl_search = true
	--allow_inf_agl_search = true
end, nil, timer.getTime() + search_agl_time )


HardMissionNameGen()
trigger.action.setUserFlag('AG-STARTING', true)
	--local switch = math.random (1,10) 
	
------ start mission sequence ----------------------

	if enableMissionsSequence == true then	
		local missionSeqSwitch = getMissionSequenceNumber(agEnableMissionsSequenceSwitchList, agMissionsCompleted, agMaxMissionA2gSequence, AG_zone_count)
		arrayZoneAG[missionSeqSwitch][4] = true
		a2gj_spawn(missionSeqSwitch) --spawn mission
		a2gj_wpt_no = missionSeqSwitch + 10
		agMissionsCompletedCount = agMissionsCompletedCount + 1
		agMissionsCompletedStatusText = "Mission Sequence Status: Mission " .. agMissionsCompletedCount .. " of " .. agMaxMissionA2gSequence
		
		trigger.action.outText( "<< A2G Hard Mission: \""..HardMissionName.."\" [WPT-".. a2gj_wpt_no .."] Active >>" .. getMissionCompletionStatusText("AG"), 12)
	else
		local switch;
		repeat
			switch = math.random (1,AG_zone_count)
		until switch ~= lastA2GJ;
		lastA2GJ = switch;
		
		if MissionNumSelect ~= nil then
			tti.debug("Mission Num A2G Hard select for: " .. HardMissionName .. " is: " .. MissionNumSelect, MissionSelectDebugText)
			switch = MissionNumSelect
		else
			tti.debug("Mission Num A2G Hard select is nil", false)
		end
		
		arrayZoneAG[switch][4] = true
		a2gj_spawn(switch)
		a2gj_wpt_no = switch + 10
		
		trigger.action.outText( "<< A2G Hard Mission: \""..HardMissionName.."\" [WPT-".. a2gj_wpt_no .."] Active >>", 7)
	end
	
------ end mission sequence ----------------------


trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
trigger.action.setUserFlag('61', false)

if ai_troops_transport_location == "a2g hard" then
	timer.scheduleFunction(function() 
		helo_transport("ag")
	end, nil, timer.getTime() + heloTransportDelayTime  )
end

local RandomRedReinforcementStartTime = math.random(300,1200)
tti.debug("Red Battalion will reinforce A2G Hard Mission in " ..  RandomRedReinforcementStartTime .. " seconds!")

timer.scheduleFunction(function() -- Start Blue Battalion
	for i = 1,#arrayZoneAG,1
		do
		if trigger.misc.getUserFlag(arrayZoneAG[i][3]) == 1 and blue_ground_battalion_hard == true then
			start_blue_ground_battalion(_G[arrayZoneAG[i][1]], HardMissionName, "A2G Hard")
		end
	end
end, nil, timer.getTime() + delayStartBlueBattalionTime  )


timer.scheduleFunction(function() -- Start Red Battalion
	for i = 1,#arrayZoneAG,1
		do
		if trigger.misc.getUserFlag(arrayZoneAG[i][3]) == 1 and red_veh_battalion_hard == true then
			start_red_veh_battalion(_G[arrayZoneAG[i][1]], HardMissionName, "A2G Hard")
		end
	end
end, nil, timer.getTime() + RandomRedReinforcementStartTime  )
--end, nil, timer.getTime() + 10  )
main_detection_ag()
floatingRedGroundUnitCheck()



end

function a2gj_spawn(missionNumber)
for i=1, a2g_hard_misc  do
	local group = A2GJ:SpawnInZone( AG_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_AG, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end

for i=1, a2g_hard_aa do
	local group = A2G_AA_HARD:SpawnInZone( AG_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_AG, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end
for i=1, a2g_hard_sam_easy do
	local group = A2G_SAM_A2GJ_EASY:SpawnInZone( AG_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_AG, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end
for i=1, a2g_hard_sam_hard do
	local group = A2G_SAM_A2GJ_HARD:SpawnInZone( AG_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_AG, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end
activate_AG_jtac(missionNumber)

timer.scheduleFunction(function() -- delay marker generation to allow for proper mission seq string generation
create_ag_marker(missionNumber)
end, nil, timer.getTime() + 2  )

end


  
function a2gh_start(MissionNumSelect)
--main_detection(15)
unitThresholdAGH = false
allow_agh_agl_search = true



timer.scheduleFunction(function() --Stop searching for above AGL spawned units

	allow_agh_agl_search = false

end, nil, timer.getTime() + search_agl_time )

HeloMissionNameGen()
trigger.action.setUserFlag('AGH-STARTING', true)

	
	
------ start mission sequence ----------------------

	if enableMissionsSequence == true then	
		local missionSeqSwitch = getMissionSequenceNumber(aghEnableMissionsSequenceSwitchList, aghMissionsCompleted, aghMaxMissionA2gSequence, AGH_zone_count)
		arrayZoneAGH[missionSeqSwitch][4] = true
		a2gh_spawn(missionSeqSwitch) --spawn mission
		a2gh_wpt_no = missionSeqSwitch + 20
		aghMissionsCompletedCount = aghMissionsCompletedCount + 1
		aghMissionsCompletedStatusText = "Mission Sequence Status: Mission " .. aghMissionsCompletedCount .. " of " .. aghMaxMissionA2gSequence
		
		trigger.action.outText( "<< A2G Helo Mission: \""..HeloMissionName.."\" [WPT-".. a2gh_wpt_no .."] Active >>" .. getMissionCompletionStatusText("AGH"), 12)
	else
		local switch;
		repeat
		switch = math.random (1,AGH_zone_count)
		until switch ~= lastA2Ghelo; 
		lastA2Ghelo = switch;
		
		if MissionNumSelect ~= nil then
			tti.debug("Mission Num A2G Helo select for: " .. HeloMissionName .. " is: " .. MissionNumSelect, MissionSelectDebugText)
			switch = MissionNumSelect
		else
			tti.debug("Mission Num A2G Helo select is nil", false)
		end
	
		arrayZoneAGH[switch][4] = true
		a2gh_spawn(switch) --spawn mission
		a2gh_wpt_no = switch + 20
	
		trigger.action.outText( "<< A2G Helo Mission: \""..HeloMissionName.."\" [WPT-".. a2gh_wpt_no .."] Active >>", 7)
	end
	
------ end mission sequence ----------------------
	
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
	trigger.action.setUserFlag('81', false)
	
	if ai_troops_transport_location == "a2g helo" then
		timer.scheduleFunction(function() 
			helo_transport("agh")
		end, nil, timer.getTime() + heloTransportDelayTime  )
	end
	
main_detection_agh()
floatingRedGroundUnitCheck()
end

function a2gh_spawn(missionNumber)  --1 per group
for i=1, a2g_helo_misc do
	local group = A2GH:SpawnInZone( AGH_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_AGH, group)
end
for i=1, a2g_helo_aa do
	local group = A2G_AA_HELO:SpawnInZone( AGH_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_AGH, group)
end
for i=1, a2g_helo_sam_easy do
	local group = A2G_SAM_HELO_EASY:SpawnInZone( AGH_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_AGH, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end
for i=1, a2g_helo_sam_hard do
	local group = A2G_SAM_HELO_HARD:SpawnInZone( AGH_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_AGH, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end
activate_AGH_jtac(missionNumber)
timer.scheduleFunction(function() -- delay marker generation to allow for proper mission seq string generation
create_agh_marker(missionNumber)
end, nil, timer.getTime() + 2  )
end



function a2gia_start(MissionNumSelect)
--main_detection(15)
unitThresholdAGHIA = false
-- To allow searching for units above AGL to despawn them.
allow_inf_agl_search = true


timer.scheduleFunction(function() --Stop searching for above AGL spawned units
	allow_inf_agl_search = false
end, nil, timer.getTime() + search_agl_time )

InfMissionNameGen()
trigger.action.setUserFlag('AGHIA-STARTING', true)


	
	
------ start mission sequence ----------------------

	if enableMissionsSequence == true then	
		local missionSeqSwitch = getMissionSequenceNumber(infEnableMissionsSequenceSwitchList, infMissionsCompleted, infMaxMissionA2gSequence, INFAS_zone_count)
		arrayZoneINFAS[missionSeqSwitch][4] = true
		a2gia_spawn(missionSeqSwitch) --spawn mission
		a2gia_wpt_no = missionSeqSwitch + 30
		infMissionsCompletedCount = infMissionsCompletedCount + 1
		infMissionsCompletedStatusText = "Mission Sequence Status: Mission " .. infMissionsCompletedCount .. " of " .. infMaxMissionA2gSequence
		
		trigger.action.outText( "<< Infantry Assault Mission: \""..InfMissionName.."\" [WPT-".. a2gia_wpt_no .."] Active >>" .. getMissionCompletionStatusText("INF"), 12)
	else
		local switch;
		repeat
		switch = math.random (1,INFAS_zone_count)
		until switch ~= lastA2GIA;
		lastA2GIA = switch;
		
		if MissionNumSelect ~= nil then
			tti.debug("Mission Num A2G Infantry Assault select for: " .. InfMissionName .. " is: " .. MissionNumSelect, MissionSelectDebugText)
			switch = MissionNumSelect
		else
			tti.debug("Mission Num A2G Infantry Assault select is nil", false)
		end


	arrayZoneINFAS[switch][4] = true
	a2gia_spawn(switch)
	a2gia_wpt_no = switch + 30
	
	trigger.action.outText( "<< Infantry Assault Mission: \""..InfMissionName.."\" [WPT-".. a2gia_wpt_no .."] Active >>", 7)
	end
	
------ end mission sequence ----------------------
	
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
	trigger.action.setUserFlag('111', false)
	
	if ai_troops_transport_location == "a2g infantry assault" then
		timer.scheduleFunction(function() 
			helo_transport("ia")
		end, nil, timer.getTime() + heloTransportDelayTime  )
	end

local RandomRedReinforcementStartTime = math.random(300,1200)
tti.debug("Red Troops will reinforce A2G Infantry Mission in " ..  RandomRedReinforcementStartTime .. " seconds!")
	
	timer.scheduleFunction(function() 
		for i = 1,#arrayZoneINFAS,1
			do
			if trigger.misc.getUserFlag(arrayZoneINFAS[i][3]) == 1 and blue_ground_battalion_inf == true then
				start_blue_ground_battalion(_G[arrayZoneINFAS[i][1]], InfMissionName, "A2G Infantry Assault")
			end
		end
	end, nil, timer.getTime() + delayStartBlueBattalionTime  )
	
	timer.scheduleFunction(function() 
		for i = 1,#arrayZoneINFAS,1
			do
			if trigger.misc.getUserFlag(arrayZoneINFAS[i][3]) == 1 then
				start_red_inf_battalion(_G[arrayZoneINFAS[i][1]], InfMissionName, "A2G Infantry Assault")
			end
		end
	end, nil, timer.getTime() + RandomRedReinforcementStartTime  )
	
main_detection_inf()
floatingRedGroundUnitCheck()
end

function a2gia_spawn(missionNumber)  --1 per group
for i=1, a2g_inf_troops do
	local group = A2GIA:SpawnInZone( INFAS_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_INF, group)
end
for i=1, a2g_inf_misc do
	local group = A2GIAM:SpawnInZone( INFAS_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_INF, group)
end
for i=1, a2g_inf_aa do
	local group = A2G_AA_INF:SpawnInZone( INFAS_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_INF, group)
end
for i=1, a2g_inf_sam_easy do
	local group = A2G_SAM_INF_EASY:SpawnInZone( INFAS_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_INF, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end
for i=1, a2g_inf_sam_hard do
	local group = A2G_SAM_INF_HARD:SpawnInZone( INFAS_poly_zone_list[missionNumber], true )
	table.insert(missionGroups_INF, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end
activate_INF_jtac(missionNumber)
timer.scheduleFunction(function() -- delay marker generation to allow for proper mission seq string generation
create_infas_marker(missionNumber)
end, nil, timer.getTime() + 2  )
end

function a2gas_start(MissionNumSelect)
--main_detection(15)
ShipMissionNameGen()
trigger.action.setUserFlag('AS-STARTING', true)
	--local switch = math.random (1,5) 
	

	
------ start mission sequence ----------------------

	if enableMissionsSequence == true then	
		local missionSeqSwitch = getMissionSequenceNumber(asEnableMissionsSequenceSwitchList, asMissionsCompleted, asMaxMissionA2gSequence, ASS_zone_count)
		arrayZoneASS[missionSeqSwitch][4] = true
		a2gas_spawn(missionSeqSwitch) --spawn mission
		asMissionsCompletedCount = asMissionsCompletedCount + 1
		asMissionsCompletedStatusText = "Mission Sequence Status: Mission " .. asMissionsCompletedCount .. " of " .. asMaxMissionA2gSequence
		
		trigger.action.outText( "<< Anti-Ship Mission: \""..ShipMissionName.."\" [NO WPT] Active >>" .. getMissionCompletionStatusText("ASS"), 12)
	else
		local switch;
		repeat
		switch = math.random (1,ASS_zone_count)
		until switch ~= lastA2GAS;
		lastA2GAS = switch;
		
		
		if MissionNumSelect ~= nil then
			tti.debug("Mission Num AntiShip select for: " .. ShipMissionName .. " is: " .. MissionNumSelect, MissionSelectDebugText)
			switch = MissionNumSelect
		else
			tti.debug("Mission Num AntiShip select is nil", false)
		end
		
		a2gas_spawn(switch) --spawn mission
		arrayZoneASS[switch][4] = true

	trigger.action.outText( "<< Anti-Ship Mission: \""..ShipMissionName.."\" [NO WPT] Active >>", 7)
	end
	
------ end mission sequence ----------------------
	
	
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
	if enemy_ship_ai == true then
		trigger.action.outText( ">Enemy ships are WEAPONS FREE and will ATTACK/DEFEND<\nYou can change this setting in the mission settings.", 7)
	elseif enemy_ship_ai == false then
		trigger.action.outText( ">Enemy ships are set WEAPONS HOLD and will not ATTACK<\nYou can change this setting in the mission settings.", 7)
	end
	trigger.action.setUserFlag('91', false)


main_detection_as()
end

function a2gas_spawn(missionNumber)
if enemy_ship_ai == true then
	for i=1, a2g_antiship do
		local group = A2GAS:SpawnInZone( ASS_zone_list[missionNumber], true )
		table.insert(missionGroups_AS, group)
	end
elseif enemy_ship_ai == false then
	for i=1, a2g_antiship do
		local group = A2GAS_Disabled:SpawnInZone( ASS_zone_list[missionNumber], true )
		table.insert(missionGroups_AS, group)
	end
end
create_as_marker(missionNumber)
end

function a2gsead_start(MissionNumSelect)
--main_detection(15)
unitThresholdAG = false
-- To allow searching for units above AGL to despawn them.
--allow_mr_agl_search = true
allow_sead_agl_search = true

timer.scheduleFunction(function() --Stop searching for above AGL spawned units
	--allow_mr_agl_search = true
	allow_sead_agl_search = false
	--allow_agh_agl_search = true
	--allow_inf_agl_search = true
end, nil, timer.getTime() + search_agl_time )


SeadMissionNameGen()
trigger.action.setUserFlag('SEAD-STARTING', true)
	--local switch = math.random (1,10) 



------ start mission sequence ----------------------

	if enableMissionsSequence == true then	
		local missionSeqSwitch = getMissionSequenceNumber(seadEnableMissionsSequenceSwitchList, seadMissionsCompleted, seadMaxMissionA2gSequence, SEAD_zone_count)
		arrayZoneSEAD[missionSeqSwitch][4] = true
		a2gsead_spawn(missionSeqSwitch) --spawn mission
		seadMissionsCompletedCount = seadMissionsCompletedCount + 1
		seadMissionsCompletedStatusText = "Mission Sequence Status: Mission " .. seadMissionsCompletedCount .. " of " .. seadMaxMissionA2gSequence
		
		trigger.action.outText( "<< A2G SEAD Mission: \""..SeadMissionName.."\" [NO WPT] Active >>" .. getMissionCompletionStatusText("SEAD"), 12)
	else
		local switch;
		repeat
			switch = math.random (1,SEAD_zone_count)
		until switch ~= lastA2GSEAD;
		lastA2GSEAD = switch;
		
		if MissionNumSelect ~= nil then
			tti.debug("Mission Num SEAD select for: " .. SeadMissionName .. " is: " .. MissionNumSelect, MissionSelectDebugText)
			switch = MissionNumSelect
		else
			tti.debug("Mission Num SEAD select is nil", false)
		end
		
		arrayZoneSEAD[switch][4] = true
		a2gsead_spawn(switch)
		--a2gsead_wpt_no = switch + 10
		
		trigger.action.outText( "<< A2G SEAD Mission: \""..SeadMissionName.."\" [NO WPT] Active >>", 7)
	end
	
------ end mission sequence ----------------------


trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )


main_detection_sead()
floatingRedGroundUnitCheck()
end

function a2gsead_spawn(missionNumber)
for i=1, a2g_sead_misc  do
	local group = A2GSEAD_MISC:SpawnInZone( SEAD_zone_list[missionNumber], true )
	table.insert(missionGroups_SEAD, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end

for i=1, a2g_sead_aa do
	local group = A2G_AA_HARD:SpawnInZone( SEAD_zone_list[missionNumber], true )
	table.insert(missionGroups_SEAD, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end
for i=1,a2g_sead_sam_easy do
	local group = A2G_SEAD_EASY:SpawnInZone( SEAD_zone_list[missionNumber], true )
	table.insert(missionGroups_SEAD, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end
for i=1, a2g_sead_sam_hard do
	local group = A2G_SEAD_HARD:SpawnInZone( SEAD_zone_list[missionNumber], true )
	table.insert(missionGroups_SEAD, group)
	if iads_script_enable == true then
		redIADS:addSAMSite(group.GroupName)
	end
end
activate_SEAD_jtac(missionNumber)
timer.scheduleFunction(function() -- delay marker generation to allow for proper mission seq string generation
create_sead_marker(missionNumber)
end, nil, timer.getTime() + 2  )
end

TemplateTable_Red_Reinforcements_Inf = {
"Infantry_Red",
}

--generateRedConvoyTemplate() -- intially generate red convoy vehicles for reinformcements

if mission_era == "modern" then
--Red_Veh_Reinforcements_Group = SPAWN:NewWithAlias( "convoy_template_ground_red", "Red_Reinforcements_Veh" )
Red_Inf_Reinforcements_Group = SPAWN:NewWithAlias( "Infantry_Red", "Red_Reinforcements_Inf" )
end

if mission_era == "cold_war" then
--Red_Veh_Reinforcements_Group = SPAWN:NewWithAlias( "convoy_template_ground_red", "Red_Reinforcements_Veh" )
Red_Inf_Reinforcements_Group = SPAWN:NewWithAlias( "Infantry_Red", "Red_Reinforcements_Inf" )
end

if mission_era == "ww2" then
--Red_Veh_Reinforcements_Group = SPAWN:NewWithAlias( "convoy_template_ground_red", "Red_Reinforcements_Veh" )
	if ww2_asset_pack_enable == true then
		Red_Inf_Reinforcements_Group = SPAWN:NewWithAlias( "Infantry_Red_WW2_Paid", "Red_Reinforcements_Inf" )
	else
		Red_Inf_Reinforcements_Group = SPAWN:NewWithAlias( "Infantry_Red_WW2_Free", "Red_Reinforcements_Inf" )
	end
end

if mission_era == "korean_war" then
--Red_Veh_Reinforcements_Group = SPAWN:NewWithAlias( "convoy_template_ground_red", "Red_Reinforcements_Veh" )
	if ww2_asset_pack_enable == true then
		Red_Inf_Reinforcements_Group = SPAWN:NewWithAlias( "Infantry_Red_WW2_Paid", "Red_Reinforcements_Inf" )
	else
		Red_Inf_Reinforcements_Group = SPAWN:NewWithAlias( "Infantry_Red_WW2_Free", "Red_Reinforcements_Inf" )
	end
end

TemplateTable_CAS_Helo_Reinforcements = {
--"blue_helo_ah64d",
--"blue_helo_ah64a",
--"blue_helo_oh58d",
--"blue_helo_sa342l",
--"blue_helo_uh1h",
"blue_helo_ah64d_guns_only"
}

blueCasHeloCallsign = {
"Whirly",
"Duster",
"Dirt Devil",
"Whirlwind",
"Whirly Bird",
"Lighting",
"Blazer",
"Hell Storm",
"Doom Bringer",
"Death Dealer",
"Reaper",
"Mud Striker",
"Harbinger",
"Goliath",
"Steel Fire",
"Flamer",
"Ember",
"Pyro",
"Punisher",
"Wrecker",
"Demon",
"Torchlighter",
"Zippo",
"Burner",
"Striker",
}

delayStartBlueBattalionTime = 60
blueBattalionOuterSpawnRadius = 3000
blueBattalionInnerSpawnRadius = 2400
blueBattalionOuterWptRadius = 1200
blueBattalionInnerWptRadius = 600

blueGroundBattalionCallsign = {
"Charger",
"Warrior",
"Roller",
"Boulder",
"Bloodshed",
"Beast",
"Fury",
"Thruster",
"Diplomacy Failed",
"Aggressive Negotiations",
"Atomizer",
"Bulldozer",
"Executioner",
"Judge",
"Chaos",
"Shadow",
"Harbinger",
"Cthulu",
"Jackal",
"Ember",
"Inferno",
"Defender",
"Slayer",
"Dragon",
"Spiker",
"Crimson",
"Vampire",
"Scarface",
"Shield",
"Butcher",
"Steel",
"Mecha",
}

function start_blue_ground_battalion(agMissionZone, missionNameVar, msnTypeStr)
	if blue_ground_battalion_enable == true then
			generateBlueConvoyTemplate()
			local strBlueBattallonCallsign = string.upper(blueGroundBattalionCallsign[math.random(1,#blueGroundBattalionCallsign)]) .." ".. tostring(math.random (1,9)) .. "-1"
			tti.debug("Blue Ground Battalion 1 Callsign is: " .. strBlueBattallonCallsign)
			
			--A2G_BLUE_BATTALION = SPAWN:NewWithAlias("Blue_Ground_Battalion_1", strBlueBattallonCallsign)
			_G[strBlueBattallonCallsign] = SPAWN:NewWithAlias("convoy_template_ground_blue", strBlueBattallonCallsign)
			-- if mission_era == "modern" or mission_era == "cold_war" or mission_era == "korean_war" then
				-- _G[strBlueBattallonCallsign] = SPAWN:NewWithAlias("convoy_template_ground_blue", strBlueBattallonCallsign)
			-- else
				-- _G[strBlueBattallonCallsign] = SPAWN:NewWithAlias("convoy_template_ground_blue", strBlueBattallonCallsign)
			-- end
		--timer.scheduleFunction(function() 
			local random_blue_battalion_starting_cord = agMissionZone:GetCoordinate()
			local random_blue_battalion_starting_vec2 = random_blue_battalion_starting_cord:GetRandomVec2InRadius(blueBattalionOuterSpawnRadius, blueBattalionInnerSpawnRadius)
			local random_blue_battalion_wpt_vec2 = random_blue_battalion_starting_cord:GetRandomVec2InRadius(blueBattalionOuterWptRadius, blueBattalionInnerWptRadius)
			local A2G_Blue_Battalion_Group = _G[strBlueBattallonCallsign]:OnSpawnGroup(
					function( SpawnGroup )
						if blue_battallion_attack_point == "center" then
							local TaskEngage = SpawnGroup:TaskRouteToVec2(agMissionZone:GetVec2())
						elseif blue_battallion_attack_point == "random" then
							local TaskEngage = SpawnGroup:TaskRouteToVec2(random_blue_battalion_wpt_vec2)
						end
					trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
					--trigger.action.outText("<< ".. msnTypeStr .. " Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nFriendly armored battalion: [" .. _G[strBlueBattallonCallsign]:GetName() .. "] is on the move to the attack the objective!", 40 )
					trigger.action.outText("<< ".. msnTypeStr .. " Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nFriendly armored battalion: [" .. SpawnGroup:GetName() .. "] is on the move to the attack the objective!", 40 )
					timer.scheduleFunction(function()
					if voice_lines_audio == "enabled" then
					trigger.action.outSound(tti.a2g.vehiclesDeployedSound[math.random(1,#tti.a2g.vehiclesDeployedSound)])
						elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
				elseif voice_lines_audio == "silent" then
				end			
					end, nil, timer.getTime() + 1  )
					end)
				:SpawnFromVec2(random_blue_battalion_starting_vec2)
		--end, nil, timer.getTime() + delayStartBlueBattalionTime  )
	end
end


red_battallion_attack_point = "center"
--red_veh_battalion_mission = "a2g_easy"
--delayStartRedBattalionTime = 60
redBattalionOuterSpawnRadius = 3000
redBattalionInnerSpawnRadius = 2400
redBattalionOuterWptRadius = 1200
redBattalionInnerWptRadius = 600

--[[ --send to settings!
red_veh_battalion_enable = true
red_veh_battalion_hard = false
red_veh_battalion_easy = true
red_inf_battalion_enable = true
--]]

function randomRedBattalionNotify(msnTypeStr, missionNameVar)
local switch = math.random(1,3)
	if switch == 1 then
		trigger.action.outText("<< ".. msnTypeStr .." Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nEnemy reinforcements are advancing to the mission area, requesting additional support.", 40 )
		trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
		timer.scheduleFunction(function()
		if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/EnemyReinforcementsAdvancingMissionAreaReqAddSupport.ogg" )
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end	
		end, nil, timer.getTime() + 1  )
	elseif switch == 2 then
		trigger.action.outText("<< ".. msnTypeStr .." Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nEnemy reinforcements are en route to the mission area!", 40 )					
		trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
				timer.scheduleFunction(function()
				if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/EnemyReinforcementsEnRtToMissionArea.ogg" )
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end	
		end, nil, timer.getTime() + 1  )
	elseif switch == 3 then
		trigger.action.outText("<< ".. msnTypeStr .." Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nThe enemy has called in reinforcements to the mission area!", 40 )					
		trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
		timer.scheduleFunction(function()
		if voice_lines_audio == "enabled" then
		trigger.action.outSound("TTI Soundfiles/TheEnemyHasCalledInReinforcementsToMsnArea.ogg" )
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end		
		
		end, nil, timer.getTime() + 1  )
	end
end


function start_red_veh_battalion(agMissionZone, missionNameVar, msnTypeStr)
	generateRedConvoyTemplate()
	--if red_veh_battalion_enable == true then
			--[[
			local attackMissionName
			
			if red_veh_battalion_mission == "a2g_easy" then
				local attackMissionName = EasyMissionName
			elseif red_veh_battalion_mission == "a2g_hard" then
				local attackMissionName = HardMissionName
			else
				env.info("script error: blue ground battalion mission type string error! - SETTING TO A2G HARD DUE TO ERROR")
				local attackMissionName = HardMissionName
			end
			--]]
		--timer.scheduleFunction(function() 
			local random_red_veh_starting_cord = agMissionZone:GetCoordinate()
			local random_red_veh_starting_vec2 = random_red_veh_starting_cord:GetRandomVec2InRadius(redBattalionOuterSpawnRadius, redBattalionInnerSpawnRadius)
			local random_red_veh_wpt_vec2 = random_red_veh_starting_cord:GetRandomVec2InRadius(redBattalionOuterWptRadius, redBattalionInnerWptRadius)
			
			Red_Veh_Reinforcements_Group_Main = SPAWN:NewWithAlias("A2G_Init", "A2G_RED_VEH_REINFORCEMENTS"):InitRandomizeTemplate(CurrentEraConvoyTemplate)
			
			A2G_Red_Veh_Group = Red_Veh_Reinforcements_Group_Main:OnSpawnGroup(
					function( SpawnGroup )
						if red_battallion_attack_point == "center" then
							local TaskEngage = SpawnGroup:TaskRouteToVec2(agMissionZone:GetVec2())
						elseif red_battallion_attack_point == "random" then
							local TaskEngage = SpawnGroup:TaskRouteToVec2(random_red_veh_wpt_vec2)
						end
					--trigger.action.outSound(tti.a2g.vehiclesDeployedSound[math.random(1,#tti.a2g.vehiclesDeployedSound)])
						--trigger.action.outSound("TTI Soundfiles/Ace Combat 5 Mission Update Sound Effect.ogg" )
						--trigger.action.outText("<< ".. msnTypeStr .." Mission: \"" .. missionNameVar .. "\" - UPDATE >>\n\nEnemy reinforcements are on the move to reinforce the objective!", 40 )
					randomRedBattalionNotify(msnTypeStr, missionNameVar)
					end)
				:SpawnFromVec2(random_red_veh_starting_vec2)
				if red_veh_battalion_easy == true then
				table.insert(missionGroups_MR, A2G_Red_Veh_Group)
				elseif red_veh_battalion_hard == true then
				table.insert(missionGroups_AG, A2G_Red_Veh_Group)
				end
		--end, nil, timer.getTime() + delayStartBlueBattalionTime  )
	--end
end


red_inf_battallion_attack_point = "center"
--delayStartRedInfBattalionTime = 60
redInfBattalionOuterSpawnRadius = 3000
redInfBattalionInnerSpawnRadius = 2400
redInfBattalionOuterWptRadius = 1200
redInfBattalionInnerWptRadius = 600

function start_red_inf_battalion(agMissionZone, missionNameVar, msnTypeStr)
	if red_inf_battalion_enable == true then
			local random_red_inf_starting_cord = agMissionZone:GetCoordinate()
			local random_red_inf_starting_vec2 = random_red_inf_starting_cord:GetRandomVec2InRadius(redBattalionOuterSpawnRadius, redBattalionInnerSpawnRadius)
			local random_red_inf_wpt_vec2 = random_red_inf_starting_cord:GetRandomVec2InRadius(redBattalionOuterWptRadius, redBattalionInnerWptRadius)
			A2G_Red_Inf_Group = Red_Inf_Reinforcements_Group:OnSpawnGroup(
					function( SpawnGroup )
						if red_inf_battallion_attack_point == "center" then
							local TaskEngage = SpawnGroup:TaskRouteToVec2(agMissionZone:GetVec2())
						elseif red_inf_battallion_attack_point == "random" then
							local TaskEngage = SpawnGroup:TaskRouteToVec2(random_red_veh_wpt_vec2)
						end
					randomRedBattalionNotify(msnTypeStr, missionNameVar)
					end)
				:SpawnFromVec2(random_red_inf_starting_vec2)
			table.insert(missionGroups_INF, A2G_Red_Inf_Group)
	end
end

enable_convoy_missions = true

TemplateTable_CONVOY_GROUND_MODERN = {
	"convoy_template_ground_red",
}

TemplateTable_CONVOY_GROUND_WW2 = {
	"convoy_template_ground_red",
}

TemplateTable_CONVOY_GROUND_KOREAN_WAR = {
	"convoy_template_ground_red",
}

TemplateTable_CONVOY_GROUND_COLD_WAR = {
	"convoy_template_ground_red",
}

if mission_era == "modern" then
		CurrentEraConvoyTemplate = TemplateTable_CONVOY_GROUND_MODERN
	elseif mission_era == "cold_war" then
		CurrentEraConvoyTemplate = TemplateTable_CONVOY_GROUND_COLD_WAR
	elseif mission_era == "ww2" then
		CurrentEraConvoyTemplate = TemplateTable_CONVOY_GROUND_WW2
	elseif mission_era == "korean_war" then
		CurrentEraConvoyTemplate = TemplateTable_CONVOY_GROUND_KOREAN_WAR
end

Convoy_alive = false

function random_convoy_start(MissionNumSelect)
	generateRedConvoyTemplate()
	trigger.action.setUserFlag('CONVOY-STARTING', true)
	timer.scheduleFunction(function()
		if enable_convoy_missions == true then
			-- local switch;
			-- repeat
				-- switch = math.random(1,#convoyRouteTemplates)
				-- --switch = math.random(1,1)
			-- until switch ~= lastConvoy;
			-- lastConvoy = switch;
				
			-- ConvoyMissionNameGen()
			-- --trigger.action.outText( "<< Convoy Hunt Mission ".. switch .." started: \""..ConvoyMissionName.."\" >>", 20)
			-- trigger.action.outText( "<< Convoy Hunt Mission started: \""..ConvoyMissionName.."\" >>", 20)
			-- env.info( "TTI: Convoy Hunt Mission: \""..ConvoyMissionName.."\" started.")
				
			-- Convoy_start(switch)			
			
			
			------ start mission sequence ----------------------

	if enableMissionsSequence == true then	
		local missionSeqSwitch = getMissionSequenceNumber(convEnableMissionsSequenceSwitchList, convMissionsCompleted, convMaxMissionA2gSequence, #convoyRouteTemplates)
		Convoy_start(missionSeqSwitch) --spawn mission
		convMissionsCompletedCount = convMissionsCompletedCount + 1
		convMissionsCompletedStatusText = "Mission Sequence Status: Mission " .. convMissionsCompletedCount .. " of " .. convMaxMissionA2gSequence
		ConvoyMissionNameGen()
		trigger.action.outText( "<< Convoy Hunt Mission started: \""..ConvoyMissionName.."\" >>" .. getMissionCompletionStatusText("CONV"), 12)
		env.info( "TTI: Convoy Hunt Mission: \""..ConvoyMissionName.."\" started.")
	else
		local switch;
			repeat
				switch = math.random(1,#convoyRouteTemplates)
				--switch = math.random(1,1)
			until switch ~= lastConvoy;
			lastConvoy = switch;
			
			
		if MissionNumSelect ~= nil then
			tti.debug("Mission Num Convoy select for: " .. ConvoyMissionName .. " is: " .. MissionNumSelect, MissionSelectDebugText)
			switch = MissionNumSelect
		else
			tti.debug("Mission Num Convoy select is nil", false)
		end
			
		Convoy_start(switch)
		ConvoyMissionNameGen()
		trigger.action.outText( "<< Convoy Hunt Mission started: \""..ConvoyMissionName.."\" >>", 20)
		env.info( "TTI: Convoy Hunt Mission: \""..ConvoyMissionName.."\" started.")
	end
	
------ end mission sequence ----------------------
	
	
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
	auto_update_convoy_marker() -- Start convoy marker refresh loop
	
	if convMissionAcceptMenuRoot then
	missionCommands.removeItem(convMissionAcceptMenuRoot)
	tti.debug("Removing Mission Accept Menu Item - CONV")
end

if singleRandomMissionModeEnabled == true then
	removeRandomMissionMenuAcceptList()
end
			
		end
	end, nil, timer.getTime() + 3 )
end

convoyRouteTemplates = {
"Convoy1",
"Convoy2",
"Convoy3",
"Convoy4",
"Convoy5",
"Convoy6",
"Convoy7",
"Convoy8",
"Convoy9",
"Convoy10",
}

function Convoy_start(missionNumber)

ConvoyMain = SPAWN:New(convoyRouteTemplates[math.random(1,#convoyRouteTemplates)]):InitRandomizeTemplate(CurrentEraConvoyTemplate)

	Convoy_alive = true
	ConvoySpawn = ConvoyMain:OnSpawnGroup(
		function( SpawnGroup )
			ConvoyGroupName = ConvoySpawn:GetName()
			ConvoyZone = ZONE_GROUP:New("ConvoyZone", ConvoySpawn, 20)
		end)
	:Spawn()
	create_convoy_marker()
	table.insert(missionGroups_CONVOY, ConvoySpawn)
	main_detection_convoy()
end

---- SHIP CONVOYS

TemplateTable_SHIP_CONVOY_MODERN = {
	"convoy_template_sea_red",
}

TemplateTable_SHIP_CONVOY_COLD_WAR = {
	"convoy_template_sea_red",
}

TemplateTable_SHIP_CONVOY_WW2 = {
	"convoy_template_sea_red",
}

TemplateTable_SHIP_CONVOY_KOREAN_WAR = {
	"convoy_template_sea_red",
}

if mission_era == "modern" then
		CurrentEraShipConvoyTemplate = TemplateTable_SHIP_CONVOY_MODERN
	elseif mission_era == "cold_war" then
		CurrentEraShipConvoyTemplate = TemplateTable_SHIP_CONVOY_COLD_WAR
	elseif mission_era == "ww2" then
		CurrentEraShipConvoyTemplate = TemplateTable_SHIP_CONVOY_WW2
	elseif mission_era == "korean_war" then
		CurrentEraShipConvoyTemplate = TemplateTable_SHIP_CONVOY_KOREAN_WAR
end

enable_ship_convoy_missions = true
--ship_convoy_map_markers = true

--ship_Convoy_alive = false
--[[
function random_ship_convoy_start()
	trigger.action.setUserFlag('SHIP-CONVOY-STARTING', true)
	timer.scheduleFunction(function()
		if enable_ship_convoy_missions == true then
			local switch;
			repeat
				switch = math.random(1,#shipConvoyRouteTemplates)
				--switch = math.random(1,1)
			until switch ~= lastShipConvoy;
			lastShipConvoy = switch;
				
			ShipConvoyMissionNameGen()
			--trigger.action.outText( "<< Convoy Hunt Mission ".. switch .." started: \""..ConvoyMissionName.."\" >>", 20)
			trigger.action.outText( "<< Ship Convoy Hunt Mission started: \""..ShipConvoyMissionName.."\" >>", 20)
			env.info( "TTI: Ship Convoy Hunt Mission ".. switch ..": \""..ShipConvoyMissionName.."\" started.")
			trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )			
			Ship_convoy_start(switch)			
			auto_update_ship_convoy_marker() -- Start convoy marker refresh loop
		end
	end, nil, timer.getTime() + 3 )
end
--]]
--generateRedSeaConvoyTemplate() -- intially generate red sea convoy units

function random_ship_convoy_start()
	if carrierOpsTheatre == true then
	generateRedSeaConvoyTemplate()
	trigger.action.setUserFlag('SHIP-CONVOY-STARTING', true)
	timer.scheduleFunction(function()
		if enable_ship_convoy_missions == true then
		
		
------ start mission sequence ----------------------

	if enableMissionsSequence == true then	
		local missionSeqSwitch = getMissionSequenceNumber(shipconvEnableMissionsSequenceSwitchList, shipconvMissionsCompleted, shipconvMaxMissionA2gSequence, #shipConvoyRouteTemplates)
		Ship_convoy_start(missionSeqSwitch) --spawn mission
		shipconvMissionsCompletedCount = shipconvMissionsCompletedCount + 1
		shipconvMissionsCompletedStatusText = "Mission Sequence Status: Mission " .. shipconvMissionsCompletedCount .. " of " .. shipconvMaxMissionA2gSequence
		ShipConvoyMissionNameGen()
		trigger.action.outText( "<< Ship Convoy Hunt Mission started: \""..ShipConvoyMissionName.."\" >>" .. getMissionCompletionStatusText("SHIPCONV"), 12)
		env.info( "TTI: Ship Convoy Hunt Mission: \""..ShipConvoyMissionName.."\" started.")
	else
		local switch;
			repeat
				switch = math.random(1,#shipConvoyRouteTemplates)
				--switch = math.random(1,1)
			until switch ~= lastShipConvoy;
			lastShipConvoy = switch;
		ShipConvoyMissionNameGen()
		Ship_convoy_start(switch)
		env.info( "TTI: Ship Convoy Hunt Mission: \""..ShipConvoyMissionName.."\" started.")
		trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )	
		Ship_convoy_start(switch)				
	end
	
------ end mission sequence ----------------------
		
			--ShipConvoyMissionNameGen()
			--trigger.action.outText( "<< Convoy Hunt Mission ".. switch .." started: \""..ConvoyMissionName.."\" >>", 20)
			--trigger.action.outText( "<< Ship Convoy Hunt Mission started: \""..ShipConvoyMissionName.."\" >>", 20)
			--env.info( "TTI: Ship Convoy Hunt Mission: \""..ShipConvoyMissionName.."\" started.")
			--trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )			
			--Ship_convoy_start(switch)			
			auto_update_ship_convoy_marker() -- Start convoy marker refresh loop
		end
	end, nil, timer.getTime() + 3 )
end
end

shipConvoyRouteTemplates = {
"ShipConvoy1",
"ShipConvoy2",
"ShipConvoy3",
"ShipConvoy4",
"ShipConvoy5",
}

if carrierOpsTheatre == true then
ShipConvoyInit1	=	ZONE:New( "ShipConvoyInit1" ) 
ShipConvoyInit2	=	ZONE:New( "ShipConvoyInit2" ) 
ShipConvoyInit3	=	ZONE:New( "ShipConvoyInit3" ) 
ShipConvoyInit4	=	ZONE:New( "ShipConvoyInit4" ) 
ShipConvoyInit5	=	ZONE:New( "ShipConvoyInit5" ) 
ShipConvoyWpt1	=	ZONE:New( "ShipConvoyWpt1" ) 
ShipConvoyWpt2	=	ZONE:New( "ShipConvoyWpt2" ) 
ShipConvoyWpt3	=	ZONE:New( "ShipConvoyWpt3" ) 
ShipConvoyWpt4	=	ZONE:New( "ShipConvoyWpt4" ) 
ShipConvoyWpt5	=	ZONE:New( "ShipConvoyWpt5" ) 
end

shipConvoyInitZones = {
[1] = ShipConvoyInit1,
[2] = ShipConvoyInit2,
[3] = ShipConvoyInit3,
[4] = ShipConvoyInit4,
[5] = ShipConvoyInit5,
}

shipConvoyWptZones = {
[1] = ShipConvoyWpt1,
[2] = ShipConvoyWpt2,
[3] = ShipConvoyWpt3,
[4] = ShipConvoyWpt4,
[5] = ShipConvoyWpt5,
}

shipConvOuterSpawnRadius = 3000
shipConvInnerSpawnRadius = 2400
shipConvOuterWptRadius = 1200
shipConvInnerWptRadius = 600

function Ship_convoy_start(missionNumber)

local random_ship_conv_init_starting_zone = shipConvoyInitZones[math.random(1,#shipConvoyInitZones)]

local random_ship_conv_wpt_zone = shipConvoyWptZones[math.random(1,#shipConvoyWptZones)]
local random_ship_conv_wpt_vec2 = random_ship_conv_wpt_zone:GetVec2()

ShipConvoyMain = SPAWN:NewWithAlias("A2GAS_Init", "A2G_SHIPCONVOY"):InitRandomizeTemplate(CurrentEraShipConvoyTemplate)
--ShipConvoyMain = SPAWN:New(shipConvoyRouteTemplates[math.random(1,#shipConvoyRouteTemplates)]):InitRandomizeTemplate(CurrentEraShipConvoyTemplate)

	Ship_Convoy_alive = true
	ShipConvoySpawn = ShipConvoyMain:OnSpawnGroup(
		function( SpawnGroup )
			ShipConvoyGroupName = ShipConvoySpawn:GetName()
			ShipConvoyZone = ZONE_GROUP:New("ShipConvoyZone", ShipConvoySpawn, 20)
			local TaskEngage = SpawnGroup:TaskRouteToVec2(random_ship_conv_wpt_vec2)
		end)
	--:Spawn()
	:SpawnInZone(random_ship_conv_init_starting_zone)
	create_ship_convoy_marker()
	table.insert(missionGroups_SHIPCONVOY, ShipConvoySpawn)
	main_detection_ship_convoy()
end

------------- EDIT SHAPES AND TEXT --------------
tti.marker = {}
tti.marker.convoy = {}
tti.marker.a2g = {}
tti.marker.airsupport = {}
---Circle Radius
tti.marker.convoy.circleSize = 1000 
--Circle Fill Color
tti.marker.convoy.circleFillColor = tti.color.red
--Circle Fill Alpha
tti.marker.convoy.circleFillAlpha = 0.18

--Circle Outline Color
tti.marker.convoy.circleOutlineColor = tti.color.white

--Text box offset from circle outline
tti.marker.convoy.textBoxOffset = 1500 + tti.marker.convoy.circleSize
--Text box position 360
tti.marker.convoy.textBoxAnglePosition = 45

tti.marker.convoy.textBoxFontSize = 9

tti.marker.convoy.textBoxTextColor = tti.color.white
tti.marker.convoy.textBoxTextAlpha = 0.8

tti.marker.convoy.textBoxFillColor = tti.color.red
tti.marker.convoy.textBoxFillAlpha = 0.5

cnv_id = {}
cnv_circle_id = {}
cnv_text_id = {}

ship_cnv_id = {}
ship_cnv_circle_id = {}
ship_cnv_text_id = {}

function create_convoy_marker()
	if convoy_map_markers == true and Convoy_alive == true then
		ConvoyZone_vec = ConvoySpawn:GetVec3()
		ConvoyZone_coord = COORDINATE:NewFromVec3(ConvoyZone_vec)
		--Convoy1Zone_vec = Convoy1Zone:GetVec3()
			if cnv_id[1] ~= nil then
				trigger.action.removeMark(cnv_id[1])	
			end
		cnv_id[1] = UTILS.GetMarkID()
		trigger.action.markToAll(cnv_id[1],"Convoy Hunt Mission: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<",ConvoyZone_vec,true)
		
		if enable_drawn_markers == true and Convoy_alive == true then
			if cnv_circle_id[1] ~= nil and cnv_text_id[1] ~= nil then
				trigger.action.removeMark(cnv_circle_id[1])
				trigger.action.removeMark(cnv_text_id[1])
			end
			cnv_circle_id[1] = UTILS.GetMarkID()
			cnv_circle_id[1] = ConvoyZone_coord:CircleToAll(tti.marker.convoy.circleSize, -1, tti.marker.convoy.circleOutlineColor, 0.5, tti.marker.convoy.circleFillColor, tti.marker.convoy.circleFillAlpha, 3, false)
			cnv_text_id[1] = UTILS.GetMarkID()
			cnv_text_id[1] = ConvoyZone_coord:Translate(tti.marker.convoy.textBoxOffset, tti.marker.convoy.textBoxAnglePosition):TextToAll("Convoy Hunt Mission: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<" .. getMissionCompletionStatusText("CONV"), -1, tti.marker.convoy.textBoxTextColor, tti.marker.convoy.textBoxTextAlpha, tti.marker.convoy.textBoxFillColor, tti.marker.convoy.textBoxFillAlpha, tti.marker.convoy.textBoxFontSize, false)
		end
		
	end
end

convoyMarkerRefreshTime = 300

function auto_update_convoy_marker()
timer.scheduleFunction(auto_update_convoy_marker, {}, timer.getTime() + convoyMarkerRefreshTime)

	if convoy_map_markers == true and Convoy_alive == true then

		ConvoyZone_vec = ConvoySpawn:GetVec3()
		
		ConvoyZone_coord = COORDINATE:NewFromVec3(ConvoyZone_vec)
			if cnv_id[1] ~= nil then
				trigger.action.removeMark(cnv_id[1])	
			end
		cnv_id[1] = UTILS.GetMarkID()
		trigger.action.markToAll(cnv_id[1],"Convoy Hunt Mission: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<",ConvoyZone_vec,true)
		
		if enable_drawn_markers == true and Convoy_alive == true then
			if cnv_circle_id[1] ~= nil and cnv_text_id[1] ~= nil then
				trigger.action.removeMark(cnv_circle_id[1])
				trigger.action.removeMark(cnv_text_id[1])
			end
			cnv_circle_id[1] = UTILS.GetMarkID()
			cnv_circle_id[1] = ConvoyZone_coord:CircleToAll(tti.marker.convoy.circleSize, -1, tti.marker.convoy.circleOutlineColor, 0.5, tti.marker.convoy.circleFillColor, tti.marker.convoy.circleFillAlpha, 3, false)
			cnv_text_id[1] = UTILS.GetMarkID()
			cnv_text_id[1] = ConvoyZone_coord:Translate(tti.marker.convoy.textBoxOffset, tti.marker.convoy.textBoxAnglePosition):TextToAll("Convoy Hunt Mission: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<" .. getMissionCompletionStatusText("CONV"), -1, tti.marker.convoy.textBoxTextColor, tti.marker.convoy.textBoxTextAlpha, tti.marker.convoy.textBoxFillColor, tti.marker.convoy.textBoxFillAlpha, tti.marker.convoy.textBoxFontSize, false)
		end
	end
end

--- SHIP CONVOY MARKER


function create_ship_convoy_marker()
	if ship_convoy_map_markers == true and Ship_Convoy_alive == true then
		ShipConvoyZone_vec = ShipConvoySpawn:GetVec3()
		ShipConvoyZone_coord = COORDINATE:NewFromVec3(ShipConvoyZone_vec)
		--Convoy1Zone_vec = Convoy1Zone:GetVec3()
			if ship_cnv_id[1] ~= nil then
				trigger.action.removeMark(ship_cnv_id[1])	
			end
		ship_cnv_id[1] = UTILS.GetMarkID()
		trigger.action.markToAll(ship_cnv_id[1],"Ship Convoy Hunt Mission: \n\""..ShipConvoyMissionName.."\"\n>> Ship Convoy's last known position <<",ShipConvoyZone_vec,true)
		
		if enable_drawn_markers == true and Ship_Convoy_alive == true then
			if ship_cnv_circle_id[1] ~= nil and ship_cnv_text_id[1] ~= nil then
				trigger.action.removeMark(ship_cnv_circle_id[1])
				trigger.action.removeMark(ship_cnv_text_id[1])
			end
			ship_cnv_circle_id[1] = UTILS.GetMarkID()
			ship_cnv_circle_id[1] = ShipConvoyZone_coord:CircleToAll(tti.marker.convoy.circleSize, -1, tti.marker.convoy.circleOutlineColor, 0.5, tti.marker.convoy.circleFillColor, tti.marker.convoy.circleFillAlpha, 3, false)
			ship_cnv_text_id[1] = UTILS.GetMarkID()
			ship_cnv_text_id[1] = ShipConvoyZone_coord:Translate(tti.marker.convoy.textBoxOffset, tti.marker.convoy.textBoxAnglePosition):TextToAll("Ship Convoy Hunt Mission: \n\""..ShipConvoyMissionName.."\"\n>> Ship Convoy's last known position <<" .. getMissionCompletionStatusText("SHIPCONV"), -1, tti.marker.convoy.textBoxTextColor, tti.marker.convoy.textBoxTextAlpha, tti.marker.convoy.textBoxFillColor, tti.marker.convoy.textBoxFillAlpha, tti.marker.convoy.textBoxFontSize, false)
		end
		
	end
end

shipConvoyMarkerRefreshTime = 300

function auto_update_ship_convoy_marker()
timer.scheduleFunction(auto_update_ship_convoy_marker, {}, timer.getTime() + shipConvoyMarkerRefreshTime)

	if ship_convoy_map_markers == true and Ship_Convoy_alive == true then

		ShipConvoyZone_vec = ShipConvoySpawn:GetVec3()
		
		ShipConvoyZone_coord = COORDINATE:NewFromVec3(ShipConvoyZone_vec)
			if ship_cnv_id[1] ~= nil then
				trigger.action.removeMark(ship_cnv_id[1])	
			end
		ship_cnv_id[1] = UTILS.GetMarkID()
		trigger.action.markToAll(ship_cnv_id[1],"Ship Convoy Hunt Mission: \n\""..ShipConvoyMissionName.."\"\n>> Ship Convoy's last known position <<",ShipConvoyZone_vec,true)
		
		if enable_drawn_markers == true and Convoy_alive == true then
			if ship_cnv_circle_id[1] ~= nil and ship_cnv_text_id[1] ~= nil then
				trigger.action.removeMark(ship_cnv_circle_id[1])
				trigger.action.removeMark(ship_cnv_text_id[1])
			end
			ship_cnv_circle_id[1] = UTILS.GetMarkID()
			ship_cnv_circle_id[1] = ShipConvoyZone_coord:CircleToAll(tti.marker.convoy.circleSize, -1, tti.marker.convoy.circleOutlineColor, 0.5, tti.marker.convoy.circleFillColor, tti.marker.convoy.circleFillAlpha, 3, false)
			ship_cnv_text_id[1] = UTILS.GetMarkID()
			ship_cnv_text_id[1] = ShipConvoyZone_coord:Translate(tti.marker.convoy.textBoxOffset, tti.marker.convoy.textBoxAnglePosition):TextToAll("Ship Convoy Hunt Mission: \n\""..ShipConvoyMissionName.."\"\n>> Ship Convoy's last known position <<" .. getMissionCompletionStatusText("SHIPCONV"), -1, tti.marker.convoy.textBoxTextColor, tti.marker.convoy.textBoxTextAlpha, tti.marker.convoy.textBoxFillColor, tti.marker.convoy.textBoxFillAlpha, tti.marker.convoy.textBoxFontSize, false)
		end
	end
end

tti.a2g = {}
tti.a2g.troops = {}
tti.a2g.vehicles = {}

tti.a2g.killMSG = {
"Right on target, ",
"Good effect on target, ",
"Target hit! Nice one,  ",
"Good effect, ",
"Direct hit. Nice work, "
}

tti.a2g.infantrySynonyms = { 
"infantry",
"combatant",
"personnel",
"insurgent",
}

tti.a2g.infantryKilledSynonyms = { 
"killed",
"elimitated",
"neutralized",
}

tti.a2g.playerCongratsText = { 
"Nice shot",
"Nice shooting",
"Nice one",
"Great work",
"Great shot",
"Good effect",
"Good hit",
"Nailed it",
"You got him",
}

tti.a2g.killSound = { 
"TTI Soundfiles/BF3-Good Effect on Target.ogg",
"TTI Soundfiles/AC4-Target Destroyed 2.ogg",
"TTI Soundfiles/BF3-On Target Nice Shot.ogg",
"TTI Soundfiles/AC4-Target Destroyed 1.ogg",
"TTI Soundfiles/AC4-Target Destroyed 2.ogg",
"TTI Soundfiles/AC4-Target Destruction Confirmed.ogg",
"TTI Soundfiles/AC0-Alright Direct Hit.ogg",
}

tti.a2g.killSoundInf = { 
"TTI Soundfiles/AC0-EnemyConfirmedDown.ogg",
"TTI Soundfiles/AC0-GotHimInf1.ogg",
"TTI Soundfiles/AC0-GotHimInf2.ogg",
"TTI Soundfiles/AC0-OneEnemyDown.ogg",
"TTI Soundfiles/AC0-TheresHardlyAnyLeft.ogg",
"TTI Soundfiles/ApacheGunCamReal-GoodEffectOver.ogg",
"TTI Soundfiles/ApacheGunCamReal-HesNoLongerWithUs.ogg",
"TTI Soundfiles/ApacheGunCamReal-ThatWasABlastOnOneGuy.ogg",
}

tti.a2g.airSupportRequestSound = { 
"TTI Soundfiles/AC04-Requesting CAS 1.ogg",
"TTI Soundfiles/AC04-Requesting CAS 2.ogg",
"TTI Soundfiles/AC04-Requesting CAS 3.ogg",
"TTI Soundfiles/We're taking fire across.ogg",
"TTI Soundfiles/CODMW2-We have engaged the enemy.ogg",
"TTI Soundfiles/CODMW2-We are cut off.ogg",
"TTI Soundfiles/CODMW2-Where is the air support.ogg",
"TTI Soundfiles/AC0-DamnRequestingSupport.ogg",
}

tti.a2g.troopsDeployedSound = { 
"TTI Soundfiles/were moving were moving.ogg",
"TTI Soundfiles/AC-AirbourneTroopsDropped.ogg",

}

tti.a2g.vehiclesDeployedSound = { 
"TTI Soundfiles/AC-Burn It To The Ground.ogg",
"TTI Soundfiles/AC-AllUnitsAdvance.ogg",
"TTI Soundfiles/AC-CoordinateWithGroundForces.ogg",
"TTI Soundfiles/AC-NotADrillUnitsAssumePosition.ogg",
"TTI Soundfiles/AC-TankUnitAdvancing.ogg",
}


function delayedA2gKillMessageToGroup(iniGroup, tgtUnit, msg, msgDisplayTime, snd, delayedTime)
a2gMessageIsPlaying = true
	timer.scheduleFunction(function()
		trigger.action.outTextForGroup(iniGroup, msg, msgDisplayTime)
		if voice_lines_audio == "enabled" then
		trigger.action.outSoundForGroup(iniGroup, snd)
		elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSoundForGroup(iniGroup, tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		tti.debug("A2G message is cooled down and will play a sound/message.")
		--trigger.action.outText("A2G message is cooled down and will play a sound/message.", 5)
	end, nil, timer.getTime() + delayedTime  )
end

function randomA2gKillVehMessageToGroup(iniGroup, tgtUnit, iniPlayerName, msgDisplayTime, delayedTime)
a2gMessageIsPlaying = true
	timer.scheduleFunction(function()
		tti.debug("A2G message is cooled down and will play a sound/message.")
		local switch = math.random(1,9)
		if switch == 1 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Good effect on target!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/BF3-Good Effect on Target.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 2 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Target destroyed!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC4-Target Destroyed 2.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 3 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - On target! Nice Shot!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/BF3-On Target Nice Shot.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 4 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Target destroyed!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC4-Target Destroyed 1.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 5 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Target destroyed!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC4-Target Destroyed 2.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 6 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Target destruction confirmed.", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC4-Target Destruction Confirmed.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 7 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Alright! Direct hit!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC0-Alright Direct Hit.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 8 then
			trigger.action.outTextForGroup(iniGroup, "Enemy [" .. tgtUnit.. "] destroyed. " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Good effect, good effect, over.", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/ApacheGunCamReal-GoodEffectOver.ogg" )		
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end				
		end
		end, nil, timer.getTime() + delayedTime  )
end

function randomA2gKillInfMessageToGroup(iniGroup, tgtUnit, iniPlayerName, msgDisplayTime, delayedTime)
a2gMessageIsPlaying = true
	timer.scheduleFunction(function()
		tti.debug("A2G message is cooled down and will play a sound/message.")
		local switch = math.random(1,8)
		if switch == 1 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Enemy confirmed down.", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC0-EnemyConfirmedDown.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 2 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Got him!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC0-GotHimInf1.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 3 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Got him!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC0-GotHimInf2.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 4 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - One enemy down!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC0-OneEnemyDown.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 5 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - ...There's hardly any left!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/AC0-TheresHardlyAnyLeft.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 6 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - Good effect, good effect, over.", msgDisplayTime)
			if voice_lines_audio == "enabled" then
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/ApacheGunCamReal-GoodEffectOver.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 7 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - He's no longer with us.", msgDisplayTime)
		if voice_lines_audio == "enabled" then		
			trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/ApacheGunCamReal-HesNoLongerWithUs.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		elseif switch == 8 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - That was a blast on one guy!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
				trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/ApacheGunCamReal-ThatWasABlastOnOneGuy.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end
		elseif switch == 9 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - That was a blast on one guy!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
				trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/JFA-BoomImpact.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end
		elseif switch == 10 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - That was a blast on one guy!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
				trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/JFA-BoomOhYes.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end
		elseif switch == 11 then
			trigger.action.outTextForGroup(iniGroup, "Enemy " .. tti.a2g.infantrySynonyms[math.random(1,#tti.a2g.infantrySynonyms)] .. " [" .. tgtUnit.. "] " ..tti.a2g.infantryKilledSynonyms[math.random(1,#tti.a2g.infantryKilledSynonyms)].. ". " .. tti.a2g.playerCongratsText[math.random(1,#tti.a2g.playerCongratsText)] .. ", ".. iniPlayerName .."! - That was a blast on one guy!", msgDisplayTime)
			if voice_lines_audio == "enabled" then
				trigger.action.outSoundForGroup(iniGroup, "TTI Soundfiles/JFA-Impact.ogg" )
			elseif voice_lines_audio == "ui_sounds" then
				trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
			elseif voice_lines_audio == "silent" then
			end	
		end
		end, nil, timer.getTime() + delayedTime  )
end

--[[ TO DO - MAKE MY LIFE EASIER WITH THIS LOL
 local killSound = math.random(1,#tti.a2g.killSound)
tti.a2g.killSound[killSound][1] --Picks the filename
tti.a2g.killSound[killSound][2] --Picks the Subtitle
]]

tti.a2g.eventHandler = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(tti.a2g.eventHandler) -- Subscribe to World Events.

tti.a2g.troops.eventHandler = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(tti.a2g.troops.eventHandler) -- Subscribe to World Events.

tti.a2g.vehicles.eventHandler = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(tti.a2g.vehicles.eventHandler) -- Subscribe to World Events.

aiKillPlayerEventHandler = EVENTHANDLER:New() --Create Global EventHandler
world.addEventHandler(aiKillPlayerEventHandler) -- Subscribe to World Events.


--enable_a2g_kill_messages = true
a2gMessageCooldownTime = 10
a2gKillMessageDelay = 2

function delayedA2gKillMessageToAll(killFeedA2gMsg, killFeedA2gMsgDisplayTime, delayedTime, killFeedA2gSoundName)
a2gKillFeedMessageIsPlaying = true
	timer.scheduleFunction(function()
		trigger.action.outText(killFeedA2gMsg, killFeedA2gMsgDisplayTime)
		if enable_global_killfeed_sound == true and killFeedA2gSoundName then
			trigger.action.outSound(killFeedA2gSoundName)
			elseif enable_global_killfeed_sound == true and killFeedA2gSoundName == nil then
			trigger.action.outSound("TTI Soundfiles/AC6-AWACS Alert 1.ogg")
		end
		tti.debug("A2G killfeed message is cooled down and will play a sound/message.")

	end, nil, timer.getTime() + delayedTime  )
end

mainDetectionAfterDestroyDelayTime = 16

function tti.a2g.eventHandler:onEvent(EventData) -- Parse World Events function.
    if EventData.id == world.event.S_EVENT_KILL then
        tti.serialize(EventData, "EventDataForA2GKill")

        local tgtUnit = EventData.target or EventData.TgtDCSUnit
        local iniUnit = EventData.initiator or EventData.IniDCSUnit

        local weapon = EventData.weapon_name or EventData.WeaponName

       -- tti.debug("**** MASTER KILL EVENT HANDLING **** \ntgtUnit: " .. tgtUnit:getName() .. " \niniUnit: " .. iniUnit:getName() .. " \nweapon: " .. weapon ..  " \ntgtUnitDesc: " .. tostring(tgtUnit:getDesc()))

		--tti.debug("**** MASTER KILL EVENT HANDLING **** \ntgtUnit: " .. tgtUnit:getName() .. " \niniUnit: " .. iniUnit:getGroup():getName() .. " \nweapon: " .. weapon ..  " \ntgtUnitDesc: " .. tostring(tgtUnit:getDesc()))
        
		if not tgtUnit:getName() or not iniUnit:getGroup() or not iniUnit:getGroup():getName() or not weapon or not tgtUnit:getDesc() then
			tti.debug("**** MASTER KILL EVENT HANDLING ****: One or more required variables are nil. Exiting function.")
		else
			--actually run the code!
			tti.debug("**** MASTER KILL EVENT HANDLING **** \ntgtUnit: " .. tgtUnit:getName() .. " \niniUnit: " .. iniUnit:getGroup():getName() .. " \nweapon: " .. weapon ..  " \ntgtUnitDesc: " .. tostring(tgtUnit:getDesc()))
		end



		
        if tgtUnit:hasAttribute("Ground vehicles") == true or
           tgtUnit:hasAttribute("Infantry") == true or
           tgtUnit:hasAttribute("Fortifications") == true or
           tgtUnit:hasAttribute("Ships") == true or
           tgtUnit:hasAttribute("MANPADS") == true or
           tgtUnit:hasAttribute("MANPADS AUX") == true then -- for ground units

            if iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 1 and enable_a2g_kill_messages == true then -- if shooter is blue, target is red, and if option enabled.
                success, err = pcall(function()
                    --tti.debug("**************** A2G Kill Event Handling: " .. iniUnit:getName() .. " (" .. iniUnit:getTypeName() .. ") killed " .. tgtUnit:getTypeName() .. " (" .. tgtUnit:getName() .. ") with " .. weapon .. " ****************")
                    tti.debug("**************** A2G Kill Event Handling: " .. iniUnit:getGroup():getName() .. " (" .. iniUnit:getTypeName() .. ") killed " .. tgtUnit:getTypeName() .. " (" .. tgtUnit:getName() .. ") with " .. weapon .. " ****************")
                    if iniUnit:getPlayerName() then
                        local killerID = iniUnit:getGroup():getID()
                        tti.debug(iniUnit:getPlayerName() .. " killed " .. tgtUnit:getTypeName())
                        if a2gKillFeedMessageIsPlaying ~= true then
                            if enable_player_global_killfeed == true then
                                delayedA2gKillMessageToAll("[BLUE] " .. iniUnit:getTypeName() .. " (" .. iniUnit:getPlayerName() .. ") ► [" .. weapon .. "] ► [RED] " .. tgtUnit:getTypeName(), 8, killFeedDisplayDelayTime, "TTI Soundfiles/AC6-AWACS Alert 1.ogg")
                            end
                        end
                        timer.scheduleFunction(function()
                            if a2gKillFeedMessageIsPlaying == true then
                                a2gKillFeedMessageIsPlaying = false
                                tti.debug("A2G kill feed message cool down finished...")
                            end
                        end, nil, timer.getTime() + killFeedCoolDownTime)

                        if a2gMessageIsPlaying ~= true then
                            if tgtUnit:hasAttribute("Infantry") == true then
                                randomA2gKillInfMessageToGroup(killerID, tgtUnit:getTypeName(), iniUnit:getPlayerName(), 10, a2gKillMessageDelay)
                            else
                                randomA2gKillVehMessageToGroup(killerID, tgtUnit:getTypeName(), iniUnit:getPlayerName(), 10, a2gKillMessageDelay)
                            end
                        else
                            tti.debug("A2G message is NOT cooled down and will NOT play a sound/message.")
                        end
                        timer.scheduleFunction(function()
                            if a2gMessageIsPlaying == true then
                                a2gMessageIsPlaying = false
                                tti.debug("A2G message cool down finished...")
                            end
                        end, nil, timer.getTime() + a2gMessageCooldownTime)
                    end
                end)
            elseif iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 2 and enable_a2g_kill_messages == true then
                success, err = pcall(function()
                    --tti.debug("**************** A2G Kill Event Handling: " .. iniUnit:getName() .. " (" .. iniUnit:getTypeName() .. ") killed " .. tgtUnit:getTypeName() .. " (" .. tgtUnit:getName() .. ") with " .. weapon .. " ****************")
                    tti.debug("**************** A2G Kill Event Handling: " .. iniUnit:getGroup():getName() .. " (" .. iniUnit:getTypeName() .. ") killed " .. tgtUnit:getTypeName() .. " (" .. tgtUnit:getName() .. ") with " .. weapon .. " ****************")
                    if iniUnit:getPlayerName() then
                        local killerID = iniUnit:getGroup():getID()
                        tti.debug(iniUnit:getPlayerName() .. " killed " .. tgtUnit:getTypeName())
                        if a2gMessageIsPlaying ~= true then
                            delayedA2gKillMessageToGroup(killerID, tgtUnit:getTypeName(), "Cease fire " .. iniUnit:getPlayerName() .. "! Friendly fire on [BLUE " .. tgtUnit:getTypeName() .. "] with [" .. weapon .. "]", 10, tti.a2a.killFriendlySound[math.random(1, #tti.a2a.killFriendlySound)], a2gKillMessageDelay)
                        else
                            tti.debug("A2G message is NOT cooled down and will NOT play a sound/message.")
                        end
                        timer.scheduleFunction(function()
                            if a2gMessageIsPlaying == true then
                                a2gMessageIsPlaying = false
                                tti.debug("A2G message cool down finished...")
                            end
                        end, nil, timer.getTime() + a2gMessageCooldownTime)
                    end
                end)
            end
        end
        if err then
            tti.debug("Problem with getting the group! " .. err)
        end
    end

    if EventData.id == world.event.S_EVENT_HIT then -- Friendly fire on HIT
        success, err = pcall(function()
            tti.serialize(EventData, "EventDataForA2GHit")
            local tgtUnit = EventData.target or EventData.TgtDCSUnit
            local iniUnit = EventData.initiator or EventData.IniDCSUnit
            local weapon = EventData.weapon_name or EventData.WeaponName
        end)

        if tgtUnit ~= nil and tgtUnit:getDesc() ~= nil then
            if tgtUnit:hasAttribute("Ground vehicles") == true or
               tgtUnit:hasAttribute("Infantry") == true or
               tgtUnit:hasAttribute("Fortifications") == true or
               tgtUnit:hasAttribute("Ships") == true then -- For ground units

                if iniUnit:getPlayerName() and iniUnit:getCoalition() == 2 and tgtUnit:getCoalition() == 2 and enable_a2g_kill_messages == true then
                    success, err = pcall(function()
                        tti.debug("**************** A2G Hit Event Handling: " .. iniUnit:getGroup():getName() .. " (" .. iniUnit:getTypeName() .. ") hit " .. tgtUnit:getTypeName() .. " (" .. tgtUnit:getName() .. ") with " .. weapon .. " ****************")
                        if iniUnit:getPlayerName() then
                            local killerID = iniUnit:getGroup():getID()
                            tti.debug(iniUnit:getPlayerName() .. " hit " .. tgtUnit:getTypeName())
                            if a2gMessageIsPlaying ~= true then
                                delayedA2gKillMessageToGroup(killerID, tgtUnit:getTypeName(), "Cease fire " .. iniUnit:getGroup():getName() .. "! Friendly fire on [BLUE " .. tgtUnit:getTypeName() .. "] with [" .. weapon .. "]", 10, tti.a2a.killFriendlySound[math.random(1, #tti.a2a.killFriendlySound)], 1)
                            else
                                tti.debug("A2G message is NOT cooled down and will NOT play a sound/message.")
                            end
                            timer.scheduleFunction(function()
                                if a2gMessageIsPlaying == true then
                                    a2gMessageIsPlaying = false
                                    tti.debug("A2G message cool down finished...")
                                end
                            end, nil, timer.getTime() + a2gMessageCooldownTime)
                        end
                    end)
                end
            end
        end
    end
end

function aiKillPlayerEventHandler:onEvent(EventData)
    if EventData.id == world.event.S_EVENT_KILL then
        local tgtUnit = EventData.target or EventData.TgtDCSUnit
        local iniUnit = EventData.initiator or EventData.IniDCSUnit
        local weapon = EventData.weapon_name or EventData.WeaponName

        if tgtUnit:getPlayerName() ~= nil then
            if iniUnit:getCoalition() == 1 and
               tgtUnit:getCoalition() == 2 and
               enemy_global_killfeed_messages == true and
               enable_player_global_killfeed == true then

                success, err = pcall(function()
                   -- tti.debug("**************** A2G Kill Event Handling: " .. iniUnit:getName() .. " (" .. iniUnit:getTypeName() .. ") killed " .. tgtUnit:getTypeName() .. " (" .. tgtUnit:getName() .. ") with " .. weapon .. " ****************")
                    tti.debug("**************** A2G Kill Event Handling: " .. iniUnit:getGroup():getName() .. " (" .. iniUnit:getTypeName() .. ") killed " .. tgtUnit:getTypeName() .. " (" .. tgtUnit:getName() .. ") with " .. weapon .. " ****************")
                    
                    if tgtUnit:getPlayerName() then
                        local killerID = iniUnit:getGroup():getID()
                        tti.debug(iniUnit:getTypeName() .. " killed " .. tgtUnit:getPlayerName())
                        
                        if a2gKillFeedMessageIsPlaying ~= true then
                            if enable_player_global_killfeed == true then
                                delayedA2gKillMessageToAll("[RED] " .. iniUnit:getTypeName() .. " ► [" .. weapon .. "] ► [BLUE] " .. tgtUnit:getTypeName() .. " (" .. tgtUnit:getPlayerName() .. ")", 10, 5, "TTI Soundfiles/PlayerKilledUI.ogg")
                            end
                        end
                        
                        timer.scheduleFunction(function()
                            if a2gKillFeedMessageIsPlaying == true then
                                a2gKillFeedMessageIsPlaying = false
                                tti.debug("A2G kill feed message cool down finished...")
                            end
                        end, nil, timer.getTime() + killFeedCoolDownTime)
                    end
                end)
            end
        end

        if err then
            tti.debug("Problem with getting the group! " .. err)
        end
    end
end

--enable_troops_air_support_request_messages = true
airSupportRequestMessageCooldownTime = 300
timeToRemoveAirSupportMarker = 45 --time in minutes.
air_support_troops_id = {}
air_support_troops_circle_id = {}
air_support_troops_text_id = {}
air_support_vehicles_id = {}
air_support_vehicles_circle_id = {}
air_support_vehicles_text_id = {}

---Circle Radius
tti.marker.airsupport.circleSize = 500 
tti.marker.airsupport.circleFillColor = tti.color.blue
tti.marker.airsupport.circleFillAlpha = 0.18
tti.marker.airsupport.circleOutlineColor = tti.color.white
tti.marker.airsupport.textBoxOffset = 500 + tti.marker.airsupport.circleSize
tti.marker.airsupport.textBoxAnglePosition = 125
tti.marker.airsupport.textBoxFontSize = 9
tti.marker.airsupport.textBoxTextColor = tti.color.white
tti.marker.airsupport.textBoxTextAlpha = 0.8
tti.marker.airsupport.textBoxFillColor = tti.color.blue
tti.marker.airsupport.textBoxFillAlpha = 0.5

function delayedAirSupportRequestMessageToAll(airSupportRequestMsg, airSupportRequestMsgDisplayTime, delayedTime)
airSupportRequestMessageIsPlaying = true


	timer.scheduleFunction(function()
		trigger.action.outText(airSupportRequestMsg, airSupportRequestMsgDisplayTime)
		if voice_lines_audio == "enabled" then
			trigger.action.outSound(tti.a2g.airSupportRequestSound[math.random(1,#tti.a2g.airSupportRequestSound)])
		elseif voice_lines_audio == "ui_sounds" then
			trigger.action.outSound(tti.sound.ui_sounds[math.random(1,#tti.sound.ui_sounds)])
		elseif voice_lines_audio == "silent" then
		end			
		tti.debug("Air Support Request message is cooled down and will play a sound/message.")
	end, nil, timer.getTime() + delayedTime  )
	
startAirSupportCooldownTimer()

end

function startAirSupportCooldownTimer()
timer.scheduleFunction(function()
	if airSupportRequestMessageIsPlaying == true then
		airSupportRequestMessageIsPlaying = false
		tti.debug("Air Support Request message cool down finished...")
		--trigger.action.outText("A2A message cool down finished...",5)
	end
end, nil, timer.getTime() + airSupportRequestMessageCooldownTime  )
end

function create_air_support_troops_marker(troops_vec3, tgtUnitRequesterName, tgtUnitRequesterType)
		troopMarkerStartTime = timer.getTime()
	if air_support_troops_id[1] ~= nil then
			trigger.action.removeMark(air_support_troops_id[1])	
	end
	
	if air_support_troops_circle_id[1] ~= nil and air_support_troops_text_id[1] ~= nil then
			trigger.action.removeMark(air_support_troops_text_id[1])	
			trigger.action.removeMark(air_support_troops_circle_id[1])	
	end
	
	air_support_troops_id[1] = UTILS.GetMarkID()
	local troopSupportRequestText = "[BLUE] " .. tgtUnitRequesterName ..": \nAIR SUPPORT requested here!"
	trigger.action.markToAll(air_support_troops_id[1], troopSupportRequestText, troops_vec3, true)
	trigger.action.smoke(troops_vec3, 4)
	--trigger.action.outText("Support marker added, will remove in 20 seconds", 60)
	if enable_drawn_markers == true then
	airSupportTroops_coord = COORDINATE:NewFromVec3(troops_vec3)
	air_support_troops_circle_id[1] =  UTILS.GetMarkID()
	air_support_troops_circle_id[1] = airSupportTroops_coord:CircleToAll(tti.marker.airsupport.circleSize, -1, tti.marker.airsupport.circleOutlineColor, 0.5, tti.marker.airsupport.circleFillColor, tti.marker.airsupport.circleFillAlpha, 3, false)
	air_support_troops_text_id[1] = UTILS.GetMarkID()
	air_support_troops_text_id[1] = airSupportTroops_coord:Translate(tti.marker.airsupport.textBoxOffset, tti.marker.airsupport.textBoxAnglePosition):TextToAll(troopSupportRequestText, -1, tti.marker.airsupport.textBoxTextColor, tti.marker.airsupport.textBoxTextAlpha, tti.marker.airsupport.textBoxFillColor, tti.marker.airsupport.textBoxFillAlpha, tti.marker.airsupport.textBoxFontSize, false)
	end
	
	timer.scheduleFunction(function()
		troopMarkerFinishTime = timer.getTime()
		troopMarkerElapsedTime = troopMarkerFinishTime - troopMarkerStartTime
		if troopMarkerElapsedTime >= (timeToRemoveAirSupportMarker * 60) then
			trigger.action.removeMark(air_support_troops_id[1])	
			if enable_drawn_markers == true then
				trigger.action.removeMark(air_support_troops_circle_id[1])	
				trigger.action.removeMark(air_support_troops_text_id[1])	
			end
			trigger.action.outText(tgtUnitRequesterName .. " is no longer requesting air support. Removing map marker.", 60)
		end
	end, nil, timer.getTime() + (timeToRemoveAirSupportMarker * 60)  )
end

function tti.a2g.troops.eventHandler:onEvent(EventData) -- Parse World Events function.
	if EventData.id == world.event.S_EVENT_KILL then
		if enable_troops_air_support_request_messages == true then
			local tgtUnit = EventData.target or EventData.TgtDCSUnit
			local iniUnit = EventData.initiator or EventData.IniDCSUnit
			local weapon = EventData.weapon_name or EventData.WeaponName

			if tgtUnit:getDesc().attributes then
				if tgtUnit:hasAttribute("Infantry") == true then -- for ground units
					if iniUnit:getCoalition() == 1 and tgtUnit:getCoalition() == 2 then 
						success, err  = pcall(function()
							--tti.debug("**************** A2G Kill Event Handling: " .. iniUnit:getName() .. " (" .. iniUnit:getTypeName() .. ")" .. " killed " .. tgtUnit:getTypeName() .. " (" .. tgtUnit:getName() .. ")" .. " with " .. weapon .. " ****************")
							tti.debug("**************** A2G Kill Event Handling: " .. iniUnit:getGroup():getName() .. " (" .. iniUnit:getTypeName() .. ")" .. " killed " .. tgtUnit:getTypeName() .. " (" .. tgtUnit:getName() .. ")" .. " with " .. weapon .. " ****************")
							
							if airSupportRequestMessageIsPlaying ~= true then
								delayedAirSupportRequestMessageToAll("[BLUE] " .. tgtUnit:getTypeName() .. " (" .. tgtUnit:getName() .. "): Taking fire, requesting immediate air support!\nSending coordinates now! (Map marker created and blue smoke deployed)", 60, 1 )
								create_air_support_troops_marker(tgtUnit:getPoint(), tgtUnit:getName(), tgtUnit:getTypeName())
							else
								tti.debug("Air Support Request message is NOT cooled down and will NOT play a sound/message.")
							end
							
							if iniUnit then
								tti.debug(iniUnit:getGroup():getID() .. " killed " .. tgtUnit:getTypeName())
							end
						end)
					end
				end
			end
		end
	end
end


function create_air_support_vehicles_marker(vehicles_vec3, tgtUnitRequesterName, tgtUnitRequesterType)
		vehicleMarkerStartTime = timer.getTime()
	if air_support_vehicles_id[1] ~= nil then
			trigger.action.removeMark(air_support_vehicles_id[1])	
	end
	
	if air_support_vehicles_text_id[1] ~= nil and air_support_vehicles_circle_id[1] ~= nil then
			trigger.action.removeMark(air_support_vehicles_text_id[1])	
			trigger.action.removeMark(air_support_vehicles_circle_id[1])	
	end
	
	
	local vehicleSupportRequestText = "[BLUE] " .. tgtUnitRequesterName ..": \nAIR SUPPORT requested here!"
	air_support_vehicles_id[1] = UTILS.GetMarkID()
	trigger.action.markToAll(air_support_vehicles_id[1], vehicleSupportRequestText ,vehicles_vec3, true)
	trigger.action.smoke(vehicles_vec3, 4)
	if enable_drawn_markers == true then
	airSupportVehicles_coord = COORDINATE:NewFromVec3(vehicles_vec3)
	air_support_vehicles_circle_id[1] =  UTILS.GetMarkID()
	air_support_vehicles_circle_id[1] = airSupportVehicles_coord:CircleToAll(tti.marker.airsupport.circleSize, -1, tti.marker.airsupport.circleOutlineColor, 0.5, tti.marker.airsupport.circleFillColor, tti.marker.airsupport.circleFillAlpha, 3, false)
	air_support_vehicles_text_id[1] = UTILS.GetMarkID()
	air_support_vehicles_text_id[1] = airSupportVehicles_coord:Translate(tti.marker.airsupport.textBoxOffset, tti.marker.airsupport.textBoxAnglePosition):TextToAll(vehicleSupportRequestText, -1, tti.marker.airsupport.textBoxTextColor, tti.marker.airsupport.textBoxTextAlpha, tti.marker.airsupport.textBoxFillColor, tti.marker.airsupport.textBoxFillAlpha, tti.marker.airsupport.textBoxFontSize, false)
	end
	timer.scheduleFunction(function()
		vehicleMarkerFinishTime = timer.getTime()
		vehicleMarkerElapsedTime = vehicleMarkerFinishTime - vehicleMarkerStartTime
		if vehicleMarkerElapsedTime >= (timeToRemoveAirSupportMarker * 60) then
			trigger.action.removeMark(air_support_vehicles_id[1])
				if enable_drawn_markers == true then
					trigger.action.removeMark(air_support_vehicles_circle_id[1])	
					trigger.action.removeMark(air_support_vehicles_text_id[1])	
				end
			trigger.action.outText(tgtUnitRequesterName .. " is no longer requesting air support. Removing map marker.", 60)
		end
	end, nil, timer.getTime() + (timeToRemoveAirSupportMarker * 60)  )
end

--[[
function tti.a2g.vehicles.eventHandler:onEvent(EventData) -- Parse World Events function.
	if EventData.id == world.event.S_EVENT_KILL then
	--if EventData.id == world.event.S_EVENT_KILL or EventData.id == world.event.S_EVENT_BDA then
	if enable_troops_air_support_request_messages == true then
		tti.serialize(EventData, "EventDataForKill")
		--if tgtUnit then
		local tgtUnit = EventData.target or EventData.TgtDCSUnit
		local tgtUnitTypeName = tgtUnit:getTypeName()
		--local tgtUnitGroup = tgtUnit:getGroup()
		local tgtUnitGroupName = tgtUnit:getName()
		local tgtUnitDesc = tgtUnit:getDesc()
		--local tgtUnitExists = true
		--else
		--local tgtUnitExists = nil
		--tti.debug("Kill Event Tracker - tti.a2a.eventHandlerKill - tgtUnit FAILED")
		--end
		
		--if iniUnit then
		local iniUnit = EventData.initiator or EventData.IniDCSUnit
		local iniUnitTypeName = iniUnit:getTypeName()
		local iniUnitGroup = iniUnit:getGroup()
		local iniUnitGroupName = iniUnit:getName()
		local iniUnitDesc = iniUnit:getDesc()
		--local iniUnitExists = true
		--else
		--local iniUnitExists = nil
		--tti.debug("Kill Event Tracker - tti.a2a.eventHandlerKill - iniUnit FAILED")
		--end
		
		
		local weapon = EventData.weapon_name or EventData.WeaponName
		
		--if tgtUnit and iniUnit and tgtUnitExists == true and iniUnitExists == true then
	local tgtUnitVec3 = tgtUnit:getPoint()
		if tgtUnitDesc.attributes then
			if tgtUnit:hasAttribute("Ground vehicles") == true then -- for ground units
				--if iniUnit:getCoalition() == 1 and tgtUnit:getCoalition() == 2 and enable_troop_air_support_messages == true then 
				if iniUnit:getCoalition() == 1 and tgtUnit:getCoalition() == 2 then 
				success, err  = pcall( 
					function()
					tti.debug("**************** A2G Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" ..  tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
					if airSupportRequestMessageIsPlaying ~= true then
						--airSupportRequestMessageIsPlaying = true
						delayedAirSupportRequestMessageToAll("[BLUE] " .. tgtUnitTypeName .. " (" .. tgtUnitGroupName.."): Taking fire, requesting immediate air support!\nSending coordinates now! (Map marker created and blue smoke deployed)", 60, 1 )
						create_air_support_vehicles_marker(tgtUnitVec3, tgtUnitGroupName, tgtUnitTypeName)
						else
						tti.debug("Air Support Request message is NOT cooled down and will NOT play a sound/message.")
					end

						if iniUnit then
							local killerID = iniUnit:getGroup():getID()
							tti.debug(iniUnit:getGroup():getID() .. " killed " .. tgtUnitTypeName)
						end
				end
				)
			end
			
			end
		end
	end
	end
	
end
--]]

function tti.a2g.vehicles.eventHandler:onEvent(EventData) -- Parse World Events function.
	if EventData.id == world.event.S_EVENT_KILL then

		if enable_troops_air_support_request_messages == true then
			tti.serialize(EventData, "EventDataForKill")

			-- tgtUnit and iniUnit as variables
			local tgtUnit = EventData.target or EventData.TgtDCSUnit
			local iniUnit = EventData.initiator or EventData.IniDCSUnit

			-- Ensure tgtUnit and iniUnit are valid
			if not (tgtUnit and iniUnit) then
				tti.debug("Error: tgtUnit or iniUnit is nil.")
				return
			end

			local weapon = EventData.weapon_name or EventData.WeaponName
			
			-- Check target description and attributes
			if tgtUnit:getDesc() and tgtUnit:hasAttribute("Ground vehicles") then
				if iniUnit:getCoalition() == 1 and tgtUnit:getCoalition() == 2 then -- Blue shooter, Red target
					local tgtUnitTypeName = tgtUnit:getTypeName()
					local tgtUnitGroupName = tgtUnit:getName()
					local tgtUnitVec3 = tgtUnit:getPoint()

					local iniUnitTypeName = iniUnit:getTypeName()
					local iniUnitGroupName = iniUnit:getName()

					success, err = pcall(function()
						tti.debug("**************** A2G Kill Event Handling: " .. iniUnitGroupName .. "(" .. iniUnitTypeName .. ")" .. " killed " .. tgtUnitTypeName .. "(" .. tgtUnitGroupName .. ")" .. " with " .. weapon .. " ****************")
						
						if airSupportRequestMessageIsPlaying ~= true then
							delayedAirSupportRequestMessageToAll("[BLUE] " .. tgtUnitTypeName .. " (" .. tgtUnitGroupName .. "): Taking fire, requesting immediate air support!\nSending coordinates now! (Map marker created and blue smoke deployed)", 60, 1)
							create_air_support_vehicles_marker(tgtUnitVec3, tgtUnitGroupName, tgtUnitTypeName)
						else
							tti.debug("Air Support Request message is NOT cooled down and will NOT play a sound/message.")
						end

						-- Handle initiator (iniUnit)
						if iniUnit then
							local killerID = iniUnit:getGroup():getID()
							tti.debug(iniUnit:getGroup():getID() .. " killed " .. tgtUnitTypeName)
						end
					end)

					if err then
						tti.debug("Problem with A2G event handling: " .. err)
					end
				end
			end
		end
	end
end

--- mission complete status Menu
--[[
function displayMissionCompletionSequenceStatus()

local displayMissionCompletionSequenceStatusText = ""

displayMissionCompletionSequenceStatusText = displayMissionCompletionSequenceStatusText ..

"Mission Sequence Completion Status:" ..
"\n" ..
"A2G Easy: " .. getMissionCompletionStatusText("MR") ..
"\n" ..
"A2G Hard: " .. getMissionCompletionStatusText("AG") ..
"\n" ..
"A2G Helo: " .. getMissionCompletionStatusText("AGH") ..
"\n" ..
"A2G Infantry Assault: " .. getMissionCompletionStatusText("INF") ..
"\n" ..
"A2G SEAD: " .. getMissionCompletionStatusText("SEAD") ..
"\n" ..
"Anti-Ship: " .. getMissionCompletionStatusText("ASS") ..
"\n"

getMissionCompletionStatusText("MR")

tti.debug(displayMissionCompletionSequenceStatusText, true)

end

--]]
function displayMissionCompletionSequenceStatus()

    local displayMissionCompletionSequenceStatusText = ""

    -- Add a header for the status
    displayMissionCompletionSequenceStatusText = displayMissionCompletionSequenceStatusText .. "Mission Sequence Completion Status:\n"

    -- Define a local function to append to the text only if the value is not nil and not "0"
    local function appendIfNotNil(missionName, missionCode)
        local statusText = getMissionCompletionStatusText(missionCode)
        --if statusText ~= nil and statusText ~= "0" then
        if statusText ~= nil and not statusText:find("0") then
            displayMissionCompletionSequenceStatusText = displayMissionCompletionSequenceStatusText .. missionName .. ": " .. statusText .. "\n"
        end
    end

    -- Call the function with mission names and corresponding mission codes
    appendIfNotNil("\nA2G Easy", "MR")
    appendIfNotNil("\nA2G Hard", "AG")
    appendIfNotNil("\nA2G Helo", "AGH")
    appendIfNotNil("\nA2G Infantry Assault", "INF")
    appendIfNotNil("\nA2G SEAD", "SEAD")
    appendIfNotNil("\nA2G Convoy", "CONV")
    appendIfNotNil("\nAnti-Ship", "ASS")

    -- Print the final status text using tti.debug
    tti.debug(displayMissionCompletionSequenceStatusText, true)

end

env.info('functions ground init ok')
--trigger.action.outText("Ground LUA File Loaded...", 10)
env.info('Deadly GROUND scripting complete')
tti_ground_missions_script_loaded = true