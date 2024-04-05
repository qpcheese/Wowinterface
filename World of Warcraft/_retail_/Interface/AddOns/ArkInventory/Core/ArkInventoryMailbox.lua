local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table

ArkInventory.Mailbox = { }

local loc_id = ArkInventory.Const.Location.Mailbox


local collection = {
	loaded = false,
	total = 0,
	cache = { },
}

function ArkInventory.Mailbox.Iterate( )
	local t = collection.cache
	return ArkInventory.spairs( t, function( a, b ) return ( t[a].msg_id or "" ) < ( t[b].msg_id or "" ) end )
end

function ArkInventory.Mailbox.Scan( )
	
	--ArkInventory.Output( "ArkInventory.Mailbox.Scan( )" )
	
	if ArkInventory.Global.Mode.Combat then
		-- set to scan when leaving combat
		ArkInventory.Global.ScanAfterCombat[loc_id] = true
		return
	end
	
	if total == 0 then return end
	
	local update = false
	
	
	
	
	
	if update then
		ArkInventory.ScanMail( )
	end
	
	return true
	
end
