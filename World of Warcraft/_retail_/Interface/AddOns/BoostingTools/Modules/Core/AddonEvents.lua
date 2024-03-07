-----------------------------------------------------------------------------------------------------------------------
--  Title:   AddonEvents                                                                                             --
--  Author:  Zaazu                                                                                                   --
--  Date:    October 2021                                                                                            --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Table of events used within the addon.                                                                  --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")

---@class AddonEvents
BTools.AddonEvents = {
    -- Minimap Icon
    ToggleMinimapIcon = "BTOOLS_TOGGLE_MINIMAP_ICON",

    -- Settings Window
    ShowSettingsWindow = "BTOOLS_SHOW_SETTINGS_WINDOW",
    SettingsWindowOnShow = "BTOOLS_SETTINGS_WINDOW_ONSHOW",
    SettingsWindowOnHide = "BTOOLS_SETTINGS_WINDOW_ONHIDE",

    -- Mail Log Window
    ShowMailLogWindow = "BTOOLS_SHOW_MAILLOG_WINDOW",
    MailLogOnShow = "BTOOLS_MAILLOG_WINDOW_ONSHOW",
    MailLogOnHide = "BTOOLS_MAILLOG_WINDOW_ONHIDE",

    -- Mail Menu Panel
    MailMenuPanelOnDraw = "BTOOLS_MAILMENU_PANEL_ON_DRAW",

    -- Mail Viewer Window
    ShowMailViewerWindow = "BTOOLS_SHOW_MAILVIEWER_WINDOW",

    -- Trade Viewer Window
    ShowTradeViewerWindow = "BTOOLS_SHOW_TRADEVIEWER_WINDOW",

    -- Trade Log Window
    ShowTradeLogWindow = "BTOOLS_SHOW_TRADELOG_WINDOW",
    TradeLogOnShow = "BTOOLS_TRADELOG_WINDOW_ONSHOW",
    TradeLogOnHide = "BTOOLS_TRADELOG_WINDOW_ONHIDE",

    -- Data Window
    ShowExportDataWindow = "BTOOLS_SHOW_EXPORTDATA_WINDOW",
    ShowImportDataWindow = "BTOOLS_SHOW_IMPORTDATA_WINDOW",

    -- Character Info Window
    ShowCharacterInfoWindow = "BTOOLS_SHOW_CHARACTERINFO_WINDOW",

    -- Logging
    TradeLogged = "BTOOLS_TRADE_LOGGED",
    MailLogged = "BTOOLS_MAIL_LOGGED"
}
