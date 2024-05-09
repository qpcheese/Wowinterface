local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("FriendsFrame")
local color1, color2, color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["FriendsFrame"]
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
        FriendsFramePortraitFrame,
        FriendsFrameTopBorder,
        FriendsFrameTopRightCorner,
        FriendsFrameRightBorder,
        FriendsFrameBotRightCorner,
        FriendsFrameBtnCornerRight,
        FriendsFrameBotLeftCorner,
        FriendsFrameBtnCornerLeft,
        FriendsFrameLeftBorder,
        FriendsFrameBottomBorder,
        FriendsFrameButtonBottomBorder,

        FriendsFrameInsetInsetTopBorder,
        FriendsFrameInsetInsetTopRightCorner,
        FriendsFrameInsetInsetRightBorder,
        FriendsFrameInsetInsetBotRightCorner,
        FriendsFrameInsetInsetBottomBorder,
        FriendsFrameInsetInsetBotLeftCorner,
        FriendsFrameInsetInsetLeftBorder,

        FriendsFrameFriendsScrollFrameTop,
        FriendsFrameFriendsScrollFrameMiddle,
        FriendsFrameFriendsScrollFrameBottom,
        IgnoreListFrameTop,
        IgnoreListFrameMiddle,
        IgnoreListFrameBottom,

        FriendsFrameStatusDropDownLeft,
        FriendsFrameStatusDropDownMiddle,
        FriendsFrameStatusDropDownRight,

        WhoFrameDropDownLeft,
        WhoFrameDropDownMiddle,
        WhoFrameDropDownRight,

        WhoFrameListInsetInsetTopBorder,
        WhoFrameListInsetInsetTopRightCorner,
        WhoFrameListInsetInsetRightBorder,
        WhoFrameListInsetInsetBotRightCorner,
        WhoFrameListInsetInsetBottomBorder,
        WhoFrameListInsetInsetBotLeftCorner,
        WhoFrameListInsetInsetLeftBorder,

        WhoFrameEditBoxInsetInsetTopBorder,
        WhoFrameEditBoxInsetInsetTopRightCorner,
        WhoFrameEditBoxInsetInsetRightBorder,
        WhoFrameEditBoxInsetInsetBotRightCorner,
        WhoFrameEditBoxInsetInsetBottomBorder,
        WhoFrameEditBoxInsetInsetBotLeftCorner,
        WhoFrameEditBoxInsetInsetLeftBorder,

        GuildInfoFrame.TopEdge,
        GuildInfoFrame.TopRightCorner,
        GuildInfoFrame.RightEdge,
        GuildInfoFrame.BottomRightCorner,
        GuildInfoFrame.BottomEdge,
        GuildInfoFrame.BottomLeftCorner,
        GuildInfoFrame.LeftEdge,
        GuildInfoFrame.TopLeftCorner,
        GuildInfoCorner,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    if addonTable.isWrath then
        for k,v in pairs({
            GuildEventLogFrame.TopEdge,
            GuildEventLogFrame.TopRightCorner,
            GuildEventLogFrame.RightEdge,
            GuildEventLogFrame.BottomRightCorner,
            GuildEventLogFrame.BottomEdge,
            GuildEventLogFrame.BottomLeftCorner,
            GuildEventLogFrame.LeftEdge,
            GuildEventLogFrame.TopLeftCorner,
            GuildEventLogCorner,
        }) do
            v:SetDesaturation(desaturation)
            v:SetVertexColor(color1.r,color1.g,color1.b)
        end
    end
    for k,v in pairs({GuildListScrollFrame:GetRegions()}) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    local bg = FriendsFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --tabs
    for k,v in pairs({
        FriendsFrameTab1Left,
        FriendsFrameTab1Middle,
        FriendsFrameTab1Right,
        FriendsFrameTab1LeftDisabled,
        FriendsFrameTab1MiddleDisabled,
        FriendsFrameTab1RightDisabled,
        FriendsFrameTab2Left,
        FriendsFrameTab2Middle,
        FriendsFrameTab2Right,
        FriendsFrameTab2LeftDisabled,
        FriendsFrameTab2MiddleDisabled,
        FriendsFrameTab2RightDisabled,
        FriendsFrameTab3Left,
        FriendsFrameTab3Middle,
        FriendsFrameTab3Right,
        FriendsFrameTab3LeftDisabled,
        FriendsFrameTab3MiddleDisabled,
        FriendsFrameTab3RightDisabled,
        FriendsFrameTab4Left,
        FriendsFrameTab4Middle,
        FriendsFrameTab4Right,
        FriendsFrameTab4LeftDisabled,
        FriendsFrameTab4MiddleDisabled,
        FriendsFrameTab4RightDisabled,
        FriendsTabHeaderTab1Left,
        FriendsTabHeaderTab1Middle,
        FriendsTabHeaderTab1Right,
        FriendsTabHeaderTab1LeftDisabled,
        FriendsTabHeaderTab1MiddleDisabled,
        FriendsTabHeaderTab1RightDisabled,
        FriendsTabHeaderTab2Left,
        FriendsTabHeaderTab2Middle,
        FriendsTabHeaderTab2Right,
        FriendsTabHeaderTab2LeftDisabled,
        FriendsTabHeaderTab2MiddleDisabled,
        FriendsTabHeaderTab2RightDisabled,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color3.r,color3.g,color3.b)
    end
end


