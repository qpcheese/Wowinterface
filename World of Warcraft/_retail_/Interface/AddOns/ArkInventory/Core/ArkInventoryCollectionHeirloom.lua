local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table
local C_Heirloom = _G.C_Heirloom


local loc_id = ArkInventory.Const.Location.Heirloom

ArkInventory.Collection.Heirloom = { }

local collection = {
	
	isReady = false,
	isScanning = false,
	
	numTotal = 0,
	numOwned = 0,
	
	cache = { },
	
}


-- the UI filters have no impact on the heirloom source so we can safely ignore them

function ArkInventory.Collection.Heirloom.OnHide( )
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE_BUCKET", "FRAME_CLOSED" )
end

function ArkInventory.Collection.Heirloom.IsReady( )
	return collection.isReady
end

function ArkInventory.Collection.Heirloom.GetCount( )
	return collection.numOwned, collection.numTotal
end

function ArkInventory.Collection.Heirloom.Iterate( )
	local t = collection.cache
	return ArkInventory.spairs( t, function( a, b ) return ( t[a].index or 0 ) < ( t[b].index or 0 ) end )
end


local function Scan_Threaded( thread_id )
	
	local update = false
	
	local numTotal = 0
	local numOwned = 0
	
	--ArkInventory.Output( "Heirloom: Start Scan @ ", time( ) )
	
	local c = collection.cache
	
	local data_source = C_Heirloom.GetHeirloomItemIDs( )
	
	for _, index in pairs( data_source ) do
		
		if HeirloomsJournal:IsVisible( ) then
			ArkInventory.OutputDebug( "HEIRLOOM: ABORTED (HEIRLOOM FRAME WAS OPENED)" )
			return
		end
		
		if ArkInventory.Global.Mode.Combat then
			ArkInventory.OutputDebug( "HEIRLOOM: ABORTED (ENTERED COMBAT)" )
			ArkInventory.Global.ScanAfterCombat[loc_id] = true
			return
		end
		
		if ArkInventory.Global.Mode.DragonRace then
			ArkInventory.OutputDebug( "HEIRLOOM: ABORTED (DRAGON RACE)" )
			ArkInventory.Global.ScanAfterDragonRace[loc_id] = true
			return
		end
		
		
		numTotal = numTotal + 1
		
		local name, itemEquipLoc, isPvP, icon, upgradeLevel, source, searchFiltered, effectiveLevel, useLevel, maxLevel = C_Heirloom.GetHeirloomInfo( index )
		local isOwned = C_Heirloom.PlayerHasHeirloom( index )
		
		local i = index
		
		if not c[i] then
			update = true
			c[i] = { index = index }
		end
		
		if c[i].name ~= name or c[i].index ~= index then
			
			update = true
			
			c[i].index = index
			c[i].name = name
			c[i].itemEquipLoc = itemEquipLoc
			c[i].isPvP = isPvP
			c[i].icon = icon
			c[i].source = source
			c[i].maxLevel = maxLevel
			
			c[i].item = index
			c[i].link = C_Heirloom.GetHeirloomLink( i )
			
		end
		
		if c[i].upgradeLevel ~= upgradeLevel then
			update = true
			c[i].upgradeLevel = upgradeLevel
		end
		
		if c[i].effectiveLevel ~= effectiveLevel then
			update = true
			c[i].effectiveLevel = effectiveLevel
		end
		
		if c[i].useLevel ~= useLevel then
			update = true
			c[i].useLevel = useLevel
		end
		
		if isOwned then
			numOwned = numOwned + 1
		end
		
		if c[i].owned ~= isOwned then
			update = true
			c[i].owned = isOwned
		end
		
	end
	
	ArkInventory.ThreadYield_Scan( thread_id )
	
	collection.numOwned = numOwned
	collection.numTotal = numTotal
	
	--ArkInventory.Output( "Heirloom: End Scan @ ", time( ), " [", collection.numOwned, "] [", collection.numTotal, "] [", update, "]" )
	
	collection.isReady = true
	
	if update then
		ArkInventory.ScanLocation( loc_id )
	end
	
end

local function Scan( )
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Collection, "heirloom" )
	
	local thread_func = function( )
		Scan_Threaded( thread_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end


function ArkInventory:EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE_BUCKET( events )
	
	--ArkInventory.Output( "HEIRLOOM BUCKET [", events, "]" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		--ArkInventory.Output( "IGNORED (HEIRLOOMS NOT MONITORED)" )
		return
	end
	
	if HeirloomsJournal:IsVisible( ) then
		--ArkInventory.Output( "ABORTED (HEIRLOOMS FRAME IS OPEN)" )
		return
	end
	
	if ArkInventory.Global.Mode.Combat then
		ArkInventory.Global.ScanAfterCombat[loc_id] = true
		return
	end
	
	if ArkInventory.Global.Mode.DragonRace then
		ArkInventory.Global.ScanAfterDragonRace[loc_id] = true
		return
	end
	
	
	if not collection.isScanning then
		collection.isScanning = true
		Scan( )
		collection.isScanning = false
	else
		--ArkInventory.Output( "IGNORED (HEIRLOOM JOURNAL BEING SCANNED - WILL RESCAN WHEN DONE)" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE_BUCKET", "RESCAN" )
	end
	
end

function ArkInventory:EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE( event, ... )
	
	--ArkInventory.Output( "HEIRLOOM UPDATE [", event, "]" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE_BUCKET", event )
	
end
