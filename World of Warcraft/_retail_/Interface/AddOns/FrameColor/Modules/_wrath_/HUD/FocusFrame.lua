local _, addonTable = ...
local addon = addonTable.addon

local texture = FocusFrameTextureFrameTexture

local module = addon:NewModule("FocusFrame")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["UnitFrames"]["FocusFrame"]
    color1 = dbObj.color1
    self:Recolor(color1, 1)
    if dbObj.classcolored1 then
        local Focus = addon:GetUnit("focus")
        local onFocusChanged = function()
            if Focus.isPlayer then
                texture:SetVertexColor(Focus.ClassColor.r,Focus.ClassColor.g,Focus.ClassColor.b)
            else
                texture:SetVertexColor(Focus.ReactionColor.r,Focus.ReactionColor.g,Focus.ReactionColor.b)
            end
        end
        addon:RegisterOnFocusChanged(onFocusChanged,"FocusFrame")
        onFocusChanged()
    end
end

function module:OnDisable()
    addon:UnregisterOnFocusChanged("FocusFrame")
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
    --reskin frames
    texture:SetDesaturation(desaturation)
    texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
end


