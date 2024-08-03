local _, addonTable = ...
local addon = addonTable.addon

local CLASS_COLORS = RAID_CLASS_COLORS

local module = addon:NewModule("TradeFrame")
local color1, color2

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["TradeFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if dbObj.classcolored2 then
        color2 = addonTable.classColor
        self:RegisterEvent("TRADE_SHOW","UpdateRecipientBG")
    else
        color2 = dbObj.color2
    end
    self:Recolor(color1, color2, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, 0)
    self:UnregisterEvent("TRADE_SHOW")
end

function module:Recolor(color1, color2, desaturation)
    for k,v in pairs({
        TradeFramePortraitFrame,
        TradeFrameTopBorder,
        TradeFrameTopRightCorner,
        TradeFrameRightBorder,
        TradeFrameBotRightCorner,
        TradeFrameBtnCornerRight,
        TradeFrameBotLeftCorner,
        TradeFrameBtnCornerLeft,
        TradeFrameLeftBorder,
        TradeFrameBottomBorder,
        TradeFrameButtonBottomBorder,
        TradeFrameInsetBg,
        TradePlayerItemsInsetInsetBottomBorder,
        TradePlayerItemsInsetInsetBotLeftCorner,
        TradePlayerEnchantInsetInsetBottomBorder,

        TradeRecipientPortraitFrame,
        TradeRecipientTopBorder,
        TradeRecipientTopRightCorner,
        TradeRecipientRightBorder,
        TradeRecipientBotRightCorner,
        TradeRecipientBtnCornerRight,
        TradeRecipientBotLeftCorner,
        TradeRecipientBtnCornerLeft,
        TradeRecipientLeftBorder,
        TradeRecipientBottomBorder,
        TradeRecipientBG,
        TradeRecipientItemsInsetInsetBottomBorder,
        TradeRecipientItemsInsetInsetBotLeftCorner,
        TradeRecipientEnchantInsetInsetBottomBorder,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    local bg = TradeFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
end

function module:UpdateRecipientBG()
    local class = select(2,UnitClass("NPC"))
    if class then
        local color = CLASS_COLORS[class]
        TradeRecipientBG:SetVertexColor(color.r,color.g,color.b,1)
    end
end

