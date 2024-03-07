local _, addonTable = ...

addonTable.playerClass = select(2, UnitClass("player"))

addonTable.isRetail = true

addonTable.texturePaths = 
{
  --BiggerHealthBar
  biggerHealthBarFrameTexture = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\BiggerHealthBar_FrameTexture.tga",
  biggerHealthBarFrameFlash = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\BiggerHealthBar_FrameFlash.tga",
  biggerHealthBarMask = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\BiggerHealthBar_PlayerFrameHealthMask.tga",
  --BetterBossFrames 
  betterBossFramesFrameTexture = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\BetterBossFrames.png",
  betterBossFramesFrameFlash = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\BetterBossFlash.png",
  betterBossFramesMask = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\MaskTextureBoss.png",
  portraitIcon = "Interface\\AddOns\\HealthBarColor\\Media\\Textures\\Icon.tga",
}

addonTable.fontModules =
{
  "Font_player",
  "Font_pet",
  "Font_target",
  "Font_targettarget",
  "Font_focus",
  "Font_focustarget",
  "Font_boss1",
  "Font_boss2",
  "Font_boss3",
  "Font_boss4",
  "Font_boss5",
}

addonTable.globalUnitVariables =
{
  player = 
  {
    frame = _G.PlayerFrame, 
    healthBar = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar,
    powerBar = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea.ManaBar,
    nameText = _G.PlayerName,
    healthTextLeft = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar.LeftText,
    healthTextMiddle = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar.TextString,
    healthTextRight = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar.RightText,
    powerBarTextLeft = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea.ManaBar.LeftText,
    powerBarTextMiddle = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea.ManaBar.ManaBarText,
    powerBarTextRight = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea.ManaBar.RightText,
    frameTexture = _G.PlayerFrame.PlayerFrameContainer.FrameTexture,
    alternatePowerFrameTexture = _G.PlayerFrame.PlayerFrameContainer.AlternatePowerFrameTexture,
    totalAbsorbBar = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar.TotalAbsorbBar,
    tiledFillOverlay = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar.TotalAbsorbBar.TiledFillOverlay,
    overAbsorbGlow = _G.PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarArea.HealthBar.OverAbsorbGlow,
  },
  target = 
  {
    frame = _G.TargetFrame,
    healthBar = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
    powerBar = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar,
    nameText = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.Name,
    healthTextLeft = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText,
    healthTextMiddle = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString,
    healthTextRight = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText,
    powerBarTextLeft = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.LeftText,
    powerBarTextMiddle = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.ManaBarText,
    powerBarTextRight = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.RightText,
    glowTexture = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
    frameTexture = _G.TargetFrame.TargetFrameContainer.FrameTexture,
    totalAbsorbBar = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TotalAbsorbBar,
    tiledFillOverlay = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TotalAbsorbBar.TiledFillOverlay,
    overAbsorbGlow = _G.TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.OverAbsorbGlow,
  },
  focus =
  {
    frame = _G.FocusFrame,
    healthBar = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
    powerBar = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.ManaBar,
    nameText = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.Name,
    healthTextLeft = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText,
    healthTextMiddle = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString,
    healthTextRight = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText,
    powerBarTextLeft = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.LeftText,
    powerBarTextMiddle = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.ManaBarText,
    powerBarTextRight = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.RightText,
    glowTexture = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
    frameTexture = _G.FocusFrame.TargetFrameContainer.FrameTexture,
    totalAbsorbBar = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TotalAbsorbBar,
    tiledFillOverlay = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TotalAbsorbBar.TiledFillOverlay,
    overAbsorbGlow = _G.FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.OverAbsorbGlow,
  },
  targettarget = 
  {
    frame = _G.TargetFrameToT,
    healthBar = _G.TargetFrameToT.HealthBar,
    powerBar = _G.TargetFrameToT.ManaBar,
    nameText = _G.TargetFrameToT.name,
    frameTexture = _G.TargetFrameToT.FrameTexture,
  },
  focustarget = 
  {
    frame = _G.FocusFrameToT,
    healthBar = _G.FocusFrameToT.HealthBar,
    powerBar = _G.FocusFrameToT.ManaBar,
    nameText = _G.FocusFrameToT.name,
    frameTexture = _G.FocusFrameToT.FrameTexture,
  },
  pet = 
  {
    frame = _G.PetFrame,
    healthBar = _G.PetFrameHealthBar,
    powerBar = _G.PetFrameManaBar,
    nameText = _G.PetName,
    healthTextLeft = _G.PetFrameHealthBarTextLeft,
    healthTextMiddle = _G.PetFrameHealthBarText,
    healthTextRight = _G.PetFrameHealthBarTextRight,
    powerBarTextLeft = _G.PetFrameManaBarTextLeft,
    powerBarTextMiddle = _G.PetFrameManaBarText,
    powerBarTextRight = _G.PetFrameManaBarTextRight,
    frameTexture = _G.PetFrameTexture
  },
  boss1 = 
  {
    frame = _G.Boss1TargetFrame,
    healthBar = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
    powerBar = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar,
    nameText = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.Name,
    healthTextLeft = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText,
    healthTextMiddle = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString,
    healthTextRight = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText,
    powerBarTextLeft = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.LeftText,
    powerBarTextMiddle = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.ManaBarText,
    powerBarTextRight = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.RightText,
    glowTexture = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
    highLevelTexture = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture,
    frameFlash = _G.Boss1TargetFrame.threatIndicator,
    frameTexture = _G.Boss1TargetFrame.TargetFrameContainer.FrameTexture,
    levelText = _G.Boss1TargetFrame.TargetFrameContent.TargetFrameContentMain.LevelText,
  },
  boss2 = 
  {
    frame = _G.Boss2TargetFrame,
    healthBar = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
    powerBar = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar,
    nameText = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.Name,
    healthTextLeft = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText,
    healthTextMiddle = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString,
    healthTextRight = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText,
    powerBarTextLeft = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.LeftText,
    powerBarTextMiddle = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.ManaBarText,
    powerBarTextRight = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.RightText,
    glowTexture = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
    highLevelTexture = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture,
    frameFlash = _G.Boss2TargetFrame.threatIndicator,
    frameTexture = _G.Boss2TargetFrame.TargetFrameContainer.FrameTexture,
    levelText = _G.Boss2TargetFrame.TargetFrameContent.TargetFrameContentMain.LevelText,
  },
  boss3 = 
  {
    frame = _G.Boss3TargetFrame,
    healthBar = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
    powerBar = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar,
    nameText = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.Name,
    healthTextLeft = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText,
    healthTextMiddle = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString,
    healthTextRight = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText,
    powerBarTextLeft = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.LeftText,
    powerBarTextMiddle = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.ManaBarText,
    powerBarTextRight = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.RightText,
    glowTexture = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
    highLevelTexture = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture,
    frameFlash = _G.Boss3TargetFrame.threatIndicator,
    frameTexture = _G.Boss3TargetFrame.TargetFrameContainer.FrameTexture,
    levelText = _G.Boss3TargetFrame.TargetFrameContent.TargetFrameContentMain.LevelText,
  },
  boss4 = 
  {
    frame = _G.Boss4TargetFrame,
    healthBar = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
    powerBar = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar,
    nameText = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.Name,
    healthTextLeft = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText,
    healthTextMiddle = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString,
    healthTextRight = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText,
    powerBarTextLeft = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.LeftText,
    powerBarTextMiddle = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.ManaBarText,
    powerBarTextRight = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.RightText,
    glowTexture = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
    highLevelTexture = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture,
    frameFlash = _G.Boss4TargetFrame.threatIndicator,
    frameTexture = _G.Boss4TargetFrame.TargetFrameContainer.FrameTexture,
    levelText = _G.Boss4TargetFrame.TargetFrameContent.TargetFrameContentMain.LevelText,
  },
  boss5 = 
  {
    frame = _G.Boss5TargetFrame,
    healthBar = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar,
    powerBar = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar,
    nameText = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.Name,
    healthTextLeft = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.LeftText,
    healthTextMiddle = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.TextString,
    healthTextRight = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar.RightText,
    powerBarTextLeft = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.LeftText,
    powerBarTextMiddle = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.ManaBarText,
    powerBarTextRight = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.ManaBar.RightText,
    glowTexture = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor,
    highLevelTexture = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture,
    frameFlash = _G.Boss5TargetFrame.threatIndicator,
    frameTexture = _G.Boss5TargetFrame.TargetFrameContainer.FrameTexture,
    levelText = _G.Boss5TargetFrame.TargetFrameContent.TargetFrameContentMain.LevelText,
  },
}