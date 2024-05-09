local addonName, addonTable = ...
local addon = addonTable.addon
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local Media = LibStub("LibSharedMedia-3.0")
local statusbars = Media:HashTable("statusbar")

local moduleToggleWidth = 0.95

local options = {
  name = " ",
  handler = addon,
  type = "group",
  inline = true,
  args =
  {
    modules =
    {
      order = 0,
      name = L["enabledModules"],
      type = "group",
      inline = true,
      args =
      {
        Textures =
        {
          order = 1,
          name = L["Textures_name"],
          desc = L["Textures_desc"],
          type = "toggle",
          get = "GetModuleStatus",
          set = "SetModuleStatus",
          width = moduleToggleWidth,
        },
        Fonts =
        {
          order = 2,
          name = L["font_module_name"],
          desc = L["font_module_desc"],
          type = "toggle",
          get = function()
            return addon.db.profile.Font_player.enabled
          end,
          set = function(_, value)
            for _, module in pairs(addonTable.fontModules) do
              addon.db.profile[module].enabled = value
              if value == true then
                addon:EnableModule(module)
              else
                addon:DisableModule(module)
              end
            end
            addon:UpdateOptionsFrameTabs()
          end,
          width = moduleToggleWidth,
        },
        Overabsorbs =
        {
          order = 3,
          hidden = not addonTable.isRetail,
          name = L["Overabsorbs_name"],
          desc = L["Overabsorbs_desc"],
          type = "toggle",
          get = "GetModuleStatus",
          set = "SetModuleStatus",
          width = moduleToggleWidth,
        },
        BackgroundTextures =
        {
          order = 4,
          name = L["BackgroundTextures_name"],
          desc = L["BackgroundTextures_desc"],
          type = "toggle",
          get = "GetModuleStatus",
          set = "SetModuleStatus",
          width = moduleToggleWidth,
        },
        BetterBossFrames =
        {
          hidden = not addonTable.isRetail,
          order = 5,
          name = L["BetterBossFrames_name"],
          desc = L["BetterBossFrames_desc"],
          type = "toggle",
          get = "GetModuleStatus",
          set = "SetModuleStatus",
          width = moduleToggleWidth,
        },
        Glow =
        {
          hidden = not addonTable.isRetail,
          order = 6,
          name = L["Glow_name"],
          desc = L["Glow_desc"],
          type = "toggle",
          get = function()
            return addon.db.profile.Glow_player.enabled or addon.db.profile.Glow_target.enabled or addon.db.profile.Glow_focus.enabled
          end,
          set = function(_, value)
            addon.db.profile.Glow_player.enabled = value
            addon.db.profile.Glow_target.enabled = value
            addon.db.profile.Glow_focus.enabled = value
            if value == false then
              addon:DisableModule("Glow_player")
              addon:DisableModule("Glow_target")
              addon:DisableModule("Glow_focus")
            else
              addon:EnableModule("Glow_player")
              addon:EnableModule("Glow_target")
              addon:EnableModule("Glow_focus")
            end
          end,
          width = moduleToggleWidth,
        },
        DarkFrames =
        {
          order = 7,
          name = L["DarkFrames_name"],
          desc = L["DarkFrames_desc"],
          type = "toggle",
          get = "GetModuleStatus",
          set = "SetModuleStatus",
          width = moduleToggleWidth,
        },
        BiggerHealthBars =
        {
          hidden = not addonTable.isClassic,
          order = 8,
          name = L["BiggerHealthBars_name"],
          desc = L["BiggerHealthBars_desc"],
          type = "toggle",
          get = "GetModuleStatus",
          set = "SetModuleStatus",
          width = moduleToggleWidth,
        },
        PartyColor =
        {
          hidden = not addonTable.isRetail,
          order = 9,
          name = L["PartyColor_name"],
          desc = L["PartyColor_desc"],
          type = "toggle",
          get = "GetModuleStatus",
          set = "SetModuleStatus",
          width = moduleToggleWidth,
        },
        MinimapButton =
        {
          order = 20,
          name = L["MinimapButton_name"],
          desc = L["MinimapButton_desc"],
          type = "toggle",
          get = "GetModuleStatus",
          set = "SetModuleStatus",
          width = moduleToggleWidth,
        },
      },
    },
    Textures =
    {
      hidden = function()
          return not addon:IsModuleEnabled("Textures")
      end,
      order = 1,
      name = L["Textures_name"],
      type = "group",
      inline = true,
      args =
      {
        healthBarTexture =
        {
          order = 1,
          type = "select",
          name = L["Texture"],
          values = statusbars,
          get = "GetStatus",
          set = "SetStatus",
          dialogControl = "LSM30_Statusbar",
          width = 1.8,
        },
        powerBarTexture =
        {
          order = 2,
          type = "select",
          name = L["Texture"],
          values = statusbars,
          get = "GetStatus",
          set = "SetStatus",
          dialogControl = "LSM30_Statusbar",
          width = 1.8,
        },
        excludePowerBar =
        {
          order = 3,
          type = "toggle",
          name = L["excludePowerBar_name"],
          desc = L["excludePowerBar_desc"],
          get = function()
            return addon.db.profile.Textures.excludePowerBar
          end,
          set = function(_, value)
            addon.db.profile.Textures.excludePowerBar = value
            addon:ReloadModule("Textures")
          end,
          width = 0.5,
        },
      },
    },
    Glow =
    {
      hidden = function()
        return ( not addon:IsModuleEnabled("Glow_player") and not addon:IsModuleEnabled("Glow_target") and not addon:IsModuleEnabled("Glow_focus") ) or not addonTable.isRetail
      end,
      order = 2,
      name = L["Glow_name"],
      type = "group",
      inline = true,
      args =
      {
        Glow_player_colorModeGlow =
        {
          order = 1,
          name = L["player"],
          desc = " ",
          type = "select",
          values = {L["optionClass"],L["optionCustom"],L["hideOption"]},
          sorting = {1,2,3},
          get = function()
            return addon.db.profile.Glow_player.colorModeGlow
          end,
          set = function(_, value)
            addon.db.profile.Glow_player.colorModeGlow = value
            addon:ReloadModule("Glow_player")
          end,
        },
        Glow_player_customColorGlow =
        {
          order = 2,
          name = L["colorPicker_name"],
          desc = L["colorPicker_desc"],
          type = "color",
          get = function(info)
            return addon:GetColor(_, "Glow_player", "customColorGlow")
          end,
          set = function(info, r, g, b, a)
            return addon:SetColor(_, r, g, b, a, "Glow_player", "customColorGlow")
          end,
          hidden = function()
            return not ( addon.db.profile.Glow_player.colorModeGlow == 2 )
          end,
          width = 0.5,
        },
        Glow_target_colorModeGlow =
        {
          order = 3,
          name = L["target"],
          desc = " ",
          type = "select",
          values = {L["optionClassReaction"],L["optionReaction"],L["optionClassCustom"],L["optionCustom"],L["hideOption"]},
          sorting = {1,2,3,4,5},
          get = function()
            return addon.db.profile.Glow_target.colorModeGlow
          end,
          set = function(_, value)
            addon.db.profile.Glow_target.colorModeGlow = value
            addon:ReloadModule("Glow_target")
          end,
        },
        Glow_target_customColorGlow =
        {
          order = 4,
          name = L["colorPicker_name"],
          desc = " ",
          type = "color",
          get = function(info)
            return addon:GetColor(_, "Glow_target", "customColorGlow")
          end,
          set = function(info, r, g, b, a)
            return addon:SetColor(_, r, g, b, a, "Glow_target", "customColorGlow")
          end,
          hidden = function()
            return not ( addon.db.profile.Glow_target.colorModeGlow == 3 or addon.db.profile.Glow_target.colorModeGlow == 4 )
          end,
          width = 0.5,
        },
        Glow_focus_colorModeGlow =
        {
          order = 5,
          name = L["focus"],
          desc = " ",
          type = "select",
          values = {L["optionClassReaction"],L["optionReaction"],L["optionClassCustom"],L["optionCustom"],L["hideOption"]},
          sorting = {1,2,3,4,5},
          get = function()
            return addon.db.profile.Glow_focus.colorModeGlow
          end,
          set = function(_, value)
            addon.db.profile.Glow_focus.colorModeGlow = value
            addon:ReloadModule("Glow_focus")
          end,
        },
        Glow_focus_customColorGlow =
        {
          order = 6,
          name = L["colorPicker_name"],
          desc = " ",
          type = "color",
          get = function(info)
            return addon:GetColor(_, "Glow_focus", "customColorGlow")
          end,
          set = function(info, r, g, b, a)
            return addon:SetColor(_, r, g, b, a, "Glow_focus", "customColorGlow")
          end,
          hidden = function()
            return not ( addon.db.profile.Glow_focus.colorModeGlow == 3 or addon.db.profile.Glow_focus.colorModeGlow == 4 )
          end,
          width = 0.5,
        },
      },
    },
    BackgroundTextures =
    {
      hidden = function()
        return not addon:IsModuleEnabled("BackgroundTextures")
      end,
      order = 3,
      name = L["BackgroundTextures_name"],
      type = "group",
      inline = true,
      args =
      {
        texture =
        {
          order = 1,
          type = "select",
          name = L["Texture"],
          values = statusbars,
          get = "GetStatus",
          set = "SetStatus",
          dialogControl = "LSM30_Statusbar",
          width = 1.8,
        },
        color =
        {
          order = 2,
          name = L["colorPicker_name"],
          type = "color",
          get = "GetColor",
          set = "SetColor",
          hasAlpha = true,
        },
      },
    },
  },
}

function addon:GetModulesTabOptions()
    return options
end
