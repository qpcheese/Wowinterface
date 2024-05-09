local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("FriendsFrame")
local color1, color2, color3, color4

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
    if dbObj.classcolored4 then
        color4 = addonTable.classColor
    else
        color4 = dbObj.color4
    end
    self:Recolor(color1, color2, color3, color4, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, color, color, 0)
end

function module:Recolor(color1, color2, color3, color4, desaturation)
    --reskin frames
    for _,frame in pairs({
        FriendsFrame,
        FriendsFrameInset,
        WhoFrameListInset,
        WhoFrameEditBoxInset,
        RecruitAFriendFrame.RecruitList.ScrollFrameInset,
        RecruitAFriendFrame.RewardClaiming.Inset,
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    local bg = FriendsFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin tabs
    for _,frame in pairs({
        FriendsFrameTab1,
        FriendsFrameTab2,
        FriendsFrameTab3,
        FriendsFrameTab4,
        FriendsTabHeaderTab1,
        FriendsTabHeaderTab2,
        FriendsTabHeaderTab3,
    }) do 
        addon:SkinTabs(frame, color3)
    end
    --reskin scrollbars
    for _,frame in pairs({
        FriendsListFrame,
        IgnoreListFrame,
        RecruitAFriendFrame.RecruitList,
        WhoFrame,
        QuickJoinFrame
    }) do 
        addon:SkinScrollBar(frame, color4)
    end
    --window specific regions
    for _,frame in pairs({
        RaidInfoFrame.Header.CenterBG,
        RaidInfoFrame.Header.RightBG,
        RaidInfoFrame.Header.LeftBG,
        RaidInfoFrame.Border.TopEdge,
        RaidInfoFrame.Border.RightEdge,
        RaidInfoFrame.Border.LeftEdge,
        RaidInfoFrame.Border.BottomEdge,
        RaidInfoFrame.Border.TopLeftCorner,
        RaidInfoFrame.Border.TopRightCorner,
        RaidInfoFrame.Border.BottomLeftCorner,
        RaidInfoFrame.Border.BottomRightCorner,
        RaidInfoDetailHeader,
        RaidInfoDetailFooter,
        RecruitAFriendFrame.RecruitList.Header.Background,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    --dropdowns
    for _,frame in pairs({
        "FriendsFrameStatus",
        "WhoFrame",
    }) do 
        for _,region in pairs ({
            _G[frame.."DropDownLeft"],
            _G[frame.."DropDownMiddle"],
            _G[frame.."DropDownRight"]
        })
        do
            region:SetDesaturation(desaturation)
            region:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end
    --header
    for _,frame in pairs({
        "WhoFrameColumnHeader1",
        "WhoFrameColumnHeader2",
        "WhoFrameColumnHeader3",
        "WhoFrameColumnHeader4",
        "RaidInfoInstanceLabel",
        "RaidInfoIDLabel",
    }) do 
        for _,region in pairs ({
            _G[frame.."Left"],
            _G[frame.."Middle"],
            _G[frame.."Right"]
        })
        do
            region:SetDesaturation(desaturation)
            region:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end
end


