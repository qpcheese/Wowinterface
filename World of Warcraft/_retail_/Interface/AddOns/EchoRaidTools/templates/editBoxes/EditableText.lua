local _AddonName, _EchoRaidTools = ...

EchoRaidToolsConfig_EditableTextMixin = {}
function EchoRaidToolsConfig_EditableTextMixin:OnLoad()
    self.Enabled = true
    self.Button.EditBox = self.EditBox
    self.EditBox.Button = self.Button
    self.Button.parent = self
    self.EditBox.parent = self
end
function EchoRaidToolsConfig_EditableTextMixin:OnEnter()
    if self.Enabled and self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidToolsConfig_EditableTextMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidToolsConfig_EditableTextMixin:Enable()
    self.TopText:SetTextColor(1, 0.82, 0, 0.7)
    self.EditBox:Enable()
    self.Button:Enable()
    self.Enabled = true
end
function EchoRaidToolsConfig_EditableTextMixin:Disable()
    self.TopText:SetTextColor(1, 0.82, 0, 0.3)
    self.EditBox:Disable()
    self.Button:Disable()
    self.Enabled = false
end
function EchoRaidToolsConfig_EditableTextMixin:IsEnabled()
    return self.Enabled
end
function EchoRaidToolsConfig_EditableTextMixin:SetGetter(func)
    self.getter = func
end
function EchoRaidToolsConfig_EditableTextMixin:SetSetter(func)
    self.setter = func
end

EchoRaidTools_EditableTextButtonMixin = {}
function EchoRaidTools_EditableTextButtonMixin:OnClick()
    self.EditBox:SetText(self.parent.getter())
    self:Hide()
    self.EditBox:Show()
    self.EditBox:SetFocus()
end


EchoRaidTools_EditableTextEditboxMixin = {}
function EchoRaidTools_EditableTextEditboxMixin:OnEscapePressed()
    self:Hide()
    self.Button:Show()
end
function EchoRaidTools_EditableTextEditboxMixin:OnEnterPressed()
    local text = self:GetText()
    if text and type(text) == "string" and text ~= "" then
        self.parent.setter(text)
    else
        _EchoRaidTools:SetStatus("That's not a valid name", 5)
    end
    self.Button:SetText(self.parent.getter())
    self:Hide()
    self.Button:Show()
end
function EchoRaidTools_EditableTextEditboxMixin:OnEditFocusLost()
    self:Hide()
    self.Button:Show()
end
