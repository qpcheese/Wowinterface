local addonName, addonTable = ...
local addon = addonTable.addon
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local options = 
{
  name = " ",
  handler = addon,
  type = "group",
  childGroups = "tab",
  args = 
  {

  },
}

local basic_options = 
{
  L["optionClass"],
  L["optionBlizzard"],
  L["optionCustom"],
}
local basic_option_units 
if addonTable.isRetail then
  basic_option_units = 
  {
    [1] = "player",
    [6] = "pet",
    [7] = "boss1",
    [8] = "boss2",
    [9] = "boss3",
    [10] = "boss4",
    [11] = "boss5",
  }
else
  basic_option_units = 
  {
    [1] = "player",
    [6] = "pet",
  }
end

local extended_options = 
{
  L["optionClassReaction"],
  L["optionReaction"] ,
  L["optionClassCustom"],
  L["optionCustom"],
  L["optionClassBlizzard"],
  L["optionBlizzard"] ,
}
local extended_option_units 
if addonTable.isVanilla then
  extended_option_units = 
  {
    [2] = "target",
    [3] = "targettarget",
  }
else
  extended_option_units = 
  {
    [2] = "target",
    [3] = "targettarget",
    [4] = "focus",
    [5] = "focustarget",
  }
end

for key, unit in pairs(basic_option_units) do
  local moduleName = "HealthBarColor_" .. unit
  options.args[moduleName] = 
  {
    order = key,
    name = L[unit],
    type = "group",
    inline = true,
    args =
      {
        colorMode =
        { 
          order = 1,
          name = L["colorMode"] ,
          desc = "",
          type = "select",
          values = basic_options,
          get = "GetStatus",
          set = "SetStatus",
        },
        customColorStart = 
        {
          order = 2,
          name = L["gradientStart_name"],
          desc = L["gradientStart_desc"],
          type = "color",
          get = "GetColor",
          set = "SetColor",
          hidden = function()
            return addon.db.profile[moduleName].colorMode ~= 3 and true 
          end,
        },
        customColorEnd = 
        {
          order = 3,
          name = L["gradientEnd_name"],
          desc = L["gradientEnd_desc"],
          type = "color",
          get = "GetColor",
          set = "SetColor",
          hidden = function()
            return addon.db.profile[moduleName].colorMode ~= 3 and true 
          end,
        }
      },
    }
end

for key, unit in pairs(extended_option_units) do
  local moduleName = "HealthBarColor_" .. unit
  options.args[moduleName] = 
  {
    order = key,
    name = L[unit],
    type = "group",
    inline = true,
    args =
      {
        colorMode =
        { 
          order = 1,
          name = L["colorMode"],
          desc = "",
          type = "select",
          values = extended_options,
          get = "GetStatus",
          set = "SetStatus",
        },
        customColorStart = 
        {
          order = 2,
          name = L["gradientStart_name"],
          desc = L["gradientStart_desc"],
          type = "color",
          get = "GetColor",
          set = "SetColor",
          hidden = function()
            return not ( addon.db.profile[moduleName].colorMode == 3 or addon.db.profile[moduleName].colorMode == 4 )
          end,
        },
        customColorEnd = 
        {
          order = 3,
          name = L["gradientEnd_name"],
          desc = L["gradientEnd_desc"],
          type = "color",
          get = "GetColor",
          set = "SetColor",
          hidden = function()
            return not ( addon.db.profile[moduleName].colorMode == 3 or addon.db.profile[moduleName].colorMode == 4 )
          end,
        }
      },
    }
end

--unit specific settings
--Player
options.args.HealthBarColor_player.args["BiggerHealthBar"] = 
{
  hidden = not addonTable.isRetail,
  order = 4,
  name = L["BiggerHealthBar_name"],
  desc = L["BiggerHealthBar_desc"],
  type = "toggle",
  get = "GetModuleStatus",
  set = "SetModuleStatus",
}
options.args.HealthBarColor_player.args["HideClassPowerBar"] = 
{
  hidden = not addonTable.isRetail,
  order = 5,
  name = L["HideClassPowerBar_name"],
  desc = L["HideClassPowerBar_desc"],
  type = "toggle",
  get = "GetModuleStatus",
  set = "SetModuleStatus",
}
options.args.HealthBarColor_player.args["DebuffColor"] = 
{
  hidden = not addonTable.isRetail,
  order = 6,
  name = L["DebuffColor_name"],
  desc = L["DebuffColor_desc"],
  type = "toggle",
  get = "GetModuleStatus",
  set = "SetModuleStatus",
}

function addon:GetHealthBarsTabOptions()
  return options
end