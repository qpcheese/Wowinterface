local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("BiggerHealthBar")
Mixin(module, addonTable.hooks)

local textures =
{
  frameTexture =
  {
    path = addonTable.texturePaths.biggerHealthBarFrameTexture,
    coords =
    {
      26/256, --left
      224/256, --right
      26/128, --top
      97/128 -- bottom
    },
  },
  frameFlash =
  {
    path = addonTable.texturePaths.biggerHealthBarFrameFlash,
    coords =
    {
      27.5/256, --left
      219/256, --right
      26/128, --top
      96/128, -- bottom
    },
  },
  alternateFrameTexture =
  {
    coords =
    {
      26/256, --left
      224/256, --right
      26/128, --top
      100/128, -- bottom
    },
  },
  healthBarMask =
  {
    path = addonTable.texturePaths.biggerHealthBarMask,
    coords =
    {
      2/128, --left
      126/128, --right
      15/64, --top
      52/64, -- bottom
    },
  },
}

local resourceBars =
{
	addonTable.globalUnitVariables.player.powerBar,
	InsanityBarFrame,
	AlternatePowerBar,
	MonkStaggerBar,
}

local function onToPlayerArt()
  if InCombatLockdown() then
    --Player's health bar is protected.
    addon:DelayUntilAfterCombat(onToPlayerArt)
    return
  end
  local isAlterntePowerFrame = PlayerFrame.activeAlternatePowerBar
	local frameTexture = isAlterntePowerFrame and PlayerFrame.PlayerFrameContainer.AlternatePowerFrameTexture or PlayerFrame.PlayerFrameContainer.FrameTexture
  local frameFlash =  PlayerFrame.PlayerFrameContainer.FrameFlash
  frameTexture:SetTexture(textures.frameTexture.path)
  if isAlterntePowerFrame then
    frameTexture:SetTexCoord(unpack(textures.alternateFrameTexture.coords))
  else
    frameTexture:SetTexCoord(unpack(textures.frameTexture.coords))
  end
	frameFlash:SetTexture(textures.frameFlash.path)
	frameFlash:SetTexCoord(unpack(textures.frameFlash.coords))
  local mask = addonTable.globalUnitVariables.player.healthBarMask
  local healthBar = addonTable.globalUnitVariables.player.healthBar
	mask:SetTexture(textures.healthBarMask.path)
	mask:SetPoint("TOPLEFT",healthBar,-3,7)
	mask:SetPoint("BOTTOMRIGHT",healthBar,2,-12)
  mask:Show()
  healthBar:SetHeight(31)
  -- Font since tww the halth text is anchored to the container.
  local healthTextLeft = addonTable.globalUnitVariables.player.healthTextLeft
  local healthTextMiddle = addonTable.globalUnitVariables.player.healthTextMiddle
  local healthTextRight = addonTable.globalUnitVariables.player.healthTextRight
  healthTextLeft:SetPoint("LEFT", healthBar, "LEFT")
  healthTextMiddle:SetPoint("CENTER", healthBar, "CENTER")
  healthTextRight:SetPoint("RIGHT", healthBar, "RIGHT")
end

local function onToVehicleArt()
  PlayerFrame.PlayerFrameContainer.FrameFlash:SetTexCoord(0,1,0,1)
  addonTable.globalUnitVariables.player.healthBar.HealthBarMask:Hide()
end

function module:OnEnable()
  self:HookFunc("PlayerFrame_ToPlayerArt", onToPlayerArt)
  self:HookFunc("PlayerFrame_ToVehicleArt", onToVehicleArt)
  for i=1, #resourceBars do
		local statusBar = resourceBars[i]
		statusBar:SetAlpha(0) --hiding it can cause taint
		self:HookScript(statusBar, "OnShow", function()
			statusBar:SetAlpha(0)
		end)
	end
  onToPlayerArt()
end

function module:OnDisable()
	self:DisableHooks()
  local isAlterntePowerFrame = PlayerFrame.activeAlternatePowerBar
	local frameTexture = isAlterntePowerFrame and PlayerFrame.PlayerFrameContainer.AlternatePowerFrameTexture or PlayerFrame.PlayerFrameContainer.FrameTexture
  local frameFlash =  PlayerFrame.PlayerFrameContainer.FrameFlash
  local mask = addonTable.globalUnitVariables.player.healthBarMask
  local healthBar = addonTable.globalUnitVariables.player.healthBar
  if isAlterntePowerFrame then
		frameTexture:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-ClassResource")
    frameTexture:SetTexCoord(0,1,0,1)
		frameFlash:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-ClassResource-InCombat")
    frameFlash:SetTexCoord(0,1,0,1)
	else
		frameTexture:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn")
    frameTexture:SetTexCoord(0,1,0,1)
		frameFlash:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-InCombat")
    frameFlash:SetTexCoord(0,1,0,1)
	end
  mask:SetAtlas("UI-HUD-UnitFrame-Player-PortraitOn-Bar-Health-Mask")
	healthBar:SetHeight(20)
	for i=1, #resourceBars do
		resourceBars[i]:SetAlpha(1)
	end
end

