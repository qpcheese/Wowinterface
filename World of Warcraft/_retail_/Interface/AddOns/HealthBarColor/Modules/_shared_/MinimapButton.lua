local addonName, addonTable = ...
local addon = addonTable.addon
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local Icon = nil
local IconObj = nil

local module = addon:NewModule("MinimapButton")

function module:OnEnable()
  if not Icon then
    Icon = LibStub("LibDBIcon-1.0")
  end
  if not IconObj then
    IconObj = LibStub("LibDataBroker-1.1"):NewDataObject(addonName, 
    {
      type = "launcher",
      label = addonName,
      icon = addonTable.texturePaths.portraitIcon,
      OnClick = function(self, button) 
        addon:SlashCommand() 
      end,
      OnTooltipShow = function(tooltip)
        tooltip:AddLine(addonName)
      end,
    })
    Icon:Register(addonName, IconObj, addon.db.profile.MinimapButton)
  end
  Icon:Show(addonName)
end

function module:OnDisable()
    if Icon and IconObj then
        Icon:Hide(addonName)
    end
end
