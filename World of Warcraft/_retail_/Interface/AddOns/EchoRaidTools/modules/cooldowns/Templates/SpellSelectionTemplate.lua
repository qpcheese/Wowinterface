local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

local types = _Cooldowns.types
local spellList = types.fullSpellList
local lookupTable = types.spellLookupTable
local filteredList = {}
local groupList = {}
local mainPanel

local dropUpdateFrame = CreateFrame("Frame")
local dropRegions = {}
local currentDropRegion, currentDropData;
local pickupIndex

EchoRaidTools_Cooldowns_SpellSelectionHeaderMixin = {}
function EchoRaidTools_Cooldowns_SpellSelectionHeaderMixin:OnLoad()
    self.Info.tooltip = [[This screen lets you pick what spells the Group will handle. The left hand pane shows all spells that aren't already selected for the Group, and the right hand pane those that are currently selected. 

Add/Remove spells from the Group with the +/- buttons, or by double clicking.

You can filter the non-selected spells (left pane) with the search bar. You can search by Spell Name or Spell ID, by Class name, or by text in the Spell's Tooltip text.

The screen also lets you provide a "Priority" for the spells in the Group which can be used in the Layout Settings to sort the Displays. Use the up/down buttons, or drag spells, to set their Priority.]]
    self.Info:SetScript("OnEnter", function(this)
        if this.tooltip then
            GameTooltip:SetOwner(this, "ANCHOR_NONE");
            GameTooltip:ClearAllPoints()
            GameTooltip:SetPoint("TOPLEFT", this, "TOPRIGHT", 20, 0)
            GameTooltip:SetFrameLevel(this:GetFrameLevel() + 2)
            GameTooltip:SetText(this.tooltip, 1,1,1,1,true)
        end
    end)
    self.Info:SetScript("OnLeave", function(this)
        if this.tooltip then
            GameTooltip:Hide()
        end
    end)
end

EchoRaidTools_Cooldowns_SpellSearchMixin = {}
function EchoRaidTools_Cooldowns_SpellSearchMixin:OnEnterPressed()
    self:ClearFocus()
end
function EchoRaidTools_Cooldowns_SpellSearchMixin:OnEscapePressed()
    self:ClearFocus()
end
function EchoRaidTools_Cooldowns_SpellSearchMixin:OnTextChanged(userInput)
    if userInput then
        self.parent:Update()
    end
    local text = self:GetText()
    if text and text ~= "" then
        self.searchIcon:Hide()
        self.clearSearch:Show()
    end
end
function EchoRaidTools_Cooldowns_SpellSearchMixin:OnLoad()
    self.clearSearch:SetScript("OnClick", function()
        self:SetText("")
        self.parent:Update()
        self.HintText:Show()
        self.clearSearch:Hide()
        self.searchIcon:Show()
    end)
    if self.hint then
        self.HintText:SetText(self.hint)
        self.HintText:Show()
    end
end
function EchoRaidTools_Cooldowns_SpellSearchMixin:OnEditFocusGained()
    self.HintText:Hide()
end
function EchoRaidTools_Cooldowns_SpellSearchMixin:OnEditFocusLost()
    local text = self:GetText()
    if (not text) or text == "" then
        self.HintText:Show()
        self.clearSearch:Hide()
        self.searchIcon:Show()
    end
end
function EchoRaidTools_Cooldowns_SpellSearchMixin:OnEnter()
    if self.tooltip then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
        GameTooltip:SetText(self.tooltip)
    end
end
function EchoRaidTools_Cooldowns_SpellSearchMixin:OnLeave()
    if self.tooltip then
        GameTooltip:Hide()
    end
end

-- remove Filters completely!
-- remove Filter colours completely!


EchorRaidTools_UpDownFrameMixin = {}

EchoRaidTools_TextIconFrameMixin = {}
function EchoRaidTools_TextIconFrameMixin:OnEnter()
    if self.spellID then
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
        GameTooltip:SetSpellByID(self.spellID)
    end
end
function EchoRaidTools_TextIconFrameMixin:OnLeave()
    if self.spellID then
        GameTooltip:Hide()
    end
end
function EchoRaidTools_TextIconFrameMixin:OnLoad()
    self:EnableMouse(false)
    self:SetMouseMotionEnabled(true)
end

EchoRaidTools_Cooldowns_SpellSelectionPanelMixin = {}
function EchoRaidTools_Cooldowns_SpellSelectionPanelMixin:OnLoad()
    mainPanel = self
    self.ScrollFrame.parent = self
    self.SpellSelectionHeader.Searchbox.parent = self
    self.SpellSelectionHeader.Searchbox.scrollFrame = self.ScrollFrame
    self.category = 0
    self.filter = 0
    local items = {
        {
            label = "None",
            value = 0,
            onclick = function()
                self.category = 0
                self.filter = 0
                self:Update()
            end
        }
    }
    local topValue = 0
    for i, category in ipairs(types.typeToFilterString) do
        local item = {
            label = category.text,
            value = i,
            onclick = function()
                self.category = i
                self.filter = 0
                self:Update()
            end,
        }
        topValue = max(i, topValue)
        table.insert(items, item)
    end

    self.SpellSelectionHeader.CategoryDropdown:SetupSelections(items, 0)

    local AddAll = function()
        for i, spell in pairs(filteredList) do
            _Cooldowns.AddSpellToGroup(spell.spellID, self.groupIndex)
        end
        mainPanel:Update()
    end
    self.SpellSelectionHeader.AddAllButton:SetScript("OnClick", AddAll)
    local RemoveAll = function()
        for i, spell in pairs(groupList) do
            _Cooldowns.RemoveSpellFromGroup(spell.spellID, self.groupIndex)
        end
        mainPanel:Update()
    end
    self.SpellSelectionHeader.RemoveAllButton:SetScript("OnClick", RemoveAll)
end
function EchoRaidTools_Cooldowns_SpellSelectionPanelMixin:Update()
    local searchText = self.SpellSelectionHeader.Searchbox:GetText():lower()
    local category = self.category
    local groupIndex = _Cooldowns.GetCurrentGroupIndex()
    self.groupIndex = groupIndex

    local spells = _Cooldowns.GetGroupSpells(groupIndex)
    wipe(filteredList)
    wipe(groupList)
    for i, details in ipairs(spellList) do
        if not _Cooldowns.GetGroupSpellByID(details.spellID, groupIndex) then
            local inSearch = searchText == ""
                or details.spellNameLower:match(searchText)
                or details.stringSpellID:match(searchText)
                or details.classLower:match(searchText)
                or details.desc:match(searchText)
            local inCategory = category == 0 or details.type == category

            if inSearch and inCategory then
                local thisSpell = CopyTable(details)
                table.insert(filteredList, thisSpell)
            end
        end
    end
    for i, spellID in ipairs(spells) do
        if lookupTable[spellID] then
            local thisSpell = CopyTable(lookupTable[spellID])
            table.insert(groupList, thisSpell)
        end
    end
    self.ScrollFrame:RefreshLines()
    self.ScrollFrameRight:RefreshLines()
end
function EchoRaidTools_Cooldowns_SpellSelectionPanelMixin:OnSizeChanged()
    self.ScrollFrame:OnShow(true)
    self.ScrollFrameRight:OnShow(true)
end

EchoRaidTools_Cooldowns_SpellSelectionLineMixin = {}
function EchoRaidTools_Cooldowns_SpellSelectionLineMixin:OnLoad()
    local level = self:GetFrameLevel()
    self.LineButton:SetFrameLevel(level + 1)
    self.SpellFrame:SetFrameLevel(level + 2)
    self.AddButton:SetFrameLevel(level + 3)
end
function EchoRaidTools_Cooldowns_SpellSelectionLineMixin:SetupLine(details)
    self:Show()
    local groupIndex = _Cooldowns.GetCurrentGroupIndex()

    local col = details.class and C_ClassColor.GetClassColor(details.class)
    local r,g,b,a
    if col then
        r,g,b,a = col.r or 1, col.g or 1, col.b or 1, col.a or 1
    end
    self.lineBGLeft:SetVertexColor(r or 0.5,g or 0.5,b or 0.5,a or 1)
    self.lineBGMid:SetVertexColor(r or 0.5,g or 0.5,b or 0.5,a or 1)
    self.lineBGRight:SetVertexColor(r or 0.5,g or 0.5,b or 0.5,a or 1)
    self.SpellIDText:SetText(details.spellID)
    self.Category:SetText(details.typeString)

    self.SpellFrame.spellID = details.spellID
    self.SpellFrame.SpellName:SetText(details.spellName)
    self.SpellFrame.SpellIcon:SetTexture(details.icon)
    self.SpellFrame.SpellName:SetTextColor(r or 0.7,g or 0.7,b or 0.7,a or 1)

    local addSpell = function()
        _Cooldowns.AddSpellToGroup(details.spellID, groupIndex)
        mainPanel:Update()
    end
    self.AddButton:SetScript("OnClick", addSpell)
    self.LineButton:SetScript("OnDoubleClick", addSpell)
end

EchoRaidTools_Cooldowns_LeftSide_HybridScrollMixin = {}
function EchoRaidTools_Cooldowns_LeftSide_HybridScrollMixin:Init(bool)
	if self.initialized and not bool then
		return
	end
    self.scrollBar = self.ScrollBar
	self.update = self.RefreshLines
	HybridScrollFrame_CreateButtons(self, "EchoRaidTools_Cooldowns_SpellSelectionLine", 0, 0)
	HybridScrollFrame_SetDoNotHideScrollBar(self, true)

	self.initialized = true
end
function EchoRaidTools_Cooldowns_LeftSide_HybridScrollMixin:RefreshLines()
	local lines = HybridScrollFrame_GetButtons(self)
	local offset = HybridScrollFrame_GetOffset(self)

	local toDisplay = filteredList or {}

	for i = 1, #lines do
		local listIndex = offset + i
		local line = lines[i]

		if toDisplay and listIndex <= #toDisplay then
			local info = toDisplay[listIndex]
			line:SetupLine(info)
		else
			line:Hide()
		end
	end

	local numDisplayed = math.min(#lines, #toDisplay)
	local lineHeight = lines[1]:GetHeight()
	local displayedHeight = numDisplayed * lineHeight
	local totalHeight = #toDisplay * lineHeight
	HybridScrollFrame_Update(self, totalHeight, displayedHeight)
end
function EchoRaidTools_Cooldowns_LeftSide_HybridScrollMixin:OnShow(bool)
	self:Init(bool)
	self:RefreshLines()
end

EchoRaidTools_Cooldowns_RightSide_HybridScrollMixin = {}
function EchoRaidTools_Cooldowns_RightSide_HybridScrollMixin:Init(bool)
	if self.initialized and not bool then
		return
	end
    self.scrollBar = self.ScrollBar2
    self.update = self.RefreshLines
	HybridScrollFrame_CreateButtons(self, "EchoRaidTools_Cooldowns_SpellSelectionLineRight", 0, 0)
	HybridScrollFrame_SetDoNotHideScrollBar(self, true)

	self.initialized = true
end
function EchoRaidTools_Cooldowns_RightSide_HybridScrollMixin:RefreshLines()
    wipe(dropRegions)
	local lines = HybridScrollFrame_GetButtons(self)
	local offset = HybridScrollFrame_GetOffset(self)

	local toDisplay = groupList or {}

	for i = 1, #lines do
		local listIndex = offset + i
		local line = lines[i]

		if toDisplay and listIndex <= #toDisplay then
			local info = toDisplay[listIndex]
			line:SetupLine(info, listIndex, #toDisplay)
            table.insert(dropRegions, line.DropRegionTop)
            table.insert(dropRegions, line.DropRegionBottom)
		else
			line:Hide()
		end
	end

	local numDisplayed = math.min(#lines, #toDisplay)
	local lineHeight = lines[1]:GetHeight()
	local displayedHeight = numDisplayed * lineHeight
	local totalHeight = #toDisplay * lineHeight
	HybridScrollFrame_Update(self, totalHeight, displayedHeight)
end
function EchoRaidTools_Cooldowns_RightSide_HybridScrollMixin:OnShow(bool)
    self:Init(bool)
	self:RefreshLines()
end

EchoRaidTools_Cooldowns_SpellSelectionLineRightMixin = {}
function EchoRaidTools_Cooldowns_SpellSelectionLineRightMixin:OnLoad()
    local level = self:GetFrameLevel()
    self.LineButton:SetFrameLevel(level + 1)
    self.SpellFrame:SetFrameLevel(level + 2)
    self.RemoveButton:SetFrameLevel(level + 3)
    self.LineButton.line = self
    self.LineButton:RegisterForDrag("LeftButton")
end
function EchoRaidTools_Cooldowns_SpellSelectionLineRightMixin:SetupLine(details, index, total)
    self:Show()
    self.dataIndex = index
    self.DropRegionTop.dataIndex = index
    self.DropRegionBottom.dataIndex = index
    self.details = details
    local groupIndex = _Cooldowns.GetCurrentGroupIndex()
    self.groupIndex = groupIndex
    self.spellID = details.spellID

    local col = details.class and C_ClassColor.GetClassColor(details.class)
    local r,g,b,a
    if col then
        r,g,b,a = col.r or 1, col.g or 1, col.b or 1, col.a or 1
    end
    self.lineBGLeft:SetVertexColor(r or 0.4,g or 0.4,b or 0.4,a or 1)
    self.lineBGMid:SetVertexColor(r or 0.4,g or 0.4,b or 0.4,a or 1)
    self.lineBGRight:SetVertexColor(r or 0.4,g or 0.4,b or 0.4,a or 1)

    self.SpellFrame.spellID = details.spellID
    self.SpellFrame.SpellName:SetText(details.spellName)
    self.SpellFrame.SpellIcon:SetTexture(details.icon)
    self.SpellFrame.SpellName:SetTextColor(r or 0.7,g or 0.7,b or 0.7,a or 1)

    local removeSpell = function()
        _Cooldowns.RemoveSpellFromGroup(details.spellID, groupIndex)
        mainPanel:Update()
    end
    self.RemoveButton:SetScript("OnClick", removeSpell)
    self.LineButton:SetScript("OnDoubleClick", removeSpell)
    self.UpDownFrame.UpButton:Enable()
    self.UpDownFrame.DownButton:Enable()
    if index == 1 then
        self.UpDownFrame.UpButton:Disable()
    elseif index == total then
        self.UpDownFrame.DownButton:Disable()
    end
    self.UpDownFrame.UpButton:SetScript("OnClick", function()
        _Cooldowns.SetSpellPriority(index - 1, details.spellID, groupIndex)
        mainPanel:Update()
    end)
    self.UpDownFrame.DownButton:SetScript("OnClick", function()
        _Cooldowns.SetSpellPriority(index + 1, details.spellID, groupIndex)
        mainPanel:Update()
    end)

end

local fakeLine
local function setupFakeLine(line)
    if (not fakeLine) then
		fakeLine = CreateFrame("FRAME", nil, mainPanel, "EchoRaidTools_Cooldowns_SpellSelectionDragLine")
		fakeLine.isFake = true
	end
    fakeLine:SetMovable(true)
    fakeLine:RegisterForDrag("LeftButton")

    local col = line.details.class and C_ClassColor.GetClassColor(line.details.class)
    local r,g,b,a
    if col then
        r,g,b,a = col.r or 1, col.g or 1, col.b or 1, col.a or 1
    end
    fakeLine.lineBGLeft:SetVertexColor(r or 0.1,g or 0.1,b or 0.1,a or 1)
    fakeLine.lineBGMid:SetVertexColor(r or 0.1,g or 0.1,b or 0.1,a or 1)
    fakeLine.lineBGRight:SetVertexColor(r or 0.1,g or 0.1,b or 0.1,a or 1)

    fakeLine.SpellFrame.SpellName:SetText(line.details.spellName)
    fakeLine.SpellFrame.SpellIcon:SetTexture(line.details.icon)
    fakeLine.SpellFrame.SpellName:SetTextColor(r or 0.7,g or 0.7,b or 0.7,a or 1)

	fakeLine.dataIndex = line.dataIndex
    fakeLine.line = line

    fakeLine:Show()

    return fakeLine
end
local function hideAllDropHighlights()
	for i = 1, #dropRegions do
		local dropRegion = dropRegions[i]
		dropRegion.highlight:Hide()
	end
end
local function dropUpdateOnOpdate(self, dt)
	currentDropRegion = nil
	hideAllDropHighlights()
	if (mainPanel.ScrollFrameRight:IsMouseOver()) then
		--currentDropRegion = 0
		for i = 1, #dropRegions do
			local dropRegion = dropRegions[i]
			if dropRegion:IsMouseOver() then
                if dropRegion.dataIndex > pickupIndex then
                    currentDropRegion = dropRegion.isTop and dropRegion.dataIndex - 1 or dropRegion.dataIndex
                elseif dropRegion.dataIndex == pickupIndex then
                    currentDropRegion = pickupIndex
                else
                    currentDropRegion = dropRegion.isTop and dropRegion.dataIndex or dropRegion.dataIndex + 1
                end
				dropRegion.highlight:Show()
				local otherRegion = dropRegion.isTop and dropRegions[i - 1] or dropRegions[i + 1]
				if (otherRegion and i > 1) then
					otherRegion.highlight:Show()
				end
				break;
			end
		end
	end
end
EchoRaidTools_SpellSelectionLineRight_LineButton = {}
function EchoRaidTools_SpellSelectionLineRight_LineButton:OnMouseDown()
    self.line.mouseDownPosition = { GetCursorPosition() };
end
function EchoRaidTools_SpellSelectionLineRight_LineButton:OnDragStart()
    GameTooltip:Hide()
    local fLine = setupFakeLine(self.line)
    fLine:SetAllPoints(self.line)
    fLine.spellID = self.line.spellID

	local x, y = GetCursorPosition()
	fLine:AdjustPointsOffset(x - self.line.mouseDownPosition[1], y - self.line.mouseDownPosition[2])

	dropUpdateFrame:SetScript("OnUpdate", dropUpdateOnOpdate)
	fLine:SetScript("OnUpdate", function()
		if (not IsMouseButtonDown("LeftButton")) then
        	self:MyDragStop()
		end
	end)
    pickupIndex = self.line.dataIndex
    self.line:Hide()

	fLine:StartMoving();
end
function EchoRaidTools_SpellSelectionLineRight_LineButton:MyDragStop()
    dropUpdateFrame:SetScript("OnUpdate", nil)
	fakeLine:Hide();
	fakeLine:SetScript("OnUpdate", nil)
	fakeLine:StopMovingOrSizing()
    local spellID = fakeLine.spellID
    fakeLine.spellID = nil

	hideAllDropHighlights()

	self.line:Show()
	if (currentDropRegion) then
		_Cooldowns.SetSpellPriority(currentDropRegion, spellID, self.line.groupIndex)
	end
    mainPanel:Update()
end