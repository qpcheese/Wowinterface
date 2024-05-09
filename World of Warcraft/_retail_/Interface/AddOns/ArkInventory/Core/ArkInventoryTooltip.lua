local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table

-- stuff to look at later? maybe
-- BattlePetTooltipTemplate_AddTextLine

local DragonFlightTooltips = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.DRAGONFLIGHT )

local MissingFunctions = { }

local supportedHyperlinkClass = {
	["item"] = true,
	["spell"] = true,
	["currency"] = true,
	["reputation"] = true,
	["battlepet"] = true,
	["keystone"] = true,
	["enchant"] = true,
}

ArkInventory.Const.BLIZZARD.TooltipFunctions = {
	
	-- function name = true|false to load
	-- FIX ME, work out the correct expansions for these (currently being ignored)
	
	["SetText"] = true,
	["ClearLines"] = true,
	["FadeOut"] = true,
	
	["SetItemKey"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.CATACLYSM ), -- FIX ME
	["SetAuctionItem"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.CLASSIC ), -- FIX ME
	["SetAuctionSellItem"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.CLASSIC ), -- FIX ME
	["SetBagItem"] = true,
	["SetBackpackToken"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.TBC ), -- FIX ME
	["SetBuybackItem"] = true,
	["SetCurrencyByID"] = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Currency].ClientCheck ),
	["SetCurrencyToken"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.TBC ), -- FIX ME
	["SetCurrencyTokenByID"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.TBC ), -- FIX ME
	["SetCompanionPet"] = true, -- FIX ME
	["SetCraftItem"] = ArkInventory.ClientCheck( nil, ArkInventory.ENUM.EXPANSION.SHADOWLANDS ), -- FIX ME
	["SetCraftSpell"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.CLASSIC ), -- FIX ME
	["SetGuildBankItem"] = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].ClientCheck ),
	["SetHeirloomByItemID"] = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Heirloom].ClientCheck ),
	["SetHyperlink"] = true,
	["SetInboxItem"] = true,
	["SetInventoryItem"] = true,
	["SetItemByGUID"] = true,
	["SetItemByID"] = true,
	["SetLootCurrency"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.TBC ), -- FIX ME
	["SetLootItem"] = true,
	["SetLootRollItem"] = true,
	["SetMerchantItem"] = true,
	["SetMerchantCostItem"] = true,
	["SetQuestCurrency"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.TBC ), -- FIX ME
	["SetQuestItem"] = true,
	["SetQuestLogCurrency"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.TBC ), -- FIX ME
	["SetQuestLogItem"] = true,
--	["SetQuestLogRewardSpell"] = true, -- seems pointless tracking a spell when i cant track it back to something
	["SetQuestLogSpecialItem"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.TBC ), -- FIX ME
--	["SetQuestRewardSpell"] = true, -- seems pointless tracking a spell when i cant track it back to something
	["SetRecipeReagentItem"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.CATACLYSM ), -- FIX ME
	["SetRecipeResultItem"] = ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.CATACLYSM ), -- FIX ME
	["SetSendMailItem"] = true,
	["SetToyByItemID"] = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Toybox].ClientCheck ),
	["SetTradePlayerItem"] = true,
	["SetTradeSkillItem"] = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Tradeskill].ClientCheck ),
	["SetTradeTargetItem"] = true,
--	["SetUnit"] = true, --  > conflicts with OnSetUnit, do NOT use
	["SetVoidItem"] = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Void].ClientCheck ),
	["SetVoidDepositItem"] = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Void].ClientCheck ),
	["SetVoidWithdrawalItem"] = ArkInventory.ClientCheck( ArkInventory.Global.Location[ArkInventory.Const.Location.Void].ClientCheck ),
	
}

if ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.DRAGONFLIGHT ) then
	ArkInventory.Const.BLIZZARD.TooltipFunctions = {
		["SetText"] = true,
		["ClearLines"] = true,
		["FadeOut"] = true,
	}
end


function ArkInventory.TooltipTextToNumber( v )
	if type( v ) == "number" then
		return v
	elseif type( v ) == "string" then
		local sep = string.gsub( LARGE_NUMBER_SEPERATOR, ".", "%%%1" )
		--ArkInventory.Output("LARGE_NUMBER_SEPERATOR=[", LARGE_NUMBER_SEPERATOR, "] [", sep, "]")
		return tonumber( ( string.gsub( v, sep, "" ) ) )
	end
end

function ArkInventory.GameTooltipHide( )
	--GameTooltip:ClearLines( )
	GameTooltip:Hide( )
end

function ArkInventory.GameTooltipSetPosition( frame, bottom )
	
	local frame = frame or UIParent
	GameTooltip:SetOwner( frame, "ANCHOR_NONE" )
	
	local anchorFromLeft = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2 < GetScreenWidth( ) / 2
	
	if frame == UIParent then
		GameTooltip:ClearAllPoints( )
		GameTooltip:SetAnchorType( "ANCHOR_BOTTOMRIGHT" )
	elseif bottom then
		if anchorFromLeft then
			GameTooltip:SetAnchorType( "ANCHOR_BOTTOMRIGHT" )
		else
			GameTooltip:SetAnchorType( "ANCHOR_BOTTOMLEFT" )
		end
	else
		if anchorFromLeft then
			GameTooltip:SetAnchorType( "ANCHOR_RIGHT" )
		else
			GameTooltip:SetAnchorType( "ANCHOR_LEFT" )
		end
	end
	
end

function ArkInventory.GameTooltipSetText( frame, txt, r, g, b, bottom )
	ArkInventory.GameTooltipSetPosition( frame, bottom )
	GameTooltip:SetText( txt or "<nil text - please fix>", r or 1, g or 1, b or 1, 1, true )
	GameTooltip:Show( )
end

function ArkInventory.GameTooltipSetHyperlink( frame, h )
	ArkInventory.GameTooltipSetPosition( frame )
	return ArkInventory.TooltipSet( GameTooltip, nil, nil, nil, h )
end


local function checkAbortShow( tooltip )
	
	if not tooltip then return true end
	if not tooltip.ARKTTD then return true end
	if not ArkInventory:IsEnabled( ) then return true end
	
	if not ArkInventory.db.option.tooltip.show then return true end
	
end

local function checkAbortItemCount( tooltip )
	
	if checkAbortShow( tooltip ) then return true end
	
	if not ArkInventory.db.option.tooltip.itemcount.enable then return true end
	
end

function ArkInventory.TooltipCleanText( txt )
	
	local txt = txt or ""
	
	if type( txt ) == "table" then
		ArkInventory.OutputWarning( "TooltipCleanText: txt was a table [", txt, "]" )
		return
	end
	
	txt = ArkInventory.StripColourCodes( txt )
	
	txt = txt:gsub( '"', "" )
	txt = txt:gsub( "'", "" )
	
	txt = string.gsub( txt, "\194\160", " " ) -- i dont remember what this is for
	
	txt = string.gsub( txt, "%s", " " )
	txt = string.gsub( txt, "|n", " " )
	txt = string.gsub( txt, "\n", " " )
	txt = string.gsub( txt, "\13", " " )
	txt = string.gsub( txt, "\10", " " )
	txt = string.gsub( txt, "  ", " " )
	
	txt = string.trim( txt )
	
	return txt
	
end

function ArkInventory.TooltipScanInit( name )
	
	local tooltip = _G[name]
	assert( tooltip, string.format( "XML Frame [%s] not found", name ) )
	
	ArkInventory.TooltipMyDataClear( tooltip )
	tooltip.ARKTTD.scan = true
	
	return tooltip
	
end

function ArkInventory.TooltipInfoUse( tooltip )
	if DragonFlightTooltips then
		if tooltip.ARKTTD.scan then
			return true
		end
	end
end

function ArkInventory.TooltipGetNumLines( tooltip )
	if ArkInventory.TooltipInfoUse( tooltip ) then
		if tooltip.ARKTTD.info and tooltip.ARKTTD.info.lines then
			return #tooltip.ARKTTD.info.lines
		else
			return 0
		end
	else
		return tooltip:NumLines( ) or 0
	end
end

local function helper_GetTooltipBattlePetValues( r, tooltipInfo, offset )
	
	if not r or not tooltipInfo or not offset then return end
	
	tooltipInfo.battlePetSpeciesID = r[offset + 0]
	tooltipInfo.battlePetLevel = r[offset + 1]
	tooltipInfo.battlePetBreedQuality = r[offset + 2]
	tooltipInfo.battlePetMaxHealth = r[offset + 3]
	tooltipInfo.battlePetPower = r[offset + 4]
	tooltipInfo.battlePetSpeed = r[offset + 5]
	tooltipInfo.battlePetName = r[offset + 6]
	tooltipInfo.battlePetGUID = r[offset + 7]
	
end

local function helper_TooltipSetHyperlink( tooltip, h )
	
	local tooltipInfo = { }
	
	if h then
		
		local osd = ArkInventory.ObjectStringDecode( h )
		
		tooltipInfo = ( C_TooltipInfo and C_TooltipInfo.GetHyperlink( h ) ) or tooltipInfo
		
		if osd.class == "battlepet" then
			
			if tooltip then
				ArkInventory.TooltipCustomBattlepetShow( tooltip, h )
			end
			
		elseif osd.class == "reputation" then
			
			if tooltip then
				ArkInventory.TooltipSetCustomReputation( tooltip, h )
			end
			
		elseif osd.class == "currency" then
			
			if tooltip then
				ArkInventory.CrossClient.TooltipSetCurrencyByID( tooltip, osd.id, osd.amount )
			end
			
		elseif osd.class == "copper" then
			
			if tooltip then
				SetTooltipMoney( tooltip, osd.amount )
				tooltip:Show( )
			end
			
		elseif osd.class == "empty" then
			
			tooltipInfo = { }
			
			if tooltip then
				tooltip:Hide( )
			end
			
		else
			
			if tooltip then
				
				local r = { tooltip:SetHyperlink( h ) }
				
				--tooltipInfo.hasItem = r[1]
				
				helper_GetTooltipBattlePetValues( r, tooltipInfo, 2 )
				
			end
			
		end
		
	end
	
	return tooltipInfo
	
end

local function helper_TooltipSetBagItem( tooltip, blizzard_id, slot_id )
	
	local tooltipInfo = { }
	
	tooltipInfo = ( C_TooltipInfo and C_TooltipInfo.GetBagItem( blizzard_id, slot_id ) ) or tooltipInfo
	
	if tooltip then
		
		local r = { tooltip:SetBagItem( blizzard_id, slot_id ) }
		
		tooltipInfo.hasCooldown = r[1]
		tooltipInfo.repairCost = r[2]
		
		helper_GetTooltipBattlePetValues( r, tooltipInfo, 3 )
		
	end
	
	return tooltipInfo
	
end

local function helper_TooltipSetInventoryItem( tooltip, inv_id )
	
	local tooltipInfo = { }
	
	tooltipInfo = ( C_TooltipInfo and C_TooltipInfo.GetInventoryItem( "player", inv_id ) ) or tooltipInfo
	
	if tooltip then
		
		local r = { tooltip:SetInventoryItem( "player", inv_id ) }
		
		tooltipInfo.hasItem = r[1]
		tooltipInfo.hasCooldown = r[2]
		tooltipInfo.repairCost = r[3]
		
		helper_GetTooltipBattlePetValues( r, tooltipInfo, 4 )
		
	end
	
	return tooltipInfo
	
end

local function helper_TooltipSetGuildBankItem( tooltip, tab_id, slot_id )
	
	local tooltipInfo = { }
	
	tooltipInfo = ( C_TooltipInfo and C_TooltipInfo.GetGuildBankItem( tab_id, slot_id ) ) or tooltipInfo
	
	if tooltip then
		
		local r = { tooltip:SetGuildBankItem( tab_id, slot_id ) }
		
		tooltipInfo.repairCost = r[1]
		
		helper_GetTooltipBattlePetValues( r, tooltipInfo, 2 )
		
	end
	
	return tooltipInfo
	
end

local function helper_TooltipSetMailboxItem( tooltip, msg_id, att_id )
	
	local tooltipInfo = { }
	
	tooltipInfo = ( C_TooltipInfo and C_TooltipInfo.GetInboxItem( msg_id, att_id ) ) or tooltipInfo
	
	if tooltip then
		
		local r = { tooltip:SetInboxItem( msg_id, att_id ) }
		
		--tooltipInfo.hyperlink = r[1]
		
		helper_GetTooltipBattlePetValues( r, tooltipInfo, 2 )
		
	end
	
	return tooltipInfo
	
end

local function helper_TooltipSetToyboxItem( tooltip, item_id )
	
	local tooltipInfo = { }
	
	tooltipInfo = ( C_TooltipInfo and C_TooltipInfo.GetToyByItemID( item_id ) ) or tooltipInfo
	
	if tooltip then
		
		tooltip:SetToyByItemID( item_id )
		
	end
	
	return tooltipInfo
	
end

local function helper_TooltipSetVoidItem( tooltip, bag_id, slot_id )
	
	local tooltipInfo = { }
	
	tooltipInfo = ( C_TooltipInfo and C_TooltipInfo.GetVoidItem( bag_id, slot_id ) ) or tooltipInfo
	
	if tooltip then
		
		local r = { tooltip:SetVoidItem( bag_id, slot_id ) }
		
		helper_GetTooltipBattlePetValues( r, tooltipInfo, 2 )
		
	end
	
	return tooltipInfo
	
end

function ArkInventory.TooltipSet( tooltip, loc_id, bag_id, slot_id, h, i )
	
	-- this is the only tooltip function that should be used
	-- where possible this will generate an online tooltip, but if that is not possible then a hyperlink based tooltip will be generated instead
	
	assert( tooltip, "code error: tooltip is nil" )
	
	tooltip:ClearLines( )
	
	local tooltipInfo = nil
	local tooltipSource = tooltip
	
	if h and not DragonFlightTooltips then
		-- handle caged battlepets in old clients
		-- its an item (pet cage) but blizzard will generate a battlepet hyperlink for it instead
		local osd = ArkInventory.ObjectStringDecode( h )
		if osd[1] == "battlepet" then
			
			ArkInventory.TooltipCustomBattlepetBuild( tooltip, h )
			
			helper_GetTooltipBattlePetValues( osd, tooltip.ARKTTD.info, 2 )
			
			return
--		elseif osd[1] == "item" and osd[2] == ArkInventory.Const.BLIZZARD.GLOBAL.PET.CAGE_ITEMID then
			--ArkInventory.Output( "scan caged = ", h )
			-- old game version, functions will handle rebuilding to battlepet hyperlink
		end
	end
	
	
	if ArkInventory.TooltipInfoUse( tooltip ) then
		tooltip = nil
	end
	
	if loc_id then
		
		if loc_id == ArkInventory.Const.Location.Bag then
			
			local blizzard_id = ArkInventory.InternalIdToBlizzardBagId( loc_id, bag_id )
			if blizzard_id and slot_id then
				tooltipInfo = helper_TooltipSetBagItem( tooltip, blizzard_id, slot_id )
			end
			
		elseif loc_id == ArkInventory.Const.Location.Bank and ArkInventory.Global.Mode.Bank then
			
			local blizzard_id = ArkInventory.InternalIdToBlizzardBagId( loc_id, bag_id )
			if blizzard_id == ArkInventory.ENUM.BAG.INDEX.BANK then
				
				local inv_id = BankButtonIDToInvSlotID( slot_id )
				if inv_id then
					tooltipInfo = helper_TooltipSetInventoryItem( tooltip, inv_id )
				end
				
			elseif blizzard_id == ArkInventory.ENUM.BAG.INDEX.REAGENTBANK then
				
				local inv_id = ReagentBankButtonIDToInvSlotID( slot_id )
				if inv_id then
					tooltipInfo = helper_TooltipSetInventoryItem( tooltip, inv_id )
				end
				
			else
				
				if blizzard_id and slot_id then
					tooltipInfo = helper_TooltipSetBagItem( tooltip, blizzard_id, slot_id )
				end
				
			end
			
		elseif loc_id == ArkInventory.Const.Location.Vault and ArkInventory.Global.Mode.Vault then
			
			if bag_id and slot_id then
				tooltipInfo = helper_TooltipSetGuildBankItem( tooltip, bag_id, slot_id )
			end
			
		elseif loc_id == ArkInventory.Const.Location.Mailbox and ArkInventory.Global.Mode.Mailbox then
			
			if bag_id and slot_id then
				tooltipInfo = helper_TooltipSetMailboxItem( tooltip, bag_id, slot_id )
			end
			
		elseif loc_id == ArkInventory.Const.Location.Wearing then
			
			local inv_id = GetInventorySlotInfo( ArkInventory.Const.InventorySlotName[slot_id] )
			if inv_id then
				tooltipInfo = helper_TooltipSetInventoryItem( tooltip, inv_id )
			end
			
		elseif loc_id == ArkInventory.Const.Location.Keyring then
			
			local inv_id = KeyRingButtonIDToInvSlotID( slot_id )
			if inv_id then
				tooltipInfo = helper_TooltipSetInventoryItem( tooltip, inv_id )
			end
			
		elseif loc_id == ArkInventory.Const.Location.Toybox then
			
			if i and i.item then
				tooltipInfo = helper_TooltipSetToyboxItem( tooltip, i.item )
			end
			
		elseif loc_id == ArkInventory.Const.Location.Void then
			
			if bag_id and slot_id then
				tooltipInfo = helper_TooltipSetVoidItem( tooltip, bag_id, slot_id )
			end
			
		elseif loc_id == ArkInventory.Const.Location.Tradeskill then
			
			local inv_id = GetInventorySlotInfo( ArkInventory.Const.InventorySlotName[slot_id] )
			if inv_id then
				tooltipInfo = helper_TooltipSetInventoryItem( tooltip, inv_id )
			end
			
		end
		
	end
	
	if h and not tooltipInfo then
		
		tooltipInfo = helper_TooltipSetHyperlink( tooltip, h )
		
	end
	
	if tooltipInfo then
		
		if DragonFlightTooltips then
			
			TooltipUtil.SurfaceArgs( tooltipInfo )
			tooltipInfo.args = nil
			
			if tooltipInfo.lines then
				for k, line in ipairs( tooltipInfo.lines ) do
					TooltipUtil.SurfaceArgs( line )
					line.args = nil
				end
			end
			
		end
		
		if tooltipInfo and tooltipInfo.battlePetSpeciesID and tooltipInfo.battlePetSpeciesID > 0 then
			tooltipInfo.hyperlink = tooltipInfo.hyperlink or ArkInventory.BattlepetBaseHyperlink( tooltipInfo.battlePetSpeciesID, tooltipInfo.battlePetLevel, tooltipInfo.battlePetBreedQuality, tooltipInfo.battlePetMaxHealth, tooltipInfo.battlePetPower, tooltipInfo.battlePetSpeed, tooltipInfo.battlePetName )
			ArkInventory.TooltipCustomBattlepetBuild( tooltip, tooltipInfo.hyperlink )
		end
		
	end
	
	tooltipSource.ARKTTD.info = tooltipInfo
	return tooltipInfo
	
end

function ArkInventory.TooltipSetCustomReputation( tooltip, h )
	
	if checkAbortShow( tooltip ) then return true end
	
	if not h then return end
	
	local osd = ArkInventory.ObjectStringDecode( h )
	
	if osd.class ~= "reputation" then return end
	
	tooltip:ClearLines( )
	
	local data = ArkInventory.Collection.Reputation.GetByID( osd.id )
	if not data then
		
		tooltip:AddLine( string.format( ArkInventory.Localise["UNKNOWN_OBJECT"], h ) )
		
	else
		
		tooltip:AddLine( data.name )
		
		if ArkInventory.db.option.tooltip.reputation.description and ( data.description and data.description ~= "" ) then
			tooltip:AddLine( data.description, 1, 1, 1, true )
		end
		
		tooltip:AddLine( " " )
		
		local style_default = ArkInventory.Const.Reputation.Style.TooltipNormal
		local style = style_default
		if ArkInventory.db.option.tooltip.reputation.custom ~= ArkInventory.Const.Reputation.Custom.Default then
			style = ArkInventory.db.option.tooltip.reputation.style.normal
			if string.trim( style ) == "" then
				style = style_default
			end
		end
		local txt = ArkInventory.Collection.Reputation.LevelText( osd.id, style )
		tooltip:AddDoubleLine( "", txt, 1, 1, 1, 1, 1, 1 )
		
	end
	
	tooltip:Show( )
	
	ArkInventory.TooltipAddItemCount( tooltip, h )
	
	ArkInventory.API.CustomReputationTooltipReady( tooltip, h )
	
	local fn = "TooltipSetCustomReputation"
	ArkInventory.TooltipMyDataSave( tooltip, fn, h )
	
end

function ArkInventory.TooltipAddCustomReputationToCharacterFrame( frame )
	--[[
	ignore for now
	
	ArkInventory.Output2( "onenter ", frame )
	ArkInventory.Output2( "friend=", frame.friendshipID )
	ArkInventory.Output2( "hasrep=", frame.hasRep )
	ArkInventory.Output2( "collapsed=", frame.isCollapsed )
	]]--
	
	--[[
	if not frame then return end
	
	if frame.LFGBonusRepButton and frame.LFGBonusRepButton.factionID then
		
		local id = frame.LFGBonusRepButton.factionID
		ArkInventory.Output2( "faction=", id )
		
		local frame = _G[frame:GetName( ) .. "ReputationBarRight"]
		ArkInventory.GameTooltipSetPosition( frame )
		
		ArkInventory.GameTooltipSetText( " " )
		GameTooltip:Show( )
		
		ArkInventory.TooltipSetCustomReputation( GameTooltip, string.format( "reputatation:%s", id ) )
		
	end
	]]--
	
end

function ArkInventory.TooltipCustomBattlepetAddDetail( tooltip, speciesID, h, i )
	
--	test = check custom pet toltip
--	test = check unit tooltip (target a battle pet)
--	checked ok = 
	
	--ArkInventory.Output( "TooltipCustomBattlepetAddDetail" )
	
	if not speciesID then return end
	
	local h = h or ( i and i.h ) or string.format( "battlepet:%s", speciesID )
	
	local sd = ArkInventory.Collection.Pet.GetSpeciesInfo( speciesID )
	if not sd then
		--ArkInventory.OutputWarning( "species data not found ", speciesID )
		return
	end
	if sd.isTrainer then
		-- this isnt a pet can obtain so no point checking if we have it
		return
	end
	
	ArkInventory.TooltipAddEmptyLine( tooltip )
	
	local numOwned, maxAllowed = C_PetJournal.GetNumCollectedInfo( speciesID )
	local info = ""
	
	if numOwned == 0 then
		info = ArkInventory.Localise["NOT_COLLECTED"]
	else
		local c = ""
		if numOwned == maxAllowed then
			c = RED_FONT_COLOR_CODE
		end
		info = string.format( "%s%s", c, string.format( ITEM_PET_KNOWN, numOwned, maxAllowed ) )
	end
	tooltip:AddLine( info )
	
	
	if checkAbortItemCount( tooltip ) then return end
	
	
	local tt = { }
	for _, pd in ArkInventory.Collection.Pet.Iterate( ) do
		if ( pd.sd.speciesID == speciesID ) then
			tt[#tt  + 1] = pd
		end
	end
	
	if ( i and numOwned > 1 ) or ( not i and numOwned > 0 ) then
		
		for k, pd in pairs( tt ) do
			
			info = ""
			
			if ArkInventory.Global.Mode.ColourBlind then
				info = string.format( "%s%s%s", info, _G[string.format( "ITEM_QUALITY%d_DESC", pd.quality )], "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:16:32:0:16|t" )
			else
				local qc = select( 5, ArkInventory.GetItemQualityColor( pd.quality ) )
				info = string.format( "%s%s%s|r%s", info, qc, _G[string.format( "ITEM_QUALITY%d_DESC", pd.quality )], "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:16:32:0:16|t" )
			end
			
			info = string.format( "%s  %s%s", info, pd.level, "|TInterface\\PetBattles\\BattleBar-AbilityBadge-Strong-Small:0|t" )
			
			if pd.sd.canBattle then
				
				local iconPetAlive = "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:16:32:16:32|t"
				local iconPetDead = "|TInterface\\Scenarios\\ScenarioIcon-Boss:0|t"
				if ( pd.health <= 0 ) then
					info = string.format( "%s  %.0f%s", info, pd.maxHealth, iconPetDead )
				else
					info = string.format( "%s  %.0f%s", info, pd.maxHealth, iconPetAlive )
				end
				
				info = string.format( "%s  %.0f%s", info, pd.power, "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:0:16:0:16|t" )
				info = string.format( "%s  %.0f%s", info, pd.speed, "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:0:16:16:32|t" )
				
				if pd.breed then
					info = string.format( "%s  %s", info, pd.breed )
				end
				
				if ( not i ) or ( i and i.guid ~= pd.guid ) then
					tooltip:AddLine( info )
				end
				
			end
			
		end
		
	end
	
	ArkInventory.TooltipAddItemCount( tooltip, h )
	
	ArkInventory.API.helper_CustomBattlePetTooltipReady( tooltip, h )
	
end

function ArkInventory.TooltipCustomBattlepetBuild( tooltip, h, i )
	
	if not tooltip then return true end
	if not ArkInventory:IsEnabled( ) then return true end
	if not h and not ( i and i.index ) then return end
	
--	test = check custom pet tooltip
--	checked ok = 
	
	--ArkInventory.Output2( "TooltipCustomBattlepetBuild: ", h )
	
	local pd = false
	local h = h
	
	if i and i.index then
		pd = ArkInventory.Collection.Pet.GetByID( i.index )
		h = pd.link
	end
	
	local osd = ArkInventory.ObjectStringDecode( h )
	if osd.class ~= "battlepet" then return end
	
	--ArkInventory.Output2( "[", osd.class, ":", osd.id, ":", osd.level, ":", osd.q, ":", osd.health, ":", osd.power, ":", osd.speed, ":", osd.cn, "]" )
	
	ArkInventory.Collection.Pet.GetSpeciesInfo( osd.id )
	local sd = ArkInventory.Collection.Pet.GetSpeciesInfo( osd.id )
	if not sd then
		--ArkInventory.OutputWarning( "no species data found for ", osd.id )
		return
	end
	
	local level = osd.level
	local quality = osd.q
	local health = osd.health
	local maxHealth = osd.health
	local power = osd.power
	local speed = osd.speed
	local name = sd.name
	local name2
	local breed = ""
	
	if pd then
		--ArkInventory.Output2( "using pet data ", pd )
		level = pd.level or level
		quality = pd.quality or quality
		health = pd.health or health
		maxHealth = pd.maxHealth or maxHealth
		power = pd.power or power
		speed = pd.speed or speed
		if pd.cn then
			name = pd.cn
			name2 = sd.name
		end
		breed = pd.breed or breed
	end
	
	local colour = select( 4, ArkInventory.GetItemQualityColor( quality ) )
	
	if sd.isTrainer then
		if sd.td then
			level = sd.td.level or level
			quality = sd.td.quality or quality
			colour = select( 4, ArkInventory.GetItemQualityColor( quality ) )
			health = sd.td.health or health
			maxHealth = sd.td.health or health
			power = sd.td.power or power
			speed = sd.td.speed or speed
			breed = sd.td.breed or breed
		else
			colour = sd.colour or colour
		end
		
	end
	
	colour = ArkInventory.CreateColour( colour )
	
	tooltip:ClearLines( )
	local txt1, txt2
	
	txt1 = string.format( "|T%s:32:32:-4:4:128:256:64:100:130:166|t %s", GetPetTypeTexture( sd.petType ), name )
	tooltip:AddLine( colour:WrapTextInColorCode( txt1 ) )
	
	if name2 then
		txt1 = string.format( "%s", name2 )
		tooltip:AddLine( colour:WrapTextInColorCode( txt1 ) )
		tooltip:AddLine( " " )
	end
	
	
	
	if ArkInventory.db.option.tooltip.battlepet.source then
		if sd.sourceText and sd.sourceText ~= "" then
			tooltip:AddLine( sd.sourceText, 1, 1, 1, true )
			tooltip:AddLine( " " )
		end
	end
	
	
	
	if ArkInventory.db.option.tooltip.battlepet.description and ( sd.description and sd.description ~= "" ) then
		tooltip:AddLine( sd.description, nil, nil, nil, true )
		tooltip:AddLine( " " )
	end
	
	
	
	txt1 = ArkInventory.Localise["TYPE"]
	txt2 = _G[string.format( "BATTLE_PET_NAME_%s", sd.petType )] or ArkInventory.Localise["UNKNOWN"]
	--txt2 = string.format( "%s |T%s:16:16:0:0:128:256:64:100:130:166|t", txt2, GetPetTypeTexture( sd.petType ) )
	tooltip:AddDoubleLine( txt1, txt2 )
	
	
	
	if level > 0 then
		
		
		txt1 = LEVEL
		txt2 = string.format( "%s %s", level, "|TInterface\\PetBattles\\BattleBar-AbilityBadge-Strong-Small:0|t" )
		if pd and pd.xp and pd.maxXp and pd.xp > 0 then
			
			local pc = math.floor( pd.xp / pd.maxXp * 100 )
			if pc < 1 then
				pc = 1
			elseif pc > 99 then
				pc = 99
			end
			
			txt1 = string.format( "%s (%d%%)", txt1, pc )
			
		end
		tooltip:AddDoubleLine( txt1, txt2 )
		
		
	end
		
		
		
	if sd.canBattle then
		
		
		if level > 0 then
			
			
			if health >= 0 then
				
				local iconPetAlive = "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:16:32:16:32|t"
				local iconPetDead = "|TInterface\\Scenarios\\ScenarioIcon-Boss:0|t"
				txt1 = PET_BATTLE_STAT_HEALTH
				txt2 = string.format( "%s %s", maxHealth, iconPetAlive )
				
				if health <= 0 then
					
					txt1 = string.format( "%s (%s)", txt1, DEAD )
					txt2 = string.format( "%s %s", maxHealth, iconPetDead )
					
				else
					
					if health ~= maxHealth then
						
						local pc = math.floor( health / maxHealth * 100 )
						if pc < 1 then
							pc = 1
						elseif pc > 99 then
							pc = 99
						end
						
						txt1 = string.format( "%s (%d%%)", txt1, pc )
						
					end
					
				end
				tooltip:AddDoubleLine( txt1, txt2 )
				
			end
			
			
			if power >= 0 then
				-- |TTexturePath:size1:size2:offset-x:offset-y:original-size-x:original-size-y:crop-x1:crop-x2:crop-y1:crop-y2|t
				tooltip:AddDoubleLine( PET_BATTLE_STAT_POWER, string.format( "%s %s", power, "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:0:16:0:16|t" ) )
			end
			
			
			if speed >= 0 then
				tooltip:AddDoubleLine( PET_BATTLE_STAT_SPEED, string.format( "%s %s", speed, "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:0:16:16:32|t" ) )
			end
			
			
			if quality >= 0 then
				-- ignore the -1, those will be from other peoples links and we cant get at that data
				txt1 = PET_BATTLE_STAT_QUALITY
				txt2 = "|TInterface\\PetBattles\\PetBattle-StatIcons:0:0:0:0:32:32:16:32:0:16|t"
				if ArkInventory.Global.Mode.ColourBlind then
					txt2 = string.format( "%s %s", _G[string.format( "ITEM_QUALITY%d_DESC", quality )], txt2 )
				else
					txt2 = string.format( "%s %s", colour:WrapTextInColorCode( _G[string.format( "ITEM_QUALITY%d_DESC", quality )] ), txt2 )
				end
				tooltip:AddDoubleLine( txt1, txt2 )
			end
			
			
		end
		
		
	elseif not sd.isTrainer then
		
		tooltip:AddLine( ArkInventory.Localise["PET_CANNOT_BATTLE"], RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, true )
		
	end
	
	
	
	if not sd.isTrainer then
		
		if not sd.unique or not sd.isTradable then
			tooltip:AddLine( " " )
		end
		
		if sd.unique then
			tooltip:AddLine( ITEM_UNIQUE, WHITE_FONT_COLOR.r, WHITE_FONT_COLOR.g, WHITE_FONT_COLOR.b, true )
		end
		
		if not sd.isTradable then
			tooltip:AddLine( BATTLE_PET_NOT_TRADABLE, RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b, true )
		end
		
	end
	
end

function ArkInventory.TooltipCustomBattlepetShow( tooltip, h, i )
	
	if checkAbortShow( tooltip ) then return true end
	
	if not h then return end
	
	--ArkInventory.Output( "TooltipCustomBattlepetShow" )
	
	ArkInventory.TooltipMyDataClear( tooltip )
	
	-- mouseover pet items, and clicking on pet links
	-- unit mouseover tooltip for wild and player pets is done at HookOnTooltipSetUnit, not here
	
	local osd = ArkInventory.ObjectStringDecode( h )
	
	if osd.class ~= "battlepet" then return end
	
	--ArkInventory.Output( "[", osd.class, " : ", osd.id, " : ", osd.level, " : ", osd.q, " : ", osd.health, " : ", osd.power, " : ", osd.speed, "]" )
	
	if not ArkInventory.db.option.tooltip.battlepet.enable then
		return BattlePetToolTip_Show( osd.id, osd.level, osd.q, osd.health, osd.power, osd.speed, osd.cn )
	end
	
	local sd = ArkInventory.Collection.Pet.GetSpeciesInfo( osd.id )
	if not sd then
		--ArkInventory.OutputWarning( "no species data found for ", osd.id )
		return
	end
	
	ArkInventory.TooltipCustomBattlepetBuild( tooltip, h, i )
	
	tooltip:Show( )
	
	ArkInventory.TooltipCustomBattlepetAddDetail( tooltip, osd.id, h, i )
	
end

function ArkInventory.HookBattlePetToolTip_Show( ... )
	
	-- BattlePetToolTip_Show(speciesID, level, breedQuality, maxHealth, power, speed, customName)
	
	if not ArkInventory:IsEnabled( ) then return end
	if not ArkInventory.db.option.tooltip.show then return end
	if not ArkInventory.db.option.tooltip.battlepet.enable then return end
	
--	ArkInventory.Output2( "HookBattlePetToolTip_Show" )
	
	BattlePetTooltip:Hide( )
	
	local h = ArkInventory.BattlepetBaseHyperlink( ... )
	if h then
		
		-- anchor gametooltip to whatever originally called it
		ArkInventory.GameTooltipSetPosition( GetMouseFocus( ) )
		ArkInventory.TooltipCustomBattlepetShow( GameTooltip, h )
		
	end
	
end




function ArkInventory.TooltipGetMoneyFrame( tooltip )
	
	return _G[string.format( "%s%s", tooltip:GetName( ), "MoneyFrame1" )]
	
end


function ArkInventory.TooltipGetLine( tooltip, i )
	
	assert( i, "line number is missing" )
	
	if not i or i < 1 or i > ArkInventory.TooltipGetNumLines( tooltip ) then
		return "", "", "", ""
	end
	
	local obj, leftText, rightText, leftTextClean, rightTextClean, leftColor, rightColor, line, r, g, b, a
	
	if ArkInventory.TooltipInfoUse( tooltip ) then
		
		if tooltip.ARKTTD.info and tooltip.ARKTTD.info.lines then
			
			line = tooltip.ARKTTD.info.lines[i]
			
			if line then
				
				if line.leftText then
					leftColor = line.leftColor
					leftTextClean = ArkInventory.TooltipCleanText( line.leftText )
					leftText = leftColor:WrapTextInColorCode( line.leftText )
				end
				
				if line.rightText then
					rightColor = line.rightColor
					rightTextClean = ArkInventory.TooltipCleanText( line.rightText )
					rightText = rightColor:WrapTextInColorCode( line.rightText )
				end
				
			end
			
		end
		
	else
		
		tooltipName = tooltip:GetName( )
		
		obj = _G[string.format( "%s%s%s", tooltipName, "TextLeft", i )]
		if obj and obj:IsShown( ) then
			leftText = obj:GetText( )
			leftTextClean = ArkInventory.TooltipCleanText( leftText )
			leftColor = CreateColor( obj:GetTextColor( ) )
		end
		
		obj = _G[string.format( "%s%s%s", tooltipName, "TextRight", i )]
		if obj and obj:IsShown( ) then
			rightText = obj:GetText( )
			rightTextClean = ArkInventory.TooltipCleanText( rightText )
			rightColor = CreateColor( obj:GetTextColor( ) )
		end
	
	end
	
	return leftText or "", rightText or "", leftTextClean or "", rightTextClean or "", leftColor, rightColor, line
	
end

function ArkInventory.TooltipGetBaseStats( tooltip, activeonly )
	
	local started = false
	local rv = ""
	local leftText, rightText, leftTextClean, rightTextClean, leftColor, rightColor, line
	local c
	
	for i = 2, ArkInventory.TooltipGetNumLines( tooltip ) do
		
		leftText, rightText, leftTextClean, rightTextClean, leftColor, rightColor, line = ArkInventory.TooltipGetLine( tooltip, i )
		
		local basestat = false
		if string.find( leftTextClean, "^%+?[%d,.]+ [%a ]+$" ) then
			--ArkInventory.OutputDebug( "1 - ", leftTextClean )
			basestat = true
		end
		
		if started and ( leftText == "" or string.find( leftText, "^\10" ) or string.find( leftText, "^\n" ) or string.find( leftText, "^|n" ) or not basestat ) then
			--ArkInventory.OutputDebug( "X - ", leftTextClean )
			--ArkInventory.OutputDebug( "rv = ", rv )
			return rv
		end
		
		if basestat then
			
			started = true
			
			if activeonly then
				c = leftColor and leftColor:GenerateHexColor( )
				--ArkInventory.OutputDebug( string.format( "%04i = %s %s", i, c, leftText ) )
				if not ( c == "ff808080" or c == "7f7f7f" ) then
					--ArkInventory.OutputDebug( "A - ", leftTextClean )
					rv = string.format( "%s %s", rv, leftTextClean )
				end
			else
				--ArkInventory.OutputDebug( "X - ", leftTextClean )
				rv = string.format( "%s %s", rv, leftTextClean )
			end
			
		end
		
		--ArkInventory.OutputDebug( "Z - ", leftTextClean )
		
	end
	
	--ArkInventory.OutputDebug( "rv = ", rv )
	return rv
	
	-- /run ArkInventory.TooltipGetBaseStats( GameTooltip )
	-- /run ArkInventory.TooltipGetBaseStats( GameTooltip, true )
	
end

local function helper_IgnoredText( txt )
	
	-- what text can be ignored when jumping over an item
	
	if txt == "" then
		return true
	elseif txt == ArkInventory.Localise["ITEM_SOCKETABLE"] then
		return true
	elseif txt == ArkInventory.Localise["ITEM_APPEARANCE_KNOWN"] or txt == ArkInventory.Localise["ITEM_APPEARANCE_UNKNOWN"] then
		return true
	end
	
	
	return false
	
end

function helper_TooltipJumpEmbeddedItem( tooltip, start )
	
	-- to jump over the embedded item in a recipe
	
	-- start from the last line and work your way back up looking for an empty line.  return that line number if found
	
	local n = ArkInventory.TooltipGetNumLines( tooltip )
	local valid = false
	local restart = false
	
--	for i = 2, n do
--		local leftText, rightText, leftTextClean, rightTextClean, leftColor, rightColor = ArkInventory.TooltipGetLine( tooltip, i )
--		ArkInventory.OutputDebug( "jump - line [", i, "]=[", leftText, "]" )
--	end
	
	for i = n, start, -1 do
		
		local leftText, rightText, leftTextClean, rightTextClean, leftColor, rightColor = ArkInventory.TooltipGetLine( tooltip, i )
		if leftTextClean then
			
			--ArkInventory.OutputDebug( "jump - line [", i, "]=[", leftText, "]" )
			
			if helper_IgnoredText( leftTextClean ) then
				
				--ArkInventory.OutputDebug( "ignored: ", leftTextClean )
				
			else
				
				if leftTextClean == "" or string.find( leftText, "^\10" ) or string.find( leftText, "^\n" ) or string.find( leftText, "^|n" ) then
					if valid then
						restart = true
					end
				else
					valid = true
				end
				
				if restart or string.find( leftTextClean, USE_COLON ) then
					--ArkInventory.OutputDebug( "embedded item found between ", start, " and ", i )
					return i
				end
				
			end
			
		end
		
	end
	
	--ArkInventory.OutputDebug( "nothing found keep going from [", start, "]" )
	return
	
end

function ArkInventory.TooltipMatch( tooltip, start, matchPattern, IgnoreLeft, IgnoreRight, CaseSensitive, maxDepth, searchMode )
	
	local matchPattern = ArkInventory.TooltipCleanText( matchPattern )
	if matchPattern == "" then
		return
	end
	
	local n = ArkInventory.TooltipGetNumLines( tooltip )
	local newscan = not start -- only allow one jump per pass
	local start = start or 2
	local restart
	
	local IgnoreLeft = IgnoreLeft or false
	local IgnoreRight = IgnoreRight or false
	local CaseSensitive = CaseSensitive or false
	local maxDepth = maxDepth or 0
	local searchMode = searchMode or ArkInventory.Const.Tooltip.Search.Full
	
	if not CaseSensitive then
		matchPattern = string.lower( matchPattern )
	end
	
	local obj, txt
	
	for i = start, n do
		
		if maxDepth > 0 and i > maxDepth then return end
		
		local leftText, rightText, leftTextClean, rightTextClean, leftColor, rightColor = ArkInventory.TooltipGetLine( tooltip, i )
		
		if searchMode > ArkInventory.Const.Tooltip.Search.Full then
			if leftTextClean == "" or string.find( leftText, "^\10" ) or string.find( leftText, "^\n" ) or string.find( leftText, "^|n" ) then
				if searchMode == ArkInventory.Const.Tooltip.Search.Base then
					restart = helper_TooltipJumpEmbeddedItem( tooltip, i + 1 )
					if restart then
						return ArkInventory.TooltipMatch( tooltip, restart, matchPattern, IgnoreLeft, IgnoreRight, CaseSensitive, maxDepth, searchMode )
					end
				elseif searchMode == ArkInventory.Const.Tooltip.Search.Short then
					return
				end
			end
		end
		
		if not IgnoreLeft then
			
			if not CaseSensitive then
				leftTextClean = string.lower( leftTextClean )
			end
			
			local tbl = { string.match( leftTextClean, matchPattern ) }
			if #tbl > 0 then
				return unpack( tbl )
			end
			
		end
		
		if not IgnoreRight then
			
			if not CaseSensitive then
				rightTextClean = string.lower( rightTextClean )
			end
			
			local tbl = { string.match( rightTextClean, matchPattern ) }
			if #tbl > 0 then
				return unpack( tbl )
			end
			
		end
		
	end
	
end

function ArkInventory.TooltipContains( tooltip, start, TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive, searchMode )
	
	if ArkInventory.TooltipMatch( tooltip, start, TextToFind, IgnoreLeft, IgnoreRight, CaseSensitive, 0, searchMode ) then
		return true
	else
		return false
	end
	
end

local function helper_AcceptableRedText( txt, ignore_known, ignore_level )
	
	-- what red text is allowed to exist
	
	if txt == ArkInventory.Localise["ALREADY_KNOWN"] then
		--ArkInventory.Output( "ALREADY_KNOWN" )
		if ignore_known then
			return true
		else
			return false
		end
	elseif txt == ArkInventory.Localise["DURABILITY"] then
		--ArkInventory.Output2( "DURABILITY" )
		return true
	elseif string.match( txt, ArkInventory.Localise["WOW_TOOLTIP_DURABLITY"] ) then
		--ArkInventory.Output2( "WOW_TOOLTIP_DURABLITY" )
		return true
	elseif txt == ArkInventory.Localise["ITEM_CANNOT_DISENCHANT"] then
		return true
	elseif txt == ArkInventory.Localise["ITEM_CANNOT_OBLITERATE"] then
		return true
	elseif txt == ArkInventory.Localise["ITEM_CANNOT_SCRAP"] then
		return true
	elseif txt == ArkInventory.Localise["ITEM_WRONG_ZONE"] then
		return true
--	elseif txt == ArkInventory.Localise["LEVEL_LINKED_NOT_USABLE"] then
--		return true
--	elseif txt == ArkInventory.Localise["PREVIOUS_RANK_UNKNOWN"] then
--		return true
	elseif txt == ArkInventory.Localise["WOW_TOOLTIP_RETRIEVING_ITEM_INFO"] then
		return true
	elseif txt == ArkInventory.Localise["HEART_OF_AZEROTH_INACTIVE"] then
		return true
	elseif txt == ArkInventory.Localise["CANNOT_UNEQUIP_COMBAT"] then
		return true
	elseif txt == ArkInventory.Localise["CANNOT_UNEQUIP_ARENA"] then
		return true
	elseif txt == ArkInventory.Localise["CANNOT_UNEQUIP_MYTHIC_PLUS"] then
		return true
	elseif txt == ArkInventory.Localise["CANNOT_UNEQUIP_TORGHAST"] then
		return true
	elseif string.match( txt, ArkInventory.Localise["WOW_TOOLTIP_ITEM_REQUIRES_LEVEL"] ) then
		--ArkInventory.Output( "WOW_TOOLTIP_ITEM_REQUIRES_LEVEL" )
		if ignore_level then
			return true
		else
			return false
		end
	elseif string.match( txt, ArkInventory.Localise["EQUIP_COLON"] ) then
		return true
	end
	
	
	--ArkInventory.Output( "red text: ", txt )
	return false
	
end

function ArkInventory.TooltipCanUse( tooltip, start, ignore_known, ignore_level )
	
	-- /dump ArkInventory.TooltipCanUse( GameTooltip, nil, true )
	
	local n = ArkInventory.TooltipGetNumLines( tooltip )
	local newscan = not start -- only allow one jump per pass
	local start = start or 2
	local restart
	
	--ArkInventory.OutputDebug( "start=[", start, "] lines=[", n, "]" )
	for i = start, n do
		
		local leftText, rightText, leftTextClean, rightTextClean, leftColor, rightColor = ArkInventory.TooltipGetLine( tooltip, i )
		--ArkInventory.OutputDebug( i, " = [", leftTextClean, "] [", rightTextClean, "]" )
		
		if ( i < n ) and ( newscan ) and ( leftTextClean == "" or string.find( leftText, "^\10" ) or string.find( leftText, "^\n" ) or string.find( leftText, "^|n" ) ) then
			--ArkInventory.OutputDebug( "jump from line [", i, "]" )
			restart = helper_TooltipJumpEmbeddedItem( tooltip, i + 1 )
			if restart then
				return ArkInventory.TooltipCanUse( tooltip, restart, ignore_known, ignore_level )
			end
		end
		
		if leftColor and leftTextClean ~= "" then
			local c = leftColor:GenerateHexColor( )
			--ArkInventory.OutputDebug( "left [", i, "]=[", c, "]" )
			if ArkInventory.Const.BLIZZARD.GLOBAL.FONT.COLOR.UNUSABLE[c] then
				if not helper_AcceptableRedText( leftTextClean, ignore_known, ignore_level ) then
					--ArkInventory.OutputDebug( "unusable left [", i, "] ", leftText )
					return false
				end
			end
		end
		
		if rightColor and rightTextClean ~= "" then
			local c = rightColor:GenerateHexColor( )
			--ArkInventory.OutputDebug( "right [", i, "]=[", c, "]" )
			if ArkInventory.Const.BLIZZARD.GLOBAL.FONT.COLOR.UNUSABLE[c] then
				if not helper_AcceptableRedText( rightTextClean, ignore_known, ignore_level ) then
					--ArkInventory.OutputDebug( "unusable right [", i, "] ", rightText )
					return false
				end
			end
		end
		
	end
	
	return true
	
end

function ArkInventory.TooltipIsReady( tooltip )
	
	local numlines = ArkInventory.TooltipGetNumLines( tooltip )
	
	-- batllepet tooltip conversions generate a zero line tooltip
	if numlines == 0 then
		return true
	end
	
	-- normal tooltips will always have at least one line and it wont be red
	local leftText, rightText, leftTextClean, rightTextClean, leftColor, rightColor = ArkInventory.TooltipGetLine( tooltip, 1 )
	local c = leftColor and leftColor:GenerateHexColor( )
	if c and not ArkInventory.Const.BLIZZARD.GLOBAL.FONT.COLOR.UNUSABLE[c] then
		return true
	end
	
	if leftTextClean and not ( leftTextClean == "" or leftTextClean == ArkInventory.Localise["WOW_TOOLTIP_RETRIEVING_ITEM_INFO"] ) then
		return true
	end
	
	ArkInventory.OutputDebug( "tooltip not ready [", leftTextClean, "]" )
	
end


local function helper_CheckTooltipForItemOrSpell( tooltip )
	
	local h = nil
	
	-- check for an item
	if not h and tooltip["GetItem"] then
		--ArkInventory.Output2( "check item" )
		local name, link = tooltip:GetItem( )
		if link then
			h = link
			--ArkInventory.Output2( "ITEM [", string.gsub( h, "\124", "\124\124" ), "]" )
		end
	end
	
	-- check for a spell
	if not h and tooltip["GetSpell"] then
		--ArkInventory.Output2( "check spell" )
		local name, rank, id = tooltip:GetSpell( )
		if id then
			h = GetSpellLink( id )
			--ArkInventory.Output2( "SPELL [", string.gsub( h, "\124", "\124\124" ), "]" )
		end
	end
	
	return h
	
end


function ArkInventory.HookTooltipSetAuctionItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetAuctionItem", ... )
end

function ArkInventory.HookTooltipSetAuctionSellItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetAuctionSellItem", ... )
end

function ArkInventory.HookTooltipSetBackpackToken( ... )
	ArkInventory.HookTooltipSetGeneric( "SetBackpackToken", ... )
end

function ArkInventory.HookTooltipSetBagItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetBagItem", ... )
end

function ArkInventory.HookTooltipSetBuybackItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetBuybackItem", ... )
end

function ArkInventory.HookTooltipSetCraftItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetCraftItem", ... )
end

function ArkInventory.HookTooltipSetCraftSpell( ... )
	ArkInventory.HookTooltipSetGeneric( "SetCraftSpell", ... )
end

function ArkInventory.HookTooltipSetCurrencyByID( ... )
	ArkInventory.HookTooltipSetGeneric( "SetCurrencyByID", ... )
end

function ArkInventory.HookTooltipSetCurrencyToken( ... )
	ArkInventory.HookTooltipSetGeneric( "SetCurrencyToken", ... )
end

function ArkInventory.HookTooltipSetCurrencyTokenByID( ... )
	ArkInventory.HookTooltipSetGeneric( "SetCurrencyTokenByID", ... )
end

function ArkInventory.HookTooltipSetGuildBankItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetGuildBankItem", ... )
end

function ArkInventory.HookTooltipSetHeirloomByItemID( ... )
	ArkInventory.HookTooltipSetGeneric( "SetHeirloomByItemID", ... )
end

function ArkInventory.HookTooltipSetHyperlink( ... )
	ArkInventory.HookTooltipSetGeneric( "SetHyperlink", ... )
end

function ArkInventory.HookTooltipSetInboxItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetInboxItem", ... )
end

function ArkInventory.HookTooltipSetInventoryItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetInventoryItem", ... )
end

function ArkInventory.HookTooltipSetItemByGUID( ... )
	--ArkInventory.Output( "SetItemByGUID" )
	ArkInventory.HookTooltipSetGeneric( "SetItemByGUID", ... )
end

function ArkInventory.HookTooltipSetItemByID( ... )
	--ArkInventory.Output( "SetItemByID" )
	ArkInventory.HookTooltipSetGeneric( "SetItemByID", ... )
end

function ArkInventory.HookTooltipSetItemKey( ... )
	ArkInventory.HookTooltipSetGeneric( "SetItemKey", ... )
end

function ArkInventory.HookTooltipSetLootCurrency( ... )
	ArkInventory.HookTooltipSetGeneric( "SetLootCurrency", ... )
end

function ArkInventory.HookTooltipSetLootItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetLootItem", ... )
end

function ArkInventory.HookTooltipSetLootRollItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetLootRollItem", ... )
end

function ArkInventory.HookTooltipSetMerchantItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetMerchantItem", ... )
end

function ArkInventory.HookTooltipSetMerchantCostItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetMerchantCostItem", ... )
end

function ArkInventory.HookTooltipSetQuestCurrency( ... )
	ArkInventory.HookTooltipSetGeneric( "SetQuestCurrency", ... )
end

function ArkInventory.HookTooltipSetQuestItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetQuestItem", ... )
end

function ArkInventory.HookTooltipSetQuestLogCurrency( ... )
	ArkInventory.HookTooltipSetGeneric( "SetQuestLogCurrency", ... )
end

function ArkInventory.HookTooltipSetQuestLogItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetQuestLogItem", ... )
end

function ArkInventory.HookTooltipSetQuestLogRewardSpell( ... )
	ArkInventory.HookTooltipSetGeneric( "SetQuestLogRewardSpell", ... )
end

function ArkInventory.HookTooltipSetQuestRewardSpell( ... )
	ArkInventory.HookTooltipSetGeneric( "SetQuestRewardSpell", ... )
end

function ArkInventory.HookTooltipSetQuestLogSpecialItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetQuestLogSpecialItem", ... )
end

function ArkInventory.HookTooltipSetRecipeReagentItem( ... )
	--ArkInventory.Output( "SetRecipeReagentItem" )
	ArkInventory.HookTooltipSetGeneric( "SetRecipeReagentItem", ... )
end

function ArkInventory.HookTooltipSetRecipeResultItem( ... )
	--ArkInventory.Output( "SetRecipeResultItem" )
	ArkInventory.HookTooltipSetGeneric( "SetRecipeResultItem", ... )
end

function ArkInventory.HookTooltipSetRecipeRankInfo( ... )
	--ArkInventory.Output( "SetRecipeRankInfo" )
	ArkInventory.HookTooltipSetGeneric( "SetRecipeRankInfo", ... )
end



function ArkInventory.HookTooltipSetSendMailItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetSendMailItem", ... )
end

function ArkInventory.HookTooltipSetToyByItemID( ... )
	ArkInventory.HookTooltipSetGeneric( "SetToyByItemID", ... )
end

function ArkInventory.HookTooltipSetTradePlayerItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetTradePlayerItem", ... )
end

function ArkInventory.HookTooltipSetTradeSkillItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetTradeSkillItem", ... )
end

function ArkInventory.HookTooltipSetTradeTargetItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetTradeTargetItem", ... )
end

function ArkInventory.HookTooltipSetVoidDepositItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetVoidDepositItem", ... )
end

function ArkInventory.HookTooltipSetVoidItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetVoidItem", ... )
end

function ArkInventory.HookTooltipSetVoidWithdrawalItem( ... )
	ArkInventory.HookTooltipSetGeneric( "SetVoidWithdrawalItem", ... )
end



local function helper_CurrencyRepuationCheck( currencyID )
	--ArkInventory.Output2( "currencyID=", currencyID )
	if currencyID then
		local factionID = C_CurrencyInfo and C_CurrencyInfo.GetFactionGrantedByCurrency and C_CurrencyInfo.GetFactionGrantedByCurrency( currencyID )
		--ArkInventory.Output2( "factionID=", factionID )
		if factionID then
			-- its actually reputation
			local obj = ArkInventory.Collection.Reputation.GetByID( factionID )
			--ArkInventory.Output2( "faction=", obj )
			if obj then
				return obj.link
			end
		else
			-- its a normal currency
			local obj = ArkInventory.Collection.Currency.GetByID( currencyID )
			--ArkInventory.Output2( "currency=", obj )
			if obj then
				return obj.link
			end
		end
	end
end

function ArkInventory.TooltipValidateDataFromSetAuctionSellItem( tooltip, ... )
	return helper_CheckTooltipForItemOrSpell( tooltip )
end

function ArkInventory.TooltipValidateDataFromSetBagItem( tooltip, ... )
	return helper_CheckTooltipForItemOrSpell( tooltip )
end

function ArkInventory.TooltipValidateDataFromSetBackpackToken( tooltip, ... )
	
--	test = mouseover backpack token in the original UI
--	checked ok = 30936
	
	local arg1 = ...
	
	if arg1 then
		local info = ArkInventory.CrossClient.GetBackpackCurrencyInfo( arg1 )
		helper_CurrencyRepuationCheck( info and info.currencyTypesID )
	end
	
end

function ArkInventory.TooltipValidateDataFromSetBagItem( tooltip, ... )
	return helper_CheckTooltipForItemOrSpell( tooltip )
end

function ArkInventory.TooltipValidateDataFromSetBuybackItem( tooltip, ... )
	return helper_CheckTooltipForItemOrSpell( tooltip )
end

function ArkInventory.TooltipValidateDataFromSetCraftSpell( tooltip, ... )
	
--	fix later
	
--	test = 
--	checked ok = 30936
	
	--local arg1, arg2 = ...
	
	ArkInventory.Output2( "TooltipValidateDataFromSetCraftSpell" )
	
end

function ArkInventory.TooltipValidateDataFromSetCurrencyByID( tooltip, ... )
	
--	test = backpack currency tokens
--	test = check mission lists for currency/reputation reward
--	test = quest reward for reputation or currency
--	test = currency window
--	checked ok = 30936
	
	local arg1, arg2 = ... -- currencyID, amount
	return helper_CurrencyRepuationCheck( arg1 )
	
end

function ArkInventory.TooltipValidateDataFromSetCurrencyToken( tooltip, ... )
	
--	note - does not appear to be used in any way for reputation so we can skip that check here
	
--	test = the currency list on the character pane
--	checked ok = 
	
	local arg1, arg2 = ... -- index, amount
	if arg1 then
		return ArkInventory.CrossClient.GetCurrencyListLink( arg1, arg2 or 0 )
	end
	
end

function ArkInventory.TooltipValidateDataFromSetCurrencyTokenByID( tooltip, ... )
	
--	test = check mission table, war resources in top right hand corner
--	checked ok = 
	
	local arg1 = ... -- id
	return helper_CurrencyRepuationCheck( arg1 )
	
end

function ArkInventory.TooltipValidateDataFromSetHyperlink( tooltip, ... )
--	this is here to generically cover any hyperlinks that arent item or spell based
	
	local arg1 = ...
	local osd = ArkInventory.ObjectStringDecode( arg1 )
	--ArkInventory.Output2( osd.class, " / ", osd.h )
	if supportedHyperlinkClass[osd.class] then
		return arg1
	end
	
end

function ArkInventory.TooltipValidateDataFromSetInboxItem( tooltip, ... )
	return helper_CheckTooltipForItemOrSpell( tooltip )
end

function ArkInventory.TooltipValidateDataFromSetInventoryItem( tooltip, ... )
	return helper_CheckTooltipForItemOrSpell( tooltip )
end

function ArkInventory.TooltipValidateDataFromSetMerchantCostItem( tooltip, ... )
	
--	test = mouseover currency in merchant frame
--	checked ok = 30936
	
	local arg1, arg2 = ... -- index, currency
	
	if arg1 and arg2 then
		local itemTexture, itemValue, itemLink = GetMerchantItemCostItem( arg1, arg2 )
		return itemLink
	end
	
end

function ArkInventory.TooltipValidateDataFromSetQuestCurrency( tooltip, ... )
	
--	test = ?
--	checked ok = ?
	
	local arg1, arg2 = ...  --reward type, index
	if arg1 and arg2 then
		local currencyID = GetQuestCurrencyID( arg1, arg2 )
		return helper_CurrencyRepuationCheck( currencyID )
	end
	
end

function ArkInventory.TooltipValidateDataFromSetQuestLogCurrency( tooltip, ... )
	
--	test = quest reward that is a currency
--	test = quest reward that is a reputation
--	checked ok = ?
	
	local arg1, arg2 = ...  --reward type, index
	if arg1 and arg2 then
		local currencyID = GetQuestCurrencyID( arg1, arg2 )
		return helper_CurrencyRepuationCheck( currencyID )
	end
	
end

function ArkInventory.TooltipValidateDataFromSetQuestLogRewardSpell( tooltip, ... )
	return helper_CheckTooltipForItemOrSpell( tooltip )
end

function ArkInventory.TooltipValidateDataFromSetRecipeReagentItem( tooltip, ... )
	
	--ArkInventory.Output( "TooltipValidateDataFromSetRecipeReagentItem" )
	
--	test = any profession recipe reagent
--	checked ok = 31000
	
	local arg1, arg2 = ...  -- recipeID, slotIndex
	if arg1 and arg2 then
		if C_TradeSkillUI then
			
			--ArkInventory.Output( "SetRecipeReagentItem( ", arg1, ", ", arg2, ")" )
			
			if C_TradeSkillUI.GetRecipeReagentItemLink then
				return C_TradeSkillUI.GetRecipeReagentItemLink( arg1, arg2 )
			end
			
			-- dragonflight
			if C_TradeSkillUI.GetRecipeFixedReagentItemLink then
				return C_TradeSkillUI.GetRecipeFixedReagentItemLink( arg1, arg2 )
			end
			
		end
	end
	
end

function ArkInventory.TooltipValidateDataFromSetRecipeResultItem( tooltip, ... )
	
--	test = any profession recipe result
--	checked ok = 30936
	
	--ArkInventory.Output( "TooltipValidateDataFromSetRecipeResultItem" )
	
	local arg1 = ...
	if arg1 then
		--ArkInventory.Output( arg1  )
		if C_TradeSkillUI then
			if C_TradeSkillUI.GetRecipeItemLink then
				return C_TradeSkillUI.GetRecipeItemLink( arg1 )
			end
		end
	end
	
	-- dragonflight uses C_TradeSkillUI.SetTooltipRecipeResultItem
	
end

function ArkInventory.TooltipValidateDataFromSetSendMailItem( tooltip, ... )
	return helper_CheckTooltipForItemOrSpell( tooltip )
end

function ArkInventory.TooltipValidateDataFromSetTradeTargetItem( tooltip, ... )
	return helper_CheckTooltipForItemOrSpell( tooltip )
end

function ArkInventory.TooltipValidateDataFromSetLootCurrency( tooltip, ... )
	
	local arg1 = ...
	local texture, item, quantity, currencyID = GetLootSlotInfo( arg1 )
	return helper_CurrencyRepuationCheck( currencyID )
	
end

function ArkInventory.TooltipValidateDataFromSetLootItem( tooltip, ... )
	return helper_CheckTooltipForItemOrSpell( tooltip )
end

function ArkInventory.TooltipValidateDataFromSetToyByItemID( tooltip, ... )
	
--	test = blizzard toy collection
--	checked ok = 30936
	
	local arg1 = ... -- id
	if arg1 then
		return C_ToyBox.GetToyLink( arg1 )
	end
	
end



function ArkInventory.HookOnTooltipSetUnit( tooltip, ... )
	
--	this tooltip doesnt normally refresh
	
--	test = mouseover your active pet, or a wild battlepet
--	checked ok = 
	
	--ArkInventory.Output( "here1" )
	
	if not C_PetJournal then return end
	if not ArkInventory.db.option.tooltip.battlepet.enable then return end
	
	if checkAbortShow( tooltip ) then return true end
	
	local arg1, arg2, arg3, arg4, arg5 = ...
	--ArkInventory.Output( arg1, " / ", arg2, " / ", arg3, " / ", arg4, " / ", arg5 )
	
	-- reload previous critter
	if arg4 or arg5 then
		
		local unit = "mouseover"
		local h = arg4
		local i = arg5
		
		if unit and UnitExists( unit ) and UnitIsBattlePet( unit ) then
			
			ArkInventory.TooltipCustomBattlepetShow( tooltip, h, i )
			
			local fn = "HookOnTooltipSetUnit"
			ArkInventory.TooltipMyDataSave( tooltip, fn, false, false, unit, h, i )
			
		else
			
			tooltip:Hide( )
			
		end
		
		return
		
	end
	
	
	-- new critter set
	local name, unit = tooltip:GetUnit( )
	
	--ArkInventory.Output2( "unit=", unit )
	
	if unit and UnitExists( unit ) and UnitIsBattlePet( unit ) then
		
		--ArkInventory.Output2( unit, " is a battlebet" )
		
		local bpSpeciesID = UnitBattlePetSpeciesID( unit )
		
		local sd = ArkInventory.Collection.Pet.GetSpeciesInfo( bpSpeciesID )
		if not sd then
			--ArkInventory.OutputWarning( "no species data found for ", bpSpeciesID )
			return
		end
		
		if sd.isTrainer and not sd.colour then
			--ArkInventory.Output2( "unknown species ", bpSpeciesID, " found and data has been updated." )
			-- found an unlisted battlepet, probably a legendary or a trainer pet
			-- update species data with some helpful infomation
			
			-- battlepets have the name wrapped in their quality code, but the legendaries dont so fall back if needed
			local leftText, rightText, leftTextClean, rightTextClean, leftColor, rightColor = ArkInventory.TooltipGetLine( tooltip, 1 )
			sd.colour = ( leftColor and leftColor:GenerateHexColor( ) ) or ArkInventory.CreateColour( leftText )
		end
		
		local bpLevel = UnitBattlePetLevel( unit )
		local h = ArkInventory.BattlepetBaseHyperlink( bpSpeciesID, bpLevel, -1, -1, -1, -1, sd.name )
		local i = false
		
		if UnitIsBattlePetCompanion( unit ) and not UnitIsOtherPlayersBattlePet( unit ) then
			-- its the players own battlepet
			local petID, GUID, pet = ArkInventory.Collection.Pet.GetCurrent( )
			if pet then
				i = { index = petID }
				h = pet.link
			end
		end
		
		ArkInventory.TooltipCustomBattlepetBuild( tooltip, h, i )
		ArkInventory.TooltipCustomBattlepetAddDetail( tooltip, bpSpeciesID, h, i )
		
		local fn = "HookOnTooltipSetUnit"
		ArkInventory.TooltipMyDataSave( tooltip, fn, false, false, false, h, i )
		
	end
	
end

function ArkInventory.HookTooltipSetCompanionPet( tooltip, ... )
	
--	this tooltip doesnt normally refresh
	
--	test = mouseover a pet in the pet journal
--	checked ok = true
	
	if not C_PetJournal then return end
	if not ArkInventory.db.option.tooltip.battlepet.enable then return end
	
	if checkAbortShow( tooltip ) then return true end
	
	local arg1, arg2, arg3, arg4, arg5 = ...
	--ArkInventory.Output( arg1, " / ", arg2, " / ", arg3, " / ", arg4, " / ", arg5 )
	
	-- reload previous battlepet
	if arg4 or arg5 then
		
		local h = arg4
		local i = arg5
		
		ArkInventory.TooltipCustomBattlepetShow( tooltip, h, i )
		
		local fn = "HookTooltipSetCompanionPet"
		ArkInventory.TooltipMyDataSave( tooltip, fn, false, false, false, h, i )
		
		return
		
	end
	
	
	-- new battlepet set
	local pd = ArkInventory.Collection.Pet.GetByID( arg1 )
	if pd then
		
		local sd = pd.sd
		if not sd then
			--ArkInventory.OutputWarning( "no species data found for ", bpSpeciesID )
			return
		end
		
		local h = pd.link
		local i = { index = pd.index }
		
		ArkInventory.TooltipCustomBattlepetBuild( tooltip, h, i )
		ArkInventory.TooltipCustomBattlepetAddDetail( tooltip, bpSpeciesID, h, i )
		
		local fn = "HookTooltipSetCompanionPet"
		ArkInventory.TooltipMyDataSave( tooltip, fn, false, false, false, h, i )
		
	end
	
end



function ArkInventory.HookTooltipSetGeneric( fn, tooltip, ... )
	
	if not fn then return end
	
	if not tooltip then return end
	
	-- not one of the tooltips im checking
	if not tooltip.ARKTTD then
		--ArkInventory.Output( "ignoring - unknown - ", tooltip:GetName( ) )
		return
	end
	
	if not tooltip:IsShown( ) then
		
		-- caters for the game closing the tooltip when opening the same link again.
		-- when that happens we still get the click so it looks new, but the tooltip will have been hidden underneath us.
		-- we check for that via the isshown.  cant use isvisible as some tooltips are shown but not visible yet
		
		if tooltip.ARKTTD.scan then
			--ArkInventory.Output( "not shown - ", tooltip.ARKTTD )
		end
		
		return
		
	end
	
	if checkAbortItemCount( tooltip ) then return end
	
	
	-- dont play with any of the scan tooltips (they arent hooked so should not get here)
	if tooltip.ARKTTD.scan then
		--ArkInventory.Output( "ignoring - scan - ", tooltip:GetName( ) )
		return
	end
	
	--ArkInventory.Output( "SetGeneric [", tooltip:GetName( ), "] [", fn, "]"  )
	
--	local arg1, arg2, arg3, arg4 = ...
--	if type( arg1 ) == "string" then
--		arg1 = string.gsub( arg1, "\124", "\124\124" )
--	end
--	ArkInventory.Output2( "G0: ", tooltip:GetName( ), ":", fn, " ( ", arg1, ", ", arg2, ", ", arg3, ", ", arg4, " )" )
	
	local h
	local afn = string.format( "TooltipValidateDataFrom%s", fn )
	if ArkInventory[afn] then
		
		-- use the TooltipGetHyperlink<FunctionName> function i made to get the item hyperlink for this function
		
		h = ArkInventory[afn]( tooltip, ... )
		--ArkInventory.Output2( "MINE [", string.gsub( h, "\124", "\124\124" ), "]" )
--		if type( h ) ~= "string" and not MissingFunctions[afn] then
--			MissingFunctions[afn] = true
--			ArkInventory.OutputWarning("Code Error: ", afn, " did not return a value.  Please let the author know.  The warning for this function will occur once per session." )
--			return
--		end
		
	else
		
		-- i didnt create a custom TooltipValidateDataFromXXXXX function for this function so just look for an item or a spell
		h = helper_CheckTooltipForItemOrSpell( tooltip )
		if ArkInventory.Global.Debug and type( h ) ~= "string" and not MissingFunctions[afn] then
			MissingFunctions[afn] = true
			local arg1, arg2, arg3, arg4 = ...
			ArkInventory.OutputWarning( "Code Error: ", "Unable to generate a hyperlink from ", tooltip:GetName( ), ":", fn, " ( ", arg1, ", ", arg2, ", ", arg3, ", ", arg4, " )" )
			ArkInventory.OutputWarning( "Code Error: ", "A function named ", afn, " will need to be created to allow item counts to update for this object type.  Please let the author know." )
			ArkInventory.OutputWarning( "Code Error: ", "The warning for this function will only occur once per session.  No you can't disable this warning." )
			--return
		end
		
	end
	
--	if tooltip == ItemRefTooltip then
--		ArkInventory.Output( "set generic - ", fn, " - ", h )
--	end
	
	if h then
		-- if there is a hyperlink that we can use then save the data so it will refresh
		ArkInventory.TooltipMyDataSave( tooltip, fn, ... )
	else
		-- if there is no hyperlink that we can use then clear any saved data so it doesnt go wonky
		-- eg an achievement hyperlink was opened over an item hyperlink.  if you dont clear it here then the previously saved data will remain and replace it on refresh
		ArkInventory.TooltipMyDataClear( tooltip )
	end
	
	if not h or not tooltip:IsVisible( ) then
		-- dont add stuff to tooltips unless
		-- we have an actual hyperlink - pointless if we cant generate one
		-- until after they become visible - some of them just dont like it and it can stuff up the formatting
		
--		if tooltip == ItemRefTooltip then
--			ArkInventory.Output( "exit - ", fn, " - ", h )
--		end
		
		return
	end
	
	ArkInventory.API.ReloadedTooltipReady( tooltip, fn, unpack( tooltip.ARKTTD.args ) )
	
	ArkInventory.TooltipAddItemCount( tooltip, h )
	
--	if tooltip == ItemRefTooltip then
--		ArkInventory.Output( "end of generic" )
--	end
	
end

function ArkInventory.TooltipMyDataClear( tooltip )
	
	if tooltip then
		
		if tooltip.ARKTTD then
			
			if not tooltip.ARKTTD.nopurge then
				wipe( tooltip.ARKTTD.onupdate )
				wipe( tooltip.ARKTTD.args )
				wipe( tooltip.ARKTTD.info )
--				if tooltip == ItemRefTooltip then
--					ArkInventory.Output( "data wiped" )
--				end
			end
			
			tooltip.ARKTTD.nopurge = nil
			
		else
			
			tooltip.ARKTTD = { args = { }, onupdate = { }, info = { } }
			--ArkInventory.Output2( tooltip:GetName( ), " has been initialised" )
			
		end
		
	end
	
end

function ArkInventory.TooltipMyDataSave( tooltip, fn, ... )
	
	ArkInventory.TooltipMyDataClear( tooltip )
	
	tooltip.ARKTTD.onupdate.timer = ArkInventory.Const.BLIZZARD.GLOBAL.TOOLTIP.UPDATETIMER
	tooltip.ARKTTD.onupdate.fn = fn
	
	local ac = select( '#', ... )
	for ax = 1, ac do
		tooltip.ARKTTD.args[ax] = ( select( ax, ... ) )
	end
	
--	if tooltip == ItemRefTooltip then
--		ArkInventory.Output( "saved ", tooltip.ARKTTD )
--	end
	
end

function ArkInventory.HookTooltipOnUpdate( tooltip, elapsed )
	
	if checkAbortItemCount( tooltip ) then return end
	
	if not tooltip.ARKTTD or not tooltip.ARKTTD.onupdate.timer or not tooltip.ARKTTD.onupdate.fn then return end
	tooltip.ARKTTD.onupdate.timer = tooltip.ARKTTD.onupdate.timer - elapsed
	if tooltip.ARKTTD.onupdate.timer > 0 then return end
	
	tooltip.ARKTTD.onupdate.timer = ArkInventory.Const.BLIZZARD.GLOBAL.TOOLTIP.UPDATETIMER
	
	if tooltip == ItemRefTooltip then
		
		--ArkInventory.Output( "OnUpdate", tooltip.ARKTTD )
		
		-- unlike GameTooltip the ItemRefTooltip does not do any checks, it just runs its own OnUpdate function - if it has one set
		-- the problem is that OnUpdate is wiped in onLeave and OnHide, and then re-set in OnEnter, so normally it only updates when youre inside it
		-- to make it update all the time we hook OnShow and OnLeave to set this function, if one isnt set already, as OnUpdate
		-- we hook OnEnter to re-hook the OnUpdate when its re-set in there
		-- the ItemRefTooltip.UpdateTooltip function does not reload the tooltip so we dont exit here, allowing it to be reloaded by our code
		
		-- dragonflight
		-- these dont appear to be getting wiped any more so have added a check into the appropriate hooking to only add them back in if missing.
		
	else
		
		-- GameTooltip based tooltips have something similar to the below to check which function to run in their OnUpdate
		-- we rely on that code to reload the tooltip so if it exists then we dont have to do anything here and can exit
		-- if that code does not reload the tooltip then it will remain static and the item counts will not update
		
		local owner = tooltip:GetOwner( )
		if owner and owner.UpdateTooltip then
			
			-- if it has an owner and the owner has an UpdateTooltip function, then it will run that and we dont need to do anything.
			--ArkInventory.Output( "owner (", owner:GetName( ), ") has an UpdateTooltip" )
			
			return
			
		elseif tooltip.UpdateTooltip then
			
			-- if it has its own UpdateTooltip function then it will run that and we dont need to do anything.
			--ArkInventory.Output( "tooltip (", tooltip:GetName( ), ") has an UpdateTooltip" )
			
			return
			
		end
		
	end
	
	
	
	-- reload the tooltip
	
	-- for tooltips that relied on the OnHide to clear all lines (eg toybox)
	-- keep our data but clear all the lines
	--tooltip.ARKTTD.nopurge = true
	--tooltip:ClearLines( )
	--ArkInventory.API.ReloadedTooltipCleared( tooltip )
	
	
	local fn = tooltip.ARKTTD.onupdate.fn
	--ArkInventory.Output( "R0 - ", tooltip:GetName( ), ":", fn, " ", tooltip.ARKTTD.args )
	--ArkInventory.Output( "R0 - ", tooltip:GetName( ), ":", fn )
	
	if fn == "SetHyperlink" then
		-- attempting to set the same hyperlink will close the tooltip
		if DragonFlightTooltips then
			-- if we clear its info table it will look like an empty tooltip and wont close when we reload it
			tooltip.info = nil
		else
			-- clear its lines to make it empty
			tooltip.ARKTTD.nopurge = true
			tooltip:ClearLines( )
		end
	end
	
	if ArkInventory[fn] then
		-- so far its just reputation that is completely custom, pets have their own path
--		if tooltip == ItemRefTooltip then
--			ArkInventory.Output( "reloading1" )
--		end
		ArkInventory[fn]( tooltip, unpack( tooltip.ARKTTD.args ) )
	else
--		if tooltip == ItemRefTooltip then
--			ArkInventory.Output( "reloading2" )
--		end
		tooltip[fn]( tooltip, unpack( tooltip.ARKTTD.args ) )
	end
	
end

function ArkInventory.HookTooltipClearLines( tooltip )
	
	if checkAbortShow( tooltip ) then return true end
	
--	if tooltip == ItemRefTooltip then
--		ArkInventory.Output( "clear lines" )
--	end
	
	ArkInventory.TooltipMyDataClear( tooltip )
	
end

function ArkInventory.HookTooltipOnHide( tooltip )
	
	if checkAbortShow( tooltip ) then return true end
	
--	if tooltip == ItemRefTooltip then
--		ArkInventory.Output( "onhide" )
--	end
	
	tooltip.ARKTTD.nopurge = nil
	ArkInventory.TooltipMyDataClear( tooltip )
	
end

function ArkInventory.HookTooltipFadeOut( tooltip )
	
	if checkAbortShow( tooltip ) then return true end
	
--	if tooltip == ItemRefTooltip then
--		ArkInventory.Output( "fade out" )
--	end
	
	tooltip.ARKTTD.nopurge = nil
	ArkInventory.TooltipMyDataClear( tooltip )
	
end

function ArkInventory.HookTooltipOnShow( tooltip )
	
	if checkAbortShow( tooltip ) then return true end
	
--	if tooltip == ItemRefTooltip then
--		ArkInventory.Output( "onshow" )
--	end
	
	if tooltip == ItemRefTooltip then
		-- the OnUpdate script for ItemRefTooltip is not set in OnLoad and its wiped in OnLeave and OnHide, so add our own if its not there so it can reload
		if tooltip:GetScript( "OnUpdate" ) then
			--ArkInventory.Output( "onupdate exists" )
		else
			--ArkInventory.Output( "onupdate added" )
			tooltip:SetScript( "OnUpdate", ArkInventory.HookTooltipOnUpdate )
		end
	end
	
end

function ArkInventory.HookTooltipOnEnter( tooltip )
	
--	if tooltip == ItemRefTooltip then
--		ArkInventory.Output( "OnEnter" )
--	end
	
	-- the OnUpdate script for ItemRefTooltip is reset in OnEnter so you need to re-hook it
	if tooltip == ItemRefTooltip then
		if tooltip:GetScript( "OnUpdate" ) then
			--ArkInventory.Output( "onupdate exists" )
		else
			--ArkInventory.Output( "onupdate added" )
			tooltip:SetScript( "OnUpdate", ArkInventory.HookTooltipOnUpdate )
		end
	end
	
end

function ArkInventory.HookTooltipOnLeave( tooltip )
	
--	if tooltip == ItemRefTooltip then
--		ArkInventory.Output( "OnLeave" )
--	end
	
	-- the OnUpdate script is wiped in OnLeave so add our own back in
	if tooltip == ItemRefTooltip then
		if tooltip:GetScript( "OnUpdate" ) then
			--ArkInventory.Output( "onupdate exists" )
		else
			--ArkInventory.Output( "onupdate added" )
			tooltip:SetScript( "OnUpdate", ArkInventory.HookTooltipOnUpdate )
		end
	end
	
end

function ArkInventory.HookTooltipSetText( tooltip )
	
	-- used in the menu system to convert a single line text tooltip containing an appropriatly encoded hyperlink into a proper hyperlink based tooltip
	
	if checkAbortShow( tooltip ) then return true end
	
	ArkInventory.TooltipMyDataClear( tooltip )
	
	if tooltip:NumLines( ) == 1 then
		
		local _, _, h = ArkInventory.TooltipGetLine( tooltip, 1 )
		h = string.match( h, ArkInventory.Const.Tooltip.customHyperlinkMatch )
		if h then
			return ArkInventory.TooltipSet( tooltip, nil, nil, nil, h )
		end
		
	end
	
end



function ArkInventory.TooltipAddEmptyLine( tooltip )
	if ArkInventory.db.option.tooltip.addempty then
		tooltip:AddLine( " ", 1, 1, 1, 0 )
	end
end

function ArkInventory.TooltipAddItemCount( tooltip, h )
	
	if not h or h == "" then return end
	
	if checkAbortItemCount( tooltip ) then return end
	
	--ArkInventory.Output2( "1 - TooltipAddItemCount" )
	
	local osd = ArkInventory.ObjectStringDecode( h )
	if not supportedHyperlinkClass[osd.class] then
		ArkInventory.Output2( "unsupported hyperlink: ", string.gsub( h, "\124", "\124\124" ) )
		return
	end
	
	local search_id = osd.h_base
	--ArkInventory.Output2( search_id )
	if ArkInventory.db.option.tooltip.itemcount.ignore[search_id] then return end
	
	--ArkInventory.Output2( "2 - TooltipAddItemCount - ", osd.class )
	
	search_id = ArkInventory.ObjectIDCount( h )
	--ArkInventory.Output2( search_id )
	
	ArkInventory.TooltipRebuildQueueAdd( search_id )
	
	local ta = ArkInventory.Global.Cache.ItemCountTooltip[search_id]
	
--[[
	data = {
		empty = true|false
		class[class] = { 1=user, 2=vault, 3=account
			count = 0
			total = "string - tooltip total"
			player_id[player_id] = {
				t1 = "string - tooltip left",
				t2 = "string - tooltip right"
			}
		}
	}
]]--	
	
	if ta and not ta.empty then
		
		ArkInventory.TooltipAddEmptyLine( tooltip )
		
		local tc = ArkInventory.db.option.tooltip.itemcount.colour.text
		
		local gap = false
		
		for class, cd in ArkInventory.spairs( ta.class ) do
			
			if cd.entries > 0 then
				
				if gap then
					ArkInventory.TooltipAddEmptyLine( tooltip )
				end
				
				for player_id, pd in ArkInventory.spairs( cd.player_id ) do
					tooltip:AddDoubleLine( pd.t1, pd.t2 )
				end
				
				if class == 1 and cd.entries > 1 and cd.total then
					tooltip:AddLine( cd.total )
				end
				
				gap = true
				
			end
			
		end
		
		tooltip:AppendText( "" )
		
		return true
		
	end
	
	tooltip:Show( )
	--ArkInventory.Output2( "3 - TooltipAddItemCount" )
	
end

function ArkInventory.TooltipAddItemAge( tooltip, h, blizzard_id, slot_id )
	
	if type( blizzard_id ) == "number" and type( slot_id ) == "number" then
		ArkInventory.TooltipAddEmptyLine( tooltip )
		local bag_id = ArkInventory.BlizzardBagIdToInternalId( blizzard_id )
		tooltip:AddLine( tt, 1, 1, 1, 0 )
	end

end

function ArkInventory.TooltipObjectCountGet( search_id, thread_id )
	
	local tc, changed = ArkInventory.ObjectCountGetRaw( search_id, thread_id )
	
	if not changed and ArkInventory.Global.Cache.ItemCountTooltip[search_id] then
		--ArkInventory.Output2( "using cached tooltip count ", search_id )
		return ArkInventory.Global.Cache.ItemCountTooltip[search_id]
	end
	
	--ArkInventory.Output2( "building tooltip count ", search_id )
	
	if thread_id then
		ArkInventory.ThreadYield( thread_id )
	end
	
	
	ArkInventory.Global.Cache.ItemCountTooltip[search_id] = { empty = true, class = { }, count = 0 }
--[[
		empty = true|false
		count = 0
		class[class] = {
			entries = 0,
			count = 0
			player_id[player_id] = {
				t1 = "string - tooltip left",
				t2 = "string - tooltip right"
			}
		}
]]--
	
	local data = ArkInventory.Global.Cache.ItemCountTooltip[search_id]
	
	if tc == nil then
		--ArkInventory.Output2( "no count data ", search_id )
		return data
	end
	
	local codex = ArkInventory.GetPlayerCodex( )
	local info = codex.player.data.info
	local player_id = info.player_id
	
	local just_me = ArkInventory.db.option.tooltip.itemcount.justme
	local ignore_vaults = not ArkInventory.db.option.tooltip.itemcount.vault
	local my_realm = ArkInventory.db.option.tooltip.itemcount.realm
	local include_crossrealm = ArkInventory.db.option.tooltip.itemcount.crossrealm
	local ignore_other_account = ArkInventory.db.option.tooltip.itemcount.account
	local ignore_other_faction = ArkInventory.db.option.tooltip.itemcount.faction
	local ignore_tradeskill = not ArkInventory.db.option.tooltip.itemcount.tradeskill
	
	local paint = ArkInventory.db.option.tooltip.itemcount.colour.class
	
	local c = ArkInventory.db.option.tooltip.itemcount.colour.text
	local c1 = ArkInventory.ColourRGBtoCode( c.r, c.g, c.b )
	
	local c = ArkInventory.db.option.tooltip.itemcount.colour.count
	local c2 = ArkInventory.ColourRGBtoCode( c.r, c.g, c.b )
	
	local pd = { }
	
	--ArkInventory.Output2( tc["Arkayenro - Khaz'goroth"] )
	for pid, rcd in ArkInventory.spairs( tc ) do
		
		local ok = false
		
		if ( not my_realm ) or ( my_realm and rcd.realm == info.realm ) or ( my_realm and include_crossrealm and ArkInventory.IsConnectedRealm( rcd.realm, info.realm ) ) then
			ok = true
		end
		
		if rcd.class == ArkInventory.Const.Class.Account then
			ok = true
		end
		
		if ignore_other_account and rcd.account_id ~= info.account_id then
			ok = false
		end
		
		if ignore_other_faction and rcd.faction ~= "" and rcd.faction ~= info.faction then
			ok = false
		end
		
		if rcd.class == ArkInventory.Const.Class.Guild and ignore_vaults then
			ok = false
		end
		
		if just_me and pid ~= player_id then
			ok = false
		end
		
		if ok then
			
			ArkInventory.GetPlayerStorage( pid, nil, pd )
			
			local class = rcd.class
			if class == ArkInventory.Const.Class.Account then
				class = 3
			elseif class == ArkInventory.Const.Class.Guild then
				class = 2
			else
				class = 1
			end
			
			if not data.class[class] then
				data.class[class] = { entries = 0, count = 0, player_id = { } }
			end
			
			if not data.class[class].player_id[pid] then
				data.class[class].player_id[pid] = { }
			end
			
			data.class[class].player_id[pid].count = rcd.total
			
			local name = ArkInventory.DisplayName3( pd.data.info, paint, codex.player.data.info )
			local location_entries = { }
			
			for loc_id, ld in pairs( rcd.location ) do
				
				if loc_id == ArkInventory.Const.Location.Tradeskill and ignore_tradeskill then
					
					-- ignore tradeskill data
					
				else
					
					if rcd.class == ArkInventory.Const.Class.Guild then
						
						if loc_id == ArkInventory.Const.Location.Vault and ld.e then
							
							local txt = ""
							
							if ArkInventory.db.option.tooltip.itemcount.tabs then
								
								local numtabs = ArkInventory.Table.Elements( ld.e )
								
								for tab, count in ArkInventory.spairs( ld.e ) do
									
									if numtabs > 1 then
										txt = string.format( "%s, %s%s %s: %s%s", txt, c1, ArkInventory.Localise["TOOLTIP_VAULT_TABS"], tab, c2, FormatLargeNumber( count ) )
									else
										txt = string.format( "%s%s %s", c1, ArkInventory.Localise["TOOLTIP_VAULT_TABS"], tab )
									end
									
								end
								
								if numtabs > 1 then
									txt = string.sub( txt, 3, string.len( txt ) )
								end
								
							else
								txt = string.format( "%s%s", c1, ArkInventory.Global.Location[loc_id].Name )
							end
							
							table.insert( location_entries, txt )
							
						end
						
					else
						
						if loc_id == ArkInventory.Const.Location.Reputation then
							
							if ArkInventory.db.option.tooltip.itemcount.reputation and ld.e then
								
								if ArkInventory.Collection.Reputation.IsReady( ) then
									local style_default = ArkInventory.Const.Reputation.Style.TooltipItemCount
									local style = style_default
									if ArkInventory.db.option.tooltip.reputation.custom ~= ArkInventory.Const.Reputation.Custom.Default then
										style = ArkInventory.db.option.tooltip.reputation.style.count
										if string.trim( style ) == "" then
											style = style_default
										end
									end
									
									local osd = ArkInventory.ObjectStringDecode( ld.e )
									local txt = ArkInventory.Collection.Reputation.LevelText( osd.id, style, osd.st, osd.bv, osd.bn, osd.bm, osd.ic, osd.pv, osd.pr, osd.rv, osd.rm )
									table.insert( location_entries, string.format( "%s%s", c1, txt ) )
								end
								
							end
							
						elseif loc_id == ArkInventory.Const.Location.Tradeskill then
							
							if ArkInventory.db.option.tooltip.itemcount.tradeskill and ( not ignore_tradeskill ) and ld.e then
								
								table.insert( location_entries, string.format( "%s%s", c1, ld.e ) )
								
							end
							
						elseif ld.c > 0 then
							
							if rcd.entries > 1 then
								table.insert( location_entries, string.format( "%s%s %s%s", c1, ArkInventory.Global.Location[loc_id].Name, c2, FormatLargeNumber( ld.c ) ) )
							else
								table.insert( location_entries, string.format( "%s%s", c1, ArkInventory.Global.Location[loc_id].Name ) )
							end
							
						end
						
					end
					
				end
				
			end
			
			--if data.class[class].player_id[pid].count > 0 then
			if #location_entries > 0 then
				
				data.empty = false
				
				local hl = ""
				if not ArkInventory.db.option.tooltip.itemcount.me and pd.data.info.player_id == player_id then
					hl = ArkInventory.db.option.tooltip.highlight
				end
				
				data.class[class].entries = data.class[class].entries + 1
				
				local count = data.class[class].player_id[pid].count
				if count > 0 then
					data.class[class].player_id[pid].t1 = string.format( "%s%s%s: %s%s", hl, c1, name, c2, FormatLargeNumber( count ) )
				else
					-- count should have been reset to zero for reputation and tradeskill back in getraw
					data.class[class].player_id[pid].t1 = string.format( "%s%s%s", hl, c1, name )
				end
				data.class[class].player_id[pid].t2 = string.format( "%s", table.concat( location_entries, ", " ) )
				
				data.class[class].count = data.class[class].count + data.class[class].player_id[pid].count
				data.count = data.count + data.class[class].count
				
			end
			
			if data.count > 0 then
				data.class[class].total = string.format( "%s%s: %s%s", c1, ArkInventory.Localise["TOTAL"], c2, FormatLargeNumber( data.class[class].count ) )
				data.total = string.format( "%s%s: %s%s", c1, ArkInventory.Localise["TOTAL"], c2, FormatLargeNumber( data.count ) )
			end
			
		end
		
	end
	
	return data
	
end

function ArkInventory.TooltipAddMoneyCoin( frame, amount, txt, r, g, b )
	
	if not frame or not amount then
		return
	end
	
	frame:AddDoubleLine( txt or " ", " ", r or 1, g or 1, b or 1 )
	
	local numLines = frame:NumLines( )
	if not frame.numMoneyFrames then
		frame.numMoneyFrames = 0
	end
	if not frame.shownMoneyFrames then
		frame.shownMoneyFrames = 0
	end
	
	local name = string.format( "%s%s%s", frame:GetName( ), "MoneyFrame", frame.shownMoneyFrames + 1 )
	local moneyFrame = _G[name]
	if not moneyFrame then
		frame.numMoneyFrames = frame.numMoneyFrames + 1
		moneyFrame = CreateFrame( "Frame", name, frame, "TooltipMoneyFrameTemplate" )
		name = moneyFrame:GetName( )
		ArkInventory.MoneyFrame_SetType( moneyFrame, "STATIC" )
	end
	
	moneyFrame:SetPoint( "RIGHT", string.format( "%s%s%s", frame:GetName( ), "TextRight", numLines ), "RIGHT", 15, 0 )
	
	moneyFrame:Show( )
	
	if not frame.shownMoneyFrames then
		frame.shownMoneyFrames = 1
	else
		frame.shownMoneyFrames = frame.shownMoneyFrames + 1
	end
	
	ArkInventory.MoneyFrame_Update( moneyFrame:GetName( ), amount )
	
	local leftFrame = _G[string.format( "%s%s%s", frame:GetName( ), "TextLeft", numLines )]
	local frameWidth = leftFrame:GetWidth( ) + moneyFrame:GetWidth( ) + 40
	
	if frame:GetMinimumWidth( ) < frameWidth then
		frame:SetMinimumWidth( frameWidth )
	end
	
	frame.hasMoney = 1
	
end

function ArkInventory.TooltipAddMoneyText( frame, money, txt, r1, g1, b1, r2, g2, b2 )
	if not money then
		return
	else
		frame:AddDoubleLine( txt or ArkInventory.Localise["UNKNOWN"], ArkInventory.MoneyText( money ), r1, g1, b1, r2, g2, b2 )
	end
end


function ArkInventory.TooltipDataDump( tooltipInfo )
	
	if tooltipInfo then
		
		TooltipUtil.SurfaceArgs( tooltipInfo )
		for k, line in ipairs( tooltipInfo.lines ) do
			TooltipUtil.SurfaceArgs( line )
		end
		
		--tooltipInfo.type
		
		local show = false
		for k, line in ipairs( tooltipInfo.lines ) do
			
			if k == 1 then
				if string.match( line.leftText, "^Pattern: (.+)" ) then
					show = true
				end
			end
				
			if show then
				--ArkInventory.Output( k, " = [", line.leftText, "] [", line.leftColor:GenerateHexColor( ), "]" )
				ArkInventory.Output( k, " = [", line.leftColor:WrapTextInColorCode( line.leftText ), "]" )
				if line.rightText then
					--ArkInventory.Output( k, " = [", line.rightText, "] [", line.rightColor:GenerateHexColor( ), "]" )
					ArkInventory.Output( k, " = [", line.rightColor:WrapTextInColorCode( line.rightText ), "]" )
				end
				--ArkInventory.Output( line )
			end
		end
		
		return tooltipInfo
		
	end
end

function ArkInventory.TooltipDump( tooltip )
	
	-- /run ArkInventory.TooltipDump( EmbeddedItemTooltip )
	-- /run ArkInventory.TooltipDump( GameTooltip )
	-- /run ArkInventory.TooltipDump( ArkInventory.Global.Tooltip.Scan )
	
	
	local tooltip = tooltip or ArkInventory.Global.Tooltip.Scan
	--local h = "|cffa335ee|Hkeystone:138019:234:2:0:0:0:0|h[Keystone: Return to Karazhan: Upper (2)]|h|r"
	--local h = "keystone:138019:234:2:0:0:0:0"
	--tooltip:SetHyperlink( h )
-- 
--	/run ArkInventory.TooltipDump( ArkInventory.Global.Tooltip.Scan )
--	/run ArkInventory.TooltipDump( GameTooltip )
	ArkInventory.OutputDebug( "----- ----- -----" )
	local c = ArkInventory.TooltipGetNumLines( tooltip )
	ArkInventory.OutputDebug( "lines = ", c )
	for i = 1, c do
		local leftText, rightText, leftTextClean, rightTextClean, leftColor, rightColor = ArkInventory.TooltipGetLine( tooltip, i )
		ArkInventory.OutputDebug( i, " left: ", leftColor:GenerateHexColor( ), ": ", leftText )
		if rightText ~= "" then
			ArkInventory.OutputDebug( i, " right: ", rightColor:GenerateHexColor( ), ": ", rightText )
		end
	end
	
	if tooltip:GetParent( ) then
		ArkInventory.OutputDebug( "parent = ", tooltip:GetParent( ):GetName( ) )
	else
		ArkInventory.OutputDebug( "parent = *not set*" )
	end
	
	if tooltip:GetOwner( ) then
		ArkInventory.OutputDebug( "owner = ", tooltip:GetOwner( ):GetName( ) )
	else
		ArkInventory.OutputDebug( "owner = *not set*" )
	end
	
	for k, v in pairs( tooltip ) do
		--ArkInventory.OutputDebug( k )
	end
	
end

function ArkInventory.GameTooltipDump( )
	for k in pairs( GameTooltip ) do
		ArkInventory.OutputDebug( k )
	end
end

function ArkInventory.ListAllTooltips( )
	local tooltip = EnumerateFrames( )
	while tooltip do
		if tooltip:GetObjectType( ) == "GameTooltip" then
			local name = tooltip:GetName( )
			if name then
				ArkInventory.Output( name )
			end
		end
		tooltip = EnumerateFrames( tooltip )
	end
end


function ArkInventory.TooltipExtractValueSuffixCheck( level, suffix )
	
	--ArkInventory.Output2( "check [", level, "] [", suffix, "]" )
	
	local level = level or 0
	if not ( level == 3 or level == 6 or level == 9 or level == 12 ) then
		return
	end
	
	local suffix = string.trim( suffix ) or ""
	if suffix == "" then
		return
	end
	
	local suffixes = ArkInventory.Localise[string.format( "WOW_ITEM_TOOLTIP_10P%dT", level )]
	if suffixes == "" then
		return
	end
	
	local check
	
	for s in string.gmatch( suffixes, "[^,]+" ) do
		
		check = string.sub( suffix, 1, string.len( s ) )
		
		
		
		if string.lower( check ) == string.lower( s ) then
			--ArkInventory.Output2( "pass [", check, "] [", s, "]" )
			return true
		end
		
		--ArkInventory.Output2( "fail [", check, "] [", s, "]" )
		
	end
	
end

function ArkInventory.TooltipExtractValueArtifactPower( h )
	
	local tooltipInfo = ArkInventory.TooltipSet( ArkInventory.Global.Tooltip.Scan, nil, nil, nil, h )
	local amount, suffix = ArkInventory.TooltipMatch( ArkInventory.Global.Tooltip.Scan, nil, ArkInventory.Localise["WOW_TOOLTIP_ARTIFACT_POWER_AMOUNT"], false, true, true, 0, ArkInventory.Const.Tooltip.Search.Short )
	
	if not amount then
		return
	end
	
	amount = ArkInventory.TooltipTextToNumber( amount )
	
	--ArkInventory.Output2( h, "[", amount, "] [", suffix, "]" )
	
	if amount then
		
		if ArkInventory.TooltipExtractValueSuffixCheck( 12, suffix ) then
			--ArkInventory.Output2( "12: ", amount, " ", suffix, "]" )
			amount = amount * 1000000000000
		elseif ArkInventory.TooltipExtractValueSuffixCheck( 9, suffix ) then
			--ArkInventory.Output2( "9: ", amount, " ", suffix, "]" )
			amount = amount * 1000000000
		elseif ArkInventory.TooltipExtractValueSuffixCheck( 6, suffix ) then
			--ArkInventory.Output2( "6: ", amount, " ", suffix, "]" )
			amount = amount * 1000000
		elseif ArkInventory.TooltipExtractValueSuffixCheck( 3, suffix ) then
			--ArkInventory.Output2( "3: ", amount, " ", suffix, "]" )
			amount = amount * 1000
		end
		
		return amount
		
	end
	
end

function ArkInventory.TooltipExtractValueAncientMana( h )
	
	local tooltipInfo = ArkInventory.TooltipSet( ArkInventory.Global.Tooltip.Scan, nil, nil, nil, h )
	local amount, suffix = ArkInventory.TooltipMatch( ArkInventory.Global.Tooltip.Scan, nil, ArkInventory.Localise["WOW_TOOLTIP_ARTIFACT_POWER_AMOUNT"], false, true, true, 0, ArkInventory.Const.Tooltip.Search.Short )
	
	if not amount then
		return
	end
	
	amount = ArkInventory.TooltipTextToNumber( amount )
	
	
	return amount
	
end





local TooltipRebuildQueue = { }
local scanning = false

function ArkInventory.TooltipRebuildQueueAdd( search_id )
	
	if not ArkInventory.db.option.tooltip.show then return end
	if not ArkInventory.db.option.tooltip.itemcount.enable then return end
	if not search_id then return end
	
	--ArkInventory.Output2( "adding ", search_id )
	TooltipRebuildQueue[search_id] = true
	
	ArkInventory:SendMessage( "EVENT_ARKINV_TOOLTIP_REBUILD_QUEUE_UPDATE_BUCKET", "START" )
	
end

local function Scan_Threaded( thread_id )
	
	--ArkInventory.Output2( "rebuilding ", ArkInventory.Table.Elements( TooltipRebuildQueue ) )
	
	for search_id in pairs( TooltipRebuildQueue ) do
		
		--ArkInventory.Output2( "rebuilding ", search_id )
		
		ArkInventory.TooltipObjectCountGet( search_id, thread_id )
		ArkInventory.ThreadYield( thread_id )
		
		TooltipRebuildQueue[search_id] = nil
		
	end
	
end

local function Scan( )
	
	local thread_id = ArkInventory.Global.Thread.Format.Tooltip
	
	if not ArkInventory.Global.Thread.Use then
		local tz = debugprofilestop( )
		ArkInventory.OutputThread( thread_id, " start" )
		Scan_Threaded( )
		tz = debugprofilestop( ) - tz
		ArkInventory.OutputThread( string.format( "%s took %0.0fms", thread_id, tz ) )
		return
	end
	
	local tf = function ( )
		Scan_Threaded( thread_id )
	end
	
	ArkInventory.ThreadStart( thread_id, tf )
	
end

function ArkInventory:EVENT_ARKINV_TOOLTIP_REBUILD_QUEUE_UPDATE_BUCKET( events )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if ArkInventory.Global.Mode.Combat then
		return
	end
	
	if not scanning then
		scanning = true
		Scan( )
		scanning = false
	else
		ArkInventory:SendMessage( "EVENT_ARKINV_TOOLTIP_REBUILD_QUEUE_UPDATE_BUCKET", "RESCAN" )
	end
	
end




function ArkInventory.TooltipProcessorSetItem( ... )
	
	local tooltip, tooltipInfo = ...
	if checkAbortShow( tooltip ) then return true end
	
	TooltipUtil.SurfaceArgs( tooltipInfo )
	--tooltipInfo.args = nil
	--tooltipInfo.lines = nil
	--ArkInventory.Output( tooltipInfo )
	
	local hyperlink
	
	if tooltipInfo.hyperlink then
		hyperlink = tooltipInfo.hyperlink
	elseif tooltipInfo.guid then
		hyperlink = C_Item.GetItemLinkByGUID( tooltipInfo.guid )
	end
	
	--ArkInventory.Output( hyperlink )
	
	ArkInventory.TooltipAddItemCount( tooltip, hyperlink )
	
end

function ArkInventory.TooltipProcessorSetUnit( ... )
	ArkInventory.HookOnTooltipSetUnit( ... )
end

function ArkInventory.TooltipProcessorSetCompanionPet( ... )
	
	if not C_PetJournal then return end
	if not ArkInventory.db.option.tooltip.battlepet.enable then return end
	
	local tooltip, tooltipInfo = ...
	if checkAbortShow( tooltip ) then return true end
	
	--  theres nothing in the tooltip or tooltipInfo that identifies the pet you are moused over in your pet journal
	
end

function ArkInventory.TooltipProcessorSetBattlePet( ... )
	
	if not C_PetJournal then return end
	if not ArkInventory.db.option.tooltip.battlepet.enable then return end
	
	local tooltip, tooltipInfo = ...
	if checkAbortShow( tooltip ) then return true end
	
	--ArkInventory.Output( "add battlepet count to ", tooltip:GetName( ), " - ", tooltipInfo.hyperlink )
	ArkInventory.HookOnTooltipSetUnit( ... )
	
end

function ArkInventory.TooltipProcessorSetMount( ... )
	
	if not C_MountJournal then return end
	
	local tooltip, tooltipInfo = ...
	if checkAbortShow( tooltip ) then return true end
	
	local name, spellID = C_MountJournal.GetMountInfoByID( tooltipInfo.id )
	local hyperlink = GetSpellLink( spellID )
	ArkInventory.TooltipAddItemCount( tooltip, hyperlink )
	
end

function ArkInventory.TooltipProcessorSetToy( ... )
	
	if not C_ToyBox then return end
	
	local tooltip, tooltipInfo = ...
	if checkAbortShow( tooltip ) then return true end
	
	local hyperlink = C_ToyBox.GetToyLink( tooltipInfo.id )
	ArkInventory.TooltipAddItemCount( tooltip, hyperlink )
	
end

function ArkInventory.TooltipProcessorSetCurrency( ... )
	
	local tooltip, tooltipInfo = ...
	if checkAbortShow( tooltip ) then return true end
	
	local hyperlink = helper_CurrencyRepuationCheck( tooltipInfo.id )
	ArkInventory.TooltipAddItemCount( tooltip, hyperlink )
	
end

function ArkInventory.TooltipProcessorSetSpell( ... )
	
	local tooltip, tooltipInfo = ...
	if checkAbortShow( tooltip ) then return true end
	
	local hyperlink = GetSpellLink( tooltipInfo.id )
	ArkInventory.TooltipAddItemCount( tooltip, hyperlink )
	
end


if TooltipDataProcessor then
	TooltipDataProcessor.AddTooltipPostCall( Enum.TooltipDataType.Item, ArkInventory.TooltipProcessorSetItem )
	TooltipDataProcessor.AddTooltipPostCall( Enum.TooltipDataType.Unit, ArkInventory.TooltipProcessorSetUnit )
	TooltipDataProcessor.AddTooltipPostCall( Enum.TooltipDataType.Mount, ArkInventory.TooltipProcessorSetMount )
	TooltipDataProcessor.AddTooltipPostCall( Enum.TooltipDataType.Toy, ArkInventory.TooltipProcessorSetToy )
	TooltipDataProcessor.AddTooltipPostCall( Enum.TooltipDataType.Currency, ArkInventory.TooltipProcessorSetCurrency )
	TooltipDataProcessor.AddTooltipPostCall( Enum.TooltipDataType.CompanionPet, ArkInventory.TooltipProcessorSetCompanionPet )
	TooltipDataProcessor.AddTooltipPostCall( Enum.TooltipDataType.BattlePet, ArkInventory.TooltipProcessorSetBattlePet )
	TooltipDataProcessor.AddTooltipPostCall( Enum.TooltipDataType.Spell, ArkInventory.TooltipProcessorSetSpell )
end
