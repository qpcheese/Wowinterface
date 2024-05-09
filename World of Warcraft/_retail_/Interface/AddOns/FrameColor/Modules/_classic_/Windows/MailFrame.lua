local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("MailFrame")
local color1, color2, color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["MailFrame"]
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
        MailFramePortraitFrame,
        MailFrameTopBorder,
        MailFrameTopRightCorner,
        MailFrameRightBorder,
        MailFrameBotRightCorner,
        MailFrameBtnCornerRight,
        MailFrameBotLeftCorner,
        MailFrameBtnCornerLeft,
        MailFrameLeftBorder,
        MailFrameBottomBorder,
        MailFrameButtonBottomBorder,

        MailFrameInsetInsetTopBorder,
        MailFrameInsetInsetTopRightCorner,
        MailFrameInsetInsetRightBorder,
        MailFrameInsetInsetBotRightCorner,
        MailFrameInsetInsetBottomBorder,
        MailFrameInsetInsetBotLeftCorner,
        MailFrameInsetInsetLeftBorder,

        MailEditBoxScrollBar.Background.Begin,
        MailEditBoxScrollBar.Background.Middle,
        MailEditBoxScrollBar.Background.End,

        SendMailMoneyInsetInsetTopBorder,
        SendMailMoneyInsetInsetTopRightCorner,
        SendMailMoneyInsetInsetRightBorder,
        SendMailMoneyInsetInsetBotRightCorner,
        SendMailMoneyInsetInsetBottomBorder,
        SendMailMoneyInsetInsetBotLeftCorner,
        SendMailMoneyInsetInsetLeftBorder,

        SendMailMoneyBgLeft,
        SendMailMoneyBgMiddle,
        SendMailMoneyBgRight,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    for k,v in pairs({SendMailFrame:GetRegions()}) do
        if v:GetObjectType() == "Texture" then
            v:SetDesaturation(desaturation)
            v:SetVertexColor(color1.r,color1.g,color1.b)
        end
    end
    local bg = MailFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --tabs
    for k,v in pairs({
        MailFrameTab1Left,
        MailFrameTab1Middle,
        MailFrameTab1Right,
        MailFrameTab1LeftDisabled,
        MailFrameTab1MiddleDisabled,
        MailFrameTab1RightDisabled,
        MailFrameTab2Left,
        MailFrameTab2Middle,
        MailFrameTab2Right,
        MailFrameTab2LeftDisabled,
        MailFrameTab2MiddleDisabled,
        MailFrameTab2RightDisabled,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color3.r,color3.g,color3.b)
    end
end


