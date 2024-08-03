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
    --window specific regions
    for _,frame in pairs({
        AchievementFrameHeaderLeft,
        AchievementFrameHeaderRight,
        AchievementFrameWoodBorderTopLeft,
        AchievementFrame.LeftEdge,
        AchievementFrame.BottomLeftCorner,
        AchievementFrame.BottomEdge,
        AchievementFrame.BottomRightCorner,
        AchievementFrame.RightEdge,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    for i=1,2 do
        for _,texture in pairs({
            _G["AchievementFrameTab" ..i.. "Left"],
            _G["AchievementFrameTab" ..i.. "Middle"],
            _G["AchievementFrameTab" ..i.. "Right"],
            _G["AchievementFrameTab" ..i.. "LeftDisabled"],
            _G["AchievementFrameTab" ..i.. "MiddleDisabled"],
            _G["AchievementFrameTab" ..i.. "RightDisabled"],
        }) do
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color3.r,color3.g,color3.b)
        end
    end
end


