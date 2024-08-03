local _, addonTable = ...
local addon = addonTable.addon

local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor
local GetRegions = GetRegions
local GetDebugName = GetDebugName

local module = addon:NewModule("MacroFrame")
local color1, color2

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["MacroFrame"]
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
    if C_AddOns.IsAddOnLoaded("Blizzard_MacroUI") then
        self:Recolor(color1, color2, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_MacroUI" then
                self:Recolor(color1, color2, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end

end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_MacroUI") then
        self:Recolor(color, color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, desaturation)
    for k,v in pairs({
        MacroFramePortraitFrame,
        MacroFrameTopBorder,
        MacroFrameTopRightCorner,
        MacroFrameRightBorder,
        MacroFrameBotRightCorner,
        MacroFrameBtnCornerRight,
        MacroFrameBotLeftCorner,
        MacroFrameBtnCornerLeft,
        MacroFrameLeftBorder,
        MacroFrameBottomBorder,
        MacroFrameButtonBottomBorder,
        MacroFrameInsetInsetBottomBorder,

        MacroFrame.MacroSelector.ScrollBar.Background.Begin,
        MacroFrame.MacroSelector.ScrollBar.Background.Middle,
        MacroFrame.MacroSelector.ScrollBar.Background.End,

        MacroPopupFrameLeft,
        MacroPopupFrameMiddle,
        MacroPopupFrameRight,

        MacroPopupFrame.IconSelector.ScrollBar.Background.Begin,
        MacroPopupFrame.IconSelector.ScrollBar.Background.Middle,
        MacroPopupFrame.IconSelector.ScrollBar.Background.End,

    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end


    local bg = MacroFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    
end


