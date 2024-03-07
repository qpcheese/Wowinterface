local addonName, addonTable = ...
local addon = addonTable.addon

--[[
  HealthBars:
    colorModes basic:
    1 = class
    2 = blizzard green (has no effect when also playing with custom textures and will then just default to 0,1,0)
    3 = custom
    colorModes extended:
    1 = class/reaction
    2 = reaction
    3 = class/custom
    4 = custom
    5 = class/blizzard green (has no effect when also playing with custom textures and will then just default to 0,1,0)
    6 = blizzard green (has no effect when also playing with custom textures and will then just default to 0,1,0)
  Fonts: 
    name/health colorModes basic:
    1 = class
    2 = custom 
    name/health colorModes extended:
    1 = class/reaction
    2 = reaction
    3 = class/custom
    4 = custom
    power 
    1 = custom
    2 = power
]]

local defaults = {
  profile = 
  {
    ["**"] = 
    {
      --HealthBars
      enabled = false,
      colorMode = 1,
      customColor = 
      {
        r = 1,
        g = 1,
        b = 1,
        a = 1,
      },
      customColorStart = 
      {
        r = 0,
        g = 0,
        b = 0,
        a = 1,
      },
      customColorEnd = 
      {
        r = 1,
        g = 1,
        b = 1,
        a = 1,
      },
      --Fonts
      nameFont = "Friz Quadrata TT",
      nameFontSize = 12,
      nameFontOutlineMode = 2,
      colorModeName = 2,
      customColorName = 
      {
        r = 1,
        g = 1,
        b = 1,
        a = 1,
      },
      healthFont = "Friz Quadrata TT",
      healthFontSize = 12,
      healthFontOutlineMode = 2,
      colorModeHealth = 2,
      customColorHealth = 
      {
        r = 1,
        g = 1,
        b = 1,
        a = 1,
      },
      powerFont = "Friz Quadrata TT",
      powerFontSize = 10,
      powerFontOutlineMode = 2,
      colorModePower = 1,
      customColorPower = 
      {
        r = 1,
        g = 1,
        b = 1,
        a = 1,
      },
      --Glow
      colorModeGlow = 1,
      customColorGlow =         
      {
        r = 1,
        g = 1,
        b = 1,
        a = 1,
      },
    },
    HealthBarColor_player = 
    {
      enabled = true,
    },
    HealthBarColor_pet = 
    {
      enabled = true,
      colorMode = 2,
    },
    HealthBarColor_target = 
    {
      enabled = true,
    },
    HealthBarColor_targettarget = 
    {
      enabled = true,
    },
    HealthBarColor_focus = 
    {
      enabled = true,
    },
    HealthBarColor_focustarget = 
    {
      enabled = true,
    },
    HealthBarColor_boss1 = 
    {
      enabled = true,
      colorMode = 3,
      customColorStart = 
      {
        r = 1,
        g = 0,
        b = 0,
        a = 1,
      },
      customColorEnd = 
      {
        r = 1,
        g = 0,
        b = 0,
        a = 1,
      },
    },
    HealthBarColor_boss2 = 
    {
      enabled = true,
      colorMode = 3,
      customColorStart = 
      {
        r = 1,
        g = 0,
        b = 0,
        a = 1,
      },
      customColorEnd = 
      {
        r = 1,
        g = 0,
        b = 0,
        a = 1,
      },
    },
    HealthBarColor_boss3 = 
    {
      enabled = true,
      colorMode = 3,
      customColorStart = 
      {
        r = 1,
        g = 0,
        b = 0,
        a = 1,
      },
      customColorEnd = 
      {
        r = 1,
        g = 0,
        b = 0,
        a = 1,
      },
    },
    HealthBarColor_boss4 = 
    {
      enabled = true,
      colorMode = 3,
      customColorStart = 
      {
        r = 1,
        g = 0,
        b = 0,
        a = 1,
      },
      customColorEnd = 
      {
        r = 1,
        g = 0,
        b = 0,
        a = 1,
      },
    },
    HealthBarColor_boss5 = 
    {
      enabled = true,
      colorMode = 3,
      customColorStart = 
      {
        r = 1,
        g = 0,
        b = 0,
        a = 1,
      },
      customColorEnd = 
      {
        r = 1,
        g = 0,
        b = 0,
        a = 1,
      },
    },
    Font_target = 
    {
      colorModeName = 4,
      colorModeHealth = 4,
    },
    Font_targettarget = 
    {
      colorModeName = 4,
      colorModeHealth = 4,
    },
    Font_focus = 
    {
      colorModeName = 4,
      colorModeHealth = 4,
    },
    Font_focustarget = 
    {
      colorModeName = 4,
      colorModeHealth = 4,
    },
    MinimapButton = 
    {
      enabled = true,
    },
    Textures = 
    {
      healthBarTexture = "Solid",
      excludePowerBar = false,
      powerBarTexture = "Solid",
    },
    BackgroundTextures = 
    {
      texture = "Solid",
      color = 
      {
        r = 0,
        g = 0,
        b = 0,
        a = 1,
      }
    },
    BiggerHealthBars = 
    {
      enabled = true,
    },
    addonColors =
    {
      classColors =
      {
        ["DEATHKNIGHT"] = 
        {
          classColor = 
          {
            r = 0.77,
            g = 0.12,
            b = 0.23,
            a = 1,
          },
          classColorStart = 
          {
            r = 0.77,
            g = 0.12,
            b = 0.23,
            a = 1,
          },
          classColorEnd = 
          {
            r = 0.77,
            g = 0.12,
            b = 0.23,
            a = 1,
          },
        },
        ["DEMONHUNTER"] = 
        {
          classColor = 
          {
            r = 0.64,
            g = 0.19,
            b = 0.79,
            a = 1,
          },
          classColorStart = 
          {
            r = 0.64,
            g = 0.19,
            b = 0.79,
            a = 1,
          },
          classColorEnd = 
          {
            r = 0.64,
            g = 0.19,
            b = 0.79,
            a = 1,
          },
        },
        ["DRUID"] = 
        {
          classColor = 
          {
            r = 1,
            g = 0.49,
            b = 0.04,
            a = 1,
          },
          classColorStart = 
          {
            r = 1,
            g = 0.49,
            b = 0.04,
            a = 1,
          },
          classColorEnd = 
          {
            r = 1,
            g = 0.49,
            b = 0.04,
            a = 1,
          },
        },
        ["EVOKER"] = 
        {
          classColor = 
          {
            r = 0.20,
            g = 0.58,
            b = 0.50,
            a = 1,
          },
          classColorStart = 
          {
            r = 0.20,
            g = 0.58,
            b = 0.50,
            a = 1,
          },
          classColorEnd = 
          {
            r = 0.20,
            g = 0.58,
            b = 0.50,
            a = 1,
          },
        },
        ["HUNTER"] = 
        {
          classColor = 
          {
            r = 0.67,
            g = 0.83,
            b = 0.45,
            a = 1,
          },
          classColorStart = 
          {
            r = 0.67,
            g = 0.83,
            b = 0.45,
            a = 1,
          },
          classColorEnd = 
          {
            r = 0.67,
            g = 0.83,
            b = 0.45,
            a = 1,
          },
        },
        ["MAGE"] = 
        {
          classColor = 
          {
            r = 0.25,
            g = 0.78,
            b = 0.92,
            a = 1,
          },
          classColorStart = 
          {
            r = 0.25,
            g = 0.78,
            b = 0.92,
            a = 1,
          },
          classColorEnd = 
          {
            r = 0.25,
            g = 0.78,
            b = 0.92,
            a = 1,
          },
        },
        ["MONK"] = 
        {
          classColor = 
          {
            r = 0,
            g = 1,
            b = 0.60 ,
            a = 1,
          },
          classColorStart = 
          {
            r = 0,
            g = 1,
            b = 0.60 ,
            a = 1,
          },
          classColorEnd = 
          {
            r = 0,
            g = 1,
            b = 0.60 ,
            a = 1,
          },
        },
        ["PALADIN"] = 
        {
          classColor = 
          {
            r = 0.96,
            g = 0.55,
            b = 0.73,
            a = 1,
          },
          classColorStart = 
          {
            r = 0.96,
            g = 0.55,
            b = 0.73,
            a = 1,
          },
          classColorEnd = 
          {
            r = 0.96,
            g = 0.55,
            b = 0.73,
            a = 1,
          },
        },
        ["PRIEST"] = 
        {
          classColor = 
          {
            r = 1,
            g = 1,
            b = 1,
            a = 1,
          },
          classColorStart = 
          {
            r = 1,
            g = 1,
            b = 1,
            a = 1,
          },
          classColorEnd = 
          {
            r = 1,
            g = 1,
            b = 1,
            a = 1,
          },
        },
        ["ROGUE"] = 
        {
          classColor = 
          {
            r = 1,
            g = 0.96,
            b = 0.41,
            a = 1,
          },
          classColorStart = 
          {
            r = 1,
            g = 0.96,
            b = 0.41,
            a = 1,
          },
          classColorEnd = 
          {
            r = 1,
            g = 0.96,
            b = 0.41,
            a = 1,
          },
        },
        ["SHAMAN"] = 
        {
          classColor = 
          {
            r = 0,
            g = 0.44,
            b = 0.87,
            a = 1,
          },
          classColorStart = 
          {
            r = 0,
            g = 0.44,
            b = 0.87,
            a = 1,
          },
          classColorEnd = 
          {
            r = 0,
            g = 0.44,
            b = 0.87,
            a = 1,
          },
        },
        ["WARLOCK"] = 
        {
          classColor = 
          {
            r = 0.53,
            g = 0.53,
            b = 0.93,
            a = 1,
          },
          classColorStart = 
          {
            r = 0.53,
            g = 0.53,
            b = 0.93,
            a = 1,
          },
          classColorEnd = 
          {
            r = 0.53,
            g = 0.53,
            b = 0.93,
            a = 1,
          },
        },
        ["WARRIOR"] = 
        {
          classColor = 
          {
            r = 0.78,
            g = 0.61,
            b = 0.43,
            a = 1,
          },
          classColorStart = 
          {
            r = 0.78,
            g = 0.61,
            b = 0.43,
            a = 1,
          },
          classColorEnd = 
          {
            r = 0.78,
            g = 0.61,
            b = 0.43,
            a = 1,
          },
        },
      },
      reactionColors = 
      {
        ["Hostile"] =
        {
          reactionColor =
          {
            r = 1,  
            g = 0,
            b = 0,
            a = 1,
          },
          reactionColorStart =
          {
            r = 1,  
            g = 0,
            b = 0,
            a = 1,
          },
          reactionColorEnd =
          {
            r = 1,  
            g = 0,
            b = 0,
            a = 1,
          },
        },
        ["Neutral"] =
        {
          reactionColor =
          {
            r = 1,  
            g = 1,
            b = 0,
            a = 1,
          },
          reactionColorStart =
          {
            r = 1,  
            g = 1,
            b = 0,
            a = 1,
          },
          reactionColorEnd =
          {
            r = 1,  
            g = 1,
            b = 0,
            a = 1,
          },
        },
        ["Friendly"] =
        {
          reactionColor =
          {
            r = 0,  
            g = 1,
            b = 0,
            a = 1,
          },
          reactionColorStart =
          {
            r = 0,  
            g = 1,
            b = 0,
            a = 1,
          },
          reactionColorEnd =
          {
            r = 0,  
            g = 1,
            b = 0,
            a = 1,
          },
        },
      },
      powerColors = 
      {
        ["MANA"] =
        {
          powerColor =
          {
            r = 0,  
            g = 0,
            b = 1,
            a = 1,
          },
          powerColorStart =
          {
            r = 0,  
            g = 0,
            b = 1,
            a = 1,
          },
          powerColorEnd =
          {
            r = 0,  
            g = 0,
            b = 1,
            a = 1,
          },
        },
        ["RAGE"] =
        {
          powerColor =
          {
            r = 1,  
            g = 0,
            b = 0,
            a = 1,
          },
          powerColorStart =
          {
            r = 1,  
            g = 0,
            b = 0,
            a = 1,
          },
          powerColorEnd =
          {
            r = 1,  
            g = 0,
            b = 0,
            a = 1,
          },
        },
        ["FOCUS"] =
        {
          powerColor =
          {
            r = 1,  
            g = 0.5,
            b = 0.25,
            a = 1,
          },
          powerColorStart =
          {
            r = 1,  
            g = 0.5,
            b = 0.25,
            a = 1,
          },
          powerColorEnd =
          {
            r = 1,  
            g = 0.5,
            b = 0.25,
            a = 1,
          },
        },
        ["ENERGY"] =
        {
          powerColor =
          {
            r = 1,  
            g = 1,
            b = 0,
            a = 1,
          },
          powerColorStart =
          {
            r = 1,  
            g = 1,
            b = 0,
            a = 1,
          },
          powerColorEnd =
          {
            r = 1,  
            g = 1,
            b = 0,
            a = 1,
          },
        },
        ["RUNIC_POWER"] =
        {
          powerColor =
          {
            r = 0,  
            g = 0.82,
            b = 1,
            a = 1,
          },
          powerColorStart =
          {
            r = 0,  
            g = 0.82,
            b = 1,
            a = 1,
          },
          powerColorEnd =
          {
            r = 0,  
            g = 0.82,
            b = 1,
            a = 1,
          },
        },
        ["LUNAR_POWER"] =
        {
          powerColor =
          {
            r = 0.3,  
            g = 0.52,
            b = 0.9,
            a = 1,
          },
          powerColorStart =
          {
            r = 0.3,  
            g = 0.52,
            b = 0.9,
            a = 1,
          },
          powerColorEnd =
          {
            r = 0.3,  
            g = 0.52,
            b = 0.9,
            a = 1,
          },
        },
        ["MAELSTROM"] =
        {
          powerColor =
          {
            r = 0,  
            g = 0.5,
            b = 1,
            a = 1,
          },
          powerColorStart =
          {
            r = 0,  
            g = 0.5,
            b = 1,
            a = 1,
          },
          powerColorEnd =
          {
            r = 0,  
            g = 0.5,
            b = 1,
            a = 1,
          },
        },
        ["FURY"] =
        {
          powerColor =
          {
            r = 0.788,  
            g = 0.259,
            b = 0.992 ,
            a = 1,
          },
          powerColorStart =
          {
            r = 0.788,  
            g = 0.259,
            b = 0.992 ,
            a = 1,
          },
          powerColorEnd =
          {
            r = 0.788,  
            g = 0.259,
            b = 0.992 ,
            a = 1,
          },
        },
        ["INSANITY"] =
        {
          powerColor =
          {
            r = 0.4,  
            g = 0,
            b = 0.8,
            a = 1,
          },
          powerColorStart =
          {
            r = 0.4,  
            g = 0,
            b = 0.8,
            a = 1,
          },
          powerColorEnd =
          {
            r = 0.4,  
            g = 0,
            b = 0.8,
            a = 1,
          },
        },
      },
      debuffColors = 
      {
        ["Curse"] =
        {
          debuffColor =
          {
            r=0.6,
            g=0.0,
            b=1.0,
            a=1.0,
          },
          debuffColorStart =
          {
            r=0.6,
            g=0.0,
            b=1.0,
            a=1.0,
          },
          debuffColorEnd =
          {
            r=0.6,
            g=0.0,
            b=1.0,
            a=1.0,
          },
        },
        ["Disease"] =
        {
          debuffColor =
          {
            r=0.6,
            g=0.4,
            b=0,
            a=1.0,
          },
          debuffColorStart =
          {
            r=0.6,
            g=0.4,
            b=0,
            a=1.0,
          },
          debuffColorEnd =
          {
            r=0.6,
            g=0.4,
            b=0,
            a=1.0,
          },
        },
        ["Magic"] =
        {
          debuffColor =
          {
            r=0.2,
            g=0.6,
            b=1.0,
            a=1.0,
          },
          debuffColorStart =
          {
            r=0.2,
            g=0.6,
            b=1.0,
            a=1.0,
          },
          debuffColorEnd =
          {
            r=0.2,
            g=0.6,
            b=1.0,
            a=1.0,
          },
        },
        ["Poison"] =
        {
          debuffColor =
          {
            r=0.0,
            g=0.6,
            b=0.0,
            a=1.0,
          },
          debuffColorStart =
          {
            r=0.0,
            g=0.6,
            b=0.0,
            a=1.0,
          },
          debuffColorEnd =
          {
            r=0.0,
            g=0.6,
            b=0.0,
            a=1.0,
          },
        },
      },
    },
  },
  global = 
  {

  },
}

function addon:GetDefaultDbValues()
  return defaults
end


function addon:LoadDataBase()
    self.db = LibStub("AceDB-3.0"):New("HealthBarColorDB", defaults, true) 
    --db callbacks
    self.db.RegisterCallback(self, "OnProfileChanged", "ReloadConfig")
    self.db.RegisterCallback(self, "OnProfileCopied", "ReloadConfig")
    self.db.RegisterCallback(self, "OnProfileReset", "ReloadConfig")
end

function addon:SetModuleStatus(info, value)
  local module_name = info[#info]
  self.db.profile[module_name].enabled = value
  if value == false then
    self:DisableModule(module_name)
  else
    self:EnableModule(module_name)
  end
end

function addon:GetModuleStatus(info)
  local module_name = info[#info]
  return self.db.profile[module_name].enabled
end

function addon:SetStatus(info, value)
  self.db.profile[info[#info-1]][info[#info]] = value
  self:ReloadModule(info[#info-1])
end

function addon:GetStatus(info)
    return self.db.profile[info[#info-1]][info[#info]]
end

function addon:GetColor(info, moduleName, key)
  local moduleName = moduleName or info[#info-1]
  local key = key or info[#info]
  local color = self.db.profile[moduleName][key]
  return color.r, color.g, color.b, color.a
end

function addon:SetColor(info, r, g, b, a, moduleName, key)
  local moduleName = moduleName or info[#info-1]
  local key = key or info[#info]
  local color = 
  {
    r = r,
    g = g,
    b = b,
    a = a,
  }
  self.db.profile[moduleName][key] = color
  self:ReloadModule(moduleName)
end
