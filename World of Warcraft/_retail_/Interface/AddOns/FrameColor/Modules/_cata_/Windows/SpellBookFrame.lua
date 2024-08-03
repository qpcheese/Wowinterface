local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("SpellBookFrame")
local color1, color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["SpellBookFrame"]
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
    self:Recolor(color1, color3, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, 0)
end

function module:Recolor(color1, color3, desaturation)
    -- Frame
    for _ ,frame in pairs({
        SpellBookFramePortraitFrame,
        SpellBookFrameTopBorder,
        SpellBookFrameTopRightCorner,
        SpellBookFrameRightBorder,
        SpellBookFrameBotRightCorner,
        SpellBookFrameBtnCornerRight,
        SpellBookFrameBotLeftCorner,
        SpellBookFrameBtnCornerLeft,
        SpellBookFrameLeftBorder,
        SpellBookFrameBottomBorder,
        SpellBookFrameButtonBottomBorder,
        SpellBookFrameInsetInsetBottomBorder,
        SpellBookFrameInsetInsetLeftBorder,
        SpellBookFrameInsetInsetBotLeftCorner,
    })
    do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    -- Tabs
    for _ ,frame in pairs({
        SpellBookFrameTabButton1Left,
        SpellBookFrameTabButton1Middle,
        SpellBookFrameTabButton1Right,
        SpellBookFrameTabButton2Left,
        SpellBookFrameTabButton2Middle,
        SpellBookFrameTabButton2Right,
        SpellBookFrameTabButton3Left,
        SpellBookFrameTabButton3Middle,
        SpellBookFrameTabButton3Right,
    })
    do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color3.r,color3.g,color3.b,color3.a)
    end
    -- Side tabs
    for i=1,6 do
        for _,v in pairs ({
            _G["SpellBookSkillLineTab" ..i]:GetRegions(),
        }) do 
            if v:GetWidth() > 32 then
                v:SetDesaturation(desaturation)
                v:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
            end
        end
    end
end


