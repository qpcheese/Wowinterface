-----------------------------------------------------------------------------------------------------------------------
--  Title:   BoostingTools                                                                                           --
--  Author:  Zaazu                                                                                                   --
--  Date:    October 2021                                                                                            --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Addon Core.                                                                                        --
-----------------------------------------------------------------------------------------------------------------------
---@class BTools : AceAddon, AceConsole, AceEvent
local BTools = LibStub("AceAddon-3.0"):NewAddon("BTools", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = LibStub("StdUi"):NewInstance()

---@type DBSettingsGeneral
local GeneralSettingsDB = nil

---Get StdUi
---@return StdUi
function BTools:GetStdUiInstance()
    return StdUi
end

---Ensures window scale is the same no matter what the UI scale is set to
---@return number
function BTools:GetScaleNormalized()
    return (0.65 / UIParent:GetScale()) * GeneralSettingsDB.windowScale
end

---Returns the addon semantic version
---@return string
function BTools:GetAddonVersion()
    return GetAddOnMetadata("BoostingTools", "Version")
end

--- Called when the addon is first loaded
function BTools:OnInitialize()
    ---@type DatabaseManager
    local DatabaseManager = BTools:GetModule("DatabaseManager")
    GeneralSettingsDB = DatabaseManager:GetGeneralSettingsTable()

    -- Do something if version mismatch TODO
    -- if(GeneralSettingsDB.lastVersion ~= self:GetAddonVersion()) then
    -- end

    -- Record addon version
    GeneralSettingsDB.lastVersion = self:GetAddonVersion()
end
