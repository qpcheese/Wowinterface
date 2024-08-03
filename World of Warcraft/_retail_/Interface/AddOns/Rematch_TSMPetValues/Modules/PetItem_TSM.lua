------------------------------------------------------------------------------
-- Rematch_TSMPetValues - Add TSM market values to the Rematch pet list
------------------------------------------------------------------------------
-- PetItem_TSM.lua - Pet Item Functions
--
-- Author: Expelliarm5s / May 2024 / All Rights Reserved
--
-- Version 1.2.4
------------------------------------------------------------------------------
-- luacheck: ignore 212 globals DLAPI

local addonName, addon = ...
local PetItem_TSM = addon:NewModule("PetItem_TSM", "AceConsole-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
-- local private = {}

------------------------------------------------------------------------------
-- Debug Stuff

function PetItem_TSM:DebugPrintf(...)
	if addon.isDebug then
		local status, res = pcall(format, ...)
		if status then
			addon:DebugLog("PITSM~" .. res)
		end
	end
end

------------------------------------------------------------------------------
-- Addon Loading / Player Login/Logout

function PetItem_TSM:Login()
	PetItem_TSM:DebugPrintf("Login()")

	----------------------------------------------------------------------------------------------------
	-- TSM API Compatibility Layer

	addon.db.global[PetItem_TSM.moduleName] = true

	if TSM_API and TSM_API.IsCustomPriceValid then
		PetItem_TSM:DebugPrintf("  found TSM4 and use TSM_API.IsCustomPriceValid for addon.ValidateCustomPrice")
		addon.ValidateCustomPrice = TSM_API.IsCustomPriceValid
	else
		addon.db.global[PetItem_TSM.moduleName] = false
	end

	if TSM_API and TSM_API.GetCustomPriceValue then
		PetItem_TSM:DebugPrintf("  found TSM4 and use TSM_API.GetCustomPriceValue for addon.GetCustomPriceValue")
		addon.GetCustomPriceValue = TSM_API.GetCustomPriceValue
	else
		addon.db.global[PetItem_TSM.moduleName] = false
	end

	if TSM_API and TSM_API.FormatMoneyString then
		PetItem_TSM:DebugPrintf("  found TSM4 and use TSM_API.FormatMoneyString for addon.MoneyToString")
		addon.MoneyToString = function(...)
			local v = TSM_API.FormatMoneyString(...)
			if v then
				v = strmatch(v, "^(.+)|cffffd70ag|r") or v
				return v .. "|cffffd70ag|r"
			else
				return "0|cffffd70ag|r"
			end
		end
	else
		addon.db.global[PetItem_TSM.moduleName] = false
	end

	-- check price availability
	C_Timer.After(10, function()
		if TSM_API then
			if TSM_API.GetCustomPriceValue then
				local val1 = PetItem_TSM.GetPetGoldValue("p:141", "DBRegionMarketAvg")
				local val2 = PetItem_TSM.GetPetGoldValue("p:1628", "DBRegionMarketAvg")

				if (val1 and val1 > 0) or (val2 and val2 > 0) then
					addon:Printf("|cff88ff88" .. L["Found usable data from TradeSkillMaster."] .. "|r")
					addon:DebugPrintf("  found pet data for p:141 or p:1628 (%s / %s)", tostring(val1), tostring(val2))
				else
					addon:Printf("|cffff8888" .. L["No usable data from TradeSkillMaster found! Please check your TradeSkillMaster Desktop App."] .. "|r")
					addon.db.global[PetItem_TSM.moduleName] = false
				end
			else
				addon:Printf("|cffff8888" .. L["TradeSkillMaster not found!"] .. "|r")
				addon.db.global[PetItem_TSM.moduleName] = false
			end
		else
			addon:Printf("|cffff8888" .. L["TradeSkillMaster not found!"] .. "|r")
			addon.db.global[PetItem_TSM.moduleName] = false
		end
	end)
end

addon.petGoldValueC = {}

-- goldValue = GetPetGoldValue(petItemString, priceSource)
function PetItem_TSM.GetPetGoldValue(petItemString, priceSource)
	PetItem_TSM:DebugPrintf("GetPetGoldValue(%s, %s)", tostring(petItemString), tostring(priceSource))
	local price = 0
	if not priceSource then
		addon.aError = L["check empty price source"]
		return price
	end
	if petItemString then
		if addon.petGoldValueC[petItemString .. priceSource] then
			return addon.petGoldValueC[petItemString .. priceSource]
		end
		if addon.ValidateCustomPrice and addon.GetCustomPriceValue then
			-- TSM4 API is broken: we have to pcall() ValidateCustomPrice and GetCustomPriceValue to have it not break
			-- this addon if something went wrong _inside_ TSM4 we have no influence of!
			local status1, res1 = pcall(addon.ValidateCustomPrice, priceSource)
			if status1 then
				if res1 then
					local status2, res2 = pcall(addon.GetCustomPriceValue, priceSource, petItemString)
					if status2 then
						if tonumber(res2) then
							price = floor(res2 / COPPER_PER_GOLD)
						end
					else
						PetItem_TSM:DebugPrintf("ERR~TSM API error: %s", tostring(res2))
						addon.aError = L["TSM API error"] .. ": " .. res2
					end
				else
					PetItem_TSM:DebugPrintf("ERR~TSM price source error: %s", tostring(priceSource))
					priceSource = priceSource or L["invalid price source"]
					addon.aError = L["TSM price source error"] .. ": " .. priceSource
				end
			else
				PetItem_TSM:DebugPrintf("ERR~TSM API error: %s", tostring(res1))
				addon.aError = L["TSM API error"] .. ": " .. res1
			end
			addon.petGoldValueC[petItemString .. priceSource] = price
		end

		-- debugging without loaded TSM
		-- price = 1234
		-- addon.petGoldValueC[petItemString .. priceSource] = price
		-- addon.MoneyToString = function(w) return tostring(w) end

	end
	return price
end

-- priceInfoString = GetPriceInfo(petItemString)
function PetItem_TSM.GetPriceInfo(petItemString)
	PetItem_TSM:DebugPrintf("GetPriceInfo(%s)", tostring(petItemString))
	local priceInfo = ""
	local fps = 0
	local sps = 0

	if addon.db.global.valA then
		local itemValue = PetItem_TSM.GetPetGoldValue(petItemString, addon.db.global.valA)
		if itemValue and itemValue > 0 then
			local itemValueString = addon.MoneyToString(itemValue * COPPER_PER_GOLD, "OPT_TRIM")
			priceInfo = itemValueString
			fps = itemValue
		else
			priceInfo = "0"
		end
	end

	if addon.db.global.valB then
		local itemValue = PetItem_TSM.GetPetGoldValue(petItemString, addon.db.global.valB)
		if itemValue and itemValue > 0 then
			local itemValueString = addon.MoneyToString(itemValue * COPPER_PER_GOLD, "OPT_TRIM")
			priceInfo = priceInfo .. " / " .. itemValueString
			sps = itemValue
		else
			priceInfo = priceInfo .. " / 0"
		end
	end

	local aTrigger
	local fixedTrigger = tonumber(addon.db.global.valTH)
	if fixedTrigger ~= nil then
		aTrigger = fixedTrigger
	else
		aTrigger = PetItem_TSM.GetPetGoldValue(petItemString, addon.db.global.valTH)
	end

	if (priceInfo == "0" or priceInfo == "0 / 0" or priceInfo == "0c / 0c") then
		priceInfo = nil
	else
		if fps > 0 and sps > 0 and aTrigger then
			if ((fps - sps) >= 0) then
				if ((fps - sps) >= (aTrigger * 3)) then
					priceInfo = "+++ " .. priceInfo
				elseif ((fps - sps) >= (aTrigger * 2)) then
					priceInfo = "++ " .. priceInfo
				elseif ((fps - sps) >= (aTrigger * 1)) then
					priceInfo = "+ " .. priceInfo
				end
			end
			if ((sps - fps) > 0) then
				if ((sps - fps) > (aTrigger * 3)) then
					priceInfo = "--- " .. priceInfo
				elseif ((sps - fps) > (aTrigger * 2)) then
					priceInfo = "-- " .. priceInfo
				elseif ((sps - fps) > (aTrigger * 1)) then
					priceInfo = "- " .. priceInfo
				end
			end
		end
	end

	PetItem_TSM:DebugPrintf("  %s", tostring(priceInfo))
	return priceInfo
end

