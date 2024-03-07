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
    classColors = 
    {
      order = 1,
      name = L["classColors"],
      type = "group",
      args = 
      {
    },
  },
    reactionColors = 
    {
      order = 2,
      name = L["reactionColors"],
      type = "group",
      args = 
      {
    },
  },
    powerColors = 
    {
      order = 3,
      name = L["powerColors"],
      type = "group",
      args = 
      {
    },
  },
    debuffColors = 
    {
      hidden = not addonTable.isRetail,
      order = 4,
      name = L["debuffColors"],
      type = "group",
      args = 
      {
    },
  },
  },
}

local classIconCoords = 
{
  ["DEATHKNIGHT"] =
  {
    0.00048828125,
    0.06298828125,
    0.0009765625,
    0.1259765625,
  },
  ["DEMONHUNTER"] =
  {
    0.00048828125,
    0.06298828125,
    0.1279296875,
    0.2529296875,
  },
  ["DRUID"] =
  {
    0.00048828125,
    0.06298828125,
    0.2548828125,
    0.3798828125,
  },
  ["EVOKER"] =
  {
    0.00048828125,
    0.06298828125,
    0.3818359375,
    0.5068359375
  },
  ["HUNTER"] =
  {
    0.00048828125,
    0.06298828125,
    0.5087890625,
    0.6337890625,
  },
  ["MAGE"] =
  {
    0.00048828125,
    0.06298828125,
    0.6357421875,
    0.7607421875,
  },
  ["MONK"] =
  {
    0.00048828125,
    0.06298828125,
    0.7626953125,
    0.8876953125,
  },
  ["PALADIN"] =
  {
    0.06396484375,
    0.12646484375,
    0.0009765625,
    0.1259765625,
  },
  ["PRIEST"] =
  {
    0.06396484375,
    0.12646484375,
    0.1279296875,
    0.2529296875,
  },
  ["ROGUE"] =
  {
    0.06396484375,
    0.12646484375,
    0.2548828125,
    0.3798828125,
  },
  ["SHAMAN"] =
  {
    0.06396484375,
    0.12646484375,
    0.3818359375,
    0.5068359375,
  },
  ["WARLOCK"] =
  {
    0.06396484375,
    0.12646484375,
    0.5087890625,
    0.6337890625,
  },
  ["WARRIOR"] =
  {
    0.06396484375,
    0.12646484375,
    0.6357421875,
    0.7607421875,
  },
}

local function createClassColorEntrys()
  local numClasses = GetNumClasses()
  local classes = {}
  for i=1, numClasses do 
    local _, classFile = GetClassInfo(i)
    if classFile then
      table.insert(classes, classFile)
    end
  end
  for i, class in pairs(classes) do 
    options.args.classColors.args[class] = 
    {
      order = i,
      name = L[class],
      type = "group",
      inline = true,
      args = 
      {
        classIcon = 
        {
          order = 1,
          name = "",
          image = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\CharacterCreateIcons.BLP",
          imageCoords = classIconCoords[class] or {0,1,0,1},
          imageWidth = 28,
          imageHeight = 28,
          type = "description",
          width = 0.3,
        },
        classColor = 
        {
          order = 2,
          type = "color",
          name = L["classColor_name"],
          desc = L["singleColor_desc"],
          get = "GetAddonColor",
          set = "SetAddonColor",
        },
        classColorStart = 
        {
          order = 3,
          type = "color",
          name = L["gradientStart_name"],
          desc = L["gradientStart_desc"],
          get = "GetAddonColor",
          set = "SetAddonColor",
        },
        classColorEnd = 
        {
          order = 4,
          type = "color",
          name = L["gradientEnd_name"],
          desc = L["gradientEnd_desc"],
          get = "GetAddonColor",
          set = "SetAddonColor",
          width = 2,
        },
        resetColors = 
        {
          order = 5,
          type = "execute",
          name = L["colorResetButton_name"],
          desc = L["colorResetButton_desc"],
          func = function ()
            local defaults = addon:GetDefaultDbValues()
            addon.db.profile.addonColors.classColors[class] = CopyTable(defaults.profile.addonColors.classColors[class])
            addon:ReloadConfig()
          end,
          width = 0.5,
        },
    },
    }
  end
end

local function createReactionColorEntrys()
  for reaction, _ in pairs(addon.db.profile.addonColors.reactionColors) do
    options.args.reactionColors.args[reaction] = 
    {
      order = i,
      name = L[reaction],
      type = "group",
      inline = true,
      args = 
      {
        reactionColor = 
        {
          order = 1,
          type = "color",
          name = L["reactionColor_name"],
          desc = L["singleColor_desc"],
          get = "GetAddonColor",
          set = "SetAddonColor",
        },
        reactionColorStart = 
        {
          order = 2,
          type = "color",
          name = L["gradientStart_name"],
          desc = L["gradientStart_desc"],
          get = "GetAddonColor",
          set = "SetAddonColor",
        },
        reactionColorEnd = 
        {
          order = 3,
          type = "color",
          name = L["gradientEnd_name"],
          desc = L["gradientEnd_desc"],
          get = "GetAddonColor",
          set = "SetAddonColor",
          width = 2.3,
        },
        resetColors = 
        {
          order = 4,
          type = "execute",
          name = L["colorResetButton_name"],
          desc = L["colorResetButton_desc"],
          func = function ()
            local defaults = addon:GetDefaultDbValues()
            addon.db.profile.addonColors.reactionColors[reaction] = CopyTable(defaults.profile.addonColors.reactionColors[reaction])
            addon:ReloadConfig()
          end,
          width = 0.5,
        },
    },
    }
  end
end

local function createPowerColorEntrys()
  for powerType, _ in pairs(addon.db.profile.addonColors.powerColors) do
    options.args.powerColors.args[powerType] = 
    {
      order = i,
      name = L[powerType], 
      type = "group",
      inline = true,
      args = 
      {
        powerColor = 
        {
          order = 1,
          type = "color",
          name = L["powerColor_name"],
          desc = L["singleColor_desc"],
          get = "GetAddonColor",
          set = "SetAddonColor",
        },
        powerColorStart = 
        {
          order = 2,
          type = "color",
          name = L["gradientStart_name"],
          desc = L["gradientStart_desc"],
          get = "GetAddonColor",
          set = "SetAddonColor",
        },
        powerColorEnd = 
        {
          order = 3,
          type = "color",
          name = L["gradientEnd_name"],
          desc = L["gradientEnd_desc"],
          get = "GetAddonColor",
          set = "SetAddonColor",
          width = 2.3,
        },
        resetColors = 
        {
          order = 4,
          type = "execute",
          name = L["colorResetButton_name"],
          desc = L["colorResetButton_desc"],
          func = function ()
            local defaults = addon:GetDefaultDbValues()
            addon.db.profile.addonColors.powerColors[powerType] = CopyTable(defaults.profile.addonColors.powerColors[powerType])
            addon:ReloadConfig()
          end,
          width = 0.5,
        },
      },
    }
  end
end

local function createDebuffColorEntrys()
  for debuffType, _ in pairs(addon.db.profile.addonColors.debuffColors) do
    options.args.debuffColors.args[debuffType] = 
    {
      order = i,
      name = debuffType, --TODO add locales
      type = "group",
      inline = true,
      args = 
      {
        debuffColor = 
        {
          order = 1,
          type = "color",
          name = L["debuffColor_name"],
          desc = L["singleColor_desc"],
          get = "GetAddonColor",
          set = "SetAddonColor",
        },
        debuffColorStart = 
        {
          order = 2,
          type = "color",
          name = L["gradientStart_name"],
          desc = L["gradientStart_desc"],
          get = "GetAddonColor",
          set = "SetAddonColor",
        },
        debuffColorEnd = 
        {
          order = 3,
          type = "color",
          name = L["gradientEnd_name"],
          desc = L["gradientEnd_desc"],
          get = "GetAddonColor",
          set = "SetAddonColor",
          width = 2.3,
        },
        resetColors = 
        {
          order = 4,
          type = "execute",
          name = L["colorResetButton_name"],
          desc = L["colorResetButton_desc"],
          func = function ()
            local defaults = addon:GetDefaultDbValues()
            addon.db.profile.addonColors.debuffColors[debuffType] = CopyTable(defaults.profile.addonColors.debuffColors[debuffType])
            addon:ReloadConfig()
          end,
          width = 0.5,
        },
      },
    }
  end
end

function addon:GetColorsTabOptions()
  createClassColorEntrys()
  createReactionColorEntrys()
  createPowerColorEntrys()
  createDebuffColorEntrys()
  return options
end

function addon:GetAddonColor(info)
  local color = self.db.profile.addonColors[info[#info-2]][info[#info-1]][info[#info]] or {r = 1, g = 1, b = 1, a = 1}
  return color.r, color.g, color.b, color.a
end

function addon:SetAddonColor(info, r, g, b, a)
  local color = 
  {
    r = r,
    g = g,
    b = b,
    a = a,
  }
  self.db.profile.addonColors[info[#info-2]][info[#info-1]][info[#info]] = color
  self:ReloadConfig()
end
