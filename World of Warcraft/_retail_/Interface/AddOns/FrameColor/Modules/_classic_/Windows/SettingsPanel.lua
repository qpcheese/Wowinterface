local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("SettingsPanel")
local color1, color2, color4

function module:OnEnable()
    local dbObj = addon.db.profile["Windows"]["SettingsPanel"]
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
    if dbObj.classcolored4 then
        color4 = addonTable.classColor
    else
        color4 = dbObj.color4
    end
    self:Recolor(color1, color2, color4, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, color, 0)
end

function module:Recolor(color1, color2, color4, desaturation)
    --reskin frames
    for _,frame in pairs({
        SettingsPanel,
    }) do 
        addon:SkinNineSliced(frame, color1, desaturation)
    end
    --reskin scrollbars
    addon:SkinScrollBar(SettingsPanel.Container.SettingsList, color4)
    --window specific regions
    --normal
    for _,texture in pairs({
        SettingsPanel.SearchBox.Left,
        SettingsPanel.SearchBox.Middle,
        SettingsPanel.SearchBox.Right,
    }) do 
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
    end
    --class
    for _,texture in pairs({
        SettingsPanel.Bg.TopSection,
        SettingsPanel.Bg.BottomEdge,
    }) do 
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color2.r,color2.g,color2.b,color2.a)
    end
    --color texture
    for _,texture in pairs({
        SettingsPanel.Bg.BottomRight,
        SettingsPanel.Bg.BottomLeft
    })
    do 
        texture:SetDesaturation(desaturation)
        texture:SetColorTexture(color2.r,color2.g,color2.b,color2.a)
    end
end


