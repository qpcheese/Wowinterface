
ArkInventory.API = { }

function ArkInventory.TooltipBuildBattlepet( ... )
--[[
	deprecated - use ArkInventory.API.CustomBattlePetTooltipReady instead
	
	exists only to support any mods that are still hooking this instead of the new function
		BattlePetBreedID
]]--
end

function ArkInventory.API.CustomBattlePetTooltipReady( ... )
--[[
	
	called after the custom battlepet tooltip is shown
	it's behind all the arkinventory option checks so you dont have to check those
	you can add whatever you want at this point
	
	usage
		hooksecurefunc( ArkInventory.API, "CustomBattlePetTooltipReady", YourMod.YourFunctionNameGoesHere )
		
	args
		[1] tooltip
		[2] battlepet hyperlink string
		
		remaining args are from unpack( ArkInventory.ObjectStringDecode( h ) )
		[3] class (should always be battlepet)
		[4] speciesid
		[5] level
		[6] quality
		[7] maxhealth
		[8] power
		[9] speed
		
]]--
	
	-- to cover any mods that have not been updated yet, call the old function so they get called
	ArkInventory.TooltipBuildBattlepet( ... )
	
end

function ArkInventory.API.helper_CustomBattlePetTooltipReady( tooltip, h )
	--ArkInventory.Output2( { ArkInventory.ObjectStringDecode( h ) } )
	ArkInventory.API.CustomBattlePetTooltipReady( tooltip, h, unpack( ArkInventory.ObjectStringDecode( h ) ) )
end

function ArkInventory.API.CustomReputationTooltipReady( ... )
--[[
	
	called after the custom reputation tooltip is shown
	
	usage
		hooksecurefunc( ArkInventory.API, "CustomReputationTooltipReady", YourMod.YourFunctionNameGoesHere )
		
	args
		[1] tooltip
		[2] custom "hyperlink" string - reputation:factionID:standingText:barValue:barMin:barMax:isCapped:paragonLevel:paragonRewardPending:rankValue:rankMax
	
]]--
end

function ArkInventory.API.ReloadedTooltipReady( tooltip, fn, ... )
--[[
	
	called after a tooltip has been forcibly reloaded - its effectively like opening the tooltip if you only hook onshow and none of the set functions
	runs before the arkinventory item counts are added
	required for AllTheThings
	
	usage
		hooksecurefunc( ArkInventory.API, "ReloadedTooltipReady", YourMod.YourFunctionNameGoesHere )
		
	args
		[1] the tooltip that was just reloaded
		[2] name of the function that was called to set the original tooltip
		[...] original functions arguments 
	
]]--
end

function ArkInventory.API.ReloadedTooltipCleared( tooltip )
--[[
	
	called after a tooltip that is reloading has been cleared - its effectively like closing the tooltip if you only hook onclose
	required for AllTheThings
	
	usage
		hooksecurefunc( ArkInventory.API, "ReloadedTooltipCleared", YourMod.YourFunctionNameGoesHere )
		
	args
		[1] the tooltip that was cleared
	
]]--
end

function ArkInventory.API.ItemFrameLoaded( ... )
--[[
	
	called after a clean (untainted) item frame is created/loaded
	
	usage
		hooksecurefunc( ArkInventory.API, "ItemFrameLoaded", YourMod.YourFunctionNameGoesHere )
		
	args
		[1] frame
		[2] loc_id - arkinventory location id
		[3] bag_id - arkinventory bag id
		[4] slot_id - slot id
	
]]--
end

function ArkInventory.API.ItemFrameUpdated( ... )
--[[
	
	called after an item frame is updated
	
	usage
		hooksecurefunc( ArkInventory.API, "ItemFrameUpdated", YourMod.YourFunctionNameGoesHere )
		
	args
		[1] frame
		[2] loc_id - arkinventory location id
		[3] bag_id - arkinventory bag id
		[4] slot_id - slot id
	
]]--
end

function ArkInventory.API.ItemFrameLoadedIterate( loc, bag )
--[[
	
	call this when you need to loop through the loaded item frames for all locations, a specific location, or a specific location and bag
	
	ArkInventory.API.ItemFrameLoadedIterate( ) = everything
	ArkInventory.API.ItemFrameLoadedIterate( ArkInventory.Const.Location.Bank ) = just the bank
	ArkInventory.API.ItemFrameLoadedIterate( ArkInventory.Const.Location.Bank, ArkInventory.Global.Location[ArkInventory.Const.Location.Bank].ReagentBag ) = just the reagent bank
	
	for framename, frame, loc_id, bag_id, slot_id in ArkInventory.API.ItemFrameLoadedIterate( loc, bag ) do
		your code goes here
	end
	
]]--
	
	local wanted = false
	local framename
	local frame
	
	local loc_key, loc_data = next( ArkInventory.Global.Location, nil )
	local loc_id = loc_data.id
	
	local bag_id = next( ArkInventory.Global.Location[loc_id].Bags, nil )
	
	local slot_id = 1
	
	
	return function( )
		
		wanted = false
		framename = nil
		frame = nil
		
		while not wanted do
			
			if not loc or loc_id == loc then
				if ( not loc ) or ( loc and ( not bag or bag_id == bag ) ) then
					framename, frame = ArkInventory.ContainerItemNameGet( loc_id, bag_id, slot_id )
					if frame then
						wanted = true
					end
				end
			end
			
			-- move to next item frame
			
			slot_id = slot_id + 1
			
			if slot_id > ( ArkInventory.Global.Location[loc_id].maxSlot[bag_id] or 0 ) then
				slot_id = 1
				bag_id = next( ArkInventory.Global.Location[loc_id].Bags, bag_id )
			end
			
			if not bag_id then
				-- next location
				loc_key, loc_data = next( ArkInventory.Global.Location, loc_key )
				if not loc_key then
					-- end of locations
					return
				end
				loc_id = loc_data.id
				-- get first bag for the next location
				bag_id = next( ArkInventory.Global.Location[loc_id].Bags, nil )
			end
			
		end
		
		return framename, frame, loc_id, bag_id, slot_id
		
	end
	
end

function ArkInventory.API.ItemFrameGet( loc_id, bag_id, slot_id )
--[[
	
	usage
		local framename, frame = ArkInventory.API.ItemFrameGet( loc_id, bag_id, slot_id )
		
]]--
	return ArkInventory.ContainerItemNameGet( loc_id, bag_id, slot_id )
end

function ArkInventory.API.ItemFrameItemTableGet( frame )
	
	-- returns the "i" table for the item assigned to the specified item frame
	-- if its not an arkinventory frame youll get nil back
	
	if frame and frame.ARK_Data then
		return ArkInventory.Frame_Item_GetDB( frame )
	end
	
end

function ArkInventory.API.InternalIdToBlizzardBagId( loc_id, bag_id )
--[[
	
	converts from an arkinventory loc_id + bag_id combination to a blizzard bag id that the blizzard functions will accept
	
	
	usage
		local blizzard_id = ArkInventory.API.InternalIdToBlizzardBagId( loc_id, bag_id )
		
	notes
		only container frame based locations/bags will have a valid blizzard id that will work with the container API
		if you already have the item frame you can also use frame.ARK_Data.blizzard_id to get the same value
		
]]--
	
	return ArkInventory.InternalIdToBlizzardBagId( loc_id, bag_id )
	
end

function ArkInventory.API.BlizzardBagId( loc_id, bag_id )
	-- deprecated -- do not use
	return ArkInventory.API.InternalIdToBlizzardBagId( loc_id, bag_id )
end

function ArkInventory.API.BlizzardBagIdToInternalId( blizzard_id )
--[[
	
	converts from a blizzard bag id to an arkinventory loc_id + bag_id combination that ArkInventory functions will accept
	
	
	usage
		local loc_id, bag_id = ArkInventory.API.BlizzardBagIdToInternalId( blizzard_id )
		
]]--
	
	return ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
end

function ArkInventory.API.LocationIsOffline( loc_id )
--[[
	
	returns
		true = location is offline
		false = location is online
		nil = invalid location id
		
]]--
	
	if loc_id and ArkInventory.Global.Location[loc_id] then
		return not not ArkInventory.Global.Location[loc_id].isOffline
	end
	
end

function ArkInventory.API.Version( )
	return ArkInventory.Const.Program.Version, ArkInventory.Global.Version
end
