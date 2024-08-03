local _, addonTable = ...
local addon = addonTable.addon

local _G = _G
local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("PVEFrame")
local color1, color2, color3, color4

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["PVEFrame"]
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
    self:RecolorPVE(color1, color2, color3, color4, 1)
    module:RegisterEvent("ADDON_LOADED", function(_, event)
        if event == "Blizzard_PVPUI" then
            self:RecolorPVP(color1, color2, color3, color4, 1)
            module:UnregisterEvent("ADDON_LOADED")
        end
    end)
    if C_AddOns.IsAddOnLoaded("Blizzard_PVPUI") then
        self:RecolorPVP(color1, color2, color3, color4, 1)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_PVPUI") then
        self:RecolorPVP(color, color, color, color, 0)
    else
        module:UnregisterEvent("ADDON_LOADED")
    end
    self:RecolorPVE(color, color, color, color, 0)
end

function module:RecolorPVE(color1, color2, color3, color4, desaturation)
    --reskin frames
    for _ ,frame in pairs({
        PVEFrame,
        PVEFrameLeftInset,
        LFDParentFrameInset,
        RaidFinderFrameRoleInset,
        RaidFinderFrameBottomInset,
        LFDFrameRoleInset,
        LFGListFrame.CategorySelection.Inset,
        ChallengesFrameInset,
        LFGListFrame.SearchPanel.ResultsInset,
        LFGListFrame.ApplicationViewer.Inset
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    --reskin tabs
    for _ ,frame in pairs({
        PVEFrameTab1,
        PVEFrameTab2,
        PVEFrameTab3,
        PVEFrameTab4
    }) do 
        addon:SkinTabs(frame, color3)
    end
    --reskin scrollbars
    for _ ,frame in pairs({
        LFGListFrame.SearchPanel,
        LFGListFrame.ApplicationViewer    
    }) do 
        addon:SkinScrollBar(frame, color4)
    end
    --window specific regions
    addon:SkinEdges(LFGListApplicationDialog.Border,color1)
    for _,texture in pairs({
        PVEFrameBg,
        PVEFrameTopFiligree,
        PVEFrameBRCorner,
        PVEFrameTRCorner,
        PVEFrameBLCorner,
        PVEFrameTLCorner,
        PVEFrameBottomLine,
        PVEFrameLLVert,
        PVEFrameRLVert,
        PVEFrameTopLine,
        PVEFrameLeftInset.Bg,
        PVEFrame.TopTileStreaks,
        LFDParentFrameRoleBackground,
        LFGListApplicationDialogDescription.TopTex,
        LFGListApplicationDialogDescription.TopRightTex,
        LFGListApplicationDialogDescription.RightTex,
        LFGListApplicationDialogDescription.BottomRightTex,
        LFGListApplicationDialogDescription.BottomTex,
        LFGListApplicationDialogDescription.BottomLeftTex,
        LFGListApplicationDialogDescription.LeftTex,
        LFGListApplicationDialogDescription.TopLeftTex,
    }) do 
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    for _,texture in pairs({
        --PVEFrameBg
        PVEFrameBlueBg,

    }) do 
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
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
    addon:SkinBorders(LFGListFrame.SearchPanel.AutoCompleteFrame,color1)
end

function module:RecolorPVP(color1, color2, color3, color4, desaturation)
    --recolor frames
    for _ ,frame in pairs({
        HonorFrame.Inset,
        ConquestFrame.Inset,
        PVPQueueFrame.HonorInset,
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    --dropdowns
    for _, k in pairs ({
        HonorFrameTypeDropDownLeft,
        HonorFrameTypeDropDownMiddle,
        HonorFrameTypeDropDownRight
    }) do
        k:SetDesaturation(desaturation)
        k:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end

