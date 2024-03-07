-----------------------------------------------------------------------------------------------------------------------
--  Title:   DatabaseManager                                                                                         --
--  Author:  Zaazu                                                                                                   --
--  Date:    October 2021                                                                                            --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that handles the database.                                                                  --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class DatabaseManager : AceConsole
local DatabaseManager = BTools:NewModule("DatabaseManager", "AceConsole-3.0")

---@type Database
local Database = nil

-- If database is missing values, set missing values to Defaults
-- LuaFormatter off
---@class Database
local Defaults = {
    global = {
        ---@class DBSettings
        settings = {
            ---@class DBSettingsGeneral
            general = {
                lastVersion = nil,
                windowScale = 1,
            },
            ---@class DBSettingsMinimap
            minimap = {
                hide = false
            },
            ---@class DBSettingsTrade
            trade = {
                logTrades = true,
                announceTrade = true,
				announceChannel = "Whisper",
				
                logShowOnlyCompleted = false,
				logShowOnlyPastDay = false,
				logShowOnlyThisCharacter = false,
                
                panelShowOnlyCharacter = false,
				panelShowOnlyCompleted = false,
            },
            ---@class DBSettingsMail
            mail = {
                logMail = true,
                
                logShowOnlySent = false,
                logShowOnlyPastDay = false,
                logShowOnlyThisCharacter = false
            },
            ---@class DBSettingsCharacterInfoWindow
            characterInfoWindow = {
                enabled = true,
                windowPosition = nil,
                windowSize = nil,
            },
            ---@class DBSettingsRealmLanguageInfo
            realmLanguageInfo = {
                prefixType = "Icon",
                chatEnable = true,
                tooltipEnable = true,
            }
        },
        ---@class DBTradeLog
        tradeLog = {},
        ---@class DBMailLog
        mailLog = {},
    }
}
-- LuaFormatter on

local function InitialiseDatabase()
    -- Create an empty database if one does not already exist
    Database = LibStub("AceDB-3.0"):New("BToolsDB", Defaults)
end

--- Reset settings table
function DatabaseManager:ResetAllSettings()
    if (not Database) then
        InitialiseDatabase()
    end
    Database.global.settings = {}
    ReloadUI()
end

---Returns General Settings (db.global.settings.general)
---@return DBSettingsGeneral
function DatabaseManager:GetGeneralSettingsTable()
    if (not Database) then
        InitialiseDatabase()
    end
    return Database.global.settings.general;
end

---Returns Minimap Settings (db.global.settings.minimap)
---@return DBSettingsMinimap
function DatabaseManager:GetMinimapSettingsTable()
    if (not Database) then
        InitialiseDatabase()
    end
    return Database.global.settings.minimap;
end

---Returns Mail Settings (db.global.settings.mail)
---@return DBSettingsMail
function DatabaseManager:GetMailSettingsTable()
    if (not Database) then
        InitialiseDatabase()
    end
    return Database.global.settings.mail;
end

---Returns Trade Settings (db.global.settings.trade)
---@return DBSettingsTrade
function DatabaseManager:GetTradeSettingsTable()
    if (not Database) then
        InitialiseDatabase()
    end
    return Database.global.settings.trade;
end

---Returns General Settings (db.global.settings.characterInfoWindow)
---@return DBSettingsCharacterInfoWindow
function DatabaseManager:GetCharacterInfoWindowSettingsTable()
    if (not Database) then
        InitialiseDatabase()
    end
    return Database.global.settings.characterInfoWindow;
end

---Returns General Settings (db.global.settings.general)
---@return DBSettingsGeneral
function DatabaseManager:GetRealmLanguageInfoSettingsTable()
    if (not Database) then
        InitialiseDatabase()
    end
    return Database.global.settings.realmLanguageInfo;
end

---Returns Trades Logged (db.global.tradeLog)
---@return DBTradeLog
function DatabaseManager:GetTradeLogTable()
    if (not Database) then
        InitialiseDatabase()
    end
    return Database.global.tradeLog;
end

---Returns Mails Logged (db.global.mailLog)
---@return DBMailLog
function DatabaseManager:GetMailLogTable()
    if (not Database) then
        InitialiseDatabase()
    end
    return Database.global.mailLog;
end

