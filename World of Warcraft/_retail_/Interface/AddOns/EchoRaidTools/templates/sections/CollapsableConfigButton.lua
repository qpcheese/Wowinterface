local _AddonName, _EchoRaidTools = ...

EchoRaidToolsCollapsableConfigButtonMixin = {}
function EchoRaidToolsCollapsableConfigButtonMixin:OnLoad()
    self.Expanded = false
    self.Parent = self:GetParent()
end
function EchoRaidToolsCollapsableConfigButtonMixin:Toggle()
    if self.Expanded then
        self.Parent.ContentPanel:Hide()
        --self.ExpandedIndicator:SetText("+")
        self.OpenArrow:SetRotation(math.rad(0))
        self.OpenArrow:SetDesaturated(true)
        self.OpenArrow:SetAlpha(0.3)
        self.ButtonText:SetTextColor(1, 1, 1)
        self.Expanded = false
        local p, r, rp, x, y = self.Parent.ContentPanel:GetPointByName("TOPLEFT")
        self.Parent.ContentPanel:SetPoint("BOTTOMLEFT", r, rp, x, y)
    else
        self.Parent.ContentPanel:Show()
        --self.ExpandedIndicator:SetText("-")
        self.OpenArrow:SetRotation(math.rad(180))
        self.OpenArrow:SetDesaturated(false)
        self.OpenArrow:SetAlpha(1)
        self.ButtonText:SetTextColor(1, 0.82, 0.1)
        self.Expanded = true
        local p, r, rp, x, y = self.Parent.ContentPanel:GetPointByName("TOPLEFT")
        self.Parent.ContentPanel:SetPoint("BOTTOMLEFT", r, rp, x, -self.contentHeight)
    end
end
function EchoRaidToolsCollapsableConfigButtonMixin:OnClick()
    self:Toggle()
end
function EchoRaidToolsCollapsableConfigButtonMixin:OnEnter()
    self.HLLeft:Show()
    self.HLRight:Show()
    self.HLMiddle:Show()
end
function EchoRaidToolsCollapsableConfigButtonMixin:OnLeave()
    self.HLLeft:Hide()
    self.HLRight:Hide()
    self.HLMiddle:Hide()
end
function EchoRaidToolsCollapsableConfigButtonMixin:IsExpanded()
    return self.Expanded
end

EchoRaidToolsCollapsableConfigMixin = {}
function EchoRaidToolsCollapsableConfigMixin:OnLoad()
end
function EchoRaidToolsCollapsableConfigMixin:SetHidden(bool)
    if bool then
        if self.Button.Expanded then
            self.Button:Toggle()
        end
        --local p, r, rp, x, y = self.Button:GetPointByName("TOPLEFT")
        --self.Button:SetPoint("BOTTOMLEFT", r, rp, x, y)
        --self.Button:Hide()
        local p, r, rp, x, y = self:GetPointByName("TOPLEFT")
        self:SetPoint("BOTTOMLEFT", r, rp, x, y)
        --self.Button:Hide()
        self.IsHidden = true
    else
        --self.Button:Show()
        --self.Button:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, -32)
        self:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, -32)
        self.IsHidden = false
    end
end
function EchoRaidToolsCollapsableConfigMixin:GetHidden()
    return self.IsHidden
end