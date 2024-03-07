local Addon = ...
local LSM = LibStub("LibSharedMedia-3.0")
if (LSM == nil) then 
	return 
end

-- Libraries
local BACKGROUND = LSM.MediaType.BACKGROUND
local BORDER = LSM.MediaType.BORDER
local STATUSBAR = LSM.MediaType.STATUSBAR

-- Paths
local Path = ([[Interface\AddOns\%s\Media\]]):format(Addon)
local LibPath = {
	[BACKGROUND] = Path..[[Background\]],
	[BORDER] = Path..[[Border\]],
	[STATUSBAR] = Path..[[Statusbar\]]
}

-- Shorthand Register
local Register = function(lib, key, data) LSM:Register(lib, key, LibPath[lib]..data) end

-- Textures
Register(BACKGROUND, "AZ ActionButton Backdrop (Circular)", "actionbutton-backdrop.tga")
Register(BACKGROUND, "AZ ActionButton Border (Circular)", "actionbutton-border.tga")
Register(BACKGROUND, "AZ GroupFinder (Blue)", "group-finder-eye-blue.tga")
Register(BACKGROUND, "AZ GroupFinder (Green)", "group-finder-eye-green.tga")
Register(BACKGROUND, "AZ GroupFinder (Orange)", "group-finder-eye-orange.tga")
Register(BACKGROUND, "AZ GroupFinder (Purple)", "group-finder-eye-purple.tga")
Register(BACKGROUND, "AZ GroupFinder (Red)", "group-finder-eye-red.tga")
Register(BACKGROUND, "AZ GroupRole (DPS)", "grouprole-icons-dps.tga")
Register(BACKGROUND, "AZ GroupRole (Heal)", "grouprole-icons-heal.tga")
Register(BACKGROUND, "AZ GroupRole (Tank)", "grouprole-icons-tank.tga")
Register(BACKGROUND, "GP ActionButton Mask (Circular)", "actionbutton-mask-circular.tga")
Register(BACKGROUND, "GP ActionButton Mask (Square)", "actionbutton-mask-square.tga")
Register(BACKGROUND, "GP ActionButton Mask (Square Rounded)", "actionbutton-mask-square-rounded.tga")
Register(BACKGROUND, "GP ActionButton Highlight (Circular)", "actionbutton-spellhighlight.tga")
Register(BACKGROUND, "GP ActionButton Highlight (Square)", "actionbutton-spellhighlight-square.tga")
Register(BACKGROUND, "GP ActionButton Highlight (Square Rounded)", "actionbutton-spellhighlight-square-rounded.tga")
Register(BACKGROUND, "GP Coins (Grid)", "coins.tga")
Register(BACKGROUND, "SCP DiabloRunes (Grid)", "diabolic_runes.tga")

-- Borders
Register(BORDER, "BigInputBox Rounded Backdrop", "rounded-backdrop-small.tga")
Register(BORDER, "BigInputBox Rounded Border", "rounded-border-small.tga")
Register(BORDER, "GP Aura Border", "aura_border.tga")
Register(BORDER, "GP Tooltip Border", "better-blizzard-border-small-alternate.tga")
Register(BORDER, "GP Highlight Border", "border-glow-overlay.tga")

-- StatusBars
Register(STATUSBAR, "AZ Legacy HealthBar", "statusbar-power.tga")
Register(STATUSBAR, "AZ Legacy PowerBar", "statusbar-dark.tga")
Register(STATUSBAR, "GP Tooltip StatusBar", "statusbar-normal.tga")
