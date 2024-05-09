local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("PVPFrame")
local color1, color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["PVPFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if dbObj.classcolored3 then
        color3 = addonTable.classColor
    else
        color3 = dbObj.color3
    end
    self:Recolor(color1, color3, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, 0)
end

function module:Recolor(color1, color3, desaturation)
    for _,frame in pairs({
        PVPFrame,
        BattlefieldFrame,
    }) do
        for _,v in pairs({frame:GetRegions()}) do
            if v:GetObjectType() == "Texture" then
                if v:GetDrawLayer() == "BORDER" then
                    v:SetDesaturation(desaturation)
                    v:SetVertexColor(color1.r,color1.g,color1.b)
                end
            end
        end
    end
    for i=1,2 do
        for _,texture in pairs({
            _G["PVPParentFrameTab" ..i.. "Left"],
            _G["PVPParentFrameTab" ..i.. "Middle"],
            _G["PVPParentFrameTab" ..i.. "Right"],
            _G["PVPParentFrameTab" ..i.. "LeftDisabled"],
            _G["PVPParentFrameTab" ..i.. "MiddleDisabled"],
            _G["PVPParentFrameTab" ..i.. "RightDisabled"],
        }) do
            texture:SetDesaturation(desaturation)
            texture:SetVertexColor(color3.r,color3.g,color3.b)
        end
    end
end


