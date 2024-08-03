local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table
local C_PetJournal = _G.C_PetJournal
local C_ToyBox = _G.C_ToyBox

local loc_id = ArkInventory.Const.Location.Toybox

ArkInventory.Collection.Toybox = { }

local collection = {
	
	isScanning = false,
	isReady = false,
	
	numTotal = 0,
	numOwned = 0,
	
	cache = { },
	
	filter = {
		ignore = false,
		search = nil,
		collected = true,
		uncollected = true,
		usable = true,
		source = { },
		expansion = { },
		backup = false,
	},
	
}


local function FilterGetSearch( )
	return ToyBox.searchBox:GetText( )
end

local function FilterSetSearch( s )
	ToyBox.searchBox:SetText( s )
	C_ToyBox.SetFilterString( s )
end

local function FilterGetCollected( )
	return C_ToyBox.GetCollectedShown( )
end

local function FilterSetCollected( value )
	C_ToyBox.SetCollectedShown( value )
end

local function FilterGetUncollected( )
	return C_ToyBox.GetUncollectedShown( )
end

local function FilterSetUncollected( value )
	C_ToyBox.SetUncollectedShown( value )
end

local function FilterGetUsable( )
	return C_ToyBox.GetUnusableShown( )
end

local function FilterSetUsable( value )
	C_ToyBox.SetUnusableShown( value )
end

local function FilterNumSource( )
	return C_PetJournal.GetNumPetSources( )
end

local function FilterSetSource( t )
	if type( t ) == "table" then
		for i = 1, FilterNumSource( ) do
			C_ToyBox.SetSourceTypeFilter( i, t[i] )
		end
	elseif type( t ) == "boolean" then
		for i = 1, FilterNumSource( ) do
			C_ToyBox.SetSourceTypeFilter( i, t )
		end
	else
		assert( false, "parameter is not a table or boolean" )
	end
end

local function FilterGetSource( t )
	assert( type( t ) == "table", "parameter is not a table" )
	for i = 1, FilterNumSource( ) do
		t[i] = C_ToyBox.IsSourceTypeFilterChecked( i )
	end
end

local function FilterNumExpansion( )
	return GetNumExpansions( )
end

local function FilterSetExpansion( t )
	if type( t ) == "table" then
		for i = 1, FilterNumExpansion( ) do
			C_ToyBox.SetExpansionTypeFilter( i, t[i] )
		end
	elseif type( t ) == "boolean" then
		for i = 1, FilterNumExpansion( ) do
			C_ToyBox.SetExpansionTypeFilter( i, t )
		end
	else
		assert( false, "parameter is not a table or boolean" )
	end
end

local function FilterGetExpansion( t )
	assert( type( t ) == "table", "parameter is not a table" )
	for i = 1, FilterNumExpansion( ) do
		t[i] = C_ToyBox.IsExpansionTypeFilterChecked( i )
	end
end

local function FilterActionClear( )
	
	collection.filter.ignore = true
	
	FilterSetSearch( "" )
	FilterSetCollected( true )
	FilterSetUncollected( true )
	FilterSetUsable( true )
	FilterSetSource( true )
	FilterSetExpansion( true )
	
end

local function FilterActionBackup( )
	
	if collection.filter.backup then return end
	
	collection.filter.search = FilterGetSearch( )
	collection.filter.collected = FilterGetCollected( )
	collection.filter.uncollected = FilterGetUncollected( )
	collection.filter.usable = FilterGetUsable( )
	FilterGetSource( collection.filter.source )
	FilterGetExpansion( collection.filter.expansion )
	
	collection.filter.backup = true
	
end

local function FilterActionRestore( )
	
	if not collection.filter.backup then return end
	
	collection.filter.ignore = true
	
	FilterActionClear( )
	
	FilterSetSearch( collection.filter.search )
	FilterSetCollected( collection.filter.collected )
	FilterSetUncollected( collection.filter.uncollected )
	FilterSetUsable( collection.filter.usable )
	FilterSetSource( collection.filter.source )
	FilterSetExpansion( collection.filter.expansion )
	
	collection.filter.backup = false
	
end


function ArkInventory.Collection.Toybox.OnHide( )
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_TOYBOX_UPDATE_BUCKET", "FRAME_CLOSED" )
end

function ArkInventory.Collection.Toybox.IsReady( )
	return collection.isReady
end

function ArkInventory.Collection.Toybox.GetCount( )
	return collection.numOwned, collection.numTotal
end

function ArkInventory.Collection.Toybox.GetToy( value )
	if type( value ) == "number" then
		return collection.cache[value]
	end
end

function ArkInventory.Collection.Toybox.Iterate( )
	local t = collection.cache
	return ArkInventory.spairs( t, function( a, b ) return ( t[a].index or 0 ) < ( t[b].index or 0 ) end )
end

function ArkInventory.Collection.Toybox.Summon( index )
	local obj = ArkInventory.Collection.Toybox.GetToy( index )
	if obj then
		--UseToy( obj.item ) -- secure action now, so cant be done
	end
end

function ArkInventory.Collection.Toybox.GetFavorite( index )
	local obj = ArkInventory.Collection.Toybox.GetToy( index )
	if obj then
		return C_ToyBox.GetIsFavorite( obj.item )
	end
end

function ArkInventory.Collection.Toybox.SetFavorite( index, value )
	local obj = ArkInventory.Collection.Toybox.GetToy( index )
	if obj then
		C_ToyBox.SetIsFavorite( obj.item, value )
	end
end


local function Scan_Threaded( thread_id )
	
	local update = false
	
	local numTotal = 0
	local numOwned = 0
	local YieldCount = 0
	
	--ArkInventory.Output( "Toybox: Start Scan @ ", time( ) )
	
	FilterActionBackup( )
	FilterActionClear( )
	
	-- scan the toybox frame (now unfiltered)
	
	local c = collection.cache
	
	for index = 1, C_ToyBox.GetNumTotalDisplayedToys( ) do
		
		if ToyBox:IsVisible( ) then
			ArkInventory.OutputDebug( "TOYBOX: ABORTED (TOYBOX FRAME WAS OPENED)" )
			FilterActionRestore( )
			return
		end
		
		if ArkInventory.Global.Mode.Combat then
			ArkInventory.OutputDebug( "TOYBOX: ABORTED (ENTERED COMBAT)" )
			ArkInventory.Global.ScanAfterCombat[loc_id] = true
			FilterActionRestore( )
			return
		end
		
		if ArkInventory.Global.Mode.DragonRace then
			ArkInventory.OutputDebug( "TOYBOX: ABORTED (DRAGON RACE)" )
			ArkInventory.Global.ScanAfterDragonRace[loc_id] = true
			FilterActionRestore( )
			return
		end
		
		
		YieldCount = YieldCount + 1
		
		local i = C_ToyBox.GetToyFromIndex( index )
		
		if i > 0 then
			
			numTotal = numTotal + 1
			
			local item, name, icon = C_ToyBox.GetToyInfo( i )
			local isFavourite = C_ToyBox.GetIsFavorite( i )
			local isOwned = PlayerHasToy( i )
			
			if not c[i] then
				
				update = true
				c[i] = { index = index }
				
				c[i].name = name
				c[i].icon = icon
				
				c[i].item = item
				c[i].link = C_ToyBox.GetToyLink( i )
				
			end
			
			if isOwned then
				numOwned = numOwned + 1
			end
			
			if c[i].owned ~= isOwned then
				update = true
				c[i].owned = isOwned
			end
			
			if c[i].fav ~= isFavourite then
				update = true
				c[i].fav = isFavourite
			end
			
		end
		
		if ToyBox:IsVisible( ) then
			--ArkInventory.Output( "ABORTED (TOYBOX WAS OPENED)" )
			FilterActionRestore( )
			return
		end
		
		if YieldCount % ArkInventory.Const.YieldAfter == 0 then
			ArkInventory.ThreadYield_Scan( thread_id )
		end
		
	end
	
	ArkInventory.ThreadYield_Scan( thread_id )
	
	FilterActionRestore( )
	
	collection.numOwned = numOwned
	collection.numTotal = numTotal
	
	--ArkInventory.Output( "Toybox: End Scan @ ", time( ), " [", collection.numOwned, "] [", collection.numTotal, "] [", update, "]" )
	
	collection.isReady = true
	
	if update then
		ArkInventory.ScanLocation( loc_id )
	end
	
end

local function Scan( )
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Collection, "toybox" )
	
	local thread_func = function( )
		Scan_Threaded( thread_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory:EVENT_ARKINV_COLLECTION_TOYBOX_UPDATE_BUCKET( events )
	
	--ArkInventory.Output( "TOYBOX BUCKET [", events, "]" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		--ArkInventory.Output( "IGNORED (TOYBOX NOT MONITORED)" )
		return
	end
	
	if ToyBox:IsVisible( ) then
		--ArkInventory.Output( "IGNORED (TOYBOX IS OPEN)" )
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
		--ArkInventory.Output( "IGNORED (TOYBOX BEING SCANNED - WILL RESCAN WHEN DONE)" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_TOYBOX_UPDATE_BUCKET", "RESCAN" )
	end
	
end

function ArkInventory:EVENT_ARKINV_COLLECTION_TOYBOX_UPDATE( event, ... )
	
	--ArkInventory.Output( "TOYBOX UPDATE [", event, "]" )
	
	if event == "TOYS_UPDATED" then
		if collection.filter.ignore then
			--ArkInventory.Output( "IGNORED (FILTER CHANGED BY ME)" )
			collection.filter.ignore = false
			return
		end
	end
	
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_TOYBOX_UPDATE_BUCKET", event )
	
end
