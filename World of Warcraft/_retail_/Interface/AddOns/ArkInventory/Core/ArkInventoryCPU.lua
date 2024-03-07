
--[[

CPU profiling is disabled by default since it has some overhead. CPU profiling is controlled by the scriptProfile cvar, which persists across sessions, and takes effect after a UI reload.
When profiling is enabled, you can use the following functions to retrieve CPU usage statistics. Times are in seconds with about-a-microsecond precision:

1 microsecond = 0.000001
1 millisecond = 0.001

NEW - time = GetScriptCPUUsage() - Returns the total timeused by the scripting system
NEW - UpdateAddOnCPUUsage() - Scan through the profiling data and update the per-addon statistics
NEW - time = GetAddOnCPUUsage(index or \"name\") - Returns the total time used by the specified AddOn. This returns a cached value calculated by UpdateAddOnCPUUsage().
NEW - time, count = GetFunctionCPUUsage(function[, includeSubroutines]) - Returns the time used and number of times the specified function was called. If 'includeSubroutines' is true or omitted, the time includes both the time spent in the function and subroutines called by the function. If it is false, then time is only the time actually spent by the code in the function itself.
NEW - time, count = GetFrameCPUUsage(frame[, includeChildren]) - Returns the time used and number of function calls of any of the frame's script handlers. If 'includeChildren' is true or omitted, the time and call count will include the handlers for all of the frame's children as well.
NEW - time, count = GetEventCPUUsage(["event"]) - Returns the time used and number of times the specified event has been triggered. If 'event' is omitted, the time and count will be totals across all events.
NEW - ResetCPUUsage() - Reset all CPU profiling statistics to zero.

Script memory is now tracked on a per-addon basis, with functions provided to analyze and query usage.
The script memory manager has been optimized and the garbage collection tuned so there is no longer any need for a hard cap on the amount of UI memory available.
NEW - UpdateAddOnMemoryUsage() - Scan through memory profiling data and update the per-addon statistics
NEW - usedKB = GetAddOnMemoryUsage(index or "name") - query an addon's memory use (in K, precision to 1 byte) - This returns a cached value calculated by UpdateAddOnMemoryUsage().
]]--

function ArkInventory.CPUProfile( z, reset, func, ... )
	
	if ArkInventory.CrossClient.GetCVar( "scriptProfile" ) ~= "1" then
		ArkInventory.Output( "CVar for scriptProfile is not set, cannot do cpu profile" )
		return
	end
	
--[[	
	/run ResetCPUUsage( )
	/run ArkInventory.CPUProfile( nil, nil, ArkInventory.ObjectIDCount, string.format( "item:%s", HEARTHSTONE_ITEM_ID ) )
	/run ArkInventory.CPUProfile( nil, nil, ArkInventory.ObjectIDCount_p2, string.format( "item:%s", HEARTHSTONE_ITEM_ID ) )
	/run ArkInventory.CPUProfile( nil, nil, ArkInventory.ObjectIDCount_p3, string.format( "item:%s", HEARTHSTONE_ITEM_ID ) )
	/run ArkInventory.CPUProfile( nil, nil, ArkInventory.ObjectStringDecode, string.format( "item:%s", HEARTHSTONE_ITEM_ID ) )
	/run ArkInventory.CPUProfile( 1, 1, ArkInventory.ObjectStringDecode_p2, string.format( "item:%s", HEARTHSTONE_ITEM_ID ) )
	/run ArkInventory.CPUProfile( 100, nil, ArkInventory.ObjectStringDecode_p2, string.format( "item:%s", HEARTHSTONE_ITEM_ID ) )
]]--
	
	if reset then
		ResetCPUUsage( )
	end
	
	UpdateAddOnMemoryUsage( )
	local kb1 = GetAddOnMemoryUsage( "ArkInventory" )
	
	for x = 1, ( ( z or 1000 ) * 1000 ) do
		func( ... )
	end
	
	UpdateAddOnCPUUsage( )
	local t1, c1 = GetFunctionCPUUsage( func, true )
	local t2, c2 = GetFunctionCPUUsage( func, false )
	
	UpdateAddOnMemoryUsage( )
	local kb2 = GetAddOnMemoryUsage( "ArkInventory" )
	
	ArkInventory.Output( "----- ----- ------" )
	ArkInventory.Output( string.format( "calls = %0.0f", c1 ) )
	ArkInventory.Output( string.format( "avg-sub = %0.6f s", t1 / c1 ) )
	ArkInventory.Output( string.format( "avg-fnc = %0.6f s", t2 / c2 ) )
	ArkInventory.Output( string.format( "mem = %0.2f / %0.2f kb", kb2, kb2 - kb1 ) )
	
end
