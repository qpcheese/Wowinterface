local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("BankFrame")
local color1, color2, color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["BankFrame"]
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
    self:Recolor(color1, color2, color3, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, color, 0)
end

function module:Recolor(color1, color2, color3, desaturation)
    --reskin frames
    for _,frame in pairs({
        BankFrame,
        ContainerFrame7, 
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    --bank slot bags
    for i=7,13 do 
        local containerFrame = _G["ContainerFrame"..i]
        if containerFrame then 
            containerFrame.Bg.TopSection:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
            containerFrame.Bg.BottomEdge:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
            containerFrame.Bg.BottomLeft:SetColorTexture(color2.r,color2.g,color2.b,color2.a)
            containerFrame.Bg.BottomRight:SetColorTexture(color2.r,color2.g,color2.b,color2.a)
            addon:SkinNineSliced(containerFrame, color1, desaturation)
        end
    end
    --reskin tabs
    for _,frame in pairs({
        BankFrameTab1,
        BankFrameTab2,  
        BankFrameTab3,  
    }) do 
        addon:SkinTabs(frame, color3)
    end
end


