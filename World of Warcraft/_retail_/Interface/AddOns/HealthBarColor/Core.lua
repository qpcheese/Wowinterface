local addonName, addonTable = ...
addonTable.addon = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0", "AceSerializer-3.0", "AceEvent-3.0")
local addon = addonTable.addon
addon:SetDefaultModuleState(false)
addon:SetDefaultModuleLibraries("AceEvent-3.0")
local ACD = LibStub("AceConfigDialog-3.0")
local AC = LibStub("AceConfig-3.0")
--local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
--local LDBI = LibStub("LibDBIcon-1.0")

function addon:OnInitialize()
  --The order is important: UpdateAddonColors needs the db values, CreateAllUnits calls Update on the hbc_unit which expects the colours to be initialised.
  self:LoadDataBase()
  self:UpdateAddonColors()
  self:CreateAllUnits()
  --options
  local colorsTabOptions = self:GetColorsTabOptions()
  AC:RegisterOptionsTable("HealthBarColor_Colors_Tab", colorsTabOptions)
  local healthBarsTabOptions = self:GetHealthBarsTabOptions()
  AC:RegisterOptionsTable("HealthBarColor_HealthBars_Tab", healthBarsTabOptions)
  local modulesTabOptions = self:GetModulesTabOptions()
  AC:RegisterOptionsTable("HealthBarColor_Modules_Tab", modulesTabOptions)
  local fontsTabOptions = self:GetFontsTabOptions()
  AC:RegisterOptionsTable("HealthBarColor_Fonts_Tab", fontsTabOptions)
  local profilesTabOptions = self:GetProfilesTabOptions()
  AC:RegisterOptionsTable("HealthBarColor_Profiles_Tab", profilesTabOptions)
  self:RegisterChatCommand("hbc", "SlashCommand")
end

function addon:SlashCommand()
  if InCombatLockdown() then
      return
  end
  local frame = addon:GetOptionsFrame()
  if not frame:IsShown() then
      frame:Show()
  else
      frame:Hide()
  end
end

function addon:OnEnable()
  for name, module in self:IterateModules() do
    if self.db.profile[name].enabled then
      module:Enable()
    end
  end
end

function addon:OnDisable()
  for name, module in self:IterateModules() do
    module:Disable()
  end
end

function addon:ReloadConfig()
  self:UpdateAddonColors()
  self:Disable()
  self:Enable()
  local hbc_units = self:GetAllUnits()
  for _, hbc_unit in pairs(hbc_units) do
    hbc_unit:FullUpdate()
  end
  self:UpdateOptionsFrame()
end

function addon:IsModuleEnabled(name)
  return self.db.profile[name].enabled
end

function addon:ReloadModule(name)
  self:DisableModule(name)
  self:EnableModule(name)
end

function HealthBarColor_OnAddonCompartmentClick()
  addon:SlashCommand()
end