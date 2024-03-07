
do
	local super=XPRACTICE.Mob
	XPRACTICE.MULTIPLAYER.MultiplayerGhost=XPRACTICE.inheritsFrom(XPRACTICE.Mob)
	local class=XPRACTICE.MULTIPLAYER.MultiplayerGhost
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
				
		self.targetghostalpha=1
		self.ghostalpha=1
		self.ghostalphamultiplier=1.0
		self.enabled=false
		self.destx=nil
		self.desty=nil
		self.multidestx=nil
		self.multidesty=nil
		self.playername=self.playername or "[Unknown]"
		self.officer=false
		self.floorbelow=true
		self.extraobjects={}
		
	end	
	function class:SetActorAppearanceViaOwner(actor)	
		actor:SetModelByCreatureDisplayID(67812) -- murky (murky is missing a lot of animations.  will that be a problem?)
		if(self.copyplayerappearance)then	-- quick hack for Rygelon multiplayer
			local firstname=strsplit("-",self.playername)
			actor:SetModelByUnit(firstname)
		end
	end
	
	function class:CreateAssociatedObjects()
		local nameplate=XPRACTICE.PlayerNameplate.new()
		nameplate:Setup(self.environment,self)
		local name,server=strsplit("-",self.playername)
		local myname,myserver=UnitFullName("player")
		if(server==myserver)then
			nameplate:SetText(name)
		else
			nameplate:SetText(name.." (*)")
		end
		--nameplate:SetSelected(false)
		nameplate:SetSelected(true)
		local mobclickzone=XPRACTICE.MobClickZone.new()
		mobclickzone:Setup(self.environment,self)
	end

	function class:CreateCombatModule()
		super.CreateCombatModule(self)
		local spell_roll=XPRACTICE.Spell_Roll.new()
		spell_roll:Setup(self.combatmodule)
		--TODO: don't hardcode roll.  it's already spellbook[1]
		self.combatmodule.spellbook.roll=spell_roll
	end	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		
		if(self.remainingreactiontime~=nil and self.destx and self.desty)then			
			self.remainingreactiontime=self.remainingreactiontime-elapsed
			if(self.remainingreactiontime<=0)then
				if(not self:IsInMidair())then
					self.remainingreactiontime=nil
					self.ai:SetTargetPosition(self.destx,self.desty)
					if(self.destyaw)then 
						--print("set yaw to destyaw",self.destyaw)
						self.orientation.yaw=self.destyaw 					
						self.destyaw=nil
					else
						if(self.desty and self.destx)then
							local angle=math.atan2(self.desty-self.position.y,self.destx-self.position.x)
							if(self.desty~=self.position.y or self.destx~=self.position.x)then
								self.orientation.yaw=angle
							end
						else
							self.orientation.yaw=self.orientation_displayed.yaw
						end
					end
				end
			end
		end
		
		
		if(self.scenario and self.scenario.player)then
			if(self.ghostalpha>self.targetghostalpha)then
				self.ghostalpha=self.ghostalpha-elapsed*0.5
				if(self.ghostalpha<self.targetghostalpha)then self.ghostalpha=self.targetghostalpha end
			end
			if(self.ghostalpha<self.targetghostalpha)then
				self.ghostalpha=self.ghostalpha+elapsed*0.5				
				if(self.ghostalpha>self.targetghostalpha)then self.ghostalpha=self.targetghostalpha end
			end			
		end
		self.alpha=self.ghostalpha*self.ghostalphamultiplier
	end
	
	
	function class:IsCheckingWalls()
		if(self.alwaysignorecollision)then return false end
		if(self==self.scenario.player)then return true end
	end	
	
	function class:StopAI()
		self.destx=nil;self.desty=nil
		self.ai.targetposition=nil
		self.prevmovex=nil;self.prevmovey=nil
		local clearcamps=true
		if(self.scenario)then
			if(self.scenario.player==self)then
				clearcamps=false
			end
		end
		if(clearcamps)then self.camps={} end
		self.combatmodule.tauntmovetarget=nil
	end

	function class:Movement(elapsed)
		local windvelocityx=0
		local windvelocityy=0		
		--TODO: wind check goes in baseline Mob
		for i=1,#self.combatmodule.auras.wind do
			local aura=self.combatmodule.auras.wind[i]
			local x,y,z=aura:GetWindVelocity()
			windvelocityx=windvelocityx+x
			windvelocityy=windvelocityy+y
		end	
		local vx=self.velocity.x+windvelocityx
		local vy=self.velocity.y+windvelocityy
	
		self.wallchecking=false
		local wallcheck=(self:IsCheckingWalls() and self.scenario and self.scenario.layout and self.scenario.layout.WalllineCheck and #self.combatmodule.auras.ignorewalls==0)		
		if(not wallcheck)then
			self.position.x=self.position.x+vx*elapsed
			self.position.y=self.position.y+vy*elapsed
		else
			local vectorx=vx*elapsed
			local vectory=vy*elapsed
			local hit,mobangle,wallangle,diff,wallindex=true,nil,nil,nil,nil
			local ignoredwalls={}
			local safety=10
			local hitcount=0
			while(hit and safety>0)do
				safety=safety-1
				hit,mobangle,wallangle,diff,wallindex=self.scenario.layout:WalllineCheck(self,vectorx,vectory,ignoredwalls)
				if(hit)then 
					ignoredwalls[wallindex]=true
					hitcount=hitcount+1
					if(hitcount>=2)then
						--TODO: better corner detection with fewer false positives
						vectorx=0;vectory=0
						safety=0
					else											
						--TODO: there's probably a more efficient way to handle this
						local velocity=math.sqrt(vectorx*vectorx+vectory*vectory)
						local rotatedangle=mobangle-wallangle
						-- with the rotated wall along the x-axis, shave off yvelocity, leaving only xvelocity
						local newvelocity=math.cos(rotatedangle)*velocity
						local newangle=wallangle
						-- then move player along the direction of the wall
						vectorx=math.cos(newangle)*newvelocity
						vectory=math.sin(newangle)*newvelocity				
						self.wallchecking=true 
					end
				end
			end
			-- if(self.wallchecking)then
				-- print("Vectors:",vectorx,vectory)
			-- end
			self.position.x=self.position.x+vectorx
			self.position.y=self.position.y+vectory
			
		end
		
		if(self:IsInMidair())then
			self.velocity.z=self.velocity.z+self.gravity*elapsed
		end
		self.position.z=self.position.z+self.velocity.z*elapsed
		
		--TODO: grip check goes in baseline Mob
		if(#self.combatmodule.auras.grip>0)then
			local aura=self.combatmodule.auras.grip[#self.combatmodule.auras.grip]
			local x,y,z=aura:GetGripPosition()
			self.position.x=x
			self.position.y=y
			self.position.z=z			
		end		
	end

end
