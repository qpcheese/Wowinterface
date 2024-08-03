local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("ClassTalentFrame")
local color1, color2, color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["ClassTalentFrame"]
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
    self:RegisterEvent("ADDON_LOADED", function(_, event)
        if event == "Blizzard_TalentUI" then
            self:RecolorTalentFrame(color1, color2, color3, 1)
        elseif event == "Blizzard_GlyphUI" then
            self:RecolorGlyphFrame(color1, color2, color3, 1)
        end
        if C_AddOns.IsAddOnLoaded("Blizzard_TalentUI") and C_AddOns.IsAddOnLoaded("Blizzard_GlyphUI") then
            self:UnregisterEvent("ADDON_LOADED")
        end
    end)
    if C_AddOns.IsAddOnLoaded("Blizzard_TalentUI") then
        self:RecolorTalentFrame(color1, color2, color3, 1)
    end
    if C_AddOns.IsAddOnLoaded("Blizzard_GlyphUI") then
        self:RecolorGlyphFrame(color1, color2, color3, 1)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_TalentUI") then
        self:RecolorTalentFrame(color, color, color, 0)
    end
    if C_AddOns.IsAddOnLoaded("Blizzard_GlyphUI") then
        self:RecolorGlyphFrame(color, color, color, 0)
    end
    self:UnregisterEvent("ADDON_LOADED")
end

function module:RecolorTalentFrame(color1, color2, color3, desaturation)
    --window specific regions
    for _ ,frame in pairs({
        PlayerTalentFramePortraitFrame,
        PlayerTalentFrameTopBorder,
        PlayerTalentFrameTopRightCorner,
        PlayerTalentFrameRightBorder,
        PlayerTalentFrameBotRightCorner,
        PlayerTalentFrameBtnCornerRight,
        PlayerTalentFrameBotLeftCorner,
        PlayerTalentFrameBtnCornerLeft,
        PlayerTalentFrameLeftBorder,
        PlayerTalentFrameBottomBorder,
        PlayerTalentFrameButtonBottomBorder,
        PlayerTalentFrameInsetInsetBottomBorder,
        PlayerTalentFrameInsetInsetLeftBorder,
        PlayerTalentFrameInsetInsetBotLeftCorner,
    })
    do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    --BG
    local bg = PlayerTalentFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    local num_tabs = MAX_TALENT_TABS + 1 --Glyphs
    for i=1,num_tabs do
        for _,texture in pairs({
            _G["PlayerTalentFrameTab" ..i.. "Left"],
            _G["PlayerTalentFrameTab" ..i.. "Middle"],
            _G["PlayerTalentFrameTab" ..i.. "Right"],
            _G["PlayerTalentFrameTab" ..i.. "LeftDisabled"],
            _G["PlayerTalentFrameTab" ..i.. "MiddleDisabled"],
            _G["PlayerTalentFrameTab" ..i.. "RightDisabled"],
        }) do
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color3.r,color3.g,color3.b)
        end
    end
end


function module:RecolorGlyphFrame(color1, color3, desaturation)
    -- TODO: implement
end