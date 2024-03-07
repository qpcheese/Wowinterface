do
	--TODO: this can be made more simple by shuffling the pool beforehand and taking the first match we find.
			-- ...but rename from "random" to "first".

	XPRACTICE.PRIMALCOUNCIL.RaidTargeting={}
	
	function XPRACTICE.PRIMALCOUNCIL.RaidTargeting.RemoveRandomMDPS(pool)
		local mdps={}
		for i=1,#pool do
			if(pool[i].mdps)then
				tinsert(mdps,{role=pool[i],index=i})
			end
		end
		if(#mdps==0)then return nil end
		local i=math.floor(math.random()*#mdps)+1
		tremove(pool,mdps[i].index)		
		return mdps[i].role
	end
	
	function XPRACTICE.PRIMALCOUNCIL.RaidTargeting.RemoveRandomRDPS(pool)
		local rdps={}
		for i=1,#pool do
			if(pool[i].rdps)then
				tinsert(rdps,{role=pool[i],index=i})
			end
		end
		if(#rdps==0)then return nil end
		local i=math.floor(math.random()*#rdps)+1
		tremove(pool,rdps[i].index)	
		return rdps[i].role
	end	

	function XPRACTICE.PRIMALCOUNCIL.RaidTargeting.RemoveRandomDPS(pool)
		local dps={}
		for i=1,#pool do
			if(pool[i].mdps or pool[i].rdps)then
				tinsert(dps,{role=pool[i],index=i})
			end
		end
		if(#dps==0)then return nil end
		local i=math.floor(math.random()*#dps)+1
		tremove(pool,dps[i].index)		
		return dps[i].role
	end	

	function XPRACTICE.PRIMALCOUNCIL.RaidTargeting.RemoveRandomHealer(pool)
		local healer={}
		for i=1,#pool do
			if(pool[i].healer or pool[i].healer)then
				tinsert(healer,{role=pool[i],index=i})
			end
		end
		if(#healer==0)then return nil end
		local i=math.floor(math.random()*#healer)+1
		tremove(pool,healer[i].index)		
		return healer[i].role
	end	
	
	function XPRACTICE.PRIMALCOUNCIL.RaidTargeting.RemoveRandomTank(pool)
		local tank={}
		for i=1,#pool do
			if(pool[i].tank or pool[i].tank)then
				tinsert(tank,{role=pool[i],index=i})
			end
		end
		if(#tank==0)then return nil end
		local i=math.floor(math.random()*#tank)+1
		tremove(pool,tank[i].index)		
		return tank[i].role
	end		
end