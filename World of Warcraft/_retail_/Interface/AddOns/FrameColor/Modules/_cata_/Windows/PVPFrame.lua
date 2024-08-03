local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("PVPFrame")
local color1, color2, coloe3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["PVPFrame"]
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
    if dbObj.classcolored3 then
        color3 = addonTable.classColor
    else
        color3 = dbObj.color3
    end
    self:Recolor(color1, color2, color3, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, color, 0)
end

function module:Recolor(color1, color2, color3, desaturation)
    -- Frame
    for k,v in pairs({
        PVPFramePortraitFrame,
        PVPFrameTopBorder,
        PVPFrameTopRightCorner,
        PVPFrameRightBorder,
        PVPFrameBotRightCorner,
        PVPFrameBtnCornerRight,
        PVPFrameBotLeftCorner,
        PVPFrameBtnCornerLeft,
        PVPFrameLeftBorder,
        PVPFrameBottomBorder,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    -- BG
    local bg = PVPFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b)
    end
    -- Tabs
    for _,v in pairs({
        PVPFrameTab1Left,
        PVPFrameTab1Middle,
        PVPFrameTab1Right,
        PVPFrameTab2Left,
        PVPFrameTab2Middle,
        PVPFrameTab2Right,
        PVPFrameTab3Left,
        PVPFrameTab3Middle,
        PVPFrameTab3Right,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color3.r,color3.g,color3.b)
    end
end


