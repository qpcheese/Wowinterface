local _, addonTable = ...
local addon = addonTable.addon

local IsResting = IsResting
local GetChildren = GetChildren
local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("PlayerFrame")
Mixin(module, addonTable.hooks)
local color1, color2
local statusTexture = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.StatusTexture

function module:OnEnable()
    local dbObj = addon.db.profile["UnitFrames"]["PlayerFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if dbObj.classcolored2 then
        color2 = addonTable.classColor
    else
        color2 = dbObj.color2
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
    self:Recolor(color1, color2, 1)
end

local classPowerBar = {
    ["PALADIN"] = function(color, desaturation)
        for _, texture in pairs({
            PaladinPowerBarFrame.Background,
            PaladinPowerBarFrame.ActiveTexture,
        }) do
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color.r,color.g,color.b,color.a)
        end
    end,
    ["DEATHKNIGHT"] = function(color, desaturation)
        local runes = _G.RuneFrame
        if runes then   
            for i=1,6 do
                local rune_active = runes["Rune"..i].BG_Active
                local rune_inactive = runes["Rune"..i].BG_Inactive
                if rune_active then 
                    rune_active:SetDesaturation(desaturation)
                    rune_active:SetVertexColor(color.r,color.g,color.b,color.a)
                end   
                if rune_inactive then 
                    rune_inactive:SetDesaturation(desaturation)
                    rune_inactive:SetVertexColor(color.r,color.g,color.b,color.a)
                end   
            end
        end
    end,
    ["WARLOCK"] = function(color, desaturation)
        local soulShards = _G.WarlockPowerFrame
        if soulShards then  
            for _,shard in pairs ({soulShards:GetChildren()}) do
                if shard.Background then
                    shard.Background:SetDesaturation(desaturation)
                    shard.Background:SetVertexColor(color.r,color.g,color.b,color.a)
                end 
            end
        end
    end,
}

function module:OnDisable()
    self:DisableHooks()
    if IsResting() then
        statusTexture:Show()
    end
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, 0)
end

function module:Recolor(color1, color2, desaturation)
    for _,frameTexture in pairs({
        PlayerFrame.PlayerFrameContainer.FrameTexture,
        PlayerFrame.PlayerFrameContainer.AlternatePowerFrameTexture,
        PlayerFrame.PlayerFrameContainer.VehicleFrameTexture,
        PlayerFrameGroupIndicatorLeft,
        PlayerFrameGroupIndicatorMiddle,
        PlayerFrameGroupIndicatorRight,
    }) do
        frameTexture:SetDesaturation(desaturation)
        frameTexture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end

    local cornerIcon = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerPortraitCornerIcon
    cornerIcon:SetDesaturation(desaturation)
    cornerIcon:SetVertexColor(color2.r,color2.g,color2.b,color2.a)

    if classPowerBar[addonTable.playerClass] then
        classPowerBar[addonTable.playerClass](color1, desaturation)
    end
end


