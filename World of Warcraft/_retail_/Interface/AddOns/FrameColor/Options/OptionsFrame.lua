local addonName, addonTable = ...
local addon = addonTable.addon

local AceGUI = LibStub("AceGUI-3.0")
local ACD = LibStub("AceConfigDialog-3.0")
local frame = nil

local function addResizeButton()
    local resizeButton = CreateFrame("Button", addonName .. "OptionsResizeButton", frame)
    resizeButton:SetPoint("BOTTOMRIGHT",-1,1)
    resizeButton:SetSize(26, 26)
    resizeButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    resizeButton:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    resizeButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    resizeButton:SetScript("OnMouseDown", function(_, button) 
        if button == "LeftButton" then
            frame:StartSizing("BOTTOMRIGHT")
        end
    end)
    resizeButton:SetScript("OnMouseUp", function(_, button)
        if button == "LeftButton" then
            frame:StopMovingOrSizing("BOTTOMRIGHT")
        end
    end)
end

local function createAceContainer(AceContainer)
    local container = AceGUI:Create(AceContainer)
    container.frame:SetParent(frame)
    container.frame:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -60)
    container.frame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -20, 25)
    container.frame:SetClipsChildren(true)
    container.frame:Show()
    return container
end

function addon:GetOptionsFrame(AceContainer)
    if frame then 
        return frame
    end
    AceContainer = AceContainer and AceContainer or "SimpleGroup"
    frame = CreateFrame("Frame", "FrameColorOptions", UIParent, "PortraitFrameTemplate")
    local r,g,b = PANEL_BACKGROUND_COLOR:GetRGB()
    frame.Bg:SetColorTexture(r,g,b,0.9)
    frame:SetScript("OnEvent", frame.Hide)
    frame:Hide()
    tinsert(UISpecialFrames, frame:GetName())
    frame.title = _G["FrameColorOptionsTitleText"]
    frame.title:SetText(addonName)
    frame:SetFrameStrata("DIALOG")
    frame:SetSize(950,500)
    frame:SetPoint("CENTER", UIparent, "CENTER")
    frame:SetMovable(true)
    frame:SetResizable(true)
    frame:SetUserPlaced(true)
    frame:SetResizeBounds(800,200)
    frame:SetClampedToScreen(true)
    frame:SetClampRectInsets(400, -400, 0, 180)
    frame:RegisterForDrag("LeftButton")
    --classic PortraitFrameTemplate 
    if not frame.TitleContainer then
        frame.TitleContainer = CreateFrame("Frame", nil, frame)
        frame.TitleContainer:SetAllPoints(frame.TitleBg)
    end
    frame.TitleContainer:SetScript("OnMouseDown", function()
        frame:StartMoving()
    end)
    frame.TitleContainer:SetScript("OnMouseUp", function()
        frame:StopMovingOrSizing()
    end)
    FrameColorOptionsPortrait:SetTexture(addonTable.texturePaths.PortraitIcon)
    addResizeButton()
    local container = createAceContainer(AceContainer)
    frame.container = container
    frame:HookScript("OnShow",function()
        frame:RegisterEvent("PLAYER_REGEN_DISABLED")
        ACD:Open("FrameColor_options",container)
    end)
    frame:HookScript("OnHide",function()
        frame:UnregisterEvent("PLAYER_REGEN_DISABLED")
        container:ReleaseChildren()
    end)
    addonTable.optionsFrame = frame
    if self.db.profile.modules["FrameColor_Skin"].enabled then
        self:ReloadModule("FrameColor_Skin")
    end
    return frame
end
