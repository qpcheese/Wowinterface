local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("MultiBarLeft")

function module:OnEnable()
    local color
    local dbObj = addon.db.profile["ActionBars"]["MultiBarLeft"]
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
    if IsAddOnLoaded("Bartender4") then
        for i=37,48 do
            local texture = _G["BT4Button"..i.."NormalTexture"] 
            if texture then
                table.insert(actionBarTextures, texture)
            end
        end
    elseif IsAddOnLoaded("Dominos") then
        for i=1,12 do
            local texture = _G["MultiBarBottomRightActionButton"..i.."NormalTexture"] 
            if texture then
                table.insert(actionBarTextures, texture)
            end
        end
    else --Blizzard default UI
        for i = 1, 12 do
            local texture = _G["MultiBarLeftButton" ..i.. "NormalTexture"]
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


