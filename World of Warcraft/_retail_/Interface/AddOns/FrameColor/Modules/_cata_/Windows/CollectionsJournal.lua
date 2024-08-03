local _, addonTable = ...
local addon = addonTable.addon

local _G = _G
local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("CollectionsJournal")
local color1, color2, color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["CollectionsJournal"]
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
    module:RegisterEvent("ADDON_LOADED", function(_, event)
        if event == "Blizzard_Collections" then
            self:Recolor(color1, color2, color3, 1)
            module:UnregisterEvent("ADDON_LOADED")
        end
    end)
    if C_AddOns.IsAddOnLoaded("Blizzard_Collections") then
        self:Recolor(color1, color2, color3, 1)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_Collections") then
        self:Recolor(color, color, color, 0)
    else
        module:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, color3, desaturation)
    --reskin frames
    for k,v in pairs({
        CollectionsJournalPortraitFrame,
        CollectionsJournalTopBorder,
        CollectionsJournalTopRightCorner,
        CollectionsJournalRightBorder,
        CollectionsJournalBotRightCorner,
        CollectionsJournalBtnCornerRight,
        CollectionsJournalBotLeftCorner,
        CollectionsJournalBtnCornerLeft,
        CollectionsJournalLeftBorder,
        CollectionsJournalBottomBorder,

        MountJournalInsetTopBorder,
        MountJournalInsetTopRightCorner,
        MountJournalInsetRightBorder,
        MountJournalInsetBotRightCorner,
        MountJournalInsetBottomBorder,
        MountJournalInsetBotLeftCorner,
        MountJournalInsetLeftBorder,

        PetJournalLeftInsetInsetTopBorder,
        PetJournalLeftInsetInsetTopRightCorner,
        PetJournalLeftInsetInsetRightBorder,
        PetJournalLeftInsetInsetBotRightCorner,
        PetJournalLeftInsetInsetBottomBorder,
        PetJournalLeftInsetInsetBotLeftCorner,
        PetJournalLeftInsetInsetLeftBorder,

        PetJournalRightInsetInsetTopBorder,
        PetJournalRightInsetInsetTopRightCorner,
        PetJournalRightInsetInsetRightBorder,
        PetJournalRightInsetInsetBotRightCorner,
        PetJournalRightInsetInsetBottomBorder,
        PetJournalRightInsetInsetBotLeftCorner,
        PetJournalRightInsetInsetLeftBorder,

        ToyBoxInsetTopBorder,
        ToyBoxInsetTopRightCorner,
        ToyBoxInsetRightBorder,
        ToyBoxInsetBotRightCorner,
        ToyBoxInsetBottomBorder,
        ToyBoxInsetBotLeftCorner,
        ToyBoxInsetLeftBorder,

        HeirloomsJournalInsetTopBorder,
        HeirloomsJournalInsetTopRightCorner,
        HeirloomsJournalInsetRightBorder,
        HeirloomsJournalInsetBotRightCorner,
        HeirloomsJournalInsetBottomBorder,
        HeirloomsJournalInsetBotLeftCorner,
        HeirloomsJournalInsetLeftBorder,

        WardrobeCollectionFrameInsetTopBorder,
        WardrobeCollectionFrameInsetTopRightCorner,
        WardrobeCollectionFrameInsetRightBorder,
        WardrobeCollectionFrameInsetBotRightCorner,
        WardrobeCollectionFrameInsetBottomBorder,
        WardrobeCollectionFrameInsetBotLeftCorner,
        WardrobeCollectionFrameInsetLeftBorder, 

        MountJournal.ScrollBar.Background.Begin,
        MountJournal.ScrollBar.Background.Middle,
        MountJournal.ScrollBar.Background.End,

        PetJournal.ScrollBar.Background.Begin,
        PetJournal.ScrollBar.Background.Middle,
        PetJournal.ScrollBar.Background.End,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    for k,v in pairs({MountJournal.RightInset:GetRegions()}) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    local bg = CollectionsJournalBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --window specific regions
    for _,frame in pairs({
        HeirloomsJournalClassDropDownLeft,
        HeirloomsJournalClassDropDownMiddle,
        HeirloomsJournalClassDropDownRight,
        HeirloomsJournal.progressBar.border,
        ToyBox.progressBar.border,
        MountJournalSummonRandomFavoriteButtonBorder,
        PetJournalSummonRandomFavoritePetButtonBorder,
        PetJournalHealPetButtonBorder,
        WardrobeCollectionFrameWeaponDropDownMiddle,
        WardrobeCollectionFrameWeaponDropDownLeft,
        WardrobeCollectionFrameWeaponDropDownRight,
        WardrobeCollectionFrame.progressBar.border,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    --filter buttons
    for _,frame in pairs ({  
        "HeirloomsJournal",
        "ToyBoxFilterButton",
        "PetJournalFilterButton",
        "MountJournalFilterButton",
        "WardrobeCollectionFrame",
    }) do
        for _,region in pairs ({
            frame.."TopLeft",
            frame.."TopRight",
            frame.."BottomLeft",
            frame.."BottomRight",
            frame.."TopMiddle",
            frame.."MiddleLeft",
            frame.."MiddleRight",
            frame.."BottomMiddle",
            frame.."MiddleMiddle",
        }) do
            local texture = _G[region]
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end
    --searchboxes
    for _,frame in pairs ({  
        HeirloomsJournalSearchBox,
        ToyBox.searchBox,
        PetJournalSearchBox,
        MountJournalSearchBox,
        WardrobeCollectionFrameSearchBox,
    }) do
        for _,texture in pairs ({
            frame.Left,
            frame.Middle,
            frame.Right
        }) do
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end
    --recolor border
    for _,frame in pairs({
        PetJournal.PetCount,
        MountJournal.MountCount
    }) do 
        addon:SkinBorders(frame, color1)
    end
    -- Tabs
    for i=1,5 do
        for _,texture in pairs({
            _G["CollectionsJournalTab" ..i.. "Left"],
            _G["CollectionsJournalTab" ..i.. "Middle"],
            _G["CollectionsJournalTab" ..i.. "Right"],
            _G["CollectionsJournalTab" ..i.. "LeftDisabled"],
            _G["CollectionsJournalTab" ..i.. "MiddleDisabled"],
            _G["CollectionsJournalTab" ..i.. "RightDisabled"],
        }) do
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color3.r,color3.g,color3.b)
        end
    end
end


