local cacheGetObjectInfo = { }
local cacheObjectStringStandard = { }
local cacheObjectStringDecode = { }

local equiplocwarningsent = { }

local TooltipStockCaptureSeperator = ""
if LARGE_NUMBER_SEPERATOR ~= "" then
	TooltipStockCaptureSeperator = LARGE_NUMBER_SEPERATOR .. "?"
end
local TooltipStockCapture1 = "^" .. USE .. ".-(%d?%d?%d?" .. TooltipStockCaptureSeperator .. "%d?%d?%d).+"
local TooltipStockCapture2 = ".- (%d?%d?%d?" .. TooltipStockCaptureSeperator .. "%d?%d?%d) .+"
local TooltipStockCapture3 = ".-(%d?%d?%d?" .. TooltipStockCaptureSeperator .. "%d?%d?%d)"


local maxRetry = 5

local objectCorrections = {
	["item"] = {
		[86592] = { -- Hozen Peace Pipe
			[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.EXPANSION] = ArkInventory.ENUM.EXPANSION.PANDARIA,
		},
		[108257] = { -- Truesteel Ingot
			[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.EXPANSION] = ArkInventory.ENUM.EXPANSION.DRAENOR,
		},
		[120945] = { -- Primal Spirit
			[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.EXPANSION] = ArkInventory.ENUM.EXPANSION.DRAENOR,
		},
		[124461] = { -- Demonsteel Bar
			[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.EXPANSION] = ArkInventory.ENUM.EXPANSION.LEGION,
		},
		[182441] = { -- Marksman's Advantage (conduit)
			[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.EXPANSION] = ArkInventory.ENUM.EXPANSION.SHADOWLANDS,
		},
		[186727] = { -- Seal Breaker Key
			[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.EXPANSION] = ArkInventory.ENUM.EXPANSION.SHADOWLANDS,
		},
	},
}

local function helper_ResetObjectData( c, id, t, s )
	objectCorrections[c][id] = objectCorrections[id] or { }
	objectCorrections[c][id][ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.TYPEID] = t
	objectCorrections[c][id][ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.SUBTYPEID] = s
	objectCorrections[c][id][ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.TYPE] = GetItemClassInfo( t )
	objectCorrections[c][id][ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.SUBTYPE] = GetItemSubClassInfo( t, s )
end

local function helper_ResetItemData( id, t, s )
	helper_ResetObjectData( "item", id, t, s )
end

helper_ResetItemData( 186515, ArkInventory.ENUM.ITEM.TYPE.ARMOR.PARENT, ArkInventory.ENUM.ITEM.TYPE.ARMOR.COSMETIC ) -- Ensemble: Aspiring Aspirant's Regalia
helper_ResetItemData( 186727, ArkInventory.ENUM.ITEM.TYPE.KEY.PARENT, ArkInventory.ENUM.ITEM.TYPE.KEY.KEY ) -- Seal Breaker Key
helper_ResetItemData( 199752, ArkInventory.ENUM.ITEM.TYPE.ARMOR.PARENT, ArkInventory.ENUM.ITEM.TYPE.ARMOR.COSMETIC ) -- Ensemble: Crimson Valdrakken Clothing
helper_ResetItemData( 199753, ArkInventory.ENUM.ITEM.TYPE.ARMOR.PARENT, ArkInventory.ENUM.ITEM.TYPE.ARMOR.COSMETIC ) -- Ensemble: Black Valdrakken Clothing
helper_ResetItemData( 199754, ArkInventory.ENUM.ITEM.TYPE.ARMOR.PARENT, ArkInventory.ENUM.ITEM.TYPE.ARMOR.COSMETIC ) -- Ensemble: Azure Valdrakken Clothing
helper_ResetItemData( 199756, ArkInventory.ENUM.ITEM.TYPE.ARMOR.PARENT, ArkInventory.ENUM.ITEM.TYPE.ARMOR.COSMETIC ) -- Ensemble: Bronze Valdrakken Clothing
helper_ResetItemData( 198776, ArkInventory.ENUM.ITEM.TYPE.ARMOR.PARENT, ArkInventory.ENUM.ITEM.TYPE.ARMOR.COSMETIC ) -- Ensemble: Renowned Expeditioner's Leather Armor
helper_ResetItemData( 208831, ArkInventory.ENUM.ITEM.TYPE.ARMOR.PARENT, ArkInventory.ENUM.ITEM.TYPE.ARMOR.COSMETIC ) -- Tyr's Titan Key
helper_ResetItemData( 211383, ArkInventory.ENUM.ITEM.TYPE.CONSUMABLE.PARENT, ArkInventory.ENUM.ITEM.TYPE.CONSUMABLE.FOOD_AND_DRINK ) -- Luvkip
helper_ResetItemData( 224298, ArkInventory.ENUM.ITEM.TYPE.CONSUMABLE.PARENT, ArkInventory.ENUM.ITEM.TYPE.CONSUMABLE.OTHER ) -- Dilated Eon Canister


local function helper_CorrectData( info, tmp )
	-- correct any data
	if type( info ) == "table" and type( tmp ) == "table" then
		if info.class and objectCorrections[info.class] then
			if info.id and objectCorrections[info.class][info.id] then
				for k, v in pairs( objectCorrections[info.class][info.id] ) do
					tmp[k] = v
				end
			end
		end
	end
end

local Queue = { }
local scanning = false

local function helper_QueueAdd( hs )
	
	if not C_Item.IsItemDataCachedByID( hs ) then
		--ArkInventory.Output( "requesting [", hs, "]" )
		C_Item.RequestLoadItemDataByID( hs )
	end
	
	Queue[hs] = true
	
	ArkInventory:SendMessage( "EVENT_ARKINV_GETOBJECTINFO_QUEUE_UPDATE_BUCKET", "QUEUE_ADD" )
	
end

local function helper_UpdateObjectInfo( info, thread_id )
	
	local tmp
	
	if info.class == "item" or info.class == "keystone" then
		
--[[
		[01] = name
		[02] = h
		[03] = q
		[04] = ilvl_base
		[05] = uselevel
		[06] = type
		[07] = subtype
		[08] = stacksize
		[09] = equip
		[10] = texture
		[11] = vendor
		[12] = typeid
		[13] = subtypeid
		[14] = binding
			[00] = none
			[01] = on pickup
			[02] = on equip
			[03] = on use
			[04] = quest
		[15] = expansion
		[16] = setid
		[17] = craft
]]--
		
		
		local key = info.hs
		if info.class == "keystone" then
			key = info.osd.id
		end
		
		info.retry = ( info.retry or 0 ) + 1
		if info.retry >= ArkInventory.Const.ObjectDataMaxAttempts then
			info.ready = true
			info.dead = true
			return
		else
			info.ready = C_Item.IsItemDataCachedByID( key )
		end
		
		--ArkInventory.Output( "attempt #", info.retry, " ", info.hs )
		
		if not info.ready then
			--ArkInventory.OutputWarning( "data not cached for ", key, ", adding to queue" )
			if info.class == "keystone" then
				ArkInventory.GetObjectInfo( key )
			else
				helper_QueueAdd( key )
			end
		end
		
		tmp = { GetItemInfo( key ) }
		--ArkInventory.Output( "ready = ", info.ready, " / ", key )
		
		
		for x in pairs( { ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.TEXTURE, ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.NAME, ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.LINK, ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.QUALITY, ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.ILVL_BASE } ) do
			if tmp[x] == nil then
				--ArkInventory.OutputWarning( x, " is nil for ", key, " / ", info.ready, " / ", tmp )
				info.ready = false
			end
		end
		
		if not info.ready then
			local instant = { GetItemInfoInstant( info.id ) }
			tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.TYPE] = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.TYPE] or instant[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFOINSTANT.TYPE]
			tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.SUBTYPE] = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.SUBTYPE] or instant[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFOINSTANT.SUBTYPE]
			tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.EQUIP] = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.EQUIP] or instant[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFOINSTANT.EQUIP]
			tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.TEXTURE] = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.TEXTURE] or instant[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFOINSTANT.TEXTURE]
			tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.TYPEID] = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.TYPEID] or instant[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFOINSTANT.TYPEID]
			tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.SUBTYPEID] = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.SUBTYPEID] or instant[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFOINSTANT.SUBTYPEID]
		end
		
		helper_CorrectData( info, tmp )
		
		info.name = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.NAME] or info.name
		info.h = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.LINK] or info.h
		info.q = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.QUALITY] or info.q
		info.ilvl_base = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.ILVL_BASE] or info.ilvl_base
		info.uselevel = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.USELEVEL] or info.uselevel
		info.itemtype = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.TYPE] or info.itemtype
		info.itemsubtype = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.SUBTYPE] or info.itemsubtype
		info.stacksize = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.STACKSIZE] or info.stacksize
		info.equiploc = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.EQUIP] or info.equiploc
		info.texture = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.TEXTURE] or GetItemIcon( info.hs ) or info.texture
		info.vendorprice = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.VENDORPRICE] or info.vendorprice
		info.itemtypeid = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.TYPEID] or info.itemtypeid
		info.itemsubtypeid = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.SUBTYPEID] or info.itemsubtypeid
		info.binding = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.BINDING] or info.binding
		info.expansion = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.EXPANSION] or info.expansion
		info.setid = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.SETID]
		info.craft = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.CRAFT]
		
		
		if info.class == "keystone" then
			info.ilvl_base = info.osd.level or info.ilvl_base
		end
		
		
		
--		if info.id == 6948 then
--			--ArkInventory.Output( "debug: forcing hearthstone to be not ready" )
--			info.name = ArkInventory.Localise["DATA_NOT_READY"]
--		end

		--ArkInventory.OutputDebug( "name is [", info.name, "] for ", key, " / ", info.ready )
		if info.name == ArkInventory.Localise["DATA_NOT_READY"] then
			--ArkInventory.OutputDebug( "name is [", info.name, "] for ", key, " / ", info.ready )
			info.ready = false
		end
		
		if info.ready then
			
			info.ilvl = GetDetailedItemLevelInfo( info.hs ) or info.ilvl_base
			info.spell_name, info.spell_id = GetItemSpell( info.id )
			info.rank = ArkInventory.CrossClient.GetItemReagentQuality( info.hs ) or ArkInventory.CrossClient.GetItemCraftedQuality( info.hs )
			
			ArkInventory.TooltipSet( ArkInventory.Global.Tooltip.Scan, nil, nil, nil, info.hs )
			
			if not ArkInventory.TooltipIsReady( ArkInventory.Global.Tooltip.Scan ) then
				
				info.ready = false
				ArkInventory.OutputDebug( "scan tooltip is not ready for ", key, " / ", info.ready, " / ", info.h )
				
			else
				
				local ilvl
				local stock = -1
				
				
				if ArkInventory.Const.Slot.INVTYPE_SortOrder[info.equiploc] then
					if ArkInventory.Const.Slot.INVTYPE_SortOrder[info.equiploc] <= 0 then
						-- clear unwanted equipment types so they arent seen as equipable
						info.equiploc = ""
					end
				else
					-- clear unknown equipment types so they arent seen as equipable, and warn user about it
					if info.equiploc ~= "" then
						if not equiplocwarningsent[info.equiploc] then
							equiplocwarningsent[info.equiploc] = true
							ArkInventory.OutputWarning( "Equipment Location [", info.equiploc, "] is not coded, please let the author know." )
						end
						info.equiploc = ""
					end
				end
				
				if info.itemtypeid == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.PARENT then
					
					local stock1, stock2 = ArkInventory.TooltipMatch( ArkInventory.Global.Tooltip.Scan, nil, ArkInventory.Localise["WOW_TOOLTIP_ITEM_CONTAINER_SLOTS"], false, true, true )
					stock = ArkInventory.TooltipTextToNumber( stock1 )
					if not stock then
						stock = ArkInventory.TooltipTextToNumber( stock2 )
					end
					
				elseif info.itemsubtypeid == ArkInventory.ENUM.ITEM.TYPE.GEM.ARTIFACTRELIC then
					
					ilvl = ArkInventory.TooltipMatch( ArkInventory.Global.Tooltip.Scan, nil, ArkInventory.Localise["WOW_TOOLTIP_RELIC_LEVEL"], false, true, true, 0, ArkInventory.Const.Tooltip.Search.Short )
					ilvl = ArkInventory.TooltipTextToNumber( ilvl )
					
				elseif ArkInventory.CrossClient.IsAnimaItemByID( info.id ) or ArkInventory.PT_ItemInSets( info.id, "ArkInventory.Internal.ItemsWithStockValues" ) then
					
					stock = ArkInventory.TooltipMatch( ArkInventory.Global.Tooltip.Scan, nil, TooltipStockCapture1, false, true, false, 0, ArkInventory.Const.Tooltip.Search.Short )
					stock = ArkInventory.TooltipTextToNumber( stock )
					
					if not stock then
						
						stock = ArkInventory.TooltipMatch( ArkInventory.Global.Tooltip.Scan, nil, TooltipStockCapture2, false, true, false, 0, ArkInventory.Const.Tooltip.Search.Short )
						stock = ArkInventory.TooltipTextToNumber( stock )
						
						if not stock then
							
							stock = ArkInventory.TooltipMatch( ArkInventory.Global.Tooltip.Scan, nil, TooltipStockCapture3, false, true, false, 0, ArkInventory.Const.Tooltip.Search.Short )
							stock = ArkInventory.TooltipTextToNumber( stock )
							
						end
						
					end
					
				else
					
					ilvl = ArkInventory.TooltipMatch( ArkInventory.Global.Tooltip.Scan, nil, ArkInventory.Localise["WOW_TOOLTIP_ITEM_LEVEL"], false, true, true, 4, ArkInventory.Const.Tooltip.Search.Short )
					ilvl = ArkInventory.TooltipTextToNumber( ilvl )
					
				end
				
				if not stock then
					ArkInventory.OutputDebug( "stock is nil for ", info.name, " / ", key, " / ", info.ready )
					info.ready = false
				elseif stock ~= -1 then
					--ilvl = ilvl or stock
					--ArkInventory.Output( info.h, " = ", stock )
				end
				info.stock = stock or info.stock
				
				info.ilvl = ilvl or info.ilvl
				
			end
			
		end
		
	elseif info.class == "reputation" then
		
		info.ready = true
		
		tmp = ArkInventory.Collection.Reputation.GetByID( info.id )
		if tmp then
			info.h = tmp.link or info.h
			info.name = tmp.name or info.name
			info.texture = tmp.icon or info.texture
			info.ready = ArkInventory.Collection.Reputation.IsReady( )
		end
		
		if info.name == ArkInventory.Localise["DATA_NOT_READY"] then
			info.ready = false
		end
		
	elseif info.class == "spell" then
		
		
--[[
		[01] = name
		[02] = rank
		[03] = texture
]]--
		
		info.ready = true
		
		tmp = { GetSpellInfo( info.id ) }
		
		helper_CorrectData( info, tmp )
		
		info.h = GetSpellLink( info.id ) or info.hs
		info.name = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETITEMINFO.NAME] or info.name
		if info.name == ArkInventory.Localise["DATA_NOT_READY"] then
			info.ready = false
		end
		info.texture = tmp[ArkInventory.Const.BLIZZARD.FUNCTION.GETSPELLINFO.TEXTURE] or ArkInventory.Const.Texture.Missing
		info.q = ArkInventory.ENUM.ITEM.QUALITY.STANDARD
		
	elseif info.class == "battlepet" then
		
		info.ready = true
		
		info.sd = ArkInventory.Collection.Pet.GetSpeciesInfo( info.id )
		if info.sd then
			info.name = info.sd.name or info.name
			if info.name == ArkInventory.Localise["DATA_NOT_READY"] then
				info.ready = false
			end
			info.texture = info.sd.icon or info.texture
			info.itemsubtypeid = info.sd.petType or info.itemsubtypeid
		else
			info.ready = false
		end
		
		info.q = info.osd.q
		info.ilvl = info.osd.level or 1
		info.itemtypeid = ArkInventory.ENUM.ITEM.TYPE.BATTLEPET.PARENT
		
	elseif info.class == "currency" then
		
		info.ready = true
		
		tmp = ArkInventory.Collection.Currency.GetByID( info.id )
		
		if tmp then
			info.h = tmp.link or info.h
			info.name = tmp.name or info.name
			info.amount = tmp.quantity
			info.q = tmp.quality or info.q
			info.texture = tmp.iconFileID
			info.h = tmp.link
			info.ready = ArkInventory.Collection.Currency.IsReady( )
		end
		
		if info.name == ArkInventory.Localise["DATA_NOT_READY"] then
			info.ready = false
		end
		
	elseif info.class == "copper" then
		
		info.ready = true
		
	elseif info.class == "empty" then
		
		info.ready = true
		
		--ArkInventory.Output( info )
		info.texture = ""
		info.itemtypeid = ArkInventory.ENUM.ITEM.TYPE.EMPTY.PARENT
		info.itemsubtypeid = info.osd.bagtype
		info.itemsubtype = ArkInventory.Const.Slot.Data[info.osd.bagtype].name
		info.name = string.format( "%s - %s", ArkInventory.Localise["EMPTY"], info.itemsubtype )
		
	end
	
end

local function helper_Scan_Threaded( thread_id )
	
	ArkInventory.OutputDebug( "object queue size ", ArkInventory.Table.Elements( Queue ) )
	
	local redo = { }
	local clear = false
	
	for hs in pairs( Queue ) do
		
		--ArkInventory.Output( "getting object data for ", hs )
		
		local info = cacheGetObjectInfo[hs]
		helper_UpdateObjectInfo( info )
		
		ArkInventory.ThreadYield( thread_id )
		
		if info.ready or info.dead then
			Queue[hs] = nil
			clear = true
		else
			redo[hs] = true
		end
		
	end
	
	if clear then
		ArkInventory.ItemCacheClear( )
	end
	
	if #redo then
		for hs in pairs( redo ) do
			helper_QueueAdd( hs )
		end
	end
	
end

local function helper_Scan( )
	
	local thread_id = ArkInventory.Global.Thread.Format.ObjectData
	
	if not ArkInventory.Global.Thread.Use then
		local tz = debugprofilestop( )
		ArkInventory.OutputThread( thread_id, " start" )
		helper_Scan_Threaded( )
		tz = debugprofilestop( ) - tz
		ArkInventory.OutputThread( string.format( "%s took %0.0fms", thread_id, tz ) )
		return
	end
	
	local tf = function ( )
		helper_Scan_Threaded( thread_id )
	end
	
	ArkInventory.ThreadStart( thread_id, tf )
	
end

function ArkInventory:EVENT_ARKINV_GETOBJECTINFO_QUEUE_UPDATE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: QUEUE_UPDATE - ", event )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.Global.Mode.Combat then
		-- run after leaving combat
		return
	end
	
	if not scanning then
		scanning = true
		helper_Scan( )
		scanning = false
	else
		ArkInventory:SendMessage( "EVENT_ARKINV_GETOBJECTINFO_QUEUE_UPDATE_BUCKET", "BUSY" )
	end
	
	if ArkInventorySearch then
		--ArkInventorySearch.Frame_Table_Refresh( )
	end
	
end


function ArkInventory.ObjectStringDecode( h, i )
	
	local chs
	
	if h then
		chs = h and cacheObjectStringStandard[h]
		if chs and cacheObjectStringDecode[chs] then
			return cacheObjectStringDecode[chs]
		end
	end
	
	local h1 = string.trim( h or "" )
	local bt
	if h1 == "" and i then
		if i.h then
			h1 = i.h
		else
			local blizzard_id = ArkInventory.InternalIdToBlizzardBagId( i.loc_id, i.bag_id )
			bt = ArkInventory.BagType( blizzard_id )
			h1 = string.format( "empty:0:%s", bt )
		end
	end
	
	if h1 and h1 ~= "" then
		chs = cacheObjectStringStandard[h1]
		if chs and cacheObjectStringDecode[chs] then
			--ArkInventory.Output( "cached h1 [", h1, "] [", chs, "]", cacheObjectStringDecode[chs] )
			return cacheObjectStringDecode[chs]
		end
	end
	
	
	local h2
	if type( h ) == "number" then
		-- convert a number into an item link
		h2 = string.format( "item:%s", h )
	else
		-- pull out the item string
		h2 = string.match( h1, "|H(.-)|h" ) or string.match( h1, "^([a-z]-:.+)" ) or "empty:0:0"
	end
	
	if h2 and h2 ~= "" then
		chs = cacheObjectStringStandard[h2]
		if chs and cacheObjectStringDecode[chs] then
			--ArkInventory.Output( "cached h2 [", h2, "] [", chs, "]", cacheObjectStringDecode[chs] )
			return cacheObjectStringDecode[chs]
		end
	end
	
	-- data is not cached
	-- build it and cache it
	
	local osd = { strsplit( ":", h2 ) }
	
	local c = #osd
	
	local cmin = 20 + ( tonumber( osd[14] ) or 0 )
	if c < cmin then
		c = cmin
	end
	
	for x = 2, c do
		if not osd[x] or osd[x] == "" then
			osd[x] = 0
		else
			osd[x] = tonumber( osd[x] ) or osd[x]
		end
	end
	
	osd.class = osd[1]
	osd.id = osd[2]
	osd.h = h2
	osd.h_base = string.format( "%s:%s", osd.class, osd.id )
	--osd.name = string.match( h1, "|h%[(.-)]|h" )
	osd.slottype = bt
	
	if osd.class == "item" then
		
		--[[
			[01]class
			[02]itemid
			[03]enchantid
			[04]gem1
			[05]gem2
			[06]gem3
			[07]gem4
			[08]suffixid
			[09]uniqueid
			[10]linklevel
				reset to 0 for consistency
			[11]specid
				reset to 0 for consistency
				for values see https://wowpedia.fandom.com/wiki/SpecializationID
			[12]upgradetypeid
				4 = pandaria x/4
				512 = timewarped
			[13]souce / instance difficulty id
				reset to 0 for consistency
				for values see https://wowpedia.fandom.com/wiki/DifficultyID
			[14]numbonusids
			[..]bonusids
			[15]upgradevalue
			[16]??
			[17]rank (in df)
			[18]??
			[19]??
			[20]??
			++++
			[21]numrelics1
			[..]ids
			[22]numrelics2
			[..]ids
			[23]numrelics3
			[..]ids
			++++
			[21]player guid
			[22]??
			
			
			
		]]--
		
		osd.enchantid = osd[3]
		
		osd.gemid = { osd[4], osd[5], osd[6], osd[7] }
		
		osd.suffixid = osd[8] -- only applies to old items, new items use a bonusid for the suffix
		osd.uniqueid = osd[9]
		
		osd.suffixfactor = 0
		if osd.suffixid < 0 then
			osd.suffixfactor = bit.band( osd.uniqueid, 65535 )
		end
		
		--osd.linklevel = osd[10]
		osd[10] = 0 -- zero out for a more consistent exrid (its the characters current level)
		
		--osd.specid = osd[11]
		osd[11] = 0 -- zero out for a more consistent exrid (its the characters current spec)
		
		osd.upgradeid = osd[12]
		
		osd.sourceid = osd[13]
		osd[13] = 0 -- zero out for a more consistent exrid (its the same item so it doesnt matter where it came from)
		
		local pos = 14
		
		-- [14] bonus ids
		if osd[pos] and osd[pos] > 0 then
			osd.bonusids = { }
			for x = pos + 1, pos + osd[pos] do
				osd.bonusids[osd[x]] = true
			end
			pos = pos + osd[pos]
		end
		pos = pos + 1
		
		-- [15] upgrade level
		osd.upgradelevel = osd[pos]
		pos = pos + 1
		
		-- [16] unknown
		osd.unknown1 = osd[pos]
		pos = pos + 1
		
		-- [17] unknown
		osd.unknown2 = osd[pos]
		pos = pos + 1
		
		-- [18] unknown
		osd.unknown3 = osd[pos]
		pos = pos + 1
		
		-- [19] unknown
		osd.unknown4 = osd[pos]
		pos = pos + 1
		
		-- [20] unknown
		osd.unknown5 = osd[pos]
		pos = pos + 1
		
		-- everything up to here should exist in the itemstring
		-- after this, seems to be specific to the item type
		
		if pos <= c then
			-- record start position of custom values
			osd.custom = pos
		end
		
		-- build an extended rule id for equipable items (it gets added onto the basic id)
		osd.exrid = osd[3]
		for k = 4, pos - 1 do
			osd.exrid = string.format( "%s:%s", osd.exrid, osd[k] or 0 )
		end
		
		-- build a sanitised itemstring (no character level or spec)
		osd.h_rule = string.format( "%s:%s", osd.h_base, osd.exrid )
		
	elseif osd.class == "keystone" then
		
		-- keystone:138019:239:2:0:0:0:0
		--[[
			[01]class
			[02]itemid
			[03]instance
			[04]level
			[05]status (2=active, ?=depleted)
			[06]affix1
			[07]affix2
			[08]affix3
			[09]affix4
		]]--
		
		osd.instance = osd[3]
		osd.level = osd[4]
		osd.status = osd[5]
		
		-- affix ids
		for x = 6, 9 do
			if osd[x] ~= 0 then
				if not osd.bonusids then
					osd.bonusids = { }
				end
				osd.bonusids[osd[x]] = true
			end
		end
		
	elseif osd.class == "reputation" then
		
		-- custom reputation hyperlink
		
		--[[
			[01]class
			[02]factionId
			[03]standingText
			[04]barValue
			[05]barMin
			[06]barMax
			[07]isCapped
			[08]paragonLevel
			[09]paragonReward
			[10]rankValue
			[11]rankMax
		]]--
		
		osd.st = osd[3]
		osd.bv = osd[4]
		osd.bn = osd[5]
		osd.bm = osd[6]
		osd.ic = osd[7]
		osd.pv = osd[8]
		osd.pr = osd[9]
		osd.rv = osd[10]
		osd.rm = osd[11]
		
	elseif osd.class == "spell" then
		
		--[[
			[01]class
			[02]spellId
			[03]glyphId
			[04]???
		]]--
		
		osd.glyphid = osd[3]
		
	elseif osd.class == "battlepet" then
		
		--[[
			[01]class
			[02]species
			[03]level
			[04]quality
			[05]maxhealth
			[06]power
			[07]speed
			[08]name (can also be guid, api is inconsistent)
			[09]guid (BattlePet-[unknowndata]-[creatureID])
		]]--
		
		osd.level = osd[3]
		osd.q = osd[4]
		osd.health = osd[5] 
		osd.power = osd[6]
		osd.speed = osd[7]
		
		if type( osd[8] ) == "string" then
			if string.match( osd[8], "BattlePet(.+)" ) then
				--ArkInventory.Output( "moving ", osd[8], " guid is in name slot" )
				osd[9] = osd[8]
				osd[8] = ""
			end
		else
			osd[8] = ""
		end
		
		if type( osd[9] ) == "string" then
			if not string.match( osd[9], "BattlePet(.+)" ) then
				--ArkInventory.Output( "fail ", osd[9], " is not the correct format" )
				--ArkInventory.Output( s )
				osd[9] = ""
			end
		else
			osd[9] = ""
		end
		
		osd.cn = osd[8]
		osd.guid = osd[9]
		
	elseif osd.class == "currency" then
		
		
		
	elseif osd.class == "copper" then
		
		--[[
			[01]class
			[02]not used (always 0)
			[03]amount
		--]]
		
		osd.amount = osd[3]
		
	elseif osd.class == "empty" then
		
		--[[
			[01]class
			[02]not used (always 0)
			[03]bag type
		--]]
		
		osd.bagtype = osd[3]
		
	end
	
	osd.h1 = h1
	osd.h2 = h2
	
	local hs = table.concat( osd, ":" )
	osd.hs = hs
	cacheObjectStringDecode[hs] = osd
	
	if h and h ~= "" then
		cacheObjectStringStandard[h] = hs
	end
	
	if h1 and h1 ~= "" then
		cacheObjectStringStandard[h1] = hs
	end
	
	if h2 and h2 ~= "" then
		cacheObjectStringStandard[h2] = hs
	end
	
	cacheObjectStringStandard[hs] = hs
	return cacheObjectStringDecode[hs]
	
end

function ArkInventory.GetObjectInfo( h, i )
	
	local chs = h and cacheObjectStringStandard[h]
	local info = chs and cacheGetObjectInfo[chs]
	if info then
		if not info.ready then
			helper_QueueAdd( info.osd.hs )
		end
		return info
	end
	
	
	local osd = ArkInventory.ObjectStringDecode( h, i )
	
	if not osd.class or not osd.id then
		ArkInventory.OutputError( "code failure: invalid class [", osd.class, ":", osd.id, "]" )
		error( "code failure" )
	end
	
	chs = osd.hs and cacheObjectStringStandard[osd.hs]
	info = chs and cacheGetObjectInfo[chs]
	if info then
		if not info.ready then
			helper_QueueAdd( info.osd.hs )
		end
		return info
	end
	
	
	info = info or { }
	
	info.osd = info.osd or ArkInventory.ObjectStringDecode( h, i )
	
	info.class = info.osd.class
	info.id = info.osd.id
	info.hs = info.osd.hs
	info.h = info.osd.h
	
	info.name = ArkInventory.Localise["DATA_NOT_READY"]
	info.q = ArkInventory.ENUM.ITEM.QUALITY.UNKNOWN
	info.rank = nil
	info.ilvl_base = -2
	info.ilvl = -2
	info.uselevel = -2
	info.itemtype = ArkInventory.Localise["UNKNOWN"]
	info.itemsubtype = ArkInventory.Localise["UNKNOWN"]
	info.stacksize = 1
	info.stock = -1
	info.equiploc = ""
	info.texture = ArkInventory.Const.Texture.Missing
	info.vendorprice = -1
	info.itemtypeid = -2
	info.itemsubtypeid = -2
	info.binding = 0
	info.expansion = ArkInventory.ENUM.EXPANSION.CLASSIC
	
	helper_UpdateObjectInfo( info )
	
	--ArkInventory.Output( info.ready, " = ", info )
	
	if info.class == "copper" then
		
		-- do not cache money
		
	--elseif info.class == "empty" then
		
		-- do not cache empty slots - why not??
		
	else
		
		if h and h ~= "" then
			
			cacheObjectStringStandard[h] = info.osd.hs
			cacheGetObjectInfo[h] = info
			
			if info.ready then
				ArkInventory.ItemCacheClear( h )
			end
			
		end
		
		cacheGetObjectInfo[info.osd.hs] = info
		cacheGetObjectInfo[info.osd.h1] = info
		cacheGetObjectInfo[info.osd.h2] = info
		
		
	end
	
	if not info.ready then
		--ArkInventory.Output( "debug: object not ready ", info.h )
		helper_QueueAdd( info.osd.hs )
	end
	
	return info
	
end

function ArkInventory.ObjectInfoItemString( h )
	local osd = ArkInventory.ObjectStringDecode( h )
	return osd.h
end

function ArkInventory.ObjectInfoName( h )
	local info = ArkInventory.GetObjectInfo( h )
	return info.name or "!"
end

function ArkInventory.ObjectInfoTexture( h )
	local info = ArkInventory.GetObjectInfo( h )
	return info.texture
end

function ArkInventory.ObjectInfoQuality( h )
	local info = ArkInventory.GetObjectInfo( h )
	return info.q or ArkInventory.ENUM.ITEM.QUALITY.UNKNOWN
end

function ArkInventory.ObjectInfoVendorPrice( h )
	local info = ArkInventory.GetObjectInfo( h )
	return info.vendorprice or -1
end

function ArkInventory.ObjectIDClean( h )
	local h = h
	h = string.gsub( h, ":0", ":" )
	h = string.match( h, "(.-):*$" )
	return h
end


local cacheObjectIDBonus = { }

function ArkInventory.ObjectIDBonusClear( t )
	ArkInventory.PT_BonusIDIsWantedClear( t )
	ArkInventory.Table.Wipe( cacheObjectIDBonus[t] )
end

function ArkInventory.ObjectIDBonus( t, h, i )
	
	local hr = string.trim( h or "" )
	
	if not cacheObjectIDBonus[t] then
		cacheObjectIDBonus[t] = { }
	end
	
	if cacheObjectIDBonus[t][hr] then
		return cacheObjectIDBonus[t][hr]
	end
	
	local osd = ArkInventory.ObjectStringDecode( hr, i )
	
	local v = osd.h_base
	
	if osd.class == "empty" then
		
		v = osd.h1
		
	elseif osd.class == "item" then
		
		v = string.format( "%s:0:0:0:0:0", v )
		
		if ( t == ArkInventory.Const.IDType.Count and ArkInventory.db.option.bonusid.count.suffix ) or ( t == ArkInventory.Const.IDType.Search and ArkInventory.db.option.bonusid.search.suffix ) then
			if osd.suffixid == 0 then
				v = string.format( "%s:0:0", v )
			else
				v = string.format( "%s:%s:%s", v, osd.suffixid, osd.uniqueid )
			end
		else
			v = string.format( "%s:0:0", v )
		end
		
		v = string.format( "%s:0:0:0:0", v )
		
		if osd.bonusids then
			
			local c = 0
			local r = ""
			local id
			
			for bid in pairs( osd.bonusids ) do
				id = ArkInventory.PT_BonusIDIsWanted( t, bid )
				if id then
					c = c + 1
					r = string.format( "%s:%s", r, id )
				end
			end
			
			v = string.format( "%s:%s%s", v, c, r )
			
		else
			v = string.format( "%s:0", v )
		end
		
		v = string.format( "%s:0", v )
		
		v = ArkInventory.ObjectIDClean( v )
		
	end
	
	if hr ~= "" then
		cacheObjectIDBonus[t][hr] = v
	end
	
	return v
	
end


local cacheObjectIDCount = { }

function ArkInventory.ObjectIDCountClear( )
	ArkInventory.ObjectIDBonusClear( ArkInventory.Const.IDType.Count )
	ArkInventory.Table.Wipe( cacheObjectIDCount )
end

function ArkInventory.ObjectIDCount( h, i )
	
	local hr = string.trim( h or "" )
	
	if cacheObjectIDCount[hr] then
		return cacheObjectIDCount[hr]
	end
	
	local v = ArkInventory.ObjectIDBonus( ArkInventory.Const.IDType.Count, h, i )
	
	if hr ~= "" then
		cacheObjectIDCount[hr] = v
	end
	
	return v
	
end

function ArkInventory.ObjectIDCategory( i, isRule )
	
	-- if you change these values then you need to upgrade the savedvariable data as well
	
	local soulbound = ArkInventory.ENUM.BIND.NEVER
	if ArkInventory.IsBound( i.sb ) then
		soulbound = 1
	end
	
	local info = ArkInventory.GetObjectInfo( i.h )
	local osd = info.osd
	local r
	
	if osd.class == "item" then
		r = string.format( "%s:%i:%i", osd.class, osd.id, soulbound )
		if isRule and info.equiploc ~= "" then
			-- equipable items get an expanded rule id
			r = string.format( "%s:%s", r, osd.exrid )
		end
	elseif osd.class == "empty" then
		local blizzard_id = ArkInventory.InternalIdToBlizzardBagId( i.loc_id, i.bag_id )
		soulbound = ArkInventory.BagType( blizzard_id ) -- allows for unique codes per bag type
		r = string.format( "%s:%i:%i", osd.class, osd.id, soulbound )
	elseif osd.class == "spell" or osd.class == "currency" or osd.class == "copper" or osd.class == "reputation" or osd.class == "enchant" then
		r = string.format( "%s:%i", osd.class, osd.id )
	elseif osd.class == "battlepet" then
		r = string.format( "%s:%i:%i", osd.class, osd.id, soulbound )
	elseif osd.class == "keystone" then
		r = string.format( "%s:%i:%i", osd.class, osd.instance, soulbound )
	else
		ArkInventory.OutputWarning( "uncoded object class [", i.h, "] = [", osd.class, "] [", soulbound, "]" )
		r = string.format( "%s:%i:%i", osd.class, osd.id, soulbound )
	end
	
	local codex = ArkInventory.GetLocationCodex( i.loc_id )
	local cr = string.format( "%i:%s", codex.catset_id, r )
	
	return cr, r, codex
	
end

function ArkInventory.ObjectIDRule( i )
	-- not saved, cached only, can be changed at any time
	local id, _, codex = ArkInventory.ObjectIDCategory( i, true )
	local rid = string.format( "%i:%i:%i:%i:%s", i.loc_id or 0, i.bag_id or 0, i.slot_id or 0, i.sb or ArkInventory.ENUM.BIND.NEVER, id )
	return rid, id, codex
end

function ArkInventory.ObjectIDStack( bar_id, i )
	local id = ArkInventory.ObjectIDCategory( i )
	return string.format( "%s-%s", bar_id, id )
end

local cacheObjectIDSearch = { }

function ArkInventory.ObjectIDSearchClear( )
	ArkInventory.ObjectIDBonusClear( ArkInventory.Const.IDType.Search )
	ArkInventory.Table.Wipe( cacheObjectIDSearch )
end

function ArkInventory.ObjectIDSearch( h, i )
	
	local hr = string.trim( h or "" )
	
	if cacheObjectIDSearch[hr] then
		return cacheObjectIDSearch[hr]
	end
	
	local v = ArkInventory.ObjectIDBonus( ArkInventory.Const.IDType.Search, h, i )
	
	if hr ~= "" then
		cacheObjectIDSearch[hr] = v
	end
	
	return v
	
end

function ArkInventory:EVENT_ARKINV_ITEM_DATA_LOAD_RESULT( ... )
	
	local event, id, success = ...
--	ArkInventory.OutputDebug( "[", event, "] [", id, "] [", success, "]" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_GETOBJECTINFO_QUEUE_UPDATE_BUCKET", event or "ITEM_DATA_READY" )
	
end
