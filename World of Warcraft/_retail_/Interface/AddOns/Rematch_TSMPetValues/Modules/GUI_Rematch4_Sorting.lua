------------------------------------------------------------------------------
-- Rematch_TSMPetValues - Add TSM market values to the Rematch pet list
------------------------------------------------------------------------------
-- GUI_Rematch4_Sorting.lua - Sorting pet list (for Rematch v4)
--
-- Author: Expelliarm5s / May 2024 / All Rights Reserved
--
-- Version 1.2.4
------------------------------------------------------------------------------
-- luacheck: ignore 212 globals DLAPI
-- luacheck: globals Rematch RematchSettings

local addonName, addon = ...
local Rematch4_Sorting = addon:NewModule("Rematch4_Sorting", "AceConsole-3.0", "AceHook-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local private = {}

private.sortValA = 50
private.sortValB = private.sortValA + 1
private.sortValW = private.sortValA + 2

------------------------------------------------------------------------------
-- Debug Stuff

function Rematch4_Sorting:DebugPrintf(...)
	if addon.isDebug then
		local status, res = pcall(format, ...)
		if status then
			addon:DebugLog("R4Sort~" .. res)
		end
	end
end

------------------------------------------------------------------------------
-- Addon Loading / Player Login/Logout

function Rematch4_Sorting:ModuleName()
	return Rematch4_Sorting.moduleName
end

function Rematch4_Sorting:Login()
	Rematch4_Sorting:DebugPrintf("Login()")

	addon.db.global[Rematch4_Sorting:ModuleName()] = false
	if Rematch and Rematch.Roster and Rematch.Roster.SortPets and Rematch.GetIDType then
		Rematch4_Sorting:RawHook(Rematch.Roster, "SortPets", Rematch4_Sorting.NewRRSP)
		if Rematch4_Sorting:IsHooked(Rematch.Roster, "SortPets") then
			Rematch4_Sorting:DebugPrintf("   found Rematch, hooked into Rematch.Roster.SortPets()")
			addon.db.global[Rematch4_Sorting:ModuleName()] = true
		else
			Rematch4_Sorting:DebugPrintf("ERR~   found Rematch, but not hooked into Rematch.Roster.SortPets()")
		end
	end
end

-- itemString, customName, name = GetPetItemString(petID)
local function GetPetItemString(petID)
	Rematch4_Sorting:DebugPrintf("GetPetItemString(%s)", tostring(petID))

	local idType
	if Rematch.GetIDType then
		idType = Rematch.GetIDType(nil, petID)
	else
		return
	end

	local _, speciesID, tsmSpeciesID, customName, level, name, rarity, petInfo
	level = 1 -- doesn't matter
	rarity = 3 -- doesn't matter

	if idType=="pet" then
		speciesID, customName, level, _, _, _, _, name = C_PetJournal.GetPetInfoByPetID(petID)
		level = level or 1
		tsmSpeciesID = speciesID
	elseif idType=="species" then
		tsmSpeciesID = petID
	else
		return
	end

	if tsmSpeciesID == nil then
		return
	end

	if Rematch and Rematch.petInfo and Rematch.petInfo.Fetch then
		petInfo = Rematch.petInfo:Fetch(petID)
	end

	if not petInfo.valid then
		return
	end

	rarity = petInfo.rarity or rarity

	local petItemString = "p:" .. tsmSpeciesID .. ":" .. level .. ":" .. tostring(rarity)
	return petItemString, customName, name
end

-- hooked Function Rematch.Roster.SortPets(pet1,pet2)
function Rematch4_Sorting.NewRRSP(pet1, pet2)
	-- Rematch4_Sorting:DebugPrintf("NewRRSP(%s, %s)", tostring(pet1), tostring(pet2))

	local doSort

	if RematchSettings and RematchSettings.Sort and RematchSettings.Sort.Order and
		(RematchSettings.Sort.Order == private.sortValA or
		RematchSettings.Sort.Order == private.sortValB or
		RematchSettings.Sort.Order == private.sortValW)
	then
		doSort = true
	else
		return Rematch4_Sorting.hooks[Rematch.Roster]["SortPets"](pet1, pet2)
	end

	private.isDebug = addon.isDebug
	addon.isDebug = false

	if doSort then
		local res
		local petString1 = GetPetItemString(pet1)
		local petString2 = GetPetItemString(pet2)
		if petString1 and petString2 then
			local p1, p2
			if RematchSettings.Sort.Order == private.sortValA then
				p1 = addon.PetItem_TSM and addon.PetItem_TSM.GetPetGoldValue(petString1, addon.db.global.valA) or 0
				p2 = addon.PetItem_TSM and addon.PetItem_TSM.GetPetGoldValue(petString2, addon.db.global.valA) or 0
			end
			if RematchSettings.Sort.Order == private.sortValB then
				p1 = addon.PetItem_TSM and addon.PetItem_TSM.GetPetGoldValue(petString1, addon.db.global.valB) or 0
				p2 = addon.PetItem_TSM and addon.PetItem_TSM.GetPetGoldValue(petString2, addon.db.global.valB) or 0
			end
			if RematchSettings.Sort.Order == private.sortValW then
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

------------------------------------------------------------------------------
-- Timers

-- called some seconds after login
local secTimerDone = false

function Rematch4_Sorting:SecTimer()
	if secTimerDone then
		return
	end

	Rematch4_Sorting:DebugPrintf("SecTimer()")

	secTimerDone = true

	-- find and extend PetSort menu
	if Rematch and Rematch.GetMenu and Rematch.Roster and Rematch.Roster.GetSort and Rematch.Roster.SetSort then
		Rematch4_Sorting:DebugPrintf("   found Rematch PetSort Menu and extending it...")

		addon.petSortMenu = Rematch.GetMenu(nil,"PetSort")
		if addon.petSortMenu then
			-- for later
			--for i,v in ipairs(addon.petSortMenu) do
			--	if v and v.spacer then
			--		-- print("|cFF33FF99" .. addonName .. " (" .. addon.METADATA.VERSION .. ")|r:",
			--				"found spacer at PetSort menu i=" .. i .. " max=" .. #addon.petSortMenu)
			--		-- add stuff after first spacer
			--	end
			--end

			-- for now: adding entries to the end
			tinsert(addon.petSortMenu,
				{ spacer=true })

			tinsert(addon.petSortMenu,
				{ title=true, text=ITEM_QUALITY_COLORS[7].hex .. addonName .. FONT_COLOR_CODE_CLOSE,
				tooltipTitle=L["Sort by TSM price sources"],
				  tooltipBody=format(L["You can sort by a %sfirst%s and a %ssecond price source%s, which can be configured via the %s addon settings.\n\n" ..
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
						), }
				)

			tinsert(addon.petSortMenu,
				{ text=ITEM_QUALITY_COLORS[7].hex .. L["1st price source"] .. FONT_COLOR_CODE_CLOSE, radio=true, var="Order", order=private.sortValA,
					value=function(this)
						if this.order then
							return Rematch.Roster:GetSort(this.var) == this.order
						else
							return Rematch.Roster:GetSort(this.var)
						end
					end,
					func=function(this, _, checked)
						Rematch.Roster:SetSort(this.var, this.order or not checked)
						if Rematch.Roster:GetSort(this.var) == this.order then
							Rematch.Roster:SetSort("Reverse", false)
							Rematch.Roster:SetSort("FavoritesFirst", false)
						end
					end
				})

			tinsert(addon.petSortMenu,
				{ text=ITEM_QUALITY_COLORS[7].hex .. L["2nd price source"] .. FONT_COLOR_CODE_CLOSE, radio=true, var="Order", order=private.sortValB,
					value=function(this)
						if this.order then
							return Rematch.Roster:GetSort(this.var) == this.order
						else
							return Rematch.Roster:GetSort(this.var)
						end
					end,
					func=function(this, _, checked)
						Rematch.Roster:SetSort(this.var, this.order or not checked)
						if Rematch.Roster:GetSort(this.var) == this.order then
							Rematch.Roster:SetSort("Reverse", false)
							Rematch.Roster:SetSort("FavoritesFirst", false)
						end
					end
				})

			tinsert(addon.petSortMenu,
				{ text=ITEM_QUALITY_COLORS[7].hex .. L["1st minus 2nd price source"] .. FONT_COLOR_CODE_CLOSE, radio=true, var="Order", order=private.sortValW,
					value=function(this)
						if this.order then
							return Rematch.Roster:GetSort(this.var) == this.order
						else
							return Rematch.Roster:GetSort(this.var)
						end
					end,
					func=function(this, _, checked)
						Rematch.Roster:SetSort(this.var, this.order or not checked)
						if Rematch.Roster:GetSort(this.var) == this.order then
							Rematch.Roster:SetSort("Reverse", false)
							Rematch.Roster:SetSort("FavoritesFirst", false)
						end
					end
				})

			tinsert(addon.petSortMenu,
				{ text=ITEM_QUALITY_COLORS[7].hex .. RESET .. FONT_COLOR_CODE_CLOSE, stay=true, func=Rematch.Roster.ClearSort })
		else
			addon.errorPrinted = false
			addon.aError = L["can't extend the pet sort menu"]
			addon.PrintIfError()
		end
	end
end

-- EOF

