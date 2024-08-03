local _, addonTable = ...
local addon = addonTable.addon

local _G = _G
local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("CompactRaidGroupBorderFrame")
Mixin(module, addonTable.hooks)
local color1


function module:OnEnable()
    local dbObj = addon.db.profile["Group"]["CompactRaidGroupBorderFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    local i = 0
    self:HookFunc("CompactRaidGroup_OnLoad",function()
        i = i + 1
        for _, texture in pairs({
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderLeft"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderRight"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderTop"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderBottom"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderTopRight"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderBottomRight"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderTopLeft"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderBottomLeft"],
        }) do
            texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
        for n=1,5 do
            for _, texture in pairs({
                _G["CompactRaidGroup"..i.. "Member" ..n.. "HorizBottomBorder"],
                _G["CompactRaidGroup"..i.. "Member" ..n.. "HorizTopBorder"],
                _G["CompactRaidGroup"..i.. "Member" ..n.. "VertRightBorder"],
                _G["CompactRaidGroup"..i.. "Member" ..n.. "VertLeftBorder"],
            }) do
                texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
            end
        end
        if i == 8 then
            self:Unhook("CompactRaidGroup_OnLoad")
        end
    end)
    self:Recolor(color1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:DisableHooks()
    self:Recolor(color)
end

function module:Recolor(color1)
--Seperate Groups 
    for i=1,NUM_RAID_GROUPS do
        for _, texture in pairs({
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderLeft"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderRight"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderTop"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderBottom"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderTopRight"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderBottomRight"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderTopLeft"],
            _G["CompactRaidGroup" ..i.. "BorderFrameBorderBottomLeft"],
        }) do
            texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
        for n=1,5 do
            for _, texture in pairs({
                _G["CompactRaidGroup"..i.. "Member" ..n.. "HorizBottomBorder"],
                _G["CompactRaidGroup"..i.. "Member" ..n.. "HorizTopBorder"],
                _G["CompactRaidGroup"..i.. "Member" ..n.. "VertRightBorder"],
                _G["CompactRaidGroup"..i.. "Member" ..n.. "VertLeftBorder"],
            }) do
                texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
            end
        end
    end
end

