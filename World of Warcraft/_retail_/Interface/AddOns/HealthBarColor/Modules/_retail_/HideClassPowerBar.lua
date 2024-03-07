local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("HideClassPowerBar")
Mixin(module, addonTable.hooks)

local classPowerBars = 
{
  ["ROGUE"]       = RogueComboPointBarFrame,
  ["DRUID"]       = DruidComboPointBarFrame,
  ["PALADIN"]     = PaladinPowerBarFrame,
  ["EVOKER"]      = EssencePlayerFrame,
  ["MONK"]        = MonkHarmonyBarFrame,
  ["DEATHKNIGHT"] = RuneFrame,
  ["MAGE"]        = MageArcaneChargesFrame,
  ["WARLOCK"]     = WarlockPowerFrame,
}

function module:OnEnable()
  local classPowerBar = classPowerBars[addonTable.playerClass]
  if not classPowerBar then 
    return
  end
  self:HookScript(classPowerBar, "OnShow", function()
    classPowerBar:Hide()
  end)
  classPowerBar:Hide()
end

function module:OnDisable()
  self:DisableHooks()
  local classPowerBar = classPowerBars[addonTable.playerClass]
  if classPowerBar then 
    classPowerBar:Show()
  end
end
