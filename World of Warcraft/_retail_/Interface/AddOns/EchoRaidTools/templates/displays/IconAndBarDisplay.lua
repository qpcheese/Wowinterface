local _AddonName, _EchoRaidTools = ...

local LibSharedMedia = LibStub:GetLibrary ("LibSharedMedia-3.0")
local LibCustomGlow = LibStub:GetLibrary("LibCustomGlow-1.0")

EchoIconAndBarBaseTemplateMixin = {}
function EchoIconAndBarBaseTemplateMixin:OnLoad()
    self.IconTexture = self.Icon.IconTexture
    self.UnitNameText = self.TextFrame.UnitNameText
    self.DurationText = self.TextFrame.DurationText
    self.SpellNameText = self.TextFrame.SpellNameText
    self.ChargesText = self.TextFrame.ChargesText
    self.isDisplay = true
    self.StatusBar.Spark:ClearAllPoints()
    local height = self:GetHeight()
    self.StatusBar.Spark:SetPoint("TOP", self.StatusBar.BarTexture, "TOPRIGHT", 0, -floor(height/10))
    self.StatusBar.Spark:SetPoint("BOTTOM", self.StatusBar.BarTexture, "BOTTOMRIGHT", 0, floor(height/10))
end
function EchoIconAndBarBaseTemplateMixin:RegisterElvUI()
    if not OmniCC and ElvUI and ElvUI[1] and ElvUI[1].CooldownEnabled and ElvUI[1].RegisterCooldown and ElvUI[1]:CooldownEnabled() then
        ElvUI[1]:RegisterCooldown(self.Icon.Cooldown, "EchoRaidTools");
    end
end
function EchoIconAndBarBaseTemplateMixin:ShowCooldownNumbers(bool)
    if OmniCC and OmniCC.Cooldown and OmniCC.Cooldown.SetNoCooldownCount then
        OmniCC.Cooldown.SetNoCooldownCount(self.Icon.Cooldown, not bool)
        self.Icon.Cooldown:SetHideCountdownNumbers(true)
    elseif ElvUI and ElvUI[1] and ElvUI[1].CooldownEnabled and ElvUI[1].ToggleCooldown and ElvUI[1]:CooldownEnabled() then
        ElvUI[1]:ToggleCooldown(self.Icon.Cooldown, bool);
        self.Icon.Cooldown:SetHideCountdownNumbers(true)
    else
        self.Icon.Cooldown:SetHideCountdownNumbers(not bool)
    end
end
function EchoIconAndBarBaseTemplateMixin:StartFlash()
    if self:IsShown() then
        self.Flash:Play()
    end
end
function EchoIconAndBarBaseTemplateMixin:StopFlash()
    if self.Flash:IsPlaying() then
        self.Flash:Stop()
    end
end
function EchoIconAndBarBaseTemplateMixin:SetDisplayGlowRegion(region, x, y)
    region = region == "bar" and self.StatusBar or region == "icon" and self.Icon or self
    self.Glow:ClearAllPoints()
    self.Glow:SetPoint("TOPLEFT", region,  0-x, y)
    self.Glow:SetPoint("BOTTOMRIGHT", region, x, 0 - y)
    if self.Glow:IsShown() then
        self:HideGlow()
        self:ShowGlow()
    end
end
function EchoIconAndBarBaseTemplateMixin:ShowGlow()
    LibCustomGlow.PixelGlow_Start(self.Glow)
    self.Glow:Show()
end
function EchoIconAndBarBaseTemplateMixin:HideGlow()
    LibCustomGlow.PixelGlow_Stop(self.Glow)
    self.Glow:Hide()
end
function EchoIconAndBarBaseTemplateMixin:SetTextFont(textType, font, size, style)
    local text = self[textType]
    text:SetFont(font,size,style)
end
function EchoIconAndBarBaseTemplateMixin:SetDisplayTextShadowColor(textType, r,g,b,a)
    self[textType]:SetShadowColor(r,g,b,a)
end
function EchoIconAndBarBaseTemplateMixin:SetDisplayShadowOffsets(textType,x,y)
    self[textType]:SetShadowOffset(x, y)
end
function EchoIconAndBarBaseTemplateMixin:SetTextAnchor(textType, point, frame, relPoint, x, y)
    self[textType]:ClearAllPoints()
    self[textType]:SetPoint(point, frame, relPoint, x, y)
end
function EchoIconAndBarBaseTemplateMixin:SetDisplayBorderRegion(region, x, y)
    region = region == "bar" and self.StatusBar or region == "icon" and self.Icon or self
    self.Border:ClearAllPoints()
    self.Border:SetPoint("TOPLEFT", region,  0-x, y)
    self.Border:SetPoint("BOTTOMRIGHT", region, x, 0 - y)
end
function EchoIconAndBarBaseTemplateMixin:SetUpDisplayBorder(edgeFile, borderSize, r, g, b, a, region, x, y, show)
    local backDrop = {edgeFile = edgeFile, edgeSize = borderSize, bgFile = nil}
    self.Border:SetBackdrop(backDrop)
    self.Border:SetBackdropBorderColor(r,g,b,a)
    self.Border:SetBackdropColor(0,0,0,0)

    self:SetDisplayBorderRegion(region, x, y)

    if show then
        self.Border:Show()
    else
        self.Border:Hide()
    end
end
function EchoIconAndBarBaseTemplateMixin:SetDisplayBarReverse(reverse)
    self.StatusBar:SetFillStyle(reverse and "REVERSE" or "STANDARD")
    local height = self:GetHeight()
    if reverse then
        self.StatusBar.Spark:ClearAllPoints()
        self.StatusBar.Spark:SetPoint("TOP", self.StatusBar.BarTexture, "TOPLEFT", 0, -floor(height/10))
        self.StatusBar.Spark:SetPoint("BOTTOM", self.StatusBar.BarTexture, "BOTTOMLEFT", 0, floor(height/10))
    else
        self.StatusBar.Spark:ClearAllPoints()
        self.StatusBar.Spark:SetPoint("TOP", self.StatusBar.BarTexture, "TOPRIGHT", 0, -floor(height/10))
        self.StatusBar.Spark:SetPoint("BOTTOM", self.StatusBar.BarTexture, "BOTTOMRIGHT", 0, floor(height/10))
    end
end
function EchoIconAndBarBaseTemplateMixin:DisplayShowIcon(bool, side)
    if bool then
        self.Icon:Show()
    else
        self.Icon:Hide()
    end
    self:SetDisplayIconSide(side)
end
function EchoIconAndBarBaseTemplateMixin:SetDisplayIconSide(side)
    if side == "left" then
        self.Icon:ClearAllPoints()
        self.Icon:SetPoint("TOPLEFT")
        self.StatusBar:ClearAllPoints()
        if self.Icon:IsShown() then
            self.StatusBar:SetPoint("LEFT", self.Icon, "RIGHT")
            self.StatusBar:SetPoint("RIGHT", self)
        else
            self.StatusBar:SetPoint("LEFT", self)
            self.StatusBar:SetPoint("RIGHT", self)
        end
    else
        self.Icon:ClearAllPoints()
        self.Icon:SetPoint("TOPRIGHT")
        self.StatusBar:ClearAllPoints()
        if self.Icon:IsShown() then
            self.StatusBar:SetPoint("RIGHT", self.Icon, "LEFT")
            self.StatusBar:SetPoint("LEFT", self)
        else
            self.StatusBar:SetPoint("RIGHT", self)
            self.StatusBar:SetPoint("LEFT", self)
        end
    end
end
local getRemainingTimeString = function(self, expirationTime)
    local t = GetTime()
    if expirationTime > t then
        local remaining = expirationTime - GetTime()
        local mins, secs = floor(remaining/60), floor(remaining % 60)
        if remaining < self.durationThreshold then
            if self.durationDecimals == 0 then
                return secs
            else
                local formatString = format("%%.%df", self.durationDecimals)
                return format(formatString, remaining)
            end
        else
            return mins > 0 and format("%d:%02.0f", mins, secs) or secs
        end
    end
end

function EchoIconAndBarBaseTemplateMixin:durationUpdate()
    if not self:IsShown() then return end
    local expirationTime = self.expirationTime
    local invert = self.StatusBar.invert
    if self.overrideDuration and self.buffExpirationTime then
        expirationTime = self.buffExpirationTime
        invert = not invert
    end
    if self.DurationText:IsShown() then
        local timeString = getRemainingTimeString(self, expirationTime)
        self.DurationText:SetText(timeString)
    end
    if self.StatusBar:IsShown() then
        local value
        if invert then
            local remaining = expirationTime - GetTime()
            value = self.start + remaining
        else
            value = GetTime()
        end

        self.StatusBar:SetValue(value)
    end
end
