local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("SpellBookFrame")
local color1, color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["SpellBookFrame"]
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
    if not SpellBookFrame.ParchmentFrame then
        SpellBookFrame.ParchmentFrame = SpellBookFrame:CreateTexture(nil, "ARTWORK", nil, 1)
        SpellBookFrame.ParchmentFrame:SetTexture(addonTable.texturePaths.ParchmentFrame)
        SpellBookFrame.ParchmentFrame:SetPoint("TOP", SpellBookFrame, "TOP", 0, -76)
        SpellBookFrame.ParchmentFrame:SetPoint("BOTTOM", SpellBookFrame, "BOTTOM", 0, 80)
        SpellBookFrame.ParchmentFrame:SetPoint("LEFT", SpellBookFrame, "LEFT", 20, 0)
        SpellBookFrame.ParchmentFrame:SetPoint("RIGHT", SpellBookFrame, "RIGHT", -40, 0)
    end
    self:Recolor(color1, color3, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, 0)
end

function module:Recolor(color1, color3, desaturation)
    for _,v in pairs({SpellBookFrame:GetRegions()}) do
        if v:GetObjectType() == "Texture" then
            if v:GetDrawLayer() ~= "BACKGROUND" and v ~= SpellBookFrame.ParchmentFrame then
                v:SetDesaturation(desaturation)
                v:SetVertexColor(color1.r,color1.g,color1.b)
            end
        end
    end
    for _,frame in pairs({
        SpellBookSkillLineTab1,
        SpellBookSkillLineTab2,
        SpellBookSkillLineTab3,
        SpellBookSkillLineTab4,
        SpellBookSkillLineTab5,
        SpellBookSkillLineTab6,
        SpellBookSkillLineTab7,
        SpellBookSkillLineTab8,
    }) do
        for _,v in pairs({frame:GetRegions()}) do
            if v:GetObjectType() == "Texture" then
                if v:GetDrawLayer() ~= "ARTWORK" then
                    v:SetDesaturation(desaturation)
                    v:SetVertexColor(color3.r,color3.g,color3.b)
                end
            end
        end
    end
end


