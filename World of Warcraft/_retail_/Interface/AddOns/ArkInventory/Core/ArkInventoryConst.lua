local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table

ArkInventory = LibStub( "AceAddon-3.0" ):NewAddon( "ArkInventory", "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0", "AceBucket-3.0" )

ArkInventory.Lib = { -- libraries live here
	
	Config = LibStub( "AceConfig-3.0" ),
	Dialog = LibStub( "AceConfigDialog-3.0" ),
	Serializer = LibStub( "AceSerializer-3.0" ),
	
	PeriodicTable = LibStub( "LibPeriodicTable-3.1" ),
	SharedMedia = LibStub( "LibSharedMedia-3.0" ),
	DataBroker = LibStub( "LibDataBroker-1.1" ),
	
	Dewdrop = LibStub( "ArkDewdrop" ),
	
	StaticDialog = LibStub( "LibDialog-1.0" ),
	
}

--[[
	https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
	
	https://us.api.blizzard.com/wow/item/147250?locale=en_US&access_token=USC3iVMQ2zuMtrAB1jG4hjMH9cMSQZPoaD
	https://us.api.blizzard.com/wow/item/147250?locale=en_US&access_token=USC3iVMQ2zuMtrAB1jG4hjMH9cMSQZPoaD&bl=3
	
]]--


ArkInventory.Table = { } -- table functions live here, coded elsewhere

function ArkInventory.Table.Sum( src, fnc )
	local r = 0
	for k, v in pairs( src ) do
		r = r + ( fnc( v ) or 0 )
	end
	return r
end

function ArkInventory.Table.Max( src, fnc )
	local r = nil
	for k, v in pairs( src ) do
		if not r then
			r = ( fnc( v ) or 0 )
		else
			if ( fnc( v ) or 0 ) > r then
				r = ( fnc( v ) or 0 )
			end
		end
	end
	return r
end

function ArkInventory.Table.Elements( src )
	-- #table only returns the number of elements where the table keys are numeric and does not take into account missing values
	if src and type( src ) == "table" then
		local r = 0
		for k in pairs( src ) do
			r = r + 1
		end
		return r
	end
end

function ArkInventory.Table.IsEmpty( src )
	-- #table only returns the number of elements where the table keys are numeric and does not take into account missing values
	if src and type( src ) == "table" then
		for k in pairs( src ) do
			return false
		end
		return true
	end
end

function ArkInventory.Table.Clean( tbl, key, nilsubtables )
	
	-- tbl = table to be cleaned
	
	-- key = a specific key you want cleaned (nil for all keys)
	
	-- nilsubtables (true) = if a value is a table then nil it as well
	-- nilsubtables (false) = if a value is a table then leave the skeleton there
	
	if type( tbl ) ~= "table" then
		return
	end
	
	for k, v in pairs( tbl ) do
		
		if key == nil or key == k then
			
			if type( v ) == "table" then
				
				ArkInventory.Table.Clean( v, nil, nilsubtables )
				
				if nilsubtables then
					--ArkInventory.Output( "erasing subtable ", k )
					tbl[k] = nil
				end
				
			else
				
				--ArkInventory.Output( "erasing value ", k )
				tbl[k] = nil
				
			end
			
		end
		
	end
	
end

function ArkInventory.Table.Wipe( tbl )
	if type( tbl ) == "table" then
		table.wipe( tbl )
	end
end

function ArkInventory.Table.Copy( src )
	
	local cpy
	
	if type( src ) == "table" then
		
		cpy = { }
		
		for src_key, src_val in next, src, nil do
			cpy[ArkInventory.Table.Copy( src_key )] = ArkInventory.Table.Copy( src_val )
		end
		
		if getmetatable( src ) then
			setmetatable( cpy, ArkInventory.Table.Copy( getmetatable( src ) ) )
		end
		
	else
		
		cpy = src
		
	end
	
	return cpy
	
end

function ArkInventory.Table.Merge( src, dst )
	
	if type( src ) == "table" and type( dst ) == "table" then
		
		for key, val in next, src, nil do
			
			if type( val ) == "table" then
				if dst[key] == nil then
					dst[ArkInventory.Table.Copy( key )] = ArkInventory.Table.Copy( val )
				end
				ArkInventory.Table.Merge( src[key], dst[key] )
			else
				dst[ArkInventory.Table.Copy( key )] = ArkInventory.Table.Copy( val )
			end
			
		end
		
	end
	
end

function ArkInventory.Table.Subset( t1, t2 )
	
	-- t1 must be a subset of t2
	
	if type( t1 ) == "table" and type( t2 ) == "table" then
		
		for k, v in pairs( t1 ) do
			
			if type( v ) == "table" then
				if not ArkInventory.Table.Subset( v, t2[k] ) then
					return
				end
			elseif type( v ) == "number" or type( v ) == "string" then
				if v ~= t2[k] then
					return
				end
			end
			
		end
		
		return true
		
	end
	
end

function ArkInventory.Table.removeDefaults( tbl, def )
	
	if type( tbl ) ~= "table" then
		return
	end
	
	setmetatable( tbl, nil )
	
	for k, v in pairs( tbl ) do
		if type( v ) == "table" then
			if type( def ) == "table" then
				ArkInventory.Table.removeDefaults( v, def[k] )
			else	
				ArkInventory.Table.removeDefaults( v )
			end
			if ArkInventory.Table.IsEmpty( v ) then
				tbl[k] = nil
			end
		else
			if type( def ) == "table" and v == def[k] then
				tbl[k] = nil
			end
		end
	end
	
end

local function spairs_iter( a )
	a.idx = a.idx + 1
	local k = a[a.idx]
	if k ~= nil then
		return k, a.tbl[k]
	end
	--ArkInventory.Table.Wipe( a )
	a.tbl = nil
end

function ArkInventory.spairs( tbl, cf )
	
	if type( tbl ) ~= "table" then return end
	
	local a = { }
	local c = 0
	
	for k in pairs( tbl ) do
		c = c + 1
		a[c] = k
	end
	
	table.sort( a, cf )
	
	a.idx = 0
	a.tbl = tbl
	
	return spairs_iter, a
	
end





function ArkInventory.OutputSerialize( d )
	if d == nil then
		return "nil"
	elseif type( d ) == "number" then
		return tostring( d )
	elseif type( d ) == "string" then
		--return string.format( "%q", d )
		return d
	elseif type( d ) == "boolean" then
		if d then
			return "true"
		else
			return "false"
		end
	elseif type( d ) == "table" then
		local tmp = { }
		local c = 0
		for k, v in pairs( d ) do
			c = c + 1
			tmp[c] = string.format( "[%s]=%s", ArkInventory.OutputSerialize( k ), ArkInventory.OutputSerialize( v ) )
		end
		return string.format( "{ %s }", table.concat( tmp, ", " ) )
	else
		return string.format( "**%s**", type( d ) or ArkInventory.Localise["UNKNOWN"] )
	end
end

local ArkInventory_TempOutputTable = { }
function ArkInventory.OutputBuild( ... )
	
	ArkInventory.Table.Wipe( ArkInventory_TempOutputTable )
	
	local n = select( '#', ... )
	
	if n == 0 then
		
		ArkInventory_TempOutputTable[1] = "nil"
		
	else
		
		for i = 1, n do
			local v = select( i, ... )
			ArkInventory_TempOutputTable[i] = ArkInventory.OutputSerialize( v )
		end
		
	end
	
	return table.concat( ArkInventory_TempOutputTable )
	
end

function ArkInventory.Output( ... )
	
	if not DEFAULT_CHAT_FRAME then
		return
	end
	
	ArkInventory:Print( ArkInventory.OutputBuild( ... ) )
	
end

function ArkInventory.Output2( ... )
	if ArkInventory.Global.Debug2 then
		ArkInventory.Output( "|cff17ffc1", ... ) -- fffff99a
	end
end

function ArkInventory.OutputThread( ... )
	if ArkInventory.db.option.thread.debug then
		ArkInventory.Output( "|cffffff9aTHREAD> ", ... )
	end
end

function ArkInventory.OutputDebugConfig( )
	
	local obj = _G[ArkInventory.Const.Frame.Debug.Name]
	if not obj then return end
	
	local m = obj.List:GetMaxLines( )
	if m ~= ArkInventory.db.option.ui.debug.lines then
		obj.List:SetMaxLines( ArkInventory.db.option.ui.debug.lines )
	end
	
end

function ArkInventory.OutputDebug( ... )
	
	if ArkInventory.db and not ArkInventory.db.option.ui.debug.enable then return end
	
	local obj = _G[ArkInventory.Const.Frame.Debug.Name]
	if not obj then
		
		ArkInventory.OutputError( ArkInventory.Const.Frame.Debug.Name, " does not exist" )
		
	else
		
		local tz = ArkInventory.Const.StartupTime + ( debugprofilestop( ) / 1000 )
		local ms = math.floor( ( tz % 1 ) * 1000000 )
		local msg = string.format( "[%s.%06i]  %s", date( "%X", tz ), ms, ArkInventory.OutputBuild( ... ) )
		
		obj.List:AddMessage( msg )
		local numMessages = obj.List:GetNumMessages( )
		obj.List.ScrollBar:SetMinMaxValues( 1, numMessages )
		obj.List.ScrollBar:SetValue( numMessages - obj.List:GetScrollOffset( ) )
		
	end
	
end

function ArkInventory.OutputWarning( ... )
	ArkInventory.Output( "|cfffa8000WARNING> ", ... )
end

function ArkInventory.OutputError( ... )
	ArkInventory.Output( RED_FONT_COLOR_CODE, ERROR_CAPS, "> ", ... )
end

function ArkInventory.OutputDebugModeSet( value )
	
	if ArkInventory.Global.Debug ~= value then
		
		local state = ArkInventory.Localise["ENABLED"]
		if not value then
			state = ArkInventory.Localise["DISABLED"]
		end
		
		ArkInventory.Global.Debug = value
		
		ArkInventory.Output( "debug mode is now ", state )
		
	end
	
end



ArkInventory.ENUM = {
	ACTION = {
		WHEN = {
			DISABLED = 0,
			MANUAL = 1,
			AUTO = 2,
		},
		TYPE = {
			IGNORE = 0,
			VENDOR = 1,
			MAIL = 2,
			MOVE = 3,
		},
	},
	ANCHOR = {
		DEFAULT = 0,
		BOTTOMRIGHT = 1,
		BOTTOMLEFT = 2,
		TOPLEFT = 3,
		TOPRIGHT = 4,
		TOP = 5,
		BOTTOM = 6,
		LEFT = 7,
		RIGHT = 8,
		CENTER = 9,
	},
	BAG = {
		INDEX = {
			BACKPACK = BACKPACK_CONTAINER or ( Enum.BagIndex and Enum.BagIndex.Backpack ) or 0,
			BANK = BANK_CONTAINER or ( Enum.BagIndex and Enum.BagIndex.Bank ) or -1,
			REAGENTBANK = REAGENTBANK_CONTAINER or ( Enum.BagIndex and Enum.BagIndex.Reagentbank ) or -3,
			REAGENTBAG = ( Enum.BagIndex and Enum.BagIndex.Reagentbag ) or 5,
			KEYRING = KEYRING_CONTAINER or ( Enum.BagIndex and Enum.BagIndex.Keyring ) or -2
		},
		OPENCLOSE = {
			NO = 0,
			YES = 1,
			ALWAYS = 2,
		},
	},
	BATTLEPET = {
		ENEMY = LE_BATTLE_PET_ENEMY or 2,
	},
	BIND = { -- ITEM_BINDx
		NEVER = 0,
		USE = 1,
		EQUIP = 2,
		PICKUP = 3,
		ACCOUNT = 4,
	},
	BUTTONID = {
		MainMenu = 0,
		Close = 1,
		EditMode = 2,
		Rules = 3,
		Search = 4,
		SwitchCharacter = 5,
		SwitchLocation = 6,
		Restack = 7,
		Changer = 8,
		Refresh = 9,
		Actions = 10,
	},
	DIRECTION = {
		HORIZONTAL = 1,
		VERTICAL = 2,
	},
	EXPANSION = {
		--CURRENT = set elsewhere,
		DRAGONFLIGHT = LE_EXPANSION_DRAGONFLIGHT or 9,
		SHADOWLANDS = LE_EXPANSION_SHADOWLANDS or 8,
		BFA = LE_EXPANSION_BATTLE_FOR_AZEROTH or 7,
		LEGION = LE_EXPANSION_LEGION or 6,
		DRAENOR = LE_EXPANSION_WARLORDS_OF_DRAENOR or 5,
		PANDARIA = LE_EXPANSION_MISTS_OF_PANDARIA or 4,
		CATACLYSM = LE_EXPANSION_CATACLYSM or 3,
		WRATH = LE_EXPANSION_WRATH_OF_THE_LICH_KING or 2,
		TBC = LE_EXPANSION_BURNING_CRUSADE or 1,
		CLASSIC = LE_EXPANSION_CLASSIC or 0,
	},
	ITEM = {
		QUALITY = {
			MISSING = -2,
			UNKNOWN = -1,
			POOR = ( Enum.ItemQuality and Enum.ItemQuality.Poor ) or LE_ITEM_QUALITY_POOR or 0,
			STANDARD = ( Enum.ItemQuality and Enum.ItemQuality.Standard ) or LE_ITEM_QUALITY_COMMON or 1,
			GOOD = ( Enum.ItemQuality and Enum.ItemQuality.Good )or LE_ITEM_QUALITY_UNCOMMON or 2,
			RARE = ( Enum.ItemQuality and Enum.ItemQuality.Rare ) or LE_ITEM_QUALITY_RARE or 3,
			EPIC = ( Enum.ItemQuality and Enum.ItemQuality.Epic ) or LE_ITEM_QUALITY_EPIC or 4,
			LEGENDARY = ( Enum.ItemQuality and Enum.ItemQuality.Legendary ) or LE_ITEM_QUALITY_LEGENDARY or 5,
			ARTIFACT = ( Enum.ItemQuality and Enum.ItemQuality.Artifact ) or LE_ITEM_QUALITY_ARTIFACT or 6,
			HEIRLOOM = ( Enum.ItemQuality and Enum.ItemQuality.Heirloom ) or LE_ITEM_QUALITY_HEIRLOOM or 7,
			WOWTOKEN = ( Enum.ItemQuality and Enum.ItemQuality.WoWToken ) or LE_ITEM_QUALITY_WOWTOKEN or 8,
		},
		TYPE = {
			UNKNOWN = {
				PARENT = -2,
			},
			EMPTY = {
				PARENT = -1,
			},
			CONSUMABLE = {
				PARENT = LE_ITEM_CLASS_CONSUMABLE or Enum.ItemClass.Consumable or 0,
				EXPLOSIVES_AND_DEVICES = 0,
				POTION = Enum.ItemConsumableSubclass.Potion or 1,
				ELIXIR = Enum.ItemConsumableSubclass.Elixir or 2,
				FLASK = 3 or Enum.ItemConsumableSubclass.Flask or 3,
				SCROLL = 4 or Enum.ItemConsumableSubclass.Scroll or 4,
				FOOD_AND_DRINK = 5 or Enum.ItemConsumableSubclass.Fooddrink or 5,
				ITEM_ENHANCEMENT = 6 or Enum.ItemConsumableSubclass.Itemenhancement or 6,
				BANDAGE = 7 or Enum.ItemConsumableSubclass.Bandage or 7,
				OTHER = 8 or Enum.ItemConsumableSubclass.Other or 8,
				VANTUSRUNE = 9 or Enum.ItemConsumableSubclass.Vantusrune or 9,
			},
			CONTAINER = {
				PARENT = LE_ITEM_CLASS_CONTAINER or Enum.ItemClass.Container or 1,
				BAG = 0,
				SOULSHARD = 1,
				HERBALISM = 2,
				ENCHANTING = 3,
				ENGINEERING = 4,
				JEWELCRAFTING = 5,
				MINING = 6,
				LEATHERWORKING = 7,
				INSCRIPTION = 8,
				FISHING = 9,
				COOKING = 10,
				REAGENT = 11,
			},
			WEAPON = {
				PARENT = LE_ITEM_CLASS_WEAPON or Enum.ItemClass.Weapon or 2,
				AXE1H = LE_ITEM_WEAPON_AXE1H or Enum.ItemWeaponSubclass.Axe1H or 0,
				AXE2H = LE_ITEM_WEAPON_AXE2H or Enum.ItemWeaponSubclass.Axe2H or 1,
				BOW = LE_ITEM_WEAPON_BOWS or Enum.ItemWeaponSubclass.Bows or 2,
				GUN = LE_ITEM_WEAPON_GUNS or Enum.ItemWeaponSubclass.Guns or 3,
				MACE1H = LE_ITEM_WEAPON_MACE1H or Enum.ItemWeaponSubclass.Mace1H or 4,
				MACE2H = LE_ITEM_WEAPON_MACE2H or Enum.ItemWeaponSubclass.Mace2H or 5,
				POLEARM = LE_ITEM_WEAPON_POLEARM or Enum.ItemWeaponSubclass.Polearm or 6,
				SWORD1H = LE_ITEM_WEAPON_SWORD1H or Enum.ItemWeaponSubclass.Sword1H or 7,
				SWORD2H = LE_ITEM_WEAPON_SWORD2H or Enum.ItemWeaponSubclass.Sword2H or 8,
				WARGLAIVE = LE_ITEM_WEAPON_WARGLAIVE or Enum.ItemWeaponSubclass.Warglaive or 9,
				STAFF = LE_ITEM_WEAPON_STAFF or Enum.ItemWeaponSubclass.Staff or 10,
				EXOTIC1H = LE_ITEM_WEAPON_EXOTIC1H or Enum.ItemWeaponSubclass.Bearclaw or 11,
				EXOTIC2H = LE_ITEM_WEAPON_EXOTIC2H or Enum.ItemWeaponSubclass.Catclaw or 12,
				FIST = LE_ITEM_WEAPON_UNARMED or Enum.ItemWeaponSubclass.Unarmed or 13,
				GENERIC = LE_ITEM_WEAPON_GENERIC or Enum.ItemWeaponSubclass.Generic or 14,
				DAGGER = LE_ITEM_WEAPON_DAGGER or Enum.ItemWeaponSubclass.Dagger or 15,
				THROWN = LE_ITEM_WEAPON_THROWN or Enum.ItemWeaponSubclass.Thrown or 16,
				SPEAR = LE_ITEM_WEAPON_SPEAR or Enum.ItemWeaponSubclass.Obsolete3 or 17,
				CROSSBOW = LE_ITEM_WEAPON_CROSSBOW or Enum.ItemWeaponSubclass.Crossbow or 18,
				WAND = LE_ITEM_WEAPON_WAND or Enum.ItemWeaponSubclass.Wand or 19,
				FISHING = LE_ITEM_WEAPON_FISHINGPOLE or Enum.ItemWeaponSubclass.Fishingpole or 20,
			},
			GEM = {
				PARENT = LE_ITEM_CLASS_GEM or Enum.ItemClass.Gem or 3,
				INTELLECT = LE_ITEM_GEM_INTELLECT or Enum.ItemGemSubclass.Intellect or 0,
				AGILITY = LE_ITEM_GEM_AGILITY or Enum.ItemGemSubclass.Agility or 1,
				STRENGTH = LE_ITEM_GEM_STRENGTH or Enum.ItemGemSubclass.Strength or 2,
				STAMINA = LE_ITEM_GEM_STAMINA or Enum.ItemGemSubclass.Stamina or 3,
				SPIRIT = LE_ITEM_GEM_SPIRIT or Enum.ItemGemSubclass.Spirit or 4,
				CRITICALSTRIKE = LE_ITEM_GEM_CRITICALSTRIKE or Enum.ItemGemSubclass.Criticalstrike or 5,
				MASTERY = LE_ITEM_GEM_MASTERY or Enum.ItemGemSubclass.Mastery or 6,
				HASTE = LE_ITEM_GEM_HASTE or Enum.ItemGemSubclass.Haste or 7,
				VERSATILITY = LE_ITEM_GEM_VERSATILITY or Enum.ItemGemSubclass.Versatility or 8,
				OTHER = LE_ITEM_GEM_OTHER or Enum.ItemGemSubclass.Other or 9,
				MULTIPLESTATS = LE_ITEM_GEM_MULTIPLESTATS or Enum.ItemGemSubclass.Multiplestats or 10,
				ARTIFACTRELIC = LE_ITEM_GEM_ARTIFACTRELIC or Enum.ItemGemSubclass.Artifactrelic or 11,
			},
			ARMOR = {
				PARENT = LE_ITEM_CLASS_ARMOR or Enum.ItemClass.Armor or 4,
				GENERIC = LE_ITEM_ARMOR_GENERIC or Enum.ItemArmorSubclass.Generic or 0,
				CLOTH = LE_ITEM_ARMOR_CLOTH or Enum.ItemArmorSubclass.Cloth or 1,
				LEATHER = LE_ITEM_ARMOR_LEATHER or Enum.ItemArmorSubclass.Leather or 2,
				MAIL = LE_ITEM_ARMOR_MAIL or Enum.ItemArmorSubclass.Mail or 3,
				PLATE = LE_ITEM_ARMOR_PLATE or Enum.ItemArmorSubclass.Plate or 4,
				COSMETIC = LE_ITEM_ARMOR_COSMETIC or Enum.ItemArmorSubclass.Cosmetic or 5,
				--BUCKLER = LE_ITEM_ARMOR_BUCKLER,
				SHIELD = LE_ITEM_ARMOR_SHIELD or Enum.ItemArmorSubclass.Shield or 6,
				LIBRAM = LE_ITEM_ARMOR_LIBRAM or Enum.ItemArmorSubclass.Libram or 7,
				IDOL = LE_ITEM_ARMOR_IDOL or Enum.ItemArmorSubclass.Idol or 8,
				TOTEM = LE_ITEM_ARMOR_TOTEM or Enum.ItemArmorSubclass.Totem or 9,
				SIGIL = LE_ITEM_ARMOR_SIGIL or Enum.ItemArmorSubclass.Sigil or 10,
				RELIC = LE_ITEM_ARMOR_RELIC or Enum.ItemArmorSubclass.Relic or 11,
			},
			REAGENT = {
				PARENT = LE_ITEM_CLASS_REAGENT or Enum.ItemClass.Reagent or 5,
				REAGENT = Enum.ItemReagentSubclass.Reagent or 0,
				KEYSTONE = Enum.ItemReagentSubclass.Keystone or 1,
			},
			PROJECTILE = {
				PARENT = LE_ITEM_CLASS_PROJECTILE or Enum.ItemClass.Projectile or 6,
				WAND = 0,
				BOLT = 1,
				ARROW = 2,
				BULLET = 3,
				THROWN = 4,
			},
			TRADEGOODS = {
				PARENT = LE_ITEM_CLASS_TRADEGOODS or Enum.ItemClass.Tradegoods or 7,
				TRADEGOODS = 0,
				PARTS = 1,
				EXPLOSIVES = 2,
				DEVICES = 3,
				JEWELCRAFTING = 4,
				CLOTH = 5,
				LEATHER = 6,
				METAL_AND_STONE = 7,
				COOKING = 8,
				HERBS = 9,
				ELEMENTAL = 10,
				OTHER = 11,
				ENCHANTING = 12,
				MATERIALS = 13,
				ITEM_ENCHANTMENT = 14,
				WEAPON_ENCHANTMENT = 15,
				INSCRIPTION = 16,
				EXPLOSIVES_AND_DEVICES = 17,
			},
			ITEM_ENHANCEMENT = {
				PARENT = LE_ITEM_CLASS_ITEM_ENHANCEMENT or Enum.ItemClass.ItemEnhancement or 8,
			},
			RECIPE = {
				PARENT = LE_ITEM_CLASS_RECIPE or Enum.ItemClass.Recipe or 9,
				BOOK = LE_ITEM_RECIPE_BOOK or Enum.ItemRecipeSubclass.Book or 0,
				LEATHERWORKING = LE_ITEM_RECIPE_LEATHERWORKING or Enum.ItemRecipeSubclass.Leatherworking or 1,
				TAILORING = LE_ITEM_RECIPE_TAILORING or Enum.ItemRecipeSubclass.Tailoring or 2,
				ENGINEERING = LE_ITEM_RECIPE_ENGINEERING or Enum.ItemRecipeSubclass.Engineering or 3,
				BLACKSMITHING = LE_ITEM_RECIPE_BLACKSMITHING or Enum.ItemRecipeSubclass.Blacksmithing or 4,
				COOKING = LE_ITEM_RECIPE_COOKING or Enum.ItemRecipeSubclass.Cooking or 5,
				ALCHEMY = LE_ITEM_RECIPE_ALCHEMY or Enum.ItemRecipeSubclass.Alchemy or 6,
				FIRST_AID = LE_ITEM_RECIPE_FIRST_AID or Enum.ItemRecipeSubclass.FirstAid or 7,
				ENCHANTING = LE_ITEM_RECIPE_ENCHANTING or Enum.ItemRecipeSubclass.Enchanting or 8,
				FISHING = LE_ITEM_RECIPE_FISHING or Enum.ItemRecipeSubclass.Fishing or 9,
				JEWELCRAFTING = LE_ITEM_RECIPE_JEWELCRAFTING or Enum.ItemRecipeSubclass.Jewelcrafting or 10,
				INSCRIPTION = LE_ITEM_RECIPE_INSCRIPTION or Enum.ItemRecipeSubclass.Inscription or 11,
			},
			QUIVER = {
				PARENT = LE_ITEM_CLASS_QUIVER or Enum.ItemClass.Quiver or 11,
				-- QUIVER = 0,
				-- BOLT = 1,
				QUIVER = 2,
				AMMO = 3,
			},
			QUEST = {
				PARENT = LE_ITEM_CLASS_QUESTITEM or Enum.ItemClass.Questitem or 12,
				QUEST = 0,
			},
			KEY = {
				PARENT = LE_ITEM_CLASS_KEY or Enum.ItemClass.Key or 13,
				KEY = 0,
				LOCKPICK = 1,
			},
			MISC = {
				PARENT = LE_ITEM_CLASS_MISCELLANEOUS or Enum.ItemClass.Miscellaneous or 15,
				JUNK = LE_ITEM_MISCELLANEOUS_JUNK or Enum.ItemMiscellaneousSubclass.Junk or 0,
				REAGENT = LE_ITEM_MISCELLANEOUS_REAGENT or Enum.ItemMiscellaneousSubclass.Reagent or 1,
				PET = LE_ITEM_MISCELLANEOUS_COMPANION_PET or Enum.ItemMiscellaneousSubclass.CompanionPet or 2,
				HOLIDAY = LE_ITEM_MISCELLANEOUS_HOLIDAY or Enum.ItemMiscellaneousSubclass.Holiday or 3,
				OTHER = LE_ITEM_MISCELLANEOUS_OTHER or Enum.ItemMiscellaneousSubclass.Other or 4,
				MOUNT = LE_ITEM_MISCELLANEOUS_MOUNT or Enum.ItemMiscellaneousSubclass.Mount or 5,
				MOUNT_EQUIPMENT = LE_ITEM_MISCELLANEOUS_MOUNT_EQUIPMENT or Enum.ItemMiscellaneousSubclass.MountEquipment or 6,
			},
			GLYPH = {
				PARENT = LE_ITEM_CLASS_GLYPH or Enum.ItemClass.Glyph or 16,
			},
			BATTLEPET = {
				PARENT = LE_ITEM_CLASS_BATTLEPET or Enum.ItemClass.Battlepet or 17,
				HUMANOID = 0, -- [163]
				DRAGONKIN = 1, -- [164]
				FLYING = 2, -- [165]
				UNDEAD = 3, -- [166]
				CRITTER = 4, -- [167]
				MAGIC = 5, -- [168]
				ELEMENTAL = 6, -- [169]
				BEAST = 7, -- [170]
				AQUATIC = 8, -- [171]
				MECHANICAL = 9, -- [172]
			},
			WOW_TOKEN = {
				PARENT = ITEM_CLASS_WOW_TOKEN or Enum.ItemClass.WoWToken or 18,
				WOWTOKEN = 0, -- [174]
			},
		},
	},
	LIST = {
		SORTBY = {
			NAME = 1,
			NUMBER = 2,
			ORDER = 3,
		},
		SHOW = {
			ACTIVE = 1,
			DELETED = 2,
		},
	},
	SORTWHEN = {
		ALWAYS = 1,
		ONOPEN = 2,
		MANUAL = 3,
	},
}


ArkInventory.Const = { -- constants
	
	Program = {
		Name = "ArkInventory",
		Version = nil, -- calculated at load
	},
	
	BLIZZARD = {
		
--		/dump ArkInventory.Const.BLIZZARD.TOC
		TOC = select( 4, GetBuildInfo( ) ) or 0,
		
		CLIENT = {
			ID = nil,
			NAME = "",
			EXPANSION = { },
			PTR = 0.1,
			BETA = 0.2,
			ALPHA = 0.3,
		},
		
		GLOBAL = {
			TOOLTIP = {
				UPDATETIMER = 1.0, --TOOLTIP_UPDATE_TIME = 0.2
			},
			FONT = {
				COLOR = {
					UNUSABLE = {
						["ffff2020"] = true, -- dragonflight
						["fffe1f1f"] = true, -- classic / wrath
					},
				},
			},
			PROFESSIONRANK = {
				COLOR = {
					[0] = { r = 255 / 255, g = 255 / 255, b = 255 / 255 },
					[1] = { r = 165 / 255, g =  66 / 255, b =   0 / 255 },
					[2] = { r = 255 / 255, g = 255 / 255, b = 255 / 255 },
					[3] = { r = 255 / 255, g = 230 / 255, b =   0 / 255 },
					[4] = { r = 120 / 255, g = 255 / 255, b = 210 / 255 },
					[5] = { r = 255 / 255, g =  94 / 255, b =  40 / 255 },
				},
				OFFSET = {
					[1] = { x = -3, y = -2 },
					[2] = { x = 0, y = -3 },
					[3] = { x = -1, y = -2 },
					[4] = { x = -3, y = -1 },
					[5] = { x = -3, y = -2 },
				}
			},
			CONTAINER = {
				SLOTSIZE = 37,
				NUM_SLOT_MAX = MAX_CONTAINER_ITEMS or 36,
				FILTER = {
					IGNORECLEANUP = LE_BAG_FILTER_FLAG_IGNORE_CLEANUP or ( Enum.BagSlotFlags and Enum.BagSlotFlags.DisableAutoSort ) or 1,
					ASSIGN_TO_BAG = BAG_FILTER_ASSIGN_TO,
					LABELS = BAG_FILTER_LABELS,
				},
				NUM_BAGS_NORMAL = NUM_BAG_SLOTS or NUM_BAG_FRAMES or 4,
				NUM_BAGS_REAGENT = NUM_REAGENTBAG_FRAMES or 0,
				NUM_BAGS = 0, -- calculated further down
			},
			BANK = {
				NUM_BAGS = NUM_BANKBAGSLOTS or 7,
				NUM_SLOTS = NUM_BANKGENERIC_SLOTS or 7 * 4,
			},
			REAGENTBANK = {
				NUM_SLOTS = 7 * 7 * 2,
			},
			GUILDBANK = {
				NUM_TABS = MAX_GUILDBANK_TABS,
				WIDTH = NUM_GUILDBANK_COLUMNS or 14,
				HEIGHT = NUM_SLOTS_PER_GUILDBANK_GROUP or 7,
				SLOTS_PER_TAB = MAX_GUILDBANK_SLOTS_PER_TAB or 14 * 7,
				LOG_TIME_PREPEND = GUILD_BANK_LOG_TIME_PREPEND or "|cff009999  ",
			},
			VOIDSTORAGE = {
				NUM_SLOT_MAX = VOID_STORAGE_MAX or 80,
				NUM_PAGES = VOID_STORAGE_PAGES or 2,
			},
			PET = {
				FILTER = {
					COLLECTED = LE_PET_JOURNAL_FILTER_COLLECTED or 1,
					NOTCOLLECTED = LE_PET_JOURNAL_FILTER_NOT_COLLECTED or 2,
				},
				CAGE_ITEMID = 82800,
			},
			MAILBOX = {
				NUM_ATTACHMENT_MAX = ATTACHMENTS_MAX_RECEIVE,
			},
			FRAME = {
				SHOW = 1,
				HIDE = 2,
			},
		},
		
		FUNCTION = {
			GETITEMINFO = {
				NAME = 1,
				LINK = 2,
				QUALITY = 3,
				ILVL_BASE = 4,
				USELEVEL = 5,
				TYPE = 6,
				SUBTYPE = 7,
				STACKSIZE = 8,
				EQUIP = 9,
				TEXTURE = 10,
				VENDORPRICE = 11,
				TYPEID = 12,
				SUBTYPEID = 13,
				BINDING = 14,
				EXPANSION = 15,
				SETID = 16,
				CRAFT = 17,
			},
			GETITEMINFOINSTANT = {
				ID = 1,
				TYPE = 2,
				SUBTYPE = 3,
				EQUIP = 4,
				TEXTURE = 5,
				TYPEID = 6,
				SUBTYPEID = 7,
			},
			GETSPELLINFO = {
				NAME = 1,
				TEXTURE = 3,
			}
		},
		
	},
	
	Frame = {
		Main = {
			Name = "ARKINV_Frame",
			MiniActionButtonSize = 12,
		},
		Title = {
			Name = "Title",
			Height = 20,
			MinHeight = 20,
		},
		Scroll = {
			Name = "Scroll",
			stepSize = 40,
		},
		Container = {
			Name = "ScrollContainer",
		},
		Log = {
			Name = "Log",
		},
		Info = {
			Name = "Info",
		},
		Changer = {
			Name = "Changer",
			Height = 58,
		},
		Status = {
			Name = "Status",
			MinHeight = 20,
			Padding = 5,
		},
		Search = {
			Name = "Search",
			Height = 10,
			MinHeight = 20,
		},
		Scrolling = {
			List = "List",
			ScrollBar = "ScrollBar",
		},
		Config = {
			Internal = "ArkInventory",
			Blizzard = "ArkInventoryConfigBlizzard",
		},
		Cooldown = {
			Name = "Cooldown",
		},
		Debug = {
			Name = "ARKINV_Debug",
			MinHeight = 100,
			MinWidth = 400,
		},
		BarPopup = {
			Name = "ARKINV_PopupBarFrame",
		},
	},
	
	Event = {
		BagUpdate = 1,
		--ObjectLock = 2,
		--PlayerMoney = 3,
		--GuildMoney = 4,
		--TabInfo = 5,
		--SkillUpdate = 6,
		--ItemUpdate = 7,
		--BagEmpty = 8,
	},
	
	Location = {
		Bag = 1,
		Keyring = 2,
		Bank = 3,
		Vault = 4,
		Mailbox = 5,
		Wearing = 6,
		Pet = 7,
		Mount = 8,
		Currency = 9,
		Auction = 10,
		--Spellbook = 11,
		Tradeskill = 12,
		Void = 13,
		Toybox = 14,
		Heirloom = 15,
		Reputation = 16,
		MountEquipment = 17,
		TradeskillEquipment = 18,
	},
	
	Offset = {
		Vault = 1000,
		Mailbox = 2000,
		Wearing = 3000,
		Pet = 4000,
		Currency = 5000,
		Mount = 6000,
		Auction = 7000,
		--Spellbook = 8000,
		Tradeskill = 1400,
		Void = 1500,
		Toybox = 1200,
		Heirloom = 1300,
		Reputation = 1600,
		MountEquipment = 6100,
		TradeskillEquipment = 1420,
	},
	
	Bag = {
		Status = { -- these need to be negative values,  do not use -1
			Unknown = -2,
			Active = -3,
			Empty = -4,
			Purchase = -5,
			NoAccess = -6,
		},
	},
	
	Slot = {
		
		Type = { -- slot type numbers, do not change this order, just add new ones to the end of the list
			Unknown = 0,
			Bag = 1,
			Keyring = 3,
			Soulshard = 5,
			Herbalism = 6,
			Enchanting = 7,
			Engineering = 8,
			Jewelcrafting = 9,
			Mining = 10,
			Bullet = 11,
			Arrow = 12,
			Projectile = 12,
			Leatherworking = 13,
			Wearing = 14,
			Mailbox = 15,
			Inscription = 16,
			Critter = 17,
			Mount = 18,
			Currency = 19,
			Auction = 20,
			--Spellbook = 21,
			Tradeskill = 22,
			Fishing = 23,
			Void = 24,
			Cooking = 25,
			Toybox = 26,
			Reagent = 27,
			Heirloom = 28,
			Reputation = 29,
		},
		
		New = {
			No = false,
			Yes = 1,
			Inc = 2,
			Dec = 3,
		},
		
		Data = { },
		
		ItemLevel = {
			Min = 1,
			Max = 9999,
		},
		
		INVTYPE_SortOrder = { -- sort order to display equipable items in
			["INVTYPE_HEAD"] = 1,
			["INVTYPE_NECK"] = 2,
			["INVTYPE_SHOULDER"] = 3,
			["INVTYPE_CLOAK"] = 4,
			["INVTYPE_CHEST"] = 5,
			["INVTYPE_ROBE"] = 6,
			["INVTYPE_BODY"] = 7,
			["INVTYPE_TABARD"] = 8,
			["INVTYPE_WRIST"] = 9,
			
			["INVTYPE_HAND"] = 10,
			["INVTYPE_WAIST"] = 11,
			["INVTYPE_LEGS"] = 12,
			["INVTYPE_FEET"] = 13,
			["INVTYPE_FINGER"] = 14,
			["INVTYPE_TRINKET"] = 15,
			
			["INVTYPE_WEAPON"] = 16,
			["INVTYPE_WEAPONMAINHAND"] = 17,
			["INVTYPE_WEAPONOFFHAND"] = 18,
			["INVTYPE_HOLDABLE"] = 19,
			["INVTYPE_RANGED"] = 20,
			["INVTYPE_RANGEDRIGHT"] = 21,
			["INVTYPE_SHIELD"] = 22,
			["INVTYPE_2HWEAPON"] = 23,
			
			["INVTYPE_THROWN"] = 24,
			["INVTYPE_RELIC"] = 25,
			["INVTYPE_AMMO"] = 26,
			
			["INVTYPE_PROFESSION_TOOL"] = 90,
			["INVTYPE_PROFESSION_GEAR"] = 91,
			
			-- items with INVTYPEs that are assigned a value of zero will have their INVTYPE cleared so they cant be seen as equipment
			-- unknown INVTYPEs will generate a one off warning and will also not be seen as equipment until added to this table
			["INVTYPE_NON_EQUIP"] = 0,
			["INVTYPE_NON_EQUIP_IGNORE"] = 0,
			["INVTYPE_BAG"] = 0,
			["INVTYPE_QUIVER"] = 0,
		},
		
		Stack = {
			Mode = {
				Limit = 1,
				Compress = 2,
			},
		},
		
		
	},
	
	InventorySlotName = { "HeadSlot", "NeckSlot", "ShoulderSlot", "BackSlot", "ChestSlot", "ShirtSlot", "TabardSlot", "WristSlot", "HandsSlot", "WaistSlot", "LegsSlot", "FeetSlot", "Finger0Slot", "Finger1Slot", "Trinket0Slot", "Trinket1Slot", "MainHandSlot", "SecondaryHandSlot" },
	
	Window = {
		
		Min = {
			Rows = 1,
			Columns = 6,
			Width = 400,
		},
		
		Draw = {
			Init = 0, -- intital state, only exists at load, never set to init
			Restart = 1, -- rebuild the entire window from scratch
			Recalculate = 2, -- recalculate the window
			Resort = 3, -- sort the items in the bars
			Refresh = 4, -- in-place item updates
			None = 5, -- do nothing
		},
		
		Title = {
			SizeNormal = 1,
			SizeThin = 2,
		},
	},
	
	Font = {
		Face = "Arial Narrow",
		Height = 16,
		MinHeight = 4,
		MaxHeight = 72,
	},
	
	Fade = 0.6,
	GuildTag = "+",
	PlayerIDSep = " - ",
	
	Cursor = {
		Drag = [[Interface\CURSOR\Crosshairs]],
		UnableDrag = [[Interface\CURSOR\UnableCrosshairs]],
		--Driver Gunner Interact Item 
	},
	
	Texture = {
		
		Missing = [[Interface\Icons\Temp]],
		
		Empty = {
			Item = [[Interface\PaperDoll\UI-Backpack-EmptySlot]],
			Bag = [[Interface\PaperDoll\UI-PaperDoll-Slot-Bag]],
		},
		
		CategoryDamaged = [[Interface\Icons\Spell_Shadow_DeathCoil]],
		CategoryEnabled = [[Interface\RAIDFRAME\ReadyCheck-Ready]],
		CategoryDisabled = [[Interface\RAIDFRAME\ReadyCheck-NotReady]],
		
		UpdateTimerCustom = [[Interface\PLAYERFRAME\Deathknight-Energize-Frost]],
		
		List = {
			Selected = [[Interface\RAIDFRAME\ReadyCheck-Ready]],
			Ignored = [[Interface\RAIDFRAME\ReadyCheck-NotReady]],
		},
		
		BackgroundDefault = "Solid",
		
		BorderDefault = "Blizzard Tooltip",
		BorderNone = "None",
		
		Border = {
			["Blizzard Tooltip"] = {
				["size"] = 16,
				["offset"] = nil,
				["offsetdefault"] = {
					["slot"] = 4,
					["bar"] = 3,
					["window"] = 3,
				},
				["scale"] = 1,
			},
			["Blizzard Dialog"] = {
				["size"] = 32,
				["offset"] = nil,
				["offsetdefault"] = {
					["slot"] = 9,
					["bar"] = 6,
					["window"] = 6,
				},
			},
			["Blizzard Dialog Gold"] = {
				["size"] = 32,
				["offset"] = nil,
				["offsetdefault"] = {
					["slot"] = 9,
					["bar"] = 6,
					["window"] = 6,
				},
			},
			["ArkInventory Tooltip 1"] = {
				["size"] = 16,
				["offset"] = nil,
				["offsetdefault"] = {
					["slot"] = 3,
					["bar"] = 3,
					["window"] = 3,
				},
			},
			["ArkInventory Tooltip 2"] = {
				["size"] = 16,
				["offset"] = nil,
				["offsetdefault"] = {
					["slot"] = 4,
					["bar"] = 3,
					["window"] = 3,
				},
			},
			["ArkInventory Tooltip 3"] = {
				["size"] = 16,
				["offset"] = nil,
				["offsetdefault"] = {
					["slot"] = 5,
					["bar"] = 4,
					["window"] = 4,
				},
			},
			["ArkInventory Square 1"] = {
				["size"] = 16,
				["offset"] = nil,
				["offsetdefault"] = {
					["slot"] = 3,
					["bar"] = 3,
					["window"] = 3,
				},
			},
			["ArkInventory Square 2"] = {
				["size"] = 16,
				["offset"] = nil,
				["offsetdefault"] = {
					["slot"] = 4,
					["bar"] = 3,
					["window"] = 3,
				},
			},
			["ArkInventory Square 3"] = {
				["size"] = 16,
				["offset"] = nil,
				["offsetdefault"] = {
					["slot"] = 5,
					["bar"] = 4,
					["window"] = 4,
				},
			},
		},
		
		Money = [[Interface\Icons\INV_Misc_Coin_02]],
		
		Yes = [[Interface\RAIDFRAME\ReadyCheck-Ready]],
		No = [[Interface\RAIDFRAME\ReadyCheck-NotReady]],
		
		Checked = [[Interface\RAIDFRAME\ReadyCheck-Ready]],
		atWar = [[Interface\RAIDFRAME\ReadyCheck-Ready]],
		
		Action = {
			[ArkInventory.ENUM.ACTION.TYPE.VENDOR] = {
				[ArkInventory.ENUM.ACTION.WHEN.AUTO] = [[Interface\Icons\INV_Misc_Coin_02]],
				[ArkInventory.ENUM.ACTION.WHEN.MANUAL] = [[Interface\Icons\INV_Misc_Coin_04]],
			},
			[ArkInventory.ENUM.ACTION.TYPE.MAIL] = {
				[ArkInventory.ENUM.ACTION.WHEN.AUTO] = [[Interface\Icons\INV_Letter_03]],
				[ArkInventory.ENUM.ACTION.WHEN.MANUAL] = [[Interface\Icons\INV_Letter_13]],
			},
		},
		
		Config = [[Interface\Garrison\Garr_TimerFill-Upgrade]],
		Blueprint = [[Interface\ICONS\INV_Scroll_05]],
		
	},
	
	SortKeys = { -- true = keep, false = remove
		bagid = true,
		slotid = true,
		count = true,
		itemcount = false,
		category = true,
		catname = true,
		location = true,
		itemuselevel = true,
		itemstatlevel = true,
		itemtype = true,
		quality = true,
		name = true,
		vendorprice = true,
		itemage = true,
		id = true,
		slottype = true,
		expansion = true,
		rank = true,
	},
	
	DatabaseDefaults = { },
	
	Mount = {
		Types = { -- this value is stored in saved variables, do NOT change
			["l"] = 0x01, -- land
			["a"] = 0x02, -- air
--			["s"] = 0x04, -- water surface
			["u"] = 0x08, -- underwater
			["x"] = 0x00, -- ignored / unknown
		},
		TypeID = {
			[242] = "a", -- flying, swift spectral
			[247] = "a", -- flying, cloud
			[248] = "a", -- flying
			[402] = "a", -- flying, dragonriding
			[424] = "a", -- flying, dragonriding (has animations)
			[426] = "a", -- flying, dragonriding
			
			[230] = "l", -- land
			[241] = "l", -- qiraji battletank
			[269] = "l", -- water surface
			[284] = "l", -- land, chauffeured
			[398] = "l", -- land, pterrordax (kuo'fon)
			[407] = "l", -- otter
			[408] = "l", -- snail
			[412] = "l", -- otter
			
			[231] = "u", -- underwater (sort of), turtle
			[232] = "u", -- underwater, vash'jir seahorse
			[254] = "u", -- underwater
		},
		Order = { -- display order purposes, not saved
			["a"] = 1, -- air
			["l"] = 2, -- land
			["u"] = 3, -- underwater
			["x"] = 4, -- ignored / unknown
		},
		Zone = {
			-- where the mount is properly disabled by blizzard set an empty table and the code will check the spell instead
			-- where it isnt you need to specifiy the mapids for each zone its allowed in
			
			-- /dump C_Map.GetBestMapForUnit( "player" )
			AhnQiraj = { 247,320 },
			Vashjir = { 201,204,205 },
			DragonIsles = { }, -- doesnt need to have anything in it as we just need to lock out all the normal flying mounts
		},
	},
	
	booleantable = { true, false },
	
	Realm = { }, -- connected realm array
	
	Reputation = {
		Custom = {
			Default = 1,
			Custom = 2,
		},
		Style = {
			TooltipNormal = "*st**pv**pr* (*br*)", -- rep tooltip
			TooltipItemCount = "*st**pv**pr*", -- itemcount tooltip
			TwoLines = "*st**pv**pr* (*bv*/*bm*)\n(*br*)", -- List view
			OneLine = "*st**pv**pr* (*bv*/*bm*)", -- LDB tooltip
			OneLineWithName = "*nn*: *st**pv**pr* (*bv*/*bm*)", -- LDB text
		},
	},
	
	Transmog = {
		State = {
			CanLearnMyself = 1,
			CanLearnMyselfSecondary = 2,
			CanLearnOther = 3,
			CanLearnOtherSecondary = 4,
		},
		StyleDefault = "Smiley Face",
		SharedMediaType = "arkinventory-icons-transmog",
	},
	
	Class = {
		Account = "ACCOUNT",
		Guild = "GUILD",
	},
	
	Move = {
		Bar = 1,
		Category = 2,
	},
	
	IDType = {
		Count = 1,
		Search = 2,
	},
	
	Tooltip = {
		-- used to convert tooltip:SetText into tooltip:SetHyperlink
		customHyperlinkFormat = "ArkInventory!!!%s",
		customHyperlinkMatch = "^ArkInventory!!!(.+)$",
		
		Search = {
			Full = 0, -- checks everything
			Base = 1, -- meant to skip around items in patterns/recipes
			Short = 2, -- stops at the first blank line
		},
	},
	
	CategoryTypes = { "SYSTEM", "CONSUMABLE", "TRADEGOODS", "SKILL", "CLASS", "EMPTY", "CUSTOM", "RULE", },
	
	--Tradeskill = { }, -- created elsewhere (needs localise which isnt available here)
	
	Flying = {
		Never = {
			Instance = {
				[1191] = true, -- Ashran (PvP)
				[1203] = true, -- Frostfire Finale
				[1265] = true, -- Tanaan Jungle Intro
				[1463] = true, -- Helheim Exterior Area
				[1669] = true, -- Argus
				
				[1107] = true, -- Warlock Order Hall - Dreadscar Rift
				[1469] = true, -- Shaman Order Hall - The Heart of Azeroth
				[1479] = true, -- Warrior Order Hall - Skyhold
				[1514] = true, -- Monk Order Hall - The Wandering Isle
				[1519] = true, -- Demon Hunter Order Hall - The Fel Hammer
				
				[1557] = true, -- Class Trial Boost
				
				[1750] = true, -- Exodar - Argus Intro
				[1760] = true, -- Battle for Lordaeron Scenario
				[1876] = true, -- Battle for Stormgarde
				
				-- bfa - island expeditions
				[1893] = true, -- dread chain
				[1897] = true, -- molten cay
				[1892] = true, -- rotting mire
				[1898] = true, -- skittering hollow
				[1813] = true, -- un'gol ruins
				[1882] = true, -- verdant isles
				[1883] = true, -- whispering reef
				
				-- extra races
				[1917] = true, -- Gorgrond - Mag'har scenario
				
				-- shadowlands
				[2364] = true, -- The Maw Intro
				[2363] = true, -- night fae - queens conservatory
				
				-- /dump GetInstanceInfo( )
			},
			Map = {
				[1543] = true, -- Shadowlands / The Maw
				[1670] = true, -- Shadowlands / Oribos Level 1
				[1671] = true, -- Shadowlands / Oribos Level 2
				[1961] = true, -- Shadowlands / Korthia
				
				-- /dump C_Map.GetBestMapForUnit( "player" )
			},
		},
		Achievement = {
--			[1116] = 10018 -- Draenor -- Draenor Pathfinder
--			[1464] = 10018 -- Tanaan Jungle
--			[1152] = 10018 -- Horde Garrison Level 1
--			[1330] = 10018 -- Horde Garrison Level 2
--			[1153] = 10018 -- Horde Garrison Level 3
--			[1154] = 10018 -- Horde Garrison Level 4
--			[1158] = 10018 -- Alliance Garrison Level 1
--			[1331] = 10018 -- Alliance Garrison Level 2
--			[1159] = 10018 -- Alliance Garrison Level 3
--			[1160] = 10018 -- Alliance Garrison Level 4
			
--			[1220] = 11446 -- Broken Isles -- Broken Isles Pathfinder Part 2
			
			[1642] = 13250, -- Zandalar / Battle for Azeroth Pathfinder Part 2
			[1643] = 13250, -- Kul Tiras / Battle for Azeroth Pathfinder Part 2
			[1718] = 13250, -- Nazjatar / Battle for Azeroth Pathfinder Part 2
--			[0000] = 13250, -- Rustbucket / Battle for Azeroth Pathfinder Part 2
			[2374] = 15514, -- Shadowlands / Zereth Mortis
		},
		Spell = { },
		Quest = {
			[2222] = 63893, -- Shadowlands Flying
		},
		Bug735 = {
			[0] = true, -- Eastern Kingdoms
			[1] = true, -- Kalimdor
--			[530] = true, -- Outland (appears to be working now)
			[571] = true, -- Northrend
			[730] = true, -- Maelstrom (Deepholm)
--			[870] = true, -- Pandaria (appears to be working now)
		},
		Dragonriding = { }, -- list of mount spells populated via mount scan
	},
	
	YieldAfter = 25,
	
	ObjectDataMaxAttempts = 10,
	
	ClassArmor = {
		[ArkInventory.ENUM.ITEM.TYPE.ARMOR.CLOTH] = { MAGE = 1, PRIEST = 1, WARLOCK = 1 },
		[ArkInventory.ENUM.ITEM.TYPE.ARMOR.LEATHER] = { DRUID = 1, ROGUE = 1, LOWLEVELHUNTER = 1, MONK = 1, DEMONHUNTER = 1 },
		[ArkInventory.ENUM.ITEM.TYPE.ARMOR.MAIL] = { HUNTER = 1, SHAMAN = 1, EVOKER = 1 },
		[ArkInventory.ENUM.ITEM.TYPE.ARMOR.PLATE] = { PALADIN = 1, WARRIOR = 1, DEATHKNIGHT = 1 },
	},
	
	UpdateTimer = {
		Min = 0.01,
		Max = 60,
	},
	
	ItemFrameType = {
		Normal = "",
		Tainted = "Tainted",
		Popup = "Popup",
	},
	
}


ArkInventory.Collection = { }
ArkInventory.Action = { }


ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.NUM_BAGS = ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.NUM_BAGS_NORMAL + ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.NUM_BAGS_REAGENT


-- populate the min/max toc values, and ids for each expansion
for k, v in pairs( ArkInventory.ENUM.EXPANSION ) do
	if k ~= "CURRENT" then
		ArkInventory.Const.BLIZZARD.CLIENT.EXPANSION[v] = {
			ID = v,
			TOC = {
				MIN = ( v + 1 ) * 10000,
				MAX = ( v + 2 ) * 10000 - 1,
			},
		}
	end
end
