------------------------------------------------------------------------------
-- Rematch_TSMPetValues - Add TSM market values to the Rematch pet list
------------------------------------------------------------------------------
-- GUI_Rematch4_Petlist2.lua - Item value in pet list (for Rematch v4)
--
-- Author: Expelliarm5s / May 2024 / All Rights Reserved
--
-- Version 1.2.4
------------------------------------------------------------------------------
-- luacheck: ignore 212 globals DLAPI
-- luacheck: globals Rematch RematchPetPanel

local addonName, addon = ...
local Rematch4_PetList2 = addon:NewModule("Rematch4_PetList2", "AceConsole-3.0", "AceHook-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
-- local private = {}

------------------------------------------------------------------------------
-- Debug Stuff

function Rematch4_PetList2:DebugPrintf(...)
	if addon.isDebug then
		local status, res = pcall(format, ...)
		if status then
			addon:DebugLog("R4PL2~" .. res)
		end
	end
end

------------------------------------------------------------------------------
-- Addon Loading / Player Login/Logout

function Rematch4_PetList2:ModuleName()
	return Rematch4_PetList2.moduleName
end

function Rematch4_PetList2:Login()
	Rematch4_PetList2:DebugPrintf("Login()")

	addon.db.global[Rematch4_PetList2:ModuleName()] = false
	if Rematch and Rematch.FillNewPetListButton and Rematch.GetIDType then
		Rematch4_PetList2:SecureHook(Rematch, "FillNewPetListButton", Rematch4_PetList2.NewRFNPLB)
		if Rematch4_PetList2:IsHooked(Rematch, "FillNewPetListButton") then
			Rematch4_PetList2:DebugPrintf("   found Rematch, hooked into Rematch.FillNewPetListButton()")
			addon.db.global[Rematch4_PetList2:ModuleName()] = true
		else
			Rematch4_PetList2:DebugPrintf("ERR~   found Rematch, but not hooked into Rematch.FillNewPetListButton()")
		end
	end
end

-- itemString, customName, name = GetPetItemString(petID)
local function GetPetItemString(petID)
	Rematch4_PetList2:DebugPrintf("GetPetItemString(%s)", tostring(petID))

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

-- hooked Function is Rematch:FillNewPetListButton(petID)
function Rematch4_PetList2.NewRFNPLB(obj, petID)
	Rematch4_PetList2:DebugPrintf("NewRFNPLB(%s, %s)", tostring(obj), tostring(petID))

	local petItemString, customName, name = GetPetItemString(petID)
	local priceInfo = addon.PetItem_TSM and addon.PetItem_TSM.GetPriceInfo(petItemString)

	if priceInfo then
		if obj.SubName ~= nil then
			if customName then
				obj.SubName:SetFontObject(GameFontHighlight )
				obj.SubName:SetText(priceInfo .. ", " .. name)
			else
				obj.SubName:SetFontObject(GameFontHighlight)
				obj.SubName:SetText(priceInfo)
			end
			obj.SubName:SetHeight(15)
			obj.Name:SetHeight(21)
			obj.SubName:Show()
		else
			-- Erscheinungsoptionen > Kompakte Listen
			addon.aError = L["Please disable 'Compact List Format' in Rematch > Options > Appearance Options."]
		end
	end

	addon.PrintIfError()
end
