local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table
local C_MountJournal = _G.C_MountJournal

local loc_id = ArkInventory.Const.Location.Mount
local PLAYER_MOUNT_LEVEL = 20


ArkInventory.Tradeskill = {
	Const = {
		Frame = nil,
		Type = {
			Enchant = 1,
			Result = 2,
			Recipe = 3,
		},
	},
}


local collection = {
	
	sv = nil, -- set after sv is ready
	cache = { }, -- [enchantID] = recipe info table
	taughtby = { }, -- [itemID] = enchantID
	result = { }, -- [itemID] = enchantID
	xref = { }, -- [enchantID] = xref entry was imported (wont exist unless dataexport is enabled)
	
	isInit = false,
	isReady = false,
	isClosed = true,
	isScanning = false,
	queue = { }, -- [skillID] = true
	
}


function ArkInventory.Tradeskill.ExtractData( )
	if not ArkInventory.Global.dataexport then
		ArkInventory.OutputWarning( "ArkInventory.Global.dataexport is not enabled" )
	else
		local x
		ArkInventory.Table.Wipe( ArkInventory.db.extract )
		for enchant, ed in pairs( collection.sv.enchant ) do
			if not collection.xref[enchant] then
				x = string.format( "%s|%s|%s|%s|%s|%s|%s|%s|0", ed.s, ed.cat, enchant, ed.r or 0, ed.t or 0, ed.name or "", ed.rank or 0, ed.src or -1 )
				table.insert( ArkInventory.db.extract, x )
				ArkInventory.Output( string.gsub( x, "\124", "**" ) )
			end
		end
	end
	
end


local ImportCrossRefTable = {
-- skillID|categoryID|enchantID|resultID|taughtbyID|name|rank|source
}

local function helper_CreateXrefKeys( key1, key2 )
	
	local osd = ArkInventory.ObjectStringDecode( key1 )
	if type( osd.id ) ~= "number" or osd.id == 0 then return end
	
	osd = ArkInventory.ObjectStringDecode( key2 )
	if type( osd.id ) ~= "number" or osd.id == 0 then return end
	
	--ArkInventory.Output( key1, " / ", key2 )
	
	if not ArkInventory.Global.ItemCrossReference[key1] then
		ArkInventory.Global.ItemCrossReference[key1] = { }
	end
	ArkInventory.Global.ItemCrossReference[key1][key2] = true
	
	if not ArkInventory.Global.ItemCrossReference[key2] then
		ArkInventory.Global.ItemCrossReference[key2] = { }
	end
	ArkInventory.Global.ItemCrossReference[key2][key1] = true
	
	return true
	
end

function ArkInventory.Tradeskill.ImportCrossRefTable( )
	
	if not ArkInventory.Tradeskill.IsReady( ) then return end
	if not ImportCrossRefTable then return end
	
	local sv = collection.sv
	local osd, ok, ed, skill, category, enchant, result, taughtby, name, rank, source
	
	-- update the cached data from the xref import table
	for k, v in pairs( ImportCrossRefTable ) do
		
		ok = true
		
		skill, category, enchant, result, taughtby, name, rank, source = strsplit( "\124", v )
		
		skill = tonumber( skill )
		if not skill then
			--ArkInventory.Output( "bad skill" )
			ok = false
		end
		
		category = tonumber( category )
		if not category then
			--ArkInventory.Output( "bad category" )
			ok = false
		end
		
		osd = ArkInventory.ObjectStringDecode( enchant )
		if osd.id == 0 or osd.h_base ~= enchant then
			ok = false
		end
		enchant = osd.h_base
		
		if result ~= "-1" then
			osd = ArkInventory.ObjectStringDecode( result )
			if osd.id == 0 or result == enchant then
				--ArkInventory.Output( "bad result" )
				ok = false
			end
			result = osd.h_base
		end
		
		if taughtby ~= "-1" then
			osd = ArkInventory.ObjectStringDecode( taughtby )
			if osd.id == 0 or osd.h_base == result then
				--ArkInventory.Output( "bad taughtby" )
				ok = false
			end
			taughtby = osd.h_base
		end
		
		if not name or name == "" then
			--ArkInventory.Output( "bad name" )
			ok = false
		end
		
		rank = tonumber( rank )
		if not rank then
			--ArkInventory.Output( "bad rank" )
			ok = false
		end
		
		if not source then
			ok = false
		end
		
		
		
		if ok then
			
			collection.xref[enchant] = true
			
			if helper_CreateXrefKeys( taughtby, enchant ) then
				collection.taughtby[taughtby] = enchant
			end
			
			ed = sv.enchant[enchant]
			ed.s = skill
			ed.r = result
			
			sv.result[result][enchant] = skill
			
			if ArkInventory.Global.dataexport then
				ed.cat = category
				ed.t = taughtby
				ed.name = name
				ed.src = source
				ed.rank = rank
			end
			--ArkInventory.Output( enchant, " = ", ed )
			
			
		else
			
			ArkInventory.OutputWarning( "code issue: bad xref entry [", v, "].  please let the author know" )
			
		end
		
	end
	
	
	-- use the cached data to create the xref keys for result
	for enchant, ed in pairs( sv.enchant ) do
		
		if helper_CreateXrefKeys( enchant, ed.r ) then
			--collection.result[ed.r] = enchant
		end
		
		-- clean up any leftover export data
		if not ArkInventory.Global.dataexport then
			ed.cat = nil
			ed.name = nil
			ed.rank = nil
			ed.src = nil
		end
		
	end
	
	
	ArkInventory.Table.Wipe( ImportCrossRefTable )
	ImportCrossRefTable = nil
	
end

function ArkInventory.Tradeskill.IsReady( )
	return collection.isReady
end

function ArkInventory.Tradeskill.OnHide( )
	ArkInventory:SendMessage( "EVENT_ARKINV_TRADESKILL_UPDATE_BUCKET", "FRAME_HIDE" )
end

function ArkInventory.Tradeskill.GetRecipeIDForItemID( itemID )
end

function ArkInventory.Tradeskill.GetItemIDForRecipeID( recipeID )
end

function ArkInventory.Tradeskill.Iterate( skillID )
	
	local i = 0
	local tbl = { }
	local data = collection.cache
	if type( skillID ) == "number" then
		for k, v in pairs( data ) do
			if v.skillID == skillID then
				table.insert( tbl, k )
			end
		end
	end
	--table.sort( tbl )
	
	return function( )
		i = i + 1
		if i > #tbl then
			return
		else
			return tbl[i], data[tbl[i]]
		end
	end
	
end

function ArkInventory.Tradeskill.isEnchant( h )
	
	if not ArkInventory.Tradeskill.IsReady( ) then return end
	
	local osd = ArkInventory.ObjectStringDecode( h )
	local info = collection.sv.enchant[osd.h_base]
	if info.s ~= 0 then
		return info
	end
	
end

function ArkInventory.Tradeskill.isResultItem( h )
	
	if not ArkInventory.Tradeskill.IsReady( ) then return end
	
	local osd = ArkInventory.ObjectStringDecode( h )
	--return osd.h_base, collection.result[osd.h_base]
	return ArkInventory.db.cache.tradeskill.result[osd.h_base]
	
end

function ArkInventory.Tradeskill.isRecipeItem( h )
	
	if not ArkInventory.Tradeskill.IsReady( ) then return end
	
	local osd = ArkInventory.ObjectStringDecode( h )
	return collection.taughtby[osd.h_base]
	
end

function ArkInventory.Tradeskill.isTradeskillObject( h )
	
	if not ArkInventory.Tradeskill.IsReady( ) then return end
	
	local info = ArkInventory.Tradeskill.isEnchant( h )
	if info then
		return ArkInventory.Tradeskill.Const.Type.Enchant, info
	end
	
	info = ArkInventory.Tradeskill.isResultItem( h )
	if info then
		return ArkInventory.Tradeskill.Const.Type.Result, info
	end
	
	key = ArkInventory.Tradeskill.isRecipeItem( h )
	if key then
		info = ArkInventory.Tradeskill.isEnchant( key )
		return ArkInventory.Tradeskill.Const.Type.Recipe, info
	end
	
end


local function helper_GoodToScan1( )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	if not ArkInventory.Tradeskill.IsReady( ) then return end
	
	local loc_id = ArkInventory.Const.Location.Tradeskill
	if not ArkInventory.ClientCheck( ArkInventory.Global.Location[loc_id].ClientCheck ) then
		ArkInventory.OutputDebug( "TRADESKILL: SCAN ABORTED> tradeskill location is not supported in this expansion" )
		return
	end
	
	local loc_id = ArkInventory.Const.Location.Tradeskill
	if not ArkInventory.isLocationMonitored( loc_id ) then
		ArkInventory.OutputDebug( "TRADESKILL: SCAN ABORTED> tradeskill location not monitored" )
		return
	end
	
	return true
	
end

local function helper_GoodToScan2( )
	
	if not helper_GoodToScan1( ) then return end
	
	if not C_TradeSkillUI then
		ArkInventory.OutputDebug( "TRADESKILL: SCAN ABORTED> C_TradeSkillUI does not exist" )
		return
	end
	
	if not ArkInventory.Tradeskill.Const.Frame then
		ArkInventory.OutputDebug( "TRADESKILL: SCAN ABORTED> tradeskill frame does not exist" )
		return
	end
	
	if not ArkInventory.Tradeskill.Const.Frame:IsVisible( ) then
		ArkInventory.OutputDebug( "TRADESKILL: SCAN ABORTED> ", ArkInventory.Tradeskill.Const.Frame:GetName( ), " window is no longer open" )
		return
	end
	
	if not C_TradeSkillUI.IsTradeSkillReady( ) then
		ArkInventory.OutputDebug( "TRADESKILL: SCAN ABORTED> not ready" )
		return
	end
	
	if C_TradeSkillUI.IsTradeSkillGuild( ) then
		ArkInventory.OutputDebug( "TRADESKILL: SCAN ABORTED> guild linked" )
		return
	end
	
	if C_TradeSkillUI.IsTradeSkillLinked( ) then
		
		local codex = ArkInventory.GetPlayerCodex( )
		local link, linkedPlayerName = C_TradeSkillUI.GetTradeSkillListLink( )
		
		local osd = ArkInventory.ObjectStringDecode( link )
		if osd.id ~= codex.player.data.info.guid then
			ArkInventory.OutputDebug( "TRADESKILL: SCAN ABORTED> linked from another player: ", osd.id, " (", linkedPlayerName, ")" )
			return
		else
			--ArkInventory.OutputDebug( "TRADESKILL: LINKED> but its mine: ", osd.id )
			-- although the number of recipies dont seem to line up???
			-- posibly due the higher ranked recipes not being included in a linked list
			-- or it could be something else, when i figure it out i'll do something with it
			ArkInventory.OutputDebug( "TRADESKILL: SCAN ABORTED> linked has issues i need to sort out first" )
			return
		end
		
	end
	
	
	local info = ArkInventory.CrossClient.UIGetProfessionInfo( )
	ArkInventory.OutputDebug( "TRADESKILL: ui profession is ", info.parentProfessionID or info.professionID, " / ", info )
	return info.parentProfessionID or info.professionID
	
end

local function helper_LoadRecipe( skillID, rid )
	
	local cache = collection.cache
	local key, osd
	
	--/dump C_TradeSkillUI.GetRecipeInfo( 184493 )
	--/dump C_TradeSkillUI.GetRecipeInfo( 378302 )
	
	local info = C_TradeSkillUI.GetRecipeInfo( rid )
	if info and ( info.type == "recipe" or info.createsItem ) and not info.isDummyRecipe then
		
		info.link = C_TradeSkillUI.GetRecipeLink( rid )
		osd = ArkInventory.ObjectStringDecode( info.link )
		key = osd.h_base
		
		if not cache[key] then
			
			info.key = key
			info.skillID = skillID
			
			info.recipeHB = key
			
			info.resultLink = C_TradeSkillUI.GetRecipeItemLink( rid )
			osd = ArkInventory.ObjectStringDecode( info.resultLink )
			info.resultHB = osd.h_base
			
			if osd.id == 0 or osd.h_base == key then
				info.resultLink = "item:0"
				info.resultHB = "0"
			end
			
			if info.previousRecipeID then
				osd = C_TradeSkillUI.GetRecipeLink( info.previousRecipeID )
				osd = ArkInventory.ObjectStringDecode( osd )
				info.previousRecipeID = osd.id
				info.previousRecipeHB = osd.h_base
			end
			
			if info.nextRecipeID then
				osd = C_TradeSkillUI.GetRecipeLink( info.nextRecipeID )
				osd = ArkInventory.ObjectStringDecode( osd )
				info.nextRecipeID = osd.id
				info.nextRecipeHB = osd.h_base
			end
			
			
			cache[key] = info
			
			update = true
			
			
		elseif cache[key].learned ~= info.learned then
			update = true
		end
		
	end
	
	return key, info, update
	
end

local function Scan_UI( )
	
	local update = false
	
	if not helper_GoodToScan2( ) then return end
	
	local codex = ArkInventory.GetPlayerCodex( )
	local link, linkedPlayerName = C_TradeSkillUI.GetTradeSkillListLink( )
	local info = ArkInventory.CrossClient.UIGetProfessionInfo( )
	
	local skillID = info.parentProfessionID or info.professionID
	local name = info.parentProfessionName or info.professionName
	ArkInventory.OutputDebug( "TRADESKILL: SCANNING TRADESKILL [", skillID, "]=[", name, "]" )
	
	local recipeList = C_TradeSkillUI.GetAllRecipeIDs( )
	
	local cache = collection.cache
	local sv = collection.sv
	
	local sd = sv.data[skillID]
	sd.id = skillID
	sd.link = link
	sd.name = name
	sd.icon = C_TradeSkillUI.GetTradeSkillTexture( skillID )
	sd.numTotal = #recipeList
	
	local known = 0
	local info, osd, key
	for _, rid in pairs( recipeList ) do
		--ArkInventory.OutputDebug( "TRADESKILL: SCANNING RECIPE [", rid, "]" )
		key, info, update = helper_LoadRecipe( skillID, rid )
		if info then
			
			if not key then
				
				--ArkInventory.Output( "nil key returned for recipe [", rid, "] [", info, "]" )
				
			else
				
				if info.learned then
					known = known + 1
				end
				
				sv.enchant[key].s = skillID
				
				if sv.enchant[key].r == "0" then
					-- do not update unless result is empty.  it shouldnt change from blizzards side, and we can clear it if we have to, but this allows us to correct it
					sv.enchant[key].r = info.resultHB
				end
				
				if ArkInventory.Global.dataexport then
					sv.enchant[key].cat = cache[key].categoryID
					sv.enchant[key].name = cache[key].name
					sv.enchant[key].src = cache[key].sourceType
				end
				
				
				osd = ArkInventory.ObjectStringDecode( info.resultLink )
				if osd.h_base ~= key then
					--collection.result[osd.h_base] = key
					--ArkInventory.Output( "sv.result[", info.resultHB, "][", key, "] = ", skillID )
					sv.result[osd.h_base][key] = skillID
				end
				
				if update then
					helper_CreateXrefKeys( key, info.resultHB )
				end
			
			end
			
		else
			
			ArkInventory.OutputWarning( "bad recipe data: ", rid, " = ", info )
			
		end
		
	end
	sd.numKnown = known
	
	
	local ranks = { }
	local rank, xid, xinfo
	for key, info in pairs( cache ) do
		if info.skillID == skillID and ( info.previousRecipeHB or info.nextRecipeHB ) and not info.rank then
			
			xinfo = info
			
			xid = xinfo.recipeHB
			while xid do
				
				xinfo = cache[xid]
				if not xinfo then
					ArkInventory.OutputWarning( "code issue: tradeskill rank (prev) chain is broken at ", xid )
				end
				
				xid = xinfo.previousRecipeHB
				
			end
			-- xinfo is at the base recipe
			
			
			
			-- now we go back up
			ArkInventory.Table.Wipe( ranks )
			rank = 0
			
			xid = xinfo.recipeHB
			while xid do
				
				xinfo = cache[xid]
				if not xinfo then
					ArkInventory.OutputWarning( "code issue: tradeskill rank (next) chain is broken at ", xid )
				end
				
				rank = rank + 1
				xinfo.rank = rank
				table.insert( ranks, xid )
				if ArkInventory.Global.dataexport then
					sv.enchant[xid].rank = rank
				end
				
				xid = xinfo.nextRecipeHB
				
			end
			
			-- update max rank on entire chain
			for _, xid in pairs( ranks ) do
				xinfo = cache[xid]
				xinfo.rankMax = rank
			end
			
		end
		
	end
	
	
	ArkInventory.OutputDebug( "TRADESKILL: SCAN COMPLETE> ", sd.numTotal, " exist, ", sd.numKnown, " known" )
	
	collection.queue[skillID] = nil
	
	if update then
		ArkInventory.OutputDebug( "TRADESKILL: SCHEDULE UPDATE" )
		ArkInventory:SendMessage( "EVENT_ARKINV_TRADESKILL_UPDATE_BUCKET", "UPDATE" )
	else
		ArkInventory.OutputDebug( "TRADESKILL: IGNORED (NO UPDATES FOUND)" )
	end
	
end

local function Scan_Threaded( thread_id )
	
	ArkInventory.OutputDebug( "TRADESKILL: SCAN THREAD START" )
	
	if collection.hasSound == nil then
		collection.hasSound = ArkInventory.CrossClient.GetCVarBool( "Sound_EnableSFX" )
		--ArkInventory.Output( "AUDIO IS MUTED? ", not hasSound )
	end
	
	if collection.hasSound then
		ArkInventory.CrossClient.SetCVar( "Sound_EnableSFX", "0" )
		ArkInventory.ThreadYield( thread_id )
	end
	
	
	while true do
		
		-- infinite loop until queue is empty
		
		ArkInventory.OutputDebug( "TRADESKILL: QUEUE = ", collection.queue )
		
		-- get next in queue
		local skillID
		for k in pairs( collection.queue ) do
			skillID = k
			break
		end
		
		if not skillID then
			if collection.hasSound then
				-- restore sound
				ArkInventory.CrossClient.SetCVar( "Sound_EnableSFX", "1" )
				ArkInventory.ThreadYield( thread_id )
			end
			collection.hasSound = nil
			return
		end
		
		
		--ArkInventory.Output( " " )
		
		if ArkInventory.Tradeskill.Const.Frame and ArkInventory.Tradeskill.Const.Frame:IsVisible( ) and collection.isOpened then
			-- i opened it but its not closed
			-- the thread probably got restarted
			-- close it and keep going
			--ArkInventory.Output( "TRADESKILL: THREAD RESTART? - WINDOW IS OPEN - CLOSING WINDOW" )
			
			C_TradeSkillUI.CloseTradeSkill( )
			ArkInventory.ThreadYield( thread_id )
			
		end
		
		
		ArkInventory.OutputDebug( "TRADESKILL: CHECK WINDOW IS CLOSED" )
		--while not collection.isClosed do
		while ArkInventory.Tradeskill.Const.Frame and ArkInventory.Tradeskill.Const.Frame:IsVisible( ) do
			-- if the user has the tradeskill window opened, wait here until it is closed
			ArkInventory.ThreadYield( thread_id )
		end
		ArkInventory.OutputDebug( "TRADESKILL: WINDOW IS CLOSED" )
		
		
		ArkInventory.OutputDebug( "TRADESKILL: OPEN WINDOW [", skillID, "]" )
		collection.isScanDone = false
		collection.isOpened = true
		
		C_TradeSkillUI.OpenTradeSkill( skillID ) -- NOTE this is a protected function in dragonflight
		ArkInventory.ThreadYield( thread_id )
		
		
		-- wait for the event to trigger a scan and get back to us
		ArkInventory.OutputDebug( "TRADESKILL: WAITING FOR SCAN [", skillID, "]" )
		while not collection.isScanDone do
			ArkInventory.ThreadYield( thread_id )
		end
		
		ArkInventory.OutputDebug( "TRADESKILL: SCAN COMPLETED [", skillID, "]" )
		
		-- have to close the window or archaeology causes issues with the next tradeskill as it wasnt meant to be opened this way
		
		
		ArkInventory.OutputDebug( "TRADESKILL: CLOSING WINDOW" )
		
		C_TradeSkillUI.CloseTradeSkill( )
		ArkInventory.ThreadYield( thread_id )
		
		
		while ArkInventory.Tradeskill.Const.Frame and ArkInventory.Tradeskill.Const.Frame:IsVisible( ) do
			-- if the user has the tradeskill window opened, wait here until it is closed
			ArkInventory.ThreadYield( thread_id )
		end
		collection.isOpened = false
		
		ArkInventory.OutputDebug( "TRADESKILL: WINDOW IS CLOSED" )
		
	end
	
	ArkInventory.OutputDebug( "TRADESKILL: SCAN THREAD END" )
	
end

local function Scan( )
	
	ArkInventory.Tradeskill.ImportCrossRefTable( )
	
	ArkInventory.OutputDebug( "TRADESKILL: SCAN START" )
	
	local thread_id = ArkInventory.Global.Thread.Format.Tradeskill
	
	local thread_func = function( )
		Scan_Threaded( thread_id )
	end
	
	ArkInventory.ThreadStart( thread_id, thread_func )
	
end


function ArkInventory:EVENT_ARKINV_TRADE_SKILL_ITEM_CRAFTED_RESULT( ... )
	
	local event, id, success = ...
	ArkInventory.OutputDebug( "[", event, "] [", id, "] [", success, "]" )
	
end

--function ArkInventory.ScrollBoxListViewMixin_CalculateDataIndices( ... )
function ArkInventory.testing1840( )
	
--	ArkInventory.testing1840( )
	
	local resultData = {
		qualityProgress = 0,
		recraftable = false,
		critBonusSkill = 0,
		firstCraftReward = false,
		itemGUID = "Item-3276-0-400000093E85BE38",
		multicraft = 0,
		quantity = 1,
		itemID = 210395,
		isCrit = false,
		hyperlink = "item:210395::::::::70:260::42:4:6652:9559:1494:8767:1:28:2699:::::",
		operationID = 119964300,
		isEnchant = true,
		bonusCraft = false,
		bonusData = {},
	}
	
	local function GetFrameExtent(self, frame)
		local width, height = frame:GetSize();
		ArkInventory.Output( "width = [", width, "]" )
		ArkInventory.Output( "height = [", height, "]" )
		ArkInventory.Output( "isHorizontal = [", self.isHorizontal, "]" )
		return self.isHorizontal and width or height;
	end

	
	local function GetExtent(self)
		
		local z1 = GetFrameExtent(self, self:GetScrollTarget())
		ArkInventory.Output( "GetFrameExtent = [", z1, "]" )
		
		return z1
	end

	local function GetDerivedExtent(self)
		local view = self:GetView();
		if view then
			local z1 = GetExtent(view, self);
			ArkInventory.Output( "GetExtent = [", z1, "]" )
			return z1;
		end
		return 0;
	end

	local function GetDerivedScrollRange(self)
		local z1 = GetDerivedExtent(self)
		ArkInventory.Output( "GetDerivedExtent = [", z1, "]" )
		local z2 = self:GetVisibleExtent()
		ArkInventory.Output( "GetVisibleExtent = [", z2, "]" )
		return math.max(0, z1 - z2);
	end

	local function GetDerivedScrollOffset(self)
		local z1 = GetDerivedScrollRange(self)
		ArkInventory.Output( "GetDerivedScrollRange = [", z1, "]" )
		local z2 = self:GetScrollPercentage()
		ArkInventory.Output( "GetScrollPercentage = [", z2, "]" )
		
		return z1 * z2;
	end

	local function HasIdenticalElementExtents(self)
		if self.elementExtentCalculator then
			return false;
		end
		
		if self.elementExtent then
			return true;
		end

		return self:HasEqualTemplateInfoExtents();
	end
	
	local function GetElementExtent(self, dataIndex)
		
		ArkInventory.Output( "dataIndex = [", dataIndex, "]" )
		ArkInventory.Output( "elementExtent = [", self.elementExtent, "]" )
		
		if self:HasIdenticalElementExtents() then 
			ArkInventory.Output( "+HasIdenticalElementExtents" )
			return self:GetIdenticalElementExtents();
		end

		local extent = 0;
		if self.calculatedElementExtents then	
			ArkInventory.Output( "+calculatedElementExtents" )
			extent = self.calculatedElementExtents[dataIndex];
			--ValidateExtent(self.calculatedElementExtents, dataIndex);
		elseif self.templateExtents then
			ArkInventory.Output( "+templateExtents" )
			extent = self.templateExtents[dataIndex];
			--ValidateExtent(self.templateExtents, dataIndex);
		end
		
		ArkInventory.Output( "GetElementExtent = [", extent, "]" )
		return extent;
	end

	local function CheckDataIndicesReturn(dataIndexBegin, dataIndexEnd)
		-- Erroring here to prevent the client from lockup if 100,000 frames are requested. This can happen
		-- if a frame doesn't correct frame extents (1 height/width), causing a much larger range to be displayed than expected.
		local size = dataIndexEnd - dataIndexBegin;
		local capacity = 500;
		if size >= capacity then
			error(string.format("ScrollBoxListViewMixin:CalculateDataIndices encountered an unsupported size. %d/%d", size, capacity));
		end
		
		return dataIndexBegin, dataIndexEnd;
	end
	
	local function CalculateDataIndices(self, scrollBox)
		
		local stride = self:GetStride( );
		local spacing = self:GetSpacing( );
		
		local size = self:GetDataProviderSize();
		if size == 0 then
			return 0, 0;
		end
		
		if not self:IsVirtualized() then
			return CheckDataIndicesReturn(1, size);
		end

		self:RecalculateExtent(scrollBox, stride, spacing); --prevents the assert in GetElementExtent

		local dataIndexBegin;
		local scrollOffset = Round(GetDerivedScrollOffset(scrollBox));
		if scrollOffset ~= 0 then
			ArkInventory.Output( "scrollOffset = [", scrollOffset, "] FAIL" )
			return
		end
		ArkInventory.Output( "scrollOffset = [", scrollOffset, "] PASS" )
		
		local upperPadding = scrollBox:GetUpperPadding();
		local extentBegin = upperPadding;
		-- For large element ranges (i.e. 10,000+), we're required to use identical element extents 
		-- to avoid performance issues. We're calculating the number of elements that partially or fully
		-- fit inside the extent of the scroll offset to obtain our reference position. If we happen to
		-- be using a traditional data provider, this optimization is still useful.
		if HasIdenticalElementExtents(self) then
			ArkInventory.Output("HasIdenticalElementExtents")
			local extentWithSpacing = self:GetIdenticalElementExtents() + spacing;
			local intervals = math.floor(math.max(0, scrollOffset - upperPadding) / extentWithSpacing);
			dataIndexBegin = 1 + (intervals * stride);
			local extentTotal = (1 + intervals) * extentWithSpacing;
			extentBegin = extentBegin + extentTotal;
		else
			do
				dataIndexBegin = 1 - stride;
				repeat
					ArkInventory.Output( "loop ", dataIndexBegin )
					dataIndexBegin = dataIndexBegin + stride;
					local extentWithSpacing = GetElementExtent(self, dataIndexBegin) + spacing;
					extentBegin = extentBegin + extentWithSpacing;
					ArkInventory.Output( "loop ", extentBegin, " > ", scrollOffset )
				until (extentBegin > scrollOffset);
			end
		end
		
		ArkInventory.Output( "end loop" )
		
		-- Addon request to exclude the first element when only spacing is visible.
		-- This will be revised when per-element spacing support is added.
		ArkInventory.Output( "extentBegin = [", extentBegin, "]" )
		ArkInventory.Output( "spacing = [", spacing, "]" )
		ArkInventory.Output( "scrollOffset = [", scrollOffset, "]" )
		
		ArkInventory.Output( "(", spacing, ">0) and ((", extentBegin-spacing, "<", scrollOffset, ")" )
		if (spacing > 0) and ((extentBegin - spacing) < scrollOffset) then
			ArkInventory.Output( "failed" )
			dataIndexBegin = dataIndexBegin + stride;
			extentBegin = extentBegin + GetElementExtent(self, dataIndexBegin) + spacing;
		end

		-- Optimization above for fixed element extents is not necessary here because we do
		-- not need to iterate over the entire data range. The iteration is limited to the
		-- number of elements that can fit in the displayable area.
		local extentEnd = scrollBox:GetVisibleExtent() + scrollOffset;
		local extentNext = extentBegin;
		local dataIndexEnd = dataIndexBegin;
		while (dataIndexEnd < size) and (extentNext < extentEnd) do
			local nextDataIndex = dataIndexEnd + stride;
			dataIndexEnd = nextDataIndex;

			-- We're oor, which is expected in the case of stride > 1. In this case we're done
			-- and the dataIndexEnd will be clamped into range of the data provider below.
			local extent = GetElementExtent(self, nextDataIndex);
			if extent == nil or extent == 0 then
				break;
			end

			extentNext = extentNext + extent + spacing;
		end

		if stride > 1 then
			dataIndexEnd = math.min(dataIndexEnd - (dataIndexEnd % stride) + stride, size);
		else
			dataIndexEnd = math.min(dataIndexEnd, size);
		end

		return CheckDataIndicesReturn(dataIndexBegin, dataIndexEnd);
	end
	
	local function ValidateDataRange(self,scrollBox)
		-- Calculate the range of indices to display.
		local oldDataIndexBegin, oldDataIndexEnd = self:GetDataRange();
		local dataIndexBegin, dataIndexEnd = CalculateDataIndices(self, scrollBox);

		-- Invalidation occurs whenever the data provider is sorted, the size changes, or the data provider is replaced.
		local invalidated = self:IsInvalidated();
		local rangeChanged = invalidated or oldDataIndexBegin ~= dataIndexBegin or oldDataIndexEnd ~= dataIndexEnd;
		if rangeChanged then
			local dataProvider = self:GetDataProvider();
			--[[
				local size = dataProvider and dataProvider:GetSize() or 0;
				print(string.format("%d - %d of %d, invalidated =", dataIndexBegin, dataIndexEnd, 
					size), invalidated, GetTime());
			--]]

			self:SetDataRange(dataIndexBegin, dataIndexEnd);

			-- Frames are generally recyclable when the element data is a table because we can uniquely identify it.
			-- Note that if an invalidation occurred due to the data provider being exchanged, we never try and recycle.
			local canRecycle = not invalidated or self:GetInvalidationReason() ~= InvalidationReason.DataProviderReassigned;
			if canRecycle then
				for index, frame in ipairs(self:GetFrames()) do
					if type(frame:GetElementData()) ~= "table" then
						canRecycle = false;
						break;
					end
				end
			end
			
			if canRecycle then
				local acquireList = {};
				local releaseList = {};
				for index, frame in ipairs(self:GetFrames()) do
					releaseList[frame:GetElementData()] = frame;
				end

				if dataIndexBegin > 0 then
					for dataIndex, currentElementData in self:EnumerateDataProvider(dataIndexBegin, dataIndexEnd) do
						if releaseList[currentElementData] then
							local frame = releaseList[currentElementData];
							frame:SetOrderIndex(dataIndex);
							releaseList[currentElementData] = nil;
						else
							tinsert(acquireList, dataIndex);
						end
					end
				end

				for elementData, frame in pairs(releaseList) do
					self:Release(frame);
				end

				self:AcquireRange(acquireList);

			else
				for index, frame in ipairs_reverse(self:GetFrames()) do
					self:Release(frame);
				end

				local dataIndexBegin, dataIndexEnd = self:GetDataRange();
				if dataIndexEnd > 0 then
					local range = {};
					for dataIndex = dataIndexBegin, dataIndexEnd do
						table.insert(range, dataIndex);
					end
					self:AcquireRange(range);
				end
			end
			
			self:ClearInvalidation();

			self:SortFrames();

			return true;
		end
		return false;
	end
	
	local function GetDataScrollOffset(self,scrollBox)
		local dataIndexBegin, dataIndexEnd = CalculateDataIndices(self, scrollBox);
		local dataScrollOffset = self:GetExtentUntil(scrollBox, dataIndexBegin);
		return dataScrollOffset;
	end
	
	local function Update(self, forceLayout)
		if self:IsUpdateLocked() or self:IsAcquireLocked() then
			return;
		end

		local view = self:GetView();
		if not view then
			return;
		end

		self:SetUpdateLocked(true);

		local changed = ValidateDataRange(view, self);
		local requiresLayout = changed or forceLayout;
		if requiresLayout then
			self:Layout();
		end

		self:SetScrollTargetOffset(GetDerivedScrollOffset(self) - GetDataScrollOffset(view, self));
		self:SetPanExtentPercentage(self:CalculatePanExtentPercentage());
		
		if changed then
			view:InvokeInitializers();

			self:TriggerEvent(ScrollBoxListMixin.Event.OnDataRangeChanged, self:GetDataIndexBegin(), self:GetDataIndexEnd());
		end

		self:TriggerEvent(ScrollBoxListMixin.Event.OnUpdate);
		
		self:SetUpdateLocked(false);
	end

	local function SetScrollPercentageInternal(self, scrollPercentage)
		ScrollControllerMixin.SetScrollPercentage(self, scrollPercentage);
		
		Update(self);
	end

	local function SetScrollPercentage(self, scrollPercentage, noInterpolation)
		if not ApproximatelyEqual(self:GetScrollPercentage(), scrollPercentage) then
			if not noInterpolation and self:CanInterpolateScroll() then
				self:Interpolate(scrollPercentage, self.scrollInternal);
			else
				SetScrollPercentageInternal(self, scrollPercentage);
			end
		end
	end
	
	local function ScrollToEnd(self, noInterpolation)
		SetScrollPercentage(self, 1, noInterpolation);
	end
	
	local function FinalizePendingResultData(self)
		local dataProvider = self.ScrollBox:GetDataProvider();
		if not dataProvider then
			dataProvider = CreateDataProvider();
			self.ScrollBox:SetDataProvider(dataProvider);
		end
		
		for index, resultData in ipairs_reverse(self.pendingResultData) do
			local childResultData = FindValueInTableIf(self.pendingResultData, function(data)
				return data.operationID and data.firstCraftReward and (resultData.operationID == data.operationID);
			end);
			if childResultData then
				table.remove(self.pendingResultData, index);
				table.insert(resultData.bonusData, childResultData);
			end
		end
		
		for index, resultData in ipairs_reverse(self.pendingResultData) do
			if resultData.operationID and not resultData.firstCraftReward then
				dataProvider:Insert(resultData);
			end
		end
		
		self.pendingResultData = {};
		
		if self:IsShown() then
			self:Resize();
		else
			self:Open();
		end
		
		ScrollToEnd(self.ScrollBox);
	end
	
	
--	ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBox:GetView( ):GetSpacing( )
--	ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBox:GetView( ):GetStride( )
	
	--ProfessionsFrame.CraftingPage:Reset()
	
	ProfessionsFrame:OnShow()
	
	local self = ProfessionsFrame.CraftingPage.CraftingOutputLog
	--self:Cleanup();
	
	local ScrollBox = self.ScrollBox
	--ScrollBox.panExtentPercentage = 0
	--ScrollBox.scrollPercentage = 0
	--ScrollBox:Flush();
	--ScrollBox:Hide();
	--ScrollBox:SetFrameExtent(ScrollBox:GetScrollTarget(), 0)
	--ScrollBox:Layout();
	
	local view = ScrollBox:GetView( )
	
	
--[[
	for k, v in pairs(self) do
		local t = type(v)
		if t == "number" or t == "string" then
			ArkInventory.Output( k, " = [", v, "]" )
		elseif t == "table" then
			ArkInventory.Output( k, " = [", type(v), "]" )
		end
	end
]]--
	
	
--	ArkInventory.testing1840( )
	
	
	
	
	
	
	table.insert( self.pendingResultData, resultData )
	FinalizePendingResultData(self);
	--self:FinalizePendingResultData();
	
	
end

function ArkInventory.Tradeskill.ScanHeaders( )
	
	ArkInventory.OutputDebug( "TRADESKILL: ScanHeaders" )
	
	if not ArkInventory.Global.Mode.Database then
		
		-- not ready yet
		ArkInventory:SendMessage( "EVENT_ARKINV_TRADESKILL_UPDATE_BUCKET", "SCAN_HEADERS" )
		return
		
	end
	
	if not collection.isReady then
		
		ArkInventory.OutputDebug( "TRADESKILL: init tradeskill" )
		
		collection.sv = ArkInventory.db.cache.tradeskill
		if not collection.sv then
			--ArkInventory.OutputWarning( "db.cache.tradeskill is nil" )
		else
			ArkInventory.OutputDebug( "TRADESKILL: db.cache.tradeskill is good" )
		end
		
		ArkInventory.ObjectCacheTooltipClear( )
		
		if ArkInventory.ClientCheck( ArkInventory.ENUM.EXPANSION.DRAGONFLIGHT ) then
			
--			ArkInventory.Output( "professions - start" )
			
			ArkInventory.LoadAddOn( "Blizzard_Professions" )
			
			ArkInventory.Tradeskill.Const.Frame = ProfessionsFrame
			
			--local z1 = ArkInventory.testing1840( )
			
			--local self = ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBox
			--local view = self:GetView();
			
			--ProfessionsFrame.CraftingPage.CraftingOutputLog:ProcessPendingResultData(testData)
			
--			ArkInventory.Output( "professions - end" )
			
		else
			ArkInventory.LoadAddOn( "Blizzard_TradeSkillUI" )
			ArkInventory.Tradeskill.Const.Frame = TradeSkillFrame
		end
		
		
		if not ArkInventory.Tradeskill.Const.Frame then
			ArkInventory.OutputDebug( "TRADESKILL: frame does not exist" )
		end
		
		collection.isReady = true
		
	end
	
	
	if not helper_GoodToScan1( ) then return end
	
	
	local loc_id = ArkInventory.Const.Location.Tradeskill
	local codex = ArkInventory.GetPlayerCodex( )
	
	local p = ArkInventory.CrossClient.GetProfessions( )
	ArkInventory.OutputDebug( "TRADESKILL: skills active = [", p, "]" )
	
	local info = codex.player.data.info
	info.tradeskill = info.tradeskill or { }
	ArkInventory.OutputDebug( "TRADESKILL: skills saved = [", info.tradeskill, "]" )
	
	local changed = false
	for index = 1, ArkInventory.Const.Tradeskill.maxLearn do
		
		if p[index] then
			
			local professionInfo = ArkInventory.CrossClient.GetProfessionInfo( p[index] )
			if info.tradeskill[index] ~= professionInfo.skillLine then
				
				if info.tradeskill[index] then
					
					-- had a different skill here before
					
					local oldSkillID = info.tradeskill[index]
					--ArkInventory.Output( "tradeskill [", index, "] changed from [", oldSkillID, "] ", ArkInventory.Const.Tradeskill.Data[oldSkillID].text, " to [", professionInfo.skillLine, "] ", professionInfo.name )
					
					-- need to clean codex.player.data.tradeskill.data[oldSkillID]
					
				else
					
					-- learnt a tradeskill
					--ArkInventory.Output( "tradeskill [", index, "] learnt [", professionInfo.skillLine, "] [", professionInfo.name, "]" )
					collection.queue[professionInfo.skillLine] = true
					
				end
				
				changed = true
				info.tradeskill[index] = professionInfo.skillLine
				
			end
			
			if ArkInventory.isLocationMonitored( loc_id ) and codex.profile.location[loc_id].loadscan and not collection.isInit then
				ArkInventory.OutputDebug( "TRADESKILL: QUEUE ADD ", professionInfo.skillLine )
				if Skillet and Skillet:IsEnabled( ) then
					-- ignore scan on load
				else
					collection.queue[professionInfo.skillLine] = true
					changed = true
				end
			end
			
		else
			
			if info.tradeskill[index] ~= nil then
				
				local oldSkillID = info.tradeskill[index]
				--ArkInventory.Output( "tradeskill [", index, "] unlearned [", oldSkillID, "] ", ArkInventory.Const.Tradeskill.Data[oldSkillID].text )
				
				-- need to clean codex.player.data.tradeskill.data[oldSkillID]
				
				changed = true
				info.tradeskill[index] = nil
				
			end
			
		end
		
	end
	
	--ArkInventory.Output( "skills = ", info.tradeskill )
	collection.isInit = true
	
	if changed then
		ArkInventory.ItemCacheClear( )
		ArkInventory.Frame_Main_DrawStatus( nil, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
	if ArkInventory.ClientCheck( nil, ArkInventory.ENUM.EXPANSION.SHADOWLANDS ) then
		-- C_TradeSkillUI.OpenTradeSkill is now a protected function in dragonflight so cant be done any more
		ArkInventory.OutputDebug( "TRADESKILL: QUEUE_START" )
		ArkInventory:SendMessage( "EVENT_ARKINV_TRADESKILL_UPDATE_BUCKET", "QUEUE_START" )
	end
	
end

function ArkInventory.Tradeskill.OnEnable( )
	
	--ArkInventory.Output( "tradeskill on enable" )
	local loc_id = ArkInventory.Const.Location.Tradeskill
	
	collection.isReady = false
	collection.isInit = false
	
	ArkInventory.Tradeskill.ScanHeaders( )
	
	ArkInventory.ObjectCacheTooltipClear( )
	--ArkInventory.ObjectCacheCountClear( nil, nil, loc_id )
	
end

function ArkInventory:EVENT_ARKINV_TRADESKILL_UPDATE_BUCKET( events )
	
	--ArkInventory.Output( "TRADESKILL BUCKET [", events, "]" )
	
	if not helper_GoodToScan1( ) then return end
	
	if events["SCAN_HEADERS"] or events["SKILL_LINES_CHANGED"] then
		ArkInventory.Tradeskill.ScanHeaders( )
	end
	
	if events["NEW_RECIPE_LEARNED"] then
		-- do something with this?
		--ArkInventory.Tradeskill.ScanHeaders( )
	end
	
	if events["UPDATE"] then
		--ArkInventory.Output( "UPDATE LOCATION ", loc_id )
		--ArkInventory.ScanLocation( loc_id )
	end
	
	if events["QUEUE_START"] then
		Scan( )
	end
	
end

function ArkInventory:EVENT_ARKINV_TRADESKILL_UPDATE( event, ... )
	
	--ArkInventory.Output( "EVENT [", event, "]" )
	
	if event == "TRADE_SKILL_CLOSE" then
		collection.isClosed = true
		return
	end
	
	if event == "TRADE_SKILL_DATA_SOURCE_CHANGED" then
		
		if not collection.isScanning then
			collection.isClosed = false
			collection.isScanning = true
			Scan_UI( )
			collection.isScanning = false
			collection.isScanDone = true
		else
			--ArkInventory.Output( "IGNORED (TRADESKILL SCAN IN PROGRESS)" )
		end
		
		return
		
	end
	
	ArkInventory:SendMessage( "EVENT_ARKINV_TRADESKILL_UPDATE_BUCKET", event )
	
end

--[[
possibly useful stuff for later

C_TradeSkillUI.GetProfessionInfoBySkillLineID( skillID )

]]--
