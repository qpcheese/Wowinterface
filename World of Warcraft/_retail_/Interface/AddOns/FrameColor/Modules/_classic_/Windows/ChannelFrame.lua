local _, addonTable = ...
local addon = addonTable.addon

local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("ChannelFrame")
local color1, color2

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["ChannelFrame"]
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
    if C_AddOns.IsAddOnLoaded("Blizzard_Communities") then
        self:Recolor(color1, color2, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_Communities" then
                self:Recolor(color1, color2, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end

end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_Communities") then
        self:Recolor(color, color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, desaturation)
    for k,v in pairs({
        ChannelFramePortraitFrame,
        ChannelFrameTopBorder,
        ChannelFrameTopRightCorner,
        ChannelFrameRightBorder,
        ChannelFrameBotRightCorner,
        ChannelFrameBtnCornerRight,
        ChannelFrameBotLeftCorner,
        ChannelFrameBtnCornerLeft,
        ChannelFrameLeftBorder,
        ChannelFrameBottomBorder,
        ChannelFrameButtonBottomBorder,
        ChannelFrameInsetInsetBottomBorder,
        ChannelFrameTop,
        ChannelFrameMiddle,
        ChannelFrameBottom,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    for _,inset in pairs ({
        "LeftInset",
        "RightInset",
    }) do
        for _,texture in pairs({ChannelFrame[inset]:GetRegions()}) do
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color1.r,color1.g,color1.b)
        end
    end
    local frame = CreateChannelPopup
    for _, texture in pairs({
        frame.TopEdge,
        frame.BottomEdge,
        frame.TopRightCorner,
        frame.TopLeftCorner,
        frame.RightEdge,
        frame.LeftEdge,
        frame.BottomRightCorner,
        frame.BottomLeftCorner,
        frame.Titlebar,
        frame.Corner,  
    }) do
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color1.r,color1.g,color1.b) 
    end
    local bg = ChannelFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
end


