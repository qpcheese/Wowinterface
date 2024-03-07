-----------------------------------------------------------------------------------------------------------------------
--  Title:   ThemeManager                                                                                            --
--  Author:  Zaazu                                                                                                   --
--  Date:    October 2021                                                                                            --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Manages the addon theme by setting textures, sounds and colours based on theme profiles.                --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")
---@class ThemeManager : AceConsole, AceEvent
local ThemeManager = BTools:NewModule("ThemeManager", "AceConsole-3.0", "AceEvent-3.0")
---@type StdUi
local StdUi = nil

---@class ThemeData
local DefaultTheme = {
    StdUiConfig = {
        font = {
            color = {
                normal = {r = 1, g = 1, b = 1, a = 1},
                disabled = {r = 0.55, g = 0.55, b = 0.55, a = 1},
                header = {r = 0.83, g = 0.69, b = 0.22, a = 1}
            }
        },

        backdrop = {
            texture = [[Interface\Buttons\WHITE8X8]],
            panel = {r = 0.0588, g = 0.0588, b = 0, a = 0.90},
            slider = {r = 0.15, g = 0.15, b = 0.15, a = 1},

            highlight = {r = 0.40, g = 0.40, b = 0, a = 0.5},
            button = {r = 0.20, g = 0.20, b = 0.20, a = 1},
            buttonDisabled = {r = 0.15, g = 0.15, b = 0.15, a = 1},

            border = {r = 0.15, g = 0.15, b = 0.15, a = 1},
            borderDisabled = {r = 0.40, g = 0.40, b = 0.40, a = 1}
        },

        progressBar = {color = {r = 1, g = 0.9, b = 0, a = 0.5}},

        highlight = {color = {r = 0.83, g = 0.69, b = 0.22, a = 0.4}, blank = {r = 0, g = 0, b = 0, a = 0}},

        dialog = {width = 400, height = 100, button = {width = 100, height = 20, margin = 5}},

        tooltip = {padding = 10},

        resizeHandle = {
            width = 20,
            height = 20,
            texture = {
                normal = [[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Up]],
                highlight = [[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Up]],
                pushed = [[Interface\ChatFrame\UI-ChatIM-SizeGrabber-Down]]
            }
        }
    },
    Resources = {
        textures = {Logo = nil, Icon = nil, Title = nil},
        sounds = {EasterEgg = nil},
        strings = {CommunityName = nil, CommunityWebsite = nil}
    }
}

---If the addon exists, return Theme Data
---@param addonName string
---@return ThemeData
local function GetExternalAddonTheme(addonName)
    local themeData = nil

    pcall(function()
        themeData = LibStub("AceAddon-3.0"):GetAddon(addonName):GetThemeData()
    end)

    return themeData
end

---Sets various theme components from the given theme data
---@param themeData ThemeData
function ThemeManager:SetTheme(themeData)
    local themeTextures = themeData.Resources.textures or {}
    local themeSounds = themeData.Resources.sounds or {}
    local themeStrings = themeData.Resources.strings or {}

    StdUi.config = themeData.StdUiConfig

    BTools.Resources.textures.Logo = themeTextures.Logo or BTools.Resources.textures.Logo
    BTools.Resources.textures.Icon = themeTextures.Icon or BTools.Resources.textures.Icon
    BTools.Resources.textures.Title = themeTextures.Title or BTools.Resources.textures.Title

    BTools.Resources.sounds.EasterEgg = themeSounds.EasterEgg or BTools.Resources.sounds.EasterEgg

    BTools.Resources.strings.CommunityName = themeStrings.CommunityName or BTools.Resources.strings.CommunityName
    BTools.Resources.strings.CommunityWebsite = themeStrings.CommunityWebsite or BTools.Resources.strings.CommunityWebsite
end

function ThemeManager:AutoSetTheme()
    local themeAddons = {
        {FolderName = "BloodlustTools", Ace3Name = "BToolsBL"},
        {FolderName = "GoldenLotusTools", Ace3Name = "BToolsGL"}
    }

    local themes = {}

    for _, v in pairs(themeAddons) do
        LoadAddOn(v.FolderName)
        table.insert(themes, GetExternalAddonTheme(v.Ace3Name))
    end

    if (#themes == 1) then
        self:SetTheme(themes[1])
    else
        self:SetTheme(DefaultTheme)

        if (#themes > 1) then
            -- Disable themes
            for _, v in pairs(themeAddons) do
                DisableAddOn(v.FolderName)
            end

            self:Print(
                "Boosting Tools does not support multiple community themes. Please choose one community theme and reload.")
        end
    end
end

---Called when the module is loaded
function ThemeManager:OnInitialize()
    StdUi = BTools:GetStdUiInstance()

    self:AutoSetTheme()
end
