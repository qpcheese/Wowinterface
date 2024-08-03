local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("BetterBossFrames")
Mixin(module, addonTable.hooks)

local Textures =
{
	frameTexture =
	{
		path = addonTable.texturePaths.betterBossFramesFrameTexture,
		coords =
		{
			0.3984375,
			0.84765625,
			0.00390625,
			0.22265625
		},
	},
	frameFlash =
	{
		path = addonTable.texturePaths.betterBossFramesFrameFlash,
		coords =
		{
			0.3984375,
			0.84765625,
			0.00390625,
			0.22265625
		},
	},
	Mask =
	{
		path = addonTable.texturePaths.betterBossFramesMask,
		coords =
		{
			22/128,
			106/128,
			21/64,
			43/64
		},
	},
}

function module:replaceTextures(hbc_unit)
  hbc_unit.frameTexture:SetTexture(Textures.frameTexture.path)
  hbc_unit.frameTexture:SetTexCoord(unpack(Textures.frameTexture.coords))
  hbc_unit.frameFlash:SetTexture(Textures.frameFlash.path)
  hbc_unit.frameFlash:SetTexCoord(unpack(Textures.frameFlash.coords))
  hbc_unit.frameFlash:SetAllPoints(hbc_unit.frameTexture)
  hbc_unit.healthBarMask:SetTexture(Textures.Mask.path)
end

function module:resizeHealthBar(hbc_unit)
	hbc_unit.highLevelTexture:SetAlpha(0)
	hbc_unit.glowTexture:Hide()
	hbc_unit.healthBarMask:ClearAllPoints()
	hbc_unit.healthBarMask:SetPoint("TOPLEFT", hbc_unit.healthBar, "TOPLEFT", -21, 20)
	hbc_unit.healthBarMask:SetPoint("BOTTOMRIGHT", hbc_unit.healthBar, "BOTTOMRIGHT", 21, -20)
	hbc_unit.healthBar:SetHeight(22)
	hbc_unit.nameText:ClearAllPoints()
	hbc_unit.nameText:SetWidth(65)
	hbc_unit.nameText:SetPoint("TOPLEFT", hbc_unit.glowTexture, "TOPLEFT",2,14)
	hbc_unit.levelText:ClearAllPoints()
	hbc_unit.levelText:SetPoint("TOPRIGHT", hbc_unit.glowTexture, "TOPRIGHT",0,14)
end

function module:OnEnable()
	for i=1,5 do
		local hbc_unit = addon:GetUnit("boss"..i)
		self:replaceTextures(hbc_unit)
		self:resizeHealthBar(hbc_unit)
	end
end

function module:OnDisable()
	local function restoreBossFrames(hbc_unit)
		hbc_unit.frameTexture:SetAtlas("UI-HUD-UnitFrame-Target-Boss-Small-PortraitOff")
		hbc_unit.frameTexture:SetTexCoord(0,1,0,1)
		hbc_unit.frameFlash:SetAtlas("UI-HUD-UnitFrame-Target-Boss-Small-PortraitOff-InCombat")
		hbc_unit.frameFlash:SetTexCoord(0,1,0,1)
		hbc_unit.healthBarMask:SetAtlas("UI-HUD-UnitFrame-Party-PortraitOff-Bar-Health-Mask")
		hbc_unit.highLevelTexture:SetAlpha(1)
		hbc_unit.glowTexture:Show()
		hbc_unit.healthBar:SetHeight(10)
		hbc_unit.nameText:ClearAllPoints()
		hbc_unit.nameText:SetWidth(55)
		hbc_unit.nameText:SetPoint("TOPLEFT", hbc_unit.glowTexture, "TOPRIGHT", -56, -1)
		hbc_unit.levelText:ClearAllPoints()
		hbc_unit.levelText:SetPoint("TOPLEFT", hbc_unit.glowTexture, "TOPRIGHT", -83, -2)
	end
	for i=1,5 do
		local hbc_unit = addon:GetUnit("boss"..i)
		restoreBossFrames(hbc_unit)
	end
end

