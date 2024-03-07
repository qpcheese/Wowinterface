local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("BackgroundTextures")
local Media = LibStub("LibSharedMedia-3.0")

function module:OnEnable()
  local dbObj = CopyTable(addon.db.profile.BackgroundTextures)
  local pathToTexture = Media:Fetch("statusbar", dbObj.texture)
  local color = dbObj.color
  local hbc_units = addon:GetAllUnits()
  for _, hbc_unit in pairs(hbc_units) do
    if not hbc_unit.backgroundFrame then
      hbc_unit.backgroundFrame = CreateFrame("Frame", nil, hbc_unit.healthBar)
      --Setting the frame strata like this is important so that the background texture is not placed behind the semi-transparent background of the unit frame.
      hbc_unit.backgroundFrame:SetFrameStrata(hbc_unit.healthBar:GetFrameStrata())
      hbc_unit.backgroundFrame:SetFrameLevel(hbc_unit.healthBar:GetFrameLevel()-1)
      hbc_unit.backgroundFrame:SetAllPoints(hbc_unit.healthBar)
    end
    if not hbc_unit.backgroundTexture then
      hbc_unit.backgroundTexture = hbc_unit.backgroundFrame:CreateTexture()
      local mask = hbc_unit.healthBar.HealthBarMask
      if mask then
        hbc_unit.backgroundTexture:AddMaskTexture(mask)
      end
      hbc_unit.backgroundTexture:SetAllPoints(hbc_unit.backgroundFrame)
    end
    hbc_unit.backgroundTexture:SetTexture(pathToTexture)
    hbc_unit.backgroundTexture:SetVertexColor(color.r, color.g, color.b, color.a)
    hbc_unit.backgroundFrame:Show()
  end
  --TODO hook into player frame to art/vehicle to update the size of the background texture
end

function module:OnDisable()
  local hbc_units = addon:GetAllUnits()
  for _, hbc_unit in pairs(hbc_units) do
    if hbc_unit.backgroundFrame then
      hbc_unit.backgroundFrame:Hide()
    end
  end
end