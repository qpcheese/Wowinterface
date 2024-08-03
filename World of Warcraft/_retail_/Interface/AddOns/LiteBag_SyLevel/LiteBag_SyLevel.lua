--[[----------------------------------------------------------------------------

  LiteBag_SyLevel/LiteBag_SyLevel.lua.lua

  Copyright 2015 Mike Battersby

  Released under the terms of the GNU General Public License version 2 (GPLv2).
  See the file LICENSE.txt.

----------------------------------------------------------------------------]]--

local myName = ...

local _E

local function enable () _E = true end

local function disable () _E = false end

local LITEBAG_PANELS = { LiteBagBankPanel, LiteBagInventoryPanel }

local function update ()
    for _,p in ipairs(LITEBAG_PANELS) do
        if p and p:IsShown() then
            LiteBagPanel_UpdateItemButtons(p)
        end
    end
end

function LiteBagButton_UpdateSyLevel(button)
    local bag = button:GetParent():GetID()
    local slot = button:GetID()
    local link = GetContainerItemLink(bag, slot)
    SyLevel:CallFilters('LiteBag', button, _E and link)
end

local function AddonLoaded(self, event, addonName)
    if addonName ~= myName then return end
    SyLevel:RegisterPipe('LiteBag', enable, disable, update,
                         '|cff00ff00Addon:|r LiteBag')
    SyLevel:RegisterAllPipesAndFilters()
    hooksecurefunc('LiteBagItemButton_Update', LiteBagButton_UpdateSyLevel)
    self:UnregisterEvent("ADDON_LOADED")
    self:SetScript("OnEvent", nil)
end

local f = CreateFrame("Frame")
f:SetScript("OnEvent", AddonLoaded)
f:RegisterEvent("ADDON_LOADED")
