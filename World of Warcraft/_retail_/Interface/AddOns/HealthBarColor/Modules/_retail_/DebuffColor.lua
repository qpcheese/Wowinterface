local _, addonTable = ...
local addon = addonTable.addon

--local speed teferences
local AuraUtil_ForEachAura = AuraUtil.ForEachAura
local next = next
local pairs = pairs

local module = addon:NewModule("DebuffColor")
local LCD = LibStub("LibCanDispel-1.0")
local eventFrame = nil
local Player = nil
local auraMap = {}


local function updateColor()
  for auraInstanceID, dispelName in next, auraMap do
    if auraInstanceID then
      Player:SetHealthBarToDebuffColor(dispelName)
      return
    end
  end
  Player.updateFullCallbacks["update_health_bar_color"]()
end

local function updateAurasFull()
  local function handleAura(aura)
    if aura.dispelName and LCD:CanDispel(aura.dispelName) then
      auraMap[aura.auraInstanceID] = aura.dispelName
    end
  end
  AuraUtil_ForEachAura("player", "HARMFUL", nil, handleAura, true)
  updateColor()
end

local function updateAurasIncremental(updateInfo)
  if updateInfo.addedAuras then
    for _, aura in pairs(updateInfo.addedAuras) do
      if aura.isHarmful and aura.dispelName and LCD:CanDispel(aura.dispelName) then
        auraMap[aura.auraInstanceID] = aura.dispelName
      end
    end
  end
  if updateInfo.removedAuraInstanceIDs then
    for _, auraInstanceID in pairs(updateInfo.removedAuraInstanceIDs) do
      if auraMap[auraInstanceID] then
        auraMap[auraInstanceID] = nil
      end
    end
  end
  updateColor()
end

function module:OnEnable()
  Player = addon:GetUnit("player")
  if not eventFrame then
    eventFrame = CreateFrame("Frame")
  end
  eventFrame:SetScript("OnEvent", function(_, event, unit, updateInfo)
    if updateInfo.isFullUpdate then 
      updateAurasFull()
    else
      updateAurasIncremental(updateInfo)
    end
  end)
  eventFrame:RegisterUnitEvent("UNIT_AURA", "player")
  if Player.updateFullCallbacks["update_health_bar_color"] then
    updateAurasFull()
  end
end

function module:OnDisable()
  if eventFrame then
    eventFrame:UnregisterAllEvents()
  end
  auraMap = {}
  Player.updateFullCallbacks["update_health_bar_color"]()
end

