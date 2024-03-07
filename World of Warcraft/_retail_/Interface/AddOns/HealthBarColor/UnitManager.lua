local _, addonTable = ...
local addon = addonTable.addon
local globalUnitVariables = addonTable.globalUnitVariables

local hbc_units = 
{
  ["player"] = false,
  ["target"] = false,
  ["targettarget"] = false,
  ["focus"] = false,
  ["focustarget"] = false,
  ["pet"] = false,
  ["boss1"] = false,
  ["boss2"] = false,
  ["boss3"] = false,
  ["boss4"] = false,
  ["boss5"] = false,
}

--[[
  globalUnitVariables are defined in the game version's init file
  function get called from OnInitialize()
]]
function addon:CreateAllUnits()
  for unitName, _ in pairs(hbc_units) do
    if globalUnitVariables[unitName] then
      local hbc_unit = addon:NewUnit()
      Mixin(hbc_unit, globalUnitVariables[unitName])
      hbc_unit.healthBarTexture = hbc_unit.healthBar:GetStatusBarTexture()
      hbc_unit.powerBarTexture = hbc_unit.powerBar:GetStatusBarTexture()
      hbc_unit.UnitId = unitName
      hbc_unit:FullUpdate()
      hbc_units[unitName] = hbc_unit
      hbc_unit:PrepareHealthBarTexture()
    end
  end
  self:ApplyOverrides() --Prototyoes HBC_UnitOverrides.lua
end

function addon:GetUnit(unitName)
  return hbc_units[unitName]
end

--Get all the implemented units of the games version
function addon:GetAllUnits()
  local units = {}
  for unitName, hbc_unit in pairs(hbc_units) do
    if hbc_unit then
      units[unitName] = hbc_unit
    end
  end
  return units
end

local eventFrame = CreateFrame("Frame")
eventFrame:SetScript("OnEvent", function(_, event, unit, ...)
  if event == "PLAYER_TARGET_CHANGED" then
    hbc_units["target"]:FullUpdate()
    hbc_units["targettarget"]:FullUpdate()
  elseif event == "PLAYER_FOCUS_CHANGED" then
    hbc_units["focus"]:FullUpdate()
    hbc_units["focustarget"]:FullUpdate()
  elseif event == "PLAYER_ENTERING_WORLD" then
    hbc_units["player"]:FullUpdate()
    hbc_units["pet"]:PowerUpdate()
  elseif event == "UNIT_TARGET" and unit == "target" then
    hbc_units["targettarget"]:FullUpdate()
  elseif event == "UNIT_TARGET" and unit == "focus" then
    hbc_units["focustarget"]:FullUpdate()
  elseif event == "UNIT_POWER_UPDATE" then
    if hbc_units[unit] then
      hbc_units[unit]:PowerUpdate()
    end
  elseif event == "UPDATE_SHAPESHIFT_FORM" then
    hbc_units["player"]:PowerUpdate()
  end
end)
if addonTable.isVanilla then
  eventFrame:RegisterUnitEvent("UNIT_TARGET", "target")
  eventFrame:RegisterUnitEvent("UNIT_POWER_UPDATE", "player", "pet", "target", "targettarget")
else
  eventFrame:RegisterUnitEvent("UNIT_TARGET", "target", "focus")
  eventFrame:RegisterUnitEvent("UNIT_POWER_UPDATE", "player", "pet", "target", "targettarget", "focus", "focustarget")
end
eventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
eventFrame:RegisterEvent("PLAYER_FOCUS_CHANGED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
if addonTable.playerClass == "DRUID" then
  eventFrame:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
end