
--		/run ArkInventory.ExtractData( )


function ArkInventory.ExtractData( )

	ArkInventory.db.extract = nil
	
	if not ArkInventory.Global.dataexport then return end
	
	
	
	
	
	ArkInventory.db.extract = { }
	
	local maxLoop = 10000
	
	
	
	if false then
--[[
		tradeskill - skill / recipe / item
		login to each character until all skills have been scanned
		then run this
		
		/run ArkInventory.Tradeskill.ExtractData( )
--]]
	end
	
	if false then
		
		-- item suffixes, classic only
		
		local id = "15009"
		local h = string.format( "item:%s", id )
		
		local n = GetItemInfo( h )
		local bn = n
		ArkInventory.Output( "base=", bn )
		
		if bn then
			
			for x = 1, maxLoop do
				
				h = string.format( "item:%s::::::%s", id, x )
				n = GetItemInfo( h )
				
				n = string.gsub( n or "", bn, "" )
				n = string.trim( n )
				
				if n and n ~= "" then
					
					n = string.format( "ArkInventory.SuffixID.%s", n )
					
					if not ArkInventory.db.extract[n] then
						ArkInventory.db.extract[n] = { }
					end
					
					table.insert( ArkInventory.db.extract[n], x )
					
					ArkInventory.Output( x, " = ", n or "!!!" )
					
				end
				
			end
			
		end
		--[[
		local z = "m"
		
		for k, v in ArkInventory.spairs( ArkInventory.db.extract ) do
			table.sort( v )
			ArkInventory.db.extract[k] = table.concat( v, "," )
			z = string.format( "%s,%s", z, k )
		end
		
		ArkInventory.db.extract["ArkInventory.SuffixID"] = z
		]]--
	end
	
	
	if false then
		
		-- bonus id suffixes, retail only
		ArkInventory.db.extract.suffix = { }
		
		local id = "15009"
		local h = string.format( "item:%s", id )
		
		local n = GetItemInfo( h ) or ""
		local bn = n
		
		if bn then
			
			for x = 1, maxLoop do
				
				h = string.format( "item:%s::::::::::::1:%s:", id, x )
				n = GetItemInfo( h ) or ""
				
				n = string.gsub( n, bn, "" )
				n = string.trim( n )
				
				if n and n ~= "" and not ArkInventory.PT_BonusIDInSets( x, "ArkInventory.BonusID.Suffix" ) then
					
					n = string.format( "ArkInventory.BonusID.Suffix.%s", n )
					
					if not ArkInventory.db.extract.suffix[n] then
						ArkInventory.db.extract.suffix[n] = { }
					end
					
					table.insert( ArkInventory.db.extract.suffix[n], x )
					
					ArkInventory.Output( "new suffix id [", x, " = ", n, "]" )
					
				end
				
			end
			
		end
		
		for k, v in ArkInventory.spairs( ArkInventory.db.extract.suffix ) do
			local z = table.sort( v ) or v
			ArkInventory.db.extract[k] = table.concat( z, "," )
		end
		
		ArkInventory.db.extract.suffix = nil
		
	end
	
	
	if false then
		
		-- corruption ids, retail only
		ArkInventory.db.extract.corruption = { }
		
		local tooltip = ArkInventory.Global.Tooltip.Scan
		local id = "173489"
		local h = string.format( "item:%s", id )
		local p = nil
		local n = GetItemInfo( h )
		
		if n then
			
			for x = 1, maxLoop do
				
				h = string.format( "item:%s::::::::::::1:%s:", id, x )
				ArkInventory.TooltipSet( tooltip, nil, nil, nil, h )
				p = ArkInventory.TooltipMatch( tooltip, nil, "corrupt" )
				
				if p and not ArkInventory.PT_BonusIDInSets( x, "ArkInventory.BonusID.Corruption" ) then
					table.insert( ArkInventory.db.extract.corruption, x )
					ArkInventory.Output( "new corruption id [", x, "]" )
				end
				
			end
			
		end
		
		
		local z = table.sort( ArkInventory.db.extract.corruption ) or ArkInventory.db.extract.corruption
		ArkInventory.db.extract["ArkInventory.BonusID.Corruption"] = table.concat( z, "," )
		
		ArkInventory.db.extract.corruption = nil
		
	end
	
	
	if false then
		
		-- currency and reputation
		local i
		
		ArkInventory.db.extract.c = { }
		i = 1
		for _, obj in ArkInventory.Collection.Currency.Iterate( ) do
			ArkInventory.db.extract.c[i] = string.format( "%s,%s", obj.id, obj.name )
			i = i + 1
		end
		
		ArkInventory.db.extract.r = { }
		i = 1
		for _, obj in ArkInventory.Collection.Reputation.Iterate( ) do
			ArkInventory.db.extract.r[i] = string.format( "%s,%s", obj.id, obj.name )
			i = i + 1
		end
		
	end
	
	
end
