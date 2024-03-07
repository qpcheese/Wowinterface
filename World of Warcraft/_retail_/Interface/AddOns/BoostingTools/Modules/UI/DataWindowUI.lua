-----------------------------------------------------------------------------------------------------------------------
--  Title:   DataWindowUI                                                                                            --
--  Author:  Zaazu                                                                                                   --
--  Date:    November 2021                                                                                           --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that draws the Import/Export Data window.                                                          --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class DataWindowUI : AceConsole, AceEvent
local DataWindowUI = BTools:NewModule("DataWindowUI", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

---@type Frame
local ExportDataWindow

---@type Frame
local ImportDataWindow

local function DrawExportWindow()
    ExportDataWindow = StdUi:Window(UIParent, 800, 600, "Boosting Tools: Export Data")
    ExportDataWindow:Hide()
    ExportDataWindow:HookScript("OnShow", function()
        PlaySound(BTools.Resources.sounds.OpenWindow)
    end)
    ExportDataWindow:HookScript("OnHide", function()
        PlaySound(BTools.Resources.sounds.CloseWindow)
    end)

    ExportDataWindow:SetScale(BTools:GetScaleNormalized())
    ExportDataWindow:SetFrameLevel(50)

    ExportDataWindow:ClearAllPoints()
    ExportDataWindow:SetPoint("CENTER")

    ExportDataWindow.descriptionLabel = StdUi:Label(ExportDataWindow, "Description")
    StdUi:GlueTop(ExportDataWindow.descriptionLabel, ExportDataWindow, 10, -40, "LEFT")

    ExportDataWindow.dataBox = StdUi:MultiLineBox(ExportDataWindow, 0, 0)

    -- HACK: Disable scrolling (invisible text workaround)
    ExportDataWindow.dataBox.editBox:SetScript("OnCursorChanged", function()
    end)
    ExportDataWindow.dataBox.scrollFrame:SetScript("OnMouseDown", function()
    end)
    ExportDataWindow.dataBox.scrollFrame:SetScript("OnVerticalScroll", function()
    end)
    ExportDataWindow.dataBox.scrollFrame.scrollBar:Disable()
    ExportDataWindow.dataBox:SetScrollStep(0)

    ExportDataWindow.dataBox.editBox:HookScript("OnEscapePressed", function(self)
        self:SetAutoFocus(false)
        self:ClearFocus()
    end)
    ExportDataWindow.dataBox.editBox:SetAutoFocus(true)
    StdUi:GlueAcross(ExportDataWindow.dataBox, ExportDataWindow, 10, -60, -10, 48)

    ExportDataWindow.closeButton = StdUi:Button(ExportDataWindow, 150, 28, "Done")
    ExportDataWindow.closeButton:HookScript("OnClick", function()
        ExportDataWindow:Hide()
    end)
    StdUi:GlueBottom(ExportDataWindow.closeButton, ExportDataWindow, 0, 10, "CENTER")

    -- Register to close on escape
    _G["BTOOLS_ExportDataWindow"] = ExportDataWindow
    table.insert(UISpecialFrames, "BTOOLS_ExportDataWindow")
end

local function ShowExportWindow(_, description, data)
    if (not ExportDataWindow) then
        DrawExportWindow()
    end

    ExportDataWindow.descriptionLabel:SetText(description or "")
    ExportDataWindow.dataBox:SetText(data or "")
    ExportDataWindow.dataBox.editBox:SetScript("OnTextChanged", function(self)
        self:SetText(data)
        self:HighlightText()
        self:SetCursorPosition(1)
    end)
    ExportDataWindow.dataBox.editBox:HighlightText()
    ExportDataWindow.dataBox.editBox:SetAutoFocus(true)

    ExportDataWindow:Show()
end

local function DrawImportWindow()
    ImportDataWindow = StdUi:Window(UIParent, 800, 600, "Boosting Tools: Import Data")
    ImportDataWindow:Hide()
    ImportDataWindow:HookScript("OnShow", function()
        PlaySound(BTools.Resources.sounds.OpenWindow)
    end)
    ImportDataWindow:HookScript("OnHide", function()
        PlaySound(BTools.Resources.sounds.CloseWindow)
    end)

    ImportDataWindow:SetScale(BTools:GetScaleNormalized())
    ImportDataWindow:SetFrameLevel(50)

    ImportDataWindow:ClearAllPoints()
    ImportDataWindow:SetPoint("CENTER")

    ImportDataWindow.descriptionLabel = StdUi:Label(ImportDataWindow, "Description")
    StdUi:GlueTop(ImportDataWindow.descriptionLabel, ImportDataWindow, 10, -40, "LEFT")

    ImportDataWindow.dataBox = StdUi:MultiLineBox(ImportDataWindow, 0, 0)
    ImportDataWindow.dataBox.editBox:SetScript("OnTextChanged", function ()
    end)

    -- HACK: Disable scrolling (invisible text workaround)
    ImportDataWindow.dataBox.editBox:SetScript("OnCursorChanged", function()
    end)
    ImportDataWindow.dataBox.scrollFrame:SetScript("OnMouseDown", function()
    end)
    ImportDataWindow.dataBox.scrollFrame:SetScript("OnVerticalScroll", function()
    end)
    ImportDataWindow.dataBox.scrollFrame.scrollBar:Disable()
    ImportDataWindow.dataBox:SetScrollStep(0)

    ImportDataWindow.dataBox.editBox:HookScript("OnEscapePressed", function(self)
        self:SetAutoFocus(false)
        self:ClearFocus()
    end)
    ImportDataWindow.dataBox.editBox:SetAutoFocus(true)
    StdUi:GlueAcross(ImportDataWindow.dataBox, ImportDataWindow, 10, -60, -10, 48)

    ImportDataWindow.closeButton = StdUi:Button(ImportDataWindow, 150, 28, "Done")
    ImportDataWindow.closeButton:HookScript("OnClick", function(self)
        if(self.callback) then
            self.callback(ImportDataWindow.dataBox:GetText())
        end
        ImportDataWindow:Hide()
    end)
    StdUi:GlueBottom(ImportDataWindow.closeButton, ImportDataWindow, 0, 10, "CENTER")

    -- Register to close on escape
    _G["BTOOLS_ImportDataWindow"] = ImportDataWindow
    table.insert(UISpecialFrames, "BTOOLS_ImportDataWindow")
end

local function ShowImportWindow(_, description, callback)
    if (not ImportDataWindow) then
        DrawImportWindow()
    end

    ImportDataWindow.descriptionLabel:SetText(description or "")
    ImportDataWindow.dataBox:SetText("")
    ImportDataWindow.closeButton.callback = callback or nil

    ImportDataWindow:Show()
end

function DataWindowUI:OnEnable()
    StdUi = BTools:GetStdUiInstance()

    -- Custom Events
    self:RegisterMessage(BTools.AddonEvents.ShowExportDataWindow, ShowExportWindow)
    self:RegisterMessage(BTools.AddonEvents.ShowImportDataWindow, ShowImportWindow)
end
