local _, addonTable = ...
local addon = addonTable.addon

local _G = _G
local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("CollectionsJournal")
local color1, color2, color3, color4

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
    if dbObj.classcolored4 then
        color4 = addonTable.classColor
    else
        color4 = dbObj.color4
    end
    module:RegisterEvent("ADDON_LOADED", function(_, event)
        if event == "Blizzard_Collections" then
            self:Recolor(color1, color2, color3, color4, 1)
            module:UnregisterEvent("ADDON_LOADED")
        end
    end)
    if C_AddOns.IsAddOnLoaded("Blizzard_Collections") then
        self:Recolor(color1, color2, color3, color4, 1)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_Collections") then
        self:Recolor(color, color, color, color, 0)
    else
        module:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, color3, color4, desaturation)
    --reskin frames
    for _,frame in pairs({
        CollectionsJournal,
        MountJournal.RightInset,
        MountJournal.LeftInset,
        MountJournal.BottomLeftInset,
        PetJournal.LeftInset,
        PetJournalPetCardInset,
        ToyBox.iconsFrame,
        HeirloomsJournal.iconsFrame,
        WardrobeCollectionFrame.ItemsCollectionFrame,
        WardrobeCollectionFrame.SetsCollectionFrame.RightInset,
        WardrobeCollectionFrame.SetsCollectionFrame.LeftInset,
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    local bg = CollectionsJournalBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin tabs
    for _,frame in pairs({
        CollectionsJournalTab1,
        CollectionsJournalTab2,
        CollectionsJournalTab3,
        CollectionsJournalTab4,
        CollectionsJournalTab5,
        WardrobeCollectionFrameTab1,
        WardrobeCollectionFrameTab2,
    }) do 
        addon:SkinTabs(frame, color3)
    end
    --reskin scrollbars
    for _,frame in pairs({
        MountJournal,
        PetJournal,
        WardrobeCollectionFrame.SetsCollectionFrame.ListContainer,
    }) do 
        addon:SkinScrollBar(frame, color4)
    end
    --window specific regions
    for _,frame in pairs({
        WardrobeCollectionFrameWeaponDropDownMiddle,
        WardrobeCollectionFrameWeaponDropDownLeft,
        WardrobeCollectionFrameWeaponDropDownRight,
        HeirloomsJournalClassDropDownLeft,
        HeirloomsJournalClassDropDownMiddle,
        HeirloomsJournalClassDropDownRight,
        WardrobeCollectionFrame.progressBar.border,
        HeirloomsJournal.progressBar.border,
        ToyBox.progressBar.border,
        MountJournalSummonRandomFavoriteButtonBorder,
        PetJournalSummonRandomFavoritePetButtonBorder,
        PetJournalHealPetButtonBorder,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    --searchboxes
    for _,frame in pairs ({  
        WardrobeCollectionFrameSearchBox,
        HeirloomsJournalSearchBox,
        ToyBox.searchBox,
        PetJournalSearchBox,
        MountJournalSearchBox,
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
end


