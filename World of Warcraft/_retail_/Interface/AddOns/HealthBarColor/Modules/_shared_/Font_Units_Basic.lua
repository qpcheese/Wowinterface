--[[
  Fonts: 
    name/health colorModes basic:
    1 = class
    2 = custom 
    power 
    1 = custom
    2 = power
]]
local _, addonTable = ...
local addon = addonTable.addon
local Media = LibStub("LibSharedMedia-3.0")

local units 
if addonTable.isRetail then
  units = {"player", "pet", "boss1", "boss2", "boss3", "boss4", "boss5"}
else
  units = {"player", "pet"}
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
      local classColor = addonTable.classColors[addonTable.playerClass].classColor
      hbc_unit:SetNameToCustomColor(classColor)
    else
      hbc_unit:SetNameToCustomColor(dbObj.customColorName)
    end
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
    if unit == "player" then
      --[[
        --TODO check from time to time if still needed.
        Hacky method to fix a problem where the _G.PlayerName would simply ignore SetFont on first game start (before reloading or logging in on another character), even on repeat calls.
      ]]
      local success = hbc_unit.nameText:SetFont(font, fontSize, outlinemode)
      local i = 0
      while ( not success ) and ( i < 10 ) do
        i = i + 1
        font = Media:Fetch("font", "")
        success = hbc_unit.nameText:SetFont(font, fontSize, outlinemode)
      end
    else
      hbc_unit:SetNameFont(font, fontSize, outlinemode)
    end
    --Health
    local defaultColor = {}
    defaultColor.r, defaultColor.g, defaultColor.b, defaultColor.a = hbc_unit.healthTextLeft:GetVertexColor()
    if dbObj.colorModeHealth == 1 then
      local classColor = addonTable.classColors[addonTable.playerClass].classColor
      hbc_unit:SetHealthTextToCustomColor(classColor)
    else
      hbc_unit:SetHealthTextToCustomColor(dbObj.customColorHealth)
    end
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
      hbc_unit:SetPowerTextToCustomColor(dbObj.customColorPower)
    else
      --hbc_unit:SetPowerTextToPowerColor()
      hbc_unit.updatePowerCallbacks["update_power_font_color"] = function()
        hbc_unit:SetPowerTextToPowerColor()
      end
      hbc_unit:SetPowerTextToPowerColor()
    end
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
    --Alternate Power
    if addonTable.isRetail and unit == "player" then
      local defaultColor = {}
      defaultColor.r, defaultColor.g, defaultColor.b, defaultColor.a = hbc_unit.alternatePowerBarTextLeft:GetVertexColor()
      if dbObj.colorModeAlternatePower == 1 then
        hbc_unit:SetAlternatePowerTextToCustomColor(dbObj.customColorAlternatePower)
      else
        hbc_unit.updatePowerCallbacks["update_alternate_power_font_color"] = function()
          hbc_unit:SetAlternatePowerTextToAlternatePowerColor()
        end
        hbc_unit:SetAlternatePowerTextToAlternatePowerColor()
      end
      local font = Media:Fetch("font", dbObj.powerFont) -- TODO implement a dropdown in gui to make this independent 
      local fontSize = dbObj.alternatePowerFontSize
      local outlinemode = addon:ConvertDbNumberToOutlinemode(dbObj.powerFontOutlineMode) 
      local defaultFont, defaultFontSize, defaultOutlinemode = hbc_unit.alternatePowerBarTextLeft:GetFont()
      module.defaultFonts.alternatePower =
      {
        font = defaultFont,
        size = defaultFontSize,
        outlinemode = defaultOutlinemode,
        color = defaultColor,
      }
      hbc_unit:SetAlternatePowerTextFont(font, fontSize, outlinemode)
    end
  end

  function module:OnDisable()
    local hbc_unit = addon:GetUnit(unit)
    hbc_unit.updatePowerCallbacks["update_power_font_color"] = nil
    local defaultFonts = module.defaultFonts
    if defaultFonts then
      hbc_unit:SetNameFont(defaultFonts.name.font, defaultFonts.name.size, defaultFonts.name.outlinemode)
      hbc_unit:SetNameToCustomColor(defaultFonts.name.color)
      hbc_unit:SetHealthTextFont(defaultFonts.health.font, defaultFonts.health.size, defaultFonts.health.outlinemode)
      hbc_unit:SetHealthTextToCustomColor(defaultFonts.health.color)
      hbc_unit:SetPowerTextFont(defaultFonts.power.font, defaultFonts.power.size, defaultFonts.power.outlinemode)
      hbc_unit:SetPowerTextToCustomColor(defaultFonts.power.color)
      if addonTable.isRetail and unit == "player" then
        hbc_unit:SetAlternatePowerTextFont(defaultFonts.alternatePower.font, defaultFonts.alternatePower.size, defaultFonts.alternatePower.outlinemode)
        hbc_unit:SetAlternatePowerTextToCustomColor(defaultFonts.alternatePower.color)
      end
    end
  end
end