local _AddonName, _EchoRaidTools = ...

EchoRaidTools_ButtonTemplateMixin = {}
function EchoRaidTools_ButtonTemplateMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_ButtonTemplateMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end

EchoRaidToolsConfig_ButtonMixin = {}
function EchoRaidToolsConfig_ButtonMixin:OnLoad()
    self.Enabled = true
end
function EchoRaidToolsConfig_ButtonMixin:Enable()
    self.TopText:SetTextColor(1, 0.82, 0, 0.7)
    self.Button:Enable()
    self.Enabled = true
end
function EchoRaidToolsConfig_ButtonMixin:Disable()
    self.TopText:SetTextColor(1, 0.82, 0, 0.3)
    self.Button:Disable()
    self.Enabled = false
end
function EchoRaidToolsConfig_ButtonMixin:IsEnabled()
    return self.Enabled
end

EchoRaidTools_BasicButtonMixin = {}
function EchoRaidTools_BasicButtonMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_BasicButtonMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end