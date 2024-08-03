local _, addonTable = ...
local addon = addonTable.addon

local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor
local GetRegions = GetRegions
local GetDebugName = GetDebugName

local module = addon:NewModule("MacroFrame")
local color1, color2, color3, color4

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
    if C_AddOns.IsAddOnLoaded("Blizzard_MacroUI") then
        self:Recolor(color1, color2, color3, color4, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_MacroUI" then
                self:Recolor(color1, color2, color3, color4, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end

end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_MacroUI") then
        self:Recolor(color, color, color, color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1, color2, color3, color4, desaturation)
    --reskin frames
    for _,frame in pairs({
        MacroFrame,
        MacroFrameInset,
        MacroFrameTextBackground,
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    local bg = MacroFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin tabs
    for _,frame in pairs({
        MacroFrameTab1,
        MacroFrameTab2,
    }) do 
        addon:SkinTabs(frame, color3)
    end
    --reskin scrollbars
    for _,frame in pairs({
        MacroFrame.MacroSelector,
        MacroPopupFrame.IconSelector,
        MacroFrameScrollFrame
    }) do 
        addon:SkinScrollBar(frame, color4)
    end
    --window specific regions
    for _,frame in pairs({
        MacroPopupFrameLeft,
        MacroPopupFrameMiddle,
        MacroPopupFrameRight
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    local bl = {
        ["MacroFramePortrait"] = true,
        ["MacroFrameBg"] = true,
    }
    for _,region in pairs ({MacroFrame:GetRegions()}) do 
        local regionName = region:GetDebugName()
        if region:IsObjectType("Texture") and not bl[regionName] then
            region:SetDesaturation(desaturation)
            region:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end
    end
    --macro popup
    addon:SkinEdges(MacroPopupFrame.BorderBox,color1)
end


