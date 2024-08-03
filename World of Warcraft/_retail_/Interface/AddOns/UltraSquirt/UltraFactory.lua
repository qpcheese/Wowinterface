local AddonName, AddonTable = ...

-- UltraFactory = AddonTable:NewModule("UltraFactory", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0", "AceHook-3.0")

---@class USQ : AceAddon-3.0, AceConsole-3.0, AceEvent-3.0, AceTimer-3.0, AceHook-3.0
local USQ = UltraSquirt
-- create this as a module
-- move most of the oninitialise code from UltraSquirt.lua into onenable (that way anything required from here will be available)

-- local UF = UltraFactory

---@class USQFrameClass : Frame
---@field Reset function
---@field TitleBG Texture
---@field DialogBG Texture
---@field TopLeft Texture
---@field TopRight Texture
---@field Top Texture
---@field BottomLeft Texture
---@field BottomRight Texture
---@field Bottom Texture
---@field Left Texture
---@field Right Texture
---@field CloseButton Button | UIPanelCloseButton
---@field TitleButton Button
---@field TitleButtonText FontString

---@param FrameName any
---@param FrameTitleText any
---@param DefaultPoint any
---@param DefaultWidth any
---@param DefaultHeight any
---@param CloseFuction any
---@return table|USQFrameClass
function USQ:CreateUltraFrame(FrameName, FrameTitleText, DefaultPoint, DefaultWidth, DefaultHeight, CloseFuction)

    local NewFrame

    -- Frame Setup
    NewFrame = CreateFrame("Frame", FrameName, UIParent)
    NewFrame:Hide()

    NewFrame.DefaultPoint = DefaultPoint
    NewFrame.DefaultWidth = DefaultWidth
    NewFrame.DefaultHeight = DefaultHeight

    function NewFrame:Reset()
        NewFrame:ClearAllPoints()
        NewFrame:SetPoint(unpack(NewFrame.DefaultPoint))
        NewFrame:SetWidth(DefaultWidth)
        NewFrame:SetHeight(DefaultHeight)
        NewFrame:SetFrameStrata("DIALOG")
        NewFrame:SetMovable(true)
        NewFrame:EnableMouse(true)
        NewFrame:SetClampedToScreen(true)
    end

    NewFrame:Reset()

    -- movement handlers are set on TitleButton below

    NewFrame.TitleBG = NewFrame:CreateTexture(FrameName .. "TitleBG", "BACKGROUND")
    NewFrame.TitleBG:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Title-Background")
    NewFrame.TitleBG:SetPoint("TOPLEFT", 9, -6)
    NewFrame.TitleBG:SetPoint("BOTTOMRIGHT", NewFrame, "TOPRIGHT", -28, -24)

    
    NewFrame.DialogBG = NewFrame:CreateTexture(FrameName .. "DialogBG", "BACKGROUND")
    NewFrame.DialogBG:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
    NewFrame.DialogBG:SetPoint("TOPLEFT", 8, -24)
    NewFrame.DialogBG:SetPoint("BOTTOMRIGHT", -6, 8)
    NewFrame.DialogBG:SetColorTexture(0, 0, 0, .75)

    
    NewFrame.TopLeft = NewFrame:CreateTexture(FrameName .. "TopLeft", "BORDER")
    NewFrame.TopLeft:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    NewFrame.TopLeft:SetPoint("TOPLEFT")
    NewFrame.TopLeft:SetWidth(64)
    NewFrame.TopLeft:SetHeight(64)
    NewFrame.TopLeft:SetTexCoord(0.501953125, 0.625, 0, 1)

    
    NewFrame.TopRight = NewFrame:CreateTexture(FrameName .. "TopRight", "BORDER")
    NewFrame.TopRight:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    NewFrame.TopRight:SetPoint("TOPRIGHT")
    NewFrame.TopRight:SetWidth(64)
    NewFrame.TopRight:SetHeight(64)
    NewFrame.TopRight:SetTexCoord(0.625, 0.75, 0, 1)

    
    NewFrame.Top = NewFrame:CreateTexture(FrameName .. "Top", "BORDER")
    NewFrame.Top:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    NewFrame.Top:SetPoint("TOPLEFT", NewFrame.TopLeft, "TOPRIGHT")
    NewFrame.Top:SetPoint("TOPRIGHT", NewFrame.TopRight, "TOPLEFT")
    NewFrame.Top:SetWidth(0)
    NewFrame.Top:SetHeight(64)
    NewFrame.Top:SetTexCoord(0.25, 0.369140625, 0, 1)

   
    NewFrame.BottomLeft = NewFrame:CreateTexture(FrameName .. "BottomLeft", "BORDER")
    NewFrame.BottomLeft:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    NewFrame.BottomLeft:SetPoint("BOTTOMLEFT")
    NewFrame.BottomLeft:SetWidth(64)
    NewFrame.BottomLeft:SetHeight(64)
    NewFrame.BottomLeft:SetTexCoord(0.751953125, 0.875, 0, 1)

    
    NewFrame.BottomRight = NewFrame:CreateTexture(FrameName .. "BottomRight", "BORDER")
    NewFrame.BottomRight:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    NewFrame.BottomRight:SetPoint("BOTTOMRIGHT")
    NewFrame.BottomRight:SetWidth(64)
    NewFrame.BottomRight:SetHeight(64)
    NewFrame.BottomRight:SetTexCoord(0.875, 1, 0, 1)

    
    NewFrame.Bottom = NewFrame:CreateTexture(FrameName .. "Bottom", "BORDER")
    NewFrame.Bottom:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    NewFrame.Bottom:SetPoint("BOTTOMLEFT", NewFrame.BottomLeft, "BOTTOMRIGHT")
    NewFrame.Bottom:SetPoint("BOTTOMRIGHT", NewFrame.BottomRight, "BOTTOMLEFT")
    NewFrame.Bottom:SetWidth(0)
    NewFrame.Bottom:SetHeight(64)
    NewFrame.Bottom:SetTexCoord(0.376953125, 0.498046875, 0, 1)

    
    NewFrame.Left = NewFrame:CreateTexture(FrameName .. "Left", "BORDER")
    NewFrame.Left:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    NewFrame.Left:SetPoint("TOPLEFT", NewFrame.TopLeft, "BOTTOMLEFT")
    NewFrame.Left:SetPoint("BOTTOMLEFT", NewFrame.BottomLeft, "TOPLEFT")
    NewFrame.Left:SetWidth(64)
    NewFrame.Left:SetHeight(0)
    NewFrame.Left:SetTexCoord(0.001953125, 0.125, 0, 1)

    
    NewFrame.Right = NewFrame:CreateTexture(FrameName .. "Bottom", "BORDER")
    NewFrame.Right:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    NewFrame.Right:SetPoint("TOPRIGHT", NewFrame.TopRight, "BOTTOMRIGHT")
    NewFrame.Right:SetPoint("BOTTOMRIGHT", NewFrame.BottomRight, "TOPRIGHT")
    NewFrame.Right:SetWidth(64)
    NewFrame.Right:SetHeight(0)
    NewFrame.Right:SetTexCoord(0.1171875, 0.2421875, 0, 1)

    
    NewFrame.CloseButton = CreateFrame("Button", FrameName .. "CloseButton", NewFrame, "UIPanelCloseButton")
    NewFrame.CloseButton:SetPoint("TOPRIGHT", 2, 1)
    NewFrame.CloseButton:SetWidth(32)
    NewFrame.CloseButton:SetHeight(32)
    NewFrame.CloseButton:SetScript("OnClick", CloseFuction)

    
    NewFrame.TitleButton = CreateFrame("Button", FrameName .. "TitleButton", NewFrame)
    NewFrame.TitleButton:SetPoint("TOPLEFT", NewFrame.TitleBG, "TOPLEFT")
    NewFrame.TitleButton:SetPoint("BOTTOMRIGHT", NewFrame.TitleBG, "BOTTOMRIGHT")
    NewFrame.TitleButton:RegisterForDrag("LeftButton")
    NewFrame.TitleButton:SetScript("OnDragStart", function(self) local parent = self:GetParent() parent.moving = true parent:StartMoving() end)
    NewFrame.TitleButton:SetScript("OnDragStop", function(self) local parent = self:GetParent() parent.moving = nil parent:StopMovingOrSizing() end)

    
    NewFrame.TitleButtonText = NewFrame.TitleButton:CreateFontString(FrameName .. "TitleButtonText", "OVERLAY", "GameFontNormal")
    NewFrame.TitleButtonText:SetPoint("TOPLEFT", NewFrame.TitleButton, "TOPLEFT")
    NewFrame.TitleButtonText:SetPoint("BOTTOMRIGHT", NewFrame.TitleButton, "BOTTOMRIGHT")
    NewFrame.TitleButtonText:SetText(FrameTitleText)

    return NewFrame
end