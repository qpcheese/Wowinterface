local _AddonName, _EchoRaidTools = ...

EchoRaidTools_CheckButtonTemplateMixin = {}
function EchoRaidTools_CheckButtonTemplateMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_CheckButtonTemplateMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidTools_CheckButtonTemplateMixin:PreClick()
    PlaySound(84240)
end

EchoRaidToolsConfig_CheckButtonMixin = {}
function EchoRaidToolsConfig_CheckButtonMixin:OnLoad()
    self.Enabled = true
    self.CheckButton.tooltip = self.tooltip
end
function EchoRaidToolsConfig_CheckButtonMixin:Enable()
    self.CheckButton:SetAlpha(1)
    self.TopText:SetTextColor(1, 0.82, 0, 0.7)
    self.CheckButton:Enable()
    self.Enabled = true
end
function EchoRaidToolsConfig_CheckButtonMixin:Disable()
    self.CheckButton:SetAlpha(0.5)
    self.TopText:SetTextColor(0.5,0.5,0.5,0.5)
    self.CheckButton:Disable()
    self.Enabled = false
end
function EchoRaidToolsConfig_CheckButtonMixin:IsEnabled()
    return self.Enabled
end

EchoRaidTools_ModuleEnableCheckButtonMixin = {}
function EchoRaidTools_ModuleEnableCheckButtonMixin:SetColor()
    if self:GetChecked() then
        self.EnableText:SetTextColor(0,1,0,1)
    else
        self.EnableText:SetTextColor(1,0,0,1)
    end
end
function EchoRaidTools_ModuleEnableCheckButtonMixin:OnLoad()
    hooksecurefunc(self, "SetChecked", function() self:SetColor() end)
end

EchoRaidTools_TristateTemplateMixin = {}
function EchoRaidTools_TristateTemplateMixin:OnLoad()
    self.state = nil
    self.OnState:Hide()
    self.OffState:Hide()
    if self.labelText then
        self.Label:SetText(self.labelText)
    end
end
function EchoRaidTools_TristateTemplateMixin:OnClick()
    if self.state == nil then
        self.state = 1
        self.OnState:Show()
        self.OffState:Hide()
    elseif self.state == 1 then
        self.state = 0
        self.OnState:Hide()
        self.OffState:Show()
    elseif self.state == 0 then
        self.state = nil
        self.OnState:Hide()
        self.OffState:Hide()
    end
end
function EchoRaidTools_TristateTemplateMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_TristateTemplateMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end