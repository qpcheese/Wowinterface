local _, addonTable = ...
local addon = addonTable.addon

local class_colors = {}
local reaction_colors = {}
local UnitIsPlayer = UnitIsPlayer
local select = select
local UnitClass = UnitClass

--Colors
function addon:SetColorOverrides()
    local dbObj = addon.db.profile.ColorOverrides
    class_colors = {
        ["DEATHKNIGHT"] = dbObj.ClassColors["DEATHKNIGHT"],
        ["DEMONHUNTER"] = dbObj.ClassColors["DEMONHUNTER"],
        ["DRUID"]       = dbObj.ClassColors["DRUID"],
        ["EVOKER"]      = dbObj.ClassColors["EVOKER"],
        ["HUNTER"]      = dbObj.ClassColors["HUNTER"],
        ["MAGE"]        = dbObj.ClassColors["MAGE"],
        ["MONK"]        = dbObj.ClassColors["MONK"],
        ["PALADIN"]     = dbObj.ClassColors["PALADIN"],
        ["PRIEST"]      = dbObj.ClassColors["PRIEST"],
        ["ROGUE"]       = dbObj.ClassColors["ROGUE"],
        ["SHAMAN"]      = dbObj.ClassColors["SHAMAN"],
        ["WARLOCK"]     = dbObj.ClassColors["WARLOCK"],
        ["WARRIOR"]     = dbObj.ClassColors["WARRIOR"],
    }
    reaction_colors = {
        ["HOSTILE"]     = dbObj.ReactionColors["HOSTILE"],
        ["NEUTRAL"]     = dbObj.ReactionColors["NEUTRAL"],
        ["FRIENDLY"]    = dbObj.ReactionColors["FRIENDLY"],
    }
    addonTable.classColor = class_colors[addonTable.playerClass]
end

--Units
local Target, ToT, Focus, ToF = {}, {}, {}, {}
local Units = {
    ["target"] = Target,
    ["focus"] = Focus,
    ["targettarget"] = ToT,
    ["focustarget"] = ToF,
}
--Get Units for other modules
function addon:GetUnit(unit)
    return Units[unit]
end

function addon:GetReactionColor(unit)
    local reaction
    local reactionColor 
    reaction = UnitReaction("player", unit)
    if reaction == 2 then 
        reactionColor = reaction_colors["HOSTILE"]
    elseif reaction == 4 then 
        reactionColor = reaction_colors["NEUTRAL"]
    else
        reactionColor = reaction_colors["FRIENDLY"]
    end
    return reactionColor
end

function addon:GetUnitInformation(addon_unit, unit)
    if UnitIsPlayer(unit) then
        addon_unit.isPlayer      = true
        addon_unit.Class         = select(2,UnitClass(unit))
        addon_unit.ClassColor    = class_colors[addon_unit.Class]
    else
        addon_unit.isPlayer      = false
    end
    addon_unit.ReactionColor = self:GetReactionColor(unit)
end

--PLAYER_TARGET_CHANGED
local OnTargetChanged_Callbacks = {}
function addon:RegisterOnTargetChanged(callback, name)
    self:GetUnitInformation(Target,"target")
    self:RegisterEvent("PLAYER_TARGET_CHANGED","OnTargetChanged")
    OnTargetChanged_Callbacks[name] = callback
end

function addon:UnregisterOnTargetChanged(name)
    OnTargetChanged_Callbacks[name] = nil
end

function addon:OnTargetChanged()
    self:GetUnitInformation(Target,"target")
    self:GetUnitInformation(ToT,"targettarget")
    for _,callback in pairs(OnTargetChanged_Callbacks) do
        callback()
    end
end

--PLAYER_FOCUS_CHANGED
local OnFocusChanged_Callbacks = {}
function addon:RegisterOnFocusChanged(callback, name)
    self:GetUnitInformation(Focus,"focus")
    self:RegisterEvent("PLAYER_FOCUS_CHANGED","OnFocusChanged")
    OnFocusChanged_Callbacks[name] = callback
end

function addon:UnregisterOnFocusChanged(name)
    OnFocusChanged_Callbacks[name] = nil
end

function addon:OnFocusChanged()
    self:GetUnitInformation(Focus,"focus")
    self:GetUnitInformation(ToF,"focustarget")
    for _,callback in pairs(OnFocusChanged_Callbacks) do
        callback()
    end
end

--UNIT_TARGET
--ToT/ToF
local registeredOnUnitTarget = {}
local OnTargetTargetChanged_Callbacks = {}
local OnFocusTargetChanged_Callbacks = {}
local OnUnitTarget_Callbacks = {
    ["target"] = function()    
        addon:GetUnitInformation(ToT,"targettarget")
        for _,callback in pairs(OnTargetTargetChanged_Callbacks) do
            callback()
        end
    end,
    ["focus"] = function()   
        addon:GetUnitInformation(ToF,"focustarget")
        for _,callback in pairs(OnFocusTargetChanged_Callbacks) do
            callback()
        end
    end,
}

function addon:OnUnitTarget(_, unit)
    if registeredOnUnitTarget[unit] then
        OnUnitTarget_Callbacks[unit]()
    end
end

function addon:RegisterOnTargetTargetChanged(callback, name)
    self:GetUnitInformation(ToT,"targettarget")
    self:RegisterEvent("UNIT_TARGET","OnUnitTarget")
    registeredOnUnitTarget["target"] = true
    OnTargetTargetChanged_Callbacks[name] = callback
end

function addon:UnregisterOnTargetTargetChanged(name)
    OnTargetTargetChanged_Callbacks[name] = nil
end

function addon:RegisterOnFocusTargetChanged(callback, name)
    self:GetUnitInformation(ToF,"focustarget")
    self:RegisterEvent("UNIT_TARGET","OnUnitTarget")
    registeredOnUnitTarget["focus"] = true
    OnFocusTargetChanged_Callbacks[name] = callback
end

function addon:UnregisterOnFocusTargetChanged(name)
    OnFocusTargetChanged_Callbacks[name] = nil
end