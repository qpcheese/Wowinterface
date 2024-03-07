-----------------------------------------------------------------------------------------------------------------------
--  Title:   MailMenuPanelUI                                                                                         --
--  Author:  Zaazu                                                                                                   --
--  Date:    November 2021                                                                                           --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that draws the Mail Menu Panel.                                                             --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class MailMenuPanelUI : AceConsole, AceEvent
local MailMenuPanelUI = BTools:NewModule("MailMenuPanelUI", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

---@type DBSettingsMail
local MailSettingsDB = nil

---@type Frame
local MailMenuPanel = nil
---@type Frame
local MailMenuButton = nil

---Draw the Mail Menu Panel
local function DrawMailMenuPanel()
    local windowSizeX = MailFrame:GetWidth() - 10
    local windowSizeY = MailFrame:GetHeight() - 60
    local borderPadding = 10

    -- MailPanel
    MailMenuPanel = StdUi:Panel(MailFrame, windowSizeX, windowSizeY)
    MailMenuPanel:HookScript("OnShow", function()
        PlaySound(BTools.Resources.sounds.OpenWindow)
    end)
    MailMenuPanel:Hide()
    StdUi:GlueBottom(MailMenuPanel, MailFrame, 0, 5, "CENTER")

    -- Title
    MailMenuPanel.titleLabel = StdUi:Header(MailMenuPanel, "Boosting Tools: Mail")
    StdUi:GlueTop(MailMenuPanel.titleLabel, MailMenuPanel, 0, -5, "CENTER")

    -- Checkbox
    MailMenuPanel.logMailCheckbox = StdUi:Checkbox(MailMenuPanel, "Enable Mail Logging")
    MailMenuPanel.logMailCheckbox:SetChecked(MailSettingsDB.logMail)
    MailMenuPanel.logMailCheckbox:HookScript("OnClick", function(self)
        MailSettingsDB.logMail = self:GetChecked()
    end)
    StdUi:GlueBelow(MailMenuPanel.logMailCheckbox, MailMenuPanel.titleLabel, 0, -5, "CENTER")

    -- Mail Log Button
    MailMenuPanel.mailLogButton = StdUi:Button(MailMenuPanel, windowSizeX - (borderPadding * 2), 30, "Show Mail Log")
    MailMenuPanel.mailLogButton:SetScript("OnClick", function()
        MailMenuPanelUI:SendMessage(BTools.AddonEvents.ShowMailLogWindow, MailMenuPanel)
    end)
    StdUi:GlueBelow(MailMenuPanel.mailLogButton, MailMenuPanel.logMailCheckbox, 0, -15, "CENTER")

    MailMenuPanelUI:SendMessage(BTools.AddonEvents.MailMenuPanelOnDraw, MailMenuPanel)
end

---Draw the Mail Menu Panel if not initialised, then show
local function ShowPanel()
    if (not MailMenuPanel) then
        DrawMailMenuPanel()
    end
    MailMenuPanel:Show()
end

---Draw the settings window if not initialised, then show
local function HidePanel()
    if (not MailMenuPanel) then
        return
    end
    MailMenuPanel:Hide()
end

---Draws the Mail Button which attaches to the mail window
local function DrawMailMailMenuButton()
    -- Show Mail Settings button
    MailMenuButton = StdUi:Button(MailFrame, 150, 28, BTools.Resources
                                      .getFormattedTextureString(BTools.Resources.textures.Icon, 16) ..
                                      " Boosting Tools")
    MailMenuButton:HookScript("OnClick", function()
        -- Hack: Deselects any mail tabs that are selected
        PanelTemplates_SetTab(MailFrame, -1)

        MailFrameInset:SetPoint("TOPLEFT", 4, -58)
        ButtonFrameTemplate_HideButtonBar(MailFrame)

        InboxFrame:Hide()
        SendMailFrame:Hide()

        ShowPanel()
    end)
    StdUi:GlueBelow(MailMenuButton, MailFrame, 0, 0, "RIGHT")
end

---When opening the mailbox, draw the Mail Menu button
local function ShowMailMenuButton()
    if (not MailMenuButton) then
        DrawMailMailMenuButton()
    end
end

--- Called when the module is enabled
function MailMenuPanelUI:OnEnable()
    StdUi = BTools:GetStdUiInstance()

    ---@type DatabaseManager
    local DB = BTools:GetModule("DatabaseManager")
    MailSettingsDB = DB:GetMailSettingsTable()

    -- Function Hooks
    -- Hide the panel if another tab is clicked
    hooksecurefunc("MailFrameTab_OnClick", HidePanel)

    -- Blizzard Events
    self:RegisterEvent("MAIL_SHOW", ShowMailMenuButton)
end
