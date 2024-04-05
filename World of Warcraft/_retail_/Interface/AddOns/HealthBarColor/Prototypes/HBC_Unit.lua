local _, addonTable = ...
local addon = addonTable.addon

--speed references
--WoW Api
local SetGradient = SetGradient
local CreateColor = CreateColor
local SetStatusBarTexture = SetStatusBarTexture
--Lua

--[[
  colorStart / colorEnd are used for Statusbar gradients while color is used when a gradient is not possible.
  Commented variables are expected to be added to a unit immediately after NewUnit() is called.
]]
local hbc_unit = 
{
  UnitId = "player",
  isPlayer = true,
  class = "PRIEST",
  classColor = 
  {
    r=1, 
    g=1, 
    b=1, 
    a=1
  },
  classColorStart = 
  {
    r=0.96, 
    g=0.55, 
    b=0.73, 
    a=1
  },
  classColorEnd = 
  {
    r=0.96, 
    g=0.55, 
    b=0.73, 
    a=1
  },
  healthBarDesaturated = false,
  --healthBar
  --healthBarTexture
  --powerBar
  --powerBarTexture
  reactionColor = 
  {
    r=1, 
    g=1, 
    b=1, 
    a=1
  },
  reactionColorStart = 
  {
    r=1, 
    g=1, 
    b=1, 
    a=1
  },
  reactionColorEnd = 
  {
    r=0, 
    g=0, 
    b=1, 
    a=1
  },
  --nameText
  --healthTextLeft
  --healthTextMiddle
  --healthTextRight
  --powerBarTextLeft
  --powerBarTextMiddle
  --powerBarTextRight
  --frame
  healthBarPreparedForColoring = false,
} 
hbc_unit.metatable = { __index = hbc_unit }

function addon:GetMetaUnit()
  return hbc_unit
end

function addon:NewUnit()
  local unit = setmetatable({}, hbc_unit.metatable)
  unit.updateFullCallbacks = {}
  unit.updatePowerCallbacks = {}
  return unit 
end

--Fetch all the data the addon needs to know about a unit always called before hbc_unit:Update()
function hbc_unit:GetUnitDataFull()
  self.isPlayer = UnitIsPlayer(self.UnitId)
  if self.isPlayer then
    self.class = select(2, UnitClass(self.UnitId))
    self.classColor = addonTable.classColors[self.class].classColor
    self.classColorStart = addonTable.classColors[self.class].classColorStart
    self.classColorEnd = addonTable.classColors[self.class].classColorEnd
  end
  --reactionColor
  local reactionColor
  local reaction = UnitReaction("player", self.UnitId)
  if reaction == 2 then 
    reactionColor = addonTable.reactionColors["Hostile"]
  elseif reaction == 4 then
    reactionColor = addonTable.reactionColors["Neutral"]
  else
    reactionColor = addonTable.reactionColors["Friendly"]
  end
  self.reactionColor = reactionColor.reactionColor
  self.reactionColorStart = reactionColor.reactionColorStart
  self.reactionColorEnd = reactionColor.reactionColorEnd
  self:GetUnitPowerData(true)
end

local powerTypeIndex = addonTable.isClassic and 1 or 0
function hbc_unit:GetUnitPowerData(isFullUpdate)
  --powerColor
  local powerToken = select(2, UnitPowerType(self.UnitId, powerTypeIndex)) or "MANA"
  if self.powerToken == powerToken and not isFullUpdate then
    return true
  end
  self.powerToken = powerToken
  local powerColor = addonTable.powerColors[self.powerToken] or addonTable.powerColors["MANA"]
  self.powerColor = powerColor.powerColor
  self.powerColorStart = powerColor.powerColorStart
  self.powerColorEnd = powerColor.powerColorEnd
end

--The Update function is called when a unit needs a full update, e.g. target changed / focus changed.
--Callbacks are added directly to the hbc_unit by accessing its callback table with ["key"] = callback.
function hbc_unit:FullUpdate()
  self:GetUnitDataFull()
  for _, callback in next, self.updateFullCallbacks do
    callback()
  end
  for _, callback in next, self.updatePowerCallbacks do
    callback()
  end
end

function hbc_unit:PowerUpdate()
  local skip = self:GetUnitPowerData()
  if skip then
    return
  end
  for _, callback in next, self.updatePowerCallbacks do
    callback()
  end
end

--[[
  The below functions are convenience functions to reduce code in the modules and being able to quickly 
  adapt to changes made by Blizzard.
]]
function hbc_unit:PrepareHealthBarTexture()
  if addonTable.isRetail then
    local layer, sublayer = self.healthBarTexture:GetDrawLayer()
    for k, v in pairs(
    {
      self.overAbsorbGlow,
      self.tiledFillOverlay,
    }
    ) do 
      v:SetDrawLayer(layer, ( sublayer + 1 ) )
    end
  end
end

function hbc_unit:PrepareHealthBarForColoring()
  self.healthBar:SetStatusBarDesaturated(true)
  if addonTable.isRetail then
    self:PrepareHealthBarTexture()
  end
  self.healthBarPreparedForColoring = true
end

if addonTable.isRetail then
  function hbc_unit:RestoreHealthBarToDefault()
    self.healthBarTexture:SetDesaturation(0)
    self.healthBar:SetStatusBarColor(1, 1, 1)
    self.healthBarPreparedForColoring = false
  end
else
  function hbc_unit:RestoreHealthBarToDefault()
    self.healthBar:SetStatusBarColor(0, 1, 0)
  end
end

function hbc_unit:RestorePowerBarToDefault()
  self.powerBarTexture:SetDesaturation(0)
  self.powerBar:SetStatusBarColor(1, 1, 1)
  self.powerBarPreparedForColoring = false
end

function hbc_unit:SetHealthBarToCustomColor(colorStart, colorEnd)
  if not self.healthBarPreparedForColoring then
    self:PrepareHealthBarForColoring()
  end
  self.healthBarTexture:SetGradient("HORIZONTAL", CreateColor(colorStart.r, colorStart.g, colorStart.b, colorStart.a), CreateColor(colorEnd.r, colorEnd.g, colorEnd.b, colorEnd.a))
end

function hbc_unit:SetHealthBarToClassColor()
  if not self.healthBarPreparedForColoring then
    self:PrepareHealthBarForColoring()
  end
  self.healthBarTexture:SetGradient("HORIZONTAL", CreateColor(self.classColorStart.r, self.classColorStart.g, self.classColorStart.b, self.classColorStart.a), CreateColor(self.classColorEnd.r, self.classColorEnd.g, self.classColorEnd.b, self.classColorEnd.a))
end

function hbc_unit:SetHealthBarToDebuffColor(debuffType)
  if not self.healthBarPreparedForColoring then
    self:PrepareHealthBarForColoring()
  end
  local color = addonTable.debuffColors[debuffType]
  self.healthBarTexture:SetGradient("HORIZONTAL", CreateColor(color.debuffColorStart.r, color.debuffColorStart.g, color.debuffColorStart.b, color.debuffColorStart.a), CreateColor(color.debuffColorEnd.r, color.debuffColorEnd.g, color.debuffColorEnd.b, color.debuffColorEnd.a))
end

function hbc_unit:SetHealthBarToReactionColor()
  if not self.healthBarPreparedForColoring then
    self:PrepareHealthBarForColoring()
  end
  self.healthBarTexture:SetGradient("HORIZONTAL", CreateColor(self.reactionColorStart.r, self.reactionColorStart.g, self.reactionColorStart.b, self.reactionColorStart.a), CreateColor(self.reactionColorEnd.r, self.reactionColorEnd.g, self.reactionColorEnd.b, self.reactionColorEnd.a))
end

function hbc_unit:SetPowerBarColor()
  self.powerBarTexture:SetGradient("HORIZONTAL", CreateColor(self.powerColorStart.r, self.powerColorStart.g, self.powerColorStart.b, self.powerColorStart.a), CreateColor(self.powerColorEnd.r, self.powerColorEnd.g, self.powerColorEnd.b, self.powerColorEnd.a))
end

--Path to a texture.
function hbc_unit:SetHealthBarTexture(path)
  self.healthBar:SetStatusBarTexture(path)
  if addonTable.isRetail then
    self:PrepareHealthBarTexture()
  end
end

--Path to a texture.
function hbc_unit:SetPowerBarTexture(path)
  self.powerBar:SetStatusBarTexture(path)
end

--[[
  Name Text
  ]]

function hbc_unit:SetNameFont(font, fontSize, outlinemode)
  self.nameText:SetFont(font, fontSize, outlinemode)
end

function hbc_unit:SetNameToClassColor()
  self.nameText:SetTextColor(self.classColor.r, self.classColor.g, self.classColor.b, self.classColor.a)
end

function hbc_unit:SetNameToReactionColor()
  self.nameText:SetTextColor(self.reactionColor.r, self.reactionColor.g, self.reactionColor.b, self.reactionColor.a)
end

function hbc_unit:SetNameToCustomColor(color)
  self.nameText:SetTextColor(color.r, color.g, color.b, color.a)
end

--[[
  Health Text
  ]]

function hbc_unit:SetHealthTextFont(font, fontSize, outlinemode)
  for _, text in pairs(
    {
      self.healthTextLeft,
      self.healthTextMiddle,
      self.healthTextRight
    }
  ) do
    text:SetFont(font, fontSize, outlinemode)
  end
end

function hbc_unit:SetHealthTextToClassColor()
  for _, text in pairs(
    {
      self.healthTextLeft,
      self.healthTextMiddle,
      self.healthTextRight
    }
  ) do
    text:SetTextColor(self.classColor.r, self.classColor.g, self.classColor.b, self.classColor.a)
  end
end

function hbc_unit:SetHealthTextToReactionColor()
  for _, text in pairs(
    {
      self.healthTextLeft,
      self.healthTextMiddle,
      self.healthTextRight
    }
  ) do
    text:SetTextColor(self.reactionColor.r, self.reactionColor.g, self.reactionColor.b, self.reactionColor.a)
  end
end

function hbc_unit:SetHealthTextToCustomColor(color)
  for _, text in pairs(
    {
      self.healthTextLeft,
      self.healthTextMiddle,
      self.healthTextRight
    }
  ) do
    text:SetTextColor(color.r, color.g, color.b, color.a)
  end
end

--[[
  Power Text
  ]]

function hbc_unit:SetPowerTextFont(font, fontSize, outlinemode)
  for _, text in pairs(
    {
      self.powerBarTextLeft,
      self.powerBarTextMiddle,
      self.powerBarTextRight
    }
  ) do
    text:SetFont(font, fontSize, outlinemode)
  end
end

function hbc_unit:SetPowerTextToClassColor()
  for _, text in pairs(
    {
      self.powerBarTextLeft,
      self.powerBarTextMiddle,
      self.powerBarTextRight
    }
  ) do
    text:SetTextColor(self.classColor.r, self.classColor.g, self.classColor.b, self.classColor.a)
  end
end

function hbc_unit:SetPowerTextToReactionColor()
  for _, text in pairs(
    {
      self.powerBarTextLeft,
      self.powerBarTextMiddle,
      self.powerBarTextRight
    }
  ) do
    text:SetTextColor(self.reactionColor.r, self.reactionColor.g, self.reactionColor.b, self.reactionColor.a)
  end
end

function hbc_unit:SetPowerTextToPowerColor()
  for _, text in pairs(
    {
      self.powerBarTextLeft,
      self.powerBarTextMiddle,
      self.powerBarTextRight
    }
  ) do
    text:SetTextColor(self.powerColor.r, self.powerColor.g, self.powerColor.b, self.powerColor.a)
  end
end

function hbc_unit:SetPowerTextToCustomColor(color)
  for _, text in pairs(
    {
      self.powerBarTextLeft,
      self.powerBarTextMiddle,
      self.powerBarTextRight
    }
  ) do
    text:SetTextColor(color.r, color.g, color.b, color.a)
  end
end

--Glow
function hbc_unit:SetGlowToClassColor()
  self.glowTexture:SetVertexColor(self.classColor.r, self.classColor.g, self.classColor.b, self.classColor.a)
end

function hbc_unit:SetGlowToReactionColor()
  self.glowTexture:SetVertexColor(self.reactionColor.r, self.reactionColor.g, self.reactionColor.b, self.reactionColor.a)
end

function hbc_unit:SetGlowToCustomColor(color)
  self.glowTexture:SetVertexColor(color.r, color.g, color.b, color.a)
end
