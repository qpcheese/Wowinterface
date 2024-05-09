local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("Castbars")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["HUD"]["Castbars"]
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
    --reskin frames
    for _,castbar in pairs({
        PlayerCastingBarFrame.Border,
        PlayerCastingBarFrame.Background,
        TargetFrameSpellBar.Border,
        TargetFrameSpellBar.Background,
        FocusFrameSpellBar.Border,
        FocusFrameSpellBar.Background,
    }) do 
        castbar:SetDesaturation(desaturation)
        castbar:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
end


