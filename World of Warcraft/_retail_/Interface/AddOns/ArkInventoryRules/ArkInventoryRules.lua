
--License: All Rights Reserved, (c) 2009-2023


local _G = _G
local select = _G.select
local pairs = _G.pairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


ArkInventoryRules = LibStub( "AceAddon-3.0" ):NewAddon( "ArkInventoryRules" )

ArkInventoryRules.Object = { }
ArkInventoryRules.System = { } -- system rules

function ArkInventoryRules.ItemCacheClear( )
	ArkInventory.ItemCacheClear( )
end

function ArkInventoryRules.OnInitialize( )
	
	if ArkInventory.TOCVersionFail( true ) then return end
	
	ArkInventoryRules.Tooltip = ArkInventory.TooltipScanInit( "ARKINV_RuleTooltip" )
	
	-- 3rd party addons that require hooking for item updates
	
	-- outfitter: 
	if IsAddOnLoaded( "Outfitter" ) and Outfitter then
		ArkInventoryRules.HookOutfitter( )
	end
	
	-- itemrack: 
	if IsAddOnLoaded( "ItemRack" ) and ItemRack then
		ArkInventoryRules.HookItemRack( )
	end
	
	if ( IsAddOnLoaded( "GearQuipper" ) and gearquipper ) or ( IsAddOnLoaded( "GearQuipper-TBC" ) and gearquipper ) then
		ArkInventoryRules.HookGearQuipper( )
	end
	
	-- scrap: http://wow.curse.com/downloads/wow-addons/details/scrap.aspx
	if IsAddOnLoaded( "Scrap" ) and Scrap then
		
		if Scrap.ToggleJunk then
			
			if ArkInventory.db.option.message.rules.hooked then
				ArkInventory.Output( string.format( "%s: Scrap %s", ArkInventory.Localise["RULES"], ArkInventory.Localise["ENABLED"] ) )
			end
			
			ArkInventory.MySecureHook( "Scrap", "ToggleJunk", ArkInventoryRules.ItemCacheClear )
			
		end
		
	end
	
	-- selljunk: http://wow.curse.com/downloads/wow-addons/details/sell-junk.aspx
	if IsAddOnLoaded( "SellJunk" ) and SellJunk then
		
		if SellJunk.Add and SellJunk.Rem then
			
			if ArkInventory.db.option.message.rules.hooked then
				ArkInventory.Output( string.format( "%s: SellJunk %s", ArkInventory.Localise["RULES"], ArkInventory.Localise["ENABLED"] ) )
			end
			
			ArkInventory.MySecureHook( "SellJunk", "Add", ArkInventoryRules.ItemCacheClear )
			ArkInventory.MySecureHook( "SellJunk", "Rem", ArkInventoryRules.ItemCacheClear )
			
		end
		
	end
	
	-- reagent restocker: http://wow.curse.com/downloads/wow-addons/details/reagent_restocker.aspx
	if IsAddOnLoaded( "ReagentRestocker" ) and ReagentRestocker then
		
		if ReagentRestocker.addItemToSellingList and ReagentRestocker.deleteItem then
			
			if ArkInventory.db.option.message.rules.hooked then
				ArkInventory.Output( string.format( "%s: ReagentRestocker %s", ArkInventory.Localise["RULES"], ArkInventory.Localise["ENABLED"] ) )
			end
			
			ArkInventory.MySecureHook( "ReagentRestocker", "addItemToSellingList", ArkInventoryRules.ItemCacheClear )
			ArkInventory.MySecureHook( "ReagentRestocker", "deleteItem", ArkInventoryRules.ItemCacheClear )
			
		end
		
	end
	
end

function ArkInventoryRules.OnEnable( )
	
	if ArkInventory.TOCVersionFail( true ) then return end
	
	-- update all rules, set non damaged and format correctly, first use of each rule will validate them
	--LEGION TODO
	
	local cat = ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Rule].data
	for k, v in pairs( cat ) do
		v.damaged = false
	end
	
	ArkInventory.MediaFrameDefaultFontSet( ARKINV_Rules )
	
	if ArkInventory.TOCVersionFail( true ) then return end
	
	if ArkInventory.db.option.message.rules.state then
		ArkInventory.Output( string.format( "%s %s", ArkInventory.Localise["RULES"], ArkInventory.Localise["ENABLED"] ) )
	end
	
	ArkInventory.Global.Rules.Enabled = true
	
	ArkInventory.ItemCacheClear( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	--ArkInventory.Frame_Main_DrawStatus( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventoryRules.HookOutfitter( )
	
	if Outfitter:IsInitialized( ) then
		
		Outfitter:RegisterOutfitEvent( "ADD_OUTFIT", ArkInventoryRules.ItemCacheClear )
		Outfitter:RegisterOutfitEvent( "DELETE_OUTFIT", ArkInventoryRules.ItemCacheClear )
		Outfitter:RegisterOutfitEvent( "EDIT_OUTFIT", ArkInventoryRules.ItemCacheClear )
		--Outfitter:RegisterOutfitEvent( "WEAR_OUTFIT", ArkInventoryRules.ItemCacheClear )
		--Outfitter:RegisterOutfitEvent( "UNWEAR_OUTFIT", ArkInventoryRules.ItemCacheClear )
		
		if ArkInventory.db.option.message.rules.hooked then
			ArkInventory.Output( string.format( "%s: Outfitter %s", ArkInventory.Localise["RULES"], ArkInventory.Localise["ENABLED"] ) )
		end
		
		ArkInventory.ItemCacheClear( )
		ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
		--ArkInventory.Frame_Main_DrawStatus( nil, ArkInventory.Const.Window.Draw.Recalculate )
		
	else
		
		C_Timer.After( 3, ArkInventoryRules.HookOutfitter )
		
	end
	
end

function ArkInventoryRules.HookItemRack( )
	
	if ItemRack.DURABILITY_PATTERN then -- find something to tell if itemrack is actually ready - has run InitCore
		
		ArkInventory.MySecureHook( "ItemRack", "EquipSet", ArkInventoryRules.ItemCacheClear )
		ArkInventory.MySecureHook( "ItemRack", "ToggleSet", ArkInventoryRules.ItemCacheClear )
		ArkInventory.MySecureHook( "ItemRack", "UnequipSet", ArkInventoryRules.ItemCacheClear )
		
		if ArkInventory.db.option.message.rules.hooked then
			ArkInventory.Output( string.format( "%s: ItemRack %s", ArkInventory.Localise["RULES"], ArkInventory.Localise["ENABLED"] ) )
		end
		
		ArkInventory.ItemCacheClear( )
		ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
		--ArkInventory.Frame_Main_DrawStatus( nil, ArkInventory.Const.Window.Draw.Recalculate )
		
	else
		
		C_Timer.After( 3, ArkInventoryRules.HookItemRack )
		
	end
	
end

function ArkInventoryRules.HookItemRackOptions( )
	
	if ArkInventory.db.option.message.rules.hooked then
		ArkInventory.Output( string.format( "%s: ItemRackOptions %s", ArkInventory.Localise["RULES"], ArkInventory.Localise["ENABLED"] ) )
	end
	
	ArkInventory.MySecureHook( "ItemRackOpt", "SaveSet", ArkInventoryRules.ItemCacheClear )
	ArkInventory.MySecureHook( "ItemRackOpt", "DeleteSet", ArkInventoryRules.ItemCacheClear )
	
end

function ArkInventoryRules.HookGearQuipper( )
	
	ArkInventory.MySecureHook( "gearquipper", "RefreshSetList", ArkInventoryRules.ItemCacheClear )
	
	if ArkInventory.db.option.message.rules.hooked then
		ArkInventory.Output( string.format( "%s: GearQuipper %s", ArkInventory.Localise["RULES"], ArkInventory.Localise["ENABLED"] ) )
	end
	
	ArkInventory.ItemCacheClear( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	--ArkInventory.Frame_Main_DrawStatus( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventoryRules.OnDisable( )
	
	ArkInventory.Global.Rules.Enabled = false
	
	ArkInventory.ItemCacheClear( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	--ArkInventory.Frame_Main_DrawStatus( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
	if ArkInventory.db.option.message.rules.state then
		ArkInventory.Output( string.format( "%s %s", ArkInventory.Localise["RULES"], ArkInventory.Localise["DISABLED"] ) )
	end
	
end

function ArkInventoryRules.AppliesToItem( i )
	
	if not i then
		return nil
	end
	
	if not ArkInventoryRules.SetObject( i ) then
		return nil
	end
	
	local codex = ArkInventory.GetLocationCodex( i.loc_id )
	ArkInventoryRules.Object.playerinfo = codex.player.data.info
	
	local cat_type = ArkInventory.Const.Category.Type.Rule
	local r = ArkInventory.db.option.category[cat_type].data
	
	local rp, ra, rr
	
	for cat_num in ArkInventory.spairs( r, function( a, b ) return ( r[a].order or 9999 ) < ( r[b].order or 9999 ) end ) do
		
		rp = codex.catset.ca[cat_type][cat_num].active
		ra = r[cat_num]
		
		if rp and ra and ra.used == "Y" and not ra.damaged then
			
			local cr, res = loadstring( string.format( "return( %s )", ra.formula ) )
			
			if not cr then
				
				ArkInventory.OutputWarning( res )
				ArkInventory.OutputWarning( string.format( ArkInventory.Localise["RULE_DAMAGED"], cat_num ) )
				ArkInventory.db.option.category[cat_type].data[cat_num].damaged = true
				
			else
				
				setfenv( cr, ArkInventoryRules.Environment )
				local ok, res = pcall( cr )
				
				if ok then
					
					if res == true then
						return ArkInventory.CategoryIdBuild( cat_type, cat_num )
					end
					
				else
					
					ArkInventory.OutputError( res )
					ArkInventory.OutputWarning( string.format( ArkInventory.Localise["RULE_DAMAGED"], cat_num ) )
					ArkInventory.db.option.category[cat_type].data[cat_num].damaged = true
					
					error( res )
					
				end
				
			end
			
		end
		
	end
	
	return false
	
end


function ArkInventoryRules.System.value_vendorprice( )
	return ( ArkInventoryRules.Object.info.vendorprice or 0 ) * ( ArkInventoryRules.Object.count or 1 )
end

function ArkInventoryRules.System.boolean_bound( ... )
	
	local fn = "bound"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if type( arg ) == "number" then
			
			if arg == ArkInventoryRules.Object.sb then
				return true
			end
			
		else
			
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["NUMBER"] ), 0 )
			
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_soulbound( )
	return ArkInventoryRules.System.boolean_bound( ArkInventory.ENUM.BIND.PICKUP )
end

function ArkInventoryRules.System.boolean_accountbound( )
	return ArkInventoryRules.System.boolean_bound( ArkInventory.ENUM.BIND.ACCOUNT )
end

function ArkInventoryRules.System.boolean_iscraftingreagent( )
	return ArkInventoryRules.Object.osd.info.craft
end

function ArkInventoryRules.System.boolean_itemstring( ... )
	
	local fn = "itemstring"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) == "number" then
			arg = string.format( "item:%s:", arg )
		elseif type( arg ) == "string" then
			arg = string.format( "%s:", arg )
		else
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, string.format( "%s or %s", ArkInventory.Localise["STRING"], ArkInventory.Localise["NUMBER"] ) ), 0 )
		end
		
		local e = string.sub( string.format( "%s:", ArkInventoryRules.Object.info.osd.h ), 1, string.len( arg ) )
--		if ArkInventoryRules.Object.bag_id == 2 then
--			ArkInventory.Output2( string.lower( e ), " == ", string.lower( arg ) )
--		end
		if string.lower( e ) == string.lower( arg ) then
			return true
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_itemtype( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local fn = "itemtype"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) == "number" then
			if ArkInventoryRules.Object.info.itemtypeid and ArkInventoryRules.Object.info.itemtypeid == arg then
				return true
			end
		elseif type( arg ) == "string" then
			if ArkInventoryRules.Object.info.itemtype and string.lower( string.trim( ArkInventoryRules.Object.info.itemtype ) ) == string.lower( string.trim( arg ) ) then
				return true
			end
		else
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, string.format( "%s or %s", ArkInventory.Localise["STRING"], ArkInventory.Localise["NUMBER"] ) ), 0 )
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_itemsubtype( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local fn = "itemsubtype"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) == "number" then
			if ArkInventoryRules.Object.info.itemsubtypeid and ArkInventoryRules.Object.info.itemsubtypeid == arg then
				return true
			end
		elseif type( arg ) == "string" then
			if ArkInventoryRules.Object.info.itemsubtype and string.lower( string.trim( ArkInventoryRules.Object.info.itemsubtype ) ) == string.lower( string.trim( arg ) ) then
				return true
			end
		else
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, string.format( "%s or %s", ArkInventory.Localise["STRING"], ArkInventory.Localise["NUMBER"] ) ), 0 )
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_equip( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	
	local e = string.trim( ArkInventoryRules.Object.info.equiploc )
	if e == "" or ArkInventoryRules.Object.info.itemtypeid == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.PARENT then return false end
	
	
	local ge = string.trim( _G[e] or e )
	if ge == "" then return false end
	
	local fn = "equip"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		
		return true
		
	else
		
		for ax = 1, ac do
			
			local arg = select( ax, ... )
			
			if not arg then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
			end
			
			if type( arg ) ~= "string" then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
			end
			
			if string.lower( e ) == string.lower( string.trim( arg ) ) then
				return true
			end
			
			if string.lower( ge ) == string.lower( string.trim( arg ) ) then
				return true
			end
			
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_name( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local e = string.lower( ArkInventoryRules.Object.info.name or "" )
	if e == "" then return false end
	
	local fn = "name"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end

	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		if string.find( e, string.lower( string.trim( arg ) ) ) then
			return true
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_quality( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local fn = "quality"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	--ArkInventory.Output( ArkInventoryRules.Object.h, " = ", ArkInventoryRules.Object.q )
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if type( arg ) == "number" then
			
			if arg == ArkInventoryRules.Object.info.q then
				return true
			end
			
		elseif type( arg ) == "string" then
			
			if string.lower( string.trim( arg ) ) == string.lower( _G[string.format( "ITEM_QUALITY%d_DESC", ArkInventoryRules.Object.info.q )] or "" ) then
				return true
			end
			
		else
			
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, string.format( "%s or %s", ArkInventory.Localise["STRING"], ArkInventory.Localise["NUMBER"] ) ), 0 )
			
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_expansion( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local fn = "expansion"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		
		if ArkInventory.ENUM.EXPANSION.CURRENT == ArkInventoryRules.Object.info.expansion then
			return true
		end
		
		return false
		
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if type( arg ) == "number" then
			
			if arg == ArkInventoryRules.Object.info.expansion then
				return true
			end
			
		elseif type( arg ) == "string" then
			
			if string.lower( string.trim( arg ) ) == string.lower( _G[string.format( "EXPANSION_NAME%d", ArkInventoryRules.Object.info.expansion )] ) then
				return true
			end
			
		else
			
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, string.format( "%s or %s", ArkInventory.Localise["STRING"], ArkInventory.Localise["NUMBER"] ) ), 0 )
			
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_itemlevelstat( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local e = ArkInventoryRules.Object.info.ilvl or -2
	if e < 0 then return false end
	
	local fn = "itemlevelstat"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	local arg1, arg2 = ...
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	if not arg2 then
		arg2 = arg1
	end
	
	if type( arg2 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, 2, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	if e >= arg1 and e <= arg2 then
		return true
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_itemleveluse( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local e = ArkInventoryRules.Object.info.uselevel or -2
	if e < 0 then return false end
	
	local fn = "itemleveluse"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	local arg1, arg2 = ...
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	if not arg2 then
		arg2 = arg1
	end
	
	if type( arg2 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, 2, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	if e >= arg1 and e <= arg2 then
		return true
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_itemlevelbelowaverage( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	if ( ArkInventoryRules.Object.playerinfo.itemlevel or 1 ) == 1 then
		return false
	end
	
	local e = ArkInventoryRules.Object.info.ilvl or -2
	if e < 1 then return false end
	
	local fn = "itemlevelbelowaverage"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	local arg1, arg2 = ...
	-- arg1 = levels below average to keep
	-- arg2 = minimum level (2 if not set)
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	if arg1 < 1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, 1 ), 0 )
	end
	
	if not arg2 then
		arg2 = 2
	end
	
	if type( arg2 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, 2, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	if arg2 < 1 then
		arg2 = 2
	end
	
	local equip = ArkInventoryRules.System.boolean_equip( )
	if not equip then
		return false
	end
	
	local avgitemlevel = ArkInventory.CrossClient.GetAverageItemLevel( ) or ArkInventoryRules.Object.playerinfo.itemlevel or 1
	
	arg1 = avgitemlevel - arg1
	if arg1 < 2 then
		arg1 = 2
	end
	
	if arg1 < arg2 then
		return false
	end
	
	if e <= arg1 and e >= arg2 then
		return true
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_itemfamily( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local fn = "itemfamily"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if type( arg ) ~= "number" then
			
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["NUMBER"] ), 0 )
			
		elseif ArkInventoryRules.Object.info.itemtypeid ~= ArkInventory.ENUM.ITEM.TYPE.CONTAINER.PARENT then
			
			local it = GetItemFamily( ArkInventoryRules.Object.h ) or 0
			
			if bit.band( it, arg ) > 0 then
				return true
			end
			
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_periodictable( ... )
	
	if not ArkInventoryRules.Object.h or ArkInventoryRules.Object.class ~= "item" then
		return false
	end
	
	local fn = "periodictable"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		if ArkInventory.Lib.PeriodicTable:ItemInSet( ArkInventoryRules.Object.h, string.trim( arg ) ) then
			return true
		end
		
	end
	
end

function ArkInventoryRules.System.boolean_tooltip( ... )
	
	if not ArkInventoryRules.Object.h or ArkInventoryRules.Object.bag_id == nil or ArkInventoryRules.Object.slot_id == nil then
		return false
	end
	
	local fn = "tooltip"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		if ArkInventory.TooltipContains( ArkInventoryRules.Tooltip, nil, string.trim( arg ) ) then
			return true
		end
	
	end
	
	return false

end

function ArkInventoryRules.System.boolean_outfit( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	if ArkInventoryRules.Object.loc_id and ArkInventory.Global.Location[ArkInventoryRules.Object.loc_id].isOffline then
		return false
	end
	
	local e = string.trim( ArkInventoryRules.Object.info.equiploc )
	if e == "" or ArkInventoryRules.Object.info.itemtypeid == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.PARENT then return false end
	
	local fn = "outfit"
	
	local ac = select( '#', ... )
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
	end	
	
	local pass = false
	
	if not pass then
		pass = ArkInventoryRules.System.boolean_outfit_outfitter( ... )
	end
	
	if not pass then
		pass = ArkInventoryRules.System.boolean_outfit_itemrack( ... )
	end
	
	if not pass then
		pass = ArkInventoryRules.System.boolean_outfit_gearquipper( ... )
	end
	
	if not pass then
		pass = ArkInventoryRules.System.boolean_outfit_blizzard( ... )
	end
	
	return pass
	
end

function ArkInventoryRules.System.boolean_outfit_outfitter( ... )
	
	if not ( IsAddOnLoaded( "Outfitter" ) and Outfitter:IsInitialized( ) ) then
		return
	end
	
	local blizzard_id = ArkInventory.InternalIdToBlizzardBagId( ArkInventoryRules.Object.loc_id, ArkInventoryRules.Object.bag_id )
	local ItemInfo = Outfitter:GetBagItemInfo( blizzard_id, ArkInventoryRules.Object.slot_id )
	
	if not ItemInfo then
		ItemInfo = Outfitter:GetItemInfoFromLink( ArkInventoryRules.Object.h )
	end
	
	if not ItemInfo then
		return false
	end
	
	local outfits = Outfitter:GetOutfitsUsingItem( ItemInfo )
	
	if not outfits or next( outfits ) == nil then
		return false
	end
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		return true
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		for _, o in pairs( outfits ) do
			if o and o.Name and string.lower( string.trim( o.Name ) ) == string.lower( string.trim( arg ) ) then
				return true
			end
		end
		
	end
	
	return false

end

function ArkInventoryRules.System.boolean_outfit_itemrack( ... )
	
	-- item rack 3.66
	
	if not ( IsAddOnLoaded( "ItemRack" ) ) then
		return
	end
	
	local outfits = { }
	local osd
	
	for setname, set in pairs( ItemRackUser.Sets ) do
		if setname ~= nil and string.sub( setname, 1, 1 ) ~= "~" then
			--ArkInventory.Output( "setname=[", setname, "]" )
			for k, setitem in pairs( set.equip ) do
				osd = ArkInventory.ObjectStringDecode( string.format( "item:%s", setitem ) )
				--ArkInventory.Output( "pos=[", k, "], item=[", setitem, "]" )
				if ArkInventoryRules.Object.info.osd.h_rule == osd.h_rule then
					table.insert( outfits, string.trim( setname ) )
					--ArkInventory.Output( "added set [", setname, "] for item [", osd.h_rule, "]" )
				end
			end
		end
	end
	
	if not outfits or next( outfits ) == nil then
		return false
	end
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		return true
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		for _, o in pairs( outfits ) do
			if o and string.lower( string.trim( o ) ) == string.lower( string.trim( arg ) ) then
				return true
			end
		end
	
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_outfit_gearquipper( ... )
	
	-- gearquipper - Classic 41 / TBC 7
	
	if not ( IsAddOnLoaded( "GearQuipper" ) or IsAddOnLoaded( "GearQuipper-TBC" ) ) then
		return
	end
	
	local outfits = { }
	local osd
	
	local sets = gearquipper.LoadSetNames( )
	local setitems = gearquipper:GetSlotInfo( )
	local results = nil
	
	for index, setname in pairs( sets ) do
		if setname then
			--ArkInventory.Output( "index=[", index, "] setname=[", setname, "]" )
			results = gearquipper:LoadSet( setname )
			--ArkInventory.Output( "index=[", index, "] setname=[", setname, "] results=[", results, "]" )
			for slot, setitem in pairs( results ) do
				osd = ArkInventory.ObjectStringDecode( setitem )
				--ArkInventory.Output( "slot=[", slot, "], item=[", setitem, "] hs=[", osd.h_rule, "]" )
				if ArkInventoryRules.Object.info.osd.h_rule == osd.h_rule then
					table.insert( outfits, string.trim( setname ) )
					--ArkInventory.Output( "added set [", setname, "] for item [", osd.h_rule, "]" )
				end
			end
		end
	end
	
	if not outfits or next( outfits ) == nil then
		return false
	end
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		return true
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		for _, o in pairs( outfits ) do
			if o and string.lower( string.trim( o ) ) == string.lower( string.trim( arg ) ) then
				return true
			end
		end
	
	end
	
	return false

end

function ArkInventoryRules.System.boolean_outfit_blizzard( ... )
	
	-- blizzard equipment manager
	
	if not ( C_EquipmentSet and C_EquipmentSet.CanUseEquipmentSets and C_EquipmentSet.CanUseEquipmentSets( ) ) then
		return
	end
	
	local equipsets = C_EquipmentSet.GetNumEquipmentSets( )
	if equipsets == 0 then
		return false
	end
	
	local outfits = { }
	local setids = C_EquipmentSet.GetEquipmentSetIDs( )
	
	-- get a list of outfits the item is in
	for setnum, setid in pairs( setids ) do
		local setname = C_EquipmentSet.GetEquipmentSetInfo( setid )
		--ArkInventory.Output( setnum, ": ", setid, " = [", setname, "] [", type( setname ), "]" )
		setname = string.trim( tostring( setname or "" ) )
		
		local items = C_EquipmentSet.GetItemLocations( setid )
		--ArkInventory.Output( items )
		
		if items then
			
			local loc_id, bag_id, slot_id, id, player, bank, bags, void, slot, bag, voidtab, voidslot
			
			for k, location in pairs( items ) do
				
				loc_id = nil
				bag_id = nil
				slot_id = nil
				id = nil
				
				if ArkInventory.Global.Location[ArkInventory.Const.Location.Void].proj then
					player, bank, bags, void, slot, bag, voidtab, voidslot = EquipmentManager_UnpackLocation( location )
				else
					player, bank, bags, slot, bag = EquipmentManager_UnpackLocation( location )
				end
				
				--ArkInventory.Output( setname, ":", k, " -> [", player, ", ", bank, ", ", bags, ", ", void, "] [", bag, ".", slot, "] [", voidtab, ".", voidslot, "] = ", location )
				
				if void and voidtab and voidslot then
					
					loc_id = ArkInventory.Const.Location.Void
					bag_id = ArkInventory.Const.Offset.Void + voidtab
					slot_id = voidslot
					id = GetVoidItemInfo( voidtab, voidslot )
					
					--ArkInventory.Output( setname, ":", k, " -> [void] [", loc_id, ".", bag_id, ".", slot_id, "] [", id, "] = ", location )
					
				elseif ( not bags ) and slot then
					
					loc_id = ArkInventory.Const.Location.Wearing
					bag_id = ArkInventory.Const.Offset.Wearing + 1
					slot_id = slot
					id = GetInventoryItemID( "player", slot )
					
					--ArkInventory.Output( setname, ":", k, " -> [player] [", loc_id, ".", bag_id, ".", slot_id, "] [", id, "] = ", location )
					
				elseif bag and slot then
					
					loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( bag )
					slot_id = slot
					id = ArkInventory.CrossClient.GetContainerItemID( bag, slot )
					
					--ArkInventory.Output( setname, ":", k, " -> [bag] [", loc_id, ".", bag_id, ".", slot_id, "] [", id, "] = ", location )
					
				end
				
				if loc_id and bag_id and slot_id and id and ArkInventoryRules.Object.info.id and ArkInventoryRules.Object.loc_id == loc_id and ArkInventoryRules.Object.bag_id == bag_id and ArkInventoryRules.Object.slot_id == slot_id and id == ArkInventoryRules.Object.info.id then
					--ArkInventory.Output( setname, ":", k, " -> [", ArkInventoryRules.Object.h, " / ", id )
					table.insert( outfits, setname )
					--ArkInventory.Output( "found ", ArkInventoryRules.Object.h, " in set [", setname, ":", k, "] [", ArkInventoryRules.Object.loc_id, ".", ArkInventoryRules.Object.bag_id, ".", ArkInventoryRules.Object.slot_id, "]" )
					break
				end
				
			end
			
		end
		
	end
	
	-- not in any outfit
	if next( outfits ) == nil then
		return false
	end
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		return true
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		for _, o in pairs( outfits ) do
			--if o and string.lower( string.trim( o ) ) == string.lower( string.trim( arg ) ) then
			if o and string.lower( string.trim( o ) ) == string.lower( string.trim( arg ) ) then
				return true
			end
		end
		
	end	
	
	return false

end

function ArkInventoryRules.System.boolean_vendorpriceunder( ... )

	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local fn = "vendorpriceunder"
	
	local arg1 = ...
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	local price = ArkInventoryRules.System.value_vendorprice( )
	if price and price > 0 and price <= arg1 then
		return true
	end
	
end

function ArkInventoryRules.System.boolean_vendorpriceover( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local fn = "vendorpriceover"
	
	local arg1 = ...
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	local price = ArkInventoryRules.System.value_vendorprice( )
	if price and price > 0 and price >= arg1 then
		return true
	end
	
end

function ArkInventoryRules.System.boolean_characterlevelrange( ... )

	-- ( levels below, levels above )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local fn = "characterlevelrange"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	local arg1, arg2 = ...
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	if not arg2 then
		arg2 = arg1
	end
	
	if type( arg2 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, 2, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	local clevel = UnitLevel( "player" )
	local ulevel = ArkInventoryRules.Object.info.uselevel or clevel
	
	arg1 = clevel - arg1
	arg2 = clevel + arg2
	
	if ulevel >= arg1 and ulevel <= arg2 then
		return true
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_bag( ... )
	
	-- note, this rule is now just which *internal* bag an item is in, ie its just a number from 1 to x
	
	local fn = "bag"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "number" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["NUMBER"] ), 0 )
		end
		
		if arg == ArkInventoryRules.Object.bag_id then
			return true
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_location( ... )
	
	if not ArkInventoryRules.Object.loc_id then
		return false
	end
	
	local fn = "location"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		local k = -1
		
		if type( arg ) == "string" then
			
			k = string.lower( string.trim( arg ) )
			
			if k == "bag" or k == string.lower( ArkInventory.Localise["BAG"] ) or k == string.lower( ArkInventory.Localise["BACKPACK"] ) then
				k = ArkInventory.Const.Location.Bag
			elseif k == "bank" or k == string.lower( ArkInventory.Localise["BANK"] ) then
				k = ArkInventory.Const.Location.Bank
			elseif k == "guild bank" or k == "vault" or k == string.lower( ArkInventory.Localise["VAULT"] ) then
				k = ArkInventory.Const.Location.Vault
			elseif k == "mail" or k == string.lower( ArkInventory.Localise["MAIL"] ) or k == string.lower( ArkInventory.Localise["MAILBOX"] ) then
				k = ArkInventory.Const.Location.Mailbox
			elseif k == "wearing" or k == "gear" or k == string.lower( ArkInventory.Localise["LOCATION_WEARING"] ) then
				k = ArkInventory.Const.Location.Wearing
			elseif k == "pet" or k == string.lower( ArkInventory.Localise["PET"] ) then
				k = ArkInventory.Const.Location.Pet
			elseif k == "mount" or k == string.lower( ArkInventory.Localise["MOUNT"] ) then
				k = ArkInventory.Const.Location.Mount
			elseif k == "token" or k == "currency" or k == string.lower( ArkInventory.Localise["CURRENCY"] ) then
				k = ArkInventory.Const.Location.Currency
			elseif k == "reputation" or k == "rep" or k == string.lower( ArkInventory.Localise["REPUTATION"] ) then
				k = ArkInventory.Const.Location.Reputation
			else
				k = -1
			end
			
		elseif type( arg ) == "number" then
			
			k = arg
			
		else
			
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, string.format( "%s or %s", ArkInventory.Localise["STRING"], ArkInventory.Localise["NUMBER"] ) ), 0 )
			
		end
		
		if ArkInventoryRules.Object.loc_id == k then
			return true
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_usable( ignore_known, ignore_level )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local ignore_known = not not ignore_known
	local ignore_level = not not ignore_level
	
	ArkInventory.TooltipSet( ArkInventoryRules.Tooltip, nil, nil, nil, ArkInventoryRules.Object.h )
	return ArkInventory.TooltipCanUse( ArkInventoryRules.Tooltip, nil, ignore_known, ignore_level )
	
end

function ArkInventoryRules.System.internal_unwearable( wearable, ignore_known, ignore_level )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	-- can it be equipped?
	if not ArkInventoryRules.System.boolean_equip( ) then
		return false
	end
	
	-- is there any red text making it unwearable?  ignoring already known and player level requirements
	if not ArkInventoryRules.System.boolean_usable( ignore_known, ignore_level ) then
		if wearable then
			--ArkInventory.Output( "wearable fail 1: ", ArkInventoryRules.Object.h )
			return false
		else
			--ArkInventory.Output( "unwearable pass 1: ", ArkInventoryRules.Object.h )
			return true
		end
	end
	
	
	-- everything past here should be wearable
	
	-- anything that isnt armour is wearable
	if ArkInventoryRules.Object.info.itemtypeid ~= ArkInventory.ENUM.ITEM.TYPE.ARMOR.PARENT then
		if wearable then
			--ArkInventory.Output( "wearable pass 1: ", ArkInventoryRules.Object.h )
			return true
		else
			--ArkInventory.Output( "unwearable fail 0: ", ArkInventoryRules.Object.h )
			return false
		end
	end
	
	-- cloaks are cloth, but everyone can wear them
	if ArkInventoryRules.Object.info.equiploc == "INVTYPE_CLOAK" then
		if wearable then
			return true
		else
			return false
		end
	end
	
	
	-- class based armor subtype restrictions
	local class = ArkInventoryRules.Object.playerinfo.class
	if class == HUNTER and ArkInventoryRules.Object.playerinfo.level < 40 then
		class = LOWLEVELHUNTER
	end
	
	
	-- should this class wear this type of armor
	if ( not ArkInventory.Const.ClassArmor[ArkInventoryRules.Object.info.itemsubtypeid] ) or ( ArkInventory.Const.ClassArmor[ArkInventoryRules.Object.info.itemsubtypeid] and ArkInventory.Const.ClassArmor[ArkInventoryRules.Object.info.itemsubtypeid][class] ) then
		if wearable then
			--ArkInventory.Output( "wearable pass 2: ", ArkInventoryRules.Object.h )
			return true
		else
			--ArkInventory.Output( "unwearable fail 1: ", ArkInventoryRules.Object.h )
			return false
		end
	end
	
	if ( ArkInventory.Const.ClassArmor[ArkInventoryRules.Object.info.itemsubtypeid] and not ArkInventory.Const.ClassArmor[ArkInventoryRules.Object.info.itemsubtypeid][class] ) then
		if wearable then
			--ArkInventory.Output( "wearable fail 3: ", ArkInventoryRules.Object.h )
			return false
		else
			--ArkInventory.Output( "unwearable pass 2: ", ArkInventoryRules.Object.h )
			return true
		end
	end
	
	
	if wearable then
		--ArkInventory.Output( "wearable fail final: ", ArkInventoryRules.Object.h )
	else
		--ArkInventory.Output( "unwearable fail final: ", ArkInventoryRules.Object.h, " / ", ArkInventory.Const.ClassArmor[ArkInventoryRules.Object.info.itemsubtypeid] )
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_unwearable( ignore_level )
	return ArkInventoryRules.System.internal_unwearable( false, true, ignore_level )
end

function ArkInventoryRules.System.boolean_wearable( ignore_level )
	return ArkInventoryRules.System.internal_unwearable( true, true, ignore_level )
end

function ArkInventoryRules.System.boolean_count( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local fn = "count"
	
	local arg1 = ...
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	if ArkInventoryRules.Object.count >= arg1 then
		return true
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_stacks( )

	if not ArkInventoryRules.Object.h then
		return false
	end
	
	if ArkInventoryRules.Object.info.stacksize > 1 then
		return true
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_junk( )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	return ArkInventory.Action.Vendor.Check( ArkInventoryRules.Object, nil, true ) -- FIX ME, pretty sure i need to pass the codex in
	
end

function ArkInventoryRules.System.boolean_pettype( ... )
	
	if not ArkInventoryRules.Object.h or ArkInventoryRules.Object.class ~= "battlepet" then
		return false
	end
	
	local fn = "pettype"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	local e = ArkInventoryRules.Object.info.itemsubtypeid
	e = string.lower( ArkInventory.Collection.Pet.PetTypeName( e ) )
	
	if e then
		
		for ax = 1, ac do
			
			local arg = select( ax, ... )
			
			if not arg then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
			end
			
			if type( arg ) == "number" then
				arg = ArkInventory.Collection.Pet.PetTypeName( arg )
				if not arg then
					error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax ), 0 )
				end
			end
			
			if e == string.lower( string.trim( arg ) ) then
				return true
			end
			
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_petiswild( ... )
	
	if not ArkInventoryRules.Object.h or ArkInventoryRules.Object.class ~= "battlepet" then
		return false
	end
	
	return not not ArkInventoryRules.Object.wp
	
end

function ArkInventoryRules.System.boolean_petcanbattle( ... )
	
	if not ArkInventoryRules.Object.h or ArkInventoryRules.Object.class ~= "battlepet" then
		return false
	end
	
	return not not ArkInventoryRules.Object.bp
	
end

function ArkInventoryRules.System.boolean_mounttype( ... )
	
	if not ArkInventoryRules.Object.h or ArkInventoryRules.Object.class ~= "spell" then
		return false
	end
	
	local fn = "mounttype"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	local md = ArkInventory.Collection.Mount.GetMount( ArkInventoryRules.Object.index )
	
	if md and md.mt then
		
		for ax = 1, ac do
			
			local arg = select( ax, ... )
			
			if not arg then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
			end
			
			if type( arg ) ~= "string" then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
			end
			
			local ex = ArkInventory.Const.Mount.Types[string.lower( string.trim( arg ) )]
			if ex == md.mt then
				return true
			end
			
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_bonusids( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local bids = ArkInventoryRules.Object.info.osd.bonusids
	--ArkInventory.Output2( ArkInventoryRules.Object.h, " = ", bids )
	if not bids then return false end
	
	local fn = "bonus"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		return true
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if type( arg ) ~= "number" then
			
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["NUMBER"] ), 0 )
			
		else
			
			if bids[arg] then
				return true
			end
			
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_transmog( ... )
	
	if not ArkInventoryRules.Object.h or ArkInventoryRules.Object.class ~= "item" then
		return false
	end
	
	local fn = "transmog"
	
	local ac = select( '#', ... )
	
	local rule_primary = true
	local rule_secondary = false
	
	if ac > 0 then
		rule_secondary = not not select( 1, ... )
	end
	
	return not not ArkInventory.ItemTransmogState( ArkInventoryRules.Object.h, ArkInventoryRules.Object.sb, ArkInventoryRules.Object.loc_id, rule_primary, rule_secondary )
	
end

function ArkInventoryRules.System.boolean_itemstat_check( check_type, ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local e = string.trim( ArkInventoryRules.Object.info.equiploc )
	if e == "" or ArkInventoryRules.Object.info.itemtypeid == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.PARENT then return false end
	
	local fn = "itemstat"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	--ArkInventory.Output( ArkInventoryRules.Object.h, " [", e, "]" )
	
	local stats = ArkInventory.TooltipGetBaseStats( ArkInventoryRules.Tooltip, check_type )
	
	if stats ~= "" then
		
		for ax = 1, ac do
			
			local arg = select( ax, ... )
			
			if not arg then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
			end
			
			if type( arg ) ~= "string" then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
			end
			
			--ArkInventory.Output( ArkInventoryRules.Object.h, " [", arg, "] = [", stats, "]" )
			
			if string.find( string.lower( stats ), string.lower( string.trim( arg ) ) ) then
				--ArkInventory.Output( "[true]" )
				return true
			end
			
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_itemstat( ... )
	return ArkInventoryRules.System.boolean_itemstat_check( false, ... )
end

function ArkInventoryRules.System.boolean_itemstat_active( ... )
	return ArkInventoryRules.System.boolean_itemstat_check( true, ... )
end

function ArkInventoryRules.System.boolean_isknown( ... )
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local fn = "isknown"
	
	--local thread_id = nil
	--local tc, changed = ArkInventory.ObjectCountGetRaw( ArkInventoryRules.Object.h, thread_id )
	
	-- battlepet
	-- local numOwned = C_PetJournal.GetNumCollectedInfo( speciesID )
	
	return false
	
end

function ArkInventoryRules.System.boolean_player_class( ... )
	
	if true then return false end
	
	if not ArkInventoryRules.Object.h then
		return false
	end
	
	local fn = "playerclass"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	ArkInventoryRules.Object.playerinfo = ArkInventoryRules.Object.playerinfo or { }
	local class = ArkInventoryRules.Object.playerinfo.class or ""
	local class_local = ArkInventoryRules.Object.playerinfo.class_local or ""
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		if string.lower( class ) == string.lower( string.trim( arg ) ) or string.lower( class_local ) == string.lower( string.trim( arg ) ) then
			return true
		end
		
	end
	
	return false
	
end



--[[
	
	tsmgroup( ) = in any group
	tsmgroup( "test" ) = is in a group named test
	tsmgroup( "test1", "test2" ) = is in a group named either test1 or test2
	tsmgroup( "test->*" ) = is in a group named test or any of its subgroups
	tsmgroup( "test->sub1" ) = is in a group named test->sub1

]]--

function ArkInventoryRules.System.boolean_tsmgroup( ... )
	
	-- always check for a hyperlink and that it's an item, or pet, or keystone
	if not ArkInventoryRules.Object.h or not ( ArkInventoryRules.Object.class == "item" or ArkInventoryRules.Object.class == "battlepet" or ArkInventoryRules.Object.class == "keystone" ) then
		return false
	end
	
	if IsAddOnLoaded( "TradeSkillMaster" ) then
		
		if TSM_API then
			return ArkInventoryRules.System.boolean_tsmgroup4( ... )
		elseif TSMAPI then
			return ArkInventoryRules.System.boolean_tsmgroup3( ... )
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_tsmgroup3( ... )
	
	local fn = "tsmgroup3"
	
	-- full item string
	local itemString = TSMAPI.Item:ToItemString( ArkInventoryRules.Object.h )
	
	if not itemString then
		return false
	end
	
	local group = TSMAPI.Groups:FormatPath( TSMAPI.Groups:GetPath( itemString ) )
	
	if not group then
		
		-- full item was not in any group, check base item
		itemString = TSMAPI.Item:ToBaseItemString( ArkInventoryRules.Object.h )
		
		if not itemString then
			return false
		end
		
		group = TSMAPI.Groups:FormatPath( TSMAPI.Groups:GetPath( itemString ) )
		
		if not group then
			return false
		end
		
	end
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		-- no groupnames listed, so any group is ok
		return true
	end
	
	local arg
	
	-- loop through arguments
	for ax = 1, ac do
		
		arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		arg = string.trim( arg )
		
		if string.sub( arg, -1 ) == "*" then
			
			-- wildcard match, remove the wildcard
			arg = string.sub( arg, 1, -2 )
			
			if string.len( arg ) == 0 then
				-- match anything
				return true
			end
			
			-- if arg is group->* then specifically check parent group
			if string.sub( arg, -2 ) == "->" and string.lower( string.sub( arg, 1, -3 ) ) == string.lower( group ) then
				return true
			end
			
			-- check for match
			if string.lower( arg ) == string.lower( string.sub( group, 1, string.len( arg ) ) ) then
				return true
			end
			
		else
			
			-- exact match
			
			if string.len( arg ) == 0 then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax ), 0 )
			else
				if string.lower( arg ) == string.lower( group ) then
					return true
				end
			end
			
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_tsmgroup4( ... )
	
	local fn = "tsmgroup4"
	
	local item = TSM_API.ToItemString( ArkInventoryRules.Object.h )
	if not item then
		return false
	end
	
	local group = TSM_API.GetGroupPathByItem( item )
	if not group then
		return false
	end
	group = TSM_API.FormatGroupPath( group )
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		-- no groupnames listed, so any group is ok
		return true
	end
	
	local arg
	
	-- loop through arguments
	for ax = 1, ac do
		
		arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		arg = string.trim( arg )
		
		if string.sub( arg, -1 ) == "*" then
			
			-- wildcard match, remove the wildcard
			arg = string.sub( arg, 1, -2 )
			
			if string.len( arg ) == 0 then
				-- match anything
				return true
			end
			
			-- if arg is group->* then specifically check parent group
			if string.sub( arg, -2 ) == "->" and string.lower( string.sub( arg, 1, -3 ) ) == string.lower( group ) then
				return true
			end
			
			-- check for match
			if string.lower( arg ) == string.lower( string.sub( group, 1, string.len( arg ) ) ) then
				return true
			end
			
		else
			
			-- exact match
			if string.len( arg ) == 0 then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax ), 0 )
			else
				if string.lower( arg ) == string.lower( group ) then
					return true
				end
			end
			
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_tsm( ... )
	
	-- always check for a hyperlink and that it's an item, or pet, or keystone
	if not ArkInventoryRules.Object.h or not ( ArkInventoryRules.Object.class == "item" or ArkInventoryRules.Object.class == "battlepet" or ArkInventoryRules.Object.class == "keystone" ) then
		return false
	end
	
	if IsAddOnLoaded( "TradeSkillMaster" ) then
		
		if TSM_API then
			return ArkInventoryRules.System.boolean_tsm4( ... )
		elseif TSMAPI then
			return ArkInventoryRules.System.boolean_tsm3( ... )
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_tsm3( ... )
	
	local fn = "tsm3"
	
	-- full item string
	local itemString = TSMAPI.Item:ToItemString( ArkInventoryRules.Object.h )
	
	if not itemString then
		return false
	end
	
	local group = TSMAPI.Groups:FormatPath( TSMAPI.Groups:GetPath( itemString ) )
	
	if not group then
		
		-- full item was not in any group, check base item
		itemString = TSMAPI.Item:ToBaseItemString( ArkInventoryRules.Object.h )
		
		if not itemString then
			return false
		end
		
		group = TSMAPI.Groups:FormatPath( TSMAPI.Groups:GetPath( itemString ) )
		
		if not group then
			return false
		end
		
	end
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		-- no groupnames listed, so any group is ok
		return true
	end
	
	local arg
	
	-- loop through arguments
	for ax = 1, ac do
		
		arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		if string.find( string.lower( group ), arg ) then
			return true
		end
		
	end
	
	return false
	
end

function ArkInventoryRules.System.boolean_tsm4( ... )
	
	local fn = "tsm4"
	
	local item = TSM_API.ToItemString( ArkInventoryRules.Object.h )
	if not item then
		return false
	end

	local group = TSM_API.GetGroupPathByItem( item )
	if not group then
		return false
	end
	group = TSM_API.FormatGroupPath( group )
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		-- no groupnames listed, so any group is ok
		return true
	end
	
	local arg
	
	-- loop through arguments
	for ax = 1, ac do
		
		arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NOT"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		if string.find( string.lower( group ), arg ) then
			return true
		end
		
	end
	
	return false
	
end



ArkInventoryRules.Environment = {
	
	i = ArkInventoryRules.Object,
	
	-- rule functions
	
	soulbound = ArkInventoryRules.System.boolean_soulbound,
	sb = ArkInventoryRules.System.boolean_soulbound,
	
	accountbound = ArkInventoryRules.System.boolean_accountbound,
	ab = ArkInventoryRules.System.boolean_accountbound,
	
	bound = ArkInventoryRules.System.boolean_bound,
	
	itemstring = ArkInventoryRules.System.boolean_itemstring,
	
	itemtype = ArkInventoryRules.System.boolean_itemtype,
	type = ArkInventoryRules.System.boolean_itemtype,
	
	itemsubtype = ArkInventoryRules.System.boolean_itemsubtype,
	subtype = ArkInventoryRules.System.boolean_itemsubtype,
	stype = ArkInventoryRules.System.boolean_itemsubtype,
	
	equip = ArkInventoryRules.System.boolean_equip,
	
	name = ArkInventoryRules.System.boolean_name,
	
	quality = ArkInventoryRules.System.boolean_quality,
	q = ArkInventoryRules.System.boolean_quality,
	
	expansion = ArkInventoryRules.System.boolean_expansion,
	
	periodictable = ArkInventoryRules.System.boolean_periodictable,
	pt = ArkInventoryRules.System.boolean_periodictable,
	
	tooltip = ArkInventoryRules.System.boolean_tooltip,
	tt = ArkInventoryRules.System.boolean_tooltip,
	
	outfit = ArkInventoryRules.System.boolean_outfit,
	
	ilvl = ArkInventoryRules.System.boolean_itemlevelstat,
	itemlevel = ArkInventoryRules.System.boolean_itemlevelstat,
	statlevel = ArkInventoryRules.System.boolean_itemlevelstat,
	
	itemstat = ArkInventoryRules.System.boolean_itemstat,
	itemstatactive = ArkInventoryRules.System.boolean_itemstat_active,
	
	ireq = ArkInventoryRules.System.boolean_itemleveluse,
	uselevel = ArkInventoryRules.System.boolean_itemleveluse,
	belowaverage = ArkInventoryRules.System.boolean_itemlevelbelowaverage,
	
	bonus = ArkInventoryRules.System.boolean_bonusids,
	
	clr = ArkInventoryRules.System.boolean_characterlevelrange,
	
	vpu = ArkInventoryRules.System.boolean_vendorpriceunder,
	vpo = ArkInventoryRules.System.boolean_vendorpriceover,
	vendorprice = ArkInventoryRules.System.value_vendorprice,
	
	bag = ArkInventoryRules.System.boolean_bag,
	
	location = ArkInventoryRules.System.boolean_location,
	loc = ArkInventoryRules.System.boolean_location,
	
	usable = ArkInventoryRules.System.boolean_usable,
	use = ArkInventoryRules.System.boolean_usable,
	useable = ArkInventoryRules.System.boolean_usable,
	
	wearable = ArkInventoryRules.System.boolean_wearable,
	
	unwearable = ArkInventoryRules.System.boolean_unwearable,
	
	count = ArkInventoryRules.System.boolean_count,
	
	stacks = ArkInventoryRules.System.boolean_stacks,
	
	pettype = ArkInventoryRules.System.boolean_pettype,
	ptype = ArkInventoryRules.System.boolean_pettype,
	
	petiswild = ArkInventoryRules.System.boolean_petiswild,
	
	petcanbattle = ArkInventoryRules.System.boolean_petcanbattle,
	
	mounttype = ArkInventoryRules.System.boolean_mounttype,
	mtype = ArkInventoryRules.System.boolean_mounttype,
	
	itemfamily = ArkInventoryRules.System.boolean_itemfamily,
	family = ArkInventoryRules.System.boolean_itemfamily,
	
	transmog = ArkInventoryRules.System.boolean_transmog,
	xmog = ArkInventoryRules.System.boolean_transmog,
	
	-- 3rd party addons requried for the following functions to work
	
	junk = ArkInventoryRules.System.boolean_junk,
	trash = ArkInventoryRules.System.boolean_junk,
	
	tsmgroup = ArkInventoryRules.System.boolean_tsmgroup,
	tsm = ArkInventoryRules.System.boolean_tsm,
	
	crafting = ArkInventoryRules.System.boolean_iscraftingreagent,
	
--	playerclass = ArkInventoryRules.System.boolean_player_class,
--	class = ArkInventoryRules.System.boolean_player_class,
	
}

function ArkInventoryRules.Register( a, n, f, o ) -- addon, rule name, function, overwrite
	
	if ArkInventory.TOCVersionFail( true ) then return end
	
	local n = string.trim( string.lower( tostring( n ) ) )
	
	if n == "i" then
		ArkInventory.OutputWarning( "Invalid rule registration from ", a:GetName( ), " - ", n, " cannot overwrite environment variable" )
		return false
	end
	
	if not string.match( n, "^%a[%a%d]*$" ) then
		ArkInventory.OutputWarning( "Invalid rule registration from ", a:GetName( ), " - ", n, " is not a valid rule name" )
		return false
	end
	
	if not o and ArkInventoryRules.Environment[n] then
		ArkInventory.OutputWarning( "Invalid rule registration from ", a:GetName( ), " - ", n, " is already registered" )
		return false
	end
	
	ArkInventoryRules.Environment[n] = f
	if ArkInventory.db.option.message.rules.registration then
		ArkInventory.Output( "Successful rule registration from ", a:GetName( ), " - rule function [", n, "] is now active" )
	end
	
	return true
	
end



function ArkInventoryRules.Frame_Rules_Table_Sort_Build( frame )

	local f = frame:GetName( )
	
	local x
	
	--damaged
	x = _G[f .. "_T1"]
	x:ClearAllPoints( )
	x:SetWidth( 32 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "LEFT", 15, 0 )
	x:SetText( ArkInventory.Localise["RULE_LIST_DAMAGED"] )
	x:Show( )
	
	-- id
	x = _G[f .. "_C1"]
	x:ClearAllPoints( )
	x:SetWidth( 50 )
	x:SetPoint( "LEFT", f .. "_T1", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetText( ArkInventory.Localise["RULE_LIST_ID"] )
	x:Show( )

	-- order
	x = _G[f .. "_C2"]
	x:ClearAllPoints( )
	x:SetWidth( 50 )
	x:SetPoint( "LEFT", f .. "_C1", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetText( ArkInventory.Localise["ORDER"] )
	x:Show( )

	-- description
	x = _G[f .. "_C3"]
	x:ClearAllPoints( )
	x:SetPoint( "LEFT", f .. "_C2", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "RIGHT", -35, 0 )
	x:SetText( ArkInventory.Localise["DESCRIPTION"] )
	x:Show( )
	
end

function ArkInventoryRules.Frame_Rules_Table_Row_Build( frame )

	local f = frame:GetName( )
	
	local x
	local sz = 18
	
	--damaged
	x = _G[f .. "T1"]
	x:ClearAllPoints( )
	x:SetWidth( sz )
	x:SetHeight( sz )
	x:SetPoint( "LEFT", 17, 0 )
	x:Show( )
	
	-- id
	x = _G[f .. "C1"]
	x:ClearAllPoints( )
	x:SetWidth( 50 )
	x:SetPoint( "LEFT", f .. "T1", "RIGHT", 12, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetTextColor( 1, 1, 1, 1 )
	x:SetJustifyH( "CENTER", 0, 0 )
	x:Show( )

	-- order
	x = _G[f .. "C2"]
	x:ClearAllPoints( )
	x:SetWidth( 50 )
	x:SetPoint( "LEFT", f .. "C1", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetTextColor( 1, 1, 1, 1 )
	x:SetJustifyH( "CENTER", 0, 0 )
	x:Show( )

	-- description
	x = _G[f .. "C3"]
	x:ClearAllPoints( )
	x:SetPoint( "LEFT", f .. "C2", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "RIGHT", -5, 0 )
	x:SetJustifyH( "LEFT", 0, 0 )
	x:Show( )
	
	-- Highlight
	x = _G[f .. "Highlight"]
	x:Hide( )
	
end

function ArkInventoryRules.Frame_Rules_Table_Build( frame )
	
	local f = frame:GetName( )
	
	local maxrows = ( ArkInventory.db and ArkInventory.db.option.ui.rules.rows ) or tonumber( _G[f .. "MaxRows"]:GetText( ) )
	if maxrows == 0 then
		maxrows = 15
	end
	_G[f .. "MaxRows"]:SetText( maxrows )
	
	local e
	for x = 1, 20 do
		if x > maxrows then
			e = _G[string.format( "%sRow%s", f, x )]
			e:Hide( )
		end
	end
	
	local rows = maxrows
	_G[f .. "NumRows"]:SetText( rows )
	
	local height = tonumber( _G[f .. "RowHeight"]:GetText( ) )
	if height == 0 then
		height = 24
	end
	_G[f .. "RowHeight"]:SetText( height )
	
	-- stretch scrollbar to bottom row
	_G[f .. "Scroll"]:SetPoint( "BOTTOM", f .. "Row" .. rows, "BOTTOM", 0, 0 )
	
	-- set frame height to correct size
	_G[f]:SetHeight( height * rows + 20 )
	
end

function ArkInventoryRules.Frame_Rules_Resize( )
	
	local frame = ARKINV_Rules
	
	frame:SetWidth( ArkInventory.db.option.ui.rules.width )
	
	-- resize ARKINV_RulesFrame
	
	local f1 = _G[frame:GetName( ) .. "Frame"]
	--ArkInventory.Output( f1:GetName( ), " top = ", math.floor( f1:GetTop( ) ) )
	
	local f2 = _G[frame:GetName( ) .. "FrameViewMenu"]
	--ArkInventory.Output( f2:GetName( ), " bot = ", math.floor( f2:GetBottom( ) ) )
	
	local h = f1:GetTop( ) - f2:GetBottom( ) + 20
	--ArkInventory.Output( f1:GetName( ), "set height = ", h )
	f1:SetHeight( h )
	
	
	-- resize ARKINV_Rules
	
	local f1 = frame
	--ArkInventory.Output( f1:GetName( ), " top = ", math.floor( f1:GetTop( ) ) )
	
	local f2 = _G[frame:GetName( ) .. "Frame"]
	--ArkInventory.Output( f2:GetName( ), " bot = ", math.floor( f2:GetBottom( ) ) )
	
	local h = f1:GetTop( ) - f2:GetBottom( )
	--ArkInventory.Output( f1:GetName( ), "set height = ", h )
	f1:SetHeight( h )
	
end

function ArkInventoryRules.Frame_Rules_Table_Row_OnClick( frame )

	local f = frame:GetName( )
	
	-- ArkInventory.OutputDebug( "RuleTableClick( ", f, " )" )
	local parent = _G[f]:GetParent( ):GetName( )
	
	local cs = _G[parent .. "SelectedRow"]:GetText( )
	local ns = tostring( _G[f]:GetID( ) )

	if ns == "0" then
		ArkInventory.Output( "code failure: widget [", f, "] has no ID allocated" )
		return false
	end
	
	
		-- show/hide selected background
	
		if cs ~= "-1" then
			_G[parent .. "Row" .. cs .. "Selected"]:Hide( )
		end

		-- second click removes selection		
		if cs == ns then
			_G[parent .. "SelectedRow"]:SetText( "-1" )
			_G[parent .. "SelectedId"]:SetText( "-1" )
			return
		end
	
		_G[parent .. "SelectedRow"]:SetText( ns )
		_G[parent .. "SelectedId"]:SetText( _G[f .. "Id"]:GetText( ) )
	
		_G[f .. "Selected"]:Show( )
		
end

function ArkInventoryRules.Frame_Rules_Table_Reset( f )

	if not f or type( f ) ~= "string" or not _G[f] then
		ArkInventory.OutputError( "OOPS: Invalid value at ArkInventoryRules.Frame_Rules_Table_Reset( [", f, "] )" )
		return
	end

	-- hide and reset all rows
	
	local t = f .. "Table"
	
	local h = tonumber( _G[t .. "RowHeight"]:GetText( ) )
	local r = tonumber( _G[t .. "NumRows"]:GetText( ) )

	_G[t .. "SelectedRow"]:SetText( "-1" )
	for x = 1, r do
		_G[t .. "Row" .. x .. "Selected"]:Hide( )
		_G[t .. "Row" .. x .. "Id"]:SetText( "-1" )
		_G[t .. "Row" .. x]:Hide( )
		_G[t .. "Row" .. x]:SetHeight( h )
	end

end

function ArkInventoryRules.Frame_Rules_Table_Refresh( frame )
	
	local f = frame:GetParent( ):GetParent( ):GetParent( ):GetName( )
	
	f = f .. "View"
	
	local ft = f .. "Table"

	local height = tonumber( _G[ft .. "RowHeight"]:GetText( ) )
	local rows = tonumber( _G[ft .. "NumRows"]:GetText( ) )

	local line
	local lineplusoffset
	
	ArkInventoryRules.Frame_Rules_Table_Reset( f )

	local filter = _G[f .. "SearchFilter"]:GetText( )
	--ArkInventory.OutputDebug( "filter = [", filter, "]" )

	local tt = { }
	local tc = 0
	
	local ignore
	
	for k, d in pairs( ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Rule].data ) do

		-- ArkInventory.Output( "k = [", k, "], order = [", d.order, "], name = [", d.name, "], formula = [", d.formula, "]" )
	
		ignore = false
		
		if filter ~= "" then
			if not string.find( string.lower( d.name or "" ), string.lower( filter ) ) then
				ignore = true
			end
		end
		
		if d.used ~= "Y" then
			ignore = true
		end
		
		if not ignore then
			tt[#tt + 1] = {
				["sorted"] = format( "%04i %04i", d.order or 0, k ),
				["id"] = k,
				["order"] = d.order or 0,
				["name"] = d.name or "",
				["formula"] = d.formula or "",
				["damaged"] = d.damaged or false,
			}
			tc = tc + 1
		end

	end
	
	
	FauxScrollFrame_Update( _G[ft .. "Scroll"], tc, rows, height )
	
	if tc == 0 then
		return
	end
	
	-- sort them by name
	table.sort( tt, function( a, b ) return a.sorted < b.sorted end )

	local linename, c, r
	
	for line = 1, rows do

		linename = ft .. "Row" .. line
		
		lineplusoffset = line + FauxScrollFrame_GetOffset( _G[ft .. "Scroll"] )

		if lineplusoffset <= tc then

			c = ""
			r = tt[lineplusoffset]
			
			_G[linename .. "Id"]:SetText( string.format( "%04i", r.id ) )

			if r.damaged then
				ArkInventory.SetTexture( _G[linename .. "T1"], ArkInventory.Const.Texture.No )
			else
				ArkInventory.SetTexture( _G[linename .. "T1"], true, 0, 0, 0, 0 )
			end
			
			_G[linename .. "C1"]:SetText( string.format( "%04i", r.id ) )
			
			c = string.format( r.order )
			_G[linename .. "C2"]:SetText( c )
			
			c = r.name
			if not c then c = "<not set>" end
			_G[linename .. "C3"]:SetText( c )
			
			_G[linename]:Show( )
			
			-- show selected if id is scrolled into view
			if _G[ft .. "SelectedId"]:GetText( ) == r.order then
				_G[ft .. "SelectedRow"]:SetText( line )
				_G[ft .. "Row" .. line .. "Selected"]:Show( )
			end
			
		else
			
			_G[linename .. "Id"]:SetText( "-1" )
			_G[linename]:Hide( )
			
		end
	end

end

function ArkInventoryRules.Frame_Rules_Paint( )

	local frame = ARKINV_Rules
	
	-- frameStrata
	if frame:GetFrameStrata( ) ~= ArkInventory.db.option.ui.rules.strata then
		frame:SetFrameStrata( ArkInventory.db.option.ui.rules.strata )
	end
	
	-- title
	local obj = _G[frame:GetName( ) .. "TitleWho"]
	if obj then
		local t = string.format( "%s: %s %s", ArkInventory.Localise["RULES"], ArkInventory.Const.Program.Name, ArkInventory.Global.Version )
		obj:SetText( t )
	end
	
	-- font
	ArkInventory.MediaFrameDefaultFontSet( frame )
	
	-- scale
	frame:SetScale( ArkInventory.db.option.ui.rules.scale or 1 )
	
	local style, file, size, offset, scale, colour
	
	for _, z in pairs( { frame:GetChildren( ) } ) do
		
		-- background
		local obj = _G[z:GetName( ) .. "Background"]
		if obj then
			style = ArkInventory.db.option.ui.rules.background.style or ArkInventory.Const.Texture.BackgroundDefault
			if style == ArkInventory.Const.Texture.BackgroundDefault then
				colour = ArkInventory.db.option.ui.rules.background.colour
				ArkInventory.SetTexture( obj, true, colour.r, colour.g, colour.b, colour.a )
			else
				file = ArkInventory.Lib.SharedMedia:Fetch( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND, style )
				ArkInventory.SetTexture( obj, file )
			end
		end
		
		-- border
		style = ArkInventory.db.option.ui.rules.border.style or ArkInventory.Const.Texture.BorderDefault
		file = ArkInventory.Lib.SharedMedia:Fetch( ArkInventory.Lib.SharedMedia.MediaType.BORDER, style )
		size = ArkInventory.db.option.ui.rules.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size
		offset = ArkInventory.db.option.ui.rules.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offsetdefault.window
		scale = ArkInventory.db.option.ui.rules.border.scale or 1
		colour = ArkInventory.db.option.ui.rules.border.colour or { }
		
		ArkInventoryRules.Frame_Rules_Paint_Border( z, file, size, offset, scale, colour.r, colour.g, colour.b, 1 )
		
	end
	
end

function ArkInventoryRules.Frame_Rules_Paint_Border( frame, ... )
	
	if not frame then return end
	
	if frame:GetName( ) then
		local obj = frame.ArkBorder
		if obj then
			if ArkInventory.db.option.ui.rules.border.style ~= ArkInventory.Const.Texture.BorderNone then
				ArkInventory.Frame_Border_Paint( obj, ... )
				obj:Show( )
			else
				obj:Hide( )
			end
		end
	end
	
	for _, z in pairs( { frame:GetChildren( ) } ) do
		ArkInventoryRules.Frame_Rules_Paint_Border( z, ... )
	end
	
end


function ArkInventoryRules.EntryFormat( data )

	if not data then
		return
	end
	
	local zOrder = 9999
	zOrder = abs( tonumber( data.order ) or zOrder )
	if zOrder > 9999 then
		zOrder = 9999
	end
	
	local zName = "<NEW>"
	zName = string.trim( tostring( data.name or zName ) )
	
	local zFormula = "false"
	zFormula = tostring( data.formula or zFormula )
	--zFormula = string.trim( tostring( data.formula or zFormula ) )
	--zFormula = string.gsub( zFormula, "[\r]", " " ) -- replace carriage return with space
	--zFormula = string.gsub( zFormula, "[\n]", " " ) -- replace new line with space
	--zFormula = string.gsub( zFormula, "%s+", " " ) -- replace multiple spaces with a single space
	
	data.used = "Y"
	data.damaged = false
	data.order = zOrder
	data.name = zName
	data.formula = zFormula
	
	-- purge old data
	data.compiled = nil
	data.enabled = nil
	
	return data
	
end

function ArkInventoryRules.EntryUpdate( rid, data )
	
	local rid = tonumber( rid )
	ArkInventoryRules.EntryFormat( data )
	
	-- save the rule data at the global level
	ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Rule].data[rid].used = "Y"
	for k, v in pairs( data ) do
		ArkInventory.db.option.category[ArkInventory.Const.Category.Type.Rule].data[rid][k] = v
	end
	
	ArkInventory.ItemCacheClear( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventoryRules.EntryIsValid( rid, data )
	
	--ArkInventory.Output( "validating rule ", rid )
	
	local ok = true
	local em = string.format( ArkInventory.Localise["RULE_FAILED"], rid )
	
	if not rid then
		return false, string.format( "%s, %s", em, ArkInventory.Localise["RULE_FAILED_KEY_NIL"] )
	end
	
	if not data then
		return false, ArkInventory.Localise["RULE_FAILED_DATA_NIL"]
	end
	
	ArkInventoryRules.EntryFormat( data )
	
	
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

function ArkInventoryRules.EntryAdd( data )
	
	local ok, msg = ArkInventoryRules.EntryIsValid( "<NEW>", data )
	if not ok then
		return false, msg
	end
	
	local p, rule = ArkInventory.ConfigInternalCategoryRuleAdd( "new" )
	if p then
		ArkInventoryRules.EntryUpdate( p, data )
		return true
	end
	
end

function ArkInventoryRules.EntryEdit( rid, data )

	local ok, ec = ArkInventoryRules.EntryIsValid( rid, data )
	if not ok then
		return false, ec
	end
	
	ArkInventoryRules.EntryUpdate( rid, data )
	
	return true
	
end

function ArkInventoryRules.EntryRemove( rid )

	if not rid then
		error( "FAILED: key is nil" )
	end
	
	local rid = tonumber( rid )
	ArkInventory.ConfigInternalCategoryRuleDelete( rid )
	
	ArkInventory.ItemCacheClear( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
	return true
	
end


function ArkInventoryRules.Frame_Rules_Button_Modify( frame, t )
	
	local f = frame:GetParent( ):GetParent( ):GetParent( ):GetName( )
	
	local fvt = f .. "ViewTable"

	local fm = f .. "Modify"
	local fmt = fm .. "Title"
	local fmd = fm .. "Data"

	_G[fm .. "Type"]:SetText( t )

	local k = _G[fvt .. "SelectedId"]:GetText( )
	if not k then k = "-1" end
	if t == "A" then k = "-1" end

	local v
	
	if k ~= "-1" then
		local d = ArkInventory.ConfigInternalCategoryRuleGet( tonumber( k ) )
		_G[fmd .. "Id"]:SetText( k )
		_G[fmd .. "Order"]:SetText( d.order or "" )
		_G[fmd .. "Description"]:SetText( d.name or "" )
		_G[fmd .. "ScrollFormula"]:SetText( d.formula or "" )
	else
		_G[fmd .. "Id"]:SetText( "<NEW>" )
		_G[fmd .. "Order"]:SetText( "100" )
		_G[fmd .. "Description"]:SetText( "" )
		_G[fmd .. "ScrollFormula"]:SetText( "false" )
	end

	_G[fmd .. "IdLabel"]:SetText( ArkInventory.Localise["CATEGORY_RULE"] .. ":"  )
	_G[fmd .. "OrderLabel"]:SetText( ArkInventory.Localise["ORDER"] .. ":"  )
	_G[fmd .. "DescriptionLabel"]:SetText( ArkInventory.Localise["DESCRIPTION"] .. ":"  )
	_G[fmd .. "FormulaLabel"]:SetText( ArkInventory.Localise["RULE_FORMULA"] .. ":" )
	
	_G[fmd .. "Order"]:Show( )
	_G[fmd .. "Description"]:Show( )
	_G[fmd .. "ScrollFormula"]:Show( )

	_G[fmd .. "OrderReadOnly"]:SetText( _G[fmd .. "Order"]:GetText( ) )
	_G[fmd .. "OrderReadOnly"]:Hide( )
	_G[fmd .. "DescriptionReadOnly"]:SetText( _G[fmd .. "Description"]:GetText( ) )
	_G[fmd .. "DescriptionReadOnly"]:Hide( )
	_G[fmd .. "FormulaReadOnly"]:SetText( _G[fmd .. "ScrollFormula"]:GetText( ) )
	_G[fmd .. "FormulaReadOnly"]:Hide( )

	if t == "R" then

		if k == "-1" then return end

		_G[fmt .. "Text"]:SetText( string.upper( ArkInventory.Localise["REMOVE"] ) )

		_G[fmd .. "Order"]:Hide( )
		_G[fmd .. "OrderReadOnly"]:Show( )

		_G[fmd .. "Description"]:Hide( )
		_G[fmd .. "DescriptionReadOnly"]:Show( )

		_G[fmd .. "ScrollFormula"]:Hide( )
		_G[fmd .. "FormulaReadOnly"]:Show( )

	elseif t == "E" then

		if k == "-1" then return end

		_G[fmt .. "Text"]:SetText( string.upper( ArkInventory.Localise["EDIT"] ) )

	elseif t == "A" then

		_G[fmt .. "Text"]:SetText( string.upper( ArkInventory.Localise["ADD"] ) )

	else
		ArkInventory.Output( RED_FONT_COLOR_CODE, "OOPS: Uncoded argument ArkInventoryRules.Frame_Rules_Button_Modify( ", t, " )" )
		return
	end

	_G[f .. "View"]:Hide( )
	_G[fm]:Show( )

end

function ArkInventoryRules.Frame_Rules_Button_Modify_Ok( frame )

	local f = frame:GetParent( ):GetParent( ):GetParent( ):GetParent( ):GetName( )
	local fm = frame:GetParent( ):GetParent( ):GetName( )
	local fmd = fm .. "Data"
	
	local d = { }
	d["order"] = _G[fmd .. "Order"]:GetText( )
	d["name"] = _G[fmd .. "Description"]:GetText( )
	d["formula"] = _G[fmd .. "ScrollFormula"]:GetText( )
	
	local k = _G[fmd .. "Id"]:GetText( )
	
	f = frame:GetParent( ):GetParent( ):GetParent( ):GetName( )
	fm = frame:GetParent( ):GetParent( ):GetName( )
	
	local t = _G[fm .. "Type"]:GetText( )
	
	if t =="A" then
		local ok, ec = ArkInventoryRules.EntryAdd( d )
		if not ok then
			if ec then
				ArkInventory.OutputError( ec )
			end
			return
		end
		_G[f .. "ViewTableSelectedId"]:SetText( "-1" )
	elseif t == "E" then
		local ok, ec = ArkInventoryRules.EntryEdit( k, d )
		if not ok then
			if ec then
				ArkInventory.OutputError( ec )
			end
			return
		end
	elseif t == "R" then
		local ok, ec = ArkInventoryRules.EntryRemove( k )
		if not ok then
			if ec then
				ArkInventory.OutputError( ec )
			end
			return
		end
		_G[f .. "ViewTableSelectedId"]:SetText( "-1" )
	else
		ArkInventory.OutputError( "OOPS: Uncoded value [", t, "] at ArkInventoryRules.Frame_Rules_Button_Modify_Ok" )
		return
	end
	
	_G[fm]:Hide( )
	_G[f .. "View"]:Show( )
	
end

function ArkInventoryRules.Frame_Rules_Button_Modify_Cancel( frame )

	f = frame:GetParent( ):GetParent( ):GetParent( ):GetName( )
	
	_G[f .. "Modify"]:Hide( )
	_G[f .. "View"]:Show( )

end


function ArkInventoryRules.Frame_Rules_Button_View_Add( frame )
	return ArkInventoryRules.Frame_Rules_Button_Modify( frame, "A" )
end

function ArkInventoryRules.Frame_Rules_Button_View_Edit( frame )
	return ArkInventoryRules.Frame_Rules_Button_Modify( frame, "E" )
end

function ArkInventoryRules.Frame_Rules_Button_View_Remove( frame )
	return ArkInventoryRules.Frame_Rules_Button_Modify( frame, "R" )
end

function ArkInventoryRules.SetObject( tbl )
	
	local i = ArkInventoryRules.Object
	
	ArkInventory.Table.Wipe( i )
	ArkInventory.Table.Merge( tbl, i )
	
	local codex = ArkInventory.GetLocationCodex( i.loc_id )
	i.playerinfo = codex.player.data.info
	
	i.info = ArkInventory.GetObjectInfo( i.h )
	if not i.info.ready then
		-- do not process/cache non ready items
		return nil
	end
	
	i.osd = i.info.osd
	i.class = i.osd.class
	
	if i.h then
		
		if i.test_rule then
			ArkInventory.TooltipSet( ArkInventoryRules.Tooltip, nil, nil, nil, i.h )
		else
			ArkInventory.TooltipSet( ArkInventoryRules.Tooltip, i.loc_id, i.bag_id, i.slot_id, i.h, i )
		end
		
		if not ArkInventory.TooltipIsReady( ArkInventoryRules.Tooltip ) then
			--ArkInventory.Output2( "2 tooltip not ready: ", i.h )
			return nil
		end
		
	else
		
		-- empty slots
		ArkInventoryRules.Tooltip:ClearLines( )
		
	end
	
	return true
	
end
