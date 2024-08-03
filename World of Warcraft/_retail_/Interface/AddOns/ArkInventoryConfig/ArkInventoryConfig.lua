
--License: All Rights Reserved, (c) 2006-2024


if ArkInventory.TOCVersionFail( true ) then return end

local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table

local ItemStringPattern = "(|h%[.-%]|h)"

local config = {
	me = ArkInventory.GetPlayerCodex( ),
	catset = {
		sort = ArkInventory.ENUM.LIST.SORTBY.NAME,
		show = ArkInventory.ENUM.LIST.SHOW.ACTIVE,
		selected = nil,
	},
	sortmethod = {
		sort = ArkInventory.ENUM.LIST.SORTBY.NAME,
		show = ArkInventory.ENUM.LIST.SHOW.ACTIVE,
	},
	profile = {
		sort = ArkInventory.ENUM.LIST.SORTBY.NAME,
		show = ArkInventory.ENUM.LIST.SHOW.ACTIVE,
		selected = nil,
	},
	category = {
		system = {
			sort = ArkInventory.ENUM.LIST.SORTBY.NAME,
			selected = nil,
		},
		custom = {
			sort = {
				list = ArkInventory.ENUM.LIST.SORTBY.NAME,
				item = ArkInventory.ENUM.LIST.SORTBY.NAME,
			},
			show = ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			selected = nil,
		},
		rule = {
			sort = ArkInventory.ENUM.LIST.SORTBY.NAME,
			show = ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			selected = nil,
		},
		action = {
			sort = ArkInventory.ENUM.LIST.SORTBY.NAME,
			show = ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			selected = nil,
		},
	},
	account = {
		sort = ArkInventory.ENUM.LIST.SORTBY.NAME,
		show = ArkInventory.ENUM.LIST.SHOW.ACTIVE,
	},
	design = {
		sort = ArkInventory.ENUM.LIST.SORTBY.NAME,
		show = ArkInventory.ENUM.LIST.SHOW.ACTIVE,
	},
}
config.isCharacterOptionText = ORANGE_FONT_COLOR:WrapTextInColorCode( string.format( ArkInventory.Localise["CONFIG_IS_PER_CHARACTER"], config.me.player.data.info.name ) )

--[[
	
	info.options = the options table
	info[0] = slash command
	info[1] = first group name
	...
	info[#info] = current option name
	info.arg
	info.handler
	info.type
	info.option = current option
	info.uiType
	info.uiName
	
	Currently inherited are: set, get, func, confirm, validate, disabled, hidden- set to false if you want to reset the inheritance
	
]]--


function ArkInventory.ConfigRefresh( )
	--ArkInventory.Output( "ConfigRefresh" )
	ArkInventory.ConfigInternal( ) -- make sure the table is created
	LibStub("AceConfigRegistry-3.0"):NotifyChange( ArkInventory.Const.Frame.Config.Internal )
end

function ArkInventory:EVENT_ARKINV_CONFIG_UPDATE( msg, ... )
	--ArkInventory.Output( "EVENT_ARKINV_CONFIG_UPDATE" )
	ArkInventory.ConfigRefresh( )
end

ArkInventory:RegisterMessage( "EVENT_ARKINV_CONFIG_UPDATE" )

function ArkInventory.ConfigRefreshFull( )
	
	ArkInventory.Lib.Dewdrop:Close( )
	--ArkInventory.Frame_Main_Hide( )
	--ArkInventory.Frame_Rules_Hide( )
	
	ArkInventory.CodexReset( )
	
	ArkInventory.PlayerInfoSet( )
	ArkInventory.DatabaseUpgradePostLoad( )
	
	ArkInventory.ConfigRefresh( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
	
end

local function ConfigGetNode( info, level )
	
	local level = level or #info - 1
	if level < 1 then level = 1 end
	if level > #info then level = #info end
	
	local node = info.options
	local path = ""
	
	for k = 1, level do
		if k == 1 then
			path = info[k]
		else
			path = string.format( "%s:%s", path, info[k] )
		end
		node = node.args[info[k]]
	end
	
	return node, path
	
end

local function ConfigGetNodeArg( info, level )
	
	local node, path = ConfigGetNode( info, level )
	
	if not node or node.arg == nil then
		
		local p = ""
		for k = 1, #info do
			if k == 1 then
				p = info[k]
			else
				p = string.format( "%s:%s", p, info[k] )
			end
		end
		
		ArkInventory.OutputError( "bad code. ", path, " does not have an arg value.  requested from ", p )
		return nil
	end
	
	return node.arg
	
end

local function helperColourGet( v )
	
	assert( v, "bad code: missing parameter" )
	assert( type( v ) == "table", "bad code: parameter is not a table" )
	
	local f = "%.3f"
	
	local r = tonumber( string.format( f, v.r or 1 ) )
	local g = tonumber( string.format( f, v.g or 1 ) )
	local b = tonumber( string.format( f, v.b or 1 ) )
	local a = tonumber( string.format( f, v.a or 1 ) )
	return r, g, b, a
	
end

local function helperColourSet( v, r, g, b, a )
	
	assert( v, "bad code: missing parameter" )
	assert( type( v ) == "table", "bad code: parameter is not a table" )
	
	local f = "%.3f"
	
	v.r = tonumber( string.format( f, r or 1 ) )
	v.g = tonumber( string.format( f, g or 1 ) )
	v.b = tonumber( string.format( f, b or 1 ) )
	if a then
		v.a = tonumber( string.format( f, a or 1 ) )
	end
	
end

local anchorpoints = {
	[ArkInventory.ENUM.ANCHOR.DEFAULT] = ArkInventory.Localise["DEFAULT"],
	[ArkInventory.ENUM.ANCHOR.BOTTOMRIGHT] = ArkInventory.Localise["BOTTOMRIGHT"],
	[ArkInventory.ENUM.ANCHOR.BOTTOMLEFT] = ArkInventory.Localise["BOTTOMLEFT"],
	[ArkInventory.ENUM.ANCHOR.TOPLEFT] = ArkInventory.Localise["TOPLEFT"],
	[ArkInventory.ENUM.ANCHOR.TOPRIGHT] = ArkInventory.Localise["TOPRIGHT"],
}

local anchorpoints2 = {
	[ArkInventory.ENUM.ANCHOR.DEFAULT] = ArkInventory.Localise["DEFAULT"],
	[ArkInventory.ENUM.ANCHOR.BOTTOMRIGHT] = ArkInventory.Localise["BOTTOMRIGHT"],
	[ArkInventory.ENUM.ANCHOR.BOTTOM] = ArkInventory.Localise["BOTTOM"],
	[ArkInventory.ENUM.ANCHOR.BOTTOMLEFT] = ArkInventory.Localise["BOTTOMLEFT"],
	[ArkInventory.ENUM.ANCHOR.LEFT] = ArkInventory.Localise["LEFT"],
	[ArkInventory.ENUM.ANCHOR.TOPLEFT] = ArkInventory.Localise["TOPLEFT"],
	[ArkInventory.ENUM.ANCHOR.TOP] = ArkInventory.Localise["TOP"],
	[ArkInventory.ENUM.ANCHOR.TOPRIGHT] = ArkInventory.Localise["TOPRIGHT"],
	[ArkInventory.ENUM.ANCHOR.RIGHT] = ArkInventory.Localise["RIGHT"],
}

local anchorpoints3 = {
	[ArkInventory.ENUM.ANCHOR.DEFAULT] = ArkInventory.Localise["DEFAULT"],
	[ArkInventory.ENUM.ANCHOR.LEFT] = ArkInventory.Localise["LEFT"],
	[ArkInventory.ENUM.ANCHOR.RIGHT] = ArkInventory.Localise["RIGHT"],
	[ArkInventory.ENUM.ANCHOR.CENTER] = ArkInventory.Localise["CENTER"],
}

local anchorpoints4 = {
	[ArkInventory.ENUM.ANCHOR.DEFAULT] = ArkInventory.Localise["AUTOMATIC"],
	[ArkInventory.ENUM.ANCHOR.TOP] = ArkInventory.Localise["TOP"],
	[ArkInventory.ENUM.ANCHOR.BOTTOM] = ArkInventory.Localise["BOTTOM"],
}

local anchorpoints5 = {
	[ArkInventory.ENUM.ANCHOR.DEFAULT] = ArkInventory.Localise["DEFAULT"],
	[ArkInventory.ENUM.ANCHOR.CENTER] = ArkInventory.Localise["CENTER"],
	[ArkInventory.ENUM.ANCHOR.TOP] = ArkInventory.Localise["TOP"],
	[ArkInventory.ENUM.ANCHOR.TOPRIGHT] = ArkInventory.Localise["TOPRIGHT"],
	[ArkInventory.ENUM.ANCHOR.RIGHT] = ArkInventory.Localise["RIGHT"],
	[ArkInventory.ENUM.ANCHOR.BOTTOMRIGHT] = ArkInventory.Localise["BOTTOMRIGHT"],
	[ArkInventory.ENUM.ANCHOR.BOTTOM] = ArkInventory.Localise["BOTTOM"],
	[ArkInventory.ENUM.ANCHOR.BOTTOMLEFT] = ArkInventory.Localise["BOTTOMLEFT"],
	[ArkInventory.ENUM.ANCHOR.LEFT] = ArkInventory.Localise["LEFT"],
	[ArkInventory.ENUM.ANCHOR.TOPLEFT] = ArkInventory.Localise["TOPLEFT"],
}

local anchorpoints6 = {
	[ArkInventory.ENUM.ANCHOR.TOP] = ArkInventory.Localise["TOP"],
	[ArkInventory.ENUM.ANCHOR.BOTTOM] = ArkInventory.Localise["BOTTOM"],
}


function ArkInventory.ConfigInternal( )
	
	local path = ArkInventory.Config.Internal
	
	path.childGroups = "tab"
	
	path.args = {
		
		version = {
			cmdHidden = true,
			order = 100,
			name = ArkInventory.Global.Version,
			type = "description",
			fontSize = "large"
		},
		notes = {
			cmdHidden = true,
			order = 200,
			name = function( ) 
				local t = ArkInventory.CrossClient.GetAddOnMetadata( ArkInventory.Const.Program.Name, string.format( "Notes-%s", GetLocale( ) ) ) or ""
				if t == "" then
					t = ArkInventory.CrossClient.GetAddOnMetadata( ArkInventory.Const.Program.Name, "Notes" ) or ""
				end
				return t or ""
			end,
			type = "description",
			fontSize = "medium"
		},
		enabled = {
			cmdHidden = true,
			order = 300,
			name = ArkInventory.Localise["ENABLED"],
			type = "toggle",
			get = function( info )
				return ArkInventory:IsEnabled( )
			end,
			set = function( info, v )
				if v then
					ArkInventory:Enable( )
				else
					ArkInventory:Disable( )
				end
			end,
		},
		
		general = {
			cmdHidden = true,
			order = 1000,
			name = ArkInventory.Localise["GENERAL"],
			desc = ArkInventory.Localise["CONFIG_GENERAL_DESC"],
			type = "group",
			childGroups = "tab",
			args = {
				
				profile = {
					order = 50,
					type = "select",
					name = ArkInventory.Localise["CONFIG_PROFILE_CURRENT"],
					width = "double",
					values = function( )
						local t = { }
						for id, data in pairs( ArkInventory.db.option.profile.data ) do
							if data.used == "Y" and not data.system then
								local n = data.name
								t[id] = string.format( "[%04i] %s", id, n )
							end
						end
						return t
					end,
					get = function( info )
						return config.me.player.data.profile
					end,
					set = function( info, v )
						if config.me.player.data.profile ~= v then
							config.me.player.data.profile = v
							ArkInventory.ConfigRefreshFull( )
						end
					end,
				},
				font = {
					order = 100,
					name = ArkInventory.Localise["FONT"],
					desc = ArkInventory.Localise["CONFIG_GENERAL_FONT_DESC"],
					type = "select",
					width = "double",
					dialogControl = "LSM30_Font",
					values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.FONT ),
					get = function( info )
						return ArkInventory.db.option.font.face or ArkInventory.Const.Font.Face
					end,
					set = function( info, v )
						ArkInventory.db.option.font.face = v
						ArkInventory.MediaAllFontSet( v )
					end,
				},
				height = {
					order = 110,
					name = ArkInventory.Localise["FONT_SIZE"],
					type = "range",
					min = ArkInventory.Const.Font.MinHeight,
					max = ArkInventory.Const.Font.MaxHeight,
					step = 1,
					hidden = true,
					get = function( info )
						return ArkInventory.db.option.font.height
					end,
					set = function( info, v )
						local v = math.floor( v )
						if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
						if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
						if ArkInventory.db.option.font.height ~= v then
							ArkInventory.db.option.font.height = v
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
						end
					end,
				},
				restack = {
					order = 130,
					name = ArkInventory.Localise["RESTACK"],
					desc = ArkInventory.Localise["RESTACK_TYPE"],
					type = "select",
					values = function( )
						local t = { }
						if ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Client then
							t[1] = string.format( "%s: %s", ArkInventory.Localise["BLIZZARD"], ArkInventory.Localise["CLEANUP"] )
						end
						t[2] = string.format( "%s: %s", ArkInventory.Const.Program.Name, ArkInventory.Localise["RESTACK"] )
						
						return t
					end,
					get = function( info )
						if ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].ClientCheck ) then
							if ArkInventory.db.option.restack.blizzard then
								return 1
							else
								return 2
							end
						else
							return 2
						end
					end,
					set = function( info, v )
						if v == 1 then
							ArkInventory.db.option.restack.blizzard = true
						else
							ArkInventory.db.option.restack.blizzard = false
						end
					end,
				},
				reposition = {
					order = 140,
					name = ArkInventory.Localise["CONFIG_GENERAL_REPOSITION_ONSHOW"],
					desc = ArkInventory.Localise["CONFIG_GENERAL_REPOSITION_ONSHOW_DESC"],
					type = "toggle",
					get = function( info )
						return ArkInventory.db.option.auto.reposition
					end,
					set = function( info, v )
						ArkInventory.db.option.auto.reposition = v
					end,
				},
				
				myprofiles = {
					cmdHidden = true,
					order = 100,
					name = ArkInventory.Localise["CONFIG_PROFILE_PLURAL"],
					type = "group",
					args = { },
				},
				auto = {
					cmdHidden = true,
					order = 1000,
					name = ArkInventory.Localise["CONFIG_AUTO"],
					type = "group",
					args = {
						auto_open = {
							order = 100,
							type = "group",
							inline = true,
							name = " ",
							args = {
								header = {
									order = 10,
									name = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN"], ArkInventory.Const.Program.Name, ArkInventory.Localise["BACKPACK"] ),
									type = "header",
									width = "full",
								},
								bank = {
									order = 100,
									name = ArkInventory.Localise["BANK"],
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN_DESC"], ArkInventory.Localise["BANK"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.open.bank
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.bank = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								vault = {
									order = 100,
									name = ArkInventory.Localise["VAULT"],
									disabled = not ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].ClientCheck ),
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN_DESC"], ArkInventory.Localise["VAULT"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.open.vault
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.vault = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								mail = {
									order = 100,
									name = ArkInventory.Localise["MAILBOX"],
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN_DESC"], ArkInventory.Localise["MAILBOX"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.open.mail
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.mail = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								merchant = {
									order = 100,
									name = ArkInventory.Localise["MERCHANT"],
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN_DESC"], ArkInventory.Localise["MERCHANT"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.open.merchant
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.merchant = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								trade = {
									order = 100,
									name = ArkInventory.Localise["TRADE"],
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN_DESC"], ArkInventory.Localise["TRADE"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.open.trade
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.trade = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								auction = {
									order = 100,
									name = ArkInventory.Localise["AUCTION_HOUSE"],
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN_DESC"], ArkInventory.Localise["AUCTION_HOUSE"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.open.auction
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.auction = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								void = {
									order = 100,
									name = ArkInventory.Localise["VOID_STORAGE"],
									disabled = not ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Void].ClientCheck ),
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN_DESC"], ArkInventory.Localise["VOID_STORAGE"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.open.void
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.void = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								obliterum = {
									order = 100,
									name = ArkInventory.Localise["OBLITERUM_FORGE"],
									disabled = not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.LEGION ),
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN_DESC"], ArkInventory.Localise["OBLITERUM_FORGE"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"], ArkInventory.Localise["ALWAYS"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"], [2] = ArkInventory.Localise["ALWAYS"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.open.obliterum
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.obliterum = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								scrap = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_AUTO_SCRAP"],
									disabled = not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.BFA ),
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN_DESC"], ArkInventory.Localise["CONFIG_AUTO_SCRAP"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.open.scrap
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.scrap = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								transmog = {
									order = 100,
									name = ArkInventory.Localise["TRANSMOGRIFIER"],
									disabled = not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.CATACLYSM ),
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN_DESC"], ArkInventory.Localise["TRANSMOGRIFIER"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.open.transmog
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.transmog = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								rune = {
									order = 100,
									name = ArkInventory.Localise["ENGRAVE"],
									disabled = not ArkInventory.ClientCheck( nil, ArkInventory.ENUM.EXPANSION.CLASSIC ),
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_OPEN_DESC"], ArkInventory.Localise["ENGRAVE"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.open.rune
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.open.rune = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
							},
						},
						auto_close = {
							order = 200,
							type = "group",
							inline = true,
							name = " ",
							args = {
								header = {
									order = 10,
									name = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE"], ArkInventory.Const.Program.Name, ArkInventory.Localise["BACKPACK"] ),
									type = "header",
									width = "full",
								},
								bank = {
									order = 100,
									name = ArkInventory.Localise["BANK"],
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE_DESC"], ArkInventory.Localise["BANK"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"], ArkInventory.Localise["ALWAYS"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"], [ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS] = ArkInventory.Localise["ALWAYS"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.close.bank
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.bank = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								vault = {
									order = 100,
									name = ArkInventory.Localise["VAULT"],
									disabled = not ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].ClientCheck ),
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE_DESC"], ArkInventory.Localise["VAULT"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"], ArkInventory.Localise["ALWAYS"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"], [ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS] = ArkInventory.Localise["ALWAYS"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.close.vault
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.vault = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								mail = {
									order = 100,
									name = ArkInventory.Localise["MAILBOX"],
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE_DESC"], ArkInventory.Localise["MAILBOX"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"], ArkInventory.Localise["ALWAYS"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"], [ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS] = ArkInventory.Localise["ALWAYS"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.close.mail
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.mail = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								merchant = {
									order = 100,
									name = ArkInventory.Localise["MERCHANT"],
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE_DESC"], ArkInventory.Localise["MERCHANT"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"], ArkInventory.Localise["ALWAYS"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"], [ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS] = ArkInventory.Localise["ALWAYS"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.close.merchant
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.merchant = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								trade = {
									order = 100,
									name = ArkInventory.Localise["TRADE"],
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE_DESC"], ArkInventory.Localise["TRADE"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"], ArkInventory.Localise["ALWAYS"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"], [ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS] = ArkInventory.Localise["ALWAYS"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.close.trade
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.trade = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								auction = {
									order = 100,
									name = ArkInventory.Localise["AUCTION_HOUSE"],
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE_DESC"], ArkInventory.Localise["AUCTION_HOUSE"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"], ArkInventory.Localise["ALWAYS"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"], [ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS] = ArkInventory.Localise["ALWAYS"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.close.auction
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.auction = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								void = {
									order = 100,
									name = ArkInventory.Localise["VOID_STORAGE"],
									disabled = not ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Void].ClientCheck ),
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE_DESC"], ArkInventory.Localise["VOID_STORAGE"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"], ArkInventory.Localise["ALWAYS"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"], [ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS] = ArkInventory.Localise["ALWAYS"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.close.void
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.void = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								obliterum = {
									order = 100,
									name = ArkInventory.Localise["OBLITERUM_FORGE"],
									disabled = not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.LEGION ),
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE_DESC"], ArkInventory.Localise["OBLITERUM_FORGE"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"], ArkInventory.Localise["ALWAYS"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"], [ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS] = ArkInventory.Localise["ALWAYS"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.close.obliterum
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.obliterum = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								scrap = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_AUTO_SCRAP"],
									disabled = not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.BFA ),
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE_DESC"], ArkInventory.Localise["CONFIG_AUTO_SCRAP"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"], ArkInventory.Localise["ALWAYS"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"], [ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS] = ArkInventory.Localise["ALWAYS"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.close.scrap
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.scrap = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								transmog = {
									order = 100,
									name = ArkInventory.Localise["TRANSMOGRIFIER"],
									disabled = not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.CATACLYSM ),
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE_DESC"], ArkInventory.Localise["TRANSMOGRIFIER"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"], ArkInventory.Localise["ALWAYS"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"], [ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS] = ArkInventory.Localise["ALWAYS"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.close.transmog
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.transmog = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								rune = {
									order = 100,
									name = ArkInventory.Localise["ENGRAVE"],
									disabled = not ArkInventory.ClientCheck( nil, ArkInventory.ENUM.EXPANSION.CLASSIC ),
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE_DESC"], ArkInventory.Localise["ENGRAVE"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"], ArkInventory.Localise["ALWAYS"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"], [ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS] = ArkInventory.Localise["ALWAYS"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.close.rune
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.rune = v
										ArkInventory.BlizzardAPIHook( false, true )
									end,
								},
								combat = {
									order = 999,
									name = ArkInventory.Localise["CONFIG_AUTO_COMBAT"],
									type = "select",
									desc = string.format( ArkInventory.Localise["CONFIG_AUTO_CLOSE_COMBAT_DESC"], ArkInventory.Localise["CONFIG_AUTO_COMBAT"], ArkInventory.Localise["BACKPACK"], ArkInventory.Localise["NO"], ArkInventory.Localise["YES"] ),
									values = function( )
										local t = { [ArkInventory.ENUM.BAG.OPENCLOSE.NO] = ArkInventory.Localise["NO"], [ArkInventory.ENUM.BAG.OPENCLOSE.YES] = ArkInventory.Localise["YES"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.auto.close.combat
									end,
									set = function( info, v )
										ArkInventory.db.option.auto.close.combat = v
									end,
								},
							},
						},
					},
				},
				tooltip = {
					order = 1000,
					name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP"],
					type = "group",
					childGroups = "tab",
					--inline = true,
					args = {
						basic = {
							order = 100,
							name = ArkInventory.Localise["GENERAL"],
							type = "group",
							--inline = true,
							args = {
								show = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_ENABLE_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.tooltip.show
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.show = v
									end,
								},
								addempty = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_EMPTY_ADD"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_EMPTY_ADD_DESC"],
									type = "toggle",
									disabled = function( info )
										return not ArkInventory.db.option.tooltip.show
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.addempty
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.addempty = v
									end,
								},
								highlight = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_HIGHLIGHT"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_HIGHLIGHT_DESC"],
									type = "input",
									width = "half",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show
									end,
									get = function( info )
										return string.sub( string.trim( ArkInventory.db.option.tooltip.highlight ), 1, 3 )
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.highlight = string.sub( string.trim( v ), 1, 3 )
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
							},
						},
						scale = {
							order = 200,
							name = ArkInventory.Localise["SCALE"],
							type = "group",
							--inline = true,
							disabled = function( info )
								return not ArkInventory.db.option.tooltip.show
							end,
							args = {
								enabled = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_SCALE_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.tooltip.scale.enabled
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.scale.enabled = v
										for _, obj in pairs( ArkInventory.Global.Tooltip.WOW ) do
											if v then
												obj:SetScale( ArkInventory.db.option.tooltip.scale.amount or 1 )
											else
												obj:SetScale( 1 )
											end
										end
									end,
								},
								value = {
									order = 200,
									name = ArkInventory.Localise["SCALE"],
									type = "range",
									min = 0.5,
									max = 2,
									step = 0.05,
									isPercent = true,
									disabled = function( )
										return not ArkInventory.db.option.tooltip.scale.enabled
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.scale.amount
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.5 then v = 0.5 end
										if v > 2 then v = 2 end
										if ArkInventory.db.option.tooltip.scale.amount ~= v then
											ArkInventory.db.option.tooltip.scale.amount = v
											for _, obj in pairs( ArkInventory.Global.Tooltip.WOW ) do
												obj:SetScale( ArkInventory.db.option.tooltip.scale.amount or 1 )
											end
										end
									end,
								},
							},
						},
						itemcount = {
							order = 300,
							name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT"],
							type = "group",
							--inline = true,
							disabled = function( info )
								return not ArkInventory.db.option.tooltip.show
							end,
							args = {
								enable = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT_ENABLE_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.tooltip.itemcount.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.itemcount.enable = v
									end,
								},
								colour_class = {
									order = 200,
									name = ArkInventory.Localise["CLASS_COLOURS"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT_COLOUR_CLASS_DESC"],
									type = "toggle",
									disabled = function( info )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.itemcount.colour.class
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.itemcount.colour.class = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								colour_text = {
									order = 210,
									name = ArkInventory.Localise["TEXT"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT_COLOUR_TEXT_DESC"],
									type = "color",
									hasAlpha = false,
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable
									end,
									get = function( info )
										return helperColourGet( ArkInventory.db.option.tooltip.itemcount.colour.text )
									end,
									set = function( info, r, g, b )
										helperColourSet( ArkInventory.db.option.tooltip.itemcount.colour.text, r, g, b )
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								colour_count = {
									order = 220,
									name = ArkInventory.Localise["AMOUNTS"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT_COLOUR_AMOUNTS_DESC"],
									type = "color",
									hasAlpha = false,
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable
									end,
									get = function( info )
										return helperColourGet( ArkInventory.db.option.tooltip.itemcount.colour.count )
									end,
									set = function( info, r, g, b )
										helperColourSet( ArkInventory.db.option.tooltip.itemcount.colour.count, r, g, b )
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								justme = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_SELF_ONLY"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_SELF_ONLY_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.itemcount.justme
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.itemcount.justme = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								account = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_ACCOUNT_ONLY"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_ACCOUNT_ONLY_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable or ArkInventory.db.option.tooltip.itemcount.justme
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.itemcount.account
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.itemcount.account = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								faction = {
									order = 410,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_FACTION_ONLY"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_FACTION_ONLY_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable or ArkInventory.db.option.tooltip.itemcount.justme
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.itemcount.faction
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.itemcount.faction = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								realm = {
									order = 420,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_REALM_ONLY"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_REALM_ONLY_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable or ArkInventory.db.option.tooltip.itemcount.justme
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.itemcount.realm
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.itemcount.realm = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								crossrealm = {
									order = 425,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_CROSSREALM"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_CROSSREALM_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable or ArkInventory.db.option.tooltip.itemcount.justme or not ArkInventory.db.option.tooltip.itemcount.realm
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.itemcount.crossrealm
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.itemcount.crossrealm = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								vault = {
									order = 500,
									name = ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name,
									desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_LOCATION_INCLUDE_DESC"], ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name ),
									type = "toggle",
									disabled = function( )
										if ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].ClientCheck ) then
											return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable or ArkInventory.db.option.tooltip.itemcount.justme
										else
											return true
										end
									end,
									get = function( info )
										if ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].ClientCheck ) then
											return ArkInventory.db.option.tooltip.itemcount.vault
										end
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.itemcount.vault = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								showtabs = {
									order = 510,
									name = ArkInventory.Localise["VAULT_TABS"],
									desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_ITEMCOUNT_VAULT_TABS_DESC"], ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name ),
									type = "toggle",
									disabled = function( )
										if ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].ClientCheck ) then
											return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable or ArkInventory.db.option.tooltip.itemcount.justme or not ArkInventory.db.option.tooltip.itemcount.vault
										else
											return true
										end
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.itemcount.tabs
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.itemcount.tabs = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								tradeskill = {
									order = 800,
									name = ArkInventory.Global.Location[ArkInventory.Const.Location.Tradeskill].Name,
									desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_LOCATION_INCLUDE_DESC"], ArkInventory.Global.Location[ArkInventory.Const.Location.Tradeskill].Name ),
									type = "toggle",
									disabled = function( )
										local ok = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Tradeskill].ClientCheck )
										return not ok or not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.itemcount.tradeskill
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.itemcount.tradeskill = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
							},
						},
						money = {
							order = 300,
							name = ArkInventory.Localise["MONEY"],
							type = "group",
							--inline = true,
							disabled = function( info )
								return not ArkInventory.db.option.tooltip.show
							end,
							args = {
								enable = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_MONEY_ENABLE_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.tooltip.money.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.money.enable = v
									end,
								},
								colour_class = {
									order = 200,
									name = ArkInventory.Localise["CLASS_COLOURS"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_MONEY_COLOUR_CLASS_DESC"],
									type = "toggle",
									disabled = function( info )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.money.enable
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.money.colour.class
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.money.colour.class = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								colour_text = {
									order = 210,
									name = ArkInventory.Localise["TEXT"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_MONEY_COLOUR_TEXT_DESC"],
									type = "color",
									hasAlpha = false,
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.money.enable
									end,
									get = function( info )
										return helperColourGet( ArkInventory.db.option.tooltip.money.colour.text )
									end,
									set = function( info, r, g, b )
										helperColourSet( ArkInventory.db.option.tooltip.money.colour.text, r, g, b )
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								colour_count = {
									order = 220,
									name = ArkInventory.Localise["AMOUNTS"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_MONEY_COLOUR_AMOUNTS_DESC"],
									type = "color",
									hasAlpha = false,
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.money.enable
									end,
									get = function( info )
										return helperColourGet( ArkInventory.db.option.tooltip.money.colour.count )
									end,
									set = function( info, r, g, b )
										helperColourSet( ArkInventory.db.option.tooltip.money.colour.count, r, g, b )
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								justme = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_SELF_ONLY"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_SELF_ONLY_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.money.enable
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.money.justme
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.money.justme = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								account = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_ACCOUNT_ONLY"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_ACCOUNT_ONLY_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.money.enable or ArkInventory.db.option.tooltip.money.justme
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.money.account
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.money.account = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								faction = {
									order = 410,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_FACTION_ONLY"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_FACTION_ONLY_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.money.enable or ArkInventory.db.option.tooltip.money.justme
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.money.faction
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.money.faction = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								realm = {
									order = 420,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_REALM_ONLY"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_REALM_ONLY_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.money.enable or ArkInventory.db.option.tooltip.money.justme
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.money.realm
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.money.realm = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								crossrealm = {
									order = 425,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_CROSSREALM"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_CROSSREALM_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.money.enable or ArkInventory.db.option.tooltip.money.justme or not ArkInventory.db.option.tooltip.money.realm
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.money.crossrealm
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.money.crossrealm = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								vault = {
									order = 500,
									name = ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name,
									desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_LOCATION_INCLUDE_DESC"], ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name ),
									type = "toggle",
									disabled = function( )
										if ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].ClientCheck ) then
											return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.money.enable or ArkInventory.db.option.tooltip.money.justme
										else
											return true
										end
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.money.vault
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.money.vault = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
							},
						},
						battlepet = {
							order = 300,
							name = ArkInventory.Localise["BATTLEPET"],
							disabled = not ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].ClientCheck ),
							type = "group",
							--inline = true,
							args = {
								enabled = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_BATTLEPET_CUSTOM_ENABLE_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.tooltip.battlepet.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.battlepet.enable = v
									end,
								},
								source = {
									order = 200,
									name = SOURCES,
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_BATTLEPET_SOURCE_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.battlepet.enable
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.battlepet.source
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.battlepet.source = v
									end,
								},
								description = {
									order = 300,
									name = ArkInventory.Localise["DESCRIPTION"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_BATTLEPET_DESCRIPTION_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.battlepet.enable
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.battlepet.description
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.battlepet.description = v
									end,
								},
							},
						},
						reputation = {
							order = 300,
							type = "group",
							name = ArkInventory.Localise["REPUTATION"],
							disabled = not ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Reputation].ClientCheck ),
							args = {
								custom = {
									order = 100,
									type = "select",
									name = ArkInventory.Localise["STYLE"],
									values = function( )
										local t = { [ArkInventory.Const.Reputation.Custom.Default] = ArkInventory.Localise["DEFAULT"], [ArkInventory.Const.Reputation.Custom.Custom] = ArkInventory.Localise["CUSTOM"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.reputation.custom
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.reputation.custom = v
										ArkInventory:SendMessage( "EVENT_ARKINV_LDB_REPUTATION_UPDATE_BUCKET" )
									end,
								},
								style_normal = {
									order = 200,
									name = ArkInventory.Localise["TOOLTIP"],
									desc = string.format( "%s%s", ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_REPUTATION_NORMAL_DESC"],ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_REPUTATION_TOKEN_DESC"] ),
									type = "input",
									width = "double",
									disabled = function( )
										return ArkInventory.db.option.tooltip.reputation.custom == ArkInventory.Const.Reputation.Custom.Default
									end,
									get = function( info )
										local v = ArkInventory.db.option.tooltip.reputation.style.normal
										if v == "" then
											v = ArkInventory.Const.Reputation.Style.TooltipNormal
										end
										return string.lower( v )
									end,
									set = function( info, v )
										local v = string.trim( v )
										if v == "" then
											v = ArkInventory.Const.Reputation.Style.TooltipNormal
										end
										ArkInventory.db.option.tooltip.reputation.style.normal = string.lower( v )
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								style_count = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_REPUTATION_ITEMCOUNT"],
									desc = string.format( "%s%s", ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_REPUTATION_ITEMCOUNT_DESC"],ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_REPUTATION_TOKEN_DESC"] ),
									type = "input",
									width = "double",
									disabled = function( )
										return ArkInventory.db.option.tooltip.reputation.custom == ArkInventory.Const.Reputation.Custom.Default or not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable or not ArkInventory.db.option.tooltip.itemcount.reputation
									end,
									get = function( info )
										local v = ArkInventory.db.option.tooltip.reputation.style.count
										if v == "" then
											v = ArkInventory.Const.Reputation.Style.TooltipItemCount
										end
										return string.lower( v )
									end,
									set = function( info, v )
										local v = string.trim( v )
										if v == "" then
											v = ArkInventory.Const.Reputation.Style.TooltipItemCount
										end
										ArkInventory.db.option.tooltip.reputation.style.count = string.lower( v )
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
								enable = {
									order = 400,
									name = ArkInventory.Localise["ENABLE"],
									desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_LOCATION_INCLUDE_DESC"], ArkInventory.Global.Location[ArkInventory.Const.Location.Reputation].Name ),
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.tooltip.show or not ArkInventory.db.option.tooltip.itemcount.enable
									end,
									get = function( info )
										return ArkInventory.db.option.tooltip.itemcount.reputation
									end,
									set = function( info, v )
										ArkInventory.db.option.tooltip.itemcount.reputation = v
										ArkInventory.ObjectCacheTooltipClear( )
									end,
								},
							},
						},
					},
				},
				actions = {
					order = 1000,
					name = ArkInventory.Localise["ACTIONS"],
					type = "group",
					childGroups = "tab",
					args = {
						vendor = {
							order = 1000,
							name = ArkInventory.Action.Vendor.data.name,
							type = "group",
							args = {
								conflict = {
									order = 1,
									name = string.format( ArkInventory.Localise["CONFIG_ACTION_CONFLICT"], ArkInventory.Action.Vendor.data.name, ArkInventory.Action.Vendor.data.addon or ArkInventory.Localise["UNKNOWN"] ),
									type = "description",
									fontSize = "medium",
									width = "full",
									fontSize = "medium",
									hidden = function( )
										return not ArkInventory.Action.Vendor.data.conflict
									end,
								},
								enable = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = string.format( ArkInventory.Localise["CONFIG_ACTION_ENABLE_DESC"], ArkInventory.Action.Vendor.data.name ),
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Vendor.data.conflict
									end,
									get = function( info )
										return ArkInventory.db.option.action.vendor.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.action.vendor.enable = not ArkInventory.db.option.action.vendor.enable
									end,
								},
								automatic = {
									order = 110,
									name = ArkInventory.Localise["AUTOMATIC"],
									desc = ArkInventory.Localise["CONFIG_ACTION_VENDOR_AUTOMATIC_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Vendor.data.conflict or not ArkInventory.db.option.action.vendor.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.vendor.auto
									end,
									set = function( info, v )
										ArkInventory.db.option.action.vendor.auto = not ArkInventory.db.option.action.vendor.auto
									end,
								},
								manual = {
									order = 120,
									name = ArkInventory.Localise["MANUAL"],
									desc = ArkInventory.Localise["CONFIG_ACTION_VENDOR_MANUAL_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Vendor.data.conflict or not ArkInventory.db.option.action.vendor.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.vendor.manual
									end,
									set = function( info, v )
										ArkInventory.db.option.action.vendor.manual = not ArkInventory.db.option.action.vendor.manual
									end,
								},
								testmode = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_ACTION_TESTING"],
									desc = ArkInventory.Localise["CONFIG_ACTION_VENDOR_TEST_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Vendor.data.conflict or not ArkInventory.db.option.action.vendor.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.vendor.test
									end,
									set = function( info, v )
										ArkInventory.db.option.action.vendor.test = not ArkInventory.db.option.action.vendor.test
									end,
								},
								raritycutoff = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_QUALITY_CUTOFF"],
									desc = function( info )
										return string.format( ArkInventory.Localise["CONFIG_ACTION_VENDOR_QUALITY_CUTOFF_DESC"], ( select( 5, ArkInventory.GetItemQualityColor( ArkInventory.db.option.action.vendor.raritycutoff ) ) ), _G[string.format( "ITEM_QUALITY%d_DESC", ArkInventory.db.option.action.vendor.raritycutoff or ArkInventory.ENUM.ITEM.QUALITY.POOR )] )
									end,
									type = "select",
									disabled = function( )
										return ArkInventory.Action.Vendor.data.conflict or not ArkInventory.db.option.action.vendor.enable
									end,
									values = function( )
										local t = { }
										for z in pairs( ITEM_QUALITY_COLORS ) do
											if z >= ArkInventory.ENUM.ITEM.QUALITY.POOR then
												t[tostring( z )] = string.format( "%s%s", select( 5, ArkInventory.GetItemQualityColor( z ) ), _G[string.format( "ITEM_QUALITY%d_DESC", z )] )
											end
										end
										return t
									end,
									get = function( info )
										return tostring( ArkInventory.db.option.action.vendor.raritycutoff or ArkInventory.ENUM.ITEM.QUALITY.POOR )
									end,
									set = function( info, v )
										ArkInventory.db.option.action.vendor.raritycutoff = tonumber( v )
										ArkInventory.ItemCacheClear( )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								limit = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_ACTION_VENDOR_LIMIT"],
									desc = string.format( ArkInventory.Localise["CONFIG_ACTION_VENDOR_LIMIT_DESC"], BUYBACK_ITEMS_PER_PAGE ),
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Vendor.data.conflict or not ArkInventory.db.option.action.vendor.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.vendor.limit
									end,
									set = function( info, v )
										ArkInventory.db.option.action.vendor.limit = not ArkInventory.db.option.action.vendor.limit
									end,
								},
								combat = {
									order = 500,
									name = ArkInventory.Localise["COMBAT"],
									desc = ArkInventory.Localise["CONFIG_ACTION_VENDOR_COMBAT_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Vendor.data.conflict or not ArkInventory.db.option.action.vendor.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.vendor.combat
									end,
									set = function( info, v )
										ArkInventory.db.option.action.vendor.combat = not ArkInventory.db.option.action.vendor.combat
									end,
								},
--[[
								partyloot = {
									order = 600,
									name = ArkInventory.Localise["ITEM_BIND_PARTYLOOT"],
									desc = string.format( ArkInventory.Localise["CONFIG_ACTION_INCLUDE_DESC"], ArkInventory.Localise["ITEM_BIND_PARTYLOOT"] ),
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Vendor.data.conflict or not ArkInventory.db.option.action.vendor.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.vendor.partyloot
									end,
									set = function( info, v )
										ArkInventory.db.option.action.vendor.partyloot = not ArkInventory.db.option.action.vendor.partyloot
									end,
								},
]]--
								notify = {
									order = 700,
									name = ArkInventory.Localise["NOTIFY"],
									desc = ArkInventory.Localise["CONFIG_ACTION_VENDOR_SOLD_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Vendor.data.conflict or not ArkInventory.db.option.action.vendor.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.vendor.notify
									end,
									set = function( info, v )
										ArkInventory.db.option.action.vendor.notify = not ArkInventory.db.option.action.vendor.notify
									end,
								},
								list = {
									order = 800,
									name = ArkInventory.Localise["LIST"],
									desc = ArkInventory.Localise["CONFIG_ACTION_VENDOR_LIST_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Vendor.data.conflict or not ArkInventory.db.option.action.vendor.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.vendor.list
									end,
									set = function( info, v )
										ArkInventory.db.option.action.vendor.list = not ArkInventory.db.option.action.vendor.list
									end,
								},
								timeout = {
									order = 900,
									name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD"],
									desc = ArkInventory.Localise["CONFIG_ACTION_VENDOR_TIMER_DESC"],
									type = "range",
									min = 25,
									max = 2500,
									step = 5,
									disabled = function( )
										return ArkInventory.Action.Vendor.data.conflict or not ArkInventory.db.option.action.vendor.enable
									end,
									get = function( info )
										return ArkInventory.db.option.thread.timeout.junksell
									end,
									set = function( info, v )
										local v = math.floor( v / 5 ) * 5
										if v < 25 then v = 25 end
										if v > 2500 then v = 2500 end
										ArkInventory.db.option.thread.timeout.junksell = v
									end,
								},
								soulbound = {
									order = 5000,
									name = ArkInventory.Localise["SOULBOUND"],
									type = "group",
									inline = true,
									args = {
										known = {
											order = 100,
											name = ArkInventory.Localise["ALREADY_KNOWN"],
											desc = ArkInventory.Localise["CONFIG_ACTION_VENDOR_SOULBOUND_ALREADY_KNOWN_DESC"],
											type = "toggle",
											disabled = function( )
												return ArkInventory.Action.Vendor.data.conflict
											end,
											get = function( info )
												return ArkInventory.db.option.action.vendor.soulbound.known
											end,
											set = function( info, v )
												ArkInventory.db.option.action.vendor.soulbound.known = not ArkInventory.db.option.action.vendor.soulbound.known
												ArkInventory.ItemCacheClear( )
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
											end,
										},
										equipment = {
											order = 200,
											name = ArkInventory.Localise["EQUIPMENT"],
											desc = ArkInventory.Localise["CONFIG_ACTION_VENDOR_SOULBOUND_EQUIPMENT_DESC"],
											type = "toggle",
											disabled = function( )
												return ArkInventory.Action.Vendor.data.conflict
											end,
											get = function( info )
												return ArkInventory.db.option.action.vendor.soulbound.equipment
											end,
											set = function( info, v )
												ArkInventory.db.option.action.vendor.soulbound.equipment = not ArkInventory.db.option.action.vendor.soulbound.equipment
												ArkInventory.ItemCacheClear( )
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
											end,
										},
										itemlevel = {
											order = 300,
											name = ArkInventory.Localise["ITEM_LEVEL"],
											desc = ArkInventory.Localise["CONFIG_ACTION_VENDOR_SOULBOUND_ITEMLEVEL_DESC"],
											type = "toggle",
											disabled = function( )
												return ArkInventory.Action.Vendor.data.conflict or not ArkInventory.db.option.action.vendor.soulbound.equipment
											end,
											get = function( info )
												return ArkInventory.db.option.action.vendor.soulbound.itemlevel
											end,
											set = function( info, v )
												ArkInventory.db.option.action.vendor.soulbound.itemlevel = not ArkInventory.db.option.action.vendor.soulbound.itemlevel
												ArkInventory.ItemCacheClear( )
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
											end,
										},
									},
								},
							},
						},
						mail = {
							order = 1000,
							name = ArkInventory.Action.Mail.data.name,
							type = "group",
							args = {
								conflict = {
									order = 1,
									name = string.format( ArkInventory.Localise["CONFIG_ACTION_CONFLICT"], ArkInventory.Action.Mail.data.name, ArkInventory.Action.Mail.data.addon or ArkInventory.Localise["UNKNOWN"] ),
									type = "description",
									fontSize = "medium",
									width = "full",
									fontSize = "medium",
									hidden = function( )
										return not ArkInventory.Action.Mail.data.conflict
									end,
								},
								enable = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = string.format( ArkInventory.Localise["CONFIG_ACTION_ENABLE_DESC"], ArkInventory.Action.Mail.data.name ),
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Mail.data.conflict
									end,
									get = function( info )
										return ArkInventory.db.option.action.mail.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.action.mail.enable = not ArkInventory.db.option.action.mail.enable
									end,
								},
								automatic = {
									order = 110,
									name = ArkInventory.Localise["AUTOMATIC"],
									desc = ArkInventory.Localise["CONFIG_ACTION_MAIL_AUTOMATIC_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Mail.data.conflict or not ArkInventory.db.option.action.mail.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.mail.auto
									end,
									set = function( info, v )
										ArkInventory.db.option.action.mail.auto = not ArkInventory.db.option.action.mail.auto
									end,
								},
								manual = {
									order = 120,
									name = ArkInventory.Localise["MANUAL"],
									desc = ArkInventory.Localise["CONFIG_ACTION_MAIL_MANUAL_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Mail.data.conflict or not ArkInventory.db.option.action.mail.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.mail.manual
									end,
									set = function( info, v )
										ArkInventory.db.option.action.mail.manual = not ArkInventory.db.option.action.mail.manual
									end,
								},
								testmode = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_ACTION_TESTING"],
									desc = ArkInventory.Localise["CONFIG_ACTION_MAIL_TEST_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Mail.data.conflict or not ArkInventory.db.option.action.mail.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.mail.test
									end,
									set = function( info, v )
										ArkInventory.db.option.action.mail.test = not ArkInventory.db.option.action.mail.test
									end,
								},
								raritycutoff = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_QUALITY_CUTOFF"],
									desc = function( info )
										return string.format( ArkInventory.Localise["CONFIG_ACTION_MAIL_QUALITY_CUTOFF_DESC"], ( select( 5, ArkInventory.GetItemQualityColor( ArkInventory.db.option.action.mail.raritycutoff ) ) ), _G[string.format( "ITEM_QUALITY%d_DESC", ArkInventory.db.option.action.mail.raritycutoff or ArkInventory.ENUM.ITEM.QUALITY.POOR )] )
									end,
									type = "select",
									disabled = function( )
										return ArkInventory.Action.Mail.data.conflict or not ArkInventory.db.option.action.mail.enable
									end,
									values = function( )
										local t = { }
										for z in pairs( ITEM_QUALITY_COLORS ) do
											if z >= ArkInventory.ENUM.ITEM.QUALITY.POOR then
												t[tostring( z )] = string.format( "%s%s", select( 5, ArkInventory.GetItemQualityColor( z ) ), _G[string.format( "ITEM_QUALITY%d_DESC", z )] )
											end
										end
										return t
									end,
									get = function( info )
										return tostring( ArkInventory.db.option.action.mail.raritycutoff or ArkInventory.ENUM.ITEM.QUALITY.POOR )
									end,
									set = function( info, v )
										ArkInventory.db.option.action.mail.raritycutoff = tonumber( v )
									end,
								},
								list = {
									order = 800,
									name = ArkInventory.Localise["LIST"],
									desc = ArkInventory.Localise["CONFIG_ACTION_MAIL_LIST_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Mail.data.conflict or not ArkInventory.db.option.action.mail.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.mail.list
									end,
									set = function( info, v )
										ArkInventory.db.option.action.mail.list = not ArkInventory.db.option.action.mail.list
									end,
								},
								timeout = {
									order = 900,
									name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD"],
									desc = ArkInventory.Localise["CONFIG_ACTION_MAIL_TIMER_DESC"],
									type = "range",
									disabled = function( )
										return ArkInventory.Action.Mail.data.conflict or not ArkInventory.db.option.action.mail.enable
									end,
									min = 50,
									max = 2500,
									step = 50,
									get = function( info )
										return ArkInventory.db.option.thread.timeout.mailsend
									end,
									set = function( info, v )
										local v = math.floor( v / 5 ) * 5
										if v < 50 then v = 50 end
										if v > 2500 then v = 2500 end
										ArkInventory.db.option.thread.timeout.mailsend = v
									end,
								},
							},
						},
						use = {
							order = 1000,
							name = ArkInventory.Action.Use.data.name,
							type = "group",
							hidden = function( )
								return ArkInventory.CrossClient.TimerunningSeasonID( ) == 0
							end,
							args = {
								conflict = {
									order = 1,
									name = string.format( ArkInventory.Localise["CONFIG_ACTION_CONFLICT"], ArkInventory.Action.Use.data.name, ArkInventory.Action.Use.data.addon or ArkInventory.Localise["UNKNOWN"] ),
									type = "description",
									fontSize = "medium",
									width = "full",
									fontSize = "medium",
									hidden = function( )
										return not ArkInventory.Action.Use.data.conflict
									end,
								},
								enable = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = string.format( ArkInventory.Localise["CONFIG_ACTION_ENABLE_DESC"], ArkInventory.Action.Use.data.name ),
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Use.data.conflict
									end,
									get = function( info )
										return ArkInventory.db.option.action.use.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.action.use.enable = not ArkInventory.db.option.action.use.enable
									end,
								},
								automatic = {
									order = 110,
									name = ArkInventory.Localise["AUTOMATIC"],
									desc = ArkInventory.Localise["CONFIG_ACTION_USE_AUTOMATIC_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Use.data.conflict or not ArkInventory.db.option.action.use.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.use.auto
									end,
									set = function( info, v )
										ArkInventory.db.option.action.use.auto = not ArkInventory.db.option.action.use.auto
									end,
								},
								manual = {
									order = 120,
									name = ArkInventory.Localise["MANUAL"],
									desc = ArkInventory.Localise["CONFIG_ACTION_USE_MANUAL_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Use.data.conflict or not ArkInventory.db.option.action.use.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.use.manual
									end,
									set = function( info, v )
										ArkInventory.db.option.action.use.manual = not ArkInventory.db.option.action.use.manual
									end,
								},
								testmode = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_ACTION_TESTING"],
									desc = ArkInventory.Localise["CONFIG_ACTION_USE_TEST_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Use.data.conflict or not ArkInventory.db.option.action.use.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.use.test
									end,
									set = function( info, v )
										ArkInventory.db.option.action.use.test = not ArkInventory.db.option.action.use.test
									end,
								},
								list = {
									order = 800,
									name = ArkInventory.Localise["LIST"],
									desc = ArkInventory.Localise["CONFIG_ACTION_USE_LIST_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Use.data.conflict or not ArkInventory.db.option.action.use.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.use.list
									end,
									set = function( info, v )
										ArkInventory.db.option.action.use.list = not ArkInventory.db.option.action.use.list
									end,
								},
								timeout = {
									order = 900,
									name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD"],
									desc = ArkInventory.Localise["CONFIG_ACTION_USE_TIMER_DESC"],
									type = "range",
									min = 25,
									max = 2500,
									step = 5,
									disabled = function( )
										return ArkInventory.Action.Use.data.conflict or not ArkInventory.db.option.action.use.enable
									end,
									get = function( info )
										return ArkInventory.db.option.thread.timeout.useitem
									end,
									set = function( info, v )
										local v = math.floor( v / 5 ) * 5
										if v < 25 then v = 25 end
										if v > 2500 then v = 2500 end
										ArkInventory.db.option.thread.timeout.useitem = v
									end,
								},
							},
						},
						delete = {
							order = 1000,
							name = ArkInventory.Action.Delete.data.name,
							type = "group",
							args = {
								conflict = {
									order = 1,
									name = string.format( ArkInventory.Localise["CONFIG_ACTION_CONFLICT"], ArkInventory.Action.Delete.data.name, ArkInventory.Action.Delete.data.addon or ArkInventory.Localise["UNKNOWN"] ),
									type = "description",
									fontSize = "medium",
									width = "full",
									fontSize = "medium",
									hidden = function( )
										return not ArkInventory.Action.Delete.data.conflict
									end,
								},
								enable = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = string.format( ArkInventory.Localise["CONFIG_ACTION_ENABLE_DESC"], ArkInventory.Action.Delete.data.name ),
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Delete.data.conflict
									end,
									get = function( info )
										return ArkInventory.db.option.action.delete.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.action.delete.enable = not ArkInventory.db.option.action.delete.enable
									end,
								},
								testmode = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_ACTION_TESTING"],
									desc = ArkInventory.Localise["CONFIG_ACTION_DELETE_TEST_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Delete.data.conflict or not ArkInventory.db.option.action.delete.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.delete.test
									end,
									set = function( info, v )
										ArkInventory.db.option.action.delete.test = not ArkInventory.db.option.action.delete.test
									end,
								},
								raritycutoff = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_QUALITY_CUTOFF"],
									desc = function( info )
										return string.format( ArkInventory.Localise["CONFIG_ACTION_DELETE_QUALITY_CUTOFF_DESC"], ( select( 5, ArkInventory.GetItemQualityColor( ArkInventory.db.option.action.delete.raritycutoff ) ) ), _G[string.format( "ITEM_QUALITY%d_DESC", ArkInventory.db.option.action.delete.raritycutoff or ArkInventory.ENUM.ITEM.QUALITY.POOR )] )
									end,
									type = "select",
									disabled = function( )
										return ArkInventory.Action.Delete.data.conflict or not ArkInventory.db.option.action.delete.enable
									end,
									values = function( )
										local t = { }
										for z in pairs( ITEM_QUALITY_COLORS ) do
											if z >= ArkInventory.ENUM.ITEM.QUALITY.POOR then
												t[tostring( z )] = string.format( "%s%s", select( 5, ArkInventory.GetItemQualityColor( z ) ), _G[string.format( "ITEM_QUALITY%d_DESC", z )] )
											end
										end
										return t
									end,
									get = function( info )
										return tostring( ArkInventory.db.option.action.delete.raritycutoff or ArkInventory.ENUM.ITEM.QUALITY.POOR )
									end,
									set = function( info, v )
										ArkInventory.db.option.action.delete.raritycutoff = tonumber( v )
									end,
								},
								list = {
									order = 800,
									name = ArkInventory.Localise["LIST"],
									desc = ArkInventory.Localise["CONFIG_ACTION_DELETE_LIST_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Delete.data.conflict or not ArkInventory.db.option.action.delete.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.delete.list
									end,
									set = function( info, v )
										ArkInventory.db.option.action.delete.list = not ArkInventory.db.option.action.delete.list
									end,
								},
							},
						},
						scrap = {
							order = 1000,
							name = ArkInventory.Action.Scrap.data.name,
							type = "group",
							--hidden = true,
							args = {
								conflict = {
									order = 1,
									name = string.format( ArkInventory.Localise["CONFIG_ACTION_CONFLICT"], ArkInventory.Action.Scrap.data.name, ArkInventory.Action.Scrap.data.addon or ArkInventory.Localise["UNKNOWN"] ),
									type = "description",
									fontSize = "medium",
									width = "full",
									fontSize = "medium",
									hidden = function( )
										return not ArkInventory.Action.Scrap.data.conflict
									end,
								},
								enable = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = string.format( ArkInventory.Localise["CONFIG_ACTION_ENABLE_DESC"], ArkInventory.Action.Scrap.data.name ),
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Scrap.data.conflict
									end,
									get = function( info )
										return ArkInventory.db.option.action.scrap.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.action.scrap.enable = not ArkInventory.db.option.action.scrap.enable
									end,
								},
								automatic = {
									order = 110,
									name = ArkInventory.Localise["AUTOMATIC"],
									desc = ArkInventory.Localise["CONFIG_ACTION_SCRAP_AUTOMATIC_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Scrap.data.conflict or not ArkInventory.db.option.action.scrap.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.scrap.auto
									end,
									set = function( info, v )
										ArkInventory.db.option.action.scrap.auto = not ArkInventory.db.option.action.scrap.auto
									end,
								},
								manual = {
									order = 120,
									name = ArkInventory.Localise["MANUAL"],
									desc = ArkInventory.Localise["CONFIG_ACTION_SCRAP_MANUAL_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Scrap.data.conflict or not ArkInventory.db.option.action.scrap.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.scrap.manual
									end,
									set = function( info, v )
										ArkInventory.db.option.action.scrap.manual = not ArkInventory.db.option.action.scrap.manual
									end,
								},
								testmode = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_ACTION_TESTING"],
									desc = ArkInventory.Localise["CONFIG_ACTION_SCRAP_TEST_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Scrap.data.conflict or not ArkInventory.db.option.action.scrap.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.scrap.test
									end,
									set = function( info, v )
										ArkInventory.db.option.action.scrap.test = not ArkInventory.db.option.action.scrap.test
									end,
								},
								raritycutoff = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_QUALITY_CUTOFF"],
									desc = function( info )
										return string.format( ArkInventory.Localise["CONFIG_ACTION_SCRAP_QUALITY_CUTOFF_DESC"], ( select( 5, ArkInventory.GetItemQualityColor( ArkInventory.db.option.action.scrap.raritycutoff ) ) ), _G[string.format( "ITEM_QUALITY%d_DESC", ArkInventory.db.option.action.scrap.raritycutoff or ArkInventory.ENUM.ITEM.QUALITY.POOR )] )
									end,
									type = "select",
									disabled = function( )
										return ArkInventory.Action.Scrap.data.conflict or not ArkInventory.db.option.action.scrap.enable
									end,
									values = function( )
										local t = { }
										for z in pairs( ITEM_QUALITY_COLORS ) do
											if z >= ArkInventory.ENUM.ITEM.QUALITY.POOR then
												t[tostring( z )] = string.format( "%s%s", select( 5, ArkInventory.GetItemQualityColor( z ) ), _G[string.format( "ITEM_QUALITY%d_DESC", z )] )
											end
										end
										return t
									end,
									get = function( info )
										return tostring( ArkInventory.db.option.action.scrap.raritycutoff or ArkInventory.ENUM.ITEM.QUALITY.POOR )
									end,
									set = function( info, v )
										ArkInventory.db.option.action.scrap.raritycutoff = tonumber( v )
										ArkInventory.ItemCacheClear( )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								list = {
									order = 800,
									name = ArkInventory.Localise["LIST"],
									desc = ArkInventory.Localise["CONFIG_ACTION_SCRAP_LIST_DESC"],
									type = "toggle",
									disabled = function( )
										return ArkInventory.Action.Scrap.data.conflict or not ArkInventory.db.option.action.scrap.enable
									end,
									get = function( info )
										return ArkInventory.db.option.action.scrap.list
									end,
									set = function( info, v )
										ArkInventory.db.option.action.scrap.list = not ArkInventory.db.option.action.scrap.list
									end,
								},
								timeout = {
									order = 900,
									name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD"],
									desc = ArkInventory.Localise["CONFIG_ACTION_SCRAP_TIMER_DESC"],
									type = "range",
									min = 25,
									max = 2500,
									step = 5,
									disabled = function( )
										return ArkInventory.Action.Scrap.data.conflict or not ArkInventory.db.option.action.scrap.enable
									end,
									get = function( info )
										return ArkInventory.db.option.thread.timeout.scrap
									end,
									set = function( info, v )
										local v = math.floor( v / 5 ) * 5
										if v < 25 then v = 25 end
										if v > 2500 then v = 2500 end
										ArkInventory.db.option.thread.timeout.scrap = v
									end,
								},
							},
						},
					},
				},
				menu = {
					order = 1000,
					name = ArkInventory.Localise["MENU"],
					type = "group",
					args = {
						height = {
							order = 100,
							name = ArkInventory.Localise["FONT_SIZE"],
							type = "range",
							min = ArkInventory.Const.Font.MinHeight,
							max = ArkInventory.Const.Font.MaxHeight,
							step = 1,
							get = function( info )
								return ArkInventory.db.option.menu.font.height
							end,
							set = function( info, v )
								local v = math.floor( v )
								if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
								if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
								if ArkInventory.db.option.menu.font.height ~= v then
									ArkInventory.db.option.menu.font.height = v
									ArkInventory.MediaMenuFontSet( nil, v )
								end
							end,
						},
					},
				},
				bonusid = {
					order = 1000,
					name = ArkInventory.Localise["CONFIG_GENERAL_BONUSID"],
					type = "group",
					args = {
						count = {
							order = 100,
							name = ArkInventory.Localise["CONFIG_GENERAL_BONUSID_COUNT"],
							type = "group",
							inline = true,
							args = {
								count = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_GENERAL_BONUSID_SUFFIX"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_BONUSID_SUFFIX_COUNT_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.bonusid.count.suffix
									end,
									set = function( info, v )
										if v ~= ArkInventory.db.option.bonusid.count.suffix then
											ArkInventory.db.option.bonusid.count.suffix = not ArkInventory.db.option.bonusid.count.suffix
											ArkInventory.ObjectIDCountClear( )
											ArkInventory.ObjectCacheCountClear( )
										end
									end,
								},
							},
						},
						search = {
							order = 100,
							name = ArkInventory.Localise["CONFIG_GENERAL_BONUSID_SEARCH"],
							type = "group",
							inline = true,
							args = {
								suffix = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_GENERAL_BONUSID_SUFFIX"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_BONUSID_SUFFIX_SEARCH_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.bonusid.search.suffix
									end,
									set = function( info, v )
										if v ~= ArkInventory.db.option.bonusid.search.suffix then
											ArkInventory.db.option.bonusid.search.suffix = not ArkInventory.db.option.bonusid.search.suffix
											ArkInventory.ObjectCacheSearchClear( )
										end
									end,
								},
								corruption = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_GENERAL_BONUSID_CORRUPTION"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_BONUSID_CORRUPTION_SEARCH_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.bonusid.search.corruption
									end,
									set = function( info, v )
										if v ~= ArkInventory.db.option.bonusid.search.corruption then
											ArkInventory.db.option.bonusid.search.corruption = not ArkInventory.db.option.bonusid.search.corruption
											ArkInventory.ObjectCacheSearchClear( )
										end
									end,
								},
							},
						},
					},
				},
				newitemglow = {
					order = 1000,
					name = ArkInventory.Localise["NEW_ITEM_GLOW"],
					type = "group",
					--inline = true,
					--width = "full",
					args = {
						show = {
							order = 100,
							name = ArkInventory.Localise["ENABLED"],
							type = "toggle",
							get = function( info )
								return ArkInventory.db.option.newitemglow.enable
							end,
							set = function( info, v )
								ArkInventory.db.option.newitemglow.enable = v
							end,
						},
						colour = {
							order = 200,
							name = ArkInventory.Localise["COLOUR"],
							type = "color",
							hasAlpha = true,
							disabled = function( info )
								return not ArkInventory.db.option.newitemglow.enable
							end,
							get = function( info )
								return helperColourGet( ArkInventory.db.option.newitemglow.colour )
							end,
							set = function( info, r, g, b, a )
								helperColourSet( ArkInventory.db.option.newitemglow.colour, r, g, b, a )
							end,
						},
						clearonclose = {
							order = 300,
							name = ArkInventory.Localise["CLEAR"],
							desc = ArkInventory.Localise["NEW_ITEM_GLOW_CLEAR_DESC"],
							type = "toggle",
							disabled = function( info )
								return not ArkInventory.db.option.newitemglow.enable
							end,
							get = function( info )
								return ArkInventory.db.option.newitemglow.clearonclose
							end,
							set = function( info, v )
								ArkInventory.db.option.newitemglow.clearonclose = v
							end,
						},
					},
				},
				transmog = {
					order = 1000,
					name = ArkInventory.Localise["TRANSMOGRIFY"],
					disabled = not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.CLASSIC ), -- FIX ME
					type = "group",
					args = {
						enable = {
							order = 10,
							name = ArkInventory.Localise["ENABLED"],
							desc = ArkInventory.Localise["CONFIG_GENERAL_TRANSMOG_SHOW_DESC"],
							type = "toggle",
							get = function( info )
								return ArkInventory.db.option.transmog.enable
							end,
							set = function( info, v )
								if ArkInventory.db.option.transmog.enable ~= v then
									ArkInventory.db.option.transmog.enable = v
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
								end
							end,
						},
						secondary = {
							order = 20,
							name = ArkInventory.Localise["CONFIG_GENERAL_TRANSMOG_SECONDARY"],
							desc = ArkInventory.Localise["CONFIG_GENERAL_TRANSMOG_SECONDARY_DESC"],
							type = "toggle",
							disabled = function( info )
								return not ArkInventory.db.option.transmog.enable
							end,
							get = function( info )
								return ArkInventory.db.option.transmog.secondary
							end,
							set = function( info, v )
								ArkInventory.db.option.transmog.secondary = v
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end,
						},
						anchor = {
							order = 30,
							name = ArkInventory.Localise["ANCHOR"],
							desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], ArkInventory.Localise["CONFIG_GENERAL_TRANSMOG"], "" ),
							type = "select",
							values = anchorpoints5,
							disabled = function( info )
								return not ArkInventory.db.option.transmog.enable
							end,
							get = function( info )
								return ArkInventory.db.option.transmog.anchor
							end,
							set = function( info, v )
								if ArkInventory.db.option.transmog.anchor ~= v then
									ArkInventory.db.option.transmog.anchor = v
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
								end
							end,
						},
						
						line1 = {
							order = 100,
							name = "",
							type = "header",
--							hidden = function( info )
--								return not ArkInventory.db.option.transmog.enable
--							end,
						},
						clm_icon = {
							order = 110,
							name = ArkInventory.Localise["CONFIG_GENERAL_TRANSMOG_CLM"],
							desc = ArkInventory.Localise["CONFIG_GENERAL_TRANSMOG_CLM_DESC"],
							type = "select",
							width = "double",
							dialogControl = "LSM30_Background",
							values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Const.Transmog.SharedMediaType ),
--							hidden = function( info )
--								return not ArkInventory.db.option.transmog.enable
--							end,
							disabled = function( info )
								return not ArkInventory.db.option.transmog.enable
							end,
							get = function( info )
								return ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnMyself].style or ArkInventory.Const.Transmog.StyleDefault
							end,
							set = function( info, v )
								if ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnMyself].style ~= v then
									ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnMyself].style = v
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
								end
							end,
						},
						clm_colour = {
							order = 120,
							name = ArkInventory.Localise["COLOUR"],
							type = "color",
							hasAlpha = true,
--							hidden = function( info )
--								return not ArkInventory.db.option.transmog.enable
--							end,
							disabled = function( info )
								return not ArkInventory.db.option.transmog.enable
							end,
							get = function( info )
								return helperColourGet( ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnMyself].colour )
							end,
							set = function( info, r, g, b, a )
								helperColourSet( ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnMyself].colour, r, g, b, a )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end,
						},
						
						clms_icon = {
							order = 210,
							name = ArkInventory.Localise["CONFIG_GENERAL_TRANSMOG_CLMS"],
							desc = ArkInventory.Localise["CONFIG_GENERAL_TRANSMOG_CLMS_DESC"],
							type = "select",
							width = "double",
							dialogControl = "LSM30_Background",
							values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Const.Transmog.SharedMediaType ),
---							hidden = function( info )
--								return not ArkInventory.db.option.transmog.enable or not ArkInventory.db.option.transmog.secondary
--							end,
							disabled = function( info )
								return not ArkInventory.db.option.transmog.enable or not ArkInventory.db.option.transmog.secondary
							end,
							get = function( info )
								return ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnMyselfSecondary].style or ArkInventory.Const.Transmog.StyleDefault
							end,
							set = function( info, v )
								if ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnMyselfSecondary].style ~= v then
									ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnMyselfSecondary].style = v
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
								end
							end,
						},
						clms_colour = {
							order = 220,
							name = ArkInventory.Localise["COLOUR"],
							type = "color",
							hasAlpha = true,
--							hidden = function( info )
--								return not ArkInventory.db.option.transmog.enable or not ArkInventory.db.option.transmog.secondary
--							end,
							disabled = function( info )
								return not ArkInventory.db.option.transmog.enable or not ArkInventory.db.option.transmog.secondary
							end,
							get = function( info )
								return helperColourGet( ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnMyselfSecondary].colour )
							end,
							set = function( info, r, g, b, a )
								helperColourSet( ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnMyselfSecondary].colour, r, g, b, a )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end,
						},
						
						line2 = {
							order = 300,
							name = "",
							type = "header",
--							hidden = function( info )
--								return not ArkInventory.db.option.transmog.enable
--							end,
						},
						
						clo_icon = {
							order = 310,
							name = ArkInventory.Localise["CONFIG_GENERAL_TRANSMOG_CLO"],
							desc = ArkInventory.Localise["CONFIG_GENERAL_TRANSMOG_CLO_DESC"],
							type = "select",
							width = "double",
							dialogControl = "LSM30_Background",
							values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Const.Transmog.SharedMediaType ),
--							hidden = function( info )
--								return not ArkInventory.db.option.transmog.enable
--							end,
							disabled = function( info )
								return not ArkInventory.db.option.transmog.enable
							end,
							get = function( info )
								return ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnOther].style or ArkInventory.Const.Transmog.StyleDefault
							end,
							set = function( info, v )
								if ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnOther].style ~= v then
									ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnOther].style = v
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
								end
							end,
						},
						clo_colour = {
							order = 320,
							name = ArkInventory.Localise["COLOUR"],
							type = "color",
							hasAlpha = true,
--							hidden = function( info )
--								return not ArkInventory.db.option.transmog.enable
--							end,
							disabled = function( info )
								return not ArkInventory.db.option.transmog.enable
							end,
							get = function( info )
								return helperColourGet( ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnOther].colour )
							end,
							set = function( info, r, g, b, a )
								helperColourSet( ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnOther].colour, r, g, b, a )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end,
						},
						
						clos_icon = {
							order = 410,
							name = ArkInventory.Localise["CONFIG_GENERAL_TRANSMOG_CLOS"],
							desc = ArkInventory.Localise["CONFIG_GENERAL_TRANSMOG_CLOS_DESC"],
							type = "select",
							width = "double",
							dialogControl = "LSM30_Background",
							values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Const.Transmog.SharedMediaType ),
--							hidden = function( info )
--								return not ArkInventory.db.option.transmog.enable or not ArkInventory.db.option.transmog.secondary
--							end,
							disabled = function( info )
								return not ArkInventory.db.option.transmog.enable or not ArkInventory.db.option.transmog.secondary
							end,
							get = function( info )
								return ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnOtherSecondary].style or ArkInventory.Const.Transmog.StyleDefault
							end,
							set = function( info, v )
								if ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnOtherSecondary].style ~= v then
									ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnOtherSecondary].style = v
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
								end
							end,
						},
						clos_colour = {
							order = 420,
							name = ArkInventory.Localise["COLOUR"],
							type = "color",
							hasAlpha = true,
--							hidden = function( info )
--								return not ArkInventory.db.option.transmog.enable or not ArkInventory.db.option.transmog.secondary
--							end,
							disabled = function( info )
								return not ArkInventory.db.option.transmog.enable or not ArkInventory.db.option.transmog.secondary
							end,
							get = function( info )
								return helperColourGet( ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnOtherSecondary].colour )
							end,
							set = function( info, r, g, b, a )
								helperColourSet( ArkInventory.db.option.transmog.icon[ArkInventory.Const.Transmog.State.CanLearnOtherSecondary].colour, r, g, b, a )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
							end,
						},
					},
				},
				conflict = {
					order = 1000,
					name = ArkInventory.Localise["CONFIG_GENERAL_CONFLICT"],
					type = "group",
					childGroups = "tab",
					hidden = true,
					--inline = true,
					args = {
						tsm = {
							order = 1000,
							name = "TradeSkillMaster",
							type = "group",
							args = {
								mailbox = {
									order = 100,
									name = ArkInventory.Localise["MAILBOX"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_CONFLICT_TSM_MAILBOX_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.conflict.tsm.mailbox
									end,
									set = function( info, v )
										ArkInventory.db.option.conflict.tsm.mailbox = not ArkInventory.db.option.conflict.tsm.mailbox
									end,
								},
								merchant = {
									order = 100,
									name = ArkInventory.Localise["MERCHANT"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_CONFLICT_TSM_MERCHANT_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.conflict.tsm.merchant
									end,
									set = function( info, v )
										ArkInventory.db.option.conflict.tsm.merchant = not ArkInventory.db.option.conflict.tsm.merchant
									end,
								},
							},
						},
					},
				},
			},
		},
		
		settings = {
			cmdHidden = true,
			order = 2000,
			name = ArkInventory.Localise["SETTINGS"],
			type = "group",
			childGroups = "tab",
			args = {
				design = {
					cmdHidden = true,
					order = 100,
					name = string.format( "%s (%s / %s)", ArkInventory.Localise["CONFIG_DESIGN_PLURAL"], ArkInventory.Localise["CONFIG_STYLE_PLURAL"], ArkInventory.Localise["CONFIG_LAYOUT_PLURAL"] ),
					type = "group",
					args = { },
				},
				categoryset = {
					cmdHidden = true,
					order = 200,
					name = ArkInventory.Localise["CONFIG_CATEGORY_SET_PLURAL"],
					type = "group",
					args = { },
				},
				sortmethod = {
					cmdHidden = true,
					order = 300,
					name = ArkInventory.Localise["CONFIG_SORTING_METHOD_PLURAL"],
					type = "group",
					args = { },
				},
			},
		},
		account = {
			cmdHidden = true,
			order = 5000,
			name = ArkInventory.Localise["ACCOUNTS"],
			type = "group",
			args = { },
		},
		advanced = {
			cmdHidden = true,
			order = 4000,
			name = ArkInventory.Localise["ADVANCED"],
			type = "group",
			childGroups = "tab",
			args = {
				ldb = {
					cmdHidden = true,
					order = 1000,
					name = ArkInventory.Localise["LDB"],
					type = "group",
					childGroups = "tab",
					args = {
						bags = {
							order = 100,
							type = "group",
							name = "Bags",
							args = {
								colour = {
									order = 100,
									type = "toggle",
									name = ArkInventory.Localise["LDB_BAGS_COLOUR_USE"],
									desc = ArkInventory.Localise["LDB_BAGS_COLOUR_USE_DESC"],
									get = function( info )
										return config.me.player.data.ldb.bags.colour
									end,
									set = function( info, v )
										config.me.player.data.ldb.bags.colour = v
										ArkInventory.LDB.Bags:Update( )
									end,
								},
								full = {
									order = 200,
									type = "toggle",
									name = ArkInventory.Localise["LDB_BAGS_STYLE"],
									desc = ArkInventory.Localise["LDB_BAGS_STYLE_DESC"],
									get = function( info )
										return config.me.player.data.ldb.bags.full
									end,
									set = function( info, v )
										config.me.player.data.ldb.bags.full = v
										ArkInventory.LDB.Bags:Update( )
									end,
								},
								includetype = {
									order = 300,
									type = "toggle",
									name = ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE"],
									desc = ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE_DESC"],
									get = function( info )
										return config.me.player.data.ldb.bags.includetype
									end,
									set = function( info, v )
										config.me.player.data.ldb.bags.includetype = v
										ArkInventory.LDB.Bags:Update( )
									end,
								},
							},
						},
--						money = {
--							order = 100,
--							type = "group",
--							name = "Money",
--							args = { },
--						},
						mounts = {
							order = 100,
							name = ArkInventory.Localise["MOUNTS"],
							type = "group",
							childGroups = "tab",
							disabled = not ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].ClientCheck ),
							args = { }, -- calculated
						},
						pets = {
							order = 100,
							type = "group",
							name = ArkInventory.Localise["PETS"],
							disabled = not ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].ClientCheck ),
							args = { }, -- calculated
						},
--						currencies = {
--							order = 400,
--							type = "group",
--							name = string.format( "%s: %s", ArkInventory.Localise["TRACKING"], ArkInventory.Localise["CURRENCY"] ),
--							disabled = not ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Currency].ClientCheck ),
--							args = { },
--						},
						items = {
							order = 400,
							type = "group",
							name = string.format( "%s: %s", ArkInventory.Localise["TRACKING"], ArkInventory.Localise["ITEMS"] ),
							args = {
								showzero = {
									order = 100,
									type = "toggle",
									name = ArkInventory.Localise["LDB_ITEMS_SHOWZERO"],
									desc = ArkInventory.Localise["LDB_ITEMS_SHOWZERO_DESC"],
									get = function( info )
										return ArkInventory.db.option.tracking.item.showzero
									end,
									set = function( info, v )
										ArkInventory.db.option.tracking.item.showzero = v
										ArkInventory:SendMessage( "EVENT_ARKINV_LDB_ITEM_UPDATE_BUCKET" )
									end,
								},
							},
						},
						reputation = {
							order = 400,
							type = "group",
							name = string.format( "%s: %s", ArkInventory.Localise["TRACKING"], ArkInventory.Localise["REPUTATION"] ),
							disabled = not ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Reputation].ClientCheck ),
							args = {
								style = {
									order = 100,
									type = "select",
									name = ArkInventory.Localise["STYLE"],
									values = function( )
										local t = { [ArkInventory.Const.Reputation.Custom.Default] = ArkInventory.Localise["DEFAULT"], [ArkInventory.Const.Reputation.Custom.Custom] = ArkInventory.Localise["CUSTOM"] }
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.tracking.reputation.custom
									end,
									set = function( info, v )
										ArkInventory.db.option.tracking.reputation.custom = v
										ArkInventory:SendMessage( "EVENT_ARKINV_LDB_REPUTATION_UPDATE_BUCKET" )
									end,
								},
								format_text = {
									order = 310,
									name = ArkInventory.Localise["TEXT"],
									desc = string.format( "%s%s", ArkInventory.Localise["LDB_OBJECT_TEXT_FORMAT_DESC"], ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_REPUTATION_TOKEN_DESC"] ),
									type = "input",
									width = "double",
									disabled = function( )
										return ArkInventory.db.option.tracking.reputation.custom == ArkInventory.Const.Reputation.Custom.Default
									end,
									get = function( info )
										local v = ArkInventory.db.option.tracking.reputation.style.ldb
										if v == "" then
											v = ArkInventory.Const.Reputation.Style.OneLineWithName
										end
										return string.lower( v )
									end,
									set = function( info, v )
										local v = string.trim( v )
										if v == "" then
											v = ArkInventory.Const.Reputation.Style.OneLineWithName
										end
										ArkInventory.db.option.tracking.reputation.style.ldb = string.lower( v )
										ArkInventory:SendMessage( "EVENT_ARKINV_LDB_REPUTATION_UPDATE_BUCKET" )
									end,
								},
								format_tooltip = {
									order = 320,
									name = ArkInventory.Localise["TOOLTIP"],
									desc = string.format( "%s%s", ArkInventory.Localise["LDB_OBJECT_TOOLTIP_FORMAT_DESC"], ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_REPUTATION_TOKEN_DESC"] ),
									type = "input",
									width = "double",
									disabled = function( )
										return ArkInventory.db.option.tracking.reputation.custom == ArkInventory.Const.Reputation.Custom.Default
									end,
									get = function( info )
										local v = ArkInventory.db.option.tracking.reputation.style.tooltip
										if v == "" then
											v = ArkInventory.Const.Reputation.Style.OneLine
										end
										return string.lower( v )
									end,
									set = function( info, v )
										local v = string.trim( v )
										if v == "" then
											v = ArkInventory.Const.Reputation.Style.OneLine
										end
										ArkInventory.db.option.tracking.reputation.style.tooltip = string.lower( v )
										ArkInventory:SendMessage( "EVENT_ARKINV_LDB_REPUTATION_UPDATE_BUCKET" )
									end,
								},
							},
						},
					},
				},
				threads = {
					order = 1000,
					name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD"],
					type = "group",
					--inline = true,
					args = {
						use = {
							order = 100,
							name = ArkInventory.Localise["ENABLED"],
							desc = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_DISABLED_DESC"],
							type = "toggle",
							get = function( info )
								return ArkInventory.Global.Thread.Use
							end,
							set = function( info, v )
								ArkInventory.Global.Thread.Use = v
							end,
						},
						debugged = {
							order = 200,
							name = ArkInventory.Localise["DEBUG"],
							desc = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_DEBUG_DESC"],
							type = "toggle",
							get = function( info )
								return ArkInventory.db.option.thread.debug
							end,
							set = function( info, v )
								ArkInventory.db.option.thread.debug = v
							end,
						},
						timeout_normal = {
							order = 510,
							name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_NORMAL"],
							desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_DESC"], string.lower( ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_NORMAL"] ) ),
							type = "range",
							min = 25,
							max = 250,
							step = 5,
							disabled = function( )
								return true
								--return not ArkInventory.Global.Thread.Use
							end,
							get = function( info )
								return ArkInventory.db.option.thread.timeout.normal
							end,
							set = function( info, v )
								local v = math.floor( v / 5 ) * 5
								if v < 25 then v = 25 end
								if v > 250 then v = 250 end
								ArkInventory.db.option.thread.timeout.normal = v
							end,
						},
						timeout_combat = {
							order = 520,
							name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_COMBAT"],
							desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_DESC"], string.lower( ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_COMBAT"] ) ),
							type = "range",
							min = 25,
							max = 250,
							step = 5,
							disabled = function( )
								return true
								--return not ArkInventory.Global.Thread.Use
							end,
							get = function( info )
								return ArkInventory.db.option.thread.timeout.combat
							end,
							set = function( info, v )
								local v = math.floor( v / 5 ) * 5
								if v < 25 then v = 25 end
								if v > 250 then v = 250 end
								ArkInventory.db.option.thread.timeout.combat = v
							end,
						},
						timeout_tooltip = {
							order = 530,
							name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_TOOLTIP"],
							desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_DESC"], string.lower( ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_TOOLTIP"] ) ),
							type = "range",
							min = 25,
							max = 250,
							step = 5,
							disabled = function( )
								return true
								--return not ArkInventory.Global.Thread.Use
							end,
							get = function( info )
								return ArkInventory.db.option.thread.timeout.tooltip
							end,
							set = function( info, v )
								local v = math.floor( v / 5 ) * 5
								if v < 25 then v = 25 end
								if v > 250 then v = 250 end
								ArkInventory.db.option.thread.timeout.tooltip = v
							end,
						},
						timeout_objectdata = {
							order = 540,
							name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_OBJECTDATA"],
							desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_DESC"], string.lower( ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_THREAD_TIMEOUT_OBJECTDATA"] ) ),
							type = "range",
							min = 25,
							max = 250,
							step = 5,
							disabled = function( )
								return true
								--return not ArkInventory.Global.Thread.Use
							end,
							get = function( info )
								return ArkInventory.db.option.thread.timeout.objectdata
							end,
							set = function( info, v )
								local v = math.floor( v / 5 ) * 5
								if v < 25 then v = 25 end
								if v > 250 then v = 250 end
								ArkInventory.db.option.thread.timeout.objectdata = v
							end,
						},
					},
				},
				updatetimer = {
					cmdHidden = true,
					order = 1000,
					name = ArkInventory.Localise["CONFIG_GENERAL_BUCKET"],
					type = "group",
					childGroups = "tree",
					args = { },
				},
				messages = {
					cmdHidden = true,
					order = 1000,
					name = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES"],
					type = "group",
					childGroups = "tab",
					args = {
						restack = {
							order = 100,
							name = ArkInventory.Localise["RESTACK"],
							type = "group",
							--inline = true,
							args = {
								bag = {
									order = ArkInventory.Const.Location.Bag,
									name = ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Name,
									desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_RESTACK_DESC"], ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Name ),
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.restack[ArkInventory.Const.Location.Bag]
									end,
									set = function( info, v )
										ArkInventory.db.option.message.restack[ArkInventory.Const.Location.Bag] = v
									end,
								},
								bank = {
									order = ArkInventory.Const.Location.Bank,
									name = ArkInventory.Global.Location[ArkInventory.Const.Location.Bank].Name,
									desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_RESTACK_DESC"], ArkInventory.Global.Location[ArkInventory.Const.Location.Bank].Name ),
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.restack[ArkInventory.Const.Location.Bank]
									end,
									set = function( info, v )
										ArkInventory.db.option.message.restack[ArkInventory.Const.Location.Bank] = v
									end,
								},
								vault = {
									order = ArkInventory.Const.Location.Vault,
									name = ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name,
									disabled = not ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].ClientCheck ),
									desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_RESTACK_DESC"], ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name ),
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.restack[ArkInventory.Const.Location.Vault]
									end,
									set = function( info, v )
										ArkInventory.db.option.message.restack[ArkInventory.Const.Location.Vault] = v
									end,
								},
							},
						},
						translation = {
							order = 100,
							name = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_TRANSLATION"],
							type = "group",
							--inline = true,
							args = {
								interim = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_TRANSLATION_INTERIM"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_TRANSLATION_INTERIM_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.translation.interim
									end,
									set = function( info, v )
										ArkInventory.db.option.message.translation.interim = v
									end,
								},
								final = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_TRANSLATION_FINAL"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_TRANSLATION_FINAL_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.translation.final
									end,
									set = function( info, v )
										ArkInventory.db.option.message.translation.final = v
									end,
								},
							},
						},
						battlepet = {
							order = 100,
							name = PET_BATTLE_INFO,
							type = "group",
							--inline = true,
							args = {
								opponent = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_BATTLEPET_OPPONENT"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_BATTLEPET_OPPONENT_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.battlepet.opponent
									end,
									set = function( info, v )
										ArkInventory.db.option.message.battlepet.opponent = v
									end,
								},
							},
						},
						bagunknown = {
							order = 100,
							name = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_BAG_UNKNOWN"],
							type = "group",
							--inline = true,
							args = {
								enabled = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_BAG_UNKNOWN_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.bag.unknown
									end,
									set = function( info, v )
										ArkInventory.db.option.message.bag.unknown = v
									end,
								},
							},
						},
						rules = {
							order = 100,
							name = ArkInventory.Localise["RULES"],
							type = "group",
							args = {
								state = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_RULES_STATE"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_RULES_STATE_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.rules.state
									end,
									set = function( info, v )
										ArkInventory.db.option.message.rules.state = v
									end,
								},
								hooked = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_RULES_HOOKED"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_RULES_HOOKED_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.rules.hooked
									end,
									set = function( info, v )
										ArkInventory.db.option.message.rules.hooked = v
									end,
								},
								registration = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_RULES_REGISTRATION"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_RULES_REGISTRATION_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.rules.registration
									end,
									set = function( info, v )
										ArkInventory.db.option.message.rules.registration = v
									end,
								},
							},
						},
						crossrealm = {
							order = 100,
							name = ArkInventory.Localise["CONFIG_GENERAL_TOOLTIP_CROSSREALM"],
							type = "group",
							args = {
								state = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_CROSSREALM_LOADED"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_CROSSREALM_LOADED_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.realm.loaded
									end,
									set = function( info, v )
										ArkInventory.db.option.message.realm.loaded = v
									end,
								},
							},
						},
						objectcache = {
							order = 100,
							name = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_OBJECTCACHE"],
							type = "group",
							args = {
								state = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_OBJECTCACHE_NOTFOUND"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_MESSAGES_OBJECTCACHE_NOTFOUND_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.message.object.notfound
									end,
									set = function( info, v )
										ArkInventory.db.option.message.object.notfound = v
									end,
								},
							},
						},
					},
				},
				workarounds = {
					order = 1000,
					name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND"],
					type = "group",
					childGroups = "tab",
					--inline = true,
					args = {
						framelevel = {
							order = 100,
							name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_FRAMELEVEL"],
							type = "group",
							--inline = true,
							args = {
								desc = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_FRAMELEVEL_DESC"],
									type = "description",
									fontSize = "medium",
								},
								enabled = {
									order = 200,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.bugfix.framelevel.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.bugfix.framelevel.enable = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
									end,
								},
								alert = {
									order = 300,
									name = ArkInventory.Localise["ALERT"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_FRAMELEVEL_ALERT_DESC"],
									type = "select",
									disabled = function( )
										return not ArkInventory.db.option.bugfix.framelevel.enable
									end,
									values = function( )
										local t = { }
										t[0] = ArkInventory.Localise["DISABLED"]
										t[1] = ArkInventory.Localise["SHORT"]
										t[2] = ArkInventory.Localise["FULL"]
										return t
									end,
									get = function( info )
										return ArkInventory.db.option.bugfix.framelevel.alert or 0
									end,
									set = function( info, v )
										ArkInventory.db.option.bugfix.framelevel.alert = v
									end,
								},
							},
						},
						zerosizebag = {
							order = 100,
							name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_ZEROSIZEBAG"],
							type = "group",
							--inline = true,
							args = {
								desc = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_ZEROSIZEBAG_DESC"],
									type = "description",
									fontSize = "medium",
								},
								enabled = {
									order = 200,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_DESC"],
									type = "toggle",
									disabled = true,
									get = function( info )
										return ArkInventory.db.option.bugfix.zerosizebag.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.bugfix.zerosizebag.enable = v
									end,
								},
								alert = {
									order = 300,
									name = ArkInventory.Localise["ALERT"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_WORKAROUND_ZEROSIZEBAG_ALERT_DESC"],
									type = "toggle",
									disabled = function( )
										return not ArkInventory.db.option.bugfix.zerosizebag.enable
									end,
									get = function( info )
										return ArkInventory.db.option.bugfix.zerosizebag.alert
									end,
									set = function( info, v )
										ArkInventory.db.option.bugfix.zerosizebag.alert = v
									end,
								},
							},
						},
					},
				},
				actions = {
					hidden = not ArkInventory.Global.actions_enabled,
					cmdHidden = true,
					order = 2000,
					name = ArkInventory.Localise["ACTIONS"],
					type = "group",
					childGroups = "tab",
					args = {
						actions = {
							order = 100,
							name = ArkInventory.Localise["ACTIONS"],
							type = "group",
							args = { },
						},
						interface = {
							order = 200,
							name = ArkInventory.Localise["INTERFACE"],
							type = "group",
							hidden = true,
							args = {
								display = {
									order = 100,
									name = ArkInventory.Localise["SHOW"],
									desc = ArkInventory.Localise["ACTIONS"],
									type = "execute",
									func = function( )
										ArkInventory.Frame_Actions_Show( )
									end,
								},
								scale = {
									order = 200,
									name = ArkInventory.Localise["SCALE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_SCALE_DESC"],
									type = "range",
									min = 0.4,
									max = 2,
									step = 0.05,
									isPercent = true,
									get = function( info )
										return ArkInventory.db.option.ui.actions.scale
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.4 then v = 0.4 end
										if v > 2 then v = 2 end
										if ArkInventory.db.option.ui.actions.scale ~= v then
											ArkInventory.db.option.ui.actions.scale = v
											ArkInventoryActions.Frame_Actions_Paint( )
										end
									end,
								},
								strata = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_GENERAL_FRAMESTRATA"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_FRAMESTRATA_DESC"],
									type = "select",
									values = function( )
										local t = {
											[1] = string.upper( ArkInventory.Localise["LOW"] ),
											[2] = string.upper( ArkInventory.Localise["MEDIUM"] ),
											[3] = string.upper( ArkInventory.Localise["HIGH"] ),
										}
										return t
									end,
									get = function( info )
										
										local v = ArkInventory.db.option.ui.actions.strata
										if v == "LOW" then
											return 1
										elseif v == "MEDIUM" then
											return 2
										elseif v == "HIGH" then
											return 3
										end
										
									end,
									set = function( info, v )
										
										local v = v
										if v == 1 then
											v = "LOW"
										elseif v == 2 then
											v = "MEDIUM"
										elseif v == 3 then
											v = "HIGH"
										end
										
										ArkInventory.db.option.ui.actions.strata = v
										ArkInventory.Frame_Actions_Hide( )
										
									end,
								},
								width = {
									order = 400,
									name = ArkInventory.Localise["WIDTH"],
									desc = ArkInventory.Localise["CONFIG_LIST_WIDTH_DESC"],
									type = "range",
									min = 100,
									max = 2000,
									step = 5,
									get = function( info )
										return ArkInventory.db.option.ui.actions.width
									end,
									set = function( info, v )
										local v = math.floor( v / 5 ) * 5
										if v < 100 then v = 100 end
										if v > 2000 then v = 2000 end
										if ArkInventory.db.option.ui.actions.width ~= v then
											ArkInventory.db.option.ui.actions.width = v
											ArkInventoryActions.Frame_Actions_Resize( )
										end
									end,
								},
								rows = {
									order = 500,
									name = ArkInventory.Localise["ROWS"],
									desc = ArkInventory.Localise["CONFIG_LIST_ROWS_DESC"],
									type = "range",
									min = 3,
									max = 20,
									step = 1,
									get = function( info )
										return ArkInventory.db.option.ui.actions.rows
									end,
									set = function( info, v )
										local v = math.floor( v / 1 ) * 1
										if v < 3 then v = 3 end
										if v > 20 then v = 20 end
										if ArkInventory.db.option.ui.actions.rows ~= v then
											ArkInventory.db.option.ui.actions.rows = v
											ArkInventory.Frame_Actions_Hide( )
											ArkInventory.Frame_Actions_Show( )
										end
									end,
								},
								background = {
									order = 1200,
									name = ArkInventory.Localise["BACKGROUND"],
									type = "group",
									inline = true,
									args = {
										style = {
											order = 100,
											name = ArkInventory.Localise["BACKGROUND"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_DESC"],
											type = "select",
											width = "double",
											dialogControl = "LSM30_Background",
											values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND ),
											get = function( info )
												return ArkInventory.db.option.ui.actions.background.style or ArkInventory.Const.Texture.BackgroundDefault
											end,
											set = function( info, v )
												if ArkInventory.db.option.ui.actions.background.style ~= v then
													ArkInventory.db.option.ui.actions.background.style = v
													ArkInventoryActions.Frame_Actions_Paint( )
												end
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["COLOUR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BACKGROUND_COLOUR_DESC"],
											type = "color",
											hasAlpha = true,
											hidden = function( info )
												return ArkInventory.db.option.ui.actions.background.style ~= ArkInventory.Const.Texture.BackgroundDefault
											end,
											get = function( info )
												return helperColourGet( ArkInventory.db.option.ui.actions.background.colour )
											end,
											set = function( info, r, g, b, a )
												helperColourSet( ArkInventory.db.option.ui.actions.background.colour, r, g, b, a )
												ArkInventoryActions.Frame_Actions_Paint( )
											end,
										},
									},
								},
								border = {
									order = 1300,
									name = ArkInventory.Localise["BORDER"],
									type = "group",
									inline = true,
									args = {
										style = {
											order = 100,
											name = ArkInventory.Localise["STYLE"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_DESC"],
											type = "select",
											width = "double",
											dialogControl = "LSM30_Border",
											values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BORDER ),
											get = function( info )
												return ArkInventory.db.option.ui.actions.border.style or ArkInventory.Const.Texture.BorderDefault
											end,
											set = function( info, v )
												if v ~= ArkInventory.db.option.ui.actions.border.style then
													
													ArkInventory.db.option.ui.actions.border.style = v
													
													local sd = ArkInventory.Const.Texture.Border[v] or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault]
													ArkInventory.db.option.ui.actions.border.size = sd.size
													ArkInventory.db.option.ui.actions.border.offset = sd.offsetdefault.window
													ArkInventory.db.option.ui.actions.border.scale = sd.scale
													
													ArkInventoryActions.Frame_Actions_Paint( )
													
												end
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["COLOUR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_COLOUR_DESC"],
											type = "color",
											hidden = function( )
												return ArkInventory.db.option.ui.actions.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											hasAlpha = false,
											get = function( info )
												return helperColourGet( ArkInventory.db.option.ui.actions.border.colour )
											end,
											set = function( info, r, g, b )
												helperColourSet( ArkInventory.db.option.ui.actions.border.colour, r, g, b )
												ArkInventoryActions.Frame_Actions_Paint( )
											end,
										},
										size = {
											order = 300,
											name = ArkInventory.Localise["HEIGHT"],
											type = "input",
											hidden = function( )
												return ArkInventory.db.option.ui.actions.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											get = function( info )
												return string.format( "%i", ArkInventory.db.option.ui.actions.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size )
											end,
											set = function( info, v )
												local v = math.floor( tonumber( v ) or 0 )
												if v < 0 then v = 0 end
												if ArkInventory.db.option.ui.actions.border.size ~= v then
													ArkInventory.db.option.ui.actions.border.size = v
													ArkInventoryActions.Frame_Actions_Paint( )
												end
											end,
										},
										offset = {
											order = 400,
											name = ArkInventory.Localise["OFFSET"],
											type = "range",
											min = -10,
											max = 10,
											step = 1,
											hidden = function( info )
												return ArkInventory.db.option.ui.actions.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											get = function( info )
												return ArkInventory.db.option.ui.actions.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offsetdefault.window
											end,
											set = function( info, v )
												local v = math.floor( v )
												if v < -10 then v = -10 end
												if v > 10 then v = 10 end
												if ArkInventory.db.option.ui.actions.border.offset ~= v then
													ArkInventory.db.option.ui.actions.border.offset = v
													ArkInventoryActions.Frame_Actions_Paint( )
												end
											end,
										},
										scale = {
											order = 500,
											name = ArkInventory.Localise["SCALE"],
											desc = ArkInventory.Localise["CONFIG_BORDER_SCALE_DESC"],
											type = "range",
											min = 0.25,
											max = 4,
											step = 0.05,
											isPercent = true,
											hidden = function( )
												return ArkInventory.db.option.ui.actions.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											get = function( info )
												return ArkInventory.db.option.ui.actions.border.scale or 1
											end,
											set = function( info, v )
												local v = math.floor( v / 0.05 ) * 0.05
												if v < 0.25 then v = 0.25 end
												if v > 4 then v = 4 end
												if ArkInventory.db.option.ui.actions.border.scale ~= v then
													ArkInventory.db.option.ui.actions.border.scale = v
													ArkInventoryActions.Frame_Actions_Paint( )
												end
											end,
										},
									},
								},
							},
						},
					},
				},
				rules = {
					cmdHidden = true,
					order = 2000,
					name = ArkInventory.Localise["RULES"],
					type = "group",
					childGroups = "tab",
					args = {
						rules = {
							order = 100,
							name = ArkInventory.Localise["RULES"],
							type = "group",
							args = { },
						},
						interface = {
							order = 200,
							name = ArkInventory.Localise["INTERFACE"],
							type = "group",
							args = {
								display = {
									order = 100,
									name = ArkInventory.Localise["SHOW"],
									desc = ArkInventory.Localise["RULES"],
									type = "execute",
									width = "half",
									func = function( )
										ArkInventory.Frame_Rules_Show( )
									end,
								},
								scale = {
									order = 200,
									name = ArkInventory.Localise["SCALE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_SCALE_DESC"],
									type = "range",
									min = 0.4,
									max = 2,
									step = 0.05,
									isPercent = true,
									get = function( info )
										return ArkInventory.db.option.ui.rules.scale
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.4 then v = 0.4 end
										if v > 2 then v = 2 end
										if ArkInventory.db.option.ui.rules.scale ~= v then
											ArkInventory.db.option.ui.rules.scale = v
											ArkInventoryRules.Frame_Rules_Paint( )
										end
									end,
								},
								strata = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_GENERAL_FRAMESTRATA"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_FRAMESTRATA_DESC"],
									type = "select",
									values = function( )
										local t = {
											[1] = string.upper( ArkInventory.Localise["LOW"] ),
											[2] = string.upper( ArkInventory.Localise["MEDIUM"] ),
											[3] = string.upper( ArkInventory.Localise["HIGH"] ),
										}
										return t
									end,
									get = function( info )
										
										local v = ArkInventory.db.option.ui.rules.strata
										if v == "LOW" then
											return 1
										elseif v == "MEDIUM" then
											return 2
										elseif v == "HIGH" then
											return 3
										end
										
									end,
									set = function( info, v )
										
										local v = v
										if v == 1 then
											v = "LOW"
										elseif v == 2 then
											v = "MEDIUM"
										elseif v == 3 then
											v = "HIGH"
										end
										
										ArkInventory.db.option.ui.rules.strata = v
										ArkInventory.Frame_Rules_Hide( )
										
									end,
								},
								width = {
									order = 400,
									name = ArkInventory.Localise["WIDTH"],
									desc = ArkInventory.Localise["CONFIG_LIST_WIDTH_DESC"],
									type = "range",
									min = 100,
									max = 2000,
									step = 5,
									get = function( info )
										return ArkInventory.db.option.ui.rules.width
									end,
									set = function( info, v )
										local v = math.floor( v / 5 ) * 5
										if v < 100 then v = 100 end
										if v > 2000 then v = 2000 end
										if ArkInventory.db.option.ui.rules.width ~= v then
											ArkInventory.db.option.ui.rules.width = v
											ArkInventoryRules.Frame_Rules_Resize( )
										end
									end,
								},
								rows = {
									order = 500,
									name = ArkInventory.Localise["ROWS"],
									desc = ArkInventory.Localise["CONFIG_LIST_ROWS_DESC"],
									type = "range",
									min = 3,
									max = 20,
									step = 1,
									get = function( info )
										return ArkInventory.db.option.ui.rules.rows
									end,
									set = function( info, v )
										local v = math.floor( v / 1 ) * 1
										if v < 3 then v = 3 end
										if v > 20 then v = 20 end
										if ArkInventory.db.option.ui.rules.rows ~= v then
											ArkInventory.db.option.ui.rules.rows = v
											ArkInventory.Frame_Rules_Hide( )
											ArkInventory.Frame_Rules_Show( )
										end
									end,
								},
								background = {
									order = 1200,
									name = ArkInventory.Localise["BACKGROUND"],
									type = "group",
									inline = true,
									args = {
										style = {
											order = 100,
											name = ArkInventory.Localise["BACKGROUND"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_DESC"],
											type = "select",
											width = "double",
											dialogControl = "LSM30_Background",
											values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND ),
											get = function( info )
												return ArkInventory.db.option.ui.rules.background.style or ArkInventory.Const.Texture.BackgroundDefault
											end,
											set = function( info, v )
												if ArkInventory.db.option.ui.rules.background.style ~= v then
													ArkInventory.db.option.ui.rules.background.style = v
													ArkInventoryRules.Frame_Rules_Paint( )
												end
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["COLOUR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BACKGROUND_COLOUR_DESC"],
											type = "color",
											hasAlpha = true,
											hidden = function( info )
												return ArkInventory.db.option.ui.rules.background.style ~= ArkInventory.Const.Texture.BackgroundDefault
											end,
											get = function( info )
												return helperColourGet( ArkInventory.db.option.ui.rules.background.colour )
											end,
											set = function( info, r, g, b, a )
												helperColourSet( ArkInventory.db.option.ui.rules.background.colour, r, g, b, a )
												ArkInventoryRules.Frame_Rules_Paint( )
											end,
										},
									},
								},
								border = {
									order = 1300,
									name = ArkInventory.Localise["BORDER"],
									type = "group",
									inline = true,
									args = {
										style = {
											order = 100,
											name = ArkInventory.Localise["STYLE"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_DESC"],
											type = "select",
											width = "double",
											dialogControl = "LSM30_Border",
											values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BORDER ),
											get = function( info )
												return ArkInventory.db.option.ui.rules.border.style or ArkInventory.Const.Texture.BorderDefault
											end,
											set = function( info, v )
												if v ~= ArkInventory.db.option.ui.rules.border.style then
													
													ArkInventory.db.option.ui.rules.border.style = v
													
													local sd = ArkInventory.Const.Texture.Border[v] or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault]
													ArkInventory.db.option.ui.rules.border.size = sd.size
													ArkInventory.db.option.ui.rules.border.offset = sd.offsetdefault.window
													ArkInventory.db.option.ui.rules.border.scale = sd.scale
													
													ArkInventoryRules.Frame_Rules_Paint( )
													
												end
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["COLOUR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_COLOUR_DESC"],
											type = "color",
											hidden = function( )
												return ArkInventory.db.option.ui.rules.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											hasAlpha = false,
											get = function( info )
												return helperColourGet( ArkInventory.db.option.ui.rules.border.colour )
											end,
											set = function( info, r, g, b )
												helperColourSet( ArkInventory.db.option.ui.rules.border.colour, r, g, b )
												ArkInventoryRules.Frame_Rules_Paint( )
											end,
										},
										size = {
											order = 300,
											name = ArkInventory.Localise["HEIGHT"],
											type = "input",
											hidden = function( )
												return ArkInventory.db.option.ui.rules.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											get = function( info )
												return string.format( "%i", ArkInventory.db.option.ui.rules.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size )
											end,
											set = function( info, v )
												local v = math.floor( tonumber( v ) or 0 )
												if v < 0 then v = 0 end
												if ArkInventory.db.option.ui.rules.border.size ~= v then
													ArkInventory.db.option.ui.rules.border.size = v
													ArkInventoryRules.Frame_Rules_Paint( )
												end
											end,
										},
										offset = {
											order = 400,
											name = ArkInventory.Localise["OFFSET"],
											type = "range",
											min = -10,
											max = 10,
											step = 1,
											hidden = function( info )
												return ArkInventory.db.option.ui.rules.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											get = function( info )
												return ArkInventory.db.option.ui.rules.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offsetdefault.window
											end,
											set = function( info, v )
												local v = math.floor( v )
												if v < -10 then v = -10 end
												if v > 10 then v = 10 end
												if ArkInventory.db.option.ui.rules.border.offset ~= v then
													ArkInventory.db.option.ui.rules.border.offset = v
													ArkInventoryRules.Frame_Rules_Paint( )
												end
											end,
										},
										scale = {
											order = 500,
											name = ArkInventory.Localise["SCALE"],
											desc = ArkInventory.Localise["CONFIG_BORDER_SCALE_DESC"],
											type = "range",
											min = 0.25,
											max = 4,
											step = 0.05,
											isPercent = true,
											hidden = function( )
												return ArkInventory.db.option.ui.rules.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											get = function( info )
												return ArkInventory.db.option.ui.rules.border.scale or 1
											end,
											set = function( info, v )
												local v = math.floor( v / 0.05 ) * 0.05
												if v < 0.25 then v = 0.25 end
												if v > 4 then v = 4 end
												if ArkInventory.db.option.ui.rules.border.scale ~= v then
													ArkInventory.db.option.ui.rules.border.scale = v
													ArkInventoryRules.Frame_Rules_Paint( )
												end
											end,
										},
									},
								},
							},
						},
					},
				},
				search = {
					cmdHidden = true,
					order = 2000,
					name = ArkInventory.Localise["SEARCH"],
					type = "group",
					childGroups = "tab",
					args = {
						interface = {
							order = 200,
							name = ArkInventory.Localise["INTERFACE"],
							type = "group",
							args = {
								display = {
									order = 100,
									name = ArkInventory.Localise["SHOW"],
									desc = ArkInventory.Localise["SEARCH"],
									type = "execute",
									width = "half",
									func = function( )
										ArkInventory.Search.Frame_Show( )
									end,
								},
								scale = {
									order = 200,
									name = ArkInventory.Localise["SCALE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_SCALE_DESC"],
									type = "range",
									min = 0.4,
									max = 2,
									step = 0.05,
									isPercent = true,
									get = function( info )
										return ArkInventory.db.option.ui.search.scale
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.4 then v = 0.4 end
										if v > 2 then v = 2 end
										if ArkInventory.db.option.ui.search.scale ~= v then
											ArkInventory.db.option.ui.search.scale = v
											ArkInventory.Search.Frame_Paint( )
										end
									end,
								},
								background = {
									order = 1200,
									name = ArkInventory.Localise["BACKGROUND"],
									type = "group",
									inline = true,
									args = {
										style = {
											order = 100,
											name = ArkInventory.Localise["STYLE"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_DESC"],
											type = "select",
											width = "double",
											dialogControl = "LSM30_Background",
											values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND ),
											get = function( info )
												return ArkInventory.db.option.ui.search.background.style or ArkInventory.Const.Texture.BackgroundDefault
											end,
											set = function( info, v )
												if ArkInventory.db.option.ui.search.background.style ~= v then
													ArkInventory.db.option.ui.search.background.style = v
													ArkInventory.Search.Frame_Paint( )
												end
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["COLOUR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BACKGROUND_COLOUR_DESC"],
											type = "color",
											hasAlpha = true,
											hidden = function( info )
												return ArkInventory.db.option.ui.search.background.style ~= ArkInventory.Const.Texture.BackgroundDefault
											end,
											get = function( info )
												return helperColourGet( ArkInventory.db.option.ui.search.background.colour )
											end,
											set = function( info, r, g, b, a )
												helperColourSet( ArkInventory.db.option.ui.search.background.colour, r, g, b, a )
												ArkInventory.Search.Frame_Paint( )
											end,
										},
									},
								},
								border = {
									order = 1300,
									name = ArkInventory.Localise["BORDER"],
									type = "group",
									inline = true,
									args = {
										style = {
											order = 100,
											name = ArkInventory.Localise["STYLE"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_DESC"],
											type = "select",
											width = "double",
											dialogControl = "LSM30_Border",
											values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BORDER ),
											get = function( info )
												return ArkInventory.db.option.ui.search.border.style or ArkInventory.Const.Texture.BorderDefault
											end,
											set = function( info, v )
												if ArkInventory.db.option.ui.search.border.style ~= v then
													
													ArkInventory.db.option.ui.search.border.style = v
													
													local sd = ArkInventory.Const.Texture.Border[v] or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault]
													ArkInventory.db.option.ui.search.border.size = sd.size
													ArkInventory.db.option.ui.search.border.offset = sd.offsetdefault.window
													ArkInventory.db.option.ui.search.border.scale = sd.scale
													
													ArkInventory.Search.Frame_Paint( )
													
												end
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["COLOUR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_COLOUR_DESC"],
											type = "color",
											hidden = function( )
												return ArkInventory.db.option.ui.search.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											hasAlpha = false,
											get = function( info )
												return helperColourGet( ArkInventory.db.option.ui.search.border.colour )
											end,
											set = function( info, r, g, b )
												helperColourSet( ArkInventory.db.option.ui.search.border.colour, r, g, b )
												ArkInventory.Search.Frame_Paint( )
											end,
										},
										size = {
											order = 300,
											name = ArkInventory.Localise["HEIGHT"],
											type = "input",
											hidden = function( )
												 return ArkInventory.db.option.ui.search.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											get = function( info )
												return string.format( "%i", ArkInventory.db.option.ui.search.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size )
											end,
											set = function( info, v )
												local v = math.floor( tonumber( v ) or 0 )
												if v < 0 then v = 0 end
												if ArkInventory.db.option.ui.search.border.size ~= v then
													ArkInventory.db.option.ui.search.border.size = v
													ArkInventory.Search.Frame_Paint( )
												end
											end,
										},
										offset = {
											order = 400,
											name = ArkInventory.Localise["OFFSET"],
											type = "range",
											min = -10,
											max = 10,
											step = 1,
											hidden = function( info )
												return ArkInventory.db.option.ui.search.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											get = function( info )
												return ArkInventory.db.option.ui.search.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offsetdefault.window
											end,
											set = function( info, v )
												local v = math.floor( v )
												if v < -10 then v = -10 end
												if v > 10 then v = 10 end
												if ArkInventory.db.option.ui.search.border.offset ~= v then
													ArkInventory.db.option.ui.search.border.offset = v
													ArkInventory.Search.Frame_Paint( )
												end
											end,
										},
										scale = {
											order = 500,
											name = ArkInventory.Localise["SCALE"],
											desc = ArkInventory.Localise["CONFIG_BORDER_SCALE_DESC"],
											type = "range",
											min = 0.25,
											max = 4,
											step = 0.05,
											isPercent = true,
											hidden = function( )
												return ArkInventory.db.option.ui.search.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											get = function( info )
												return ArkInventory.db.option.ui.search.border.scale or 1
											end,
											set = function( info, v )
												local v = math.floor( v / 0.05 ) * 0.05
												if v < 0.25 then v = 0.25 end
												if v > 4 then v = 4 end
												if ArkInventory.db.option.ui.search.border.scale ~= v then
													ArkInventory.db.option.ui.search.border.scale = v
													ArkInventory.Search.Frame_Paint( )
												end
											end,
										},
									},
								},
								strata = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_GENERAL_FRAMESTRATA"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_FRAMESTRATA_DESC"],
									type = "select",
									values = function( )
										local t = {
											[1] = string.upper( ArkInventory.Localise["LOW"] ),
											[2] = string.upper( ArkInventory.Localise["MEDIUM"] ),
											[3] = string.upper( ArkInventory.Localise["HIGH"] ),
										}
										return t
									end,
									get = function( info )
										
										local v = ArkInventory.db.option.ui.search.strata
										if v == "LOW" then
											return 1
										elseif v == "MEDIUM" then
											return 2
										elseif v == "HIGH" then
											return 3
										end
										
									end,
									set = function( info, v )
										
										local v = v
										if v == 1 then
											v = "LOW"
										elseif v == 2 then
											v = "MEDIUM"
										elseif v == 3 then
											v = "HIGH"
										end
										
										ArkInventory.db.option.ui.search.strata = v
										ArkInventory.Search.Frame_Hide( )
										
									end,
								},
							},
						},
					},
				},
				debug = {
					cmdHidden = true,
					order = 3000,
					name = ArkInventory.Localise["DEBUG"],
					type = "group",
					childGroups = "tab",
					args = {
						interface = {
							order = 200,
							name = ArkInventory.Localise["INTERFACE"],
							type = "group",
							args = {
								enable = {
									order = 10,
									name = ArkInventory.Localise["ENABLE"],
									type = "toggle",
									get = function( )
										return ArkInventory.db.option.ui.debug.enable
									end,
									set = function( info, v )
										ArkInventory.db.option.ui.debug.enable = v
									end,
								},
								display = {
									order = 100,
									name = ArkInventory.Localise["SHOW"],
									desc = ArkInventory.Localise["DEBUG"],
									type = "execute",
									width = "half",
									func = function( )
										ArkInventory.Debug.Frame_Show( )
									end,
								},
								scale = {
									order = 200,
									name = ArkInventory.Localise["SCALE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_SCALE_DESC"],
									type = "range",
									min = 0.4,
									max = 2,
									step = 0.05,
									isPercent = true,
									get = function( info )
										return ArkInventory.db.option.ui.debug.scale
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.4 then v = 0.4 end
										if v > 2 then v = 2 end
										if ArkInventory.db.option.ui.debug.scale ~= v then
											ArkInventory.db.option.ui.debug.scale = v
											ArkInventory.Debug.Frame_Paint( )
										end
									end,
								},
								background = {
									order = 1200,
									name = ArkInventory.Localise["BACKGROUND"],
									type = "group",
									inline = true,
									args = {
										style = {
											order = 100,
											name = ArkInventory.Localise["STYLE"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_DESC"],
											type = "select",
											width = "double",
											dialogControl = "LSM30_Background",
											values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND ),
											get = function( info )
												return ArkInventory.db.option.ui.debug.background.style or ArkInventory.Const.Texture.BackgroundDefault
											end,
											set = function( info, v )
												if ArkInventory.db.option.ui.debug.background.style ~= v then
													ArkInventory.db.option.ui.debug.background.style = v
													ArkInventory.Debug.Frame_Paint( )
												end
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["COLOUR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BACKGROUND_COLOUR_DESC"],
											type = "color",
											hasAlpha = true,
											hidden = function( info )
												return ArkInventory.db.option.ui.debug.background.style ~= ArkInventory.Const.Texture.BackgroundDefault
											end,
											get = function( info )
												return helperColourGet( ArkInventory.db.option.ui.debug.background.colour )
											end,
											set = function( info, r, g, b, a )
												helperColourSet( ArkInventory.db.option.ui.debug.background.colour, r, g, b, a )
												ArkInventory.Debug.Frame_Paint( )
											end,
										},
									},
								},
								border = {
									order = 1300,
									name = ArkInventory.Localise["BORDER"],
									type = "group",
									inline = true,
									args = {
										style = {
											order = 100,
											name = ArkInventory.Localise["STYLE"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_DESC"],
											type = "select",
											width = "double",
											dialogControl = "LSM30_Border",
											values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BORDER ),
											get = function( info )
												return ArkInventory.db.option.ui.debug.border.style or ArkInventory.Const.Texture.BorderDefault
											end,
											set = function( info, v )
												if ArkInventory.db.option.ui.debug.border.style ~= v then
													
													ArkInventory.db.option.ui.debug.border.style = v
													
													local sd = ArkInventory.Const.Texture.Border[v] or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault]
													ArkInventory.db.option.ui.debug.border.size = sd.size
													ArkInventory.db.option.ui.debug.border.offset = sd.offsetdefault.window
													ArkInventory.db.option.ui.debug.border.scale = sd.scale
													
													ArkInventory.Debug.Frame_Paint( )
													
												end
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["COLOUR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_COLOUR_DESC"],
											type = "color",
											hidden = function( )
												return ArkInventory.db.option.ui.debug.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											hasAlpha = false,
											get = function( info )
												return helperColourGet( ArkInventory.db.option.ui.debug.border.colour )
											end,
											set = function( info, r, g, b )
												helperColourSet( ArkInventory.db.option.ui.debug.border.colour, r, g, b )
												ArkInventory.Debug.Frame_Paint( )
											end,
										},
										size = {
											order = 300,
											name = ArkInventory.Localise["HEIGHT"],
											type = "input",
											hidden = function( )
												 return ArkInventory.db.option.ui.debug.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											get = function( info )
												return string.format( "%i", ArkInventory.db.option.ui.debug.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size )
											end,
											set = function( info, v )
												local v = math.floor( tonumber( v ) or 0 )
												if v < 0 then v = 0 end
												if ArkInventory.db.option.ui.debug.border.size ~= v then
													ArkInventory.db.option.ui.debug.border.size = v
													ArkInventory.Debug.Frame_Paint( )
												end
											end,
										},
										offset = {
											order = 400,
											name = ArkInventory.Localise["OFFSET"],
											type = "range",
											min = -10,
											max = 10,
											step = 1,
											hidden = function( info )
												return ArkInventory.db.option.ui.debug.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											get = function( info )
												return ArkInventory.db.option.ui.debug.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offsetdefault.window
											end,
											set = function( info, v )
												local v = math.floor( v )
												if v < -10 then v = -10 end
												if v > 10 then v = 10 end
												if ArkInventory.db.option.ui.debug.border.offset ~= v then
													ArkInventory.db.option.ui.debug.border.offset = v
													ArkInventory.Debug.Frame_Paint( )
												end
											end,
										},
										scale = {
											order = 500,
											name = ArkInventory.Localise["SCALE"],
											desc = ArkInventory.Localise["CONFIG_BORDER_SCALE_DESC"],
											type = "range",
											min = 0.25,
											max = 4,
											step = 0.05,
											isPercent = true,
											hidden = function( )
												return ArkInventory.db.option.ui.debug.border.style == ArkInventory.Const.Texture.BorderNone
											end,
											get = function( info )
												return ArkInventory.db.option.ui.debug.border.scale or 1
											end,
											set = function( info, v )
												local v = math.floor( v / 0.05 ) * 0.05
												if v < 0.25 then v = 0.25 end
												if v > 4 then v = 4 end
												if ArkInventory.db.option.ui.debug.border.scale ~= v then
													ArkInventory.db.option.ui.debug.border.scale = v
													ArkInventory.Debug.Frame_Paint( )
												end
											end,
										},
									},
								},
								strata = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_GENERAL_FRAMESTRATA"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_FRAMESTRATA_DESC"],
									type = "select",
									values = function( )
										local t = {
											[1] = string.upper( ArkInventory.Localise["LOW"] ),
											[2] = string.upper( ArkInventory.Localise["MEDIUM"] ),
											[3] = string.upper( ArkInventory.Localise["HIGH"] ),
										}
										return t
									end,
									get = function( info )
										
										local v = ArkInventory.db.option.ui.debug.strata
										if v == "LOW" then
											return 1
										elseif v == "MEDIUM" then
											return 2
										elseif v == "HIGH" then
											return 3
										end
										
									end,
									set = function( info, v )
										
										local v = v
										if v == 1 then
											v = "LOW"
										elseif v == 2 then
											v = "MEDIUM"
										elseif v == 3 then
											v = "HIGH"
										end
										
										ArkInventory.db.option.ui.debug.strata = v
										ArkInventory.Debug.Frame_Paint( )
										ArkInventory.Debug.Frame_Hide( )
										
									end,
								},
							},
						},
					},
				},
				other = {
					order = 9000,
					name = ArkInventory.Localise["OTHER"],
					type = "group",
					childGroups = "tab",
					args = {
						ui = {
							order = 100,
							name = "UI",
							type = "group",
							childGroups = "tab",
							args = {
								sorting = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_UI_MAIN_LOCATIONSORT"],
									desc = ArkInventory.Localise["CONFIG_UI_MAIN_LOCATIONSORT_DESC"],
									type = "toggle",
									get = function( info )
										return ArkInventory.db.option.ui.sortalpha
									end,
									set = function( info, v )
										ArkInventory.db.option.ui.sortalpha = v
									end,
								},
								retry = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_UI_MAIN_RETRY"],
									desc = ArkInventory.Localise["CONFIG_UI_MAIN_RETRY_DESC"],
									type = "range",
									min = 0,
									max = 10,
									step = 1,
									get = function( info )
										return ArkInventory.db.option.ui.main.retry
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < -10 then v = -10 end
										if v > 10 then v = 10 end
										ArkInventory.db.option.ui.main.retry = v
									end,
								},
							},
						},
					},
				},
			},
		},
	}
	
	ArkInventory.ConfigInternalSortMethod( )
	
	ArkInventory.ConfigInternalDesign( )
	
	ArkInventory.ConfigInternalAccount( )
	
	ArkInventory.ConfigInternalProfile( )
	
	if not path.args.advanced.args.ldb.args.mounts.disabled then
		ArkInventory.ConfigInternalLDBMounts( )
	end
	
	if not path.args.advanced.args.ldb.args.pets.disabled then
		ArkInventory.ConfigInternalLDBPets( path.args.advanced.args.ldb.args.pets.args )
	end
	
	ArkInventory.ConfigInternalCategoryRule( )
	ArkInventory.ConfigInternalCategoryAction( )
	ArkInventory.ConfigInternalUpdateTimer( )
	
end

function ArkInventory.ConfigInternalSortMethod( )

	local path = ArkInventory.Config.Internal.args.settings.args.sortmethod
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_DESC"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] ),
			type = "input",
			width = "double",
			disabled = config.sortmethod.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			get = function( )
				return ""
			end,
			set = function( info, v )
				
				local v = string.trim( v )
				
				if string.match( v, ItemStringPattern ) then
					return
				end
				
				ArkInventory.ConfigInternalSortMethodAdd( v )
				
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SORTBY.NAME] = ArkInventory.Localise["NAME"], [ArkInventory.ENUM.LIST.SORTBY.NUMBER] = ArkInventory.Localise["NUMBER"] }
				return t
			end,
			get = function( info )
				return config.sortmethod.sort
			end,
			set = function( info, v )
				config.sortmethod.sort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SHOW.ACTIVE] = ArkInventory.Localise["ACTIVE"], [ArkInventory.ENUM.LIST.SHOW.DELETED] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return config.sortmethod.show
			end,
			set = function( info, v )
				config.sortmethod.show = v
				ArkInventory.ConfigInternalSortMethod( )
			end,
		},
	}
	
	ArkInventory.ConfigInternalSortMethodData( path.args )
	
end

function ArkInventory.ConfigInternalSortMethodData( path )
	
	local args3 = {
		enabled = {
			order = 100,
			name = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				local checked = data.order[p].active
				
				local n = ArkInventory.Localise[string.upper( string.format( "CONFIG_SORTING_INCLUDE_%s", key ) )]
				if checked then
					n = string.format( "%s%s%s", GREEN_FONT_COLOR_CODE, n, FONT_COLOR_CODE_CLOSE )
				else
					n = string.format( "%s%s%s", RED_FONT_COLOR_CODE, n, FONT_COLOR_CODE_CLOSE )
				end
				
				return n
			end,
			desc = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				local checked = data.order[p].active
				
				local n = ArkInventory.Localise[string.upper( string.format( "CONFIG_SORTING_INCLUDE_%s_DESC", key ) )]
				if not checked then
					n = string.format( "%s%s%s%s%s", n, "\n\n", RED_FONT_COLOR_CODE, ArkInventory.Localise["CONFIG_SORTING_NOT_INCLUDED"], FONT_COLOR_CODE_CLOSE )
				end
				
				return n
			end,
			type = "toggle",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local data = ArkInventory.ConfigInternalSortMethodGet( id )
				return data.system
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				return data.order[p].active
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				
				if data.order[p].active ~= v then
					data.order[p].active = v
					ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
				end
			end,
		},
		move_up = {
			order = 20,
			name = ArkInventory.Localise["CONFIG_SORTING_MOVE_UP"],
			desc = function( info )
				local key = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_SORTING_MOVE_UP_DESC"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.Localise[string.upper( string.format( "CONFIG_SORTING_INCLUDE_%s", key ) )], FONT_COLOR_CODE_CLOSE ) )
			end,
			type = "execute",
			width = "half",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				local checked = data.order[p].active
				
				return p == 1 or data.system or not checked
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodMoveUp( id, key )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
			end,
		},
		move_down = {
			order = 30,
			name = ArkInventory.Localise["CONFIG_SORTING_MOVE_DOWN"],
			desc = function( info )
				local key = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_SORTING_MOVE_DOWN_DESC"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.Localise[string.upper( string.format( "CONFIG_SORTING_INCLUDE_%s", key ) )], FONT_COLOR_CODE_CLOSE ) )
			end,
			type = "execute",
			width = "half",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				local checked = data.order[p].active

				return p == m or data.system or not checked
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodMoveDown( id, key )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
			end,
		},
		reversed = {
			order = 400,
			name = ArkInventory.Localise["CONFIG_SORTING_INCLUDE_NAME_REVERSE"],
			desc = ArkInventory.Localise["CONFIG_SORTING_INCLUDE_NAME_REVERSE_DESC"],
			type = "toggle",
			hidden = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				local checked = data.order[p].active
				
				return key ~= "name" or not checked
			end,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				local checked = data.order[p].active
				
				return data.system or not checked
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				
				return data.order[p].reversed
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				
				if data.order[p].reversed ~= v then
					data.order[p].reversed = v
					ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
				end
			end,
		},
		descending = {
			order = 200,
			name = ArkInventory.Localise["DESCENDING"],
			desc = function( info )
				local key = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_SORTING_DIRECTION_DESC"], string.format( "%s%s%s", LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.Localise[string.upper( string.format( "CONFIG_SORTING_INCLUDE_%s", key ) )], FONT_COLOR_CODE_CLOSE ) )
			end,
			type = "toggle",
			hidden = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				local checked = data.order[p].active
				
				return data.system or not checked
			end,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				local checked = data.order[p].active
				
				return data.system or not checked
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				local checked = data.order[p].active
				
				return data.order[p].descending
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local key = ConfigGetNodeArg( info, #info - 1 )
				local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
				
				if data.order[p].descending ~= v then
					data.order[p].descending = v
					ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
				end
			end,
		},
	}
	
	
	local args2 = { }
	for key, active in pairs( ArkInventory.Const.SortKeys ) do
		if active then
			args2[key] = {
				order = function( info )
					local id = ConfigGetNodeArg( info, #info - 2 )
					local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
					return p
				end,
				name = "", --ArkInventory.Localise[string.upper( string.format( "CONFIG_SORTING_INCLUDE_%s", key ) )],
				type = "group",
				inline = true,
				icon = function( info )
					local id = ConfigGetNodeArg( info, #info - 2 )
					local p, m, data = ArkInventory.ConfigInternalSortMethodGetPosition( id, key )
					
					if data.order[p].active then
						return ArkInventory.Const.Texture.CategoryEnabled
					end
					return ""
				end,
				hidden = false,
				arg = key,
				args = args3,
			}
		end
	end
	
	
	local args1 = {
		action_name = {
			order = 100,
			name = ArkInventory.Localise["NAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_NAME_DESC"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] ),
			type = "input",
			width = "double",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.system or config.sortmethod.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodRename( id, v )
				ArkInventory.ConfigInternalSortMethod( )
			end,
		},
		action_delete = {
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_DESC"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.sortmethod.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodDelete( id )
			end,
		},
		action_restore = {
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_DESC"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.sortmethod.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodRestore( id )
			end,
		},
		action_copy = {
			order = 300,
			name = ArkInventory.Localise["COPY_FROM"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_COPY_DESC"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] ),
			type = "select",
			width = "double",
			hidden = config.sortmethod.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			values = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local t = { }
				for k, v in pairs( ArkInventory.db.option.sort.method.data ) do
					if v.used == "Y" and k ~= id then
						local n = v.name
						if v.system then
							n = string.format( "* %s", n )
						end
						n = string.format( "[%04i] %s", k, n )
						t[k] = n
					end
				end
				return t
			end,
			get = function( )
				return ""
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodCopyFrom( v, id )
				ArkInventory.ConfigRefresh( )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_DESC"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] ),
			type = "execute",
			width = "half",
			hidden = config.sortmethod.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalSortMethodPurge( id )
			end,
		},
		sortkey = {
			order = 5000,
			name = ArkInventory.Localise["CONFIG_SORTING_ORDER"],
			type = "group",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local v = ArkInventory.ConfigInternalSortMethodGet( id )
				return v.system or config.sortmethod.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
			end,
			args = args2,
		},
	}
	
	for id, data in pairs( ArkInventory.db.option.sort.method.data ) do
		
		if ( data.used == "Y" and config.sortmethod.show == ArkInventory.ENUM.LIST.SHOW.ACTIVE ) or ( data.used == "D" and config.sortmethod.show == ArkInventory.ENUM.LIST.SHOW.DELETED ) then
			
			if not data.system then
				
				local n = data.name
				
				if config.sortmethod.sort == ArkInventory.ENUM.LIST.SORTBY.NAME then
					n = string.format( "%s [%04i]", n, id )
				else
					n = string.format( "[%04i] %s", id, n )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					name = n,
					type = "group",
					childGroups = "tab",
					arg = id,
					args = args1,
				}
				
			end
			
		end
		
	end
	
end

function ArkInventory.ConfigInternalCategoryRule( )
	
	local path = ArkInventory.Config.Internal.args.advanced.args.rules.args.rules
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_DESC"], ArkInventory.Localise["CATEGORY_RULE"] ),
			type = "input",
			width = "double",
			disabled = config.category.rule.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			get = function( )
				return ""
			end,
			set = function( info, v )
				
				local v = string.trim( v )
				
				if string.match( v, ItemStringPattern ) then
					return
				end
				
				ArkInventory.Lib.Dewdrop:Close( )
				ArkInventory.ConfigInternalCategoryRuleAdd( v )
				
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SORTBY.NAME] = ArkInventory.Localise["NAME"], [ArkInventory.ENUM.LIST.SORTBY.NUMBER] = ArkInventory.Localise["NUMBER"], [3] = ArkInventory.Localise["ORDER"] }
				return t
			end,
			get = function( info )
				return config.category.rule.sort
			end,
			set = function( info, v )
				config.category.rule.sort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SHOW.ACTIVE] = ArkInventory.Localise["ACTIVE"], [ArkInventory.ENUM.LIST.SHOW.DELETED] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return config.category.rule.show
			end,
			set = function( info, v )
				config.category.rule.show = v
				ArkInventory.ConfigRefresh( )
			end,
		},
	}
	
	ArkInventory.ConfigInternalCategoryRuleData( path.args )
	
	ArkInventory.ConfigInternalCategoryset( )
	
end

function ArkInventory.ConfigInternalCategoryRuleData( path )
	
	local args1 = {
		action_name = { 
			order = 100,
			name = ArkInventory.Localise["NAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_NAME_DESC"], ArkInventory.Localise["CATEGORY_RULE"] ),
			type = "input",
			width = "double",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
				return cat.system or config.category.rule.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
				return cat.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryRuleRename( id, v )
				ArkInventory.ConfigInternalCategoryRule( )
			end,
		},
		action_delete = { 
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_DESC"], ArkInventory.Localise["CATEGORY_RULE"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.category.rule.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryRuleDelete( id )
			end,
		},
		action_restore = { 
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_DESC"], ArkInventory.Localise["CATEGORY_RULE"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.category.rule.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryRuleRestore( id )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_DESC"], ArkInventory.Localise["CATEGORY_RULE"] ),
			type = "execute",
			width = "half",
			hidden = config.category.rule.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryRulePurge( id )
			end,
		},
		
		rule = { 
			order = 1000,
			name = "",
			type = "group",
			inline = true,
			args = {
				order = {
					order = 100,
					name = ArkInventory.Localise["ORDER"],
					type = "range",
					min = 0,
					max = 9999,
					step = 1,
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						return cat.system or config.category.rule.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						return cat.order
					end,
					set = function( info, v )
						local v = math.floor( v )
						if v < 0 then v = 0 end
						if v > 9999 then v = 9999 end
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						if cat.order ~= v then
							cat.order = v
							ArkInventory.ItemCacheClear( )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							ArkInventory.ConfigInternalCategoryRule( )
						end
					end,
				},
				damaged = {
					order = 200,
					name = string.format( "%s%s%s", RED_FONT_COLOR_CODE, ArkInventory.Localise["RULE_DAMAGED_DESC"], FONT_COLOR_CODE_CLOSE ),
					type = "description",
					fontSize = "medium",
					hidden = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						return not cat.damaged
					end,
				},
				formula = {
					order = 300,
					name = ArkInventory.Localise["RULE_FORMULA"],
					type = "input",
					width = "full",
					multiline = 10,
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						return cat.system or config.category.rule.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						return cat.formula
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryRuleGet( id )
						if cat.formula ~= v then
							cat.formula = v
							-- fix me - check formula
							ArkInventory.ItemCacheClear( )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							ArkInventory.ConfigInternalCategoryRule( )
						end
					end,
				},
			},
		},
		
	}
	
	for id, data in pairs( ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Rule].data ) do
		
		if ( data.used == "Y" and config.category.rule.show == ArkInventory.ENUM.LIST.SHOW.ACTIVE ) or ( data.used == "D" and config.category.rule.show == ArkInventory.ENUM.LIST.SHOW.DELETED ) then
			
			if not data.system then
				
				local n = data.name
				
				if config.category.rule.sort == ArkInventory.ENUM.LIST.SORTBY.NAME then
					n = string.format( "%s [%04i] [%04i]", n, id, data.order )
				elseif config.category.rule.sort == ArkInventory.ENUM.LIST.SORTBY.ORDER then
					n = string.format( "[%04i] %s [%04i]", data.order, n, id )
				else
					n = string.format( "[%04i] %s [%04i]", id, n, data.order )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					name = n,
					arg = id,
					icon = function( )
						if data.damaged then
							return ArkInventory.Const.Texture.CategoryDamaged
						end
					end,
					type = "group",
					args = args1,
				}
				
			end
			
		end
		
	end
	
end

function ArkInventory.ConfigInternalCategoryAction( )
	
	local path = ArkInventory.Config.Internal.args.advanced.args.actions.args.actions
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_DESC"], ArkInventory.Localise["ACTION"] ),
			type = "input",
			width = "double",
			disabled = config.category.action.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			get = function( )
				return ""
			end,
			set = function( info, v )
				
				local v = string.trim( v )
				
				if string.match( v, ItemStringPattern ) then
					return
				end
				
				ArkInventory.Lib.Dewdrop:Close( )
				ArkInventory.ConfigInternalCategoryActionAdd( v )
				
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SORTBY.NAME] = ArkInventory.Localise["NAME"], [ArkInventory.ENUM.LIST.SORTBY.NUMBER] = ArkInventory.Localise["NUMBER"], [3] = ArkInventory.Localise["ORDER"] }
				return t
			end,
			get = function( info )
				return config.category.action.sort
			end,
			set = function( info, v )
				config.category.action.sort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SHOW.ACTIVE] = ArkInventory.Localise["ACTIVE"], [ArkInventory.ENUM.LIST.SHOW.DELETED] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return config.category.action.show
			end,
			set = function( info, v )
				config.category.action.show = v
				ArkInventory.ConfigRefresh( )
			end,
		},
	}
	
	ArkInventory.ConfigInternalCategoryActionData( path.args )
	
	ArkInventory.ConfigInternalCategoryset( )
	
end

function ArkInventory.ConfigInternalCategoryActionData( path )
	
	local args1 = {
		action_name = {
			order = 100,
			name = ArkInventory.Localise["NAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_NAME_DESC"], ArkInventory.Localise["ACTION"] ),
			type = "input",
			width = "double",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
				return cat.system or config.category.action.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
				return cat.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryActionRename( id, v )
				ArkInventory.ConfigInternalCategoryAction( )
			end,
		},
		action_delete = { 
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_DESC"], ArkInventory.Localise["ACTION"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.category.action.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryActionDelete( id )
			end,
		},
		action_restore = { 
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_DESC"], ArkInventory.Localise["ACTION"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.category.action.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryActionRestore( id )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_DESC"], ArkInventory.Localise["ACTION"] ),
			type = "execute",
			width = "half",
			hidden = config.category.action.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryActionPurge( id )
			end,
		},
		
		record = { 
			order = 1000,
			name = "",
			type = "group",
			inline = true,
			args = {
				order = {
					order = 100,
					name = ArkInventory.Localise["ORDER"],
					type = "range",
					min = 0,
					max = 9999,
					step = 1,
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						return cat.system or config.category.action.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						return cat.order
					end,
					set = function( info, v )
						local v = math.floor( v )
						if v < 0 then v = 0 end
						if v > 9999 then v = 9999 end
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						if cat.order ~= v then
							cat.order = v
							ArkInventory.ConfigInternalCategoryAction( )
						end
					end,
				},
				act = {
					order = 200,
					name = ArkInventory.Localise["TYPE"],
					type = "select",
					--width = "double",
					values = function( )
						local t = { [ArkInventory.ENUM.ACTION.TYPE.IGNORE] = ArkInventory.Localise["IGNORE"], [ArkInventory.ENUM.ACTION.TYPE.VENDOR] = ArkInventory.Localise["VENDOR"], [ArkInventory.ENUM.ACTION.TYPE.MAIL] = ArkInventory.Localise["MAIL"] }
						return t
					end,
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						return cat.system or config.category.action.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						return cat.act or ArkInventory.ENUM.ACTION.TYPE.IGNORE
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						if cat.act ~= v then
							
							cat.act = v
							cat.src = ArkInventory.Const.Location.Bag
							
							ArkInventory.ConfigInternalCategoryAction( )
							
						end
					end,
				},
				src = {
					order = 300,
					name = ArkInventory.Localise["SOURCE"],
					type = "select",
					--width = "double",
					values = function( )
						local t = { [ArkInventory.Const.Location.Bag] = ArkInventory.Localise["BAG"], [ArkInventory.Const.Location.Bank] = ArkInventory.Localise["BANK"] }
						return t
					end,
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						return cat.system or config.category.action.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
					end,
					hidden = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						return cat.act ~= ArkInventory.ENUM.ACTION.TYPE.MOVE
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						return cat.src
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						if cat.src ~= v then
							cat.src = v
							ArkInventory.ConfigInternalCategoryAction( )
						end
					end,
				},
				rec = {
					order = 300,
					name = ArkInventory.Localise["RECIPIENT"],
					type = "select",
					--width = "double",
					values = function( )
						return ArkInventory.MailRecipients
					end,
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						return cat.system or config.category.action.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
					end,
					hidden = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						return cat.act ~= ArkInventory.ENUM.ACTION.TYPE.MAIL
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						return cat.rec
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 2 )
						local cat = ArkInventory.ConfigInternalCategoryActionGet( id )
						if cat.rec ~= v then
							cat.rec = v
							ArkInventory.ConfigInternalCategoryAction( )
						end
					end,
				},
			},
		},
		
	}
	
	for id, data in pairs( ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Action].data ) do
		
		if ( data.used == "Y" and config.category.action.show == ArkInventory.ENUM.LIST.SHOW.ACTIVE ) or ( data.used == "D" and config.category.action.show == ArkInventory.ENUM.LIST.SHOW.DELETED ) then
			
			if not data.system then
				
				local n = data.name
				
				if config.category.action.sort == ArkInventory.ENUM.LIST.SORTBY.NAME then
					n = string.format( "%s [%04i] [%04i]", n, id, data.order )
				elseif config.category.action.sort == ArkInventory.ENUM.LIST.SORTBY.ORDER then
					n = string.format( "[%04i] %s [%04i]", data.order, n, id )
				else
					n = string.format( "[%04i] %s [%04i]", id, n, data.order )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					name = n,
					arg = id,
					icon = function( )
						if data.damaged then
							return ArkInventory.Const.Texture.CategoryDamaged
						end
					end,
					type = "group",
					args = args1,
				}
				
			end
			
		end
		
	end
	
end

function ArkInventory.ConfigInternalCategoryset( )
	
	local path = ArkInventory.Config.Internal.args.settings.args.categoryset
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] ),
			type = "input",
			width = "double",
			disabled = config.catset.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			get = function( )
				return ""
			end,
			set = function( info, v )
				
				local v = string.trim( v )
				
				if string.match( v, ItemStringPattern ) then
					return
				end
				
				ArkInventory.Lib.Dewdrop:Close( )
				ArkInventory.ConfigInternalCategorysetAdd( v )
				ArkInventory.ConfigRefresh( )
				
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SORTBY.NAME] = ArkInventory.Localise["NAME"], [ArkInventory.ENUM.LIST.SORTBY.NUMBER] = ArkInventory.Localise["NUMBER"] }
				return t
			end,
			get = function( info )
				return config.catset.sort
			end,
			set = function( info, v )
				config.catset.sort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SHOW.ACTIVE] = ArkInventory.Localise["ACTIVE"], [ArkInventory.ENUM.LIST.SHOW.DELETED] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return config.catset.show
			end,
			set = function( info, v )
				config.catset.show = v
				ArkInventory.ConfigRefresh( )
			end,
		},
	}
	
	ArkInventory.ConfigInternalCategorysetData( path.args )
	
end

function ArkInventory.ConfigInternalCategorysetData( path )
	
	local args1 = {
		
		action_name = { 
			order = 100,
			name = ArkInventory.Localise["NAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_NAME_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] ),
			type = "input",
			width = "double",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategorysetGet( id )
				return cat.system or config.catset.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategorysetGet( id )
				return cat.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategorysetRename( id, v )
				ArkInventory.ConfigInternalCategoryset( )
			end,
		},
		action_delete = { 
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.catset.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategorysetGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategorysetDelete( id )
			end,
		},
		action_restore = { 
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.catset.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategorysetGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategorysetRestore( id )
			end,
		},
		action_copy = {
			order = 300,
			name = ArkInventory.Localise["COPY_FROM"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_COPY_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] ),
			type = "select",
			width = "double",
			hidden = config.catset.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			values = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local t = { }
				for k, v in pairs( ArkInventory.db.option.catset.data ) do
					if v.used == "Y" and k ~= id then
						local n = v.name
						if v.system then
							n = string.format( "* %s", n )
						end
						n = string.format( "[%04i] %s", k, n )
						t[k] = n
					end
				end
				return t
			end,
			get = function( )
				return ""
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategorysetCopyFrom( v, id )
				ArkInventory.ConfigRefreshFull( )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] ),
			type = "execute",
			width = "half",
			hidden = config.catset.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategorysetPurge( id )
			end,
		},
		
		track_id = {
			order = 1,
			hidden = true,
			type = "description",
			fontSize = "medium",
			name = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				if id ~= config.catset.selected then
					config.catset.selected = id
					ArkInventory.ConfigInternalCategorysetData( path )
				end
				return ""
			end,
		},
		
		system = {
			order = 2000,
			name = ArkInventory.Localise["CONFIG_CATEGORY_SYSTEM_PLURAL"],
			type = "group",
			childGroups = "tree",
			hidden = true,
			args = { },
		},
		custom = {
			order = 3000,
			name = ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM_PLURAL"],
			type = "group",
			childGroups = "tree",
			args = { },
		},
		rule = {
			order = 4000,
			name = ArkInventory.Localise["RULES"],
			type = "group",
			childGroups = "tree",
			args = { },
		},
		action = {
			order = 4000,
			name = ArkInventory.Localise["ACTIONS"],
			type = "group",
			childGroups = "tree",
			args = { },
		},
		
	}
	
	--ArkInventory.ConfigInternalCategorysetDataSystem( args1.system )
	ArkInventory.ConfigInternalCategoryCustom( args1.custom )
	ArkInventory.ConfigInternalCategorysetDataRule( args1.rule )
	
	for id, data in pairs( ArkInventory.db.option.catset.data ) do
		
		if ( data.used == "Y" and config.catset.show == ArkInventory.ENUM.LIST.SHOW.ACTIVE ) or ( data.used == "D" and config.catset.show == ArkInventory.ENUM.LIST.SHOW.DELETED ) then
			
			if not data.system then
				
				local n = data.name
				
				if config.catset.sort == ArkInventory.ENUM.LIST.SORTBY.NAME then
					n = string.format( "%s [%04i]", n, id )
				else
					n = string.format( "[%04i] %s", id, n )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					name = n,
					type = "group",
					childGroups = "tab",
					arg = id,
					args = args1,
				}
				
			end
			
		end
		
	end
	
end

function ArkInventory.ConfigInternalCategorysetDataSystem( path )
	
	path.args = {
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SORTBY.NAME] = ArkInventory.Localise["NAME"], [ArkInventory.ENUM.LIST.SORTBY.NUMBER] = ArkInventory.Localise["NUMBER"] }
				return t
			end,
			get = function( info )
				return config.catset.system.sort
			end,
			set = function( info, v )
				if config.catset.system.sort ~= v then
					config.catset.system.sort = v
					ArkInventory.ConfigRefresh( )
				end
			end,
		},
	}
	
	ArkInventory.ConfigInternalCategorysetDataSystemData( path.args )
	
end

function ArkInventory.ConfigInternalCategorysetDataSystemData( path )
	
	local args1 = {
		
		enabled = {
			order = 100,
			name = ArkInventory.Localise["ENABLED"],
			type = "toggle",
			disabled = true,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local catset = ConfigGetNodeArg( info, #info - 3 )
				catset = ArkInventory.ConfigInternalCategorysetGet( catset )
				return catset.ca[ArkInventory.Const.Category.Type.System][id].active
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local catset = ConfigGetNodeArg( info, #info - 3 )
				catset = ArkInventory.ConfigInternalCategorysetGet( catset )
				catset.ca[ArkInventory.Const.Category.Type.System][id].active = v
				ArkInventory.ItemCacheClear( )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
			end,
		},
		-- FIX ME - include the category actions
		track_id = {
			order = 1,
			hidden = true,
			type = "description",
			fontSize = "medium",
			name = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				if id ~= config.catset.system.selected then
					config.catset.system.selected = id
					--ArkInventory.ConfigInternalCategorysetDataSystemData( path )
				end
				return ""
			end,
		},
		items = {
			order = 1000,
			name = function( info )
				return ArkInventory.Localise["ITEMS"]
			end,
			type = "group",
			childGroups = "tree",
			hidden = true,
			args = { },
		},

	}
	
	for cat_id, data in pairs( ArkInventory.Global.Category ) do
		
		if data.type_code == "SYSTEM" then
		
			local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat_id )
			local n = data.shortname
			
			if config.catset.system.sort == ArkInventory.ENUM.LIST.SORTBY.NAME then
				n = string.format( "%s [%04i]", n, cat_num )
			else
				n = string.format( "[%04i] %s", cat_num, n )
			end
			
			path[string.format( "%i", cat_num )] = {
				order = 500,
				name = n,
				type = "group",
				childGroups = "tab",
				icon = ArkInventory.Const.Texture.CategoryEnabled,
				arg = cat_num,
				args = args1,
			}
			
		end
		
	end
	
	--ArkInventory.ConfigInternalCategorysetDataSystemDataItem( args1.items )
	
end

function ArkInventory.ConfigInternalCategorysetDataSystemDataItem( path )
	
	ArkInventory.ConfigInternalCategorysetDataSystemDataItemData( path.args )
	
end

function ArkInventory.ConfigInternalCategorysetDataSystemDataItemData( path )
	
	local args1 = {
		
		action_delete = {
			order = 200,
			name = ArkInventory.Localise["REMOVE"],
			type = "execute",
			width = "half",
			func = function( info )
				
				local item = ConfigGetNodeArg( info, #info - 1 )
				local catset = ConfigGetNodeArg( info, #info - 5 )
				
				catset = ArkInventory.ConfigInternalCategorysetGet( catset )
				catset.ca[item].assign = nil
				
				ArkInventory.ItemCacheClear( )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
				
				ArkInventory.ConfigRefresh( )
				
			end,
		},
		
	}
	
	if not config.catset.selected or not config.catset.system.selected then return end
	
	local catset = ArkInventory.ConfigInternalCategorysetGet( config.catset.selected )
	
	local cat_id = ArkInventory.CategoryIdBuild( ArkInventory.Const.Category.Type.System, config.catset.system.selected )
	
	for item, ia in pairs( catset.ia ) do
		
		if ia.assign == cat_id then
			
			local class, id, sb = string.match( item, "^(.+):(.+):(.+)$" )
			id = tonumber( id )
			sb = tonumber( sb )
			
			local h = string.format( "%s:%s", class, id )
			local info = ArkInventory.GetObjectInfo( h )
			
			local n = info.name
			if id == 0 then
				n = string.format( " %s (%s)", ArkInventory.Localise["EMPTY"], ArkInventory.Const.Slot.Data[sb].name )
			end
			
			path[item] = {
				order = 500,
				icon = info.texture,
				name = n,
				arg = item,
				type = "group",
				args = args1,
			}
			
		end
		
	end
	
end

function ArkInventory.ConfigInternalCategoryCustom( path )
	
	path.args = {
		
		action_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM"] ),
			type = "input",
			width = "double",
			disabled = config.category.custom.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			get = function( )
				return ""
			end,
			set = function( info, v )
				
				local v = string.trim( v )
				
				if string.match( v, ItemStringPattern ) then
					return
				end
				
				ArkInventory.Lib.Dewdrop:Close( )
				ArkInventory.ConfigInternalCategoryCustomAdd( v )
				
			end,
		},
		action_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SORTBY.NAME] = ArkInventory.Localise["NAME"], [ArkInventory.ENUM.LIST.SORTBY.NUMBER] = ArkInventory.Localise["NUMBER"] }
				return t
			end,
			get = function( info )
				return config.category.custom.sort.list
			end,
			set = function( info, v )
				config.category.custom.sort.list = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		action_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SHOW.ACTIVE] = ArkInventory.Localise["ACTIVE"], [ArkInventory.ENUM.LIST.SHOW.DELETED] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return config.category.custom.show
			end,
			set = function( info, v )
				config.category.custom.show = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		
	}
	
	ArkInventory.ConfigInternalCategoryCustomList( path.args )
	
end

function ArkInventory.ConfigInternalCategoryCustomList( path )
	
	local args1 = {
		
		track_id = {
			order = 1,
			hidden = true,
			type = "description",
			fontSize = "medium",
			name = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				if id ~= config.category.custom.selected then
					config.category.custom.selected = id
					ArkInventory.ConfigInternalCategoryCustomList( path )
				end
				return ""
			end,
		},
		
		action_name = { 
			order = 100,
			name = ArkInventory.Localise["NAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_NAME_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM"] ),
			type = "input",
			width = "double",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryCustomGet( id )
				return cat.used ~= "Y"
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalCategoryCustomGet( id )
				return cat.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryCustomRename( id, v )
				ArkInventory.ConfigRefresh( )
			end,
		},
		action_delete = {
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.category.custom.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryCustomDelete( id )
			end,
		},
		action_restore = { 
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.category.custom.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryCustomRestore( id )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM"] ),
			type = "execute",
			width = "half",
			hidden = config.category.custom.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalCategoryCustomPurge( id )
			end,
		},
		
		enabled = {
			order = 500,
			name = ArkInventory.Localise["ENABLED"],
			type = "toggle",
			width = "half",
			disabled = config.category.custom.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local catset = ConfigGetNodeArg( info, #info - 3 )
				catset = ArkInventory.ConfigInternalCategorysetGet( catset )
				return catset.ca[ArkInventory.Const.Category.Type.Custom][id].active
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local catset = ConfigGetNodeArg( info, #info - 3 )
				catset = ArkInventory.ConfigInternalCategorysetGet( catset )
				catset.ca[ArkInventory.Const.Category.Type.Custom][id].active = v
				ArkInventory.ItemCacheClear( )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
			end,
		},
		-- FIX ME - include the category actions
		items = {
			order = 1000,
			name = ArkInventory.Localise["ITEMS"],
			type = "group",
			childGroups = "tree",
			disabled = config.category.custom.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			args = { },
		},
		
	}
	
	for id, data in pairs( ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Custom].data ) do
		
		if not data.system then
			
			if ( data.used == "Y" and config.category.custom.show == ArkInventory.ENUM.LIST.SHOW.ACTIVE ) or ( data.used == "D" and config.category.custom.show == ArkInventory.ENUM.LIST.SHOW.DELETED ) then
				
				local n = data.name
				
				if config.category.custom.sort.list == ArkInventory.ENUM.LIST.SORTBY.NAME then
					n = string.format( "%s [%04i]", n, id )
				else
					n = string.format( "[%04i] %s", id, n )
				end
				
				path[string.format( "%i", id )] = {
					order = 1000,
					name = n,
					type = "group",
					childGroups = "tab",
					icon = function( info )
						local catset = ConfigGetNodeArg( info, #info - 2 )
						catset = ArkInventory.ConfigInternalCategorysetGet( catset )
						if catset.ca[ArkInventory.Const.Category.Type.Custom][id].active then
							return ArkInventory.Const.Texture.CategoryEnabled
						else
							return ArkInventory.Const.Texture.CategoryDisabled
						end
					end,
					arg = id,
					args = args1,
				}
				
			end
			
		end
		
	end
	
	ArkInventory.ConfigInternalCategoryCustomListItem( args1.items )
	
end

function ArkInventory.ConfigInternalCategoryCustomItemCategorySet( item, cat_num )
	
	if not config.catset.selected then return end
	if not item then return end
	
	local class, id, sb = string.match( item, "^(.+):(.+):(.+)$" )
	if not class or not id or not sb then return end
	
	local cat_id = cat_num
	if cat_num then
		cat_id = ArkInventory.CategoryIdBuild( ArkInventory.Const.Category.Type.Custom, cat_num )
	end
	
	ArkInventory.db.option.catset.data[config.catset.selected].ia[item].assign = cat_id
	
	return true
	
end

function ArkInventory.ConfigInternalCategoryCustomListItem( path )
	
	path.args = {
		
		action_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( "%s\n\nformat is either\n<itemid>\nor\nitem:<itemid>:<soulbound>\n\n<itemid> is the items numeric id, most web sites will have this\n<soubound> is either 0 (unbound) or 1 (bound)\n\n\nexample item:6948:1 = hearthstone", string.format( ArkInventory.Localise["CONFIG_LIST_ADD_DESC"], ArkInventory.Localise["ITEM"] ) ),
			type = "input",
			get = function( )
				return ""
			end,
			set = function( info, v )
				
				ArkInventory.Lib.Dewdrop:Close( )
				
				local v = string.trim( v )
				
				if string.match( v, "^(item:%d+:%d+)$" ) then
					v = v
				elseif string.match( v, "^(%d+)$" ) then
					v = string.format( "item:%s:0", v )
				else
					local m = string.match( v, "item:(%d+)" )
					if m then
						v = string.format( "item:%s:0", m )
					else
						return
					end
				end
				
				if ArkInventory.ConfigInternalCategoryCustomItemCategorySet( v, config.category.custom.selected ) then
					
					ArkInventory.ItemCacheClear( )
					ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
					
					ArkInventory.ConfigRefresh( )
					
				end
				
			end,
		},
		action_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SORTBY.NAME] = ArkInventory.Localise["NAME"], [ArkInventory.ENUM.LIST.SORTBY.NUMBER] = ArkInventory.Localise["NUMBER"] }
				return t
			end,
			get = function( info )
				return config.category.custom.sort.item
			end,
			set = function( info, v )
				config.category.custom.sort.item = v
				ArkInventory.ConfigRefresh( )
			end,
		},
	
	}
	
	ArkInventory.ConfigInternalCategoryCustomListItemList( path.args )
	
end

function ArkInventory.ConfigInternalCategoryCustomListItemList( path )
	
	local args1 = {
		
		action_name = { 
			order = 100,
			name = ArkInventory.Localise["ITEM"],
			--desc = string.format( ArkInventory.Localise["CONFIG_LIST_NAME_DESC"], ArkInventory.Localise["ITEM"] ),
			type = "input",
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				return id
			end,
			set = function( info, v )
				
				local id = ConfigGetNodeArg( info, #info - 1 )
				
				if not v then v = id end
				
				if tonumber( v ) then
					v = string.format( "item:%s:0", v )
				end
				
				if id ~= v then
					
					if ArkInventory.ConfigInternalCategoryCustomItemCategorySet( id, nil ) then
						
						ArkInventory.ConfigInternalCategoryCustomItemCategorySet( v, config.category.custom.selected )
						
						ArkInventory.ItemCacheClear( )
						ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						
						ArkInventory.ConfigRefresh( )
						
					end
					
				end
				
			end,
		},
		action_delete = {
			order = 200,
			name = ArkInventory.Localise["REMOVE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_REMOVE_DESC"], ArkInventory.Localise["ITEM"] ),
			type = "execute",
			width = "half",
			func = function( info )
				
				local item = ConfigGetNodeArg( info, #info - 1 )
				
				if ArkInventory.ConfigInternalCategoryCustomItemCategorySet( item, nil ) then
					
					ArkInventory.ItemCacheClear( )
					ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
					
					ArkInventory.ConfigRefresh( )
					
				end
				
			end,
		},
		
	}
	
	
	if not config.category.custom.selected then return end
	
	local catset = ArkInventory.db.option.catset.data[config.catset.selected]
	local cat_select = ArkInventory.CategoryIdBuild( ArkInventory.Const.Category.Type.Custom, config.category.custom.selected )
	
	for item, ia in pairs( catset.ia ) do
		
		if ia.assign == cat_select then
			
			local class, id, sb = string.match( item, "^(.+):(.+):(.+)$" )
			id = tonumber( id )
			sb = tonumber( sb )
			
			local h = string.format( "%s:%s", class, id )
			local info = ArkInventory.GetObjectInfo( h )
			local n = info.name
			
			if id == 0 then
				n = string.format( " %s (%s)", ArkInventory.Localise["EMPTY"], ArkInventory.Const.Slot.Data[sb].name )
			end
			
			if config.category.custom.sort.item == ArkInventory.ENUM.LIST.SORTBY.NAME then
				n = string.format( "%s [%i]", n, id )
			else
				n = string.format( "[%06i] %s", id, n )
			end
			
			path[string.format( "%i", id )] = {
				order = 1000,
				name = n,
				type = "group",
				childGroups = "tab",
				arg = item,
				
--				icon = function( info )
--					local catset = ConfigGetNodeArg( info, #info - 2 )
--					catset = ArkInventory.ConfigInternalCategorysetGet( catset )
--					if catset.data[ArkInventory.Const.Category.Type.Custom][id].active then
--						return ArkInventory.Const.Texture.CategoryEnabled
--					else
--						return ArkInventory.Const.Texture.CategoryDisabled
--					end
--				end,
				args = args1,
			}
			
		end
		
	end
	
end

function ArkInventory.ConfigInternalCategorysetDataRule( path )
	
	path.args = {
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SORTBY.NAME] = ArkInventory.Localise["NAME"], [ArkInventory.ENUM.LIST.SORTBY.NUMBER] = ArkInventory.Localise["NUMBER"], [ArkInventory.ENUM.LIST.SORTBY.ORDER] = ArkInventory.Localise["ORDER"] }
				return t
			end,
			get = function( info )
				return config.category.rule.sort
			end,
			set = function( info, v )
				config.category.rule.sort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
	}
	
	ArkInventory.ConfigInternalCategorysetDataRuleData( path.args )
	
end

function ArkInventory.ConfigInternalCategorysetDataRuleData( path )
	
	local args1 = {
		enabled = {
			order = 100,
			name = ArkInventory.Localise["ENABLED"],
			type = "toggle",
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local catset = ConfigGetNodeArg( info, #info - 3 )
				catset = ArkInventory.ConfigInternalCategorysetGet( catset )
				return catset.ca[ArkInventory.Const.Category.Type.Rule][id].active
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local catset = ConfigGetNodeArg( info, #info - 3 )
				catset = ArkInventory.ConfigInternalCategorysetGet( catset )
				catset.ca[ArkInventory.Const.Category.Type.Rule][id].active = v
				ArkInventory.ItemCacheClear( )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
			end,
		},
		-- FIX ME - include the item actions
	}
	
	for id, data in pairs( ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Rule].data ) do
		
		if data.used == "Y" then
			
			if not data.system then
				
				local n = data.name
			
				if config.category.rule.sort == ArkInventory.ENUM.LIST.SORTBY.NAME then
					n = string.format( "%s [%04i] [%04i]", n, id, data.order )
				elseif config.category.rule.sort == ArkInventory.ENUM.LIST.SORTBY.ORDER then
					n = string.format( "[%04i] %s [%04i]", data.order, n, id )
				else
					n = string.format( "[%04i] %s [%04i]", id, n, data.order )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					name = n,
					arg = id,
					icon = function( info )
						
						if data.damaged then
							return ArkInventory.Const.Texture.CategoryDamaged
						end
						
						local catset = ConfigGetNodeArg( info, #info - 2 )
						catset = ArkInventory.ConfigInternalCategorysetGet( catset )
						if catset.ca[ArkInventory.Const.Category.Type.Rule][id].active then
							return ArkInventory.Const.Texture.CategoryEnabled
						else
							return ArkInventory.Const.Texture.CategoryDisabled
						end
					end,
					type = "group",
					args = args1,
				}
				
			end
			
		end
		
	end
	
end

function ArkInventory.ConfigInternalDesign( )
	
	local path = ArkInventory.Config.Internal.args.settings.args.design
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_DESC"], ArkInventory.Localise["CONFIG_DESIGN"] ),
			type = "input",
			width = "double",
			disabled = config.design.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			get = function( )
				return ""
			end,
			set = function( info, v )
				
				local v = string.trim( v )
				
				if string.match( v, ItemStringPattern ) then
					return
				end
				
				ArkInventory.Lib.Dewdrop:Close( )
				ArkInventory.ConfigInternalDesignAdd( v )
				ArkInventory.ConfigRefresh( )
				
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SORTBY.NAME] = ArkInventory.Localise["NAME"], [ArkInventory.ENUM.LIST.SORTBY.NUMBER] = ArkInventory.Localise["NUMBER"] }
				return t
			end,
			get = function( info )
				return config.design.sort
			end,
			set = function( info, v )
				config.design.sort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SHOW.ACTIVE] = ArkInventory.Localise["ACTIVE"], [ArkInventory.ENUM.LIST.SHOW.DELETED] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return config.design.show
			end,
			set = function( info, v )
				config.design.show = v
				ArkInventory.ConfigRefresh( )
			end,
		},
	}
	
	ArkInventory.ConfigInternalDesignData( path.args )
	
 end

function ArkInventory.ConfigInternalDesignData( path )
	
	local args2 = {
		reset = {
			order = 999,
			name = ArkInventory.Localise["DEFAULT"],
			desc = "PH: reset to default colours",
			type = "execute",
			hidden = false,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 5 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				return style.slot.background.icon
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 5 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				local def = ArkInventory.ConfigInternalDesignGet( 0 )
				for k in pairs( ArkInventory.Const.Slot.Data ) do
					style.slot.background.colour = ArkInventory.Table.Copy( def.slot.background.colour )
				end
				ArkInventory.Frame_Item_Empty_Paint_All( )
			end,
		},
	}
	
	local args3 = {
		reset = {
			order = 999,
			name = ArkInventory.Localise["DEFAULT"],
			desc = "PH: reset to default colours",
			type = "execute",
			hidden = false,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 5 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				return style.slot.border.style == ArkInventory.Const.Texture.BorderNone or not style.slot.border.coloured
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 5 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				local def = ArkInventory.ConfigInternalDesignGet( 0 )
				for k in pairs( ArkInventory.Const.Slot.Data ) do
					style.slot.border.colour = ArkInventory.Table.Copy( def.slot.border.colour )
				end
				ArkInventory.Frame_Item_Empty_Paint_All( )
			end,
		},
	}
	
	for k, v in pairs( ArkInventory.Const.Slot.Data ) do
		
		if not v.hide then
			
			if ArkInventory.ClientCheck( v.ClientCheck ) then
				
				args2[string.format( "%i", k )] = {
					order = 100,
					name = function( )
						return ArkInventory.Const.Slot.Data[k].name
					end,
					desc = function( )
						return string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_COLOUR_DESC"], ArkInventory.Const.Slot.Data[k].name, ArkInventory.Localise["BACKGROUND"] )
					end,
					type = "color",
					hasAlpha = false,
					hidden = false,
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 5 )
						local style = ArkInventory.ConfigInternalDesignGet( id )
						return style.slot.background.icon
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 5 )
						local style = ArkInventory.ConfigInternalDesignGet( id )
						return helperColourGet( style.slot.background.colour[k] )
					end,
					set = function( info, r, g, b )
						local id = ConfigGetNodeArg( info, #info - 5 )
						local style = ArkInventory.ConfigInternalDesignGet( id )
						helperColourSet( style.slot.background.colour[k], r, g, b )
						ArkInventory.Frame_Item_Empty_Paint_All( )
					end,
				}
				
				args3[string.format( "%i", k )] = {
					order = 100,
					name = function( )
						return ArkInventory.Const.Slot.Data[k].name
					end,
					desc = function( )
						return string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_COLOUR_DESC"], ArkInventory.Const.Slot.Data[k].name, ArkInventory.Localise["BORDER"] )
					end,
					type = "color",
					hasAlpha = false,
					hidden = false,
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 5 )
						local style = ArkInventory.ConfigInternalDesignGet( id )
						return style.slot.border.style == ArkInventory.Const.Texture.BorderNone or not style.slot.border.coloured
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 5 )
						local style = ArkInventory.ConfigInternalDesignGet( id )
						return helperColourGet( style.slot.border.colour[k] )
					end,
					set = function( info, r, g, b )
						local id = ConfigGetNodeArg( info, #info - 5 )
						local style = ArkInventory.ConfigInternalDesignGet( id )
						helperColourSet( style.slot.border.colour[k], r, g, b )
						ArkInventory.Frame_Item_Empty_Paint_All( )
					end,
				}
				
			end
			
		end
		
	end
	
	local args1 = {
		
		action_name = {
			order = 100,
			name = ArkInventory.Localise["NAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_NAME_DESC"], ArkInventory.Localise["CONFIG_DESIGN"] ),
			type = "input",
			width = "double",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				return style.system or config.design.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				return style.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalDesignRename( id, v )
				ArkInventory.ConfigInternalDesign( )
			end,
		},
		action_delete = {
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_DESC"], ArkInventory.Localise["CONFIG_DESIGN"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.design.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				return style.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalDesignDelete( id )
			end,
		},
		action_restore = {
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_DESC"], ArkInventory.Localise["CONFIG_DESIGN"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.design.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalDesignGet( id )
				return style.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalDesignRestore( id )
			end,
		},
		action_copy = {
			order = 300,
			name = ArkInventory.Localise["COPY_FROM"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_COPY_DESC"], ArkInventory.Localise["CONFIG_DESIGN"] ),
			type = "select",
			width = "double",
			hidden = config.design.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			values = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local t = { }
				for k, v in pairs( ArkInventory.db.option.design.data ) do
					if v.used == "Y" and k ~= id then
						local n = v.name
						if v.system then
							n = string.format( "* %s", n )
						end
						n = string.format( "[%04i] %s", k, n )
						t[k] = n
					end
				end
				return t
			end,
			get = function( )
				return ""
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalDesignCopyFrom( v, id )
				ArkInventory.ConfigRefreshFull( )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_DESC"], ArkInventory.Localise["CONFIG_DESIGN"] ),
			type = "execute",
			width = "half",
			hidden = config.design.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalDesignPurge( id )
			end,
		},
		
		window = {
			order = 1000,
			name = ArkInventory.Localise["CONFIG_DESIGN_WINDOW"],
			type = "group",
			childGroups = "tab",
			disabled = config.design.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			args = {
				style = {
					order = 100,
					name = ArkInventory.Localise["CONFIG_STYLE"],
					type = "group",
					childGroups = "tab",
					args = {
						window = {
							order = 100,
							name = ArkInventory.Localise["GENERAL"],
							type = "group",
							args = {
								showaslist = {
									order = 10,
									type = "toggle",
									name = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_LIST"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_LIST_DESC"],
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.list
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.window.list = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
									end,
								},
								header = {
									order = 20,
									name = "",
									type = "header",
									width = "full",
								},
								strata = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_GENERAL_FRAMESTRATA"],
									desc = ArkInventory.Localise["CONFIG_GENERAL_FRAMESTRATA_DESC"],
									type = "select",
									values = function( )
										local t = {
											[1] = string.upper( ArkInventory.Localise["LOW"] ),
											[2] = string.upper( ArkInventory.Localise["MEDIUM"] ),
											[3] = string.upper( ArkInventory.Localise["HIGH"] ),
										}
										return t
									end,
									get = function( info )
										
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										
										local v = style.window.strata
										if v == "LOW" then
											return 1
										elseif v == "MEDIUM" then
											return 2
										elseif v == "HIGH" then
											return 3
										end
										
									end,
									set = function( info, v )
										
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										
										local v = v
										if v == 1 then
											v = "LOW"
										elseif v == 2 then
											v = "MEDIUM"
										elseif v == 3 then
											v = "HIGH"
										end
										style.window.strata = v
										
										for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
											ArkInventory.Frame_Main_Hide( loc_id )
										end
										
									end,
								},
								scale = {
									order = 120,
									name = ArkInventory.Localise["SCALE"],
									type = "range",
									min = 0.4,
									max = 2,
									step = 0.05,
									isPercent = true,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.scale
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.4 then v = 0.4 end
										if v > 2 then v = 2 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.scale ~= v then
											style.window.scale = v
											ArkInventory.Frame_Main_Scale_All( )
										end
									end,
								},
								padding = {
									order = 130,
									name = ArkInventory.Localise["PADDING"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_PADDING_DESC"],
									type = "range",
									min = 0,
									max = 50,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.pad
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 0 then v = 0 end
										if v > 50 then v = 50 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.pad ~= v then
											style.window.pad = math.floor( v )
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								width = {
									order = 140,
									name = ArkInventory.Localise["WIDTH"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_WIDTH_DESC"],
									type = "range",
									min = 6,
									max = 60,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.width
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 6 then v = 6 end
										if v > 60 then v = 60 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.width ~= v then
											style.window.width = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								height = {
									order = 150,
									name = ArkInventory.Localise["HEIGHT"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_HEIGHT_DESC"],
									type = "range",
									min = 200,
									max = 2000,
									step = 20,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.height
									end,
									set = function( info, v )
										local v = math.floor( v )
										local v = math.floor( v / 40 ) * 40
										if v < 200 then v = 200 end
										if v > 2000 then v = 2000 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.height ~= v then
											style.window.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								font = {  -- this section is not used at this point
									order = 800,
									name = ArkInventory.Localise["FONT"],
									type = "group",
									inline = true,
									hidden = true,
									args = {
										custom = {
											order = 100,
											name = ArkInventory.Localise["CUSTOM"],
											type = "toggle",
											disabled = true,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.font.custom
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.font.custom = not style.font.custom
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
											end,
										},
										face = {
											order = 110,
											name = ArkInventory.Localise["FONT"],
											--desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_FONT_CUSTOM_DESC"],
											type = "select",
											width = "double",
											dialogControl = "LSM30_Font",
											values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.FONT ),
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.font.custom
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.font.face
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.font.face ~= v then
													style.font.face = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
												end
											end,
										},
									},
								},
							},
						},
						title = {
							order = 1000,
							name = ArkInventory.Localise["SUBFRAME_NAME_TITLE"],
							type = "group",
							args = {
								hide = {
									order = 100,
									type = "toggle",
									name = ArkInventory.Localise["HIDE"],
									desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_FRAME_HIDE_DESC"], ArkInventory.Localise["SUBFRAME_NAME_TITLE"] ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.title.hide
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.title.hide = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								scale = {
									order = 110,
									name = ArkInventory.Localise["SCALE"],
									type = "range",
									min = 0.25,
									max = 2,
									step = 0.05,
									isPercent = true,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.title.hide
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.title.scale or 1
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.25 then v = 0.25 end
										if v > 2 then v = 2 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.title.scale ~= v then
											style.title.scale = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								size = {
									order = 200,
									type = "select",
									name = ArkInventory.Localise["STYLE"],
									values = function( )
										local t = { [ArkInventory.Const.Window.Title.SizeNormal] = ArkInventory.Localise["CONFIG_DESIGN_FRAME_TITLE_SIZE_NORMAL"], [ArkInventory.Const.Window.Title.SizeThin] = ArkInventory.Localise["CONFIG_DESIGN_FRAME_TITLE_SIZE_THIN"] }
										return t
									end,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.title.hide
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.title.size
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.title.size = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								online = {
									order = 300,
									name = ArkInventory.Localise["ONLINE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_TITLE_ONLINE_COLOUR_DESC"],
									type = "color",
									hasAlpha = false,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.title.hide
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.title.colour.online )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.title.colour.online, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,	
								},
								offline = {
									order = 400,
									name = ArkInventory.Localise["OFFLINE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_TITLE_OFFLINE_COLOUR_DESC"],
									type = "color",
									hasAlpha = false,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.title.hide
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.title.colour.offline )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.title.colour.offline, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								font = {
									order = 120,
									name = ArkInventory.Localise["FONT_SIZE"],
									type = "range",
									min = ArkInventory.Const.Font.MinHeight,
									max = ArkInventory.Const.Font.MaxHeight,
									step = 1,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.title.hide
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.title.font.height
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v )
										if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
										if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
										if style.title.font.height ~= v then
											style.title.font.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
										end
									end,
								},
							},
						},
						search = {
							order = 1000,
							name = ArkInventory.Localise["SEARCH"],
							type = "group",
							args = {
								hide = {
									order = 100,
									name = ArkInventory.Localise["HIDE"],
									type = "toggle",
									desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_FRAME_HIDE_DESC"], ArkInventory.Localise["SEARCH"] ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.search.hide
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.search.hide = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								scale = {
									order = 110,
									name = ArkInventory.Localise["SCALE"],
									type = "range",
									min = 0.25,
									max = 2,
									step = 0.05,
									isPercent = true,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.search.hide
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.search.scale or 1
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.25 then v = 0.25 end
										if v > 2 then v = 2 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.search.scale ~= v then
											style.search.scale = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								height = {
									order = 150,
									name = ArkInventory.Localise["FONT_SIZE"],
									type = "range",
									min = ArkInventory.Const.Font.MinHeight,
									max = ArkInventory.Const.Font.MaxHeight,
									step = 1,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.search.hide
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.search.font.height
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v )
										if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
										if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
										if style.search.font.height ~= v then
											style.search.font.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								searchlabel = {
									order = 200,
									name = ArkInventory.Localise["LABEL"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_SEARCH_LABEL_COLOUR_DESC"],
									type = "color",
									hasAlpha = false,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.search.hide
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.search.label.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.search.label.colour, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,	
								},
								searchtext = {
									order = 300,
									name = ArkInventory.Localise["TEXT"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_SEARCH_TEXT_COLOUR_DESC"],
									type = "color",
									hasAlpha = false,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.search.hide
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.search.text.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.search.text.colour, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
							},
						},
						changer = {
							order = 1000,
							name = ArkInventory.Localise["SUBFRAME_NAME_BAGCHANGER"],
							type = "group",
							args = {
								hide = {
									order = 100,
									name = ArkInventory.Localise["HIDE"],
									type = "toggle",
									desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_FRAME_HIDE_DESC"], ArkInventory.Localise["SUBFRAME_NAME_BAGCHANGER"] ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.changer.hide
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.changer.hide = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								scale = {
									order = 110,
									name = ArkInventory.Localise["SCALE"],
									type = "range",
									min = 0.25,
									max = 2,
									step = 0.05,
									isPercent = true,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.changer.hide
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.changer.scale or 1
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.25 then v = 0.25 end
										if v > 2 then v = 2 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.changer.scale ~= v then
											style.changer.scale = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								highlight = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT"],
									type = "group",
									inline = true,
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT_DESC"],
											type = "toggle",
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.changer.hide
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.changer.highlight.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.changer.highlight.show = v
												ArkInventory.ItemCacheClear( )
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["COLOUR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT_COLOUR_DESC"],
											type = "color",
											hasAlpha = false,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.changer.hide or not style.changer.highlight.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return helperColourGet( style.changer.highlight.colour )
											end,
											set = function( info, r, g, b )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												helperColourSet( style.changer.highlight.colour, r, g, b )
												ArkInventory.Frame_Main_Paint_All( )
											end,	
										},
									},
								},
								free = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_DESIGN_FRAME_CHANGER_FREE"],
									type = "group",
									inline = true,
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_CHANGER_FREE_DESC"],
											type = "toggle",
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.changer.hide
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.changer.freespace.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.changer.freespace.show = v
												ArkInventory.ItemCacheClear( )
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["COLOUR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_CHANGER_FREE_COLOUR_DESC"],
											type = "color",
											hasAlpha = false,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.changer.hide or not style.changer.freespace.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return helperColourGet( style.changer.freespace.colour )
											end,
											set = function( info, r, g, b )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												helperColourSet( style.changer.freespace.colour, r, g, b )
												ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Bag )
												ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Bank )
												ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Vault )
											end,
										},
									},
								},
							},
						},
						status = {
							order = 1000,
							name = ArkInventory.Localise["STATUS"],
							type = "group",
							childGroups = "tab",
							args = {
								general = {
									order = 100,
									name = ArkInventory.Localise["GENERAL"],
									type = "group",
									args = {
										hide = {
											order = 100,
											name = ArkInventory.Localise["HIDE"],
											type = "toggle",
											desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_FRAME_HIDE_DESC"], ArkInventory.Localise["STATUS"] ),
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.hide
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.status.hide = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										scale = {
											order = 200,
											name = ArkInventory.Localise["SCALE"],
											type = "range",
											min = 0.25,
											max = 2,
											step = 0.05,
											isPercent = true,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.hide
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.scale or 1
											end,
											set = function( info, v )
												local v = math.floor( v / 0.05 ) * 0.05
												if v < 0.25 then v = 0.25 end
												if v > 2 then v = 2 end
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.status.scale ~= v then
													style.status.scale = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
												end
											end,
										},
										font = {
											order = 300,
											name = ArkInventory.Localise["FONT_SIZE"],
											type = "range",
											min = ArkInventory.Const.Font.MinHeight,
											max = ArkInventory.Const.Font.MaxHeight,
											step = 1,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.hide
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.font.height
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												local v = math.floor( v )
												if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
												if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
												if style.status.font.height ~= v then
													style.status.font.height = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
												end
											end,
										},
									},
								},
								emptytext = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_DESIGN_FRAME_STATUS_EMPTY"],
									type = "group",
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_FRAME_STATUS_EMPTY_DESC"],
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.emptytext.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.status.emptytext.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										colour = {
											order = 200,
											name = ArkInventory.Localise["LDB_BAGS_COLOUR_USE"],
											desc = ArkInventory.Localise["LDB_BAGS_COLOUR_USE_DESC"],
											type = "toggle",
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.status.emptytext.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.emptytext.colour
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.status.emptytext.colour = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										full = {
											order = 300,
											name = ArkInventory.Localise["LDB_BAGS_STYLE"],
											desc = ArkInventory.Localise["LDB_BAGS_STYLE_DESC"],
											type = "toggle",
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.status.emptytext.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.emptytext.full
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.status.emptytext.full = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										includetype = {
											order = 400,
											name = ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE"],
											desc = ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE_DESC"],
											type = "toggle",
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.status.emptytext.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.emptytext.includetype
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.status.emptytext.includetype = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										includeslot = {
											order = 500,
											name = ArkInventory.Localise["DISPLAY"],
											type = "group",
											inline = true,
											args = { },
										},
										
									},
								},
								currency = {
									order = 300,
									name = ArkInventory.Localise["CURRENCY"],
									type = "group",
									width = "half",
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.currency.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.status.currency.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
									},
								},
								money = {
									order = 400,
									name = ArkInventory.Localise["MONEY"],
									type = "group",
									width = "half",
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.status.money.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.status.money.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
									},
								},
							},
						},
						background = {
							order = 1000,
							name = ArkInventory.Localise["BACKGROUND"],
							type = "group",
							args = {
								style = {
									order = 100,
									name = ArkInventory.Localise["STYLE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_DESC"],
									type = "select",
									width = "double",
									dialogControl = "LSM30_Background",
									values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.background.style or ArkInventory.Const.Texture.BackgroundDefault
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.background.style ~= v then
											style.window.background.style = v
											ArkInventory.Frame_Main_Paint_All( )
										end
									end,
								},
								colour = {
									order = 200,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BACKGROUND_COLOUR_DESC"],
									type = "color",
									hasAlpha = true,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.background.style ~= ArkInventory.Const.Texture.BackgroundDefault
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.window.background.colour )
									end,
									set = function( info, r, g, b, a )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.window.background.colour, r, g, b, a )
										ArkInventory.Frame_Main_Paint_All( )
									end,
								},
							},
						},	
						scrollbar = {
							order = 1000,
							name = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_SCROLLBAR"],
							type = "group",
							args = {
								style = {
									order = 100,
									name = ArkInventory.Localise["STYLE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_SCROLLBAR_STYLE_DESC"],
									type = "select",
									width = "double",
									dialogControl = "LSM30_Background",
									values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.scrollbar.style or ArkInventory.Const.Texture.BackgroundDefault
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.scrollbar.style ~= v then
											style.window.scrollbar.style = v
											ArkInventory.Frame_Main_Paint_All( )
										end
									end,
								},
								colour = {
									order = 200,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_SCROLLBAR_COLOUR_DESC"],
									type = "color",
									hasAlpha = true,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.scrollbar.style ~= ArkInventory.Const.Texture.BackgroundDefault
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.window.scrollbar.colour )
									end,
									set = function( info, r, g, b, a )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.window.scrollbar.colour, r, g, b, a )
										ArkInventory.Frame_Main_Paint_All( )
									end,
								},
							},
						},
						border = {
							order = 1000,
							name = ArkInventory.Localise["BORDER"],
							type = "group",
							args = {
								style = {
									order = 100,
									name = ArkInventory.Localise["STYLE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_STYLE_DESC"],
									type = "select",
									width = "double",
									dialogControl = "LSM30_Border",
									values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BORDER ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.style or ArkInventory.Const.Texture.BorderDefault
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.border.style ~= v then
											
											style.window.border.style = v
											
											local sd = ArkInventory.Const.Texture.Border[v] or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault]
											style.window.border.size = sd.size
											style.window.border.offset = sd.offsetdefault.window
											style.window.border.scale = sd.scale
											
											ArkInventory.Frame_Main_Paint_All( )
											
										end
									end,
								},
								colour = {
									order = 200,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_WINDOW_BORDER_COLOUR_DESC"],
									type = "color",
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									hasAlpha = false,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.window.border.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.window.border.colour, r, g, b )
										ArkInventory.Frame_Main_Paint_All( )
									end,
								},
								size = {
									order = 300,
									name = ArkInventory.Localise["HEIGHT"],
									type = "input",
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( "%i", style.window.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size )
									end,
									set = function( info, v )
										local v = math.floor( tonumber( v ) or 0 )
										if v < 0 then v = 0 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.border.size ~= v then
											style.window.border.size = v
											ArkInventory.Frame_Main_Paint_All( )
										end
									end,
								},
								offset = {
									order = 400,
									name = ArkInventory.Localise["OFFSET"],
									type = "range",
									min = -10,
									max = 10,
									step = 1,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offsetdefault.window
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < -10 then v = -10 end
										if v > 10 then v = 10 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.border.offset ~= v then
											style.window.border.offset = v
											ArkInventory.Frame_Main_Paint_All( )
										end
									end,
								},
								scale = {
									order = 500,
									name = ArkInventory.Localise["SCALE"],
									desc = ArkInventory.Localise["CONFIG_BORDER_SCALE_DESC"],
									type = "range",
									min = 0.25,
									max = 4,
									step = 0.05,
									isPercent = true,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.border.scale or 1
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.25 then v = 0.25 end
										if v > 4 then v = 4 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.window.border.scale ~= v then
											style.window.border.scale = v
											ArkInventory.Frame_Main_Paint_All( )
										end
									end,
								},
							},
						},
						sorting = {
							order = 1000,
							name = ArkInventory.Localise["CONFIG_SORTING"],
							type = "group",
							args = {
								method = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_SORTING_METHOD"],
									desc = ArkInventory.Localise["CONFIG_SORTING_METHOD_DESC"],
									type = "select",
									width = "double",
									values = function( )
										local t = { }
										for k, v in pairs( ArkInventory.db.option.sort.method.data ) do
											if v.used == "Y" then
												local n = v.name
												if v.system then
													n = string.format( "* %s", n )
												end
												n = string.format( "[%04i] %s", k, n )
												t[k] = n
											end
										end
										return t
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.sort.method
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.sort.method = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
									end,
								},
								when = {
									order = 200,
									name = ArkInventory.Localise["WHEN"],
									desc = string.format( "%s\n\n\n%s: %s\n\n%s: %s\n\n%s: %s", ArkInventory.Localise["CONFIG_SORTING_WHEN_DESC"], ArkInventory.Localise["CONFIG_SORTING_WHEN_INSTANT"], ArkInventory.Localise["CONFIG_SORTING_WHEN_INSTANT_DESC"], ArkInventory.Localise["CONFIG_SORTING_WHEN_OPEN"], ArkInventory.Localise["CONFIG_SORTING_WHEN_OPEN_DESC"], ArkInventory.Localise["CONFIG_SORTING_WHEN_MANUAL"], ArkInventory.Localise["CONFIG_SORTING_WHEN_MANUAL_DESC"] ),
									type = "select",
									values = function( )
										local t = {
											[ArkInventory.ENUM.SORTWHEN.ALWAYS] = ArkInventory.Localise["CONFIG_SORTING_WHEN_INSTANT"],
											[ArkInventory.ENUM.SORTWHEN.ONOPEN] = ArkInventory.Localise["CONFIG_SORTING_WHEN_OPEN"],
											[ArkInventory.ENUM.SORTWHEN.MANUAL] = ArkInventory.Localise["CONFIG_SORTING_WHEN_MANUAL"],
										}
										return t
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.sort.when
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.sort.when = v
									end,
								},
							},
						},
					},
				},
				layout = {
					order = 200,
					name = ArkInventory.Localise["CONFIG_LAYOUT"],
					type = "group",
					args = {
						layout = {
							order = 10,
							name = ArkInventory.Localise["CONFIG_LAYOUT_DESCRIPTION"],
							type = "description",
							fontSize = "medium"
						},
					},
				},
			},
		},
		bars = {
			order = 2000,
			name = ArkInventory.Localise["CONFIG_DESIGN_BAR"],
			type = "group",
			childGroups = "tab",
			disabled = config.design.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			args = {
				style = {
					order = 100,
					name = ArkInventory.Localise["CONFIG_STYLE"],
					type = "group",
					childGroups = "tab",
					args = {
						bars = {
							order = 100,
							name = ArkInventory.Localise["GENERAL"],
							type = "group",
							args = {
								anchor = {
									order = 100,
									name = ArkInventory.Localise["ANCHOR"],
									desc = string.format( ArkInventory.Localise["ANCHOR_TEXT3"], ArkInventory.Localise["CONFIG_DESIGN_WINDOW"], ArkInventory.Localise["CONFIG_DESIGN_BAR"] ),
									type = "select",
									values = anchorpoints,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.anchor
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.anchor ~= v then
											style.bar.anchor = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								compact = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_DESIGN_BAR_COMPACT"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_COMPACT_DESC"],
									type = "toggle",
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.list 
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.compact
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.bar.compact = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								per_row = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_DESIGN_BAR_PER_ROW"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_PER_ROW_DESC"],
									type = "range",
									min = 1,
									max = 40,
									step = 1,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.list 
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.per
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 1 then v = 1 end
										if v > 16 then v = 16 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.per ~= v then
											style.bar.per = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								empty = {
									order = 500,
									name = ArkInventory.Localise["CONFIG_DESIGN_BAR_SHOW_EMPTY"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_SHOW_EMPTY_DESC"],
									type = "toggle",
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.window.list 
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.showempty
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.bar.showempty = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
							},
						},
						padding = {
							order= 1000,
							name = ArkInventory.Localise["PADDING"],
							type = "group",
							args = {
								external = {
									order = 100,
									name = ArkInventory.Localise["EXTERNAL"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_PADDING_EXTERNAL_DESC"],
									type = "range",
									min = 0,
									max = 50,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.pad.external
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 0 then v = 0 end
										if v > 50 then v = 50 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.pad.external ~= v then
											style.bar.pad.external = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								internal = {
									order = 200,
									name = ArkInventory.Localise["INTERNAL"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_PADDING_INTERNAL_DESC"],
									type = "range",
									min = 0,
									max = 50,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.pad.internal
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 0 then v = 0 end
										if v > 50 then v = 50 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.pad.internal ~= v then
											style.bar.pad.internal = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
							},
						},
						background = {
							order = 1000,
							name = ArkInventory.Localise["BACKGROUND"],
							type = "group",
							args = {
								style = {
									order = 100,
									name = ArkInventory.Localise["STYLE"],
									type = "select",
									width = "double",
									disabled = true,
									dialogControl = "LSM30_Background",
									values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										--return style.bar.background.style
										return ArkInventory.Const.Texture.BackgroundDefault
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.bar.background.style = v
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
								colour = {
									order = 200,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_BACKGROUND_DESC"],
									type = "color",
									hasAlpha = true,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										--return style.bar.background.style ~= ArkInventory.Const.Texture.BackgroundDefault
										return false
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.bar.background.colour )
									end,
									set = function( info, r, g, b, a )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.bar.background.colour, r, g, b, a )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
							},
						},	
						border = {
							order = 1000,
							name = ArkInventory.Localise["BORDER"],
							type = "group",
							args = {
								style = {
									order = 100,
									name = ArkInventory.Localise["STYLE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_BORDER_STYLE_DESC"],
									type = "select",
									width = "double",
									dialogControl = "LSM30_Border",
									values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BORDER ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.style or ArkInventory.Const.Texture.BorderDefault
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.border.style ~= v then
											
											style.bar.border.style = v
											
											local sd = ArkInventory.Const.Texture.Border[v] or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault]
											style.bar.border.size = sd.size
											style.bar.border.offset = sd.offsetdefault.bar
											style.bar.border.scale = sd.scale
											
											ArkInventory.Frame_Bar_Paint_All( )
											
										end
									end,
								},
								colour = {
									order = 200,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_BORDER_COLOUR_DESC"],
									type = "color",
									hasAlpha = false,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.bar.border.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.bar.border.colour, r, g, b )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
								size = {
									order = 300,
									name = ArkInventory.Localise["HEIGHT"],
									type = "input",
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( "%i", style.bar.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size )
									end,
									set = function( info, v )
										local v = math.floor( tonumber( v ) or 0 )
										if v < 0 then v = 0 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.border.size ~= v then
											style.bar.border.size = v
											ArkInventory.Frame_Bar_Paint_All( )
										end
									end,
								},
								offset = {
									order = 400,
									name = ArkInventory.Localise["OFFSET"],
									type = "range",
									min = -10,
									max = 10,
									step = 1,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.offset or 0
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < -10 then v = -10 end
										if v > 10 then v = 10 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.border.offset ~= v then
											style.bar.border.offset = v
											ArkInventory.Frame_Bar_Paint_All( )
										end
									end,
								},
								scale = {
									order = 500,
									name = ArkInventory.Localise["SCALE"],
									type = "range",
									min = 0.25,
									max = 4,
									step = 0.05,
									isPercent = true,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.border.scale or 1
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.25 then v = 0.25 end
										if v > 4 then v = 4 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.border.scale ~= v then
											style.bar.border.scale = v
											ArkInventory.Frame_Bar_Paint_All( )
										end
									end,
								},
							},
						},
						label = {
							order = 1000,
							name = ArkInventory.Localise["NAME"],
							type = "group",
							args = {
								show = {
									order = 100,
									type = "toggle",
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_NAME_SHOW_DESC"],
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.name.show
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.bar.name.show = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								editmode = {
									order = 110,
									type = "toggle",
									name = string.format( "%s (%s)", ArkInventory.Localise["ENABLED"], ArkInventory.Localise["MENU_ACTION_EDITMODE"] ),
									desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_BAR_NAME_EDITMODE_DESC"], ArkInventory.Localise["MENU_ACTION_EDITMODE"] ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.name.editmode
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.bar.name.editmode = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								position = {
									order = 200,
									name = ArkInventory.Localise["POSITION"],
									--desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], ArkInventory.Localise["NAME"], "" ),
									type = "select",
									values = anchorpoints4,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not ( style.bar.name.show or style.bar.name.editmode )
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.name.anchor
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.name.anchor ~= v then
											style.bar.name.anchor = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								align = {
									order = 300,
									name = ArkInventory.Localise["ALIGNMENT"],
									type = "select",
									values = anchorpoints3,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not ( style.bar.name.show or style.bar.name.editmode )
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.name.align
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.name.align ~= v then
											style.bar.name.align = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								height = {
									order = 400,
									name = ArkInventory.Localise["FONT_SIZE"],
									type = "range",
									min = ArkInventory.Const.Font.MinHeight,
									max = ArkInventory.Const.Font.MaxHeight,
									step = 1,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not ( style.bar.name.show or style.bar.name.editmode )
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.name.height
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
										if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.name.height ~= v then
											style.bar.name.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								colour = {
									order = 500,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_NAME_COLOUR_DESC"],
									type = "color",
									hasAlpha = false,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not ( style.bar.name.show or style.bar.name.editmode )
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.bar.name.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.bar.name.colour, r, g, b )
										ArkInventory.Frame_Bar_Paint_All( )
									end,
								},
							},
						},
						width = {
							order= 1000,
							name = ArkInventory.Localise["WIDTH"],
							type = "group",
							args = {
								minimum = {
									order = 100,
									name = ArkInventory.Localise["MINIMUM"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_WIDTH_MIN_DESC"],
									type = "range",
									min = 0,
									max = 25,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.width.min
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 0 then v = 0 end
										if v > 25 then v = 25 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.width.min ~= v then
											style.bar.width.min = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								maximum = {
									order = 200,
									name = ArkInventory.Localise["MAXIMUM"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_BAR_WIDTH_MAX_DESC"],
									type = "range",
									min = 0,
									max = 25,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.bar.width.max
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 0 then v = 0 end
										if v > 25 then v = 25 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.bar.width.max ~= v then
											style.bar.width.max = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
							},
						},
					},
				},
				layout = {
					order = 200,
					name = ArkInventory.Localise["CONFIG_LAYOUT"],
					type = "group",
					args = {
						layout = {
							order = 10,
							name = ArkInventory.Localise["CONFIG_LAYOUT_DESCRIPTION"],
							type = "description",
							fontSize = "medium"
						},
					},
				},
			},
		},
		items = {
			order = 3000,
			name = ArkInventory.Localise["ITEMS"],
			type = "group",
			childGroups = "tab",
			disabled = config.design.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			args = {
				style = {
					order = 100,
					name = ArkInventory.Localise["CONFIG_STYLE"],
					type = "group",
					childGroups = "tab",
					args = {
						general = {
							order = 100,
							name = ArkInventory.Localise["GENERAL"],
							type = "group",
							args = {
								anchor = {
									order = 100,
									name = ArkInventory.Localise["ANCHOR"],
									desc = string.format( ArkInventory.Localise["ANCHOR_TEXT3"], ArkInventory.Localise["MENU_BAR"], ArkInventory.Localise["ITEMS"] ),
									type = "select",
									values = anchorpoints,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.anchor
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.anchor ~= v then
											style.slot.anchor = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								itemsize = {
									order = 150,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_SIZE"],
									desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_SIZE_DESC"], ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.SLOTSIZE ),
									type = "range",
									min = 24,
									max = 64,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.size or ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.SLOTSIZE
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v )
										if v < 24 then v = 24 end
										if v > 64 then v = 64 end
										style.slot.size = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								padding = {
									order = 200,
									name = ArkInventory.Localise["PADDING"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_PADDING_DESC"],
									type = "range",
									min = 0,
									max = 50,
									step = 1,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.pad
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < 0 then v = 0 end
										if v > 50 then v = 50 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.pad ~= v then
											style.slot.pad = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								scale = {
									order = 300,
									name = ArkInventory.Localise["SCALE"],
									type = "range",
									min = 0.25,
									max = 4,
									step = 0.05,
									isPercent = true,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.scale or 1
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.25 then v = 0.25 end
										if v > 4 then v = 4 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.scale ~= v then
											style.slot.scale = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
										end
									end,
								},
								fade = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_FADE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_FADE_DESC"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.offline.fade
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.offline.fade = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								unusable_tint = {
									order = 500,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_TINT_UNUSABLE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_TINT_UNUSABLE_DESC"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.unusable.tint
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.unusable.tint = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								unwearable_tint = {
									order = 600,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_TINT_UNWEARABLE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_TINT_UNWEARABLE_DESC"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.unwearable.tint
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.unwearable.tint = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
							},
						},
						cooldown = {
							order = 1000,
							name = ArkInventory.Localise["COOLDOWN"],
							type = "group",
							args = {
								enable = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COOLDOWN_SHOW_DESC"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.cooldown.show
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.cooldown.show = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								onopen = {
									order = 200,
									name = ArkInventory.Localise["CONFIG_SORTING_WHEN_OPEN"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COOLDOWN_ONOPEN_DESC"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.cooldown.onopen
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.cooldown.onopen = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								combat = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COOLDOWN_COMBAT"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COOLDOWN_COMBAT_DESC"],
									type = "toggle",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.cooldown.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.cooldown.combat
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.cooldown.combat = v
									end,
								},
								numbers = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_COOLDOWN_NUMBER"],
									desc = ArkInventory.Localise["CONFIG_IS_CVAR"],
									type = "toggle",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.cooldown.show
									end,
									get = function( info )
										return ArkInventory.CrossClient.GetCVarBool( "countdownForCooldowns" )
									end,
									set = function( info, v )
										ArkInventory.CrossClient.SetCVar( "countdownForCooldowns", v and 1 or 0 )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
							},
						},
						border = {
							order = 1000,
							name = ArkInventory.Localise["BORDER"],
							type = "group",
							args = {
								style = {
									order = 100,
									name = ArkInventory.Localise["STYLE"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_STYLE_DESC"],
									type = "select",
									width = "double",
									dialogControl = "LSM30_Border",
									values = ArkInventory.Lib.SharedMedia:HashTable( ArkInventory.Lib.SharedMedia.MediaType.BORDER ),
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style or ArkInventory.Const.Texture.BorderDefault
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.border.style ~= v then
											
											style.slot.border.style = v
											
											local sd = ArkInventory.Const.Texture.Border[v] or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault]
											style.slot.border.size = sd.size
											style.slot.border.offset = sd.offsetdefault.slot
											style.slot.border.scale = sd.scale
											
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											
										end
									end,
								},
								coloured = {
									order = 150,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_COLOURED"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_COLOURED_DESC"],
									type = "toggle",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.coloured
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.border.coloured = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								rarity = {
									order = 200,
									name = ArkInventory.Localise["QUALITY"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_QUALITY_DESC"],
									type = "toggle",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style == ArkInventory.Const.Texture.BorderNone or not style.slot.border.coloured
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.rarity
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.border.rarity = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								raritycutoff = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_QUALITY_CUTOFF"],
									desc = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_BORDER_QUALITY_CUTOFF_DESC"], ( select( 5, ArkInventory.GetItemQualityColor( style.slot.border.raritycutoff ) ) ), _G[string.format( "ITEM_QUALITY%d_DESC", style.slot.border.raritycutoff or ArkInventory.ENUM.ITEM.QUALITY.POOR )] )
									end,
									type = "select",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style == ArkInventory.Const.Texture.BorderNone or not style.slot.border.coloured or not style.slot.border.rarity
									end,
									values = function( )
										local t = { }
										for z in pairs( ITEM_QUALITY_COLORS ) do
											if z >= ArkInventory.ENUM.ITEM.QUALITY.POOR then
												t[tostring( z )] = string.format( "%s%s", select( 5, ArkInventory.GetItemQualityColor( z ) ), _G[string.format( "ITEM_QUALITY%d_DESC", z )] )
											end
										end
										return t
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return tostring( style.slot.border.raritycutoff or ArkInventory.ENUM.ITEM.QUALITY.POOR )
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.border.raritycutoff = tonumber( v )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								height = {
									order = 400,
									name = ArkInventory.Localise["HEIGHT"],
									type = "input",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( "%i", style.slot.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size )
									end,
									set = function( info, v )
										local v = math.floor( tonumber( v ) or 0 )
										if v < 0 then v = 0 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.border.size ~= v then
											style.slot.border.size = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								offset = {
									order = 500,
									name = ArkInventory.Localise["OFFSET"],
									type = "range",
									min = -10,
									max = 10,
									step = 1,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offsetdefault.slot
									end,
									set = function( info, v )
										local v = math.floor( v )
										if v < -10 then v = -10 end
										if v > 10 then v = 10 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.border.offset ~= v then
											style.slot.border.offset = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								scale = {
									order = 600,
									name = ArkInventory.Localise["SCALE"],
									type = "range",
									min = 0.25,
									max = 4,
									step = 0.05,
									isPercent = true,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.scale or 1
									end,
									set = function( info, v )
										local v = math.floor( v / 0.05 ) * 0.05
										if v < 0.25 then v = 0.25 end
										if v > 4 then v = 4 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.border.scale ~= v then
											style.slot.border.scale = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								alpha = {
									order = 700,
									name = ArkInventory.Localise["ALPHA"],
									desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_ALPHA_DESC"], ArkInventory.Localise["BORDER"] ),
									type = "range",
									min = 0,
									max = 1,
									step = 0.01,
									isPercent = true,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.style == ArkInventory.Const.Texture.BorderNone
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.border.alpha or 1
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v / 0.01 ) * 0.01
										if v < 0 then v = 0 end
										if v > 1 then v = 1 end
										if style.slot.border.alpha ~= v then
											style.slot.border.alpha = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								colour = {
									order = 800,
									name = ArkInventory.Localise["COLOUR"],
									type = "group",
									inline = true,
									args = args3,
								},
							},
						},
						empty = {
							order = 1000,
							name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY"],
							type = "group",
							childGroups = "tab",
							args = {
								icon = {
									order = 100,
									name = ArkInventory.Localise["ICON"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_ICON_DESC"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.background.icon
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.background.icon = v
										ArkInventory.Frame_Item_Empty_Paint_All( )
									end,
								},
								alpha = {
									order = 200,
									name = ArkInventory.Localise["ALPHA"],
									desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_ALPHA_DESC"], ArkInventory.Localise["BACKGROUND"] ),
									type = "range",
									min = 0,
									max = 1,
									step = 0.01,
									isPercent = true,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.background.icon
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.background.alpha or 1
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v / 0.01 ) * 0.01
										if v < 0 then v = 0 end
										if v > 1 then v = 1 end
										if style.slot.background.alpha ~= v then
											style.slot.background.alpha = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								sort = {
									order = 300,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_POSITION"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_POSITION_DESC"],
									type = "select",
									values = {
										[1] = ArkInventory.Localise["FIRST"],
										[2] = ArkInventory.Localise["LAST"],
									},
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.empty.position == true then
											return 1 -- ArkInventory.Localise["FIRST"]
										else
											return 2 --ArkInventory.Localise["LAST"]
										end
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if v == 1 then
											style.slot.empty.position = true
										else
											style.slot.empty.position = false
										end
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								first = {
									order = 400,
									--name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_FIRST"],
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_FIRST_DESC"],
									type = "range",
									min = 0,
									max = 5,
									step = 1,
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return ( style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Limit )
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.empty.first or 0
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v )
										if v < 0 then v = 0 end
										if v > 5 then v = 5 end
										if style.slot.empty.first ~= v then
											style.slot.empty.first = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									end,
								},
								clump = {
									order = 500,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_CLUMP"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_EMPTY_CLUMP_DESC"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.empty.clump
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.empty.clump = v
										ArkInventory.ItemCacheClear( )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end,
								},
								colour = {
									order = 600,
									name = ArkInventory.Localise["COLOUR"],
									type = "group",
									inline = true,
									args = args2,
								},
								
							},
						},
						age = {
							order = 1000,
							name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_AGE"],
							type = "group",
							args = {
								show = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_AGE_SHOW_DESC"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.age.show
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.age.show = not style.slot.age.show
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								anchor = {
									order = 150,
									name = ArkInventory.Localise["ANCHOR"],
									desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMCOUNT"], "" ),
									type = "select",
									values = anchorpoints5,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.age.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.age.anchor
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.age.anchor ~= v then
											style.slot.age.anchor = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
										end
									end,
								},
								height = {
									order = 200,
									name = ArkInventory.Localise["FONT_SIZE"],
									type = "range",
									min	= ArkInventory.Const.Font.MinHeight,
									max = ArkInventory.Const.Font.MaxHeight,
									step = 1,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.age.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.age.font.height
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v )
										if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
										if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
										if style.slot.age.font.height ~= v then
											style.slot.age.font.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								colour = {
									order = 300,
									name = ArkInventory.Localise["COLOUR"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_AGE_COLOUR_DESC"],
									type = "color",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.age.show
									end,
									hasAlpha = false,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.slot.age.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.slot.age.colour, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								cutoff = {
									order = 400,
									name = string.format( "%s (%s)", ArkInventory.Localise["DURATION"], ArkInventory.Localise["MINUTES"] ),
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_AGE_CUTOFF_DESC"],
									type = "input",
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.age.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return string.format( "%i", style.slot.age.cutoff )
									end,
									set = function( info, v )
										local v = math.floor( tonumber( v ) or 0 )
										if v < 0 then v = 0 end
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.age.cutoff ~= v then
											style.slot.age.cutoff = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
							},
						},
						override = {
							order = 1000,
							name = ArkInventory.Localise["OVERRIDE"],
							type = "group",
							childGroups = "tab",
							args = {
								new = {
									order = 1000,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERRIDE_NEW"],
									type = "group",
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = function( )
												local cat_id = ArkInventory.CategoryGetSystemID( "SYSTEM_NEW" )
												local cat = ArkInventory.Global.Category[cat_id]
												return string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERRIDE_NEW_ENABLED_DESC"], cat.fullname )
											end,
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.override.new.enable
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.override.new.enable = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
											end,
										},
										cutoff = {
											order = 300,
											name = string.format( "%s (%s)", ArkInventory.Localise["DURATION"], ArkInventory.Localise["MINUTES"] ),
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERRIDE_NEW_CUTOFF_DESC"],
											type = "input",
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.override.new.enable
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return string.format( "%i", style.slot.override.new.cutoff )
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												local v = math.floor( tonumber( v ) or 0 )
												if v < 0 then v = 1 end
												if style.slot.override.new.cutoff ~= v then
													style.slot.override.new.cutoff = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
												end
											end,
										},
									},
								},
								partyloot = {
									order = 1000,
									name = ArkInventory.Localise["ITEM_BIND_PARTYLOOT"],
									type = "group",
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = function( )
												local cat_id = ArkInventory.CategoryGetSystemID( "SYSTEM_ITEM_BIND_PARTYLOOT" )
												local cat = ArkInventory.Global.Category[cat_id]
												return string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERRIDE_PARTYLOOT_ENABLED_DESC"], cat.fullname )
											end,
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.override.partyloot.enable
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.override.partyloot.enable = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
											end,
										},
									},
								},
								refundable = {
									order = 1000,
									name = ArkInventory.Localise["ITEM_BIND_REFUNDABLE"],
									type = "group",
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = function( )
												local cat_id = ArkInventory.CategoryGetSystemID( "SYSTEM_ITEM_BIND_REFUNDABLE" )
												local cat = ArkInventory.Global.Category[cat_id]
												return string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERRIDE_REFUNDABLE_ENABLED_DESC"], cat.fullname )
											end,
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.override.refundable.enable
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.override.refundable.enable = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
											end,
										},
									},
								},
								
								
							},
						},
						itemcount = {
							order = 1000,
							name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMCOUNT"],
							type = "group",
							args = {
								show = {
									order = 100,
									name = ArkInventory.Localise["ENABLED"],
									desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMCOUNT_DESC"],
									type = "toggle",
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.itemcount.show
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										style.slot.itemcount.show = v
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,
								},
								anchor = {
									order = 150,
									name = ArkInventory.Localise["ANCHOR"],
									desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMCOUNT"], "" ),
									type = "select",
									values = anchorpoints5,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.itemcount.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.itemcount.anchor
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										if style.slot.itemcount.anchor ~= v then
											style.slot.itemcount.anchor = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
										end
									end,
								},
								height = {
									order = 200,
									name = ArkInventory.Localise["FONT_SIZE"],
									type = "range",
									min	= ArkInventory.Const.Font.MinHeight,
									max = ArkInventory.Const.Font.MaxHeight,
									step = 1,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.itemcount.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.itemcount.font.height
									end,
									set = function( info, v )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										local v = math.floor( v )
										if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
										if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
										if style.slot.itemcount.font.height ~= v then
											style.slot.itemcount.font.height = v
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
										end
									end,
								},
								colour = {
									order = 300,
									name = ArkInventory.Localise["COLOUR"],
									type = "color",
									hasAlpha = false,
									disabled = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return not style.slot.itemcount.show
									end,
									get = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return helperColourGet( style.slot.itemcount.colour )
									end,
									set = function( info, r, g, b )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										helperColourSet( style.slot.itemcount.colour, r, g, b )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
									end,	
								},
							},
						},
						itemlevel = {
							order = 1000,
							name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL"],
							type = "group",
							childGroups = "tab",
							args = {
								general = {
									order = 100,
									name = ArkInventory.Localise["GENERAL"],
									type = "group",
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL_DESC"],
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.itemlevel.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.itemlevel.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										anchor = {
											order = 200,
											name = ArkInventory.Localise["ANCHOR"],
											desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL"], "" ),
											type = "select",
											values = anchorpoints5,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.itemlevel.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.itemlevel.anchor
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.slot.itemlevel.anchor ~= v then
													style.slot.itemlevel.anchor = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
												end
											end,
										},
										height = {
											order = 300,
											name = ArkInventory.Localise["FONT_SIZE"],
											type = "range",
											min	= ArkInventory.Const.Font.MinHeight,
											max = ArkInventory.Const.Font.MaxHeight,
											step = 1,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.itemlevel.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.itemlevel.font.height
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												local v = math.floor( v )
												if v < ArkInventory.Const.Font.MinHeight then v = ArkInventory.Const.Font.MinHeight end
												if v > ArkInventory.Const.Font.MaxHeight then v = ArkInventory.Const.Font.MaxHeight end
												if style.slot.itemlevel.font.height ~= v then
													style.slot.itemlevel.font.height = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
												end
											end,
										},
										quality = {
											order = 400,
											name = ArkInventory.Localise["QUALITY"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL_QUALITY_DESC"],
											type = "toggle",
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.itemlevel.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.itemlevel.quality
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.itemlevel.quality = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										colour = {
											order = 500,
											name = ArkInventory.Localise["COLOUR"],
											type = "color",
											hasAlpha = false,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.itemlevel.show or style.slot.itemlevel.quality
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return helperColourGet( style.slot.itemlevel.colour )
											end,
											set = function( info, r, g, b )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												helperColourSet( style.slot.itemlevel.colour, r, g, b )
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
									},
								},
								equip = {
									order = 200,
									name = ArkInventory.Localise["EQUIPMENT"],
									type = "group",
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL_EQUIP_DESC"],
											type = "toggle",
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.itemlevel.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.itemlevel.equip.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.itemlevel.equip.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										minimum = {
											order = 200,
											name = ArkInventory.Localise["MINIMUM"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL_EQUIP_MINIMUM_DESC"],
											type = "range",
											min	= ArkInventory.Const.Slot.ItemLevel.Min,
											max = ArkInventory.Const.Slot.ItemLevel.Max,
											step = 1,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.itemlevel.show or not style.slot.itemlevel.equip.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.itemlevel.equip.min
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												local v = math.floor( v )
												if v < ArkInventory.Const.Slot.ItemLevel.Min then v = ArkInventory.Const.Slot.ItemLevel.Min end
												if v > ArkInventory.Const.Slot.ItemLevel.Max then v = ArkInventory.Const.Slot.ItemLevel.Max end
												if style.slot.itemlevel.equip.min ~= v then
													style.slot.itemlevel.equip.min = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
												end
											end,
										},
									},
								},
								bags = {
									order = 300,
									name = ArkInventory.Localise["BAGS"],
									type = "group",
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL_BAGS_DESC"],
											type = "toggle",
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.itemlevel.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.itemlevel.bags.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.itemlevel.bags.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
									},
								},
								stock = {
									order = 400,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL_STOCK"],
									type = "group",
									args = {
										show = {
											order = 100,
											name = ArkInventory.Localise["ENABLED"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL_STOCK_DESC"],
											type = "toggle",
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.itemlevel.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.itemlevel.stock.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.itemlevel.stock.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										total = {
											order = 200,
											name = ArkInventory.Localise["TOTAL"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMLEVEL_STOCK_TOTAL_DESC"],
											type = "toggle",
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.itemlevel.show or not style.slot.itemlevel.stock.show 
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.itemlevel.stock.total
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.itemlevel.stock.total = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
									},
								},
							},
						},
						statusicon = {
							order = 1000,
							name = string.format( "%s / %s", ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY"] ),
							type = "group",
							childGroups = "tab",
							args = {
								upgrade = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_UPGRADE"],
									type = "group",
									args = {
										show = {
											order = 10,
											name = ArkInventory.Localise["ENABLED"],
											desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_DESC"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_TEXT"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_UPGRADE"] ) ),
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.upgradeicon.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.upgradeicon.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										anchor = {
											order = 20,
											name = ArkInventory.Localise["ANCHOR"],
											desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_TEXT"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_UPGRADE"] ), "" ),
											type = "select",
											values = anchorpoints5,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.upgradeicon.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.upgradeicon.anchor
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.slot.upgradeicon.anchor ~= v then
													style.slot.upgradeicon.anchor = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
												end
											end,
										},
										size = {
											order = 30,
											name = ArkInventory.Localise["SIZE"],
											type = "range",
											min = 8,
											max = 32,
											step = 1,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.upgradeicon.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.upgradeicon.size
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												local v = math.floor( v )
												if v < 8 then v = 8 end
												if v > 32 then v = 32 end
												if style.slot.upgradeicon.size ~= v then
													style.slot.upgradeicon.size = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
												end
											end,
										},
									},
								},
								junk = {
									order = 100,
									name = ArkInventory.Localise["JUNK"],
									type = "group",
									args = {
										show = {
											order = 10,
											name = ArkInventory.Localise["ENABLED"],
											desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_DESC"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_TEXT"], ArkInventory.Localise["JUNK"] ) ),
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.junkicon.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.junkicon.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										anchor = {
											order = 20,
											name = ArkInventory.Localise["ANCHOR"],
											desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_TEXT"], ArkInventory.Localise["JUNK"] ), "" ),
											type = "select",
											values = anchorpoints5,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.junkicon.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.junkicon.anchor
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.slot.junkicon.anchor ~= v then
													style.slot.junkicon.anchor = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
												end
											end,
										},
										size = {
											order = 30,
											name = ArkInventory.Localise["SIZE"],
											type = "range",
											min = 8,
											max = 32,
											step = 1,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.junkicon.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.junkicon.size
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												local v = math.floor( v )
												if v < 8 then v = 8 end
												if v > 32 then v = 32 end
												if style.slot.junkicon.size ~= v then
													style.slot.junkicon.size = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
												end
											end,
										},
									},
								},
								quest = {
									order = 100,
									name = ArkInventory.Localise["QUEST"],
									type = "group",
									args = {
										border = {
											order = 10,
											name = ArkInventory.Localise["BORDER"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_QUEST_BORDER_DESC"],
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.quest.border
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.quest.border = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										bang = {
											order = 20,
											name = string.format( "%s (!)", ArkInventory.Localise["ICON"] ),
											desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_DESC"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_TEXT"], ArkInventory.Localise["QUEST"] ), "" ),
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.quest.bang
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.quest.bang = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										anchor = {
											order = 30,
											name = ArkInventory.Localise["ANCHOR"],
											desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_TEXT"], ArkInventory.Localise["QUEST"] ), "" ),
											type = "select",
											values = anchorpoints5,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.quest.bang
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.quest.anchor
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.slot.quest.anchor ~= v then
													style.slot.quest.anchor = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
												end
											end,
										},
										size = {
											order = 40,
											name = ArkInventory.Localise["SIZE"],
											type = "range",
											min = 8,
											max = 32,
											step = 1,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.quest.bang
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.quest.size
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												local v = math.floor( v )
												if v < 12 then v = 12 end
												if v > 32 then v = 32 end
												if style.slot.quest.size ~= v then
													style.slot.quest.size = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
												end
											end,
										},
									},
								},
								-- overlays
								azerite = {
									order = 100,
									name = ArkInventory.Localise["AZERITE"],
									type = "group",
									hidden = not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.BFA ),
									args = {
										show = {
											order = 10,
											name = ArkInventory.Localise["ENABLED"],
											desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_DESC"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_TEXT"], ArkInventory.Localise["AZERITE"] ) ),
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.overlay.azerite.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.overlay.azerite.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
									},
								},
								cosmetic = {
									order = 100,
									name = ArkInventory.Localise["COSMETIC"],
									type = "group",
									args = {
										show = {
											order = 10,
											name = ArkInventory.Localise["ENABLED"],
											desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_DESC"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_TEXT"], ArkInventory.Localise["COSMETIC"] ) ),
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.overlay.cosmetic.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.overlay.cosmetic.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
									},
								},
								nzoth = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_NZOTH"],
									type = "group",
									hidden = not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.BFA ),
									args = {
										show = {
											order = 10,
											name = ArkInventory.Localise["ENABLED"],
											desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_DESC"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_TEXT"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_NZOTH"] ) ),
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.overlay.nzoth.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.overlay.nzoth.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										anchor = {
											order = 20,
											name = ArkInventory.Localise["ANCHOR"],
											desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_UPGRADE"], "" ),
											type = "select",
											values = anchorpoints5,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.overlay.nzoth.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.overlay.nzoth.anchor
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.slot.overlay.nzoth.anchor ~= v then
													style.slot.overlay.nzoth.anchor = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
												end
											end,
										},
										size = {
											order = 30,
											name = ArkInventory.Localise["SIZE"],
											type = "range",
											min = 8,
											max = 32,
											step = 1,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.overlay.nzoth.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.overlay.nzoth.size
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												local v = math.floor( v )
												if v < 8 then v = 8 end
												if v > 32 then v = 32 end
												if style.slot.overlay.nzoth.size ~= v then
													style.slot.overlay.nzoth.size = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
												end
											end,
										},
									},
								},
								conduit = {
									order = 100,
									name = ArkInventory.Localise["CONDUITS"],
									type = "group",
									hidden = not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.SHADOWLANDS ),
									args = {
										show = {
											order = 10,
											name = ArkInventory.Localise["ENABLED"],
											desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_DESC"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_TEXT"], ArkInventory.Localise["CONDUITS"] ) ),
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.overlay.conduit.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.overlay.conduit.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
									},
								},
								professionrank = {
									order = 100,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK"],
									type = "group",
									hidden = not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.DRAGONFLIGHT ),
									args = {
										show = {
											order = 10,
											name = ArkInventory.Localise["ENABLED"],
											desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_DESC"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_TEXT"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK"] ) ),
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.overlay.professionrank.show
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.overlay.professionrank.show = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										anchor = {
											order = 20,
											name = ArkInventory.Localise["ANCHOR"],
											desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_TEXT"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK"] ), "" ),
											type = "select",
											values = anchorpoints5,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.overlay.professionrank.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.overlay.professionrank.anchor
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.slot.overlay.professionrank.anchor ~= v then
													style.slot.overlay.professionrank.anchor = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
												end
											end,
										},
										size = {
											order = 30,
											name = ArkInventory.Localise["SIZE"],
											desc = string.format( ArkInventory.Localise["ANCHOR_TEXT2"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_STATUSICON_TEXT"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK"] ), "" ),
											type = "range",
											min = 30,
											max = 60,
											step = 1,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.overlay.professionrank.show
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.overlay.professionrank.size
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												local v = math.floor( v )
												if v < 30 then v = 30 end
												if v > 60 then v = 60 end
												if style.slot.overlay.professionrank.size ~= v then
													style.slot.overlay.professionrank.size = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
												end
											end,
										},
										number = {
											order = 40,
											name = ArkInventory.Localise["NUMBER"],
											desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK_NUMBER_DESC"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_TEXT"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK"] ) ),
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.overlay.professionrank.number
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.overlay.professionrank.number = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										custom = {
											order = 50,
											name = ArkInventory.Localise["CUSTOM"],
											desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK_CUSTOM_DESC"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_TEXT"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK"] ) ),
											type = "toggle",
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.overlay.professionrank.custom
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.overlay.professionrank.custom = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
										colour = {
											order = 60,
											name = ArkInventory.Localise["COLOUR"],
											desc = string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK_COLOUR_DESC"], string.format( ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_TEXT"], ArkInventory.Localise["CONFIG_DESIGN_ITEM_OVERLAY_PROFESSIONRANK"] ) ),
											type = "color",
											hasAlpha = false,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return not style.slot.overlay.professionrank.show or not style.slot.overlay.professionrank.custom
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return helperColourGet( style.slot.overlay.professionrank.colour )
											end,
											set = function( info, r, g, b )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												helperColourSet( style.slot.overlay.professionrank.colour, r, g, b )
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
											end,
										},
									},
								},
							},
						},
						stack = {
							order = 1000,
							name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK"],
							type = "group",
							childGroups = "tab",
							args = {
								general = {
									order = 1,
									name = ArkInventory.Localise["GENERAL"],
									type = "group",
									childGroups = "tab",
									args = {
										mode = {
											order = 100,
											name = ArkInventory.Localise["MODE"],
											type = "select",
											values = function( )
												return { [1] = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_LIMIT"], [2] = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_COMPRESS"] }
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.mode or ArkInventory.Const.Slot.Stack.Mode.Limit
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.slot.stack.mode ~= v then
													style.slot.stack.mode = v
													ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
												end
											end,
										},
										limit_enable = {
											order = 200,
											name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_LIMIT"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_LIMIT_DESC"],
											type = "range",
											min = 0,
											max = 5,
											step = 1,
											hidden = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Limit
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.limit.enable or 0
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												local v = math.floor( v )
												if v < 0 then v = 0 end
												if v > 5 then v = 5 end
												style.slot.stack.limit.enable = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
											end,
										},
										
										compress_enable = {
											order = 200,
											name = ArkInventory.Localise["ENABLE"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_COMPRESS_DESC"],
											type = "toggle",
											width = "half",
											hidden = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Compress
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.compress.enable
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.stack.compress.enable = not style.slot.stack.compress.enable
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
											end,
										},
										compress_include_empty = {
											order = 210,
											name = ArkInventory.Localise["EMPTY"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_COMPRESS_INCLUDE_EMPTY_DESC"],
											type = "toggle",
											width = "half",
											hidden = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Compress
											end,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return ( not style.slot.stack.compress.enable )
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.compress.include.empty
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.stack.compress.include.empty = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
											end,
										},
										compress_include_single = {
											order = 220,
											name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_COMPRESS_INCLUDE_SINGLE"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_COMPRESS_INCLUDE_SINGLE_DESC"],
											type = "toggle",
											width = "half",
											hidden = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Compress
											end,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return ( not style.slot.stack.compress.enable )
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.compress.include.single
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.stack.compress.include.single = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
											end,
										},
										compress_include_stack = {
											order = 230,
											name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_COMPRESS_INCLUDE_STACK"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_COMPRESS_INCLUDE_STACK_DESC"],
											type = "toggle",
											width = "half",
											hidden = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Compress
											end,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return ( not style.slot.stack.compress.enable )
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.compress.include.stack
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.stack.compress.include.stack = v
												ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
											end,
										},
										compress_anchor = {
											order = 300,
											name = ArkInventory.Localise["ANCHOR"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_COMPRESS_BAR_ANCHOR_DESC"],
											type = "select",
											width = "half",
											hidden = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Compress
											end,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return ( not style.slot.stack.compress.enable )
											end,
											values = anchorpoints6,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.compress.anchor
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.slot.stack.compress.anchor ~= v then
													style.slot.stack.compress.anchor = v
												end
											end,
										},
										compress_width = {
											order = 400,
											name = ArkInventory.Localise["WIDTH"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_COMPRESS_BAR_WIDTH_DESC"],
											type = "range",
											hidden = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Compress
											end,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return ( not style.slot.stack.compress.enable )
											end,
											min = 3,
											max = 25,
											step = 1,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.compress.bar.width
											end,
											set = function( info, v )
												local v = math.floor( v )
												if v < 3 then v = 3 end
												if v > 25 then v = 25 end
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												if style.slot.stack.compress.bar.width ~= v then
													style.slot.stack.compress.bar.width = v
												end
											end,
										},
										compress_tooltip = {
											order = 500,
											name = ArkInventory.Localise["TOOLTIP"],
											desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_COMPRESS_SLOT_TOOLTIP_DESC"],
											type = "toggle",
											width = "half",
											hidden = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Compress
											end,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return ( not style.slot.stack.compress.enable )
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.compress.tooltip
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.stack.compress.tooltip = v
											end,
										},
										compress_sort = {
											order = 700,
											name = ArkInventory.Localise["CONFIG_SORTING"],
											desc = ArkInventory.Localise["CONFIG_SORTING_WHEN_INSTANT_DESC"],
											type = "toggle",
											width = "half",
											hidden = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Compress
											end,
											disabled = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return ( not style.slot.stack.compress.enable ) or ( style.sort.when == ArkInventory.ENUM.SORTWHEN.ALWAYS )
											end,
											get = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.compress.sort
											end,
											set = function( info, v )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												style.slot.stack.compress.sort = v
											end,
										},
										warning = {
											order = 9999,
											name = "\nWarning - Stack Compression is currently a work in progress, it will probably have weird issues.\n\nPlease use the github issue ticket to send any feedback about the feature.",
											type = "description",
											fontSize = "large",
											width = "full",
											hidden = function( info )
												local id = ConfigGetNodeArg( info, #info - 5 )
												local style = ArkInventory.ConfigInternalDesignGet( id )
												return style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Compress
											end,
										},
									},
								},
								identify_limit = {
									order = 1000,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_IDENTIFY"],
									type = "group",
									childGroups = "tab",
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Limit
									end,
									args = {
										count = {
											order = 1000,
											name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMCOUNT"],
											type = "group",
											childGroups = "tab",
											hidden = false,
											args = {
												enable = {
													order = 100,
													name = ArkInventory.Localise["ENABLE"],
													desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_IDENTIFY_COUNT_ENABLE_DESC"],
													type = "toggle",
													disabled = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return ( style.slot.stack.limit.enable == 0 )
													end,
													get = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return style.slot.stack.limit.identify.count.enable
													end,
													set = function( info, v )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														style.slot.stack.limit.identify.count.enable = v
														ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
													end,
												},
												position = {
													order = 200,
													name = ArkInventory.Localise["POSITION"],
													desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_IDENTIFY_COUNT_POSITION_DESC"],
													type = "select",
													disabled = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return not style.slot.stack.limit.identify.count.enable or style.slot.stack.limit.enable == 0
													end,
													values = function( )
														return { [1] = ArkInventory.Localise["LEFT"], [2] = ArkInventory.Localise["RIGHT"] }
													end,
													get = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return style.slot.stack.limit.identify.count.position or 1
													end,
													set = function( info, v )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														if style.slot.stack.limit.identify.count.position ~= v then
															style.slot.stack.limit.identify.count.position = v
															ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
														end
													end,
												},
											},
										},
									},
								},
								identify_compress = {
									order = 1000,
									name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_IDENTIFY"],
									type = "group",
									childGroups = "tab",
									hidden = function( info )
										local id = ConfigGetNodeArg( info, #info - 4 )
										local style = ArkInventory.ConfigInternalDesignGet( id )
										return style.slot.stack.mode ~= ArkInventory.Const.Slot.Stack.Mode.Compress
									end,
									args = {
										count = {
											order = 100,
											name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_ITEMCOUNT"],
											type = "group",
											childGroups = "tab",
											hidden = false,
											args = {
												enable = {
													order = 100,
													name = ArkInventory.Localise["ENABLE"],
													desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_IDENTIFY_COUNT_ENABLE_DESC"],
													type = "toggle",
													disabled = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return not style.slot.stack.compress.enable
													end,
													get = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return style.slot.stack.compress.identify.count.enable
													end,
													set = function( info, v )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														style.slot.stack.compress.identify.count.enable = v
														ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
													end,
												},
												position = {
													order = 200,
													name = ArkInventory.Localise["POSITION"],
													desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_IDENTIFY_COUNT_POSITION_DESC"],
													type = "select",
													disabled = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return not style.slot.stack.compress.identify.count.enable or not style.slot.stack.compress.enable
													end,
													values = function( )
														return { [1] = ArkInventory.Localise["LEFT"], [2] = ArkInventory.Localise["RIGHT"] }
													end,
													get = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return style.slot.stack.compress.identify.count.position or 1
													end,
													set = function( info, v )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														if style.slot.stack.compress.identify.count.position ~= v then
															style.slot.stack.compress.identify.count.position = v
															ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
														end
													end,
												},
											},
										},
										border = {
											order = 200,
											name = ArkInventory.Localise["BORDER"],
											type = "group",
											childGroups = "tab",
											hidden = false,
											args = {
												enable = {
													order = 100,
													name = ArkInventory.Localise["ENABLE"],
													desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_IDENTIFY_BORDER_DESC"],
													type = "toggle",
													disabled = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return not style.slot.stack.compress.enable
													end,
													get = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return style.slot.stack.compress.identify.border.enable
													end,
													set = function( info, v )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														style.slot.stack.compress.identify.border.enable = v
														ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
													end,
												},
												colour = {
													order = 200,
													name = ArkInventory.Localise["COLOUR"],
													type = "color",
													hasAlpha = true,
													disabled = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return not style.slot.stack.compress.enable and not style.slot.stack.compress.identify.border.enable
													end,
													get = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return helperColourGet( style.slot.stack.compress.identify.border.colour )
													end,
													set = function( info, r, g, b, a )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														helperColourSet( style.slot.stack.compress.identify.border.colour, r, g, b, a )
														ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
													end,
												},
											},
										},
										desaturate = {
											order = 300,
											name = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_IDENTIFY_DESATURATE"],
											type = "group",
											childGroups = "tab",
											hidden = false,
											args = {
												enable = {
													order = 100,
													name = ArkInventory.Localise["ENABLE"],
													desc = ArkInventory.Localise["CONFIG_DESIGN_ITEM_STACK_IDENTIFY_DESATURATE_DESC"],
													type = "toggle",
													disabled = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return not style.slot.stack.compress.enable
													end,
													get = function( info )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														return style.slot.stack.compress.identify.desaturate.enable
													end,
													set = function( info, v )
														local id = ConfigGetNodeArg( info, #info - 6 )
														local style = ArkInventory.ConfigInternalDesignGet( id )
														style.slot.stack.compress.identify.desaturate.enable = v
														ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
													end,
												},
											},
										},
									},
								},
							},
						},
					},
				},
				layout = {
					order = 200,
					name = ArkInventory.Localise["CONFIG_LAYOUT"],
					type = "group",
					args = {
						layout = {
							order = 10,
							name = ArkInventory.Localise["CONFIG_LAYOUT_DESCRIPTION"],
							type = "description",
							fontSize = "medium"
						},
					},
				},
			},
		},
	}
	
	local args = args1.window.args.style.args.status.args.emptytext.args.includeslot.args
	local data = ArkInventory.Const.Slot.Data
	local c = 0
	for k, v in ArkInventory.spairs( ArkInventory.Const.Slot.Data, function(a,b) return ( data[a] and data[a].name or "" ) < ( data[b] and data[b].name or "" ) end ) do
		
		if not v.hide then
			
			if ArkInventory.ClientCheck( v.ClientCheck ) then
				
				c = c + 1
				
				args[tostring( k )] = {
					order = c,
					arg = k,
					name = v.name,
					desc = ArkInventory.Localise["LDB_BAGS_INCLUDE_COUNT_DESC"],
					type = "toggle",
					disabled = function( info )
						local id = ConfigGetNodeArg( info, #info - 6 )
						local style = ArkInventory.ConfigInternalDesignGet( id )
						return not style.status.emptytext.show
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 6 )
						local style = ArkInventory.ConfigInternalDesignGet( id )
						return style.status.emptytext.include[k]
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 6 )
						local style = ArkInventory.ConfigInternalDesignGet( id )
						style.status.emptytext.include[k] = v
						ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
					end,
				}
				
			end
			
		end
		
	end

	
	
	
	
	for id, data in pairs( ArkInventory.db.option.design.data ) do
		
		if ( data.used == "Y" and config.design.show == ArkInventory.ENUM.LIST.SHOW.ACTIVE ) or ( data.used == "D" and config.design.show == ArkInventory.ENUM.LIST.SHOW.DELETED ) then
			
			if not data.system then
				
				local n = data.name
				
				if config.design.sort == ArkInventory.ENUM.LIST.SORTBY.NAME then
					n = string.format( "%s [%04i]", n, id )
				else
					n = string.format( "[%04i] %s", id, n )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					name = n,
					type = "group",
					childGroups = "tab",
					width = "double",
					arg = id,
					args = args1,
				}
				
			end
			
		end
		
	end
	
 end

function ArkInventory.ConfigInternalProfile( )
	
	config.profile.current = config.me.player.data.profile
	
	if config.profile.show == ArkInventory.ENUM.LIST.SHOW.ACTIVE then
		config.profile.selected = config.profile.current
	else
		config.profile.selected = nil
	end
	
	
	local path = ArkInventory.Config.Internal.args.general.args.myprofiles
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_DESC"], ArkInventory.Localise["CONFIG_PROFILE"] ),
			type = "input",
			width = "double",
			disabled = config.profile.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			get = function( )
				return ""
			end,
			set = function( info, v )
				
				local v = string.trim( v )
				
				if string.match( v, ItemStringPattern ) then
					return
				end
				
				ArkInventory.Lib.Dewdrop:Close( )
				ArkInventory.ConfigInternalProfileAdd( v )
				
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SORTBY.NAME] = ArkInventory.Localise["NAME"], [ArkInventory.ENUM.LIST.SORTBY.NUMBER] = ArkInventory.Localise["NUMBER"] }
				return t
			end,
			get = function( info )
				return config.profile.sort
			end,
			set = function( info, v )
				config.profile.sort = v
				--ArkInventory.ConfigRefresh( )
				ArkInventory.ConfigInternalProfile( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SHOW.ACTIVE] = ArkInventory.Localise["ACTIVE"], [ArkInventory.ENUM.LIST.SHOW.DELETED] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return config.profile.show
			end,
			set = function( info, v )
				
				config.profile.show = v
				
				--ArkInventory.ConfigRefresh( )
				ArkInventory.ConfigInternalProfile( )
				
			end,
		},
		list_import = {
			order = 500,
			name = ArkInventory.Localise["IMPORT"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_IMPORT_DESC"], ArkInventory.Localise["CONFIG_PROFILE"] ),
			type = "execute",
			width = "half",
			disabled = ( config.profile.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE ),
			func = function( )
				ArkInventory.Lib.StaticDialog:Spawn( "PROFILE_IMPORT" )
			end,
		},
	}
	
	ArkInventory.ConfigInternalProfileData( path.args )
	
 end

function ArkInventory.ConfigInternalProfileData( path )
	
	local args1 = {
		action_name = {
			order = 100,
			name = ArkInventory.Localise["NAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_NAME_DESC"], ArkInventory.Localise["CONFIG_PROFILE"] ),
			type = "input",
			width = "double",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalProfileGet( id )
				return style.system or config.profile.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalProfileGet( id )
				return style.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalProfileRename( id, v )
				ArkInventory.ConfigInternalProfile( )
			end,
		},
		action_activate = {
			order = 150,
			name = ArkInventory.Localise["ACTIVATE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_ACTIVATE_DESC"], ArkInventory.Localise["CONFIG_PROFILE"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.profile.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				if id == config.profile.current then
					return true
				end
			end,
			func = function( info )
				
				local id = ConfigGetNodeArg( info, #info - 1 )
				
				if id ~= config.profile.current then
					
					config.me.player.data.profile = id
					
					ArkInventory.Lib.Dewdrop:Close( )
					ArkInventory.PlayerInfoSet( )
					ArkInventory.ItemCacheClear( )
					ArkInventory.DatabaseUpgradePostLoad( )
					
					ArkInventory.Tradeskill.OnEnable( )
					
					ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Restart )
					
					ArkInventory.ConfigRefresh( )
					
				end
				
			end,
		},
		action_delete = {
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_DESC"], ArkInventory.Localise["CONFIG_PROFILE"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.profile.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			disabled = function( info )
				
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalProfileGet( id )
				
				if style.system or id == config.profile.current then
					return true
				end
				
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalProfileDelete( id )
			end,
		},
		action_restore = {
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_DESC"], ArkInventory.Localise["CONFIG_PROFILE"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.profile.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local style = ArkInventory.ConfigInternalProfileGet( id )
				return style.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalProfileRestore( id )
			end,
		},
		action_copy = {
			order = 300,
			name = ArkInventory.Localise["COPY_FROM"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_COPY_DESC"], ArkInventory.Localise["CONFIG_PROFILE"] ),
			type = "select",
			width = "double",
			hidden = config.profile.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			values = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local t = { }
				for k, v in pairs( ArkInventory.db.option.profile.data ) do
					if v.used == "Y" and k ~= id then
						local n = v.name
						if v.system then
							n = string.format( "* %s", n )
						end
						n = string.format( "[%04i] %s", k, n )
						t[k] = n
					end
				end
				return t
			end,
			get = function( )
				return ""
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalProfileCopyFrom( v, id )
				ArkInventory.ConfigRefreshFull( )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_DESC"], ArkInventory.Localise["CONFIG_PROFILE"] ),
			type = "execute",
			width = "half",
			hidden = config.profile.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalProfilePurge( id )
			end,
		},
		action_export = {
			order = 500,
			name = ArkInventory.Localise["EXPORT"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_EXPORT_DESC"], ArkInventory.Localise["CONFIG_PROFILE"] ),
			type = "execute",
			width = "half",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local profile = ArkInventory.ConfigInternalProfileGet( id )
				return profile.system or config.profile.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalProfileExport( id )
			end,
		},
		
		info = {
			order = 1000,
			name = ArkInventory.Localise["INFO"],
			type = "group",
			args = {
				info = {
					order = 100,
					name = [[Profiles in ArkInventory are just a container for the Control options for each location (specifically the three Blueprint objects), and a few other settings, they no longer (automatically) do what a typical profile would do (give you a completely different setup)

In most mods you could just change to a different profile and you would end up with a completely different setup but with ArkInventory that may not be the case as the actual config data for each location is stored in those three Blueprint objects, not the profile itself. The profile is just a container.

It is possible to create two (or more) profiles that use the same combination of Blueprint objects and when you switch between them nothing will happen. any changes you make in one will also happen to the other, because they use the same Blueprint objects (which is where the config is actually stored).

If you want your profiles to be completely different then you must use a different Style, Layout and Category Set object in each one.

The reason for those Blueprint objects being separate from the profile is so that they can be shared/re-used across multiple profiles without having to re-enter all the data again. You may want the same layout, but with different sorting, or categories, for another character, and this allows you to do that. It saves you a lot of time, and saves me a lot of data storage/memory usage.]],
					type = "description",
					fontSize = "medium",
					width = "full"
				},
			},
		},
		
		control = {
			order = 2000,
			name = ArkInventory.Localise["CONTROLS"],
			type = "group",
			args = { }, -- computed
		},
		
	}
	
	ArkInventory.ConfigInternalProfileControl( args1.control.args )
	
	for id, data in pairs( ArkInventory.db.option.profile.data ) do
		
		if ( data.used == "Y" and config.profile.show == ArkInventory.ENUM.LIST.SHOW.ACTIVE ) or ( data.used == "D" and config.profile.show == ArkInventory.ENUM.LIST.SHOW.DELETED ) then
			
			if not data.system then
				
				local n = data.name
				
				if config.profile.sort == ArkInventory.ENUM.LIST.SORTBY.NAME then
					n = string.format( "%s [%04i]", n, id )
				else
					n = string.format( "[%04i] %s", id, n )
				end
				
				path[string.format( "%i", id )] = {
					order = 500,
					name = n,
					type = "group",
					childGroups = "tab",
					icon = function( info )
						if id == config.profile.selected then
							return ArkInventory.Const.Texture.CategoryEnabled
						else
							return ""
						end
					end,
					arg = id,
					args = args1,
				}
				
			end
			
		end
		
	end
	
 end

function ArkInventory.ConfigInternalProfileControl( path )
	
	local args1 = {
		
		location = {
			order = 1,
			type = "description",
			fontSize = "large",
			width = "full",
			name = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return ArkInventory.Global.Location[loc_id].Name
			end,
		},
		
		blueprint = {
			order = 100,
			name = ArkInventory.Localise["CONFIG_BLUEPRINT"],
			type = "group",
			args = {
				style = {
					order = 200,
					type = "select",
					name = ArkInventory.Localise["CONFIG_STYLE"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["CONFIG_CONTROL_BLUEPRINT_DESC"], ArkInventory.Global.Location[loc_id].Name, ArkInventory.Localise["CONFIG_STYLE"] )
					end,
					width = "double",
					values = function( info )
						
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						local style = profile.location[loc_id].style
						
						local t = { }
						for id, data in pairs( ArkInventory.db.option.design.data ) do
							
							local n = data.name
							
							if data.system then
								n = string.format( "* %s", n )
							end
							
							if id == style and data.used == "D" then
								n = string.format( "%s%s - (%s)", RED_FONT_COLOR_CODE, n, ArkInventory.Localise["DELETED"] )
							end
							
							if data.used == "Y" or id == style then
								t[id] = string.format( "[%04i] %s", id, n )
							end
							
						end
						
						return t
						
					end,
					get = function( info )
						
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						
						return profile.location[loc_id].style
						
					end,
					set = function( info, v )
						
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						
						profile.location[loc_id].style = v
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Restart )
						
					end,
				},
				style_buffer = {
					order = 201,
					name = "",
					type = "description",
					fontSize = "medium",
					width = "full"
				},
				layout = {
					order = 300,
					type = "select",
					name = ArkInventory.Localise["CONFIG_LAYOUT"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["CONFIG_CONTROL_BLUEPRINT_DESC"], ArkInventory.Global.Location[loc_id].Name, ArkInventory.Localise["CONFIG_LAYOUT"] )
					end,
					width = "double",
					values = function( info )
						
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						local layout = profile.location[loc_id].layout
						
						local t = { }
						for id, data in pairs( ArkInventory.db.option.design.data ) do
							
							local n = data.name
							
							if data.system then
								n = string.format( "* %s", n )
							end
							
							if id == layout and data.used == "D" then
								n = string.format( "%s%s - (%s)", RED_FONT_COLOR_CODE, n, ArkInventory.Localise["DELETED"] )
							end
							
							if data.used == "Y" or id == layout then
								t[id] = string.format( "[%04i] %s", id, n )
							end
							
						end
						
						return t
						
					end,
					get = function( info )
						
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						
						return profile.location[loc_id].layout
						
					end,
					set = function( info, v )
						
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						
						profile.location[loc_id].layout = v
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Restart )
						
					end,
				},
				layout_buffer = {
					order = 301,
					name = "",
					type = "description",
					fontSize = "medium",
					width = "full"
				},
				categoryset = {
					order = 400,
					type = "select",
					name = ArkInventory.Localise["CONFIG_CATEGORY_SET"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["CONFIG_CONTROL_BLUEPRINT_DESC"], ArkInventory.Global.Location[loc_id].Name, ArkInventory.Localise["CONFIG_CATEGORY_SET"] )
					end,
					width = "double",
					values = function( info )
						
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						local catset = profile.location[loc_id].catset
						
						local t = { }
						for id, data in pairs( ArkInventory.db.option.catset.data ) do
							
							local n = data.name
							
							if data.system then
								n = string.format( "* %s", n )
							end
							
							if id == catset and data.used == "D" then
								n = string.format( "%s%s - (%s)", RED_FONT_COLOR_CODE, n, ArkInventory.Localise["DELETED"] )
							end
							
							if data.used == "Y" or id == catset then
								t[id] = string.format( "[%04i] %s", id, n )
							end
							
						end
						
						return t
						
					end,
					get = function( info )
						
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						
						return profile.location[loc_id].catset
						
					end,
					set = function( info, v )
						
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						
						profile.location[loc_id].catset = v
						ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Restart )
						
					end,
				},
			},
		},
		
		general = {
			order = 200,
			name = ArkInventory.Localise["GENERAL"],
			type = "group",
			args = {
				monitor = {
					order = 100,
					type = "toggle",
					name = ArkInventory.Localise["CONFIG_CONTROL_MONITOR"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["CONFIG_CONTROL_MONITOR_DESC"], ArkInventory.Global.Location[loc_id].Name )
					end,
					disabled = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return not ArkInventory.Global.Location[loc_id].canPurge
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return profile.location[loc_id].monitor
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						profile.location[loc_id].monitor = v
						if config.me.profile_id == id then
							ArkInventory.LocationMonitorChanged( loc_id )
						end
					end,
				},
				save = {
					order = 200,
					type = "toggle",
					name = ArkInventory.Localise["SAVE"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["CONFIG_CONTROL_SAVE_DESC"], ArkInventory.Global.Location[loc_id].Name )
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return profile.location[loc_id].save
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						profile.location[loc_id].save = v
						if config.me.profile_id == id then
							ArkInventory.LocationMonitorChanged( loc_id )
						end
					end,
				},
				notify = {
					order = 300,
					type = "toggle",
					name = ArkInventory.Localise["NOTIFY"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["CONFIG_CONTROL_NOTIFY_ERASE_DESC"], ArkInventory.Global.Location[loc_id].Name )
					end,
					disabled = function( info )
		--				local id = ConfigGetNodeArg( info, #info - 4 )
		--				local profile = ArkInventory.ConfigInternalProfileGet( id )
		--				local loc_id = ConfigGetNodeArg( info, #info - 2 )
		--				return profile.location[loc_id].save
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return profile.location[loc_id].notify
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						profile.location[loc_id].notify = v
					end,
				},
				override = {
					order = 400,
					type = "toggle",
					name = ArkInventory.Localise["OVERRIDE"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["CONFIG_CONTROL_OVERRIDE_DESC"], ArkInventory.Const.Program.Name, ArkInventory.Global.Location[loc_id].Name )
					end,
					disabled = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return not ArkInventory.Global.Location[loc_id].canOverride
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return profile.location[loc_id].override
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						
						if id == config.me.profile_id then
							
							if v then
								-- enabling ai for location - hide any opened blizzard frames
								if loc_id == ArkInventory.Const.Location.Bag then
									CloseAllBags( )
								elseif loc_id == ArkInventory.Const.Location.Bank and ArkInventory.Global.Mode.Bank then
									CloseBankFrame( )
								elseif loc_id == ArkInventory.Const.Location.Vault and ArkInventory.Global.Mode.Vault then
									CloseGuildBankFrame( )
								end
							else
								-- disabling ai for location - hide ai frame
								ArkInventory.Frame_Main_Hide( loc_id )
							end
							
							profile.location[loc_id].override = v
							ArkInventory.BlizzardAPIHook( false, true )
							
						end
						
					end,
				},
				special = {
					order = 450,
					type = "toggle",
					name = ArkInventory.Localise["SPECIAL"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["CONFIG_CONTROL_SPECIAL_DESC"], ArkInventory.Const.Program.Name, ArkInventory.Global.Location[loc_id].Name )
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return profile.location[loc_id].special
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						profile.location[loc_id].special = v
					end,
				},
				anchor = {
					order = 500,
					name = ArkInventory.Localise["ANCHOR"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["ANCHOR_TEXT1"], ArkInventory.Global.Location[loc_id].Name )
					end,
					type = "select",
					values = anchorpoints2,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return profile.location[loc_id].anchor.point
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						if profile.location[loc_id].anchor.point ~= v then
							profile.location[loc_id].anchor.point = v
							ArkInventory.Frame_Main_Anchor_Set( loc_id )
						end
					end,
				},
				locked = {
					order = 600,
					type = "toggle",
					name = ArkInventory.Localise["LOCK"],
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( ArkInventory.Localise["CONFIG_CONTROL_ANCHOR_LOCK_DESC"], ArkInventory.Global.Location[loc_id].Name )
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return profile.location[loc_id].anchor.locked
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						profile.location[loc_id].anchor.locked = v
						ArkInventory.Frame_Main_Anchor_Set( loc_id )
					end,
				},
				preload = {
					order = 700,
					type = "toggle",
					name = "pre-load",
					desc = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return string.format( "pre-load the %s window", ArkInventory.Global.Location[loc_id].Name )
					end,
					disabled = function( info )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return not ArkInventory.Global.Location[loc_id].canpreload
					end,
					get = function( info )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						return profile.location[loc_id].preload
					end,
					set = function( info, v )
						local id = ConfigGetNodeArg( info, #info - 4 )
						local profile = ArkInventory.ConfigInternalProfileGet( id )
						local loc_id = ConfigGetNodeArg( info, #info - 2 )
						profile.location[loc_id].preload = v
					end,
				},
			},
		},
		
	}
	
	local args2 = {
		
		monitor = {
			order = 100,
			type = "toggle",
			name = ArkInventory.Localise["CONFIG_CONTROL_MONITOR"],
			desc = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_CONTROL_MONITOR_DESC"], ArkInventory.Global.Location[loc_id].Name )
			end,
			disabled = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return not ArkInventory.Global.Location[loc_id].canPurge
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local profile = ArkInventory.ConfigInternalProfileGet( id )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return profile.location[loc_id].monitor
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local profile = ArkInventory.ConfigInternalProfileGet( id )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				profile.location[loc_id].monitor = v
				if config.me.profile_id == id then
					ArkInventory.LocationMonitorChanged( loc_id )
				end
			end,
		},
		save = {
			order = 200,
			type = "toggle",
			name = ArkInventory.Localise["SAVE"],
			desc = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_CONTROL_SAVE_DESC"], ArkInventory.Global.Location[loc_id].Name )
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local profile = ArkInventory.ConfigInternalProfileGet( id )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return profile.location[loc_id].save
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local profile = ArkInventory.ConfigInternalProfileGet( id )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				profile.location[loc_id].save = v
			end,
		},
		notify = {
			order = 300,
			type = "toggle",
			name = ArkInventory.Localise["NOTIFY"],
			desc = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["CONFIG_CONTROL_NOTIFY_ERASE_DESC"], ArkInventory.Global.Location[loc_id].Name )
			end,
			disabled = function( info )
--				local id = ConfigGetNodeArg( info, #info - 3 )
--				local profile = ArkInventory.ConfigInternalProfileGet( id )
--				local loc_id = ConfigGetNodeArg( info, #info - 1 )
--				return profile.location[loc_id].save
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local profile = ArkInventory.ConfigInternalProfileGet( id )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return profile.location[loc_id].notify
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local profile = ArkInventory.ConfigInternalProfileGet( id )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				profile.location[loc_id].notify = v
			end,
		},
		loadscan = {
			order = 1000,
			name = ArkInventory.Localise["CONFIG_GENERAL_TRADESKILL_LOADSCAN"],
			desc = function( )
				local desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_TRADESKILL_LOADSCAN_DESC"], ArkInventory.Localise["TRADESKILL"], ArkInventory.Localise["TRADESKILLS"] )
				return desc
			end,
			type = "toggle",
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local profile = ArkInventory.ConfigInternalProfileGet( id )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return profile.location[loc_id].loadscan
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 3 )
				local profile = ArkInventory.ConfigInternalProfileGet( id )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				profile.location[loc_id].loadscan = v
			end,
		},
		priority = {
			order = 2000,
			name = ArkInventory.Localise["CONFIG_GENERAL_TRADESKILL_PRIORITY"],
			desc = function( )
				local desc = string.format( ArkInventory.Localise["CONFIG_GENERAL_TRADESKILL_PRIORITY_DESC"], ArkInventory.Localise["TRADESKILL"] )
				desc = string.format( "%s%s", desc, config.isCharacterOptionText )
				return desc
			end,
			type = "select",
			values = function( info )
				local t = { }
				t[0] = string.format( "[%s] %s", 0, ArkInventory.Localise["IGNORE"] )
				for x = 1, ArkInventory.Const.Tradeskill.numPrimary do
					if config.me.player.data.info.tradeskill[x] then
						local skill = ArkInventory.Const.Tradeskill.Data[config.me.player.data.info.tradeskill[x]]
						if skill then
							t[x] = string.format( "[%s] %s", x, skill.text )
						end
					end
					if not t[x] then
						t[x] = string.format( "[%s] %s", x, ArkInventory.Localise["UNKNOWN"] )
					end
				end
				return t
			end,
			get = function( info )
				return config.me.player.data.tradeskill.priority
			end,
			set = function( info, v )
				config.me.player.data.tradeskill.priority = v
				ArkInventory.ItemCacheClear( )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
			end,
		},
	}
	
	
	for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
		if loc_data.canView and ArkInventory.ClientCheck( loc_data.ClientCheck ) then
			path[string.format( "%i", loc_id )] = {
				order = ArkInventory.db.option.ui.sortalpha and 1 or loc_id,
				arg = loc_id,
				name = loc_data.Name,
				type = "group",
				childGroups = "tab",
				args = args1,
			}
		end
	end
	
	local loc_id = ArkInventory.Const.Location.Tradeskill
	local loc_data = ArkInventory.Global.Location[loc_id]
	if ArkInventory.ClientCheck( loc_data.ClientCheck ) then
		path[string.format( "%i", loc_id )] = {
			order = ArkInventory.db.option.ui.sortalpha and 1 or loc_id,
			arg = loc_id,
			name = loc_data.Name,
			type = "group",
			args = args2,
		}
	end
	
 end

function ArkInventory.ConfigInternalAccount( )
	
	local path = ArkInventory.Config.Internal.args.account
	
	path.args = {
		list_add = {
			order = 100,
			name = ArkInventory.Localise["ADD"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_ADD_DESC"], ArkInventory.Localise["ACCOUNT"] ),
			type = "input",
			width = "double",
			disabled = config.account.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			get = function( )
				return ""
			end,
			set = function( info, v )
				
				local v = string.trim( v )
				
				if string.match( v, ItemStringPattern ) then
					return
				end
				
				ArkInventory.Lib.Dewdrop:Close( )
				ArkInventory.ConfigInternalAccountAdd( v )
				ArkInventory.ConfigRefresh( )
				
			end,
		},
		list_sort = {
			order = 200,
			name = ArkInventory.Localise["SORT_BY"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SORTBY.NAME] = ArkInventory.Localise["NAME"], [ArkInventory.ENUM.LIST.SORTBY.NUMBER] = ArkInventory.Localise["NUMBER"] }
				return t
			end,
			get = function( info )
				return config.account.sort
			end,
			set = function( info, v )
				config.account.sort = v
				ArkInventory.ConfigRefresh( )
			end,
		},
		list_show = {
			order = 300,
			name = ArkInventory.Localise["SHOW"],
			type = "select",
			width = "half",
			values = function( )
				local t = { [ArkInventory.ENUM.LIST.SHOW.ACTIVE] = ArkInventory.Localise["ACTIVE"], [ArkInventory.ENUM.LIST.SHOW.DELETED] = ArkInventory.Localise["DELETED"] }
				return t
			end,
			get = function( info )
				return config.account.show
			end,
			set = function( info, v )
				config.account.show = v
				ArkInventory.ConfigRefresh( )
			end,
		},
	}
	
	ArkInventory.ConfigInternalAccountData( path )
	
end

function ArkInventory.ConfigInternalAccountData( path )
	
	local args1 = {
		
		action_name = { 
			order = 100,
			name = ArkInventory.Localise["NAME"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_NAME_DESC"], ArkInventory.Localise["ACCOUNT"] ),
			type = "input",
			width = "double",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalAccountGet( id )
				return cat.system or config.account.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE
			end,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalAccountGet( id )
				return cat.name
			end,
			set = function( info, v )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalAccountRename( id, v )
				ArkInventory.ConfigRefresh( )
			end,
		},
		action_delete = { 
			order = 200,
			name = ArkInventory.Localise["DELETE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_DELETE_DESC"], ArkInventory.Localise["ACCOUNT"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.account.show ~= ArkInventory.ENUM.LIST.SHOW.ACTIVE,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalAccountGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalAccountDelete( id )
			end,
		},
		action_restore = { 
			order = 200,
			name = ArkInventory.Localise["RESTORE"],
			desc = function( info )
				return string.format( ArkInventory.Localise["CONFIG_LIST_RESTORE_DESC"], ArkInventory.Localise["ACCOUNT"] )
			end,
			type = "execute",
			width = "half",
			hidden = config.account.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				local cat = ArkInventory.ConfigInternalAccountGet( id )
				return cat.system
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalAccountRestore( id )
			end,
		},
		action_purge = {
			order = 400,
			name = ArkInventory.Localise["PURGE"],
			desc = string.format( ArkInventory.Localise["CONFIG_LIST_PURGE_DESC"], ArkInventory.Localise["ACCOUNT"] ),
			type = "execute",
			width = "half",
			hidden = config.account.show ~= ArkInventory.ENUM.LIST.SHOW.DELETED,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.ConfigInternalAccountPurge( id )
			end,
		},
		realm = {
			order = 2000,
			name = ArkInventory.Localise["REALM"],
			type = "group",
			childGroups = "tree",
			args = { },
		},
		
	}
	
	ArkInventory.ConfigInternalAccountDataRealm( args1.realm )
	
	-- load account data
	for id, data in pairs( ArkInventory.db.account.data ) do
		
		if ( data.used == "Y" and config.account.show == ArkInventory.ENUM.LIST.SHOW.ACTIVE ) or ( data.used == "D" and config.account.show == ArkInventory.ENUM.LIST.SHOW.DELETED ) then
			
			local n = string.format( "%s [%03i]", data.name, id )
			local o = 500
			
			if config.account.sort == ArkInventory.ENUM.LIST.SORTBY.NUMBER then
				--n = string.format( "%s [%03i]", data.name, id )
				o = id
			end
			
			path.args[string.format( "%i", id )] = {
				order = o,
				name = n,
				type = "group",
				childGroups = "tab",
				arg = id,
				args = args1,
			}
		end
		
	end
	
end

function ArkInventory.ConfigInternalAccountDataRealm( path )
	
	local args1 = {
		character = {
			order = 2000,
			name = ArkInventory.Localise["CHARACTER"],
			type = "group",
			childGroups = "tree",
			hidden = function( info )
			end,
			args = { },
		},
	}
	
	ArkInventory.ConfigInternalAccountDataCharacter( args1.character )
	
	-- load realm data
	for id, data in pairs( ArkInventory.db.player.data ) do
		if data.info.player_id then
			
			local k = data.info.realm
			local o = 500
			local n = data.info.realm
			local a = data.info.realm
			
			if data.info.class == ArkInventory.Const.Class.Account then
				k = data.info.player_id
				o = 100
				n = ArkInventory.Localise["ACCOUNT"]
				a = ArkInventory.Const.Class.Account
			end
			
			path.args[k] = {
				order = o,
				name = n,
				type = "group",
				childGroups = "tab",
				hidden = function( info )
					local account_id = ConfigGetNodeArg( info, #info - 2 )
					return data.info.account_id ~= account_id
				end,
				arg = a,
				args = args1,
			}
			
		end
	end
	
end

function ArkInventory.ConfigInternalAccountDataCharacter( path )
	
	local args2 = {
		action_erase_location = { 
			order = 100,
			name = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				return string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Global.Location[loc_id].Name )
			end,
			desc = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				local player_id = ConfigGetNodeArg( info, #info - 3 )
				local info = ArkInventory.GetPlayerInfo( player_id )
				return string.format( "%s%s", RED_FONT_COLOR_CODE, string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE_DESC"], ArkInventory.Global.Location[loc_id].Name, ArkInventory.DisplayName1( info ) ) )
			end,
			hidden = false,
			type = "execute",
			func = function( info )
				local loc_id = ConfigGetNodeArg( info, #info - 1 )
				local player_id = ConfigGetNodeArg( info, #info - 3 )
				--ArkInventory.Output( "erase [", player_id, "] [", loc_id, "]" )
				ArkInventory.EraseSavedData( player_id, loc_id )
			end,
		},
	}
	
	local args1 = {
		action_erase_all = { 
			order = 200,
			name = string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Localise["ALL"] ),
			desc = function( info )
				local player_id = ConfigGetNodeArg( info, #info - 1 )
				local info = ArkInventory.GetPlayerInfo( player_id )
				return string.format( "%s%s", RED_FONT_COLOR_CODE, string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE_DESC"], ArkInventory.Localise["ALL"], ArkInventory.DisplayName1( info ) ) )
			end,
			type = "execute",
			hidden = false,
			func = function( info )
				local player_id = ConfigGetNodeArg( info, #info - 1 )
				--ArkInventory.Output( "erase [", player_id, "] [everything]" )
				ArkInventory.EraseSavedData( player_id, nil )
			end,
		},
		location = {
			order = 2000,
			name = ArkInventory.Localise["LOCATION"],
			type = "group",
			childGroups = "tree",
			hidden = false,
			args = { },
		},
	}
	
	for k, v in pairs( ArkInventory.Global.Location ) do
		if v.isActive then
			args1.location.args[string.format( "%i", k )] = {
				order = k,
				name = v.Name,
				type = "group",
				childGroups = "tab",
				hidden = function( info )
					local loc_id = ConfigGetNodeArg( info, #info )
					local player_id = ConfigGetNodeArg( info, #info - 2 )
					if ArkInventory.db.player.data[player_id].location[loc_id].slot_count == 0 then
						return true
					end
				end,
				arg = k,
				args = args2,
			}
		end
	end
	
	
	-- load character data
	for player_id, data in pairs( ArkInventory.db.player.data ) do
		if data.info.player_id then
			
			local o = 500
			local n = data.info.name
			local a = data.info.player_id
			
			if data.info.class == ArkInventory.Const.Class.Account then
				o = 100
				n = ArkInventory.Localise["ACCOUNT"]
			elseif data.info.class == ArkInventory.Const.Class.Guild then
				o = 900
			end

			path.args[data.info.player_id] = {
				order = o,
				name = n,
				type = "group",
				childGroups = "tab",
				hidden = function( info )
					
					local account_id = ConfigGetNodeArg( info, #info - 4 )
					local realm = ConfigGetNodeArg( info, #info - 2 )
					
					if account_id == data.info.account_id then
						if data.info.class == ArkInventory.Const.Class.Account then
							if realm == ArkInventory.Const.Class.Account then
								return false
							end
						elseif realm == data.info.realm then
							return false
						end
					end
					
					return true
					
				end,
				arg = a,
				args = args1,
			}
			
		end
	end
	
end


function ArkInventory.ConfigInternalLDBMounts( )
	
	local path = ArkInventory.Config.Internal.args.advanced.args.ldb.args.mounts.args
	
	local loc_id = ArkInventory.Const.Location.Mount
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		path["notmonitored"] = {
			order = 1,
			name = string.format( ArkInventory.Localise["LDB_LOCATION_NOT_MONITORED"], ArkInventory.Global.Location[loc_id].Name ),
			type = "description",
			fontSize = "medium"
		}
		return
	end
	
	
	local args3 = { }
	
	args3["mounttype"] = {
		order = 1,
		name = ArkInventory.Localise["TYPE"],
		type = "select",
		values = function( info )
			
			local index = ConfigGetNodeArg( info, #info - 2 )
			local md = ArkInventory.Collection.Mount.GetMount( index )
			
			local t = { }
			for mountType, k in pairs( ArkInventory.Const.Mount.Types ) do
				t[k] = ArkInventory.Localise[string.upper( string.format( "LDB_MOUNTS_TYPE_%s", mountType ) )]
				if md.mto == k then
					t[k] = string.format( "%s (%s)", t[k], ArkInventory.Localise["DEFAULT"] )
				end
			end
			
			return t
			
		end,
		get = function( info )
			
			local index = ConfigGetNodeArg( info, #info - 2 )
			local md = ArkInventory.Collection.Mount.GetMount( index )
			
			return md.mt
			
		end,
		set = function( info, v )
			
			local index = ConfigGetNodeArg( info, #info - 2 )
			local md = ArkInventory.Collection.Mount.GetMount( index )
			
			--ArkInventory.Output( "new mount correction for ", string.format( "%.12f", md.spellID ), ": ", v )
			
			ArkInventory.db.option.mount.correction[md.spellID] = v
			
			ArkInventory.Collection.Mount.ApplyUserCorrections( )
			
			ArkInventory:SendMessage( "EVENT_ARKINV_LDB_MOUNT_UPDATE_BUCKET" )
			
			local args2 = ConfigGetNodeArg( info, #info - 1 )
			ArkInventory.ConfigInternalLDBMountsUpdate( path, args2 )
			
		end,
	}
	args3["status"] = {
		order = 2,
		type = "select",
		name = ArkInventory.Localise["STATUS"],
		values = function( )
			local t = { ArkInventory.Localise["UNSELECTED"], ArkInventory.Localise["SELECTED"], ArkInventory.Localise["IGNORED"] }
			return t
		end,
		get = function( info )
			
			local mountType = ConfigGetNodeArg( info, #info - 3 )
			
			local index = ConfigGetNodeArg( info, #info - 2 )
			local md = ArkInventory.Collection.Mount.GetMount( index )
			
			local selected = config.me.player.data.ldb.mounts.type[mountType].selected
			if selected[md.spellID] == true then
				return 2
			elseif selected[md.spellID] == false then
				return 3
			else
				return 1
			end
			
		end,
		set = function( info, v )
			
			local mountType = ConfigGetNodeArg( info, #info - 3 )
			
			local index = ConfigGetNodeArg( info, #info - 2 )
			local md = ArkInventory.Collection.Mount.GetMount( index )
			
			local selected = config.me.player.data.ldb.mounts.type[mountType].selected
			
			if v ~= selected[md.spellID] then
				if v == 2 then
					selected[md.spellID] = true
				elseif v == 3 then
					selected[md.spellID] = false
				else
					selected[md.spellID] = nil
				end
				ArkInventory.ConfigInternalLDBMounts( )
			end
			
		end,
	}
	args3["summon"] = {
		order = 9,
		type = "execute",
		name = ArkInventory.Localise["SUMMON"],
		func = function( info )
			local index = ConfigGetNodeArg( info, #info - 2 )
			ArkInventory.Collection.Mount.Summon( index )
		end,
	}
	args3["description"] = {
		order = 999,
		name = function( info )
			local index = ConfigGetNodeArg( info, #info - 2 )
			local md = ArkInventory.Collection.Mount.GetMount( index )
			return "\n" .. md.description
		end,
		type = "description",
		fontSize = "medium",
		width = "full",
	}
	
	
	
	local args2 = { }
	args2["mountname"] = {
		order = 1,
		name = function( info ) 
			local index = ConfigGetNodeArg( info, #info - 1 )
			local md = ArkInventory.Collection.Mount.GetMount( index )
			return string.format( "%s (%s)", md.name, md.spellID )
		end,
		type = "description",
		fontSize = "large"
	}
	args2["capabilities"] = {
		order = 10,
		type = "group",
		name = "",
		inline = true,
		arg = args2,  -- check what this was needed for
		args = args3,
	}
	
	
	path["travelform"] = {
		order = 1,
		name = string.format( ArkInventory.Localise["LDB_MOUNTS_TRAVEL_FORM"], ArkInventory.Localise["SPELL_DRUID_TRAVEL_FORM"] ),
		desc = string.format( ArkInventory.Localise["LDB_MOUNTS_TRAVEL_FORM_DESC"], ArkInventory.Localise["SPELL_DRUID_TRAVEL_FORM"] ),
		type = "toggle",
		disabled = config.me.player.data.info.class ~= "DRUID",
		get = function( info )
			return config.me.player.data.ldb.travelform
		end,
		set = function( info )
			config.me.player.data.ldb.travelform = not config.me.player.data.ldb.travelform
			ArkInventory.SetMountMacro( )
		end,
	}
	path["randomise"] = {
		order = 2,
		name = ArkInventory.Localise["RANDOM"],
		desc = string.format( ArkInventory.Localise["LDB_COMPANION_RANDOMISE_DESC"], ArkInventory.Localise["MOUNT"], ArkInventory.Localise["MOUNTS"] ),
		type = "toggle",
		get = function( info )
			return config.me.player.data.ldb.mounts.randomise
		end,
		set = function( info )
			config.me.player.data.ldb.mounts.randomise = not config.me.player.data.ldb.mounts.randomise
		end,
	}
	
	for mountType, k in pairs( ArkInventory.Const.Mount.Order ) do
		
		path[mountType] = {
			order = k,
			cmdHidden = true,
			type = "group",
			name = ArkInventory.Localise[string.upper( string.format( "LDB_MOUNTS_TYPE_%s", mountType ) )],
			arg = mountType,
		}
		
	end
	
	ArkInventory.ConfigInternalLDBMountsUpdate( path, args2 )
	
end

function ArkInventory.ConfigInternalLDBMountsUpdate( path, args2 )
	
	--if not ArkInventory.Collection.Mount.IsReady( ) then return end
	
	for mountType in pairs( ArkInventory.Const.Mount.Order ) do
		
		if not path[mountType].args then
			path[mountType].args = { }
		end
		
		local selected = config.me.player.data.ldb.mounts.type[mountType].selected
		
		if ArkInventory.Collection.Mount.IsReady( ) then
			
			local mountList = path[mountType].args
			
			mountList["useall"] = {
				order = 1,
				name = ArkInventory.Localise["USE_ALL"],
				desc = string.format( ArkInventory.Localise["LDB_COMPANION_USEALL_DESC"], ArkInventory.Localise["MOUNTS"] ),
				type = "toggle",
				hidden = function( info )
					return mountType == "x"
				end,
				get = function( info )
					return config.me.player.data.ldb.mounts.type[mountType].useall
				end,
				set = function( info )
					config.me.player.data.ldb.mounts.type[mountType].useall = not config.me.player.data.ldb.mounts.type[mountType].useall
					ArkInventory:SendMessage( "EVENT_ARKINV_LDB_MOUNT_UPDATE_BUCKET" )
				end,
			}
			
			mountList["useforland"] = {
				order = 2,
				name = string.format( ArkInventory.Localise["LDB_MOUNTS_USEFORLAND"], ArkInventory.Localise["LDB_MOUNTS_TYPE_L"] ),
				desc = string.format( ArkInventory.Localise["LDB_MOUNTS_USEFORLAND_DESC"], ArkInventory.Localise["LDB_MOUNTS_TYPE_A"], ArkInventory.Localise["LDB_MOUNTS_TYPE_L"] ),
				type = "toggle",
				width = "double",
				hidden = function( info )
					return not ( mountType == "a" )
				end,
				get = function( info )
					return config.me.player.data.ldb.mounts.type.l.useflying
				end,
				set = function( info )
					config.me.player.data.ldb.mounts.type.l.useflying = not config.me.player.data.ldb.mounts.type.l.useflying
				end,
			}
			mountList["dismount"] = {
				order = 3,
				name = ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT"],
				desc = ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT_DESC"],
				type = "toggle",
				width = "double",
				hidden = function( info )
					return not ( mountType == "a" )
				end,
				get = function( info )
					return config.me.player.data.ldb.mounts.type.a.dismount
				end,
				set = function( info )
					config.me.player.data.ldb.mounts.type.a.dismount = not config.me.player.data.ldb.mounts.type.a.dismount
				end,
			}
			mountList["dragonriding"] = {
				order = 4,
				name = ArkInventory.Localise["DRAGONRIDING"],
				desc = ArkInventory.Localise["LDB_MOUNTS_FLYING_DRAGONRIDING_DESC"],
				type = "toggle",
				hidden = function( info )
					return not ( mountType == "a" and ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.DRAGONFLIGHT ) )
				end,
				get = function( info )
					return config.me.player.data.ldb.mounts.dragonriding
				end,
				set = function( info )
					config.me.player.data.ldb.mounts.dragonriding = not config.me.player.data.ldb.mounts.dragonriding
					--ArkInventory.SetMountMacro( )
				end,
			}
			
			for _, md in ArkInventory.Collection.Mount.Iterate( mountType ) do
				
				local icon = ""
				if selected[md.spellID] == true then
					icon = ArkInventory.Const.Texture.List.Selected
				elseif selected[md.spellID] == false then
					icon = ArkInventory.Const.Texture.List.Ignored
				end
				
				local mountKey = tostring( md.index )
				local ok = false
				
				if not ok and md.mt == ArkInventory.Const.Mount.Types[mountType] then
					ok = true
				end
				
				if not ok and mountType == "x" and md.mt ~= md.mto then
					-- show anything that has been changed on the custom tab as well
					ok = true
				end
				
				if ok then
					if not mountList[mountKey] then
						--new mount, add it
						mountList[mountKey] = {
							order = 1000,
							type = "group",
							icon = icon,
							name = md.name,
							arg = md.index,
							args = args2,
						}
					else
						-- mount is already in the list, ignore
					end
				else
					if mountList[mountKey] then
						-- shouldnt be in this list, remove it 
						ArkInventory.Table.Wipe( mountList[mountKey] )
						mountList[mountKey] = nil
					end
				end
				
			end
			
		end
		
	end
	
end


function ArkInventory.ConfigInternalLDBPets( )
	
	local path = ArkInventory.Config.Internal.args.advanced.args.ldb.args.pets.args
	
	path["randomise"] = {
		order = 2,
		name = ArkInventory.Localise["RANDOM"],
		desc = string.format( ArkInventory.Localise["LDB_COMPANION_RANDOMISE_DESC"], ArkInventory.Localise["PET"], ArkInventory.Localise["PETS"] ),
		type = "toggle",
		get = function( info )
			return config.me.player.data.ldb.pets.randomise
		end,
		set = function( info )
			config.me.player.data.ldb.pets.randomise = not config.me.player.data.ldb.pets.randomise
		end,
	}
	
end

function ArkInventory.ConfigInternalUpdateTimer( )
	
	local path = ArkInventory.Config.Internal.args.advanced.args.updatetimer.args
	
	local args1 = {
		event = {
			order = 100,
			name = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				return id
			end,
			type = "description",
			fontSize = "medium",
			width = "full"
		},
		current = {
			order = 200,
			name = ArkInventory.Localise["CURRENT"],
			type = "range",
			min = ArkInventory.Const.UpdateTimer.Min,
			max = ArkInventory.Const.UpdateTimer.Max,
			step = 0.01,
			get = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				return ArkInventory.db.option.updatetimer[id].value or ArkInventory.db.option.updatetimer[id].default
			end,
			set = function( info, v )
				
				local v = math.floor( v * 100 ) / 100
				if v < ArkInventory.Const.UpdateTimer.Min then v = ArkInventory.Const.UpdateTimer.Min end
				if v > ArkInventory.Const.UpdateTimer.Max then v = ArkInventory.Const.UpdateTimer.Max end
				
				local id = ConfigGetNodeArg( info, #info - 1 )
				if ArkInventory.db.option.updatetimer[id].value ~= v then
					
					if ArkInventory.db.option.updatetimer[id].default == v then
						ArkInventory.db.option.updatetimer[id].custom = false
						ArkInventory.db.option.updatetimer[id].value = nil
					else
						ArkInventory.db.option.updatetimer[id].custom = true
						ArkInventory.db.option.updatetimer[id].value = v
					end
					
					ArkInventory.ConfigInternalUpdateTimer( )
					
				end
			end,
		},
		default = {
			order = 9000,
			name = ArkInventory.Localise["DEFAULT"],
			desc = "reset back to default value",
			type = "execute",
			width = "half",
			disabled = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				return not ArkInventory.db.option.updatetimer[id].custom
			end,
			func = function( info )
				local id = ConfigGetNodeArg( info, #info - 1 )
				ArkInventory.db.option.updatetimer[id].custom = false
				ArkInventory.db.option.updatetimer[id].value = nil
				ArkInventory.ConfigInternalUpdateTimer( )
			end,
		},
		warning = {
			order = 9999,
			name = [[

Changes to this value will not apply until after you have reloaded the interface.

There are no descriptions for these events yet, although their name should roughly indicate what they do.  If your value breaks something then come back here and reset it to default.

Typically the lower the value you set the more processing is required as instead of processing two or more events at the same time it could end up processing them individually.

If you have customised the value for an event there will be an icon next to its name so you can easily see which ones have been changed and may need to be reset.

note: if you want to drag the vertical divider over to see more of the name then you will need to, at minimum, click on the drag handle in the bottom right of this window first, then the drag for the divider bar should work.]],
			type = "description",
			fontSize = "medium",
			width = "full"
		},
	}
	
	
	for name, timer in pairs( ArkInventory.db.option.updatetimer ) do
		
		local id = name
		local ignore, ignore, n = string.find( name, "^EVENT_ARKINV_(.+)_BUCKET$" )
		local icon = ""
		
		if timer.custom then
			 icon = ArkInventory.Const.Texture.UpdateTimerCustom
		end
		
		if n then
			path[name] = {
				order = 100,
				icon = icon,
				name = n,
				type = "group",
				childGroups = "tab",
				arg = id,
				args = args1,
			}
		end
		
		
	end
	
end


-- runs on load
ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
