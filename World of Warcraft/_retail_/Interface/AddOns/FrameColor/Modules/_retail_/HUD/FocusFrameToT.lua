local _, addonTable = ...
local addon = addonTable.addon

local texture = FocusFrameToT.FrameTexture

local module = addon:NewModule("FocusFrameToT")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["UnitFrames"]["FocusFrameToT"]
    color1 = dbObj.color1
    self:Recolor(color1, 1)
    if dbObj.classcolored1 then
        local ToF = addon:GetUnit("focustarget")
        local onFocusTargetChanged = function()
            if ToF.isPlayer then
                texture:SetVertexColor(ToF.ClassColor.r,ToF.ClassColor.g,ToF.ClassColor.b)
            else
                texture:SetVertexColor(ToF.ReactionColor.r,ToF.ReactionColor.g,ToF.ReactionColor.b)
            end
        end
        addon:RegisterOnFocusChanged(onFocusTargetChanged,"TargetFrameToT")
        addon:RegisterOnFocusTargetChanged(onFocusTargetChanged,"TargetFrameToT")
        onFocusTargetChanged()
    end
end

function module:OnDisable()
    addon:UnregisterOnFocusChanged("TargetFrameToT")
    addon:UnregisterOnFocusTargetChanged("TargetFrameToT")
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
    --reskin frames
    texture:SetDesaturation(desaturation)
    texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
end


