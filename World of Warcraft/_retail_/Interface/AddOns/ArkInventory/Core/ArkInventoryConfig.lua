local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


function ArkInventory.GenerateGUID( )
	local id = UnitGUID( "player" )
	id = string.sub( id, string.find( id, "-" ) + 1 )
	id = string.upper( string.format( "%s-%s-%04x-%04x-%04x", id, date("%Y%m%d%H%M%S"), math.random( 0, 0xFFFF ), math.random( 0, 0xFFFF ), math.random( 0, 0xFFFF ) ) )
	return id
end

function ArkInventory.Frame_Config_Hide( )
	
	ArkInventory.Lib.StaticDialog:Dismiss( "PROFILE_EXPORT" )
	ArkInventory.Lib.StaticDialog:Dismiss( "PROFILE_IMPORT" )
	
	return ArkInventory.Lib.Dialog:Close( ArkInventory.Const.Frame.Config.Internal )
	
end
	
function ArkInventory.Frame_Config_Show( ... )
	
	if not ArkInventory.LoadAddOn( "ArkInventoryConfig" ) then return end
	
	ArkInventory.Config.Frame = ArkInventory.Lib.Dialog:Open( ArkInventory.Const.Frame.Config.Internal, ... )
	
end

function ArkInventory.Frame_Config_Toggle( )
	if not ArkInventory.Frame_Config_Hide( ) then
		ArkInventory.Frame_Config_Show( )
	end
end

function ArkInventory.ConfigBlizzard( )
	
	local path = ArkInventory.Config.Blizzard
	
	path.args = {
		version = {
			order = 100,
			name = ArkInventory.Global.Version,
			type = "description",
		},
		notes = {
			order = 200,
			name = function( )
				local t = ArkInventory.CrossClient.GetAddOnMetadata( ArkInventory.Const.Program.Name, string.format( "Notes-%s", GetLocale( ) ) ) or ""
				if t == "" then
					t = ArkInventory.CrossClient.GetAddOnMetadata( ArkInventory.Const.Program.Name, "Notes" ) or ""
				end
				return t or ""
			end,
			type = "description",
		},
		config = {
			order = 300,
			name = ArkInventory.Localise["CONFIG"],
			desc = ArkInventory.Localise["CONFIG_DESC"],
			type = "execute",
			func = function( )
				ArkInventory.Frame_Config_Show( )
			end,
		},
		enabled = {
			order = 400,
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
		debug = {
			order = 500,
			name = ArkInventory.Localise["DEBUG"],
			type = "toggle",
			get = function( info )
				return ArkInventory.Global.Debug
			end,
			set = function( info, v )
				ArkInventory.OutputDebugModeSet( not ArkInventory.Global.Debug )
			end,
		},
		
		-- slash commands
		
		restack = {
			guiHidden = true,
			order = 9000,
			type = "execute",
			name = ArkInventory.Localise["RESTACK"],
			desc = ArkInventory.Localise["RESTACK_DESC"],
			func = function( )
				ArkInventory.Restack( ArkInventory.Const.Location.Bag )
			end,
		},
		
		cache = {
			guiHidden = true,
			order = 9000,
			name = ArkInventory.Localise["SLASH_CACHE"],
			desc = ArkInventory.Localise["SLASH_CACHE_DESC"],
			type = "group",
			args = {
				erase = {
					name = ArkInventory.Localise["SLASH_CACHE_ERASE"],
					desc = ArkInventory.Localise["SLASH_CACHE_ERASE_DESC"],
					type = "group",
					args = {
						confirm = {
							name = ArkInventory.Localise["SLASH_CACHE_ERASE_CONFIRM"],
							desc = ArkInventory.Localise["SLASH_CACHE_ERASE_CONFIRM_DESC"],
							type = "execute",
							func = function( )
								ArkInventory.EraseSavedData( )
							end,
						},
					},
				},
			},
		},
		
		edit = {
			guiHidden = true,
			order = 9000,
			name = ArkInventory.Localise["MENU_ACTION_EDITMODE"],
			type = "execute",
			func = function( )
				ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
				ArkInventory.ToggleEditMode( )
			end,
		},
		
		rules = {
			guiHidden = true,
			order = 9000,
			name = ArkInventory.Localise["RULES"],
			type = "execute",
			func = function( )
				ArkInventory.Frame_Rules_Toggle( )
			end,
		},
		
		search = {
			guiHidden = true,
			order = 9000,
			name = ArkInventory.Localise["SEARCH"],
			type = "execute",
			func = function( )
				ArkInventory.Search.Frame_Toggle( )
			end,
		},
		
		track = {
			guiHidden = true,
			order = 9000,
			name = ArkInventory.Localise["SLASH_TRACK"],
			desc = ArkInventory.Localise["SLASH_TRACK_DESC"],
			type = "input",
			set = function( info, v )
				
				local a = ArkInventory.GetObjectInfo( v )
				
				if not a.name or not a.h then
					ArkInventory.OutputWarning( "no matching item found: ", v )
					return
				end
				
				if a.class ~= "item" then
					ArkInventory.OutputWarning( "not an item: ", v )
					return
				end
				
				local me = ArkInventory.GetPlayerCodex( )
				
				if ArkInventory.db.option.tracking.items[a.id] then
					--remove
					ArkInventory.db.option.tracking.items[a.id] = nil
					me.player.data.ldb.tracking.item.tracked[a.id] = false
					ArkInventory.Output( string.format( ArkInventory.Localise["SLASH_TRACK_REMOVE_DESC"], a.h ) )
				else
					--add
					ArkInventory.db.option.tracking.items[a.id] = true
					me.player.data.ldb.tracking.item.tracked[a.id] = true
					ArkInventory.Output( string.format( ArkInventory.Localise["SLASH_TRACK_ADD_DESC"], a.h ) )
				end
				
				ArkInventory:SendMessage( "EVENT_ARKINV_LDB_ITEM_UPDATE_BUCKET" )
				
			end,
		},
		
		translate = {
			guiHidden = true,
			order = 9000,
			name = "translate", -- ArkInventory.Localise["MENU_ACTION_EDITMODE"], -- TODO FIX
			desc = "attempts to get translations from the game again, a ui reload might be better",
			type = "execute",
			func = function( )
				ArkInventory.TranslateTryAgain( )
			end,
		},
		
		reposition = {
			guiHidden = true,
			order = 9000,
			name = "Reposition",
			desc = "repositions all arkinventory frames inside the game window, if the frame is already fully inside then it wont move",
			type = "execute",
			func = function( )
				ArkInventory.Frame_Main_Reposition_All( )
			end,
		},
		
		summon = {
			guiHidden = true,
			order = 9000,
			name = "summon a pet or mount",
			type = "group",
			args = {
				mount = {
					order = 100,
					name = ArkInventory.Localise["LDB_MOUNTS_SUMMON"],
					type = "execute",
					func = function( )
						ArkInventory.LDB.Mounts:OnClick( )
					end,
				},
				pet = {
					order = 100,
					name = ArkInventory.Localise["LDB_COMPANION_SUMMON"],
					type = "execute",
					func = function( )
						ArkInventory.LDB.Pets:OnClick( )
					end,
				},
			},
		},
		
--[[
		db = {
			guiHidden = true,
			order = 9000,
			name = ArkInventory.Localise["SLASH_DB"],
			desc = ArkInventory.Localise["SLASH_DB_DESC"],
			type = "group",
			args = {
				reset = {
					name = ArkInventory.Localise["SLASH_DB_RESET"],
					desc = ArkInventory.Localise["SLASH_DB_RESET_DESC"],
					type = "group",
					args = {
						confirm = {
							name = ArkInventory.Localise["SLASH_DB_RESET_CONFIRM"],
							desc = ArkInventory.Localise["SLASH_DB_RESET_CONFIRM_DESC"],
							type = "execute",
							func = function( )
								ArkInventory.DatabaseReset( )
							end,
						},
					},
				},
			},
		},
]]--
		
--[[
		petbattlehelp = {
			guiHidden = true,
			cmdHidden = true,
			order = 12000,
			name = "petbattlehelp",
			desc = "attempts to help you pick appropriate battle pets for the current battle",
			type = "execute",
			func = function( )
				ArkInventory:EVENT_ARKINV_BATTLEPET_OPENING_DONE( "MANUAL_COMMAND", "PET_BATTLE_HELP" )
			end,
		},
]]--
		
	}
	
end

function ArkInventory.ToggleShowHiddenItems( )
	
	ArkInventory.Global.Options.ShowHiddenItems = not ArkInventory.Global.Options.ShowHiddenItems
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
end


function ArkInventory.ConfigInternalGenericCopyFrom( data, src_id, dst_id )
	
	-- copies all data from one object to another (does not create a new object)
	
	if src_id ~= dst_id then
		
		local guid = data[dst_id].guid or ArkInventory.GenerateGUID( )
		local system = data[dst_id].system
		local used = data[dst_id].used
		local name = data[dst_id].name
		
		if system then
			
			ArkInventory.OutputError( "code failure: attempted to copy over a system object" )
			return
			
		else
			
			data[dst_id] = ArkInventory.Table.Copy( data[src_id] )
			
			data[dst_id].guid = guid
			data[dst_id].system = false
			data[dst_id].used = used
			data[dst_id].name = name
			
		end
		
	end
	
	return data[dst_id]
	
end

function ArkInventory.ConfigInternalGenericFindGUID( data, guid )
	if data and guid then
		for k, v in pairs( data ) do
			if v.guid == guid then
				return k, v
			end
		end
	end
end


function ArkInventory.ConfigInternalDesignAdd( name )
	
	local v = ArkInventory.db.option.design
	local p, data = ArkInventory.CategoryGetNext( v )
	
	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_DESC"], ArkInventory.Localise["CONFIG_DESIGN_PLURAL"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_DESC"], ArkInventory.Localise["CONFIG_DESIGN"] ) )
		return
	end
	
	data.guid = ArkInventory.GenerateGUID( )
	data.used = "Y"
	data.name = string.trim( name )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
	return p, data
	
end

function ArkInventory.ConfigInternalDesignGet( id, default )
	
	local id = id
	local defaulted = nil
	
	if not default then
		assert( id, "code error: id is nil" )
		return ArkInventory.db.option.design.data[id]
	end
	
	local data = ArkInventory.ConfigInternalDesignGet( id )
	
	if not data or data.used ~= "Y" then
		defaulted = true
		id = 9999
		data = ArkInventory.ConfigInternalDesignGet( id )
	end
	
	return id, data, defaulted
	
end

function ArkInventory.ConfigInternalDesignFindGUID( guid )
	local data = ArkInventory.db.option.design.data
	return ArkInventory.ConfigInternalGenericFindGUID( data, guid )
end

function ArkInventory.ConfigInternalDesignDelete( id )
	
	local data = ArkInventory.ConfigInternalDesignGet( id )
	data.used = "D"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalDesignRestore( id )
	
	local data = ArkInventory.ConfigInternalDesignGet( id )
	data.used = "Y"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalDesignRename( id, name )
	
	local data = ArkInventory.ConfigInternalDesignGet( id )
	data.name = string.trim( name )
	
end

function ArkInventory.ConfigInternalDesignCopyFrom( src_id, dst_id )
	
	local data = ArkInventory.db.option.design.data
	data = ArkInventory.ConfigInternalGenericCopyFrom( data, src_id, dst_id )
	
	return data
	
end

function ArkInventory.ConfigInternalDesignPurge( id )
	
	local data = ArkInventory.ConfigInternalDesignCopyFrom( 0, id )
	data.guid = false
	data.used = "N"
	data.name = ""
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end


function ArkInventory.ConfigInternalCategoryGet( cat_type, cat_num )
	assert( cat_type, "code error: cat_type is nil" )
	assert( type( cat_type ) == "number", "code error: cat_type is a " .. type( cat_type ) .. ", not a number" )
	assert( cat_num, "code error: cat_num is nil" )
	assert( type( cat_num ) == "number", "code error: cat_num is a " .. type( cat_num ) .. ", not a number" )
	return ArkInventory.db.option.category[cat_type].data[cat_num]
end

function ArkInventory.ConfigInternalCategoryFindGUID( cat_type, guid )
	local data = ArkInventory.db.option.category[cat_type].data
	return ArkInventory.ConfigInternalGenericFindGUID( data, guid )
end


function ArkInventory.ConfigInternalCategoryCustomAdd( name )
	
	local t = ArkInventory.Const.Category.Type.Custom
	local v = ArkInventory.db.option.category[t]
	local p, data = ArkInventory.CategoryGetNext( v )
	
	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM_PLURAL"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM"] ) )
		return
	end
	
	data.guid = ArkInventory.GenerateGUID( )
	data.used = "Y"
	data.name = string.trim( name )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
	ArkInventory.CategoryGenerate( )
	
	return p, data
	
end

function ArkInventory.ConfigInternalCategoryCustomGet( id, default )
	
	local id = id
	
	if not default then
		return ArkInventory.ConfigInternalCategoryGet( ArkInventory.Const.Category.Type.Custom, id )
	end
	
	local data = ArkInventory.ConfigInternalCategoryCustomGet( id )
	
	if not data or data.used ~= "Y" then
		--ArkInventory.OutputWarning( "design ", id, " requested, status=", data.used, ", returning default instead" )
		id = 9999
		data = ArkInventory.ConfigInternalCategoryCustomGet( id )
	end
	
	return id, data
	
end

function ArkInventory.ConfigInternalCategoryCustomDelete( id )
	
	local data = ArkInventory.ConfigInternalCategoryCustomGet( id )
	data.used = "D"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.ConfigInternalCategoryCustomRestore( id )
	
	local data = ArkInventory.ConfigInternalCategoryCustomGet( id )
	data.used = "Y"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.ConfigInternalCategoryCustomRename( id, name )
	
	local data = ArkInventory.ConfigInternalCategoryCustomGet( id )
	data.name = string.trim( name )
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.ConfigInternalCategoryCustomCopyFrom( src_id, dst_id )
	
	local data = ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Custom].data
	data = ArkInventory.ConfigInternalGenericCopyFrom( data, src_id, dst_id )
	
	ArkInventory.CategoryGenerate( )
	
	return data
	
end

function ArkInventory.ConfigInternalCategoryCustomPurge( id )
	
	local data = ArkInventory.ConfigInternalCategoryCustomCopyFrom( 0, id )
	data.guid = false
	data.used = "N"
	data.name = ""
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end


function ArkInventory.ConfigInternalCategoryRuleAdd( name )
	
	local t = ArkInventory.Const.Category.Type.Rule
	local v = ArkInventory.db.option.category[t]
	local p, data = ArkInventory.CategoryGetNext( v )
	
	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_DESC"], ArkInventory.Localise["RULES"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_DESC"], ArkInventory.Localise["CATEGORY_RULE"] ) )
		return
	end
	
	data.guid = ArkInventory.GenerateGUID( )
	data.used = "Y"
	data.name = string.trim( name )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
	ArkInventory.CategoryGenerate( )
	
	return p, data
	
end

function ArkInventory.ConfigInternalCategoryRuleGet( id, default )
	
	local id = id
	
	if not default then
		return ArkInventory.ConfigInternalCategoryGet( ArkInventory.Const.Category.Type.Rule, id )
	end
	
	local data = ArkInventory.ConfigInternalCategoryRuleGet( id )
	
	if not data or data.used ~= "Y" then
		--ArkInventory.OutputWarning( "design ", id, " requested, status=", data and data.used, ", returning default instead" )
		id = 9999
		data = ArkInventory.ConfigInternalCategoryRuleGet( id )
	end
	
	return id, data
	
end

function ArkInventory.ConfigInternalCategoryRuleDelete( id )
	
	local data = ArkInventory.ConfigInternalCategoryRuleGet( id )
	data.used = "D"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.ConfigInternalCategoryRuleRestore( id )
	
	local data = ArkInventory.ConfigInternalCategoryRuleGet( id )
	data.used = "Y"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.ConfigInternalCategoryRuleRename( id, name )
	
	local data = ArkInventory.ConfigInternalCategoryRuleGet( id )
	data.name = string.trim( name )
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.ConfigInternalCategoryRuleCopyFrom( src_id, dst_id )
	local data = ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Rule].data
	data = ArkInventory.ConfigInternalGenericCopyFrom( data, src_id, dst_id )
	return data
end

function ArkInventory.ConfigInternalCategoryRulePurge( id )
	
	local data = ArkInventory.ConfigInternalCategoryRuleCopyFrom( 0, id )
	data.guid = false
	data.used = "N"
	data.name = ""
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalCategoryRuleValidate( id )
	
	--ArkInventory.Output( "validating rule ", id )
	
	if not ArkInventory.Global.Rules.Enabled then return true end
	
	local ok = true
	local em = string.format( ArkInventory.Localise["RULE_FAILED"], id )
	
	if not id then
		return false, string.format( "%s, %s", em, ArkInventory.Localise["RULE_FAILED_KEY_NIL"] )
	end
	
	local data = ArkInventory.ConfigInternalCategoryRuleGet( id )
	
	if not data.name or string.trim( data.name ) == "" then
		em = string.format( "%s, %s", em, ArkInventory.Localise["RULE_FAILED_DESCRIPTION_NIL"] )
		ok = false
	end
	
	if not data.formula or string.trim( data.formula ) == "" then
		
		em = string.format( "%s, %s", em, ArkInventory.Localise["RULE_FAILED_FORMULA_NIL"] )
		ok = false
		
	else
		
		ArkInventoryRules.SetObject( { test_rule=true, class="item", loc_id=ArkInventory.Const.Location.Bag, bag_id=1, slot_id=1, count=1, q=1, sb=ArkInventory.ENUM.BIND.PICKUP, h=string.format("item:%s:::::::", HEARTHSTONE_ITEM_ID ) } )
		
		local p, pem = loadstring( string.format( "return( %s )", data.formula ) )
		
		if not p then
			
			--ArkInventory.Output( "loadstring failed" )
			
			ok = false
			em = string.format( "%s, loadstring failure: %s", em, pem )
			
		else
			
			--ArkInventory.Output( "loadstring ok" )
			
			setfenv( p, ArkInventoryRules.Environment )
			local pok, pem = pcall( p )
			
			if not pok then
				--ArkInventory.Output( "pcall failed" )
				ok = false
				em = string.format( "%s, %s: %s", em, ArkInventory.Localise["RULE_FAILED_FORMULA_BAD"], pem )
			else
				--ArkInventory.Output( "pcall ok" )
			end
			
		end
		
	end
	
	return ok, em
	
end


function ArkInventory.ConfigInternalCategoryActionAdd( name )
	
	local t = ArkInventory.Const.Category.Type.Action
	local v = ArkInventory.db.option.category[t]
	local p, data = ArkInventory.CategoryGetNext( v )
	
	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_DESC"], ArkInventory.Localise["ACTIONS"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_DESC"], ArkInventory.Localise["ACTION"] ) )
		return
	end
	
	data.guid = ArkInventory.GenerateGUID( )
	data.used = "Y"
	data.name = string.trim( name )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
	
	return p, data
	
end

function ArkInventory.ConfigInternalCategoryActionGet( id, default )
	
	local id = id
	
	if not default then
		return ArkInventory.ConfigInternalCategoryGet( ArkInventory.Const.Category.Type.Action, id )
	end
	
	local data = ArkInventory.ConfigInternalCategoryActionGet( id )
	
	if not data or data.used ~= "Y" then
		--ArkInventory.OutputWarning( "design ", id, " requested, status=", data and data.used, ", returning default instead" )
		id = 9999
		data = ArkInventory.ConfigInternalCategoryActionGet( id )
	end
	
	return id, data
	
end

function ArkInventory.ConfigInternalCategoryActionDelete( id )
	
	local data = ArkInventory.ConfigInternalCategoryActionGet( id )
	data.used = "D"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalCategoryActionRestore( id )
	
	local data = ArkInventory.ConfigInternalCategoryActionGet( id )
	data.used = "Y"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalCategoryActionRename( id, name )
	
	local data = ArkInventory.ConfigInternalCategoryActionGet( id )
	data.name = string.trim( name )
	
end

function ArkInventory.ConfigInternalCategoryActionCopyFrom( src_id, dst_id )
	local data = ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Action].data
	data = ArkInventory.ConfigInternalGenericCopyFrom( data, src_id, dst_id )
	return data
end

function ArkInventory.ConfigInternalCategoryActionPurge( id )
	
	local data = ArkInventory.ConfigInternalCategoryActionCopyFrom( 0, id )
	data.guid = false
	data.used = "N"
	data.name = ""
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end



function ArkInventory.ConfigInternalSortMethodMoveDown( id, key )

	local p = false
	local t = ArkInventory.db.option.sort.method.data[id].order
	
	for k, v in ipairs( t ) do
		if key == v.key then
			p = k
			break
		end
	end

	if not p then
		return
	end
	
	if not t[p+1] then
		-- already at the bottom
		return
	end
	
	local x = ArkInventory.Table.Copy( t[p + 1] )
	local y = ArkInventory.Table.Copy( t[p] )
	
	t[p] = ArkInventory.Table.Copy( x )
	t[p + 1] = ArkInventory.Table.Copy( y )
	
end

function ArkInventory.ConfigInternalSortMethodMoveUp( id, key )

	local p = false
	local t = ArkInventory.db.option.sort.method.data[id].order
	
	for k, v in ipairs( t ) do
		if key == v.key then
			p = k
			break
		end
	end

	if not p or p == 1 then
		return
	end
	
	local x = ArkInventory.Table.Copy( t[p - 1] )
	local y = ArkInventory.Table.Copy( t[p] )
	
	t[p] = ArkInventory.Table.Copy( x )
	t[p - 1] = ArkInventory.Table.Copy( y )
	
end

function ArkInventory.ConfigInternalSortMethodGetPosition( id, key )

	local p = nil
	local v = id
	if type( id ) ~= "table" then
		v = ArkInventory.ConfigInternalSortMethodGet( id )
	end
	
	for pos, data in ipairs( v.order ) do
		if data.key == key then
			p = pos
			break
		end
	end
	
	if not p then
		table.insert( v.order, { ["key"] = key } )
		p = #v.order
	end
	
	return p, #v.order, v
	
end

function ArkInventory.ConfigInternalSortMethodCheck( id )
	
	for sid, data in pairs( ArkInventory.db.option.sort.method.data ) do
		
		if id == nil or sid == id then
			
			-- add mising keys to order
			for key in pairs( ArkInventory.Const.SortKeys ) do
				
				local ok = false
				
				for k, v in pairs( data.order ) do
					if key == v.key then
						ok = true
						break
					end
				end
				
				if not ok then
					table.insert( data.order, { ["key"] = key } )
				end
				
			end
			
			-- remove old keys from order
			for k, v in ipairs( data.order ) do
				if not ArkInventory.Const.SortKeys[v.key] then
					table.remove( data.order, k )
				end
			end
			
		end
		
	end
	
end

function ArkInventory.ConfigInternalSortMethodAdd( name )
	
	local v = ArkInventory.db.option.sort.method
	local p, data = ArkInventory.CategoryGetNext( v )
	
	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_DESC"], ArkInventory.Localise["CONFIG_SORTING_METHOD_PLURAL"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_DESC"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] ) )
		return
	end
	
	data.guid = ArkInventory.GenerateGUID( )
	data.used = "Y"
	data.name = string.trim( name )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
	ArkInventory.ConfigInternalSortMethodCheck( p )
	
	return p, data
	
end

function ArkInventory.ConfigInternalSortMethodGet( id, default )
	
	local id = id
	
	if not default then
		assert( id, "code error: id is nil" )
		return ArkInventory.db.option.sort.method.data[id]
	end
	
	local data = ArkInventory.ConfigInternalSortMethodGet( id )
	
	if not data or data.used ~= "Y" then
		--ArkInventory.OutputWarning( "design ", id, " requested, status=", data.used, ", returning default instead" )
		id = 9999
		data = ArkInventory.ConfigInternalSortMethodGet( id )
	end
	
	return id, data
	
end

function ArkInventory.ConfigInternalSortMethodFindGUID( guid )
	local data = ArkInventory.db.option.sort.method.data
	return ArkInventory.ConfigInternalGenericFindGUID( data, guid )
end

function ArkInventory.ConfigInternalSortMethodDelete( id )
	
	local data = ArkInventory.ConfigInternalSortMethodGet( id )
	data.used = "D"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalSortMethodRestore( id )
	
	local data = ArkInventory.ConfigInternalSortMethodGet( id )
	data.used = "Y"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalSortMethodRename( id, name )
	
	local data = ArkInventory.ConfigInternalSortMethodGet( id )
	data.name = string.trim( name )
	
end

function ArkInventory.ConfigInternalSortMethodCopyFrom( src_id, dst_id )
	
	local data = ArkInventory.db.option.sort.method.data
	data = ArkInventory.ConfigInternalGenericCopyFrom( data, src_id, dst_id )
	
	return data
	
end

function ArkInventory.ConfigInternalSortMethodPurge( id )
	
	local data = ArkInventory.ConfigInternalSortMethodCopyFrom( 0, id )
	data.guid = false
	data.used = "N"
	data.name = ""
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end


function ArkInventory.ConfigInternalCategorysetAdd( name )
	
	local v = ArkInventory.db.option.catset
	local p, data = ArkInventory.CategoryGetNext( v )
	
	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_SET_PLURAL"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] ) )
		return
	end
	
	data.guid = ArkInventory.GenerateGUID( )
	data.used = "Y"
	data.name = string.trim( name )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
	return p, data
	
end

function ArkInventory.ConfigInternalCategorysetFindGUID( guid )
	local data = ArkInventory.db.option.catset.data
	return ArkInventory.ConfigInternalGenericFindGUID( data, guid )
end

function ArkInventory.ConfigInternalCategorysetGet( id, default )
	
	local id = id
	local defaulted = nil
	
	if not default then
		assert( id, "code error: id is nil" )
		return ArkInventory.db.option.catset.data[id]
	end
	
	local data = ArkInventory.ConfigInternalCategorysetGet( id )
	
	if not data or data.used ~= "Y" then
		--ArkInventory.OutputWarning( "categoryset ", id, " is either missing or deleted. the default will be used instead" )
		defaulted = true
		id = 9999
		data = ArkInventory.ConfigInternalCategorysetGet( id )
	end
	
	return id, data, defaulted
	
end

function ArkInventory.ConfigInternalCategorysetDelete( id )
	
	local data = ArkInventory.ConfigInternalCategorysetGet( id )
	data.used = "D"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalCategorysetRestore( id )
	
	local data = ArkInventory.ConfigInternalCategorysetGet( id )
	data.used = "Y"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalCategorysetRename( id, name )
	
	local data = ArkInventory.ConfigInternalCategorysetGet( id )
	data.name = string.trim( name )
	
end

function ArkInventory.ConfigInternalCategorysetCopyFrom( src_id, dst_id )
	local data = ArkInventory.db.option.catset.data
	data = ArkInventory.ConfigInternalGenericCopyFrom( data, src_id, dst_id )
	return data
end

function ArkInventory.ConfigInternalCategorysetPurge( id )
	
	local data = ArkInventory.ConfigInternalCategorysetCopyFrom( 0, id )
	data.guid = false
	data.used = "N"
	data.name = ""
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end


function ArkInventory.ConfigInternalAccountAdd( name )
	
	local v = ArkInventory.db.account
	local p, data = ArkInventory.CategoryGetNext( v )
	
	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_DESC"], ArkInventory.Localise["CONFIG_CATEGORY_SET_PLURAL"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_DESC"], ArkInventory.Localise["ACCOUNT"] ) )
		return
	end
	
	data.used = "Y"
	data.name = string.trim( name )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
	return p, data
	
end

function ArkInventory.ConfigInternalAccountGet( id, default )
	
	local id = id
	
	if not default then
		assert( id, "code error: id is nil" )
		return ArkInventory.db.account.data[id]
	end
	
	local data = ArkInventory.ConfigInternalAccountGet( id )
	
	if not data or data.used ~= "Y" then
		--ArkInventory.OutputWarning( "design ", id, " requested, status=", data.used, ", returning default instead" )
		id = 999
		data = ArkInventory.ConfigInternalAccountGet( id )
	end
	
	return id, data
	
end

function ArkInventory.ConfigInternalAccountDelete( id )
	
	local data = ArkInventory.ConfigInternalAccountGet( id )
	data.used = "D"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalAccountRestore( id )
	
	local data = ArkInventory.ConfigInternalAccountGet( id )
	data.used = "Y"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalAccountRename( id, name )
	
	local data = ArkInventory.ConfigInternalAccountGet( id )
	data.name = string.trim( name )
	
end

function ArkInventory.ConfigInternalAccountCopyFrom( src_id, dst_id )
	local data = ArkInventory.db.account.data
	data = ArkInventory.ConfigInternalGenericCopyFrom( data, src_id, dst_id )
	return data
end

function ArkInventory.ConfigInternalAccountPurge( id )
	
	local data = ArkInventory.ConfigInternalAccountCopyFrom( 0, id )
	data.guid = false
	data.used = "N"
	data.name = ""
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end


function ArkInventory.ConfigInternalProfileAdd( name )
	
	local v = ArkInventory.db.option.profile
	local p, data = ArkInventory.CategoryGetNext( v )
	
	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_DESC"], ArkInventory.Localise["CONFIG_PROFILE_PLURAL"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_DESC"], ArkInventory.Localise["CONFIG_PROFILE"] ) )
		return
	end
	
	data.guid = ArkInventory.GenerateGUID( )
	data.used = "Y"
	data.name = string.trim( name )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
	return p, data
	
end

function ArkInventory.ConfigInternalProfileGet( id, default )
	
	local id = id
	
	if not default then
		assert( id, "code error: id is nil" )
		return ArkInventory.db.option.profile.data[id]
	end
	
	local data = ArkInventory.ConfigInternalProfileGet( id )
	
	if not data or data.used ~= "Y" then
		--ArkInventory.OutputWarning( "design ", id, " requested, status=", data.used, ", returning default instead" )
		id = 9999
		data = ArkInventory.ConfigInternalProfileGet( id )
	end
	
	return id, data
	
end

function ArkInventory.ConfigInternalProfileFindGUID( guid )
	local data = ArkInventory.db.option.profile.data
	return ArkInventory.ConfigInternalGenericFindGUID( data, guid )
end

function ArkInventory.ConfigInternalProfileDelete( id )
	
	local data = ArkInventory.ConfigInternalProfileGet( id )
	data.used = "D"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalProfileRestore( id )
	
	local data = ArkInventory.ConfigInternalProfileGet( id )
	data.used = "Y"
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalProfileRename( id, name )
	
	local data = ArkInventory.ConfigInternalProfileGet( id )
	data.name = string.trim( name )
	
end

function ArkInventory.ConfigInternalProfileCopyFrom( src_id, dst_id )
	local data = ArkInventory.db.option.profile.data
	data = ArkInventory.ConfigInternalGenericCopyFrom( data, src_id, dst_id )
	return data
end

function ArkInventory.ConfigInternalProfilePurge( id )
	
	local data = ArkInventory.ConfigInternalProfileCopyFrom( 0, id )
	data.guid = false
	data.used = "N"
	data.name = ""
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalProfileExport( id )
	
	local export = {
		["profile"] = nil,
		["design"] = { },
		["catset"] = { },
		["sort"] = { },
		["cat"] = { },
	}
	
	local design_used = { }
	local catset_used = { }
	local sort_used = { }
	local cat_used = { }
	
	local function export_cat( cat_id )
		if cat_id then
			if cat_used[cat_id] then
				return true
			else
				local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat_id )
				local data = ArkInventory.ConfigInternalCategoryGet( cat_type, cat_num )
				if data then
					if data.system then
						return true
					elseif data.used == "Y" then
						
						export.cat[cat_id] = ArkInventory.Table.Copy( data )
						data = export.cat[cat_id]
						
						cat_used[cat_id] = true
						
						return true
						
					end
				end
			end
		end
	end
	
	local function export_sort( sort_id )
		if sort_id then
			if sort_used[sort_id] then
				return true
			else
				local data = ArkInventory.ConfigInternalSortMethodGet( sort_id )
				if data then
					if data.system then
						return true
					elseif data.used == "Y" then
						
						export.sort[sort_id] = ArkInventory.Table.Copy( data )
						data = export.sort[sort_id]
						
						sort_used[sort_id] = true
						
						return true
						
					end
				end
			end
		end
	end
	
	local function export_design( design_id )
		if design_id then
			if design_used[design_id] then
				return true
			else
				local data = ArkInventory.ConfigInternalDesignGet( design_id )
				if data then
					if data.system then
						return true
					else
						if data.used == "Y" then
							
							export.design[design_id] = ArkInventory.Table.Copy( data )
							data = export.design[design_id]
							
							design_used[design_id] = true
							
							if not export_sort( data.sort.method ) then
								data.sort.method = nil
							end
							
							for k, v in pairs( data.bar.data ) do
								if not export_sort( v.sort.method ) then
									v.sort.method = nil
								end
							end
							
							for k, v in pairs( data.category ) do
								if not export_cat( k ) then
									data.category[k] = nil
								end
							end
							
							return true
							
						end
					end
				end
			end
		end
	end
	
	local function export_catset( catset_id )
		if catset_id then
			if catset_used[catset_id] then
				return true
			else
				data = ArkInventory.ConfigInternalCategorysetGet( catset_id )
				if data then
					if data.system then
						return true
					elseif data.used == "Y" then
						
						export.catset[catset_id] = ArkInventory.Table.Copy( data )
						data = export.catset[catset_id]
						
						catset_used[catset_id] = true
						
						for item_id, v1 in pairs( data.ia ) do
							v1.action = nil
							if v1.assign then
								if not export_cat( v1.assign ) then
									data.ia[item_id].assign = nil
								end
							end
						end
						
						for cat_type, v1 in pairs( data.ca ) do
							for cat_num, v2 in pairs( v1 ) do
								v2.action = nil
								if v2.active then
									local cat_id = ArkInventory.CategoryIdBuild( cat_type, cat_num )
									if not export_cat( cat_id ) then
										v1[cat_num] = nil
									end
								else
									v1[cat_num] = nil
								end
							end
						end
						
						return true
						
					end
				end
			end
		end
	end
	
	
	if true then
		
		local profile = ArkInventory.ConfigInternalProfileGet( id )
		export.profile = ArkInventory.Table.Copy( profile )
		
		-- extract profile data
		for loc_id, loc in pairs( export.profile.location ) do
			export_design( loc.style )
			export_design( loc.layout )
			export_catset( loc.catset )
		end
		
	end
	
	-- cleanup
	
	ArkInventory.Table.removeDefaults( export.profile, ArkInventory.ConfigInternalProfileGet( 0 ) )
	
	for k in pairs( export.design ) do
		ArkInventory.Table.removeDefaults( export.design[k], ArkInventory.ConfigInternalDesignGet( 0 ) )
	end
	
	for k in pairs( export.catset ) do
		ArkInventory.Table.removeDefaults( export.catset[k], ArkInventory.ConfigInternalCategorysetGet( 0 ) )
	end
	
	for k in pairs( export.sort ) do
		ArkInventory.Table.removeDefaults( export.sort[k], ArkInventory.ConfigInternalSortMethodGet( 0 ) )
	end
	
	for k in pairs( export.cat ) do
		local cat_type, cat_id = ArkInventory.CategoryIdSplit( k )
		ArkInventory.Table.removeDefaults( export.cat[k], ArkInventory.ConfigInternalCategoryGet( cat_type, 0 ) )
	end
	
	export = ArkInventory.Lib.Serializer:Serialize( export )
	
	ArkInventory.Lib.StaticDialog:Spawn( "PROFILE_EXPORT", export )
	
end

function ArkInventory.ConfigInternalProfileImport( src )
	
	local src = src or ""
	local ok
	
	ok, src = ArkInventory.Lib.Serializer:Deserialize( src )
	if not ok then
		ArkInventory.OutputError( "failed to deserialize import string" )
		return
	end
	
	if not src.profile or not src.design or not src.sort or not src.catset or not src.cat then
		ArkInventory.OutputError( "import string is not valid" )
		return
	end
	
	local import_text = ""
	
	-- categories
	local cat_used = { }
	for k, v in pairs( src.cat ) do
		
		local cat_type, cat_num = ArkInventory.CategoryIdSplit( k )
		local id, data = ArkInventory.ConfigInternalCategoryFindGUID( cat_type, v.guid )
		if id then
			if cat_type == ArkInventory.Const.Category.Type.Custom then
				data = ArkInventory.ConfigInternalCategoryCustomCopyFrom( 0, id )
				import_text = "updated existing category " .. cat_type .. "!" .. id .. " from " .. k
			elseif cat_type == ArkInventory.Const.Category.Type.Rule then
				data = ArkInventory.ConfigInternalCategoryRuleCopyFrom( 0, id )
				import_text = "updated existing rule " .. cat_type .. "!" .. id .. " from " .. k
			else
				id = 0
			end
		else
			if cat_type == ArkInventory.Const.Category.Type.Custom then
				id, data = ArkInventory.ConfigInternalCategoryCustomAdd( v.name )
				import_text = "added new category " .. cat_type .. "!" .. id .. " from " .. k
			elseif cat_type == ArkInventory.Const.Category.Type.Rule then
				id, data = ArkInventory.ConfigInternalCategoryRuleAdd( v.name )
				import_text = "added new rule " .. cat_type .. "!" .. id .. " from " .. k
			else
				id = 0
			end
		end
		
		if id > 0 and data and not data.system then
			
			--ArkInventory.Output( import_text )
			
			ArkInventory.Table.Merge( v, data )
			cat_used[k] = ArkInventory.CategoryIdBuild( cat_type, id )
			
		end
		
	end
	
	
	-- category sets
	local catset_used = { }
	for k, v in pairs( src.catset ) do
		
		-- remove item actions so they cant be abused
		if v.ia then
			for item_id, v1 in pairs( v.ia ) do
				v1.action = nil
			end
		end
		
		-- remove category actions so they cant be abused
		if v.ca then
			for cat_type, v1 in pairs( v.ca ) do
				for cat_num, v2 in pairs( v1 ) do
					v2.action = nil
				end
			end
		end
		
		
		local id, data = ArkInventory.ConfigInternalCategorysetFindGUID( v.guid )
		if id then
			data = ArkInventory.ConfigInternalCategorysetCopyFrom( 0, id )
			import_text = "updated existing categoryset " .. id .. " from " .. k
		else
			id, data = ArkInventory.ConfigInternalCategorysetAdd( v.name )
			import_text = "added new categoryset " .. id .. " from " .. k
		end
		
		
		
		if id > 0 then
			
			--ArkInventory.Output( import_text )
			
			ArkInventory.Table.Merge( v, data )
			catset_used[k] = id
			
			local tmp = ArkInventory.Table.Copy( data.ia )
			ArkInventory.Table.Clean( data.ia )
			for item_id, v1 in pairs( tmp ) do
				local cat_id = v1.assign
				local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat_id )
				local cat_new = cat_used[cat_id]
				if cat_new then
					data.ia[item_id].assign = cat_new
					--ArkInventory.Output( "assign - mapped category: ", item_id, " = ", cat_id, " > ", cat_new )
				elseif cat_type == ArkInventory.Const.Category.Type.System then
					data.ia[item_id].assign = cat_id
					--ArkInventory.Output( "assign - unmapped system category: ", item_id, " = ", cat_id )
				else
					--ArkInventory.Output( "assign - ignored: ", item_id, " = ", cat_id )
				end
			end
			
			local tmp = ArkInventory.Table.Copy( data.ca )
			ArkInventory.Table.Clean( data.ca )
			for k1, v1 in pairs( tmp ) do
				for k2, v2 in pairs( v1 ) do
					local cat_new = ArkInventory.CategoryIdBuild( k1, k2 )
					cat_new = cat_used[cat_new]
					if cat_new then
						local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat_new )
						data.ca[cat_type][cat_num] = v2
						--ArkInventory.Output( "active - mapped category: ", k1, "+", k2, " > ", cat_new, " = ", v2 )
					elseif k1 == ArkInventory.Const.Category.Type.System then
						data.ca[k1][k2] = v2
						--ArkInventory.Output( "active - unmapped system category: ", k1, "+", k2, " = ", v2 )
					else
						--ArkInventory.Output( "active - ignored: ", k1, "+", k2, " = ", v2 )
					end
				end
			end
			
		end
		
	end
	
	
	-- sort methods
	local sort_used = { }
	for k, v in pairs( src.sort ) do
		
		local id, data = ArkInventory.ConfigInternalSortMethodFindGUID( v.guid )
		if id then
			data = ArkInventory.ConfigInternalSortMethodCopyFrom( 0, id )
			import_text = "updated existing sort method " .. id .. " from " .. k
		else
			id, data = ArkInventory.ConfigInternalSortMethodAdd( v.name )
			import_text = "added new sort method " .. id .. " from " .. k
		end
		
		if id > 0 then
			
			--ArkInventory.Output( import_text )
			
			ArkInventory.Table.Merge( v, data )
			sort_used[k] = id
			
		end
		
	end
	
	
	-- designs
	local design_used = { }
	for k, v in pairs( src.design ) do
		
		local id, data = ArkInventory.ConfigInternalDesignFindGUID( v.guid )
		if id then
			data = ArkInventory.ConfigInternalDesignCopyFrom( 0, id )
			import_text = "updated existing design " .. id .. " from " .. k
		else
			id, data = ArkInventory.ConfigInternalDesignAdd( v.name )
			import_text = "added new design " .. id .. " from " .. k
		end
		
		if id > 0 then
			
			--ArkInventory.Output( import_text )
			
			ArkInventory.Table.Merge( v, data )
			design_used[k] = id
			
			data.sort.method = sort_used[data.sort.method or 0] or 9999
			
			for k1, v1 in pairs( data.bar.data ) do
				v1.sort.method = sort_used[v1.sort.method or 0] or 9999
			end
			
			local tmp = ArkInventory.Table.Copy( data.category )
			ArkInventory.Table.Clean( data.category )
			for cat_id, bar_id in pairs( tmp ) do
				local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat_id )
				local cat_new = cat_used[cat_id]
				if cat_new then
					data.category[cat_new] = bar_id
					--ArkInventory.Output( "design - mapped category: ", cat_id, " > ", cat_new, " = ", bar_id )
				elseif cat_type == ArkInventory.Const.Category.Type.System then
					data.category[cat_id] = bar_id
					--ArkInventory.Output( "design - unmapped system category: ", cat_id, " = ", bar_id )
				else
					--ArkInventory.Output( "design - ignored: ", cat_id, " = ", bar_id )
				end
			end
			
		end
		
	end
	
	
	-- profile
	--ArkInventory.Output( "importing profile ", src.profile.name )
	local v = src.profile
	local id, data = ArkInventory.ConfigInternalProfileFindGUID( v.guid )
	if id then
		--ArkInventory.Output( "updating existing profile" )
		data = ArkInventory.ConfigInternalProfileCopyFrom( 0, id )
	else
		--ArkInventory.Output( "adding new profile" )
		id, data = ArkInventory.ConfigInternalProfileAdd( v.name )
	end
	
	if id > 0 then
		
		ArkInventory.Table.Merge( v, data )
		
		for loc_id, loc in pairs( data.location ) do
			loc.style = design_used[loc.style or 0] or 9999
			loc.layout = design_used[loc.layout or 0] or 9999
			loc.catset = catset_used[loc.catset or 0] or 9999
		end
		
	end
	
	ArkInventory.Output( "imported profile ", src.profile.name )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE", "IMPORT" )
	
end
