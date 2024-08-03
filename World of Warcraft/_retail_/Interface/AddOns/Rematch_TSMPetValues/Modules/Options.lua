------------------------------------------------------------------------------
-- Rematch_TSMPetValues - Add TSM market values to the Rematch pet list
------------------------------------------------------------------------------
-- Options.lua - AddOn Options
--
-- Author: Expelliarm5s / May 2024 / All Rights Reserved
--
-- Version 1.2.4
------------------------------------------------------------------------------
-- luacheck: ignore 212 globals DLAPI
-- luacheck: globals AceGUIWidgetLSMlists, max line length 320, ignore 212

-- luacheck: globals Rematch

local addonName, addon = ...
local Options = addon:NewModule("Options", "AceConsole-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
--------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Settings

Options.defaults = {
	profile = {
	},
	global = {
		valA = "DBMinBuyout",
		valB = "DBRegionMarketAvg",
		valTH = "30% DBRegionMarketAvg",
	},
}

------------------------------------------------------------------------------
-- Debug Stuff

function Options:DebugPrintf(...)
	if addon.isDebug then
		local status, res = pcall(format, ...)
		if status then
			addon:DebugLog("OPT~" .. res)
		end
	end
end

------------------------------------------------------------------------------
-- Addon Loading / Player Login/Logout

function Options:Login()
	Options:DebugPrintf("Options:Login()")
	addon.db.global[Options.moduleName] = true
end

function Options.GetOptions(uiType, uiName, appName)
	if appName == addonName then

		local wowV, wowP = GetBuildInfo()
		local wowVersion = "|nGame: WoW (ID " .. WOW_PROJECT_ID .. "), Version: " .. wowV .. ", Build: " .. wowP

		local loadedModules = "/"
		local unloadedModules = "/"

		for modle in pairs(addon.modules) do
			if addon.db.global[modle] then
				loadedModules = loadedModules .. modle .. "/"
			else
				unloadedModules = unloadedModules .. modle .. "/"
			end
		end

		local options = {
			type = "group",
			name = addon.METADATA.NAME .. " (" .. addon.METADATA.VERSION .. ") " .. (addon.isEnabledInfo or ""),
			args = {
				desc0 = {
					type = "description",
					order = 0,
					name = "|cff99ccff-: by " .. addon.METADATA.AUTHOR .. " :-|r|n|n" .. addon.METADATA.NAME,
					fontSize = "medium",
				},
				desc001 = {
					type = "description",
					order = 0.01,
					name = wowVersion,
				},
				g1 = {
					type = "group",
					order = 1,
					guiInline = true,
					name = L["Price Sources"],
					args = {
						valAVal = {
							name = L["First Price Source"],
							desc = L["Choose a TSM price source"],
							type = "input",
							order = 0.1,
							width = "double",
							get = function()
								return addon.db.global.valA
								end,
							set = function(_, value)
								if value == "" then value = nil end
								if addon.db.global.valA ~= value then
									addon.db.global.valA = value
									addon.aError = nil
									if value then
										local status, res1 = pcall(addon.ValidateCustomPrice, value)
										if status then
											if not res1 then
												addon.aError = L["TSM price source error"] .. ": " .. value
											end
										else
											addon.aError = L["TSM API error"] .. ": " .. res1
										end
									end
									addon.errorPrinted = false
									addon.PrintIfError()
									wipe(addon.petGoldValueC)
									if Rematch and Rematch.UpdateRoster then
										Rematch.UpdateRoster()
									end
								end
							end,
						},
						desc2 = {
							type = "description",
							order = 0.2,
							name = L["Default is 'DBMinBuyout', one of '/tsm sources'"],
							width = "double",
						},
						valBVal = {
							name = L["Second Price Source"],
							desc = L["Choose a TSM price source"],
							type = "input",
							order = 0.3,
							width = "double",
							get = function()
								return addon.db.global.valB
								end,
							set = function(_, value)
								if value == "" then value = nil end
								if addon.db.global.valB ~= value then
									addon.db.global.valB = value
									addon.aError = nil
									if value then
										if addon.ValidateCustomPrice and addon.GetCustomPriceValue then
											local status, res1 = pcall(addon.ValidateCustomPrice, value)
											if status then
												if not res1 then
													addon.aError = L["TSM price source error"] .. ": " .. value
												end
											else
												addon.aError = L["TSM API error"] .. ": " .. res1
											end
										end
									end
									addon.errorPrinted = false
									addon.PrintIfError()
									wipe(addon.petGoldValueC)
									if Rematch and Rematch.UpdateRoster then
										Rematch.UpdateRoster()
									end
								end
							end,
						},
						desc3 = {
							type = "description",
							order = 0.4,
							name = L["Default is 'DBRegionMarketAvg', one of '/tsm sources'"],
							width = "double",
						},
					},
				},
				g2 = {
					type = "group",
					order = 2,
					name = L["Alerts"],
					guiInline = true,
					args = {
						valTHVal = {
							name = L["Alert Trigger"],
							desc = L["Choose the amount of gold to trigger the +/- notice. Example: '5000g' or '50% DBRegionMarketAvg'."],
							type = "input",
							order = 0.5,
							width = "double",
							get = function()
								return addon.db.global.valTH
								end,
							set = function(_, value)
								if value == "" then value = nil end
								if addon.db.global.valTH ~= value then
									addon.db.global.valTH = value
									addon.aError = nil
									if value then
										if addon.ValidateCustomPrice and addon.GetCustomPriceValue then
											local status, res1 = pcall(addon.ValidateCustomPrice, value)
											if status then
												if not res1 then
													addon.aError = L["TSM price source error"] .. ": " .. value
												end
											else
												addon.aError = L["TSM API error"] .. ": " .. res1
											end
										end
									end
									addon.errorPrinted = false
									addon.PrintIfError()
									wipe(addon.petGoldValueC)
									if Rematch and Rematch.UpdateRoster then
										Rematch.UpdateRoster()
									end
								end
							end,
						},
						desc4a = {
							type = "description",
							order = 0.6,
							fontSize = "medium",
							name = L["If the difference between the first and second market value is greater than this value, an + is printed in front of a price info, up to three times. Otherwise an - is printed. Defaults to 5000."],
							width = "full",
						},
						desc4b = {
							type = "description",
							order = 0.65,
							fontSize = "medium",
							name = L["Example: Set the first price source to 'DBMinBuyout' and the second to 'DBRegionMarketAvg'. For every + you can expect a greater chance to gain gold, if you sell this pet on this server. For every - you can expect to gain gold, if you buy this pet on this server and sell it on an other server."],
							width = "full",
						},
					},
				},
				header990 = {
					type = "header",
					name = "",
					order = 990,
				},
				desc991 = {
					type = "description",
					order = 991,
					name = L["Loaded modules: "] .. loadedModules,
				},
				desc992 = {
					type = "description",
					order = 992,
					name = L["Not loaded modules: "] .. unloadedModules,
				},
			},
		}

		return options
	end
end

-- EOF
