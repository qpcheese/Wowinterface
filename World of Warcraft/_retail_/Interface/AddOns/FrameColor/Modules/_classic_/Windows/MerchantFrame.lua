local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("MerchantFrame")
local color1, color2, color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["MerchantFrame"]
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
    for k,v in pairs({
        MerchantFrameTitleBg,
        MerchantFrameTopBorder,
        MerchantFrameTopRightCorner,
        MerchantFramePortraitFrame,
        MerchantFrameRightBorder,
        MerchantFrameBotRightCorner,
        MerchantFrameBottomBorder,
        MerchantFrameBotLeftCorner,
        MerchantFrameLeftBorder,
        MerchantFrameBtnCornerLeft,
        MerchantFrameBtnCornerRight,
        MerchantFrameBottomLeftBorder,
        MerchantFrameBottomRightBorder,
        MerchantMoneyBgLeft,
        MerchantMoneyBgMiddle,
        MerchantMoneyBgRight,
        MerchantFrameButtonBottomBorder,
        MerchantMoneyInsetInsetBottomBorder,
        MerchantMoneyInsetInsetLeftBorder,
        MerchantMoneyInsetInsetBotLeftCorner,
        MerchantMoneyInsetInsetTopLeftCorner,
        MerchantMoneylnsetBg,
        MerchantFrameInsetInsetBottomBorder
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    local bg = MerchantFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --tabs
    for k,v in pairs({
        MerchantFrameTab1Left,
        MerchantFrameTab1Middle,
        MerchantFrameTab1Right,
        MerchantFrameTab1LeftDisabled,
        MerchantFrameTab1MiddleDisabled,
        MerchantFrameTab1RightDisabled,
        MerchantFrameTab2Left,
        MerchantFrameTab2Middle,
        MerchantFrameTab2Right,
        MerchantFrameTab2LeftDisabled,
        MerchantFrameTab2MiddleDisabled,
        MerchantFrameTab2RightDisabled,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color3.r,color3.g,color3.b)
    end
end


