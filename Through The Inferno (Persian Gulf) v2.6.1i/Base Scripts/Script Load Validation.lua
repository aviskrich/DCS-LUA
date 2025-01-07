

if enable_ctld == true and tti_ctld_script_loaded == true then
	tti_ctld_script_validated = true
end

if enable_csar == true and tti_csar_script_loaded == true then
	tti_csar_script_validated = true
end

--extras
--[[
if iads_script_enable == true then
trigger.action.outText("Skynet IADS script ...LOADED!", 15)
else
trigger.action.outText("Skynet IADS script ...DISABLED!", 15)
end
--]]
--[[
if iads_script_enable == true and iads_radio_menu_enable == true then
trigger.action.outText("Skynet IADS F10 Menu ENABLED!", 15)
end
if splash_damage_script_enable == true then
trigger.action.outText("Splash Damage 2 Script ...LOADED!", 15)
end
--]]

if 	tti_global_functions_script_loaded == true and
	tti_blue_ground_database_loaded == true and
	tti_red_ground_database_loaded == true and
	tti_liveries_database_loaded == true and
	tti_red_air_database_loaded == true and
	tti_blue_air_database_loaded == true and
	tti_ground_missions_script_loaded == true and
	tti_air_missions_script_loaded == true and
	tti_zeus_script_loaded == true and
	tti_mission_name_gen_script_loaded == true and
	tti_jtac_autolase_script_loaded == true and
	--tti_ctld_script_validated == true and
	--tti_csar_script_validated == true and
	tti_ewrs_script_loaded == true and
	tti_jtac_list_script_loaded == true and
	--tti_airboss_script_loaded == true and
	tti_intel_gen_script_loaded == true and
	tti_trigger_list_script_loaded == true and
	tti_random_air_traffic_script_loaded == true and
	tti_wpt_markers_script_loaded == true and
	tti_helo_transport_script_loaded == true and
	tti_menu_consolidation_script_loaded == true and
	tti_random_air_traffic_script_loaded == true then
	--trigger.action.outText("CHECKING SCRIPT FILES ... TTI mission scripts successfully loaded!", 30)
	script_files_loaded_successfully = true
	else
	trigger.action.outText("CHECKING SCRIPT FILES ... TTI mission scripts LOAD ERROR! See dcs.log for details.", 30)
	script_files_loaded_successfully = false
end



if 	tti_global_functions_script_loaded ~= true then
tti.debug("tti_global_functions_script - error, check script!", true)
end

if tti_blue_ground_database_loaded ~= true then
tti.debug("tti_blue_ground_database - error, check script!", true)
end

if tti_red_ground_database_loaded ~= true then
tti.debug("tti_red_ground_database - error, check script!", true)
end

if tti_red_air_database_loaded ~= true then
tti.debug("tti_red_air_database - error, check script!", true)
end

if tti_blue_air_database_loaded ~= true then
tti.debug("tti_blue_air_database - error, check script!", true)
end

if tti_liveries_database_loaded ~= true then
tti.debug("tti_liveries_database - error, check script!", true)
end

if tti_ground_missions_script_loaded ~= true then
tti.debug("tti_ground_missions_script - error, check script!", true)
end

if tti_air_missions_script_loaded ~= true then
tti.debug("tti_air_missions_script - error, check script!", true)
end

if tti_zeus_script_loaded ~= true then
tti.debug("tti_zeus_script - error, check script!", true)
end

if tti_mission_name_gen_script_loaded ~= true then
tti.debug("tti_mission_name_gen_script - error, check script!", true)
end

if tti_jtac_autolase_script_loaded ~= true then
tti.debug("tti_jtac_autolase_script - error, check script!", true)
end

-- if tti_ctld_script_validated ~= true and enable_ctld == true then
-- tti.debug("tti_ctld_script_validated - error, check script!", true)
-- end

-- if tti_csar_script_validated ~= true and  enable_csar == true then
-- tti.debug("tti_csar_script_validated - error, check script!", true)
-- end

if tti_ewrs_script_loaded ~= true then
tti.debug("tti_ewrs_script - error, check script!", true)
end

if tti_jtac_list_script_loaded ~= true then
tti.debug("tti_jtac_list_script - error, check script!", true)
end

if tti_intel_gen_script_loaded ~= true then
tti.debug("tti_intel_gen_script - error, check script!", true)
end

if tti_trigger_list_script_loaded ~= true then
tti.debug("tti_trigger_list_script - error, check script!", true)
end

if tti_random_air_traffic_script_loaded ~= true then
tti.debug("tti_random_air_traffic_script - error, check script!", true)
end

if tti_wpt_markers_script_loaded ~= true then
tti.debug("tti_wpt_markers_script - error, check script!", true)
end

if tti_helo_transport_script_loaded ~= true then
tti.debug("tti_helo_transport_script - error, check script!", true)
end

if tti_menu_consolidation_script_loaded ~= true then
tti.debug("tti_menu_consolidation_script - error, check script!", true)
end

--[[
---print message test
------MESSAGES

-- Define your boolean variables
local showMessage1 = true
local showMessage2 = false
local showMessage3 = true

-- Define your messages
local message1 = "This is message 1."
local message2 = "This is message 2."
local message3 = "This is message 3."

-- Create a function to construct the final message
function constructMessage(...)
    local message = ""
    for _, item in ipairs({...}) do
        message = message .. item .. "\n"
    end
    return message
end

-- Create a function to print messages conditionally
function printConditionalMessages(...)
    local messages = {...}
    local shouldPrint = false

    for i, show in ipairs({showMessage1, showMessage2, showMessage3}) do
        if show then
            trigger.action.outText(messages[i], 45)
            shouldPrint = true
        end
    end

    if not shouldPrint then
        trigger.action.outText("No messages to display.", 45)
    end
end

-- Call the function with your messages
local finalMessage = constructMessage(message1, message2, message3)
printConditionalMessages(message1, message2, message3)

-- Alternatively, you can use the finalMessage variable if needed
-- print(finalMessage)

------MESSAGES
--]]


--battalion red bool get

if red_veh_battalion_hard == true or
red_veh_battalion_easy == true or
red_inf_battalion_enable == true then

	red_battalion_active = true
else
	red_battalion_active = false

end

if load_mission_settings_savedgames == true then
mission_load_location = "LOCAL DCS SAVED GAMES FOLDER"
else
mission_load_location = "MISSION EDITOR TRIGGER LIST"
end
--TTI Script Load and Status Message:

function showTtiMissionSettingInitStatus()
--local ttiStatusInitMessage = "TTI Script and Settings Initialization Status:\n"
local ttiStatusInitMessage = ""

ttiStatusInitMessage = ttiStatusInitMessage ..

--"TTI Scripts and Settings Loaded Successfully: ...  " .. string.upper(tostring(script_files_loaded_successfully)) ..
"TTI Script and Settings Initialization Status:" ..
"\n" ..
"\nTTI SP MISSION Settings loaded from: ...  " .. string.upper(mission_load_location) ..
"\nMISSION ERA is set to: ...  " .. string.upper(mission_era) ..
"\nWW2 Asset Pack Enabled: ... " .. string.upper(tostring(ww2_asset_pack_enable)) ..
"\n" ..
"\nAir Mission Settings:" ..
"\nEnemy A2A Auto-Spawn Fighters Enabled: ... " .. string.upper(tostring(a2a_autospawn_enable))..
"\nEnemy A2A Auto-Spawn Bombers Enabled: ... " .. string.upper(tostring(a2a_intercept_autospawn_enable))..
"\nEnemy A2A Auto-Spawn Helos Enabled: ... " .. string.upper(tostring(a2a_helo_autospawn_enable))..
"\n" ..
"\nJTAC/AFAC Auto-Lase Settings:" ..
"\nJTAC/AFAC Drones Enabled: ... "  .. string.upper(tostring(enable_jtac_drones))..
"\nJTAC/AFAC Drones Smoke Designate Targets: ... "  .. string.upper(tostring(jtac_smoke_targets))..
"\nJTAC/AFAC Drones Prioritize Air Defenses (SAMS, AAA, etc...): ... "  .. string.upper(tostring(jtac_prioritize_air_defences))..
"\nJTAC/AFAC Drones Laser Code: ... ["  .. string.upper(tostring(jtac_default_laser_code)).. "]" ..
"\n" ..
"\nMission Scripts and Logistics Settings:" ..
"\nOne or More Ground Missions Set to Auto-Start: ... "  .. string.upper(tostring(several_ground_missions_autostart_message))..
"\nSingle Random Ground Mission Mode (Only one ground mission at a time): ... "  .. string.upper(tostring(singleRandomMissionModeEnabled))..
"\nRequire Accept First Auto-Spawn Ground Mission Through F10 Other Menu: ... " .. string.upper(tostring(requireAcceptFirstAutoStartMission))..
"\nRequire Accept Auto-Spawn Next Ground Mission Through F10 Other Menu: ... " .. string.upper(tostring(enableAcceptNextMissionMenu))..
"\nRandom SAM Site (DEAD/SEAD) Pop-up Missions: ... "  .. string.upper(tostring(sam_enable))..
"\nEnemy will send ground reinforcements to active Missions: ... "  .. string.upper(tostring(red_battalion_active))..
"\nTanker Spawn Only When Relevant Aircraft Occupied: ... "  .. string.upper(tostring(startTankerForRelevantAircraft))..
"\nSkynet IADS Script Enabled: ... "  .. string.upper(tostring(iads_script_enable))..
"\nSplash Damage 2 Script Enabled: ... "  .. string.upper(tostring(splash_damage_script_enable))..
"\n" ..
"\nRandom Air Traffic (RAT) Settings:" ..
"\nRAT Blue Fighter Spawns: ... "  .. string.upper(tostring(random_blue_fighter_air_traffic))..
"\nRAT Blue Large Military Spawns: ... "  .. string.upper(tostring(random_blue_large_civ_air_traffic))..
"\nRAT Blue Large Civilian Spawns: ... "  .. string.upper(tostring(random_blue_large_civ_air_traffic))..
"\nRAT Red Fighter Spawns: ... "  .. string.upper(tostring(random_red_air_fighter_traffic))..
"\nRAT Red Large Military Spawns: ... "  .. string.upper(tostring(random_red_air_large_mil_traffic))..
"\nRAT Red Large Civilian Spawns: ... "  .. string.upper(tostring(random_red_air_large_civ_traffic))..
--"\nRAT Carrier Blue Aircraft Spawns When Relevant Aircraft Occupied: ... "  .. string.upper(tostring(rat_cv_spawns_based_on_player_spawn))..
"\n" ..
"\nThese settings and others are configurable within the MISSION EDITOR via the MISSIONS SETTINGS in the TRIGGER LIST. Some options can be changed while in-game in the F10-Other COMMS/RADIO Menu. See TTI SP Documentation (link in briefing) for details."..
"\n" ..
"\nYou can display this status message at while in-game via the F10-Other...] menu option via the COMMS/RADIO Menu."

trigger.action.outText(ttiStatusInitMessage, 40)

tti.debug(ttiStatusInitMessage)
end

if show_tti_init_status_message_at_start == true and script_files_loaded_successfully == true then
showTtiMissionSettingInitStatus()
end