-----------------------------------------------------------------------------------------------------------------------
--  Title:   Resources                                                                                               --
--  Author:  Zaazu                                                                                                   --
--  Date:    October 2021                                                                                            --
--  Website: https://zaazu.dev                                                                                       --
--  About:   Resource table containing textures, sounds and helper functions.                                        --
-----------------------------------------------------------------------------------------------------------------------
---@type BTools
local BTools = LibStub("AceAddon-3.0"):GetAddon("BTools")

---@class Resources
BTools.Resources = {
    textures = {
        Logo = [[Interface\AddOns\BoostingTools\Media\Textures\Logo.tga]],
        Icon = [[Interface\AddOns\BoostingTools\Media\Textures\Icon.tga]],
        Title = [[Interface\AddOns\BoostingTools\Media\Textures\Title.tga]],

        TradeGive = [[Interface\AddOns\BoostingTools\Media\Textures\TradeGiveIcon.tga]],
        TradeReceive = [[Interface\AddOns\BoostingTools\Media\Textures\TradeReceiveIcon.tga]],

        CoinStack = [[Interface\AddOns\BoostingTools\Media\Textures\CoinStack.tga]],
        LootBag = [[Interface\AddOns\BoostingTools\Media\Textures\LootBag.tga]],
        Trash = [[Interface\AddOns\BoostingTools\Media\Textures\Trash.tga]],

        MailIcon = [[Interface\AddOns\BoostingTools\Media\Textures\MailIcon.tga]],
        TradeIcon = [[Interface\AddOns\BoostingTools\Media\Textures\TradeIcon.tga]],
        SettingsIcon = [[Interface\AddOns\BoostingTools\Media\Textures\SettingsIcon.tga]],
        HideIcon = [[Interface\AddOns\BoostingTools\Media\Textures\HideIcon.tga]],
        InfoIcon = [[Interface\AddOns\BoostingTools\Media\Textures\InfoIcon.tga]],

        Check = [[Interface\AddOns\BoostingTools\Media\Textures\Check.tga]],
        Cross = [[Interface\AddOns\BoostingTools\Media\Textures\Cross.tga]],
        Warning = [[Interface\AddOns\BoostingTools\Media\Textures\Warning.tga]],
        
        PadlockLocked = [[Interface\AddOns\BoostingTools\Media\Textures\Lock.tga]],
        PadlockUnlocked = [[Interface\AddOns\BoostingTools\Media\Textures\Unlock.tga]],

        EditIcon = [[Interface\AddOns\BoostingTools\Media\Textures\EditIcon.tga]],

        LanguageIcon = [[Interface\AddOns\BoostingTools\Media\Textures\LanguageIcon.tga]],

        FlagBR = [[Interface\AddOns\BoostingTools\Media\Textures\Flags\FlagBR.tga]],
        FlagAU = [[Interface\AddOns\BoostingTools\Media\Textures\Flags\FlagAU.tga]],
        FlagMX = [[Interface\AddOns\BoostingTools\Media\Textures\Flags\FlagMX.tga]],
        FlagUS = [[Interface\AddOns\BoostingTools\Media\Textures\Flags\FlagUS.tga]],


        FlagGB = [[Interface\AddOns\BoostingTools\Media\Textures\Flags\FlagGB.tga]],
        FlagDE = [[Interface\AddOns\BoostingTools\Media\Textures\Flags\FlagDE.tga]],
        FlagES = [[Interface\AddOns\BoostingTools\Media\Textures\Flags\FlagES.tga]],
        FlagFR = [[Interface\AddOns\BoostingTools\Media\Textures\Flags\FlagFR.tga]],
        FlagIT = [[Interface\AddOns\BoostingTools\Media\Textures\Flags\FlagIT.tga]],
        FlagPT = [[Interface\AddOns\BoostingTools\Media\Textures\Flags\FlagPT.tga]],
        FlagRU = [[Interface\AddOns\BoostingTools\Media\Textures\Flags\FlagRU.tga]],
    },

    sounds = {
        EasterEgg = 144100,
        OpenWindow = 603,
        CloseWindow = 604,
        OpenErrorPopup = 682,
        CloseErrorPopup = 89,
        ToggleMinimapButton = 1115
    },

    strings = {
        CommunityName = "Booosting Tools",
        CommunityWebsite = "https://zaazu.dev/"
    },

    ---Returns a formatted texture string for the given texture name
    ---@param texture string
    ---@param size number
    ---@param r number
    ---@param g number
    ---@param b number
    ---@return string
    getFormattedTextureString = function(texture, size, r, g, b)
        size = size or 0
        r = r or 255
        g = g or 255
        b = b or 255

        return string.format([[|T%s:%2$d:%2$d:::%2$d:%2$d::%2$d::%2$d:%d:%d:%d|t]], texture, size, r, g, b)
    end
}
