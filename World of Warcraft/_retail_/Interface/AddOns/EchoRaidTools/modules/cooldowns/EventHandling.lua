local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

local LibSharedMedia = LibStub:GetLibrary ("LibSharedMedia-3.0")
local openRaidLib = LibStub:GetLibrary("LibOpenRaid-1.0")

local types = _Cooldowns.types

function _Cooldowns:LoadEvents()
    _Cooldowns.usingOmniCC = false

    _Cooldowns.maxSubGroup = function(subGroup)
        local difficultyID = GetRaidDifficultyID()
        if(difficultyID == 14 or difficultyID == 15)then
            return 6
        elseif(difficultyID == 16)then
            return  4
        else
        return 8
        end
    end

    local unitFlags = {}
    _Cooldowns.unitFlags = unitFlags
    local UpdateUnitFlags = function(unit)
        local update = false
        local deadFlag = UnitIsDeadOrGhost(unit) and not UnitIsFeignDeath(unit)
        local awayFlag = (not UnitIsConnected(unit)) or (not UnitIsVisible(unit)) --or UnitIsAFK(unit)
        unitFlags[unit] = unitFlags[unit] or {}
        if unitFlags[unit].dead ~= deadFlag then
            unitFlags[unit].dead = deadFlag
            update = true
        end
        if unitFlags[unit].away ~= awayFlag then
            unitFlags[unit].away = awayFlag
            update = true
        end
        local guid = UnitGUID(unit)
        if not unitFlags[unit].guid or unitFlags[unit].guid ~= guid then
            unitFlags[unit].guid = guid
            update = true
        end
        if update then
            for _, groups in pairs(_Cooldowns.displays) do
                for unitID, spells in pairs(groups) do
                    if UnitIsUnit(unitID, unit) then
                        for spellID, display in pairs(spells) do
                            display:SetCurrentStates()
                        end
                    end
                end
            end
        end
    end
    _Cooldowns.UpdateUnitFlags = UpdateUnitFlags

    local unitsToUpdate = function(unit)
        for _, groups in pairs(_Cooldowns.displays) do
            for unitID, spells in pairs(groups) do
                if UnitIsUnit(unitID, unit) then
                    for spellID, display in pairs(spells) do
                        display:SetCurrentStates()
                    end
                end
            end
        end
    end
    local queuedChecks = {}
    local rangeCheckUnits = function()
        wipe(queuedChecks)
        for unit, _ in pairs(unitFlags) do
            table.insert(queuedChecks, unit)
        end
        local checkThree
        checkThree = function(queue)
            if #queue > 0 then
                for i = #queue, max(#queue-3, 1), -1 do
                    local unit = queue[i]
                    local notInRange = false
                    if UnitIsVisible(unit) then
                        notInRange = not UnitInRange(unit)
                    end
                    unitFlags[unit] = unitFlags[unit] or {}
                    if unitFlags[unit].outOfRange == nil or unitFlags[unit].outOfRange ~= notInRange then
                        unitFlags[unit].outOfRange = notInRange
                        unitsToUpdate(unit)
                    end
                    table.remove(queue, i)
                end
            end
            if #queue > 0 then
                RunNextFrame( function() checkThree(queue) end)
            end
        end
        checkThree(queuedChecks)
    end

    local rangeTickerRunning = false
    local rangeCheckerTicker
    local startRangeTicker = function()
        rangeCheckerTicker = C_Timer.NewTicker(0.3, rangeCheckUnits)
        rangeTickerRunning = true
    end
    local stopRangeTicker = function()
        if rangeCheckerTicker then
            rangeCheckerTicker:Cancel()
            rangeTickerRunning = false
        end
    end
    local CheckInGroup = function()
        if IsInGroup() then
            if not rangeTickerRunning then
                startRangeTicker()
            end
        else
            if rangeTickerRunning then
                stopRangeTicker()
            end
        end
    end

    local checkSubGroups = function()
        if IsInRaid() then
            --local maxGroups = _Cooldowns.maxSubGroup()
            local numMembers = GetNumGroupMembers()
            _Cooldowns.numMembers = numMembers > 0 and numMembers or 1
            for unit in _EchoRaidTools.IterateGroup() do
                local subGroup = select(3, GetRaidRosterInfo(UnitInRaid(unit)))
                --local inactiveGroup = subGroup > maxGroups
                unitFlags[unit] = unitFlags[unit] or {}

                if (unitFlags[unit].subGroup ~= subGroup) then
                    unitFlags[unit].subGroup = subGroup
                    for _, groups in pairs(_Cooldowns.displays) do
                        for unitID, spells in pairs(groups) do
                            if UnitIsUnit(unitID, unit) then
                                for spellID, display in pairs(spells) do
                                    display:SetCurrentStates()
                                end
                            end
                        end
                    end
                end
            end
        else
            for unit in _EchoRaidTools.IterateGroup() do
                local subGroup = 1
                unitFlags[unit] = unitFlags[unit] or {}

                if (unitFlags[unit].subGroup ~= subGroup) then
                    unitFlags[unit].subGroup = subGroup
                    for _, groups in pairs(_Cooldowns.displays) do
                        for unitID, spells in pairs(groups) do
                            if UnitIsUnit(unitID, unit) then
                                for spellID, display in pairs(spells) do
                                    display:SetCurrentStates()
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    local flag
    local QueueCheckSubGroups = function()
        if not flag then
            flag = true
            C_Timer.After(0.3, function()
                checkSubGroups()
                flag = false
            end)
        end
    end
    _Cooldowns.QueueCheckSubGroups = QueueCheckSubGroups

    local FlagsUpdate = function(frame, event, unit, ...)
        if event == "ALLUNITS" then
            for unit in _EchoRaidTools.IterateGroup() do
                UpdateUnitFlags(unit)
            end
        else
            UpdateUnitFlags(unit)
        end
    end
    local loadStates = {
        inCombat = false,
        inEncounter = false,
        encounterID = nil,
        InInstance = false,
        solo = false,
        inParty = false,
        inRaid = false,
        raidInstance = false,
        dungeonInstance = false,
        arenaInstance = false,
        battlegroundInstance = false,
        raidLFR = false,
        raidNormal = false,
        raidHeroic = false,
        raidMythic = false,
        roleDPS = false,
        roleHealer = false,
        roleTank = false,
        difficulty = nil,
    }
    _Cooldowns.loadStates = loadStates
    local loadFunction = function(self, event, ...)
        local update = false
        if event == "PLAYER_REGEN_DISABLED" then
            loadStates.inCombat = true
            update = true
        elseif event == "PLAYER_REGEN_ENABLED" then
            loadStates.inCombat = false
            update = true
        elseif event == "ENCOUNTER_START" then
            loadStates.inEncounter = true
            loadStates.encounterID = ...
            update = true
        elseif event == "ENCOUNTER_END" then
            loadStates.inEncounter = false
            loadStates.encounterID = nil
            update = true
        end
        if event == "GROUP_ROSTER_UPDATE" or event == "INIT" then
            local inGroup, inRaid = (IsInGroup()), (IsInRaid())
            local inParty = inGroup and (not inRaid)

            if loadStates.solo ~= (not inGroup) and (not inRaid) then
                loadStates.solo = (not inGroup) and (not inRaid)
                update = true
            end
            if loadStates.inParty ~= inParty then
                loadStates.inParty = inParty
                update = true
            end
            if loadStates.inRaid ~= inRaid then
                loadStates.inRaid = inRaid
                update = true
            end
            local _, _, difficultyID, _, maxPlayers = GetInstanceInfo()
            difficultyID = difficultyID or GetRaidDifficultyID()
            if loadStates.difficulty ~= difficultyID then
                loadStates.difficulty = difficultyID
                loadStates.raidLFR = difficultyID == 17
                loadStates.raidNormal = difficultyID == 14
                loadStates.raidHeroic = difficultyID == 15
                loadStates.raidMythic = difficultyID == 16
                loadStates.maxGroups = _Cooldowns.maxSubGroup()
                update = true
            end
        end
        if event == "ZONE_CHANGED" or event == "ZONE_CHANGED_INDOORS"
        or event == "ZONE_CHANGED_NEW_AREA" or event == "PLAYER_DIFFICULTY_CHANGED"
        or event == "INIT" then
            local inInstance, iType = IsInInstance()
            local _, _, difficultyID, _, maxPlayers = GetInstanceInfo()
            --difficultyID = difficultyID or GetRaidDifficultyID()
            if loadStates.InInstance ~= inInstance then
                loadStates.InInstance = inInstance
                update = true
            end
            if loadStates.raidInstance ~= (iType == "raid") then
                loadStates.raidInstance = iType == "raid"
                update = true
            end
            if loadStates.dungeonInstance ~= (iType == "party") then
                loadStates.dungeonInstance = iType == "party"
                update = true
            end
            if loadStates.arenaInstance ~= (iType == "arena") then
                loadStates.arenaInstance = iType == "arena"
                update = true
            end
            if loadStates.battlegroundInstance ~= (iType == "pvp") then
                loadStates.battlegroundInstance = iType == "pvp"
                update = true
            end
            if loadStates.difficulty ~= difficultyID then
                loadStates.difficulty = difficultyID
                loadStates.raidLFR = difficultyID == 17
                loadStates.raidNormal = difficultyID == 14
                loadStates.raidHeroic = difficultyID == 15
                loadStates.raidMythic = difficultyID == 16
                update = true
            end
        end
        if event == "PLAYER_ROLES_ASSIGNED" or event == "PLAYER_TALENT_UPDATE" or event == "INIT" then
            local id, name, description, icon, role, primaryStat = GetSpecializationInfo(GetSpecialization())
            if loadStates.role ~= role then
                loadStates.role = role
                loadStates.roleDPS = role == "DAMAGER"
                loadStates.roleHealer = role == "HEALER"
                loadStates.roleTank = role == "TANK"
                update = true
            end
            if loadStates.specID ~= id then
                loadStates.specID = id
                update = true
            end
        end
        if update then
            _Cooldowns.CheckLoads()
        end
    end 

    _Cooldowns.UnitEventFrames = _Cooldowns.UnitEventFrames or {}
    do
        _Cooldowns.UnitEventFrames["player"] = CreateFrame("FRAME")
        _Cooldowns.UnitEventFrames["player"]:RegisterUnitEvent("UNIT_FLAGS", "player")
        _Cooldowns.UnitEventFrames["player"]:RegisterUnitEvent("PLAYER_FLAGS_CHANGED", "player")
        _Cooldowns.UnitEventFrames["player"]:RegisterUnitEvent("UNIT_AREA_CHANGED", "player")
        _Cooldowns.UnitEventFrames["player"]:SetScript("OnEvent", FlagsUpdate)
    end
    for i = 1, 4 do
        local unit = "party"..i
        _Cooldowns.UnitEventFrames[unit] = CreateFrame("FRAME")
        _Cooldowns.UnitEventFrames[unit]:RegisterUnitEvent("UNIT_FLAGS", unit)
        _Cooldowns.UnitEventFrames[unit]:RegisterUnitEvent("PLAYER_FLAGS_CHANGED", unit)
        _Cooldowns.UnitEventFrames[unit]:RegisterUnitEvent("UNIT_AREA_CHANGED", unit)
        _Cooldowns.UnitEventFrames[unit]:RegisterUnitEvent("UNIT_CONNECTION", unit)
        _Cooldowns.UnitEventFrames[unit]:SetScript("OnEvent", FlagsUpdate)
    end
    for i = 1, 40 do
        local unit = "raid"..i
        _Cooldowns.UnitEventFrames[unit] = CreateFrame("FRAME")
        _Cooldowns.UnitEventFrames[unit]:RegisterUnitEvent("UNIT_FLAGS", unit)
        _Cooldowns.UnitEventFrames[unit]:RegisterUnitEvent("PLAYER_FLAGS_CHANGED", unit)
        _Cooldowns.UnitEventFrames[unit]:RegisterUnitEvent("UNIT_AREA_CHANGED", unit)
        _Cooldowns.UnitEventFrames[unit]:RegisterUnitEvent("UNIT_CONNECTION", unit)
        _Cooldowns.UnitEventFrames[unit]:SetScript("OnEvent", FlagsUpdate)
    end
    _Cooldowns.EventFrames = _Cooldowns.EventFrames or {}
    _Cooldowns.EventFrames["reset"] = CreateFrame("FRAME")
    _Cooldowns.EventFrames["reset"]:RegisterEvent("GROUP_ROSTER_UPDATE")
    _Cooldowns.EventFrames["reset"]:RegisterEvent("GROUP_LEFT")
    _Cooldowns.EventFrames["reset"]:SetScript("OnEvent", function(self, event)
        if event == "GROUP_ROSTER_UPDATE" then
            QueueCheckSubGroups()
        end
        _Cooldowns.ValidateUnits()
        FlagsUpdate(nil, "ALLUNITS")
        CheckInGroup()
    end)
    _Cooldowns.EventFrames["config"] = CreateFrame("FRAME")
    _Cooldowns.EventFrames["config"]:RegisterEvent("PLAYER_ENTERING_WORLD")
    _Cooldowns.EventFrames["config"]:RegisterEvent("PLAYER_LOGIN")
    --_Cooldowns.EventFrames["config"]:RegisterEvent("ADDON_LOADED")
    _Cooldowns.EventFrames["config"]:SetScript("OnEvent", function(self, event, ...)
        if event == "PLAYER_ENTERING_WORLD" then
            QueueCheckSubGroups()
            _Cooldowns.ValidateUnits()
            FlagsUpdate(nil, "ALLUNITS")
            CheckInGroup()
        elseif event == "PLAYER_LOGIN" then
            _Cooldowns.BuildEncounterIDTooltip()
        end
    end)
    _Cooldowns.EventFrames["load"] = CreateFrame("FRAME")
    local loadEvents = {
        "PLAYER_REGEN_DISABLED","PLAYER_REGEN_ENABLED",
        "ENCOUNTER_START", "ENCOUNTER_END",
        "GROUP_ROSTER_UPDATE",
        "ZONE_CHANGED", "ZONE_CHANGED_INDOORS", "ZONE_CHANGED_NEW_AREA", "PLAYER_DIFFICULTY_CHANGED",
        "PLAYER_ROLES_ASSIGNED", "PLAYER_TALENT_UPDATE"
    }
    for _, event in pairs(loadEvents) do
        _Cooldowns.EventFrames["load"]:RegisterEvent(event)
    end
    _Cooldowns.EventFrames["load"]:SetScript("OnEvent", loadFunction)
    C_Timer.After(5, function() loadFunction(nil, "INIT") end)

    _Cooldowns.EventFrames["specChange"] = CreateFrame("FRAME")
    _Cooldowns.EventFrames["specChange"]:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
    _Cooldowns.EventFrames["specChange"]:SetScript("OnEvent", function() openRaidLib.UpdatePlayer() end)
end