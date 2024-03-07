EchoRaidTools_MainMenu_MiniButtonMixin = {}
function EchoRaidTools_MainMenu_MiniButtonMixin:PreClick()
    PlaySound(84240)
end

EchoRaidTools_MainMenu_RenameButtonTemplateMixin = {}
function EchoRaidTools_MainMenu_RenameButtonTemplateMixin:OnLoad()
    self.tooltip = "Rename"
end
function EchoRaidTools_MainMenu_RenameButtonTemplateMixin:OnEnter()
    PlaySound(39511)
    self.ButtonTexture:SetAlpha(1)
    self.ButtonTexture:SetVertexColor(1, 0.82, 0.1)
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_MainMenu_RenameButtonTemplateMixin:OnLeave()
    self.ButtonTexture:SetAlpha(0.8)
    self.ButtonTexture:SetVertexColor(1, 1, 1)
    if self.tooltip then
        GameTooltip:Hide()
    end
end

EchoRaidTools_MainMenu_DeleteButtonTemplateMixin = {}
function EchoRaidTools_MainMenu_DeleteButtonTemplateMixin:OnLoad()
    self.tooltip = "Delete"
end
function EchoRaidTools_MainMenu_DeleteButtonTemplateMixin:OnEnter()
    PlaySound(39511)
    self.ButtonTexture:SetAlpha(1)
    self.ButtonTexture:SetVertexColor(1, 0.82, 0.1)
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_MainMenu_DeleteButtonTemplateMixin:OnLeave()
    self.ButtonTexture:SetAlpha(0.8)
    self.ButtonTexture:SetVertexColor(1, 1, 1)
    if self.tooltip then
        GameTooltip:Hide()
    end
end

EchoRaidTools_MainMenu_CopyButtonTemplateMixin = {}
function EchoRaidTools_MainMenu_CopyButtonTemplateMixin:OnLoad()
    self.tooltip = "Duplicate"
end
function EchoRaidTools_MainMenu_CopyButtonTemplateMixin:OnEnter()
    PlaySound(39511)
    self.ButtonTexture:SetAlpha(1)
    self.ButtonTexture:SetVertexColor(1, 0.82, 0.1)
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_MainMenu_CopyButtonTemplateMixin:OnLeave()
    self.ButtonTexture:SetAlpha(0.8)
    self.ButtonTexture:SetVertexColor(1, 1, 1)
    if self.tooltip then
        GameTooltip:Hide()
    end
end

EchoRaidTools_MainMenu_AddButtonTemplateMixin = {}
function EchoRaidTools_MainMenu_AddButtonTemplateMixin:OnLoad()
    self.tooltip = "Add"
end
function EchoRaidTools_MainMenu_AddButtonTemplateMixin:PreClick()
    PlaySound(74525)
end
function EchoRaidTools_MainMenu_AddButtonTemplateMixin:OnEnter()
    PlaySound(39511)
    self.ButtonTexture:SetVertexColor(1, 0.82, 0.1)
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_MainMenu_AddButtonTemplateMixin:OnLeave()
    self.ButtonTexture:SetVertexColor(1, 1, 1)
    if self.tooltip then
        GameTooltip:Hide()
    end
end

EchoRaidTools_MainMenu_ExpandButtonMixin = {}
function EchoRaidTools_MainMenu_ExpandButtonMixin:OnLoad()
    self.Expanded = true
    self.childHeight = 0
    self.AddButton.parent = self
    self.AddButton:Hide()
    self.CollapsedTexture:SetRotation(math.rad(180))
end
function EchoRaidTools_MainMenu_ExpandButtonMixin:OnEnter()
    self.HighlightTexture:Show()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_MainMenu_ExpandButtonMixin:OnLeave()
    self.HighlightTexture:Hide()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidTools_MainMenu_ExpandButtonMixin:SetupHeight()
    if not self.Expanded then
        local p, r, rp, x, y = self.ChildFrame:GetPointByName("TOPLEFT")
        self.ChildFrame:SetPoint("BOTTOMLEFT", r, rp, x, y)
        self.height = 25
    else
        local p, r, rp, x, y = self.ChildFrame:GetPointByName("TOPLEFT")
        self.ChildFrame:SetPoint("BOTTOMLEFT", r, rp, x, -self.childHeight)
        self.height = 25 + self.childHeight
    end
end
function EchoRaidTools_MainMenu_ExpandButtonMixin:Toggle()
    if self.Expanded then
        self.Expanded = false
        self.CollapsedTexture:Show()
        self.ExpandedTexture:Hide()
        self.ChildFrame:Hide()
        self.OpenArrow:SetRotation(math.rad(0))
        self.OpenArrow:SetDesaturated(true)
        self.OpenArrow:SetAlpha(0.3)
        self.ButtonText:SetTextColor(1, 1, 1)
        local p, r, rp, x, y = self.ChildFrame:GetPointByName("TOPLEFT")
        self.ChildFrame:SetPoint("BOTTOMLEFT", r, rp, x, y)
        self.height = 25
        self.AddButton:Hide()
    else
        self.Expanded = true
        self.ExpandedTexture:Show()
        self.CollapsedTexture:Hide()
        self.ChildFrame:Show()
        self.OpenArrow:SetRotation(math.rad(180))
        self.OpenArrow:SetDesaturated(false)
        self.OpenArrow:SetAlpha(1)
        self.ButtonText:SetTextColor(1, 0.82, 0.1)
        local p, r, rp, x, y = self.ChildFrame:GetPointByName("TOPLEFT")
        self.ChildFrame:SetPoint("BOTTOMLEFT", r, rp, x, -self.childHeight)
        self.height = 25 + self.childHeight
        self.AddButton:Show()
    end
    self.parent:UpdateHeight()
end
function EchoRaidTools_MainMenu_ExpandButtonMixin:OnMouseDown(button)
    self:Toggle()
    if self.Expanded then
        PlaySound(19972)
    else
        PlaySound(604)
    end
end
function EchoRaidTools_MainMenu_ExpandButtonMixin:SetText(text)
    self.ButtonText:SetText(text)
end
function EchoRaidTools_MainMenu_ExpandButtonMixin:SetAddFunc(func)
    self.addFunc = func
end

EchoRaidTools_MainMenu_ExpandButton_AddButtonMixin = {}
function EchoRaidTools_MainMenu_ExpandButton_AddButtonMixin:OnClick()
    self.parent.addFunc()
end

EchoRaidTools_MainMenu_SubButtonMixin = {}
function EchoRaidTools_MainMenu_SubButtonMixin:OnLoad()
    self.selected = false
    self.loaded = true
    self.groupDisabled = false

    self.SelectedTexture:Hide()
    self.HighlightTexture:Hide()
    --self.DisabledTexture:Hide()
    self.NotLoadedTexture:Hide()

    self.EditBox.parent = self
    self.RenameButton.parent = self
    self.CopyButton.parent = self
    self.DeleteButton.parent = self
    self.CheckButton.parent = self
end
function EchoRaidTools_MainMenu_SubButtonMixin:OnEnter()
    self.HighlightTexture:Show()
    local output = self.tooltip or ""
    if not self.loaded then
        output = output ~= "" and output.."\nNotLoaded" or "Not Loaded"
    end
    if self.groupDisabled then
        output = output ~= "" and output.."\nGroup Disabled" or "Group Disabled"
    end
    if output ~= "" then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        self.tt = output
        GameTooltip:SetText(output)
    end
end
function EchoRaidTools_MainMenu_SubButtonMixin:OnLeave()
    self.HighlightTexture:Hide()
    if self.tt then
        self.tt = nil
        GameTooltip:Hide()
    end
end
function EchoRaidTools_MainMenu_SubButtonMixin:OnMouseDown(button)
    if not self.selected then
        PlaySound(84240)
    end
    self.clickFunc()
end
function EchoRaidTools_MainMenu_SubButtonMixin:SetSelected(bool)
    if bool then
        self.selected = true
        self.SelectedTexture:Show()
        self.ButtonText:SetTextColor(1,1,1,1)
    else
        self.selected = false
        self.SelectedTexture:Hide()
        self.ButtonText:SetTextColor(1,0.82,0,1)
    end
end
function EchoRaidTools_MainMenu_SubButtonMixin:SetLoaded(bool)
    if bool then
        self.loaded = true
        self.NotLoadedTexture:Hide()
    else
        self.loaded = false
        self.NotLoadedTexture:Show()
    end
end
--[[function EchoRaidTools_MainMenu_SubButtonMixin:SetGroupDisabled(bool)
    if bool then
        self.groupDisabled = true
        self.DisabledTexture:Show()
    else
        self.groupDisabled = false
        self.DisabledTexture:Hide()
    end
end]]
function EchoRaidTools_MainMenu_SubButtonMixin:SetText(text)
    if type(text) ~= "string" then text = "" end
    self.ButtonText:SetText(text)
end
function EchoRaidTools_MainMenu_SubButtonMixin:SetOnClick(func)
    self.clickFunc = func
end
function EchoRaidTools_MainMenu_SubButtonMixin:SetGetter(func)
    self.GetName = func
end
function EchoRaidTools_MainMenu_SubButtonMixin:SetSetter(func)
    self.SetName = func
end
function EchoRaidTools_MainMenu_SubButtonMixin:SetDeleteFunc(func)
    self.deleteFunc = func
end
function EchoRaidTools_MainMenu_SubButtonMixin:SetCopyFunc(func)
    self.copyFunc = func
end
function EchoRaidTools_MainMenu_SubButtonMixin:SetCheckButtonSetter(func)
    self.CheckButtonSetterFunc = func
end
function EchoRaidTools_MainMenu_SubButtonMixin:SetCheckButtonGetter(func)
    self.CheckButtonGetterFunc = func
end
function EchoRaidTools_MainMenu_SubButtonMixin:SetUseCheckButton(bool)
    if bool then
        self.useCheckButton = true
        self.CheckButton:Show()
        self.CheckButton:SetChecked(self.CheckButtonGetterFunc())
        if self.CheckButtonGetterFunc() then
            self.CheckButton.tooltip = "Disable"
        else
            self.CheckButton.tooltip = "Enable"
        end
    else
        self.useCheckButton = false
        self.CheckButton:Hide()
    end
end

EchoRaidTools_MainMenu_RenameButtonMixin = {}
function EchoRaidTools_MainMenu_RenameButtonMixin:OnClick()
    self.parent.ButtonText:Hide()
    self.parent.EditBox:Show()
    self.parent.EditBox:SetText(self.parent:GetName())
    self.parent.EditBox:SetFocus()
end
EchoRaidTools_MainMenu_DeleteButtonMixin = {}
function EchoRaidTools_MainMenu_DeleteButtonMixin:OnClick()
    self.parent.deleteFunc()
end
EchoRaidTools_MainMenu_CopyButtonMixin = {}
function EchoRaidTools_MainMenu_CopyButtonMixin:OnClick()
    self.parent.copyFunc()
end

EchoRaidTools_MainMenu_SubButton_EditboxMixin = {}
function EchoRaidTools_MainMenu_SubButton_EditboxMixin:OnEscapePressed()
    self:ClearFocus()
    self:Hide()
    self.parent.ButtonText:Show()
end
function EchoRaidTools_MainMenu_SubButton_EditboxMixin:OnEnterPressed()
    self.parent:SetName(self:GetText())

    self.parent.EditBox:ClearFocus()
    self.parent.EditBox:Hide()
    self.parent.ButtonText:SetText(self.parent:GetName())
    self.parent.ButtonText:Show()
end
function EchoRaidTools_MainMenu_SubButton_EditboxMixin:OnEditFocusLost()
    self:ClearFocus()
    self:Hide()
    self.parent.ButtonText:Show()
end

EchoRaidTools_MainMenu_Subbutton_CheckButtonMixin = {}
function EchoRaidTools_MainMenu_Subbutton_CheckButtonMixin:OnClick()
    self.parent.CheckButtonSetterFunc()
    self:SetChecked(self.parent.CheckButtonGetterFunc())
    if self.parent.CheckButtonGetterFunc() then
        self.tooltip = "Disable"
    else
        self.tooltip = "Enable"
    end
end