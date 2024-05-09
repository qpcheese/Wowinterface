local _, addonTable = ...
local addon = addonTable.addon

local CharacterMicroButton = CharacterMicroButton
local SetVertexColor = SetVertexColor
local GetButtonState = GetButtonState
local MouseIsOver = MouseIsOver


local module = addon:NewModule("CharacterMicroButton")
Mixin(module, addonTable.hooks)
local color1, color2, color3

local textures = {}
textures.normal = CharacterMicroButton.Portrait


function module:OnEnable()
    local dbObj = addon.db.profile["MicroMenu"]["CharacterMicroButton"]
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
    self:HookScript(CharacterMicroButton, "OnEnter", function()
        textures.normal:SetVertexColor(color2.r,color2.g,color2.b)
    end)
    self:HookScript(CharacterMicroButton, "OnLeave", function()
        if CharacterMicroButton:GetButtonState() == "NORMAL" then
            textures.normal:SetVertexColor(color1.r,color1.g,color1.b)
        else
            textures.normal:SetVertexColor(color3.r,color3.g,color3.b)
        end
    end)
    self:HookScript(CharacterMicroButton, "OnMouseDown", function()
        textures.normal:SetVertexColor(color3.r,color3.g,color3.b)
    end)
    self:HookScript(CharacterFrame, "OnShow", function()
        textures.normal:SetVertexColor(color3.r,color3.g,color3.b)
    end)
    self:HookScript(CharacterFrame, "OnHide", function()
        textures.normal:SetVertexColor(color1.r,color1.g,color1.b)
        if MouseIsOver(CharacterMicroButton) then
            textures.normal:SetVertexColor(color2.r,color2.g,color2.b)
        end
    end)
    self:Recolor(color1, color2, color3, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, color, 0)
    self:DisableHooks()
end

function module:Recolor(color1, color2, color3, desaturation)
    textures.normal:SetDesaturation(desaturation)
    textures.normal:SetVertexColor(color1.r,color1.g,color1.b)
end



