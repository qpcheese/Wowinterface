--[[
  colorModes:
    1 = class/reaction
    2 = reaction
    3 = class/custom
    4 = custom
    5 = hide
]]
local _, addonTable = ...
local addon = addonTable.addon

local units = {"target", "focus"}

for _, unit in pairs(units) do 
  local module = addon:NewModule("Glow_" .. unit)
  Mixin(module, addonTable.hooks)
  function module:OnEnable()
    local dbObj = CopyTable(addon.db.profile["Glow_" .. unit])
    local hbc_unit = addon:GetUnit(unit)
    if dbObj.colorModeGlow == 1 then
      hbc_unit.updateFullCallbacks["update_glow_color"] = function()
        if hbc_unit.isPlayer then
          hbc_unit:SetGlowToClassColor()
        else
          hbc_unit:SetGlowToReactionColor()
        end
      end
    elseif dbObj.colorModeGlow == 2 then
      hbc_unit.updateFullCallbacks["update_glow_color"] = function()
        hbc_unit:SetGlowToReactionColor()
      end
    elseif dbObj.colorModeGlow == 3 then
      hbc_unit.updateFullCallbacks["update_glow_color"] = function()
        if hbc_unit.isPlayer then
          hbc_unit:SetGlowToClassColor()
        else
          hbc_unit:SetGlowToCustomColor(dbObj.customColorGlow)
        end
      end
    elseif dbObj.colorModeGlow == 4 then
      hbc_unit.updateFullCallbacks["update_glow_color"] = function()
        hbc_unit:SetGlowToCustomColor(dbObj.customColorGlow)
      end
    elseif dbObj.colorModeGlow == 5 then
      self:HookScript(hbc_unit.glowTexture, "OnShow", function()
        hbc_unit.glowTexture:Hide()
      end)
      hbc_unit.glowTexture:Hide()
    end
    if dbObj.colorModeGlow ~= 5 then
      self:HookFunc(hbc_unit.frame, "CheckFaction", function()
        hbc_unit.updateFullCallbacks["update_glow_color"]()
      end)
    end
    if hbc_unit.updateFullCallbacks["update_glow_color"] then
      hbc_unit.updateFullCallbacks["update_glow_color"]()
    end
  end

  function module:OnDisable()
    self:DisableHooks()
    local hbc_unit = addon:GetUnit(unit)
    hbc_unit.updateFullCallbacks["update_glow_color"] = nil
    hbc_unit.glowTexture:Show()
    local r,g,b = UnitSelectionColor(unit)
    hbc_unit.glowTexture:SetVertexColor(r,g,b)
  end
end

--[[
  1 = class color
  2 = custom color
]]
local module = addon:NewModule("Glow_player")
Mixin(module, addonTable.hooks)

function module:OnEnable()
  local dbObj = addon.db.profile["Glow_player"]
  local Player = addon:GetUnit("player")
  if dbObj.colorModeGlow == 3 then
    return
  end
  if not Player.glowTexture then
    local Target = addon:GetUnit("target") 
    local atlas = Target.glowTexture:GetAtlas() 
    local xOfs, yOfs = select(4,Target.glowTexture:GetPoint(1)) --topright
    local layer, sublayer = Target.glowTexture:GetDrawLayer()
    Player.glowTexture = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain:CreateTexture(nil, layer, nil, sublayer)
    Player.glowTexture:SetAtlas(atlas, true) 
    Player.glowTexture:SetPoint("TOPLEFT", -xOfs, yOfs) 
    Player.glowTexture:SetTexCoord(1, 0, 0, 1) --mirror horizontal
  end
  if dbObj.colorModeGlow == 1 then
    Player.updateFullCallbacks["update_glow_color"] = function()
      Player:SetGlowToClassColor()
    end
  else
    Player.updateFullCallbacks["update_glow_color"] = function()
      Player:SetGlowToCustomColor(dbObj.customColorGlow)
    end
  end
  self:HookFunc("PlayerFrame_ToPlayerArt", function()
    Player.glowTexture:Show()
  end)
  self:HookFunc("PlayerFrame_ToVehicleArt", function()
    Player.glowTexture:Hide()
  end)
  Player.glowTexture:Show()
  Player.updateFullCallbacks["update_glow_color"]()
end

function module:OnDisable()
  self:DisableHooks()
  local Player = addon:GetUnit("player")
  Player.updateFullCallbacks["update_glow_color"] = nil
  if Player.glowTexture then
    Player.glowTexture:Hide()
  end
end