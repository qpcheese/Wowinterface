do
	local super=XPRACTICE.MULTIPLAYER.MultiplayerGhost
	XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost
	

	--TODO: code reuse / PlayerCharacter
	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		self.wallchecking=false
		self.camps={}
	end

	local prev=class.SetCustomInfo
	function class:SetCustomInfo()
		prev(self)
		--self.ghostalphamultiplier=0.5
		self.ghostalphamultiplier=1
		--self.targetable=false  --TODO: maybe allow targeting ghosts via options menu or something
		self.targetable=true  --changed to true for now so bosses can autoattack ghosts
		self.spectator=true
	end
	


	-- function class:CreateDisplayObject()
		-- self.displayobject=XPRACTICE.ModelSceneActor.new()
		-- self.displayobject:Setup(self)
		-- --self.displayobject.drawable:SetModelByCreatureDisplayID(14366) -- ghost
		-- self.displayobject.drawable:SetModelByCreatureDisplayID(67812) -- murky (murky is missing a lot of animations.  will that be a problem?)
		-- if(self.playername)then		
			-- --self.displayobject.drawable:SetModelByUnit(self.playername)
			-- local firstname=strsplit("-",self.playername)
			-- self.displayobject.drawable:SetModelByUnit(firstname)
		-- end
		-- --self.displayobject.drawable:SetModelByUnit("player")
	-- end	
	
	function class:SetActorAppearanceViaOwner(actor)
		actor:SetModelByCreatureDisplayID(67812) -- murky (murky is missing a lot of animations.  will that be a problem?)
		if(self.playername)then		
			local firstname=strsplit("-",self.playername)
			actor:SetModelByUnit(firstname)
		end
	end
	
	local prev=class.CreateAssociatedObjects
	function class:CreateAssociatedObjects()		
		-- do not create clickzone/nameplate here, it's been moved to CreateNameplates
	end
	
	-- function class:CreateAssociatedObjects()
		-- 
	-- end
	
	function class:CreateNameplates()
		local name,server=strsplit("-",self.playername)
		local myname,myserver=UnitFullName("player")
		local nameplate=XPRACTICE.PlayerNameplate.new()
		nameplate:Setup(self.environment,self)		
		if(server==myserver)then
			nameplate:SetText(name)
		else
			nameplate:SetText(name.." (*)")
		end
		nameplate:SetSelected(true)
		local mobclickzone=XPRACTICE.MobClickZone.new()
		mobclickzone:Setup(self.environment,self)
		self.nameplate=nameplate
		self.mobclickzone=mobclickzone
		nameplate.alpha=0.5
		-- nameplate.scalemultiplier=0.25 	-- only if using ghost model (and if we're overriding it with player, we can't tell if we're using ghost model)
		self.nameplate=nameplate
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
	
	function class:CanSafelyMoveWithoutInterrupting()
		--print("?")
		if(self.combatmodule.castedspell)then
			if(not self.combatmodule.castedspell.spellbookspell:IsUsableWhileMoving(self.combatmodule.castedspell))then
				return false
			end
		end
		if(self.combatmodule.channeledspell)then
			if(not self.combatmodule.channeledspell.spellbookspell:IsUsableWhileMoving(self.combatmodule.channeledspell))then
				return false
			end
		end
		if(#self.combatmodule.auras.freezeboss>0)then
			return false
		end
		return true
	end	
	
	
	
		
	function class:Step(elapsed)
		-- no longer inherits step from v1ghost; pretend we inherited Mob directly
		XPRACTICE.Mob.Step(self,elapsed)
		
		if(self.portalreactiontime~=nil and self.portal_TEMP)then
			self.portalreactiontime=self.portalreactiontime-elapsed
			if(self.portalreactiontime<=0)then
				self.portal_TEMP:TeleportToOtherGateway(self)
				self.portal_TEMP=nil
				self.portalreactiontime=nil
			end
		end		
		
		
		if(self.remainingreactiontime~=nil)then			
			self.remainingreactiontime=self.remainingreactiontime-elapsed
			if(self.remainingreactiontime<=0)then
				if(not self:IsInMidair())then
					if(self:CanSafelyMoveWithoutInterrupting())then					
						self.remainingreactiontime=nil
						if(self.destx and self.desty)then
							self.ai:SetTargetPosition(self.destx,self.desty)
							--print("targetposition",self.destx,self.desty)
						end
					-- end
					-- if(self:CanSafelyTurnWithoutInterrupting())then	
					
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
		end
		
		
		if(self.facetowardsmob)then
			if(self.facetowardsmob.dead)then
				self.facetowardsmob=nil
			else
				if(self.destyaw==nil)then-- if(self.destx==nil and self.desty==nil and self.destyaw==nil)then
					angle=math.atan2(self.facetowardsmob.position.y-self.position.y,self.facetowardsmob.position.x-self.position.x)
					self.orientation.yaw=angle
				end			
			end
		end				
				
		
		if(self.remainingrolltime and self.remainingrolltime>0)then
			self.remainingrolltime=self.remainingrolltime-elapsed			
			if(self.remainingrolltime<=0)then
				--print("roll check")
				self.remainingrolltime=0
				local MINDIST=20
				if(self.ai.targetposition)then
					local distsqr=XPRACTICE.distsqr(self.ai.targetposition.x,self.ai.targetposition.y,self.position.x,self.position.y)
					--local dist=math.sqrt(distsqr)					
					if(distsqr>=MINDIST*MINDIST)then
						--print("dist:",dist)
						local spell_roll=self.combatmodule.spellbook.roll
						local queuepointer=spell_roll:NewQueue()
						queuepointer.castercombat=self.combatmodule
						local errorcode=self.combatmodule:TryQueue(queuepointer)
					end
					--TODO:
					-- self.ai.targetposition={x=self.destx,y=self.desty}
					-- self.orientation.yaw=self.destyaw
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
end