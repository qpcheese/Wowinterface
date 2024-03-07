local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

local LibSharedMedia = LibStub:GetLibrary ("LibSharedMedia-3.0")
local LibReadOnly = LibStub:GetLibrary("LibReadOnly")
local LibGetFrame = LibStub:GetLibrary("LibGetFrame-1.0")
local types = _Cooldowns.types

function _Cooldowns:LoadSettings()
    local data = EchoRaidToolsDB.Cooldowns

    data.groups = data.groups or {}

    local statusQueue = {}
    _Cooldowns.ShowConfig = function()
        --[[if not next(data.groups) then
            _Cooldowns.AddNewGroup("Cooldowns Group")
        end]]
        local index = _Cooldowns.GetCurrentGroupIndex()
        if _Cooldowns.GetModuleEnabled() then
            if index then
                _Cooldowns.ShowBackdropFrames(index)
            end

            _Cooldowns.showOtherAnchors = true
            if _Cooldowns.controls and _Cooldowns.controls["AnchorToUnitframes"] then
                _Cooldowns.controls["AnchorToUnitframes"]:Update()
            end
            _Cooldowns.ShowAllActiveAnchors()
        end

        local maxMessages = #statusQueue
        if maxMessages == 1 then
            _EchoRaidTools:SetStatus(statusQueue[1])
        else
            for i, message in ipairs(statusQueue) do
                C_Timer.After((i-1)*5, function() _EchoRaidTools:SetStatus(message) end)
            end
        end
    end

    local groupBaseData
    do
        groupBaseData = {
            Enable = true,
            Hide = true,
            displaySettings = {
                Height = 25,
                Width = 100,
                Alpha = 100,
                enableUptimes = true,
                mouseoverTooltips = false,
                glowEnable = false,
                glowRegion = "display",
                -- bar
                barTexture = "Blizzard Raid Bar",
                barBackgroundTexture = "Blizzard Raid Bar",
                barForegroundAlpha = 100,
                barBackgroundAlpha = 30,
                enableBar = true,
                barInverse = false,
                barReverse = false,
                barSpark = false,
                useClassColor = true,
                barColor = CreateColor(1,1,1,1),
                BackgroundUseClassColor = false,
                barBackgroundColor = CreateColor(0,0,0,0.4),
                --border
                UseBorder = true,
                Border = "1 Pixel",
                BorderSize = 1,
                BorderColor = CreateColor(0,0,0,0),
                BorderOffsetX = 0,
                BorderOffsetY = 0,
                useBorderClassColor = false,
                borderRegion = "display",
                --icon
                iconSide = "left",
                iconZoom = 0,
                iconColor = CreateColor(1,1,1,1),
                showCooldownNumbers = true,
                showCooldownSwipe = true,
                showCooldownEdge = true,
                enableIcon = true,
                desaturateIcon = false,
            },
            layoutSettings = {
                SortMethod = "expirationTime",
                SortAscending = true,
                ignoreSelf = false,
                showTanks = true,
                showHealers = true,
                showDPS = true,
                SortMethodSecondary = "priority",
                SortAscendingSecondary = true,
                sortFlaggedLast = true,
                spacingX = 1,
                spacingY = 1,
                PrimaryGrowthDirection = "DOWN",
                GrowNumber = 0,
                SecondaryGrowthDirection = "RIGHT",
                CenterHorizontal = false,
                CenterVertical = false,
                newRow = false,
                AnchorPositionX = 0,
                AnchorPositionY = Round((GetScreenHeight()/2) - 100),
                DisplayAnchorPoint = "RIGHT",
                UnitframeAnchorPoint = "LEFT",
                UnitFrameAnchorOffsetX = 0,
                UnitFrameAnchorOffsetY = 0,
                displayLimit = 0,
                useAutoAnchor = true,
                anchorPrio = "Auto",
                overideStrata = false,
                strata = 3,
            },

        }
        groupBaseData.spells = {}
        groupBaseData.spellsByID = {}

        groupBaseData.texts = {}
        for _, textType in pairs(types.textTypes) do
            groupBaseData.texts[textType.."Enable"] = true
            groupBaseData.texts[textType.."Font"] = "Expressway MonoNum"
            groupBaseData.texts[textType.."Size"] = 12
            groupBaseData.texts[textType.."FontStyle"] = "NONE"
            groupBaseData.texts[textType.."TextShadowColor"] = CreateColor(0,0,0,1)
            groupBaseData.texts[textType.."TextShadowOffsetX"] = 1
            groupBaseData.texts[textType.."TextShadowOffsetY"] = -1
            groupBaseData.texts[textType.."Color"] = CreateColor(1,1,1,1)
            if textType == "UnitNameText" then
                groupBaseData.texts["UnitNameTextUseAbbreviate"] = true
                groupBaseData.texts["UnitNameTextAbbreviateNumber"] = 8
                groupBaseData.texts[textType.."Enable"] = true

            elseif textType == "SpellNameText" then
                groupBaseData.texts["SpellNameTextAbbreviateType"] = "ABC"
                groupBaseData.texts[textType.."Enable"] = true
                groupBaseData.texts[textType.."Color"] = CreateColor(1,1,1,0.5)

            elseif textType == "DurationText" then
                groupBaseData.texts["DurationTextThreshold"] = 5
                groupBaseData.texts["DurationTextDecimals"] = 1
                groupBaseData.texts[textType.."Enable"] = false

            end
        end

        groupBaseData.texts.SpellNameTextTextAnchor = "TOPLEFT"
        groupBaseData.texts.SpellNameTextDisplayAnchor = "TOPLEFT"
        groupBaseData.texts.SpellNameTextOffsetX = 2
        groupBaseData.texts.SpellNameTextOffsetY = -1
        groupBaseData.texts.SpellNameTextAnchorTo = "bar"
        groupBaseData.texts.SpellNameTextClassColor = false
        groupBaseData.texts.UnitNameTextTextAnchor = "BOTTOMLEFT"
        groupBaseData.texts.UnitNameTextDisplayAnchor = "BOTTOMLEFT"
        groupBaseData.texts.UnitNameTextOffsetX = 2
        groupBaseData.texts.UnitNameTextOffsetY = 1
        groupBaseData.texts.UnitNameTextAnchorTo = "bar"
        groupBaseData.texts.UnitNameTextClassColor = true
        groupBaseData.texts.DurationTextTextAnchor = "CENTER"
        groupBaseData.texts.DurationTextDisplayAnchor = "CENTER"
        groupBaseData.texts.DurationTextOffsetX = 0
        groupBaseData.texts.DurationTextOffsetY = 0
        groupBaseData.texts.DurationTextAnchorTo = "icon"
        groupBaseData.texts.DurationTextClassColor = false
        groupBaseData.texts.ChargesTextTextAnchor = "BOTTOMRIGHT"
        groupBaseData.texts.ChargesTextDisplayAnchor = "BOTTOMRIGHT"
        groupBaseData.texts.ChargesTextOffsetX = -1
        groupBaseData.texts.ChargesTextOffsetY = 1
        groupBaseData.texts.ChargesTextAnchorTo = "icon"
        groupBaseData.texts.ChargesTextClassColor = false

        groupBaseData.loadSettings = {
            combat = {
                inCombat = false,
                inEncounter = false,
                encounterID = nil,
                InInstance = false,
            },
            group = {
                solo = false,
                inParty = false,
                inRaid = false,
            },
            instance = {
                raidInstance = false,
                dungeonInstance = false,
                arenaInstance = false,
                battlegroundInstance = false,
            },
            difficulty = {
                raidLFR = false,
                raidNormal = false,
                raidHeroic = false,
                raidMythic = false,
            },
            role = {
                roleDPS = false,
                roleHealer = false,
                roleTank = false,
            },
            encounter = {
                string = "",
                encounters = {},
            },
            specs = {
                useSpecs = false,
            }
        }
        for i, specs in ipairs(types.fullSpecList) do
            for j, specDetails in ipairs(specs) do
                groupBaseData.loadSettings.specs[specDetails.specID] = false
            end
        end

        groupBaseData.stateSettings = {
            subGroups = {
            group1 = true,
            group2 = true,
            group3 = true,
            group4 = true,
            group5 = false,
            group6 = false,
            group7 = false,
            group8 = false,
            },
        }
        for i, stateDetails in ipairs(types.availableStates) do
            groupBaseData.stateSettings[stateDetails.state] = {}
        end

        groupBaseData.spells = {}
        groupBaseData.spellsByID = {}
        --[[for _, spellInfo in pairs(types.fullSpellList) do
            if spellInfo.type == 3 then
                table.insert(groupBaseData.spells, spellInfo.spellID)
                groupBaseData.spellsByID[spellInfo.spellID] = true
            end
        end]]

    end

    local GetNewData = function()
        local newData = tDClone(groupBaseData)
        return newData
    end

    _Cooldowns.Modernise(data, GetNewData())

    data.ModuleEnabled = not not data.ModuleEnabled

    _Cooldowns.GetModuleEnabled = function()
        return data.ModuleEnabled
    end
    _Cooldowns.ToggleModuleEnabled = function()
        data.ModuleEnabled = not data.ModuleEnabled
        if data.ModuleEnabled then
            _Cooldowns.RequestNewCooldownInfo()
            _Cooldowns.BuildGroups()
            _Cooldowns.ShowAllActiveAnchors()
        else
            _Cooldowns.ClearAllEchoCooldowns()
            _Cooldowns.UpdateNavigation()
        end
    end

    local numGroups = #data.groups
    _Cooldowns.GetNumGroups = function()
        return numGroups
    end

    local GetUniqueName = function(wantedName)
        local baseName = wantedName or "New Group"
        local name, index = baseName, 0
        local groupExists = function(name)
            for _, group in ipairs(data.groups) do
                if group.name == name then
                    return true
                end
            end
        end
        while groupExists(name) do
            index = index + 1
            name = format("%s %d", baseName, index)
        end
        return name
    end

    _Cooldowns.AddNewGroup = function(groupName)
        _Cooldowns.HideDialogPopup()
        local name = GetUniqueName(groupName)
        table.insert(data.groups, {name = name, groupData = GetNewData()})

        numGroups = #data.groups
        local newIndex = numGroups
        _Cooldowns.NewGroupAnchor(newIndex)
        if _Cooldowns.IsConfigOpen() and not _Cooldowns.GetAnchorToUnitframes(newIndex) then
            _Cooldowns.SetAnchorShow(true, newIndex)
        end
        _Cooldowns.SetCurrentGroup(newIndex)
        _Cooldowns.CheckLoads(newIndex)
        _Cooldowns.RequestNewCooldownInfo(newIndex)
        _Cooldowns.UpdatePositions(newIndex, nil, true)
        _Cooldowns.ShowGeneralSection()
        _Cooldowns.UpdateNavigation(newIndex)
        local groupName = _Cooldowns.GetGroupName(newIndex)
        _EchoRaidTools:SetStatus(format([[New Cooldowns Group "%s" added!]], groupName), 5)
        _Cooldowns.SendGroupsChangedCallback()
    end

    _Cooldowns.DeleteCurrentGroup = function()
        local index = _Cooldowns.GetCurrentGroupIndex()
        _Cooldowns.DeleteGroup(index)
    end
    _Cooldowns.ExecuteDeleteGroup = function(groupIndex)
        if _Cooldowns.GetTestDisplays() then _Cooldowns.ToggleTestDisplays() end
        local groupName = _Cooldowns.GetGroupName(groupIndex)
        _EchoRaidTools:SetStatus(format([[Cooldowns Group "%s" deleted!]], groupName), 5)
        table.remove(data.groups, groupIndex)
        _Cooldowns.UpdatePositions(groupIndex, nil, true, true)
        _Cooldowns.ClearAllEchoCooldowns()
        _Cooldowns.BuildGroups()

        _Cooldowns.SetCurrentGroup(#data.groups)
        numGroups = #data.groups

        _Cooldowns.ShowAllActiveAnchors()
        _Cooldowns.RequestNewCooldownInfo()

        _Cooldowns.RefreshAllSettings()

        --_Cooldowns.UpdatePositions(1, nil, true)
        _Cooldowns.ShowGeneralSection()
        _Cooldowns.UpdateNavigation()
        _Cooldowns.SendGroupsChangedCallback()
    end
    _Cooldowns.DeleteGroup = function(groupIndex)
        local popup = _Cooldowns.GetDialogPopup()
        popup:ClearAllPoints()
        popup:SetPoint("CENTER")
        popup:Show()
        local name = _Cooldowns.GetGroupName(groupIndex)
        popup.Text:SetText("Do you really want to delete the following Cooldowns Group?\n"..name)
        popup.OKButton:SetScript("OnClick", function()
            popup.OKButton:SetScript("OnClick", nil)
            popup:Hide()
            _Cooldowns.ExecuteDeleteGroup(groupIndex)
        end)
        popup.CancelButton:SetScript("OnClick", function()
            popup.OKButton:SetScript("OnClick", nil)
            popup:Hide()
        end)
    end

    _Cooldowns.CopyCurrentGroup = function()
        _Cooldowns.HideDialogPopup()
        local baseName = _Cooldowns.GetCurrentGroupName() .. " Copy"
        local name = GetUniqueName(baseName)

        local copyData = CopyTable(_Cooldowns.GetCurrentGroupData())
        copyData.layoutSettings.AnchorPositionX = 0
        copyData.layoutSettings.AnchorPositionY = Round((GetScreenHeight()/2) - 100)
        table.insert(data.groups, {name = name, groupData = copyData})
        numGroups = #data.groups
        local newIndex = numGroups
        _Cooldowns.NewGroupAnchor(newIndex)
        if not _Cooldowns.GetAnchorToUnitframes(newIndex) then
            _Cooldowns.SetAnchorShow(true, newIndex)
        end
        _Cooldowns.SetCurrentGroup(newIndex)
        _Cooldowns.CheckLoads(newIndex)
        _Cooldowns.RequestNewCooldownInfo(newIndex)
        _Cooldowns.UpdatePositions(newIndex, nil, true)
        _Cooldowns.ShowGeneralSection()
        _Cooldowns.UpdateNavigation(newIndex)
        _Cooldowns.SendGroupsChangedCallback()
    end

    _Cooldowns.CopyGroup = function(groupIndex)
        _Cooldowns.HideDialogPopup()
        local baseName = _Cooldowns.GetGroupName(groupIndex) .. " Copy"
        
        local name = GetUniqueName(baseName)

        local copyData = CopyTable(_Cooldowns.GetGroupData(groupIndex))
        copyData.layoutSettings.AnchorPositionX = 0
        copyData.layoutSettings.AnchorPositionY = Round((GetScreenHeight()/2) - 100)
        table.insert(data.groups, {name = name, groupData = copyData})
        numGroups = #data.groups
        local newIndex = numGroups
        _Cooldowns.NewGroupAnchor(newIndex)
        if not _Cooldowns.GetAnchorToUnitframes(newIndex) then
            _Cooldowns.SetAnchorShow(true, newIndex)
        end
        _Cooldowns.SetCurrentGroup(newIndex)
        _Cooldowns.CheckLoads(newIndex)
        _Cooldowns.RequestNewCooldownInfo(newIndex)
        _Cooldowns.UpdatePositions(newIndex, nil, true)
        _Cooldowns.ShowGeneralSection()
        _Cooldowns.UpdateNavigation(newIndex)
        local groupName = _Cooldowns.GetGroupName(newIndex)
        local copyName = _Cooldowns.GetGroupName(groupIndex)
        _EchoRaidTools:SetStatus(format([[New Cooldowns Group "%s" added! (Copied from "%s")]], groupName, copyName), 5)
        _Cooldowns.SendGroupsChangedCallback()
    end

    _Cooldowns.ImportGroup = function(groupTable)
        _Cooldowns.HideDialogPopup()
        local baseName = groupTable.name
        local name = GetUniqueName(baseName)

        table.insert(data.groups, {name = name, groupData = groupTable.groupData})
        _Cooldowns.Modernise(data, GetNewData())
        numGroups = #data.groups
        local newIndex = numGroups
        _Cooldowns.NewGroupAnchor(newIndex)
        if not _Cooldowns.GetAnchorToUnitframes(newIndex) then
            _Cooldowns.SetAnchorShow(true, newIndex)
        end
        _Cooldowns.SetCurrentGroup(newIndex)
        _Cooldowns.CheckLoads(newIndex)
        _Cooldowns.RequestNewCooldownInfo(newIndex)
        _Cooldowns.UpdatePositions(newIndex, nil, true)
        _Cooldowns.ShowGeneralSection()
        _Cooldowns.UpdateNavigation(newIndex)
        _Cooldowns.SendGroupsChangedCallback()
        local groupName = _Cooldowns.GetGroupName(newIndex)
        return groupName
    end

    _Cooldowns.ImportMultipleGroups = function(multiGroupTable)
        for i, groupTable in ipairs(multiGroupTable) do
            EchoRaidToolsDB.Cooldowns.version = multiGroupTable.version
            _Cooldowns.ImportGroup(groupTable)
        end
    end

    _Cooldowns.CurrentGroup = _Cooldowns.GetNumGroups() > 0 and 1 or 0
    _Cooldowns.SetCurrentGroup = function(index)
        if index ~= _Cooldowns.GetCurrentGroupIndex() then
            if _Cooldowns.GetTestDisplays() then _Cooldowns.ToggleTestDisplays() end
            for backdrop in _Cooldowns.backdropPool:EnumerateActive() do
                backdrop:Hide()
            end
            _Cooldowns.CurrentGroup = index
            if _Cooldowns.IsConfigOpen() and _Cooldowns.GetModuleEnabled() then
                _Cooldowns.RefreshAllSettings()
                _Cooldowns.ShowBackdropFrames(index)
            end
        end
    end
    _Cooldowns.GetCurrentGroupIndex = function()
        return _Cooldowns.CurrentGroup
    end
    _Cooldowns.GetCurrentGroupName = function()
        if data.groups[_Cooldowns.CurrentGroup] then
            return _Cooldowns.CurrentGroup and data.groups[_Cooldowns.CurrentGroup] and data.groups[_Cooldowns.CurrentGroup].name
        end
    end
    _Cooldowns.GetGroupName = function(index)
        index = index or _Cooldowns.GetCurrentGroupIndex()
        return data.groups[index] and data.groups[index].name or ""
    end
    _Cooldowns.GetCurrentGroupData = function()
        return _Cooldowns.CurrentGroup and data.groups[_Cooldowns.CurrentGroup] and data.groups[_Cooldowns.CurrentGroup].groupData
    end
    _Cooldowns.GetGroupData = function(index)
        return data.groups[index] and data.groups[index].groupData
    end
    _Cooldowns.GetGroupLoadSettings = function(index)
        return data.groups[index] and data.groups[index].groupData.loadSettings
    end
    _Cooldowns.RenameCurrentGroup = function(groupName)
        if groupName == _Cooldowns.GetCurrentGroupName() then return end
        local baseName = groupName or "Group"
        local name, index = baseName, 0
        local groupExists = function(name)
            for _, group in ipairs(data.groups) do
                if group.name == name then
                    return true
                end
            end
        end
        while groupExists(name) do
            index = index + 1
            name = format("%s %d", baseName, index)
        end
        data.groups[_Cooldowns.CurrentGroup].name = name
        _Cooldowns.AnchorFrames[_Cooldowns.GetCurrentGroupIndex()].GroupName:SetText(name)
        _Cooldowns.UpdateNavigation()
    end
    _Cooldowns.RenameGroup = function(groupName, groupIndex)
        local oldGroupName = _Cooldowns.GetGroupName(groupIndex)
        if groupName == oldGroupName then return end
        local baseName = groupName or "Group"
        local name, index = baseName, 0
        local groupExists = function(name)
            for _, group in ipairs(data.groups) do
                if group.name == name then
                    return true
                end
            end
        end
        while groupExists(name) do
            index = index + 1
            name = format("%s %d", baseName, index)
        end
        data.groups[groupIndex].name = name
        _Cooldowns.AnchorFrames[groupIndex].GroupName:SetText(name)
        _Cooldowns.UpdateNavigation()
        _EchoRaidTools:SetStatus(format([[Cooldowns Group "%s" renamed from "%s"]], name, oldGroupName), 5)
    end

    local checkerColor = CreateColor(1,1,1,1)

    _Cooldowns.ToggleGroup = function(index)
        index = index or _Cooldowns.GetCurrentGroupIndex()
        local groupData = _Cooldowns.GetGroupData(index)
        groupData.Enable = not groupData.Enable
        if groupData.Enable then
            if not _Cooldowns.GetAnchorToUnitframes(index) then
                _Cooldowns.SetAnchorShow(true, index)
            end
            _Cooldowns.RequestNewCooldownInfo(index)
            _Cooldowns.UpdatePositions(index, nil, true)
        else
            _Cooldowns.ClearGroupCooldowns(index)
            _Cooldowns.SetAnchorShow(false, index)
            _Cooldowns.HideBackdropFrames(index)
        end
        _Cooldowns.UpdateNavigation()
        _Cooldowns.RefreshAllSettings()
    end

    _Cooldowns.DisableAllGroups = function ()
        for i = 1, _Cooldowns.GetNumGroups() do
            local groupData = _Cooldowns.GetGroupData(i)
            groupData.Enable = false
        end
        _Cooldowns.ClearAllEchoCooldowns()
        _Cooldowns.UpdateNavigation()
    end
    _Cooldowns.IsGroupActive = function(index)
        index = index or _Cooldowns.GetCurrentGroupIndex()
        local groupData = _Cooldowns.GetGroupData(index)
        return groupData and groupData.Enable
    end

    _Cooldowns.RefreshAllGroups = function()
        for i = 1, _Cooldowns.GetNumGroups() do
            _Cooldowns.RequestNewCooldownInfo(i)
        end
    end

    _Cooldowns.GetGroupSpells = function(index)
        index = index or _Cooldowns.GetCurrentGroupIndex()
        local groupData = _Cooldowns.GetGroupData(index)
        return groupData.spells
    end
    _Cooldowns.GetGroupSpellByID = function(spellID, index)
        index = index or _Cooldowns.GetCurrentGroupIndex()
        local groupData = _Cooldowns.GetGroupData(index)
        return groupData.spellsByID[spellID]
    end

    local flagForRefreshAdd
    _Cooldowns.AddSpellToGroup = function(spellID, index)
        index = index or _Cooldowns.GetCurrentGroupIndex()
        local groupData = _Cooldowns.GetGroupData(index)
        table.insert(groupData.spells, spellID)
        groupData.spellsByID[spellID] = true
        if not flagForRefreshAdd then
            flagForRefreshAdd = true
            RunNextFrame(function()
                _Cooldowns.RequestNewCooldownInfo(index)
                flagForRefreshAdd = nil
            end)
        end
    end

    local flagForRefreshRemove
    _Cooldowns.RemoveSpellFromGroup = function(spellID, index)
        index = index or _Cooldowns.GetCurrentGroupIndex()
        local groupData = _Cooldowns.GetGroupData(index)
        tDeleteItem(groupData.spells, spellID)
        groupData.spellsByID[spellID] = nil
        if not flagForRefreshRemove then
            flagForRefreshRemove = true
            RunNextFrame(function()
                _Cooldowns.RequestNewCooldownInfo(index)
                flagForRefreshRemove = nil
            end)
        end
    end

    _Cooldowns.GetSpellPriority = function(spellID, index)
        index = index or _Cooldowns.GetCurrentGroupIndex()
        local groupData = _Cooldowns.GetGroupData(index)
        return tIndexOf(groupData.spells, spellID)
    end

    _Cooldowns.SetSpellPriority = function(newPrio, spellID, index)
        index = index or _Cooldowns.GetCurrentGroupIndex()
        local groupData = _Cooldowns.GetGroupData(index)
        if type(newPrio) == "number" and newPrio > 0 and newPrio <= #groupData.spells then
            tDeleteItem(groupData.spells, spellID)
            table.insert(groupData.spells, newPrio, spellID)
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display.priority = _Cooldowns.GetSpellPriority(display.spellID, index)
            end
            _Cooldowns.UpdatePositions(index)
        end
    end

    do -- Text Settings
        for _, textType in pairs(types.textTypes) do
            if textType == "UnitNameText" then
                _Cooldowns["Get"..textType.."UseAbbreviate"] = function(index)
                    index = index or _Cooldowns.GetCurrentGroupIndex()
                    local groupData = _Cooldowns.GetGroupData(index)
                    local bool = groupData.texts[textType.."UseAbbreviate"]
                    if bool == nil then
                        bool = groupBaseData.texts[textType.."UseAbbreviate"]
                    end
                    return bool
                end
                _Cooldowns["Toggle"..textType.."UseAbbreviate"] = function(index)
                    index = index or _Cooldowns.GetCurrentGroupIndex()
                    local groupData = _Cooldowns.GetGroupData(index)
                    groupData.texts[textType.."UseAbbreviate"] = not groupData.texts[textType.."UseAbbreviate"]
                    local bool = groupData.texts[textType.."UseAbbreviate"]
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:SetUnitNameText()
                    end
                end
                _Cooldowns["GetUnitNameTextAbbreviateNumber"] = function(index)
                    index = index or _Cooldowns.GetCurrentGroupIndex()
                    local groupData = _Cooldowns.GetGroupData(index)
                    local number = groupData.texts["UnitNameTextAbbreviateNumber"]
                    if number == nil then
                        number = groupBaseData.texts["UnitNameTextAbbreviateNumber"]
                    end
                    return number
                end
                _Cooldowns["SetUnitNameTextAbbreviateNumber"] = function(number, index)
                    index = index or _Cooldowns.GetCurrentGroupIndex()
                    local groupData = _Cooldowns.GetGroupData(index)
                    if number and number ~= groupData.texts["UnitNameTextAbbreviateNumber"] then
                        groupData.texts["UnitNameTextAbbreviateNumber"] = number
                        if groupData.texts["UnitNameTextAbbreviateNumber"] then
                            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                                display:SetUnitNameText()
                            end
                        end
                    end
                end

            elseif textType == "SpellNameText" then
                _Cooldowns["GetSpellNameTextAbbreviateType"] = function(index)
                    index = index or _Cooldowns.GetCurrentGroupIndex()
                    local groupData = _Cooldowns.GetGroupData(index)
                    local type = groupData.texts["SpellNameTextAbbreviateType"]
                    if type == nil then
                        type = groupBaseData.texts["SpellNameTextAbbreviateType"]
                    end
                    return type
                end
                _Cooldowns["SetSpellNameTextAbbreviateType"] = function(value, index)
                    index = index or _Cooldowns.GetCurrentGroupIndex()
                    local groupData = _Cooldowns.GetGroupData(index)
                    if value and value ~= groupData.texts["GetSpellNameTextAbbreviateType"] then
                        groupData.texts["SpellNameTextAbbreviateType"] = value
                        for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                            display:SetSpellNameText(display.spellName)
                        end
                    end
                end

            elseif textType == "DurationText" then
                _Cooldowns["GetDurationTextThreshold"] = function(index)
                    index = index or _Cooldowns.GetCurrentGroupIndex()
                    local groupData = _Cooldowns.GetGroupData(index)
                    return groupData.texts["DurationTextThreshold"]
                end
                _Cooldowns["SetDurationTextThreshold"] = function(value, index)
                    index = index or _Cooldowns.GetCurrentGroupIndex()
                    local groupData = _Cooldowns.GetGroupData(index)
                    if value and value ~= groupData.texts["DurationTextThreshold"] then
                        groupData.texts["DurationTextThreshold"] = value
                        for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                            display:SetDurationPrecision()
                        end
                    end
                end
                _Cooldowns["GetDurationTextDecimals"] = function(index)
                    index = index or _Cooldowns.GetCurrentGroupIndex()
                    local groupData = _Cooldowns.GetGroupData(index)
                    return groupData.texts["DurationTextDecimals"]
                end
                _Cooldowns["SetDurationTextDecimals"] = function(value, index)
                    index = index or _Cooldowns.GetCurrentGroupIndex()
                    local groupData = _Cooldowns.GetGroupData(index)
                    if value and value ~= groupData.texts["DurationTextDecimals"] then
                        groupData.texts["DurationTextDecimals"] = value
                        for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                            display:SetDurationPrecision()
                        end
                    end
                end
            end

            _Cooldowns["Get"..textType.."Enable"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."Enable"]
            end
            _Cooldowns["Toggle"..textType.."Enable"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                groupData.texts[textType.."Enable"] = not groupData.texts[textType.."Enable"]
                local bool = groupData.texts[textType.."Enable"]
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    if bool then
                        display[textType]:Show()
                    else
                        display[textType]:Hide()
                    end
                end
            end
            _Cooldowns["Get"..textType.."Font"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."Font"]
            end
            _Cooldowns["Set"..textType.."Font"] = function(font, index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                local thisFont = LibSharedMedia:Fetch("font", font)
                if thisFont and font ~= groupData.texts[textType.."Font"] then
                    groupData.texts[textType.."Font"] = font
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:SetTextFontAndSize(textType)
                    end
                end
            end
            _Cooldowns["Get"..textType.."Size"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."Size"]
            end
            _Cooldowns["Set"..textType.."Size"] = function(number, index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                if number and number ~= groupData.texts[textType.."Size"] then
                    groupData.texts[textType.."Size"] = number
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:SetTextFontAndSize(textType)
                    end
                end
            end
            _Cooldowns["Get"..textType.."ClassColor"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."ClassColor"]
            end
            _Cooldowns["Toggle"..textType.."ClassColor"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                groupData.texts[textType.."ClassColor"] = not groupData.texts[textType.."ClassColor"]
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:SetTextColor(textType)
                end
            end
            
            _Cooldowns["Get"..textType.."Color"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."Color"] --:GetRGBA()
            end
            _Cooldowns["Set"..textType.."Color"] = function(r,g,b,a,index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                checkerColor:SetRGBA(r,g,b,a)
                if not AreColorsEqual(checkerColor, groupData.texts[textType.."Color"]) then
                    groupData.texts[textType.."Color"]:SetRGBA(r,g,b,a)
                    if not _Cooldowns["Get"..textType.."ClassColor"](index) then
                        for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                            display:SetTextColor(textType)
                        end
                    end
                end
            end
            _Cooldowns["Get"..textType.."TextAnchor"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."TextAnchor"]
            end
            _Cooldowns["Set"..textType.."TextAnchor"] = function(point, index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                if point and point ~= groupData.texts[textType.."TextAnchor"] then
                    groupData.texts[textType.."TextAnchor"] = point
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:SetAnchor(textType)
                    end
                end
            end
            _Cooldowns["Get"..textType.."DisplayAnchor"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."DisplayAnchor"]
            end
            _Cooldowns["Set"..textType.."DisplayAnchor"] = function(point, index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                if point and point ~= groupData.texts[textType.."DisplayAnchor"] then
                    groupData.texts[textType.."DisplayAnchor"] = point
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:SetAnchor(textType)
                    end
                end
            end
            _Cooldowns["Get"..textType.."AnchorTo"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."AnchorTo"]
            end
            _Cooldowns["Set"..textType.."AnchorTo"] = function(region, index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                if region and region ~= groupData.texts[textType.."AnchorTo"] then
                    groupData.texts[textType.."AnchorTo"] = region
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:SetAnchor(textType)
                    end
                end
            end
            _Cooldowns["Get"..textType.."OffsetX"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."OffsetX"]
            end
            _Cooldowns["Set"..textType.."OffsetX"] = function(number, index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                if number and number ~= groupData.texts[textType.."OffsetX"] then
                    groupData.texts[textType.."OffsetX"] = number
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:SetAnchor(textType)
                    end
                end
            end
            _Cooldowns["Get"..textType.."OffsetY"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."OffsetY"]
            end
            _Cooldowns["Set"..textType.."OffsetY"] = function(number, index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                if number and number ~= groupData.texts[textType.."OffsetY"] then
                    groupData.texts[textType.."OffsetY"] = number
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:SetAnchor(textType)
                    end
                end
            end
            _Cooldowns["Get"..textType.."FontStyle"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."FontStyle"]
            end
            _Cooldowns["Set"..textType.."FontStyle"] = function(style, index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                if style and style ~= _Cooldowns["Get"..textType.."FontStyle"]() then
                    groupData.texts[textType.."FontStyle"] = style
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:SetTextFontAndSize(textType)
                    end
                end
            end
            _Cooldowns["Get"..textType.."TextShadowColor"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."TextShadowColor"]
            end
            _Cooldowns["Set"..textType.."TextShadowColor"] = function(r,g,b,a,index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                checkerColor:SetRGBA(r,g,b,a)
                if not AreColorsEqual(checkerColor, groupData.texts[textType.."TextShadowColor"]) then
                    groupData.texts[textType.."TextShadowColor"]:SetRGBA(r,g,b,a)
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:SetTextShadowColor(textType)
                    end
                end
            end
            _Cooldowns["Get"..textType.."TextShadowOffsetX"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."TextShadowOffsetX"]
            end
            _Cooldowns["Set"..textType.."TextShadowOffsetX"] = function(number, index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                if number and number ~= groupData.texts[textType.."TextShadowOffsetX"] then
                    groupData.texts[textType.."TextShadowOffsetX"] = number
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:SetShadowOffsets(textType)
                    end
                end
            end
            _Cooldowns["Get"..textType.."TextShadowOffsetY"] = function(index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                return groupData.texts[textType.."TextShadowOffsetY"]
            end
            _Cooldowns["Set"..textType.."TextShadowOffsetY"] = function(number, index)
                index = index or _Cooldowns.GetCurrentGroupIndex()
                local groupData = _Cooldowns.GetGroupData(index)
                if number and number ~= groupData.texts[textType.."TextShadowOffsetY"] then
                    groupData.texts[textType.."TextShadowOffsetY"] = number
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:SetShadowOffsets(textType)
                    end
                end
            end
        end
    end -- end text settings

    do --Display settings
        _Cooldowns.BarSetBarTexture = function(texture,index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            local tex = LibSharedMedia:Fetch("statusbar", texture)
            if tex then
                groupData.displaySettings.barTexture = texture
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:SetStatusBarTexture(tex)
                end
            end
        end
        _Cooldowns.BarGetBarTexture = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.barTexture
        end

        _Cooldowns.BarSetBarBackgroundTexture = function(texture,index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            local tex = LibSharedMedia:Fetch("statusbar", texture)
            if tex then
                groupData.displaySettings.barBackgroundTexture = texture
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:SetStatusBarBackgroundTexture(tex)
                end
            end
        end
        _Cooldowns.BarGetBarBackgroundTexture = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.barBackgroundTexture
        end

        _Cooldowns.GetAlpha = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.Alpha
        end
        _Cooldowns.SetAlpha = function(number, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.Alpha = number
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:SetDisplayAlpha(number)
            end
        end

        _Cooldowns.ToggleEnableIcon = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.enableIcon = not groupData.displaySettings.enableIcon
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:ShowIcon(groupData.displaySettings.enableIcon)
            end
        end
        _Cooldowns.GetEnableIcon = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.enableIcon
        end

        _Cooldowns.SetIconColor = function(r,g,b,a, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            checkerColor:SetRGBA(r,g,b,a)
            if not AreColorsEqual(checkerColor, groupData.displaySettings.iconColor) then
                groupData.displaySettings.iconColor:SetRGBA(r,g,b,a)
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:UpdateIconColor()
                end
            end
        end
        _Cooldowns.GetIconColor = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.iconColor
        end

        _Cooldowns.SetIconSide = function(value, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if value ~= groupData.displaySettings.iconSide then
                groupData.displaySettings.iconSide = value
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:SetIconSide()
                end
            end
        end
        _Cooldowns.GetIconSide = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.iconSide
        end
        _Cooldowns.SetIconZoom = function(value, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if value ~= groupData.displaySettings.iconZoom then
                groupData.displaySettings.iconZoom = value
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:UpdateIconZoom()
                end
            end
        end
        _Cooldowns.GetIconZoom = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.iconZoom
        end

        _Cooldowns.ToggleDesaturateIcon = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.desaturateIcon = not groupData.displaySettings.desaturateIcon
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:UpdateDesaturateIcon()
            end
        end
        _Cooldowns.GetDesaturateIcon = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.desaturateIcon
        end

        _Cooldowns.ToggleCooldownNumbers = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.showCooldownNumbers = not groupData.displaySettings.showCooldownNumbers
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:ShowCooldownNumbers(groupData.displaySettings.showCooldownNumbers)
            end
        end
        _Cooldowns.GetCooldownNumbers = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.showCooldownNumbers
        end
        _Cooldowns.ToggleCooldownSwipe = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.showCooldownSwipe = not groupData.displaySettings.showCooldownSwipe
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:ShowCooldownSwipe()
            end
        end
        _Cooldowns.GetCooldownSwipe = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.showCooldownSwipe
        end
        _Cooldowns.ToggleCooldownEdge = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.showCooldownEdge = not groupData.displaySettings.showCooldownEdge
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:ShowCooldownEdge()
            end
        end
        _Cooldowns.GetCooldownEdge = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.showCooldownEdge
        end

        _Cooldowns.ToggleEnableBar = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.enableBar = not groupData.displaySettings.enableBar
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:ShowBar(groupData.displaySettings.enableBar)
            end
        end
        _Cooldowns.GetEnableBar = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.enableBar
        end

        _Cooldowns.ToggleBarInverse = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.barInverse = not groupData.displaySettings.barInverse
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:SetBarInverse()
            end
        end
        _Cooldowns.GetBarInverse = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.barInverse
        end

        _Cooldowns.ToggleBarReverse = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.barReverse = not groupData.displaySettings.barReverse
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:SetBarReverse()
            end
        end
        _Cooldowns.GetBarReverse = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.barReverse
        end

        _Cooldowns.ToggleBarSpark = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.barSpark = not groupData.displaySettings.barSpark
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:SetSparkEnable()
            end
        end
        _Cooldowns.GetBarSpark = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.barSpark
        end

        _Cooldowns.BarGetUseClassColor = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.useClassColor
        end
        _Cooldowns.BarToggleUseClassColor = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.useClassColor = not groupData.displaySettings.useClassColor
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:UpdateBarColor()
            end
        end

        _Cooldowns.BarSetBarColor = function(r,g,b,a,index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            checkerColor:SetRGBA(r,g,b,a)
            if not AreColorsEqual(checkerColor, groupData.displaySettings.barColor) then
                groupData.displaySettings.barColor:SetRGBA(r,g,b,a)
                if not _Cooldowns.BarGetUseClassColor(index) then
                    for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                        display:UpdateBarColor()
                    end
                end
            end
        end
        _Cooldowns.BarGetBarColor = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.barColor
        end

        _Cooldowns.BarSetBarBackgroundColor = function(r,g,b,a,index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            checkerColor:SetRGBA(r,g,b,a)
            if not AreColorsEqual(checkerColor, groupData.displaySettings.barBackgroundColor) then
                groupData.displaySettings.barBackgroundColor:SetRGBA(r,g,b,a)
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:UpdateBarBackgroundColor()
                end
            end
        end
        _Cooldowns.BarGetBarBackgroundColor = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.barBackgroundColor
        end
        
        _Cooldowns.BarGetBackgroundUseClassColor = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.BackgroundUseClassColor
        end
        _Cooldowns.BarToggleBackgroundUseClassColor = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.BackgroundUseClassColor = not groupData.displaySettings.BackgroundUseClassColor
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:UpdateBarBackgroundColor()
            end
        end
        _Cooldowns.BarSetForegroundAlpha = function(value, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if value ~= groupData.displaySettings.barForegroundAlpha then
                groupData.displaySettings.barForegroundAlpha = value
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:UpdateBarForegroundAlpha()
                end
            end
        end
        _Cooldowns.BarGetForegroundAlpha = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.barForegroundAlpha
        end
        _Cooldowns.BarSetBackgroundAlpha = function(value, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if value ~= groupData.displaySettings.barBackgroundAlpha then
                groupData.displaySettings.barBackgroundAlpha = value
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:UpdateBarBackgroundAlpha()
                end
            end
        end
        _Cooldowns.BarGetBackgroundAlpha = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.barBackgroundAlpha
        end

        _Cooldowns.GetHeight = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.Height
        end
        _Cooldowns.SetHeight = function(number, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.Height = number
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:SetDisplayHeight(number)
                _Cooldowns.UpdatePositions(index, nil, true)
            end
        end
        _Cooldowns.GetWidth = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.Width
        end
        _Cooldowns.SetWidth = function(number, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.Width = number
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:SetDisplayWidth(number)
                _Cooldowns.UpdatePositions(index, nil, true)
            end
        end

        _Cooldowns.ToggleEnableUptimes = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.enableUptimes = not groupData.displaySettings.enableUptimes
        end
        _Cooldowns.GetEnableUptimes = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.enableUptimes
        end

        _Cooldowns.ToggleUseBorders = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.UseBorder = not groupData.displaySettings.UseBorder
            local bool = groupData.displaySettings.UseBorder
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                if bool then
                    display.Border:Show()
                else
                    display.Border:Hide()
                end
            end
        end
        _Cooldowns.GetUseBorders = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if groupData.displaySettings.UseBorder == nil then
                groupData.displaySettings.UseBorder = false
            end
            return groupData.displaySettings.UseBorder
        end
        _Cooldowns.SetBorder = function(value, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if value and value ~= groupData.displaySettings.Border then
                groupData.displaySettings.Border = value
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:SetUpBorder()
                end
            end
        end
        _Cooldowns.GetBorderRegion = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.borderRegion
        end
        _Cooldowns.SetBorderRegion = function(value, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if value and value ~= groupData.displaySettings.borderRegion then
                groupData.displaySettings.borderRegion = value
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:SetBorderRegion()
                end
            end
        end
        _Cooldowns.GetBorder = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if groupData.displaySettings.Border == nil then
                groupData.displaySettings.Border = "None"
            end
            return groupData.displaySettings.Border
        end
        _Cooldowns.SetBorderSize = function(value, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if value and value ~= groupData.displaySettings.BorderSize then
                groupData.displaySettings.BorderSize = value
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:SetUpBorder()
                end
            end
        end
        _Cooldowns.GetBorderSize = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if groupData.displaySettings.BorderSize == nil then
                groupData.displaySettings.BorderSize = 4
            end
            return groupData.displaySettings.BorderSize
        end
        -- update data colours to colour objects on start
        --[[for i, group in ipairs(data.groups) do
            if group.groupData.BorderColor then
                group.groupData.BorderColor = CreateColor(group.groupData.BorderColor.r, group.groupData.BorderColor.g, group.groupData.BorderColor.b, group.groupData.BorderColor.a)
            else
                group.groupData.BorderColor = CreateColor(1,1,1,1)
            end
        end]]
        _Cooldowns.SetBorderColor = function(r,g,b,a, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            checkerColor:SetRGBA(r,g,b,a)
            if not AreColorsEqual(checkerColor, groupData.displaySettings.BorderColor) then
                groupData.displaySettings.BorderColor:SetRGBA(r,g,b,a)
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:SetUpBorder()
                end
            end
        end
        _Cooldowns.GetBorderColor = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.BorderColor
        end
        _Cooldowns.SetBorderOffsetX = function(value, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if value and value ~= groupData.displaySettings.BorderOffsetX then
                groupData.displaySettings.BorderOffsetX = value
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display.Border:ClearAllPoints()
                    display.Border:SetPoint("TOPLEFT", -value, _Cooldowns.GetBorderOffsetY())
                    display.Border:SetPoint("BOTTOMRIGHT", value, 0 - _Cooldowns.GetBorderOffsetY())
                end
            end
        end
        _Cooldowns.GetBorderOffsetX = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if groupData.displaySettings.BorderOffsetX == nil then
                groupData.displaySettings.BorderOffsetX = 0
            end
            return groupData.displaySettings.BorderOffsetX
        end
        _Cooldowns.SetBorderOffsetY = function(value, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if value and value ~= groupData.displaySettings.BorderOffsetY then
                groupData.displaySettings.BorderOffsetY = value
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display.Border:ClearAllPoints()
                    display.Border:SetPoint("TOPLEFT", 0 - _Cooldowns.GetBorderOffsetX(), value)
                    display.Border:SetPoint("BOTTOMRIGHT", _Cooldowns.GetBorderOffsetX(), 0-value)
                end
            end
        end
        _Cooldowns.GetBorderOffsetY = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if groupData.displaySettings.BorderOffsetY == nil then
                groupData.displaySettings.BorderOffsetY = 0
            end
            return groupData.displaySettings.BorderOffsetY
        end
        _Cooldowns.GetBorderUseClassColor = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if groupData.displaySettings.useBorderClassColor == nil then
                groupData.displaySettings.useBorderClassColor = false
            end
            return groupData.displaySettings.useBorderClassColor
        end
        _Cooldowns.ToggleBorderUseClassColor = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.useBorderClassColor = not groupData.displaySettings.useBorderClassColor
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:SetUpBorder()
            end
        end

        _Cooldowns.ToggleUseGlow = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.glowEnable = not groupData.displaySettings.glowEnable
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:UpdateGlowShow()
            end
        end
        _Cooldowns.GetUseGlow = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.glowEnable
        end
        _Cooldowns.SetGlowRegion = function(region, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if region ~= groupData.displaySettings.glowRegion then
                groupData.displaySettings.glowRegion = region
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                    display:SetGlowRegion()
                end
            end
        end
        _Cooldowns.GetGlowRegion = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.glowRegion
        end
        _Cooldowns.ToggleUseFlash = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.flashEnable = not groupData.displaySettings.flashEnable
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                display:UpdateFlashShow()
            end
        end
        _Cooldowns.GetUseFlash = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.flashEnable
        end

        _Cooldowns.SetupMouseoverTooltips = function(display)
            display:SetScript("OnEnter",
                function(self)
                    GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
                    GameTooltip:SetFrameLevel(self:GetFrameLevel() + 2)
                    GameTooltip:SetSpellByID(self.spellID)
                end
            )
            display:SetScript("OnLeave",
                function(self)
                    GameTooltip:Hide()
                end
            )
            display:EnableMouse(false)
            display:SetMouseMotionEnabled(true)
        end
        _Cooldowns.ToggleMouseoverTooltips = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.displaySettings.mouseoverTooltips = not groupData.displaySettings.mouseoverTooltips
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(index)) do
                if groupData.displaySettings.mouseoverTooltips then
                    _Cooldowns.SetupMouseoverTooltips(display)
                else
                    display:SetScript("OnEnter", nil)
                    display:SetScript("OnLeave", nil)
                    display:SetMouseMotionEnabled(false)
                end
            end
        end
        _Cooldowns.GetMouseoverTooltips = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.displaySettings.mouseoverTooltips
        end
    end -- end display settings

    do -- Layout settings
        _Cooldowns.ToggleIgnoreSelf = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.ignoreSelf = not groupData.layoutSettings.ignoreSelf
            _Cooldowns.RequestNewCooldownInfo(index)
        end
        _Cooldowns.GetIgnoreSelf = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.ignoreSelf
        end
        _Cooldowns.ToggleShowTanks = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.showTanks = not groupData.layoutSettings.showTanks
            _Cooldowns.RequestNewCooldownInfo(index)
        end
        _Cooldowns.GetShowTanks = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.showTanks
        end
        _Cooldowns.ToggleShowHealers = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.showHealers = not groupData.layoutSettings.showHealers
            _Cooldowns.RequestNewCooldownInfo(index)
        end
        _Cooldowns.GetShowHealers = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.showHealers
        end
        _Cooldowns.ToggleShowDPS = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.showDPS = not groupData.layoutSettings.showDPS
            _Cooldowns.RequestNewCooldownInfo(index)
        end
        _Cooldowns.GetShowDPS = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.showDPS
        end
        _Cooldowns.isThisRoleShown = function(index, role)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if role == "TANK" then
                return groupData.layoutSettings.showTanks
            elseif role == "HEALER" then
                return groupData.layoutSettings.showHealers
            elseif role == "DAMAGER" then
                return groupData.layoutSettings.showDPS
            else
                return true
            end
        end
        _Cooldowns.SetSortMethod = function(method, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.SortMethod = method
            _Cooldowns.UpdatePositions(index, nil, true)
        end
        _Cooldowns.GetSortMethod = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.SortMethod
        end
        _Cooldowns.SetSortMethodSecondary = function(method, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if not method or method == _Cooldowns.GetSortMethod(index) then
                groupData.layoutSettings.SortMethodSecondary = _Cooldowns.GetSortMethod(index) == "unit" and "priority" or "unit"
            else
                groupData.layoutSettings.SortMethodSecondary = method
            end
            _Cooldowns.UpdatePositions(index)
        end
        _Cooldowns.GetSortMethodSecondary = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.SortMethodSecondary
        end
        _Cooldowns.ToggleSortFlaggedLast = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.sortFlaggedLast = not groupData.layoutSettings.sortFlaggedLast
            _Cooldowns.UpdatePositions(index)
        end
        _Cooldowns.GetSortFlaggedLast = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.sortFlaggedLast
        end
        _Cooldowns.ToggleSortAscending = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.SortAscending = not groupData.layoutSettings.SortAscending
            _Cooldowns.UpdatePositions(index)
        end
        _Cooldowns.GetSortAscending = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.SortAscending
        end
        _Cooldowns.ToggleSortAscendingSecondary = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.SortAscendingSecondary = not groupData.layoutSettings.SortAscendingSecondary
            _Cooldowns.UpdatePositions(index)
        end
        _Cooldowns.GetSortAscendingSecondary = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.SortAscendingSecondary
        end

        _Cooldowns.SetXSpacing = function(number, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if number then
                groupData.layoutSettings.spacingX = number
                _Cooldowns.UpdatePositions(index, nil, true)
            end
        end
        _Cooldowns.GetXSpacing = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.spacingX
        end
        _Cooldowns.SetYSpacing = function(number, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if number then
                groupData.layoutSettings.spacingY = number
                _Cooldowns.UpdatePositions(index, nil, true)
            end
        end
        _Cooldowns.GetYSpacing = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.spacingY
        end
        _Cooldowns.SetDisplayLimit = function(number, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if number then
                groupData.layoutSettings.displayLimit = number
                _Cooldowns.UpdatePositions(index, nil, true)
            end
        end
        _Cooldowns.GetDisplayLimit = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.displayLimit
        end
        _Cooldowns.SetPrimaryGrowthDirection = function(value,index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.PrimaryGrowthDirection = value
            _Cooldowns.UpdatePositions(index, nil, true)
        end
        _Cooldowns.GetPrimaryGrowthDirection = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.PrimaryGrowthDirection
        end

        _Cooldowns.SetGrowNumber = function(value,index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.GrowNumber = value
            _Cooldowns.UpdatePositions(index, nil, true)
        end
        _Cooldowns.GetGrowNumber = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.GrowNumber
        end

        _Cooldowns.SetSecondaryGrowthDirection = function(value,index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if not value then
                local primary = _Cooldowns.GetPrimaryGrowthDirection(index)
                groupData.layoutSettings.SecondaryGrowthDirection = (primary == "UP" or primary == "DOWN") and "RIGHT" or "DOWN"
            else
                groupData.layoutSettings.SecondaryGrowthDirection = value
            end
            _Cooldowns.UpdatePositions(index, nil, true)
        end
        _Cooldowns.GetSecondaryGrowthDirection = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.SecondaryGrowthDirection
        end

        _Cooldowns.ToggleCenterHorizontal = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.CenterHorizontal = not groupData.layoutSettings.CenterHorizontal
            _Cooldowns.UpdatePositions(index, nil, true)
        end
        _Cooldowns.GetCenterHorizontal = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.CenterHorizontal
        end
        _Cooldowns.ToggleCenterVertical = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.CenterVertical = not groupData.layoutSettings.CenterVertical
            _Cooldowns.UpdatePositions(index, nil, true)
        end
        _Cooldowns.GetCenterVertical = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.CenterVertical
        end

        _Cooldowns.ToggleNewRow = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.newRow = not groupData.layoutSettings.newRow
            _Cooldowns.UpdatePositions(index, nil, true)
        end
        _Cooldowns.GetNewRow = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.newRow
        end

        _Cooldowns.ToggleOverrideStrata = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.overideStrata = not groupData.layoutSettings.overideStrata
            _Cooldowns.UpdatePositions(index, nil, true)
        end
        _Cooldowns.GetOverrideStrata = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.overideStrata
        end
        _Cooldowns.SetStrata = function(value, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            groupData.layoutSettings.strata = value
            _Cooldowns.UpdatePositions(index, nil, true)
        end
        _Cooldowns.GetStrata = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.strata
        end
    end -- end layout settings

    do -- Anchor frame settings
        _Cooldowns.SetAnchorShow = function(bool, index)
            if not _Cooldowns.GetModuleEnabled() then return end
            index = index or _Cooldowns.GetCurrentGroupIndex()
            if bool then
                _Cooldowns.AnchorFrames[index]:Unlock()
            else
                _Cooldowns.AnchorFrames[index]:Lock()
            end
        end
        _Cooldowns.ShowAllAnchors = function()
            if not _Cooldowns.GetModuleEnabled() then return end
            for i, anchor in pairs(_Cooldowns.AnchorFrames) do
                anchor:Unlock()
            end
        end
        _Cooldowns.ShowAllActiveAnchors = function()
            if not _Cooldowns.GetModuleEnabled() then return end
            for i = 1, _Cooldowns.GetNumGroups() do
                if _Cooldowns.IsGroupActive(i) and not _Cooldowns.GetAnchorToUnitframes(i) then
                    _Cooldowns.SetAnchorShow(true, i)
                end
            end
        end
        _Cooldowns.HideAllAnchors = function()
            for i, anchor in pairs(_Cooldowns.AnchorFrames) do
                anchor:Lock()
            end
        end
        _Cooldowns.GetAnchorShow = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            return _Cooldowns.AnchorFrames[index] and not _Cooldowns.AnchorFrames[index].IsLocked
        end
        _Cooldowns.ToggleHideOtherAnchors = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            if not _Cooldowns.GetAnchorToUnitframes(index) then
                if _Cooldowns.showOtherAnchors then
                    index = index or _Cooldowns.GetCurrentGroupIndex()
                    _Cooldowns.HideAllAnchors()
                    _Cooldowns.SetAnchorShow(true, index)
                    _Cooldowns.showOtherAnchors = false
                    _Cooldowns.LocateAnchor(index)
                else
                    _Cooldowns.ShowAllActiveAnchors()
                    _Cooldowns.showOtherAnchors = true
                end
            end
        end
        _Cooldowns.GetHideOtherAnchors = function()
            return not _Cooldowns.showOtherAnchors
        end
        _Cooldowns.UpdateAnchorPosition = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            local left, bottom = _Cooldowns.AnchorFrames[index]:GetRect()
            local x = Round(left - (GetScreenWidth()/2))
            local y = Round(bottom - (GetScreenHeight()/2))
            groupData.layoutSettings.AnchorPositionX = x
            groupData.layoutSettings.AnchorPositionY = y
            _Cooldowns.controls.MainOffsetX:Update()
            _Cooldowns.controls.MainOffsetY:Update()
            _Cooldowns.UpdateBackdropFrames(index)
        end
        _Cooldowns.GetAnchorOffsets = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            return groupData.layoutSettings.AnchorPositionX, groupData.layoutSettings.AnchorPositionY
        end
        _Cooldowns.SetAnchorOffsetX = function(x, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if groupData.layoutSettings.AnchorPositionX ~= x then
                groupData.layoutSettings.AnchorPositionX = x
                _Cooldowns.AnchorFrames[index]:ClearAllPoints()
                _Cooldowns.AnchorFrames[index]:SetPoint("CENTER", _Cooldowns.GetAnchorOffsets(index))
                _Cooldowns.UpdateBackdropFrames(index)
            end
        end
        _Cooldowns.SetAnchorOffsetY = function(y, index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if groupData.layoutSettings.AnchorPositionY ~= y then
                groupData.layoutSettings.AnchorPositionY = y
                _Cooldowns.AnchorFrames[index]:ClearAllPoints()
                _Cooldowns.AnchorFrames[index]:SetPoint("CENTER", _Cooldowns.GetAnchorOffsets(index))
                _Cooldowns.UpdateBackdropFrames(index)
            end
        end
        _Cooldowns.ToggleAnchorToUnitframes = function(groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            groupData.layoutSettings.anchorToFrames = not groupData.layoutSettings.anchorToFrames
            _Cooldowns.UpdatePositions(groupIndex, nil, true)
            if not groupData.layoutSettings.anchorToFrames then
                _Cooldowns.SetAnchorShow(true, groupIndex)
            else
                _Cooldowns.SetAnchorShow(false, groupIndex)
            end
        end
        _Cooldowns.GetAnchorToUnitframes = function(groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            return groupData.layoutSettings.anchorToFrames
        end
        _Cooldowns.SetDisplayAnchorPoint = function(point, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            if not point ~= groupData.layoutSettings.DisplayAnchorPoint then
                groupData.layoutSettings.DisplayAnchorPoint = point
                _Cooldowns.UpdatePositions(groupIndex, nil, true)
            end
        end
        _Cooldowns.GetDisplayAnchorPoint = function(groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            return groupData.layoutSettings.DisplayAnchorPoint
        end
        _Cooldowns.SetUnitframeAnchorPoint = function(point, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            if not point ~= groupData.layoutSettings.UnitframeAnchorPoint then
                groupData.layoutSettings.UnitframeAnchorPoint = point
                _Cooldowns.UpdatePositions(groupIndex, nil, true)
            end
        end
        _Cooldowns.GetUnitframeAnchorPoint = function(groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            return groupData.layoutSettings.UnitframeAnchorPoint
        end
        _Cooldowns.SetUnitFrameAnchorOffsetX = function(value, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            if not value ~= groupData.layoutSettings.UnitFrameAnchorOffsetX then
                groupData.layoutSettings.UnitFrameAnchorOffsetX = value
                _Cooldowns.UpdatePositions(groupIndex, nil, true)
            end
        end
        _Cooldowns.GetUnitFrameAnchorOffsetX = function(groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            return groupData.layoutSettings.UnitFrameAnchorOffsetX
        end
        _Cooldowns.SetUnitFrameAnchorOffsetY = function(value, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            if not value ~= groupData.layoutSettings.UnitFrameAnchorOffsetY then
                groupData.layoutSettings.UnitFrameAnchorOffsetY = value
                _Cooldowns.UpdatePositions(groupIndex, nil, true)
            end
        end
        _Cooldowns.GetUnitFrameAnchorOffsetY = function(groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            return groupData.layoutSettings.UnitFrameAnchorOffsetY
        end
        _Cooldowns.LocateAnchor = function(groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            _Cooldowns.AnchorFrames[groupIndex]:Locate()
        end

        _Cooldowns.ToggleAutoAnchor = function(groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            groupData.layoutSettings.useAutoAnchor = not groupData.layoutSettings.useAutoAnchor
            _Cooldowns.UpdatePositions(groupIndex, nil, true)
        end
        _Cooldowns.GetAutoAnchor = function(groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            return groupData.layoutSettings.useAutoAnchor
        end
        _Cooldowns.SetAnchorPrio = function(pattern, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            if pattern ~= groupData.layoutSettings.anchorPrio then
                groupData.layoutSettings.anchorPrio = pattern
                _Cooldowns.UpdatePositions(groupIndex, nil, true)
            end
        end
        _Cooldowns.GetAnchorPrio = function(groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            return groupData.layoutSettings.anchorPrio
        end
        _Cooldowns.GetPrioTableForGroupIndex = function(groupIndex)
            local prioTable = LibGetFrame.getDefaultFramePriorities()
            local prio = _Cooldowns.GetAnchorPrio(groupIndex)
            if prio ~= "Auto" then
                tDeleteItem(prioTable, prio)
                table.insert(prioTable, 1, prio)
            end
            return prioTable
        end
    end -- end Anchor settings

    _Cooldowns.BuildGroups() -- setup backdrop and anchors for existing groups.
    for index, details in ipairs(data.groups) do
        local groupData = details.groupData
        _Cooldowns.AnchorFrames[index]:SetPoint("CENTER", groupData.layoutSettings.AnchorPositionX, groupData.layoutSettings.AnchorPositionY)
    end

    do -- Load settings
        _Cooldowns.ToggleLoadSetting = function(sectionName, settingName, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            groupData.loadSettings[sectionName][settingName] = not groupData.loadSettings[sectionName][settingName]
            _Cooldowns.CheckLoads(groupIndex)
        end
        _Cooldowns.GetLoadSetting = function(sectionName, settingName, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            return groupData.loadSettings[sectionName][settingName]
        end
        _Cooldowns.SetEncounterLoadSetting = function(value, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            if value and value ~= "" then
                local t = {}
                for d in value:gmatch("%d+") do
                    t[tonumber(d)] = true
                end
                groupData.loadSettings.encounter.encounters = t
            else
                groupData.loadSettings.encounter.encounters = {}
            end
            groupData.loadSettings.encounter.string = value or ""
            _Cooldowns.CheckLoads(groupIndex)
        end
        _Cooldowns.GetEncounterLoadSetting = function(groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            return groupData.loadSettings.encounter.string
        end

        _Cooldowns.groupLoadStatus = {}
        for i = 1, _Cooldowns.GetNumGroups() do
            _Cooldowns.groupLoadStatus[i] = false
        end
        _Cooldowns.LoadGroup = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            if _Cooldowns.IsGroupActive(index) then
                _Cooldowns.RequestNewCooldownInfo(index)
                if _Cooldowns.IsConfigOpen() then
                    if not _Cooldowns.GetAnchorToUnitframes(index) then
                        _Cooldowns.SetAnchorShow(true, index)
                    end
                    _Cooldowns.UpdatePositions(index, nil, true)
                end
            end
        end
        _Cooldowns.UnloadGroup = function(index)
            index = index or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(index)
            _Cooldowns.ClearGroupCooldowns(index)
            _Cooldowns.SetAnchorShow(false, index)
            _Cooldowns.HideBackdropFrames(index)
        end
        _Cooldowns.IsGroupLoaded = function(groupIndex)
            return _Cooldowns.groupLoadStatus[groupIndex]
        end

        _Cooldowns.CheckLoads = function(groupIndex)
            if not groupIndex then
                for groupIndex = 1, _Cooldowns.GetNumGroups() do
                    local loadGroup
                    for section, settings in pairs(_Cooldowns.GetGroupLoadSettings(groupIndex)) do
                        local loadSection
                        if section == "encounter" then
                            if not next(settings.encounters) then
                                loadSection = true
                            else
                                loadSection = not not settings.encounters[_Cooldowns.loadStates.encounterID]
                            end
                        elseif section == "specs" then
                            if not settings.useSpecs then
                                loadSection = true
                            else
                                loadSection = settings[_Cooldowns.loadStates.specID]
                            end
                        else
                            for loadSetting, useSetting in pairs(settings) do
                                if useSetting then
                                    loadSection = loadSection or _Cooldowns.loadStates[loadSetting]
                                end
                            end
                        end
                        if loadSection or loadSection == nil then
                            loadGroup = loadGroup and loadSection
                        else
                            loadGroup = false
                        end
                    end
                    if loadGroup == nil then loadGroup = true end
                    if _Cooldowns.groupLoadStatus[groupIndex] ~= loadGroup then
                        _Cooldowns.groupLoadStatus[groupIndex] = loadGroup
                        if loadGroup then
                            _Cooldowns.LoadGroup(groupIndex)
                            _Cooldowns.UpdateNavigation()
                        else
                            _Cooldowns.UnloadGroup(groupIndex)
                            _Cooldowns.UpdateNavigation()
                        end
                    end
                end
            else
                local loadGroup
                for section, settings in pairs(_Cooldowns.GetGroupLoadSettings(groupIndex)) do
                    local loadSection
                    if section == "encounter" then
                        if not next(settings.encounters) then
                            loadSection = true
                        else
                            loadSection = not not settings.encounters[_Cooldowns.loadStates.encounterID]
                        end
                    elseif section == "specs" then
                        if not settings.useSpecs then
                            loadSection = true
                        else
                            loadSection = settings[_Cooldowns.loadStates.specID]
                        end
                    else
                        for loadSetting, useSetting in pairs(settings) do
                            if useSetting then
                                loadSection = loadSection or _Cooldowns.loadStates[loadSetting]
                            end
                        end
                    end
                    if loadSection or loadSection == nil then
                        loadGroup = loadGroup and loadSection
                    else
                        loadGroup = false
                    end
                end
                if loadGroup == nil then loadGroup = true end
                if _Cooldowns.groupLoadStatus[groupIndex] ~= loadGroup then
                    _Cooldowns.groupLoadStatus[groupIndex] = loadGroup
                    if loadGroup then
                        _Cooldowns.LoadGroup(groupIndex)
                        _Cooldowns.UpdateNavigation()
                    else
                        _Cooldowns.UnloadGroup(groupIndex)
                        _Cooldowns.UpdateNavigation()
                    end
                end
            end
        end
    end -- end load settings

    do -- start States Settings
        for i = 1, _Cooldowns.GetNumGroups() do
            local data = _Cooldowns.GetGroupData(i)
            for state, properties in pairs(data.stateSettings) do
                if state ~= "subGroups" then
                    for property, settings in pairs (properties) do
                        if type(settings) == "table" then
                            for setting, value in pairs(settings) do
                                if type(value) == "table" and value.r and value.g and value.b and value.a then
                                    settings[setting] = CreateColor(value.r, value.g, value.b, value.a)
                                end
                            end
                        end
                    end
                end
            end
        end

        _Cooldowns.RemoveProperty = function(state, property, index, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            if groupData.stateSettings[state] and groupData.stateSettings[state][property] then
                groupData.stateSettings[state][property] = nil
                table.remove(groupData.stateSettings[state], index)
                --[[for i = #_Cooldowns.stateChangeCallbacks, 1, -1 do
                    local details = _Cooldowns.stateChangeCallbacks[i]
                    if details.state == state and details.property == property and details.groupIndex == groupIndex then
                        table.remove(_Cooldowns.stateChangeCallbacks, i)
                    end
                end]]
                --[[if property == "Hide" then
                    _Cooldowns.RequestNewCooldownInfo(groupIndex)
                end]]
                for _, display in pairs(_Cooldowns.GetDisplaysByGroup(groupIndex)) do
                    display:UpdateStates()
                end
            end
        end
        _Cooldowns.AddProperty = function(state, property, pathTable, propertySettings, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            groupData.stateSettings[state][property] = {}
            local dataTable = groupData
            for i, key in ipairs(pathTable) do
                dataTable = dataTable[key]
            end
            for _, setting in pairs(propertySettings) do
                groupData.stateSettings[state][property][setting] = type(dataTable[setting]) == "table" and CopyTable(dataTable[setting]) or dataTable[setting]
            end
            table.insert(groupData.stateSettings[state], property)
            --[[for _, display in pairs(_Cooldowns.GetDisplaysByGroup(groupIndex)) do
                display:UpdateStates()
            end]]
        end

        _Cooldowns.GetStateValue = function(state, property, setting, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            local value = groupData.stateSettings[state]
            and groupData.stateSettings[state][property]
            and groupData.stateSettings[state][property][setting]
            return value
        end
        --_Cooldowns.stateChangeCallbacks = {}
        _Cooldowns.SetStateValue = function(value, state, property, setting, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            groupData.stateSettings[state][property][setting] = value
            --[[if property == "Hide" then
                table.insert(_Cooldowns.stateChangeCallbacks, {state = state, groupIndex = groupIndex, value = value, property = property})
            end]]
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(groupIndex)) do
                display:UpdateStates()
            end
        end
        _Cooldowns.GetPropertyOverridden = function(state, property, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            return groupData.stateSettings[state] and groupData.stateSettings[state][property]
        end

        -- group show settings
        _Cooldowns.ToggleGroupSetting = function(groupNum, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            groupData.stateSettings.subGroups["group"..groupNum] = not groupData.stateSettings.subGroups["group"..groupNum]
            for _, display in pairs(_Cooldowns.GetDisplaysByGroup(groupIndex)) do
                display:UpdateStates()
            end
        end
        _Cooldowns.GetGroupSetting = function(groupNum, groupIndex)
            groupIndex = groupIndex or _Cooldowns.GetCurrentGroupIndex()
            local groupData = _Cooldowns.GetGroupData(groupIndex)
            return groupData.stateSettings.subGroups["group"..groupNum]
        end

    end -- end States Settings

    local numTestDisplays = 10
    local IsShowingTestDisplays = false
    _Cooldowns.ToggleTestDisplays = function(bool)
        local groupIndex = _Cooldowns.GetCurrentGroupIndex()
        if groupIndex == 0 then return end
        if bool then
            IsShowingTestDisplays = true
            _Cooldowns.RequestNewCooldownInfo(groupIndex)
            --_Cooldowns.CreateTestDisplays(groupIndex)
            _Cooldowns.UpdatePositions(groupIndex, nil, true)
        else
            IsShowingTestDisplays = false

        --[[_Cooldowns.ClearAllEchoCooldowns()
        _Cooldowns.BuildGroups()
        _Cooldowns.ShowAllActiveAnchors()
        _Cooldowns.RequestNewCooldownInfo()]]
            _Cooldowns.RequestNewCooldownInfo(groupIndex)
            _Cooldowns.UpdatePositions(groupIndex, nil, true)
        end
    end
    _Cooldowns.GetTestDisplays = function()
        return IsShowingTestDisplays
    end
    _Cooldowns.SetNumTestDisplays = function(value)
        if value ~= numTestDisplays then
            numTestDisplays = value
            if IsShowingTestDisplays then
                local groupIndex = _Cooldowns.GetCurrentGroupIndex()
                _Cooldowns.CreateTestDisplays(groupIndex)
                _Cooldowns.UpdatePositions(groupIndex, nil, true)
            end
        end
    end
    _Cooldowns.GetNumTestDisplays = function()
        return numTestDisplays
    end
    
    --[[if not next(data.groups) then
        _Cooldowns.AddNewGroup("Cooldowns Group")
        _Cooldowns.ToggleGroup(1)
        table.insert(statusQueue, "New Cooldown Group created. Enable it and configure as you need.")
    end]]

    _Cooldowns.GetDialogPopup = function()
        _EchoRaidTools.PopupDialog = _EchoRaidTools.PopupDialog or CreateFrame("FRAME", nil, UIParent, "EchoRaidTools_PopupDialog")
        return _EchoRaidTools.PopupDialog
    end

    _Cooldowns.HideDialogPopup = function()
        if _EchoRaidTools.PopupDialog and _EchoRaidTools.PopupDialog:IsShown() then
            local popup = _EchoRaidTools.PopupDialog
            popup.OKButton:SetScript("OnClick", nil)
            popup:Hide()
        end
    end

    do -- callbacks
        --- Generate and return a GUID
        local newGUID = function()
            local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
            return string.gsub(template, '[xy]', function(c)
                local r = math.random(16) - 1
                local v = (c == 'x') and r or (r % 4) + 8
                return string.format('%x', v)
            end)
        end

        _Cooldowns.callbacks = {
            ["NumCooldownsGroupsChanged"] = {}

        }
        local RegisterCallback = function(callbackName, func)
            if _Cooldowns.callbacks[callbackName] then
                local guid = newGUID()
                _Cooldowns.callbacks[callbackName][guid] = func
                return guid
            end
        end
        local UnregisterCallback = function(callbackName, guid)
            if _Cooldowns.callbacks[callbackName] and _Cooldowns.callbacks[callbackName][guid] then
                _Cooldowns.callbacks[callbackName][guid] = nil
            end
        end
        function _Cooldowns.callback(callbackName, ...)
            if _Cooldowns.callbacks[callbackName] then
                local protectedArgs, count = LibReadOnly:ProtectArguments(...)
                for guid, func in pairs(_Cooldowns.callbacks[callbackName]) do
                    func(unpack(protectedArgs, count))
                end
            end
        end
        _EchoRaidTools.Cooldowns = _EchoRaidTools.Cooldowns or {}
        _EchoRaidTools.Cooldowns.RegisterCallback = RegisterCallback
        _EchoRaidTools.Cooldowns.UnregisterCallback = UnregisterCallback

        function _Cooldowns.SendGroupsChangedCallback()
            _Cooldowns.callback("NumCooldownsGroupsChanged", _Cooldowns.GetNumGroups())
        end
    end
end