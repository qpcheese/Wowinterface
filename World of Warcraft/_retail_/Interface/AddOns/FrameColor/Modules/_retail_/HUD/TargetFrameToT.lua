local _, addonTable = ...
local addon = addonTable.addon

local texture = TargetFrameToT.FrameTexture

local module = addon:NewModule("TargetFrameToT")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["UnitFrames"]["TargetFrameToT"]
    color1 = dbObj.color1
    self:Recolor(color1, 1)
    if dbObj.classcolored1 then
        local ToT = addon:GetUnit("targettarget")
        local onTargetTargetChanged = function()
            if ToT.isPlayer then
                texture:SetVertexColor(ToT.ClassColor.r,ToT.ClassColor.g,ToT.ClassColor.b)
            else
                texture:SetVertexColor(ToT.ReactionColor.r,ToT.ReactionColor.g,ToT.ReactionColor.b)
            end
        end
        addon:RegisterOnTargetChanged(onTargetTargetChanged,"TargetFrameToT")
        addon:RegisterOnTargetTargetChanged(onTargetTargetChanged,"TargetFrameToT")
        onTargetTargetChanged()
    end
end

function module:OnDisable()
    addon:UnregisterOnTargetChanged("TargetFrameToT")
    addon:UnregisterOnTargetTargetChanged("TargetFrameToT")
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
    --reskin frames
    texture:SetDesaturation(desaturation)
    texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
end


