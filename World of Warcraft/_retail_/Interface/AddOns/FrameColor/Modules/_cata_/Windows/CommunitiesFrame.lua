local _, addonTable = ...
local addon = addonTable.addon

local _G = _G
local SetVertexColor = SetVertexColor
local IsObjectType = IsObjectType
local GetChildren = GetChildren
local GetRegions = GetRegions
local pairs = pairs
local GetDebugName = GetDebugName
local SetDesaturation = SetDesaturation

local module = addon:NewModule("CommunitiesFrame")
local color1, color2, color4

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["CommunitiesFrame"]
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
    if dbObj.classcolored4 then
        color4 = addonTable.classColor
    else
        color4 = dbObj.color4
    end
    module:RegisterEvent("ADDON_LOADED", function(_, event)
        if event == "Blizzard_Communities" then
            self:Recolor(color1, color2, color4, 1)
            module:UnregisterEvent("ADDON_LOADED")
        end
    end)
    if C_AddOns.IsAddOnLoaded("Blizzard_Communities") then
        self:Recolor(color1, color2, color4, 1)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_Communities") then
        self:Recolor(color, color, color, 0)
    else
        module:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, color4, desaturation)
    -- Frame
    for _ ,frame in pairs({
        CommunitiesFramePortraitFrame,
        CommunitiesFrameTopBorder,
        CommunitiesFrameTopRightCorner,
        CommunitiesFrameRightBorder,
        CommunitiesFrameBotRightCorner,
        CommunitiesFrameBtnCornerRight,
        CommunitiesFrameBotLeftCorner,
        CommunitiesFrameBtnCornerLeft,
        CommunitiesFrameLeftBorder,
        CommunitiesFrameBottomBorder,
        CommunitiesFrameButtonBottomBorder,
        CommunitiesFrameInsetInsetBottomBorder,
        CommunitiesFrameInsetInsetLeftBorder,
        CommunitiesFrameInsetInsetBotLeftCorner,
    })
    do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    -- BG
    local bg = CommunitiesFrameCommunitiesList.Bg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin scrollbars
    for _ ,frame in pairs({
        CommunitiesFrameCommunitiesList,
        CommunitiesFrame.Chat,
        CommunitiesFrame.MemberList,
        CommunitiesFrame.GuildBenefitsFrame.Perks,
        CommunitiesFrame.GuildBenefitsFrame.Rewards,
        CommunitiesFrameGuildDetailsFrameNews,
        CommunitiesGuildLogFrame.Container.ScrollFrame
    })
    do 
        addon:SkinScrollBar(frame, color4)
    end
    --dropdowns
    for _,v in pairs ({
        ClubFinderCommunityAndGuildFinderFrame.OptionsList:GetChildren(),
    }) 
    do
        if string.match(v:GetDebugName(),"ClubFinderFilterDropdown") then
            for _,k in pairs ({v:GetRegions()}) do
                if k:IsObjectType("Texture") then
                    k:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
                end
            end
        end
        if string.match(v:GetDebugName(),"ClubFinderSortByDropdown") then
            for _,k in pairs ({v:GetRegions()}) do
                if k:IsObjectType("Texture") then
                    k:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
                end
            end
        end
    end
    --dropdowns
    for _ ,frame in pairs({
        "ClubFinderFilter",
        "ClubFinderSize",
        "ClubFinderSortBy",
    }) do 
        for _, texture in pairs ({
            _G[frame.."DropdownLeft"],
            _G[frame.."DropdownMiddle"],
            _G[frame.."DropdownRight"]
        })
        do
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end
    for _,v in pairs ({
        CommunitiesFrame.CommunitiesListDropDownMenu:GetRegions(), 
    }) do
        if v:IsObjectType("Texture") then
            v:SetDesaturation(desaturation)
            v:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end
    for _,v in pairs ({
        CommunitiesFrame.GuildMemberListDropDownMenu:GetRegions(),
    }) do
        if v:IsObjectType("Texture") then
            v:SetDesaturation(desaturation)
            v:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end
    for _,v in pairs ({
        CommunitiesFrame.NotificationSettingsDialog.CommunitiesListDropDownMenu:GetRegions(),
    }) do
        if v:IsObjectType("Texture") then
            v:SetDesaturation(desaturation)
            v:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end
    for _,texture in pairs({
        CommunitiesFrameMiddle,
        CommunitiesFrameRight,
        CommunitiesFrameLeft,
    }) do 
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    --window specific regions
    --normal
    for _,frame in pairs({
        CommunitiesFrame.NotificationSettingsDialog.Selector,
        CommunitiesFrame.RecruitmentDialog.BG,
    }) do 
        addon:SkinEdges(frame,color1)
    end

    --side tabs
    for _,v in pairs ({
        CommunitiesFrame.ChatTab:GetRegions(),
        CommunitiesFrame.RosterTab:GetRegions(),
        CommunitiesFrame.GuildBenefitsTab:GetRegions(), 
        CommunitiesFrame.GuildInfoTab:GetRegions(),
        ClubFinderCommunityAndGuildFinderFrame.ClubFinderSearchTab:GetRegions(),
        ClubFinderCommunityAndGuildFinderFrame.ClubFinderPendingTab:GetRegions(),
        ClubFinderGuildFinderFrame.ClubFinderSearchTab:GetRegions(),
        ClubFinderGuildFinderFrame.ClubFinderPendingTab:GetRegions(),
    }) do 
        if not v:GetDebugName():match("Icon") then
            v:SetDesaturation(desaturation)
            v:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end
    --
    for _, v in pairs ({CommunitiesFrameGuildDetailsFrameInfo:GetRegions()}) do 
        if v:IsObjectType("Texture") and not v:GetDebugName():match("Header") then
            v:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end 
    for _,texture in pairs({
        CommunitiesFrameBg,
        CommunitiesFrame.TopTileStreaks,
        CommunitiesFrame.MemberList.ColumnDisplay.Background,
        CommunitiesFrame.MemberList.ColumnDisplay.TopTileStreaks,
        GuildControlUITopBg,
        CommunitiesFrame.ChatEditBox.Left,
        CommunitiesFrame.ChatEditBox.Mid,
        CommunitiesFrame.ChatEditBox.Right,
        CommunitiesFrame.GuildBenefitsFrame.InsetBorderRight,
        CommunitiesFrame.GuildBenefitsFrame.InsetBorderLeft,
        CommunitiesFrame.GuildBenefitsFrame.InsetBorderLeft2,
        CommunitiesFrame.GuildBenefitsFrame.InsetBorderBottomLeft,
        CommunitiesFrame.GuildBenefitsFrame.InsetBorderBottomRight,
        CommunitiesFrame.GuildBenefitsFrame.InsetBorderTopLeft,
        CommunitiesFrame.GuildBenefitsFrame.InsetBorderTopLeft2,
        CommunitiesFrame.GuildBenefitsFrame.InsetBorderTopRight,
        CommunitiesFrame.GuildBenefitsFrame.InsetBorderBottomLeft2,
        CommunitiesFrame.GuildBenefitsFrame.FactionFrame.Bar.Middle,
        CommunitiesFrame.GuildBenefitsFrame.FactionFrame.Bar.Left,
        CommunitiesFrame.GuildBenefitsFrame.FactionFrame.Bar.Right,
        CommunitiesFrameGuildDetailsFrame.InsetBorderRight,
        CommunitiesFrameGuildDetailsFrame.InsetBorderLeft,
        CommunitiesFrameGuildDetailsFrame.InsetBorderLeft2,
        CommunitiesFrameGuildDetailsFrame.InsetBorderBottomLeft,
        CommunitiesFrameGuildDetailsFrame.InsetBorderBottomRight,
        CommunitiesFrameGuildDetailsFrame.InsetBorderTopLeft,
        CommunitiesFrameGuildDetailsFrame.InsetBorderTopLeft2,
        CommunitiesFrameGuildDetailsFrame.InsetBorderTopRight,
        CommunitiesFrameGuildDetailsFrame.InsetBorderBottomLeft2,
        CommunitiesFrame.GuildMemberDetailFrame.Border.TopEdge,
        CommunitiesFrame.GuildMemberDetailFrame.Border.BottomEdge,
        CommunitiesFrame.GuildMemberDetailFrame.Border.RightEdge,
        CommunitiesFrame.GuildMemberDetailFrame.Border.LeftEdge,
        CommunitiesFrame.GuildMemberDetailFrame.Border.BottomLeftCorner,
        CommunitiesFrame.GuildMemberDetailFrame.Border.BottomRightCorner,
        CommunitiesFrame.GuildMemberDetailFrame.Border.TopRightCorner,
        CommunitiesFrame.GuildMemberDetailFrame.Border.TopLeftCorner,
        CommunitiesGuildLogFrameTopLeftCorner,
        CommunitiesGuildLogFrameTopBorder,
        CommunitiesGuildLogFrameTopRightCorner,
        CommunitiesGuildLogFrameRightBorder,
        CommunitiesGuildLogFrameBottomRightCorner,
        CommunitiesGuildLogFrameBottomBorder,
        CommunitiesGuildLogFrameBottomLeftCorner,
        CommunitiesGuildLogFrameLeftBorder,
        CommunitiesGuildLogFrameBg, 
        ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.TopLeftCorner,
        ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.TopEdge,
        ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.TopRightCorner,
        ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.RightEdge,
        ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.BottomRightCorner,
        ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.BottomEdge,
        ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.BottomLeftCorner,
        ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.LeftEdge,
        ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG.Bg, 
        GuildControlUITopBorder,
        GuildControlUITopRightCorner,
        GuildControlUIRightBorder,
        GuildControlUIBottomRightCorner,
        GuildControlUIBottomBorder,
        GuildControlUIBottomLeftCorner,
        GuildControlUILeftBorder,
        GuildControlUITopLeftCorner,
        GuildControlUIHbarTopLeftCorner,
        GuildControlUIHbarBotLeftCorner,
        GuildControlUIHbarTopRightCorner,
        GuildControlUIHbarBotRightCorner,
        GuildControlUIHbarTopBorder,
        GuildControlUIHbarBottomBorder,
        CommunitiesFrameCommunitiesList.TopFiligree,
        CommunitiesFrameCommunitiesList.BottomFiligree,
        CommunitiesFrameCommunitiesList.FilligreeOverlay.TopBar,
        CommunitiesFrameCommunitiesList.FilligreeOverlay.TLCorner,
        CommunitiesFrameCommunitiesList.FilligreeOverlay.TRCorner,
        CommunitiesFrameCommunitiesList.FilligreeOverlay.BottomBar,
        CommunitiesFrameCommunitiesList.FilligreeOverlay.BLCorner,
        CommunitiesFrameCommunitiesList.FilligreeOverlay.BRCorner,  
        CommunitiesFrameCommunitiesList.FilligreeOverlay.RightBar,
        CommunitiesFrameCommunitiesList.FilligreeOverlay.LeftBar,

    }) do 
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end

