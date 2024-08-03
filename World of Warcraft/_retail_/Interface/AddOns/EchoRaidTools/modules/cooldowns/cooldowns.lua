--[=[
WA API for Cooldown Info:

ScanEvents:
"ECHO_CD_WIPE_SPELL", unit, spellID
"ECHO_CD_WIPE_ALL", true
"ECHO_CD_WIPE_UNIT", unit
"ECHO_CD_UPDATE", unit, spellID, infoTable

APIs:
EchoCooldowns.RequestCooldownInfoByUnit(unitID)
EchoCooldowns.RequestCooldownInfoBySpellID(spellID)

Above functions return an array containing an infoTable for each matching spell

infoTable:
{
    unit = unit,
    spellID = spellID,
    isReady = isReady,
    remainingDuration = timeLeft,
    charges = charges,
    start = minValue,
    expirationTime = maxValue,
    currentValue = currentValue,
    duration = duration,
    buffDuration = buffDuration,
    filterIndex = filterIndex
}

        Filter Types:
        -- 1 attack cooldown
        -- 2 personal defensive cooldown
        -- 3 targetted defensive cooldown
        -- 4 raid defensive cooldown
        -- 5 personal utility cooldown
        -- 6 interrupt
        -- 7 dispel
        -- 8 crowd control
        -- 9 racials
        -- 10 item heal
        -- 11 item power
        -- 12 item utility
]=]

local _AddonName, _EchoRaidTools = ...;
local _Cooldowns = _EchoRaidTools:NewModule("cooldowns")

function _Cooldowns:ADDON_LOADED(addonName)
    if addonName ~= _AddonName then return end

    local debug = false --DEBUG
    _Cooldowns.debug = function(...)
        if debug then
            print(...)
        end
    end
    _Cooldowns.VDT = function(...)
        if debug then
            ViragDevTool_AddData(...)
        end
    end

    _Cooldowns.configShown = false
    _Cooldowns.IsConfigOpen = function()
        return _Cooldowns.configShown
    end

    local types = _Cooldowns.types
    EchoRaidToolsDB.Cooldowns = EchoRaidToolsDB.Cooldowns or {}
    local data = EchoRaidToolsDB.Cooldowns
    data.groups = data.groups or {}

    if not _Cooldowns.SetupCompleted then
        local LibReadOnly = LibStub:GetLibrary("LibReadOnly")
        local openRaidLib = LibStub:GetLibrary("LibOpenRaid-1.0")
        local LibSharedMedia = LibStub:GetLibrary ("LibSharedMedia-3.0")

        _EchoRaidTools.Cooldowns = _EchoRaidTools.Cooldowns or {}

        local addonLoaded = false

        local SendEchoSpellUpdate = function(...)
            _Cooldowns.UpdateSpell(...)
        end
        local SendEchoUnitRefresh = function(unit, index)
            _Cooldowns.RemoveUnit(unit, index)
        end

        local SendEchoRemoveSpell = function(...)
            _Cooldowns.SendEchoRemoveSpell(...)
        end

        -- Add main lib functions to the module
        _Cooldowns.AllUnitsCooldown = function()
            return openRaidLib.GetAllUnitsCooldown()
        end

        _Cooldowns.UnitCooldowns = function(unit, filter, ...)
            return openRaidLib.GetUnitCooldowns(unit, filter, ...)
        end

        _Cooldowns.CooldownInfo = function(unit, spellID)
            return openRaidLib.GetUnitCooldownInfo(unit, spellID)
        end

        _Cooldowns.GetCooldownStatusFromCooldownInfo = function(cooldownInfo)
            return openRaidLib.GetCooldownStatusFromCooldownInfo(cooldownInfo)
        end
        local calculatePercent = function(timeOffset, duration, updateTime, charges, buffDuration)
            timeOffset = abs(timeOffset)
            local minValue = updateTime - timeOffset
            local maxValue = minValue + duration
            local currentValue = GetTime()
            local timeLeft = max(maxValue - currentValue, 0)

            --lag compensation
            if (timeLeft <= 2) then
                timeLeft = 0
                if (charges == 0) then
                    charges = 1
                end
                minValue = currentValue
                maxValue = 1
                currentValue = 1
            end

            local bIsReady = timeLeft <= 2
            return bIsReady, timeLeft, charges, minValue, maxValue, min(currentValue, maxValue), duration, buffDuration
        end
        local processCooldownInfo = function(cooldownInfo)
            local timeLeft, charges, timeOffset, duration, updateTime, buffDuration = unpack(cooldownInfo)
            if (not updateTime) or type(duration) ~= "number" then
                return
            else
                return calculatePercent(timeOffset, duration, updateTime, charges, buffDuration)
            end
        end

        _Cooldowns.AddCooldownFilter = function(filterName, spells)
            openRaidLib.AddCooldownFilter(filterName, spells)
        end

        -- transfer all the spells into our own table so we can easily get a spell's filter
        _Cooldowns.spellToFilterIndex = {}
        local topIndex = 0
        for spellID, details in pairs(LIB_OPEN_RAID_COOLDOWNS_INFO) do
            _Cooldowns.spellToFilterIndex[spellID] = details.type
            topIndex = max(topIndex, details.type)
        end
        --_Cooldowns.numFilters = topIndex
        _Cooldowns.numFilters = #types.typeToFilterString

        local GetRandomSpell = function(groupIndex)
            local groupSpells = _Cooldowns.GetGroupSpells(groupIndex)
            local numSpells = #groupSpells
            if numSpells > 0 then
                local spellID = groupSpells[fastrandom(1, numSpells)]
                local spell = types.spellLookupTable[spellID]
                return spell
            else
                local spell = types.fullSpellList[fastrandom(1, #types.fullSpellList)]
                return spell
            end
        end

        local AddTestDisplays = function(groupIndex)
            if not types.fullSpellList then
                _Cooldowns.GenerateSpellList()
            end
            local unitTable = {}
            for unit in _EchoRaidTools.IterateGroup() do
                table.insert(unitTable, unit)
            end
            local now = GetTime()
            for i = 1, _Cooldowns.GetNumTestDisplays() do
                local spell = GetRandomSpell(groupIndex)
                local exp = random() > 0.5 and now + fastrandom(30, 200) or now
                local start = now - fastrandom(10, 100)
                local timeLeft = exp - now
                local unit = _Cooldowns.GetAnchorToUnitframes(groupIndex) and unitTable[fastrandom(1, #unitTable)] or "test"..fastrandom(1,5)
                local ready = exp <= now and true or false
                _Cooldowns.UpdateSpell(groupIndex, unit, spell.spellID, ready, timeLeft, fastrandom(1,3), start, exp, now, exp - start)
            end
        end

        local WA_ScanEvents_Enabled = true
        local WA_Loaded = false
        local SendScanEvents = function(name, ...)
            if WA_Loaded or IsAddOnLoaded("WeakAuras") then
                WA_Loaded = true
                if WA_ScanEvents_Enabled then
                    WeakAuras.ScanEvents(name, ...)
                end
            end
        end
        local EnableScanEvents = function()
            if IsAddOnLoaded("WeakAuras") then
                WA_ScanEvents_Enabled = true
            end
        end
        local DisableScanEvents = function()
            WA_ScanEvents_Enabled = false
        end
        _EchoRaidTools.Cooldowns.EnableScanEvents = EnableScanEvents
        _EchoRaidTools.Cooldowns.DisableScanEvents = DisableScanEvents

        local buildCooldownInfoTable = function(unit, spellID, isReady, timeLeft, charges, minValue, maxValue, currentValue, duration, buffDuration)
            local infoTable = {
                unit = unit,
                spellID = spellID,
                isReady = isReady,
                remainingDuration = timeLeft,
                charges = charges,
                start = minValue,
                expirationTime = maxValue,
                currentValue = currentValue,
                duration = duration,
                buffDuration = buffDuration,
                filterIndex = _Cooldowns.spellToFilterIndex[spellID],
            }
            return infoTable
        end

        _Cooldowns.OnUnitLostCooldown = function(unit, spellID)
            _Cooldowns.debug("unit lost CD", unit, spellID)
            if addonLoaded then
                SendEchoRemoveSpell(unit, spellID)
                SendScanEvents("ECHO_CD_WIPE_SPELL", unit, spellID)
            end
        end
        openRaidLib.RegisterCallback(_Cooldowns, "CooldownRemoved", "OnUnitLostCooldown")

        _Cooldowns.OnCooldownListWipe = function()
            _Cooldowns.debug("Cooldown list wipe")
            if addonLoaded then
                _Cooldowns.ClearAllEchoCooldowns()
                SendScanEvents("ECHO_CD_WIPE_ALL", true)
            end
        end
        openRaidLib.RegisterCallback(_Cooldowns, "CooldownListWipe", "OnCooldownListWipe")

        local delays = {}
        _Cooldowns.OnUnitInfoUpdate = function(unit, t1, t2)
            _Cooldowns.debug("OnUnitInfoUpdate")
            if not delays[unit] or GetTime() - delays[unit] > 1 then
                delays[unit] = GetTime()
                _Cooldowns.RequestNewCooldownInfo()
            end
        end
        openRaidLib.RegisterCallback(_Cooldowns, "UnitInfoUpdate", "OnUnitInfoUpdate")
        _Cooldowns.OnUnitInfoWipe = function()
            _Cooldowns.debug("OnUnitInfoWipe")
        end
        openRaidLib.RegisterCallback(_Cooldowns, "UnitInfoWipe", "OnUnitInfoWipe")

        local checkCooldownInfo = function(cooldownInfo)
            return cooldownInfo and #cooldownInfo >= 5
        end

        --Register callback for a major list update
        _Cooldowns.OnReceiveCooldownListUpdate = function(unit, unitCooldowns, AllUnitsCooldowns)
            _Cooldowns.debug("OnReceiveCooldownListUpdate", unit)
            if addonLoaded then
                local unitInfo = openRaidLib.GetUnitInfo(unit)
                unit = _EchoRaidTools.DisambiguateUnit(unit)
                local role = unitInfo and unitInfo.role or "NONE"
                SendScanEvents("ECHO_CD_WIPE_UNIT", unit)
                _Cooldowns.SetDisplaysDirtyByUnit(unit)
                for spellID, cooldownInfo in pairs(unitCooldowns) do
                    SendScanEvents("ECHO_CD_UPDATE", unit, spellID, buildCooldownInfoTable(unit, spellID, processCooldownInfo(cooldownInfo)))
                    local numGroups = _Cooldowns.GetNumGroups()
                    if (not numGroups) then return end
                    for i = 1, numGroups do
                        _Cooldowns.debug("OnReceiveCooldownListUpdate", unit, spellID)
                        if _Cooldowns.GetGroupSpellByID(spellID, i) then
                            if UnitExists(unit)
                            and ((not _Cooldowns.GetIgnoreSelf(i)) or (not UnitIsUnit(unit, "player")))
                            and _Cooldowns.isThisRoleShown(i, role)
                            then
                                SendEchoSpellUpdate(i, unit, spellID, processCooldownInfo(cooldownInfo))
                            end
                        end
                    end
                end
                _Cooldowns.RemoveDirtyDisplaysByUnit(unit)
            end
        end
        openRaidLib.RegisterCallback(_Cooldowns, "CooldownListUpdate", "OnReceiveCooldownListUpdate")

        --Register callback for single spell update
        _Cooldowns.OnReceiveCooldownUpdate = function(unit, spellID, cooldownInfo, unitCooldowns, AllUnitsCooldowns)
            _Cooldowns.debug("OnReceiveCooldownUpdate", unit, spellID, (GetSpellInfo(spellID)))
            if addonLoaded and LIB_OPEN_RAID_COOLDOWNS_INFO[spellID] and checkCooldownInfo(cooldownInfo) then
                local unitInfo = openRaidLib.GetUnitInfo(unit)
                unit = _EchoRaidTools.DisambiguateUnit(unit)
                local role = unitInfo and unitInfo.role or "NONE"
                SendScanEvents("ECHO_CD_UPDATE", unit, spellID, buildCooldownInfoTable(unit, spellID, processCooldownInfo(cooldownInfo)))
                local numGroups = _Cooldowns.GetNumGroups()
                if (not numGroups) then return end
                for i = 1, numGroups do
                    if _Cooldowns.GetGroupSpellByID(spellID, i) then
                        if UnitExists(unit)
                        and ((not _Cooldowns.GetIgnoreSelf(i)) or (not UnitIsUnit(unit, "player")))
                        and _Cooldowns.isThisRoleShown(i, role)
                        then
                            SendEchoSpellUpdate(i, unit, spellID, processCooldownInfo(cooldownInfo))
                        end
                    end
                end
            end
        end
        openRaidLib.RegisterCallback(_Cooldowns, "CooldownUpdate", "OnReceiveCooldownUpdate")

        --Register callback for single spell update
        _Cooldowns.OnReceiveCooldownAdded = function(unit, spellID, cooldownInfo, unitCooldowns, AllUnitsCooldowns)
            _Cooldowns.debug("OnReceiveCooldownAdded", unit)
            if addonLoaded and LIB_OPEN_RAID_COOLDOWNS_INFO[spellID] and checkCooldownInfo(cooldownInfo) then
                local unitInfo = openRaidLib.GetUnitInfo(unit)
                unit = _EchoRaidTools.DisambiguateUnit(unit)
                local role = unitInfo and unitInfo.role or "NONE"
                SendScanEvents("ECHO_CD_UPDATE", unit, spellID, buildCooldownInfoTable(unit, spellID, processCooldownInfo(cooldownInfo)))
                local numGroups = _Cooldowns.GetNumGroups()
                if (not numGroups) then return end
                for i = 1, numGroups do
                    if _Cooldowns.GetGroupSpellByID(spellID, i) then
                        if UnitExists(unit)
                        and ((not _Cooldowns.GetIgnoreSelf(i)) or (not UnitIsUnit(unit, "player")))
                        and _Cooldowns.isThisRoleShown(i, role)
                        then
                            SendEchoSpellUpdate(i, unit, spellID, processCooldownInfo(cooldownInfo))
                        end
                    end
                end
            end
        end
        openRaidLib.RegisterCallback(_Cooldowns, "CooldownAdded", "OnReceiveCooldownAdded")

        _Cooldowns.RequestNewCooldownInfo = function(index)
            _Cooldowns.debug("RequestNewCooldownInfo","internal", index)
            if addonLoaded and _Cooldowns.GetModuleEnabled() then
                local allCDs = _Cooldowns.AllUnitsCooldown()
                if index then
                    _Cooldowns.SetDisplaysDirtyByGroupIndex(index)
                else
                    local numGroups = _Cooldowns.GetNumGroups()
                    if (not numGroups) then return end
                    for i = 1, numGroups do
                        _Cooldowns.SetDisplaysDirtyByGroupIndex(i)
                    end
                end
                for unit, info in pairs(allCDs) do
                    local unitInfo = openRaidLib.GetUnitInfo(unit)
                    unit = _EchoRaidTools.DisambiguateUnit(unit)
                    local role = unitInfo and unitInfo.role or "NONE"
                    for spellID, cooldownInfo in pairs(info) do
                        if LIB_OPEN_RAID_COOLDOWNS_INFO[spellID] and checkCooldownInfo(cooldownInfo) then
                            if index then
                                if _Cooldowns.GetGroupSpellByID(spellID, index) then
                                    if UnitExists(unit)
                                    and ((not _Cooldowns.GetIgnoreSelf(index)) or (not UnitIsUnit(unit, "player")))
                                    and _Cooldowns.isThisRoleShown(index, role)
                                    then
                                        SendEchoSpellUpdate(index, unit, spellID, processCooldownInfo(cooldownInfo))
                                    end
                                end
                            else
                                local numGroups = _Cooldowns.GetNumGroups()
                                if (not numGroups) then return end
                                for i = 1, numGroups do
                                    if _Cooldowns.GetGroupSpellByID(spellID, i) then
                                        if UnitExists(unit)
                                        and ((not _Cooldowns.GetIgnoreSelf(i)) or (not UnitIsUnit(unit, "player")))
                                        and _Cooldowns.isThisRoleShown(i, role)
                                        then
                                            SendEchoSpellUpdate(i, unit, spellID, processCooldownInfo(cooldownInfo))
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if index then
                    _Cooldowns.RemoveDirtyDisplaysByGroupIndex(index)
                else
                    local numGroups = _Cooldowns.GetNumGroups()
                    if (not numGroups) then return end
                    for i = 1, numGroups do
                        _Cooldowns.RemoveDirtyDisplaysByGroupIndex(i)
                    end
                end
                if _Cooldowns.GetTestDisplays() then
                    AddTestDisplays(index)
                end
            end
        end

        _Cooldowns.RequestAllCooldownInfo = function()
            if addonLoaded then
                local allCDs = _Cooldowns.AllUnitsCooldown()
                return allCDs
            end
        end        
        _EchoRaidTools.Cooldowns.RequestAllCooldownInfo = _Cooldowns.RequestAllCooldownInfo

        _Cooldowns.RequestCooldownInfoBySpellID = function(querySpellID)
            if addonLoaded then
                local ret = {}
                if querySpellID then
                    local allCDs = _Cooldowns.AllUnitsCooldown()
                    if LIB_OPEN_RAID_COOLDOWNS_INFO[querySpellID] then
                        for unit, info in pairs(allCDs) do
                            for spellID, cooldownInfo in pairs(info) do
                                if checkCooldownInfo(cooldownInfo) then
                                    if spellID == querySpellID then
                                        table.insert(ret, buildCooldownInfoTable(unit, spellID, processCooldownInfo(cooldownInfo)))
                                    end
                                end
                            end
                        end
                    end
                end
                return ret
            end
        end
        _EchoRaidTools.Cooldowns.RequestCooldownInfoBySpellID = _Cooldowns.RequestCooldownInfoBySpellID

        _Cooldowns.RequestCooldownInfoByFilter = function(filterIndex)
            if addonLoaded then
                local ret = {}
                if type(filterIndex) == "number" and filterIndex <= _Cooldowns.numFilters then
                    local allCDs = _Cooldowns.AllUnitsCooldown()
                    for unit, info in pairs(allCDs) do
                        for spellID, cooldownInfo in pairs(info) do
                            if LIB_OPEN_RAID_COOLDOWNS_INFO[spellID] and checkCooldownInfo(cooldownInfo) then
                                if LIB_OPEN_RAID_COOLDOWNS_INFO[spellID] and LIB_OPEN_RAID_COOLDOWNS_INFO[spellID].type == filterIndex then
                                    table.insert(ret, buildCooldownInfoTable(unit, spellID, processCooldownInfo(cooldownInfo)))
                                end
                            end
                        end
                    end
                end
                return ret
            end
        end
        _EchoRaidTools.Cooldowns.RequestCooldownInfoByFilter = _Cooldowns.RequestCooldownInfoByFilter

        _Cooldowns.RequestCooldownInfoByUnit = function(unit, spellID)
            if addonLoaded then
                if spellID then
                    local CD = _Cooldowns.CooldownInfo(unit, spellID)
                    return CD and buildCooldownInfoTable(unit, spellID, processCooldownInfo(cooldownInfo))
                else
                    local ret = {}
                    local unitCDs = _Cooldowns.UnitCooldowns(unit)
                    for spellID, cooldownInfo in pairs(unitCDs) do
                        table.insert(ret, buildCooldownInfoTable(unit, spellID, processCooldownInfo(cooldownInfo)))
                    end
                    return ret
                end
            end
        end
        _EchoRaidTools.Cooldowns.RequestCooldownInfoByUnit = _Cooldowns.RequestCooldownInfoByUnit

        _Cooldowns.CreateTestDisplays = function(groupIndex)
            _Cooldowns.RequestNewCooldownInfo(groupIndex)
        end

        _Cooldowns:LoadEvents()
        _Cooldowns:LoadFrames()
        _Cooldowns:LoadSettings()
        _Cooldowns:LoadOptions()
        addonLoaded = true
        local delayAndRecheck
        delayAndRecheck = function()
            local CDs = _Cooldowns.AllUnitsCooldown()
            if not next(CDs) then
                C_Timer.After(2, delayAndRecheck)
            else
                if not next(_Cooldowns.displays) then
                    _Cooldowns.RequestNewCooldownInfo()
                end
                _Cooldowns.CheckLoads()
            end
        end
        delayAndRecheck()
        C_Timer.After(10, function()
            _Cooldowns.QueueCheckSubGroups()
        end)

        LibSharedMedia.RegisterCallback(_Cooldowns, "LibSharedMedia_Registered", "RefreshMedia" )
        LibSharedMedia.RegisterCallback(_Cooldowns, "LibSharedMedia_SetGlobal", "RefreshMedia" )

        _Cooldowns.SetupCompleted = true
        EchoCooldowns = LibReadOnly:New(_EchoRaidTools.Cooldowns)
    end
end