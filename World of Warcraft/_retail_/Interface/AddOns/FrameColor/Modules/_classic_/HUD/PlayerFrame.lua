--[[classic file]]--
local _, addonTable = ...
local addon = addonTable.addon

local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("PlayerFrame")
Mixin(module, addonTable.hooks)
local color1
local statusTexture = PlayerStatusTexture

function module:OnEnable()
    local dbObj = addon.db.profile["UnitFrames"]["PlayerFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if dbObj.hide_pulsing_resting then
        local hideResting = function() 
            if IsResting() then
                statusTexture:Hide()
            end
        end
        self:HookFunc("PlayerFrame_UpdateStatus", hideResting)
        hideResting()
    end
    self:Recolor(color1, 1)
end

function module:OnDisable()
    self:DisableHooks()
    if IsResting() then
        statusTexture:Show()
    end
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
    for _,frameTexture in pairs({
        PlayerFrameTexture,
    }) do
        frameTexture:SetDesaturation(desaturation)
        frameTexture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end

