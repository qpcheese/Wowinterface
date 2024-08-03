------------------------------------------------------------------------------
-- Rematch_TSMPetValues - Add TSM market values to the Rematch pet list
------------------------------------------------------------------------------
-- LDB.lua - Data Broker Plugin
--
-- Author: Expelliarm5s / May 2024 / All Rights Reserved
--
-- Version 1.2.4
------------------------------------------------------------------------------
-- luacheck: ignore 212 globals DLAPI

local addonName, addon = ...
local LDB = addon:NewModule("LDB", "AceConsole-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local LibLDB = LibStub("LibDataBroker-1.1")
local LibQTip = LibStub("LibQTip-1.0")
local private = {}
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Debug Stuff

function LDB:DebugPrintf(...)
	if addon.isDebug then
		local status, res = pcall(format, ...)
		if status then
			addon:DebugLog("LDB~" .. res)
		end
	end
end

------------------------------------------------------------------------------
-- Addon Loading / Player Login/Logout

function LDB:Login()
	LDB:DebugPrintf("Login()")

	private.LDB = LibLDB:NewDataObject(addonName, {
		type = "data source", -- data source
		label = addonName,
		text = LDB:GetLDBText(),
		icon = "Interface\\Icons\\Spell_Magic_PolymorphChicken",
		OnClick = function(_, button)
			LDB:DebugPrintf("OK~Click LDB")
			if button == "RightButton" then
				InterfaceOptionsFrame_OpenToCategory(addon.METADATA.NAME)
			end
		end,
		OnEnter = function(this)
			LDB:DebugPrintf("OK~Enter LDB")
			local tooltip = LibQTip:Acquire(addon)
			tooltip:SmartAnchorTo(this)
			tooltip:SetAutoHideDelay(0.1, this)
			tooltip:EnableMouse(true)
			LDB:Update()
			tooltip:Show()
		end
	})
	addon.db.global[LDB.moduleName] = true
end

function LDB:GetLDBText(status, showAddonName)
	local showName = false or showAddonName

	if showName then
		return addonName .. (status and (": " .. tostring(status)) or "")
	else
		return status and (tostring(status)) or ""
	end
end

function LDB:Update()
	if not LibQTip:IsAcquired(addon) or not private.LDB then
		return
	end

	-- Header
	if addon.isEnabled then
		private.LDB.text = LDB:GetLDBText(L["ON"])
	else
		private.LDB.text = LDB:GetLDBText(L["OFF"])
	end

	-- Tooltip
	local tooltip = LibQTip:Acquire(addon)
	tooltip:Clear()
	tooltip:SetColumnLayout(2,"LEFT", "RIGHT")

	local line = tooltip:AddHeader()
	tooltip:SetCell(line, 1, "|cfffed100" .. addon.METADATA.NAME .. " (" .. addon.METADATA.VERSION .. ")|r", nil, "CENTER", 2)
	line = tooltip:AddLine()
	tooltip:SetCell(line, 1, "")
	tooltip:SetCell(line, 2, "")
	tooltip:AddSeparator()

	line = tooltip:AddLine()
	tooltip:SetCell(line, 1, L["|cfffed100Module:|r"])
	tooltip:SetCell(line, 2, L["|cfffed100Hook:|r"])

	for modle in pairs(addon.modules) do
		if addon[modle].ModuleName then
			line = tooltip:AddLine()
			tooltip:SetCell(line, 1, addon[modle]:ModuleName())
			tooltip:SetCell(line, 2, addon.db.global[modle] and "enabled" or "disabled")
		end
	end

	tooltip:AddSeparator()
	tooltip:AddLine(format("%sRight-Click%s opens configuration", ITEM_QUALITY_COLORS[5].hex, FONT_COLOR_CODE_CLOSE))
end

------------------------------------------------------------------------------
-- Timers

-- function LDB:SecTimer()
-- end

-- EOF
