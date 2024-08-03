local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("PVEFrame_Wrath")
local color1, color2

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["PVEFrame_Wrath"]
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
    --reskin frames
    for k,v in pairs({
        PVEFramePortraitFrame,
        PVEFrameTopBorder,
        PVEFrameTopRightCorner,
        PVEFrameRightBorder,
        PVEFrameBotRightCorner,
        PVEFrameBtnCornerRight,
        PVEFrameBotLeftCorner,
        PVEFrameBtnCornerLeft,
        PVEFrameLeftBorder,
        PVEFrameBottomBorder,

        PVEFrameLeftInsetInsetTopBorder,
        PVEFrameLeftInsetInsetTopRightCorner,
        PVEFrameLeftInsetInsetRightBorder,
        PVEFrameLeftInsetInsetBotRightCorner,
        PVEFrameLeftInsetInsetBottomBorder,
        PVEFrameLeftInsetInsetBotLeftCorner,
        PVEFrameLeftInsetInsetLeftBorder,

        LFDParentFrameInsetInsetTopBorder,
        LFDParentFrameInsetInsetTopRightCorner,
        LFDParentFrameInsetInsetTopLeftCorner,
        LFDParentFrameInsetInsetRightBorder,
        LFDParentFrameInsetInsetBotRightCorner,
        LFDParentFrameInsetInsetBottomBorder,
        LFDParentFrameInsetInsetBotLeftCorner,
        LFDParentFrameInsetInsetLeftBorder,

        LFGListFrameInsetTopBorder,
        LFGListFrameInsetTopRightCorner,
        LFGListFrameInsetRightBorder,
        LFGListFrameInsetBotRightCorner,
        LFGListFrameInsetBottomBorder,
        LFGListFrameInsetBotLeftCorner,
        LFGListFrameInsetLeftBorder,

        LFDQueueFrameFindGroupButton_LeftSeparator,
        LFDQueueFrameFindGroupButton_RightSeparator,

        LFGListFrame.CategorySelection.StartGroupButton.RightSeparator,
        LFGListFrame.CategorySelection.FindGroupButton.LeftSeparator,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    for _,Inset in pairs({
        LFGListFrame.SearchPanel.ResultsInset,
        LFGListFrame.CategorySelection.Inset
    }) do
        for _,texture in pairs({Inset:GetRegions()}) do
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color1.r,color1.g,color1.b)
        end
    end
    local bg = PVEFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --dropdowns
    for _ ,v in pairs({
        "LFDQueueFrameType",
        "RaidFinderQueueFrameSelection",
        "LFGListEntryCreationGroup",
        "LFGListEntryCreationActivity"
    }) do 
        for _, k in pairs ({
            _G[v.."DropDownLeft"],
            _G[v.."DropDownMiddle"],
            _G[v.."DropDownRight"]
        }) do
            k:SetDesaturation(desaturation)
            k:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end
    --filter buttons
    for _,v in pairs ({
        "TopLeft",
        "TopRight",
        "BottomLeft",
        "BottomRight",
        "TopMiddle",
        "MiddleLeft",
        "MiddleRight",
        "BottomMiddle",
        "MiddleMiddle",
    })
    do
        _G["LFGListFrame"..v]:SetDesaturation(desaturation)
        _G["LFGListFrame"..v]:SetVertexColor(color1.r,color1.g,color1.b)
    end
    --searchboxes
    for _,v in pairs ({
        "Left",
        "Middle",
        "Right"
    })
    do
        LFGListFrame.SearchPanel.SearchBox[v]:SetDesaturation(desaturation)
        LFGListFrame.SearchPanel.SearchBox[v]:SetVertexColor(color1.r,color1.g,color1.b)
    end
end


