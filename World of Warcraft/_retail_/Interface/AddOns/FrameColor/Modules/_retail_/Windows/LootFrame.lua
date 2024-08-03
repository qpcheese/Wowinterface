local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("LootFrame")
local color1, color2, color4

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["LootFrame"]
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
    self:Recolor(color1, color2, color4, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, color, 0)
end

function module:Recolor(color1, color2, color4, desaturation)
    --reskin frames
    for _,frame in pairs({
        LootFrame,
        LootHistoryFrame,
        GroupLootHistoryFrame
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    --reskin scrollbars
    for _,frame in pairs({
        LootFrame,
        GroupLootHistoryFrame
    }) do 
        addon:SkinScrollBar(frame, color4)
    end
    --window specific regions
    --normal
    for _,texture in pairs({
        GroupLootHistoryFrameMiddle,
        GroupLootHistoryFrameLeft,
        GroupLootHistoryFrameRight
    }) do 
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    --class
    for _,texture in pairs({
        LootFrameBg.TopSection,
        LootFrameBg.BottomEdge,
        GroupLootHistoryFrameBg.TopSection,
        GroupLootHistoryFrameBg.BottomEdge,
    }) do 
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    for _,texture in pairs({
        LootFrameBg.BottomRight,
        LootFrameBg.BottomLeft,
        GroupLootHistoryFrameBg.BottomLeft,
        GroupLootHistoryFrameBg.BottomRight,
    }) do 
        texture:SetDesaturation(desaturation)
        texture:SetColorTexture(color2.r,color2.g,color2.b,color2.a)
    end
end


