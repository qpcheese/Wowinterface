--[[
  Fonts: 
    name/health colorModes extended:
    1 = class/reaction
    2 = reaction
    3 = class/custom
    4 = custom
    power 
    1 = custom
    2 = power
]]
local _, addonTable = ...
local addon = addonTable.addon
local Media = LibStub("LibSharedMedia-3.0")

local units 
if addonTable.isVanilla then
  units = {"target", "targettarget"}
else
  units = {"target", "targettarget", "focus", "focustarget"}
end

for _, unit in pairs(units) do 
  local module = addon:NewModule("Font_" .. unit)
  function module:OnEnable()
    module.defaultFonts = {}
    local dbObj = CopyTable(addon.db.profile["Font_" .. unit])
    local hbc_unit = addon:GetUnit(unit)
    --Name 
    local defaultColor = {}
    defaultColor.r, defaultColor.g, defaultColor.b, defaultColor.a = hbc_unit.nameText:GetVertexColor()
    if dbObj.colorModeName == 1 then
      hbc_unit.updateFullCallbacks["update_name_font_color"] = function()
        if hbc_unit.isPlayer then
          hbc_unit:SetNameToClassColor()
        else
          hbc_unit:SetNameToReactionColor()
        end
      end
    elseif dbObj.colorModeName == 2 then
      hbc_unit.updateFullCallbacks["update_name_font_color"] = function()
        hbc_unit:SetNameToReactionColor()
      end
    elseif dbObj.colorModeName == 3 then
      hbc_unit.updateFullCallbacks["update_name_font_color"] = function()
        if hbc_unit.isPlayer then
          hbc_unit:SetNameToClassColor()
        else
          hbc_unit:SetNameToCustomColor(dbObj.customColorName)
        end
      end
    elseif dbObj.colorModeName == 4 then
      hbc_unit.updateFullCallbacks["update_name_font_color"] = function()
        hbc_unit:SetNameToCustomColor(dbObj.customColorName)
      end
    end
    hbc_unit.updateFullCallbacks["update_name_font_color"]()
    local font = Media:Fetch("font", dbObj.nameFont)
    local fontSize = dbObj.nameFontSize
    local outlinemode = addon:ConvertDbNumberToOutlinemode(dbObj.nameFontOutlineMode) 
    local defaultFont, defaultFontSize, defaultOutlinemode = hbc_unit.nameText:GetFont()
    module.defaultFonts.name =
    {
      font = defaultFont,
      size = defaultFontSize,
      outlinemode = defaultOutlinemode,
      color = defaultColor,
    }
    hbc_unit:SetNameFont(font, fontSize, outlinemode)
    if ( unit == "target" or unit == "focus" ) and not addonTable.isVanilla then
      --Health 
      local defaultColor = {}
      defaultColor.r, defaultColor.g, defaultColor.b, defaultColor.a = hbc_unit.healthTextLeft:GetVertexColor()
      if dbObj.colorModeHealth == 1 then
        hbc_unit.updateFullCallbacks["update_health_font_color"] = function()
          if hbc_unit.isPlayer then
            hbc_unit:SetHealthTextToClassColor()
          else
            hbc_unit:SetHealthTextToReactionColor()
          end
        end
      elseif dbObj.colorModeHealth == 2 then
        hbc_unit.updateFullCallbacks["update_health_font_color"] = function()
          hbc_unit:SetHealthTextToReactionColor()
        end
      elseif dbObj.colorModeHealth == 3 then
        hbc_unit.updateFullCallbacks["update_health_font_color"] = function()
          if hbc_unit.isPlayer then
            hbc_unit:SetHealthTextToClassColor()
          else
            hbc_unit:SetHealthTextToCustomColor(dbObj.customColorHealth)
          end
        end
      elseif dbObj.colorModeHealth == 4 then
        hbc_unit.updateFullCallbacks["update_health_font_color"] = function()
          hbc_unit:SetHealthTextToCustomColor(dbObj.customColorHealth)
        end
      end
      hbc_unit.updateFullCallbacks["update_health_font_color"]()
      local font = Media:Fetch("font", dbObj.healthFont)
      local fontSize = dbObj.healthFontSize
      local outlinemode = addon:ConvertDbNumberToOutlinemode(dbObj.healthFontOutlineMode) 
      local defaultFont, defaultFontSize, defaultOutlinemode = hbc_unit.healthTextLeft:GetFont()
      module.defaultFonts.health =
      {
        font = defaultFont,
        size = defaultFontSize,
        outlinemode = defaultOutlinemode,
        color = defaultColor,
      }
      hbc_unit:SetHealthTextFont(font, fontSize, outlinemode)
      --Power
      local defaultColor = {}
      defaultColor.r, defaultColor.g, defaultColor.b, defaultColor.a = hbc_unit.powerBarTextLeft:GetVertexColor()
      if dbObj.colorModePower == 1 then
        hbc_unit.updatePowerCallbacks["update_power_font_color"] = function()
          hbc_unit:SetPowerTextToCustomColor(dbObj.customColorPower)
        end
      else
        hbc_unit.updatePowerCallbacks["update_power_font_color"] = function()
          hbc_unit:SetPowerTextToPowerColor()
        end
      end
      hbc_unit.updatePowerCallbacks["update_power_font_color"]()
      local font = Media:Fetch("font", dbObj.powerFont)
      local fontSize = dbObj.powerFontSize
      local outlinemode = addon:ConvertDbNumberToOutlinemode(dbObj.powerFontOutlineMode) 
      local defaultFont, defaultFontSize, defaultOutlinemode = hbc_unit.powerBarTextLeft:GetFont()
      module.defaultFonts.power =
      {
        font = defaultFont,
        size = defaultFontSize,
        outlinemode = defaultOutlinemode,
        color = defaultColor,
      }
      hbc_unit:SetPowerTextFont(font, fontSize, outlinemode)
    end    
  end

  function module:OnDisable()
    local hbc_unit = addon:GetUnit(unit)
    local defaultFonts = module.defaultFonts
    if defaultFonts then
      hbc_unit:SetNameFont(defaultFonts.name.font, defaultFonts.name.size, defaultFonts.name.outlinemode)
      hbc_unit:SetNameToCustomColor(defaultFonts.name.color)
      hbc_unit.updateFullCallbacks["update_name_font_color"] = nil
      if ( unit == "target" or unit == "focus" ) and not addonTable.isVanilla then
        hbc_unit:SetHealthTextFont(defaultFonts.health.font, defaultFonts.health.size, defaultFonts.health.outlinemode)
        hbc_unit:SetHealthTextToCustomColor(defaultFonts.health.color)
        hbc_unit.updateFullCallbacks["update_health_font_color"] = nil
        hbc_unit:SetPowerTextFont(defaultFonts.power.font, defaultFonts.power.size, defaultFonts.power.outlinemode)
        hbc_unit:SetPowerTextToCustomColor(defaultFonts.power.color)
        hbc_unit.updatePowerCallbacks["update_power_font_color"] = nil
      end
    end
  end
end