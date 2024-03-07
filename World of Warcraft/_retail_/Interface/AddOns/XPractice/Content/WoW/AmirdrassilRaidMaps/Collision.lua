do
	--TODO: generic collision base class?
	XPRACTICE.AMIRDRASSILRAIDMAPS.Collision = {}
	local class=XPRACTICE.AMIRDRASSILRAIDMAPS.Collision
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
			scenario:AttemptKillPlayer(scenario.player,true)
			scenario.statuslabel:SetText("Fell off the arena.",3.0)
			local args={}				
			--TODO NEXT: further checks for context: off the sides? into hole? jumped too early with rune?
				-- "0": context unknown, "1" sides, "2" hole, "3" early
			tinsert(args,"0")						
			scenario.multiplayer:FormatAndSendCustom("DEAD_RINGOUT",unpack(args))
			local player=scenario.player				
			local auras=player.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.AMIRDRASSILRAIDMAPS.Aura_ExplosiveRunes)	
			for i=1,#auras do
				auras[i]:OnRemove()
			end
			--TODO NEXT: determine correct ringout-respawn location
			player.position={x=math.cos(-math.pi/3)*-64,y=math.sin(-math.pi/3)*-64,z=2}
		end
	
		for k,v in pairs(scenario.multiplayer.allplayers)do
			local player=v
			if(player~=scenario.player)then
				if(player.position.z<-20)then
					player.position.x=-15
					player.position.y=0
					player.position.z=2
				end
			end
		end
		
	end
	

	function class:EdgeCheck(player)
		--if(true)then return true end
	
		---------------------------------------------------------------
		--OUT OF BOUNDS CHECK
		---------------------------------------------------------------
		if(true)then return true end --!!!
		
		if(not player)then return true end
		
		local distsqr=player.position.x*player.position.x+player.position.y*player.position.y
		local dist=math.sqrt(distsqr)
		--print("Player dist:",dist)
		local maxradius=41
		if(dist>maxradius)then
			return false
		end			
	
		return true
	end
	
	function class:DebuffCheck()
	
	end
	
	-- function class:ExplosionCollisionDetection(sourceplayer)
		-- local scenario=self.scenario		
		-- if(not scenario.player)then return end
		-- local player=scenario.player
		-- if(player:IsDeadInGame() or player.dead)then return end	
		-- local xdist=player.position.x-sourceplayer.position.x
		-- local ydist=player.position.y-sourceplayer.position.y
		-- local distsqr=xdist*xdist+ydist*ydist
		-- local radius=XPRACTICE.AMIRDRASSILRAIDMAPS.Config.DebuffExplosionRadius
		-- if(distsqr<=radius*radius)then	
			-- if(scenario:AttemptKillPlayer(player))then
				-- --print("ExplosionCollisionDetection:",self.scenario.totaldeaths)
				-- local args={}
				-- tinsert(args,scenario.timeelapsed)
				-- self.scenario.multiplayer:FormatAndSendCustom("DEAD_OTHEREXPLOSION",unpack(args))
			-- end										
		-- end
	
	-- end
	
end