local _, addonTable = ...

addonTable.playerClass = select(2, UnitClass("player"))

addonTable.isVanilla = true
addonTable.isClassic = true 

addonTable.texturePaths = 
{
  portraitIcon = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\Icon_rounded.tga",
}

addonTable.fontModules =
{
  "Font_player",
  "Font_pet",
  "Font_target",
  "Font_targettarget",
}

addonTable.globalUnitVariables =
{
  player = 
  {
    healthBar = _G.PlayerFrameHealthBar,
    powerBar = _G.PlayerFrameManaBar,
    nameText = _G.PlayerName,
    healthTextLeft = _G.PlayerFrameHealthBarTextLeft,
    healthTextMiddle = _G.PlayerFrameHealthBarText,
    healthTextRight = _G.PlayerFrameHealthBarTextRight,
    powerBarTextLeft = _G.PlayerFrameManaBarTextLeft,
    powerBarTextMiddle = _G.PlayerFrameManaBarTextRight,
    powerBarTextRight = _G.PlayerFrameManaBarText,
    frameTexture = _G.PlayerFrameTexture,
    frameFlash = _G.PlayerStatusTexture
  },
  target = 
  {
    healthBar = _G.TargetFrameHealthBar,
    powerBar = _G.TargetFrameManaBar,
    nameText = _G.TargetFrameTextureFrameName,
    frameTexture = _G.TargetFrameTextureFrameTexture,
    frameFlash = _G.PlayerStatusTexture
  },
  targettarget = 
  {
    healthBar = _G.TargetFrameToTHealthBar,
    powerBar = _G.TargetFrameToTManaBar,
    nameText = _G.TargetFrameToTTextureFrameName,
    frameTexture = _G.TargetFrameToTTextureFrameTexture,
  },
  pet = 
  {
    healthBar = _G.PetFrameHealthBar,
    powerBar = _G.PetFrameManaBar,
    nameText = _G.PetName,
    healthTextLeft = _G.PetFrameHealthBarTextLeft,
    healthTextMiddle = _G.PetFrameHealthBarText,
    healthTextRight = _G.PetFrameHealthBarTextRight,
    powerBarTextLeft = _G.PetFrameManaBarTextLeft,
    powerBarTextMiddle = _G.PetFrameManaBarText,
    powerBarTextRight = _G.PetFrameManaBarTextRight,
    frameTexture = _G.PetFrameTexture,
  },
}