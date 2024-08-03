local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table

local ArkInventoryScanCleanupList = { }

function ArkInventory.EraseSavedData( player_id, loc_id, silent )

	--table.insert( ArkInventory.db.debug, string.format( "erase [%s] [%s]", player_id or "nil", loc_id or "nil" ) )
	
	-- /run ArkInventory.EraseSavedData( )
	
	--ArkInventory.Output( "EraseSavedData( ", player_id, ", ", loc_id, ", ", silent, " )" )
	
	local rescan
	
	-- erase item/tooltip cache
	--ArkInventory.Table.Clean( ArkInventory.Global.Cache.ItemCountTooltip, nil, true )
	--ArkInventory.Table.Clean( ArkInventory.Global.Cache.ItemCountRaw, nil, true )
	ArkInventory.Table.Wipe( ArkInventory.Global.Cache.ItemCountTooltip )
	ArkInventory.Table.Wipe( ArkInventory.Global.Cache.ItemCountRaw )
	
	local info = ArkInventory.GetPlayerInfo( )
	local account = ArkInventory.PlayerIDAccount( )
	
	-- erase data
	for pk, pv in pairs( ArkInventory.db.player.data ) do
		
		if ( not player_id ) or ( pk == player_id ) then
			
			for lk, lv in pairs( pv.location ) do
				
				if ( loc_id == nil ) or ( lk == loc_id ) then
					
					ArkInventory.Frame_Main_Hide( lk )
					
					lv.slot_count = 0
					
					for bk, bv in pairs( lv.bag ) do
						ArkInventory.Table.Clean( bv )
						bv.status = ArkInventory.Const.Bag.Status.Unknown
						bv.type = ArkInventory.Const.Slot.Type.Unknown
						bv.count = 0
						bv.empty = 0
						ArkInventory.Table.Wipe( bv.slot )
					end
					
					--ArkInventory.OutputWarning( "EraseSavedData - .Recalculate" )
					ArkInventory.Frame_Main_DrawStatus( lk, ArkInventory.Const.Window.Draw.Recalculate )
					
					if ArkInventory.Global.Location[lk] and not silent then
						ArkInventory.Output( "Saved ", string.lower( ArkInventory.Global.Location[lk].Name ), " data for ", pk, " has been erased" )
					end
					
					--table.insert( ArkInventory.db.debug, string.format( "erase [%s] [%s]", lk, pk ) )
					
					if pk == account then
						-- current account data was erased, rescan it
						rescan = true
					end
					
				end
				
			end
			
			if pk == info.player_id then
				rescan = true
			else
				if ( loc_id == nil ) or ( loc_id == ArkInventory.Const.Location.Vault and pv.info.class == ArkInventory.Const.Class.Guild ) then
					ArkInventory.Table.Wipe( pv.info )
				end
			end
			
		end
		
	end
	
	if rescan then
		-- current player, or account, was wiped, need to rescan
		ArkInventory.PlayerInfoSet( )
		--table.insert( ArkInventory.db.debug, string.format( "rescan [%s]", loc_id or "nil" ) )
		ArkInventory.ScanLocation( )
	end
	
end


function ArkInventory.PlayerInfoSet( )
	
	--ArkInventory.Output( "PlayerInfoSet" )
	
	local n = UnitName( "player" )
	local r = GetRealmName( )
	local id = ArkInventory.PlayerIDSelf( )
	
	local player = ArkInventory.db.player.data[id].info
	ArkInventory.Global.Me = player
	
	player.guid = UnitGUID( "player" ) or player.guid
	player.name = n
	player.realm = r
	player.player_id = id
	player.isplayer = true
	
	local faction, faction_local = UnitFactionGroup( "player" )
	player.faction = faction or player.faction
	player.faction_local = faction_local or player.faction_local
	if player.faction_local == "" then
		player.faction_local = FACTION_STANDING_LABEL4
	end
	
	-- WARNING, most of this stuff is not available upon first login, even when the mod gets to OnEnabled (ui reloads are fine), and some are not available on logout
	
	local class_local, class = UnitClass( "player" )
	player.class_local = class_local or player.class_local
	player.class = class or player.class
	
	player.level = UnitLevel( "player" ) or player.level or 1
	
	player.itemlevel = ArkInventory.CrossClient.GetAverageItemLevel( ) or player.itemlevel or 1
	
	local race_local, race = UnitRace( "player" )
	player.race_local = race_local or player.race_local
	player.race = race or player.race
	
	player.gender = UnitSex( "player" ) or player.gender
	
	local m = GetMoney( ) or player.money
	if m > 0 then  -- returns 0 on logout so dont wipe the current value
		player.money = m
	end
	
	-- ACCOUNT
	local id = ArkInventory.PlayerIDAccount( )
	local account = ArkInventory.db.player.data[id].info
	
	account.name = MANAGE_ACCOUNT
	account.realm = ""
	account.player_id = id
	account.faction = ""
	account.faction_local = ""
	account.class = ArkInventory.Const.Class.Account
	account.class_local = ArkInventory.Localise["ACCOUNT"]
	account.level = account.level or 1
	
	-- VAULT
	local gname, grank_text, grank, grealm = GetGuildInfo( "player" )
	-- grealm is nil if the guild is from your server, otherwise it has the servername
	--ArkInventory.Output( "IsInGuild=[", IsInGuild( ), "], g=[", gn, "], r=[", grealm, "]" )
	
	if not gname then
		
		if IsInGuild( ) then
			--ArkInventory.OutputWarning( "you are in a guild but no guild name was found, keep previous data" )
		else
			player.guild_id = nil
		end
		
	else
		
		player.guild_id = string.format( "%s%s%s%s", ArkInventory.Const.GuildTag, gname, ArkInventory.Const.PlayerIDSep, grealm or r )
		
	end
	
	return player
	
end

function ArkInventory.VaultInfoSet( )
	
	local n, _, _, r = GetGuildInfo( "player" )
	local player_info = ArkInventory.GetPlayerInfo( )
	
	if n then
		
		local id = string.format( "%s%s%s%s", ArkInventory.Const.GuildTag, n, ArkInventory.Const.PlayerIDSep, r or player_info.realm )
		local guild = ArkInventory.db.player.data[id].info
		
		guild.name = n
		guild.realm = r or player_info.realm
		guild.player_id = id
		guild.faction = player_info.faction
		guild.faction_local = player_info.faction_local
		guild.class = ArkInventory.Const.Class.Guild
		guild.class_local = GUILD
		
		guild.guild_id = id
		guild.level = 1 --GetGuildLevel( )
		guild.money = GetGuildBankMoney( ) or 0
		
		player_info.guild_id = id
		
	else
		
		player_info.guild_id = nil
		
	end
	
end

function ArkInventory.PlayerIDSelf( )
	return string.format( "%s%s%s", UnitName( "player" ), ArkInventory.Const.PlayerIDSep, GetRealmName( ) )
end

function ArkInventory.PlayerIDAccount( id )
	local a = "!ACCOUNT"
	local id = id or 100
	return string.format( "%s%s%s", a, ArkInventory.Const.PlayerIDSep, id )
end

function ArkInventory:EVENT_ARKINV_STORAGE( ... )
	
	-- not used yet
	
	local event, arg1, arg2, arg3, arg4 = ...
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", arg1, ", ", arg2, ", ", arg3, ", ", arg4 )
	
	if arg1 == ArkInventory.Const.Event.ItemUpdate then
		
		ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", arg2 )
		
	elseif arg1 == ArkInventory.Const.Event.BagUpdate then
		
		--ArkInventory.Output( "BAG_UPDATE( ", arg2, ", [", arg4, "] )" )
		ArkInventory.Frame_Main_Generate( arg2, arg4 )
		
		--ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", arg2 )
		
	else
		
		error( string.format( "code failure: unknown storage event [%s]", arg1 ) )
		
	end
	
end


function ArkInventory:EVENT_ARKINV_TESTING( ... )
	
	local event, arg1 = ...
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", arg1 )
	
end


function ArkInventory:EVENT_ARKINV_PLAYER_ENTER( ... )
	
	local event, arg1, arg2 = ...
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", arg1, ", ", arg2 )
	
	ArkInventory.Global.Mode.World = true
	
	--table.insert( ArkInventory.db.debug, "world - enter" )
	
	ArkInventory.PlayerInfoSet( )
	
	ArkInventory.SetMountMacro( )
	
	--ArkInventory.ScanLocation( )
	
end

function ArkInventory:EVENT_ARKINV_PLAYER_LEAVE( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	--table.insert( ArkInventory.db.debug, "world - leave" )
	
	ArkInventory.Global.Mode.World = false
	
	ArkInventory.Frame_Main_Hide( )
	
	ArkInventory.PlayerInfoSet( )
	
	ArkInventory.ScanAuctionExpire( )
	
	local player_id = ArkInventory.PlayerIDSelf( )
	for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
		if not ArkInventory.isLocationSaved( loc_id ) then
			--ArkInventory.Output( "erasing ", loc_id )
			ArkInventory.EraseSavedData( player_id, loc_id, true )
		end
	end
	
end

function ArkInventory:EVENT_ARKINV_PLAYER_MONEY_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	if not ArkInventory.Action.Vendor.data.conflict and not ArkInventory.Action.Vendor.data.running and ArkInventory.db.option.action.vendor.auto then
		
		if ArkInventory.db.option.action.vendor.notify and ( ArkInventory.Action.Vendor.data.sold > 0 ) then
			
			--ArkInventory.Output( "end amount ", GetMoney( ) )
			ArkInventory.Action.Vendor.data.money = GetMoney( ) - ArkInventory.Action.Vendor.data.money
			--ArkInventory.Output( "difference ", ArkInventory.Action.Vendor.data.money )
			--ArkInventory.Output( "sold ", ArkInventory.Action.Vendor.data.sold )
			
			if ArkInventory.Action.Vendor.data.sold > 0 and ArkInventory.Action.Vendor.data.money > 0 then
				ArkInventory.Output( string.format( ArkInventory.Localise["CONFIG_ACTION_VENDOR_SOLD"], ArkInventory.MoneyText( ArkInventory.Action.Vendor.data.money, true ) ) )
			end
			
		end
		
		ArkInventory.Action.Vendor.data.sold = 0
		ArkInventory.Action.Vendor.data.money = 0
		
	end
	
	
	ArkInventory.PlayerInfoSet( )
	
	-- set saved money amount here as well
	local info = ArkInventory.GetPlayerInfo( )
	info.money = GetMoney( )
	
	ArkInventory.LDB.Money:Update( )
	
end

function ArkInventory:EVENT_ARKINV_PLAYER_MONEY( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_PLAYER_MONEY_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_COMBAT_ENTER( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	ArkInventory.Global.Mode.Combat = true
	
	if ArkInventory.db.option.auto.close.combat == ArkInventory.ENUM.BAG.OPENCLOSE.YES then
		ArkInventory.Frame_Main_Hide( )
	end
	
end

function ArkInventory:EVENT_ARKINV_PLAYER_LEVEL_UP( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	ArkInventory.ItemCacheClear( )
	
end

function ArkInventory:EVENT_ARKINV_COMBAT_LEAVE( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	ArkInventory.Global.Mode.Combat = false
	
	
	for loc_id in pairs( ArkInventory.Global.ScanAfterCombat ) do
		
		ArkInventory.Global.ScanAfterCombat[loc_id] = nil
		
		if loc_id == ArkInventory.Const.Location.Pet then
			ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_UPDATE_BUCKET", "EXIT_COMBAT" )
		elseif loc_id == ArkInventory.Const.Location.Mount then
			ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET", "EXIT_COMBAT" )
		elseif loc_id == ArkInventory.Const.Location.Toybox then
			ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_TOYBOX_UPDATE_BUCKET", "EXIT_COMBAT" )
		elseif loc_id == ArkInventory.Const.Location.Heirloom then
			ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE_BUCKET", "EXIT_COMBAT" )
		elseif loc_id == ArkInventory.Const.Location.Currency then
			ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_CURRENCY_UPDATE_BUCKET", "EXIT_COMBAT" )
		elseif loc_id == ArkInventory.Const.Location.Reputation then
			ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_REPUTATION_UPDATE_BUCKET", "EXIT_COMBAT" )
		else
			ArkInventory.ScanLocation( loc_id )
		end
		
	end
	
	ArkInventory:SendMessage( "EVENT_ARKINV_TOOLTIP_REBUILD_QUEUE_UPDATE_BUCKET", "START" )
	
	for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
		if loc_data.canView then
			
			if loc_data.isDirty then --FIX ME - this doesnt ever get set?
				
				--ArkInventory.OutputWarning( "EVENT_ARKINV_COMBAT_LEAVE - .Recalculate" )
				ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
				
			else
				
				local me = ArkInventory.GetPlayerCodex( loc_id )
				if me.style.slot.cooldown.show and not me.style.slot.cooldown.combat  then
					--ArkInventory.Output( "cooldown ", loc_id )
					ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
				end
				
			end
			
		end
	end
	
	if ArkInventory.Global.AfterCombatActionUse then
		ArkInventory.Global.AfterCombatActionUse = false
		ArkInventory.OutputDebug( ArkInventory.Localise["OPEN"], " resuming as you have left combat" )
		ArkInventory.Action.Use.Run( )
	end
	
end

function ArkInventory:EVENT_ARKINV_LOCATION_SCANNED_BUCKET( bucket )
	
	local event = "LOCATION_SCANNED"
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", bucket )
	
	for search_id, ld in pairs( ArkInventoryScanCleanupList ) do
		for loc_id in pairs( ld ) do
			
			if ArkInventory.Table.Elements( ArkInventory.Global.Location[loc_id].scanning.r ) == 0 and ArkInventory.Table.Elements( ArkInventory.Global.Location[loc_id].scanning.q ) == 0 then
				
				ld[loc_id] = nil
				
				local player_id = ArkInventory.PlayerIDSelf( )
				ArkInventory.ObjectCacheCountClear( search_id, player_id, loc_id )
				
				if ArkInventory.Table.Elements( ld ) == 0 then
					ArkInventoryScanCleanupList[search_id] = nil
				end
				
			end
			
		end
	end
	
	
	-- allow the window to be redrawn if needed
	for loc_id in pairs( bucket ) do
		ArkInventory:SendMessage( "EVENT_ARKINV_LOCATION_DRAW_BUCKET", loc_id )
	end
	
	
	ArkInventory.LDB.Bags:Update( )
	ArkInventory:SendMessage( "EVENT_ARKINV_LDB_ITEM_UPDATE_BUCKET" )
	
end

function ArkInventory:EVENT_ARKINV_LOCATION_DRAW_BUCKET( bucket )
	
	local event = "LOCATION_DRAW"
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", bucket )
	
	for loc_id in pairs( bucket ) do
		ArkInventory.Frame_Main_Generate( loc_id )
	end
	
end

function ArkInventory:EVENT_ARKINV_BAG_UPDATE_BUCKET( bucket )
	
	local event = "BAG_UPDATE"
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", bucket )
	
	for blizzard_id in pairs( bucket ) do
		local loc_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
		if loc_id == ArkInventory.Const.Location.Bag then
			
			ArkInventory.DragonRaceCheck( )
			
			-- re-scan any empty bag slots because when you move a bag from one bag slot into an empty bag slot no event is triggered for the empty bag slot left behind
			for _, blizzard_id in pairs( ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Bags ) do
				if ArkInventory.CrossClient.GetContainerNumSlots( blizzard_id ) == 0 then
					bucket[blizzard_id] = true
				end
			end
			
			
			break
			
		end
	end
	
	ArkInventory.Scan( bucket )
	
end

function ArkInventory:EVENT_ARKINV_BAG_UPDATE( ... )
	local event, arg1 = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", arg1 )
end

function ArkInventory:EVENT_ARKINV_BAG_OPEN_BUCKET( bucket )
	
	local event = "BAG_OPEN"
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", bucket )
	
	for loc_id in pairs( bucket ) do
		ArkInventory.Frame_Main_Show( loc_id )
	end
	
end

function ArkInventory:EVENT_ARKINV_ITEM_UPDATE_BUCKET( ... )
	
	local bucket = ...
--	local changer = { }
	--ArkInventory.Output( "bucket: ", bucket )
	
	for id in pairs( bucket ) do
		local loc_id, bag_id, slot_id = ArkInventory.LocationDecode( id )
		--ArkInventory.Output( "bucket: ", loc_id, "-", bag_id, "-", slot_id )
--		changer[loc_id] = true
		ArkInventory.Frame_Item_Update_Instant( loc_id, bag_id, slot_id )
		ArkInventory.Frame_Item_Update_Instant( loc_id, bag_id, slot_id, ArkInventory.Const.ItemFrameType.Popup )
	end
	
--	for id in pairs( changer ) do
--		ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
--	end
	
end

function ArkInventory:EVENT_ARKINV_ACTION_USE_BUCKET( ... )
	
	ArkInventory.OutputDebug( "EVENT: ACTION_USE_BUCKET - ", bucket )
	
	ArkInventory.Action.Use.Run( )
	
end

function ArkInventory:EVENT_ARKINV_BAG_UPDATE_DELAYED( ... )
	ArkInventory:SendMessage( "EVENT_ARKINV_ACTION_USE_BUCKET" )
end

function ArkInventory:EVENT_ARKINV_ITEM_LOCK_CHANGED( ... )
	
	local event, blizzard_id, slot_id = ...
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", blizzard_id, ", ", slot_id )
	
	if not slot_id then
		
		-- inventory item locks (wearing, bag slot, profession tool)
		
		local inv_id = blizzard_id
		
		local equip_end = GetInventorySlotInfo( "TABARDSLOT" )
		local bag_start = ArkInventory.CrossClient.ContainerIDToInventoryID( 1 )
		local bag_end = bag_start + ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.NUM_BAGS - 1
		
		if inv_id <= equip_end then
			
			--ArkInventory.Output( "wearing item lock" )
			
		elseif inv_id < bag_start then
			
			--ArkInventory.Output( "profession item lock" )
			
		elseif inv_id <= bag_end then
			
			--ArkInventory.Output( "player bag slot lock" )
			ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Bag )
			
		else
			
			--ArkInventory.Output( "something else lock, inv_id=", inv_id )
			
		end
		
	else
		
		if blizzard_id == ArkInventory.ENUM.BAG.INDEX.BANK then
			
			local count = ArkInventory.CrossClient.GetContainerNumSlots( ArkInventory.ENUM.BAG.INDEX.BANK )
			
			if slot_id <= count then
				
				-- bank item lock
				local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
				ArkInventory.Frame_Item_Update_Instant( loc_id, bag_id, slot_id, nil, true )
				ArkInventory.Frame_Item_Update_Instant( loc_id, bag_id, slot_id, ArkInventory.Const.ItemFrameType.Popup, true )
				
			else
				
				-- bank bag lock
				ArkInventory.Frame_Changer_Update( ArkInventory.Const.Location.Bank )
				
			end
			
		else
			
			-- player item lock
			local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
			if loc_id then
				ArkInventory.Frame_Item_Update_Instant( loc_id, bag_id, slot_id, nil, true )
				ArkInventory.Frame_Item_Update_Instant( loc_id, bag_id, slot_id, ArkInventory.Const.ItemFrameType.Popup, true )
			end
			
		end
		
	end
	
end

function ArkInventory:EVENT_ARKINV_AVG_ITEM_LEVEL_UPDATE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	local player = ArkInventory.Global.Me
	
	local itemlevel_old = player.itemlevel or 1
	local itemlevel_new = ArkInventory.CrossClient.GetAverageItemLevel( )
	
	if itemlevel_old ~= itemlevel_new then
		player.itemlevel = itemlevel_new
		--ArkInventory.Output( "item level changed from ", itemlevel_old, " to ", itemlevel_new )
		ArkInventory.ItemCacheClear( )
		ArkInventory.Frame_Main_DrawStatus( nil, ArkInventory.Const.Window.Draw.Refresh )
	end
	
end

function ArkInventory:EVENT_ARKINV_AVG_ITEM_LEVEL_UPDATE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_AVG_ITEM_LEVEL_UPDATE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_CHANGER_UPDATE_BUCKET( bucket )
	
	local event = "CHANGER_UPDATE"
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", bucket )
	
	for loc_id in pairs( bucket ) do
		ArkInventory.Frame_Changer_Update( loc_id )
	end
	
end

function ArkInventory:EVENT_ARKINV_BACKPACK_TOKEN_UPDATE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	local frame = ArkInventory.Frame_Main_Get( ArkInventory.Const.Location.Bag )
	ArkInventory.Frame_Status_Update( frame )
	
end

function ArkInventory:EVENT_ARKINV_BACKPACK_TOKEN_UPDATE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_BACKPACK_TOKEN_UPDATE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_TALENT_CHANGED( ... )
	
	local event, arg1, arg2 = ...
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", arg1, ", ", arg2 )
	
--	hyperlinks include a specid which changes when you change specs
--	making every item a different item at the full hyperlink level
--	and that screws up direct comparisons as the items are now all different
	
--	this is here as a reminder that this will happen so be careful when comparing full hyperlinks/itemstrings
--	use the extended rule (exrid) ids where possible instead
	
end

function ArkInventory:EVENT_ARKINV_ADDON_LOADED( ... )
	
	local event, arg1 = ...
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", arg1 )
	
	if ArkInventory.Global.Rules.Enabled then
		
		if arg1 == "ItemRackOptions" then
			ArkInventoryRules.HookItemRackOptions( )
		end
		
	end
	
end

function ArkInventory:EVENT_ARKINV_BANK_ENTER( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: BANK_ENTER ", event )
	
	ArkInventory.Global.Mode.Bank = true
	
	local loc_id = ArkInventory.Const.Location.Bank
	ArkInventory.Global.Location[loc_id].isOffline = false
	
	if not ArkInventory:IsEnabled( ) then return end
	
	OpenAllBags( BankFrame )
	
	if ArkInventory.isLocationControlled( loc_id ) then
		--ArkInventory.Frame_Main_Show( loc_id )
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_OPEN_BUCKET", loc_id )
	else
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	ArkInventory.ScanLocation( loc_id )
	
	return true
	
end

function ArkInventory:EVENT_ARKINV_BANK_LEAVE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: BANK_LEAVE ", event )
	
	ArkInventory.Global.Mode.Bank = false
	
	local loc_id = ArkInventory.Const.Location.Bank
	ArkInventory.Global.Location[loc_id].isOffline = false
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.db.option.auto.close.bank > ArkInventory.ENUM.BAG.OPENCLOSE.NO and ArkInventory.isLocationControlled( ArkInventory.Const.Location.Bag ) then
		if ArkInventory.db.option.auto.close.bank == ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS or ArkInventory.Global.BagsOpenedBy == "BankFrame" then
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
	end
	
	
	if ArkInventory.isLocationControlled( loc_id ) then
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
		ArkInventory.Frame_Main_Hide( loc_id )
	else
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	if not ArkInventory.isLocationSaved( loc_id ) then
		local me = ArkInventory.GetPlayerCodex( )
		ArkInventory.EraseSavedData( me.player.data.info.player_id, loc_id, not me.profile.location[loc_id].notify )
	end
	
end

function ArkInventory:EVENT_ARKINV_BANK_LEAVE( ... )
	local event = ...
	--ArkInventory.Output( "EVENT: BANK_LEAVE ", event )
	ArkInventory:SendMessage( "EVENT_ARKINV_BANK_LEAVE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_BANK_UPDATE( ... )
	
	local event, arg1 = ...
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", arg1 )
	
	local count = ArkInventory.CrossClient.GetContainerNumSlots( ArkInventory.ENUM.BAG.INDEX.BANK )
	if arg1 <= count then
		-- bank item was changed
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", ArkInventory.ENUM.BAG.INDEX.BANK )
	else
		-- bank bag was changed
		-- warning classic has 24 slots but still indexes the bags from 28, use GetFirstBagBankSlotIndex to find out where to offset from
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", arg1 - ArkInventory.CrossClient.GetFirstBagBankSlotIndex( ) + ArkInventory.Const.BLIZZARD.GLOBAL.CONTAINER.NUM_BAGS )
	end
	
end

function ArkInventory:EVENT_ARKINV_BANK_SLOT( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	-- player just purchased a bank bag slot, re-scan and force a reload
	
	ArkInventory.ScanLocation( ArkInventory.Const.Location.Bank )
	ArkInventory.Frame_Main_Generate( ArkInventory.Const.Location.Bank, ArkInventory.Const.Window.Draw.Refresh )
	
end

function ArkInventory:EVENT_ARKINV_BANK_TAB( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	-- player just purchased a bank tab, re-scan and force a reload
	
	if event == "REAGENTBANK_PURCHASED" then
		ArkInventory:UnregisterEvent( "REAGENTBANK_PURCHASED" )
		ArkInventory.ScanLocation( ArkInventory.Const.Location.Bank )
		ArkInventory.Frame_Main_Generate( ArkInventory.Const.Location.Bank, ArkInventory.Const.Window.Draw.Refresh )
	end
	
end

function ArkInventory:EVENT_ARKINV_REAGENTBANK_UPDATE( ... )
	ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", ArkInventory.ENUM.BAG.INDEX.REAGENTBANK )
end

function ArkInventory.VaultTabClick( tab_id, mode )
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	GuildBankFrame.mode = mode
	SetCurrentGuildBankTab( tab_id )
	
	if mode == "log" then
		
		--ArkInventory.Output( "query log", tab_id )
		QueryGuildBankLog( tab_id ) -- fires GUILDBANKLOG_UPDATE when data is available
		
	elseif mode == "moneylog" then
		
		--ArkInventory.Output( "query money", tab_id )
		QueryGuildBankLog( ArkInventory.Const.BLIZZARD.GLOBAL.GUILDBANK.NUM_TABS + 1 ) -- fires GUILDBANKLOG_UPDATE when data is available
		
	elseif mode == "tabinfo" then
		
		--ArkInventory.Output( "query info ", tab_id )
		QueryGuildBankText( tab_id ) -- fires GUILDBANK_UPDATE_TEXT when data is available
		
	else
		
		-- bank mode
		--ArkInventory.Output( "query tab", tab_id )
		QueryGuildBankTab( tab_id ) -- fires GUILDBANKBAGSLOTS_CHANGED when data is available
		
	end
	
	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory:EVENT_ARKINV_VAULT_ENTER( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: VAULT_ENTER ", event )
	
	ArkInventory.Global.Mode.Vault = true
	
	local loc_id = ArkInventory.Const.Location.Vault
	ArkInventory.Global.Location[loc_id].isOffline = false
	
	if not ArkInventory:IsEnabled( ) then return end
	
	OpenAllBags( GuildBankFrame )
	
	if ArkInventory.isLocationControlled( loc_id ) then
		ArkInventory.Frame_Main_Show( loc_id )
	else
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	ArkInventory.VaultInfoSet( )
	ArkInventory.ScanVaultHeader( )
	
	local bag_id = ArkInventory.Global.Location[loc_id].view_tab
	local mode = ArkInventory.Global.Location[loc_id].view_mode
	ArkInventory.Global.Location[loc_id].view_load = true
	
	ArkInventory.VaultTabClick( bag_id, mode )
	
	return true
	
end

function ArkInventory:EVENT_ARKINV_VAULT_LEAVE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: VAULT_LEAVE ", event )
	
	ArkInventory.Global.Mode.Vault = false
	
	local loc_id = ArkInventory.Const.Location.Vault
	ArkInventory.Global.Location[loc_id].isOffline = true
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.db.option.auto.close.vault > ArkInventory.ENUM.BAG.OPENCLOSE.NO and ArkInventory.isLocationControlled( ArkInventory.Const.Location.Bag ) then
		if ArkInventory.db.option.auto.close.vault == ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS or ArkInventory.Global.BagsOpenedBy == "GuildBankFrame" then
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
	end
	
	if ArkInventory.isLocationControlled( loc_id ) then
		ArkInventory.Frame_Main_Hide( loc_id )
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	else
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	if not ArkInventory.isLocationSaved( loc_id ) then
		local me = ArkInventory.GetPlayerCodex( )
		ArkInventory.EraseSavedData( me.player.data.info.player_id, loc_id, not me.profile.location[loc_id].notify )
	end
	
end

function ArkInventory:EVENT_ARKINV_VAULT_LEAVE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_VAULT_LEAVE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_VAULT_UPDATE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	ArkInventory.ScanLocation( loc_id )
	
	
	-- tab changed?
	if ArkInventory.Global.Location[loc_id].view_load or ArkInventory.Global.Location[loc_id].view_tab ~= GetCurrentGuildBankTab( ) then
		
		ArkInventory.Global.Location[loc_id].view_tab = GetCurrentGuildBankTab( )
		--ArkInventory.Output( "tab changed to ", ArkInventory.Global.Location[loc_id].view_tab )
		
		local codex = ArkInventory.GetPlayerCodex( loc_id )
		for x in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
			if x == ArkInventory.Global.Location[loc_id].view_tab then
				codex.player.data.option[loc_id].bag[x].display = true
			else
				codex.player.data.option[loc_id].bag[x].display = false
			end
		end
		
		--ArkInventory.OutputWarning( "EVENT_ARKINV_VAULT_UPDATE_BUCKET 1 - .Recalculate" )
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
		
	end
	
	-- mode changed
	if ArkInventory.Global.Location[loc_id].view_load or ArkInventory.Global.Location[loc_id].view_mode ~= GuildBankFrame.mode then
		
		ArkInventory.Global.Location[loc_id].view_mode = GuildBankFrame.mode
		--ArkInventory.Output( "mode changed to ", ArkInventory.Global.Location[loc_id].view_mode )
		
		--ArkInventory.OutputWarning( "EVENT_ARKINV_VAULT_UPDATE_BUCKET 2 - .Recalculate" )
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
		
	end
	
	-- clear onenter flag
	ArkInventory.Global.Location[loc_id].view_load = nil
	
 	-- instant sorting enabled
	local codex = ArkInventory.GetPlayerCodex( loc_id )
	if codex.style.sort.when == ArkInventory.ENUM.SORTWHEN.ALWAYS then
		--ArkInventory.OutputWarning( "EVENT_ARKINV_VAULT_UPDATE_BUCKET 3 - .Recalculate" )
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
	ArkInventory.Frame_Main_Generate( loc_id )
	
	--ArkInventory.Output( "EVENT_ARKINV_VAULT_UPDATE_BUCKET END" )
	
end

function ArkInventory:EVENT_ARKINV_VAULT_UPDATE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_VAULT_UPDATE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_VAULT_LOCK( ... )
	
	local event, arg1 = ...
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", arg1 )
	
	local loc_id = ArkInventory.Const.Location.Vault
	local bag_id = GetCurrentGuildBankTab( )
	
	for slot_id = 1, ArkInventory.Global.Location[loc_id].maxSlot[bag_id] or 0 do
		ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
	end
	
	--ArkInventory.RestackResume( ArkInventory.Const.Location.Vault )
	
end

function ArkInventory:EVENT_ARKINV_VAULT_MONEY( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	ArkInventory.VaultInfoSet( )
	
end

function ArkInventory:EVENT_ARKINV_VAULT_TABS_UPDATE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	local loc_id = ArkInventory.Const.Location.Vault
	if not ArkInventory.Global.Location[loc_id].isOffline then
		-- ignore pre vault entrance events
		ArkInventory.ScanVaultHeader( )
	end
	
end

function ArkInventory:EVENT_ARKINV_VAULT_TABS_UPDATE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_VAULT_TABS_UPDATE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_VAULT_LOG( ... )
	
	local event, arg1 = ...
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", arg1 )
	
	ArkInventory.Frame_Vault_Log_Update( )
	
end

function ArkInventory:EVENT_ARKINV_VAULT_INFO( ... )
	
	local event, arg1 = ...
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", arg1 )
	
	--local loc_id = ArkInventory.Const.Location.Vault
	--ArkInventory.Output( "EVENT_ARKINV_VAULT_INFO: ", arg1, " / ", GetCurrentGuildBankTab( ), " / ", ArkInventory.Global.Location[loc_id].view_tab )
	
	ArkInventory.Frame_Vault_Info_Update( )
	
end

function ArkInventory:EVENT_ARKINV_VOID_ENTER( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: VOID_ENTER - ", event )
	
	ArkInventory.Global.Mode.Void = true
	
	local loc_id = ArkInventory.Const.Location.Void
	ArkInventory.Global.Location[loc_id].isOffline = false
	
	if not ArkInventory:IsEnabled( ) then return end
	
	OpenAllBags( VoidStorageFrame )
	
	if ArkInventory.isLocationControlled( loc_id ) then
		ArkInventory.Frame_Main_Show( loc_id )
	else
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	ArkInventory.ScanLocation( loc_id )
	
end

function ArkInventory:EVENT_ARKINV_VOID_LEAVE( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: VOID_LEAVE - ", event )
	
	ArkInventory.Global.Mode.Void = false
	
	local loc_id = ArkInventory.Const.Location.Void
	ArkInventory.Global.Location[loc_id].isOffline = true
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.db.option.auto.close.void > ArkInventory.ENUM.BAG.OPENCLOSE.NO and ArkInventory.isLocationControlled( ArkInventory.Const.Location.Bag ) then
		if ArkInventory.db.option.auto.close.void == ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS or ArkInventory.Global.BagsOpenedBy == "VoidStorageFrame" then
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
	end
	
	if ArkInventory.isLocationControlled( loc_id ) then
		ArkInventory.Frame_Main_Hide( loc_id )
	else
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	if not ArkInventory.isLocationSaved( loc_id ) then
		local me = ArkInventory.GetPlayerCodex( )
		ArkInventory.EraseSavedData( me.player.data.info.player_id, loc_id, not me.player.data.location[loc_id].notify )
	end
	
end

function ArkInventory:EVENT_ARKINV_VOID_UPDATE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	local loc_id = ArkInventory.Const.Location.Void
	
	ArkInventory.ScanLocation( loc_id )
	
 	-- always sort enabled?
	local codex = ArkInventory.GetPlayerCodex( loc_id )
	if codex.style.sort.when == ArkInventory.ENUM.SORTWHEN.ALWAYS then
		--ArkInventory.OutputWarning( "EVENT_ARKINV_VOID_UPDATE_BUCKET - .Recalculate" )
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
end

function ArkInventory:EVENT_ARKINV_VOID_UPDATE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_VOID_UPDATE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_PLAYER_EQUIPMENT_CHANGED( ... )
	
	local event, arg1, arg2 = ...
	ArkInventory.OutputDebug( "EVENT: ", event, " [", arg1, "] [", arg2, "]" )
	
	-- arg1 is in the inventory slot id
	-- arg2 is true if left empty, false if filled - we dont care about this one
	
	-- this is only player equipment, it will not trigger of bag slot changes like the item locks
	
	local inv_id = arg1
	
	local equip_end = GetInventorySlotInfo( "TABARDSLOT" )
	local bag_start = ArkInventory.CrossClient.ContainerIDToInventoryID( 1 )
	
	if inv_id <= equip_end then
		
		--ArkInventory.Output( "wearing item update" )
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", ArkInventory.Const.Offset.Wearing + 1 )
		
	elseif inv_id < bag_start then
		
		--ArkInventory.Output( "profession item update" )
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_UPDATE_BUCKET", ArkInventory.Const.Offset.TradeskillEquipment + 1 )
		
	else
		
		--ArkInventory.Output( "something else update, inv_id=", inv_id )
		
	end
	
end

function ArkInventory:EVENT_ARKINV_MAIL_ENTER( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: MAIL_ENTER - ", event )
	
	ArkInventory.Global.Mode.Mailbox = true
	
	local loc_id = ArkInventory.Const.Location.Mailbox
	ArkInventory.Global.Location[loc_id].isOffline = false
	
	if not ArkInventory:IsEnabled( ) then return end
	
	-- OpenAllBags already done by blizzard
	
	if ArkInventory.isLocationControlled( loc_id ) then
		ArkInventory.Frame_Main_Show( loc_id )
	else
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	if IsShiftKeyDown( ) then
		ArkInventory.Action.Mail.data.bypass = true
	end
	
end

function ArkInventory:EVENT_ARKINV_MAIL_LEAVE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: MAIL_LEAVE - ", event )
	
	ArkInventory.Global.Mode.Mailbox = false
	ArkInventory.Action.Mail.data.bypass = false
	ArkInventory.Action.Mail.data.running = false
	
	local loc_id = ArkInventory.Const.Location.Mailbox
	ArkInventory.Global.Location[loc_id].isOffline = true
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.db.option.auto.close.mail > ArkInventory.ENUM.BAG.OPENCLOSE.NO and ArkInventory.isLocationControlled( ArkInventory.Const.Location.Bag ) then
		if ArkInventory.db.option.auto.close.mail == ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS or ArkInventory.Global.BagsOpenedBy == "MailFrame" then
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
	end
	
	if ArkInventory.isLocationControlled( loc_id ) then
		ArkInventory.Frame_Main_Hide( loc_id )
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	else
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	if not ArkInventory.isLocationSaved( loc_id ) then
		local codex = ArkInventory.GetPlayerCodex( )
		ArkInventory.EraseSavedData( codex.player.data.info.player_id, loc_id, not codex.profile.location[loc_id].notify )
	end
	
end

function ArkInventory:EVENT_ARKINV_MAIL_LEAVE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_MAIL_LEAVE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_MAIL_UPDATE_MASSIVE_BUCKET( )
	
	local event = "MAIL_UPDATE_MASSIVE"
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	ArkInventory.ScanMailbox( true )
	
end

function ArkInventory:EVENT_ARKINV_MAIL_UPDATE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	ArkInventory.ScanMailbox( )
	
end

function ArkInventory:EVENT_ARKINV_MAIL_UPDATE( ... )
	
	ArkInventory.Action.Mail.Run( )
	
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_MAIL_UPDATE_BUCKET", event )
	
end


function ArkInventory:EVENT_ARKINV_MAIL_SEND_SUCCESS( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", ArkInventory.Global.Cache.SentMail )
	
	ArkInventory.ScanMailboxSentData( )
	
	if ArkInventory.Action.Mail.data.running then
		ArkInventory.Action.Mail.data.status = true
	end
	
end

function ArkInventory:EVENT_ARKINV_MAIL_FAILED( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	if ArkInventory.Action.Mail.data.running then
		ArkInventory.Action.Mail.data.status = false
	end
	
end

function ArkInventory.HookMailSend( ... )
	
	--ArkInventory.Output( "HookMailSend( )" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	local loc_id = ArkInventory.Const.Location.Mailbox
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	
	ArkInventory.Table.Wipe( ArkInventory.Global.Cache.SentMail )
	
	local recipient, subject, body = ...
	local n, r = strsplit( "-", recipient )
	r = r or GetRealmName( )
	
	local player_id = string.format( "%s%s%s", n, ArkInventory.Const.PlayerIDSep, r )
	if ArkInventory.db.player.data[player_id].info.player_id ~= player_id then
		return
	end
	
	-- known character, store sent mail data
	
	ArkInventory.Global.Cache.SentMail.to = player_id
	local info = ArkInventory.GetPlayerInfo( )
	ArkInventory.Global.Cache.SentMail.from = info.player_id
	ArkInventory.Global.Cache.SentMail.age = ArkInventory.TimeAsMinutes( )
	
	local name, texture, _, count
	for x = 1, ATTACHMENTS_MAX_SEND do
		
		name, texture, _, count = GetSendMailItem( x )
		if name then
			ArkInventory.Global.Cache.SentMail[x] = { n = name, c = count, h = GetSendMailItemLink( x ) }
		end
		
	end
	
end

function ArkInventory.HookMailReturn( index )
	
	--ArkInventory.Output( "HookMailReturn( ", index, " )" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	local loc_id = ArkInventory.Const.Location.Mailbox
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	
	ArkInventory.Table.Wipe( ArkInventory.Global.Cache.SentMail )
	
	local _, _, recipient = GetInboxHeaderInfo( index )
	
	local n, r = strsplit( "-", recipient )
	r = r or GetRealmName( )
	
	local player_id = string.format( "%s%s%s", n, ArkInventory.Const.PlayerIDSep, r )
	if ArkInventory.db.player.data[player_id].info.player_id ~= player_id then
		return
	end
	
	-- known character, store sent mail data
	ArkInventory.Global.Cache.SentMail.to = player_id
	local info = ArkInventory.GetPlayerInfo( )
	ArkInventory.Global.Cache.SentMail.from = info.player_id
	ArkInventory.Global.Cache.SentMail.age = ArkInventory.TimeAsMinutes( )
	
	local name, texture, _, count
	for x = 1, ATTACHMENTS_MAX_RECEIVE do
		
		name, texture, _, count = GetInboxItem( index, x )
		if name then
			ArkInventory.Global.Cache.SentMail[x] = { n = name, c = count, h = GetInboxItemLink( index, x ) }
		end
		
	end
	
	ArkInventory.ScanMailboxSentData( )
	
end

function ArkInventory:EVENT_ARKINV_TRADE_ENTER( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: TRADE_ENTER - ", event )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	OpenAllBags( TradeFrame )
	
end

function ArkInventory:EVENT_ARKINV_TRADE_LEAVE( ... )

	local event = ...
	ArkInventory.OutputDebug( "EVENT: TRADE_LEAVE - ", event )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.db.option.auto.close.trade > ArkInventory.ENUM.BAG.OPENCLOSE.NO and ArkInventory.isLocationControlled( ArkInventory.Const.Location.Bag ) then
		if ArkInventory.db.option.auto.close.trade == ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS or ArkInventory.Global.BagsOpenedBy == "TradeFrame" then
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
	end
	
end


function ArkInventory:EVENT_ARKINV_AUCTION_ENTER( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: AUCTION_ENTER - ", event )
	
	ArkInventory.Global.Mode.Auction = true
	
	local loc_id = ArkInventory.Const.Location.Auction
	ArkInventory.Global.Location[loc_id].isOffline = true
	
	if not ArkInventory:IsEnabled( ) then return end
	
	OpenAllBags( AuctionHouseFrame )
	
	if ArkInventory.isLocationControlled( loc_id ) then
		ArkInventory.Frame_Main_Show( loc_id )
	else
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	--ArkInventory:SendMessage( "EVENT_ARKINV_AUCTION_UPDATE_BUCKET" )
	-- re-enable this when you work out how to run the owned search
	
end

function ArkInventory:EVENT_ARKINV_AUCTION_LEAVE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: AUCTION_LEAVE - ", event )
	
	ArkInventory.Global.Mode.Auction = false
	
	local loc_id = ArkInventory.Const.Location.Auction
	ArkInventory.Global.Location[loc_id].isOffline = false
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.db.option.auto.close.auction > ArkInventory.ENUM.BAG.OPENCLOSE.NO and ArkInventory.isLocationControlled( ArkInventory.Const.Location.Bag ) then
		if ArkInventory.db.option.auto.close.auction == ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS or ArkInventory.Global.BagsOpenedBy == "AuctionHouseFrame" then
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
	end
	
	if ArkInventory.isLocationControlled( loc_id ) then
		ArkInventory.Frame_Main_Hide( loc_id )
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	else
		ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	if not ArkInventory.isLocationSaved( loc_id ) then
		local me = ArkInventory.GetPlayerCodex( )
		ArkInventory.EraseSavedData( me.player.data.info.player_id, loc_id, not me.profile.location[loc_id].notify )
	end
	
end

function ArkInventory:EVENT_ARKINV_AUCTION_LEAVE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_AUCTION_LEAVE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_AUCTION_UPDATE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	ArkInventory.ScanLocation( ArkInventory.Const.Location.Auction )
	
end

function ArkInventory:EVENT_ARKINV_AUCTION_UPDATE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_AUCTION_UPDATE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_AUCTION_UPDATE_MASSIVE_BUCKET( )
	
	local event = "AUCTION_UPDATE_MASSIVE"
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	ArkInventory.ScanAuction( true )
	
end

function ArkInventory:EVENT_ARKINV_MERCHANT_ENTER( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: MERCHANT_ENTER - ", event )
	
	ArkInventory.Global.Mode.Merchant = true
	
	if not ArkInventory:IsEnabled( ) then return end
	
	-- OpenAllBags is part of blizzard code so i dont have to do it here
	
	if IsShiftKeyDown( ) then
		ArkInventory.Action.Vendor.data.bypass = true
	end
	
end

function ArkInventory:EVENT_ARKINV_MERCHANT_LEAVE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: MERCHANT_LEAVE - ", event )
	
	ArkInventory.Global.Mode.Merchant = false
	
	ArkInventory.Action.Vendor.data.bypass = false
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.db.option.auto.close.merchant > ArkInventory.ENUM.BAG.OPENCLOSE.NO and ArkInventory.isLocationControlled( ArkInventory.Const.Location.Bag ) then
		if ArkInventory.db.option.auto.close.merchant == ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS or ArkInventory.Global.BagsOpenedBy == "MerchantFrame" then
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
	end
	
end

function ArkInventory:EVENT_ARKINV_MERCHANT_LEAVE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_MERCHANT_LEAVE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_ACTION_SCRAP_BUCKET( bucket )
	
	ArkInventory.OutputDebug( "EVENT: ACTION_SCRAP_BUCKET - ", bucket )
	
	if ArkInventory.Action.Scrap.data.wait or IsCurrentSpell( ArkInventory.Action.Scrap.data.spellID ) then
		ArkInventory:SendMessage( "EVENT_ARKINV_ACTION_SCRAP_BUCKET", "RETRY" )
	else
		ArkInventory.Action.Scrap.Run( )
	end
	
end

function ArkInventory:EVENT_ARKINV_UPDATE_TRADESKILL_CAST_STOPPED( ... )
	local event, isScrapping = ...
	if isScrapping then
		ArkInventory:SendMessage( "EVENT_ARKINV_ACTION_SCRAP_BUCKET", event )
	end
end

function ArkInventory:EVENT_ARKINV_UNIT_SPELLCAST_START( ... )
	local event, unitTag, lineID, spellID = ...
	if spellID == ArkInventory.Action.Scrap.data.spellID then
		-- undo the wait here and rely on the spell being cast/queued to block new runs until completed
		ArkInventory.Action.Scrap.data.wait = false
		ArkInventory:SendMessage( "EVENT_ARKINV_ACTION_SCRAP_BUCKET", event )
	end
end

function ArkInventory:EVENT_ARKINV_UNIT_SPELLCAST_INTERRUPTED( ... )
	local event, unitTag, lineID, spellID = ...
	if spellID == ArkInventory.Action.Scrap.data.spellID then
		ArkInventory:SendMessage( "EVENT_ARKINV_ACTION_SCRAP_BUCKET", event )
	end
end

function ArkInventory:EVENT_ARKINV_UNIT_SPELLCAST_SUCCEEDED( ... )
	local event, unitTag, lineID, spellID = ...
	if spellID == ArkInventory.Action.Scrap.data.spellID then
		ArkInventory:SendMessage( "EVENT_ARKINV_ACTION_SCRAP_BUCKET", event )
	end
end

function ArkInventory:EVENT_ARKINV_SCRAP_ENTER( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	ArkInventory.Global.Mode.Scrap = true
	ArkInventory.Action.Scrap.data.wait = false
	
	-- OpenAllBags is part of blizzard code so i dont have to do it here
	
	if IsShiftKeyDown( ) then
		ArkInventory.Action.Scrap.data.bypass = true
	end
	
	ArkInventory:SendMessage( "EVENT_ARKINV_ACTION_SCRAP_BUCKET", event )
	
end

function ArkInventory:EVENT_ARKINV_SCRAP_LEAVE( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: SCRAP_LEAVE - ", event )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	ArkInventory.Global.Mode.Scrap = false
	ArkInventory.Action.Scrap.data.bypass = false
	ArkInventory.Action.Scrap.data.wait = false
	
	if ArkInventory.db.option.auto.close.scrap > ArkInventory.ENUM.BAG.OPENCLOSE.NO and ArkInventory.isLocationControlled( ArkInventory.Const.Location.Bag ) then
		if ArkInventory.db.option.auto.close.scrap == ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS or ArkInventory.Global.BagsOpenedBy == "ScrappingMachineFrame" then
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
	end
	
end

function ArkInventory:EVENT_ARKINV_OBLITERUM_ENTER( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: OBLITERUM_ENTER - ", event )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	-- OpenAllBags is part of blizzard code so i dont have to do it here
	
end

function ArkInventory:EVENT_ARKINV_OBLITERUM_LEAVE( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: OBLITERUM_ENTER - ", event )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.db.option.auto.close.obliterum > ArkInventory.ENUM.BAG.OPENCLOSE.NO and ArkInventory.isLocationControlled( ArkInventory.Const.Location.Bag ) then
		if ArkInventory.db.option.auto.close.obliterum == ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS or ArkInventory.Global.BagsOpenedBy == "ObliterumForgeFrame" then
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
	end
	
end

function ArkInventory:EVENT_ARKINV_TRANSMOG_ENTER( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: TRANSMOG_ENTER - ", event )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	OpenAllBags( WardrobeFrame )
	
end

function ArkInventory:EVENT_ARKINV_TRANSMOG_LEAVE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: TRANSMOG_LEAVE - ", event )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.db.option.auto.close.transmog > ArkInventory.ENUM.BAG.OPENCLOSE.NO and ArkInventory.isLocationControlled( ArkInventory.Const.Location.Bag ) then
		if ArkInventory.db.option.auto.close.transmog == ArkInventory.ENUM.BAG.OPENCLOSE.ALWAYS or ArkInventory.Global.BagsOpenedBy == "WardrobeFrame" then
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		end
	end
	
end

function ArkInventory:EVENT_ARKINV_TRANSMOG_LEAVE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_TRANSMOG_LEAVE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_EQUIPMENT_SETS_CHANGED( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	ArkInventory.ItemCacheClear( )
	
end

function ArkInventory:EVENT_ARKINV_UPDATE_COOLDOWN_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	-- these are the only windows that should have cooldowns, or at least the only ones we will update
	ArkInventory.Frame_Main_Generate( ArkInventory.Const.Location.Bag, ArkInventory.Const.Window.Draw.Refresh )
	ArkInventory.Frame_Main_Generate( ArkInventory.Const.Location.Bank, ArkInventory.Const.Window.Draw.Refresh )
	ArkInventory.Frame_Main_Generate( ArkInventory.Const.Location.Wearing, ArkInventory.Const.Window.Draw.Refresh )
	ArkInventory.Frame_Main_Generate( ArkInventory.Const.Location.Toybox, ArkInventory.Const.Window.Draw.Refresh )
	
end

function ArkInventory:EVENT_ARKINV_UPDATE_COOLDOWN( ... )
	
	-- pretty much all of the COOLDOWN events appear to be triggered off other players as well as yourself so theyre always running.
	-- unfortunately these are the only events available
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", arg1 )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_UPDATE_COOLDOWN_BUCKET", event )
	
end

function ArkInventory:EVENT_ARKINV_QUEST_UPDATE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
	
end

function ArkInventory:EVENT_ARKINV_QUEST_UPDATE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_QUEST_UPDATE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_CVAR_UPDATE( ... )
	
	local event, arg1, arg2 = ...
	--ArkInventory.OutputDebug( "EVENT: ", event, ", ", arg1, ", ", arg2 )
	
	if arg1 == "USE_COLORBLIND_MODE" then
		--ArkInventory.OutputDebug( "cvar = ",  )
		--ArkInventory.Global.Mode.ColourBlind = ( arg2 == "1" )
		ArkInventory.Global.Mode.ColourBlind = ArkInventory.CrossClient.GetCVarBool( "colorblindMode" )
		--ArkInventory.OutputDebug( "mode = ", ArkInventory.Global.Mode.ColourBlind )
		ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
		ArkInventory.LDB.Money:Update( )
	end
	
end

function ArkInventory:EVENT_ARKINV_ZONE_CHANGED_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
end

function ArkInventory:EVENT_ARKINV_ZONE_CHANGED( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_ZONE_CHANGED_BUCKET", event )
end

function ArkInventory.HookC_TradeSkillUI_SetTooltipRecipeResultItem( ... )
	if not ArkInventory:IsEnabled( ) then return end
	local recipeID, reagents, recraft, recipeLevel = ...
	--ArkInventory.Output( "recipe ", recipeID )
	local info = C_TradeSkillUI.GetRecipeOutputItemData( recipeID, reagents, recraft )
	if info.hyperlink then
		--ArkInventory.Output( info.hyperlink )
		GameTooltip:SetHyperlink( info.hyperlink )
		--ArkInventory.TooltipAddItemCount( GameTooltip, info.hyperlink )
	end
end

function ArkInventory:EVENT_ARKINV_ACTIONBAR_UPDATE_USABLE_BUCKET( ... )
	
	local event = ...
	ArkInventory.OutputDebug( "EVENT: ", event )
	
	if ArkInventory.Global.Mode.Combat then
		-- ignored, in combat
	else
		ArkInventory.SetMountMacro( )
		--ArkInventory:SendMessage( "EVENT_ARKINV_LDB_MOUNT_UPDATE_BUCKET" )
		--ArkInventory:SendMessage( "EVENT_ARKINV_LDB_PET_UPDATE_BUCKET" )
	end
	
end

function ArkInventory:EVENT_ARKINV_ACTIONBAR_UPDATE_USABLE( ... )
	local event = ...
	ArkInventory:SendMessage( "EVENT_ARKINV_ACTIONBAR_UPDATE_USABLE_BUCKET", event )
end

function ArkInventory:EVENT_ARKINV_BAG_RESCAN_BUCKET( bucket )
	
	local event = "BAG_RESCAN"
	ArkInventory.OutputDebug( "EVENT: ", event, ", ", bucket )
	
	-- bucket = table in the format blizzard_id=true so we need to loop through them
	
	for blizzard_id in pairs( bucket ) do
		local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
		ArkInventory.OutputThread( "RESCAN [", blizzard_id, "] [", loc_id, ".", bag_id, "]"  )
		ArkInventory.Scan( blizzard_id, true )
	end
	
end

function ArkInventory.InternalIdToBlizzardBagId( loc_id, bag_id )
	
	-- converts internal location+bag codes into blizzard bag ids
	
	assert( loc_id ~= nil, "code failure: loc_id is nil" )
	assert( bag_id ~= nil, "code failure: bag_id is nil" )
	
	local blizzard_id = ArkInventory.Global.Location[loc_id].Bags[bag_id]
	
	assert( blizzard_id ~= nil, string.format( "code failure: ArkInventory.Global.Location[%s].Bags[%s] is nil", loc_id, bag_id ) )
	
	return blizzard_id
	
end

function ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	-- converts blizzard bag codes into storage location+bag ids
	
	assert( blizzard_id ~= nil, "code failure: blizzard_id is nil" )
	
	if ArkInventory.Global.Cache.BlizzardBagIdToInternalId[blizzard_id] then
		return ArkInventory.Global.Cache.BlizzardBagIdToInternalId[blizzard_id].loc_id, ArkInventory.Global.Cache.BlizzardBagIdToInternalId[blizzard_id].bag_id
	else
		ArkInventory.OutputError( "unknown blizzard bag id - ", blizzard_id )
		error( "code failure" )
	end
	
end

function ArkInventory.BagType( blizzard_id )
	
	assert( blizzard_id ~= nil, "code failure: blizzard_id is nil" )
	
	if blizzard_id == ArkInventory.ENUM.BAG.INDEX.BACKPACK then
		return ArkInventory.Const.Slot.Type.Bag
	elseif blizzard_id == ArkInventory.ENUM.BAG.INDEX.KEYRING then
		return ArkInventory.Const.Slot.Type.Keyring
	elseif blizzard_id == ArkInventory.ENUM.BAG.INDEX.BANK then
		return ArkInventory.Const.Slot.Type.Bag
	elseif blizzard_id == ArkInventory.ENUM.BAG.INDEX.REAGENTBANK then
		return ArkInventory.Const.Slot.Type.Reagent
	end
	
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if loc_id == nil then
		return ArkInventory.Const.Slot.Type.Unknown
	elseif loc_id == ArkInventory.Const.Location.Bag and bag_id == ArkInventory.Global.Location[loc_id].ReagentBag then
		return ArkInventory.Const.Slot.Type.Reagent
	elseif loc_id == ArkInventory.Const.Location.Vault then
		return ArkInventory.Const.Slot.Type.Bag
	elseif loc_id == ArkInventory.Const.Location.Mailbox then
		return ArkInventory.Const.Slot.Type.Mailbox
	elseif loc_id == ArkInventory.Const.Location.Wearing then
		return ArkInventory.Const.Slot.Type.Wearing
	elseif loc_id == ArkInventory.Const.Location.Pet then
		return ArkInventory.Const.Slot.Type.Critter
	elseif loc_id == ArkInventory.Const.Location.Mount or loc_id == ArkInventory.Const.Location.MountEquipment then
		return ArkInventory.Const.Slot.Type.Mount
	elseif loc_id == ArkInventory.Const.Location.Toybox then
		return ArkInventory.Const.Slot.Type.Toybox
	elseif loc_id == ArkInventory.Const.Location.Heirloom then
		return ArkInventory.Const.Slot.Type.Heirloom
	elseif loc_id == ArkInventory.Const.Location.Currency then
		return ArkInventory.Const.Slot.Type.Currency
	elseif loc_id == ArkInventory.Const.Location.Auction then
		return ArkInventory.Const.Slot.Type.Auction
	elseif loc_id == ArkInventory.Const.Location.Void then
		return ArkInventory.Const.Slot.Type.Void
	elseif loc_id == ArkInventory.Const.Location.Reputation then
		return ArkInventory.Const.Slot.Type.Reputation
	end
	
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		
		local codex = ArkInventory.GetLocationCodex( loc_id )
		return codex.player.data.location[loc_id].bag[bag_id].type
		
	else
		
		local h = GetInventoryItemLink( "player", ArkInventory.CrossClient.ContainerIDToInventoryID( blizzard_id ) )
		
		if h and h ~= "" then
			
			local info = ArkInventory.GetObjectInfo( h )
			local t = info.itemtypeid
			local s = info.itemsubtypeid
			
			--ArkInventory.OutputDebug( "b=[", blizzard_id, "], t=[", t, "], s=[", s, "], h=", h )
			
			if t == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.PARENT then
				
				if s == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.BAG then
					return ArkInventory.Const.Slot.Type.Bag
				elseif s == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.COOKING then
					return ArkInventory.Const.Slot.Type.Cooking
				elseif s == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.ENCHANTING then
					return ArkInventory.Const.Slot.Type.Enchanting
				elseif s == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.ENGINEERING then
					return ArkInventory.Const.Slot.Type.Engineering
				elseif s == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.JEWELCRAFTING then
					return ArkInventory.Const.Slot.Type.Jewelcrafting
				elseif s == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.HERBALISM then
					return ArkInventory.Const.Slot.Type.Herbalism
				elseif s == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.INSCRIPTION then
					return ArkInventory.Const.Slot.Type.Inscription
				elseif s == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.LEATHERWORKING then
					return ArkInventory.Const.Slot.Type.Leatherworking
				elseif s == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.MINING then
					return ArkInventory.Const.Slot.Type.Mining
				elseif s == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.FISHING then
					return ArkInventory.Const.Slot.Type.Fishing
				elseif s == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.SOULSHARD then
					return ArkInventory.Const.Slot.Type.Soulshard
				elseif s == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.REAGENT then
					return ArkInventory.Const.Slot.Type.Reagent
				end
				
			elseif t == ArkInventory.ENUM.ITEM.TYPE.QUIVER.PARENT then
				
				return ArkInventory.Const.Slot.Type.Projectile
				
			end
			
		else
			
			-- empty bag slots
			return ArkInventory.Const.Slot.Type.Bag
			
		end
		
	end
	
	ArkInventory.OutputDebug( "Unknown Bag Type: [", ArkInventory.Global.Location[loc_id].Name, "] id=[", blizzard_id, "]" )
	return ArkInventory.Const.Slot.Type.Unknown
	
end

function ArkInventory.ScanLocation( arg1 )
	
	ArkInventory.OutputDebug( "ScanLocation( ", arg1, " )" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
		if arg1 == nil or arg1 == loc_id then
			local bucket = { }
			for bag_id, blizzard_id in pairs( loc_data.Bags ) do
				bucket[blizzard_id] = true
			end
			ArkInventory.Scan( bucket )
		end
	end
	
end

function ArkInventory.Scan( bucket, rescan )
	
	local bucket = bucket
	if type( bucket ) ~= "table" then
		bucket = { [bucket] = 1 }
	end
	
	--ArkInventory.Output( "Scan( ", bucket, ", ", rescan, " ) START" )
	
	local processed = { }
	
	for blizzard_id in pairs( bucket ) do
		
		--local t1 = GetTime( )
		
		local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
		
		if loc_id == nil then
			
			ArkInventory.OutputDebug( string.format( ArkInventory.Localise["DEBUG_SCAN_ABORT_NOT_CONTROLLED"], blizzard_id, ArkInventory.Const.Program.Name ) )
			
		else
			
			if not ArkInventory.Global.Mode.World then
				
				--ArkInventory.OutputDebug( "not in world - requeue scan [", blizzard_id, "] [", loc_id, "].[", bag_id, "]" )
				ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
				
			elseif ArkInventory.ScanRunStateGet( loc_id, bag_id ) then
				
				-- already being scanned, queue for rescan
				ArkInventory.ScanRunStateQueue( loc_id, bag_id )
				ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
				
			else
				
				if ArkInventory.Global.Location[loc_id].ClientCheck == false then
					
					-- specifically check for false as it can be nil
					
					-- this allows the bag to be recognised but not scanned from certain clients
					
					ArkInventory.OutputDebug( string.format( ArkInventory.Localise["DEBUG_SCAN_ABORT_WRONG_CLIENT"], ArkInventory.Global.Location[loc_id].Name, loc_id, bag_id, blizzard_id ) )
					
				else
					
					--ArkInventory.Output( "scanning [", blizzard_id, "] [", loc_id, "].[", bag_id, "]" )
					
					if ArkInventory.Global.Location[loc_id].canView then
						
						local codex = ArkInventory.GetLocationCodex( loc_id )
						
						if codex.style.sort.when == ArkInventory.ENUM.SORTWHEN.ALWAYS then
							ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
						
						if ArkInventory.Global.Location[loc_id].canCompress and codex.style.slot.stack.mode == ArkInventory.Const.Slot.Stack.Mode.Compress and codex.style.slot.stack.compress.enable and codex.style.slot.stack.compress.sort then
							ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
						
					end
					
					if loc_id == ArkInventory.Const.Location.Bag or loc_id == ArkInventory.Const.Location.Bank then
						ArkInventory.ScanBag( blizzard_id, rescan )
					elseif loc_id == ArkInventory.Const.Location.Keyring then
						ArkInventory.ScanKeyring( blizzard_id, rescan )
					elseif loc_id == ArkInventory.Const.Location.Vault then
						if not processed[loc_id] then
							ArkInventory.ScanVault( rescan )
							ArkInventory.ScanVaultHeader( )
						end
					elseif loc_id == ArkInventory.Const.Location.Wearing then
						if not processed[loc_id] then
							ArkInventory.ScanWearing( rescan )
						end
					elseif loc_id == ArkInventory.Const.Location.Mailbox then
						if not processed[loc_id] then
							ArkInventory.ScanMailbox( )
						end
					elseif loc_id == ArkInventory.Const.Location.Pet then
						if not processed[loc_id] then
							ArkInventory.ScanCollectionPet( )
						end
					elseif loc_id == ArkInventory.Const.Location.Mount then
						if not processed[loc_id] then
							ArkInventory.ScanCollectionMount( )
							ArkInventory.ScanCollectionMountEquipment( )
						end
					elseif loc_id == ArkInventory.Const.Location.MountEquipment then
						if not processed[loc_id] then
							ArkInventory.ScanCollectionMountEquipment( )
						end
					elseif loc_id == ArkInventory.Const.Location.Toybox then
						if not processed[loc_id] then
							ArkInventory.ScanCollectionToybox( )
						end
					elseif loc_id == ArkInventory.Const.Location.Heirloom then
						if not processed[loc_id] then
							ArkInventory.ScanCollectionHeirloom( )
						end
					elseif loc_id == ArkInventory.Const.Location.Currency then
						if not processed[loc_id] then
							ArkInventory.ScanCollectionCurrency( )
						end
					elseif loc_id == ArkInventory.Const.Location.Auction then
						if not processed[loc_id] then
							ArkInventory.ScanAuction( )
						end
					elseif loc_id == ArkInventory.Const.Location.Void then
						ArkInventory.ScanVoidStorage( blizzard_id, rescan )
					elseif loc_id == ArkInventory.Const.Location.Reputation then
						if not processed[loc_id] then
							ArkInventory.ScanCollectionReputation( )
						end
					elseif loc_id == ArkInventory.Const.Location.Tradeskill then
						if not processed[loc_id] then
							ArkInventory.ScanTradeskill( blizzard_id, rescan )
						end
					elseif loc_id == ArkInventory.Const.Location.TradeskillEquipment then
						if not processed[loc_id] then
							ArkInventory.ScanTradeskillEquipment( rescan )
						end
					else
						error( string.format( "code failure: uncoded location [%s] for bag [%s] [%s]", loc_id, bag_id, blizzard_id ) )
					end
					
				end
				
				--t1 = GetTime( ) - t1
				--ArkInventory.Output( "scan location[" , loc_id, ".", blizzard_id, "] in ", string.format( "%0.3f", t1 ) )
				
				processed[loc_id] = true
				
			end
			
		end
		
	end
	
	--ArkInventory.Output( "Scan( ", bucket, ", ", rescan, " ) END" )
	
end

function ArkInventory.ScanRunStateInit( loc_id, bag_id )
	if not ArkInventory.Global.Location[loc_id].scanning then
		ArkInventory.Global.Location[loc_id].scanning = { r = { }, q = { } }
	end
end

function ArkInventory.ScanRunStateGet( loc_id, bag_id )
	ArkInventory.ScanRunStateInit( loc_id, bag_id )
	return ArkInventory.Global.Location[loc_id].scanning.r[bag_id]
end

function ArkInventory.ScanRunStateSet( loc_id, bag_id )
	--ArkInventory.Output( "running [", loc_id, "].[", bag_id, "]" )
	ArkInventory.ScanRunStateInit( loc_id, bag_id )
	ArkInventory.Global.Location[loc_id].scanning.r[bag_id] = 1
	ArkInventory.Global.Location[loc_id].scanning.q[bag_id] = nil
end

function ArkInventory.ScanRunStateClear( loc_id, bag_id )
	--ArkInventory.Output( "completed [", loc_id, "].[", bag_id, "]" )
	ArkInventory.ScanRunStateInit( loc_id, bag_id )
	ArkInventory.Global.Location[loc_id].scanning.r[bag_id] = nil
end

function ArkInventory.ScanRunStateQueue( loc_id, bag_id )
	-- only used to stop part of the cleanup process.  no point cleaning up when another scan is about to happen and youll be cleaning up after it anyway
	--ArkInventory.Output( "queuing [", loc_id, "].[", bag_id, "]" )
	ArkInventory.ScanRunStateInit( loc_id, bag_id )
	ArkInventory.Global.Location[loc_id].scanning.q[bag_id] = 1
end




local function helper_ItemBindingStatus( tooltip )
	
	for _, v in pairs( ArkInventory.Const.BindingText.Account ) do
		if v and ArkInventory.TooltipContains( tooltip, nil, v, false, true, false, ArkInventory.Const.Tooltip.Search.Short ) then
			return ArkInventory.ENUM.BIND.ACCOUNT
		end
	end
	
	for _, v in pairs( ArkInventory.Const.BindingText.Pickup ) do
		if v and ArkInventory.TooltipContains( tooltip, nil, v, false, true, false, ArkInventory.Const.Tooltip.Search.Short ) then
			return ArkInventory.ENUM.BIND.PICKUP
		end
	end
	
	for _, v in pairs( ArkInventory.Const.BindingText.Equip ) do
		if v and ArkInventory.TooltipContains( tooltip, nil, v, false, true, false, ArkInventory.Const.Tooltip.Search.Short ) then
			return ArkInventory.ENUM.BIND.EQUIP
		end
	end
	
	for _, v in pairs( ArkInventory.Const.BindingText.Use ) do
		if v and ArkInventory.TooltipContains( tooltip, nil, v, false, true, false, ArkInventory.Const.Tooltip.Search.Short ) then
			return ArkInventory.ENUM.BIND.USE
		end
	end
	
	return ArkInventory.ENUM.BIND.NEVER
	
end

function ArkInventory.GetItemUnwearable( i, codex, wearable, ignore_known, ignore_level )
	
	if i and i.h then
		
		local info = i.info or ArkInventory.GetObjectInfo( i.h, i )
		
		local wearable = not not wearable
		local ignore_known = not not ignore_known
		local ignore_level = not not ignore_level
		
		local e = string.trim( info.equiploc )
		if e == "" or info.itemtypeid == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.PARENT then
			return false
		end
		
		
		-- is there any red text making it unwearable?  ignoring already known and player level requirements
		ArkInventory.TooltipSet( ArkInventory.Global.Tooltip.Scan, i.loc_id, i.bag_id, i.slot_id, i.h )
		local canuse = ArkInventory.TooltipCanUse( ArkInventory.Global.Tooltip.Scan, nil, ignore_known, ignore_level )
		if not canuse then
			if wearable then
				--ArkInventory.Output( "wearable fail 1: ", i.h )
				return false
			else
				--ArkInventory.Output( "unwearable pass 1: ", i.h )
				return true
			end
		end
		
		
		-- everything past here should be equippable
		
		-- anything that isnt armour is wearable
		if info.itemtypeid ~= ArkInventory.ENUM.ITEM.TYPE.ARMOR.PARENT then
			if wearable then
				--ArkInventory.Output( "wearable pass 1: ", i.h )
				return true
			else
				--ArkInventory.Output( "unwearable fail 0: ", i.h )
				return false
			end
		end
		
		-- cloaks are cloth, but everyone can wear them
		if info.equiploc == "INVTYPE_CLOAK" then
			if wearable then
				return true
			else
				return false
			end
		end
		
		
		-- class based armor subtype restrictions
		local class = codex.player.data.info.class
		if class == HUNTER and codex.player.data.info.level < 40 then
			class = LOWLEVELHUNTER
		end
		
		
		-- should this class wear this type of armor
		if ( not ArkInventory.Const.ClassArmor[info.itemsubtypeid] ) or ( ArkInventory.Const.ClassArmor[info.itemsubtypeid] and ArkInventory.Const.ClassArmor[info.itemsubtypeid][class] ) then
			if wearable then
				--ArkInventory.Output( "wearable pass 2: ", i.h )
				return true
			else
				--ArkInventory.Output( "unwearable fail 1: ", i.h )
				return false
			end
		end
		
		if ( ArkInventory.Const.ClassArmor[info.itemsubtypeid] and not ArkInventory.Const.ClassArmor[info.itemsubtypeid][class] ) then
			if wearable then
				--ArkInventory.Output( "wearable fail 3: ", i.h )
				return false
			else
				--ArkInventory.Output( "unwearable pass 2: ", i.h )
				return true
			end
		end
		
		
		if wearable then
			--ArkInventory.Output( "wearable fail final: ", i.h )
		else
			--ArkInventory.Output( "unwearable fail final: ", i.h, " / ", ArkInventory.Const.ClassArmor[info.itemsubtypeid] )
		end
		
	end
	
	
	return false
	
end

function ArkInventory.GetItemTinted( i, codex )
	
	if not codex.style.slot.unusable.tint and not codex.style.slot.unwearable.tint then
		return false
	end
	
	if i and i.h then
		
		local osd = ArkInventory.ObjectStringDecode( i.h )
		local info = i.info or ArkInventory.GetObjectInfo( i.h, i )
		
		if i.loc_id == ArkInventory.Const.Location.Pet or osd.class == "battlepet" then
			
			if codex.style.slot.unusable.tint then
				
				local codex = ArkInventory.GetLocationCodex( ArkInventory.Const.Location.Bag )
				--local player_id = ArkInventory.PlayerIDAccount( )
				--local account = ArkInventory.GetPlayerStorage( player_id )
				
				--if account and codex.player.data.info and codex.player.data.info.level and codex.player.data.info.level < osd.level then
				if codex.player.data.info and codex.player.data.info.level and codex.player.data.info.level < osd.level then
					return true
				end
				
			end
			
		elseif i.loc_id == ArkInventory.Const.Location.Mount then
			
			if codex.style.slot.unusable.tint then
				
				if not ArkInventory.Collection.Mount.isUsable( i.index ) then
					return true
				end
				
			end
			
		elseif i.loc_id == ArkInventory.Const.Location.Heirloom or i.loc_id == ArkInventory.Const.Location.Toybox then
			
			if codex.style.slot.unusable.tint then
				
				local tooltipInfo = ArkInventory.TooltipSet( ArkInventory.Global.Tooltip.Scan, i.loc_id, i.bag_id, i.slot_id, i.h )
				--ArkInventory.Output( "lines = ", #tooltipInfo.lines, " / ", #ArkInventory.Global.Tooltip.Scan.ARKTTD.info.lines )
				
				if not ArkInventory.TooltipCanUse( ArkInventory.Global.Tooltip.Scan, nil, true ) then
					return true
				end
				
			end
			
		else
			
			if codex.style.slot.unusable.tint then
				
				local ignore_known = ignore_known or ( ( info.q or ArkInventory.ENUM.ITEM.QUALITY.POOR ) == ArkInventory.ENUM.ITEM.QUALITY.HEIRLOOM )
				
				local tooltipInfo = ArkInventory.TooltipSet( ArkInventory.Global.Tooltip.Scan, i.loc_id, i.bag_id, i.slot_id, i.h )
				if not ArkInventory.TooltipCanUse( ArkInventory.Global.Tooltip.Scan, nil, ignore_known ) then
					return true
				end
				
			end
			
			if codex.style.slot.unwearable.tint then
				
				local e = string.trim( info.equiploc )
				if not ( e == "" or info.itemtypeid == ArkInventory.ENUM.ITEM.TYPE.CONTAINER.PARENT ) then
					
					if ArkInventory.GetItemUnwearable( i, codex, false, true, ignore_level ) then
						return true
					end
					
				end
				
			end
			
		end
		
	end
	
	
	return false
	
end


function ArkInventory.ScanBag( blizzard_id, rescan )
	
	ArkInventory.OutputDebug( "ScanBag( ", blizzard_id, " )" )
	
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not loc_id then
		--ArkInventory.OutputWarning( "aborted scan of bag [", blizzard_id, "], unknown bag id" )
		return
	else
		--ArkInventory.Output( "found bag id [", blizzard_id, "] in location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "]" )
	end
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanBag_Threaded( blizzard_id, loc_id, bag_id, thread_id, rescan )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanBag_Threaded( blizzard_id, loc_id, bag_id, thread_id, rescan )
	
	ArkInventory.OutputThread( "ScanBag_Threaded( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	local count = 0
	local empty = 0
	local texture = nil
	local status = ArkInventory.Const.Bag.Status.Unknown
	local h = nil
	local quality = ArkInventory.ENUM.ITEM.QUALITY.POOR
	
	if loc_id == ArkInventory.Const.Location.Bag then
		
		count = ArkInventory.CrossClient.GetContainerNumSlots( blizzard_id )
		
		if bag_id == 1 then
			
			if not count or count == 0 then
				
				if ArkInventory.db.option.bugfix.zerosizebag.alert then
					ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 5 seconds.  This warning can be disabled in the config menu" )
				end
				
				ArkInventory.OutputDebug( "rescan1 ", blizzard_id )
				ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
				return
				
			end
			
			texture = ArkInventory.Global.Location[loc_id].Texture
			status = ArkInventory.Const.Bag.Status.Active
			
		else
			
			h = GetInventoryItemLink( "player", ArkInventory.CrossClient.ContainerIDToInventoryID( blizzard_id ) )
			
			if not h then
				
				texture = ArkInventory.Const.Texture.Empty.Bag
				status = ArkInventory.Const.Bag.Status.Empty
				
			else
				
				if not count or count == 0 then
					
					if ArkInventory.db.option.bugfix.zerosizebag.alert then
						ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 5 seconds.  This warning can be disabled in the config menu" )
					end
					
					ArkInventory.OutputDebug( "rescan2 ", blizzard_id )
					ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
					return
					
				end
				
				status = ArkInventory.Const.Bag.Status.Active
				
				local info = ArkInventory.GetObjectInfo( h )
				texture = info.texture
				quality = info.q
				
			end
			
		end
		
	end
	
	if loc_id == ArkInventory.Const.Location.Bank then
		
		count = ArkInventory.CrossClient.GetContainerNumSlots( blizzard_id )
		
		if bag_id == ArkInventory.Global.Location[loc_id].ReagentBag then
			
			if not count or count == 0 then
				
				if ArkInventory.db.option.bugfix.zerosizebag.alert then
					ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 5 seconds.  This warning can be disabled in the config menu" )
				end
				
				ArkInventory.OutputDebug( "rescan3 ", blizzard_id )
				ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
				return
				
			end
			
			if ArkInventory.CrossClient.IsReagentBankUnlocked( ) then
				texture = ArkInventory.Global.Location[loc_id].Texture
				status = ArkInventory.Const.Bag.Status.Active
			else
				count = 0
				texture = ArkInventory.Const.Texture.Empty.Bag
				status = ArkInventory.Const.Bag.Status.Purchase
			end
			
			if ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.DRAGONFLIGHT ) then
				if ArkInventory.Global.Mode.Bank == false then
					-- reagent bank can no longer be seen when at the bank in dragonflight
					--ArkInventory.OutputWarning( "aborted scan of bag id [", blizzard_id, "], not at bank" )
					return
				end
			else
				-- reagent bank can be seen when not at the bank
			end
			
		else
			
			if bag_id == 1 then
				
				if not count or count == 0 then
					
					if ArkInventory.db.option.bugfix.zerosizebag.alert then
						ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 5 seconds.  This warning can be disabled in the config menu" )
					end
					
					ArkInventory.OutputDebug( "rescan4 ", blizzard_id )
					ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
					return
					
				end
				
				texture = ArkInventory.Global.Location[loc_id].Texture
				status = ArkInventory.Const.Bag.Status.Active
				
			else
				
				if bag_id > ( GetNumBankSlots( ) + 1 ) then
					
					texture = ArkInventory.Const.Texture.Empty.Bag
					status = ArkInventory.Const.Bag.Status.Purchase
					
				else
					
					h = GetInventoryItemLink( "player", ArkInventory.CrossClient.ContainerIDToInventoryID( blizzard_id ) )
					
					if not h then
						
						texture = ArkInventory.Const.Texture.Empty.Bag
						status = ArkInventory.Const.Bag.Status.Empty
						
					else
						
						if not count or count == 0 then
							
							if ArkInventory.db.option.bugfix.zerosizebag.alert then
								ArkInventory.OutputWarning( "Aborted scan of bag ", blizzard_id, ", location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] size returned was ", count, ", rescan has been scheduled for 5 seconds.  This warning can be disabled in the config menu" )
							end
							
							--ArkInventory.Output( "rescan5 ", blizzard_id )
							ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
							return
							
						end
						
						status = ArkInventory.Const.Bag.Status.Active
						
						local info = ArkInventory.GetObjectInfo( h )
						texture = info.texture
						quality = info.q
						
					end
					
				end
				
			end
			
			if ArkInventory.Global.Mode.Bank == false then
				-- bank can not be seen when at the bank, but crafting can trakes mats out of it so the item counts will get out of sync when that happens
				--ArkInventory.OutputWarning( "aborted scan of bag id [", blizzard_id, "], not at bank" )
				return
			end
			
		end
		
	end
	
	--ArkInventory.Output( "scanning bag [", blizzard_id, "] [", bag_id, "]  location [", loc_id, "] [", ArkInventory.Global.Location[loc_id].Name, "]  size [", count, "]" )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	local old_bag_type = bag.type
	local old_bag_count = bag.count
	local old_bag_link = bag.h
	local old_bag_status = bag.status
	
	bag.type = ArkInventory.BagType( blizzard_id )
	--ArkInventory.Output( "blizzard_id [", blizzard_id, "], loc_id [", loc_id, "], bag_id [", bag_id, "] type [", bag.type, "]" )
	bag.count = count
	bag.h = h
	bag.status = status
	bag.texture = texture
	bag.empty = empty
	bag.q = quality
	
	if old_bag_type ~= bag.type or old_bag_count ~= bag.count or ArkInventory.ObjectIDCount( old_bag_link ) ~= ArkInventory.ObjectIDCount( bag.h ) or old_bag_status ~= bag.status then
		--ArkInventory.OutputWarning( "ScanBag_Threaded - Recalculate" )
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
	local ready = true
	local update_changer = false
	
	for slot_id = 1, bag.count do
		
		ArkInventory.ThreadYield_Scan( thread_id )
		
		local tz = debugprofilestop( )
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		local itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( blizzard_id, slot_id )
		
		h = itemInfo.hyperlink
		quality = itemInfo.quality
		
		local info = ArkInventory.GetObjectInfo( h )
		local sb = ArkInventory.ENUM.BIND.NEVER
		
		if h then
			
			--ArkInventory.Output( h )
			
			local tooltipInfo = ArkInventory.TooltipSet( ArkInventory.Global.Tooltip.Scan, loc_id, bag_id, slot_id, h )
			
			sb = helper_ItemBindingStatus( ArkInventory.Global.Tooltip.Scan )
			--ArkInventory.Output( h, " = ", sb )
			
			if tooltipInfo.battlePetSpeciesID then
				
				h = tooltipInfo.hyperlink
				quality = tooltipInfo.battlePetBreedQuality
				
			else
				
				if not info.ready or not ArkInventory.TooltipIsReady( ArkInventory.Global.Tooltip.Scan ) then
					ArkInventory.OutputDebug( "item not ready while scanning [", blizzard_id, ", ", slot_id, "] ", itemInfo.hyperlink )
					ready = false
				end
				
			end
			
		else
			
			bag.empty = bag.empty + 1
			i.age = nil
			
		end
		
		
		local changed_item, changed_type = ArkInventory.ScanChanged( i, h, sb, itemInfo.stackCount )
		
		i.h = h or nil
		i.sb = sb or nil
		i.q = nil
		i.r = nil
		i.o = itemInfo.hasLoot or nil
		i.count = itemInfo.stackCount or nil
		i.u = nil
		
		if C_NewItems.IsNewItem( blizzard_id, slot_id ) then
			i.age = ArkInventory.TimeAsMinutes( )
		end
		
		if changed_item then
			
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			
			--local id = ArkInventory.LocationEncode( loc_id, bag_id, slot_id )
			--ArkInventory.Output( "changed: ", loc_id, "-", bag_id, "-", slot_id )
			--ArkInventory:SendMessage( "EVENT_ARKINV_ITEM_UPDATE_BUCKET", id )
			
		end
		
		--tz = debugprofilestop( ) - tz
		--ArkInventory.OutputThread( "Scanned [", string.format( "%0.2fms", tz ), "] [", blizzard_id, " / ", loc_id, "] [", bag_id, "] [", slot_id, "] = ", i.h or "empty" )
		
	end
	
	if bag.type == ArkInventory.Const.Slot.Type.Unknown and bag.status == ArkInventory.Const.Bag.Status.Active then
		
		if ArkInventory.TranslationsLoaded and ArkInventory.db.option.message.bag.unknown then
			-- print the warning only after the translations are loaded (and the user wants to see them)
			--ArkInventory.OutputWarning( "bag [", blizzard_id, "] [", loc_id, ".", bag_id, "] [", ArkInventory.Global.Location[loc_id].Name, "] type is unknown, queuing for rescan" )
		end
		
		ready = false
		
	end
	
	if not ready then
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
	end
	
	if rescan then
		--ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.OutputThread( "ScanBag_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanKeyring( blizzard_id, rescan )
	
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanKeyring_Threaded( blizzard_id, loc_id, bag_id, thread_id, rescan )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanKeyring_Threaded( blizzard_id, loc_id, bag_id, thread_id, rescan )
	
	ArkInventory.OutputThread( "ScanKeyring_Threaded( ", blizzard_id, " ) START" )
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scanning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = ArkInventory.CrossClient.GetContainerNumSlots( blizzard_id ) or 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Keyring
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local old_bag_count = bag.count
	local old_bag_status = bag.status
	
	if old_bag_count ~= bag.count or old_bag_status ~= bag.status then
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
	local ready = true
	
	for slot_id = 1, bag.count do
		
		ArkInventory.ThreadYield_Scan( thread_id )
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		
		local inv_id = ArkInventory.CrossClient.KeyRingButtonIDToInvSlotID( slot_id )
		local h = GetInventoryItemLink( "player", inv_id )
		local info = ArkInventory.GetObjectInfo( h )
		local sb = ArkInventory.ENUM.BIND.NEVER
		local count = 0
		
		if h then
			
			count = GetInventoryItemCount( "player", inv_id ) -- returns 1 for empty slots so only check if theres an item
			
			local tooltipInfo = ArkInventory.TooltipSet( ArkInventory.Global.Tooltip.Scan, loc_id, bag_id, slot_id, h )
			
			sb = helper_ItemBindingStatus( ArkInventory.Global.Tooltip.Scan )
			
			if not info.ready or not ArkInventory.TooltipIsReady( ArkInventory.Global.Tooltip.Scan ) then
				ArkInventory.OutputDebug( "item not ready while scanning [", blizzard_id, ", ", slot_id, "] ", h )
				ready = false
			end
			
		else
			
			count = 1
			bag.empty = bag.empty + 1
			i.age = nil
			
		end
		
		
		local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
		
		i.loc_id = loc_id
		i.bag_id = bag_id
		i.slot_id = slot_id
			
		i.h = h
		i.count = count
		i.sb = sb
		--i.q = ArkInventory.ObjectInfoQuality( h )
		i.q = nil
		
		if C_NewItems.IsNewItem( blizzard_id, slot_id ) then
			i.age = ArkInventory.TimeAsMinutes( )
		end
		
		if changed_item then
			
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			
			ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			
		end
		
	end
	
	if not ready then
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
	end
	
	if rescan then
		--ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.OutputThread( "ScanKeyring_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanVault( rescan )
	
	--ArkInventory.Output( "ScanVault( )" )
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	if ArkInventory.Global.Mode.Vault == false then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of vault, not at vault" )
		return
	end
	
	local info = ArkInventory.GetPlayerInfo( )
	if not info.guild_id then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of vault, not in a guild" )
		return
	end
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	
	if GetNumGuildBankTabs( ) == 0 then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of vault, no tabs purchased" )
		return
	end
	
	local bag_id = GetCurrentGuildBankTab( )
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanVault_Threaded( loc_id, bag_id, thread_id, rescan )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanVault_Threaded( loc_id, bag_id, thread_id, rescan )
	
	local blizzard_id = ArkInventory.InternalIdToBlizzardBagId( loc_id, bag_id )
	ArkInventory.OutputThread( "ScanVault_Threaded( ", blizzard_id, " ) START" )
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scanning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = bag.count or 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Bag
	
	local old_bag_count = bag.count
	local old_bag_status = bag.status
	
	local blizzard_container_width = ArkInventory.Const.BLIZZARD.GLOBAL.GUILDBANK.WIDTH
	local blizzard_container_depth = ArkInventory.Const.BLIZZARD.GLOBAL.GUILDBANK.HEIGHT
	
	if bag_id <= GetNumGuildBankTabs( ) then
		local name, icon, canView, canDeposit, numWithdrawals, remainingWithdrawals, filtered = GetGuildBankTabInfo( bag_id )
		bag.name = name
		bag.texture = icon
		bag.count = ArkInventory.Const.BLIZZARD.GLOBAL.GUILDBANK.SLOTS_PER_TAB
		bag.status = ArkInventory.Const.Bag.Status.Active
	end
	
	local canView, canDeposit = select( 3, GetGuildBankTabInfo( bag_id ) )
	
	if old_bag_count ~= bag.count or old_bag_status ~= bag.status then
		--ArkInventory.OutputWarning( "ScanVault_Threaded - .Recalculate" )
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
	local ready = true
	
	for slot_id = 1, bag.count or 0 do
		
		ArkInventory.ThreadYield_Scan( thread_id )
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		i.did = blizzard_container_width * ( ( slot_id - 1 ) % blizzard_container_depth ) + math.floor( ( slot_id - 1 ) / blizzard_container_depth ) + 1
		
		local texture, count = GetGuildBankItemInfo( bag_id, slot_id )
		local h = nil
		local sb = ArkInventory.ENUM.BIND.NEVER
		local quality = ArkInventory.ENUM.ITEM.QUALITY.POOR
		
		if texture then
			
			local tooltipInfo = ArkInventory.TooltipSet( ArkInventory.Global.Tooltip.Scan, loc_id, bag_id, slot_id )
			
			sb = helper_ItemBindingStatus( ArkInventory.Global.Tooltip.Scan )
			
			h = GetGuildBankItemLink( bag_id, slot_id )
			local info = ArkInventory.GetObjectInfo( h )
			
			if tooltipInfo.battlePetSpeciesID then
				
				h = tooltipInfo.hyperlink
				quality = tooltipInfo.battlePetBreedQuality
				
			else
				
				quality = info.quality
				
				if not info.ready or not ArkInventory.TooltipIsReady( ArkInventory.Global.Tooltip.Scan ) then
					ArkInventory.OutputDebug( "item not ready while scanning [", blizzard_id, ", ", slot_id, "] ", h )
					ready = false
				end
				
			end
			
		else
			
			count = 1
			bag.empty = bag.empty + 1
			i.age = nil
			
		end
		
		
		local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
		
		i.h = h
		i.count = count
		i.sb = sb
		--i.q = quality
		i.q = nil
		
		if C_NewItems.IsNewItem( blizzard_id, slot_id ) then
			i.age = ArkInventory.TimeAsMinutes( )
		end
		
		if changed_item then
			
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			
			ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			
		end
		
	end
	
	if not ready then
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
	end
	
	if rescan then
		--ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.OutputThread( "ScanVault_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanVaultHeader( )
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	if ArkInventory.Global.Mode.Vault == false then
		--ArkInventory.Output( "aborted scan of tab headers, not at vault" )
		return
	end
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	for bag_id = 1, ArkInventory.Const.BLIZZARD.GLOBAL.GUILDBANK.NUM_TABS do
		
		--ArkInventory.Output( "scaning tab header: ", bag_id )
		
		local bag = player.data.location[loc_id].bag[bag_id]
		
		bag.loc_id = loc_id
		bag.bag_id = bag_id
		
		bag.type = ArkInventory.Const.Slot.Type.Bag
	
		if bag_id <= GetNumGuildBankTabs( ) then
			
			local name, icon, canView, canDeposit, numWithdrawals, remainingWithdrawals = GetGuildBankTabInfo( bag_id )
			
			--ArkInventory.Output( "tab = ", bag_id, ", icon = ", icon )
			
			bag.name = name
			bag.texture = icon
			bag.status = ArkInventory.Const.Bag.Status.Active
			
			-- from Blizzard_GuildBankUI.lua - GuildBankFrame_UpdateTabs( )
			local access = GUILDBANK_TAB_FULL_ACCESS
			if not canView then
				access = ArkInventory.Localise["VAULT_TAB_ACCESS_NONE"]
			elseif ( not canDeposit and numWithdrawals == 0 ) then
				access = GUILDBANK_TAB_LOCKED
			elseif ( not canDeposit ) then
				access = GUILDBANK_TAB_WITHDRAW_ONLY
			elseif ( numWithdrawals == 0 ) then
				access = GUILDBANK_TAB_DEPOSIT_ONLY
			end
			bag.access = access
			
			local stackString = nil
			if bag_id == GetCurrentGuildBankTab( ) then
				if remainingWithdrawals > 0 then
					stackString = string.format( "%s/%s", remainingWithdrawals, string.format( GetText( "STACKS", nil, numWithdrawals ), numWithdrawals ) )
				elseif remainingWithdrawals == 0 then
					stackString = NONE
				else
					stackString = UNLIMITED
				end
			end
			bag.withdraw = stackString
			
			if bag.access == ArkInventory.Localise["VAULT_TAB_ACCESS_NONE"] then
				bag.status = ArkInventory.Const.Bag.Status.NoAccess
				bag.withdraw = nil
			end
			
		else
			
			bag.name = string.format( GUILDBANK_TAB_NUMBER, bag_id )
			bag.texture = ArkInventory.Const.Texture.Empty.Bag
			bag.count = 0
			bag.empty = 0
			bag.access = ArkInventory.Localise["STATUS_PURCHASE"]
			bag.withdraw = nil
			bag.status = ArkInventory.Const.Bag.Status.Purchase
			
		end
		
	end
	
	ArkInventory.Frame_Changer_Update( loc_id )
	
	--ArkInventory.Output( "ScanVaultHeader( ) end" )
	
end

function ArkInventory.ScanWearing( rescan )
	
	-- temporarily disable wearing scan
	--if true then return end
	
	local blizzard_id = ArkInventory.Const.Offset.Wearing + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanWearing_Threaded( blizzard_id, loc_id, bag_id, thread_id, rescan )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanWearing_Threaded( blizzard_id, loc_id, bag_id, thread_id, rescan )
	
	ArkInventory.OutputThread( "ScanWearing_Threaded( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Wearing
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local ready = true
	
	for slot_id, v in ipairs( ArkInventory.Const.InventorySlotName ) do
		
		ArkInventory.ThreadYield_Scan( thread_id )
		
		--local tz = debugprofilestop( )
		
		bag.count = bag.count + 1
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		
		local inv_id = GetInventorySlotInfo( v )
		local h = GetInventoryItemLink( "player", inv_id )
		local info = ArkInventory.GetObjectInfo( h )
		local sb = ArkInventory.ENUM.BIND.NEVER
		local count = 1
		
		if h then
			
			local tooltipInfo = ArkInventory.TooltipSet( ArkInventory.Global.Tooltip.Scan, loc_id, bag_id, slot_id, h )
			
			sb = helper_ItemBindingStatus( ArkInventory.Global.Tooltip.Scan )
			
			if not info.ready or not ArkInventory.TooltipIsReady( ArkInventory.Global.Tooltip.Scan ) then
				ArkInventory.OutputDebug( "item not ready while scanning [", blizzard_id, ", ", slot_id, "] ", h )
				ready = false
			end
			
		else
			
			count = 1
			bag.empty = bag.empty + 1
			i.age = nil
			
		end
		
		
		local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
		
		i.h = h
		i.count = count
		i.sb = sb
		--i.q = ArkInventory.ObjectInfoQuality( h )
		i.q = nil
		
		if changed_item then
			
			if i.h then
				i.age = ArkInventory.TimeAsMinutes( )
			end
			
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			
			ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			
		end
		
		--tz = debugprofilestop( ) - tz
		--ArkInventory.OutputThread( "Scanned [", string.format( "%0.2fms", tz ), "] [", blizzard_id, " / ", loc_id, "] [", bag_id, "] [", slot_id, "] = ", i.h or "empty" )
		
	end
	
	if not ready then
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
	end
	
	if rescan then
		--ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.OutputThread( "ScanWearing_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanMailbox( rescan )
	
	-- mailbox can be scanned from anywhere, just uses data from when it was last opened but dont bother unless its actually open
	if ArkInventory.Global.Mode.Mailbox == false then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of mailbox, not at mailbox" )
		return
	end
	
	local blizzard_id = ArkInventory.Const.Offset.Mailbox + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanMailbox_Threaded( blizzard_id, loc_id, bag_id, thread_id, rescan )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanMailbox_Threaded( blizzard_id, loc_id, bag_id, thread_id )
	
	ArkInventory.OutputThread( "ScanMailbox_Threaded( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Mailbox
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local ready = true
	local slot_id = 0
	
	for index = 1, GetInboxNumItems( ) do
		
		ArkInventory.ThreadYield_Scan( thread_id )
		
		--ArkInventory.Output( "scanning message ", index )
		
		--ArkInventory.Output( { GetInboxHeaderInfo( index ) } )
		local packageTexture, stationaryTexture, sender, subject, money, CoD, daysLeft, itemCount, wasRead, wasReturned, saved, canReply, GM = GetInboxHeaderInfo( index )
		
		if money > 0 then
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			
			local h = string.format( "copper:0:%s", money )
			local sb = ArkInventory.ENUM.BIND.NEVER
			local count = money
			
			bag.count = bag.count + 1
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.sb = sb
			i.count = 0
			--i.q = 0
			i.q = nil
			
			i.msg_id = index
			i.att_id = nil
			i.money = count
			i.texture = GetCoinIcon( count )
			
			if changed_item then
				
				if i.h then
					i.age = ArkInventory.TimeAsMinutes( )
				end
				
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				
				ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
				
			end
			
		end
		
		if itemCount then
			
			--if ( daysLeft >= 1 ) then
--			daysLeft = string.format( "%s%s%s%s", GREEN_FONT_COLOR_CODE, string.format( DAYS_ABBR, math.floor(daysLeft) ), " ", FONT_COLOR_CODE_CLOSE )
			--else
--			daysLeft = string.format( "%s%s%s", RED_FONT_COLOR_CODE, SecondsToTime( math.floor( daysLeft * 24 * 60 * 60 ) ), FONT_COLOR_CODE_CLOSE )
			--end
			
			--local expires_d = math.floor( daysLeft )
			--local expires_s = ( daysLeft - math.floor( daysLeft ) ) * 24 * 60* 60
			--local purge = not not ( wasReturned ) or ( not canReply )
			
			--ArkInventory.Output( "message ", index, " has item(s)" )
			
			for x = 1, ArkInventory.Const.BLIZZARD.GLOBAL.MAILBOX.NUM_ATTACHMENT_MAX do
				
				ArkInventory.ThreadYield_Scan( thread_id )
				
				local name, itemid, texture, count = GetInboxItem( index, x )
				
				if name then
					
					--ArkInventory.Output( "message ", index, ", attachment ", x, " = ", name, " x ", count, " / (", { GetInboxItemLink( index, x ) }, ")" )
					
					slot_id = slot_id + 1
					
					if not bag.slot[slot_id] then
						bag.slot[slot_id] = {
							loc_id = loc_id,
							bag_id = bag_id,
							slot_id = slot_id,
						}
					end
					
					local i = bag.slot[slot_id]
					
					local h = GetInboxItemLink( index, x )
					local info = ArkInventory.GetObjectInfo( h )
					local quality = ArkInventory.ENUM.ITEM.QUALITY.POOR
					local sb = ArkInventory.ENUM.BIND.NEVER
					
					i.msg_id = index
					i.att_id = x
					
					if h then
						
						local tooltipInfo = ArkInventory.TooltipSet( ArkInventory.Global.Tooltip.Scan, loc_id, index, x, h )
						
						sb = helper_ItemBindingStatus( ArkInventory.Global.Tooltip.Scan )
						
						if tooltipInfo.battlePetSpeciesID then
							
							h = tooltipInfo.hyperlink
							quality = tooltipInfo.battlePetBreedQuality
							
						else
							
							quality = info.quality
							
							if not info.ready or not ArkInventory.TooltipIsReady( ArkInventory.Global.Tooltip.Scan ) then
								ArkInventory.OutputDebug( "item not ready while scanning [", blizzard_id, ", ", slot_id, "] ", h )
								ready = false
							end
							
						end
						
						bag.count = bag.count + 1
						
					end
					
					local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
					
					i.h = h
					i.sb = sb
					i.count = count
					--i.q = quality
					i.q = nil
					
					i.money = nil
					i.texture = nil
					
					if changed_item then
						
						if i.h then
							i.age = ArkInventory.TimeAsMinutes( )
						else
							i.age = nil
						end
						
						ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
						
						ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
						
					end
					
				end
				
			end
			
		end
		
	end
	
	-- if there are no items then create a single empty slot, it just makes things easier
	if slot_id == 0 then
		
		ArkInventory.ThreadYield_Scan( thread_id )
		
		slot_id = slot_id + 1
		bag.count = bag.count + 1
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		
		local h = nil
		local sb = ArkInventory.ENUM.BIND.NEVER
		local count = nil
		
		bag.empty = bag.empty + 1
		
		local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
		
		i.h = h
		i.sb = sb
		i.age = nil
		i.count = count
		i.texture = nil
		--i.q = 0
		i.q = nil
		
		if changed_item then
			
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			
			ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			
		end
		
	end
	
	if not ready then
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
	end
	
	if rescan then
		--ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	
	
	-- clear cached mail sent from other known characters
	blizzard_id = ArkInventory.Const.Offset.Mailbox + 2
	loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Mailbox
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.OutputThread( "ScanMailbox_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanMailboxSentData( )
	
	local blizzard_id = ArkInventory.Const.Offset.Mailbox + 2
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scanning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( ArkInventory.Global.Cache.SentMail.to, loc_id )
	if not player.data.info.player_id then
		return
	end
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Mailbox
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local slot_id = bag.count
	
	for x = 1, ATTACHMENTS_MAX do
		
		if ArkInventory.Global.Cache.SentMail[x] then
		
			slot_id = slot_id + 1
			bag.count = slot_id
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			
			local h = ArkInventory.Global.Cache.SentMail[x].h
			local info = ArkInventory.GetObjectInfo( h )
			local sb = ArkInventory.ENUM.BIND.NEVER
			local count = ArkInventory.Global.Cache.SentMail[x].c
			
			if h then
				if not info.ready then
					ArkInventory.OutputDebug("item not ready while scanning [", blizzard_id, ", ", slot_id, "] ", h )
					ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
				end
			end
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.sb = sb
			i.age = ArkInventory.Global.Cache.SentMail[x].age
			i.count = count
			--i.q = ArkInventory.ObjectInfoQuality( h )
			i.q = nil
			i.sdr = ArkInventory.Global.Cache.SentMail[x].from
				
			if changed_item then
				
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				
				ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
				
			end
			
		end
		
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
end

function ArkInventory.ScanCollectionMount( )
	
	--ArkInventory.Output( "ScanCollectionMount( ) start" )
	
	local blizzard_id = ArkInventory.Const.Offset.Mount + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	
	if ( not ArkInventory.Collection.Mount.IsReady( ) ) then
		--ArkInventory.Output( "mount journal not ready" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_UPDATE_BUCKET", "RESCAN" )
		return
	end
	--ArkInventory.Output( "mount journal ready" )
	
	if ( ArkInventory.Collection.Mount.GetCount( ) == 0 ) then
		--ArkInventory.Output( "no mounts" )
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanCollectionMount_Threaded( blizzard_id, loc_id, bag_id, thread_id )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanCollectionMount_Threaded( blizzard_id, loc_id, bag_id, thread_id )
	
	ArkInventory.OutputThread( "ScanCollectionMount_Threaded( ", blizzard_id, " ) START" )
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "scanning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id

	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	--ArkInventory.Output( "scanning mounts [", ArkInventory.Collection.Mount.data.owned, "]" )
	
	local slot_id = 0
	
	for _, object in ArkInventory.Collection.Mount.IterateAll( ) do
		
		if object.owned then
			
			ArkInventory.ThreadYield_Scan( thread_id )
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			local h = object.link
			local sb = ArkInventory.ENUM.BIND.ACCOUNT
			local count = 1
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.count = count
			i.sb = sb
			--i.q = 1
			i.q = nil
			
			i.index = object.index
			i.fav = object.isFavorite
			
			if changed_item then
				
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				
				ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
				
			end
			
		end
		
	end
	
	bag.count = slot_id
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_LDB_MOUNT_UPDATE_BUCKET" )
	
	ArkInventory.OutputThread( "ScanCollectionMount_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanCollectionMountEquipment( )
	
	--ArkInventory.Output( "ScanCollectionMountEquipment( ) start" )
	
	local blizzard_id = ArkInventory.Const.Offset.MountEquipment + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		--ArkInventory.Output( "mount equipment not monitored" )
		return
	end
	
	
	if ( not ArkInventory.Collection.Mount.IsReady( ) ) then
		--ArkInventory.Output( "mount journal not ready, queue for rescan" )
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
		return
	end
	--ArkInventory.Output( "mount journal ready" )
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanCollectionMountEquipment_Threaded( blizzard_id, loc_id, bag_id, thread_id )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanCollectionMountEquipment_Threaded( blizzard_id, loc_id, bag_id, thread_id )
	
	ArkInventory.OutputThread( "ScanCollectionMountEquipment_Threaded( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id

	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	--ArkInventory.Output( "scanning equipment slot" )
	
	ArkInventory.ThreadYield_Scan( thread_id )
	
	local slot_id = 1
	
	local itemID = ArkInventory.Collection.Mount.GetEquipmentID( )
	local info = ArkInventory.GetObjectInfo( itemID )
	
	bag.count = bag.count + 1
	
	if not bag.slot[slot_id] then
		bag.slot[slot_id] = {
			loc_id = loc_id,
			bag_id = bag_id,
			slot_id = slot_id,
		}
	end
	
	local i = bag.slot[slot_id]
	local h = info.h
	local sb = ArkInventory.ENUM.BIND.EQUIP
	local count = 1
	
	local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
		
	i.h = h
	i.sb = sb
	i.count = count
	i.texture = info.texture
	--i.q = info.q
	i.q = nil
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.OutputThread( "ScanCollectionMountEquipment_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanCollectionPet( )
	
	--ArkInventory.Output( "ScanCollectionPet( ) start" )
	
	local blizzard_id = ArkInventory.Const.Offset.Pet + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	
	if not ArkInventory.Collection.Pet.IsReady( ) then
		--ArkInventory.Output( "pet journal not ready" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_PET_UPDATE_BUCKET", "RESCAN" )
		return
	end
	--ArkInventory.Output( "pet journal ready" )
	
	if ArkInventory.Collection.Pet.GetCount( ) == 0 then
		--ArkInventory.Output( "no pets" )
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanCollectionPet_Threaded( blizzard_id, loc_id, bag_id, thread_id )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanCollectionPet_Threaded( blizzard_id, loc_id, bag_id, thread_id )
	
	ArkInventory.OutputThread( "ScanCollectionPet_Threaded( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	--ArkInventory.Output( "scanning pets [", ArkInventory.Collection.Pet.owned, "]" )
	
	local slot_id = 0
	
	player.data.info.level = 1
	
	for _, object in ArkInventory.Collection.Pet.Iterate( ) do
		
		ArkInventory.ThreadYield_Scan( thread_id )
		
		slot_id = slot_id + 1
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		
		local h = object.link
		
		local level = object.level or 1
		
		if player.data.info.level < level then
			-- save highest pet level for tint unusable
			player.data.info.level = level
		end
		
		local count = 1
		
		local sb = ArkInventory.ENUM.BIND.ACCOUNT
		if object.sd.isTradable then
			sb = ArkInventory.ENUM.BIND.NEVER
		end
		
		local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
		
		i.h = h
		i.sb = sb
		--i.q = object.quality
		i.q = nil
		i.count = count
		i.guid = object.guid
		i.bp = ( object.sd.canBattle and 1 ) or nil
		i.wp = ( object.sd.isWild and 1 ) or nil
		i.cn = object.cn
		i.index = object.index
		i.fav = object.fav
		
		if changed_item then
			
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			
			ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			
		end
		
	end
	
	bag.count = slot_id
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_LDB_PET_UPDATE_BUCKET" )
	
	ArkInventory.OutputThread( "ScanCollectionPet_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanCollectionToybox( )
	
	--ArkInventory.Output( "ScanCollectionToybox( ) start" )
	
	local blizzard_id = ArkInventory.Const.Offset.Toybox + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	if not ArkInventory.Collection.Toybox.IsReady( ) then
		--ArkInventory.Output( "toybox not ready" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_TOYBOX_UPDATE_BUCKET", "RESCAN" )
		return
	end
	--ArkInventory.Output( "toybox ready", { ArkInventory.Collection.Toybox } )
	
	if ArkInventory.Collection.Toybox.GetCount( ) == 0 then
		--ArkInventory.Output( "no toys" )
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanCollectionToybox_Threaded( blizzard_id, loc_id, bag_id, thread_id )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanCollectionToybox_Threaded( blizzard_id, loc_id, bag_id, thread_id )
	
	ArkInventory.OutputThread( "ScanCollectionToybox_Threaded( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local slot_id = 0
	
	for _, object in ArkInventory.Collection.Toybox.Iterate( ) do
		
		if object.owned then
			
			ArkInventory.ThreadYield_Scan( thread_id )
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			
			local h = object.link
			local sb = ArkInventory.ENUM.BIND.ACCOUNT
			local count = 1
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.count = count
			i.sb = sb
			--i.q = 1
			i.q = nil
			
			i.index = object.index
			i.item = object.item
			i.fav = object.fav
			
			if changed_item then
				
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				
				ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
				
			end
			
		end
		
	end
	
	bag.count = slot_id
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.OutputThread( "ScanCollectionToybox_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanCollectionHeirloom( )
	
	--ArkInventory.Output( "ScanCollectionHeirloom( ) start" )
	
	local blizzard_id = ArkInventory.Const.Offset.Heirloom + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	if not ArkInventory.Collection.Heirloom.IsReady( ) then
		--ArkInventory.Output( "heirloom journal not ready" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_HEIRLOOM_UPDATE_BUCKET", "NOT_READY" )
		return
	end
	--ArkInventory.Output( "heirloom journal ready" )
	
	if ArkInventory.Collection.Heirloom.GetCount( ) == 0 then
		--ArkInventory.Output( "no heirlooms" )
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanCollectionHeirloom_Threaded( blizzard_id, loc_id, bag_id, thread_id )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanCollectionHeirloom_Threaded( blizzard_id, loc_id, bag_id, thread_id )
	
	ArkInventory.OutputThread( "ScanCollectionHeirloom_Threaded( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local slot_id = 0
	
	for _, object in ArkInventory.Collection.Heirloom.Iterate( ) do
		
		if object.owned then
			
			ArkInventory.ThreadYield_Scan( thread_id )
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			
			local h = object.link
			local sb = ArkInventory.ENUM.BIND.ACCOUNT
			local count = 1
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.count = count
			i.sb = sb
			--i.q = ArkInventory.ENUM.ITEM.QUALITY.HEIRLOOM
			i.q = nil
			i.item = object.item
			
			if changed_item then
				
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				
				ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
				
			end
			
		end
		
	end
	
	bag.count = slot_id
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.OutputThread( "ScanCollectionHeirloom_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanCollectionCurrency( )
	
	ArkInventory.OutputDebug( "ScanCollectionCurrency( ) start" )
	
	local blizzard_id = ArkInventory.Const.Offset.Currency + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	if not ArkInventory.Collection.Currency.IsReady( ) then
		ArkInventory.OutputDebug( "currency not ready" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_CURRENCY_UPDATE_BUCKET", "NOT_READY" )
		return
	end
	ArkInventory.OutputDebug( "currency is ready" )
	
	if ArkInventory.Collection.Currency.GetCount( ) == 0 then
		ArkInventory.OutputDebug( "no active currencies" )
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanCollectionCurrency_Threaded( blizzard_id, loc_id, bag_id, thread_id )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
	ArkInventory.OutputDebug( "ScanCollectionCurrency( ) end" )
	
end

function ArkInventory.ScanCollectionCurrency_Threaded( blizzard_id, loc_id, bag_id, thread_id )
	
	ArkInventory.OutputThread( "ScanCollectionCurrency_Threaded( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local slot_id = 0
	
	for _, object in ArkInventory.Collection.Currency.Iterate( ) do
		
		if object.owned then
			
			ArkInventory.ThreadYield_Scan( thread_id )
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			local h = object.link
			local sb = ArkInventory.ENUM.BIND.PICKUP
			local count = object.quantity
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.count = count
			i.sb = sb
			--i.q = object.quality
			i.q = nil
			i.age = nil
			i.id = object.id
			
			if changed_item then
				
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				
				ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
				
			end
			
		end
		
	end
	
	bag.count = slot_id

	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	-- token "bag" blizzard is using (mapped to our second bag)
	bag_id = 2
	bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Currency
	bag.status = ArkInventory.Const.Bag.Status.NoAccess
	
	ArkInventory:SendMessage( "EVENT_ARKINV_LDB_CURRENCY_UPDATE_BUCKET" )
	
	ArkInventory.OutputThread( "ScanCollectionCurrency_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanCollectionReputation( blizzard_id )
	
	--ArkInventory.Output( "ScanCollectionReputation( ) start" )
	
	local blizzard_id = ArkInventory.Const.Offset.Reputation + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	if not ArkInventory.Collection.Reputation.IsReady( ) then
		--ArkInventory.Output( "reputation not ready" )
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_REPUTATION_UPDATE_BUCKET", "NOT_READY" )
		return
	end
	--ArkInventory.Output( "repuation ready" )
	
	if ArkInventory.Collection.Reputation.GetCount( ) == 0 then
		--ArkInventory.Output( "no active reputations" )
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanCollectionReputation_Threaded( blizzard_id, loc_id, bag_id, thread_id )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanCollectionReputation_Threaded( blizzard_id, loc_id, bag_id, thread_id )
	
	ArkInventory.OutputThread( "ScanCollectionReputation_Threaded( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local slot_id = 0
	
	for _, object in ArkInventory.Collection.Reputation.Iterate( ) do
		
		if object.owned then
			
			ArkInventory.ThreadYield_Scan( thread_id )
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			
			local h = object.link
			local sb = ArkInventory.ENUM.BIND.PICKUP
			local count = object.barValue
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.sb = sb
			i.count = count
			--i.q = 0
			i.q = nil
			i.age = nil
			
			if changed_item then
				
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
				
				ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
				
			end
			
		end
		
	end
	
	bag.count = slot_id
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_LDB_REPUTATION_UPDATE_BUCKET" )
	
	ArkInventory.OutputThread( "ScanCollectionReputation_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanTradeskill( blizzard_id )
	
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	--ArkInventory.OutputDebug( "ScanTradeskill( ", bag_id, " ) start" )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		return
	end
	
	if not ArkInventory.Tradeskill.IsReady( ) then
		--ArkInventory.Output( "tradeskill not ready" )
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanTradeskill_Threaded( blizzard_id, loc_id, bag_id, thread_id )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanTradeskill_Threaded( blizzard_id, loc_id, bag_id, thread_id )
	
	ArkInventory.OutputThread( "ScanTradeskill_Threaded( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local skillID = player.data.info.tradeskill[bag_id]
	--ArkInventory.Output( bag_id, " = ", skillID )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = 0
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local slot_id = 0
	
	for _, object in ArkInventory.Tradeskill.Iterate( skillID ) do
		
		if object.learned then
			
			ArkInventory.ThreadYield_Scan( thread_id )
			
			slot_id = slot_id + 1
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			
			local h = object.link
			
			local sb = ArkInventory.ENUM.BIND.PICKUP
			local count = 0 -- dont set this to 1 or you'll bugger up the actual item counts, it just has to exist
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.sb = sb
			i.count = count
			--i.q = 0
			i.q = nil
			i.age = nil
			
			if changed_item then
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			end
			
		end
		
	end
	
	bag.count = slot_id
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.OutputThread( "ScanTradeskill_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanTradeskillEquipment( rescan )
	
	if not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.DRAGONFLIGHT ) then return end
	
	local blizzard_id = ArkInventory.Const.Offset.TradeskillEquipment + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanTradeskillEquipment_Threaded( blizzard_id, loc_id, bag_id, thread_id, rescan )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanTradeskillEquipment_Threaded( blizzard_id, loc_id, bag_id, thread_id, rescan )
	
	ArkInventory.OutputThread( "ScanTradeskillEquipment_Threaded( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local ready = true
	
	for bag_id = 1, ArkInventory.Const.Tradeskill.maxLearn do
		
		local bag = player.data.location[loc_id].bag[bag_id]
		
		bag.loc_id = loc_id
		bag.bag_id = bag_id
		
		bag.count = 0
		bag.empty = 0
		bag.type = ArkInventory.Const.Slot.Type.Bag
		bag.status = ArkInventory.Const.Bag.Status.Active
		
		
		for slot_id, v in ipairs( ArkInventory.Const.Tradeskill.ToolSlotNames[bag_id] ) do
			
			ArkInventory.ThreadYield_Scan( thread_id )
			
			if not bag.slot[slot_id] then
				bag.slot[slot_id] = {
					loc_id = loc_id,
					bag_id = bag_id,
					slot_id = slot_id,
				}
			end
			
			local i = bag.slot[slot_id]
			
			local inv_id = GetInventorySlotInfo( v )
			local h = GetInventoryItemLink( "player", inv_id )
			local info = ArkInventory.GetObjectInfo( h )
			local sb = ArkInventory.ENUM.BIND.NEVER
			local count = 1
			
			if h then
				
				local tooltipInfo = ArkInventory.TooltipSet( ArkInventory.Global.Tooltip.Scan, loc_id, bag_id, slot_id, h )
				
				sb = helper_ItemBindingStatus( ArkInventory.Global.Tooltip.Scan )
				
				if not info.ready or not ArkInventory.TooltipIsReady( ArkInventory.Global.Tooltip.Scan ) then
					ArkInventory.OutputDebug( "item not ready while scanning [", blizzard_id, ", ", slot_id, "] ", h )
					ready = false
				end
				
			else
				
				count = 1
				bag.empty = bag.empty + 1
				i.age = nil
				
			end
			
			local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
			
			i.h = h
			i.sb = sb
			i.count = count
			--i.q = info.quality
			i.q = nil
			
			if changed_item then
				ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			end
			
			bag.count = slot_id
			
		end
		
		ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
		
	end
	
	if not ready then
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
	end
	
	ArkInventory.OutputThread( "ScanTradeskillEquipment_Threaded( ", blizzard_id, " ) END" )
	
end

local CanUseVoidStorage = CanUseVoidStorage or ArkInventory.HookDoNothing

function ArkInventory.ScanVoidStorage( blizzard_id )
	
	--ArkInventory.Output( "ScanVoidStorage" )
	
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	if not CanUseVoidStorage( ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of void storage, storage not active" )
		return
	end
	
	if ArkInventory.Global.Mode.Void == false then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of void storage, not at npc" )
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanVoidStorage_Threaded( blizzard_id, loc_id, bag_id, thread_id )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanVoidStorage_Threaded( blizzard_id, loc_id, bag_id, thread_id )
	
	ArkInventory.OutputThread( "ScanVoidStorage_Threaded( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = ArkInventory.Const.BLIZZARD.GLOBAL.VOIDSTORAGE.NUM_SLOT_MAX
	bag.empty = 0
	bag.type = ArkInventory.BagType( blizzard_id )
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	local blizzard_container_width = 10
	local blizzard_container_depth = 8
	
	for slot_id = 1, bag.count do
		
		ArkInventory.ThreadYield_Scan( thread_id )
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		i.did = blizzard_container_width * ( ( slot_id - 1 ) % blizzard_container_depth ) + math.floor( ( slot_id - 1 ) / blizzard_container_depth ) + 1
		
		local item_id, texture, locked, recentDeposit, isFiltered, q = GetVoidItemInfo( bag_id, slot_id )
		local h = GetVoidItemHyperlinkString( ( bag_id - 1 ) * bag.count + slot_id )
		local info = ArkInventory.GetObjectInfo( h )
		local count = 1
		local sb = ArkInventory.ENUM.BIND.PICKUP
		
		if h then
			
			if not info.ready then
				ArkInventory.OutputDebug("item not ready while scanning [", blizzard_id, ", ", slot_id, "] ", h )
				ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
			end
			
		else
			
			bag.empty = bag.empty + 1
			
		end
		
		
		local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
		
		i.h = h
		i.count = count
		i.sb = sb
		--i.q = q
		i.q = nil
		
		if changed_item or i.loc_id == nil then
			
			if i.h then
				i.age = ArkInventory.TimeAsMinutes( )
			else
				i.age = nil
			end
			
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			
			ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			
		end
		
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.OutputThread( "ScanVoidStorage_Threaded( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanAuction( massive )
	
	if ArkInventory.Global.Mode.Auction == false then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of auction house, not at auction house" )
		return
	end
	
	local blizzard_id = ArkInventory.Const.Offset.Auction + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		--ArkInventory.Output( RED_FONT_COLOR_CODE, "aborted scan of bag id [", blizzard_id, "], location ", loc_id, " [", ArkInventory.Global.Location[loc_id].Name, "] is not being monitored" )
		return
	end
	
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Scan, loc_id, bag_id )
	
	local thread_func = function( )
		ArkInventory.ScanRunStateSet( loc_id, bag_id )
		ArkInventory.ScanAuction_Threaded( blizzard_id, loc_id, bag_id, thread_id, massive )
		ArkInventory.ScanRunStateClear( loc_id, bag_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end

function ArkInventory.ScanAuction_Threaded( blizzard_id, loc_id, bag_id, thread_id, massive )
	if ArkInventory.Const.BLIZZARD.TOC >= 80300 then
		ArkInventory.ScanAuction_Threaded_80300( blizzard_id, loc_id, bag_id, thread_id, massive )
	else
		ArkInventory.ScanAuction_Threaded_80205( blizzard_id, loc_id, bag_id, thread_id, massive )
	end
end

function ArkInventory.ScanAuction_Threaded_80300( blizzard_id, loc_id, bag_id, thread_id, massive )
	
	ArkInventory.OutputThread( "ScanAuction_Threaded_80300( ", blizzard_id, " ) START" )
	
	local auctions = C_AuctionHouse.GetNumOwnedAuctions( )
	--ArkInventory.Output( "num auctions = ", auctions )
	local full = C_AuctionHouse.HasFullOwnedAuctionResults( )
	--ArkInventory.Output( "full = ", full )
	if not full then
		-- no data for auctions, requeue
		ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
		return
	end
	
	if auctions > 500 and not massive then
		ArkInventory:SendMessage( "EVENT_ARKINV_AUCTION_UPDATE_MASSIVE_BUCKET" )
		return
	end
	
	local now = ArkInventory.TimeAsMinutes( )
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "ptr scanning: ", ArkInventory.Global.Location[loc_id].Name, " [", loc_id, ".", bag_id, "] - [", blizzard_id, "]" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	bag.count = auctions
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Auction
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	for slot_id = 1, bag.count do
		
		ArkInventory.ThreadYield_Scan( thread_id )
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		
		--ArkInventory.Output( "scanning auction ", slot_id, " of ", bag.count )
		
		local object = C_AuctionHouse.GetOwnedAuctionInfo( slot_id )
		if not object or not object.itemKey then
			-- no data for auction, requeue
			ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
			return
		end
		--ArkInventory.Output( "object = ", object )
		
		local h = object.itemLink
		local bp = object.itemKey.battlePetSpeciesID or 0
		if bp > 0 then
			h = string.format( "battlepet:%s", bp )
		end
		local info = ArkInventory.GetObjectInfo( h )
		local count = object.quantity
		local id = object.auctionID
		local expires = math.floor( now + ( object.timeLeftSeconds or 0 ) / 60 )
		local sb = ArkInventory.ENUM.BIND.NEVER
		
		if h then
			if not info.ready then
				ArkInventory.OutputDebug("item not ready while scanning [", blizzard_id, ", ", slot_id, "] ", h )
				ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
			end
		end
		
		if not h or sold == 1 then
			count = 1
			bag.empty = bag.empty + 1
			h = nil
			duration = nil
		end
		
		--ArkInventory.Output( "auction ", slot_id, " = ", h, " x ", count )
		
		local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
		
		i.h = h
		i.count = count
		i.sb = sb
		--i.q = ArkInventory.ObjectInfoQuality( h )
		i.q = nil
		
		if changed_item then
			
			if i.h then
				i.age = now
				i.expires = expires
			else
				i.age = nil
				i.expires = nil
			end
			
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			
			ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			
		end
		
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.OutputThread( "ScanAuction_Threaded_80300( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanAuction_Threaded_80205( blizzard_id, loc_id, bag_id, thread_id, massive )
	
	ArkInventory.OutputThread( "ScanAuction_Threaded_80205( ", blizzard_id, " ) START" )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	local auctions = select( 2, GetNumAuctionItems( "owner" ) )
	
	if auctions > 100 and not massive then
		ArkInventory:SendMessage( "EVENT_ARKINV_AUCTION_UPDATE_MASSIVE_BUCKET" )
		return
	end
	
	bag.count = auctions
	bag.empty = 0
	bag.type = ArkInventory.Const.Slot.Type.Auction
	bag.status = ArkInventory.Const.Bag.Status.Active
	
	for slot_id = 1, bag.count do
		
		ArkInventory.ThreadYield_Scan( thread_id )
		
		if not bag.slot[slot_id] then
			bag.slot[slot_id] = {
				loc_id = loc_id,
				bag_id = bag_id,
				slot_id = slot_id,
			}
		end
		
		local i = bag.slot[slot_id]
		
		--ArkInventory.Output( "scanning auction ", slot_id, " of ", bag.count )
		
		local h = GetAuctionItemLink( "owner", slot_id )
		local info = ArkInventory.GetObjectInfo( h )
		local name, texture, count, quality, canUse, level, minBid, minIncrement, buyoutPrice, bidAmount, highestBidder, owner, sold = GetAuctionItemInfo( "owner", slot_id )
		local duration = GetAuctionItemTimeLeft( "owner", slot_id )
		local sb = ArkInventory.ENUM.BIND.NEVER
		
		--ArkInventory.Output( "auction ", slot_id, " / ", h, " / ", sold )
		
		if h then
			if not info.ready then
				ArkInventory.OutputDebug("item not ready while scanning [", blizzard_id, ", ", slot_id, "] ", h )
				ArkInventory:SendMessage( "EVENT_ARKINV_BAG_RESCAN_BUCKET", blizzard_id )
			end
		end
		
		if not h or sold == 1 then
			count = 1
			bag.empty = bag.empty + 1
			h = nil
			duration = nil
		end
		
		--ArkInventory.Output( "auction ", slot_id, " = ", h, " x ", count )
		
		local changed_item = ArkInventory.ScanChanged( i, h, sb, count )
		
		i.h = h
		i.count = count
		i.sb = sb
		--i.q = ArkInventory.ObjectInfoQuality( h )
		i.q = nil
		
		if changed_item then
			
			if i.h then
				i.age = ArkInventory.TimeAsMinutes( )
			else
				i.age = nil
			end

			if duration == 1 then
				-- Short (less than 30 minutes)
				i.expires = ( i.age or 0 ) + 30
			elseif duration == 2 then
				-- Medium (30 minutes to 2 hours)
				i.expires = ( i.age or 0 ) + 2 * 60
			elseif duration == 3 then
				-- Long (2 hours to 12 hours)
				i.expires = ( i.age or 0 ) + 12 * 60
			elseif duration == 4 then
				-- Very Long (more than 12 hours)
				i.expires = ( i.age or 0 ) + 48 * 60
			end
			
			ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
			
			ArkInventory:SendMessage( "EVENT_ARKINV_CHANGER_UPDATE_BUCKET", loc_id )
			
		end
		
	end
	
	ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	ArkInventory.OutputThread( "ScanAuction_Threaded_80205( ", blizzard_id, " ) END" )
	
end

function ArkInventory.ScanAuctionExpire( )
	if ArkInventory.Const.BLIZZARD.TOC >= 80300 then
		ArkInventory.ScanAuctionExpire_80300( )
	else
		ArkInventory.ScanAuctionExpire_80205(  )
	end
end

function ArkInventory.ScanAuctionExpire_80300( )
	
	local blizzard_id = ArkInventory.Const.Offset.Auction + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	local now = ArkInventory.TimeAsMinutes( )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	local search_id
	
	for slot_id = 1, bag.count do
		
		local i = bag.slot[slot_id]
		
		if i.h then
			
			if i.expires and i.expires < now then
				
				search_id = ArkInventory.ObjectIDCount( i.h )
				ArkInventory.ObjectCacheCountClear( search_id )
				
				ArkInventory.Table.Wipe( i )
				
				i.loc_id = loc_id
				i.bag_id = bag_id
				i.slot_id = slot_id
				
				i.count = 1
				bag.empty = bag.empty + 1
				
			end
			
		end
		
	end
	
	ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory.ScanAuctionExpire_80205( )
	
	local blizzard_id = ArkInventory.Const.Offset.Auction + 1
	local loc_id, bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	
	local current_time = ArkInventory.TimeAsMinutes( )
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	
	local bag = player.data.location[loc_id].bag[bag_id]
	
	
	bag.loc_id = loc_id
	bag.bag_id = bag_id
	
	local search_id
	
	for slot_id = 1, bag.count do
		
		local i = bag.slot[slot_id]
		
		if i.h then
			
			if ( i.expires and ( i.expires < current_time ) ) or ( i.age and ( i.age + 48 * 60 < current_time ) ) then
				
				search_id = ArkInventory.ObjectIDCount( i.h )
				ArkInventory.ObjectCacheCountClear( search_id )
				
				ArkInventory.Table.Wipe( i )
				
				i.loc_id = loc_id
				i.bag_id = bag_id
				i.slot_id = slot_id
				
				i.count = 1
				bag.empty = bag.empty + 1
				
			end
			
		end
		
	end
	
	--ArkInventory.OutputWarning( "ScanAuctionExpire - .Recalculate" )
	ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory.ScanChanged( old, h, sb, count )
	
	--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", h, " ", count )
	
	-- check for slot changes
	
	-- return item has changed, new status
	
	-- item counts are now reset here if required
	
	-- do not use the full hyperlink, pull out the itemstring part and check against that, theres a bug where the name isnt always included in the hyperlink
	
	if not h then
		
		-- slot is empty
		
		if old.h then
			
			-- previous item was removed
			ArkInventory.ScanCleanupCountAdd( old.h, old.loc_id )
			
			--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", old.h, " - item removed" )
			return true, ArkInventory.Const.Slot.New.No
			
		end
		
	else
		
		-- slot has an item
		
		if not old.h then
			
			-- item added to previously empty slot
			ArkInventory.ScanCleanupCountAdd( h, old.loc_id )
			
			--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", h, " - item added" )
			return true, ArkInventory.Const.Slot.New.Yes
			
		end
		
		if ArkInventory.ObjectInfoItemString( h ) ~= ArkInventory.ObjectInfoItemString( old.h ) then
			
			-- different item
			ArkInventory.ScanCleanupCountAdd( old.h, old.loc_id )
			ArkInventory.ScanCleanupCountAdd( h, old.loc_id )
			
			--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", old.h, " / ", h, " - item changed" )
			return true, ArkInventory.Const.Slot.New.Yes
			
		end
		
		if sb ~= old.sb then
			
			-- soulbound changed
			--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", old.h, " - soulbound was ", old.sb, " now ", sb )
			return true, ArkInventory.Const.Slot.New.Yes
			
		end
		
		if count and old.count and count ~= old.count then
			
			-- same item, previously existed, count has changed
			ArkInventory.ScanCleanupCountAdd( old.h, old.loc_id )
			
			if count > old.count then
				--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", old.h, " - count increased" )
				return true, ArkInventory.Const.Slot.New.Inc
			else
				--ArkInventory.Output( "scanchanged: ", old.loc_id, ".", old.bag_id, ".", old.slot_id, " - ", old.h, " - count decreased" )
				return true, ArkInventory.Const.Slot.New.Dec
			end
			
		end
		
	end

end

function ArkInventory.ScanCleanupCountAdd( h, loc_id )
	
	if not h or not loc_id then return end
	
	local cid = ArkInventory.ObjectIDCount( h )
	if not ArkInventoryScanCleanupList[cid] then
		ArkInventoryScanCleanupList[cid] = { }
	end
	
	ArkInventoryScanCleanupList[cid][loc_id] = true
	
end

function ArkInventory.ScanCleanup( player, loc_id, bag_id, bag )
	
	local num_slots = #bag.slot
	--ArkInventory.Output( "cleanup: loc=", loc_id, ", bag=", bag_id, ", count=", num_slots, " / ", bag.count )
	
	-- remove unwanted slots
	if num_slots > bag.count then
		for slot_id = bag.count + 1, num_slots do
			
			if bag.slot[slot_id] and bag.slot[slot_id].h then
				ArkInventory.ScanCleanupCountAdd( bag.slot[slot_id].h, loc_id )
			end
			
			--ArkInventory.Output( "wiped bag ", bag_id, " slot ", slot_id )
			ArkInventory.Table.Wipe( bag.slot[slot_id] )
			bag.slot[slot_id] = nil
			
		end
	end
	
	-- recalculate total slots
	player.data.location[loc_id].slot_count = ArkInventory.Table.Sum( player.data.location[loc_id].bag, function( a ) return a.count end )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_LOCATION_SCANNED_BUCKET", loc_id )
	
end


function ArkInventory.GetItemQualityColor( q )
	
	local q = q
	if type( q ) ~= "number" then
		q = ArkInventory.ENUM.ITEM.QUALITY.UNKNOWN
	end
	
	local r, g, b = 0, 0, 0
	if q == ArkInventory.ENUM.ITEM.QUALITY.MISSING then
		r = 1
	elseif q == ArkInventory.ENUM.ITEM.QUALITY.UNKNOWN then
		r, g, b = GetItemQualityColor( ArkInventory.ENUM.ITEM.QUALITY.STANDARD )
	else
		r, g, b = GetItemQualityColor( q )
	end
	
	local c = CreateColor( r, g, b, 1 )
	local hc = c:GenerateHexColor( )
	local hcm = c:GenerateHexColorMarkup( )
	return c.r, c.g, c.b, hc, hcm, c
	
end

function ArkInventory.InventoryIDGet( loc_id, bag_id, slot_id )
	
	local blizzard_id = ArkInventory.InternalIdToBlizzardBagId( loc_id, bag_id )
	
	if blizzard_id == nil then
		return nil
	end
	
	if loc_id == ArkInventory.Const.Location.Bag and bag_id > 1 then
		
		return ArkInventory.CrossClient.ContainerIDToInventoryID( blizzard_id )
		
	elseif loc_id == ArkInventory.Const.Location.Wearing then
		
		for k, v in pairs( ArkInventory.Const.InventorySlotName ) do
			if k == slot_id then
				local id = GetInventorySlotInfo( v )
				return id
			end
		end
		
	elseif loc_id == ArkInventory.Const.Location.Bank then
		
		if bag_id == ArkInventory.Global.Location[loc_id].ReagentBag then
			
			return nil
			
		elseif bag_id > 1 then
			
			return ArkInventory.CrossClient.ContainerIDToInventoryID( blizzard_id )
			
		end
		
	end
	
end

function ArkInventory.ObjectCacheTooltipClear( )
	ArkInventory.Table.Wipe( ArkInventory.Global.Cache.ItemCountTooltip )
end

function ArkInventory.ObjectCacheCountClear( search_id, player_id, loc_id, skipAltCheck )
	
	--ArkInventory.Output( "ObjectCacheCountClear( ", search_id, ", ", player_id, ", ", loc_id, " )" )
	
	if search_id and not skipAltCheck and ArkInventory.Global.ItemCrossReference[search_id] then
		for s in pairs( ArkInventory.Global.ItemCrossReference[search_id] ) do
			--ArkInventory.Output( "xref clear ", search_id, " = ", s )
			ArkInventory.ObjectCacheCountClear( s, player_id, loc_id, true )
		end
	end
	
	if player_id then
		
		local info = ArkInventory.GetPlayerInfo( player_id )
		
		if loc_id and ArkInventory.Global.Location[loc_id].isVault and info and info.class ~= ArkInventory.Const.Class.Guild then
			-- clear characters guild
			ArkInventory.ObjectCacheCountClear( search_id, info.guild_id, loc_id, skipAltCheck )
		end
		
		if ArkInventory.Global.Location[loc_id].isAccount and info and info.class ~= ArkInventory.Const.Class.Account then
			-- clear characters account
			local account_id = ArkInventory.PlayerIDAccount( info.account_id )
			ArkInventory.ObjectCacheCountClear( search_id, account_id, loc_id, skipAltCheck )
		end
		
	end
	
	if search_id then
		
		-- clear the tooltip cache
		
--		if ArkInventory.Global.Cache.ItemCountTooltip[search_id] then
--			ArkInventory.Global.Cache.ItemCountTooltip[search_id].rebuild = true
--		end
		
--		ArkInventory.TooltipRebuildQueueAdd( search_id )
		
	end
	
	if search_id and player_id and loc_id then
		
		--ArkInventory.Output( "clear( ", search_id, ", ", player_id, ", ", loc_id, " )" )
		
		-- clear the raw data only for the specific location
		if ArkInventory.Global.Cache.ItemCountRaw[search_id] then
			if ArkInventory.Global.Cache.ItemCountRaw[search_id][player_id] then
				--ArkInventory.Output( ArkInventory.Global.Cache.ItemCountRaw[search_id][player_id].location[loc_id] )
				ArkInventory.Global.Cache.ItemCountRaw[search_id][player_id].location[loc_id] = nil
			end
		end
		
		return
		
	end
	
	if search_id and player_id then
		
		-- reset count for a specific item for a specific player
		--ArkInventory.Output( "ObjectCacheCountClear( ", search_id, ", ", player_id )
		
		-- clear the raw data
		if ArkInventory.Global.Cache.ItemCountRaw[search_id] then
			ArkInventory.Global.Cache.ItemCountRaw[search_id][player_id] = nil
		end
		
		return
		
	end
	
	if search_id and not player_id then
		
		-- reset count for a specific item for all players
		
		ArkInventory.Global.Cache.ItemCountRaw[search_id] = nil
		
		return
		
	end
	
	if not search_id and not player_id then
		
		--ArkInventory.Output( "wipe all item count data" )
		
		ArkInventory.Table.Wipe( ArkInventory.Global.Cache.ItemCountTooltip )
		ArkInventory.Table.Wipe( ArkInventory.Global.Cache.ItemCountRaw )
		
		return
		
	end
	
end

function ArkInventory.ObjectCacheSearchClear( )
	ArkInventory.ObjectIDCountClear( )
	ArkInventory.ObjectIDSearchClear( )
	ArkInventory.Table.Wipe( ArkInventory.Global.Cache.ItemSearchData )
end

function ArkInventory.ObjectCountGetRaw( search_id, thread_id )
	
	--ArkInventory.Output( "ObjectCountGetRaw( ", search_id , " )" )
	
	local changed = false
	
	if not ArkInventory.Global.Cache.ItemCountRaw[search_id] then
		ArkInventory.Global.Cache.ItemCountRaw[search_id] = { }
		changed = true
	end
	
	local icr = ArkInventory.Global.Cache.ItemCountRaw[search_id]
	--[[
		entries = number
		total = number
		faction = text
		location= {
			[loc_id] = {
				c = item count
				s = slot count
				e = extra data
			}
		}
		class = CLASSTEXT
		account_id = number
		realm = realmname
	]]--
	
	local search_alt = ArkInventory.Global.ItemCrossReference[search_id]
	
	local bc, lc, ls, ok
	
	local codex = ArkInventory.GetPlayerCodex( )
	local info = codex.player.data.info
	local player_id = info.player_id
	
	for pid, pd in pairs( ArkInventory.db.player.data ) do
		
		if pd.info.name then
			
			if not icr[pid] then
				icr[pid] = { location = { }, realm = pd.info.realm, faction = pd.info.faction, class = pd.info.class, account_id = pd.info.account_id }
				changed = true
			end
			
			icr[pid].total = 0
			icr[pid].entries = 0
			
			for loc_id, loc_data in pairs( ArkInventory.Global.Location ) do
				--if ArkInventory.isLocationMonitored( loc_id, pid ) then
					
					local icr_loc = icr[pid].location[loc_id]
					
					if not icr_loc then
						
						-- rebuild missing location data
						icr[pid].location[loc_id] = { c = 0, s = 0 }
						icr_loc = icr[pid].location[loc_id]
						
						changed = true
						ok = true
						
						if pd.info.class ~= ArkInventory.Const.Class.Guild and loc_id == ArkInventory.Const.Location.Vault then
							ok = false
						elseif pd.info.class ~= ArkInventory.Const.Class.Account and ArkInventory.Global.Location[loc_id].isAccount then
							ok = false
						elseif pd.location[loc_id].slot_count == 0 then
							ok = false
						end
						
						
						--ArkInventory.Output( "scanning [", pid, "] [", loc_id, "] [", search_id, "]" )
						lc = 0
						ls = 0
						
						if ok then
							
							ok = false
							local ld = pd.location[loc_id]
							
							for b in pairs( loc_data.Bags ) do
								
								bc = 0
								
								local bd = ld.bag[b]
								
								ok = false
								
								if bd.h and search_id == ArkInventory.ObjectIDCount( bd.h ) then
									--ArkInventory.Output( "found bag [", b, "] equipped" )
									lc = lc + 1
									ok = true
								end
								
								for sn, sd in pairs( bd.slot ) do
									
									if sd and sd.h then
										
										if thread_id then
											
											ArkInventory.ThreadYield( thread_id )
											
											if not icr[pid] or not icr[pid].location[loc_id] then
												-- object count data for this was wiped while yielding, do it again
												ArkInventory.Output( "DEBUG: ObjectCountGetRaw[", search_id, " was wiped while yielding - restarting" )
												return ArkInventory.ObjectCountGetRaw( search_id, thread_id )
											end
											
										end
										
										-- primary match
										local oit = ArkInventory.ObjectIDCount( sd.h )
										local matches = ( search_id == oit ) and search_id
										
										-- secondary match
										if not matches and search_alt then
											for sa in pairs( search_alt ) do
												if sa == oit then
													matches = sa
													break
												end
											end
										end
										
										if matches then
											
											lc = lc + sd.count
											bc = bc + sd.count
											ls = ls + 1
											ok = true
											
											-- locations where the first match is all that matters, and the count is irrelevant
											if loc_id == ArkInventory.Const.Location.Reputation or loc_id == ArkInventory.Const.Location.Tradeskill then
												lc = 0
												bc = 0
												icr_loc.e = sd.h
												--ArkInventory.Output( pid, " / ", loc_id, " / ", sd.h, " / ", icr_loc.e )
												break
											end
											
										end
										
									end
									
								end
								
								if loc_id == ArkInventory.Const.Location.Vault then
									local td = ok and bc or nil
									if td then
										icr_loc.e = icr_loc.e or { }
										icr_loc.e[b] = td
									end
								end
								
								if loc_id == ArkInventory.Const.Location.Reputation or loc_id == ArkInventory.Const.Location.Tradeskill then
									if ok then
										break
									end
								end
								
							end
							
--							if loc_id == ArkInventory.Const.Location.Reputation then
--								if icr_loc.e then
--									ArkInventory.OutputDebug( pid, " / ", icr_loc.e )
--								end
--							end
							
							if loc_id == ArkInventory.Const.Location.Tradeskill then
								
								local rc = nil
								
								--ArkInventory.OutputDebug( " " )
								--ArkInventory.OutputDebug( "player: ", pid )
								--ArkInventory.OutputDebug( "extra: [", icr_loc.e, "]" )
								
								local objectType, info = ArkInventory.Tradeskill.isTradeskillObject( search_id )
								
								if info and not ArkInventory.Table.IsEmpty( info ) then
									
									--ArkInventory.OutputDebug( search_id, " / ", icr_loc.e, " / ", objectType, " / ", info )
									local skillName = ArkInventory.Localise["UNKNOWN"]
									local skillKnown = false
									
									if objectType == ArkInventory.Tradeskill.Const.Type.Result then
										
										--ArkInventory.Output( info )
										
										for x = 1, ArkInventory.Const.Tradeskill.maxLearn do
											for e, s in pairs( info ) do
												--ArkInventory.Output( e, " = ", s )
												if pd.info.tradeskill[x] == s then
													skillKnown = true
													skillName = ArkInventory.Const.Tradeskill.Data[s].text
													break
												end
												
											end
											if skillKnown then
												break
											end
										end
										
										--ArkInventory.db.cache.tradeskill.result[info.resultHB][key] = skillID
										
									else
										
										for x = 1, ArkInventory.Const.Tradeskill.maxLearn do
											if pd.info.tradeskill[x] == info.s then
												skillKnown = true
												skillName = ArkInventory.Const.Tradeskill.Data[info.s].text
												break
											end
										end
										
									end
									
									--ArkInventory.OutputDebug( "skill known = ", skillKnown, " / ", pid )
									
									if icr_loc.e then
										
										--ArkInventory.OutputDebug( "matched: ", icr_loc.e )
										if skillKnown then
											-- should hope so, you matched on the enchant
											if objectType == ArkInventory.Tradeskill.Const.Type.Enchant then
												-- they already know it
												rc = ArkInventory.Localise["LEARNED"]
											elseif objectType == ArkInventory.Tradeskill.Const.Type.Result then
												-- they can craft this item
												rc = skillName
											elseif objectType == ArkInventory.Tradeskill.Const.Type.Recipe then
												-- they already known it
												rc = skillName
											else
												rc = "code error tsf1"
											end
										else
											rc = "code error tsf2"
										end
										
									else
										
										--ArkInventory.OutputDebug( "did not match: ", icr_loc.e )
										if skillKnown then
											-- but i dont know how to craft that enchant
											if objectType == ArkInventory.Tradeskill.Const.Type.Enchant then
												-- they dont know this enchant
												rc = ArkInventory.Localise["UNLEARNED"]
											elseif objectType == ArkInventory.Tradeskill.Const.Type.Result then
												-- they dont know the enchant to craft this item
												--rc = "cant craft"
											elseif objectType == ArkInventory.Tradeskill.Const.Type.Recipe then
												-- they should be able to learn this
												rc = ArkInventory.Localise["LEARN"]
											else
												-- item that has nothing to do with this tradeskill
											end
										else
											-- not my skill, cant learn it, cant craft it, dont care
											--rc = "dont care"
										end
										
									end
									
								end
								
								icr_loc.e = rc
								
							end
							
						end
						
						icr_loc.c = lc
						icr_loc.s = ls
						
						--ArkInventory.Output( "ItemCountRaw[", search_id, "][", pid, "].location[", loc_id, "] = ", icr_loc )
						
					end
					
					if not pid then
						ArkInventory.OutputError( "code failure: pid is nil" )
						error( "code failure" )
					end
					
					if not loc_id then
						ArkInventory.OutputError( "code failure: loc_id is nil" )
						error( "code failure" )
					end
					
					if not icr[pid] then
						ArkInventory.OutputError( "code failure: icr[", pid, "] is nil" )
						error( "code failure" )
					end
					
					if not icr[pid].total then
						ArkInventory.OutputError( "code failure: icr[", pid, "].total is nil" )
						error( "code failure" )
					end
					
					if not icr[pid].location[loc_id] then
						ArkInventory.OutputError( "code failure: icr[", pid, "].location[", loc_id, "] is nil" )
						error( "code failure" )
					end
					
					
					
					icr[pid].total = icr[pid].total + icr[pid].location[loc_id].c
					
					if icr[pid].location[loc_id].c > 0 or icr[pid].location[loc_id].s > 0 then
						icr[pid].entries = icr[pid].entries + 1
					end
					
				--end
			end
			
		end
		
	end
	
	return icr, changed
	
end

function ArkInventory.BattlepetBaseHyperlink( ... )
	local v = { ... }
	--ArkInventory.Output( "[ ", v, " ]" )
	--[[
		[01]species
		[02]level
		[03]quality
		[04]maxhealth
		[05]power
		[06]speed
		[07]name
		[08]guid (BattlePet-[unknowndata]-[creatureID])
	]]--
	
	-- |cffffffff|Htype:a:b:c:d|htext|h|r
	
	local c = select( 4, ArkInventory.GetItemQualityColor( v[3] or 0 ) )
	
	return string.format( "|c%s|Hbattlepet:%s:%s:%s:%s:%s:%s:%s:%s|h[%s]|h|r", c, v[1] or 0, v[2] or 0, v[3] or 0, v[4] or 0, v[5] or 0, v[6] or 0, v[7] or "", v[8] or "", v[7] or "unnamed battle pet" )
	
end
