local _, addonTable = ...
local addon = addonTable.addon

local _G = _G
local SetVertexColor = SetVertexColor
local GetVertexColor = GetVertexColor
local GetParent = GetParent
local GetName = GetName

local module = addon:NewModule("SpellFlyout")
Mixin(module, addonTable.hooks)
local SpellFlyout = SpellFlyout
local spellFlyoutTextures = {
    SpellFlyout.Background.Start,
    SpellFlyout.Background.VerticalMiddle,
    SpellFlyout.Background.HorizontalMiddle,
    SpellFlyout.Background.End,
}

function module:OnEnable()
    --rloading will always call OnDisable() first so checking for IsHooked() is not needed
    self:HookScript(SpellFlyout, "OnSizeChanged", "Recolor")
end

function module:OnDisable()
    self:DisableHooks()
end

function module:Recolor()
    local parent = self:GetParent():GetName()
    if parent:match("Bar") or parent:match("ActionButton") then
        local r,g,b = _G[parent.."NormalTexture"]:GetVertexColor()
        for i=1,#spellFlyoutTextures do
            spellFlyoutTextures[i]:SetVertexColor(r,g,b)
        end
        local i = 0
        while(true)
        do
            i = i + 1
            local button = _G["SpellFlyoutButton"..i.."NormalTexture"]
            if button then
                button:SetVertexColor(r,g,b)
            else 
                break
            end
        end
    end
end
