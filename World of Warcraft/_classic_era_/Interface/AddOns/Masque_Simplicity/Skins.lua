--[[

	This file is part of 'Masque: Simplicity', an add-on for World of Warcraft. 
	
	* File...: Skins.lua
	* Author.: Epix, StormFX
	
	Simplicity Skin
	
]]

local MSQ = LibStub and LibStub("Masque", true)
if not MSQ then return end

local AddOn, Core = ...

----------------------------------------
-- Locales
---

-- Locale
local L = Core.Locale

-- Skin Info
local Version = GetAddOnMetadata(AddOn, "Version")
local Websites = {
	"https://www.curseforge.com/wow/addons/masque-simplicity",
}

----------------------------------------
-- Simplicity
---

MSQ:AddSkin("Simplicity", {
	Icon = {
		Width = 36,
		Height = 36,
		TexCoords = { 0.08, 0.92, 0.08, 0.92 },
	},
	Cooldown = {
		Width = 36,
		Height = 36,
	},
	ChargeCooldown = {
		Width = 36,
		Height = 36,
	},
	Name = {
		Width = 42,
		Height = 10,
		OffsetY = 2,
	},
	Count = {
		Width = 42,
		Height = 10,
		OffsetX = -2,
		OffsetY = 4,
	},
	HotKey = {
		Width = 42,
		Height = 10,
		OffsetX = -3,
		OffsetY = -3,
	},
	Duration = {
		Width = 42,
		Height = 10,
		OffsetY = -3,
	},
	Backdrop = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\AddOns\Masque_Simplicity\Textures\Backdrop]],
	},			
	Disabled = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Color = { 0.77, 0.12, 0.23, 1 },
		Texture = [[Interface\AddOns\Masque_Simplicity\Textures\Normal]],
	},		
	Border = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = { 1, 1, 1, 0.1 },
		Texture = [[Interface\AddOns\Masque_Simplicity\Textures\Border]],
	},				
	Checked = {
		Width = 38,
		Height = 38,
		BlendMode = "ADD",
		DrawLayer = "OVERLAY",
		DrawLevel = 0,
		Color = { 1, 1, 1, 1 },
		Texture = [[Interface\AddOns\Masque_Simplicity\Textures\Border]],		
	},
	Normal = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\AddOns\Masque_Simplicity\Textures\Normal]],
		Color = { 0.125, 0.125, 0.125, 1 },
	},
	Pushed = {
		Width = 38,
		Height = 38,
		Texture = [[Interface\AddOns\Masque_Simplicity\Textures\Overlay]],
		Color = { 1, 1, 1, 0.1 },
	},
	Highlight = {
		Width = 42,
		Height = 42,	
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque_Simplicity\Textures\Overlay]],
		Color = { 1, 1, 1, 0.1 },
	},
	Flash = {
		Width = 38,
		Height = 38,
		Color = { 1, 0, 0, 0.2 },
		Texture = [[Interface\AddOns\Masque_Simplicity\Textures\Overlay]],
	},
	AutoCastable = {
		Width = 38,
		Height = 38,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	
}, true)