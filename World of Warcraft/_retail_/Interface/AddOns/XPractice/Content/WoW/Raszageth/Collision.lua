do
	--TODO: generic collision base class?
	XPRACTICE.RASZAGETH.Collision = {}
	local class=XPRACTICE.RASZAGETH.Collision
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
			tinsert(args,"0")						
			scenario.multiplayer:FormatAndSendCustom("DEAD_RINGOUT",unpack(args))
			local player=scenario.player				
			local auras=player.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.RASZAGETH.Aura_ExplosiveRunes)	
			for i=1,#auras do
				auras[i]:OnRemove()
			end
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
	
	function class:DebuffCheck(player_with_debuff,tickcount)
		local scenario=self.scenario		
		if(not scenario.player)then return end
		local player=scenario.player		
		if(player:IsDeadInGame() or player.dead)then return end	
	

		if(player~=player_with_debuff)then
			if(player_with_debuff.graceperiod==nil or player.environment.localtime>=player_with_debuff.graceperiod)then
				local distsqr=XPRACTICE.distsqr(player.position.x,player.position.y,player_with_debuff.position.x,player_with_debuff.position.y)
				if(distsqr<=5*5)then
					local targetguid=player_with_debuff.paddedguid
					if(targetguid)then
						scenario.multiplayer:FormatAndSendCustom("CAUGHT_MARK_FROM",targetguid)
						player_with_debuff.graceperiod=player.environment.localtime+1.0
					end
				end
			end
		else
			if(tickcount>2)then
				for i=1,#scenario.earthenpillars do
					local pillar=scenario.earthenpillars[i]
					if(not pillar.despawning)then
						local distsqr=XPRACTICE.distsqr(player.position.x,player.position.y,pillar.position.x,pillar.position.y)
						if(distsqr<=8*8)then
							scenario.multiplayer:FormatAndSendCustom("CLEANSED_MARK")
						end
					end
				end
			end
		end
	end
	
	function class:ScorchedGroundCheck(aura)
		local scenario=self.scenario		
		if(not scenario.player)then return end
		local player=scenario.player		
		if(player:IsDeadInGame() or player.dead)then return end	
	

		for i=1,#scenario.firezones do
			local fire=scenario.firezones[i]
			if(not fire.despawning)then
				local distsqr=XPRACTICE.distsqr(player.position.x,player.position.y,fire.position.x,fire.position.y)
				if(distsqr<=10*10)then
					aura.stacks=0
				end
			end
		end
	end	
	
end