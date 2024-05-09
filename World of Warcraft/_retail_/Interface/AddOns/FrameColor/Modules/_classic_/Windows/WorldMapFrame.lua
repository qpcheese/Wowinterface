local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("WorldMapFrame")
local color1

function module:OnEnable()
  local dbObj = addon.db.profile["Windows"]["WorldMapFrame"]
  if dbObj.classcolored1 then
    color1 = addonTable.classColor
  else
    color1 = dbObj.color1
  end
  self:Recolor(color1, 1)
end

function module:OnDisable()
  local color = {r=1,g=1,b=1,a=1}
  self:Recolor(color, 0)
end

function module:Recolor(color1, desaturation)
  local textures = 
  {
    WorldMapZoneMinimapDropDownLeft,
    WorldMapZoneMinimapDropDownMiddle,
    WorldMapZoneMinimapDropDownRight,
    WorldMapContinentDropDownLeft,
    WorldMapContinentDropDownMiddle,
    WorldMapContinentDropDownRight,
    WorldMapZoneDropDownLeft,
    WorldMapZoneDropDownMiddle,
    WorldMapZoneDropDownRight,
  }
  for _, frame in pairs(
    {
      WorldMapFrame.BorderFrame,
      WorldMapFrame.MiniBorderFrame
    }
  ) do
      for _, child in pairs({frame:GetRegions()}) do
        if child:GetObjectType() == "Texture" then
          table.insert(textures, child)
        end
      end
  end
  if addonTable.isWrath then
    for _, texture in pairs(
    {
      MiniBorderLeft,
      MiniBorderRight,
    }
    ) do
      table.insert(textures, texture)
    end  
  end
  for _, texture in pairs(textures) do
    texture:SetDesaturation(desaturation)
    texture:SetVertexColor(color1.r,color1.g,color1.b)
  end
end


