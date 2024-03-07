-----------------------------------------------------------------------------------------------------------------------
--  Title:   SettingsUI                                                                                              --
--  Author:  Zaazu                                                                                                   --
--  Date:    October 2021                                                                                            --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that draws the settings window.                                                             --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class SettingsUI : AceConsole, AceEvent
local SettingsUI = BTools:NewModule("SettingsUI", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

---@type Frame
local SettingsWindow = nil

--- Draws the Settings Window
local function DrawWindow()
    SettingsWindow = StdUi:Window(UIParent, 800, 600, "Boosting Tools: Settings")
    SettingsWindow:Hide()
    SettingsWindow:HookScript("OnShow", function()
        PlaySound(BTools.Resources.sounds.OpenWindow)
        SettingsUI:SendMessage(BTools.AddonEvents.SettingsWindowOnShow)
    end)
    SettingsWindow:HookScript("OnHide", function()
        PlaySound(BTools.Resources.sounds.CloseWindow)
        SettingsUI:SendMessage(BTools.AddonEvents.SettingsWindowOnHide)
    end)

    SettingsWindow:SetScale(BTools:GetScaleNormalized())
    SettingsWindow:SetFrameLevel(10)

    SettingsWindow:ClearAllPoints()
    SettingsWindow:SetPoint("CENTER")

    -- Register to close on escape
    _G["BTOOLS_SettingsWindow"] = SettingsWindow
    table.insert(UISpecialFrames, "BTOOLS_SettingsWindow")
end

--- Draw the settings window if not initialised, then show
local function ShowWindow()
    if (not SettingsWindow) then
        DrawWindow()
    end
    SettingsWindow:Show()
end

--- Called when the module is enabled
function SettingsUI:OnEnable()
    StdUi = BTools:GetStdUiInstance()

    -- Custom Events
    self:RegisterMessage(BTools.AddonEvents.ShowSettingsWindow, ShowWindow)
end
