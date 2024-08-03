local _AddonName, _EchoRaidTools = ...

EchoRaidToolsMainConfigPanelMixin = {}
function EchoRaidToolsMainConfigPanelMixin:OnLoad()
    self.BG:SetHeight(GetScreenHeight())
end
function EchoRaidToolsMainConfigPanelMixin:OnShow()
end

EchoRaidToolsMainConfigWindowMixin = {}


EchoRaidToolsConfig_TextOnlyMixin = {}
function EchoRaidToolsConfig_TextOnlyMixin:OnLoad()
    self.Enabled = true
end
function EchoRaidToolsConfig_TextOnlyMixin:OnEnter()
    if self.Enabled and self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidToolsConfig_TextOnlyMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidToolsConfig_TextOnlyMixin:Enable()
    self.Text:SetTextColor(1.0,0.82,0,1)
    self.Enabled = true
end
function EchoRaidToolsConfig_TextOnlyMixin:Disable()
    self.Text:SetTextColor(0.5,0.5,0.5,1)
    self.Enabled = false
end
function EchoRaidToolsConfig_TextOnlyMixin:IsEnabled()
    return self.Enabled
end


EchoRaidToolsConfig_LineTitleMixin = {}
function EchoRaidToolsConfig_LineTitleMixin:OnLoad()
    self.Enabled = true
    self.IsHidden = false
end
--[[function EchoRaidToolsConfig_LineTitleMixin:OnEnter()
    if self.Enabled and self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidToolsConfig_LineTitleMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end]]
function EchoRaidToolsConfig_LineTitleMixin:Enable()
    --self.Text:SetTextColor(1,1,1,1)
    self.Text:SetAlpha(1)
    if self.Info.tooltip then
        self.Info:Show()
    end
    self.Enabled = true
end
function EchoRaidToolsConfig_LineTitleMixin:Disable()
    --self.Text:SetTextColor(0.5,0.5,0.5,1)
    self.Text:SetAlpha(0.5)
    self.Info:Hide()
    self.Enabled = false
end
function EchoRaidToolsConfig_LineTitleMixin:IsEnabled()
    return self.Enabled
end
function EchoRaidToolsConfig_LineTitleMixin:SetHidden(bool)
    if bool then
        local p, r, rp, x, y = self:GetPointByName("TOPLEFT")
        if not p then return end
        self:SetPoint("BOTTOMLEFT", r, rp, x, y)
        self:Hide()
        self.IsHidden = true
    else
        local p1, r1, rp1, x1, y1 = self:GetPointByName("TOPLEFT")
        if not p1 then return end
        self:ClearAllPoints()
        self:SetPoint(p1, r1, rp1, x1, y1)
        --self:ClearPointByName("BOTTOMLEFT")
        self:Show()
        self.IsHidden = false
    end
end

EchoRaidTools_ScrollFrameMixin = {}
function EchoRaidTools_ScrollFrameMixin:OnMouseWheel(value)
    local bar = self.ScrollBar
    value = value > 0 and -80 or 80
    bar:SetValue(bar:GetValue() + value)
    _EchoRaidTools.SelectionPopouts:HandleMouseDown("LeftButton", "ECHO_SCROLL")
end
function EchoRaidTools_ScrollFrameMixin:OnSizeChanged()
    self.ScrollingPanel:ClearAllPoints()
    self.ScrollingPanel:SetPoint("TOPLEFT")
    self.ScrollingPanel:SetWidth(self:GetWidth())
    --self.ScrollBar:SetValue(self.ScrollBar:GetValue())
    local vert = self:GetVerticalScroll()
    self.ScrollBar:SetValue(vert+1)
    self.ScrollBar:SetValue(vert)

    self.ScrollingPanel:SetWidth(self.ScrollingPanel:GetWidth())
end
function EchoRaidTools_ScrollFrameMixin:ScrollFrameIntoView(value, top)
    local total = self:GetVerticalScrollRange()
    local frameTop = value
    if total > 0 then
        self.ScrollBar:SetValue(top - frameTop + (total/2))
    end
end

EchoRaidTools_InfoButtonMixin = {}
function EchoRaidTools_InfoButtonMixin:OnLoad()
    self.Enabled = true
    self.IsHidden = false
end
function EchoRaidTools_InfoButtonMixin:OnEnter()
    if self.Enabled and self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_InfoButtonMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidTools_InfoButtonMixin:Enable()
    self.Enabled = true
end
function EchoRaidTools_InfoButtonMixin:Disable()
    self.Enabled = false
end
function EchoRaidTools_InfoButtonMixin:IsEnabled()
    return self.Enabled
end

EchoRaidToolsConfig_SeparatorMixin = {}
function EchoRaidToolsConfig_SeparatorMixin:OnLoad()
    self.Enabled = true
    self.IsHidden = false
end
function EchoRaidToolsConfig_SeparatorMixin:Enable()
    self.Texture:SetVertexColor(1,1,1,1)
    self.Enabled = true
end
function EchoRaidToolsConfig_SeparatorMixin:Disable()
    self.Texture:SetVertexColor(0.5,0.5,0.5,1)
    self.Enabled = false
end
function EchoRaidToolsConfig_SeparatorMixin:IsEnabled()
    return self.Enabled
end

EchoRaidTools_PopupDialogMixin = {}
