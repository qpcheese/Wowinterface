local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("CharacterFrame")
local color1, color3

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["CharacterFrame"]
    if dbObj.classcolored1 then
        color1 = addonTable.classColor
    else
        color1 = dbObj.color1
    end
    if dbObj.classcolored2 then
        color2 = addonTable.classColor
    else
        color2 = dbObj.color2
    end
    if dbObj.classcolored3 then
        color3 = addonTable.classColor
    else
        color3 = dbObj.color3
    end
    if dbObj.classcolored4 then
        color4 = addonTable.classColor
    else
        color4 = dbObj.color4
    end
    local color = addonTable.classColor
    CharacterNameText:SetTextColor(color.r,color.g,color.b)
    self:Recolor(color1, color3, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    CharacterNameText:SetTextColor(color.r,color.g,color.b)
    self:Recolor(color, color, 0)
end

function module:Recolor(color1, color3, desaturation)
    --frames
    for _,frame in pairs({
        PaperDollFrame,
        ReputationFrame,
        SkillFrame,
        HonorFrame,
        SkillListScrollFrame,
        SkillDetailScrollFrame,
        PetPaperDollFrame,
    }) do
        for _,v in pairs({frame:GetRegions()}) do
            if v:GetObjectType() == "Texture" then
                v:SetDesaturation(desaturation)
                v:SetVertexColor(color1.r,color1.g,color1.b)
            end
        end
    end
    --tabs
    for k,v in pairs({
        CharacterFrameTab1Left,
        CharacterFrameTab1Middle,
        CharacterFrameTab1Right,
        CharacterFrameTab1LeftDisabled,
        CharacterFrameTab1MiddleDisabled,
        CharacterFrameTab1RightDisabled,
        CharacterFrameTab2Left,
        CharacterFrameTab2Middle,
        CharacterFrameTab2Right,
        CharacterFrameTab2LeftDisabled,
        CharacterFrameTab2MiddleDisabled,
        CharacterFrameTab2RightDisabled,
        CharacterFrameTab3Left,
        CharacterFrameTab3Middle,
        CharacterFrameTab3Right,
        CharacterFrameTab3LeftDisabled,
        CharacterFrameTab3MiddleDisabled,
        CharacterFrameTab3RightDisabled,
        CharacterFrameTab4Left,
        CharacterFrameTab4Middle,
        CharacterFrameTab4Right,
        CharacterFrameTab4LeftDisabled,
        CharacterFrameTab4MiddleDisabled,
        CharacterFrameTab4RightDisabled,
        CharacterFrameTab5Left,
        CharacterFrameTab5Middle,
        CharacterFrameTab5Right,
        CharacterFrameTab5LeftDisabled,
        CharacterFrameTab5MiddleDisabled,
        CharacterFrameTab5RightDisabled,
    }) do
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color3.r,color3.g,color3.b)
    end
end


