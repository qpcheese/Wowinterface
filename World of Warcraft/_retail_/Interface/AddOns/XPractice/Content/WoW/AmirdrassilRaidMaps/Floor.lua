do
						
	do
		local super=XPRACTICE.MultiSolid
		XPRACTICE.AMIRDRASSILRAIDMAPS.Floor=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.AMIRDRASSILRAIDMAPS.Floor
	
		function class:Setup(environment,x,y,z)
			super.Setup(self,environment,x,y,z)

			local invrt2=1/math.sqrt(2)
			
			self.floorscale=1
			self.floorrotation=0
			
			self.transitionout=false
			self.transitionin=false
			self.transitioninindex=nil
			self.transitionpending=nil
		end
		
		function class:TransitionTo(index)
			if(XPRACTICE.AMIRDRASSILRAIDMAPS.FloorData.DrawMap[index])then
				local buttons=self.scenario.changemapbutton.buttons
				for i=1,#buttons do
					if(i==index)then
						buttons[i]:Select(true)
					else
						buttons[i]:Select(false)
					end
				end
				self.scenario.mapindex=index
				--self.scenario.worldmarkercontroller:ClearWMAll(self.scenario,true)
				self.scenario.worldmarkercontroller:ClearAllWithoutSaving()
				self.scenario.worldmarkercontroller:LoadAll(self.scenario,true)
				self.scenario.customeffectbutton.buttons=self.scenario.customeffectcontroller:QuickButtons(nil,nil,self.scenario)
				XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses.CreateBosses(self.scenario,index)
				self.transitionpending=index
			end
			
		end
		
		local BIG_SCALE=0.7
		local TIMER_SPEED=1.0
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			
		
			if(self.transitionout)then
				local stillinprogress=false
				for i=1,#self.actors do
					local a=self.actors[i]
					if(a.timer>0 and a.targetz and a.x and a.y and a.scale)then
						stillinprogress=true
						a.timer=a.timer-elapsed*TIMER_SPEED
						if(a.timer<0)then a.timer=0 end
						local alpha=1-(2-a.timer)
						alpha=XPRACTICE.Clamp(alpha,0,1)
						a:SetAlpha(alpha)


						local zoffset=(1-(a.timer-0.5))*5
						if(zoffset<0)then zoffset=0 end
						zoffset=zoffset*zoffset
						if(a.scale<BIG_SCALE)then zoffset=-zoffset else zoffset=0 end
						local z=(a.targetz-zoffset)
						a:SetPosition(a.x/a.scale,a.y/a.scale,z/a.scale)
						
					end
				end
				if(not stillinprogress)then	
					self.transitionout=false 
					if(self.transitionpending)then
						self.transitioninindex=self.transitionpending
						self.transitionin=true
						if(XPRACTICE.AMIRDRASSILRAIDMAPS.FloorData.DrawMap[self.transitioninindex])then
							for i=1,#self.actors do
								local actor=self.actors[i]
								XPRACTICE.ReusableModelSceneFrames:RemoveActor(actor.frame,actor)
							end
							self.actors={}
						end
						XPRACTICE.AMIRDRASSILRAIDMAPS.FloorData.DrawMap[self.transitioninindex](self.environment,self)
						-- then we wait for FinishAssemblyCallback
											
					end
				end
			elseif(self.transitionin)then
				local stillinprogress=false
				for i=1,#self.actors do
					local a=self.actors[i]
					if(a.timer and a.timer>0 and a.targetz and a.x and a.y and a.scale)then
						stillinprogress=true
						a.timer=a.timer-elapsed*TIMER_SPEED
						if(a.timer<0)then a.timer=0 end
						local alpha=(1-a.timer)
						alpha=XPRACTICE.Clamp(alpha,0,1)
						a:SetAlpha(alpha)
						local zoffset=(a.timer-0.5)*5
						if(zoffset<0)then zoffset=0 end
						zoffset=zoffset*zoffset
						if(a.scale<BIG_SCALE)then zoffset=-zoffset else zoffset=0 end
						local z=(a.targetz-zoffset)
						
						a:SetPosition(a.x/a.scale,a.y/a.scale,z/a.scale)
					end				
				end	
				if(not stillinprogress)then	self.transitionin=false end
			elseif(self.transitionpending)then
				if(self.transitioninindex==self.transitionpending)then										
					self.transitionpending=nil
					self.transitioninindex=nil	
					for i=1,#self.scenario.bosses do
						self.scenario.bosses[i].phase=1
					end
				else
					self.transitionout=true
					self.transitioninindex=self.transitionpending
					for i=1,#self.actors do
						local a=self.actors[i]
						--a.timer=math.random()*1+1.0
						a.timer=2.0
						if(a.scale<BIG_SCALE)then a.timer=math.random()*1+1.0 end
					end					
				end
			end

		end

		function class:FinishAssemblyCallback()			
			self.transitionin=true
			for i=1,#self.actors do
				local a=self.actors[i]
				--a.timer=math.random()*1+1.0
				a.timer=1.0
				if(a.scale<BIG_SCALE)then a.timer=math.random()*1+2.0 end
			end	
			if(self.scenario.scenery)then
				self.scenario.scenery:SendEverything(self)
			end
		end		
		
	end
	

end

