-----------------------------------------------------------------------------------------------------------------------
--  Title:   MinimapButtonUI                                                                                         --
--  Author:  Zaazu                                                                                                   --
--  Date:    October 2021                                                                                            --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Ace3 Module that handles the minimap icon.                                                              --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class MinimapIconUI : AceConsole, AceEvent
local MinimapIconUI = BTools:NewModule("MinimapButtonUI", "AceConsole-3.0", "AceEvent-3.0")
local LibDBI = LibStub("LibDBIcon-1.0")
---@type StdUi
local StdUi = nil

---@type DBSettingsMinimap
local MinimapDB = nil

---@type DBSettingsRealmLanguageInfo
local RealmLanguageInfoDB = nil

---@type Frame
local MinimapContextMenu = nil

---@param parent Frame
local function DrawMinimapContextMenu(parent)
    local headerFontColor = StdUi.config.font.color.header
    local menuOptions = {
        {
            title = BTools.Resources.getFormattedTextureString(BTools.Resources.textures.Icon, 16) ..
                " Boosting Tools v" .. BTools:GetAddonVersion(),
            color = {headerFontColor.r, headerFontColor.g, headerFontColor.b}
        },
        {isSeparator = true},
        {
            text = BTools.Resources.getFormattedTextureString(BTools.Resources.textures.MailIcon, 16) ..
                " Show Mail Log",
            callback = function(event)
                MinimapIconUI:SendMessage(BTools.AddonEvents.ShowMailLogWindow)
                MinimapContextMenu:CloseMenu()
            end

        },
        {
            text = BTools.Resources.getFormattedTextureString(BTools.Resources.textures.TradeIcon, 16) ..
                " Show Trade Log",
            callback = function(event)
                MinimapIconUI:SendMessage(BTools.AddonEvents.ShowTradeLogWindow)
                MinimapContextMenu:CloseMenu()
            end
        },
        {
            text = BTools.Resources.getFormattedTextureString(BTools.Resources.textures.InfoIcon, 16) ..
                " Show Info Panel",
            callback = function(event)
                MinimapIconUI:SendMessage(BTools.AddonEvents.ShowCharacterInfoWindow)
                MinimapContextMenu:CloseMenu()
            end

        },
        {isSeparator = true},
        {
            text = BTools.Resources.getFormattedTextureString(BTools.Resources.textures.LanguageIcon, 16) ..
                " Realm Language Info",
            children = {
                {
                    checkbox = "Enabled on Tooltip",
                    events = {
                        OnShow = function(self)
                            self:SetChecked(RealmLanguageInfoDB.tooltipEnable)
                        end,
                        PostClick = function(self)
                            RealmLanguageInfoDB.tooltipEnable = self:GetChecked()
                        end
                    }
                },
                {
                    checkbox = "Enabled on Chat",
                    events = {
                        OnShow = function(self)
                            self:SetChecked(RealmLanguageInfoDB.chatEnable)
                        end,
                        PostClick = function(self)
                            RealmLanguageInfoDB.chatEnable = self:GetChecked()
                        end
                    }
                },
                {title = "Prefix Style:"},
                {
                    radio = "Icon " .. BTools.Resources.getFormattedTextureString(BTools.Resources.textures.FlagGB, 16),
                    value = "Icon",
                    radioGroup = "lang-prefix",
                    events = {
                        OnShow = function(self)
                            self:SetChecked(RealmLanguageInfoDB.prefixType == "Icon")
                        end,
                        PostClick = function(self)
                            RealmLanguageInfoDB.prefixType = self:GetChecked() and "Icon"
                        end
                    }
                },
                {
                    radio = "Text (EN)",
                    value = "Text",
                    radioGroup = "lang-prefix",
                    events = {
                        OnShow = function(self)
                            self:SetChecked(RealmLanguageInfoDB.prefixType == "Text")
                        end,
                        PostClick = function(self)
                            RealmLanguageInfoDB.prefixType = self:GetChecked() and "Text"
                        end
                    }
                }
            }
        },
        {isSeparator = true},
        {
            text = BTools.Resources.getFormattedTextureString(BTools.Resources.textures.HideIcon, 16) ..
                " Hide Minimap Icon",
            callback = function(event)
                MinimapIconUI:SendMessage(BTools.AddonEvents.ToggleMinimapIcon)
                MinimapContextMenu:CloseMenu()
            end
        }
    }
    MinimapContextMenu = StdUi:ContextMenu(UIParent, menuOptions, true)
    MinimapContextMenu:SetScale(BTools:GetScaleNormalized())
    MinimapContextMenu:SetFrameLevel(20)

    MinimapContextMenu.time = 0
    MinimapContextMenu:HookScript("OnUpdate", function(self, elapsed)
        self.time = self.time + elapsed

        -- Hide context menu after 5 seconds
        if (self.time >= 5) then
            self:CloseMenu()
        end
    end)
    MinimapContextMenu:HookScript("OnShow", function(self)
        PlaySound(BTools.Resources.sounds.ToggleMinimapButton)
    end)
    MinimapContextMenu:HookScript("OnHide", function(self)
        PlaySound(BTools.Resources.sounds.ToggleMinimapButton)
        self.time = 0
    end)
    StdUi:GlueBottom(MinimapContextMenu, parent, (-MinimapContextMenu:GetWidth() / 2) - 15,
                     -MinimapContextMenu:GetHeight(), "CENTER")

end

---@param parent Frame
local function ToggleMinimapContextMenu(parent)
    if (not MinimapContextMenu) then
        DrawMinimapContextMenu(parent)
    end

    if (MinimapContextMenu:IsShown()) then
        MinimapContextMenu:CloseMenu();
    else
        MinimapContextMenu:Show();
    end
end

local function DrawMinimapButton()
    local ldbIcon = LibStub("LibDataBroker-1.1"):NewDataObject("BTools_MinimapIcon", {
        type = "launcher",
        icon = BTools.Resources.textures.Icon,

        OnClick = function(self)
            ToggleMinimapContextMenu(self)
        end
    })

    LibDBI:Register("BTools_MinimapIcon", ldbIcon, MinimapDB)
    LibDBI:Refresh("BTools_MinimapIcon", MinimapDB)
end

local function ToggleMinimapIcon()
    MinimapDB.hide = not MinimapDB.hide

    if (MinimapDB.hide) then
        BTools:Print("Type \"/btools minimap\" to show minimap icon once again.")
    end

    LibDBI:Refresh("BTools_MinimapIcon", MinimapDB)
end

--- Called when the module is enabled
function MinimapIconUI:OnEnable()
    StdUi = BTools:GetStdUiInstance()

    ---@type DatabaseManager
    local DB = BTools:GetModule("DatabaseManager")
    MinimapDB = DB:GetMinimapSettingsTable()

    -- Todo: Decouple
    RealmLanguageInfoDB = DB:GetRealmLanguageInfoSettingsTable()

    DrawMinimapButton()

    -- Custom Events
    self:RegisterMessage(BTools.AddonEvents.ToggleMinimapIcon, ToggleMinimapIcon)
end
