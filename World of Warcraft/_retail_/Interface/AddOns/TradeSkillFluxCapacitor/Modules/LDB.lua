----------------------------------------------------------------------------------------------------
-- TradeSkillFluxCapacitor - Trade Skill Flux Capacitor is what makes navigating the trade skills window possible
----------------------------------------------------------------------------------------------------
-- Modules/LDB.lua - LDB
--
-- Author: Expelliarm5s / June 2024 / All Rights Reserved
--
-- Version 1.21.45
----------------------------------------------------------------------------------------------------
-- luacheck: ignore 212 globals DLAPI

local addonName, addon = ...
local LDB = addon:NewModule("LDB", "AceConsole-3.0")
-- local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local LibLDB = LibStub("LibDataBroker-1.1")
local LibQTip = LibStub("LibQTip-1.0")
local LibDBIcon = LibStub("LibDBIcon-1.0")
local private = {}
------------------------------------------------------------------------------

local GetAddOnMetadata = GetAddOnMetadata
if C_AddOns and C_AddOns.GetAddOnMetadata then
	GetAddOnMetadata = C_AddOns.GetAddOnMetadata
end

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
		icon = "Interface\\Icons\\Spell_Holy_GreaterBlessingofKings",
		OnClick = function(_, button)
			LDB:DebugPrintf("OK~Click LDB")
			if button == "RightButton" then
				if InterfaceOptionsFrame_OpenToCategory then
					InterfaceOptionsFrame_OpenToCategory(GetAddOnMetadata(addonName, "Title"))
					InterfaceOptionsFrame_OpenToCategory(GetAddOnMetadata(addonName, "Title"))
				elseif SettingsPanel and SettingsPanel.OpenToCategory then
					SettingsPanel.OpenToCategory(SettingsPanel, GetAddOnMetadata(addonName, "Title"))
				end
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
	LibDBIcon:Register(addonName, private.LDB, addon.db.global.minimap)
	if not addon.db.global.showMinimapButton then
		C_Timer.After(1, function()	LibDBIcon:Hide(addonName) end)
	end
end

function LDB:GetLDBText(status, showAddonName)
	local showName = true -- or showAddonName

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
	tooltip:AddLine(format("%sRight-Click%s opens addon configuration", ITEM_QUALITY_COLORS[5].hex, FONT_COLOR_CODE_CLOSE))
end

------------------------------------------------------------------------------
-- Timers

-- function LDB:SecTimer()
-- end

-- EOF
