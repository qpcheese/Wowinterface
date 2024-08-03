local _, addonTable = ...
local addon = addonTable.addon

local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("ProfessionsFrame")
local color1, color2, color3, color4

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["ProfessionsFrame"]
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
    if C_AddOns.IsAddOnLoaded("Blizzard_Professions") then
        self:Recolor(color1, color2, color3, color4, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_Professions" then
                self:Recolor(color1, color2, color3, color4, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end

end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_Professions") then
        self:Recolor(color, color, color, color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, color3, color4, desaturation)
    --reskin frames
    for _,frame in pairs({
        ProfessionsFrame,
        ProfessionsFrame.CraftingPage.SchematicForm,
        ProfessionsFrame.CraftingPage.CraftingOutputLog
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    local bg = ProfessionsFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin tabs
    addon:SkinTabs(ProfessionsFrame, color3)
    --reskin scrollbar
    addon:SkinScrollBar(ProfessionsFrame.CraftingPage.RecipeList, color4)
    --window specific regions
    for _,frame in pairs({
        ProfessionsFrame.CraftingPage.RecipeList.Background,
        ProfessionsFrame.CraftingPage.RecipeList.SearchBox.Middle,
        ProfessionsFrame.CraftingPage.RecipeList.SearchBox.Left,
        ProfessionsFrame.CraftingPage.RecipeList.SearchBox.Right,
        ProfessionsFrameMiddleLeft,
        ProfessionsFrameMiddleMiddle,
        ProfessionsFrameMiddleRight,
        ProfessionsFrameTopLeft,
        ProfessionsFrameTopRight,
        ProfessionsFrameTopMiddle,
        ProfessionsFrameBottomLeft,
        ProfessionsFrameBottomRight,
        ProfessionsFrameBottomMiddle,
        ProfessionsFrameNormalTexture,
        ProfessionsFrame.CraftingPage.RankBar.Border,
        ProfessionsFrame.CraftingPage.RecipeList.BackgroundNineSlice.TopEdge,
        ProfessionsFrame.CraftingPage.RecipeList.BackgroundNineSlice.BottomEdge,
        ProfessionsFrame.CraftingPage.RecipeList.BackgroundNineSlice.TopRightCorner,
        ProfessionsFrame.CraftingPage.RecipeList.BackgroundNineSlice.TopLeftCorner,
        ProfessionsFrame.CraftingPage.RecipeList.BackgroundNineSlice.RightEdge,
        ProfessionsFrame.CraftingPage.RecipeList.BackgroundNineSlice.LeftEdge,
        ProfessionsFrame.CraftingPage.RecipeList.BackgroundNineSlice.BottomRightCorner,
        ProfessionsFrame.CraftingPage.RecipeList.BackgroundNineSlice.BottomLeftCorner, 
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end


