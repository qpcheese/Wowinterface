local addonName, addonTable = ...
local addon = addonTable.addon
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local Media = LibStub("LibSharedMedia-3.0")
local fonts = Media:List("font")

local dropdDownWidth = 1.76
local options = 
{
  name = " ",
  handler = addon,
  type = "group",
  childGroups = "select",
  args = 
  {
    UniversalFontSettings = 
    {
      order = 0,
      name = "",
      type = "group",
      inline = true,
      args =
      {
        --Font selection dropdowns
      },
    },
    newline = 
    {
      order = 0.1,
      type = "description",
      name = "",
    },
    --Font module entrys here
  },
}

--Font modules
local fontModules = {}
if addonTable.isRetail then
  fontModules = 
  {
    "Font_player",
    "Font_pet",
    "Font_target",
    "Font_targettarget",
    "Font_focus",
    "Font_focustarget",
    "Font_boss1",
    "Font_boss2",
    "Font_boss3",
    "Font_boss4",
    "Font_boss5",
  }
elseif addonTable.isWrath then
  fontModules = 
  {
    "Font_player",
    "Font_pet",
    "Font_target",
    "Font_targettarget",
    "Font_focus",
    "Font_focustarget",
  }
else
  fontModules = 
  {
    "Font_player",
    "Font_pet",
    "Font_target",
    "Font_targettarget",
  }
end

local fontTypes = 
{
  "nameFont",
  "healthFont",
  "powerFont",
}
--create font and outline selection dropdowns
for k, fontType in pairs(fontTypes) do
  options.args.UniversalFontSettings.args[fontType] = 
  {
    order = k,
    type = "select",
    name = L[fontType],
    values = fonts,
    get = function()
      for i, v in next, fonts do
        if v == addon.db.profile.Font_player[fontType] then 
          return i 
        end
      end
    end,
    set = function(_, value)
      for _, module in pairs(fontModules) do
        addon.db.profile[module][fontType] = fonts[value]
        addon:ReloadModule(module)
      end
    end,
    itemControl = "DDI-Font",
    width = dropdDownWidth,
  }
  local fontTypeOutlineMode = fontType .. "OutlineMode"
  options.args.UniversalFontSettings.args[fontTypeOutlineMode] = 
  {
    order = k + #fontTypes,
    name = L["outlineMode"],
    type = "select",
    values = {"None", "Outline", "Thick Outline", "Monochrome", "Monochrome Outline", "Monochrome Thick Outline"},
    sorting = {1,2,3,4,5,6},
    get = function()
      return addon.db.profile.Font_player[fontTypeOutlineMode]
    end,
    set = function(_, value)
      for _, module in pairs(fontModules) do
        addon.db.profile[module][fontTypeOutlineMode] = value
        addon:ReloadModule(module)
      end
    end,
    width = dropdDownWidth,
  }
end

--create units individual font settings
for k, module in pairs(addonTable.fontModules) do 
  options.args[module] =
  {
    order = k,
    name = L[string.gsub(module, "Font_", "")],
    type = "group",
    args =
    {
      nameFontSize = 
      {
        name = L["nameFontSize"],
        order = 1,
        type = "range",
        get = "GetStatus",
        set = "SetStatus",
        min = 1,
        max = 40,
        step = 1,
      },
      healthFontSize = 
      {
        name = L["healthFontSize"],
        order = 2,
        type = "range",
        get = "GetStatus",
        set = "SetStatus",
        min = 1,
        max = 40,
        step = 1,
      },
      powerFontSize = 
      {
        name = L["powerFontSize"],
        order = 3,
        type = "range",
        get = "GetStatus",
        set = "SetStatus",
        min = 1,
        max = 40,
        step = 1,
      },
      newline1 = 
      {
        order = 3.2,
        type = "description",
        name = "",
      },
      newline2 = 
      {
        order = 5.1,
        type = "description",
        name = "",
      },
      --  <--extended/basic color optios see below
      newline3 = 
      {
        order = 7.1,
        type = "description",
        name = "",
      },
      colorModePower = 
      {
        name = "color power",
        order = 8,
        type = "select",
        values = {L["optionCustom"], L["optionPower"]},
        sorting = {1,2},
        get = "GetStatus",
        set = "SetStatus",
      },
      customColorPower = 
      {
        hidden = function()
          return addon.db.profile[module].colorModePower ~= 1 and true or false
        end,
        name = L["colorPicker_name"],
        order = 8.1,
        type = "color",
        get = "GetColor",
        set = "SetColor",
      },
      newline4 = 
      {
        order = 9,
        type = "description",
        name = "",
      },
    },
  }
  if module:match("target") or module:match("focus") then --extended color options (threat based coloring)
    options.args[module].args.colorModeName =
    {
      name = "color name",
      order = 4,
      type = "select",
      values = {L["optionClassReaction"], L["optionReaction"], L["optionClassCustom"], L["optionCustom"]},
      sorting = {1,2,3,4},
      get = "GetStatus",
      set = "SetStatus",
    }
    options.args[module].args.customColorName = 
    {
      hidden = function()
        local colorMode = addon.db.profile[module].colorModeName
        if colorMode == 3 or colorMode == 4 then
          return false
        else
          return true
        end
      end,
      name = L["colorPicker_name"],
      order = 5,
      type = "color",
      get = "GetColor",
      set = "SetColor",
    }
    options.args[module].args.colorModeHealth =
    {
      name = "color health",
      order = 6,
      type = "select",
      values = {L["optionClassReaction"], L["optionReaction"], L["optionClassCustom"], L["optionCustom"]},
      sorting = {1,2,3,4},
      get = "GetStatus",
      set = "SetStatus",
    }
    options.args[module].args.customColorHealth = 
    {
      hidden = function()
        local colorMode = addon.db.profile[module].colorModeHealth
        if colorMode == 3 or colorMode == 4 then
          return false
        else
          return true
        end
      end,
      name = L["colorPicker_name"],
      order = 7,
      type = "color",
      get = "GetColor",
      set = "SetColor",
    }
  else
    options.args[module].args.colorModeName =
    {
      name = "color name",
      order = 4,
      type = "select",
      values = {L["optionClass"], L["optionCustom"]},
      sorting = {1,2},
      get = "GetStatus",
      set = "SetStatus",
    }
    options.args[module].args.customColorName = 
    {
      hidden = function()
        return addon.db.profile[module].colorModeName ~= 2 or false
      end,
      name = L["colorPicker_name"],
      order = 5,
      type = "color",
      get = "GetColor",
      set = "SetColor",
    }
    options.args[module].args.colorModeHealth =
    {
      name = "color health",
      order = 6,
      type = "select",
      values = {L["optionClass"], L["optionCustom"]},
      sorting = {1,2},
      get = "GetStatus",
      set = "SetStatus",
    }
    options.args[module].args.customColorHealth = 
    {
      hidden = function()
        return addon.db.profile[module].colorModeHealth ~= 2 or false
      end,
      name = L["colorPicker_name"],
      order = 7,
      type = "color",
      get = "GetColor",
      set = "SetColor",
    }
  end
  if module == "Font_player" and addonTable.isRetail then
    options.args[module].args.alternatePowerFontSize = 
    {
      name = L["alternatePowerFontSize"],
      order = 3.1,
      type = "range",
      get = "GetStatus",
      set = "SetStatus",
      min = 1,
      max = 40,
      step = 1,
    }
    --[[
      -- TODO implement alternate power type
    options.args[module].args.colorModeAlternatePower = 
    {
      name = "color alternate power",
      order = 10,
      type = "select",
      values = {L["optionCustom"], L["optionPower"]},
      sorting = {1,2},
      get = "GetStatus",
      set = "SetStatus",
    }
    ]]
    options.args[module].args.customColorAlternatePower = 
    {
      --[[
      hidden = function()
        return addon.db.profile[module].colorModeAlternatePower ~= 1 and true or false
      end,
      ]]
      name = L["alterNatePowerFontColor"],
      order = 10.1,
      type = "color",
      get = "GetColor",
      set = "SetColor",
    }
  end
end



function addon:GetFontsTabOptions()
  return options
end
