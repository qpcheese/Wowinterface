local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("MultiBarBottomLeft")
Mixin(module, addonTable.hooks)
local color
local desaturation

function module:OnEnable()
    local dbObj = addon.db.profile["ActionBars"]["MultiBarBottomLeft"]
    desaturation = 1
    if dbObj.classcolored1 then
        color = addonTable.classColor
    else
        color = dbObj.color1
    end
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "Recolor")
    self:RegisterEvent("UPDATE_SHAPESHIFT_FORM", "Recolor")
    self:RegisterEvent("ACTIONBAR_SLOT_CHANGED", "Recolor")
    self:RegisterEvent("ACTIONBAR_SHOWGRID", "Recolor")
    self:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED", "Recolor")
    self:HookFunc("MultiActionBar_UpdateGrid", function(barName)
        if barName == "MultiBarBottomLeft" then
            self:Recolor()
        end
    end)
    local MultiBarBottomLeft = MultiBarBottomLeft
    self:HookFunc("ActionButton_UpdateUsable", function(self)
        if self:GetParent() == MultiBarBottomLeft then
            local normalTexture = self.NormalTexture
            if not normalTexture then
                return
            end
            normalTexture:SetVertexColor(color.r,color.g,color.b)
        end
    end)
    self:Recolor()
end

function module:OnDisable()
    self:DisableHooks()
    desaturation = 0
    color = {r=1,g=1,b=1,a=0.5}
    self:Recolor()
end

function module:Recolor()
    for i = 1, 12 do
        local texture = _G["MultiBarBottomLeftButton" ..i.. "NormalTexture"]
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(color.r,color.g,color.b,color.a)
    end
end


