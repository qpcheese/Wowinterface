local MAJOR, MINOR = "LibCanDispel-1.0", 1
assert(LibStub, MAJOR .. " requires LibStub.")
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then
    return
end

local IsSpellKnown = IsSpellKnown
local IsPlayerSpell = IsPlayerSpell
local IsSpellKnownOrOverridesKnown = IsSpellKnownOrOverridesKnown

local DispelCapabilities = {}
lib.DispelCapabilities = DispelCapabilities

function lib:CanDispel(dispelName)
    return DispelCapabilities[dispelName]
end

local class = select(2,UnitClass("player"))

local dispelAbilities = {
    ["DRUID"] = function()
        if IsSpellKnown(2782) then --Remove Corruption
            DispelCapabilities.Curse = true
            DispelCapabilities.Poison = true
        end
        if IsSpellKnown(88423) then --Nature's Cure
            DispelCapabilities.Magic = true
            if IsPlayerSpell(392378) then --Improved Nature's Cure
                DispelCapabilities.Curse = true
                DispelCapabilities.Poison = true
            end
        end
    end,
    ["MAGE"] = function()
        if IsSpellKnown(475) then --Remove Curse
            DispelCapabilities.Curse = true
        end
    end,
    ["MONK"] = function()
        if IsSpellKnown(218164) then --Detox BM/WW
            DispelCapabilities.Poison = true
            DispelCapabilities.Disease = true
        end
        if IsSpellKnown(115450) then --Detox MW 
            DispelCapabilities.Magic = true
            if IsPlayerSpell(388874) then --Improved Detox 
                DispelCapabilities.Poison = true
                DispelCapabilities.Disease = true
            end
        end
        if IsSpellKnown(115310) then --Revival
            DispelCapabilities.Magic = true
            DispelCapabilities.Poison = true
            DispelCapabilities.Disease = true
        end
        if IsSpellKnown(115310) then --Restoral
            DispelCapabilities.Poison = true
            DispelCapabilities.Disease = true
        end
    end,
    ["PALADIN"] = function()
        if IsSpellKnown(213644) then --Cleanse Toxins
            DispelCapabilities.Poison = true
            DispelCapabilities.Disease = true
        end
        if IsSpellKnown(4987) then --Cleanse
            DispelCapabilities.Magic = true
            if IsPlayerSpell(393024) then --Improved Cleanse
                DispelCapabilities.Poison = true
                DispelCapabilities.Disease = true
            end
        end
        if IsSpellKnown(1022) then --Blessing of Protection
            DispelCapabilities.Bleed = true
        end
    end,
    ["PRIEST"] = function()
        if IsSpellKnown(527) then --Purify
            DispelCapabilities.Magic = true
            if IsPlayerSpell(390632) then --Improved Purify
                DispelCapabilities.Disease = true
            end
        end
        if IsSpellKnown(213634) then --Purify Disease
            DispelCapabilities.Disease = true
        end
        if IsSpellKnown(32375) then --Mass Dispel
            DispelCapabilities.Magic = true
        end
    end,
    ["SHAMAN"] = function()
        if IsSpellKnown(51886) then --Cleanse Spirit
            DispelCapabilities.Curse = true
        end
        if IsSpellKnown(77130) then --Purify Spirit
            DispelCapabilities.Magic = true
            if IsPlayerSpell(383016) then --Improved Purify Spirit
                DispelCapabilities.Curse = true
            end
        end
        if IsSpellKnown(383013) then --Poision Cleansing Totem
            DispelCapabilities.Poison = true
        end
    end,
    ["WARLOCK"] = function()
        if IsSpellKnown(89808, true) then --Singe Magic
            DispelCapabilities.Magic = true
        end
    end,
    ["EVOKER"] = function()
        if IsSpellKnown(374251) then --Cauterizing Flame
            DispelCapabilities.Curse = true
            DispelCapabilities.Poison = true
            DispelCapabilities.Disease = true
            DispelCapabilities.Bleed = true
        end
        if IsSpellKnown(365585) then --Expunge 
            DispelCapabilities.Poison = true
        end
        if IsSpellKnownOrOverridesKnown(360823) then --Naturalize 
            DispelCapabilities.Magic = true
            DispelCapabilities.Poison = true
        end
    end,
    ["DEMONHUNTER"] = function()
        if IsSpellKnown(205604) then --Reverse Magic
            DispelCapabilities.Magic = true
        end
    end,
    ["HUNTER"] = function()
        if IsSpellKnown(212640) then --Mending Bandage
            DispelCapabilities.Poison = true
            DispelCapabilities.Disease = true
        end
    end,
}

local function updateDispelCapabilities()
    DispelCapabilities = {}
    if dispelAbilities[class] then
        dispelAbilities[class]()
    end
end

local frame = CreateFrame("Frame")
frame:SetScript("OnEvent", function(self, event, ...)
    updateDispelCapabilities()
end)
frame:RegisterEvent("TRAIT_CONFIG_UPDATED") 
frame:RegisterEvent("LEARNED_SPELL_IN_TAB") 
frame:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")
frame:RegisterEvent("PLAYER_LOGIN") 
if class == "WARLOCK" then
    frame:RegisterUnitEvent("UNIT_PET", "player")
end
