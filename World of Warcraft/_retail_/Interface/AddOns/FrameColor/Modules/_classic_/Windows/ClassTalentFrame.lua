local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("ClassTalentFrame")
local color1,  color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["ClassTalentFrame"]
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
    module:RegisterEvent("ADDON_LOADED", function(_, event)
        if event == "Blizzard_TalentUI" then
            self:Recolor(color1, color3, 1)
            module:UnregisterEvent("ADDON_LOADED")
        end
    end)
    if C_AddOns.IsAddOnLoaded("Blizzard_TalentUI") then
        self:Recolor(color1, color3, 1)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_TalentUI") then
        self:Recolor(color, color, 0)
    else
        module:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color3, desaturation)
    for _,v in pairs({PlayerTalentFrame:GetRegions()}) do
        if v:GetObjectType() == "Texture" then
            if v:GetDrawLayer() == "BORDER" then
                v:SetDesaturation(desaturation)
                v:SetVertexColor(color1.r,color1.g,color1.b)
            end
        end
    end
    for _,texture in pairs({
        PlayerTalentFrameScrollFrameBackgroundTop,
        PlayerTalentFrameScrollFrameBackgroundBottom,
        PlayerTalentFramePointsBarBackground,
    }) do
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color1.r,color1.g,color1.b)
    end
    local num_tabs = addonTable.isWrath and MAX_TALENT_TABS + 1 or MAX_TALENT_TABS --Glyphs
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


