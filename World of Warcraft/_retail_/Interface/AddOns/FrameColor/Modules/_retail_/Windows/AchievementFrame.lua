local _, addonTable = ...
local addon = addonTable.addon

local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("AchievementFrame")
local color1, color3, color4

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["AchievementFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
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
    if C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        self:Recolor(color1, color3, color4, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_AchievementUI" then
                self:Recolor(color1, color3, color4, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        self:Recolor(color, color, color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color3, color4, desaturation)
    --reskin frames
    for _,frame in pairs({
        AchievementFrameCategories
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    --reskin tabs
    for _,frame in pairs({
        AchievementFrameTab1.Left,
        AchievementFrameTab1.Middle,
        AchievementFrameTab1.Right,
        AchievementFrameTab2.Left,
        AchievementFrameTab2.Middle,
        AchievementFrameTab2.Right,
        AchievementFrameTab3.Left,
        AchievementFrameTab3.Middle,
        AchievementFrameTab3.Right,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color3.r,color3.g,color3.b,color3.a)
    end
    --reskin scrollbars
    for _,frame in pairs({
        AchievementFrameCategories,
        AchievementFrameAchievements,
        AchievementFrameStats,
    }) do 
        addon:SkinScrollBar(frame, color4)
    end
    --window specific regions
    for _,frame in pairs({
        AchievementFrameMetalBorderRight,
        AchievementFrameMetalBorderBottomRight,
        AchievementFrameMetalBorderBottom,
        AchievementFrameMetalBorderBottomBottomLeft,
        AchievementFrameMetalBorderLeft,
        AchievementFrameMetalBorderTopLeft,
        AchievementFrameMetalBorderTop,
        AchievementFrameMetalBorderTopRight,
        AchievementFrame.Header.Left,
        AchievementFrame.Header.Right,
        AchievementFrameCategoriesBG,
        AchievementFrame.Header.PointBorder,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end


