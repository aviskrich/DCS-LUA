---------- check mission era valid ----------
--[[
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
]]

-- Spawning Function
function sp(groupName)
	group = SPAWN:New(groupName)
	group:Spawn()
end

--dump array function
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

--- MATH GLOBAL Functions
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    if num >= 0 then return math.floor(num * mult + 0.5) / mult
    else return math.ceil(num * mult - 0.5) / mult end
end

--- MOOSE FRAMWORK GLOBAL SETTINGS
_SETTINGS:SetPlayerMenuOff()

--TTI MP Global Functions Reqs
tti = {}
tti.config = {}
---------- Configuration Settings ----------
tti.config.debug = true

---------- Sound Initializer for internal miz file structure.
tti.sound = {}
---------- Frequency Limiter Switches
tti.sound.GLOBAL_GRND_LIMITER = false
tti.sound.GLOBAL_AIR_LIMITER = false
tti.sound.GLOBAL_HELO_LIMITER = false
tti.sound.GLOBAL_INTEL_LIMITER = false
tti.sound.GLOBAL_TRACK_LIMITER = false
----------
tti.sound.GLOBAL_LIMITER_TIME = 5 --Time allowed between transmissions of the categories/frequencies above.
tti.sound.GLOBAL_TRACK_LIMITER_TIME = 0  --Time Limiters for Music/Track files.
tti.sound.GLOBAL_INTEL_LIMITER_TIME = 30 --Time Limiter for smoke sounds when smoke from the intel menu is called.
tti.sound.filetype = ".ogg"
tti.sound.filepath = "TTI Soundfiles/"

---------- Simplified outSound function.
--You don't need to specify the file extension for these files. It's done automatically.
---@param filename string: Filename for the sound built into the miz file.
function tti.outSound(filename)
	if not filename then
		tti.debug("OutSound: No sound file specified.")
	else
		trigger.action.outSound(tti.sound.soundfolder..filename..tti.sound.filetype)
	end
end
----------Simplified outSoundGroup Function
--Plays specific file to group. Must specify group ID.
--Remember, you don't need the file extension here.
---@param groupID number: GroupID number.
---@param filename string: Name of the file to play. Do not include the file extension.
function tti.outSoundGroup(groupID, filename)
	if not groupID then
		tti.debug("OutSoundGroup: No group specified. Halt.")
		return
	elseif not filename then
		tti.debug("OutSoundGroup: No filename specified. Halt. ")
		return
	else
		trigger.action.outSoundForGroup(groupID, tti.sound.soundfolder..filename..tti.sound.filetype)
	end
end

tti.sound.ui_sounds = {
"TTI Soundfiles/ApacheRadioUI_01.ogg", 
"TTI Soundfiles/ApacheRadioUI_02.ogg", 
"TTI Soundfiles/ApacheRadioUI_03.ogg", 
"TTI Soundfiles/ApacheRadioUI_Close_01.ogg", 
"TTI Soundfiles/ApacheRadioUI_Close_02.ogg", 
}

---------- tti.delay
--Execute a function with a delay. No time specified makes it default to 5 seconds.
---@param func function: The function to be delayed
---@param args table: The table of arguments to be passed
---@param time integer: How long to delay before function execution.
function tti.delay(func,args, time)
	if not func then
		tti.debug("tti.delay: WARNING! func is nil")
		return
	elseif not time then
		tti.debug("Time not valid, defaulting to 5 seconds.")
		time = 5
	end
	tti.debug("Time set to : " ..time)
	timer.scheduleFunction(func, args, timer.getTime() + time)
end

---------- Debug command. Specify text to identify the debug instance to log in dcs.log.
function tti.debug(text, mirrorOutText, time)
	if not text then
	else
		if tti.config.debug == true then
			if mirrorOutText ~= true then
				env.info("TTI: Debug - " .. text)
			else
				if time then
					env.info("TTI: Debug - " .. text)
					trigger.action.outText(text, time)
				else
					env.info("TTI: Debug - " .. text)
					trigger.action.outText(text, 30)
				end
			end
		end
	end
end

---------- Simplified outText function.
--If no text is specified, time displayed will default to 15 seconds.
---@param text string: Text to be displayed
---@param time number: Time for displayed text to remain on screen.
function tti.outText(text, time)
	if not text then
	else
		if not time then
			time = 15
		end
		trigger.action.outText(text, time)
	end
end

---------- Simplified outTextForGroup function.
--If no text is specified, time displayed will default to 15 seconds.
---@param groupID number: GroupID number for object.
---@param text string: Text to be displayed
---@param time number: Time for displayed text to remain on screen.
function tti.outTextForGroup(groupID, text, time)
	if not text then
	else
		if not time then
			time = 15
		elseif not groupID then
			tti.debug("outTextForGroup - No groupID for group. Halt!")
			return
		end
		trigger.action.outTextForGroup(groupID, text, time)
	end
end

---------- Serialize function.
--Prints a table in the log in one line.
function tti.serialize(table, text)
	if not text then
		text = "SERIALIZE"
	end
	if not table then
		env.info("TTI: " ..text .. " - You need to specify a table!")
	else
		env.info("TTI: " .. text .. ": " .. UTILS.OneLineSerialize(table))
	end
end

----------TTI Color Database for drawing lines/arrows/circles.
tti.color = {
	red = {1,0,0},
	green = {0,1,0},
	blue = {0,0,1},
	white = {1,1,1},
	black = {0, 0, 0},
	yellow = {1,1,0},
	turquoise = {0,1,1},
	magenta = {1,0,1}

}

--- Returns the total amount of Unit in a Group
---@param groups table: Table with all the groups
function tti.getGroupsUnitCount(groups)
	local unitCount = 0
	for _, group in pairs(groups) do
		local units = group:GetUnits()
		unitCount = unitCount + #units
	end
	return unitCount
end


--- Filters a table and returns a new table with elements that
--- pass the test block of code
---@param list table: Some table you need to filter
---@param test function: The test to execute on each element of the table arg: (value, index)
function tti.tableFilter(list, test)
	local result = {}
	for index, value in ipairs(list) do
			if test(value, index) then
					result[#result + 1] = value
			end
	end
	return result
end

function tti.activateDL(groupName)
	tti.debug("Activating Datalink for "..groupName)
	local eplrs = {
		id = "EPLRS",
		params = {
			value = true
		}
	}
	local controller = Group.getByName(groupName):getController()
	controller:setCommand(eplrs)
end

function tti.setMissileRange(groupName, missileRangeSetting)
--MAX_RANGE = 0, NEZ_RANGE = 1, HALF_WAY_RMAX_NEZ = 2, TARGET_THREAT_EST = 3, RANDOM_RANGE = 4. See: https://wiki.hoggitworld.com/view/DCS_option_missileAttack
	tti.debug("Setting missile range to [".. missileRangeSetting .. "] for "..groupName)
	local missileRangeLaunch = {
		id = "Option",
         ["params"] = 
         {
             ["value"] = missileRangeSetting,
             ["name"] = 18,
         }, -- end of ["params"]
	}
	local controller = Group.getByName(groupName):getController()
	controller:setCommand(missileRangeLaunch)
end

-- establish config for immortal and invisible
tti_config_SetInvisible = {id = 'SetInvisible', params = {value = true}}
tti_config_SetImmortal = {id = 'SetImmortal', params = {value = true}}



-- GLOBALS TO FIX CARRIER ISSUES FROM BAD MODS OR DCS ERRORS
--check if carrier/sea map type

nonCarrierOpsMaps = {

}

if env.mission.theatre == "Nevada" or env.mission.theatre == "Afghanistan" or iraq_map_type == "iraq_baghdad" then
carrierOpsTheatre = false
tti.debug("Theatre is: " .. env.mission.theatre .. " setting carrierOpsTheatre to " .. string.upper(tostring(carrierOpsTheatre)))
else
carrierOpsTheatre = true
tti.debug("Theatre is: " .. env.mission.theatre .. " setting carrierOpsTheatre to " .. string.upper(tostring(carrierOpsTheatre)))
end

--check for carrier is nil
if Group.getByName("CVN-7X") then
carrierCvnExist = true
else
carrierCvnExist = false
end

if Group.getByName("CV Kuznetsov") then
carrierKuzExist = true
else
carrierKuzExist = false
end

tti.debug("Carrier CVN Exist Status: ... " .. string.upper(tostring(carrierCvnExist)))
tti.debug("Carrier KUZ Exist Status: ... " .. string.upper(tostring(carrierKuzExist)))

if carrierOpsTheatre == true then
	if carrierCvnExist == false and cv_cvn_enable == true then
		tti.debug("!! WARNING !! CARRIER SPAWN ERROR DETECTED. THIS COULD BE DUE TO DELETING THE CVN CARRIER, RENAMING THE CARRIER OR FAULTY MOD. Mission will continue to load but without the carrier.", true)
	end
	if carrierKuzExist == false and cv_kuz_enable == true then
		tti.debug("!! WARNING !! CARRIER SPAWN ERROR DETECTED. THIS COULD BE DUE TO DELETING THE KUZ CARRIER, RENAMING THE CARRIER OR FAULTY MOD. Mission will continue to load but without the carrier.", true)
	end	
end

-- MOVED DEBUG SETTINGS HERE
--DEFINE DEBUG SETTINGS HERE:

---- JTAC ALTITUDE GLOBAL SETTINGS
if env.mission.theatre == "Syria" then
tti_config_jtac_altitude = 6000
else
tti_config_jtac_altitude = 4000
end

-- Make this true if you want the mission to remove any units that are spawned above ground (on top of buildings, folliage, etc..)
remove_ground_units_on_buildings = true

--Make this true if you want to be notified if there were any units removed.
show_delete_unit_above_ground_msg = false

-- Change this value to decide the max height a unit can be before it gets removed. 2 is a recommended value.
maxSpawnHeight = 2

-- Disables the database loading of BLUE units for zeus, which essnetially doubles the amount of unit types loaded into the database at start. Disable this if you are having issues with game crashes or performance.  When disabled, spawning BLUE zeus units will no longer work.
allow_blue_zeus_units = true

--allow ability to change EWRS report interval in EWRS F10 settings
ewrsAllowChangeDisplayInterval = true



tti.debug("Global Functions load ... OK")
tti_global_functions_script_loaded = true