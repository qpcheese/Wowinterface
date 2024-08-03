local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("PopUps")
local color1

function module:OnEnable()
    local dbObj = addon.db.profile["HUD"]["PopUps"]
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
    --recolor frames
    for _, popup in pairs({
        StaticPopup1,
        StaticPopup2
    }) do 
        for _, region in pairs({popup.Border:GetRegions()}) do       
            region:SetDesaturation(desaturation)
            region:SetVertexColor(color1.r,color1.g,color1.b)
        end
    end
    for _, v in pairs({ 
        StaticPopup1EditBoxLeft,
        StaticPopup1EditBoxMid,
        StaticPopup1EditBoxRight,
    }) do 
        v:SetDesaturation(desaturation)
        v:SetVertexColor(color1.r,color1.g,color1.b)
    end
    for _, v in pairs({ 
        LFGDungeonReadyDialog,
        LFGDungeonReadyStatus,
        LFGListInviteDialog,
        LFGInvitePopup,
        LFDRoleCheckPopup,
        PVPReadyDialog,
        RolePollPopup,
        ReadyStatus,
    }) do 
        addon:SkinEdges(v.Border,color1)
    end
end


