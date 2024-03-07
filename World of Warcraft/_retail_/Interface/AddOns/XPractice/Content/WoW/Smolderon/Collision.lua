do
	--TODO: generic collision base class?
	XPRACTICE.SMOLDERON.Collision = {}
	local class=XPRACTICE.SMOLDERON.Collision
	class.__index = class

	function class.new(scenario)
		local self=setmetatable({}, class)
		self.scenario=scenario
		return self 
	end


	function class:OutOfBoundsCheck()
		local scenario=self.scenario
		if(not scenario.player)then return end

		if(scenario.player.position.z<-30)then	--TODO: determine most-appropriate height for death plane
			-- pally bubble can't save you here				
			scenario:AttemptKillPlayer(scenario.player,true,false,"Fell off the arena.",4.0)
			scenario.multiplayer:FormatAndSendCustom("DEAD_RINGOUT")
			local player=scenario.player				
			player.position={x=30,y=0,z=2}
			player.velocity.z=0
			player.floorbelow=true
		end
	
		for k,v in pairs(scenario.multiplayer.allplayers)do
			local player=v
			if(player~=scenario.player)then
				if(player.position.z<-20)then
					player.position.x=30
					player.position.y=0
					player.position.z=2
					player.velocity.z=0
					player.floorbelow=true
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
		local maxradius=57.5
		if(dist>maxradius)then
			return false
		end			
	
		return true
	end
	
	function class:RingCheck(index)				
		local scenario=self.scenario		
		if(not scenario.player)then return end
		local player=scenario.player		
		--if(player:IsDeadInGame() or player.dead)then return end	

		local xdist=player.position.x-0
		local ydist=player.position.y-0
		local distsqr=xdist*xdist+ydist*ydist	
		local dist=math.sqrt(distsqr)
		if(dist>=XPRACTICE.SMOLDERON.RING_RADIUS[index][1]-XPRACTICE.SMOLDERON.PLAYER_HITBOX_RADIUS
		and dist<=XPRACTICE.SMOLDERON.RING_RADIUS[index][2]+XPRACTICE.SMOLDERON.PLAYER_HITBOX_RADIUS)then	
			scenario:AttemptKillPlayer(player,false,false,"You died from World in Flames.",4.0)
			scenario.multiplayer:FormatAndSendCustom("DEAD_WORLD_IN_FLAMES")
		end
	end
	
	function class:MoteCheck(mote,elapsed)
		local scenario=self.scenario		
		if(not scenario.player)then return end
		local player=scenario.player				
		
		if(mote.TEMP.expirytimer)then return end
		if(mote.TEMP.zvel)then
			mote.TEMP.zvel=mote.TEMP.zvel-(25/2)*elapsed
			mote.TEMP.z=mote.TEMP.z+mote.TEMP.zvel*elapsed
			if(mote.TEMP.z<=0)then
				mote.TEMP.z=0
				mote.TEMP.xvel=0
				mote.TEMP.yvel=0
				mote.TEMP.zvel=nil
				mote.TEMP.startmovingtimer=1.0
			end					
		end
		
		if(mote.TEMP.startmovingtimer)then
			mote.TEMP.startmovingtimer=mote.TEMP.startmovingtimer-elapsed
			if(mote.TEMP.startmovingtimer<=0)then
				mote.TEMP.startmovingtimer=nil
				local angle=math.atan2(mote.TEMP.y,mote.TEMP.x)+math.pi				
				mote.TEMP.xvel=math.cos(angle)*2.5
				mote.TEMP.yvel=math.sin(angle)*2.5				
			end
		end
		
		mote.TEMP.x=mote.TEMP.x+mote.TEMP.xvel*elapsed
		mote.TEMP.y=mote.TEMP.y+mote.TEMP.yvel*elapsed
		mote:SetPosition(mote.TEMP.x,mote.TEMP.y,mote.TEMP.z+1)
				
		if(mote.TEMP.zvel and mote.TEMP.zvel>0)then return end
		
		local distsqr=mote.TEMP.x*mote.TEMP.x+mote.TEMP.y*mote.TEMP.y
		if(distsqr<(12.3/2)*(12.3/2))then
			mote.TEMP.expirytimer=2.0
			mote:SetAnimation(159)
			
			if(player:IsDeadInGame() or player.dead)then return end	
			
			--scenario:AttemptKillPlayer(player,true,true,"A Living Flame mote made it to the boss.",5.0)
			scenario.multiplayer:FormatAndSendCustom("EMBARRASSED_MOTES")
		end
		
		if(player:IsDeadInGame() or player.dead)then return end	
		local distsqr=(mote.TEMP.x-player.position.x)*(mote.TEMP.x-player.position.x)+(mote.TEMP.y-player.position.y)*(mote.TEMP.y-player.position.y)
		if(distsqr<1.5*1.5)then
			scenario.motestacks=scenario.motestacks+1
			if(WeakAuras)then WeakAuras.ScanEvents("XP_SMOLDERON_MOTE_STACKS",scenario.motestacks) end
			mote.TEMP.expirytimer=2.0
			mote:SetAnimation(159)
		end		
		
		

		

		
	end
	

	
end