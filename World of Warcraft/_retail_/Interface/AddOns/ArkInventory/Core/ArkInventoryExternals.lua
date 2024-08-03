
-- forcibly load required libraries if not already loaded - required when running disembedded (some curse users)

local function loadExternal( ... )
	
	local function myLoadAddOn( ... )
		if C_AddOns and C_AddOns.LoadAddOn then
			return C_AddOns.LoadAddOn( ... )
		else
			return LoadAddOn( ... )
		end
	end
	
	local function myIsAddOnLoaded( ... )
		if C_AddOns and C_AddOns.IsAddOnLoaded then
			return C_AddOns.IsAddOnLoaded( ... )
		else
			return IsAddOnLoaded( ... )
		end
	end

	
	
	if not myIsAddOnLoaded( ... ) then
		myLoadAddOn( ... )
	end
	
end


loadExternal( "Ace3" ) -- loads LibStub and CallBackHandler
loadExternal( "AceGUI-3.0-SharedMediaWidgets" )
loadExternal( "LibPeriodicTable-3.1" )
loadExternal( "LibSharedMedia-3.0" )
loadExternal( "LibDataBroker-1.1" )
loadExternal( "LibDialog-1.0" )
loadExternal( "BattlePetBreedID" )




local function dumpz( ... )
	
	--DEVTOOLS_MAX_ENTRY_CUTOFF = 30;    -- Maximum table entries shown
	--DEVTOOLS_LONG_STRING_CUTOFF = 200; -- Maximum string size shown
	--DEVTOOLS_DEPTH_CUTOFF = 10;        -- Maximum table depth
	--DEVTOOLS_INDENT='  ';              -- Indentation string
	
	local arg1, arg2 = ...
	UIParentLoadAddOn( "Blizzard_DebugTools" )
	
	local old_max = DEVTOOLS_MAX_ENTRY_CUTOFF
	DEVTOOLS_MAX_ENTRY_CUTOFF = arg2 or old_max
	
	DevTools_Dump( arg1 )
	
	DEVTOOLS_MAX_ENTRY_CUTOFF = old_max
	
end
