local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("BuffFrame")
Mixin(module, addonTable.hooks)
local color1
local backdropInfo = {
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tileEdge = true,
    edgeSize = 10,
}
local coords = {0.08, 0.92, 0.08, 0.92}
local auraBorders = {}
local auraTimers = {}
local bordersCreated = nil

function module:OnEnable()
    local dbObj = addon.db.profile["HUD"]["BuffFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if not bordersCreated then
        self:CreateBorders()
    else
        self:Recolor()
    end
    self:HookFunc(C_EditMode, "OnEditModeExit", "UpdateTimerAnchors")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateTimerAnchors")    
    self:UpdateTimerAnchors()
    self:UpdateIconCoords(unpack(coords))
end

function module:OnDisable()
    for _,border in pairs (auraBorders) do 
        border:Hide()
    end
    self:UpdateIconCoords(0, 1, 0, 1)
    self:UpdateTimerAnchors()
    self:DisableHooks()
end

function module:CreateBorders()
    for index,frame in pairs({_G.BuffFrame.AuraContainer:GetChildren()}) do
        local border = CreateFrame("Frame",nil,frame,"BackdropTemplate")
        local icon = frame.Icon
        border:SetPoint("TOPLEFT",icon,"TOPLEFT",-2,2)
        border:SetPoint("BOTTOMRIGHT",icon,"BOTTOMRIGHT",2,-2)
        border:SetBackdrop(backdropInfo)
        border:SetBackdropBorderColor(color1.r,color1.g,color1.b)
        auraBorders[index] = border
        auraTimers[index] = frame.Duration
    end
    bordersCreated = true
end

function module:UpdateTimerAnchors()
    for _,timer in pairs (auraTimers) do 
        local point, relativeTo, relativePoint, xOfs = timer:GetPoint()
        local yOfs = point == "TOP" and -2 or 2
        timer:SetPoint(point, relativeTo, relativePoint, xOfs, yOfs)
    end
end

function module:UpdateIconCoords(left,right,top,bottom)
    for _,border in pairs(auraBorders) do 
        local frame = border:GetParent()
        frame.Icon:SetTexCoord(left,right,top,bottom)
    end   
end

function module:Recolor()
    for _,border in pairs(auraBorders) do 
        border:Show()
        border:SetBackdropBorderColor(color1.r,color1.g,color1.b)
    end
end


