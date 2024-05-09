local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("DominosBar9")

function module:OnEnable()
    local color 
    local dbObj = addon.db.profile["ActionBars"]["DominosBar9"]
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
    for i=97,108 do
        local texture = _G["DominosActionButton"..i.."NormalTexture"] 
        if texture then
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color.r, color.g, color.b)
        end
    end
end


