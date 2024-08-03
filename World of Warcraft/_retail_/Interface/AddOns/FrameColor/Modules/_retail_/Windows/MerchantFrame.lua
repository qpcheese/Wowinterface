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
    --reskin frames
    for _,frame in pairs({
        MerchantFrame,
        MerchantFrameInset,
        MerchantMoneyInset,
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    local bg = MerchantFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin tabs
    for _,frame in pairs({
        MerchantFrameTab1,
        MerchantFrameTab2,
    }) do 
        addon:SkinTabs(frame, color3)
    end
    --window specific regions
    for _,frame in pairs({
        MerchantFrameBottomRightBorder,
        MerchantFrameBottomLeftBorder,
        MerchantFrameLootFilterLeft,
        MerchantFrameLootFilterMiddle,
        MerchantFrameLootFilterRight,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end


