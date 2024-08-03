local _, addonTable = ...
local addon = addonTable.addon


local texture = TargetFrame.TargetFrameContainer.FrameTexture

local module = addon:NewModule("TargetFrame")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["UnitFrames"]["TargetFrame"]
    color1 = dbObj.color1
    self:Recolor(color1, 1)
    if dbObj.classcolored1 then
        local Target = addon:GetUnit("target")
        local onTargetChanged = function()
            if Target.isPlayer then
                texture:SetVertexColor(Target.ClassColor.r,Target.ClassColor.g,Target.ClassColor.b)
            else
                texture:SetVertexColor(Target.ReactionColor.r,Target.ReactionColor.g,Target.ReactionColor.b)
            end
        end
        addon:RegisterOnTargetChanged(onTargetChanged,"TargetFrame")
        onTargetChanged()
    end
end

function module:OnDisable()
    addon:UnregisterOnTargetChanged("TargetFrame")
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
    --reskin frames
    texture:SetDesaturation(desaturation)
    texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
end