do

			
			--self.soak=self:AddActorByFileID(3850775,x,y,z)		-- 9fx_rl_annihilation_state_progenitor
			
			
			-- whiteorb.m2 		-- substitute -- no wispy flame shape (127,158,159)

	do
		local super=XPRACTICE.MultiSolid
		XPRACTICE.SARKARETH2.DownstairsManager=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.DownstairsManager
		
		function class:Reset()
			for i=#self.actors,1,-1 do
				self.actors[i].dying=true
			end			
			self.circlescollected=0
		end
		
	
		function class:SetupEverything(player)
			self:Reset()
			for i=1,3 do
				local angle=math.pi*2/3*(i-1)+player.orientation.yaw
				local x=math.cos(angle)*15+player.position.x
				local y=math.sin(angle)*15+player.position.y
				local distsqr=XPRACTICE.distsqr(0,0,x,y)
				if(distsqr>49*49)then
					local angle2=math.atan2(y,x)
					x=math.cos(angle2)*49
					y=math.sin(angle2)*49
				end
				local actor=self:AddActorByFileID(3850775,x,y,0,1)	-- 9fx_rl_annihilation_state_progenitor
				actor.TEMP_radius=2.5
				actor.TEMP_x=x;actor.TEMP_y=y
			end
			--local pieslices=15
			local pieslices=20
			for j=1,pieslices do				-- mote placement is hilariously inaccurate but we're pressed for time
				local t1=math.pi*2/pieslices*(j+0)
				local t2=math.pi*2/pieslices*(j+1)
				for i=1,2 do
					local x,y=XPRACTICE.RandomPointInPieSlice(0,0,48,t1,t2)
					--local actor=self:AddActorByFileID(5048829,x,y,1,1.0) -- still don't know what this is, but it's not motes
					local actor=self:AddActorByFileID(4499234,x,y,1,0.333) -- whiteorb					
					actor.TEMP_radius=1.5
					actor.TEMP_x=x;actor.TEMP_y=y
				end
			end
			self.circletimer=nil
		end
		
		 function class:Step(elapsed)
			super.Step(self,elapsed)
			local scenario=self.scenario
			local player=scenario.player
			if(#self.actors>0 and scenario.player.phase~=2)then
				self:Reset()
			end
			if(self.circletimer)then
				self.circletimer=self.circletimer-elapsed		
			end
			for i=#self.actors,1,-1 do
				local actor=self.actors[i]

				-- if(actor.TEMP_graceperiod>0)then
					-- actor.TEMP_graceperiod=actor.TEMP_graceperiod-elapsed
				-- else
				if(player and not player:IsDeadInGame())then
					local xdist=player.position.x-actor.TEMP_x
					local ydist=player.position.y-actor.TEMP_y
					local distsqr=xdist*xdist+ydist*ydist
					if(distsqr<=actor.TEMP_radius*actor.TEMP_radius)then
						actor.dying=true
						if(actor.TEMP_radius<2.0)then
							XPRACTICE.SARKARETH2.ApplyAstralFlare(player)
						else
							self.circlescollected=self.circlescollected+1
							self.circletimer=14.0
							if(self.circlescollected>=3)then
								local aura=player.combatmodule:ApplyAuraByClass(XPRACTICE.SARKARETH2.Aura_Oblivion_GoUpstairs,player.combatmodule,player.environment.localtime)
								aura.scenario=self.scenario
							end
						end
					end
					if(player.phase==2)then
						if(self.circletimer and self.circletimer<=0)then
							self.scenario:AttemptKillPlayer(player,true,true,"You have only 14 seconds to collect the next Mind Fragment before the previous one expires.",10.0)
						end
					end
				end
				-- end

				if(actor.dying)then
					actor.dying=false
					XPRACTICE.ReusableModelSceneFrames:RemoveActor(actor.frame,actor)				
					tremove(self.actors,i)
				end
			end
		end
		
		
		
		
	end
end