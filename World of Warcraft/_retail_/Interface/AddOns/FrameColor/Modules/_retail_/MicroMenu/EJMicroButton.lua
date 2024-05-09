local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("EJMicroButton")
local color1, color2, color3

local textures = {}
textures.normal = EJMicroButton:GetNormalTexture()
textures.highlight = EJMicroButton:GetHighlightTexture()
textures.pushed = EJMicroButton:GetPushedTexture()

function module:OnEnable()
    local dbObj = addon.db.profile["MicroMenu"]["EJMicroButton"]
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
    for _,texture in pairs(textures) do
        texture:SetDesaturation(desaturation)
    end
    textures.normal:SetVertexColor(color1.r,color1.g,color1.b)
    textures.highlight:SetVertexColor(color2.r,color2.g,color2.b)
    textures.pushed:SetVertexColor(color3.r,color3.g,color3.b)
end



