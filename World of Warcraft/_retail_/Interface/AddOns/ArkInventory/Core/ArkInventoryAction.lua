local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table



ArkInventory.Action.Vendor = { }
ArkInventory.Action.Mail = { }



local junk_addons = { "Scrap", "SellJunk", "ReagentRestocker", "Peddler" }
function ArkInventory.Action.Vendor.ProcessCheck( name )
	for _, a in pairs( junk_addons ) do
		--ArkInventory.Output( "checking ", a )
		if ArkInventory.CrossClient.IsAddOnLoaded( a ) and _G[a] then
			ArkInventory.OutputWarning( string.format( ArkInventory.Localise["CONFIG_ACTION_VENDOR_PROCESSING_DISABLED_DESC"], a ) )
			return false, a
		end
	end
	return true
end

function ArkInventory.Action.Vendor.Check( i, codex, manual, delete )
	
	local isMatch = false
	local vendorPrice = -1
	
	if i and i.h then
		
		local info = i.info or ArkInventory.GetObjectInfo( i.h, i )
		
		if info.ready and info.id then
			
			if ArkInventory.CrossClient.IsAddOnLoaded( "Scrap" ) and Scrap then
				
				if Scrap:IsJunk( info.id ) then
					isMatch = true
				end
				
			elseif ArkInventory.CrossClient.IsAddOnLoaded( "SellJunk" ) and SellJunk then
				
				if ( info.q == ArkInventory.ENUM.ITEM.QUALITY.POOR and not SellJunk:isException( i.h ) ) or ( info.q ~= ArkInventory.ENUM.ITEM.QUALITY.POOR and SellJunk:isException( i.h ) ) then
					isMatch = true
				end
				
			elseif ArkInventory.CrossClient.IsAddOnLoaded( "ReagentRestocker" ) and ReagentRestocker then
				
				if ReagentRestocker:isToBeSold( info.id ) then
					isMatch = true
				end
				
			elseif ArkInventory.CrossClient.IsAddOnLoaded( "Peddler" ) and PeddlerAPI then
				
				if PeddlerAPI.itemIsToBeSold( info.id ) then
					isMatch = true
				end
				
			elseif codex then
				
				local cat_id = ArkInventory.ItemCategoryGet( i )
				local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat_id )
				local catset = codex.catset.ca[cat_type][cat_num]
				if info.q <= ArkInventory.db.option.action.vendor.raritycutoff then
					if catset.action.t == ArkInventory.ENUM.ACTION.TYPE.VENDOR then
						if catset.action.w == ArkInventory.ENUM.ACTION.WHEN.AUTO then
							isMatch = true
						elseif catset.action.w == ArkInventory.ENUM.ACTION.WHEN.MANUAL and manual then
							isMatch = true
						end
					end
				end
				
			end
			
		end
		
		
		if isMatch then
			
			vendorPrice = info.vendorprice
			if vendorPrice == -1 then
				
				isMatch = false
				
			else
				
				if delete then
					if vendorPrice ~= 0 then
						isMatch = false
					end
				else
					if vendorPrice < 1 then
						isMatch = false
					end
				end
				
			end
			
		end
		
	end
	
	return isMatch, vendorPrice
	
end

function ArkInventory.Action.Vendor.Iterate( manual, delete )
	
	local loc_id = ArkInventory.Const.Location.Bag
	local codex = ArkInventory.GetLocationCodex( loc_id )
	
	local bag_id = 1
	local slot_id = 0
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	local i
	
	local bags = ArkInventory.Global.Location[loc_id].Bags
	local blizzard_id = bags[bag_id]
	local numslots = ArkInventory.CrossClient.GetContainerNumSlots( blizzard_id )
	
	local isMatch, isLocked, itemCount, itemLink, vendorPrice
	
	
	return function( )
		
		isMatch = false
		itemLink = nil
		itemCount = 0
		vendorPrice = -1
		
		while not isMatch do
			
			if slot_id < numslots then
				slot_id = slot_id + 1
			elseif bag_id < #bags then
				bag_id = bag_id + 1
				blizzard_id = bags[bag_id]
				numslots = ArkInventory.CrossClient.GetContainerNumSlots( blizzard_id )
				slot_id = 1
			else
				isMatch = nil
				blizzard_id = nil
				slot_id = nil
				itemCount = nil
				itemLink = nil
				vendorPrice = -1
				break
			end
			
			local itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( blizzard_id, slot_id )
			itemCount = itemInfo.stackCount
			isLocked = itemInfo.isLocked
			itemLink = itemInfo.hyperlink
			
			if itemCount and not isLocked and itemLink then
				isMatch, vendorPrice = ArkInventory.Action.Vendor.Check( player.data.location[loc_id].bag[bag_id].slot[slot_id], codex, manual, delete )
			end
			
		end
		
		--ArkInventory.Output( itemLink, " / ", itemCount, " / ", vendorPrice )
		return blizzard_id, slot_id, itemLink, itemCount, vendorPrice
		
	end
	
end

local function ActionVendorDestroy( manual )
	
	-- cannot be run threaded or it will fail due to no longer being on the same execution path when it resumes
	
	if not manual then return end
	if not ArkInventory.Global.Action.Vendor.process then return end
	if not ArkInventory.db.option.action.vendor.enable then return end
	if not ArkInventory.db.option.action.vendor.manual then return end
	if not ArkInventory.db.option.action.vendor.delete then return end
	
	
	-- build the queue
	local queue = { }
	for blizzard_id, slot_id, itemLink, itemCount, vendorPrice in ArkInventory.Action.Vendor.Iterate( manual, true ) do
		table.insert( queue, { blizzard_id, slot_id, itemLink, itemCount, vendorPrice } )
	end
	
	local qsize = ArkInventory.Table.Elements( queue )
	local runtype = ArkInventory.Localise["AUTOMATIC"]
	if manual then
		runtype = ArkInventory.Localise["MANUAL"]
	end
	
	if manual or qsize > 0 then
		ArkInventory.Output( ArkInventory.Localise["ACTION"], " (", ArkInventory.Localise["DESTROY"], "): ", runtype, " - ", ArkInventory.Localise["START"] )
	end
	
	-- process the queue, well at least the first item in it
	for _, item in pairs( queue ) do
		
		if not ArkInventory.db.option.action.vendor.combat and InCombatLockdown( ) then
			ArkInventory.OutputWarning( ArkInventory.Localise["CONFIG_ACTION_VENDOR_SELL"], " aborted, you are in combat" )
			break
		end
		
		if ArkInventory.db.option.action.vendor.list then
			ArkInventory.Output( string.format( ArkInventory.Localise["CONFIG_ACTION_VENDOR_DESTROY_LIST"], item[4], item[3] ) )
		end
		
		if not ArkInventory.db.option.action.vendor.test then
			ArkInventory.CrossClient.PickupContainerItem( item[1], item[2] )
			DeleteCursorItem( )
		end
		
		-- can only process one deletion per hardware event so break here
		break
		
	end
	
	if qsize > 0 then
		if ArkInventory.db.option.action.vendor.test then
			ArkInventory.Output( LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.Localise["CONFIG_ACTION_VENDOR_DESTROY_TEST"] )
		end
	end
	
	if qsize > 1 then
		ArkInventory.Output( LIGHTYELLOW_FONT_COLOR_CODE, string.format( ArkInventory.Localise["CONFIG_ACTION_VENDOR_DESTROY_MORE"], qsize - 1 ) )
	end
	
	if manual or qsize > 0 then
		ArkInventory.Output( ArkInventory.Localise["ACTION"], " (", ArkInventory.Localise["DESTROY"], "): ", runtype, " - ", ArkInventory.Localise["COMPLETE"] )
	end
	
end

local function ActionVendorSell_Threaded( thread_id, manual )
	
	if not ArkInventory.Global.Mode.Merchant then
		--ArkInventory.Output( "ABORTED (NOT AT MERCHANT)" )
		return
	end
	
--	ArkInventory.Output( "start amount ", GetMoney( ) )
	ArkInventory.Global.Action.Vendor.money = GetMoney( )
	
	local limit = ( ArkInventory.db.option.action.vendor.limit and BUYBACK_ITEMS_PER_PAGE ) or 0
	
	-- build the queue
	local queue = { }
	for blizzard_id, slot_id, itemLink, itemCount, vendorPrice in ArkInventory.Action.Vendor.Iterate( manual, false ) do
		table.insert( queue, { blizzard_id, slot_id, itemLink, itemCount, vendorPrice } )
	end
	
	local qsize = ArkInventory.Table.Elements( queue )
	local runtype = ArkInventory.Localise["AUTOMATIC"]
	if manual then
		runtype = ArkInventory.Localise["MANUAL"]
	end
	
	if manual or qsize > 0 then
		ArkInventory.Output( ArkInventory.Localise["ACTION"], " (", ArkInventory.Localise["VENDOR"], "): ", runtype, " - ", ArkInventory.Localise["START"] )
	end
	
	-- process the queue
	for _, item in pairs( queue ) do
		
		if not ArkInventory.db.option.action.vendor.combat and InCombatLockdown( ) then
			ArkInventory.OutputWarning( ArkInventory.Localise["CONFIG_ACTION_VENDOR_SELL"], " aborted, you are in combat" )
			break
		end
		
		ArkInventory.Global.Action.Vendor.sold = ArkInventory.Global.Action.Vendor.sold + 1
		
		if limit > 0 and ArkInventory.Global.Action.Vendor.sold > limit then
			-- limited to buyback page
			ArkInventory.Global.Action.Vendor.sold = limit
			ArkInventory.Output( LIGHTYELLOW_FONT_COLOR_CODE, string.format( ArkInventory.Localise["CONFIG_ACTION_VENDOR_LIMIT_ABORT"], limit ) )
			break
		end
		
		if ArkInventory.db.option.action.vendor.list then
			ArkInventory.Output( string.format( ArkInventory.Localise["CONFIG_ACTION_VENDOR_LIST_SELL_DESC"], item[4], item[3], ArkInventory.MoneyText( item[4] * item[5], true ) ) )
		end
		
		if not ArkInventory.db.option.action.vendor.test then
			if ArkInventory.Global.Mode.Merchant then
				ArkInventory.CrossClient.UseContainerItem( item[1], item[2] )
				ArkInventory.ThreadYield( thread_id )
			end
		end
		
	end
	
	if ArkInventory.Global.Action.Vendor.sold > 0 then
		if ArkInventory.db.option.action.vendor.test then
			ArkInventory.Output( LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.Localise["CONFIG_ACTION_VENDOR_TESTMODE"] )
		end
	end
	
	if manual or qsize > 0 then
		ArkInventory.Output( ArkInventory.Localise["ACTION"], " (", ArkInventory.Localise["VENDOR"], "): ", runtype, " - ", ArkInventory.Localise["COMPLETE"] )
	end
	
	-- this will sometimes fail, without any notifcation, so you cant just add up the values as you go
	-- GetMoney doesnt update in real time so also cannot be used here
	-- next best thing, record how much money we had beforehand and how much we have at the next PLAYER_MONEY, then output it there
	
	-- notifcation is at EVENT_ARKINV_PLAYER_MONEY, call it in case it tripped before the final yield came back
--	ArkInventory:SendMessage( "EVENT_ARKINV_PLAYER_MONEY_BUCKET", "JUNK" )
	
end

function ArkInventory.Action.Vendor.Sell( manual )
	
	if not ArkInventory.Global.Action.Vendor.process then return end
	if not ArkInventory.db.option.action.vendor.enable then return end
	
	if manual then
		if not ArkInventory.db.option.action.vendor.manual then return end
	else
		if not ArkInventory.db.option.action.vendor.auto then return end
	end
	
	
	if not ArkInventory.Global.Thread.Use then
		ArkInventory.OutputWarning( ArkInventory.Localise["CONFIG_ACTION_VENDOR_SELL"], " aborted, as threads are currently disabled." )
		return
	end
	
	if ArkInventory.Global.Action.Vendor.running then
		ArkInventory.OutputWarning( ArkInventory.Localise["CONFIG_ACTION_VENDOR_SELL"], " is already running, please wait" )
		return
	end
	
	ArkInventory.Global.Action.Vendor.sold = 0
	ArkInventory.Global.Action.Vendor.money = 0
	
	local thread_id = ArkInventory.Global.Thread.Format.JunkSell
	
	local tf = function ( )
		ArkInventory.Global.Action.Vendor.running = true
		ActionVendorSell_Threaded( thread_id, manual )
		ArkInventory.Global.Action.Vendor.running = false
	end
	
	ArkInventory.ThreadStart( thread_id, tf )
	
	
end



function ArkInventory.Action.Mail.Check( i, codex, manual )
	
	local recipient = nil
	local info = i.info or ArkInventory.GetObjectInfo( i.h, i )
	
	if codex and i and i.h and i.sb ~= ArkInventory.ENUM.BIND.PICKUP and info.q <= ArkInventory.db.option.action.mail.raritycutoff then
		
		local info = i.info or ArkInventory.GetObjectInfo( i.h )
		if info.ready and info.id then
			
			local cat_id = ArkInventory.ItemCategoryGet( i )
			local cat_type, cat_num = ArkInventory.CategoryIdSplit( cat_id )
			
			local action = codex.catset.ca[cat_type][cat_num].action
			if action.t == ArkInventory.ENUM.ACTION.TYPE.MAIL then
				
				if action.w == ArkInventory.ENUM.ACTION.WHEN.AUTO then
					recipient = action.recipient
				elseif manual and action.w == ArkInventory.ENUM.ACTION.WHEN.MANUAL then
					recipient = action.recipient
				end
				
				if recipient then
					local me = string.gsub( codex.player.current, "%s+", "" )
					me = string.lower( me )
					
					if recipient == me then
						recipient = nil
					end
					
				end
				
			end
			
		end
		
	end
	
	return recipient
	
end

function ArkInventory.Action.Mail.Iterate( manual )
	
	local loc_id = ArkInventory.Const.Location.Bag
	local codex = ArkInventory.GetLocationCodex( loc_id )
	
	local bag_id = 1
	local slot_id = 0
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	local i
	
	local bags = ArkInventory.Global.Location[loc_id].Bags
	local blizzard_id = bags[bag_id]
	local numslots = ArkInventory.CrossClient.GetContainerNumSlots( blizzard_id )
	
	local recipient, isLocked, itemCount, itemLink
	
	
	return function( )
		
		recipient = nil
		itemLink = nil
		itemCount = 0
		
		while not recipient do
			
			if slot_id < numslots then
				slot_id = slot_id + 1
			elseif bag_id < #bags then
				bag_id = bag_id + 1
				blizzard_id = bags[bag_id]
				numslots = ArkInventory.CrossClient.GetContainerNumSlots( blizzard_id )
				slot_id = 1
			else
				recipient = nil
				blizzard_id = nil
				slot_id = nil
				itemCount = nil
				itemLink = nil
				vendorPrice = -1
				break
			end
			
			local itemInfo = ArkInventory.CrossClient.GetContainerItemInfo( blizzard_id, slot_id )
			itemCount = itemInfo.stackCount
			isLocked = itemInfo.isLocked
			itemLink = itemInfo.hyperlink
			
			if itemCount and not isLocked and itemLink then
				recipient = ArkInventory.Action.Mail.Check( player.data.location[loc_id].bag[bag_id].slot[slot_id], codex, manual )
			end
			
		end
		
		return recipient, blizzard_id, slot_id, itemLink, itemCount
		
	end
	
end

local function ActionMailSendBatch( thread_id, recipient, batch )
	
	if ArkInventory.db.option.action.mail.list then
		ArkInventory.Output( "Sending message #", batch )
	end
	
	if ArkInventory.db.option.action.mail.test then
		ArkInventory.Global.Action.Mail.status = true
	else
		ArkInventory.Global.Action.Mail.status = nil
		SendMail( recipient, "Mail Action for category in ArkInventory", "" )
	end
	
	--do until true
	for c = 1, ArkInventory.db.option.thread.timeout.mailsend do
		ArkInventory.ThreadYield( thread_id )
		if ArkInventory.Global.Action.Mail.status ~= nil then
			ArkInventory.OutputDebug( "Exited wait for send on pass ", c, " of ", ArkInventory.db.option.action.mail.timeout )
			break
		end
	end
	
	-- check result of send
	
	if ArkInventory.Global.Action.Mail.status == true then
		
		if ArkInventory.db.option.action.mail.list then
			ArkInventory.Output( "Message #", batch, " was successful" )
		end
		
		return true
		
	elseif ArkInventory.Global.Action.Mail.status == false then
		
		if ArkInventory.db.option.action.mail.list then
			ArkInventory.OutputError( "Message #", batch, " failed to send" )
		end
		
	else
		
		ArkInventory.OutputError( "Send did not succeed, or fail, still in progress??" )
		
	end
	
end

local function ActionMailSend_Threaded( thread_id, manual )
	
	ArkInventory.Global.Action.Mail.status = nil
	local batch = 0
	local index = 0
	local total = 0
	local limit = ArkInventory.Global.Action.Mail.limit
	
	-- build queue
	local queue = { }
	for recipient, blizzard_id, slot_id, itemLink, itemCount in ArkInventory.Action.Mail.Iterate( manual ) do
		if not queue[recipient] then
			queue[recipient] = { }
		end
		table.insert( queue[recipient], { blizzard_id, slot_id, itemLink, itemCount } )
	end
	
	local qsize = ArkInventory.Table.Elements( queue )
	local runtype = ArkInventory.Localise["AUTOMATIC"]
	if manual then
		runtype = ArkInventory.Localise["MANUAL"]
	end
	
	if manual or qsize > 0 then
		ArkInventory.Output( ArkInventory.Localise["ACTION"], " (", ArkInventory.Localise["MAIL"], "): ", runtype, " - ", ArkInventory.Localise["START"] )
	end
	
	-- process queue by recipient
	for recipient, items in pairs( queue ) do
		
		if ArkInventory.db.option.action.mail.list then
			ArkInventory.Output( ArkInventory.Localise["RECIPIENT"], ": ", recipient )
		end
		
		for _, item in pairs( items ) do
			
			if ArkInventory.Global.Mode.Mailbox then
				
				if index == limit then
					batch = batch + 1
					if not ActionMailSendBatch( thread_id, recipient, batch ) then
						break
					end
					index = 0
				end
				
				index = index + 1
				total = total + 1
				
				if index <= limit then
					
					if not ArkInventory.db.option.action.mail.test then
						ArkInventory.CrossClient.PickupContainerItem( item[1], item[2] )
						ClickSendMailItemButton( )
					end
					
					if ArkInventory.db.option.action.mail.list then
						ArkInventory.Output( "Attached item ", index, " = ", item[3], " x ", item[4] )
					end
					
				end
				
			end
			
		end
		
		if ArkInventory.Global.Mode.Mailbox then
			if index > 0 and index <= limit then
				batch = batch + 1
				ActionMailSendBatch( thread_id, recipient, batch )
				index = 0
			end
		end
		
	end
	
	if total > 0 then
		
		if ArkInventory.db.option.action.mail.list then
			ArkInventory.Output( total, " items sent in ", batch, " messages" )
		end
		
		if ArkInventory.db.option.action.mail.test then
			ArkInventory.Output( LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.Localise["CONFIG_ACTION_MAIL_TESTMODE"] )
		end
		
	end
	
	if manual or qsize > 0 then
		ArkInventory.Output( ArkInventory.Localise["ACTION"], " (", ArkInventory.Localise["MAIL"], "): ", runtype, " - ", ArkInventory.Localise["COMPLETE"] )
	end
	
end

function ArkInventory.Action.Mail.Send( manual )
	
	if not ArkInventory.db.option.action.mail.enable then return end
	
	if manual then
		if not ArkInventory.db.option.action.mail.manual then return end
	else
		if not ArkInventory.db.option.action.mail.auto then return end
		if not ArkInventory.Global.Action.Mail.process then return end
	end
	
	
	if not ArkInventory.Global.Thread.Use then
		ArkInventory.OutputWarning( ArkInventory.Localise["CONFIG_ACTION_MAIL_SEND"], " aborted, as threads are currently disabled." )
		return
	end
	
	if ArkInventory.Global.Action.Mail.running then
		ArkInventory.OutputWarning( ArkInventory.Localise["CONFIG_ACTION_MAIL_SEND"], " is already running, please wait" )
		return
	end
	
	local thread_id = ArkInventory.Global.Thread.Format.MailSend
	
	local tf = function ( )
		ArkInventory.Global.Action.Mail.running = true
		ActionMailSend_Threaded( thread_id, manual )
		ArkInventory.Global.Action.Mail.process = false
		ArkInventory.Global.Action.Mail.running = false
	end
	
	ArkInventory.ThreadStart( thread_id, tf )
	
end



function ArkInventory.Action.ManualRun( )
	
	if ArkInventory.Global.Mode.Mailbox then
		ArkInventory.Action.Mail.Send( true )
	elseif ArkInventory.Global.Mode.Bank then
		--ArkInventory.Action.Bag.Transfer( true )
		--ArkInventory.Action.Bank.Transfer( true )
	elseif ArkInventory.Global.Mode.Merchant then
		ArkInventory.Action.Vendor.Sell( true )
	else
		ActionVendorDestroy( true )
	end
	
end
