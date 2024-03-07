local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

function _Cooldowns.Modernise(data, baseGroupData)
    local SV_version = data.version

    local MigrateLoadSettings = function(groupData)
        if groupData and groupData.loadSettings and (not groupData.loadSettings.combat) then
            local t = groupData.loadSettings

            t.combat = {}
            t.combat.inCombat = t.inCombat
            t.inCombat = nil
            t.combat.inEncounter = t.inEncounter
            t.inEncounter = nil
            t.combat.encounterID = t.encounterID
            t.encounterID = nil
            t.combat.InInstance = t.InInstance
            t.InInstance = nil

            t.group = {}
            t.group.solo = t.solo
            t.solo = nil
            t.group.inParty = t.inParty
            t.inParty = nil
            t.group.inRaid = t.inRaid
            t.inRaid = nil

            t.instance = {}
            t.instance.raidInstance = t.raidInstance
            t.raidInstance = nil
            t.instance.dungeonInstance = t.dungeonInstance
            t.dungeonInstance = nil
            t.instance.arenaInstance = t.arenaInstance
            t.arenaInstance = nil
            t.instance.battlegroundInstance = t.battlegroundInstance
            t.battlegroundInstance = nil

            t.difficulty = {}
            t.difficulty.raidLFR = t.raidLFR
            t.raidLFR = nil
            t.difficulty.raidNormal = t.raidNormal
            t.raidNormal = nil
            t.difficulty.raidHeroic = t.raidHeroic
            t.raidHeroic = nil
            t.difficulty.raidMythic = t.raidMythic
            t.raidMythic = nil

            t.role = {}
            t.role.roleDPS = t.roleDPS
            t.roleDPS = nil
            t.role.roleHealer = t.roleHealer
            t.roleHealer = nil
            t.role.roleTank = t.roleTank
            t.roleTank = nil
        end
    end
    local MigrateSettingsIntoSections = function(groupData)
        if groupData and not groupData.displaySettings then
            groupData.displaySettings = {}
            for key, _ in pairs(baseGroupData.displaySettings) do
                if groupData[key] ~= nil then
                    groupData.displaySettings[key] = groupData[key]
                    groupData[key] = nil
                end
            end
            groupData.layoutSettings = {}
            for key, _ in pairs(baseGroupData.layoutSettings) do
                if groupData[key] ~= nil then
                    groupData.layoutSettings[key] = groupData[key]
                    groupData[key] = nil
                end
            end
            groupData.filters.customFilters = {}
            for key, value in pairs(groupData.customFilters) do
                groupData.filters.customFilters[key] = value
                groupData.customFilters[key] = nil
            end
            groupData.customFilters = nil
            groupData.stateSettings.subGroups = {}
            for i = 1, 8 do
                if groupData["group"..i] ~= nil then
                    groupData.stateSettings.subGroups["group"..i] = groupData["group"..i]
                    groupData["group"..i] = nil
                end
            end
            local removedKeys = {"desaturateDead", "desaturateUnavailable", "hideExtraGroups", "hideDead", "hideUnavailable", "useHeaders"}
            for _, key in pairs(removedKeys) do
                if groupData[key] ~= nil then
                    groupData[key] = nil
                end
            end
        end
    end
    local FixBrokenFilterNames = function()
        if data.customFilters then
            for i, filterDetails in ipairs(data.customFilters) do
                if type(filterDetails.name) ~= "string" then
                    local baseName = "New Filter"
                    local name, i = baseName, 0
                    local filterExists = function(name)
                        for _, filter in ipairs(data.customFilters) do
                            if filter.name == name then
                                return true
                            end
                        end
                    end
                    while filterExists(name) do
                        i = i + 1
                        name = format("%s %d", baseName, i)
                    end
                    filterDetails.name = name
                end
            end
        end
    end
    if not SV_version or SV_version < 2 then
        for i, group in ipairs(data.groups) do
            MigrateLoadSettings(group.groupData)
            MigrateSettingsIntoSections(group.groupData)
        end
        FixBrokenFilterNames()
    end
    if SV_version and SV_version < 3 then
        data.ModuleEnabled = true
    end
    if SV_version and SV_version < 4 then

        for i, group in ipairs(data.groups) do
            if not group.groupData.spells then
                group.groupData.spells = {}
                group.groupData.spellsByID = {}
                local enabledFilters = {}
                local enabledCustomFilterSpells = {}
                for j, info in ipairs(group.groupData.filters) do
                    if info.enabled then
                        enabledFilters[j] = true
                    end
                end
                for j, info in ipairs(group.groupData.filters.customFilters) do
                    if info.enabled then
                        for _, spellID in pairs(data.customFilters[j].spells) do
                            enabledCustomFilterSpells[spellID] = true
                        end
                    end
                end
                for j, details in ipairs(_Cooldowns.types.fullSpellList) do
                    if enabledFilters[details.type] or enabledCustomFilterSpells[details.spellID] then
                        table.insert(group.groupData.spells, details.spellID)
                        group.groupData.spellsByID[details.spellID] = true
                    end
                end
            end
            group.groupData.useFilterColor = nil
            group.groupData.BackgroundUseFilterColor = nil
            group.groupData.useBorderFilterColor = nil
            group.groupData.filters = nil
            group.groupData.texts.SpellNameTextFilterColor = nil
            group.groupData.texts.UnitNameTextFilterColor = nil
            group.groupData.texts.DurationTextFilterColor = nil
            group.groupData.texts.ChargesTextFilterColor = nil
            if group.groupData.layoutSettings.SortMethod and group.groupData.layoutSettings.SortMethod == "filter" then
                group.groupData.layoutSettings.SortMethod = "priority"
            end
            if group.groupData.layoutSettings.SortMethodSecondary and group.groupData.layoutSettings.SortMethodSecondary == "filter" then
                group.groupData.layoutSettings.SortMethodSecondary = "priority"
            end
            if group.groupData.layoutSettings.SortMethod and group.groupData.layoutSettings.SortMethod == "spellName" then
                group.groupData.layoutSettings.SortMethod = "priority"
            end
            if group.groupData.layoutSettings.SortMethodSecondary and group.groupData.layoutSettings.SortMethodSecondary == "spellName" then
                if group.groupData.layoutSettings.SortMethod == "priority" then
                    group.groupData.layoutSettings.SortMethodSecondary = "unit"
                else
                    group.groupData.layoutSettings.SortMethodSecondary = "priority"
                end
            end
        end
        data.customFilters = nil
        data.ModuleEnabled = true
    end

    if SV_version and SV_version < 5 then -- fix spell mismatch
        for i, group in ipairs(data.groups) do
            for spellID, _ in pairs(group.groupData.spellsByID) do
                if not tContains(group.groupData.spells, spellID) then
                    group.groupData.spellsByID[spellID] = nil
                end
            end
        end
    end

    if SV_version and SV_version < 6 then -- fix strata type
        for i, group in ipairs(data.groups) do
            if type(group.groupData.layoutSettings.strata) == "string" then
                group.groupData.layoutSettings.strata = 3
            end
        end
    end

    do -- Merge in any new settings that were added since the groups were create
        local baseData = CopyTable(baseGroupData)
        local function Merge(base, group, IsGroupOverwriter)
            local Merged = CopyTable(base)

            for groupKey, groupValue in pairs(group) do
                local baseValue = base[groupKey]

                if type(baseValue) == "table" and type(groupValue) == "table" then
                    Merged[groupKey] = Merge(baseValue, groupValue, IsGroupOverwriter)
                    if Merged[groupKey].r and Merged[groupKey].g and Merged[groupKey].b and Merged[groupKey].a then
                        Merged[groupKey] = CreateColor(Merged[groupKey].r, Merged[groupKey].g, Merged[groupKey].b, Merged[groupKey].a)
                    end
                elseif Merged[groupKey] or IsGroupOverwriter then
                    Merged[groupKey] = groupValue
                end
            end

            return Merged
        end
        for i, group in ipairs(data.groups) do
            local groupData = group.groupData
            data.groups[i].groupData = Merge(baseData, groupData, true)
        end
    end
    do -- find any rgba tables that aren't colour objects
        local function iterateTable(t)
            for k, v in pairs(t) do
                if type(v) == "table" then
                    iterateTable(v)
                    if v.r and v.g and v.b then
                        t[k] = CreateColor(v.r, v.g, v.b, v.a or 1)
                    end
                end
            end
        end
        for i, group in ipairs(data.groups) do
            local groupData = group.groupData
            iterateTable(groupData)
        end
    end
    do -- remove any spells that no longer exist
        if _Cooldowns.types.spellLookupTable then
            for groupIndex, group in ipairs(data.groups) do
                for i = #group.groupData.spells, 1, -1 do
                    local spellID = group.groupData.spells[i]
                    if not _Cooldowns.types.spellLookupTable[spellID] then
                        tDeleteItem(group.groupData.spells, spellID)
                        group.groupData.spellsByID[spellID] = nil
                    end
                end
            end
        end
    end

    data.version = 6
end