--[[Created by Slothpala]]--
local addonName, addonTable = ...
addonTable.addon = LibStub("AceAddon-3.0"):NewAddon(addonName, "AceConsole-3.0", "AceEvent-3.0", "AceSerializer-3.0")
local addon = addonTable.addon
addon:SetDefaultModuleLibraries("AceEvent-3.0")
addon:SetDefaultModuleState(false)
local ACD = LibStub("AceConfigDialog-3.0")
local AC = LibStub("AceConfig-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

function addon:OnInitialize()
    self:LoadDataBase()
    self:SetColorOverrides()
    local options = self:GetOptionsTable()
    options.args.ProfileManagement.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db) 
    options.args.ProfileManagement.args.profiles.order = 1
    AC:RegisterOptionsTable(addonName.."_options", options)
    self:RegisterChatCommand(addonName, "SlashCommand")
    self:RegisterChatCommand("fc", "SlashCommand")
end
  
function addon:OnEnable()
    for name, module in self:IterateModules() do
        if self.db.profile.modules[name].enabled then
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
    self:SetColorOverrides()
    self:Disable()
    self:Enable()
end

function addon:ReloadModule(name)
    self:DisableModule(name)
    self:EnableModule(name)
end

function addon:SlashCommand()
    if InCombatLockdown() then
        self:Print(L["combat_message"])
        return
    end
    local frame = addon:GetOptionsFrame()
    if not frame:IsShown() then
        frame:Show()
    else
        frame:Hide()
    end
end

function FrameColor_OnAddonCompartmentClick()
    addon:SlashCommand()
end

addon:RegisterMessage("SOLO_FRAME_LOADED", function ()
    print("loaded SoloFrame")
  end)