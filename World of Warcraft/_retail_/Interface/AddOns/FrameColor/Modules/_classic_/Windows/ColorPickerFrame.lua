local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("ColorPickerFrame")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["ColorPickerFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    self:Recolor(color1, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
    local frame = ColorPickerFrame
    for _, texture in pairs({
        frame.TopEdge,
        frame.TopRightCorner,
        frame.RightEdge,
        frame.BottomRightCorner,
        frame.BottomEdge,
        frame.BottomLeftCorner,
        frame.LeftEdge,
        frame.TopLeftCorner,
        ColorPickerFrameHeader
    }) do 
        texture:SetVertexColor(color1.r,color1.g,color1.b)
    end
end

