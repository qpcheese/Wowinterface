local _, addonTable = ...
local addon = addonTable.addon
local Media = LibStub("LibSharedMedia-3.0")

local module = addon:NewModule("Textures")
Mixin(module, addonTable.hooks)

function module:OnEnable()
  local dbObj = CopyTable(addon.db.profile["Textures"])
  local pathToHealthBarTexture = Media:Fetch("statusbar", dbObj.healthBarTexture)
  local pathToPowerBarTexture = Media:Fetch("statusbar", dbObj.powerBarTexture)
  local hbc_units = addon:GetAllUnits()
  if addonTable.isRetail then
    for _, unit in pairs(
      {
        "target",
        "focus",
        --[[
          targettarget and focustarget never seem to get overwritten, so there is no need to hook them.
          This also fixes a problem where if you hook ToT/ToF and the target/focus is the player himself, the game can't find the ToT/ToF frames because they don't exist
          and then calls Update every frame, which could lead to CPU spikes. 
        ]]
        --"targettarget"
        --"focustarget"
      }
    ) do
      self:HookFunc(hbc_units[unit].frame, "Update", function()
        hbc_units[unit]:SetHealthBarTexture(pathToHealthBarTexture)
      end)
    end
  end
  if not dbObj.excludePowerBar then
    self:HookFunc("UnitFrameManaBar_UpdateType", function(powerBar)
      if not hbc_units[powerBar.unit] then
        return
      end
      hbc_units[powerBar.unit]:SetPowerBarTexture(pathToPowerBarTexture)
      hbc_units[powerBar.unit]:SetPowerBarColor()
    end)
  end
  for _, hbc_unit in pairs(hbc_units) do
    --The green on the default atals is vertex color 1,1,1 for shared media we need actual green 0,1,0
    function hbc_unit:RestoreHealthBarToDefault()
      self.healthBarTexture:SetDesaturation(0)
      self.healthBar:SetStatusBarColor(0, 1, 0)
      self.healthBarPreparedForColoring = false
    end
    hbc_unit:SetHealthBarTexture(pathToHealthBarTexture)
    if hbc_unit.updateFullCallbacks["update_health_bar_color"] then
      hbc_unit.updateFullCallbacks["update_health_bar_color"]()
    end
    if not dbObj.excludePowerBar then
      hbc_unit:SetPowerBarTexture(pathToPowerBarTexture)
      hbc_unit:SetPowerBarColor()
      hbc_unit.updatePowerCallbacks["update_power_bar_color"] = function()
        hbc_unit:SetPowerBarColor()
      end
    end
  end
end

if addonTable.isRetail then
  function module:OnDisable()
    self:DisableHooks()
    local hbc_units = addon:GetAllUnits()
    local unitHealthBarAtlasPaths = 
    {
      player = "UI-HUD-UnitFrame-Player-PortraitOn-Bar-Health",
      target = "UI-HUD-UnitFrame-Target-PortraitOn-Bar-Health",
      focus = "UI-HUD-UnitFrame-Target-PortraitOn-Bar-Health",
      targettarget = "UI-HUD-UnitFrame-TargetofTarget-PortraitOn-Bar-Health",
      focustarget = "UI-HUD-UnitFrame-TargetofTarget-PortraitOn-Bar-Health",
      pet = "UI-HUD-UnitFrame-TargetofTarget-PortraitOn-Bar-Health",
      boss1 = "UI-HUD-UnitFrame-Target-Boss-Small-PortraitOff-Bar-Health",
      boss2 = "UI-HUD-UnitFrame-Target-Boss-Small-PortraitOff-Bar-Health",
      boss3 = "UI-HUD-UnitFrame-Target-Boss-Small-PortraitOff-Bar-Health",
      boss4 = "UI-HUD-UnitFrame-Target-Boss-Small-PortraitOff-Bar-Health",
      boss5 = "UI-HUD-UnitFrame-Target-Boss-Small-PortraitOff-Bar-Health",
    }
    local unotPowerBarAtlasPaths = 
    {
      --TODO find poweratlas paths
      --It gets reset to default on spending power or changing target so very low prio
    }
    for _, hbc_unit in pairs(hbc_units) do
      hbc_unit.RestoreHealthBarToDefault = nil --Restore the meta function
      if hbc_unit.updateFullCallbacks["update_health_bar_color"] then
        hbc_unit.updateFullCallbacks["update_health_bar_color"]()
      end
      hbc_unit.updatePowerCallbacks["update_power_bar_color"] = nil
      local healthBarAtlasPath = unitHealthBarAtlasPaths[hbc_unit.UnitId]
      if healthBarAtlasPath then
          hbc_unit.healthBarTexture:SetAtlas(healthBarAtlasPath)
      end
      local powerBarAtalsPath = unotPowerBarAtlasPaths[hbc_unit.UnitId]
      if powerBarAtalsPath then
        hbc_unit.powerBarTexture:SetAtlas(powerBarAtalsPath)
      end
    end
  end  
else
  function module:OnDisable()
    self:DisableHooks()
    local hbc_units = addon:GetAllUnits()
    local defaultTexturePath = Media:Fetch("statusbar", "Blizzard")
    for _, hbc_unit in pairs(hbc_units) do
      hbc_unit.RestoreHealthBarToDefault = nil --Restore the meta function
      hbc_unit:SetHealthBarTexture(defaultTexturePath)
      hbc_unit:SetPowerBarTexture(defaultTexturePath)
    end
  end 
end

