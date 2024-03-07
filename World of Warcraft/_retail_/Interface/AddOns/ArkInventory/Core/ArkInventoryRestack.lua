local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


local function Restack_Yield( loc_id )
	ArkInventory.ThreadYield( ArkInventory.Global.Thread.Format.Restack )
end

function ArkInventory.RestackString( )
	return ArkInventory.Const.ButtonData[ArkInventory.ENUM.BUTTONID.Restack].Name( )
end

local function RestackMessageStart( loc_id )
	
	if ArkInventory.db.option.message.restack[loc_id] then
		ArkInventory.Output( ArkInventory.RestackString( ), ": ", ArkInventory.Global.Location[loc_id].Name, " - " , ArkInventory.Localise["START"] )
	end
	
end

local function RestackMessageComplete( loc_id )
	
	if ArkInventory.db.option.message.restack[loc_id] then
		ArkInventory.Output( ArkInventory.RestackString( ), ": ", ArkInventory.Global.Location[loc_id].Name, " - " , ArkInventory.Localise["COMPLETE"] )
	end
	
	if ArkInventory.db.option.restack.refresh then
		--ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
end

local function RestackMessageAbort( loc1, loc2 )
	
	local loc2 = loc2 or loc1
	
	if loc1 == loc2 then
		ArkInventory.OutputWarning( ArkInventory.RestackString( ), ": ", ArkInventory.Global.Location[loc1].Name, " - ", ArkInventory.Localise["ABORTED"] )
	else
		ArkInventory.OutputWarning( ArkInventory.RestackString( ), ": ", ArkInventory.Global.Location[loc1].Name, " - ", ArkInventory.Localise["ABORTED"], ": ", string.format( ArkInventory.Localise["RESTACK_FAIL_CLOSED"], ArkInventory.Global.Location[loc2].Name ) )
	end
	
end

local function RestackBagCheck( blizzard_id )
	
	local abort = false
	local numSlots = ArkInventory.CrossClient.GetContainerNumSlots( blizzard_id )
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
	
	--ArkInventory.Output2( "FindItem( ", loc_id, ", ", cl, ".", cb, ".", cs, ", ", id, " )" )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = cl or loc_id
	local cb = cb or 9999
	local bp = bp or -1
	local cs = cs or -1
	local ct = ct or 0
	
	
	for bag_pos, blizzard_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
			
			Restack_Yield( cl )
			
			local ab, bt, count = RestackBagCheck( blizzard_id )
			if ab then
				return cl, recheck, false
			end
			
			local ok
			
			for slot_id = 1, count do
				
				ok = false
				
				if RestackBagCheck( blizzard_id ) then
					return cl, recheck, false
				end
				
				if loc_id ~= cl then
					--ArkInventory.Output2( "different location" )
					ok = true
				elseif loc_id == cl and bag_pos < bp then
					--ArkInventory.Output2( "same location and lower bag" )
					ok = true
				elseif loc_id == cl and bag_pos == bp and slot_id < cs then
					--ArkInventory.Output2( "same location and same bag and lower slot" )
					ok = true
				elseif ( ct ~= 0 and bag_pos ~= bp and bt == 0 ) and ( loc_id ~= ArkInventory.Const.Location.Bank and bag_pos ~= ArkInventory.Global.Location[loc_id].ReagentBag ) then
					--ArkInventory.Output2( "full scan (bag type) and different bag and normal bag" )
					-- not at the bank and not the reagent bank (or it will loop endlessly)
					ok = true
				end
				
				if ok then
					
					local itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( blizzard_id, slot_id )
					if itemInfo.isLocked then
						-- this slot is locked, move on and check it again next time
						--ArkInventory.Output( "locked> ", loc_id, ".", blizzard_id, ".", slot_id )
						recheck = true
						
					else
						
						if itemInfo.hyperlink then
							
							local osd = ArkInventory.ObjectStringDecode( itemInfo.hyperlink )
							
							if osd.id == id then
								
								--ArkInventory.Output2( "found> ", loc_id, ".", blizzard_id, ".", slot_id )
								return abort, recheck, true, blizzard_id, slot_id
								
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
	
	if loc_id == ArkInventory.Const.Location.Bank and ArkInventory.db.option.restack.topup then
		-- we were restacking the bank and found nothing
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
	
	--ArkInventory.Output2( "FindPartialStack( ", loc_id, " / ", cl, ".", cb, "(", bp, ").", cs, " / ", id, " )" )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = cl or loc_id
	local cb = cb or 9999
	local bp = bp or -1
	local cs = cs or -1
	
	
	if cl == ArkInventory.Const.Location.Vault then
		
		Restack_Yield( cl )
		
		local tab_id = cb
		
		for slot_id = 1, ArkInventory.Const.BLIZZARD.GLOBAL.GUILDBANK.SLOTS_PER_TAB do
			
			if not ArkInventory.Global.Mode.Vault or tab_id ~= GetCurrentGuildBankTab( ) then
				-- no longer at the vault or changed tabs, abort
				--ArkInventory.OutputWarning( "aborting, no longer at location" )
				abort = cl
				return abort, recheck, false
			end
			
			if slot_id < cs then
				
				if select( 3, GetGuildBankItemInfo( tab_id, slot_id ) ) then
					
					-- this slot is locked, move on and check it again next time
					--ArkInventory.Output2( "locked> ", loc_id, ".", tab_id, ".", slot_id )
					recheck = true
					
				else
					
					local h = GetGuildBankItemLink( tab_id, slot_id )
					
					if h then
						
						local info = ArkInventory.GetObjectInfo( h )
						
						if info.id == id then
						
							local count = select( 2, GetGuildBankItemInfo( tab_id, slot_id ) )
							
							if count < info.stacksize then
								--ArkInventory.Output2( "found > ", tab_id, ".", slot_id )
								return abort, recheck, true, tab_id, slot_id
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
		
		for bag_pos, blizzard_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
			
			if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
				
				Restack_Yield( cl )
				
				local ab, bt, count = RestackBagCheck( blizzard_id )
				if ab then
					return cl, recheck, false
				end
				
				for slot_id = 1, count do
					
					if RestackBagCheck( blizzard_id ) then
						return cl, recheck, false
					end
					
					if ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos == bp and slot_id < cs )then
					-- ( different location ) or (same location and lower bag) or (same location and same bag and lower slot)
						
						local itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( blizzard_id, slot_id )
						if itemInfo.isLocked then
							
							-- this slot is locked, move on and check it again next time
							--ArkInventory.Output( "locked> ", loc_id, ".", blizzard_id, ".", slot_id )
							recheck = true
							
						else
							
							--ArkInventory.Output( "check> ", loc_id, ".", blizzard_id, ".", slot_id )
							
							if itemInfo.hyperlink then
								
								local info = ArkInventory.GetObjectInfo( itemInfo.hyperlink )
								if info.id == id then
									
									if itemInfo.stackCount < info.stacksize then
										--ArkInventory.Output2( "found > ", blizzard_id, ".", slot_id, " ", itemInfo.stackCount, " of ", h, " for ", cb, ".", cs )
										return abort, recheck, true, blizzard_id, slot_id
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
			
			-- we were restacking the reagent bank and found nothing there
			-- need to check the bank for stacks we can take from
			
			-- reagentbank topup from bags is also done from there
			
			return FindItem( ArkInventory.Const.Location.Bank, cl, cb, bp, -1, id )
			
		end
		
		if cl == ArkInventory.Const.Location.Bank and ArkInventory.db.option.restack.topup then
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
	
	for bag_pos, blizzard_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
			
			Restack_Yield( cl )
			
			local ab, bt, count = RestackBagCheck( blizzard_id )
			if ab then
				return cl, recheck, false
			end
			
			if bt == 0 and not ArkInventory.Global.BlizzardReagentContainerIDs[blizzard_id] then
				
				for slot_id = 1, count do
					
					if RestackBagCheck( blizzard_id ) then
						return cl, recheck, false
					end
					
					if ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos == bp and slot_id < cs )then
					-- ( different location ) or (same location and higher bag) or (same location and same bag and higher slot)
						
						local itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( blizzard_id, slot_id )
						if itemInfo.isLocked then
							
							-- this slot is locked, move on and check it again next time
							--ArkInventory.Output( "locked> ", loc_id, ".", blizzard_id, ".", slot_id )
							recheck = true
							
						else
							
							if itemInfo.hyperlink then
								--ArkInventory.Output( "found> ", loc_id, ".", blizzard_id, ".", slot_id )
								return abort, recheck, true, blizzard_id, slot_id
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
	
	for bag_pos, blizzard_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		local ab, bt, count = RestackBagCheck( blizzard_id )
		if ab then
			return cl, recheck, false
		end
		
		--ArkInventory.Output( "checking ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id, " type = ", bt )
		
		if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
			
			Restack_Yield( cl )
			
			local pri_ok = false
			
			if ArkInventory.db.option.restack.priority then
				-- priority is reagent bank
				--if blizzard_id ~= ArkInventory.ENUM.BAG.INDEX.REAGENTBANK and ( bt == 0 or bt == ct ) then
				if ( not ArkInventory.Global.BlizzardReagentContainerIDs[blizzard_id] ) and ( bt == 0 or bt == ct ) then
					-- do not steal from a reagent container
					-- do not steal from a profession bag unless its for a reagent container
					pri_ok = true
				end
			else
				-- priority is profession bags
				if bt == 0 then
					--ArkInventory.Output( "search this bag> ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id )
					pri_ok = true
				end
			end
			
			if pri_ok then
				
				--ArkInventory.Output( "searching ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id )
				
				for slot_id = 1, count do
					
					if RestackBagCheck( blizzard_id ) then
						return cl, recheck, false
					end
					
					if ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos > bp and bt == 0 ) or ( loc_id == cl and bag_pos == bp and slot_id < cs ) then
					-- ( different location ) or (same location and lower bag) or (same location and same bag and lower slot)
						
						local itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( blizzard_id, slot_id )
						if itemInfo.isLocked then
							
							-- this slot is locked, move on and check it again next time
							--ArkInventory.Output( "locked> ", loc_id, ".", blizzard_id, ".", slot_id )
							recheck = true
							
						else
							
							--ArkInventory.Output( "chk> ", itemInfo.hyperlink )
							
							if itemInfo.hyperlink then
								
								--ArkInventory.Output( "chk> ", loc_id, ".", blizzard_id, ".", slot_id )
								
								-- ignore bags
								local info = ArkInventory.GetObjectInfo( itemInfo.hyperlink )
								if info.equiploc ~= "INVTYPE_BAG" then
									
									local check_item = true
									if loc_id ~= cl and not info.craft then
										-- only allow crafting reagents to be selected from bags when depositing to the bank (dont steal the pick/hammer/army knife/etc)
										check_item = false
									end
									
									if check_item then
										
										local it = GetItemFamily( itemInfo.hyperlink ) or 0
										
										if ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.WRATH ) then -- FIX ME
											
											if bit.band( it, ct ) > 0 then
												--ArkInventory.Output( "found prof> ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id, ".", slot_id, " " , itemInfo.hyperlink )
												return abort, recheck, true, blizzard_id, slot_id
											end
											
										else
											
											if it == ct then
												--ArkInventory.Output( "found prof> ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id, ".", slot_id, " " , itemInfo.hyperlink )
												return abort, recheck, true, blizzard_id, slot_id
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
	
	if loc_id == ArkInventory.Const.Location.Bank and ArkInventory.db.option.restack.bank then
		
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
	
	for bag_pos, blizzard_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		local ab, bt, count = RestackBagCheck( blizzard_id )
		if ab then
			return cl, recheck, false
		end
		
		--ArkInventory.Output( "checking ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id, " type = ", bt )
		
		if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
			
			Restack_Yield( cl )
			
			local pri_ok
			
			if ArkInventory.db.option.restack.priority then
				-- priority is reagent bank
				--if blizzard_id ~= ArkInventory.ENUM.BAG.INDEX.REAGENTBANK and ( bt == 0 or cb == ArkInventory.ENUM.BAG.INDEX.REAGENTBANK ) then
				if ( not ArkInventory.Global.BlizzardReagentContainerIDs[blizzard_id] ) and ( bt == 0 or ArkInventory.Global.BlizzardReagentContainerIDs[cb] ) then
					-- do not steal from a reagent container
					-- do not steal from a profession bag unless its for a reagent container
					pri_ok = true
				end
			else
				-- priority is profession bags
				if bt == 0 then
					--ArkInventory.Output( "search this bag> ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id )
					pri_ok = true
				end
			end
			
			if pri_ok then
				
				--ArkInventory.Output( "searching ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id )
				
				for slot_id = 1, count do
					
					if RestackBagCheck( blizzard_id ) then
						return cl, recheck, false
					end
					
					if ( loc_id ~= cl ) or ( loc_id == cl and bag_pos < bp ) or ( loc_id == cl and bag_pos == bp and slot_id < cs )then
						-- ( different location ) or (same location and higher bag) or (same location and same bag and higher slot)
						
						--ArkInventory.Output( "check> ", loc_id, ".", blizzard_id, ".", slot_id )
						
						local itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( blizzard_id, slot_id )
						if itemInfo.isLocked then
							
							-- this slot is locked, move on and check it again next time
							--ArkInventory.Output( "locked> ", loc_id, ".", blizzard_id, ".", slot_id )
							recheck = true
							
						else
							
							if itemInfo.hyperlink then
								
								local info = ArkInventory.GetObjectInfo( itemInfo.hyperlink )
								if info.craft then
									--ArkInventory.Output( "found> [", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id, ".", slot_id, "]" )
									return abort, recheck, true, blizzard_id, slot_id
								end
								
							end
							
						end
						
					end
					
				end

			else
				--ArkInventory.Output( "do not steal from ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id )
			end
			
		else
			--ArkInventory.Output( "ignored for restack ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id )
		end
		
		--ArkInventory.Output( "nothing found in ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id )
		
	end
	
	if loc_id == ArkInventory.Const.Location.Bank and ArkInventory.db.option.restack.deposit then
		
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
	
	-- move items into complete stacks
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	for bag_pos = #ArkInventory.Global.Location[loc_id].Bags, 1, -1 do
		
		local blizzard_id = ArkInventory.Global.Location[loc_id].Bags[bag_pos]
		
		local ab, bt, count = RestackBagCheck( blizzard_id )
		if ab then
			return cl, recheck, false
		end
		
		if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
			
			--ArkInventory.Output( "StackBags( ", loc_id, ".", blizzard_id, " )" )
			
			if count > 0 then
				
				for slot_id = count, 1, -1 do
					
					if RestackBagCheck( blizzard_id ) then
						return cl, recheck, false
					end
					
					Restack_Yield( cl )
					--ArkInventory.Output( "checking ", loc_id, ".", blizzard_id, ".", slot_id )
					
					local itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( blizzard_id, slot_id )
					if itemInfo.isLocked then
						
						-- this slot is locked, move on and check it again next time
						--ArkInventory.Output( "locked> ", loc_id, ".", blizzard_id, ".", slot_id )
						recheck = true
						
					else
						
						--ArkInventory.Output( "unlocked> ", loc_id, ".", blizzard_id, ".", slot_id )
						
						if itemInfo.hyperlink then
							
							local info = ArkInventory.GetObjectInfo( itemInfo.hyperlink )
							
							if itemInfo.stackCount < info.stacksize then
								
								--ArkInventory.Output( "partial stack of ", itemInfo.hyperlink, " x ", itemInfo.stackCount, " found at ", blizzard_id, ".", slot_id, " bt=", bt )
								
								local ab, rc, ok, pb, ps
								if bt == 0 then
									ab, rc, ok, pb, ps = FindPartialStack( loc_id, loc_id, blizzard_id, bag_pos, slot_id, info.id )
								else
									-- non normal bag - allow it to pull from normal bags that are higher
									ab, rc, ok, pb, ps = FindItem( loc_id, loc_id, blizzard_id, bag_pos, slot_id, info.id, bt )
								end
								
								if rc then
									recheck = true
								end
								
								if ab then
									abort = loc_id
									return abort, recheck
								end
								
								if ok then
									
									--ArkInventory.Output2( "merge> ", blizzard_id, ".", slot_id, " + ", pb, ".", ps )
									
									ClearCursor( )
									ArkInventory.CrossClient.PickupContainerItem( pb, ps )
									ArkInventory.CrossClient.PickupContainerItem( blizzard_id, slot_id )
									ClearCursor( )
									
									Restack_Yield( cl )
									
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

local function StackVault( )
	
	local loc_id = ArkInventory.Const.Location.Vault
	local tab_id = GetCurrentGuildBankTab( )
	
	local abort = false
	local recheck = false
	
	Restack_Yield( loc_id )
	
	local _, _, canView, canDeposit = GetGuildBankTabInfo( tab_id )
	
	if not ( IsGuildLeader( ) or ( canView and canDeposit ) ) then
		ArkInventory.Output( string.format( ArkInventory.Localise["RESTACK_FAIL_ACCESS"], ArkInventory.Localise["VAULT"], tab_id ) )
		return abort, recheck
	end
	
	Restack_Yield( loc_id )
	
	for slot_id = ArkInventory.Const.BLIZZARD.GLOBAL.GUILDBANK.SLOTS_PER_TAB, 1, -1 do
		
		if not ArkInventory.Global.Mode.Vault or tab_id ~= GetCurrentGuildBankTab( ) then
			-- no longer at the vault or changed tabs, abort
			--ArkInventory.OutputWarning( "aborting, no longer at location" )
			abort = loc_id
			return abort, recheck
		end
		
		--ArkInventory.OutputDebug( "checking vault ", tab_id, ".", slot_id )
		
		if select( 3, GetGuildBankItemInfo( tab_id, slot_id ) ) then
			
			-- this slot is locked, move on and check it again next time
			--ArkInventory.Output( "locked> ", loc_id, ".", tab_id, ".", slot_id )
			recheck = true
			
		else
			
			local h = GetGuildBankItemLink( tab_id, slot_id )
			
			--ArkInventory.OutputDebug( "tab=[", tab_id, "], slot=[", slot_id, "] count=[", count, "] locked=[", locked, "] item=", h )
			
			if h then
				
				local info = ArkInventory.GetObjectInfo( h )
				local count = select( 2, GetGuildBankItemInfo( tab_id, slot_id ) )
				
				if count < info.stacksize then
					
					--ArkInventory.OutputDebug( "partial > ", tab_id, ".", slot_id )
					
					local ab, rc, ok, pb, ps = FindPartialStack( loc_id, loc_id, tab_id, nil, slot_id, info.id )
					
					if ab then
						abort = loc_id
						return abort
					end
					
					if rc then
						recheck = true
					end
					
					if ok then
						
						--ArkInventory.OutputDebug( "merge > ", tab_id, ".", slot_id, " + ", pb, ".", ps )
						
						ClearCursor( )
						PickupGuildBankItem( pb, ps )
						PickupGuildBankItem( tab_id, slot_id )
						ClearCursor( )
						
						Restack_Yield( loc_id )
						
						recheck = true
						
					end
					
				end
			
			end
			
		end
		
	end
	
	return abort, recheck
	
end

local function ConsolidateBag( loc_id, blizzard_id, bag_pos )
	
	-- move stacks into empty slots
	
	--ArkInventory.Output( "ConsolidateBag( ", loc_id, ".", blizzard_id, ", ", bag_pos, " )" )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
		
		Restack_Yield( loc_id )
		
		local ab, bt, count = RestackBagCheck( blizzard_id )
		--ArkInventory.Output( "RestackBagCheck( ", loc_id, ", ", blizzard_id, " ) = [", ab, "] [", bt, "] [", count, "]" )
		
		if ab then
			return cl, recheck, false
		end
		
		--ArkInventory.Output( "bag> ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id, " (#", bag_pos, ") ", bt, " / ", count )
		
		local ok = true
		
		for slot_id = count, 1, -1 do
			
			if RestackBagCheck( blizzard_id ) then
				return cl, recheck, false
			end
			
			--ArkInventory.Output( "chk> ", loc_id, ".", blizzard_id, ".", slot_id )
			
			local itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( blizzard_id, slot_id )
			if itemInfo.isLocked then
				
				-- this slot is locked, move on and check it again next time
				recheck = true
				--ArkInventory.Output( "locked> ", loc_id, ".", blizzard_id, ".", slot_id )
				
			else
				
				if not itemInfo.hyperlink then
					
					--ArkInventory.Output( "empty> ", ArkInventory.Global.Location[loc_id].Name, ".", blizzard_id, ".", slot_id )
					
					local ab, rc, sb, ss
					if bt == 0 then
						ab, rc, ok, sb, ss = FindCraftingItem( loc_id, loc_id, blizzard_id, bag_pos, slot_id )
					else
						ab, rc, ok, sb, ss = FindProfessionItem( loc_id, loc_id, blizzard_id, bag_pos, slot_id, bt )
					end
					
					if rc then
						recheck = true
					end
					
					if ok then
						
						--ArkInventory.Output( "moving> ", sb, ".", ss, " to ", blizzard_id, ".", slot_id )
						
						--if true then return end
						
						ClearCursor( )
						ArkInventory.CrossClient.PickupContainerItem( sb, ss )
						ArkInventory.CrossClient.PickupContainerItem( blizzard_id, slot_id )
						ClearCursor( )
						
						Restack_Yield( loc_id )
						
						recheck = true
						
					end
					
				else
					
					--ArkInventory.Output( "item> ", loc_id, ".", blizzard_id, ".", slot_id, " ", h )
					
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
	
	--ArkInventory.Output( "fill up profession bags with profession items" )
	
	for bag_pos = #ArkInventory.Global.Location[loc_id].Bags, 1, -1 do
		
		local blizzard_id = ArkInventory.Global.Location[loc_id].Bags[bag_pos]
		
		if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
			
			Restack_Yield( loc_id )
			
			local ab, bt, count = RestackBagCheck( blizzard_id )
			if ab then
				return cl, recheck, false
			end
			
			--if count > 0 and ( blizzard_id == ArkInventory.ENUM.BAG.INDEX.REAGENTBANK or bt ~= 0 ) then
			if count > 0 and ( ArkInventory.Global.BlizzardReagentContainerIDs[blizzard_id] or bt ~= 0 ) then
				
				--ArkInventory.Output( "Consolidate ", loc_id, ".", blizzard_id, " ", bt )
				
				local ab, rc = ConsolidateBag( loc_id, blizzard_id, bag_pos )
				
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
		
		if ArkInventory.db.option.restack.deposit and ArkInventory.CrossClient.IsReagentBankUnlocked( ) then
			
			-- fill up reagent bank with crafting items
			
			local bag_pos = ArkInventory.Global.Location[loc_id].ReagentBag
			local blizzard_id = ArkInventory.ENUM.BAG.INDEX.REAGENTBANK
			
			if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
				
				Restack_Yield( loc_id )
				
				if RestackBagCheck( blizzard_id ) then
					return cl, recheck, false
				end
				
				local ab, rc = ConsolidateBag( loc_id, blizzard_id, bag_pos )
				
				if ab then
					return ab, recheck
				end
				
				if rc then
					recheck = true
				end
				
			end
			
		end
		
		if ArkInventory.db.option.restack.bank then
			
			--ArkInventory.Output2( "fill up normal bank slots with crafting items" )
			
			for bag_pos = #ArkInventory.Global.Location[loc_id].Bags, 1, -1 do
				
				local blizzard_id = ArkInventory.Global.Location[loc_id].Bags[bag_pos]
				
				if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
					
					local ab, bt, count = RestackBagCheck( blizzard_id )
					if ab then
						return cl, recheck, false
					end
					
					--if bt == 0 and blizzard_id ~= ArkInventory.ENUM.BAG.INDEX.REAGENTBANK then
					if bt == 0 and not ArkInventory.Global.BlizzardReagentContainerIDs[blizzard_id] then
						
						local ab, rc = ConsolidateBag( loc_id, blizzard_id, bag_pos )
						
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

local function CompactBag( loc_id, blizzard_id, bag_pos )
	
	local me = ArkInventory.GetPlayerCodex( )
	local abort = false
	local recheck = false
	
	local cl = loc_id
	
	if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
		
		Restack_Yield( loc_id )
		
		--ArkInventory.Output( "CompactBag( ", loc_id, ".", blizzard_id, " )" )
		
		local ab, bt, count = RestackBagCheck( blizzard_id )
		if ab then
			return cl, recheck, false
		end
		
		--ArkInventory.Output( "bag> ", loc_id, ".", blizzard_id, " (", bag_pos, ") ", bt, " / ", count )
		
		local ok = true
		
		for slot_id = count, 1, -1 do
			
			if RestackBagCheck( blizzard_id ) then
				return cl, recheck, false
			end
			
			--ArkInventory.Output( "chk> ", loc_id, ".", blizzard_id, ".", slot_id )
			
			local itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( blizzard_id, slot_id )
			if itemInfo.isLocked then
				
				-- this slot is locked, move on and check it again next time
				recheck = true
				--ArkInventory.Output( "locked @ ", loc_id, ".", blizzard_id, ".", slot_id )
				
			else
				
				if not itemInfo.hyperlink then
				
					--ArkInventory.Output( "empty @ ", loc_id, ".", blizzard_id, ".", slot_id )
					
					local ab, rc, sb, ss
					ab, rc, ok, sb, ss = FindNormalItem( loc_id, loc_id, blizzard_id, bag_pos, slot_id, bt )
					
					if rc then
						recheck = true
					end
					
					if ok then
						
						--ArkInventory.Output( "moving> ", sb, ".", ss, " to ", blizzard_id, ".", slot_id )
						
						ClearCursor( )
						ArkInventory.CrossClient.PickupContainerItem( sb, ss )
						ArkInventory.CrossClient.PickupContainerItem( blizzard_id, slot_id )
						ClearCursor( )
						
						Restack_Yield( loc_id )
						
						recheck = true
						
					end
					
				else
					
					--ArkInventory.Output( "item> ", loc_id, ".", blizzard_id, ".", slot_id, " ", h )
					
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
		
		local blizzard_id = ArkInventory.Global.Location[loc_id].Bags[bag_pos]
		
		if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
			
			local ab, bt, count = RestackBagCheck( blizzard_id )
			if ab then
				return cl, recheck, false
			end
			
			--if count > 0 and bt == 0 and blizzard_id ~= ArkInventory.ENUM.BAG.INDEX.REAGENTBANK then
			if count > 0 and bt == 0 and not ArkInventory.Global.BlizzardReagentContainerIDs[blizzard_id] then
				
				--ArkInventory.Output( "Compact ", loc_id, ".", blizzard_id, " ", bt )
				
				local ab, rc = CompactBag( loc_id, blizzard_id, bag_pos )
				
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



local function RestackRun_Threaded( loc_id )
	
	--ArkInventory.Output( "RestackRun_Threaded / ", time( ), " / ", GetTime( ) )
	
	-- DO NOT USE CACHED DATA FOR RESTACKING, PULL THE DATA DIRECTLY FROM WOW AGAIN, THE UI WILL CATCH UP
	
	local me = ArkInventory.GetPlayerCodex( )
	local ok = false
	local abort, recheck
	
	if loc_id == ArkInventory.Const.Location.Bag then
		
		RestackMessageStart( loc_id )
		
		if ArkInventory.db.option.restack.blizzard then
			
			ArkInventory.CrossClient.SortBags( )
			Restack_Yield( loc_id )
			
		else
			
			repeat
				
				ok = true
				
				--ArkInventory.Output( "stackbags 1 ", time( ) )
				abort, recheck = StackBags( loc_id )
				--ArkInventory.Output( "stackbags 2 ", time( ) )
				
				if abort then
					RestackMessageAbort( loc_id )
					break
				end
				
				if recheck then
					ok = false
				end
				
				--ArkInventory.Output( "consolidate 1 ", time( ) )
				abort, recheck = Consolidate( loc_id )
				--ArkInventory.Output( "consolidate 2 ", time( ) )
				
				if abort then
					RestackMessageAbort( loc_id )
					break
				end
				
				if recheck then
					ok = false
				end
				
				
--[[
				abort, recheck = Compact( loc_id )
				
				if abort then
					RestackMessageAbort( loc_id )
					break
				end
				
				if recheck then
					ok = false
				end
]]--
				
			until ok
			
		end
		
		RestackMessageComplete( loc_id )
		
	end
	
	
	if loc_id == ArkInventory.Const.Location.Bank then
		
		if ArkInventory.Global.Mode.Bank then
			
			--ArkInventory.Output( "bank / ", time( ), " / ", GetTime( ) )
			
			RestackMessageStart( loc_id )
			
			if ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.WRATH ) and ArkInventory.db.option.restack.blizzard then -- FIX ME
				
				ArkInventory.CrossClient.SetSortBagsRightToLeft( ArkInventory.db.option.restack.reverse )
				ArkInventory.CrossClient.SortBankBags( )
				
				if ArkInventory.CrossClient.IsReagentBankUnlocked( ) then
					
					if ArkInventory.db.option.restack.deposit then
						
						ArkInventory.Output( ArkInventory.RestackString( ), ": ", REAGENTBANK_DEPOSIT, " " , ArkInventory.Localise["ENABLED"] )
						
						C_Timer.After(
							ArkInventory.db.option.restack.delay,
							function( )
								if ArkInventory.Global.Mode.Bank then
									DepositReagentBank( )
								else
									RestackMessageAbort( ArkInventory.Const.Location.Bank )
								end
							end
						)
						
					else
						ArkInventory.Output( ArkInventory.RestackString( ), ": ", REAGENTBANK_DEPOSIT, " " , ArkInventory.Localise["DISABLED"] )
					end
					
					local bag_pos = ArkInventory.Global.Location[loc_id].ReagentBag
					if not me.player.data.option[loc_id].bag[bag_pos].restack.ignore then
						C_Timer.After(
							0.6,
							function( )
								if ArkInventory.Global.Mode.Bank then
									ArkInventory.CrossClient.SortReagentBankBags( )
								else
									RestackMessageAbort( ArkInventory.Const.Location.Bank )
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
						RestackMessageAbort( loc_id )
						break
					end
					
					if recheck then
						ok = false
					end
					
					--ArkInventory.Output( "Consolidate / ", loc_id, " / ", time( ), " / ", time( ) )
					abort, recheck = Consolidate( loc_id )
					--ArkInventory.Output( "Consolidate / ", loc_id, " / ", time( ), " / ", time( ) )
					
					if abort then
						RestackMessageAbort( loc_id )
						break
					end
					
					if recheck then
						ok = false
					end
					
					
--[[
					abort, recheck = Compact( loc_id )
					
					if abort then
						RestackMessageAbort( loc_id )
						break
					end
					
					if recheck then
						ok = false
					end
]]--
					
				until ok
				
			end
			
			RestackMessageComplete( loc_id )
			
			--ArkInventory.Output( "bank / ", time( ), " / ", GetTime( ) )
			
		end
		
	end
	
	
	if loc_id == ArkInventory.Const.Location.Vault then
		
		if ArkInventory.Global.Mode.Vault then
			
			RestackMessageStart( loc_id )
			
			repeat
				
				abort, recheck = StackVault( )
				
				if abort then
					RestackMessageAbort( loc_id )
					break
				end
				
				-- do not yield here
				
			until not recheck
			
			RestackMessageComplete( loc_id )
			
		end
		
	end
	
	--ArkInventory.Output( "RestackRun_Threaded / ", time( ), " / ", GetTime( ) )
	
end

local function RestackRun( loc_id )
	
	
	if UnitIsDead( "player" ) then
		ArkInventory.OutputWarning( "cannot restack while dead.  release or resurrect first." )
		return
	end
	
	if ArkInventory.Global.Mode.Combat then
		ArkInventory.OutputWarning( "cannot restack while in combat." )
		return
	end
	
	local thread_id = ArkInventory.Global.Thread.Format.Restack
	
	if not ArkInventory.Global.Thread.Use then
		local tz = debugprofilestop( )
		ArkInventory.OutputThread( thread_id, " start" )
		RestackRun_Threaded( loc_id )
		tz = debugprofilestop( ) - tz
		ArkInventory.OutputThread( string.format( "%s took %0.0fms", thread_id, tz ) )
		return
	end
	
	if ArkInventory.ThreadRunning( thread_id ) then
		-- restack already in progress
		--ArkInventory.OutputError( ArkInventory.RestackString( ), ": ", ArkInventory.Global.Location[loc_id].Name, " " , ArkInventory.Localise["RESTACK_FAIL_WAIT"] )
		ArkInventory.OutputError( ArkInventory.RestackString( ), ": ", ArkInventory.Localise["RESTACK_FAIL_WAIT"] )
		return
	end
	
	-- thread not active, create a new one
	local tf = function ( )
		RestackRun_Threaded( loc_id )
	end
	
	ArkInventory.ThreadStart( thread_id, tf )
	
end

function ArkInventory.Restack( loc_id )
	if ArkInventory.db.option.restack.enable then
		if ArkInventory.Global.Thread.Use then
			RestackRun( loc_id )
		else
			ArkInventory.OutputWarning( "cannot restack when threads are disabled" )
		end
	else
		ArkInventory.OutputWarning( ArkInventory.RestackString( ), " is currently disabled.  Right click on the icon for options." )
	end
end

function ArkInventory.EmptyBag( loc_id, cbag )
	
	local cbag = ArkInventory.InternalIdToBlizzardBagId( loc_id, cbag )
	
	if not ( loc_id == ArkInventory.Const.Location.Bag or loc_id == ArkInventory.Const.Location.Bank ) then
		return
	end
	
	local _, ct = ArkInventory.CrossClient.GetContainerNumFreeSlots( cbag )
	local cslot = 0
	
	--ArkInventory.Output( "empty ", cbag, " [", ct, "]" )
	
	for bag_pos, blizzard_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
		local _, bt = ArkInventory.CrossClient.GetContainerNumFreeSlots( blizzard_id )
		
		if blizzard_id ~= cbag and ( bt == 0 or bt == ct ) then
			
			for slot_id = 1, ArkInventory.CrossClient.GetContainerNumSlots( blizzard_id ) do
				
				if loc_id == ArkInventory.Const.Location.Bank and not ArkInventory.Global.Mode.Bank then
					-- no longer at bank, abort
					return
				end
				
				local itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( blizzard_id, slot_id )
				if not itemInfo.hyperlink then
					
					repeat
						cslot = cslot + 1
						itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( cbag, cslot )
					until itemInfo.hyperlink or cslot > ArkInventory.CrossClient.GetContainerNumSlots( cbag )
					
					if itemInfo.hyperlink then
						
						ClearCursor( )
						ArkInventory.CrossClient.PickupContainerItem( cbag, cslot )
						ArkInventory.CrossClient.PickupContainerItem( blizzard_id, slot_id )
						ClearCursor( )
						
						--Restack_Yield( loc_id )
						
					end
				
				end
				
			end
			
		end
		
	end
	
end
