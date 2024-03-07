do
	--TODO: generic collision base class?
	XPRACTICE.SARKARETH2.Collision = {}
	local class=XPRACTICE.SARKARETH2.Collision
	class.__index = class

	function class.new(scenario)
		local self=setmetatable({}, class)
		self.scenario=scenario
		return self 
	end


	function class:OutOfBoundsCheck()
		local scenario=self.scenario
		if(not scenario.player)then return end

		if(scenario.player.position.z<-60)then	--TODO: determine most-appropriate height for death plane
			

			-- pally bubble can't save you here	
			scenario:AttemptKillPlayer(scenario.player,true,false,"Fell off the arena.",3.0)
			
			local args={}				
			tinsert(args,"0")						
			--scenario.multiplayer:FormatAndSendCustom("DEAD_RINGOUT",unpack(args))
			local player=scenario.player				
			local auras=player.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.SARKARETH2.Aura_ExplosiveRunes)	
			for i=1,#auras do
				auras[i]:OnRemove()
			end
			player.position={x=0,y=0,z=5}
			player.velocity.x=0
			player.velocity.y=0
			player.velocity.z=0
		end
	
		for k,v in pairs(scenario.multiplayer.allplayers)do
			local player=v
			if(player~=scenario.player)then
				if(player.position.z<-20)then
					player.position.x=0
					player.position.y=0
					player.position.z=5
					player.velocity.x=0
					player.velocity.y=0
					player.velocity.z=0
				end
			end
		end
		
	end
	

	function class:EdgeCheck(player)
		--if(true)then return true end
	
		---------------------------------------------------------------
		--OUT OF BOUNDS CHECK
		---------------------------------------------------------------
		--if(true)then return true end --!!!
		
		if(not player)then return true end
		
		local distsqr=player.position.x*player.position.x+player.position.y*player.position.y
		local dist=math.sqrt(distsqr)
		--print("Player dist:",dist)
		local maxradius=51
		if(dist>maxradius)then
			return false
		end			
	
		return true
	end
	
	-- function class:LavaCheck()
		-- local scenario=self.scenario		
		-- if(not scenario.player)then return end
		-- local player=scenario.player		
		-- if(player:IsDeadInGame() or player.dead)then return end	
	
		-- for i=1,#scenario.vortexmanager.actors do
			-- local vortex=scenario.vortexmanager.actors[i]
			-- local distsqr=XPRACTICE.distsqr(player.position.x,player.position.y,vortex.x,vortex.y)
			-- if(distsqr<=10*10)then
				-- scenario:AttemptKillPlayer(player)	--TODO: multiplayer comms
				-- local angle=math.atan2(player.position.y-vortex.y,player.position.x-vortex.x)
				-- player.velocity.x=14*math.cos(angle)
				-- player.velocity.y=14*math.sin(angle)
				-- local dist=math.sqrt(distsqr)
				-- player.velocity.z=1+(10-dist)
				
			-- end
		-- end
		
		-- for i=1,#scenario.wavemanager.actors do
			-- local wave=scenario.wavemanager.actors[i]
			-- local distsqr=XPRACTICE.distsqr(player.position.x,player.position.y,wave.x,wave.y)
			-- if(distsqr<=scenario.wavemanager.RADIUS*scenario.wavemanager.RADIUS)then
				-- scenario:AttemptKillPlayer(player)	--TODO: multiplayer comms
			-- end		
		-- end

	-- end
	

	
end