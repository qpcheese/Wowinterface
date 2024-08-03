----------------------------------------------------------------------------------------------------
-- TradeSkillFluxCapacitor - Trade Skill Flux Capacitor is what makes navigating the trade skills window possible
----------------------------------------------------------------------------------------------------
-- Modules/Options.lua - Addon Options
--
-- Author: Expelliarm5s / June 2024 / All Rights Reserved
--
-- Version 1.21.45
----------------------------------------------------------------------------------------------------
-- luacheck: ignore 212 globals DLAPI

local addonName, addon = ...
local Options = addon:NewModule("Options", "AceConsole-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local LibDBIcon = LibStub("LibDBIcon-1.0")
--------------------------------------------------------------------------------------------------------

local GetAddOnMetadata = GetAddOnMetadata
if C_AddOns and C_AddOns.GetAddOnMetadata then
	GetAddOnMetadata = C_AddOns.GetAddOnMetadata
end

------------------------------------------------------------------------------
-- Settings

Options.defaults = {
	profile = {
	},
	global = {
		showRecipeSelect = false,
		showMinimapButton = false,
		fluxSpeed = 4,
		withFrames = false,
		minStackSize = "6",
		minimap = {
			hide = false,
		},
	},
}

------------------------------------------------------------------------------
-- Debug Stuff

function Options:DebugPrintf(...)
	if addon.isDebug then
		local status, res = pcall(format, ...)
		if status then
			addon:DebugLog("Opt~" .. res)
		end
	end
end

------------------------------------------------------------------------------
-- Addon Loading / Player Login/Logout

function Options:Login()
	Options:DebugPrintf("Login()")
end

Options.fluxSpeedList = {}
Options.fluxSpeedList[8] = 8
Options.fluxSpeedList[6] = 6
Options.fluxSpeedList[5] = 5
Options.fluxSpeedList[4] = 4

function Options.GetOptions(_, _, appName)
	if appName == addonName then

		local wowV, wowP = GetBuildInfo()
		local wowVersion = "|nGame: WoW (ID " .. WOW_PROJECT_ID .. "), Version: " .. wowV .. ", Build: " .. wowP

		local options = {
			type = "group",
			name = addon.METADATA.NAME .. " (" .. addon.METADATA.VERSION .. ")",
			get = function(info)
					return addon.db.global[info[#info]] or ""
				end,
			set = function(info, value)
					addon.db.global[info[#info]] = value
					Options:DebugPrintf("OK~Set %s = %s", tostring(info[#info]), tostring(value))
				end,
			args = {
				desc0 = {
					type = "description",
					order = 0,
					name = "|cff99ccff-: by " .. GetAddOnMetadata(addonName, "Author") .. " :-|r|n|n" .. GetAddOnMetadata(addonName, "Notes"),
					fontSize = "medium",
				},
				desc001 = {
					type = "description",
					order = 0.01,
					name = wowVersion,
				},
				header100 = {
					type = "header",
					name = L["UI"],
					order = 1.00,
				},
				showMinimapButton = {
					type = "toggle",
					name = L["Show Minimap Button"],
					desc = L["If checked, the minimap button is present."],
					order = 1.001,
					width = "double",
					get = function(info) return addon.db.global[info[#info]] end,
					set = function(info, value)
							addon.db.global[info[#info]] = value
							if value then
								LibDBIcon:Show(addonName)
							else
								LibDBIcon:Hide(addonName)
							end
							Options:DebugPrintf("OK~Set %s = %s", tostring(info[#info]), tostring(value))
						end,
				},
				header200 = {
					type = "header",
					name = L["Misc."],
					order = 2.00,
				},
				showRecipeSelect = {
					type = "toggle",
					name = L["Show Recipe Select Message"],
					desc = L["If checked, the recipe selection message is printed in the chat."],
					order = 2.1,
					width = "double",
					get = function(info) return addon.db.global[info[#info]] end,
				},
				fluxSpeed = {
					type = "select",
					style = "dropdown",
					name = L["Recipe Switch Speed"],
					desc = L["Select the Flux Capacitor Speed."],
					order = 2.3,
					width = "double",
					values = Options.fluxSpeedList,
				},
				minStackSize = {
					type = "input",
					name = L["Mininum Stack Size"],
					desc = L["Select the mininum stack size for stacks to be selected for salvaging. Default: 5."],
					order = 2.4,
					width = "double",
					validate = function(info, value)
						if tonumber(value) and tonumber(value) >= 5 and tonumber(value) <= 5000 then
							addon.db.global[info[#info]] = tostring(value)
							return true
						end
						addon.db.global[info[#info]] = "5"
						return false
					end,
				},
			},
		}

		return options
	end
end

-- EOF
