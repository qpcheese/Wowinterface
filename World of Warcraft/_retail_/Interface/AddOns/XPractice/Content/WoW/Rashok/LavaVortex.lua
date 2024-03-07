do
	do
		local super=XPRACTICE.MultiSolid
		XPRACTICE.RASHOK.LavaVortexManager=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.LavaVortexManager
		--function class:SetActorAppearanceViaOwner(actor)
			--actor:SetModelByCreatureDisplayID(108784)
			--self.scale=2.5	--10 yards?
		--end
		
		-- function class:SetDefaultAnimation()
			-- self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			-- self.projectilespawncustomduration=1.0
			-- self.projectileloopcustomduration=nil
			-- self.projectiledespawncustomduration=1.0
			-- self.alivetime=0
			-- self.state=0
		-- end			
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			
			for i=1,#self.actors do
				local vortex=self.actors[i]
				vortex.alivetime=vortex.alivetime+elapsed
				if(vortex.state==0 and vortex.alivetime>0.0)then
					self:LavaWaves()
					vortex.state=1
				end
				if(vortex.state==1 and vortex.alivetime>1.0)then
					vortex:SetAnimation(158)
					vortex.state=2
				end
				if(self.scenario.pauseallmechanics)then
					if(vortex.state<3)then
						vortex:SetAnimation(159)
						vortex.state=3;vortex.alivetime=0.0
					end					
				end				
				if(vortex.state==3 and vortex.alivetime>1.0)then
					vortex.dead=true
				end

			
			end
			
			
			for i=#self.actors,1,-1 do
				if(self.actors[i].dead)then
					local actor=self.actors[i]
					XPRACTICE.ReusableModelSceneFrames:RemoveActor(actor.frame,actor)
					tremove(self.actors,i)					
				end
			end				
		end
		
		function class:NewVortex(x,y)
			local actor=self:AddActorByCreatureDisplayID(108784,x,y,0,2.5)
			actor.x=x
			actor.y=y
			actor.state=0
			actor.alivetime=0
			actor:SetAnimation(0)
			actor.dead=nil
			return actor
		end
		
		function class:KillAllVortexs()
			for i=#self.actors,1,-1 do
				self.actors[i]:SetAnimation(159)
				self.actors[i].state=3;self.actors[i].alivetime=0				
			end	
		end
		
		function class:LavaWaves()
			for i=1,#self.actors do
				local vortex=self.actors[i]
				local baseangle=math.random()*math.pi*2
				for j=1,10 do					
					local angle=baseangle+math.pi*2/10*j
					local wave=self.scenario.wavemanager:NewWave(vortex.x,vortex.y,angle)
					wave.vx=math.cos(angle)*7*2
					wave.vy=math.sin(angle)*7*2										
				end
			end
		end		
	end


	



	do
		local super=XPRACTICE.MultiSolid
		XPRACTICE.RASHOK.LavaWaveManager=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.LavaWaveManager
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.MAX_SCALE=0.75
			--self.RADIUS=3+7/8
			self.RADIUS=4

			self.MAX_SCALE=3.5/4*0.75	
			self.RADIUS=3.5
			
			self.MAX_SCALE=3/4*0.75
			self.RADIUS=3
			
			-- self.MAX_SCALE=0.625
			-- self.RADIUS=4*5/6
			
			-- self.MAX_SCALE=0.5
			-- self.RADIUS=4*2/3
		end
		
		-- function class:SetActorAppearanceViaOwner(actor)
			-- actor:SetModelByFileID(4662848)
			-- self.scale=0.01
		-- end
		
		-- function class:SetDefaultAnimation()
			-- self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			-- self.projectilespawncustomduration=1.0
			-- self.projectileloopcustomduration=nil
			-- self.projectiledespawncustomduration=1.0
			-- self.alivetime=0
			-- self.state=0
			-- self.MAX_SCALE=0.75
			-- self.RADIUS=3
		-- end			
		
		function class:NewWave(x,y,yaw)
			local actor=self:AddActorByFileID(4662848,x,y,0,0.01,yaw)
			actor.state=0
			actor.alivetime=0
			actor.dead=nil
			actor:SetAnimation(0)
			actor.x=x
			actor.y=y
			actor.yaw=yaw
			return actor		
		end
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			
			for i=1,#self.actors do
				local wave=self.actors[i]
				wave.alivetime=wave.alivetime+elapsed
				wave.x=wave.x+wave.vx*elapsed
				wave.y=wave.y+wave.vy*elapsed
				if(wave.state<3 and wave.alivetime>0.0)then
					wave.scale=math.min(wave.alivetime,self.MAX_SCALE)
					--print("Scale?",wave.scale)
					wave:SetScale(wave.scale)
				end
				if(wave.state==0 and wave.alivetime>1.0)then
					wave.state=1
					wave:SetAnimation(158)
				end
				if(wave.state<3 and (math.abs(wave.x)>90 or math.abs(wave.y)>90))then
					wave.state=3
					wave.alivetime=0.0
					wave:SetAnimation(159)
				end
				if(wave.state==3 and wave.alivetime>1.0)then
					wave.dead=true
				end
				--if(i==1)then print("wave:",wave.x,wave.y,wave.scale) end
				wave:SetPosition(wave.x/wave.scale,wave.y/wave.scale,0)
			end
			for i=#self.actors,1,-1 do
				if(self.actors[i].dead)then
					local actor=self.actors[i]
					XPRACTICE.ReusableModelSceneFrames:RemoveActor(actor.frame,actor)
					tremove(self.actors,i)					
				end
			end				
		end
	end
end