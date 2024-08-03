local _, addonTable = ...
local addon = addonTable.addon

local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("EngravingFrame")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["EngravingFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if C_AddOns.IsAddOnLoaded("Blizzard_EngravingUI") then
        self:Recolor(color1, 1)
    else
        self:RegisterEvent("ADDON_LOADED", function(_, event)
            if event == "Blizzard_EngravingUI" then
                self:Recolor(color1, 1)
                self:UnregisterEvent("ADDON_LOADED")
            end
        end)
    end
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    if C_AddOns.IsAddOnLoaded("Blizzard_EngravingUI") then
        self:Recolor(color, 0)
    else
        self:UnregisterEvent("ADDON_LOADED")
    end
end

function module:Recolor(color1,desaturation)
    --reskin frames
    for _,frame in pairs({
        EngravingFrame.Border,
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    --window specific regions
    for _,frame in pairs({
        EngravingFrameFilterDropDownLeft,
        EngravingFrameFilterDropDownMiddle,
        EngravingFrameFilterDropDownRight,

        EngravingFrameScrollFrameScrollBarBottom,
        EngravingFrameScrollFrameScrollBarMiddle,
        EngravingFrameScrollFrameScrollBarTop,

        EngravingFrameSearchBoxLeft,
        EngravingFrameSearchBoxMiddle,
        EngravingFrameSearchBoxRight,

        EngravingFrameSideInsetInsetTopBorder,
        EngravingFrameSideInsetInsetTopRightCorner,
        EngravingFrameSideInsetInsetRightBorder,
        EngravingFrameSideInsetInsetBotRightCorner,
        EngravingFrameSideInsetInsetBottomBorder,
        EngravingFrameSideInsetInsetBotLeftCorner,
        EngravingFrameSideInsetInsetLeftBorder,
    }) do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end


