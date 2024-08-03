local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("GuildMicroButton")
local color1, color2, color3

local textures = {}
textures.normal = GuildMicroButton:GetNormalTexture()
textures.highlight = GuildMicroButton:GetHighlightTexture()
textures.pushed = GuildMicroButton:GetPushedTexture()
textures.emblem = GuildMicroButton.Emblem

function module:OnEnable()
    local dbObj = addon.db.profile["MicroMenu"]["GuildMicroButton"]
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
    C_Timer.After(1, function()
        self:Recolor(color1, color2, color3, 1)
    end)
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
    for _,texture in pairs({
        textures.normal,
        textures.emblem
    }) do
        texture:SetVertexColor(color1.r,color1.g,color1.b)
    end
    textures.highlight:SetVertexColor(color2.r,color2.g,color2.b)
    textures.pushed:SetVertexColor(color3.r,color3.g,color3.b)
end



