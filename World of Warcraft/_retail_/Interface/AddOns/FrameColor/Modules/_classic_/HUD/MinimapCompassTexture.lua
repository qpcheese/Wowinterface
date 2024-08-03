--[[classic file]]--
local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("MinimapCompassTexture")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["HUD"]["MinimapCompassTexture"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    self:Recolor(color1, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
    --reskin frames
    for _,frameTexture in pairs({
        --MinimapCompassTexture,
        MinimapBorder,
        MinimapBorderTop,
        --GameTimeTexture,
    }) do
        frameTexture:SetDesaturation(desaturation)
        frameTexture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    for k,v in pairs({
        TimeManagerFramePortraitFrame,
        TimeManagerFrameTopBorder,
        TimeManagerFrameTopRightCorner,
        TimeManagerFrameRightBorder,
        TimeManagerFrameBotRightCorner,
        TimeManagerFrameBtnCornerRight,
        TimeManagerFrameBotLeftCorner,
        TimeManagerFrameBtnCornerLeft,
        TimeManagerFrameLeftBorder,
        TimeManagerFrameBottomBorder,
        TimeManagerFrameButtonBottomBorder,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
end


