local addonName, addonTable = ...
local addon = addonTable.addon

local GetRegions = GetRegions
local GetDrawLayer = GetDrawLayer
local SetDesaturation = SetDesaturation
local SetVertexColor = SetVertexColor

local module = addon:NewModule("LibDBIcon_Skin")
local color1
local LDBI = nil

function module:OnEnable()
    LDBI = LibStub("LibDBIcon-1.0", true)
    local dbObj = addon.db.profile["Skins"]["LibDBIcon_Skin"]
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
    if not LDBI then 
        return 
    end
    local function recolorButtonOverlay(button)
        for _,child in pairs ({
            button:GetRegions()
        }) do
            if child:GetDrawLayer() == "OVERLAY" then
                child:SetDesaturation(desaturation)
                child:SetVertexColor(color1.r,color1.g,color1.b,color1.a)
            end
        end
    end
    local buttonList = LDBI:GetButtonList()
    for _,name in pairs(buttonList) do 
        local button = LDBI:GetMinimapButton(name)
        recolorButtonOverlay(button)
    end
    LDBI.RegisterCallback(addonName, "LibDBIcon_IconCreated", function(_, button, _) 
        recolorButtonOverlay(button)
    end)
end


