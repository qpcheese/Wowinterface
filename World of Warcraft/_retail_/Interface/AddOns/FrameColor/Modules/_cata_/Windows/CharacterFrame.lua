local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("CharacterFrame")
local color1, color2, color3, color4

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["CharacterFrame"]
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
    local color = addonTable.classColor
    CharacterFrameTitleText:SetTextColor(color.r,color.g,color.b)
    self:Recolor(color1, color2, color3, color4, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    CharacterFrameTitleText:SetTextColor(color.r,color.g,color.b)
    self:Recolor(color, color, color, color, 0)
end

function module:Recolor(color1, color2, color3, color4, desaturation)
    local bg = CharacterFrameBg
    if bg then
        bg:SetDesaturation(desaturation)
        bg:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --reskin tabs
    for _ ,frame in pairs({
        CharacterFrameTab1Left,
        CharacterFrameTab1Middle,
        CharacterFrameTab1Right,
        CharacterFrameTab1LeftDisabled,
        CharacterFrameTab1MiddleDisabled,
        CharacterFrameTab1RightDisabled,
        CharacterFrameTab2Left,
        CharacterFrameTab2Middle,
        CharacterFrameTab2Right,
        CharacterFrameTab2LeftDisabled,
        CharacterFrameTab2MiddleDisabled,
        CharacterFrameTab2RightDisabled,
        CharacterFrameTab3Left,
        CharacterFrameTab3Middle,
        CharacterFrameTab3Right,
        CharacterFrameTab3LeftDisabled,
        CharacterFrameTab3MiddleDisabled,
        CharacterFrameTab3RightDisabled,
        CharacterFrameTab4Left,
        CharacterFrameTab4Middle,
        CharacterFrameTab4Right,
        CharacterFrameTab4LeftDisabled,
        CharacterFrameTab4MiddleDisabled,
        CharacterFrameTab4RightDisabled,
        CharacterFrameTab5Left,
        CharacterFrameTab5Middle,
        CharacterFrameTab5Right,
        CharacterFrameTab5LeftDisabled,
        CharacterFrameTab5MiddleDisabled,
        CharacterFrameTab5RightDisabled,
    })
    do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color3.r,color3.g,color3.b,color3.a)
    end
    --reskin scrollbars
    for _ ,frame in pairs({
        CharacterStatsPane,
    })
    do 
        addon:SkinScrollBar(frame, color4)
    end
    --window specific regions
    for _ ,frame in pairs({
        CharacterFramePortraitFrame,
        CharacterFrameTopBorder,
        CharacterFrameTopRightCorner,
        CharacterFrameRightBorder,
        CharacterFrameBotRightCorner,
        CharacterFrameBtnCornerRight,
        CharacterFrameBotLeftCorner,
        CharacterFrameBtnCornerLeft,
        CharacterFrameLeftBorder,
        CharacterFrameBottomBorder,
        CharacterFrameButtonBottomBorder,
        CharacterFrameInsetInsetBottomBorder,
        CharacterFrameInsetInsetLeftBorder,
        CharacterFrameInsetInsetBotLeftCorner,
        CharacterFrameTop,
        CharacterFrameMiddle,
        CharacterFrameBottom,

        CharacterFrameInsetRightInsetTopBorder,
        CharacterFrameInsetRightInsetTopRightCorner,
        CharacterFrameInsetRightInsetRightBorder,
        CharacterFrameInsetRightInsetBotRightCorner,
        CharacterFrameInsetRightInsetBottomBorder,
        CharacterFrameInsetRightInsetBotLeftCorner,
        CharacterFrameInsetRightInsetLeftBorder,

        CharacterTrinket0SlotFrame,
        CharacterTrinket1SlotFrame,
        CharacterFinger0SlotFrame,
        CharacterFinger1SlotFrame,
        CharacterFeetSlotFrame,
        CharacterLegsSlotFrame,
        CharacterWaistSlotFrame,
        CharacterHandsSlotFrame,
        CharacterWristSlotFrame,
        CharacterSecondaryHandSlotFrame,
        CharacterMainHandSlotFrame,
        CharacterTabardSlotFrame,
        CharacterShirtSlotFrame,
        CharacterChestSlotFrame,
        CharacterBackSlotFrame,
        CharacterShoulderSlotFrame,
        CharacterNeckSlotFrame,
        CharacterHeadSlotFrame
    })
    do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end


