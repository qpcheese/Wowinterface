local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


local function Transfer_Yield( loc_id )
	ArkInventory.ThreadYield( ArkInventory.Global.Thread.Format.Transfer )
end

local function TransferMessageStart( loc_id )
	
	if ArkInventory.db.option.message.transfer[loc_id] then
		ArkInventory.Output( ArkInventory.Localise["TRANSFER"], ": ", ArkInventory.Global.Location[loc_id].Name, " - " , ArkInventory.Localise["START"] )
	end
	
end

local function TransferMessageComplete( loc_id )
	
	if ArkInventory.db.option.message.transfer[loc_id] then
		ArkInventory.Output( ArkInventory.Localise["TRANSFER"], ": ", ArkInventory.Global.Location[loc_id].Name, " - " , ArkInventory.Localise["COMPLETE"] )
	end
	
	if ArkInventory.db.option.transfer.refresh then
		--ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
end

local function TransferMessageAbort( loc1, loc2 )
	
	local loc2 = loc2 or loc1
	
	if loc1 == loc2 then
		ArkInventory.OutputWarning( ArkInventory.Localise["TRANSFER"], ": ", ArkInventory.Global.Location[loc1].Name, " - ", ArkInventory.Localise["ABORTED"] )
	else
		ArkInventory.OutputWarning( ArkInventory.Localise["TRANSFER"], ": ", ArkInventory.Global.Location[loc1].Name, " - ", ArkInventory.Localise["ABORTED"], ": ", string.format( ArkInventory.Localise["TRANSFER_FAIL_CLOSED"], ArkInventory.Global.Location[loc2].Name ) )
	end
	
end

local function TransferBagCheck( blizzard_id )
	
	local abort = false
	local numSlots = GetContainerNumSlots( blizzard_id )
	local freeSlots, bagType = ArkInventory.CrossClient.GetContainerNumFreeSlots( blizzard_id )
	
	if blizzard_id == ArkInventory.ENUM.BAG.INDEX.REAGENTBANK and not ArkInventory.CrossClient.IsReagentBankUnlocked( ) then
		-- reagent bank always returns its number of slots even if you havent unlocked it
		numSlots = 0
		freeSlots = 0
	end
	
	local loc_id, bag_pos = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
	if ( loc_id == ArkInventory.Const.Location.Bank and not ArkInventory.Global.Mode.Bank ) or ( loc_id == ArkInventory.Const.Location.Vault and not ArkInventory.Global.Mode.Vault ) then
		-- no longer at the location
		--ArkInventory.OutputWarning( "aborting, no longer at location" )
		abort = loc_id
	end
	
	return abort, bagType or 0, numSlots or 0
	
end


local function FindItem( loc_id, cl, cb, bp, cs, id, ct )
	
	-- working from left to right
	-- find the matching item in your bag
	
	--ArkInventory.Output( "FindItem( ", loc_id, ", ", cl, ".", cb, ".", cs, ", ", id, " )" )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = cl or loc_id
	local cb = cb or 9999
	local bp = bp or -1
	local cs = cs or -1
	local ct = ct or 0
	
	
	for bag_pos, bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		if not me.player.data.option[loc_id].bag[bag_id].transfer.ignore then
			
			Transfer_Yield( cl )
			
			local ab, bt, count = TransferBagCheck( bag_id )
			if ab then
				return cl, recheck, false
			end
			
			local ok
			
			for slot_id = 1, count do
				
				ok = false
				
				if TransferBagCheck( bag_id ) then
					return cl, recheck, false
				end
				
				if loc_id ~= cl then
					-- different location
					ok = true
				elseif loc_id == cl and bag_pos < bp then
					-- same location and lower bag
					ok = true
				elseif loc_id == cl and bag_pos == bp and slot_id < cs then
					-- same location and same bag and lower slot
					ok = true
				elseif ( ct ~= 0 and bag_pos ~= bp and bt == 0 ) and ( loc_id ~= ArkInventory.Const.Location.Bank and bag_id ~= ArkInventory.Global.Location[ArkInventory.Const.Location.Bank].ReagentBag ) then
					-- full scan (bag type) and different bag and normal bag 
					-- not at the bank and not the reagent bank (or it will loop endlessly)
					ok = true
				end
				
				if ok then
					
					if select( 3, ArkInventory.CrossClient.GetContainerItemInfo( bag_id, slot_id ) ) then
						
						-- this slot is locked, move on and check it again next time
						--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
						recheck = true
						
					else
						
						local h = ArkInventory.CrossClient.GetContainerItemLink( bag_id, slot_id )
						
						if h then
							
							local osd = ArkInventory.ObjectStringDecode( h )
							
							if osd.id == id then
								
								--ArkInventory.Output( "found> ", loc_id, ".", bag_id, ".", slot_id )
								return abort, recheck, true, bag_id, slot_id
								
							end
							
						end
						
					end
					
				end
				
			end
		
		end
		
	end
	
	if recheck then
		return FindItem( loc_id, cl, cb, bp, cs, id, ct )
	end
	
	if loc_id == ArkInventory.Const.Location.Bank and cb == ArkInventory.ENUM.BAG.INDEX.REAGENTBANK and ArkInventory.db.option.transfer.topup then
		-- we were transfering the reagent bank and found nothing
		-- checked the bank and found nothing
		-- now checking the bags because topup is enabled
		return FindItem( ArkInventory.Const.Location.Bag, cl, cb, bp, cs, id, ct )
	end
	
	--ArkInventory.Output( "no stacks found" )
	return abort, recheck, false
	
end

local function FindPartialStack( loc_id, cl, cb, bp, cs, id )
	
	-- loc_id = location to search in for partial stack to pull from
	-- cl = current location of partial stack to fill
	-- cb = current bag of partial stack to fill
	-- bp = bag position in the food chain, can only pull from lower bags
	-- cs = current slot of partial stack to fill
	-- id = item id to search for
	
	--ArkInventory.Output( "FindPartialStack( ", loc_id, " / ", cl, ".", cb, "(", bp, ").", cs, " / ", id, " )" )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = cl or loc_id
	local cb = cb or 9999
	local bp = bp or -1
	local cs = cs or -1
	
	
	if cl == ArkInventory.Const.Location.Vault then
		
		Transfer_Yield( cl )
		
		local bag_id = cb
		
		for slot_id = 1, ArkInventory.Const.BLIZZARD.GLOBAL.GUILDBANK.SLOTS_PER_TAB do
			
			if not ArkInventory.Global.Mode.Vault or bag_id ~= GetCurrentGuildBankTab( ) then
				-- no longer at the vault or changed tabs, abort
				--ArkInventory.OutputWarning( "aborting, no longer at location" )
				abort = cl
				return abort, recheck, false
			end
			
			if slot_id < cs then
				
				if select( 3, GetGuildBankItemInfo( bag_id, slot_id ) ) then
					
					-- this slot is locked, move on and check it again next time
					--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
					recheck = true
					
				else
					
					local h = GetGuildBankItemLink( bag_id, slot_id )
					
					if h then
						
						local info = ArkInventory.GetObjectInfo( h )
						
						if info.id == id then
						
							local count = select( 2, GetGuildBankItemInfo( bag_id, slot_id ) )
							
							if count < info.stacksize then
								--ArkInventory.OutputDebug( "found > ", bag_id, ".", slot_id )
								return abort, recheck, true, bag_id, slot_id
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
		if recheck then
			return FindPartialStack( loc_id, cl, cb, bp, cs, id )
		end
		
		return abort, recheck, false
		
	end
	
	if cl == ArkInventory.Const.Location.Bag or cl == ArkInventory.Const.Location.Bank then
		
		for bag_pos, bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
			
			if not me.player.data.option[loc_id].bag[bag_id].transfer.ignore then
				
				Transfer_Yield( cl )
				
				local ab, bt, count = TransferBagCheck( bag_id )
				if ab then
					return cl, recheck, false
				end
				
				for slot_id = 1, count do
					
					if TransferBagCheck( bag_id ) then
						return cl, recheck, false
					end
					
					if ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos == bp and slot_id < cs )then
					-- ( different location ) or (same location and lower bag) or (same location and same bag and lower slot)
						
						if select( 3, ArkInventory.CrossClient.GetContainerItemInfo( bag_id, slot_id ) ) then
						
							-- this slot is locked, move on and check it again next time
							--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
							recheck = true
							
						else
							
							--ArkInventory.Output( "check> ", loc_id, ".", bag_id, ".", slot_id )
							
							local h = ArkInventory.CrossClient.GetContainerItemLink( bag_id, slot_id )
							
							if h then
								
								local info = ArkInventory.GetObjectInfo( h )
								if info.id == id then
									
									local count = select( 2, ArkInventory.CrossClient.GetContainerItemInfo( bag_id, slot_id ) )
									if count < info.stacksize then
										--ArkInventory.Output( "found > ", bag_id, ".", slot_id, " ", count, " of ", h, " for ", cb, ".", cs )
										return abort, recheck, true, bag_id, slot_id
									end
									
								end
								
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
		if recheck then
			return FindPartialStack( loc_id, cl, cb, bp, cs, id )
		end
		
		
		if cb == ArkInventory.ENUM.BAG.INDEX.REAGENTBANK then
			
			-- we were transfering the reagent bank and found nothing there
			-- need to check the bank for stacks we can take from
			
			-- reagentbank topup from bags is also done from there
			
			return FindItem( ArkInventory.Const.Location.Bank, cl, cb, bp, -1, id )
			
		end
		
		if cl == ArkInventory.Const.Location.Bank and ArkInventory.db.option.transfer.topup then
			-- topup bank from bags
			return FindItem( ArkInventory.Const.Location.Bag, cl, cb, bp, cs, id )
		end
		
		return abort, recheck, false
		
	end
	
end

local function FindNormalItem( loc_id, cl, cb, bp, cs )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = cl or loc_id
	local cb = cb or 9999
	local bp = bp or -1
	local cs = cs or -1
	
	for bag_pos, bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		if not me.player.data.option[loc_id].bag[bag_id].transfer.ignore then
			
			Transfer_Yield( cl )
			
			local ab, bt, count = TransferBagCheck( bag_id )
			if ab then
				return cl, recheck, false
			end
			
			if bt == 0 and bag_id ~= ArkInventory.ENUM.BAG.INDEX.REAGENTBANK then
				
				for slot_id = 1, count do
					
					if TransferBagCheck( bag_id ) then
						return cl, recheck, false
					end
					
					if ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos == bp and slot_id < cs )then
					-- ( different location ) or (same location and higher bag) or (same location and same bag and higher slot)
						
						if select( 3, ArkInventory.CrossClient.GetContainerItemInfo( bag_id, slot_id ) ) then
							
							-- this slot is locked, move on and check it again next time
							--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
							recheck = true
							
						else
							
							local h = ArkInventory.CrossClient.GetContainerItemLink( bag_id, slot_id )
							
							if h then
								--ArkInventory.Output( "found> ", loc_id, ".", bag_id, ".", slot_id )
								return abort, recheck, true, bag_id, slot_id
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
	if recheck then
		return FindNormalItem( loc_id, cl, cb, bp, cs )
	end
	
	--ArkInventory.Output( "nothing found, all slots empty" )
	return abort, recheck, false
	
end

local function FindProfessionItem( loc_id, cl, cb, bp, cs, ct )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = cl or loc_id
	local cb = cb or 9999
	local bp = bp or -1
	local cs = cs or -1
	local ct = ct or 0
	
	--ArkInventory.Output( "find prof>", ArkInventory.Global.Location[loc_id].Name, ", ", cl, ".", cb, ".", cs, " ", ct )
	
	if ct == 0 then
		ArkInventory.OutputError( "code failure: checking for profession item of type 0" )
		abort = cl
		return abort, recheck, false
	end
	
	for bag_pos, bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		local ab, bt, count = TransferBagCheck( bag_id )
		if ab then
			return cl, recheck, false
		end
		
		--ArkInventory.Output( "checking ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id, " type = ", bt )
		
		if not me.player.data.option[loc_id].bag[bag_id].transfer.ignore then
			
			Transfer_Yield( cl )
			
			local pri_ok = false
			
			if ArkInventory.db.option.transfer.priority then
				-- priority is reagent bank
				if bag_id ~= ArkInventory.ENUM.BAG.INDEX.REAGENTBANK and ( bt == 0 or bt == ct ) then
					-- do not steal from the reagent bank
					-- do not steal from profession bags, unless its for the reagent bank
					pri_ok = true
				end
			else
				-- priority is profession bags
				if bt == 0 then
					--ArkInventory.Output( "search this bag> ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id )
					pri_ok = true
				end
			end
			
			if pri_ok then
				
				--ArkInventory.Output( "searching ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id )
				
				for slot_id = 1, count do
					
					if TransferBagCheck( bag_id ) then
						return cl, recheck, false
					end
					
					if ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos > bp and bt == 0 ) or ( loc_id == cl and bag_pos == bp and slot_id < cs ) then
					-- ( different location ) or (same location and lower bag) or (same location and same bag and lower slot)
						
						if select( 3, ArkInventory.CrossClient.GetContainerItemInfo( bag_id, slot_id ) ) then
							
							-- this slot is locked, move on and check it again next time
							--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
							recheck = true
							
						else
							
							local h = ArkInventory.CrossClient.GetContainerItemLink( bag_id, slot_id )
							
							--ArkInventory.Output( "chk> ", h )
							
							if h then
								
								--ArkInventory.Output( "chk> ", loc_id, ".", bag_id, ".", slot_id )
								
								-- ignore bags
								local info = ArkInventory.GetObjectInfo( h )
								if info.equiploc ~= "INVTYPE_BAG" then
									
									local check_item = true
									if loc_id ~= cl and not info.craft then
										-- only allow crafting reagents to be selected from bags when depositing to the bank (dont steal the pick/hammer/army knife/etc)
										check_item = false
									end
									
									if check_item then
										
										local it = GetItemFamily( h ) or 0
										
										if ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.CLASSIC ) then -- FIX ME
											
											if bit.band( it, ct ) > 0 then
												--ArkInventory.Output( "found prof> ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id, ".", slot_id, " " , h )
												return abort, recheck, true, bag_id, slot_id
											end
											
										else
											
											if it == ct then
												--ArkInventory.Output( "found prof> ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id, ".", slot_id, " " , h )
												return abort, recheck, true, bag_id, slot_id
											end
											
										end
										
									end
									
								end
								
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
	if loc_id == ArkInventory.Const.Location.Bank and ArkInventory.db.option.transfer.bank then
		
		local ab, rc, ok, sb, ss = FindProfessionItem( ArkInventory.Const.Location.Bag, loc_id, nil, nil, nil, ct )
		
		if ab then
			abort = cl
		end
		
		if rc then
			recheck = true
		end
		
		return abort, recheck, ok, sb, ss
		
	end
	
	--ArkInventory.Output( "no profession items found in ", ArkInventory.Global.Location[loc_id].Name )
	return abort, recheck, false
	
end

local function FindCraftingItem( loc_id, cl, cb, bp, cs )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = cl or loc_id
	local cb = cb or 9999
	local bp = bp or -1
	local cs = cs or -1
	
	--ArkInventory.Output( "find crafting item in ", ArkInventory.Global.Location[loc_id].Name, " for slot ", ArkInventory.Global.Location[cl].Name, ".", cb, ".", cs )
	
	for bag_pos, bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		local ab, bt, count = TransferBagCheck( bag_id )
		if ab then
			return cl, recheck, false
		end
		
		--ArkInventory.Output( "checking ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id, " type = ", bt )
		
		if not me.player.data.option[loc_id].bag[bag_id].transfer.ignore then
			
			Transfer_Yield( cl )
			
			local pri_ok
			
			if ArkInventory.db.option.transfer.priority then
				-- priority is reagent bank
				if bag_id ~= ArkInventory.ENUM.BAG.INDEX.REAGENTBANK and ( bt == 0 or cb == ArkInventory.ENUM.BAG.INDEX.REAGENTBANK ) then
					-- do not steal from the reagent bank
					-- do not steal from profession bags, unless its for the reagent bank
					pri_ok = true
				end
			else
				-- priority is profession bags
				if bt == 0 then
					--ArkInventory.Output( "search this bag> ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id )
					pri_ok = true
				end
			end
			
			if pri_ok then
				
				--ArkInventory.Output( "searching ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id )
				
				for slot_id = 1, count do
					
					if TransferBagCheck( bag_id ) then
						return cl, recheck, false
					end
					
					if ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos == bp and slot_id < cs )then
						-- ( different location ) or (same location and higher bag) or (same location and same bag and higher slot)
						
						--ArkInventory.Output( "check> ", loc_id, ".", bag_id, ".", slot_id )
						
						if select( 3, ArkInventory.CrossClient.GetContainerItemInfo( bag_id, slot_id ) ) then
							
							-- this slot is locked, move on and check it again next time
							--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
							recheck = true
							
						else
							
							local h = ArkInventory.CrossClient.GetContainerItemLink( bag_id, slot_id )
							
							if h then
								
								local info = ArkInventory.GetObjectInfo( h )
								if info.craft then
									--ArkInventory.Output( "found> [", ArkInventory.Global.Location[loc_id].Name, ".", bag_id, ".", slot_id, "]" )
									return abort, recheck, true, bag_id, slot_id
								end
								
							end
							
						end
						
					end
					
				end

			else
				--ArkInventory.Output( "do not steal from ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id )
			end
			
		else
			--ArkInventory.Output( "ignored for transfer ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id )
		end
		
		--ArkInventory.Output( "nothing found in ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id )
		
	end
	
	if loc_id == ArkInventory.Const.Location.Bank and ArkInventory.db.option.transfer.deposit then
		
		local ab, rc, ok, sb, ss = FindCraftingItem( ArkInventory.Const.Location.Bag, loc_id )
		
		if ab then
			abort = cl
		end
		
		if rc then
			recheck = true
		end
		
		return abort, recheck, ok, sb, ss
		
	end
	
	--ArkInventory.Output( "exit> no crafting items found in ", loc_id )
	return abort, recheck, false
	
end

local function StackBags( loc_id )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	for bag_pos = #ArkInventory.Global.Location[loc_id].Bags, 1, -1 do
		
		local bag_id = ArkInventory.Global.Location[loc_id].Bags[bag_pos]
		
		local ab, bt, count = TransferBagCheck( bag_id )
		if ab then
			return cl, recheck, false
		end
		
		if not me.player.data.option[loc_id].bag[bag_id].transfer.ignore then
			
			--ArkInventory.Output( "StackBags( ", loc_id, ".", bag_id, " )" )
			
			if count > 0 then
				
				for slot_id = count, 1, -1 do
					
					if TransferBagCheck( bag_id ) then
						return cl, recheck, false
					end
					
					Transfer_Yield( cl )
					--ArkInventory.Output( "checking ", loc_id, ".", bag_id, ".", slot_id )
					
					if select( 3, ArkInventory.CrossClient.GetContainerItemInfo( bag_id, slot_id ) ) then
						
						-- this slot is locked, move on and check it again next time
						--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
						recheck = true
						
					else
						
						--ArkInventory.Output( "unlocked> ", loc_id, ".", bag_id, ".", slot_id )
						
						local h = ArkInventory.CrossClient.GetContainerItemLink( bag_id, slot_id )
						
						if h then
							
							local info = ArkInventory.GetObjectInfo( h )
							local num = select( 2, ArkInventory.CrossClient.GetContainerItemInfo( bag_id, slot_id ) )
							
							if num < info.stacksize then
								
								--ArkInventory.Output( "partial stack of ", h, " x ",num, " found at ", bag_id, ".", slot_id, " bt=", bt )
								
								local ab, rc, ok, pb, ps
								if bt == 0 then
									ab, rc, ok, pb, ps = FindPartialStack( loc_id, loc_id, bag_id, bag_pos, slot_id, info.id )
								else
									-- non normal bag - allow it to pull from normal bags that are higher
									ab, rc, ok, pb, ps = FindItem( loc_id, loc_id, bag_id, bag_pos, slot_id, info.id, bt )
								end
								
								if rc then
									recheck = true
								end
								
								if ab then
									abort = loc_id
									return abort, recheck
								end
								
								if ok then
									
									--ArkInventory.Output( "merge> ", bag_id, ".", slot_id, " + ", pb, ".", ps )
									
									ClearCursor( )
									ArkInventory.CrossClient.PickupContainerItem( pb, ps )
									ArkInventory.CrossClient.PickupContainerItem( bag_id, slot_id )
									ClearCursor( )
									
									Transfer_Yield( cl )
									
									recheck = true
									
								end
								
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
	return abort, recheck
	
end

local function ConsolidateBag( loc_id, bag_id, bag_pos )
	
	-- move stacks into empty slots
	
	--ArkInventory.Output( "ConsolidateBag( ", loc_id, ".", bag_id, ", ", bag_pos, " )" )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	if not me.player.data.option[loc_id].bag[bag_id].transfer.ignore then
		
		Transfer_Yield( loc_id )
		
		local ab, bt, count = TransferBagCheck( bag_id )
		if ab then
			return cl, recheck, false
		end
		
		--ArkInventory.Output( "bag> ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id, " (#", bag_pos, ") ", bt, " / ", count )
		
		local ok = true
		
		for slot_id = count, 1, -1 do
			
			if TransferBagCheck( bag_id ) then
				return cl, recheck, false
			end
			
			--ArkInventory.Output( "chk> ", loc_id, ".", bag_id, ".", slot_id )
			
			if select( 3, ArkInventory.CrossClient.GetContainerItemInfo( bag_id, slot_id ) ) then
				
				-- this slot is locked, move on and check it again next time
				recheck = true
				--ArkInventory.Output( "locked> ", loc_id, ".", bag_id, ".", slot_id )
				
			else
				
				local h = ArkInventory.CrossClient.GetContainerItemLink( bag_id, slot_id )
				
				if not h then
				
					--ArkInventory.Output( "empty> ", ArkInventory.Global.Location[loc_id].Name, ".", bag_id, ".", slot_id )
					
					local ab, rc, sb, ss
					if bt == 0 then
						ab, rc, ok, sb, ss = FindCraftingItem( loc_id, loc_id, bag_id, bag_pos, slot_id )
					else
						ab, rc, ok, sb, ss = FindProfessionItem( loc_id, loc_id, bag_id, bag_pos, slot_id, bt )
					end
					
					if rc then
						recheck = true
					end
					
					if ok then
						
						--ArkInventory.Output( "moving> ", sb, ".", ss, " to ", bag_id, ".", slot_id )
						
						ClearCursor( )
						ArkInventory.CrossClient.PickupContainerItem( sb, ss )
						ArkInventory.CrossClient.PickupContainerItem( bag_id, slot_id )
						ClearCursor( )
						
						Transfer_Yield( loc_id )
						
						recheck = true
						
					end
					
				else
					
					--ArkInventory.Output( "item> ", loc_id, ".", bag_id, ".", slot_id, " ", h )
					
				end
				
			end
			
			if not ok then
				--ArkInventory.Output( "exit > no reagent/profession item found so no point checking the rest of the slots for this bag" )
				break
			end
			
		end
		
	end
	
	return abort, recheck
	
end

local function Consolidate( loc_id )
	
	--ArkInventory.Output( "Consolidate ", loc_id )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	-- fill up profession bags with profession items
	for bag_pos = #ArkInventory.Global.Location[loc_id].Bags, 1, -1 do
		
		local bag_id = ArkInventory.Global.Location[loc_id].Bags[bag_pos]
		
		if not me.player.data.option[loc_id].bag[bag_id].transfer.ignore then
			
			Transfer_Yield( loc_id )
			
			local ab, bt, count = TransferBagCheck( bag_id )
			if ab then
				return cl, recheck, false
			end
			
			--ArkInventory.Output( "Consolidate ", loc_id, ".", bag_id, " ", bt )
			
			if count > 0 and ( bag_id == ArkInventory.ENUM.BAG.INDEX.REAGENTBANK or bt ~= 0 ) then
				
				local ab, rc = ConsolidateBag( loc_id, bag_id, bag_pos )
				
				if ab then
					return ab, recheck
				end
				
				if rc then
					recheck = true
				end
				
			end
			
		end
		
	end
	
	if loc_id == ArkInventory.Const.Location.Bank then
		
		if ArkInventory.db.option.transfer.deposit and ArkInventory.CrossClient.IsReagentBankUnlocked( ) then
			
			-- fill up reagent bank with crafting items
			
			local bag_id = ArkInventory.ENUM.BAG.INDEX.REAGENTBANK
			
			if not me.player.data.option[loc_id].bag[bag_id].transfer.ignore then
				
				Transfer_Yield( loc_id )
				
				if TransferBagCheck( bag_id ) then
					return cl, recheck, false
				end
				
				local ab, rc = ConsolidateBag( loc_id, bag_id )
				
				if ab then
					return ab, recheck
				end
				
				if rc then
					recheck = true
				end
				
			end
			
		end
		
		if ArkInventory.db.option.transfer.bank then
			
			-- fill up normal bank slots with crafting items
			
			for bag_pos = #ArkInventory.Global.Location[loc_id].Bags, 1, -1 do
				
				local bag_id = ArkInventory.Global.Location[loc_id].Bags[bag_pos]
				
				if not me.player.data.option[loc_id].bag[bag_id].transfer.ignore then
					
					local ab, bt, count = TransferBagCheck( bag_id )
					if ab then
						return cl, recheck, false
					end
					
					if bt == 0 and bag_id ~= ArkInventory.ENUM.BAG.INDEX.REAGENTBANK then
						
						local ab, rc = ConsolidateBag( loc_id, bag_id, bag_pos )
						
						if ab then
							return ab, recheck
						end
						
						if rc then
							recheck = true
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
	return abort, recheck
	
end

local function CompactBag( loc_id, bag_id, bag_pos )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	if not me.player.data.option[loc_id].bag[bag_id].transfer.ignore then
		
		Transfer_Yield( loc_id )
		
		--ArkInventory.Output( "CompactBag( ", loc_id, ".", bag_id, " )" )
		
		local ab, bt, count = TransferBagCheck( bag_id )
		if ab then
			return cl, recheck, false
		end
		
		--ArkInventory.Output( "bag> ", loc_id, ".", bag_id, " (", bag_pos, ") ", bt, " / ", count )
		
		local ok = true
		
		for slot_id = count, 1, -1 do
			
			if TransferBagCheck( bag_id ) then
				return cl, recheck, false
			end
			
			--ArkInventory.Output( "chk> ", loc_id, ".", bag_id, ".", slot_id )
			
			if select( 3, ArkInventory.CrossClient.GetContainerItemInfo( bag_id, slot_id ) ) then
				
				-- this slot is locked, move on and check it again next time
				recheck = true
				--ArkInventory.Output( "locked @ ", loc_id, ".", bag_id, ".", slot_id )
				
			else
				
				local h = ArkInventory.CrossClient.GetContainerItemLink( bag_id, slot_id )
				
				if not h then
				
					--ArkInventory.Output( "empty @ ", loc_id, ".", bag_id, ".", slot_id )
					
					local ab, rc, sb, ss
					ab, rc, ok, sb, ss = FindNormalItem( loc_id, loc_id, bag_id, bag_pos, slot_id, bt )
					
					if rc then
						recheck = true
					end
					
					if ok then
						
						--ArkInventory.Output( "moving> ", sb, ".", ss, " to ", bag_id, ".", slot_id )
						
						ClearCursor( )
						ArkInventory.CrossClient.PickupContainerItem( sb, ss )
						ArkInventory.CrossClient.PickupContainerItem( bag_id, slot_id )
						ClearCursor( )
						
						Transfer_Yield( loc_id )
						
						recheck = true
						
					end
					
				else
					
					--ArkInventory.Output( "item> ", loc_id, ".", bag_id, ".", slot_id, " ", h )
					
				end
				
			end
			
			if not ok then
				-- no item found so no point checking the rest of the slots for this bag
				break
			end
			
		end
		
	end
	
	return abort, recheck
	
end

local function Compact( loc_id )
	
	--ArkInventory.Output( "Compact ", loc_id )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	for bag_pos = #ArkInventory.Global.Location[loc_id].Bags, 1, -1 do
		
		local bag_id = ArkInventory.Global.Location[loc_id].Bags[bag_pos]
		
		if not me.player.data.option[loc_id].bag[bag_id].transfer.ignore then
			
			local ab, bt, count = TransferBagCheck( bag_id )
			if ab then
				return cl, recheck, false
			end
			
			if count > 0 and bt == 0 and bag_id ~= ArkInventory.ENUM.BAG.INDEX.REAGENTBANK then
				
				--ArkInventory.Output( "Compact ", loc_id, ".", bag_id, " ", bt )
				
				local ab, rc = CompactBag( loc_id, bag_id, bag_pos )
				
				if ab then
					return ab, recheck
				end
				
				if rc then
					recheck = true
				end
				
			end
			
		end
		
	end
	
	return abort, recheck
	
end



local function TransferRun_Threaded( loc_id )
	
	--ArkInventory.Output( "TransferRun_Threaded / ", time( ), " / ", GetTime( ) )
	
	-- DO NOT USE CACHED DATA FOR TRANSFERING, PULL THE DATA DIRECTLY FROM WOW AGAIN, THE UI WILL CATCH UP
	
	local me = ArkInventory.GetPlayerCodex( )
	local ok = false
	local abort, recheck
	
	if loc_id == ArkInventory.Const.Location.Bag then
		
		TransferMessageStart( loc_id )
		
		if ArkInventory.db.option.transfer.blizzard then
			
			ArkInventory.CrossClient.SortBags( )
			Transfer_Yield( loc_id )
			
		else
			
			repeat
				
				ok = true
				
				--ArkInventory.Output( "stackbags 1 ", time( ) )
				abort, recheck = StackBags( loc_id )
				--ArkInventory.Output( "stackbags 2 ", time( ) )
				
				if abort then
					TransferMessageAbort( loc_id )
					break
				end
				
				if recheck then
					ok = false
				end
				
				--ArkInventory.Output( "consolidate 1 ", time( ) )
				abort, recheck = Consolidate( loc_id )
				--ArkInventory.Output( "consolidate 2 ", time( ) )
				
				if abort then
					TransferMessageAbort( loc_id )
					break
				end
				
				if recheck then
					ok = false
				end
				
				
--[[
				abort, recheck = Compact( loc_id )
				
				if abort then
					TransferMessageAbort( loc_id )
					break
				end
				
				if recheck then
					ok = false
				end
]]--
				
			until ok
			
		end
		
		TransferMessageComplete( loc_id )
		
	end
	
	
	if loc_id == ArkInventory.Const.Location.Bank then
		
		if ArkInventory.Global.Mode.Bank then
			
			--ArkInventory.Output( "bank / ", time( ), " / ", GetTime( ) )
			
			TransferMessageStart( loc_id )
			
			if ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.CLASSIC ) and ArkInventory.db.option.transfer.blizzard then -- FIX ME
				
				ArkInventory.CrossClient.SetSortBagsRightToLeft( ArkInventory.db.option.transfer.reverse )
				SortBankBags( )
				
				if ArkInventory.CrossClient.IsReagentBankUnlocked( ) then
					
					if ArkInventory.db.option.transfer.deposit then
						
						ArkInventory.Output( ArkInventory.Localise["TRANSFER"], ": ", REAGENTBANK_DEPOSIT, " " , ArkInventory.Localise["ENABLED"] )
						
						C_Timer.After(
							0.2,
							function( )
								if ArkInventory.Global.Mode.Bank then
									DepositReagentBank( )
								else
									TransferMessageAbort( ArkInventory.Const.Location.Bank )
								end
							end
						)
						
					else
						ArkInventory.Output( ArkInventory.Localise["TRANSFER"], ": ", REAGENTBANK_DEPOSIT, " " , ArkInventory.Localise["DISABLED"] )
					end
					
					local bag_pos = ArkInventory.Global.Location[loc_id].ReagentBag
					if not me.player.data.option[loc_id].bag[bag_pos].transfer.ignore then
						C_Timer.After(
							0.6,
							function( )
								if ArkInventory.Global.Mode.Bank then
									ArkInventory.CrossClient.SortReagentBankBags( )
								else
									TransferMessageAbort( ArkInventory.Const.Location.Bank )
								end
							end
						)
					end
					
				end
				
			else
				
				repeat
					
					ok = true
					
					--ArkInventory.Output( "StackBags / ", loc_id, " / ", time( ), " / ", time( ) )
					abort, recheck = StackBags( loc_id )
					--ArkInventory.Output( "StackBags / ", loc_id, " / ", time( ), " / ", time( ) )
					
					if abort then
						TransferMessageAbort( loc_id )
						break
					end
					
					if recheck then
						ok = false
					end
					
					--ArkInventory.Output( "Consolidate / ", loc_id, " / ", time( ), " / ", time( ) )
					abort, recheck = Consolidate( loc_id )
					--ArkInventory.Output( "Consolidate / ", loc_id, " / ", time( ), " / ", time( ) )
					
					if abort then
						TransferMessageAbort( loc_id )
						break
					end
					
					if recheck then
						ok = false
					end
					
					
--[[
					abort, recheck = Compact( loc_id )
					
					if abort then
						TransferMessageAbort( loc_id )
						break
					end
					
					if recheck then
						ok = false
					end
]]--
					
				until ok
				
			end
			
			TransferMessageComplete( loc_id )
			
			--ArkInventory.Output( "bank / ", time( ), " / ", GetTime( ) )
			
		end
		
	end
	
	
	--ArkInventory.Output( "TransferRun_Threaded / ", time( ), " / ", GetTime( ) )
	
end

local function TransferRun( loc_id )
	
	local thread_id = ArkInventory.Global.Thread.Format.Transfer
	
	if ArkInventory.Global.Mode.Combat then
		--ArkInventory.Output( "transfer location ", loc_id, " aborted - in combat" )
		return
	end
	
	if not ArkInventory.Global.Thread.Use then
		local tz = debugprofilestop( )
		ArkInventory.OutputThread( thread_id, " start" )
		TransferRun_Threaded( loc_id )
		tz = debugprofilestop( ) - tz
		ArkInventory.OutputThread( string.format( "%s took %0.0fms", thread_id, tz ) )
		return
	end
	
	if ArkInventory.ThreadRunning( thread_id ) then
		-- transfer already in progress
		--ArkInventory.OutputError( ArkInventory.Localise["TRANSFER"], ": ", ArkInventory.Global.Location[loc_id].Name, " " , ArkInventory.Localise["TRANSFER_FAIL_WAIT"] )
		ArkInventory.OutputError( ArkInventory.Localise["TRANSFER"], ": ", ArkInventory.Localise["TRANSFER_FAIL_WAIT"] )
		return
	end
	
	-- thread not active, create a new one
	local tf = function ( )
		TransferRun_Threaded( loc_id )
	end
	
	ArkInventory.ThreadStart( thread_id, tf )
	
end

function ArkInventory.Transfer( loc_id )
	if ArkInventory.Global.Thread.Use then
		TransferRun( loc_id )
	else
		ArkInventory.OutputWarning( "cannot transfer when threads are disabled" )
	end
end

function ArkInventory.BarTransfer( loc_id, bar_id, dst_id )
	
	if not ArkInventory.Global.Mode.Bank then return end
	if not ( loc_id == ArkInventory.Const.Location.Bag or loc_id == ArkInventory.Const.Location.Bank ) then return end
	
	ArkInventory.OutputWarning( "not yet implemented - moving all items in bar ", bar_id, " to the ", ArkInventory.Global.Location[dst_id].Name )
	
	--[[
	ArkInventory.CategoryBarGetAssigned( loc_id, bar_id )
	
	local codex = ArkInventory.GetLocationCodex( loc_id )
	
	
	for bag_pos, bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		local count = GetContainerNumSlots( bag_id )
		for slot_id = 1, count do
			
			local i = codex.player.data.location[loc_id].bag[bag_pos].slot[slot_id]
			if i and i.h then
				
				local locked = select( 3, ArkInventory.CrossClient.GetContainerItemInfo( bag_id, slot_id ) )
				if not locked then
					
					local cat_id = ArkInventory.ItemCategoryGet( i )
					local xbar_id = ArkInventory.CategoryLocationGet( loc_id, cat_id )
					--ArkInventory.Output2( cat_id, " / ", xbar_id, " = ", h )
					if xbar_id == bar_id then
						ArkInventory.Output2( "move ", i.h )
					end
				end
			end
			
		end
		
		
	end
	
	]]--
end
