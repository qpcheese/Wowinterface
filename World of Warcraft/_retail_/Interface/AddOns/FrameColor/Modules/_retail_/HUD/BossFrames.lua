local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("BossFrames")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["UnitFrames"]["BossFrames"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    self:Recolor(color1, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
    for i=1,5 do 
        for _,frame in pairs({
            _G["Boss"..i.."TargetFrame"].TargetFrameContainer.FrameTexture
        }) do
            frame:SetDesaturation(desaturation)
            frame:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
        end 
    end
end

