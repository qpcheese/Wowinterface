local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

local types = _Cooldowns.types

local resetFunc_search = function(pool, item)
    item:SetScript("OnClick", nil)
    item:Hide()
    item:ClearAllPoints()
end
local spellSearchPool = CreateFramePool("BUTTON", _Cooldowns.controlParent, "EchoRaidToolsConfig_SearchBoxButton", resetFunc_search)

EchoRaidToolsConfig_Cooldowns_SpellSearchBoxMixin = {}
function EchoRaidToolsConfig_Cooldowns_SpellSearchBoxMixin:UpdatePopout()
    local popout = self.Popout
    spellSearchPool:ReleaseAll()

	local searchText = self.Editbox:GetText():lower()

    popout.ScrollFrame.Items:SetWidth(popout.ScrollFrame:GetWidth())

    local height = 0
    local lastItem
    if not types.fullSpellList then
        _Cooldowns.GenerateSpellList()
    end
    for i, details in ipairs(types.fullSpellList) do
        if searchText == "" or details.spellNameLower:match(searchText) or details.stringSpellID:match(searchText) then
            local itemButton = spellSearchPool:Acquire()
            itemButton:SetParent(popout.ScrollFrame.Items)
            itemButton.parentObject = self
            --table.insert(self.items, itemButton)
            itemButton:Show()
            itemButton:SetScript("OnClick", function(_, button, down)
                self:HidePopout()
                self.Editbox:SetText("")
                self.clickFunc(details.spellID)
            end)
            itemButton.SpellName:SetText(details.spellName)
            itemButton.SpellID:SetText(details.spellID)
            itemButton.Icon:SetTexture(details.icon)
            itemButton.spellID = details.spellID
            itemButton.spellName = details.spellName
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

    end
    self:SetScrollFrameSize(height)
end
function EchoRaidToolsConfig_Cooldowns_SpellSearchBoxMixin:ReleaseAllItems()
    spellSearchPool:ReleaseAll()
end