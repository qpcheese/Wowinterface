local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("MainMenuBar")


function module:OnEnable()
    local color 
    local dbObj = addon.db.profile["ActionBars"]["MainMenuBar"]
    if dbObj.classcolored1 then
        color = addonTable.classColor
    else
        color = dbObj.color1
    end
    self:Recolor(color, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, 0)
end

function module:Recolor(color, desaturation)
    local actionBarTextures = {}
    if C_AddOns.IsAddOnLoaded("Bartender4") then
        for i=1,12 do
            local texture = _G["BT4Button"..i.."NormalTexture"] 
            if texture then
                table.insert(actionBarTextures, texture)
            end
        end
        if BT4BarBlizzardArt then
            for _,v in pairs({
                BlizzardArtRightCap,
                BlizzardArtLeftCap,
            }) do
                table.insert(actionBarTextures, v)
            end
            if BT4BarBlizzardArt.nineSliceParent then
                for _,v in pairs({BT4BarBlizzardArt.nineSliceParent:GetChildren()}) do
                    if v.Divider then 
                        for _,region in pairs({
                            "TopEdge",
                            "Center",
                            "BottomEdge",
                        }) do
                            table.insert(actionBarTextures, v.Divider[region])
                        end
                    end
                    for _,child in pairs({v:GetRegions()}) do
                        table.insert(actionBarTextures, child)
                    end
                end
            end
            if BT4BarBlizzardArt.nineSliceMenuBagParent then
                for _,v in pairs({BT4BarBlizzardArt.nineSliceMenuBagParent:GetChildren()}) do
                    if v.Divider then 
                        for _,region in pairs({
                            "TopEdge",
                            "Center",
                            "BottomEdge",
                        }) do
                            table.insert(actionBarTextures, v.Divider[region])
                        end
                    end
                    for _,child in pairs({v:GetRegions()}) do
                        table.insert(actionBarTextures, child)
                    end
                end
            end
        end
    elseif C_AddOns.IsAddOnLoaded("Dominos") then
        for i=1,12 do
            local texture = _G["DominosActionButton"..i.."NormalTexture"] 
            if texture then
                table.insert(actionBarTextures, texture)
            end
        end
    else --Blizzard default UI
        for i = 1, 12 do
            local texture = _G["ActionButton" ..i.. "NormalTexture"]
            if texture then
                table.insert(actionBarTextures, texture)
            end
        end
        for _ , texture in pairs({
            MainMenuBar.EndCaps.LeftEndCap,
            MainMenuBar.BorderArt,
            MainMenuBar.EndCaps.RightEndCap,
            ActionButton1.RightDivider,
            ActionButton2.RightDivider,
            ActionButton3.RightDivider,
            ActionButton4.RightDivider,
            ActionButton5.RightDivider,
            ActionButton6.RightDivider,
            ActionButton7.RightDivider,
            ActionButton8.RightDivider,
            ActionButton9.RightDivider,
            ActionButton10.RightDivider,
            ActionButton11.RightDivider,
        }) do 
            table.insert(actionBarTextures, texture)
        end
    end
    for _, texture in pairs(actionBarTextures) do
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color.r, color.g, color.b)
    end
end


