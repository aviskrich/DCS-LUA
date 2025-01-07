
if mission_settings_load_from == "savedgamesfolder" then
load_mission_settings_savedgames = true
end

--dofile(lfs.writedir().."\\TTI SP Settings\\test.lua")
tti_dir = "TTI SP Mission Settings" -- Replace with your TTI directory

-- List of filenames
local filenames = {
    "Mission Era.lua",
    "Mission Settings.lua",
    "RAT Settings.lua",
    "CTLD and CSAR Settings.lua",
    "Carrier and Airboss Settings.lua",
    "Air Mission Spawns - Modern.lua",
    "Air Mission Spawns - Cold War.lua",
    "Air Mission Spawns - Korean War.lua",
    "Air Mission Spawns - WW2.lua",
    "Ground Mission Spawns - Modern.lua",
    "Ground Mission Spawns - Cold War.lua",
    "Ground Mission Spawns - Korean War.lua",
    "Ground Mission Spawns - WW2.lua"
}

if load_mission_settings_savedgames == true then
-- Loop through the list of filenames and load each Lua file
for _, filename in ipairs(filenames) do
    local full_path = lfs.writedir() .. "\\" .. tti_dir .. "\\" .. filename
    dofile(full_path)
end
--trigger.action.outText("TTI SP Mission Settings loading from: ... DCS Saved Games Folder",45)
if mission_era == nil then
trigger.action.outText("TTI SP Mission Settings loading ERROR: Ensure your settings are properly set and located in your DCS Saved Games Folder (C:\Users\[YOUR USER]\Saved Games\DCS.openbeta\. Check documentation (link in briefing) for details.",45)
end
else
--trigger.action.outText("TTI SP Mission Settings loading from: ... Mission Editor Trigger List",45)
end