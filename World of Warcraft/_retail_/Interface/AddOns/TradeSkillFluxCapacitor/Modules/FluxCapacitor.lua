----------------------------------------------------------------------------------------------------
-- TradeSkillFluxCapacitor - Trade Skill Flux Capacitor is what makes navigating the trade skills window possible
----------------------------------------------------------------------------------------------------
-- Modules/FluxCapacitor.lua
--
-- Author: Expelliarm5s / June 2024 / All Rights Reserved
--
-- Version 1.21.45
----------------------------------------------------------------------------------------------------
-- luacheck: ignore 212 globals DLAPI
-- luacheck: globals ProfessionsFrame  TradeSkillFrame C_TradeSkillUI debugstack
-- luacheck: globals Item ItemUtil ProfessionsRecipeSchematicFormMixin Professions
-- luacheck: max line length 350

local addonName, addon = ...
local FluxCapacitor = addon:NewModule("FluxCapacitor", "AceEvent-3.0", "AceConsole-3.0", "AceHook-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local private = {}
-------------------------------------------------------------------------------------------------------

-- FIXME for 10.0.5:
-- a) done: Re-enable jumping again for all cases, as Blizzard's code is again not reliable.
-- b) done: Re-enable salvage slot. Check for changed API.
--    done: Solved for extra/leftover items
-- c) done: Disabled event handling for not needed events.
-- d) done: Check if handling unlearned recipe tab still in need.
-- e) Handling lastSlotItemID in a better way.
-- f) Implementing display of ProfessionsFrame.CraftingPage.SchematicForm.RecipeSourceButton.Text as this was quite handy with
--    my addon WhatRepRecipes. As we are already hooking ProfessionsFrame.CraftingPage.SchematicForm.Init()

-- ProfessionsFrame.CraftingPage.SchematicForm.Init() is a monster. Would love to have access to Blizzard_ProfessionsDebug addon ;-)

------------------------------------------------------------------------------
-- Salvage Stuff

local function ToKey(professionID, recipeID)
	return "K" .. tostring(professionID) .. tostring(recipeID)
end

local TAILORING = 197
local UNRAVELLING_RECIPEID_10 = 376562

local INSCRIPTION = 773
local MILLING_RECIPEID_10 = 382981
local MILLING_RECIPEID_9 = 382982
local MILLING_RECIPEID_8 = 382984
local MILLING_RECIPEID_7 = 382986
local MILLING_RECIPEID_6 = 382987
local MILLING_RECIPEID_5 = 382988
local MILLING_RECIPEID_4 = 382989
local MILLING_RECIPEID_3 = 382990
local MILLING_RECIPEID_2 = 382991
local MILLING_RECIPEID_1 = 382994

local JEWELCRAFTING = 755
local PROSPECTING_RECIPEID_10 = 374627
local PROSPECTING_RECIPEID_10b = 395696
local PROSPECTING_RECIPEID_9 = 325248
local PROSPECTING_RECIPEID_8 = 382973
local PROSPECTING_RECIPEID_7 = 382975
local PROSPECTING_RECIPEID_5 = 382977
local PROSPECTING_RECIPEID_4 = 382978
local PROSPECTING_RECIPEID_3 = 382979
local PROSPECTING_RECIPEID_2 = 382980
local PROSPECTING_RECIPEID_1 = 382995

------------------------------------------------------------------------------
-- Debug Stuff

function FluxCapacitor:DebugPrintf(...)
	if addon.isDebug then
		local status, res = pcall(format, ...)
		if status then
			addon:DebugLog("FC~" .. res)
		end
	end
end

function FluxCapacitor:DebugTPrintf(stack, ...)
	if addon.isDebug then
		local status, res = pcall(format, ...)
		if status then
			addon:DebugLog("FC" .. tostring(stack) .. "~" .. res)
		end
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
-- Login/Logout

function FluxCapacitor:Login()
	FluxCapacitor:DebugPrintf("Login()")

	addon.db.global.tsi = addon.db.global.tsi or {}
	private.currentGUID = UnitGUID("player")
	FluxCapacitor.tsi = addon.db.global.tsi[private.currentGUID] or {}
	FluxCapacitor.tsiTemp = {}
	addon.isZDebug = addon:IsZDebugMode(UnitFullName("player"))

	private.fluxSpeed = (tonumber(addon.db.global.fluxSpeed) / 10) or 0.6
	FluxCapacitor:DebugPrintf("  fluxSpeed=%s", tostring(private.fluxSpeed))

	private.jumpsEnabled = true
	if not private.jumpsEnabled then
		FluxCapacitor:DebugPrintf("  Jumps are disabled!")
	end
	private.unravellingEnabled = true
	if not private.unravellingEnabled then
		FluxCapacitor:DebugPrintf("  Unravelling is disabled!")
	end

	-- get last salvaged item
	addon.db.global.lastSlotItemID = addon.db.global.lastSlotItemID or {}
	private.lastSlotItemID = private.lastSlotItemID or {}

	-- FIXME: this is ugly!
	private.lastSlotItemID[ToKey(TAILORING, UNRAVELLING_RECIPEID_10)] = addon.db.global.lastSlotItemID[ToKey(TAILORING, UNRAVELLING_RECIPEID_10)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(TAILORING, UNRAVELLING_RECIPEID_10), tostring(private.lastSlotItemID[ToKey(TAILORING, UNRAVELLING_RECIPEID_10)]))

	private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_10)] = addon.db.global.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_10)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_10), tostring(private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_10)]))

	private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_10b)] = addon.db.global.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_10b)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_10b), tostring(private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_10b)]))

	private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_9)] = addon.db.global.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_9)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_9), tostring(private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_9)]))

	private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_8)] = addon.db.global.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_8)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_8), tostring(private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_8)]))

	private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_7)] = addon.db.global.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_7)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_7), tostring(private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_7)]))

	private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_5)] = addon.db.global.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_5)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_5), tostring(private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_5)]))

	private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_4)] = addon.db.global.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_4)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_4), tostring(private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_4)]))

	private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_3)] = addon.db.global.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_3)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_3), tostring(private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_3)]))

	private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_2)] = addon.db.global.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_2)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_2), tostring(private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_2)]))

	private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_1)] = addon.db.global.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_1)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_1), tostring(private.lastSlotItemID[ToKey(JEWELCRAFTING, PROSPECTING_RECIPEID_1)]))

	private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_10)] = addon.db.global.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_10)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(INSCRIPTION, MILLING_RECIPEID_10), tostring(private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_10)]))

	private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_9)] = addon.db.global.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_9)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(INSCRIPTION, MILLING_RECIPEID_9), tostring(private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_9)]))

	private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_8)] = addon.db.global.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_8)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(INSCRIPTION, MILLING_RECIPEID_8), tostring(private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_8)]))

	private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_7)] = addon.db.global.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_7)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(INSCRIPTION, MILLING_RECIPEID_7), tostring(private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_7)]))

	private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_6)] = addon.db.global.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_6)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(INSCRIPTION, MILLING_RECIPEID_6), tostring(private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_6)]))

	private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_5)] = addon.db.global.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_5)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(INSCRIPTION, MILLING_RECIPEID_5), tostring(private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_5)]))

	private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_4)] = addon.db.global.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_4)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(INSCRIPTION, MILLING_RECIPEID_4), tostring(private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_4)]))

	private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_3)] = addon.db.global.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_3)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(INSCRIPTION, MILLING_RECIPEID_3), tostring(private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_3)]))

	private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_2)] = addon.db.global.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_2)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(INSCRIPTION, MILLING_RECIPEID_2), tostring(private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_2)]))

	private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_1)] = addon.db.global.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_1)]
	FluxCapacitor:DebugPrintf("  lastSlotItemID[%s]=%s",
		ToKey(INSCRIPTION, MILLING_RECIPEID_1), tostring(private.lastSlotItemID[ToKey(INSCRIPTION, MILLING_RECIPEID_1)]))

	FluxCapacitor:HookProfessionsFrame("Login")

	FluxCapacitor:RegisterEvent("ADDON_LOADED", "OnAddonLoaded")
	FluxCapacitor:RegisterEvent("TRADE_SKILL_SHOW", FluxCapacitor.ProcessEvent)
	FluxCapacitor:RegisterEvent("TRADE_SKILL_CLOSE", FluxCapacitor.ProcessEvent)
	FluxCapacitor:RegisterEvent("TRADE_SKILL_DATA_SOURCE_CHANGING", FluxCapacitor.ProcessEvent)
	FluxCapacitor:RegisterEvent("TRADE_SKILL_DATA_SOURCE_CHANGED", FluxCapacitor.ProcessEvent)
	FluxCapacitor:RegisterEvent("OPEN_RECIPE_RESPONSE", FluxCapacitor.ProcessEvent)
	FluxCapacitor:RegisterEvent("TRADE_SKILL_LIST_UPDATE", FluxCapacitor.ProcessEvent)
	FluxCapacitor:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED", FluxCapacitor.ProcessEvent)
	FluxCapacitor:RegisterEvent("UNIT_SPELLCAST_FAILED", FluxCapacitor.ProcessEvent)
	FluxCapacitor:RegisterEvent("TRADE_SKILL_ITEM_CRAFTED_RESULT", FluxCapacitor.ProcessEvent)

	-- FluxCapacitor:RegisterEvent("UPDATE_TRADESKILL_CAST_COMPLETE", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("CRAFTING_DETAILS_UPDATE", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("NEW_RECIPE_LEARNED", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("SKILL_LINES_CHANGED", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("TRACKED_RECIPE_UPDATE", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("TRADE_SKILL_CRAFT_BEGIN", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("TRADE_SKILL_CRAFTING_REAGENT_BONUS_TEXT_UPDATED", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("TRADE_SKILL_CURRENCY_REWARD_RESULT", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("TRADE_SKILL_DETAILS_UPDATE", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("TRADE_SKILL_NAME_UPDATE", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("TRADE_SKILL_ITEM_UPDATE", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("TRACKED_RECIPE_UPDATE", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("TRAIT_NODE_CHANGED", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("TRAIT_TREE_CURRENCY_INFO_UPDATED", FluxCapacitor.ProcessEvent)
	--FluxCapacitor:RegisterEvent("UPDATE_TRADESKILL_RECAST", FluxCapacitor.ProcessEvent)
end

function FluxCapacitor:Logout()
	FluxCapacitor:DebugPrintf("Logout()")

	addon.db.global.tsi[private.currentGUID] = FluxCapacitor.tsi
end

------------------------------------------------------------------------------
-- Hooking

function FluxCapacitor:OnAddonLoaded(_, aName)
	if aName == "Blizzard_Professions" then
		FluxCapacitor:HookProfessionsFrame("Delayed")
	end
end

function FluxCapacitor:HookProfessionsFrame(mode)
	FluxCapacitor:DebugPrintf("HookProfessionsFrame(%s)", tostring(mode))

	if not ProfessionsFrame then
		FluxCapacitor:DebugPrintf("ERR~  no ProfessionsFrame!")
		return
	end

	if ProfessionsFrame and ProfessionsFrame.CraftingPage and ProfessionsFrame.CraftingPage.SchematicForm and ProfessionsFrame.CraftingPage.SchematicForm.Init then
		if not FluxCapacitor:IsHooked(ProfessionsFrame.CraftingPage.SchematicForm, "Init") then
			FluxCapacitor:SecureHook(ProfessionsFrame.CraftingPage.SchematicForm, "Init", FluxCapacitor.SchematicFormInit)
			FluxCapacitor:DebugPrintf("hooked ProfessionsFrame.CraftingPage.SchematicForm.Init()")
		else
			FluxCapacitor:DebugPrintf("ERR~ already hooked ProfessionsFrame.CraftingPage.SchematicForm.Init")
		end
	else
		FluxCapacitor:DebugPrintf("ERR~ no ProfessionsFrame.CraftingPage.SchematicForm.Init")
		addon:Printf(format(L["Trade Skill Flux Capacitor v%s is to old for this game version. Try to get an update!"], addon.METADATA.VERSION))
	end

	if ProfessionsFrame and ProfessionsFrame.CraftingPage and ProfessionsFrame.CraftingPage.CreateAllButton and ProfessionsFrame.CraftingPage.CreateAllButton then
		ProfessionsFrame.CraftingPage.CreateAllButton:HookScript("OnClick", function(...)
			FluxCapacitor.CreateAllButtonClick(...)
		end)
		FluxCapacitor:DebugPrintf("hooked ProfessionsFrame.CraftingPage.CreateAllButton OnClick")
	else
		FluxCapacitor:DebugPrintf("ERR~ no ProfessionsFrame.CraftingPage.CreateAllButton")
		addon:Printf(format(L["Trade Skill Flux Capacitor v%s is to old for this game version. Try to get an update!"], addon.METADATA.VERSION))
	end
end

function FluxCapacitor:HookSalvageSlot(mode)
	-- FluxCapacitor:DebugPrintf("HookSalvageSlot(%s)", tostring(mode))

	if not ProfessionsFrame then
		FluxCapacitor:DebugPrintf("HookSalvageSlot(%s)", tostring(mode))
		FluxCapacitor:DebugPrintf("ERR~  no ProfessionsFrame!")
		return
	end

	if ProfessionsFrame and ProfessionsFrame.CraftingPage and ProfessionsFrame.CraftingPage.SchematicForm and ProfessionsFrame.CraftingPage.SchematicForm.Init then
		if ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot and ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot.SetItem then
			if not FluxCapacitor:IsHooked(ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot, "SetItem") then
				FluxCapacitor:DebugPrintf("HookSalvageSlot(%s)", tostring(mode))
				FluxCapacitor:SecureHook(ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot, "SetItem", FluxCapacitor.SchematicFormSalvageSlotSetItem)
			end
		end
	else
		FluxCapacitor:DebugPrintf("ERR~ no ProfessionsFrame.CraftingPage.SchematicForm.Init")
		addon:Printf(format(L["Trade Skill Flux Capacitor v%s is to old for this game version. Try to get an update!"], addon.METADATA.VERSION))
	end
end

------------------------------------------------------------------------------
-- Event Processing

function FluxCapacitor.ProcessEvent(event, arg1, arg2, arg3, arg4, arg5)
	FluxCapacitor:DebugPrintf("OK~Event %s, %s, %s, %s, %s, %s", tostring(event), tostring(arg1), tostring(arg2), tostring(arg3), tostring(arg4), tostring(arg5))

	if not Professions or addon.isZDebug then
		return
	end

	local pBaseInfo = C_TradeSkillUI.GetBaseProfessionInfo()
	local pInfo = Professions.GetProfessionInfo()
	if pBaseInfo then
		FluxCapacitor:DebugPrintf("ERR~  Event:  GetProfessionInfo()/GetBaseProfessionInfo() %s / %s",
			tostring(pInfo.professionID),
			tostring(pBaseInfo.professionID)
			)
	else
		FluxCapacitor:DebugPrintf("ERR~  Event:  GetBaseProfessionInfo() is nil")
	end

	if event == "TRADE_SKILL_SHOW" then
		FluxCapacitor:DebugPrintf("----------------------------------------------------------")

		private.fluxSpeed = (tonumber(addon.db.global.fluxSpeed) / 10) or 0.4
		FluxCapacitor:DebugPrintf("  fluxSpeed=%s", tostring(private.fluxSpeed))

		private.currentProfessionID = nil
		private.currentRecipeID = nil
		private.currentName = nil
		private.currentLearned = nil
		private.doOp = nil
		private.inCasting = nil
		private.createAll = nil
		FluxCapacitor:DebugPrintf("  curProfessionID = %s", tostring(private.currentProfessionID))
		return
	end

	if event == "TRADE_SKILL_CLOSE" then
		private.currentProfessionID = nil
		private.currentRecipeID = nil
		private.currentName = nil
		private.currentLearned = nil
		private.doOp = nil
		private.inCasting = nil
		private.createAll = nil
		FluxCapacitor:DebugPrintf("  curProfessionID = %s", tostring(private.currentProfessionID))
		return
	end

	if event == "TRADE_SKILL_DATA_SOURCE_CHANGING" then
		private.currentProfessionID = nil
		private.currentRecipeID = nil
		private.currentName = nil
		private.currentLearned = nil
		private.doOp = nil
		private.inCasting = nil
		FluxCapacitor:DebugPrintf("  curProfessionID = %s", tostring(private.currentProfessionID))
		return
	end

	if event == "TRADE_SKILL_DATA_SOURCE_CHANGED" then
		private.doOp = true
		FluxCapacitor.Jump()
		return
	end

	if event == "TRADE_SKILL_ITEM_CRAFTED_RESULT" then
		if private.inCasting then
			if private.inCasting > 0 then
				private.inCasting = private.inCasting - 1
				FluxCapacitor:DebugPrintf("  inCasting: %s left", tostring(private.inCasting))
			end
		end
	end

	if event == "UNIT_SPELLCAST_INTERRUPTED" then
		if private.inCasting then
			FluxCapacitor:DebugPrintf("  inCasting: set to nil --> SalvageItem()")
			private.inCasting = nil
			-- Fill the salvage slot again.
			local recipeInfo = {}
			recipeInfo.recipeID = private.currentRecipeID
			if ProfessionsFrame and ProfessionsFrame.CraftingPage and ProfessionsFrame.CraftingPage.SchematicForm then
				FluxCapacitor:SalvageItem(ProfessionsFrame.CraftingPage.SchematicForm, recipeInfo, ToKey(private.currentProfessionID, recipeInfo.recipeID))
			end
		end
	end

	if event == "OPEN_RECIPE_RESPONSE" then
		FluxCapacitor:DebugPrintf("  curProfessionID = %s", tostring(private.currentProfessionID))
		return
	end

	if event == "TRADE_SKILL_LIST_UPDATE" then
		FluxCapacitor:DebugPrintf("  curProfessionID = %s", tostring(private.currentProfessionID))
		return
	end
end

function FluxCapacitor.Jump(doit)
	FluxCapacitor:DebugPrintf("Jump(%s)", tostring(doit))

	-- so, we jump, right?
	-- find out where we are
	local pInfo = C_TradeSkillUI.GetBaseProfessionInfo()
	if pInfo and pInfo.professionID then
		private.currentProfessionID = pInfo.professionID
	end
	FluxCapacitor:DebugPrintf("  curProfessionID = %s", tostring(private.currentProfessionID))

	if not private.currentProfessionID then
		FluxCapacitor:DebugPrintf("ERR~  no currentProfessionID!")
		return
	end

	-- With 10.0.5 a recipe jump may not needed in all cases,
	--  - if the recipe is not from Dragon Flight and playerlevel > 60
	--  - if it was already displayed when the windows was closed
	--  - the previouse window was the same profession
	--  - and the previous profession window was not changed
	--  - if the moon is on right phase.
	-- >> not reliable, too many conditions, so we always jump again.

	--[[
	if ProfessionsFrame and ProfessionsFrame.professionInfo and ProfessionsFrame.professionInfo.professionID then
		FluxCapacitor:DebugPrintf("  ProfessionsFrame.professionInfo.professionID = %s", tostring(ProfessionsFrame.professionInfo.professionID))
		if tonumber(ProfessionsFrame.professionInfo.professionID) and tonumber(ProfessionsFrame.professionInfo.professionID) < 2800 then
			local level = UnitLevel("player")
			if level and tonumber(level) and tonumber(level) < 60 then
				FluxCapacitor:DebugPrintf("ERR~  do jump char level %s", tostring(level))
			else
				FluxCapacitor:DebugPrintf("ERR~  no jump on profession %s < DF!", tostring(ProfessionsFrame.professionInfo.professionID))
				return
			end
		end
	end
	]]

	-- get the saved recipeID
	local jumpProfessionID = private.currentProfessionID
	FluxCapacitor.tsi[jumpProfessionID] = FluxCapacitor.tsi[jumpProfessionID] or {}
	local jumpRecipeID = FluxCapacitor.tsi[jumpProfessionID].recipeID
	local jumpName = FluxCapacitor.tsi[jumpProfessionID].name

	-- nothing to do if nothing was saved
	if not jumpRecipeID then
		FluxCapacitor:DebugPrintf("ERR~  currentRecipeID is nil!")
		return
	end

	-- because of the "fatty" profession window and the sluggish UI response, directly
	-- calling C_TradeSkillUI.OpenRecipe() isn't possible, so we set several timers

	-- extra check for not responding UI
	private.extraTry = true

	FluxCapacitor:DebugPrintf("  setting up timer 1/2")
	FluxCapacitor:DebugPrintf(L["|cfffed100Selecting|r %s"],
			tostring(jumpName) .. " (ID " ..
			tostring(jumpRecipeID) .. ")")
	if not private.jumpsEnabled then
		FluxCapacitor:DebugPrintf("<< (Action disabled!) Jump()")
		return
	end

	if addon.db.global.showRecipeSelect then
		addon:Printf(L["|cfffed100Selecting|r %s"],
			tostring(jumpName) .. " (ID " ..
			tostring(jumpRecipeID) .. ")")
	end

	-- Timer 1 for OpenRecipe
	C_Timer.After(private.fluxSpeed + private.fluxSpeed, function()
		FluxCapacitor:DebugTPrintf(2, "1. Timer for OpenRecipe(%s)", tostring(jumpRecipeID))

		if not private.doOp then
			FluxCapacitor:DebugTPrintf(2, "ERR~  noOp!")
			return
		end

		-- have to check, if we still clear
		if jumpProfessionID ~= private.currentProfessionID then
			FluxCapacitor:DebugTPrintf(2, "ERR~  currentProfessionID = %s changed!", tostring(private.currentProfessionID))
			return
		end

		if jumpRecipeID == private.currentRecipeID then
			if doit then
				FluxCapacitor:DebugTPrintf(2, "WARN~  doit!")
			else
				FluxCapacitor:DebugTPrintf(2, "WARN~  already there!")
				return
			end
		end

		FluxCapacitor:DebugTPrintf(2,"WARN~  --> OpenRecipe(%s)", tostring(jumpRecipeID))
		C_TradeSkillUI.OpenRecipe(jumpRecipeID)

		-- Timer 2 for OpenRecipe
		if private.extraTry then
			C_Timer.After(private.fluxSpeed + private.fluxSpeed, function()
				FluxCapacitor:DebugTPrintf(3, "2. Timer for OpenRecipe(%s)", tostring(jumpRecipeID))

				if not private.doOp then
					FluxCapacitor:DebugTPrintf(3, "ERR~  noOp!")
					return
				end

				-- have to check, if we still clear
				if jumpProfessionID ~= private.currentProfessionID then
					FluxCapacitor:DebugTPrintf(3, "ERR~  currentProfessionID = %s changed!", tostring(private.currentProfessionID))
					return
				end

				if jumpRecipeID == private.currentRecipeID then
					FluxCapacitor:DebugTPrintf(3, "WARN~  already there!")
					return
				end

				FluxCapacitor:DebugTPrintf(3,"WARN~  --> OpenRecipe(%s)", tostring(jumpRecipeID))
				C_TradeSkillUI.OpenRecipe(jumpRecipeID)
			end)
		end
	end)
	FluxCapacitor:DebugPrintf("<< Jump()")
end

function FluxCapacitor:RecipeIDDoesSalvageItem(recipeID)
	if recipeID and (
		recipeID == UNRAVELLING_RECIPEID_10 or
		recipeID == PROSPECTING_RECIPEID_10 or
		recipeID == PROSPECTING_RECIPEID_10b or
		recipeID == PROSPECTING_RECIPEID_9 or
		recipeID == PROSPECTING_RECIPEID_8 or
		recipeID == PROSPECTING_RECIPEID_7 or
		recipeID == PROSPECTING_RECIPEID_5 or
		recipeID == PROSPECTING_RECIPEID_4 or
		recipeID == PROSPECTING_RECIPEID_3 or
		recipeID == PROSPECTING_RECIPEID_2 or
		recipeID == PROSPECTING_RECIPEID_1 or
		recipeID == MILLING_RECIPEID_10 or
		recipeID == MILLING_RECIPEID_9 or
		recipeID == MILLING_RECIPEID_8 or
		recipeID == MILLING_RECIPEID_7 or
		recipeID == MILLING_RECIPEID_6 or
		recipeID == MILLING_RECIPEID_5 or
		recipeID == MILLING_RECIPEID_4 or
		recipeID == MILLING_RECIPEID_3 or
		recipeID == MILLING_RECIPEID_2 or
		recipeID == MILLING_RECIPEID_1) then
		return true
	end
end

function FluxCapacitor.SchematicFormInit(frame, recipeInfo)
	if recipeInfo then
		FluxCapacitor:DebugPrintf("OK~>>>SchematicFormInit(%s) #%s: %s, learned=%s",
			tostring(recipeInfo),
			tostring(recipeInfo.recipeID),
			tostring(recipeInfo.name),
			tostring(recipeInfo.learned)
			)
		-- FluxCapacitor:DumpTable(recipeInfo)
	else
		FluxCapacitor:DebugPrintf("ERR~SchematicFormInit(%s)", tostring(recipeInfo))
		FluxCapacitor:DebugPrintf("<<<SchematicFormInit()")
		return
	end

	-- ProfessionsFrame.CraftingPage.SchematicForm.Init() is called multiple times when opening a recipe.
	-- Also as a result of our jump, so we're only interested in saving a new recipe if the user
	-- explicitly navigated to another recipe.
	-- We ensure this by checking the caller through FluxCapacitor:IsInSelect().

	-- remember recipe data
	if recipeInfo then
		private.currentRecipeID = recipeInfo.recipeID
		private.currentName = recipeInfo.name
		private.currentLearned = recipeInfo.learned
	else
		FluxCapacitor:DebugPrintf("ERR~  recipeInfo is nil!")
		FluxCapacitor:DebugPrintf("<<<SchematicFormInit()")
		return
	end

	-- hook ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot.SetItem()
	FluxCapacitor:HookSalvageSlot("SalvageSlot")

	if FluxCapacitor:IsInSelect() then
		-- This recipe ID is selected by the user, we'll save that for later.
		local pInfo = C_TradeSkillUI.GetBaseProfessionInfo()
		if pInfo and pInfo.professionID then
			private.currentProfessionID = pInfo.professionID
		end

		-- reset casting flag
		private.inCasting = nil

		FluxCapacitor:DebugPrintf("WARN~  (saved) curProfessionID = %s, curRecipeID = %s, curName = %s, curLearned = %s",
			tostring(private.currentProfessionID),
			tostring(private.currentRecipeID),
			tostring(private.currentName),
			tostring(private.currentLearned))

		FluxCapacitor.tsi[private.currentProfessionID] = FluxCapacitor.tsi[private.currentProfessionID] or {}
		FluxCapacitor.tsi[private.currentProfessionID].recipeID = private.currentRecipeID
		FluxCapacitor.tsi[private.currentProfessionID].name = private.currentName
		FluxCapacitor.tsi[private.currentProfessionID].learned = private.currentLearned

		-- Now to the second part of this addon: setting the salvage slot to the previous item.
		-- This currently only applies to some recipes.
		if private.currentProfessionID and FluxCapacitor:RecipeIDDoesSalvageItem(recipeInfo.recipeID) then
			if frame.salvageSlot then
				FluxCapacitor:SalvageItem(frame, recipeInfo, ToKey(private.currentProfessionID, recipeInfo.recipeID))
			end
		end
	else
		-- This recipe ID was not explicitly selected by the user, we don't care.
		FluxCapacitor:DebugPrintf("WARN~  curProfessionID = %s, curRecipeID = %s, curName = %s, curLearned = %s",
			tostring(private.currentProfessionID),
			tostring(private.currentRecipeID),
			tostring(private.currentName),
			tostring(private.currentLearned))

		-- BUT:
		-- For placing the item in the salvage slot, we need to check that the default recipe that appears when
		-- opening the window doesn't also contain a salvage slot for which we have saved an item.
		if private.currentProfessionID and FluxCapacitor:RecipeIDDoesSalvageItem(recipeInfo.recipeID) then
			-- But of course we don't do that if we're going to jump to another recipe anyway.
			FluxCapacitor.tsi[private.currentProfessionID] = FluxCapacitor.tsi[private.currentProfessionID] or {}
			if not FluxCapacitor.tsi[private.currentProfessionID].recipeID or FluxCapacitor:RecipeIDDoesSalvageItem(FluxCapacitor.tsi[private.currentProfessionID].recipeID) then
				if frame.salvageSlot then
					FluxCapacitor:SalvageItem(frame, recipeInfo, ToKey(private.currentProfessionID, recipeInfo.recipeID))
				end
			else
				FluxCapacitor:DebugPrintf("ERR~  we don't (yet) care about this salvage slot")
			end
		end
	end
	FluxCapacitor:DebugPrintf("<<<SchematicFormInit()")
end

function FluxCapacitor:SalvageItem(schematicForm, recipeInfo, key)
	FluxCapacitor:DebugPrintf(">>>SalvageItem(%s, %s, %s)", tostring(schematicForm), tostring(recipeInfo.recipeID), tostring(key))

	if not private.unravellingEnabled then
		FluxCapacitor:DebugPrintf("<<< (Action disabled!) SalvageItem()")
		return
	end

	-- If there is more than one salvation possible then there is no need to find items.
	if ProfessionsFrame and ProfessionsFrame.CraftingPage and ProfessionsFrame.CraftingPage.GetCraftableCount then
		local count = ProfessionsFrame.CraftingPage:GetCraftableCount()
		if count and tonumber(count) and tonumber(count) > 0 then
			local leave = true
			local lastSalvageItem = FluxCapacitor:GetSalvageSlotItem()
			if lastSalvageItem and lastSalvageItem.GetStackCount and lastSalvageItem.GetItemID then
				local itemCount = lastSalvageItem:GetStackCount()
				if addon.db.global.minStackSize and itemCount and tonumber(addon.db.global.minStackSize) and tonumber(addon.db.global.minStackSize) >= itemCount then
					FluxCapacitor:DebugPrintf("  %s salvations possible, but maxStackSize is %s", tostring(count), tostring(addon.db.global.minStackSize))
					leave = false
				end
			end
			if leave then
				FluxCapacitor:DebugPrintf("<<< (%s salvations possible!)", tostring(count))
				return
			end
		end
	end

	-- Check for leftover items
	local lastSalvageItem = FluxCapacitor:GetSalvageSlotItem()
	if lastSalvageItem and lastSalvageItem.GetStackCount and lastSalvageItem.GetItemID then
		local count = lastSalvageItem:GetStackCount()
		local itemID = lastSalvageItem:GetItemID()
		FluxCapacitor:DebugPrintf("   (Salvation Slot %s x %s already set!)", tostring(count), tostring(itemID))
		if addon.db.global.minStackSize and count and tonumber(addon.db.global.minStackSize) and tonumber(addon.db.global.minStackSize) >= count then
			FluxCapacitor:DebugPrintf("  %s left over, but maxStackSize is %s", tostring(count), tostring(addon.db.global.minStackSize))
		else
			if count and count > 4 then
				FluxCapacitor:DebugPrintf("<<< ... (%s left)", tostring(count))
				return
			end
		end
		private.inCasting = nil
	end

	-- If currently casting: no Update
	if private.inCasting and private.inCasting > 0 then
		FluxCapacitor:DebugPrintf("<<< ... in Casting (%s left)", tostring(private.inCasting))
		return
	end

	-- The wanted item private.lastSlotItemID[key] was selected by

	-- a) a previously user-selected item during the current session for that salvage slot
	-- private.lastSlotItemID[key] set by FluxCapacitor.SchematicFormSalvageSlotSetItem()

	-- b) a previously user-selected item from a previous session for that salvage slot
	-- private.lastSlotItemID[key] set by FluxCapacitor:Login()

	-- So how do we do that?
	-- We need to create an Item mixin instance for private.lastSlotItemID[key] and call SetItem() on the salvageSlot

	local salvageItem

	-- We need the list of items that fit in the salvageSlot.
	-- Test: /dump C_TradeSkillUI.GetSalvagableItemIDs(376562)
	-- We trigger this here, but only once in this session.

	private.triggered = private.triggered or {}
	private.salvageableItemIDs = private.salvageableItemIDs or {}

	if not private.triggered[key] or not private.salvageableItemIDs[key] or #private.salvageableItemIDs[key] == 0 then
		FluxCapacitor:DebugPrintf("WARN~<<<  no data on salvageable items currently presents --> C_TradeSkillUI.GetSalvagableItemIDs(%s)", tostring(recipeInfo.recipeID))
		private.triggered[key] = true
		private.salvageableItemIDs[key] = C_TradeSkillUI.GetSalvagableItemIDs(recipeInfo.recipeID)
		-- This needs some time, see you later!
		C_Timer.After(0.2, function()
			FluxCapacitor:SalvageItem(schematicForm, recipeInfo, key)
			end)
		return
	else
		if private.salvageableItemIDs[key] and #private.salvageableItemIDs[key] > 0 then
			FluxCapacitor:DebugPrintf("  data on %s salvageable items presents", tostring(#private.salvageableItemIDs[key]))
		end
	end

	-- We should now have valid data on salvageable items.
	if not private.salvageableItemIDs[key] and not #private.salvageableItemIDs[key] then
		FluxCapacitor:DebugPrintf("ERR~<<<  no data on salvageable items presents after delay!")
		return
	end

	-- We should now get the amount stacks of CraftingTargetItem data.
	-- Test: /dump C_TradeSkillUI.GetCraftingTargetItems({193050})
	-- Test: /dump C_TradeSkillUI.GetCraftingTargetItems(C_TradeSkillUI.GetSalvagableItemIDs(376562))
	local targetItems = C_TradeSkillUI.GetCraftingTargetItems(private.salvageableItemIDs[key])
	if not targetItems or #targetItems == 0 then
		FluxCapacitor:DebugPrintf("ERR~<<<  no CraftingTargetItem on any salvageable items currently presents")
		return
	else
		if targetItems and #targetItems > 0 then
			FluxCapacitor:DebugPrintf("  data for %s stacks of CraftingTargetItems present", tostring(#targetItems))
		end
	end

	-- We should now create an Item mixin instance.
	local salvageItemQuantity
	local salvageItemLink
	local salvageItemGUID
	for _, targetItem in ipairs(targetItems) do
		FluxCapacitor:DebugPrintf("  %s x %s (%s) is %s",
			tostring(targetItem.quantity), tostring(targetItem.itemID),
			tostring(targetItem.hyperlink), tostring(targetItem.itemGUID))

		-- There's quite a bit of room for a later LUA error, as we might be picking an item that the client doesn't
		-- currently have data from.
		-- It is being discussed whether a solution directly calls GetItemInfo(targetItem.itemID) to trigger the receipt
		-- of this information. Maybe not neccessary because of the Item:CreateFromItemGUID() call.

		if not salvageItem and targetItem.itemID == private.lastSlotItemID[key] and targetItem.quantity >= 5 then
			-- On some client builds salvage only worked with items in bags, not ín the bank or in the reagency bank slot.
			-- We need to check this in a later addon version. Maybe we can create an option to salvage items only in bags.

			if addon.db.global.minStackSize and tonumber(addon.db.global.minStackSize) and tonumber(addon.db.global.minStackSize) >= targetItem.quantity then
				FluxCapacitor:DebugPrintf("  don't select stack with %s items, while minStackSize is %s",
					tostring(targetItem.quantity), tostring(addon.db.global.minStackSize))
			else
				local item = Item:CreateFromItemGUID(targetItem.itemGUID)
				salvageItem = item
				salvageItemQuantity = targetItem.quantity
				salvageItemLink = salvageItem:GetItemLink() -- targetItem.hyperlink contains invalid data
				salvageItemGUID = targetItem.itemGUID
			end
		end
	end

	-- we should now have an salvageItem
	if not salvageItem then
		-- addon:Printf(L["... no items available!"])
		FluxCapacitor:DebugPrintf("ERR~<<<" .. L["... no items available!"])
		return
	end

	-- With 10.0.5 the salvation slot is empty after the cast, so check against schematicForm.transaction:GetAllocationItemGUID()
	-- doesn't work anymore.
	-- local currentItemGUID = schematicForm.transaction:GetAllocationItemGUID()
	-- FluxCapacitor:DebugPrintf("  current allocation: %s", tostring(currentItemGUID))

	if FluxCapacitor:GetSalvageSlotItemGUID() and FluxCapacitor:GetSalvageSlotItemGUID() == salvageItemGUID then
		FluxCapacitor:DebugPrintf("WARN~<<<  item already set")

		-- We should probably invoke garbage collection on the mess we created here with faster salvaging speed.
		-- As we don't call SalvageItem() on CreateAll anymore, should be fine now.
		return
	end

	-- We set the item and using a timer for this to allow the client to receive item data in the meantime.
	local timerSec = 1.5
	FluxCapacitor:DebugPrintf("  --> SetSalvageAllocation()")
	schematicForm.transaction:SetSalvageAllocation(salvageItem)
	private.currentItemGUID = salvageItemGUID

	-- If we have item data already, use a shorter timer.
	local itemName = salvageItem:GetItemName()
	local errStr = "ERR~"
	if itemName then
		timerSec = 1
		errStr = ""
	end

	FluxCapacitor:DebugPrintf(errStr .. "  --> Starting Timer (%s s) for %s: %s)", tostring(timerSec), tostring(private.lastSlotItemID[key]), tostring(itemName))

	C_Timer.After(timerSec, function()
		if FluxCapacitor:GetSalvageSlotItemGUID() and FluxCapacitor:GetSalvageSlotItemGUID() == salvageItemGUID then
			FluxCapacitor:DebugTPrintf(5,"WARN~  in Timer: item already set")
			return
		end

		if schematicForm and schematicForm.salvageSlot and schematicForm.salvageSlot.SetItem then
			local itemName2 = salvageItem:GetItemName()
			local itemLink2 = salvageItem:GetItemLink()
			local errStr2 = "ERR~"
			if itemName2 then
				errStr2 = ""
			end

			-- If item data not already received from server there will be likely an error in UpdateAllocationText() from
			-- file Blizzard_ProfessionsRecipeSalvageSlot.lua.
			-- We proceed safely here and only set the item if data is available and otherwise abort. In the worst case
			-- the user has to manually select an item for this slot again. The UI handling this will take care of that
			-- item data is available for later.

			if itemName2 then
				FluxCapacitor:DebugTPrintf(5,format(L["Select %s (%s) to salvage (stack of %s)"],
					tostring(private.lastSlotItemID[key]), tostring(salvageItemLink), tostring(salvageItemQuantity)))

				-- We now inform the user.
				addon:Printf(format(L["Select %s (%s) to salvage (stack of %s)"],
					tostring(private.lastSlotItemID[key]), tostring(itemLink2), tostring(salvageItemQuantity)))

				FluxCapacitor:DebugTPrintf(5,errStr2 .. "  --> SetItem() / TriggerEvent() for %s: %s", tostring(private.lastSlotItemID[key]), tostring(itemName2))
				schematicForm.salvageSlot:SetItem(salvageItem)
				schematicForm:TriggerEvent(ProfessionsRecipeSchematicFormMixin.Event.AllocationsModified)

				if addon.testMode and private.createAll then
					addon:Printf(L["Close Profession Windows to stop..."])
					ProfessionsFrame.CraftingPage.CreateAllButton:Click()
				end
			else
				FluxCapacitor:DebugTPrintf(5,errStr2 .. "  do not --> SetItem() / TriggerEvent() for %s: %s", tostring(private.lastSlotItemID[key]), tostring(itemName2))
			end
		end
	end)
	FluxCapacitor:DebugPrintf("<<<SalvageItem()")
end

function FluxCapacitor:GetSalvageSlotItemGUID()
	if ProfessionsFrame and ProfessionsFrame.CraftingPage and ProfessionsFrame.CraftingPage.SchematicForm
		and ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot and ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot.allocationItem
		and ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot.allocationItem.itemGUID then
		return ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot.allocationItem.itemGUID
	end
end

function FluxCapacitor:GetSalvageSlotItem()
	if ProfessionsFrame and ProfessionsFrame.CraftingPage and ProfessionsFrame.CraftingPage.SchematicForm
		and ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot and ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot.allocationItem
		and ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot.allocationItem.GetStackCount then
		return ProfessionsFrame.CraftingPage.SchematicForm.salvageSlot.allocationItem
	end
end

function FluxCapacitor.SchematicFormSalvageSlotSetItem(f, item)
	if item then
		local itemID = item:GetItemID()
		-- local itemLink = item:GetItemLink()

		if private.currentProfessionID and private.currentRecipeID then
			local key = ToKey(private.currentProfessionID, private.currentRecipeID)
			-- save the user selected item
			private.lastSlotItemID[key] = private.lastSlotItemID[key] or {}
			private.lastSlotItemID[key] = itemID

			-- save the user selected item for next reload
			addon.db.global.lastSlotItemID[key] = addon.db.global.lastSlotItemID[key] or {}
			addon.db.global.lastSlotItemID[key] = itemID

			if addon.testMode and IsAltKeyDown() then
				private.createAll = true
				addon:Printf(L["Close Profession Windows to stop..."])
				ProfessionsFrame.CraftingPage.CreateAllButton:Click()
			end

			FluxCapacitor:DebugPrintf("OK~SchematicFormSalvageSlotSetItem(%s, %s): key %s professionID %s: itemID %s",
				tostring(f),
				tostring(item),
				tostring(key),
				tostring(private.currentProfessionID),
				tostring(itemID))
		end
	else
		FluxCapacitor:DebugPrintf("ERR~SchematicFormSalvageSlotSetItem(%s, %s)",
			tostring(f),
			tostring(item))
		return
	end
end

function FluxCapacitor.CreateAllButtonClick(a, b, c, d)
	FluxCapacitor:DebugPrintf("CreateAllButtonClick(%s, %s, %s, %s)",
		tostring(a),
		tostring(b),
		tostring(c),
		tostring(d))

	-- If there is more than one salvation possible then there is no need to find items.
	if ProfessionsFrame and ProfessionsFrame.CraftingPage and ProfessionsFrame.CraftingPage.GetCraftableCount then
		local count = ProfessionsFrame.CraftingPage:GetCraftableCount()
		if count and tonumber(count) and tonumber(count) > 0 then
			FluxCapacitor:DebugPrintf("  %ss salvations possible)", tostring(count))
			private.inCasting = count
			private.wantTestMode = 0
		end
	end
end

------------------------------------------------------------------------------
-- Timers

function FluxCapacitor:SecTimer()
	FluxCapacitor:DebugPrintf("SecTimer() inCasting %s testMode %s createAll %s wantTestMode %s",
		tostring(private.inCasting), tostring(addon.testMode), tostring(private.createAll), tostring(private.wantTestMode))
	if private.inCasting and private.inCasting > 0 then
		private.wantTestMode = 0
	else
		if addon.testMode and private.createAll then
			private.wantTestMode = private.wantTestMode or 0
			private.wantTestMode = private.wantTestMode + 1
			if private.wantTestMode > 2 then
				FluxCapacitor:DebugPrintf("  private.wantTestMode %s", tostring(private.wantTestMode))
				ProfessionsFrame.CraftingPage.CreateAllButton:Click()
			end
		end
	end
end

------------------------------------------------------------------------------
-- Utility Functions

function FluxCapacitor:IsInSelect()
	-- FluxCapacitor:DebugPrintf("IsInSelect()")

	--local u = debugstack(4,0,10)
	--FluxCapacitor:DebugPrintf("  Stack=%s", tostring(u))

	local s = debugstack(4,0,2)

	-- select recipe
	local res = string.match(s, "ScrollUtil.lua.*in function `Select'")
	if res then
		res = res:gsub('"]:',', line ')
		FluxCapacitor:DebugPrintf("  IsInSelect(): Result=%s", tostring(res))
	else
		-- select expansion
		res = string.match(s, "UIDropDownMenu.lua.*in function `UIDropDownMenuButton_OnClick'")
		if res then
			res = res:gsub('"]:',', line ')
			FluxCapacitor:DebugPrintf("  IsInSelect(): Result=%s", tostring(res))
		else
			-- reset filter
			res = string.match(s, "Blizzard_Professions.lua.*in function `resetFunction'")
			if res then
				res = res:gsub('"]:',', line ')
				FluxCapacitor:DebugPrintf("  IsInSelect(): Result=%s", tostring(res))
			end
		end
	end

	return res
end

function FluxCapacitor:DumpTable(tab)
	if tab then
		for j,k in pairs(tab) do
			FluxCapacitor:DebugPrintf("  %s = %s", tostring(j), tostring(k))
		end
	end
end

function private.Caller(a)
	local r = a or 4
	local s = strmatch(debugstack(r,1,0), '^(.*): in') or ""
	s = s:gsub("^.string..", " ")
	s = s:gsub('"]', "")
	return s
end

-- EOF
