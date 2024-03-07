local _AddonName, _EchoRaidTools = ...

local mixin = {}

function mixin:OnLoad()
    self:SetClampedToScreen(true)
    self:RegisterForDrag("LeftButton")
    self.NineSlice.TopLeftCorner:SetAtlas("UI-Frame-PortraitMetal-CornerTopLeft")
    self.PortraitContainer.portrait:SetTexture("Interface\\AddOns\\EchoRaidTools\\assets\\textures\\ELp4.tga");
    self.PortraitContainer.portrait:SetSize(57,58);
    self.PortraitContainer.portrait:SetPoint("TOPLEFT",2,7);
end

function mixin:OnShow()
    local w = self:GetWidth()
    local h = self:GetHeight()
    local clampingFactor = 0.9
    self:SetClampRectInsets(
        clampingFactor * w, -- Left: positive = moved off-screen
        -clampingFactor * w, -- Right: negative = moved off-screen
        -clampingFactor * h, -- Top: negative = moved off-screen 
        clampingFactor * h -- Bottom: positive = moved off-screen
    )
    self.version:SetText(GetAddOnMetadata(_AddonName,"Version"))
end
function mixin:OnSizeChanged()
    local w = self:GetWidth()
    local h = self:GetHeight()
    local clampingFactor = 0.9
    self:SetClampRectInsets(
        clampingFactor * w, -- Left: positive = moved off-screen
        -clampingFactor * w, -- Right: negative = moved off-screen
        -clampingFactor * h, -- Top: negative = moved off-screen 
        clampingFactor * h -- Bottom: positive = moved off-screen
    )
end


function mixin:OnDragStart()
    self:StartMoving()
end

function mixin:OnDragStop()
    self:StopMovingOrSizing()
end


EchoDialogTemplateMixin = mixin