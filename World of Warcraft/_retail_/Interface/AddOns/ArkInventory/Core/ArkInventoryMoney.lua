	
ArkInventory.Const.MoneyTypeInfo = { }

ArkInventory.Const.MoneyTypeInfo["PLAYER"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "PLAYER_MONEY", "PLAYER_TRADE_MONEY", "SEND_MAIL_MONEY_CHANGED", "SEND_MAIL_COD_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,
	
	UpdateFunc = function( )
		return GetMoney( ) - GetCursorMoney( ) - GetPlayerTradeMoney( )
	end,

	PickupFunc = function( amount )
		PickupPlayerMoney( amount )
	end,

	DropFunc = function( )
		DropCursorMoney( )
	end,

	collapse = 1,
	canPickup = 1,
	showSmallerCoins = "Backpack"

}

ArkInventory.Const.MoneyTypeInfo["STATIC"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )

		moneyFrame.events = { }
		
	end,

	UpdateFunc = function( moneyFrame )
		return moneyFrame.staticMoney
	end,

	collapse = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["AUCTION"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )

		return moneyFrame.staticMoney
		
	end,
	
	showSmallerCoins = "Backpack",
	fixedWidth = 1,
	collapse = 1,
	truncateSmallCoins = nil,
	
}

ArkInventory.Const.MoneyTypeInfo["PLAYER_TRADE"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "PLAYER_TRADE_MONEY" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetPlayerTradeMoney( )
	end,

	PickupFunc = function( amount )
		PickupTradeMoney( amount )
	end,

	DropFunc = function( )
		AddTradeMoney( )
	end,

	collapse = 1,
	canPickup = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["TARGET_TRADE"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "TRADE_MONEY_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetTargetTradeMoney( )
	end,

	collapse = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["SEND_MAIL"] = {

	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "SEND_MAIL_MONEY_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetSendMailMoney( )
	end,

	PickupFunc = function( amount )
		PickupSendMailMoney( amount )
	end,

	DropFunc = function( )
		AddSendMailMoney( )
	end,

	collapse = nil,
	canPickup = 1,
	showSmallerCoins = "Backpack",
	
}

ArkInventory.Const.MoneyTypeInfo["SEND_MAIL_COD"] = {
	
	OnloadFunc = function( moneyFrame )
	
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "SEND_MAIL_COD_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetSendMailCOD( )
	end,

	PickupFunc = function( amount )
		PickupSendMailCOD( amount )
	end,

	DropFunc = function( )
		AddSendMailCOD( )
	end,

	collapse = 1,
	canPickup = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["GUILDBANK"] = {
	
	OnloadFunc = function( moneyFrame )
		
		if not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.WRATH ) then return end -- FIX ME
		
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "GUILDBANK_UPDATE_MONEY" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end
		
	end,
	
	UpdateFunc = function( )
		return GetGuildBankMoney( ) - GetCursorMoney( )
	end,
	
	PickupFunc = function( amount )
		PickupGuildBankMoney( amount )
	end,
	
	DropFunc = function( )
		DropCursorMoney( )
	end,
	
	collapse = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["GUILDBANK_WITHDRAW"] = {
	
	OnloadFunc = function( moneyFrame )
		
		if not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.WRATH ) then return end -- FIX ME
		
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { "GUILDBANK_UPDATE_WITHDRAWMONEY" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end
		
	end,
	
	UpdateFunc = function( )
		
		local amount = 0
		
		if CanWithdrawGuildBankMoney( ) or CanGuildBankRepair( ) then
			amount = min( GetGuildBankMoney( ),  GetGuildBankWithdrawMoney( ) )
			if amount < 0 then
				amount = GetGuildBankMoney( )
			end
		end
		
		return amount
		
	end,
	
	collapse = 1,
	showSmallerCoins = "Backpack",
	
}

ArkInventory.Const.MoneyTypeInfo["GUILDBANK_REPAIR"] = {
	
	OnloadFunc = function( moneyFrame )
		
		if not ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.WRATH ) then return end -- FIX ME
		
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		moneyFrame.events = { }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end
		
	end,
	
	UpdateFunc = function( moneyFrame )
		
		assert( moneyFrame, "code error: moneyFrame argument is missing" )
		
		return moneyFrame.staticMoney
		
	end,
	
	collapse = 1,
	showSmallerCoins = "Backpack",
	
}

function ArkInventory.MoneyFrame_OnEvent( moneyFrame, event, ... )

	assert( moneyFrame, "code error: moneyFrame argument is missing" )

	if not moneyFrame.info or not moneyFrame:IsVisible( ) then
		return
	end

	ArkInventory.MoneyFrame_UpdateMoney( moneyFrame )
	
end

function ArkInventory.MoneyFrame_OnEnter( moneyFrame )
	
	assert( moneyFrame, "code error: moneyFrame argument is missing" )
	
	if not moneyFrame:IsVisible( ) then
		return
	end
	
	local parent = moneyFrame:GetParent( ):GetParent( )
	if parent and parent.ARK_Data then
		
		local x, a, b
		
		x = moneyFrame:GetBottom( ) + ( moneyFrame:GetTop( ) - moneyFrame:GetBottom( ) ) / 2
		if ( x >= ( GetScreenHeight( ) / 2 ) ) then
			a = "BOTTOM"
		else
			a = "TOP"
		end
		
		x = moneyFrame:GetLeft( ) + ( moneyFrame:GetRight( ) - moneyFrame:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			b = "RIGHT"
		else
			b = "LEFT"
		end
		
		GameTooltip:SetOwner( moneyFrame, string.format( "ANCHOR_%s", a ) )
		GameTooltip:ClearLines( )
		
		ArkInventory.MoneyFrame_Tooltip( GameTooltip, parent.ARK_Data.loc_id )
		
		GameTooltip:Show( )
		
	end
	
end

function ArkInventory.SmallMoneyFrame_OnLoad( moneyFrame, moneyType )

	assert( moneyFrame, "code error: moneyFrame argument is missing" )
	
	local moneyType = moneyType or "PLAYER"
	moneyFrame.small = 1
	
	ArkInventory.MoneyFrame_SetType( moneyFrame, moneyType )
	
end

function ArkInventory.MoneyFrame_SetType( moneyFrame, moneyType )
	
	assert( moneyFrame, "code error: moneyFrame argument is missing" )
	
	local info = ArkInventory.Const.MoneyTypeInfo[moneyType]
	if not info then
		ArkInventory.OutputError( "code error: invalid moneyType [", moneyType, "] assigned to frame [", moneyFrame:GetName( ), "], defaulting to PLAYER" )
		info = ArkInventory.Const.MoneyTypeInfo["PLAYER"]
	end
	
	if moneyFrame.events then
		-- this money frame has already been used for something else, clean it up
		moneyFrame:UnregisterAllEvents( )
		moneyFrame.events = nil
	end
	
	moneyFrame.info = info
	moneyFrame.moneyType = moneyType
	
	-- register the events required
	if info.OnloadFunc then
		info.OnloadFunc( moneyFrame )
	end
	
	local frameName = moneyFrame:GetName( )
	if info.canPickup then
		_G[string.format( "%s%s", frameName, "GoldButton" )]:RegisterForClicks( "LeftButtonUp" )
		_G[string.format( "%s%s", frameName, "SilverButton" )]:RegisterForClicks( "LeftButtonUp" )
		_G[string.format( "%s%s", frameName, "CopperButton" )]:RegisterForClicks( "LeftButtonUp" )
	else
		_G[string.format( "%s%s", frameName, "GoldButton" )]:RegisterForClicks( )
		_G[string.format( "%s%s", frameName, "SilverButton" )]:RegisterForClicks( )
		_G[string.format( "%s%s", frameName, "CopperButton" )]:RegisterForClicks( )
	end
	
	ArkInventory.MoneyFrame_UpdateMoney( moneyFrame )
	
end

function ArkInventory.MoneyFrame_UpdateMoney( moneyFrame )

	assert( moneyFrame, "code error: moneyFrame argument is missing" )
	
	if not moneyFrame:IsVisible( ) then
		return
	end
	
	if moneyFrame.info then
		
		local moneyAmount = moneyFrame.info.UpdateFunc( moneyFrame )
		
		if moneyAmount then
			ArkInventory.MoneyFrame_Update( moneyFrame:GetName( ), moneyAmount, true )
			--ArkInventory.MoneyFrame_Update( moneyFrame, moneyAmount )
		end
		
		if moneyFrame.hasPickup == 1 then
			UpdateCoinPickupFrame( moneyAmount )
		end
		
	else
		
		ArkInventory.OutputError( "moneyType not set for moneyFrame [", moneyFrame:GetName( ), "]" )
		
	end
	
end

function ArkInventory.MoneyText( money, condense )
	
	local money = money or 0
	
	local numGold = floor( money / COPPER_PER_GOLD )
	local numSilver = floor( ( money - ( numGold * COPPER_PER_GOLD ) ) / COPPER_PER_SILVER )
	local numCopper = money % COPPER_PER_SILVER
	
	local txtGold = ""
	local txtSilver = ""
	local txtCopper = ""
	
	local leading_zero_format = "%d%s"
	local SILVER_AMOUNT_TEXTURE = SILVER_AMOUNT_TEXTURE
	local COPPER_AMOUNT_TEXTURE = COPPER_AMOUNT_TEXTURE
	
	
	if money >= COPPER_PER_GOLD then
		
		if ArkInventory.Global.Mode.ColourBlind then
			txtGold = string.format( "%s%s", FormatLargeNumber( numGold ), GOLD_AMOUNT_SYMBOL )
		else
			txtGold = string.format( GOLD_AMOUNT_TEXTURE_STRING, FormatLargeNumber( numGold ), 0, 0 )
		end
		
		leading_zero_format = "%02d%s"
		SILVER_AMOUNT_TEXTURE = string.gsub( SILVER_AMOUNT_TEXTURE, "%%d", "%%02d", 1 )
		
	end
	
	
	if money >= COPPER_PER_SILVER then
		
		if ArkInventory.Global.Mode.ColourBlind then
			txtSilver = string.format( leading_zero_format, numSilver, SILVER_AMOUNT_SYMBOL )
		else
			txtSilver = string.format( SILVER_AMOUNT_TEXTURE, numSilver, 0, 0 )
		end
		
		COPPER_AMOUNT_TEXTURE = string.gsub( COPPER_AMOUNT_TEXTURE, "%%d", "%%02d", 1 )
		
	end
	
	
--	if numSilver > 0 or numGold > 0 then
		
		if ArkInventory.Global.Mode.ColourBlind then
			txtCopper = string.format( leading_zero_format, numCopper, COPPER_AMOUNT_SYMBOL )
		else
			txtCopper = string.format( COPPER_AMOUNT_TEXTURE, numCopper, 0, 0 )
		end
		
--	end
	
	if condense then
		
		local txt = ""
		if numCopper > 0 then
			txt = string.format( "%s %s", txtCopper, txt )
		end
		
		if numSilver > 0 or numCopper > 0 then
			txt = string.format( "%s %s", txtSilver, txt )
		end
		
		if numGold > 0 then
			txt = string.format( "%s %s", txtGold, txt )
		end
		
		return string.trim( txt )
		
	else
		
		return string.trim( string.format( "%s %s %s", txtGold, txtSilver, txtCopper ) )
		
	end
	
end

function ArkInventory.MoneyFrame_Tooltip( tooltip, loc_id )
	
	if not tooltip then return end
	if not ArkInventory.db.option.tooltip.money.enable then return end
	
	local total = 0
	
	local tc = ArkInventory.db.option.tooltip.money.colour
	
	local codex = ArkInventory.GetPlayerCodex( loc_id )
	if loc_id then
		local codex = ArkInventory.GetLocationCodex( loc_id )
	end
	
	tooltip:AddDoubleLine( ArkInventory.Localise["CHARACTER"], ArkInventory.Localise["TOOLTIP_GOLD_AMOUNT"] )
	
	local just_me = ArkInventory.db.option.tooltip.money.justme
	local ignore_vaults = not ArkInventory.db.option.tooltip.money.vault
	local my_realm = ArkInventory.db.option.tooltip.money.realm
	local include_crossrealm = ArkInventory.db.option.tooltip.money.crossrealm
	local ignore_other_faction = ArkInventory.db.option.tooltip.money.faction
	local ignore_other_account = ArkInventory.db.option.tooltip.money.account
	
	local paint = ArkInventory.db.option.tooltip.money.colour.class
	
	local c1 = ArkInventory.db.option.tooltip.money.colour.text
	--local c1 = ArkInventory.ColourRGBtoCode( c1c.r, c1c.g, c1c.b )
	
	local c2 = ArkInventory.db.option.tooltip.money.colour.count
	--local c2 = ArkInventory.ColourRGBtoCode( c2c.r, c2c.g, c2c.b )
	
	for pn, pd in ArkInventory.spairs( ArkInventory.db.player.data ) do
		
		if ( not ( pd.info.class == ArkInventory.Const.Class.Guild or pd.info.class == ArkInventory.Const.Class.Account ) ) and ( pd.info.name ) then
			if ( not my_realm ) or ( ( my_realm and codex.player.data.info.realm == pd.info.realm ) or ( my_realm and include_crossrealm and ArkInventory.IsConnectedRealm( codex.player.data.info.realm, pd.info.realm ) ) ) then
				if ( not ignore_other_account ) or ( ignore_other_account and codex.player.data.info.account_id == pd.info.account_id ) then
					if ( not ignore_other_faction ) or ( ignore_other_faction and codex.player.data.info.faction == pd.info.faction ) then
						if ( not just_me ) or ( just_me and codex.player.data.info.player_id == pd.info.player_id ) then
							
							total = total + ( pd.info.money or 0 )
							
							local name = ArkInventory.DisplayName3( pd.info, paint, codex.player.data.info )
							
							local hl = ""
							if not ArkInventory.db.option.tooltip.money.justme and codex.player.data.info.player_id == pd.info.player_id then
								hl = ArkInventory.db.option.tooltip.highlight
							end
							
							--name = string.format( "%s%s%s", hl, c1, name )
							
							ArkInventory.TooltipAddMoneyText( tooltip, pd.info.money or 0, name, c1.r, c1.g, c1.b, c2.r, c2.g, c2.b )
							
						end
					end
				end
			end
		end
		
	end
	
	tooltip:AddDoubleLine( " ", " " )
	ArkInventory.TooltipAddMoneyText( tooltip, total, ArkInventory.Localise["TOTAL"], c1.r, c1.g, c1.b, c2.r, c2.g, c2.b )
	
	total = 0
	
	if not just_me and not ignore_vaults then
		
		for pn, pd in pairs( ArkInventory.db.player.data ) do
			if pd.info.class == ArkInventory.Const.Class.Guild and pd.info.name then
				if ( not my_realm ) or ( ( my_realm and ( ( codex.player.data.info.realm == pd.info.realm ) ) ) or ( my_realm and include_crossrealm and ArkInventory.IsConnectedRealm( codex.player.data.info.realm, pd.info.realm ) ) ) then
					if ( not ignore_other_account ) or ( ignore_other_account and codex.player.data.info.account_id == pd.info.account_id ) then
						if ( not ignore_other_faction ) or ( ignore_other_faction and codex.player.data.info.faction == pd.info.faction ) then
							total = 1
						end
					end
				end
			end
		end
		
		if total > 0 then
			
			tooltip:AddDoubleLine( " ", " " )
			tooltip:AddDoubleLine( " ", " " )
			
			tooltip:AddDoubleLine( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name, ArkInventory.Localise["TOOLTIP_GOLD_AMOUNT"] )
			
			for pn, pd in ArkInventory.spairs( ArkInventory.db.player.data ) do
				
				if pd.info.class == ArkInventory.Const.Class.Guild and pd.info.name then
					if ( not my_realm ) or ( ( my_realm and codex.player.data.info.realm == pd.info.realm ) or ( my_realm and include_crossrealm and ArkInventory.IsConnectedRealm( codex.player.data.info.realm, pd.info.realm ) ) ) then
						if ( not ignore_other_account ) or ( ignore_other_account and codex.player.data.info.account_id == pd.info.account_id ) then
							if ( not ignore_other_faction ) or ( ignore_other_faction and codex.player.data.info.faction == pd.info.faction ) then
								ArkInventory.TooltipAddMoneyText( tooltip, pd.info.money or 0, ArkInventory.DisplayName3( pd.info, paint, codex.player.data.info ), c1.r, c1.g, c1.b, c2.r, c2.g, c2.b )
							end
						end
					end
				end
				
			end
			
		end
		
	end
	
end

local function CreateMoneyButtonNormalTexture (button, iconWidth)
	
	-- source: ...\Interface\FrameXML\MoneyFrame.lua
	
	local texture = button:CreateTexture();
	texture:SetTexture("Interface\\MoneyFrame\\UI-MoneyIcons");
	texture:SetWidth(iconWidth);
	texture:SetHeight(iconWidth);
	texture:SetPoint("RIGHT");
	button:SetNormalTexture(texture);
	
	return texture;
end

function ArkInventory.MoneyFrame_Update(frameName, money, forceShow)
	
	-- source: ...\Interface\FrameXML\MoneyFrame.lua
	-- for whatever reason this fails if i call the blizzard function - and there are no code changes here
	
	local frame;
	if ( type(frameName) == "table" ) then
		frame = frameName;
		frameName = frame:GetName();
	else
		frame = _G[frameName];
	end
	
	local info = frame.info;
	if ( not info ) then
		message("Error moneyType not set");
	end

	-- Breakdown the money into denominations
	local gold = floor(money / (COPPER_PER_SILVER * SILVER_PER_GOLD));
	local goldDisplay = BreakUpLargeNumbers(gold);
	local silver = floor((money - (gold * COPPER_PER_SILVER * SILVER_PER_GOLD)) / COPPER_PER_SILVER);
	local copper = mod(money, COPPER_PER_SILVER);

	local copperButton = _G[frameName.."CopperButton"];
	local silverButton = _G[frameName.."SilverButton"];
	local goldButton = _G[frameName.."GoldButton"];

	local iconWidth = MONEY_ICON_WIDTH;
	local spacing = MONEY_BUTTON_SPACING;
	if ( frame.small ) then
		iconWidth = MONEY_ICON_WIDTH_SMALL;
		spacing = MONEY_BUTTON_SPACING_SMALL;
	end

	local maxDisplayWidth = frame.maxDisplayWidth;
	
	-- Set values for each denomination
	if ( ENABLE_COLORBLIND_MODE == "1" ) then
		
		if ( not frame.colorblind or not frame.vadjust or frame.vadjust ~= MONEY_TEXT_VADJUST ) then
			
			frame.colorblind = true;
			frame.vadjust = MONEY_TEXT_VADJUST;
			
			copperButton:SetNormalTexture("");
			_G[frameName.."CopperButtonText"]:SetPoint("RIGHT", 0, MONEY_TEXT_VADJUST);
			
			silverButton:SetNormalTexture("");
			_G[frameName.."SilverButtonText"]:SetPoint("RIGHT", 0, MONEY_TEXT_VADJUST);
			
			goldButton:SetNormalTexture("");
			_G[frameName.."GoldButtonText"]:SetPoint("RIGHT", 0, MONEY_TEXT_VADJUST);
			
		end
		
		copperButton:SetText(copper .. COPPER_AMOUNT_SYMBOL);
		copperButton:SetWidth(copperButton:GetTextWidth());
		copperButton:Show();
		
		silverButton:SetText(silver .. SILVER_AMOUNT_SYMBOL);
		silverButton:SetWidth(silverButton:GetTextWidth());
		silverButton:Show();
		
		goldButton:SetText(goldDisplay .. GOLD_AMOUNT_SYMBOL);
		goldButton:SetWidth(goldButton:GetTextWidth());
		goldButton:Show();
		
	else
		
		if ( frame.colorblind or not frame.vadjust or frame.vadjust ~= MONEY_TEXT_VADJUST ) then
			
			frame.colorblind = nil;
			frame.vadjust = MONEY_TEXT_VADJUST;
			
			local texture = CreateMoneyButtonNormalTexture(copperButton, iconWidth);
			texture:SetTexCoord(0.5, 0.75, 0, 1);
			_G[frameName.."CopperButtonText"]:SetPoint("RIGHT", -iconWidth, MONEY_TEXT_VADJUST);
			
			texture = CreateMoneyButtonNormalTexture(silverButton, iconWidth);
			texture:SetTexCoord(0.25, 0.5, 0, 1);
			_G[frameName.."SilverButtonText"]:SetPoint("RIGHT", -iconWidth, MONEY_TEXT_VADJUST);
			
			texture = CreateMoneyButtonNormalTexture(goldButton, iconWidth);
			texture:SetTexCoord(0, 0.25, 0, 1);
			_G[frameName.."GoldButtonText"]:SetPoint("RIGHT", -iconWidth, MONEY_TEXT_VADJUST);
			
		end
		
		copperButton:SetText(copper);
		copperButton:SetWidth(copperButton:GetTextWidth() + iconWidth);
		copperButton:Show();
		
		silverButton:SetText(silver);
		silverButton:SetWidth(silverButton:GetTextWidth() + iconWidth);
		silverButton:Show();
		
		goldButton:SetText(goldDisplay);
		goldButton:SetWidth(goldButton:GetTextWidth() + iconWidth);
		goldButton:Show();
		
	end
		
	-- Store how much money the frame is displaying
	frame.staticMoney = money;
	frame.showTooltip = nil;
	
	-- If not collapsable or not using maxDisplayWidth don't need to continue
	if ( not info.collapse and not maxDisplayWidth ) then
		return;
	end

	local width = 1

	local showLowerDenominations, truncateCopper;
	if ( gold > 0 ) then
		width = width + goldButton:GetWidth();
		if ( info.showSmallerCoins ) then
			showLowerDenominations = 1;
		end
		if ( info.truncateSmallCoins ) then
			truncateCopper = 1;
		end
	else
		goldButton:Hide();
	end

	goldButton:ClearAllPoints();
	local hideSilver = true;
	if ( silver > 0 or showLowerDenominations ) then
		hideSilver = false;
		-- Exception if showLowerDenominations and fixedWidth
		if ( showLowerDenominations and info.fixedWidth ) then
			silverButton:SetWidth(COIN_BUTTON_WIDTH);
		end
		
		local silverWidth = silverButton:GetWidth();
		goldButton:SetPoint("RIGHT", frameName.."SilverButton", "LEFT", spacing, 0);
		if ( goldButton:IsShown() ) then
			silverWidth = silverWidth - spacing;
		end
		if ( info.showSmallerCoins ) then
			showLowerDenominations = 1;
		end
		-- hide silver if not enough room
		if ( maxDisplayWidth and (width + silverWidth) > maxDisplayWidth ) then
			hideSilver = true;
			frame.showTooltip = true;
		else
			width = width + silverWidth;
		end
	end
	if ( hideSilver ) then
		silverButton:Hide();
		goldButton:SetPoint("RIGHT", frameName.."SilverButton",	"RIGHT", 0, 0);
	end

	-- Used if we're not showing lower denominations
	silverButton:ClearAllPoints();
	local hideCopper = true;
	if ( (copper > 0 or showLowerDenominations or info.showSmallerCoins == "Backpack" or forceShow) and not truncateCopper) then
		hideCopper = false;
		-- Exception if showLowerDenominations and fixedWidth
		if ( showLowerDenominations and info.fixedWidth ) then
			copperButton:SetWidth(COIN_BUTTON_WIDTH);
		end
		
		local copperWidth = copperButton:GetWidth();
		silverButton:SetPoint("RIGHT", frameName.."CopperButton", "LEFT", spacing, 0);
		if ( silverButton:IsShown() or goldButton:IsShown() ) then
			copperWidth = copperWidth - spacing;
		end
		-- hide copper if not enough room
		if ( maxDisplayWidth and (width + copperWidth) > maxDisplayWidth ) then
			hideCopper = true;
			frame.showTooltip = true;
		else
			width = width + copperWidth;
		end
	end
	if ( hideCopper ) then
		copperButton:Hide();
		silverButton:SetPoint("RIGHT", frameName.."CopperButton", "RIGHT", 0, 0);
	end

	-- make sure the copper button is in the right place
	copperButton:ClearAllPoints();
	copperButton:SetPoint("RIGHT", frameName, "RIGHT", 0, 0);

	-- attach text now that denominations have been computed
	local prefixText = _G[frameName.."PrefixText"];
	if ( prefixText ) then
		if ( prefixText:GetText() and money > 0 ) then
			prefixText:Show();
			copperButton:ClearAllPoints();
			copperButton:SetPoint("RIGHT", frameName.."PrefixText", "RIGHT", width, 0);
			width = width + prefixText:GetWidth();
		else
			prefixText:Hide();
		end
	end
	local suffixText = _G[frameName.."SuffixText"];
	if ( suffixText ) then
		if ( suffixText:GetText() and money > 0 ) then
			suffixText:Show();
			suffixText:ClearAllPoints();
			suffixText:SetPoint("LEFT", frameName.."CopperButton", "RIGHT", 0, 0);
			width = width + suffixText:GetWidth();
		else
			suffixText:Hide();
		end
	end

	frame:SetWidth(width);

	-- check if we need to toggle mouse events for the currency buttons to present tooltip
	-- the events are always enabled if info.canPickup is true
	if ( maxDisplayWidth and not info.canPickup ) then
		local mouseEnabled = goldButton:IsMouseEnabled();
		if ( frame.showTooltip and not mouseEnabled ) then
			goldButton:EnableMouse(true);
			silverButton:EnableMouse(true);
			copperButton:EnableMouse(true);
		elseif ( not frame.showTooltip and mouseEnabled ) then
			goldButton:EnableMouse(false);
			silverButton:EnableMouse(false);
			copperButton:EnableMouse(false);
		end
	end
end

