-----------------------------------------------------------------------------------------------------------------------
--  Title:   CharacterInfoUI                                                                                         --
--  Author:  Zaazu                                                                                                   --
--  Date:    November 2021                                                                                           --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that draws the Export Data window.                                                          --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class CharacterInfoUI : AceConsole, AceEvent
local CharacterInfoUI = BTools:NewModule("CharacterInfoUI", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

---@type Frame
local CharacterInfoPanel

local Locked = false

local OnDragFunction = nil

local function ToggleLocked()
    Locked = not Locked

    if (Locked) then
        CharacterInfoPanel:ClearBackdrop()
        CharacterInfoPanel:EnableMouse(false)
        CharacterInfoPanel.closeBtn:Disable()
        CharacterInfoPanel.lockButton:SetAlpha(0.5)
        CharacterInfoPanel.closeBtn:SetAlpha(0.5)
        CharacterInfoPanel:SetScript("OnDragStart", nil)
        CharacterInfoPanel.anchor["BOTTOMRIGHT"]:Hide()
        CharacterInfoPanel.anchor["TOPLEFT"]:Hide()
        CharacterInfoPanel.lockButton.texture:SetTexture(BTools.Resources.textures.PadlockLocked)
    else
        StdUi:ApplyBackdrop(CharacterInfoPanel, "panel")
        CharacterInfoPanel:EnableMouse(true)
        CharacterInfoPanel.closeBtn:Enable()
        CharacterInfoPanel.lockButton:SetAlpha(1)
        CharacterInfoPanel.closeBtn:SetAlpha(1)
        CharacterInfoPanel:SetScript("OnDragStart", OnDragFunction)
        CharacterInfoPanel.anchor["BOTTOMRIGHT"]:Show()
        CharacterInfoPanel.anchor["TOPLEFT"]:Show()
        CharacterInfoPanel.lockButton.texture:SetTexture(BTools.Resources.textures.PadlockUnlocked)
    end
end

local function DrawWindow()
    CharacterInfoPanel = StdUi:Window(UIParent)
    CharacterInfoPanel:Hide()
    CharacterInfoPanel:HookScript("OnShow", function()
        PlaySound(BTools.Resources.sounds.OpenWindow)
        CharacterInfoDB.enabled = true
    end)
    CharacterInfoPanel:HookScript("OnHide", function()
        PlaySound(BTools.Resources.sounds.CloseWindow)
        CharacterInfoDB.enabled = false
    end)

    StdUi:MakeDraggable(CharacterInfoPanel)
    OnDragFunction = CharacterInfoPanel:GetScript("OnDragStart")

    StdUi:MakeResizable(CharacterInfoPanel, "BOTTOMRIGHT")
    StdUi:MakeResizable(CharacterInfoPanel, "TOPLEFT")

    CharacterInfoPanel:SetResizeBounds(75, 75, 800, 300)

    CharacterInfoPanel:HookScript("OnDragStop", function(self)
        local point, _, relativePoint, xOfs, yOfs = CharacterInfoPanel:GetPoint()

        CharacterInfoDB.windowPosition = {
            point = point,
            relPoint = relativePoint,
            relX = xOfs,
            relY = yOfs
        }
    end)

    CharacterInfoPanel:HookScript("OnSizeChanged", function(self)
        self.charInfo:SetFontSize(self:GetHeight() * 0.30)
        self:SetWidth(self.charInfo:GetUnboundedStringWidth() * 1.1)
        
        CharacterInfoDB.windowSize = {
            width = self:GetWidth(),
            height = self:GetHeight()
        }
    end)

    CharacterInfoPanel:SetScale(BTools:GetScaleNormalized())
    CharacterInfoPanel:SetFrameLevel(2000)

    CharacterInfoPanel:ClearAllPoints()

    if (CharacterInfoDB.windowPosition) then
        CharacterInfoPanel:SetPoint(CharacterInfoDB.windowPosition.point or "TOP",
        UIParent,
        CharacterInfoDB.windowPosition.relPoint,
        CharacterInfoDB.windowPosition.relX,
        CharacterInfoDB.windowPosition.relY)
    else
        CharacterInfoPanel:SetPoint("TOP")
    end

    CharacterInfoPanel.charInfo = StdUi:Label(CharacterInfoPanel,
                                              UnitName("player") .. "\n" .. GetNormalizedRealmName(), 80)
    CharacterInfoPanel.charInfo:SetJustifyH("CENTER");
    StdUi:GlueAcross(CharacterInfoPanel.charInfo, CharacterInfoPanel, 0, -15)

    if(CharacterInfoDB.windowSize) then
        CharacterInfoPanel:SetSize(CharacterInfoDB.windowSize.width, CharacterInfoDB.windowSize.height)
    else
        CharacterInfoPanel:SetSize(CharacterInfoPanel.charInfo:GetUnboundedStringWidth() * 1.1,
        CharacterInfoPanel.charInfo:GetStringHeight())
    end

    CharacterInfoPanel.charInfo:SetFontSize(CharacterInfoPanel:GetHeight() * 0.30)
    CharacterInfoPanel:SetWidth(CharacterInfoPanel.charInfo:GetUnboundedStringWidth() * 1.1)

    CharacterInfoPanel.lockButton = StdUi:SquareButton(CharacterInfoPanel, CharacterInfoPanel.closeBtn:GetWidth(),
                                                       CharacterInfoPanel.closeBtn:GetHeight(), BTools.Resources
                                                           .getFormattedTextureString(
                                                           BTools.Resources.textures.PadlockLocked, 10))
    CharacterInfoPanel.lockButton:HookScript("OnClick", function()
        ToggleLocked()
    end)
    StdUi:GlueLeft(CharacterInfoPanel.lockButton, CharacterInfoPanel.closeBtn, -5, 0);

    CharacterInfoPanel.lockButton.texture = StdUi:Texture(CharacterInfoPanel.lockButton, nil, nil,
                                                          BTools.Resources.textures.PadlockUnlocked)
    StdUi:GlueAcross(CharacterInfoPanel.lockButton.texture, CharacterInfoPanel.lockButton, 2, -2, -2, 2)

    ToggleLocked()
end

local function ShowWindow()
    if (not CharacterInfoPanel) then
        DrawWindow()
    end

    CharacterInfoPanel:Show()
end

function CharacterInfoUI:OnEnable()
    StdUi = BTools:GetStdUiInstance()

    ---@type DatabaseManager
    local DatabaseManager = BTools:GetModule("DatabaseManager")
    CharacterInfoDB = DatabaseManager:GetCharacterInfoWindowSettingsTable()

    if (CharacterInfoDB.enabled) then
        ShowWindow()
    end

    -- Custom Events
    self:RegisterMessage(BTools.AddonEvents.ShowCharacterInfoWindow, ShowWindow)
end
