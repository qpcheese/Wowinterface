local _AddonName, _EchoRaidTools = ...

local LibSharedMedia = LibStub:GetLibrary ("LibSharedMedia-3.0")

local SelectionPopouts = {}
SelectionPopouts.popouts = {}
function SelectionPopouts:Add(popout)
    table.insert(self.popouts, popout)
end
function SelectionPopouts:Remove(popout)
	tDeleteItem(self.popouts, popout)
end
function SelectionPopouts:HandleMouseDown(buttonID, event)
	if event == "ECHO_SCROLL" or (event == "GLOBAL_MOUSE_DOWN" and (buttonID == "LeftButton" or buttonID == "RightButton")) then
		if not self:ContainsMouse() then
			self:CloseAll()
		end
	end
end
function SelectionPopouts:ContainsMouse()
	for index, popout in ipairs(self.popouts) do
		if popout:IsShown() and (popout:IsMouseOver() or popout.logicalParent:IsMouseOver()) then
			return true
		end
	end
	return false
end
function SelectionPopouts:CloseAll()
	for index, popout in ipairs(self.popouts) do
		popout.logicalParent:HidePopout()
	end
	wipe(self.popouts);
end
_EchoRaidTools.SelectionPopouts = SelectionPopouts

_EchoRaidTools.EventFrames = {}
_EchoRaidTools.EventFrames["config"] = CreateFrame("FRAME")
_EchoRaidTools.EventFrames["config"]:RegisterEvent("GLOBAL_MOUSE_DOWN")
_EchoRaidTools.EventFrames["config"]:SetScript("OnEvent",
    function(self, event, buttonID)
        if event == "GLOBAL_MOUSE_DOWN" then
            _EchoRaidTools.SelectionPopouts:HandleMouseDown(buttonID, event)
        end
    end
)

local resetFunc = function(pool, item)
    item:SetScript("OnClick", nil)
    item.Label:SetFontObject("GameFontNormal")
    item.Texture:Hide()
    item:Hide()
    item:ClearAllPoints()
end


EchoRaidToolsConfig_PopoutItemTextButtonMixin = {}
function EchoRaidToolsConfig_PopoutItemTextButtonMixin:OnLoad()
end

EchoRaidToolsConfig_PopoutMixin = {}
function EchoRaidToolsConfig_PopoutMixin:OnShow()
    SelectionPopouts:Add(self)
end
function EchoRaidToolsConfig_PopoutMixin:OnHide()
    SelectionPopouts:Remove(self)
end
function EchoRaidToolsConfig_PopoutMixin:OnLoad()
    self:SetParent(_EchoRaidTools.panels.main)
    self:SetFrameStrata("TOOLTIP")
    -- Hacky reskinning :(

    self.ScrollFrame.ScrollBar.ScrollDownButton:ClearAllPoints()
    self.ScrollFrame.ScrollBar.ScrollDownButton:SetPoint("TOP", self.ScrollFrame.ScrollBar, "BOTTOM")
    self.ScrollFrame.ScrollBar.ScrollDownButton:SetSize(12,8)
    self.ScrollFrame.ScrollBar.ScrollUpButton:ClearAllPoints()
    self.ScrollFrame.ScrollBar.ScrollUpButton:SetPoint("BOTTOM", self.ScrollFrame.ScrollBar, "TOP")
    self.ScrollFrame.ScrollBar.ScrollUpButton:SetSize(12,8)
    self.ScrollFrame.ScrollBar.ThumbTexture:SetSize(12,12)

    self.ScrollFrame.ScrollBar.ScrollDownButton:SetNormalAtlas("Azerite-PointingArrow")
    self.ScrollFrame.ScrollBar.ScrollDownButton:SetDisabledAtlas("Azerite-PointingArrow")
    self.ScrollFrame.ScrollBar.ScrollDownButton:SetHighlightAtlas("Azerite-PointingArrow")
    self.ScrollFrame.ScrollBar.ScrollDownButton:ClearPushedTexture()
    self.ScrollFrame.ScrollBar.ScrollDownButton.Normal:SetAlpha(0.6)
    self.ScrollFrame.ScrollBar.ScrollDownButton.Disabled:SetAlpha(0.2)
    self.ScrollFrame.ScrollBar.ScrollDownButton.Highlight:SetAlpha(1)

    self.ScrollFrame.ScrollBar.ScrollUpButton:SetNormalAtlas("Azerite-PointingArrow")
    self.ScrollFrame.ScrollBar.ScrollUpButton:SetDisabledAtlas("Azerite-PointingArrow")
    self.ScrollFrame.ScrollBar.ScrollUpButton:SetHighlightAtlas("Azerite-PointingArrow")
    self.ScrollFrame.ScrollBar.ScrollUpButton:ClearPushedTexture()
    self.ScrollFrame.ScrollBar.ScrollUpButton.Normal:SetAlpha(0.6)
    self.ScrollFrame.ScrollBar.ScrollUpButton.Normal:SetRotation(math.rad(180))
    self.ScrollFrame.ScrollBar.ScrollUpButton.Disabled:SetAlpha(0.2)
    self.ScrollFrame.ScrollBar.ScrollUpButton.Disabled:SetRotation(math.rad(180))
    self.ScrollFrame.ScrollBar.ScrollUpButton.Highlight:SetAlpha(1)
    self.ScrollFrame.ScrollBar.ScrollUpButton.Highlight:SetRotation(math.rad(180))

    self.ScrollFrame.ScrollBar.ThumbTexture:SetAtlas("charactercreate-ring-customizebackground")--("ChallengeMode-KeystoneSlotFrameGlow")
    self.ScrollFrame.ScrollBar.ThumbTexture:SetAlpha(1)

    self.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", self.ScrollFrame, "TOPRIGHT", 3, -12)
    self.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", self.ScrollFrame, "BOTTOMRIGHT", 3, 12)

end
function EchoRaidToolsConfig_PopoutMixin:OnLeave()
    self.parent:OnLeave()
end
function EchoRaidToolsConfig_PopoutMixin:SetupSelections(data, selected)
    
end

EchoRaidToolsConfig_PopoutItemTextButtonBGMixin = {}
function EchoRaidToolsConfig_PopoutItemTextButtonBGMixin:OnLoad()

end
function EchoRaidToolsConfig_PopoutItemTextButtonBGMixin:OnClick()
end
function EchoRaidToolsConfig_PopoutItemTextButtonBGMixin:OnEnter()
    self.HighlightBGTex:SetAlpha(0.3)
end
function EchoRaidToolsConfig_PopoutItemTextButtonBGMixin:OnLeave()
    self.HighlightBGTex:SetAlpha(0)
end

EchoRaidToolsConfig_DropdownMixin = {}
function EchoRaidToolsConfig_DropdownMixin:OnLoad()
    self.Button.parent = self
    self.Button.Popout.parent = self
    self.Enabled = true
end
function EchoRaidToolsConfig_DropdownMixin:Enable()
    self:SetAlpha(1)
    self.TopText:SetTextColor(1,0.82,0,0.7)
    self.Button.SelectedFrame.SelectedName:SetTextColor(1,0.82,0,1)
    self.Enabled = true
end
function EchoRaidToolsConfig_DropdownMixin:Disable()
    self:SetAlpha(0.5)
    self.TopText:SetTextColor(0.5,0.5,0.5,1)
    self.Button.SelectedFrame.SelectedName:SetTextColor(0.5,0.5,0.5,1)
    self.Enabled = false
end
function EchoRaidToolsConfig_DropdownMixin:IsEnabled()
    return self.Enabled
end
function EchoRaidToolsConfig_DropdownMixin:OnEnter()
    if self.Enabled and self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidToolsConfig_DropdownMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidToolsConfig_DropdownMixin:UpdateSelection(value)
    local label
    for i, button in ipairs(self.items) do
        if button.value == value then
            label = button.label
            button.Label:SetTextColor(1, 0.82, 0)
        else
            button.Label:SetTextColor(1, 1, 1)
        end
    end
    self.Button.SelectedFrame.SelectedName:SetText(label or "")
    self.Button.SelectedFrame.SelectedName:Show()
end
function EchoRaidToolsConfig_DropdownMixin:ClearSelections()
    self.data = nil
    if self.items then
        self.pool:ReleaseAll()
    end
end
function EchoRaidToolsConfig_DropdownMixin:SetupSelections(data, selected)
    self.data = data
    local popout = self.Button.Popout
    self.pool = self.pool or CreateFramePool("BUTTON", popout.ScrollFrame.Items, "EchoRaidToolsConfig_PopoutItemTextButton", resetFunc)
    if self.items then
        self.pool:ReleaseAll()
    end
    self.items = {}

    local height = 0
    local lastItem
    for i, details in ipairs(data) do
        local itemButton = self.pool:Acquire()
        itemButton:SetParent(popout.ScrollFrame.Items)
        itemButton.parentObject = self
        table.insert(self.items, itemButton)
        itemButton:Show()
        itemButton:SetScript("OnClick", function(_, button, down)
            self:UpdateSelection(details.value)
            self.Button:HidePopout()
            details.onclick(button, down, details.value)
        end)
        if details.font then
            itemButton.Label:SetFont(details.font, 12, "")
        elseif details.statusbar then
            itemButton.Texture:SetTexture(details.statusbar)
            itemButton.Texture:Show()
        end
        itemButton.Label:SetText(details.label)
        itemButton.value = details.value
        itemButton.label = details.label
        itemButton.tooltip = details.tooltip
        itemButton:ClearAllPoints()
        if lastItem then
            itemButton:SetPoint("TOPLEFT", lastItem, "BOTTOMLEFT", 0, -2)
            itemButton:SetPoint("TOPRIGHT", lastItem, "BOTTOMRIGHT", 0, -2)
        else
            itemButton:SetPoint("TOPLEFT", popout.ScrollFrame.Items)
            itemButton:SetPoint("TOPRIGHT", popout.ScrollFrame.Items)
        end
        height = height + itemButton:GetHeight()+2
        lastItem = itemButton
    end
    self:UpdateSelection(selected)
    self:SetScrollFrameSize(height)
end
function EchoRaidToolsConfig_DropdownMixin:SetScrollFrameSize(height)
    local popout = self.Button.Popout
    height = height + 33
    height = max(height, 100)

    if height < 200 then
        popout.ScrollFrame.ScrollBar:SetAlpha(0.3)
        popout.ScrollFrame.ScrollBar.ThumbTexture:Hide()
    else
        popout.ScrollFrame.ScrollBar:SetAlpha(1)
        popout.ScrollFrame.ScrollBar.ThumbTexture:Show()
    end
    popout:SetHeight(min(height,200))
end

EchoRaidToolsConfig_DropdownButtonMixin = {}
function EchoRaidToolsConfig_DropdownButtonMixin:OnLoad()
    self.Popout.logicalParent = self
end
function EchoRaidToolsConfig_DropdownButtonMixin:OnEnter()
    if self.parent:IsEnabled() and not self.Popout:IsShown() then
		self.NormalTexture:SetAtlas("charactercreate-customize-dropdownbox-hover");
        self.Arrow:SetAlpha(1)
        self.parent:OnEnter()
	end
end
function EchoRaidToolsConfig_DropdownButtonMixin:OnLeave()
    if not self.Popout:IsShown() then
		self.NormalTexture:SetAtlas("charactercreate-customize-dropdownbox");
        self.Arrow:SetAlpha(0.3)
        self.parent:OnLeave()
	end
end
function EchoRaidToolsConfig_DropdownButtonMixin:OnHide()
    self:HidePopout();
end
function EchoRaidToolsConfig_DropdownButtonMixin:OnMouseDown()
    if self:IsEnabled() then
		self:TogglePopout();
		PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON);
	end
end
function EchoRaidToolsConfig_DropdownButtonMixin:OnPopoutShown()

end
function EchoRaidToolsConfig_DropdownButtonMixin:ShowPopout()
    if self.parent:IsEnabled() then
        if self.popoutNeedsUpdate then
            self:UpdatePopout();
        end
        SelectionPopouts:CloseAll();

        self.Popout.ScrollFrame.Items:SetWidth(self.Popout.ScrollFrame:GetWidth())
        self.Popout:Show();
        self.NormalTexture:SetAtlas("charactercreate-customize-dropdownbox-open");
        self.HighlightTexture:SetAlpha(0.2);

        self.Arrow:SetAlpha(0)
        self.parent:OnLeave()
    end
end
function EchoRaidToolsConfig_DropdownButtonMixin:HidePopout()
    self.Popout:Hide();

	if GetMouseFocus() == self then
		self.NormalTexture:SetAtlas("charactercreate-customize-dropdownbox-hover");
	else
		self.NormalTexture:SetAtlas("charactercreate-customize-dropdownbox");
	end

    self.Arrow:SetAlpha(0.3)
	self.HighlightTexture:SetAlpha(0);
end
function EchoRaidToolsConfig_DropdownButtonMixin:TogglePopout()
	local showPopup = not self.Popout:IsShown();
	if showPopup then
		self:ShowPopout();
	else
		self:HidePopout();
	end
end
function EchoRaidToolsConfig_DropdownButtonMixin:OnValuechanged()
    self:SetupSelections()
end

EchoRaidToolsConfig_SearchBoxMixin = {}
function EchoRaidToolsConfig_SearchBoxMixin:OnLoad()
    self.Popout.parent = self
    self.Popout.logicalParent = self
    self.Editbox.parent = self
    local popout = self.Popout
    self.popoutOpen = false
end

-- be sure to define an `UpdatePopout` method when you inherit the template

function EchoRaidToolsConfig_SearchBoxMixin:SetFuncs(clickFunc)
    self.clickFunc = clickFunc
end
function EchoRaidToolsConfig_SearchBoxMixin:SetScrollFrameSize(height)
    local popout = self.Popout
    height = height + 33
    height = max(height, 100)

    if height < 200 then
        popout.ScrollFrame.ScrollBar:SetAlpha(0.3)
        popout.ScrollFrame.ScrollBar.ThumbTexture:Hide()
    else
        popout.ScrollFrame.ScrollBar:SetAlpha(1)
        popout.ScrollFrame.ScrollBar.ThumbTexture:Show()
    end
    popout:SetHeight(min(height,200))
end
function EchoRaidToolsConfig_SearchBoxMixin:OnEnter()
    if self.Enabled and self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidToolsConfig_SearchBoxMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end
function EchoRaidToolsConfig_SearchBoxMixin:ShowPopout()
    self:UpdatePopout()
    self.Popout:Show();
    self.popoutOpen = true
end
function EchoRaidToolsConfig_SearchBoxMixin:HidePopout()
    self.Popout:Hide();
    self:ReleaseAllItems()
    --spellSearchPool:ReleaseAll()
    self.popoutOpen = false
end
function EchoRaidToolsConfig_SearchBoxMixin:IsPopoutOpen()
    return self.popoutOpen
end
function EchoRaidToolsConfig_SearchBoxMixin:TogglePopout()
	local showPopup = not self.Popout:IsShown();
	if showPopup then
		self:ShowPopout();
	else
		self:HidePopout();
	end
end

EchoRaidToolsConfig_SearchBoxButtonMixin = {}
function EchoRaidToolsConfig_SearchBoxButtonMixin:OnLoad()

end
function EchoRaidToolsConfig_SearchBoxButtonMixin:OnEnter()
    self.HighlightBGTex:SetAlpha(0.3)
    if self.spellID then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetSpellByID(self.spellID)
    end
end
function EchoRaidToolsConfig_SearchBoxButtonMixin:OnLeave()
    self.HighlightBGTex:SetAlpha(0)
    GameTooltip:Hide()
end

EchoRaidToolsConfig_SearchBoxEditBoxMixin = {}
function EchoRaidToolsConfig_SearchBoxEditBoxMixin:OnEnterPressed()
    self.parent:HidePopout()
    self:SetText("")
    self:ClearFocus()
end
function EchoRaidToolsConfig_SearchBoxEditBoxMixin:OnEscapePressed()
    if self.parent:IsPopoutOpen() then
        self.parent:HidePopout()
    else
        self:SetText("")
        self:ClearFocus()
    end
end
function EchoRaidToolsConfig_SearchBoxEditBoxMixin:OnTextChanged()
    local text = self:GetText()
    local adjusted = text:gsub("%W", "")
    if adjusted ~= text then
        self:SetText(adjusted)
    end
    if self:HasFocus() then
        self.parent:UpdatePopout()
        if not self.parent:IsPopoutOpen() then
            self.parent:ShowPopout()
        end
    end
end
function EchoRaidToolsConfig_SearchBoxEditBoxMixin:OnEditFocusGained()
    self.parent:ShowPopout()
end
function EchoRaidToolsConfig_SearchBoxEditBoxMixin:OnEnter()
    if self.parent.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.parent.tooltip)
    end
end
function EchoRaidToolsConfig_SearchBoxEditBoxMixin:OnLeave()
    if self.parent.tooltip then
        GameTooltip:Hide()
    end
end