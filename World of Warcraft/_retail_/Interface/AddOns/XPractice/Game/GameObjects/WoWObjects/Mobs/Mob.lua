do
	local super=XPRACTICE.WoWObject
	XPRACTICE.Mob=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Mob
	
	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)

		self:CreateAI()
		self:CreateCombatModule()		
		
		self.backpedal=false
		self.walking=false
		self.lockorientationtocamera=false
		
		self.attemptedmovementunitvector={x=0,y=0}		
	end
	
	function class:SetupEnvironmentObjectListIndexStorage()
		super.SetupEnvironmentObjectListIndexStorage(self)
		tinsert(self.environmentobjectlists,self.environment.mobs)
	end	
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)

		self.basemovespeed=7.0
		self.backpedalspeed=4.5
		self.walkspeed=2.5
		self.startingphasealpha=0
		--self.defaultspeechbubbleduration=2.0		--TODO NEXT: up to 8 seconds depending on message length!
		self.defaultspeechbubbleduration=4.0		--TODO NEXT: up to 8 seconds depending on message length!
		self.floorbelow=true
		
		self.yawchangeshufflethreshhold=0
	end
	
	function class:CreateAI()
		self.ai=XPRACTICE.MobAI.new()
		self.ai:Setup(self)		
	end
	
	--shortcut function
	function class:SetFacepullRadiusViaOwner(ai)
		ai.facepullradius=20
	end
	
	function class:CreateCombatModule()
		self.combatmodule=XPRACTICE.CombatModule.new()
		self.combatmodule:Setup(self)
	end
	
	function class:SetTargetMob(mob)
		self.combatmodule:SetTargetMob(mob)
	end
	
	function class:IsAbleToTurnAround()
		if(		self:IsIncapacitated()
			or #self.combatmodule.auras.forcedmovement>0
			)then
			return false
		end
		return true
	end
	
	function class:IsIncapacitated()
		--TODO: differentiate between "caught in Glimpse of Infinity, able to rotate camera"
		-- and "full-blown actual cutscene, no camera controls whatsoever"
		--if(#self.combatmodule.auras.forcedmovement>0
		--or #self.combatmodule.auras.unskippablecutscene>0
		if(#self.combatmodule.auras.unskippablecutscene>0
			)then
			return true
		end
		if(#self.combatmodule.auras.incapacitated>0
			)then
			return true
		end		
		return false	
	end
	
	function class:IsMoving()
		return (not (self.velocity.x==0 and self.velocity.y==0 and self.velocity.z==0))
	end

	
	function class:Step(elapsed)
		super.Step(self,elapsed)
				
		
		self.ai:AIStep(elapsed)
		
		self:CheckIfTargetMobIsStillVisible()
		
		local vx=self.ai.moveinputvector.x
		local vy=self.ai.moveinputvector.y
		
		local unitvectorx=0
		local unitvectory=0
		self.attemptedmovementunitvector.x=0
		self.attemptedmovementunitvector.y=0
		local movespeed
		--setting movespeed now, but can be overridden later during specialmovement check
		movespeed=self:GetFinalMoveSpeed()
		
		
		if(self:IsIncapacitated()==false) then
			if(#self.combatmodule.auras.forcedmovement>0)then			
				local aura=self.combatmodule.auras.forcedmovement[#self.combatmodule.auras.forcedmovement]
				self.lockorientationtocamera=false
				local yaw=aura:GetForcedMovementAngle()
				vx=math.cos(yaw)
				vy=math.sin(yaw)
				movespeed=aura:GetForcedMovementSpeed() --TODO: some but not all forcedmove effects are compatible with speed boosts
			end
			
			if(vx~=0 or vy~=0)then
				--if(self:Isa(XPRACTICE.PlayerCharacter))then print("MOVEVECTOR ~= 0") end 
				local dist=math.sqrt(vx*vx+vy*vy)
				unitvectorx=vx/dist
				unitvectory=vy/dist			
				self.attemptedmovementunitvector.x=unitvectorx
				self.attemptedmovementunitvector.y=unitvectory							
			end
		end

		
		
		--print(vx,vy)

		-- if(self.position.z>0)then
			-- unitvectorx=0
			-- unitvectory=0
		-- end
		
		-------VELOCITY-----------------------------------
		--TODO: not(self:IsInMidair())
		--if(unitvectorx==0 and unitvectory==0 and self.position.z<=0)then
		if(unitvectorx==0 and unitvectory==0 and not(self:IsInMidair()))then
			self.velocity.x=0
			self.velocity.y=0	
			self.target_orientation_displayed.yaw=self.orientation.yaw
			--self.displayobject:PlayAnimation(0)
		end		
		
		--TODO: not(self:IsInMidair())
		if(self:IsIncapacitated()==false)then
			if(unitvectorx~=0 or unitvectory~=0)then
				--if(self.position.z<=0)then					
				if(not(self:IsInMidair()))then
					self.velocity.x=unitvectorx*movespeed
					self.velocity.y=unitvectory*movespeed					
					--print("UVXY",unitvectorx,unitvectory,self.position.z)
				else
					--TODO: if current midair speed is 0, adjust speed very slightly
				end
			end
		end
		
		
		-------TURNING------------------------------------
		local turnspeed=5				
		--TODO: self:IsInMidair()
		--if(unitvectorx~=0 or unitvectory~=0 or self.position.z>0)then
		if(unitvectorx~=0 or unitvectory~=0 or self:IsInMidair())then
			turnspeed=10
		end	
		if(unitvectorx~=0 or unitvectory~=0)then			
			if(self.lockorientationtocamera)then
				--TODO: ask camera for targetfacing
				self.target_orientation_displayed.yaw=self.orientation.yaw
				self.orientation_displayed.yaw=self.target_orientation_displayed.yaw
			else
				local targetfacing				
				targetfacing=math.atan2(unitvectory,unitvectorx)				
				if(self.backpedal)then targetfacing=XPRACTICE.WrapAngle(targetfacing+math.pi) end
				self.target_orientation_displayed.yaw=targetfacing
			end	
		end
		--local difference=self.target_orientation_displayed.yaw-self.orientation_displayed.yaw
		--if(self:Isa(XPRACTICE.PlayerCharacter))then	print("Yaw",self.orientation_displayed.yaw,self.target_orientation_displayed.yaw,difference)	end
		local newyaw,yawchange=self:GetNewYawTurnAtSpeed(self.target_orientation_displayed.yaw,elapsed,turnspeed)
		--if(self:Isa(XPRACTICE.INDIGNATION.SireDenathrius))then print("Yaw",self.target_orientation_displayed.yaw,self.orientation.yaw,yawchange)	end
		--if(self:Isa(XPRACTICE.TERROROFCASTLENATHRIA.LanternGhost))then print("Yaw",self.target_orientation_displayed.yaw,self.orientation.yaw,yawchange)	end
		self.orientation_displayed.yaw=newyaw
		
		
		-------ANIMATION---------------------------------
		-- check for channeled/casted spells first.
		if(self.combatmodule.channeledspell)then
			self.combatmodule.channeledspell.spellbookspell:ChannelingAnimationFunction(self.combatmodule.channeledspell)
		end		
		if(self.combatmodule.castedspell)then
			self.combatmodule.castedspell.spellbookspell:CastingAnimationFunction(self.combatmodule.castedspell)			
		end
		-- movement will override spellcasting animation
		--TODO: not(self:IsInMidair())
		--if(self.position.z<=0)then
		if(not self:IsInMidair(0))then
			if(unitvectorx~=0 or unitvectory~=0)then
				if(self.backpedal)then  
					--self.displayobject:PlayAnimation(13)
					--TODO: is there really no distinct "Runbackwards" animation?
					self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Walkbackwards)
				else
					--self.displayobject:PlayAnimation(5)
					if(self.walking==false)then
						local speedsqr=self.velocity.x*self.velocity.x+self.velocity.y*self.velocity.y
						if(speedsqr<(7*1.5)*(7*1.5))then
							self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Run)
						else
							self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Sprint)
						end
					else
						self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Walk)
					end
				end
			end
			if(unitvectorx==0 and unitvectory==0)then
				if(yawchange==0)then
					if(not self.combatmodule.autoattacking)then
						self:PlayIdleAnimation()
					else
						self:PlayAttackStanceAnimation()
					end
				elseif(math.abs(yawchange)>self.yawchangeshufflethreshhold)then
					if(yawchange>0)then					
						self:PlayShuffleLeftAnimation()		
					elseif(yawchange<0)then
						self:PlayShuffleRightAnimation()					
					end
				end
			end
		else
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Jump)
		end


		
		-------MOVEMENT----------------------------------		
		if(self.previousposition.z>0 and self.position.z<=0 and not self:IsInMidair())then
			--don't JumpLandRun if we're backpedaling!
			if((unitvectorx==0 and unitvectory==0) or self.backpedal)then
				self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.JumpEnd)	
			else				
				--print("JumpLandRun")
				self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.JumpLandRun)
			end
			self.position.z=0
			self.velocity.z=0		
		end
		
		
	end
	
	function class:PlayIdleAnimation()
		----override as needed
		--self.displayobject:PlayAnimation(0)
		self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Idle)
	end
	function class:PlayShuffleLeftAnimation()
		self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ShuffleLeft)
	end
	function class:PlayShuffleRightAnimation()
		self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ShuffleRight)
	end	
	function class:PlayAttackStanceAnimation()
		self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Ready1H)
	end
	
	function class:Movement(elapsed)
		--TODO: move to GameObject
		self.position.x=self.position.x+self.velocity.x*elapsed
		self.position.y=self.position.y+self.velocity.y*elapsed		
		--TODO: self:IsInMidair()
		--if(self.position.z>0 or self.velocity.z>0)then
		if(self:IsInMidair())then
			self.velocity.z=self.velocity.z+self.gravity*elapsed
		end
		self.position.z=self.position.z+self.velocity.z*elapsed
	end
	
	
	function class:CombatPhase(elapsed)
		--TODO: split combat into multiple phases
		if(self.combatmodule)then				
			self.combatmodule:Step(elapsed)
			self.combatmodule.auras:Step(elapsed)
			self.combatmodule.auras:CheckAuraExpiry()
			self.combatmodule.auras:EndOfFrame()
		end
	end

	
		-- Function should (eventually) account for all speed modifiers, snares, roots, etc.
	function class:GetFinalMoveSpeed()
		local finalspeed
		if(self.walking)then
			finalspeed=self.walkspeed
		else
			if(not self.backpedal)then
				finalspeed=self.basemovespeed
			else
				finalspeed=self.backpedalspeed
			end		
		end
		return finalspeed*self:GetSpeedBoostMultiplier()
	end
	
	function class:GetSpeedBoostMultiplier()
		if(#self.combatmodule.auras.speedboost==0)then return 1.0 end
		local maxmultiplier=0
		for i=1,#self.combatmodule.auras.speedboost do
			local aura=self.combatmodule.auras.speedboost[i]
			maxmultiplier=math.max(aura.multiplier,maxmultiplier)
		end
		return maxmultiplier		
	end
	

	function class:GetNewYawTurnAtSpeed(targetyaw,elapsed,turnspeed,oldyaw)
		
		if(not oldyaw)then oldyaw=self.orientation_displayed.yaw end
		
		local difference=targetyaw-oldyaw		
		if(math.abs(difference)<=0.00000001)then difference=0 end
		--if(self:Isa(XPRACTICE.THEJAILER2.TheJailer))then	print("old",oldyaw,"target",targetyaw,"diff",difference)	end
		
		if(difference<-math.pi) then difference=difference+math.pi*2 end
		if(difference>math.pi) then difference=difference-math.pi*2 end
		
		local yawchange=0;
		
		if(difference>0)then yawchange=turnspeed*elapsed end
		if(difference<0)then yawchange=-turnspeed*elapsed end
		-- must add turnspeed*elapsed even when snapping to 90 degree angle
		-- otherwise mob can get stuck facing perpendicular to circular movement
		if(difference>math.pi/2)then yawchange=difference-math.pi/2+turnspeed*elapsed end
		if(difference<-math.pi/2)then yawchange=difference-(-math.pi/2)-turnspeed*elapsed end

		if(math.abs(math.abs(difference)-math.pi)<turnspeed*elapsed) then
			if(math.random()>.5)then
				yawchange=-yawchange
			end
		end
		
		local newyaw=oldyaw+yawchange
		
		if(math.abs(difference)<turnspeed*elapsed*2) then
			newyaw=targetyaw
			yawchange=difference
		end	
		
		if(newyaw<-math.pi) then newyaw=newyaw+math.pi*2 end
		if(newyaw>math.pi) then newyaw=newyaw-math.pi*2 end	
		
		return newyaw,yawchange
	end
	
	function class:SetSelected(selected)
		self.selected=selected
		if(self.nameplate)then
			self.nameplate:SetSelected(selected)
		end
	end
	
	function class:CheckIfTargetMobIsStillVisible()
		if(self.combatmodule.targetmob)then
			if(not self.combatmodule.targetmob:ExistsInPhase(self.phase))then
				self.combatmodule:SetTargetMob(nil)
			end
		end
	end
	
	function class:GetAuraAnimation()
		if(#self.combatmodule.auras.animation==0)then
			return nil
		else
			return self.combatmodule.auras.animation[#self.combatmodule.auras.animation]:GetAnimation()
		end
	end
	
	function class:OnArrivedAtAIDestination()
		--override
	end
	
	--shortcut function
	--TODO: maybe don't hardcode this?
	function class:IsDeadInGame()
		--local auras=self.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.Aura_DeadInGame,self.combatmodule.auras.deadingame)
		--TODO: also return newauras, somehow
		local auras=self.combatmodule.auras.deadingame
		return (#auras>0)
	end
	
	function class:Cleanup()
		super.Cleanup(self)
		if(self.mobclickzone)then
			self.mobclickzone:Die()
		end
	end
	
	function class:IsInMidair()
		return not(self.position.z<=0 and self.floorbelow)
	end
	
	function class:FreezeOrientation(yaw)
		self.orientation.yaw=yaw
		self.orientation_displayed.yaw=yaw
		self.target_orientation_displayed.yaw=yaw	
	end
	
	-- at the moment, only PlayerCharacters can facepull
	--TODO: limit this further so only the current playercontrolled playercharacter can facepull
	function class:AttemptFacepull()
		--TODO: this function will overlap with other pulling functions; reuse code somehow
		local mobs=self.environment.mobs
		for i=1,#mobs do
			local mob=mobs[i]
			if((mob.ai.facepullradius) and (not mob.pulled))then
				local xdist=self.position.x-mob.position.x
				local ydist=self.position.y-mob.position.y
				local distsqr=xdist*xdist+ydist*ydist
				if(distsqr<=mob.ai.facepullradius*mob.ai.facepullradius)then
					mob.ai:Pull(self)
				end
			end
		end
	end

	function class:CreateSpeechBubble(text,duration)
		duration=duration or self.defaultspeechbubbleduration
		if(string.len(text)<=10)then	duration=2.0	end --TODO NEXT:
		if(self.speechbubble)then
			self.speechbubble:Die()
			self.speechbubble=nil
		end		
		local speechbubble=XPRACTICE.SpeechBubble.new()
		speechbubble:Setup(self.environment,self)
		
        -- Regex for {rt1} icons (thanks Echo)
        local raidIcon = string.match(text, '%{rt(%d)%}')
        while raidIcon do
            text = text:gsub("%{rt(%d)%}", "\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_"..raidIcon..":12\124t", 1)
            raidIcon = string.match(text, '%{rt(%d)%}')
        end		
		
		speechbubble.duration=duration
		speechbubble:SetText(text)		
	end	
	
	function class:ClearSpeechBubble()
		if(self.speechbubble)then
			self.speechbubble:Die()
			self.speechbubble=nil
		end		
	end	

	
	
end