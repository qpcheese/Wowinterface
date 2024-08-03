local _, addonTable = ...
local addon = addonTable.addon

local _G = _G
local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("ClickBindingFrame")
local color1, color2, color4

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["ClickBindingFrame"]
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
    if dbObj.classcolored4 then
        color4 = addonTable.classColor
    else
        color4 = dbObj.color4
    end
    if C_AddOns.IsAddOnLoaded("Blizzard_ClickBindingUI") then
        self:Recolor(color1, color2, color4, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_ClickBindingUI" then
                self:Recolor(color1, color2, color4, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end

end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_ClickBindingUI") then
        self:Recolor(color, color, color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, color4, desaturation)
    --reskin frames
    for _,frame in pairs({
        ClickBindingFrame,
        ClickBindingFrame.TutorialFrame,
        ClickBindingFrame.ScrollBoxBackground,
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    local bg = ClickBindingFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin scrollbar
    addon:SkinScrollBar(ClickBindingFrame, color4)
    --window specific regions
    for _,frame in pairs({
        ClickBindingFrameLeft,
        ClickBindingFrameMiddle,
        ClickBindingFrameRight,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end


