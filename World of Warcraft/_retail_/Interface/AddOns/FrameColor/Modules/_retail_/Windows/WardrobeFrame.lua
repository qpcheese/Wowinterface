local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("WardrobeFrame")
local color1, color2, color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["WardrobeFrame"]
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
    if C_AddOns.IsAddOnLoaded("Blizzard_Collections") then
        self:Recolor(color1, color2, color3, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_Collections" then
                self:Recolor(color1, color2, color3, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_Collections") then
        self:Recolor(color, color, color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, color3, desaturation)
    --reskin frames
    for _,frame in pairs({
        WardrobeFrame,
        WardrobeTransmogFrame.Inset,
        WardrobeCollectionFrame.ItemsCollectionFrame,
        WardrobeCollectionFrame.SetsTransmogFrame,
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    local bg = WardrobeFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin tabs
    for _,frame in pairs({
        WardrobeCollectionFrameTab1,
        WardrobeCollectionFrameTab2,
    }) do 
        addon:SkinTabs(frame, color3)
    end
    --window specific regions
    for _,frame in pairs({
        WardrobeOutfitDropDownLeft,
        WardrobeOutfitDropDownMiddle,
        WardrobeOutfitDropDownRight,
        --WardrobeCollectionFrame.ItemsCollectionFrame.BGCornerTopRight,
        --WardrobeCollectionFrame.ItemsCollectionFrame.BGCornerTopLeft,
        --WardrobeCollectionFrame.ItemsCollectionFrame.BGCornerBottomLeft,
        --WardrobeCollectionFrame.ItemsCollectionFrame.BGCornerBottomRight,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end


