local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("ContainerFrame")
local color1, color2

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["ContainerFrame"]
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
    self:Recolor(color1, color2, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, 0)
end

function module:Recolor(color1, color2, desaturation)
    --reskin frames
    addon:SkinNineSliced(ContainerFrameCombinedBags, color1, desaturation)
    --window specific regions
    --normal
    for _ ,frame in pairs({
        ContainerFrameCombinedBags.MoneyFrame.Border.Middle,
        ContainerFrameCombinedBags.MoneyFrame.Border.Left,
        ContainerFrameCombinedBags.MoneyFrame.Border.Right,
        BagItemSearchBox.Left,
        BagItemSearchBox.Middle,
        BagItemSearchBox.Right,
    })
    do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    --class
    for _ ,frame in pairs({
        ContainerFrameCombinedBags.Bg.TopSection,
        ContainerFrameCombinedBags.Bg.BottomEdge,
    })
    do 
        frame:SetDesaturation(desaturation)
        frame:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    for _ ,texture in pairs({
        ContainerFrameCombinedBags.Bg.BottomLeft,
        ContainerFrameCombinedBags.Bg.BottomRight
    })
    do 
        texture:SetDesaturation(desaturation)
        texture:SetColorTexture(color2.r,color2.g,color2.b,color2.a)
    end
    --seperated bags
    for bag_num=1,6 do
        local container = _G["ContainerFrame" .. bag_num]
        addon:SkinNineSliced(container, color1, desaturation)
        container.Bg.TopSection:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
        container.Bg.BottomEdge:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
        container.Bg.BottomLeft:SetColorTexture(color2.r,color2.g,color2.b,color2.a)
        container.Bg.BottomRight:SetColorTexture(color2.r,color2.g,color2.b,color2.a)
        local slot_num = 0
        local border = true
        while (border) do 
            slot_num = slot_num + 1
            border = _G["ContainerFrame" .. bag_num .. "Item" .. slot_num .. "NormalTexture"]
            if border then
                border:SetDesaturation(desaturation)
                border:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
            end
        end
    end
end


