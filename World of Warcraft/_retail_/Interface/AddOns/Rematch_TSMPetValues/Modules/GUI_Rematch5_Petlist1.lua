------------------------------------------------------------------------------
-- Rematch_TSMPetValues - Add TSM market values to the Rematch pet list
------------------------------------------------------------------------------
-- GUI_Rematch5_Petlist1.lua - Item value in pet list (for Rematch v5)
--
-- Author: Expelliarm5s / May 2024 / All Rights Reserved
--
-- Version 1.2.4
------------------------------------------------------------------------------
-- luacheck: ignore 212 globals DLAPI
-- luacheck: globals Rematch

local _, addon = ...
local Rematch5_PetList1 = addon:NewModule("Rematch5_PetList1", "AceConsole-3.0", "AceHook-3.0")
-- local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
-- local private = {}

------------------------------------------------------------------------------
-- Debug Stuff

function Rematch5_PetList1:DebugPrintf(...)
	if addon.isDebug then
		local status, res = pcall(format, ...)
		if status then
			addon:DebugLog("R5PL1~" .. res)
		end
	end
end

------------------------------------------------------------------------------
-- Addon Loading / Player Login/Logout

function Rematch5_PetList1:ModuleName()
	return Rematch5_PetList1.moduleName
end

function Rematch5_PetList1:Login()
	Rematch5_PetList1:DebugPrintf("Login()")

	addon.db.global[Rematch5_PetList1:ModuleName()] = false
	if Rematch and Rematch.petsPanel and Rematch.petsPanel.FillNormal then
		Rematch5_PetList1:SecureHook(Rematch.petsPanel, "FillNormal", Rematch5_PetList1.NewRPPFN)
		if Rematch5_PetList1:IsHooked(Rematch.petsPanel, "FillNormal") then
			Rematch5_PetList1:DebugPrintf("   found Rematch, hooked into Rematch.petsPanel:FillNormal()")
			addon.db.global[Rematch5_PetList1:ModuleName()] = true
		else
			Rematch5_PetList1:DebugPrintf("ERR~   found Rematch, but not hooked into Rematch.petsPanel:FillNormal()")
		end
	end
end

-- itemString, customName, name = GetPetItemString(petID)
local function GetPetItemString(petID)
	Rematch5_PetList1:DebugPrintf("GetPetItemString(%s)", tostring(petID))

    local petInfo

	if Rematch and Rematch.petInfo and Rematch.petInfo.Fetch then
		petInfo = Rematch.petInfo:Fetch(petID)
	else
		Rematch5_PetList1:DebugPrintf("ERR~ no Rematch.petInfo:Fetch()")
		return
	end

	if not petInfo then
		Rematch5_PetList1:DebugPrintf("ERR~ bad Rematch.petInfo:Fetch(petID)")
		return
	end

	if not petInfo.isValid or not petInfo.idType then
		Rematch5_PetList1:DebugPrintf("ERR~ Rematch.petInfo:Fetch(petID) is invalid")
		return
	end

	Rematch5_PetList1:DebugPrintf(" idType=%s", petInfo.idType)

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
		Rematch5_PetList1:DebugPrintf("ERR~  not pet/species")
		return
	end

	if tsmSpeciesID == nil then
		return
	end

	rarity = petInfo.rarity or rarity

	local petItemString = "p:" .. tostring(tsmSpeciesID) .. ":" .. tostring(level) .. ":" .. tostring(rarity)
	return petItemString, customName, name
end

local function AddPetValues(obj, petID)
	local petItemString, customName = GetPetItemString(petID)

	if petItemString then
		local priceInfo = addon.PetItem_TSM and addon.PetItem_TSM.GetPriceInfo(petItemString)

		if priceInfo then
			if customName and customName ~= "" then
				customName = ", " .. customName
			end

			customName = customName or ""

			if obj and obj.SpeciesName then
				Rematch5_PetList1:DebugPrintf("  set %s", tostring(priceInfo .. customName))
				obj.SpeciesName:SetText(priceInfo .. customName)
				obj.SpeciesName:Show()
			end
		end
	end

	addon.PrintIfError()
end

-- hooked Function is Rematch.petsPanel:FillNormal()
function Rematch5_PetList1.NewRPPFN(obj, petID)
	Rematch5_PetList1:DebugPrintf("NewRPPFN(%s, %s)", tostring(obj), tostring(petID))

	AddPetValues(obj, petID)
end
