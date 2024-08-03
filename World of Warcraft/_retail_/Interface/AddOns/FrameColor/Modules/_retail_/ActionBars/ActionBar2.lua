local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("MultiBarBottomLeft")

function module:OnEnable()
    local color
    local dbObj = addon.db.profile["ActionBars"]["MultiBarBottomLeft"]
    if dbObj.classcolored1 then
        color = addonTable.classColor
    else
        color = dbObj.color1
    end
    self:Recolor(color, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color, desaturation)
    local actionBarTextures = {}
    if C_AddOns.IsAddOnLoaded("Bartender4") then
        for i=61,72 do
            local texture = _G["BT4Button"..i.."NormalTexture"] 
            if texture then
                table.insert(actionBarTextures, texture)
            end
        end
    elseif C_AddOns.IsAddOnLoaded("Dominos") then
        for i=13,24 do
            local texture = _G["DominosActionButton"..i.."NormalTexture"] 
            if texture then
                table.insert(actionBarTextures, texture)
            end
        end
    else --Blizzard default UI
        for i = 1, 12 do
            local texture = _G["MultiBarBottomLeftButton" ..i.. "NormalTexture"]
            if texture then
                table.insert(actionBarTextures, texture)
            end
        end
    end
    for _, texture in pairs(actionBarTextures) do
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color.r, color.g, color.b)
    end
end

