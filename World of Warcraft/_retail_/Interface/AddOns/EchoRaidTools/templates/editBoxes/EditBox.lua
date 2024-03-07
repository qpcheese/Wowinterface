local _AddonName, _EchoRaidTools = ...

EchoRaidToolsConfig_EditboxTemplateMixin = {}
function EchoRaidToolsConfig_EditboxTemplateMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidToolsConfig_EditboxTemplateMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidToolsConfig_EditboxTemplateMixin:OnLoad()
    self.Disabled = false
end

EchoRaidToolsConfig_EditBoxMixin = {}
function EchoRaidToolsConfig_EditBoxMixin:OnLoad()
    self.Enabled = true
end
function EchoRaidToolsConfig_EditBoxMixin:OnEnter()
    if self.Enabled and self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidToolsConfig_EditBoxMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidToolsConfig_EditBoxMixin:Enable()
    self.TopText:SetTextColor(1, 0.82, 0, 0.7)
    self:SetAlpha(1)
    --self.Button:Enable()
    self.Enabled = true
end
function EchoRaidToolsConfig_EditBoxMixin:Disable()
    self.TopText:SetTextColor(1, 0.82, 0, 0.3)
    self:SetAlpha(0.5)
    --self.Button:Disable()
    self.Enabled = false
end
function EchoRaidToolsConfig_EditBoxMixin:IsEnabled()
    return self.Enabled
end

EchoRaidToolsConfig_ExportBoxMixin = {}
function EchoRaidToolsConfig_ExportBoxMixin:OnLoad()
end
function EchoRaidToolsConfig_ExportBoxMixin:OnHide()
    self:SetText("")
end
function EchoRaidToolsConfig_ExportBoxMixin:OnEscapePressed()
    self:ClearFocus()
end
function EchoRaidToolsConfig_ExportBoxMixin:OnTextChanged()
    if self.string then
        self:SetText(self.string)
        self:Select()
    end
end
function EchoRaidToolsConfig_ExportBoxMixin:OnTextSet()
    self.string = self:GetText()
end
function EchoRaidToolsConfig_ExportBoxMixin:OnEditFocusGained()
    --self:HighlightText()
end
function EchoRaidToolsConfig_ExportBoxMixin:OnEditFocusLost()
    self:ClearHighlightText()
end
function EchoRaidToolsConfig_ExportBoxMixin:OnMouseUp()
    self:Select()
end
function EchoRaidToolsConfig_ExportBoxMixin:Select()
    self:SetFocus()
    self:SetCursorPosition(0)
    self:HighlightText(0, -1)
end

EchoRaidToolsConfig_ImportBoxMixin = {}
function EchoRaidToolsConfig_ImportBoxMixin:OnLoad()
    self.Button:SetScript("OnClick", function()
        if self.onClick then
            local text = self.Editbox:GetText()
            self.onClick(text)
            self.Editbox:SetText("")
        end
    end)
    self.ClearTextButton:SetScript("OnClick", function() self.Editbox:SetText("") end)
end
EchoRaidToolsConfig_ExportBoxEditboxTemplateMixin = {}
function EchoRaidToolsConfig_ExportBoxEditboxTemplateMixin:OnEscapePressed()
end
function EchoRaidToolsConfig_ExportBoxEditboxTemplateMixin:OnTextChanged()
    self:SetCursorPosition(0)
end
function EchoRaidToolsConfig_ExportBoxEditboxTemplateMixin:OnEditFocusGained()
end
function EchoRaidToolsConfig_ExportBoxEditboxTemplateMixin:OnEditFocusLost()
end
function EchoRaidToolsConfig_ExportBoxEditboxTemplateMixin:OnMouseUp()
end