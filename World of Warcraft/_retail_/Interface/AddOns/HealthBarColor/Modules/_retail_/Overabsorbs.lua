local _, addonTable = ...
local addon = addonTable.addon

local GetMinMaxValues = GetMinMaxValues
local UnitGetTotalAbsorbs = UnitGetTotalAbsorbs
local GetWidth = GetWidth
local UnitHealth = UnitHealth
local IsShown = IsShown
local SetAllPoints = SetAllPoints
local ClearAllPoints = ClearAllPoints
local SetPoint = SetPoint
local SetWidth = SetWidth
local Show = Show
local Hide = Hide

local module = addon:NewModule("Overabsorbs")
Mixin(module, addonTable.hooks)
local units =
{
  ["player"] = false,
  ["target"] = false,
  ["focus"] = false,
}

local function onUnitFrameHealPredictionBars_Update(frame)
  if not units[frame.unit] then 
    return
  end
  local hbc_unit = units[frame.unit]
  local _, maxHealth = hbc_unit.healthBar:GetMinMaxValues()
  if maxHealth <= 0 then
    return
  end
  local totalAbsorb = UnitGetTotalAbsorbs(frame.unit) or 0
  if totalAbsorb > maxHealth then
    totalAbsorb = maxHealth
  end
  if totalAbsorb > 0 then 
    local width = hbc_unit.healthBar:GetWidth()	
    local health = UnitHealth(frame.unit)	
    local missingHealth = maxHealth - health
    local barSize = width * ( totalAbsorb / maxHealth ) 
    if hbc_unit.totalAbsorbBar:IsShown() and totalAbsorb <= missingHealth then 
      hbc_unit.tiledFillOverlay:SetAllPoints(hbc_unit.totalAbsorbBar.FillMask)
    else
      if missingHealth > 0 then
        barSize = width * ( (totalAbsorb/maxHealth) - (missingHealth/maxHealth) )
      end
      hbc_unit.tiledFillOverlay:ClearAllPoints()
      hbc_unit.tiledFillOverlay:SetPoint("TOPRIGHT", hbc_unit.healthBar, "TOPRIGHT", 0, 0)
      hbc_unit.tiledFillOverlay:SetPoint("BOTTOMRIGHT", hbc_unit.healthBar, "BOTTOMRIGHT", 0, 0)
    end
    hbc_unit.tiledFillOverlay:SetWidth(barSize)
    hbc_unit.tiledFillOverlay:Show()
  else
    hbc_unit.tiledFillOverlay:Hide()
  end
end

function module:OnEnable()
  for unit, _ in pairs(units) do
    local hbc_unit = addon:GetUnit(unit)
    hbc_unit.tiledFillOverlay:ClearAllPoints()
    hbc_unit.tiledFillOverlay:SetParent(hbc_unit.healthBar) 
    hbc_unit.overAbsorbGlow:ClearAllPoints()
    hbc_unit.overAbsorbGlow:SetPoint("TOPLEFT", hbc_unit.tiledFillOverlay, "TOPLEFT", -5, 0)
    hbc_unit.overAbsorbGlow:SetPoint("BOTTOMLEFT", hbc_unit.tiledFillOverlay, "BOTTOMLEFT", -5, 0)
    units[unit] = hbc_unit
    local fakeFrame =
    {
      unit = unit
    }
    onUnitFrameHealPredictionBars_Update(fakeFrame)
  end
  self:HookFunc("UnitFrameHealPredictionBars_Update", onUnitFrameHealPredictionBars_Update)
end

function module:OnDisable()
  self:DisableHooks()
  for unit, hbc_unit in pairs(units) do
    if not hbc_unit then 
      return
    end
		hbc_unit.tiledFillOverlay:ClearAllPoints()
		hbc_unit.tiledFillOverlay:SetAllPoints(hbc_unit.totalAbsorbBar.FillMask)
		if not hbc_unit.totalAbsorbBar:IsShown() then
			hbc_unit.tiledFillOverlay:Hide()
		end
		hbc_unit.overAbsorbGlow:ClearAllPoints()
		hbc_unit.overAbsorbGlow:SetPoint("TOPLEFT", hbc_unit.healthBar, "TOPRIGHT", -7, 0)
		hbc_unit.overAbsorbGlow:SetPoint("BOTTOMLEFT", hbc_unit.healthBar, "BOTTOMRIGHT", -7, 0)
  end
end