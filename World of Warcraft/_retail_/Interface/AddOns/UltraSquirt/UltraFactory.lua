local AddonName, AddonTable = ...

-- UltraFactory = AddonTable:NewModule("UltraFactory", "AceConsole-3.0", "AceEvent-3.0", "AceTimer-3.0", "AceHook-3.0")

local USQ = UltraSquirt
-- create this as a module
-- move most of the oninitialise code from UltraSquirt.lua into onenable (that way anything required from here will be available)

-- local UF = UltraFactory

-- CreateUltraFrame("UltraSquirtFrame", "UltraSquirt", {"TOP", "UIParent", "TOP", 0, -225}, 280, 195, USQ.Close)
function USQ:CreateUltraFrame(FrameName, FrameTitleText, DefaultPoint, DefaultWidth, DefaultHeight, CloseFuction)

    local Frame

    -- Frame Setup
    Frame = CreateFrame("Frame", FrameName, UIParent)
    Frame:Hide()

    Frame.DefaultPoint = DefaultPoint
    Frame.DefaultWidth = DefaultWidth
    Frame.DefaultHeight = DefaultHeight

    function Frame:Reset()
        Frame:ClearAllPoints()
        Frame:SetPoint(unpack(Frame.DefaultPoint))
        Frame:SetWidth(DefaultWidth)
        Frame:SetHeight(DefaultHeight)
        -- Frame:SetPoint("TOP", "UIParent", "TOP", 0, -225)
        -- Frame:SetWidth(280)
        -- Frame:SetHeight(195)
        Frame:SetFrameStrata("DIALOG")
        Frame:SetMovable(true)
        Frame:EnableMouse(true)
        Frame:SetClampedToScreen(true)
    end

    Frame:Reset()

    -- movement handlers are set on TitleButton below

    Frame.TitleBG = Frame:CreateTexture(FrameName .. "TitleBG", "BACKGROUND")
    Frame.TitleBG:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Title-Background")
    Frame.TitleBG:SetPoint("TOPLEFT", 9, -6)
    Frame.TitleBG:SetPoint("BOTTOMRIGHT", Frame, "TOPRIGHT", -28, -24)

    Frame.DialogBG = Frame:CreateTexture(FrameName .. "DialogBG", "BACKGROUND")
    Frame.DialogBG:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
    Frame.DialogBG:SetPoint("TOPLEFT", 8, -24)
    Frame.DialogBG:SetPoint("BOTTOMRIGHT", -6, 8)
    Frame.DialogBG:SetColorTexture(0, 0, 0, .75)

    Frame.TopLeft = Frame:CreateTexture(FrameName .. "TopLeft", "BORDER")
    Frame.TopLeft:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    Frame.TopLeft:SetPoint("TOPLEFT")
    Frame.TopLeft:SetWidth(64)
    Frame.TopLeft:SetHeight(64)
    Frame.TopLeft:SetTexCoord(0.501953125, 0.625, 0, 1)

    Frame.TopRight = Frame:CreateTexture(FrameName .. "TopRight", "BORDER")
    Frame.TopRight:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    Frame.TopRight:SetPoint("TOPRIGHT")
    Frame.TopRight:SetWidth(64)
    Frame.TopRight:SetHeight(64)
    Frame.TopRight:SetTexCoord(0.625, 0.75, 0, 1)

    Frame.Top = Frame:CreateTexture(FrameName .. "Top", "BORDER")
    Frame.Top:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    Frame.Top:SetPoint("TOPLEFT", Frame.TopLeft, "TOPRIGHT")
    Frame.Top:SetPoint("TOPRIGHT", Frame.TopRight, "TOPLEFT")
    Frame.Top:SetWidth(0)
    Frame.Top:SetHeight(64)
    Frame.Top:SetTexCoord(0.25, 0.369140625, 0, 1)

    Frame.BottomLeft = Frame:CreateTexture(FrameName .. "BottomLeft", "BORDER")
    Frame.BottomLeft:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    Frame.BottomLeft:SetPoint("BOTTOMLEFT")
    Frame.BottomLeft:SetWidth(64)
    Frame.BottomLeft:SetHeight(64)
    Frame.BottomLeft:SetTexCoord(0.751953125, 0.875, 0, 1)

    Frame.BottomRight = Frame:CreateTexture(FrameName .. "BottomRight", "BORDER")
    Frame.BottomRight:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    Frame.BottomRight:SetPoint("BOTTOMRIGHT")
    Frame.BottomRight:SetWidth(64)
    Frame.BottomRight:SetHeight(64)
    Frame.BottomRight:SetTexCoord(0.875, 1, 0, 1)

    Frame.Bottom = Frame:CreateTexture(FrameName .. "Bottom", "BORDER")
    Frame.Bottom:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    Frame.Bottom:SetPoint("BOTTOMLEFT", Frame.BottomLeft, "BOTTOMRIGHT")
    Frame.Bottom:SetPoint("BOTTOMRIGHT", Frame.BottomRight, "BOTTOMLEFT")
    Frame.Bottom:SetWidth(0)
    Frame.Bottom:SetHeight(64)
    Frame.Bottom:SetTexCoord(0.376953125, 0.498046875, 0, 1)

    Frame.Left = Frame:CreateTexture(FrameName .. "Left", "BORDER")
    Frame.Left:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    Frame.Left:SetPoint("TOPLEFT", Frame.TopLeft, "BOTTOMLEFT")
    Frame.Left:SetPoint("BOTTOMLEFT", Frame.BottomLeft, "TOPLEFT")
    Frame.Left:SetWidth(64)
    Frame.Left:SetHeight(0)
    Frame.Left:SetTexCoord(0.001953125, 0.125, 0, 1)

    Frame.Right = Frame:CreateTexture(FrameName .. "Bottom", "BORDER")
    Frame.Right:SetTexture("Interface\\PaperDollInfoFrame\\UI-GearManager-Border")
    Frame.Right:SetPoint("TOPRIGHT", Frame.TopRight, "BOTTOMRIGHT")
    Frame.Right:SetPoint("BOTTOMRIGHT", Frame.BottomRight, "TOPRIGHT")
    Frame.Right:SetWidth(64)
    Frame.Right:SetHeight(0)
    Frame.Right:SetTexCoord(0.1171875, 0.2421875, 0, 1)

    Frame.CloseButton = CreateFrame("Button", FrameName .. "CloseButton", Frame, "UIPanelCloseButton")
    Frame.CloseButton:SetPoint("TOPRIGHT", 2, 1)
    Frame.CloseButton:SetWidth(32)
    Frame.CloseButton:SetHeight(32)
    Frame.CloseButton:SetScript("OnClick", CloseFuction)

    Frame.TitleButton = CreateFrame("Button", FrameName .. "TitleButton", Frame)
    Frame.TitleButton:SetPoint("TOPLEFT", Frame.TitleBG, "TOPLEFT")
    Frame.TitleButton:SetPoint("BOTTOMRIGHT", Frame.TitleBG, "BOTTOMRIGHT")
    -- Frame.TitleButton:SetPoint("TOPRIGHT", Frame.TitleBG, "TOPRIGHT")
    -- Frame.TitleButton:SetWidth(375)
    -- Frame.TitleButton:SetHeight(16)
    Frame.TitleButton:RegisterForDrag("LeftButton")
    Frame.TitleButton:SetScript("OnDragStart", function(self) local parent = self:GetParent() parent.moving = true parent:StartMoving() end)
    Frame.TitleButton:SetScript("OnDragStop", function(self) local parent = self:GetParent() parent.moving = nil parent:StopMovingOrSizing() end)
    
    Frame.TitleButtonText = Frame.TitleButton:CreateFontString(FrameName .. "TitleButtonText", "OVERLAY", "GameFontNormal")
    Frame.TitleButtonText:SetPoint("TOPLEFT", Frame.TitleButton, "TOPLEFT")
    Frame.TitleButtonText:SetPoint("BOTTOMRIGHT", Frame.TitleButton, "BOTTOMRIGHT")
    -- Frame.TitleButtonText:SetPoint("TOPRIGHT", Frame.TitleButton, "TOPRIGHT")
    -- Frame.TitleButtonText:SetWidth(375)
    -- Frame.TitleButtonText:SetHeight(16)
    Frame.TitleButtonText:SetText(FrameTitleText)

    return Frame
end