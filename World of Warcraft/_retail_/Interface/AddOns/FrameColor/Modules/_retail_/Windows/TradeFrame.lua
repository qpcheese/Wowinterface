local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("TradeFrame")
local color1, color2

local CLASS_COLORS = RAID_CLASS_COLORS

local layer, sublayer = TradeRecipientBG:GetDrawLayer()
TradeFrame.PlayerTradeBG = TradeFrame:CreateTexture(nil, layer, nil, sublayer)
TradeFrame.PlayerTradeBG:ClearAllPoints()
TradeFrame.PlayerTradeBG:SetPoint("TOPLEFT",TradeFrameBg,"TOPLEFT")
TradeFrame.PlayerTradeBG:SetPoint("BOTTOMRIGHT",TradeRecipientBG,"BOTTOMLEFT")
TradeFrame.PlayerTradeBG:SetTexture(TradeFrameBg:GetTexture())

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["TradeFrame"]
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
    self:RegisterEvent("TRADE_SHOW","UpdateRecipientBG")
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, 0)
    self:UnregisterEvent("TRADE_SHOW")
end

function module:Recolor(color1, color2, desaturation)
    --reskin frame
    addon:SkinNineSliced(TradeFrame, color1, desaturation)
    local bg = TradeFrame.PlayerTradeBG
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --window specific regions
    for _,frame in pairs({
        TradeFrameBg,
        TradeRecipientBG,
        TradeFrame.RecipientOverlay.portraitFrame
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end

function module:UpdateRecipientBG()
    local class = select(2,UnitClass("NPC"))
    if class then
        local color = CLASS_COLORS[class]
        TradeRecipientBG:SetVertexColor(color.r,color.g,color.b,1)
    end
end

