EchoRaidTools_CooldownsNavigation_NodeFrameMixin = {}
function EchoRaidTools_CooldownsNavigation_NodeFrameMixin:AdditionalLoad()
    self.AddButton:SetFrameLevel(self.Button:GetFrameLevel()+1)
end
function EchoRaidTools_CooldownsNavigation_NodeFrameMixin:AdditionalSetup(info)
    self.AddButton:SetScript("OnClick", info.addButtonClick)
    self.AddButton.tooltip = info.addButtonTooltip
    --[[if self.expanded then
        self.AddButton:Show()
    else
        self.AddButton:Hide()
    end]]
    hooksecurefunc(self, "Toggle", function()
        --[[if self.expanded then
            self.AddButton:Show()
        else
            self.AddButton:Hide()
        end]]
    end)
end


EchoRaidTools_CooldownsNavigationButtonFrameMixin = {}
function EchoRaidTools_CooldownsNavigationButtonFrameMixin:AdditionalLoad()
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

    self.ButtonText:SetPoint("RIGHT", -40, 0)
end
function EchoRaidTools_CooldownsNavigationButtonFrameMixin:AdditionalSetup(info)
    self:SetScript("OnClick", function()
        PlaySound(62538)
        info.clickFunc()
    end)
    if info.UseCheckButton then
        self.CheckButton:Show()
        self.CheckButton:SetChecked(info.CheckButtonGetter())
        self.CheckButton:SetScript("OnClick", function()
            PlaySound(62538)
            info.CheckButtonSetter()
            self.CheckButton:SetChecked(info.CheckButtonGetter())
        end)
        self.CheckButton.tooltip = info.CheckButtonTooltip
    else
        self.CheckButton:Hide()
        self.CheckButton:SetScript("OnClick", nil)
    end
    self.DeleteButton:SetScript("OnClick", function()
        PlaySound(62538)
        info.DeleteFunc()
    end)
    self.CopyButton:SetScript("OnClick", function()
        PlaySound(62538)
        info.CopyFunc()
    end)
    if info.GetSelected and info.GetSelected() then
        self.SelectedTexture:Show()
    else
        self.SelectedTexture:Hide()
    end
    if info.GetLoaded and info.GetLoaded() then
        self.NotLoadedTexture:Hide()
    else
        self.NotLoadedTexture:Show()
    end
    self.GetName = function() return info.NameGetter() end
    self.SetName = function(text) return info.NameSetter(text) end
end

EchoRaidTools_CooldownsNavigationGroupNodeFrameMixin = {}
function EchoRaidTools_CooldownsNavigationGroupNodeFrameMixin:AdditionalLoad()
    self.selected = false
    self.loaded = true
    self.groupDisabled = false

    self.SelectedTexture:Hide()
    self.NotLoadedTexture:Hide()

    local fLevel = self.Button:GetFrameLevel()
    self.EditBox.parent = self
    self.EditBox:SetFrameLevel(fLevel+1)
    self.EditBox:SetAllPoints(self.Button.ButtonText)
    self.RenameButton.parent = self
    self.RenameButton:SetFrameLevel(fLevel+1)
    self.CopyButton.parent = self
    self.CopyButton:SetFrameLevel(fLevel+1)
    self.DeleteButton.parent = self
    self.DeleteButton:SetFrameLevel(fLevel+1)
    self.CheckButton.parent = self
    self.CheckButton:SetFrameLevel(fLevel+1)

    self.Button.ButtonText:SetPoint("RIGHT", -40, 0)

    --self.SelectedMask:SetRotation(math.rad(90))
end
function EchoRaidTools_CooldownsNavigationGroupNodeFrameMixin:AdditionalSetup(info)
    if info.UseCheckButton then
        self.CheckButton:Show()
        self.CheckButton:SetChecked(info.CheckButtonGetter())
        self.CheckButton:SetScript("OnClick", function()
            PlaySound(62538)
            info.CheckButtonSetter()
            self.CheckButton:SetChecked(info.CheckButtonGetter())
        end)
        self.CheckButton.tooltip = info.CheckButtonTooltip
    else
        self.CheckButton:Hide()
        self.CheckButton:SetScript("OnClick", nil)
    end
    self.DeleteButton:SetScript("OnClick", function()
        PlaySound(62538)
        info.DeleteFunc()
    end)
    self.CopyButton:SetScript("OnClick", function()
        PlaySound(62538)
        info.CopyFunc()
    end)
    if info.GetSelected and info.GetSelected() then
        self.SelectedTexture:Show()
    else
        self.SelectedTexture:Hide()
    end
    if info.GetLoaded and info.GetLoaded() then
        self.NotLoadedTexture:Hide()
    else
        self.NotLoadedTexture:Show()
    end
    self.GetName = function() return info.NameGetter() end
    self.SetName = function(text) return info.NameSetter(text) end
    self.Button.tooltip = info.GetTooltip and info.GetTooltip()
end

EchoRaidTools_CooldownsNavigation_RenameButtonMixin = {}
function EchoRaidTools_CooldownsNavigation_RenameButtonMixin:OnClick()
    PlaySound(62538)
    self.parent.Button.ButtonText:Hide()
    self.parent.EditBox:Show()
    self.parent.EditBox:SetText(self.parent:GetName())
    self.parent.EditBox:SetFocus()
end

EchoRaidTools_CooldownsNavigation_EditBoxMixin = {}
function EchoRaidTools_CooldownsNavigation_EditBoxMixin:OnEscapePressed()
    PlaySound(62538)
    self:ClearFocus()
    self:Hide()
    self.parent.Button.ButtonText:Show()
end
function EchoRaidTools_CooldownsNavigation_EditBoxMixin:OnEnterPressed()
    PlaySound(62538)
    self.parent.SetName(self:GetText())
    self.parent.EditBox:ClearFocus()
    self.parent.EditBox:Hide()
    self.parent.Button.ButtonText:SetText(self.parent:GetName())
    self.parent.Button.ButtonText:Show()
end
function EchoRaidTools_CooldownsNavigation_EditBoxMixin:OnEditFocusLost()
    self:ClearFocus()
    self:Hide()
    self.parent.Button.ButtonText:Show()
end

EchoRaidTools_CooldownsNavigationSelectableButtonFrameMixin = {}
function EchoRaidTools_CooldownsNavigationSelectableButtonFrameMixin:AdditionalLoad()
    self.SelectedTexture:Hide()
end
function EchoRaidTools_CooldownsNavigationSelectableButtonFrameMixin:AdditionalSetup(info)
    if info.isSelected and info.isSelected() then
        self.SelectedTexture:Show()
    else
        self.SelectedTexture:Hide()
    end
end
