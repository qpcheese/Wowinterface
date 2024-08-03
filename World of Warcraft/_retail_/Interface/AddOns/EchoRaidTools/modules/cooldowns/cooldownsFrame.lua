local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

local LibSharedMedia = LibStub:GetLibrary ("LibSharedMedia-3.0")
local LibGetFrame = LibStub:GetLibrary("LibGetFrame-1.0")

function _Cooldowns:LoadFrames()
    local data = EchoRaidToolsDB.Cooldowns
    local types = _Cooldowns.types

    _Cooldowns.GetStatusBarTexture = function(textureName)
        return LibSharedMedia:Fetch("statusbar", textureName)
    end
    _Cooldowns.GetFontPath = function(fontName)
        return LibSharedMedia:Fetch("font", fontName)
    end

    local EchoCooldownsFrame = CreateFrame("FRAME", "EchoCooldownsFrame", UIParent)
    EchoCooldownsFrame:SetAllPoints(UIParent)
    EchoCooldownsFrame:Show()

    local notable = {}
    local displays = {}
    local displaysByGroup = {}
    _Cooldowns.displays = displays
    _Cooldowns.displaysByGroup = displaysByGroup
    _Cooldowns.GetDisplaysByGroup = function(groupIndex)
        return displaysByGroup[groupIndex] or notable
    end

    local displayResetFunc = function(pool, display)
        if displays[display.groupIndex] and displays[display.groupIndex][display.unit] and displays[display.groupIndex][display.unit][display.spellID] then
            displays[display.groupIndex][display.unit][display.spellID] = nil
        end
        if displaysByGroup[display.groupIndex] and displaysByGroup[display.groupIndex][display.displayName] then
            displaysByGroup[display.groupIndex][display.displayName] = nil
        end
        display.displayName = nil
        display.groupIndex = nil
        display.unit = nil
        display.spellID = nil
        display.spellName = nil
        display.priority = nil
        display.icon = nil
        display.duration = nil
        display.expirationTime = nil
        display.start = nil
        display.dirty = nil
        display.toBeRemoved = nil
        display.toBeHidden = nil
        display.overrideDuration = nil
        display.buffExpirationTime = nil
        display.buffDuration = nil
        display:Hide()
        display.Flash:Stop()
        display:ClearAllPoints()
        display:SetScript("OnUpdate", nil)
        display:SetScript("OnEnter", nil)
        display:SetScript("OnLeave", nil)
        display:SetMouseMotionEnabled(false)
        display.Icon.Cooldown:Clear()
        display.StatusBar:SetMinMaxValues(0,1)
        display.DurationText:Hide()
        display.ChargesText:Hide()
        display.Icon.Cooldown:Clear()
        display.selfPoint = nil
        display.relPoint = nil
        display.anchorTo = nil
        display.xOffset = nil
        display.yOffset = nil
        display.base = nil
        display.states = nil
        if display.uptimeCallback then display.uptimeCallback:Cancel() end
        display.uptimeCallback = nil
    end
    local headerReset = function(pool, header)
        header:ClearAllPoints()
        header:Hide()
    end
    local anchorReset = function(pool, anchor)
        anchor:ClearAllPoints()
        anchor:Lock()
        anchor:Hide()
        anchor.data = nil
        anchor.groupIndex = nil
    end
    local backdropReset = function(pool, backdrop)
        backdrop:ClearAllPoints()
        backdrop:Hide()
    end

    local displayPool = CreateFramePool("FRAME", EchoCooldownsFrame, "EchoCooldownDisplayTemplate", displayResetFunc)
    local headerPool = CreateFramePool("FRAME", EchoCooldownsFrame, "EchoCooldownsHeaderTemplate", headerReset)
    local anchorPool = CreateFramePool("FRAME", EchoCooldownsFrame, "EchoCooldownsDraggableAnchor", anchorReset)
    local backdropPool = CreateFramePool("FRAME", EchoCooldownsFrame, "EchoCooldownsOutline", backdropReset)
    _Cooldowns.displayPool = displayPool

    _Cooldowns.headerPool = headerPool
    _Cooldowns.anchorPool = anchorPool
    _Cooldowns.backdropPool = backdropPool

    _Cooldowns.AnchorFrames = {}
    _Cooldowns.BackdropFrames = {}
    _Cooldowns.OnHideFuncs = _Cooldowns.OnHideFuncs or {}

    _Cooldowns.UpdateBackdropFrames = function(groupIndex)
        _Cooldowns.HideBackdropFrames(groupIndex)
        _Cooldowns.ShowBackdropFrames(groupIndex)
    end
    _Cooldowns.ShowBackdropFrames = function(groupIndex)
        if groupIndex == 0 or not _Cooldowns.IsGroupActive(groupIndex) then return end
        if _Cooldowns.GetAnchorToUnitframes(groupIndex) then
            if displays[groupIndex] then
                for unit, spells in pairs(displays[groupIndex]) do
                    local left, right, top, bottom = math.huge, 0, 0, math.huge
                    local bd = backdropPool:Acquire()
                    for spell, display in pairs(spells) do
                        local l, b, w, h = display:GetRect()
                        if b and display:IsShown() then
                            local t = b + h
                            local r = l + w
                            left = min(l, left)
                            right = max(r, right)
                            top = max(t, top)
                            bottom = min(b, bottom)
                        end
                    end
                    if left < math.huge then
                        bd:SetPoint("BOTTOMLEFT", left - 7, bottom - 7)
                        bd:SetSize((right - left) + 14, (top - bottom) + 14)
                        bd:Show()
                    end
                end
            end
        else
            local left, right, top, bottom = math.huge, 0, 0, math.huge
            local bd = backdropPool:Acquire()
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(groupIndex)) do
                if display:IsShown() then
                    local l, b, w, h = display:GetRect()
                    if b then
                        local t = b + h
                        local r = l + w
                        left = min(l, left)
                        right = max(r, right)
                        top = max(t, top)
                        bottom = min(b, bottom)
                    end
                end
            end
            if left < math.huge then
                bd:SetPoint("BOTTOMLEFT", left - 7, bottom - 7)
                bd:SetSize((right - left) + 14, (top - bottom) + 14)
                bd:Show()
            end
        end
    end
    _Cooldowns.HideBackdropFrames = function(groupIndex)
        backdropPool:ReleaseAll()
    end

    local Acquire = function()
        local display = displayPool:Acquire()
        display.toBeShown = true
        return display
    end

    _Cooldowns.ClearGroupCooldowns = function(index)
        for display in displayPool:EnumerateActive() do
            if display.groupIndex == index then
                displayPool:Release(display)
            end
        end
        for header in headerPool:EnumerateActive() do
            if header.groupIndex == index then
                headerPool:Release(header)
            end
        end
    end
    _Cooldowns.ClearGroupFrames = function(groupIndex)
        backdropPool:ReleaseAll()
        if _Cooldowns.AnchorFrames[groupIndex] then
            _Cooldowns.anchorPool:Release(_Cooldowns.AnchorFrames[groupIndex])
        end
    end

    _Cooldowns.ClearAllEchoCooldowns = function()
        displayPool:ReleaseAll()
        headerPool:ReleaseAll()
        anchorPool:ReleaseAll()
        backdropPool:ReleaseAll()
    end

    _Cooldowns.BuildGroups = function ()
        for index, details in ipairs(data.groups) do
            _Cooldowns.AnchorFrames[index] = _Cooldowns.anchorPool:Acquire()
            _Cooldowns.AnchorFrames[index]:SetFrameStrata("HIGH")
            _Cooldowns.AnchorFrames[index]:SetSize(20,20)
            local x,y = _Cooldowns.GetAnchorOffsets(index)
            _Cooldowns.AnchorFrames[index]:SetPoint("CENTER", x, y)
            _Cooldowns.AnchorFrames[index]:EnableMouse(false)
            _Cooldowns.AnchorFrames[index]:Show()
            _Cooldowns.AnchorFrames[index].data = _Cooldowns.GetGroupData(index)
            _Cooldowns.AnchorFrames[index].GroupName:SetText(_Cooldowns.GetGroupName(index))
            _Cooldowns.AnchorFrames[index].groupIndex = index
            table.insert(_Cooldowns.OnHideFuncs, function() _Cooldowns.AnchorFrames[index]:Lock() end)
        end
    end
    _Cooldowns.NewGroupAnchor = function(index)
        _Cooldowns.AnchorFrames[index] = _Cooldowns.anchorPool:Acquire()
        _Cooldowns.AnchorFrames[index]:SetSize(20,20)
        local x,y = _Cooldowns.GetAnchorOffsets(index)
        _Cooldowns.AnchorFrames[index]:SetPoint("CENTER", x, y)
        _Cooldowns.AnchorFrames[index]:EnableMouse(false)
        _Cooldowns.AnchorFrames[index]:Show()
        _Cooldowns.AnchorFrames[index].data = _Cooldowns.GetGroupData(index)
        _Cooldowns.AnchorFrames[index].GroupName:SetText(_Cooldowns.GetGroupName(index))
        _Cooldowns.AnchorFrames[index].groupIndex = index
        table.insert(_Cooldowns.OnHideFuncs, function() _Cooldowns.AnchorFrames[index]:Lock() end)
    end

    _Cooldowns.SendEchoRemoveSpell = function(unit, spellID)
        local updatePositions = {}
        for groupIndex, units in pairs(displays) do
            for displayUnit, spells in pairs(units) do
                if displayUnit == unit then
                    for spell, display in pairs(spells) do
                        if spellID == spell then
                            display.toBeRemoved = true
                            updatePositions[groupIndex] = true
                        end
                    end
                end
            end
        end
        for groupIndex, bool in pairs(updatePositions) do
            _Cooldowns.UpdatePositions(groupIndex)
        end
    end

    local validateUnit = function(unit)
        local groupType = IsInRaid() and types.raidUnits or IsInGroup() and types.partyUnits or types.soloUnits
        return groupType[unit] or unit:find("test")
    end
    _Cooldowns.ValidateUnits = function()
        local groupType = IsInRaid() and types.raidUnits or IsInGroup() and types.partyUnits or types.soloUnits
        local getNewInfo = false
        for unit, _ in pairs(_Cooldowns.unitFlags) do
            if (not groupType[unit]) or (not UnitExists(unit)) then
                _Cooldowns.unitFlags[unit] = nil
                _Cooldowns.RemoveUnit(unit)
            elseif (_Cooldowns.unitFlags[unit].guid ~= UnitGUID(unit)) then
                _Cooldowns.unitFlags[unit] = nil
                _Cooldowns.RemoveUnit(unit)
                getNewInfo = true
            end
        end
        if getNewInfo then
            _Cooldowns.RequestNewCooldownInfo()
        end
    end
    _Cooldowns.RemoveUnit = function(unit, index)
        local updatePositions = {}
        if not index then
            for groupIndex, units in pairs(displays) do
                for displayUnit, spells in pairs(units) do
                    if displayUnit == unit then
                        for _, display in pairs(spells) do
                            display.toBeRemoved = true
                            updatePositions[groupIndex] = true
                        end
                    end
                end
            end
            for groupIndex, _ in pairs(updatePositions) do
                _Cooldowns.UpdatePositions(groupIndex, unit)
            end
        else
            for groupIndex, units in pairs(displays) do
                if index == groupIndex then
                    for displayUnit, spells in pairs(units) do
                        if displayUnit == unit then
                            for _, display in pairs(spells) do
                                display.toBeRemoved = true
                                updatePositions[groupIndex] = true
                            end
                        end
                    end
                end
            end
            _Cooldowns.UpdatePositions(index, unit)
        end
    end

    _Cooldowns.SetDisplaysDirtyByGroupIndex = function(groupIndex)
        for _, display in pairs(_Cooldowns.GetDisplaysByGroup(groupIndex)) do
            display.dirty = true
        end
    end

    _Cooldowns.SetDisplaysDirtyByUnit = function(unit, index)
        if index then
            for groupIndex, units in pairs(displays) do
                if groupIndex == index then
                    for displayUnit, spells in pairs(units) do
                        if displayUnit == unit then
                            for _, display in pairs(spells) do
                                display.dirty = true
                            end
                        end
                    end
                end
            end
        else
            for groupIndex, units in pairs(displays) do
                for displayUnit, spells in pairs(units) do
                    if displayUnit == unit then
                        for _, display in pairs(spells) do
                            display.dirty = true
                        end
                    end
                end
            end
        end
    end
    _Cooldowns.RemoveDirtyDisplaysByGroupIndex = function(groupIndex)
        local updatePositions = {}
        for _, display in pairs(_Cooldowns.GetDisplaysByGroup(groupIndex)) do
            if display.dirty then
                display.dirty = nil
                display.toBeRemoved = true
                updatePositions[groupIndex] = true
            end
        end
        for groupIndex, _ in pairs(updatePositions) do
            _Cooldowns.UpdatePositions(groupIndex)
        end
    end
    _Cooldowns.RemoveDirtyDisplaysByUnit = function(unit, index)
        local updatePositions = {}
        if index then
            for groupIndex, units in pairs(displays) do
                if groupIndex == index then
                    for displayUnit, spells in pairs(units) do
                        if displayUnit == unit then
                            for _, display in pairs(spells) do
                                if display.dirty then
                                    display.dirty = nil
                                    display.toBeRemoved = true
                                    updatePositions[groupIndex] = true
                                end
                            end
                        end
                    end
                end
            end
        else
            for groupIndex, units in pairs(displays) do
                for displayUnit, spells in pairs(units) do
                    if displayUnit == unit then
                        for _, display in pairs(spells) do
                            if display.dirty then
                                display.dirty = nil
                                display.toBeRemoved = true
                                updatePositions[groupIndex] = true
                            end
                        end
                    end
                end
            end
        end
        for groupIndex, _ in pairs(updatePositions) do
            _Cooldowns.UpdatePositions(groupIndex, unit)
        end
    end

    local sortableDisplays = {}
    _Cooldowns.SortCooldowns = function(groupIndex, unit)
        wipe(sortableDisplays)
        local primarySortMethod = _Cooldowns.GetSortMethod(groupIndex)
        local primaryAsc = _Cooldowns.GetSortAscending(groupIndex)
        local secondarySortMethod = _Cooldowns.GetSortMethodSecondary(groupIndex)
        local secondaryAsc = _Cooldowns.GetSortAscendingSecondary(groupIndex)
        local sortFlaggedLast = _Cooldowns.GetSortFlaggedLast(groupIndex)
        if unit then
            if not displays[groupIndex][unit] then return end
            for spell, display in pairs(displays[groupIndex][unit]) do
                if display.toBeShown then
                    display:Show()
                    display.toBeShown = nil
                end
                if display.overLimit then
                    display:Show()
                    display.overLimit = nil
                end
                if display.toBeRemoved then
                    display.toBeRemoved = nil
                    displayPool:Release(display)
                end
                if display.toBeHidden then
                    display.toBeHidden = nil
                    display:Hide()
                end
                if display:IsShown() then
                    sortableDisplays[#sortableDisplays+1] = display
                end
            end
            sort(sortableDisplays, function(a,b)
                    if not a.flagged then
                        _Cooldowns.UpdateUnitFlags(a.unit)
                    end
                    if not b.flagged then
                        _Cooldowns.UpdateUnitFlags(b.unit)
                    end
                    if sortFlaggedLast and a.flagged < b.flagged then return true end
                    if sortFlaggedLast and a.flagged > b.flagged then return false end
                    if a[primarySortMethod] > b[primarySortMethod] then return not primaryAsc end
                    if a[primarySortMethod] < b[primarySortMethod] then return primaryAsc end
                    if a[secondarySortMethod] > b[secondarySortMethod] then return not secondaryAsc end
                    if a[secondarySortMethod] < b[secondarySortMethod] then return secondaryAsc end
                    return a.priority < b.priority
                end
            )
        else
            if not displays[groupIndex] then return end
            for unit, spells in pairs(displays[groupIndex]) do
                for spell, display in pairs(spells) do
                    if display.toBeShown then
                        display:Show()
                        display.toBeShown = nil
                    end
                    if display.overLimit then
                        display:Show()
                        display.overLimit = nil
                    end
                    if display.toBeRemoved then
                        display.toBeRemoved = nil
                        displayPool:Release(display)
                    end
                    if display.toBeHidden then
                        display.toBeHidden = nil
                        display:Hide()
                    end
                    if display:IsShown() then
                        sortableDisplays[#sortableDisplays+1] = display
                    end
                end
            end
            sort(sortableDisplays, function(a,b)
                    if not a.flagged then
                        _Cooldowns.UpdateUnitFlags(a.unit)
                    end
                    if not b.flagged then
                        _Cooldowns.UpdateUnitFlags(b.unit)
                    end
                    if sortFlaggedLast and a.flagged < b.flagged then return true end
                    if sortFlaggedLast and a.flagged > b.flagged then return false end
                    if a[primarySortMethod] > b[primarySortMethod] then return not primaryAsc end
                    if a[primarySortMethod] < b[primarySortMethod] then return primaryAsc end
                    if a[secondarySortMethod] > b[secondarySortMethod] then return not secondaryAsc end
                    if a[secondarySortMethod] < b[secondarySortMethod] then return secondaryAsc end
                    return a.priority < b.priority
                end
            )
        end
        local displayLimit = _Cooldowns.GetDisplayLimit(groupIndex)
        displayLimit = displayLimit == 0 and math.huge or displayLimit
        for i = #sortableDisplays, 1, -1 do
            if i > displayLimit then
                sortableDisplays[i].overLimit = true
                sortableDisplays[i]:Hide()
                sortableDisplays[i] = nil
            end
        end
        return sortableDisplays
    end

    _Cooldowns.GetGrowPointsinfo = function(groupIndex)
        local primary, secondary = _Cooldowns.GetPrimaryGrowthDirection(groupIndex), _Cooldowns.GetSecondaryGrowthDirection(groupIndex)
        local selfPoint, multX, multY
        if primary == "UP" then
            multY = 1
            if secondary == "LEFT" then
                selfPoint = "BOTTOMRIGHT"
                multX = -1
            else
                selfPoint = "BOTTOMLEFT"
                multX = 1
            end
        elseif primary == "DOWN" then
            multY = -1
            if secondary == "LEFT" then
                selfPoint = "TOPRIGHT"
                multX = -1
            else
                selfPoint = "TOPLEFT"
                multX = 1
            end
        elseif primary == "LEFT" then
            multX = -1
            if secondary == "UP" then
                selfPoint = "BOTTOMRIGHT"
                multY = 1
            else
                selfPoint = "TOPRIGHT"
                multY = -1
            end
        elseif primary == "RIGHT" then
            multX = 1
            if secondary == "UP" then
                selfPoint = "BOTTOMLEFT"
                multY = 1
            else
                selfPoint = "TOPLEFT"
                multY = -1
            end
        end
        return primary, secondary, selfPoint, multX, multY
    end

    local timer = {}
    _Cooldowns.UpdatePositions = function(groupIndex, unit, forceUpdate, delete)
        if not _Cooldowns.GetModuleEnabled() then return end
        if not timer[groupIndex] then
            timer[groupIndex] = {unit = unit, forceUpdate = forceUpdate}
            RunNextFrame(
                function()
                    if timer[groupIndex] then
                        _Cooldowns.UpdatePositionsThrottled(groupIndex, timer[groupIndex].unit, timer[groupIndex].forceUpdate)
                        timer[groupIndex] = nil
                    end
                end
            )
        elseif forceUpdate and not timer[groupIndex].forceUpdate then
            timer[groupIndex].forceUpdate = true
        elseif timer[groupIndex].unit ~= unit then
            timer[groupIndex].unit = nil
        end
        if delete and timer[groupIndex] then
            timer[groupIndex] = nil
        end
    end

    local quotientAndRemainder = function(a, b)
        if b == 0 then
            return 0, a
        else
            return floor(a/b), a % b
        end
    end

    local getPositions = function(sortedDisplays, sortMethod, newRow, isHorizontal, isVertical, growCount, width, height, spacingX, spacingY, multX, multY, xOff, yOff, CenteredHorizontal, CenteredVertical, selfPoint)
        local maxX, maxY = 0,0
        if (not sortedDisplays) or #sortedDisplays == 0 then
            return false
        else
            local xCount, yCount, lastFilter = 0, 0
            for i, display in ipairs(sortedDisplays) do
                if (((xCount > 0 or yCount > 0) and newRow and lastFilter ~= display[sortMethod])
                    or (isHorizontal and xCount == growCount and growCount > 0)
                    or (isVertical and yCount == growCount and growCount > 0)) then
                    if isHorizontal then
                        xCount = 0
                        yCount = yCount + 1
                    else
                        yCount = 0
                        xCount = xCount + 1
                    end
                end
                lastFilter = display[sortMethod]
                xOff = xOff or 0
                yOff = yOff or 0
                local x = (width + spacingX) * xCount
                local y = (height + spacingY) * yCount
                x = (x * multX) + xOff
                y = (y * multY) + yOff
                display.xOffsetNew = x
                display.yOffsetNew = y
                maxX = max(maxX, abs(x))
                maxY = max(maxY, abs(y))
                if isHorizontal then
                    xCount = xCount + 1
                else
                    yCount = yCount + 1
                end
            end
        end
        if CenteredHorizontal or CenteredVertical then
            local xAdd = selfPoint and (selfPoint == "TOP" or selfPoint == "BOTTOM") and 0 or width
            local yAdd = selfPoint and (selfPoint == "LEFT" or selfPoint == "RIGHT") and 0 or height
            local centeredOffsetX = (maxX + xAdd)/2 * -multX
            local centeredOffsetY = (maxY + yAdd)/2 * -multY
            for i, display in ipairs(sortedDisplays) do
                if CenteredHorizontal then
                    display.xOffsetNew = display.xOffsetNew + centeredOffsetX
                end
                if CenteredVertical then
                    display.yOffsetNew = display.yOffsetNew + centeredOffsetY
                end
            end
        end
        return true
    end

    local SetAnchor = function(forceUpdate, display, parent, anchorTo, sel, rel, xOffset, yOffset)
        if forceUpdate or (not display.anchorTo) or (display.anchorTo ~= anchorTo) then
            display:ClearAllPoints()
            --display:SetParent(parent)
            display:ApplyParent(parent)
            display:SetPoint(sel, anchorTo, rel, xOffset, yOffset)
            display.selfPoint = sel
            display.relPoint = rel
            display.anchorTo = anchorTo
            display.xOffset = xOffset
            display.yOffset = yOffset
            display.xOffsetNew = nil
            display.yOffsetNew = nil
        elseif (xOffset ~= display.xOffset or yOffset ~= display.yOffset) then
            display:SetPoint(sel, display.anchorTo, rel, xOffset, yOffset)
            display.xOffset = xOffset
            display.yOffset = yOffset
            display.xOffsetNew = nil
            display.yOffsetNew = nil
        end
    end

    _Cooldowns.UpdatePositionsThrottled = function(groupIndex, specificUnit, forceUpdate)
        local primary, secondary, selfPoint, multX, multY = _Cooldowns.GetGrowPointsinfo(groupIndex)
        local isVertical = (primary == "UP" or primary == "DOWN")
        local isHoriztonal = not isVertical
        local CenteredHorizontal, CenteredVertical = _Cooldowns.GetCenterHorizontal(groupIndex), _Cooldowns.GetCenterVertical(groupIndex)
        local sortMethod = _Cooldowns.GetSortMethod(groupIndex)
        local newRow = _Cooldowns.GetNewRow(groupIndex)
        newRow = newRow and not (sortMethod == "priority" or sortMethod == "expirationTime")
        local x, y, spacingX, spacingY = 0, 0, _Cooldowns.GetXSpacing(groupIndex), _Cooldowns.GetYSpacing(groupIndex)
        local growCount = _Cooldowns.GetGrowNumber(groupIndex)
        local width, height = _Cooldowns.GetWidth(groupIndex), _Cooldowns.GetHeight(groupIndex)

        if _Cooldowns.GetAnchorToUnitframes(groupIndex) then

            local sel = _Cooldowns.GetDisplayAnchorPoint(groupIndex)
            local rel = _Cooldowns.GetUnitframeAnchorPoint(groupIndex)
            local xOff = _Cooldowns.GetUnitFrameAnchorOffsetX(groupIndex)
            local yOff = _Cooldowns.GetUnitFrameAnchorOffsetY(groupIndex)
            if not displays[groupIndex] then return end

            if specificUnit then
                local sortedDisplays = _Cooldowns.SortCooldowns(groupIndex, specificUnit)
                if not sortedDisplays then return end
                local unitFrame
                if _Cooldowns.GetAutoAnchor(groupIndex) then
                    unitFrame = LibGetFrame.GetUnitFrame(specificUnit, {ignorePlayerFrame = false})
                else
                    local prioTable = _Cooldowns.GetPrioTableForGroupIndex(groupIndex)
                    unitFrame = LibGetFrame.GetUnitFrame(specificUnit, {framePriorities = prioTable, ignorePlayerFrame = false})
                end
                if unitFrame then
                    local anchorTo = unitFrame
                    local positionsCalculated = getPositions(sortedDisplays, sortMethod, newRow, isHoriztonal, isVertical, growCount, width, height, spacingX, spacingY, multX, multY, xOff, yOff, CenteredHorizontal, CenteredVertical, sel)
                    if positionsCalculated then
                        for i, display in ipairs(sortedDisplays) do
                            SetAnchor(forceUpdate, display, anchorTo, anchorTo, sel, rel, display.xOffsetNew, display.yOffsetNew)
                        end
                    end
                end
            else
                for unit, spells in pairs(displays[groupIndex]) do
                    local sortedDisplays = _Cooldowns.SortCooldowns(groupIndex, unit)
                    local unitFrame
                    local auto
                    if _Cooldowns.GetAutoAnchor(groupIndex) then
                        unitFrame = LibGetFrame.GetUnitFrame(unit, {ignorePlayerFrame = false})
                        auto = true
                    else
                        local prioTable = _Cooldowns.GetPrioTableForGroupIndex(groupIndex)
                        unitFrame = LibGetFrame.GetUnitFrame(unit, {framePriorities = prioTable, ignorePlayerFrame = false})
                        auto = false
                    end
                    if unitFrame then
                        local anchorTo = unitFrame
                        local positionsCalculated = getPositions(sortedDisplays, sortMethod, newRow, isHoriztonal, isVertical, growCount, width, height, spacingX, spacingY, multX, multY, xOff, yOff, CenteredHorizontal, CenteredVertical, sel)
                        if positionsCalculated then
                            for i, display in ipairs(sortedDisplays) do
                                SetAnchor(forceUpdate, display, anchorTo, anchorTo, sel, rel, display.xOffsetNew, display.yOffsetNew)
                            end
                        end
                    end
                end
            end
        else
            local sortedDisplays = _Cooldowns.SortCooldowns(groupIndex)
            if not sortedDisplays then return end
            local sel = selfPoint
            local rel = "CENTER"
            local anchorTo = _Cooldowns.AnchorFrames[groupIndex]
            local positionsCalculated = getPositions(sortedDisplays, sortMethod, newRow, isHoriztonal, isVertical, growCount, width, height, spacingX, spacingY, multX, multY, xOff, yOff, CenteredHorizontal, CenteredVertical)
            if positionsCalculated then
                for i, display in ipairs(sortedDisplays) do
                    SetAnchor(forceUpdate, display, EchoCooldownsFrame, anchorTo, sel, rel, display.xOffsetNew, display.yOffsetNew)
                end
            end
        end
        if _Cooldowns.IsConfigOpen() and _Cooldowns.GetCurrentGroupIndex() == groupIndex then
            _Cooldowns.UpdateBackdropFrames(groupIndex)
        end
    end

    _Cooldowns.UpdateDisplay = function(groupIndex, unit, spellID, isReady, timeLeft, charges, minValue, maxValue, currentValue, duration, buffDuration)
        local updatePositions, display = false
        local forceStateUpdate = false
        if displays[groupIndex] and displays[groupIndex][unit] and displays[groupIndex][unit][spellID] then
            display = displays[groupIndex][unit][spellID]
            -- this isn't a new spell and we can skip the initial setup and move to the updated stuff
            display.dirty = nil
            local changed = false
            if isReady ~= display.isReady then
                changed = true
            elseif timeLeft ~= display.timeLeft then
                changed = true
            elseif charges ~= display.charges then
                changed = true
            elseif minValue ~= display.minValue then
                changed = true
            elseif maxValue ~= display.maxValue then
                changed = true
            elseif currentValue ~= display.currentValue then
                changed = true
            elseif duration ~= display.duration then
                changed = true
            elseif buffDuration ~= display.buffDuration then
                changed = true
            end
            if not changed then
                return
            end
            -- exit if not changes
        else
            if not validateUnit(unit) then return end
            display = Acquire()
            display.displayName = groupIndex..unit..spellID
            displays[groupIndex] = displays[groupIndex] or {}
            displays[groupIndex][unit] = displays[groupIndex][unit] or {}
            displays[groupIndex][unit][spellID] = display
            displaysByGroup[groupIndex] = displaysByGroup[groupIndex] or {}
            displaysByGroup[groupIndex][display.displayName] = display
            updatePositions = true
            display.isReady = isReady
            display.timeLeft = timeLeft
            display.charges = charges
            display.minValue = minValue
            display.maxValue = maxValue
            display.currentValue = currentValue
            display.duration = duration
            display.baseDuration = LIB_OPEN_RAID_COOLDOWNS_INFO[spellID] and LIB_OPEN_RAID_COOLDOWNS_INFO[spellID].cooldown or 60

            if _Cooldowns.GetMouseoverTooltips(groupIndex) then
                _Cooldowns.SetupMouseoverTooltips(display)
            end
            local spellName, _, icon = GetSpellInfo(spellID)

            display.groupIndex = groupIndex
            display.unit = unit
            display.spellID = spellID
            display.spellName = spellName
            display.icon = icon
            display.states = {}
            for _, stateDetails in pairs(types.availableStates) do
                display.states[stateDetails.state] = false
            end

            display.class = unit:find("test") and _Cooldowns.getSpellClass(spellID) or select(2, UnitClass(unit))
            display.ClassColor = C_ClassColor.GetClassColor(display.class)
            display.ClassColor.a = 1
            display:SetUpBorder()

            -- iterate text types and set up fonts, sizes and colours. 
            for _, textType in pairs(types.textTypes) do
                display:SetTextFontAndSize(textType)
                display:SetAnchor(textType)
                display:SetTextShadowColor(textType)
                display:SetShadowOffsets(textType)
            end

            -- handle Spell and Unit specific text settings. 
            display:SetSpellNameText()

            display.UnitName = unit:find("test") and _Cooldowns.getRandomName() or UnitName(unit)
            display:SetUnitNameText()

            display:SetDurationPrecision()
            display:SetStatusBarTexture()
            display:SetStatusBarBackgroundTexture()
            display:UpdateBarBackgroundColor()
            display:SetBarInverse()
            display:SetBarReverse()
            display:UpdateIconZoom()
            display:SetSparkEnable()
            display:ShowCooldownSwipe()
            display:ShowCooldownEdge()
            display:RegisterElvUI()
            display:ShowCooldownNumbers(_Cooldowns.GetCooldownNumbers(groupIndex))
            display:UpdateIconColor()
            display:SetDisplayAlpha()
            display:UpdateBarForegroundAlpha()
            display:UpdateBarBackgroundAlpha()

            display:UpdateBarEnable()
            display:UpdateIconEnable()
            display:SetDisplaySize()

            display.IconTexture:SetTexture(icon)

            display:SetGlowRegion()
            display:UpdateGlowShow()
            display:UpdateFlashShow()
            display.Icon.Cooldown:Show()

            forceStateUpdate = true
        end
        display.OnCD = not isReady

        -- handle updated values
        display.count = charges
        if _Cooldowns.GetChargesTextEnable(groupIndex) and (charges > 1 or (charges > 0 and not isReady)) then
            display.ChargesText:SetText(charges)
            display.ChargesText:Show()
        elseif display.ChargesText:IsShown() then
            display.ChargesText:Hide()
        end

        display.priority = _Cooldowns.GetSpellPriority(spellID, groupIndex) or 9999

        if isReady then
            display.duration = 0
            display.expirationTime = 0
            display.start = 0
            display.buffUp = false
            display.buffExpirationTime = nil
            display.StatusBar:SetMinMaxValues(0,1)
            display.StatusBar.Spark:Hide()
            display.StatusBar:SetValue(1)
            display.Icon.Cooldown:Clear()
            display.DurationText:Hide()
            display:SetScript("OnUpdate", nil)
            if display.DurationText:IsShown() then
                display.DurationText:Hide()
            end
        elseif maxValue and minValue then
            display.duration = maxValue - minValue
            display.expirationTime = maxValue
            display.start = minValue

            display:ShowSpark()
            if _Cooldowns.GetDurationTextEnable(groupIndex) then
                display.DurationText:Show()
            end

            display.StatusBar:SetMinMaxValues(minValue,maxValue)
            display.StatusBar:SetValue(GetTime())
            display.Icon.Cooldown:SetCooldown(display.start, display.duration)

            if buffDuration and buffDuration > 0 and not display.buffExpirationTime then
                display.buffDuration = buffDuration
                display.buffExpirationTime = minValue + buffDuration
                display.buffStart = minValue
                display.buffUp = display.buffExpirationTime > GetTime()
            end

            if display.buffExpirationTime and display.buffExpirationTime > GetTime() then
                display:StartBuff()
            end

            display:SetScript("OnUpdate", display.durationUpdate)
        end

        display:SetCurrentStates(forceStateUpdate)

        if updatePositions
        or _Cooldowns.GetSortMethod(groupIndex) == "expirationTime"
        or _Cooldowns.GetSortMethodSecondary(groupIndex) == "expirationTime"
        then
            _Cooldowns.UpdatePositions(groupIndex, unit)
        end
    end

    _Cooldowns.UpdateSpell = function(groupIndex, unit, spellID, isReady, timeLeft, charges, minValue, maxValue, currentValue, duration, buffDuration)
        if unit
        and groupIndex
        and _Cooldowns.IsGroupActive(groupIndex)
        and (_Cooldowns.IsGroupLoaded(groupIndex) or _Cooldowns.GetTestDisplays())
        --and (not _Cooldowns.IsUnitHidden(unit, groupIndex))
        then
            _Cooldowns.UpdateDisplay(groupIndex, unit, spellID, isReady, timeLeft, charges, minValue, maxValue, currentValue, duration, buffDuration)
        end
    end

    local refreshMedia = function()
    for display in displayPool:EnumerateActive() do
            display.StatusBar:SetStatusBarTexture(_Cooldowns.GetStatusBarTexture(_Cooldowns.BarGetBarTexture(display.groupIndex)))
            display.StatusBar.Background:SetTexture(_Cooldowns.GetStatusBarTexture(_Cooldowns.BarGetBarBackgroundTexture(display.groupIndex)))
            for _, textType in pairs(types.textTypes) do
                local style = _Cooldowns["Get"..textType.."FontStyle"](self.groupIndex)
                style = style == "NONE" and "" or style
                display[textType]:SetFont(
                    _Cooldowns.GetFontPath(_Cooldowns["Get"..textType.."Font"](display.groupIndex)),
                    _Cooldowns["Get"..textType.."Size"](display.groupIndex),
                    style
                )
            end
        end
    end
    local flag
    _Cooldowns.RefreshMedia = function()
        if not flag then
            flag = true
            C_Timer.After(0.1, function()
                refreshMedia()
                flag = false
            end)
        end
    end

    local unitFrame_callback = function(event, frame, unit, previousUnit)
        for groupIndex = 1, _Cooldowns.GetNumGroups() do
            if _Cooldowns.GetAnchorToUnitframes then
                _Cooldowns.UpdatePositions(groupIndex, unit)
            end
        end
    end
    LibGetFrame.RegisterCallback(_Cooldowns, "GETFRAME_REFRESH", unitFrame_callback)
    LibGetFrame.RegisterCallback(_Cooldowns, "FRAME_UNIT_UPDATE", unitFrame_callback)
    LibGetFrame.RegisterCallback(_Cooldowns, "FRAME_UNIT_REMOVED", unitFrame_callback)

end