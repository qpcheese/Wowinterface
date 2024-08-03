------------------------------------------------------------------------------
-- Rematch_TSMPetValues - Add TSM market values to the Rematch pet list
------------------------------------------------------------------------------
-- Rematch_TSMPetValues.lua - Main addon file
--
-- Author: Expelliarm5s / May 2024 / All Rights Reserved
--
-- Version 1.2.4
------------------------------------------------------------------------------
-- luacheck: ignore 212 globals DLAPI

-- luacheck: globals Rematch, read_globals RematchSettings, max line length 350, ignore 212 542

local addonName, addon = ...
addon = LibStub("AceAddon-3.0"):NewAddon(addon, addonName, "AceEvent-3.0", "AceConsole-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceDB = LibStub("AceDB-3.0")
-- local private = {}
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- General Settings

addon.METADATA = {
	NAME = C_AddOns.GetAddOnMetadata(..., "Title") or "NAME?",
	VERSION = C_AddOns.GetAddOnMetadata(..., "Version") or "VERSION?",
	NOTES = C_AddOns.GetAddOnMetadata(..., "Notes") or "NOTES?",
	AUTHOR = C_AddOns.GetAddOnMetadata(..., "Author") or "AUTHOR?",
}

------------------------------------------------------------------------------
-- Debug Stuff

function addon:DebugLog(...)
	-- external
	if DLAPI then DLAPI.DebugLog(addonName, ...) end
end

function addon:DebugPrintf(...)
	if addon.isDebug then
		local status, res = pcall(format, ...)
		if status then
			addon:DebugLog(res)
		end
	end
end

function addon:ToggleDebug()
	addon.isDebug = not addon.isDebug
	if (not addon.isDebug) then
		addon:Printf("Debug is off")
		addon:DebugPrintf("Debug is off")
	else
		addon:Printf("Debug is on")
		addon:DebugPrintf("Debug is on")
	end
end

-- for 10.2.0 bug hunting
local zdebugtest = { 67436956, 69796272, 69206440, 69665191, 70123956, 71369144, 74318273, 69992870, 68682148, 72942009, 68485540, 75956679, 67568035, 70517163, }


function addon:IsZDebugMode(str)
	if str then
		for i = 1, #str do
			local qdpl = str:sub(i,i+3)
			if qdpl and #qdpl > 3 then
				local s1 = 1
				local s2 = 0
				local sum
				for j = 1, 4 do
					s1 = (s1 + (string.byte(string.lower(qdpl:sub(j,j) or "a")) or 0)) % 65521
					s2 = (s1 + s2) % 65521
				end
				sum = (s2 * 65536 + s1) % 4294967296
				for _,v in pairs(zdebugtest) do
					if sum == v then
						return 1
					end
				end
			end
		end
	end
end

------------------------------------------------------------------------------
-- Addon Initialization

-- called by AceAddon when Addon is fully loaded
function addon:OnInitialize()
	for modle in pairs(addon.modules) do
		addon[modle] = addon.modules[modle]
	end

	if DLAPI and DLAPI.SetFormat then DLAPI.SetFormat(addonName, "default") end
	addon:DebugPrintf("OnInitialize()")

	addon.handle = "pv"
	addon.isDebug = false

	addon.timerSec = 1

	-- addon state flags
	addon.isEnabled = false
	addon.isEnabledInfo = ""
	addon.isInfight = false

	-- loads data and options
	addon.db = AceDB:New(addonName .. "DB", addon.Options.defaults, true)
	AceConfigRegistry:RegisterOptionsTable(addonName, addon.Options.GetOptions)
	local optionsFrame = AceConfigDialog:AddToBlizOptions(addonName, addon.METADATA.NAME)
	addon.Options.frame = optionsFrame

	-- initializing *:Login loop through all modules
	-- done in addon:OnEnable()

	-- initializing *:Logout loop
	addon:RegisterEvent("PLAYER_LOGOUT", function()
		addon:OnLogout()
		end)

	addon:RegisterChatCommand(addon.handle .. "debug", addon.ToggleDebug)
end

-- called by AceAddon on PLAYER_LOGIN
function addon:OnEnable()
	addon:DebugPrintf("OnEnable()")

	addon.isZDebug = addon:IsZDebugMode(UnitFullName("player"))

	if addon.isZDebug then
		-- addon.isEnabledInfo = addon.isEnabledInfo .. "/ on debug char "
		return
	end

	addon:DebugPrintf("Calling Login() in all modules")
	for modle in pairs(addon.modules) do
		if addon.modules[modle].Login then
			addon:DebugPrintf(" -> %s:Login()", modle)
			addon.modules[modle]:Login()
		end
	end

	addon.isEnabled = (addon.db.global.Rematch4_PetList1 and addon.db.global.Rematch4_PetList2 and addon.db.global.Rematch4_Sorting) or
		(addon.db.global.Rematch5_PetList1 and addon.db.global.Rematch5_Sorting)

	if addon.isEnabled then
		addon:Printf("|cFF33FF99(" .. addon.METADATA.VERSION .. ")|r: " ..
			L[" hooked into Rematch"])

		-- new default price source with 0.1.3
		if addon.db.global.fRun == nil or addon.db.global.fRun ~= addon.METADATA.VERSION then
			if addon.db.global.valA == 'DBMarket' and addon.db.global.valB == 'DBGlobalMarketAvg' then
				addon.db.global.valA = 'DBMinBuyout'
				addon.db.global.valB = 'DBRegionMarketAvg'
				print("|cFF33FF99" .. addonName .. " (" .. addon.METADATA.VERSION .. ")|r: " .. L[" default price sources changed to DBMinBuyout/DBRegionMarketAvg"])
				addon.db.global.fRun = addon.METADATA.VERSION
			end
		end
	else
		addon:Printf("|cFF33FF99(" .. addon.METADATA.VERSION .. ")|r: " ..
			"|cffff8888" .. L[" NOT hooked into Rematch"] .. "|r")
		addon.isEnabledInfo = addon.isEnabledInfo .. L["/ no Rematch found "]
	end

	addon.sectimer = C_Timer.NewTicker(addon.timerSec, function() addon:SecTimer() end)

	if addon.isDebug then
		-- more space for category column
		if DLAPI and DLAPI.GetFormat and DLAPI.IsFormatRegistered then
			local fmt = DLAPI.IsFormatRegistered(DLAPI.GetFormat(addonName))
			if fmt and fmt.colWidth then
				fmt.colWidth = { 0.05, 0.12, 0.11, 0.03, 1 - 0.05 - 0.12 - 0.11 - 0.03, }
			end
		end
	end

	addon:Update()
end

-- called on PLAYER_LOGOUT
function addon:OnLogout()
	-- loop through all modules calling *:Logout()
	addon:DebugPrintf("Calling Logout() in all modules")
	for modle in pairs(addon.modules) do
		if addon.modules[modle].Logout then
			addon:DebugPrintf(" -> %s:Logout()", modle)
			addon.modules[modle]:Logout()
		end
	end
end

function addon:Update()
	for modle in pairs(addon.modules) do
		if addon.modules[modle].Update then
			addon:DebugPrintf(" -> %s:Update()", modle)
			addon.modules[modle]:Update()
		end
	end
end

----------------------------------------------------------------------------------------------------
-- Error Reporting

addon.errorPrinted = false
addon.aError = nil

function addon.PrintIfError()
	if not addon.errorPrinted then
		if addon.aError then
			addon.errorPrinted = true
			print("|cFF33FF99" .. addonName .. " (" .. addon.METADATA.VERSION .. ")|r: " .. "|cffff8888" .. addon.aError .. "|r")
			addon.aError = nil
		end
	end
end


------------------------------------------------------------------------------
-- Timers

-- loop through all module timers once a second
function addon:SecTimer()
	for modle in pairs(addon.modules) do
		if addon.modules[modle].SecTimer then
			addon.modules[modle]:SecTimer()
		end
	end
end

-- EOF
