----------------------------------------------------------------------------------------------------
-- TradeSkillFluxCapacitor - Trade Skill Flux Capacitor is what makes navigating the trade skills window possible
----------------------------------------------------------------------------------------------------
-- TradeSkillFluxCapacitor.lua
--
-- Author: Expelliarm5s / January 2024 / All Rights Reserved
--
-- Version 1.21.43
----------------------------------------------------------------------------------------------------
-- luacheck: ignore 212 globals DLAPI GPF ProfessionsFrame

local addonName, addon = ...
addon = LibStub("AceAddon-3.0"):NewAddon(addon, addonName, "AceEvent-3.0", "AceConsole-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceDB = LibStub("AceDB-3.0")
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- General Settings

addon.METADATA = {
	NAME = GetAddOnMetadata(..., "Title"),
	VERSION = GetAddOnMetadata(..., "Version"),
	NOTES = GetAddOnMetadata(..., "Notes"),
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
	if (addon.isDebug) then
		addon:Printf(L["Debug is off"])
		addon:DebugPrintf(L["Debug is off"])
	else
		addon:Printf(L["Debug is on"])
		addon:DebugPrintf(L["Debug is on"])
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

	addon.handle = "TSFC"
	addon.isDebug = false
	addon.timerSec = 1
	-- loads data and options
	addon.db = AceDB:New(addonName .. "DB", addon.Options.defaults, true)
	AceConfigRegistry:RegisterOptionsTable(addonName, addon.Options.GetOptions)
	local optionsFrame = AceConfigDialog:AddToBlizOptions(addonName, GetAddOnMetadata(addonName, "Title"))
	addon.optionsFrame = optionsFrame

	addon:RegisterChatCommand(addon.handle .. "debug", addon.ToggleDebug)
	addon:RegisterChatCommand(addon.handle .. "gpf", function()
		GPF = ProfessionsFrame
	end)
	--addon:RegisterChatCommand(addon.handle .. "test", function()
	--	addon.testMode = true
	--	addon:Printf("Test mode on.")
	--end)
	addon:RegisterChatCommand(addon.handle .. "config", function()
		InterfaceOptionsFrame_OpenToCategory(GetAddOnMetadata(addonName, "Title"))
		InterfaceOptionsFrame_OpenToCategory(GetAddOnMetadata(addonName, "Title"))
		end)
end

-- called by AceAddon on PLAYER_LOGIN
function addon:OnEnable()
	addon:DebugPrintf("OnEnable()")
	addon:Printf("|cFF33FF99(" .. addon.METADATA.VERSION .. ")|r")

	addon:Login()
	addon:DebugPrintf("Calling Login() in all modules")
	for modle in pairs(addon.modules) do
		if addon.modules[modle].Login then
			addon:DebugPrintf(" -> %s:Login()", modle)
			addon.modules[modle]:Login()
		end
	end

	-- initializing *:Logout loop
	addon:RegisterEvent("PLAYER_LOGOUT", function()
		addon:OnLogout()
		end)
	addon.sectimer = C_Timer.NewTicker(addon.timerSec, function() addon:SecTimer() end)
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

------------------------------------------------------------------------------
-- Timers

-- loop through all module timers once a second
function addon:SecTimer()
	-- addon:DebugPrintf("SecTimer()")
	for modle in pairs(addon.modules) do
		if addon.modules[modle].SecTimer then
			addon.modules[modle]:SecTimer()
		end
	end
end

------------------------------------------------------------------------------
-- Initialization at Login/Logout

function addon:Login()
	addon:DebugPrintf("")
	addon:DebugPrintf("OK~" .. addon.METADATA.NAME .. " v" .. addon.METADATA.VERSION .. "- " .. addon.METADATA.NOTES)
	addon:DebugPrintf("")

	local wowV, wowP = GetBuildInfo()
	local wowVersion = "Game: WoW (ID " .. WOW_PROJECT_ID .. "), Version: " .. wowV .. ", Build: " .. wowP
	addon:DebugPrintf(wowVersion)
end

-- EOF
