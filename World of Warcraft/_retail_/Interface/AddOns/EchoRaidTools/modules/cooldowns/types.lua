local _AddonName, _EchoRaidTools = ...
local _Cooldowns = _EchoRaidTools:GetModule("cooldowns")

local LibGetFrame = LibStub:GetLibrary("LibGetFrame-1.0")

_Cooldowns.types = _Cooldowns.types or {}
local types = _Cooldowns.types

--[[types.displayTypes = {
    {type = "bar", text = "Bars"},
    {type = "icon", text = "Icons"},
    {type = "text", text = "Texts"},
}
types.displayTypeIndex = {}
for i, typeInfo in ipairs(types.displayTypes) do
    types.displayTypeIndex[typeInfo.type] = i
end]]

types.textTypes = {"SpellNameText", "UnitNameText", "DurationText", "ChargesText"}
types.textTypeToLabel = {
    ["DurationText"] = "Duration Text",
    ["SpellNameText"] = "Spell Name Text",
    ["UnitNameText"] = "Unit Name Text",
    ["ChargesText"] = "Charges Text"
}

types.sortMethods = {
    ["priority"] = "Priority",
    ["unit"] = "Unit",
    ["expirationTime"] = "Remaining Duration",
    ["baseDuration"] = "Base Duration",
    ["spellName"] = "Spell Name",
    ["class"] = "Class"
}

	-- Filter Types:
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

-- string to filter index
types.filterTypes = {
    ["defensive-raid"] = 4,
    ["defensive-target"] = 3,
    ["defensive-personal"] = 2,
    ["ofensive"] = 1,
    ["utility"] = 5,
    ["interrupt"] = 6,
    ["dispel"] = 7,
    ["crowd-control"] = 8,
    ["racial"] = 9,
    ["item-heal"] = 10,
    ["item-power"] = 11,
    ["item-utility"] = 12,
}
types.typeToFilterString = {
    {string = "ofensive", text = "Offensive"},
    {string = "defensive-personal", text = "Defensive (Personal)"},
    {string = "defensive-target", text = "Defensive (Target)"},
    {string = "defensive-raid", text = "Defensive (Raid)"},
    {string = "utility", text = "Utility"},
    {string = "interrupt", text = "Interrupt"},
    {string = "dispel", text = "Dispels"},
    {string = "crowd-control", text = "Crowd Control"},
    {string = "racial", text = "Racials"},
    {string = "Item-heal", text = "Item (heal)"},
    {string = "item-power", text = "Item (power)"},
    {string = "item-utility", text = "Item (utility)"}
}

types.primaryGrowDirections = {
    ["UP"] = "Up",
    ["DOWN"] = "Down",
    ["LEFT"] = "Left",
    ["RIGHT"] = "Right"
}
types.secondaryGrowDirections = {
    ["UP"] = {
        ["LEFT"] = "Left",
        ["RIGHT"] = "Right"
    },
    ["DOWN"] = {
        ["LEFT"] = "Left",
        ["RIGHT"] = "Right"
    },
    ["LEFT"] = {
        ["UP"] = "Up",
        ["DOWN"] = "Down",
    },
    ["RIGHT"] = {
        ["UP"] = "Up",
        ["DOWN"] = "Down",
    },
}

types.oppositePoints = {
    ["TOPLEFT"] = "BOTTOMRIGHT",
	["TOP"] = "BOTTOM",
	["TOPRIGHT"] = "BOTTOMLEFT",
	["BOTTOMLEFT"] = "TOPRIGHT",
	["BOTTOM"] = "TOP",
	["BOTTOMRIGHT"] = "TOPLEFT",
	["CENTER"] = "CENTER",
	["LEFT"] = "RIGHT",
	["RIGHT"] = "LEFT",
}

types.AnchorPoints = {
	"TOP",
	"LEFT",
	"RIGHT",
	"BOTTOM",
	"CENTER",
    "TOPLEFT",
	"TOPRIGHT",
	"BOTTOMLEFT",
	"BOTTOMRIGHT",
}

types.IconSides = {
    ["left"] = "Left",
    ["right"] = "Right",
}

types.centralSelfPoints = {
    ["CENTER"] = true,
    ["LEFT"] = true,
    ["RIGHT"] = true,
    ["TOP"] = true,
    ["BOTTOM"] = true,
}

types.spellNameAbbreivateTypes = {
    {type = "none", text = "None"},
    {type = "first", text = "First word only"},
    {type = "last", text = "Last word only"},
    {type = "ABC", text = "A.B.Text"}
}

types.font_flags = {
    ["NONE"] = "None",
    ["MONOCHROME"] = "Monochrome",
    ["OUTLINE"] = "Outline",
    ["THICKOUTLINE"]  = "Thick Outline",
    ["MONOCHROME, OUTLINE"] = "Monochrome Outline",
    ["MONOCHROME, THICKOUTLINE"] = "Monochrome Thick Outline"
}

types.partyUnits = {
    ["player"] = true,
}
for i = 1, 4 do
    types.partyUnits["party"..i] = true
end
types.raidUnits = {
}
for i = 1, 40 do
    types.raidUnits["raid"..i] = true
end
types.soloUnits = {
    ["player"] = true
}

types.anchorRegions = {
    ["display"] = "Main Display Region",
    ["icon"] = "Icon",
    ["bar"] = "Bar"
}

_Cooldowns.GenerateSpellList = function()
    types.fullSpellList = {}
    types.spellLookupTable = {}
    for spellID, info in pairs(LIB_OPEN_RAID_COOLDOWNS_INFO) do
        local spellName, _, icon = GetSpellInfo(spellID)
        if spellName then
            local t = {
                spellID = spellID,
                stringSpellID = tostring(spellID),
                class = info.class,
                classLower = info.class:lower(),
                spellName = spellName,
                spellNameLower = spellName:lower(),
                icon = icon,
                type = info.type,
                typeString = types.typeToFilterString[info.type].text,
                desc = GetSpellDescription(spellID):lower(),
            }
            table.insert(types.fullSpellList, t)
            types.spellLookupTable[spellID] = t
        else
            LIB_OPEN_RAID_COOLDOWNS_INFO[spellID] = nil
        end
    end
    table.sort(types.fullSpellList, function(a, b)
        if a.type == b.type then
            if a.class == b.class then
                return a.spellName < b.spellName
            else
                return a.class < b.class
            end
        else
            return a.type < b.type
        end
    end)
end

_Cooldowns.GenerateSpellList()

types.availableStates = {
    {state = "UnitDead", text = "Unit Dead"},
    {state = "buffUp", text = "CD Active"},
    {state = "UnitAway", text = "Unit Away"},
    --{state = "InactiveGroup", text = "Inactive Group"},
    {state = "OnCD", text = "Spell On Cooldown"},
    {state = "outOfRange", text = "Unit Not In Range"},
}
types.displayChanges = {
}
local vowels = {"a","e","i","o","u"}
local consonants = {"b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z"}
_Cooldowns.getRandomName = function()
    local name = ""
    for i = 1, fastrandom(5, 16) do
        local letter = i % 2 == 0 and vowels[fastrandom(1, #vowels)] or consonants[fastrandom(1, #consonants)]
        if i == 1 then letter = string.upper(letter) end
        name = name .. letter
    end
    return name
end
_Cooldowns.getSpellClass = function(spellID)
    local spellInfo = types.spellLookupTable[spellID]
    return spellInfo and spellInfo.class ~= "" and spellInfo.class or "WARRIOR"
end

types.configSections = {
    {label = "General Settings", name = "GeneralConfigSection"},
    {label = "Spell Selection", name = "FilterConfigSection"},
    {label = "Layout Settings", name = "LayoutConfigSection"},
    {label = "Display Settings", name = "DisplayConfigSection"},
    {label = "Text Settings", name = "TextConfigSection"},
    {label = "Conditions", name = "StatesSettingsConfigSection"},
    {label = "Load Settings", name = "LoadSettingsConfigSection"}
}

local t = {}
for i = 1, 13 do
    local className, classFile = GetClassInfo(i)
    t[i] = {}
    for j = 1, 4 do
        local specID, name, _, icon = GetSpecializationInfoForClassID(i,j)
        if specID then
            t[i][j] = {specID = specID, name = name, icon = icon}
        end
    end
end
types.fullSpecList = t

local tooltip = "Encounter IDs\n\n"
function _Cooldowns.BuildEncounterIDTooltip()
	local currentlySelectedTier = EJ_GetCurrentTier()
    local tier = EJ_GetNumTiers()
    EJ_SelectTier(tier)
    local i = 1
    local instanceID = EJ_GetInstanceByIndex(i, true)
    while instanceID do
        EJ_SelectInstance(instanceID)
        local name = EJ_GetInstanceInfo(instanceID)
        tooltip = format("%s%s\n", tooltip, name)
        local j = 1
        local boss, _, _, _, _, _, encounter_id = EJ_GetEncounterInfoByIndex(j, instanceID)
        while boss do
            if encounter_id then
                tooltip = format("%s|cffffffff%s - |r%d\n", tooltip, boss, encounter_id)
            end
            j = j + 1
            boss, _, _, _, _, _, encounter_id = EJ_GetEncounterInfoByIndex(j, instanceID)
        end
        tooltip = tooltip .. "\n"
        i = i + 1
        instanceID = EJ_GetInstanceByIndex(i, true)
    end
	EJ_SelectTier(currentlySelectedTier)

    tooltip = tooltip.. "|rSupports multiple entries, separated by commas or spaces"
end
function _Cooldowns.GetEncounterIDTooltip()
    return tooltip
end

types.UFpriorities = LibGetFrame.getDefaultFramePriorities()

types.UFPrioritiesLabels = {
    -- raid frames
    ["^Vd1"] = "VuhDo1", -- vuhdo
    ["^Vd2"] = "VuhDo2", -- vuhdo
    ["^Vd3"] = "VuhDo3", -- vuhdo
    ["^Vd4"] = "VuhDo4", -- vuhdo
    ["^Vd5"] = "VuhDo5", -- vuhdo
    ["^Vd"] = "VuhDo", -- vuhdo
    ["^HealBot_HealUnit"] = "HealBot", -- healbot
    ["^hbPet_HealUnit"] = "Healbot (pets)", -- healbot
    ["^GridLayout"] = "Grid", -- grid
    ["^Grid2Layout"] = "Grid2", -- grid2
    ["^NugRaid%d+UnitButton%d+"] = "Aptechka", -- Aptechka
    ["^PlexusLayout"] = "Plexus", -- plexus
    ["^ElvUF_Raid%d*Group"] = "ElvUI (raid)", -- elv
    ["^oUF_bdGrid"] = "bdGrid", -- bdgrid
    ["^oUF_.-Raid"] = "oUF", -- generic oUF
    ["^LimeGroup"] = "Lime", -- lime
    ["^InvenRaidFrames3Group%dUnitButton"] = "InvenRaidFrames", -- InvenRaidFrames3
    ["^SUFHeaderraid"] = "SUF", -- suf
    ["^LUFHeaderraid"] = "LUF", -- luf
    ["^AshToAshUnit%d+Unit%d+"] = "AshToAsh", -- AshToAsh
    ["^Cell"] = "Cell", -- Cell
    -- party frames
    ["^AleaUI_GroupHeader"] = "Alea (Party)", -- Alea
    ["^SUFHeaderparty"] = "SUF (party)", --suf
    ["^LUFHeaderparty"] = "LUF (party)", --luf
    ["^ElvUF_PartyGroup"] = "ElvUI (party)", -- elv
    ["^oUF_.-Party"] = "oUF (party)", -- generic oUF
    ["^PitBull4_Groups_Party"] = "PitBull (party)", -- pitbull4
    ["^CompactRaid"] = "Blizzard (raid)", -- blizz
    ["^CompactParty"] = "Blizzard (party)", -- blizz
    -- player frame
    ["^InvenUnitFrames_Player"] = "Inven (player)",
    ["^SUFUnitplayer"] = "SUF (player)",
    ["^LUFUnitplayer"] = "LUF (player)",
    ["^PitBull4_Frames_Player"] = "PitBull (player)",
    ["^ElvUF_Player"] = "ElvUI (player)",
    ["^oUF_.-Player"] = "oUF (player)",
    ["^PlayerFrame"] = "Blizzard (player)",
  }

  types.StrataList = {
    [1] = "BACKGROUND",
    [2] = "LOW",
    [3] = "MEDIUM",
    [4] = "HIGH",
    [5] = "DIALOG",
    [6] = "FULLSCREEN",
    [7] = "FULLSCREEN_DIALOG",
    [8] = "TOOLTIP",
  }
