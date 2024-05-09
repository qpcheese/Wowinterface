local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("MainMenuBar")
local color1
local desaturation

function module:OnEnable()
    local dbObj = addon.db.profile["ActionBars"]["MainMenuBar"]
    desaturation = 1
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    self:Recolor(color1)
end

function module:OnDisable()
    desaturation = 0
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color)
end

function module:Recolor(color1)
    for i = 1, 12 do
        local texture = _G["ActionButton" ..i.. "NormalTexture"]
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    for _ ,v in pairs({
        MainMenuBarLeftEndCap,
        MainMenuBarRightEndCap,
        MainMenuBarTexture0,
        MainMenuBarTexture1,
        MainMenuBarTexture2,
        MainMenuBarTexture3,
        MainMenuBarBackpackButtonNormalTexture,
        MainMenuBarTextureExtender
    }) do 
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    for i=0,3 do 
        local texture = _G["CharacterBag" ..i.. "SlotNormalTexture"]
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end


