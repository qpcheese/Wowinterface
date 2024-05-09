local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


local loc_id = ArkInventory.Const.Location.Currency

ArkInventory.Collection.Currency = { }

local collection = {
	
	isInit = false,
	isReady = false,
	isScanning = false,
	
	numTotal = 0, -- number of total currencies
	numOwned = 0, -- number of known currencies
	
	list = { }, -- [index] = { } - currencies and headers from the blizard frame
	cache = { }, -- [id] = { } - all currencies
	
	filter = {
		expanded = { },
		backup = false,
	},
}

local ImportCrossRefTable = true

function ArkInventory.Collection.Currency.ImportCrossRefTable( )
	
	if not ImportCrossRefTable then return end
	
	local cid, key1, key2
	
	for item, value in ArkInventory.Lib.PeriodicTable:IterateSet( "ArkInventory.System.XREF.Currency" ) do
		
		cid = tonumber( value ) or 0
		
		if cid > 0 then
			
			key1 = ArkInventory.ObjectIDCount( string.format( "item:%s", item ) )
			key2 = ArkInventory.ObjectIDCount( string.format( "currency:%s", cid ) )
			
			--ArkInventory.Output2( key1, " / ", key2 )
			
			if not ArkInventory.Global.ItemCrossReference[key1] then
				ArkInventory.Global.ItemCrossReference[key1] = { }
			end
			
			ArkInventory.Global.ItemCrossReference[key1][key2] = true
			
			if not ArkInventory.Global.ItemCrossReference[key2] then
				ArkInventory.Global.ItemCrossReference[key2] = { }
			end
			
			ArkInventory.Global.ItemCrossReference[key2][key1] = true
			
		end
		
	end
	
	ImportCrossRefTable = nil
	
end

local function FilterActionBackup( )
	
	if collection.filter.backup then return end
	
	local n, e, c
	local p = 0
	ArkInventory.Table.Wipe( collection.filter.expanded )
	
	repeat
		
		p = p + 1
		n = ArkInventory.CrossClient.GetCurrencyListSize( )
		--ArkInventory.Output( "pass=", p, " num=", n )
		e = true
		
		for index = 1, n do
			
			local info = ArkInventory.CrossClient.GetCurrencyListInfo( index )
			
			if info.isHeader and not info.isHeaderExpanded then
				--ArkInventory.Output( "expand header i=[",index,"] [", info.name, "]" )
				collection.filter.expanded[index] = true
				ArkInventory.CrossClient.ExpandCurrencyHeader( index )
				e = false
				break
			end
			
		end
		
	until e or p > n * 1.5
	
	collection.filter.backup = true
	
end

local function FilterActionRestore( )
	
	if not collection.filter.backup then return end
	
	local n = ArkInventory.CrossClient.GetCurrencyListSize( )
	
	for index = n, 1, -1 do
		
		if collection.filter.expanded[index] then
			local info = ArkInventory.CrossClient.GetCurrencyListInfo( index )
			--ArkInventory.Output( "collapse header i=[",index,"] [", info.name, "]" )
			ArkInventory.CrossClient.CollapseCurrencyHeader( index )
		end
		
	end
	
	collection.filter.backup = false
	
end


function ArkInventory.Collection.Currency.OnHide( )
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_CURRENCY_UPDATE_BUCKET", "FRAME_CLOSED" )
end

function ArkInventory.Collection.Currency.IsReady( )
	return collection.isReady
end

function ArkInventory.Collection.Currency.GetCount( )
	return collection.numOwned, collection.numTotal
end

function ArkInventory.Collection.Currency.Iterate( )
	local t = collection.cache
	return ArkInventory.spairs( t, function( a, b ) return ( t[a].name or "" ) < ( t[b].name or "" ) end )
end

function ArkInventory.Collection.Currency.ListIterate( )
	local t = collection.list
	return ArkInventory.spairs( t, function( a, b ) return ( t[a].index or 0 ) < ( t[b].index or 0 ) end )
end

function ArkInventory.Collection.Currency.GetByID( id )
	if type( id ) == "number" then
		return collection.cache[id]
	end
end

function ArkInventory.Collection.Currency.GetByIndex( index )
	if type( index ) == "number" then
		return collection.list[index]
	end
end

--function ArkInventory.Collection.Currency.GetByName( name )
--	if type( name ) == "string" and name ~= "" then
--		local obj = ArkInventory.Collection.Currency.GetByID( collection.namecache[name] )
--		if obj then
--			return obj.id, obj
--		end 
--	end
--end

function ArkInventory.Collection.Currency.ListSetActive( index, state, bulk )
	
	if type( index ) ~= "number" then return end
	if type( state ) ~= "boolean" then return end
	
	if not bulk then
		FilterActionBackup( )
	end
	
	local entry = ArkInventory.Collection.Currency.GetByIndex( index )
	if entry then
		
		--ArkInventory.Output2( index, " / ", state, " / ", entry.active )
		
		if state ~= entry.active then
			--ArkInventory.Output( "Change: ", state, ", INDEX[=", entry.index, "] NAME=[", entry.name, "]" )
			ArkInventory.CrossClient.SetCurrencyUnused( index, not state )
		end
		
	end
	
	if not bulk then
		FilterActionRestore( )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_CURRENCY_UPDATE_BUCKET", "TOGGLE_ACTIVE" )
	end
	
end

function ArkInventory.Collection.Currency.ReactivateAll( )
	
	FilterActionBackup( )
	
	for _, entry in ArkInventory.Collection.Currency.ListIterate( ) do
		if not entry.isHeader then
			--ArkInventory.Output( "activate ", entry.index )
			ArkInventory.Collection.Currency.ListSetActive( entry.index, true, true )
		end
	end
	
	FilterActionRestore( )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_CURRENCY_UPDATE_BUCKET", "REACTIVATE_ALL" )
	
end


local function ScanBase( id )
	
	if type( id ) ~= "number" then
		return
	end
	
	local cache = collection.cache
	
	if not cache[id] then
		
		if id > 0 then
			
			local info = ArkInventory.CrossClient.GetCurrencyInfo( id )
			
			if info and info.name and info.name ~= "" then
				
			-- /dump GetCurrencyInfo( 1342 ) legionfall war supplies (has a maximum)
			-- /dump C_CurrencyInfo.GetBasicCurrencyInfo( 1342 )
			-- /dump GetCurrencyInfo( 1220 ) order resources (no limits)
			-- /dump C_CurrencyInfo.GetBasicCurrencyInfo( 1220 ) order resources (no limits)
			-- /dump GetCurrencyInfo( 1314 ) order resources (no limits)
				
				cache[id] = info
				
				cache[id].id = id
				cache[id].link = ArkInventory.CrossClient.GetCurrencyLink( id, 0 )
				
				collection.numTotal = collection.numTotal + 1
				
				--ArkInventory.OutputDebug( "CURRENCY: ", id, " = ", info.name )
				
			end
			
		else
			
			local name = string.format( "Header %s", math.abs( id ) )
			
			cache[id] = {
				id = id,
				link = "",
				name = name,
				iconFileID = "",
				maxWeeklyQuantity = 0,
				maxQuantity = 0,
				quality = 0,
			}
			
		end
		
	end
	
end

local function ScanInit( )
	
	ArkInventory.OutputDebug( "CURRENCY: Init - Start Scan @ ", time( ) )
	
	for id = 1, 5000 do
		ScanBase( id )
	end
	
	if collection.numTotal > 0 then
		collection.isInit = true
	end
	
	ArkInventory.OutputDebug( "CURRENCY: Init - End Scan @ ", time( ), " total = [", collection.numTotal, "]" )
	
end

local function Scan_Threaded( thread_id )
	
	local update = false
	
	local numOwned = 0
	local YieldCount = 0
	
	ArkInventory.OutputDebug( "CURRENCY: Start Scan @ ", time( ) )
	
	if not collection.isInit then
		ScanInit( )
		ArkInventory.ThreadYield_Scan( thread_id )
	end
	
	FilterActionBackup( )
	
	-- scan the currency frame (now fully expanded) for known currencies
	
	ArkInventory.Table.Wipe( collection.list )
	local cache = collection.cache
	local list = collection.list
	local active = true
	local fakeID = 0
	local parentIndex
	local childIndex
	
	for index = 1, ArkInventory.CrossClient.GetCurrencyListSize( ) do
		
		YieldCount = YieldCount + 1
		
		if TokenFrame:IsVisible( ) then
			ArkInventory.OutputDebug( "CURRENCY: ABORTED (FRAME WAS OPENED)" )
			--FilterActionRestore( )
			--return
		end
		
		local currencyInfo = ArkInventory.CrossClient.GetCurrencyListInfo( index )
		if currencyInfo then
			
			--ArkInventory.OutputDebug( "CURRENCY: ", index, " = ", currencyInfo )
			
			if currencyInfo.currencyID then
				currencyID = currencyInfo.currencyID
			else
				-- cater for list headers like other and inactive that dont have a faction id assigned to them
				fakeID = fakeID - 1
				currencyID = fakeID
			end
			
			if not list[index] then
				list[index] = {
					index = index,
					id = currencyID,
					name = currencyInfo.name,
					description = currencyInfo.description,
					isHeader = currencyInfo.isHeader,
					hasCurrency = currencyInfo.hasCurrency,
					isChild = currencyInfo.isChild,
					parentIndex = nil,
					data = nil, -- will eventually point to a cache entry
				}
			end
			
			if currencyInfo.isHeader then
				
				childIndex = index
				
				if currencyInfo.isChild then
					
					list[index].parentIndex = parentIndex
					
				else
					
					if currencyInfo.name == ArkInventory.Localise["UNUSED"] then
						--ArkInventory.OutputDebug( "CURRENCY: unused header at ", index, " = ", currencyInfo )
						active = false
					end
					
					parentIndex = index
					
					--ArkInventory.OutputDebug( "CURRENCY: header at ", index, " = ", currencyInfo )
					
				end
				
			end
			
			if (not currencyInfo.isHeader) or currencyInfo.hasCurrency then
				
				local id = currencyInfo.name and currencyInfo.name ~= "" and currencyID
				if id then
					
					numOwned = numOwned + 1
					
					if not cache[id] then
						ScanBase( id )
						update = true
					end
					
					list[index].data = cache[id]
					
					if not currencyInfo.isHeader then
						list[index].parentIndex = childIndex
					end
					
					-- update cached data if changed
					
					if cache[id].index ~= index then
						cache[id].index = index
						update = true
					end
					
					if cache[id].name ~= currencyInfo.name then
						cache[id].name = currencyInfo.name
						update = true
					end
					
					if cache[id].owned ~= true then
						cache[id].owned = true
						update = true
					end
					
					if cache[id].isShowInBackpack ~= currencyInfo.isShowInBackpack then
						cache[id].isShowInBackpack = currencyInfo.isShowInBackpack
						update = true
					end
					
					if cache[id].quantity ~= currencyInfo.quantity then
						cache[id].quantity = currencyInfo.quantity
						update = true
					end
					
					if cache[id].quantityEarnedThisWeek ~= currencyInfo.quantityEarnedThisWeek then
						cache[id].quantityEarnedThisWeek = currencyInfo.quantityEarnedThisWeek
						update = true
					end
					
					if cache[id].discovered ~= discovered then
						cache[id].discovered = discovered
						update = true
					end
					
				else
					ArkInventory.OutputWarning( "unable to find cached data @ ", index, " - ", currencyInfo )
				end
				
			end
			
			list[index].active = active
			
		end
		
		if YieldCount % ArkInventory.Const.YieldAfter == 0 then
			ArkInventory.ThreadYield_Scan( thread_id )
		end
		
	end
	
	ArkInventory.ThreadYield_Scan( thread_id )
	
	FilterActionRestore( )
	
	collection.numOwned = numOwned
	
	ArkInventory.OutputDebug( "CURRENCY: End Scan @ ", time( ), " [", collection.numOwned, "] [", collection.numTotal, "] [", update, "]" )
	
	if not collection.isReady then
		collection.isReady = true
		ArkInventory:SendMessage( "EVENT_ARKINV_LDB_CURRENCY_UPDATE_BUCKET" )
	end
	
	if update then
		ArkInventory.ScanLocation( loc_id )
		ArkInventory.Frame_Status_Update_Tracking( loc_id )
		ArkInventory:SendMessage( "EVENT_ARKINV_LDB_CURRENCY_UPDATE_BUCKET" )
	end
	
end

local function Scan( )
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Collection, "currency" )
	
	if not ArkInventory.Global.Thread.Use then
		local tz = debugprofilestop( )
		ArkInventory.OutputThread( thread_id, " start" )
		Scan_Threaded( )
		tz = debugprofilestop( ) - tz
		ArkInventory.OutputThread( string.format( "%s took %0.0fms", thread_id, tz ) )
		return
	end
	
	local tf = function ( )
		Scan_Threaded( thread_id )
	end
	
	ArkInventory.ThreadStart( thread_id, tf )
	
end


function ArkInventory:EVENT_ARKINV_COLLECTION_CURRENCY_UPDATE_BUCKET( events )
	
	--ArkInventory.Output( "CURRENCY BUCKET [", events, "]" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.Global.Mode.Combat then
		-- set to scan when leaving combat
		ArkInventory.Global.ScanAfterCombat[loc_id] = true
		return
	end
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		--ArkInventory.Output( "IGNORED (CURRENCY NOT MONITORED)" )
		return
	end
	
	if TokenFrame:IsVisible( ) then
		--ArkInventory.Output( "IGNORED (CURRENCY FRAME IS OPEN)" )
		return
	end
	
	if IsMounted( ) then
		-- set to scan after dismounting
		ArkInventory.Global.ScanAfterDismount[loc_id] = true
		return
	end
	
	if not collection.isScanning then
		collection.isScanning = true
		--ArkInventory.Output( "CURRENCY SCAN" )
		Scan( )
		collection.isScanning = false
	else
		--ArkInventory.Output( "IGNORED (CURRENCY BEING SCANNED - WILL RESCAN WHEN DONE)" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_CURRENCY_UPDATE_BUCKET", "RESCAN" )
	end
	
end

function ArkInventory:EVENT_ARKINV_COLLECTION_CURRENCY_UPDATE( event, ... )
	-- /run ArkInventory:EVENT_ARKINV_COLLECTION_CURRENCY_UPDATE( "Test" )
	
	--ArkInventory.Output( "CURRENCY UPDATE [", event, "]" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_CURRENCY_UPDATE_BUCKET", event )
	
end
