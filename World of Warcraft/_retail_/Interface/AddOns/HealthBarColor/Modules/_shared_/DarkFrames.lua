local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("DarkFrames")
local frameColor = 
{
  r = 0.2,
  g = 0.2,
  b = 0.2,
  a = 1,
}

function module:OnEnable()
  self:Recolor(1, frameColor.r,frameColor.g,frameColor.b,frameColor.a)
end

function module:OnDisable()
  self:Recolor(0, 1, 1, 1, 1)
end

function module:Recolor(desaturation, r, g, b, a)
  local units = addon:GetAllUnits()
  for _, hbc_unit in pairs(units) do
    hbc_unit.frameTexture:SetDesaturation(desaturation)
    hbc_unit.frameTexture:SetVertexColor(r,g,b,a)
  end
  if addonTable.isRetail then
    for _, texture in pairs(
      {
        PlayerFrame.PlayerFrameContainer.AlternatePowerFrameTexture,
        PlayerFrame.PlayerFrameContainer.VehicleFrameTexture,
        PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerPortraitCornerIcon,
        PartyFrame.MemberFrame1.Texture,
        PartyFrame.MemberFrame2.Texture,
        PartyFrame.MemberFrame3.Texture,
        PartyFrame.MemberFrame4.Texture,
        PetFrameTexture
      }
    ) do
      texture:SetDesaturation(desaturation)
      texture:SetVertexColor(r,g,b,a)
    end
  end
end