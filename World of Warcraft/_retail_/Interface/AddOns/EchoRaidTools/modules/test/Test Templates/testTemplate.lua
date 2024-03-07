EchoRaidTools_TestNodeFrameMixin = {}
function EchoRaidTools_TestNodeFrameMixin:TestNodeFrameAdditionalLoad()
    self.AddButton:SetFrameLevel(self.Button:GetFrameLevel()+1)
end
function EchoRaidTools_TestNodeFrameMixin:AdditionalSetup(info)
    self.AddButton:SetScript("OnClick", info.addButtonClick)
    self.AddButton.tooltip = info.addButtonTooltip
    if self.expanded then
        self.AddButton:Show()
    else
        self.AddButton:Hide()
    end
    hooksecurefunc(self, "Toggle", function()
        if self.expanded then
            self.AddButton:Show()
        else
            self.AddButton:Hide()
        end
    end)
end


EchoRaidTools_TestButtonFrameMixin = {}
function EchoRaidTools_TestButtonFrameMixin:TestButtonFrameAdditionalLoad()
    self.selected = false
    self.loaded = true
    self.groupDisabled = false

    self.SelectedTexture:Hide()
    self.NotLoadedTexture:Hide()

    self.EditBox.parent = self
    self.RenameButton.parent = self
    self.CopyButton.parent = self
    self.DeleteButton.parent = self
    self.CheckButton.parent = self
end
function EchoRaidTools_TestButtonFrameMixin:AdditionalSetup(info)
    local checked = info.Getter and type(info.Getter) == "function" and info.Getter() or info.Getter
    self.CheckButton:SetChecked(checked)
    self.CheckButton:SetScript("OnClick", info.Setter)
    self.CheckButton.tooltip = info.CheckButtonTooltip
end

EchoRaidTools_TestTemplate_RenameButtonMixin = {}
function EchoRaidTools_TestTemplate_RenameButtonMixin:OnClick()
    self.parent.ButtonText:Hide()
    self.parent.EditBox:Show()
    self.parent.EditBox:SetText(self.parent:GetName())
    self.parent.EditBox:SetFocus()
end

EchoRaidTools_TestTemplate_EditBoxMixin = {}
function EchoRaidTools_TestTemplate_EditBoxMixin:OnEscapePressed()
    self:ClearFocus()
    self:Hide()
    self.parent.ButtonText:Show()
end
function EchoRaidTools_TestTemplate_EditBoxMixin:OnEnterPressed()
    self.parent:SetName(self:GetText())

    self.parent.EditBox:ClearFocus()
    self.parent.EditBox:Hide()
    self.parent.ButtonText:SetText(self.parent:GetName())
    self.parent.ButtonText:Show()
end
function EchoRaidTools_TestTemplate_EditBoxMixin:OnEditFocusLost()
    self:ClearFocus()
    self:Hide()
    self.parent.ButtonText:Show()
end
