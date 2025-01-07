---------- check mission era valid ----------

if mission_era == "korean war" or mission_era == "KOREAN_WAR" or mission_era == "KOREAN WAR"  or mission_era == "KOREANWAR" or mission_era == "koreanwar" then
	mission_era = "korean_war"
	env.info("TTI - Mission Era typo detected; setting to korean_war")
end

if mission_era == "WW2" then
	mission_era = "ww2"
	env.info("TTI - Mission Era typo detected; setting to ww2")
end

if mission_era == "MODERN" then
	mission_era = "modern"
	env.info("TTI - Mission Era typo detected; setting to modern")
end

if mission_era == "cold war" or mission_era == "COLD_WAR" or mission_era == "COLD WAR"  or mission_era == "COLDWAR" or mission_era == "coldwar" then
	mission_era = "cold_war"
	env.info("TTI - Mission Era typo detected; setting to cold_war")
end

-- List of valid mission eras
local valid_mission_eras = {
    "modern",
    "ww2",
    "korean_war",
    "cold_war"
}

-- Function to check if a value exists in a table
local function is_valid_mission_era(era)
    for _, valid_era in ipairs(valid_mission_eras) do
        if era == valid_era then
            return true
        end
    end
    return false
end

-- Checking the mission era
if is_valid_mission_era(mission_era) then
    env.info("TTI - Mission Era... VALID")
    mission_era_valid = true
else
    trigger.action.outText("TTI - Mission Era... INVALID (Spelling Error?)",120)
    env.info("TTI - Mission Era... INVALID (Spelling Error?)")
    mission_era_valid = false
end


--era activate
--[[ -- moved to Script Load Validation Lua
if mission_era == "modern" then
	trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era), 30)
	elseif mission_era == "korean_war" and ww2_asset_pack_enable == true then
		trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era) .. " - WW2 Asset Pack ENABLED", 30)
	elseif mission_era == "korean_war" and ww2_asset_pack_enable == false then
		trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era) .. " - WW2 Asset Pack DISABLED", 30)
	elseif mission_era == "ww2" and ww2_asset_pack_enable == true then
		trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era) .. " - WW2 Asset Pack ENABLED", 30)
	elseif mission_era == "ww2" and ww2_asset_pack_enable == false then
		trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era) .. " - WW2 Asset Pack DISABLED", 30)
	elseif mission_era == "cold_war" and ww2_asset_pack_enable == true then
		trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era) .. " - WW2 Asset Pack ENABLED", 30)
	elseif mission_era == "cold_war" and ww2_asset_pack_enable == false then
		trigger.action.outText("Mission Era is set to: " .. string.upper(mission_era) .. " - WW2 Asset Pack DISABLED", 30)
end
--]]

if mission_era_valid == false then
trigger.action.outText("ERROR: Mission Era is not set properly, please check Mission Era settings for any typos or mispellings. This will break the entire scripting system if this error is not addressed.",60) 
end