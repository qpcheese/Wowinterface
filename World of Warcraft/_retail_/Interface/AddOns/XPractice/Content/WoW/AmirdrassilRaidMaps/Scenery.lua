do
						
	do
		local super=XPRACTICE.MultiSolid
		XPRACTICE.AMIRDRASSILRAIDMAPS.Scenery=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.AMIRDRASSILRAIDMAPS.Scenery
	
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
		
		function class:SendEverything(floormultisolid)
			for i=1,#self.actors do
				local actor=self.actors[i]
				--print("Cleanup multisolid",self,"actor",i,actor.frame,actor)
				XPRACTICE.ReusableModelSceneFrames:RemoveActor(actor.frame,actor)
			end
			self.actors={}
			--self.nextactor=1
			XPRACTICE.AMIRDRASSILRAIDMAPS.SceneryData.Populate(self,floormultisolid.TEMP_centerx,floormultisolid.TEMP_centery,floormultisolid.TEMP_centerz)
		end
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			
			if(self.nextactor)then
				self.timer=self.timer or 0
				self.timer=self.timer-elapsed
				if(self.timer<=0)then
					self.timer=self.timer+100
					for i=1,10 do
						if(self.nextactor<=#self.actors)then
							self.actors[self.nextactor]:SetAlpha(1)							
							self.nextactor=self.nextactor+1
						else
							self.nextactor=nil
						end
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
		end		
		
	end
	

end

