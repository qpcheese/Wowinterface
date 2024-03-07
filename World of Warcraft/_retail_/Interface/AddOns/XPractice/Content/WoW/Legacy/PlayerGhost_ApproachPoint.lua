local super=XPRACTICE.Mob
XPRACTICE.LEGACY.PlayerGhost=XPRACTICE.inheritsFrom(XPRACTICE.Mob)
local class=XPRACTICE.LEGACY.PlayerGhost

	--TODO: this logic is a mess -- for now, removed stutterstep
	function class:ApproachPoint(x,y,mindistance,maxdistance,override)		
		--does not include reactiontime.  
		--if function returns false, do not set reactiontime -- destx/y are nil
		local distx=x-self.position.x
		local disty=y-self.position.y
		if(not self.cpu and not self.mirrorrealm)then
			--!!!
			distx=x-self.scenario.fakerangedcamp.x
			disty=y-self.scenario.fakerangedcamp.y
			--print("Approach as if standing on",distx,disty)
		end		
		
		local distsqr=distx*distx+disty*disty
		local dist=math.sqrt(distsqr)
		if(dist==0)then dist=1 end
		local targetdist=XPRACTICE.RandomNumberInBetween(mindistance,maxdistance)		
		

	
		-- --print("real targetdist",targetdist)
		-- if(self.stutterstep)then
			-- local multitargetalreadyexists=true
			-- if(self.multidestx)then
				-- multitargetalreadyexists=true				
			-- end
			-- if(not self.multidestx) then
				-- self.multidestx=x-(distx*targetdist/dist)		
				-- self.multidesty=y-(disty*targetdist/dist)		
			-- end		
			-- local stutterdist
			-- if(dist<self.ignorestutterstepdistance)then
				-- stutterdist=XPRACTICE.RandomNumberInBetween(5.0,10.0)
				-- targetdist=dist-stutterdist
			-- else
				-- stutterdist=XPRACTICE.RandomNumberInBetween(0.1,2.0)
				-- targetdist=self.ignorestutterstepdistance+stutterdist
			-- end				
			-- if(multitargetalreadyexists)then
				-- if(stutterdist>dist)then
					-- return false
				-- end
			-- end
		-- end
		-- -- not the same as self.destx/y -- might have changed due to stutterstep

		self.destx=x-(distx*targetdist/dist)		
		self.desty=y-(disty*targetdist/dist)	
		

		
		if(override)then
			self.ai:SetTargetPosition(self.destx,self.desty)
			--otherwise nothing happens until we reach existing target OR remainingreactiontime reaches zero
		end
		return true
		--print("approach",self.destx,self.desty)
	end