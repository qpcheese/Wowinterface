local _, addonTable = ...

addonTable.playerClass = select(2, UnitClass("player"))

-- isWrath is important for the options to work.
addonTable.isWrath = true
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
  "Font_focus",
  "Font_focustarget",
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
    healthTextLeft = _G.TargetFrameTextureFrame.HealthBarTextLeft,
    healthTextMiddle = _G.TargetFrameTextureFrame.HealthBarText,
    healthTextRight = _G.TargetFrameTextureFrame.HealthBarTextRight,
    powerBarTextLeft = _G.TargetFrameTextureFrame.ManaBarTextLeft,
    powerBarTextMiddle = _G.TargetFrameTextureFrame.ManaBarText,
    powerBarTextRight = _G.TargetFrameTextureFrame.ManaBarTextRight,
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
  focus =
  {
    healthBar = _G.FocusFrameHealthBar,
    powerBar = _G.FocusFrameManaBar,
    nameText = _G.FocusFrameTextureFrameName,
    healthTextLeft = _G.FocusFrameTextureFrame.HealthBarTextLeft,
    healthTextMiddle = _G.FocusFrameTextureFrame.HealthBarText,
    healthTextRight = _G.FocusFrameTextureFrame.HealthBarTextRight,
    powerBarTextLeft = _G.FocusFrameTextureFrame.ManaBarTextLeft,
    powerBarTextMiddle = _G.FocusFrameTextureFrame.ManaBarText,
    powerBarTextRight = _G.FocusFrameTextureFrame.ManaBarTextRight,
    frameTexture = _G.FocusFrameTextureFrameTexture,
  },
  focustarget =
  {
    healthBar = _G.FocusFrameToTHealthBar,
    powerBar = _G.FocusFrameToTManaBar,
    nameText = _G.FocusFrameToTTextureFrameName,
    frameTexture = _G.FocusFrameToTTextureFrameTexture,
  },
  pet =
  {
    healthBar = _G.PetFrameHealthBar,
    powerBar = _G.PetFrameManaBar,
    nameText = _G.PetName,
    -- With Cata they changed the pet frame text to no longer be separated in Left/Middle/Right
    -- to not have to rework the modules all 3 will just refer to PetFrameHealthBarText/PetFrameManaBarText
    healthTextLeft = _G.PetFrameHealthBarText,
    healthTextMiddle = _G.PetFrameHealthBarText,
    healthTextRight = _G.PetFrameHealthBarText,
    powerBarTextLeft = _G.PetFrameManaBarText,
    powerBarTextMiddle = _G.PetFrameManaBarText,
    powerBarTextRight = _G.PetFrameManaBarText,
    frameTexture = _G.PetFrameTexture,
  },
}
