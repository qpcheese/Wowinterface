local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


ArkInventory.LDB = {
	Bags = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Bags" ), {
		type = "data source",
		text = BLIZZARD_STORE_LOADING,
	} ),
	Money = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Money" ), {
		type = "data source",
		text = BLIZZARD_STORE_LOADING,
	} ),
	Tracking_Item = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s_%s", ArkInventory.Const.Program.Name, "Tracking", "Item" ), {
		type = "data source",
		text = BLIZZARD_STORE_LOADING,
	} ),
	Pets = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Pets" ), {
		type = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].ClientCheck ) and "data source" or "hidden",
		text = BLIZZARD_STORE_LOADING,
		next = 0,
	} ),
	Mounts = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s", ArkInventory.Const.Program.Name, "Mounts" ), {
		type = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].ClientCheck ) and "data source" or "hidden",
		text = BLIZZARD_STORE_LOADING,
		next = 0,
	} ),
	Tracking_Currency = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s_%s", ArkInventory.Const.Program.Name, "Tracking", "Currency" ), {
		type = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Currency].ClientCheck ) and "data source" or "hidden",
		text = BLIZZARD_STORE_LOADING,
	} ),
	Tracking_Reputation = ArkInventory.Lib.DataBroker:NewDataObject( string.format( "%s_%s_%s", ArkInventory.Const.Program.Name, "Tracking", "Reputation" ), {
		type = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Reputation].ClientCheck ) and "data source" or "hidden",
		text = BLIZZARD_STORE_LOADING,
	} ),
}


local companionTable = { }



function ArkInventory.LDB.Bags:OnClick( button )
	if button == "RightButton" then
		ArkInventory.MenuLDBBagsOpen( self )
	else
		ArkInventory.Frame_Main_Toggle( ArkInventory.Const.Location.Bag )
	end
end

function ArkInventory.LDB.Bags:Update( )
	
	local icon = string.format( "|T%s:0|t", ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Texture )
	local hasText
	
	local me = ArkInventory.GetPlayerCodex( )
	local loc_id = ArkInventory.Const.Location.Bag
	
	hasText = ArkInventory.Frame_Status_Update_Empty( loc_id, me, true )
	
	if hasText then
		self.text = string.trim( string.format( "%s %s", icon, hasText ) )
	else
		self.text = icon
	end
	
end



function ArkInventory.LDB.Money:Update( )
	
	local icon = string.format( "|T%s:0|t", ArkInventory.Const.Texture.Money )
	local hasText
	
	hasText = ArkInventory.MoneyText( GetMoney( ) )
	
	if hasText then
		self.text = string.trim( hasText )
	else
		self.text = icon
	end
	
end

function ArkInventory.LDB.Money.OnTooltipShow( frame )
	ArkInventory.MoneyFrame_Tooltip( frame )
end



function ArkInventory:EVENT_ARKINV_LDB_CURRENCY_UPDATE_BUCKET( )
	if InCombatLockdown( ) then
		ArkInventory:SendMessage( "EVENT_ARKINV_LDB_CURRENCY_UPDATE_BUCKET" )
	else
		ArkInventory.LDB.Tracking_Currency:Update( )
	end
end

function ArkInventory.LDB.Tracking_Currency:Update( )
	
	local loc_id = ArkInventory.Const.Location.Currency
	local icon = string.format( "|T%s:0|t", ArkInventory.Global.Location[loc_id].Texture )
	local hasText
	
	if ArkInventory.isLocationMonitored( loc_id ) then
		if ArkInventory.Collection.Currency.IsReady( ) then
			if ArkInventory.Collection.Currency.GetCount( ) > 0 then
				
				local codex = ArkInventory.GetPlayerCodex( )
				
				for _, object in ArkInventory.Collection.Currency.ListIterate( ) do
					
					local data = object.data
					if data and codex.player.data.ldb.tracking.currency.watched[data.id] then
						hasText = string.format( "%s |T%s:0|t %s", hasText or "", data.iconFileID, FormatLargeNumber( data.quantity ) )
					end
					
				end
				
			end
		end
	else
		ArkInventory:SendMessage( "EVENT_ARKINV_LDB_CURRENCY_UPDATE_BUCKET" )
	end
	
	if hasText then
		self.text = string.trim( hasText )
	else
		self.text = icon
	end
	
end

function ArkInventory.LDB.Tracking_Currency.OnClick( frame, button )
	
	local loc_id = ArkInventory.Const.Location.Currency
	
	if button == "RightButton" then
		ArkInventory.MenuLDBTrackingCurrencyOpen( frame )
	else
		ArkInventory.Frame_Main_Toggle( ArkInventory.Const.Location.Currency )
	end
	
end

function ArkInventory.LDB.Tracking_Currency:OnTooltipShow( )
	
	local loc_id = ArkInventory.Const.Location.Currency
	
	if ArkInventory.isLocationMonitored( loc_id ) then
		
		self:AddLine( string.format( "%s: %s", ArkInventory.Localise["TRACKING"], ArkInventory.Localise["CURRENCY"] ) )
		self:AddLine( " " )
		
		if ArkInventory.Collection.Currency.IsReady( ) then
			if ArkInventory.Collection.Currency.GetCount( ) > 0 then
				
				local codex = ArkInventory.GetPlayerCodex( )
				
				for _, entry in ArkInventory.Collection.Currency.ListIterate( ) do
					
					local data = entry.data
					if data then
						
						if codex.player.data.ldb.tracking.currency.tracked[data.id] then
							
							local txt = FormatLargeNumber( data.quantity )
							
							if data.maxQuantity > 0 then
								txt = string.format( "%s/%s", FormatLargeNumber( data.quantity ), FormatLargeNumber( data.maxQuantity ) )
							end
							
							self:AddDoubleLine( data.name, txt, 1, 1, 1, 1, 1, 1 )
							
							if data.canEarnPerWeek and data.quantityEarnedThisWeek and data.quantityEarnedThisWeek > 0 then
								txt = string.format( "%s/%s", FormatLargeNumber( data.quantityEarnedThisWeek ), FormatLargeNumber( data.canEarnPerWeek ) )
								self:AddDoubleLine( string.format( "  * %s", ArkInventory.Localise["WEEKLY"] ), txt, 1, 1, 1, 1, 1, 1 )
							end
						
						end
						
					end
					
				end
				
			else
				self:AddLine( ArkInventory.Localise["LDB_CURRENCY_NONE"], 1, 0, 0 )
			end
		else
			self:AddLine( string.format( ArkInventory.Localise["LDB_LOCATION_NOT_READY"], ArkInventory.Global.Location[loc_id].Name ), 1, 0, 0 )
		end
	else
		self:AddLine( string.format( ArkInventory.Localise["LDB_LOCATION_NOT_MONITORED"], ArkInventory.Global.Location[loc_id].Name ), 1, 0, 0 )
	end
	
	self:Show( )
	
end



function ArkInventory:EVENT_ARKINV_LDB_REPUTATION_UPDATE_BUCKET( )
	if InCombatLockdown( ) then
		ArkInventory:SendMessage( "EVENT_ARKINV_LDB_REPUTATION_UPDATE_BUCKET" )
	else
		ArkInventory.LDB.Tracking_Reputation:Update( )
	end
end

function ArkInventory.LDB.Tracking_Reputation:Update( )
	
	local loc_id = ArkInventory.Const.Location.Reputation
	
	local icon = string.format( "|T%s:0|t", ArkInventory.Global.Location[loc_id].Texture )
	local hasText
	
	if ArkInventory.isLocationMonitored( loc_id ) then
		if ArkInventory.Collection.Reputation.IsReady( ) then
			if ArkInventory.Collection.Reputation.GetCount( ) > 0 then
			
				local codex = ArkInventory.GetPlayerCodex( )
				
				local style_default = ArkInventory.Const.Reputation.Style.OneLineWithName
				local style = style_default
				if ArkInventory.db.option.tracking.reputation.custom ~= ArkInventory.Const.Reputation.Custom.Default then
					style = ArkInventory.db.option.tracking.reputation.style.ldb
					if string.trim( style ) == "" then
						style = style_default
					end
				end
				
				local data = ArkInventory.Collection.Reputation.GetByID( codex.player.data.ldb.tracking.reputation.watched )
				if data then
					local txt = ArkInventory.Collection.Reputation.LevelText( data.id, style )
					hasText = string.format( "|T%s:0|t %s", data.icon, txt )
				end
				
				if not hasText then
					codex.player.data.ldb.tracking.reputation.watched = nil
				end
			
		end
		else
			ArkInventory:SendMessage( "EVENT_ARKINV_LDB_REPUTATION_UPDATE_BUCKET" )
		end
	end
	
	if hasText then
		self.text = string.trim( hasText )
	else
		self.text = icon
	end
	
end

function ArkInventory.LDB.Tracking_Reputation.OnClick( frame, button )
	
	local loc_id = ArkInventory.Const.Location.Reputation
	
	if not ArkInventory.isLocationMonitored( loc_id ) or ArkInventory.Collection.Reputation.GetCount( ) <= 0 then
		return
	end
	
	if button == "RightButton" then
		ArkInventory.MenuLDBTrackingReputationOpen( frame )
	else
		ArkInventory.Frame_Main_Toggle( ArkInventory.Const.Location.Reputation )
		--ToggleCharacter( "ReputationFrame" )
	end
	
end

function ArkInventory.LDB.Tracking_Reputation:OnTooltipShow( )
	
	local loc_id = ArkInventory.Const.Location.Reputation
	
	if ArkInventory.isLocationMonitored( loc_id ) then
		
		self:AddLine( string.format( "%s: %s", ArkInventory.Localise["TRACKING"], ArkInventory.Localise["REPUTATION"] ) )
		self:AddLine( " " )
		
		if ArkInventory.Collection.Reputation.IsReady( ) then
			
			if ArkInventory.Collection.Reputation.GetCount( ) > 0 then
				
				local codex = ArkInventory.GetPlayerCodex( )
				
				local style_default = ArkInventory.Const.Reputation.Style.OneLine
				local style = style_default
				if ArkInventory.db.option.tracking.reputation.custom ~= ArkInventory.Const.Reputation.Custom.Default then
					style = ArkInventory.db.option.tracking.reputation.style.tooltip
					if string.trim( style ) == "" then
						style = style_default
					end
				end
				
				for _, entry in ArkInventory.Collection.Reputation.ListIterate( ) do
					
					local data = entry.data
					if data then
						
						if codex.player.data.ldb.tracking.reputation.tracked[data.id] then
							
							local txt = ArkInventory.Collection.Reputation.LevelText( data.id, style )
							
							if codex.player.data.ldb.tracking.reputation.watched == data.id then
								self:AddDoubleLine( data.name, txt, 0, 1, 0, 0, 1, 0 )
							else
								self:AddDoubleLine( data.name, txt, 1, 1, 1, 1, 1, 1 )
							end
							
						else
							
							codex.player.data.ldb.tracking.reputation.tracked[data.id] = false
							
						end
						
					end
					
				end
				
			else
				self:AddLine( ArkInventory.Localise["LDB_REPUTATION_NONE"], 1, 0, 0 )
			end
			
		else
			self:AddLine( string.format( ArkInventory.Localise["LDB_LOCATION_NOT_READY"], ArkInventory.Global.Location[loc_id].Name ), 1, 0, 0 )
		end
	else
		self:AddLine( string.format( ArkInventory.Localise["LDB_LOCATION_NOT_MONITORED"], ArkInventory.Global.Location[loc_id].Name ), 1, 0, 0 )
	end
	
	self:Show( )
	
end



function ArkInventory:EVENT_ARKINV_LDB_ITEM_UPDATE_BUCKET( )
	if InCombatLockdown( ) then
		ArkInventory:SendMessage( "EVENT_ARKINV_LDB_ITEM_UPDATE_BUCKET" )
	else
		ArkInventory.LDB.Tracking_Item:Update( )
	end
end

function ArkInventory.LDB.Tracking_Item:Update( )
	
	local icon = string.format( "|T%s:0|t", [[Interface\Icons\Ability_Tracking]] )
	local hasText
	
	local ready = true
	local codex = ArkInventory.GetPlayerCodex( )
	
	for k in ArkInventory.spairs( ArkInventory.db.option.tracking.items )  do
		
		local info = ArkInventory.GetObjectInfo( k )
		ready = ready and info.ready
		
		if codex.player.data.ldb.tracking.item.tracked[k] then
			local count = ArkInventory.CrossClient.GetItemCount( k, true ) or 0
			if count > 0 or ( count == 0 and ArkInventory.db.option.tracking.item.showzero ) then
				hasText = string.format( "%s  |T%s:0|t %s", hasText or "", info.texture or ArkInventory.Const.Texture.Missing, FormatLargeNumber( count ) )
			end
		end
		
	end
	
	if hasText then
		self.text = string.trim( hasText )
	else
		self.text = icon
	end
	
	if not ready then
		ArkInventory:SendMessage( "EVENT_ARKINV_LDB_ITEM_UPDATE_BUCKET" )
	end
	
end

function ArkInventory.LDB.Tracking_Item:OnClick( button )
	
	if button == "RightButton" then
		ArkInventory.MenuLDBTrackingItemOpen( self )
	end
	
end

function ArkInventory.LDB.Tracking_Item:OnTooltipShow( )
	
	self:AddLine( string.format( "%s: %s", ArkInventory.Localise["TRACKING"], ArkInventory.Localise["ITEMS"] ) )
	self:AddLine( " " )
	
	local codex = ArkInventory.GetPlayerCodex( )
	
	for k in ArkInventory.spairs( ArkInventory.db.option.tracking.items ) do
		
		local info = ArkInventory.GetObjectInfo( k )
		
		local count = ArkInventory.CrossClient.GetItemCount( k, true )
		local checked = codex.player.data.ldb.tracking.item.tracked[k]
		
		if checked then
			self:AddDoubleLine( info.name, count, 0, 1, 0, 0, 1, 0 )
		else
			self:AddDoubleLine( info.name, count, 1, 1, 1, 1, 1, 1 )
		end
		
	end
	
	self:Show( )
	
end



function ArkInventory:EVENT_ARKINV_LDB_PET_UPDATE_BUCKET( )
	if InCombatLockdown( ) then
		ArkInventory:SendMessage( "EVENT_ARKINV_LDB_PET_UPDATE_BUCKET" )
	else
		ArkInventory.LDB.Pets:Update( )
	end
end

function ArkInventory.LDB.Pets.Cleanup( )
	
	if ArkInventory.Collection.Pet.IsReady( ) then
		
		-- check for and remove any selected companions we no longer have (theyve either been caged or released)
		local codex = ArkInventory.GetPlayerCodex( )
		local selected = codex.player.data.ldb.pets.selected
		for k, v in pairs( selected ) do
			if v ~= nil and not ArkInventory.Collection.Pet.GetByID( k ) then
				selected[k] = nil
				--ArkInventory.Output( "removing selected pet we dont have any more - ", k )
			end
		end
		
	end
	
end

function ArkInventory.LDB.Pets.BuildList( ignoreActive )
	
	ArkInventory.Table.Wipe( companionTable )
	
	if not ArkInventory.Collection.Pet.IsReady( ) then
		return
	end
	
	local n = ArkInventory.Collection.Pet.GetCount( )
	--ArkInventory.Output( "pet count = ", n )
	if n == 0 then return end
	
	local codex = ArkInventory.GetPlayerCodex( )
	local selected = codex.player.data.ldb.pets.selected
	local selectedCount = 0
	for k, v in pairs( selected ) do
		if v == true then
			selectedCount = selectedCount + 1
		end
	end
	
	if selectedCount < 2 then
		ignoreActive = true
	end
	
	--ArkInventory.Output( "count = ", selectedCount, ", selected = ", selected )
	
	local count = 0
	local _, _, activePet = ArkInventory.Collection.Pet.GetCurrent( )
	local activeSpecies = activePet and activePet.sd.speciesID
	
	for index, pd in ArkInventory.Collection.Pet.Iterate( ) do
		
		if ( not activePet or ignoreActive ) and ( pd.sd.speciesID ~= activeSpecies ) and ( selectedCount == 0 or selected[index] == true ) and ArkInventory.Collection.Pet.CanSummon( pd.guid ) then
			
			-- cannot be same species as the active pet, if one was active
			-- must be summonable
			
			if selected[index] == false then
				-- never summon
			else
				count = count + 1
				companionTable[count] = index
			end
			
		end
		
	end
	
end

function ArkInventory.LDB.Pets:Update( )
	
	local loc_id = ArkInventory.Const.Location.Pet
	
	local icon = string.format( "|T%s:0|t", ArkInventory.Global.Location[loc_id].Texture )
	local hasText
	
	if ArkInventory.isLocationMonitored( loc_id ) then
		
		if ArkInventory.Collection.Pet.IsReady( ) then
			ArkInventory.LDB.Pets.Cleanup( )
		else
			ArkInventory:SendMessage( "EVENT_ARKINV_LDB_PET_UPDATE_BUCKET" )
		end
		
	end
	
	if hasText then
		self.text = string.trim( hasText )
	else
		self.text = icon
	end
	
end

function ArkInventory.LDB.Pets:OnTooltipShow( )
	
	local loc_id = ArkInventory.Const.Location.Pet
	
	if ArkInventory.isLocationMonitored( loc_id ) then
		
		self:AddLine( ArkInventory.Localise["PET"] )
		self:AddLine( " " )
		
		if ArkInventory.Collection.Pet.IsReady( ) then
			
			local numtotal = ArkInventory.Collection.Pet.GetCount( )
			if numtotal > 0 then
				
				local codex = ArkInventory.GetPlayerCodex( )
				
				local selected = codex.player.data.ldb.pets.selected
				local numselected = 0
				for k, v in pairs( selected ) do
					if v == true then
						numselected = numselected + 1
					end
				end
				
				if codex.player.data.ldb.pets.useall then
					
					self:AddLine( string.format( "%s (%s)", ArkInventory.Localise["ALL"], numtotal ), 1, 1, 1 )
					
				elseif numselected == 0 then
					
					self:AddLine( ArkInventory.Localise["NONE"], 1, 1, 1 )
					
				elseif numselected == 1 then
					
					-- just the one selected, there may be ignored but they dont matter
					for k, v in pairs( selected ) do
						if v == true then
							local pd = ArkInventory.Collection.Pet.GetByID( k )
							local name = pd.sd.name
							if pd.cn and pd.cn ~= "" then
								name = string.format( "%s (%s)", name, pd.cn )
							end
							self:AddLine( string.format( "%s: %s", ArkInventory.Localise["SELECTION"], name ), 1, 1, 1 )
						end
					end
					
				else
					
					-- more than one selected, there may be ignored but they dont matter
					self:AddLine( string.format( "%s (%s/%s)", ArkInventory.Localise["SELECTION"], numselected, numtotal ), 1, 1, 1 )
					
				end
				
			else
				self:AddLine( ArkInventory.Localise["LDB_COMPANION_NONE"], 1, 0, 0 )
			end
			
		else
			self:AddLine( string.format( ArkInventory.Localise["LDB_LOCATION_NOT_READY"], ArkInventory.Global.Location[loc_id].Name ), 1, 0, 0 )
		end
	else
		self:AddLine( string.format( ArkInventory.Localise["LDB_LOCATION_NOT_MONITORED"], ArkInventory.Global.Location[loc_id].Name ), 1, 0, 0 )
	end
	
	self:Show( )
	
end

function ArkInventory.LDB.Pets:OnClick( button )
	
	local loc_id = ArkInventory.Const.Location.Pet
	
	if not ArkInventory.isLocationMonitored( loc_id ) or not ArkInventory.Collection.Pet.IsReady( ) then
		return
	end
	
	if IsModifiedClick( "CHATLINK" ) then
		-- dismiss current pet
		ArkInventory.Collection.Pet.Dismiss( )
		return
	end
	
	ArkInventory.LDB.Pets:Update( )
	
	if button == "RightButton" then
		
		ArkInventory.MenuLDBPetsOpen( self )
		
	else
		
		if ArkInventory.Collection.Pet.GetCount( ) == 0 then
			ArkInventory.Output( string.format( ArkInventory.Localise["NONE_OWNED"], ArkInventory.Localise["PETS"] ) )
			return
		end
		
		ArkInventory.LDB.Pets.BuildList( true )
		
		--ArkInventory.Output( #companionTable, " usable pets" )
		
		if #companionTable == 0 then
			
			-- you only have one pet selected, or in total
			ArkInventory.Collection.Pet.Dismiss( )
			return
			
		else
			
			local codex = ArkInventory.GetPlayerCodex( )
			local userandom = codex.player.data.ldb.pets.randomise
			
			if #companionTable <= 3 then
				userandom = false
			end
			
			if userandom then
				ArkInventory.LDB.Pets.next = random( 1, #companionTable )
			else
				ArkInventory.LDB.Pets.next = ArkInventory.LDB.Pets.next + 1
				if ArkInventory.LDB.Pets.next > #companionTable then
					ArkInventory.LDB.Pets.next = 1
				end
			end
			
			--ArkInventory.Output( ArkInventory.LDB.Pets.next, " = ", companionTable[ArkInventory.LDB.Pets.next] )
			ArkInventory.Collection.Pet.Summon( companionTable[ArkInventory.LDB.Pets.next] )
			
		end
		
	end
	
end



function ArkInventory:EVENT_ARKINV_LDB_MOUNT_UPDATE_BUCKET( )
	if InCombatLockdown( ) then
		ArkInventory:SendMessage( "EVENT_ARKINV_LDB_MOUNT_UPDATE_BUCKET" )
	else
		ArkInventory.LDB.Mounts:Update( )
	end
end

function ArkInventory.LDB.Mounts.Cleanup( )
	
	-- remove any selected mounts we no longer have (not sure how but just in case)
	
	local codex = ArkInventory.GetPlayerCodex( )
	
	for mta, mt in pairs( ArkInventory.Const.Mount.Types ) do
		
		if mta ~= "x" then
			
			local selected = codex.player.data.ldb.mounts.type[mta].selected
			
			for spell, value in pairs( selected ) do
				local md = ArkInventory.Collection.Mount.GetMountBySpell( spell )
				if value ~= nil and not md then
					ArkInventory.OutputWarning( "removing a selected mount [", spell, "] as you dont have it any more" )
					selected[spell] = nil
				elseif md and md.mt ~= mt then
					ArkInventory.OutputWarning( "removing a selected mount ", md.link, " that has changed type" )
					selected[spell] = nil
				end
			end
			
		end
		
	end
	
end

function ArkInventory.LDB.Mounts.IsSubmerged( )
	
	-- its always right about being in the water, just not under the water
	
	if ( GetMirrorTimerInfo( 2 ) ) == "BREATH" then
		-- breath timer so were underwater
		return true
	end
	
	if not IsSubmerged( ) then
		return false
	end
	
	if not IsSwimming( ) then
		-- zone with a seabed where you can walk/mount (eg, vash'jir)
		return false
	end
	
	-- if you get here you are submerged and swimming and not holding your breath
	-- so youre either at the surface, have some sort of underwater breathing, or possibly both, theres no real way to tell
	
	return true
	
end

local function helper_companionTable_update( tbl )
	
	if type( tbl ) ~= "table" then return end
	
	local count = #companionTable
	
	for index, md in pairs( tbl ) do
		count = count + 1
		companionTable[count] = md.index
	end
	
end

function ArkInventory.LDB.Mounts.GetUsable( forceAlternative, forceDragonridingAlternative )
	
	-- builds companionTable and returns the type
	
	local forceAlternative = forceAlternative
	
	wipe( companionTable )
	
	local codex = ArkInventory.GetPlayerCodex( )
	--ArkInventory.Collection.Mount.UpdateDragonridingMounts( codex.player.data.ldb.mounts.dragonriding )
	
	ArkInventory.Collection.Mount.UpdateUsable( codex.player.data.ldb.mounts.dragonriding, forceDragonridingAlternative )
	
	if ArkInventory.LDB.Mounts.IsSubmerged( ) then
		
		if not forceAlternative then
			
			ArkInventory.OutputDebug( "primary - check underwater" )
			if ArkInventory.Collection.Mount.GetCount( "u" ) > 0 then
				ArkInventory.OutputDebug( "primary - using underwater" )
				helper_companionTable_update( ArkInventory.Collection.Mount.GetUsable( "u" ) )
				return "u"
			end
			
--			ArkInventory.OutputDebug( "fallback - check surface" )
--			if ArkInventory.Collection.Mount.GetCount( "s" ) > 0 then
--				ArkInventory.OutputDebug( "fallback - using surface" )
--				helper_companionTable_update( ArkInventory.Collection.Mount.GetUsable( "s" ) )
--				return "s"
--			end
			
		else
			
			ArkInventory.OutputDebug( "ignore underwater, force flying (or land if you cant fly here)" )
			if ArkInventory.Collection.Mount.isFlyable( ) then
				forceAlternative = false
			end
		end
		
	else
		
		if IsSwimming( ) then
			
			if not forceAlternative then
--				ArkInventory.OutputDebug( "primary - check surface" )
--				if ArkInventory.Collection.Mount.GetCount( "s" ) > 0 then
--					ArkInventory.OutputDebug( "primary - using surface" )
--					helper_companionTable_update( ArkInventory.Collection.Mount.GetUsable( "s" ) )
--					return "s"
--				end
			else
				ArkInventory.OutputDebug( "ignore surface, force flying (or land if you cant fly here)" )
				if ArkInventory.Collection.Mount.isFlyable( ) then
					forceAlternative = false
				end
			end
			
		end
		
	end
	
	if ArkInventory.Collection.Mount.isFlyable( ) then
		ArkInventory.OutputDebug( "flight check - can fly here" )
		if not forceAlternative then
			ArkInventory.OutputDebug( "primary - check flying" )
			if ArkInventory.Collection.Mount.GetCount( "a" ) > 0 then
				ArkInventory.OutputDebug( "primary - using flying" )
				helper_companionTable_update( ArkInventory.Collection.Mount.GetUsable( "a" ) )
				return "a"
			end
		else
			ArkInventory.OutputDebug( "ignore flying, force land" )
			forceAlternative = false
		end
	else
		ArkInventory.OutputDebug( "flight check - cannot fly here" )
	end
	
	ArkInventory.OutputDebug( "primary - check land" )
	if not forceAlternative then
		
		if ArkInventory.Collection.Mount.GetCount( "l" ) > 0 then
			ArkInventory.OutputDebug( "primary - adding land" )
			helper_companionTable_update( ArkInventory.Collection.Mount.GetUsable( "l" ) )
		end
		
		local codex = ArkInventory.GetPlayerCodex( )
		
--		if codex.player.data.ldb.mounts.type.l.usesurface and ArkInventory.Collection.Mount.GetCount( "s" ) > 0 then
--			ArkInventory.OutputDebug( "primary - adding surface" )
--			helper_companionTable_update( ArkInventory.Collection.Mount.GetUsable( "s" ) )
--		end
		
		if codex.player.data.ldb.mounts.type.l.useflying and ArkInventory.Collection.Mount.GetCount( "a" ) > 0 then
			ArkInventory.OutputDebug( "primary - adding flying" )
			helper_companionTable_update( ArkInventory.Collection.Mount.GetUsable( "a" ) )
		end
		
		if #companionTable > 0 then
			ArkInventory.OutputDebug( "primary - using land" )
			return "l"
		end
		
	else
		
		if ArkInventory.Collection.Mount.GetCount( "a" ) > 0 then
			ArkInventory.OutputDebug( "alternative - using flying" )
			helper_companionTable_update( ArkInventory.Collection.Mount.GetUsable( "a" ) )
			return "a"
		end
		
	end
	
	--fallback
	
	if ArkInventory.Collection.Mount.GetCount( "l" ) > 0 then
		ArkInventory.OutputDebug( "fallback - using land" )
		helper_companionTable_update( ArkInventory.Collection.Mount.GetUsable( "l" ) )
		return "l"
	end
	
--	if ArkInventory.Collection.Mount.GetCount( "s" ) > 0 then
--		ArkInventory.OutputDebug( "fallback - using surface" )
--		helper_companionTable_update( ArkInventory.Collection.Mount.GetUsable( "s" ) )
--		return "s"
--	end
	
	if ArkInventory.Collection.Mount.GetCount( "a" ) > 0 then
		ArkInventory.OutputDebug( "fallback - using flying" )
		helper_companionTable_update( ArkInventory.Collection.Mount.GetUsable( "a" ) )
		return "a"
	end
	
	if ArkInventory.Collection.Mount.GetCount( "u" ) > 0 then
		ArkInventory.OutputDebug( "fallback - underwater" )
		helper_companionTable_update( ArkInventory.Collection.Mount.GetUsable( "u" ) )
		return "u"
	end
	
end

function ArkInventory.LDB.Mounts.GetNext( )
	
	ArkInventory.OutputDebug( "----- get next mount -----" )
	
	ArkInventory.SetMountMacro( )
	
	local c, r = ArkInventory.CheckPlayerHasControl( )
	if not c then
		-- you cant mount while you are not in control
		ArkInventory.Output( r )
		return
	end
	
	if IsIndoors( ) then
		-- you shouldnt be able to mount here at all
		ArkInventory.Output( ArkInventory.Localise["LDB_MOUNTS_FAIL_NOT_ALLOWED"] )
		return
	end
	
	local codex = ArkInventory.GetPlayerCodex( )
	
	if IsMounted( ) then
		
		if IsFlying( ) then
			if not codex.player.data.ldb.mounts.type.a.dismount then
				ArkInventory.OutputWarning( ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT_WARNING"] )
				return
			end
		end
		
		ArkInventory.Collection.Mount.Dismiss( )
		
		return
		
	end
	
	if InCombatLockdown( ) or IsFlying( ) or not ArkInventory.Collection.Mount.IsReady( ) then return end
	
	
	if ArkInventory.Collection.Mount.GetCount( ) == 0 then
		--ArkInventory.Output( "you don't own any mounts" )
		return
	end
	
	local forceAlternative = IsModifiedClick( "CHATLINK" )
	ArkInventory.OutputDebug( "forceAlternative = ", forceAlternative )
	local forceDragonridingAlternative = IsModifiedClick( "DRESSUP" )
	ArkInventory.OutputDebug( "forceDragonridingAlternative = ", forceAlternative )
	
	ArkInventory.LDB.Mounts.GetUsable( forceAlternative, forceDragonridingAlternative )
	
	ArkInventory.OutputDebug( #companionTable, " usable mounts", companionTable )
	
	if #companionTable == 0 then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["NONE_USABLE"], ArkInventory.Localise["MOUNTS"] ) )
		return
		
	else
		
		local userandom = codex.player.data.ldb.mounts.randomise
		
		if #companionTable <= 3 then
			userandom = false
		end
		
		if userandom then
			-- random
			ArkInventory.LDB.Mounts.next = random( 1, #companionTable )
		else
			-- cycle
			ArkInventory.LDB.Mounts.next = ArkInventory.LDB.Mounts.next + 1
			if ArkInventory.LDB.Mounts.next > #companionTable then
				ArkInventory.LDB.Mounts.next = 1
			end
		end
		
		local i = companionTable[ArkInventory.LDB.Mounts.next]
		--local md = ArkInventory.Collection.Mount.GetMount( i )
		--ArkInventory.Output( "use mount ", i, ": ", md.link, " ", ArkInventory.LDB.Mounts.next, " / ", #companionTable, " / usable=", (IsUsableSpell( md.spellID )), " / flight=", IsFlyableArea( ) )
		ArkInventory.Collection.Mount.Summon( i )
	end
	
end

function ArkInventory.LDB.Mounts:Update( )
	
	local loc_id = ArkInventory.Const.Location.Mount
	
	local icon = string.format( "|T%s:0|t", ArkInventory.Global.Location[loc_id].Texture )
	local hasText
	
	if ArkInventory.isLocationMonitored( loc_id ) then
		if ArkInventory.Collection.Mount.IsReady( ) then
			ArkInventory.LDB.Mounts.Cleanup( )
		else
			ArkInventory:SendMessage( "EVENT_ARKINV_LDB_MOUNT_UPDATE_BUCKET" )
		end
	end
	
	if hasText then
		self.text = string.trim( hasText )
	else
		self.text = icon
	end
	
end

function ArkInventory.LDB.Mounts:OnTooltipShow( ... )
	
	local loc_id = ArkInventory.Const.Location.Mount
	
	if ArkInventory.isLocationMonitored( loc_id ) then
		
		self:AddDoubleLine( ArkInventory.Localise["MODE"], ArkInventory.Localise["MOUNT"] )
		self:AddLine( " " )
		
		if ArkInventory.Collection.Mount.IsReady( ) then
			
			local codex = ArkInventory.GetPlayerCodex( )
			
			ArkInventory.Collection.Mount.UpdateUsable( codex.player.data.ldb.mounts.dragonriding )
			
			for mta in pairs( ArkInventory.Const.Mount.Types ) do
				
				local mode = ArkInventory.Localise[string.upper( string.format( "LDB_MOUNTS_TYPE_%s", mta ) )]
				local numusable, numtotal = ArkInventory.Collection.Mount.GetCount( mta )
				
				--ArkInventory.Output( mta, " / ", mode, " / ", numusable, " / ", numtotal )
				
				if mta ~= "x" then
					
					if numtotal == 0 then
						
						self:AddDoubleLine( mode, ArkInventory.Localise["NONE"], 1, 1, 1, 1, 0, 0 )
						
					else
						
						local selected = codex.player.data.ldb.mounts.type[mta].selected
						local numselected = 0
						for k, v in pairs( selected ) do
							if v == true then
								numselected = numselected + 1
							end
						end
						
						if codex.player.data.ldb.mounts.type[mta].useall then
							
							self:AddDoubleLine( mode, string.format( "%s (%s)", ArkInventory.Localise["ALL"], numtotal ), 1, 1, 1, 1, 1, 1 )
							
						elseif numselected == 0 then
							
							self:AddDoubleLine( mode, ArkInventory.Localise["NONE"], 1, 1, 1, 1, 1, 1 )
							
						elseif numselected == 1 then
							
							-- just the one selected, there may be ignored but they dont matter
							for k, v in pairs( selected ) do
								if v then
									local name = ArkInventory.CrossClient.GetSpellInfo( k ).name
									self:AddDoubleLine( mode, string.format( "%s: %s", ArkInventory.Localise["SELECTION"], name ), 1, 1, 1, 1, 1, 1 )
								end
							end
							
						else
							
							-- more than one selected, there may be ignored but they dont matter
							self:AddDoubleLine( mode, string.format( "%s (%s/%s)", ArkInventory.Localise["SELECTION"], numselected, numtotal ), 1, 1, 1, 1, 1, 1 )
							
						end
						
					end
					
				end
				
			end
			
		else
			self:AddLine( string.format( ArkInventory.Localise["LDB_LOCATION_NOT_READY"], ArkInventory.Global.Location[loc_id].Name ), 1, 0, 0 )
		end
	else
		self:AddLine( string.format( ArkInventory.Localise["LDB_LOCATION_NOT_MONITORED"], ArkInventory.Global.Location[loc_id].Name ), 1, 0, 0 )
	end
	
	self:Show( )
	
end

function ArkInventory.LDB.Mounts:OnClick( button, down )
	
	local loc_id = ArkInventory.Const.Location.Mount
	
	if not ArkInventory.isLocationMonitored( loc_id ) then
		ArkInventory.OutputWarning( "location is not monitored" )
		return
	end
	
	if not ArkInventory.Collection.Mount.IsReady( ) then
		ArkInventory.OutputWarning( "location is not ready" )
		return
	end
	
	
	if button == "RightButton" then
		
		--ArkInventory.MenuLDBMountsOpen( self )
		ArkInventory.Frame_Config_Show( "advanced", "ldb", "mounts" )
		
	else
		
		ArkInventory.LDB.Mounts.GetNext( )
		
	end
	
end
