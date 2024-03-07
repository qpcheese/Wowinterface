local addonName, addonTable = ...

local L = LibStub("AceLocale-3.0"):GetLocale("Rarity")
local CONSTANTS = addonTable.constants

local holidayEventPets = {
	["Clockwork Rocket Bot"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Clockwork Rocket Bot"],
		spellId = 54187,
		itemId = 34425,
		items = { 116762 },
		chance = 50,
		creatureId = 24968,
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.WINTERS_VEIL,
		questId = { 6983, 7043 },
		coords = { { m = 87, x = 33.2, y = 67.8 }, { m = 25, x = 42.4, y = 41 }, { m = 86, x = 54.4, y = 77 } },
	},
	["Darkmoon Eye"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Darkmoon Eye"],
		spellId = 132789,
		itemId = 91040,
		items = { 91086 },
		chance = 50,
		creatureId = 67332,
		sourceText = L["This bag is rewarded for completing the pet battle daily offered by Jeremy Feasel at the Darkmoon Faire."],
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.DARKMOON_FAIRE,
		questId = 32175,
		coords = { { m = 407, x = 47.8, y = 62.6, n = L["Jeremy Feasel"] } },
	},
	["Frightened Bush Chicken"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Frightened Bush Chicken"],
		spellId = 171500,
		itemId = 116403,
		items = { 116404 },
		chance = 33,
		creatureId = 85846,
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.PILGRIMS_BOUNTY,
		coords = {
			{ m = 523, x = 60, y = 34.2 },
			{ m = 1, x = 46.4, y = 13.8 },
			{ m = 89, x = 61.8, y = 46.4 },
			{ m = 88, x = 31, y = 69.6 },
			{ m = 37, x = 33.8, y = 50.8 },
			{ m = 998, x = 65.2, y = 13.8 },
			{ m = 37, x = 33.6, y = 50.6 },
			{ m = 998, x = 63.4, y = 9 },
		},
	},
	["Green Helper Box"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Green Helper Box"],
		spellId = 26533,
		itemId = 21301,
		items = { 21310 },
		chance = 4,
		creatureId = 15698,
		sourceText = L["Available starting December 25th"],
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.WINTERS_VEIL,
		questId = { 8768 },
		coords = {
			zoneOverride = L["Greatfather Winter's Tree"],
			{ m = 87, x = 33.5, y = 66 },
			{ m = 86, x = 49.3, y = 78.4 },
		},
		christmasOnly = true,
	},
	["Grumpling"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.SPECIAL,
		name = L["Grumpling"],
		spellId = 191967,
		itemId = 128770,
		obtain = L["Obtained by opening Snow Mound in Frostfire Ridge"],
		chance = 20,
		creatureId = 97229,
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.WINTERS_VEIL,
		coords = { { m = 525, x = 45.8, y = 26.6, n = L["Snow Mound"] } },
	},
	["Ice Chip"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Ice Chip"],
		spellId = 74932,
		itemId = 53641,
		items = { 54536, 117394 },
		chance = 25,
		groupSize = 5,
		equalOdds = true,
		creatureId = 40198,
		lockDungeonId = 286,
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.MIDSUMMER_FESTIVAL,
		coords = { { m = 265, x = 31.2, y = 50.8, i = true, n = L["Ahune"] } },
	},
	["Jingling Bell"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Jingling Bell"],
		spellId = 26529,
		itemId = 21308,
		items = { 21310 },
		chance = 4,
		creatureId = 15706,
		sourceText = L["Available starting December 25th"],
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.WINTERS_VEIL,
		coords = {
			zoneOverride = L["Greatfather Winter's Tree"],
			{ m = 87, x = 33.5, y = 66 },
			{ m = 86, x = 49.3, y = 78.4 },
		},
		questId = { 8768 },
		christmasOnly = true,
	},
	["Lump of Coal"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Lump of Coal"],
		spellId = 103125,
		itemId = 73797,
		items = { 116762 },
		chance = 50,
		creatureId = 55215,
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.WINTERS_VEIL,
		questId = { 6983, 7043 },
		coords = { { m = 87, x = 33.2, y = 67.8 }, { m = 25, x = 42.4, y = 41 }, { m = 86, x = 54.4, y = 77 } },
	},
	["Rotten Helper Box"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Rotten Helper Box"],
		spellId = 148567,
		itemId = 104317,
		items = { 116762 },
		chance = 100,
		creatureId = 73741,
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.WINTERS_VEIL,
		questId = { 6983, 7043 },
		coords = { { m = 87, x = 33.2, y = 67.8 }, { m = 25, x = 42.4, y = 41 }, { m = 86, x = 54.4, y = 77 } },
	},
	["Moon Moon"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Moon Moon"],
		spellId = 144761,
		itemId = 101570,
		npcs = { 71992 },
		chance = 17,
		creatureId = 72160,
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.DARKMOON_FAIRE,
		coords = { { m = CONSTANTS.UIMAPIDS.DARKMOON_ISLAND, x = 39.8, y = 44.4, n = L["Moonfang"] } },
	},
	["Red Helper Box"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Red Helper Box"],
		spellId = 26541,
		itemId = 21305,
		items = { 21310 },
		chance = 4,
		creatureId = 15705,
		sourceText = L["Available starting December 25th"],
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.WINTERS_VEIL,
		questId = { 8768 },
		coords = {
			zoneOverride = L["Greatfather Winter's Tree"],
			{ m = 87, x = 33.5, y = 66 },
			{ m = 86, x = 49.3, y = 78.4 },
		},
		christmasOnly = true,
	},
	["Sea Pony"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.FISHING,
		name = L["Sea Pony"],
		spellId = 103588,
		itemId = 73953,
		zones = { "407" },
		chance = 1000,
		requiresPool = false,
		creatureId = 55386,
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.DARKMOON_FAIRE,
		coords = { { m = 407 } },
	},
	["Snowman Kit"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Snowman Kit"],
		spellId = 26045,
		itemId = 21309,
		items = { 21310 },
		chance = 4,
		creatureId = 15710,
		sourceText = L["Available starting December 25th"],
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.WINTERS_VEIL,
		questId = { 8768 },
		coords = {
			zoneOverride = L["Greatfather Winter's Tree"],
			{ m = 87, x = 33.5, y = 66 },
			{ m = 86, x = 49.3, y = 78.4 },
		},
		christmasOnly = true,
	},
	["Syd the Squid"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Syd the Squid"],
		spellId = 170774,
		itemId = 116064,
		items = { 116062 },
		chance = 50,
		creatureId = 85527,
		sourceText = L["This bag is rewarded for completing the pet battle daily offered by Christoph VonFeasel at the Darkmoon Faire."],
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.DARKMOON_FAIRE,
		questId = 36471,
		coords = { { m = 407, x = 47.4, y = 62.2, n = L["Christoph VonFeasel"] } },
	},
	["Toxic Wasteling"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Toxic Wasteling"],
		spellId = 71840,
		itemId = 50446,
		items = { 54537 },
		chance = 14,
		groupSize = 5,
		equalOdds = true,
		creatureId = 38374,
		lockDungeonId = 288,
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.LOVE_IS_IN_THE_AIR,
		coords = { { m = 310, x = 40.8, y = 52.6, i = true } },
	},
	["Darkmoon Rabbit"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.NPC,
		name = L["Darkmoon Rabbit"],
		spellId = 114090,
		itemId = 80008,
		npcs = { 58336 },
		chance = 10,
		creatureId = 59358,
		coords = { { m = CONSTANTS.UIMAPIDS.DARKMOON_ISLAND, x = 75.6, y = 86.8 } },
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.DARKMOON_FAIRE,
	},
	["Arfus"] = {
		cat = CONSTANTS.ITEM_CATEGORIES.HOLIDAY,
		type = CONSTANTS.ITEM_TYPES.PET,
		method = CONSTANTS.DETECTION_METHODS.USE,
		name = L["Arfus"],
		spellId = 406225,
		itemId = 211271,
		items = { 209024 },
		chance = 100, -- Blind guess
		groupSize = 5,
		equalOdds = true,
		creatureId = 203463,
		lockDungeonId = 285,
		holidayTexture = CONSTANTS.HOLIDAY_TEXTURES.HALLOWS_END,
		coords = { { m = 435, i = true } },
		sourceText = L["Can be contained in Loot-Filled Pumpkin, rewarded for defeating the World Event Dungeon during Hallow's End."],
	},
}

Rarity.ItemDB.MergeItems(Rarity.ItemDB.pets, holidayEventPets)
