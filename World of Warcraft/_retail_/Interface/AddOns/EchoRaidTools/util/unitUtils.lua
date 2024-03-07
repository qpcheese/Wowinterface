local _AddonName, _EchoRaidTools = ...;


-- useful function - (minimised version of function by EmptyRivers)
_EchoRaidTools.IterateGroup = function()
    local groupType = IsInRaid() and "raid" or "party"
    local numMembers = groupType == "party" and GetNumSubgroupMembers() or GetNumGroupMembers()
    local i = groupType == "party" and 0 or 1
    return function()
        local ret
        if i == 0 and groupType == "party" then
            ret = "player"
        elseif i <= numMembers and i > 0 then
            ret = groupType .. i
        end
        i = i +  1
        return ret
    end
end

local difficultyGroups = {[14] = 6, [15] = 6, [16] = 4, [17] = 6}
local unitRoles = {}
_EchoRaidTools.IterateGroupByRole = function(role1, role2, role3)
    wipe(unitRoles)
    local inRaid = IsInRaid()
    local diff = GetRaidDifficultyID()
    local useSubGroup = false
    if inRaid and difficultyGroups[diff] then
        useSubGroup = true
    end

    for unit in _EchoRaidTools.IterateGroup() do
        table.insert(unitRoles, {unit = unit, role = UnitGroupRolesAssigned(unit), subGroup = useSubGroup and select(3, GetRaidRosterInfo(UnitInRaid(unit))) or 1})
    end
    table.sort(unitRoles, function(a,b)
        local aScore = a.role == role1 and 1 or a.role == role2 and 2 or a.role == role3 and 3 or 4
        local bScore = b.role == role1 and 1 or b.role == role2 and 2 or b.role == role3 and 3 or 4
        local aInMainGroup = useSubGroup and a.subGroup <= difficultyGroups[diff]
        local bInMainGroup = useSubGroup and b.subGroup <= difficultyGroups[diff]
        if useSubGroup and aInMainGroup ~= bInMainGroup then
            return aInMainGroup
        end
        if aScore == bScore then
            return a.unit > b.unit
        else
           return aScore < bScore
        end
    end
    )
    local i = 1
    return function()
        local ret
        if i <= #unitRoles then
            ret = unitRoles[i].unit
        end
        i = i + 1
        return ret
    end
end

_EchoRaidTools.IsGroupUnit = function(unit)
    if IsInRaid() then
        return unit:sub(1, 4) == "raid"
    else
        return unit == "player" or unit:sub(1, 5) == "party"
    end
end

_EchoRaidTools.DisambiguateUnit = function(unit)
    if not UnitExists(unit) then
        return
    elseif _EchoRaidTools.IsGroupUnit(unit) then
        return unit
    else
        if IsInRaid() then
            return "raid"..UnitInRaid(unit)
        else
            for groupUnit in _EchoRaidTools.IterateGroup() do
                if UnitIsUnit(groupUnit, unit) then
                    return groupUnit
                end
            end
        end
    end
end