------------------------------------------------------------------------------
-- Rematch_TSMPetValues - Add TSM market values to the Rematch pet list
------------------------------------------------------------------------------
-- GUI_Rematch5_Sorting.lua - Sorting pet list (for Rematch v5)
--
-- Author: Expelliarm5s / May 2024 / All Rights Reserved
--
-- Version 1.2.4
------------------------------------------------------------------------------
-- luacheck: ignore 212 globals DLAPI
-- luacheck: globals Rematch RematchSettings OKAY

local addonName, addon = ...
local Rematch5_Sorting = addon:NewModule("Rematch5_Sorting", "AceConsole-3.0", "AceHook-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local private = {}

------------------------------------------------------------------------------
-- Debug Stuff

function Rematch5_Sorting:DebugPrintf(...)
	if addon.isDebug then
		local status, res = pcall(format, ...)
		if status then
			addon:DebugLog("R5Sort~" .. res)
		end
	end
end

------------------------------------------------------------------------------
-- Addon Loading / Player Login/Logout

function Rematch5_Sorting:ModuleName()
	return Rematch5_Sorting.moduleName
end

function Rematch5_Sorting:Login()
	Rematch5_Sorting:DebugPrintf("Login()")

	addon.db.global[Rematch5_Sorting:ModuleName()] = false
	if Rematch and Rematch.sort and Rematch.sort.SortFunc then
		Rematch5_Sorting:RawHook(Rematch.sort, "SortFunc", Rematch5_Sorting.NewRSSF)
		if Rematch5_Sorting:IsHooked(Rematch.sort, "SortFunc") then
			Rematch5_Sorting:DebugPrintf("   found Rematch, hooked into Rematch.sort.SortFunc()")
			addon.db.global[Rematch5_Sorting:ModuleName()] = true
		else
			Rematch5_Sorting:DebugPrintf("ERR~   found Rematch, but not hooked into Rematch.sort.SortFunc()")
		end
	end
end

-- itemString, customName, name = GetPetItemString(petID)
local function GetPetItemString(petID)
	Rematch5_Sorting:DebugPrintf("GetPetItemString(%s)", tostring(petID))

    local petInfo

	if Rematch and Rematch.petInfo and Rematch.petInfo.Fetch then
		petInfo = Rematch.petInfo:Fetch(petID)
	else
		Rematch5_Sorting:DebugPrintf("ERR~ no Rematch.petInfo:Fetch()")
		return
	end

	if not petInfo then
		Rematch5_Sorting:DebugPrintf("ERR~ bad Rematch.petInfo:Fetch(petID)")
		return
	end

	if not petInfo.isValid or not petInfo.idType then
		Rematch5_Sorting:DebugPrintf("ERR~ Rematch.petInfo:Fetch(petID) is invalid")
		return
	end

	Rematch5_Sorting:DebugPrintf(" idType=%s", petInfo.idType)

	local speciesID, tsmSpeciesID, customName, level, name, rarity
	level = 1 -- doesn't matter
	rarity = 3 -- doesn't matter

	if petInfo.idType == "pet" then
		speciesID = petInfo.speciesID
		customName = petInfo.customName
		name = petInfo.name
		level = petInfo.level or 1
		tsmSpeciesID = speciesID
	elseif petInfo.idType == "species" then
		tsmSpeciesID = petInfo.speciesID
	else
		Rematch5_Sorting:DebugPrintf("ERR~  not pet/species")
		return
	end

	if tsmSpeciesID == nil then
		return
	end

	rarity = petInfo.rarity or rarity

	local petItemString = "p:" .. tostring(tsmSpeciesID) .. ":" .. tostring(level) .. ":" .. tostring(rarity)
	return petItemString, customName, name
end

-- hooked Function Rematch.sort.SortFunc(pet1,pet2)
function Rematch5_Sorting.NewRSSF(pet1, pet2)
	-- Rematch5_Sorting:DebugPrintf("NewRSSF(%s, %s) %s", tostring(pet1), tostring(pet2), tostring(private.sort))

	local doSort

	if not private.sort or private.sort == "" then
		return Rematch5_Sorting.hooks[Rematch.sort]["SortFunc"](pet1, pet2)
	else
		doSort = true
	end

	private.isDebug = addon.isDebug
	addon.isDebug = false

	if doSort then
		local res
		local petString1 = GetPetItemString(pet1)
		local petString2 = GetPetItemString(pet2)
		if petString1 and petString2 then
			local p1, p2
			if private.sort == "first" then
				p1 = addon.PetItem_TSM and addon.PetItem_TSM.GetPetGoldValue(petString1, addon.db.global.valA) or 0
				p2 = addon.PetItem_TSM and addon.PetItem_TSM.GetPetGoldValue(petString2, addon.db.global.valA) or 0
			end
			if private.sort == "second" then
				p1 = addon.PetItem_TSM and addon.PetItem_TSM.GetPetGoldValue(petString1, addon.db.global.valB) or 0
				p2 = addon.PetItem_TSM and addon.PetItem_TSM.GetPetGoldValue(petString2, addon.db.global.valB) or 0
			end
			if private.sort == "firstminussecond" then
				local p1a = addon.PetItem_TSM and addon.PetItem_TSM.GetPetGoldValue(petString1, addon.db.global.valA) or 0
				local p1b = addon.PetItem_TSM and addon.PetItem_TSM.GetPetGoldValue(petString1, addon.db.global.valB) or 0
				local p2a = addon.PetItem_TSM and addon.PetItem_TSM.GetPetGoldValue(petString2, addon.db.global.valA) or 0
				local p2b = addon.PetItem_TSM and addon.PetItem_TSM.GetPetGoldValue(petString2, addon.db.global.valB) or 0
				if p1a and p1b then
					p1 = p1a - p1b
				end
				if p2a and p2b then
					p2 = p2a - p2b
				end
			end

			if p1 and p2 then
				if p1 > p2 then
					res = true
				else
					res = false
				end
			else
				res = false
			end
		else
			res = false
		end
		addon.isDebug = private.isDebug
		return res
	end
end

function Rematch5_Sorting:CheckForTSMData()
	if TSM_API then
		if TSM_API.GetCustomPriceValue then
			local val1 = addon.PetItem_TSM.GetPetGoldValue("p:141", "DBRegionMarketAvg")
			local val2 = addon.PetItem_TSM.GetPetGoldValue("p:1628", "DBRegionMarketAvg")
			if (val1 and val1 > 0) or (val2 and val2 > 0) then
				addon:DebugPrintf("  found pet data for p:141 or p:1628 (%s / %s)", tostring(val1), tostring(val2))
			else
				addon:Printf("|cffff8888" .. L["No usable data from TradeSkillMaster found! Please check your TradeSkillMaster Desktop App."] .. "|r")
			end
		else
			addon:Printf("|cffff8888" .. L["TradeSkillMaster not found!"] .. "|r")
		end
	else
		addon:Printf("|cffff8888" .. L["TradeSkillMaster not found!"] .. "|r")
	end
end

local function GetSortRadio(self)
	if not self then
		private.sort = ""
		return false
	end
	Rematch5_Sorting:DebugPrintf("GetSortRadio(self) self.key=%s", tostring(self.key))
	private.sort = private.sort or ""
	return private.sort == self.key
end

local function SetSortRadio(self)
	if not self then
		private.sort = ""
		return false
	end
	Rematch5_Sorting:DebugPrintf("SetSortRadio(self) self.key=%s", tostring(self.key))
	private.sort = self.key
	Rematch5_Sorting:CheckForTSMData()
	if Rematch.filters and Rematch.filters.RunFilters and Rematch.petsPanel and Rematch.petsPanel.Update then
		Rematch.filters:RunFilters(true)
		Rematch.petsPanel:Update()
	end
end

local function ResetSort()
	Rematch5_Sorting:DebugPrintf("ResetSort()")
	private.sort = ""
	Rematch5_Sorting:CheckForTSMData()
	if Rematch.filters and Rematch.filters.RunFilters and Rematch.petsPanel and Rematch.petsPanel.Update then
		Rematch.filters:RunFilters(true)
		Rematch.petsPanel:Update()
	end
end

------------------------------------------------------------------------------
-- Timers

-- called some seconds after login
local secTimerDone = false

function Rematch5_Sorting:SecTimer()
	-- just once
	if secTimerDone then
		return
	end

	Rematch5_Sorting:DebugPrintf("SecTimer()")

	secTimerDone = true
	private.sort = ""

	-- find and extend PetSort menu
	if Rematch and Rematch.menus and Rematch.menus.AddToMenu then
		Rematch5_Sorting:DebugPrintf("Extend PetFilterMenu")

		local tooltipTitle=L["Sort by TSM price sources"]
		local tooltipBody=format(L["You can sort by a %sfirst%s and a %ssecond price source%s, which can be configured via the %s addon settings.\n\n" ..
					"The third sorting option results from the difference between the %sfirst%s and %ssecond price source%s.\n" ..
					"If the %sfirst%s and %ssecond price source%s depends on DBMinBuyout and DBRegionMarketAvg, " ..
					"the sorted list will show the pets at the top of the list that are worth selling on your server."],
						ITEM_QUALITY_COLORS[1].hex, FONT_COLOR_CODE_CLOSE,
						ITEM_QUALITY_COLORS[1].hex, FONT_COLOR_CODE_CLOSE,
						addonName,
						ITEM_QUALITY_COLORS[1].hex, FONT_COLOR_CODE_CLOSE,
						ITEM_QUALITY_COLORS[1].hex, FONT_COLOR_CODE_CLOSE,
						ITEM_QUALITY_COLORS[1].hex, FONT_COLOR_CODE_CLOSE,
							ITEM_QUALITY_COLORS[1].hex, FONT_COLOR_CODE_CLOSE
						)

		local menuItem1 = {text=ITEM_QUALITY_COLORS[7].hex .. addonName .. " (" .. addon.METADATA.VERSION .. ")" .. FONT_COLOR_CODE_CLOSE,
			icon="Interface\\Icons\\Spell_Shadow_MindBomb", stay=true, tooltipTitle=tooltipTitle, tooltipBody=tooltipBody}
		local menuItem2 = {text=ITEM_QUALITY_COLORS[7].hex .. L["Sort by 1st price source"] .. FONT_COLOR_CODE_CLOSE,
			radio=true, key="first", isChecked=GetSortRadio, func=SetSortRadio}
		local menuItem3 = {text=ITEM_QUALITY_COLORS[7].hex .. L["Sort by 2nd price source"] .. FONT_COLOR_CODE_CLOSE,
			radio=true, key="second",	isChecked=GetSortRadio,	func=SetSortRadio}
		local menuItem4 = {text=ITEM_QUALITY_COLORS[7].hex .. L["Sort by 1st minus 2nd price source"] .. FONT_COLOR_CODE_CLOSE,
			radio=true, key="firstminussecond", isChecked=GetSortRadio, func=SetSortRadio}
		local menuItem5 = {text=ITEM_QUALITY_COLORS[7].hex .. RESET .. FONT_COLOR_CODE_CLOSE, func=ResetSort}

		Rematch.menus:AddToMenu("PetFilterMenu", menuItem5, OKAY)
		Rematch.menus:AddToMenu("PetFilterMenu", menuItem4, OKAY)
		Rematch.menus:AddToMenu("PetFilterMenu", menuItem3, OKAY)
		Rematch.menus:AddToMenu("PetFilterMenu", menuItem2, OKAY)
		Rematch.menus:AddToMenu("PetFilterMenu", menuItem1, OKAY)
		Rematch.menus:AddToMenu("PetFilterMenu", {text = ""}, OKAY)
	else
		addon.errorPrinted = false
		addon.aError = L["can't extend the pet sort menu"]
		addon.PrintIfError()
	end
end

-- EOF

