local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("FrameColor_Skin")
local color1, color2

function module:OnEnable()
    local dbObj = addon.db.profile["Skins"]["FrameColor_Skin"]
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
    self:Recolor(color1, color2, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, 0)
end

function module:Recolor(color1, color2, desaturation)
    for k,v in pairs({
        FrameColorOptionsPortraitFrame,
        FrameColorOptionsTopBorder,
        FrameColorOptionsTopRightCorner,
        FrameColorOptionsRightBorder,
        FrameColorOptionsBotRightCorner,
        FrameColorOptionsBtnCornerRight,
        FrameColorOptionsBotLeftCorner,
        FrameColorOptionsBtnCornerLeft,
        FrameColorOptionsLeftBorder,
        FrameColorOptionsBottomBorder,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    local bg = FrameColorOptionsBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
end


