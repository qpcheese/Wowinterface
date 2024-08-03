local _, addonTable = ...
local addon = addonTable.addon

local module = addon:NewModule("BiggerHealthBars")
Mixin(module, addonTable.hooks)
local Player, Target --see OnEnable

--ULx, ULy, LLx, LLy, URx, URy, LRx, LRy
local textures = 
{
  player = 
  {
    frameTexture = 
    {
      path = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\Bigger_Normal_classic.tga",
      coords =  {1, 0, 1, 0.78125, 0.09375, 0, 0.09375, 0.78125},
    },
    frameFlash = 
    {
      path = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\Bigger_frameFlash_classic.tga",
      coords = {0, 0, 0, 0.53125, 0.74609375, 0, 0.74609375, 0.53125}
    },
  },
  target = 
  {
    normal = 
    {
      path = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\Bigger_Normal_classic.tga",
      --coords =  {0.09375, 0, 0.09375, 0.78125, 1, 0, 1, 0.78125},
    },
    elite = 
    {
      path = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\Bigger_Elite_classic.tga",
    },
    worldboss = 
    {
      path = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\Bigger_Elite_classic.tga",
    },
    rareelite = 
    {
      path = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\Bigger_Elite_classic.tga",
    },
    rare = 
    {
      path = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\Bigger_Rare_classic.tga",
    },
  }
} 

--PLAYER--
local function toPlayerArt() 
  Player.frameTexture:SetTexture(textures.player.frameTexture.path)
  Player.frameTexture:SetTexCoord(unpack(textures.player.frameTexture.coords))
  Player.frameFlash:SetTexture(textures.player.frameFlash.path)
  Player.frameFlash:SetTexCoord(unpack(textures.player.frameFlash.coords))
  Player.healthBar:SetPoint("TOPLEFT", Player.frameTexture, 106, -21)
  Player.healthBar:SetHeight(30)
end

local function restorePlayer() 
  Player.frameTexture:SetTexture("Interface\\TARGETINGFRAME\\UI-TargetingFrame.blp")
  Player.frameTexture:SetTexCoord(unpack(textures.player.frameTexture.coords))
  Player.frameFlash:SetTexture("Interface\\CHARACTERFRAME\\UI-Player-Status.blp")
  Player.frameFlash:SetTexCoord(unpack(textures.player.frameFlash.coords))
  Player.healthBar:SetPoint("TOPLEFT", Player.frameTexture, "TOPLEFT", 106, -41)
  Player.healthBar:SetHeight(12.000005722046)
end

--TARGET--
local function toTargetArt(classification)
  if not textures.target[classification] then 
    Target.healthBar:SetPoint("TOPRIGHT", Target.frameTexture, "TOPRIGHT", -106, -41)
    Target.healthBar:SetHeight(12.000005722046)
    return 
  end
  Target.frameTexture:SetTexture(textures.target[classification].path)
  Target.healthBar:SetPoint("TOPRIGHT", Target.frameTexture, "TOPRIGHT", -106,-22.000001907349)
  Target.healthBar:SetHeight(30)
end

local function restoreTarget() 
  local classification = UnitClassification("target")
  local isNormalTexure = nil
  if classification == "normal" then
    Target.frameTexture:SetTexture("Interface\\TARGETINGFRAME\\UI-TargetingFrame.blp")
    isNormalTexure = true
  elseif classification == "minus" then
    Target.frameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus")
    isNormalTexure = true
  elseif classification == "worldboss" or classification == "elite" then
    Target.frameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite")
  elseif  classification == "rareelite" then
    Target.frameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite")
  elseif classification == "rare" then
    Target.frameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare")
  else
    Target.frameTexture:SetTexture("Interface\\TARGETINGFRAME\\UI-TargetingFrame.blp")
    isNormalTexure = true
  end
  if isNormalTexure then
    if classification == "minus" then
      TargetFrameBackground:SetSize(119,12)
      TargetFrameBackground:SetPoint("BOTTOMLEFT", Target.frameTexture, "BOTTOMLEFT", 7, 47)
    else
      TargetFrameBackground:SetSize(119,25)
      TargetFrameBackground:SetPoint("BOTTOMLEFT", Target.frameTexture, "BOTTOMLEFT", 7, 35)
    end
  else
    TargetFrameBackground:SetSize(119,25)
    TargetFrameBackground:SetPoint("BOTTOMLEFT", Target.frameTexture, "BOTTOMLEFT", 7, 35)
  end
  Target.healthBar:SetPoint("TOPRIGHT", Target.frameTexture, "TOPRIGHT", -106, -41)
  Target.healthBar:SetHeight(12.000005722046)
  module:Unhook(TargetFrameNameBackground, "OnShow")
  TargetFrameNameBackground:Show()
end


function module:OnEnable()
  --Player
  Player = addon:GetUnit("player")
  self:HookFunc("PlayerFrame_ToPlayerArt", toPlayerArt)
  toPlayerArt() 
  --Target
  Target = addon:GetUnit("target")
  self:HookScript(TargetFrameNameBackground, "OnShow", function()
    TargetFrameNameBackground:Hide()
  end)
  self:HookFunc("TargetFrame_CheckClassification", function(self, forceNormalTexture)
    if forceNormalTexture then
      toTargetArt("normal")
    else
      local classification = UnitClassification(self.unit)
      toTargetArt(classification)
    end
  end)
  TargetFrameBackground:SetPoint("TOPRIGHT", Target.frameTexture, "TOPRIGHT", -106,-22.000001907349)
  TargetFrameNameBackground:Hide()
  local classification = UnitClassification("target") 
  toTargetArt(classification)
end

function module:OnDisable()
  self:DisableHooks()
  restorePlayer() 
  restoreTarget() 
end