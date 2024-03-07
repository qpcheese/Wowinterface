do
	local super=XPRACTICE.Mob
	XPRACTICE.PlayerCharacter=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.PlayerCharacter

	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		self.nextpulltime=0
		self.playername=UnitName("player") --TODO: move to addon startup
		self.extraobjects={}
		self.wallchecking=false
	end
	
	function class:CreateCombatModule()
		super.CreateCombatModule(self)
		local spell_roll=XPRACTICE.Spell_Roll.new()
		spell_roll:Setup(self.combatmodule)
		self.combatmodule.spellbook.roll=spell_roll
	end
	

	function class:SetActorAppearanceViaOwner(actor)
		actor:SetModelByUnit("player")
	end
	
	function class:Step(elapsed)
		self.destyaw=nil --!!!
		self.remainingreactiontime=nil--!!!
		--print("yaw",self.orientation.yaw,self.orientation_displayed.yaw,self.target_orientation_displayed.yaw)
		super.Step(self,elapsed)
		if(self.localtime>self.nextpulltime)then
			self.nextpulltime=self.nextpulltime+1.0
			self:AttemptFacepull()
		end	
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
		local wallcheck=(self.scenario and self.scenario.layout and self.scenario.layout.WalllineCheck and #self.combatmodule.auras.ignorewalls==0)		
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
	
	function class:PlayAttackStanceAnimation()
		if(self.scenario and self.scenario.PlayPlayerAttackStanceAnimation)then
			self.scenario:PlayPlayerAttackStanceAnimation()
		else
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Ready1H)
		end
	end
	

	--temporary thing so we can copy ghosts
	function class:ApproachPoint(x,y,mindistance,maxdistance,override)		
		--TODO: have scenario specify which PlayerGhost we're supposed to use
		self.destyaw=nil --!!!		
		local dist=(mindistance+maxdistance)/2.0
		local r=XPRACTICE.LEGACY.PlayerGhost.ApproachPoint(self,x,y,dist,dist,override)
		self.remainingreactiontime=nil--!!!
		return r
		
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

end







do
	local super=XPRACTICE.GameObject
	XPRACTICE.PlayerController=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.PlayerController	
	
	function class:Setup(environment,player,camera)
		super.Setup(self,environment)
		self.player=player
		self.camera=camera
		self.potentialclicktarget=nil
		self.potentialclicktargetcoordinates={x=0,y=0}
	end


	function class:GetPlayerInput(elapsed)
		local keys=self.player.environment.game.keys	
		
		local xcameradelta=0
		local ycameradelta=0
		
		----------CAMERA--------------------
		
		local camera=self.camera		
		--TODO: take a look at zoom controls from old version
		local delta=keys.wmouse.pressed
		if(delta)then
			--print("delta:",delta)
			camera:AdjustZoomViaScrollWheel(delta)
		end
		
		local SCROLL_SPEED=20
		
		
		local mousepressed=false
		local mousecurrent=false
		local mousereleased=false
		if(keys.lmouse.pressed or keys.rmouse.pressed)then
			mousepressed=true
		end
		if(keys.lmouse.current or keys.rmouse.current)then
			mousecurrent=true
		end
		if(keys.lmouse.released or keys.rmouse.released)then
			-- note that this detects whether EITHER mouse button was released, even if the other is still held down.
			-- to determine check if mousecurrent=false
			mousereleased=true
		end		
		
		if(mousepressed)then
			local globalx,globaly=GetCursorPosition()
			camera.camerarotationprevmousex=globalx
			camera.camerarotationprevmousey=globaly
			XPRACTICE.CVars:Override("enableMouseSpeed",1)
				-- -- turns out using 0 doesn't work -- camera rotation becomes too granular
			--XPRACTICE.CVars:Override("mouseSpeed",0)
			
			--TODO: first check if mouse sensitivity is enabled and already lower than override!
				-- don't speed the mouse up unwittingly!
			XPRACTICE.CVars:Override("mouseSpeed",XPRACTICE.Config.Camera.MouseSpeed)
		end
		if(mousecurrent)then	
			local globalx,globaly=GetCursorPosition()

			local TEMP_MULTIPLIER=XPRACTICE_SAVEDATA.Config.Camera.CameraSpeed 	--6-7 for windowed, 9-10 for fullscreen
			--TODO: can we use the GetScaledRect trick for cameraspeed?
			--TODO: attempt to detect whether mouse sensitivity was already set by player, and calculate multiplier from that
			local speed=0.006*(XPRACTICE.CVars.cvarvalues["cameraYawMoveSpeed"]/180)*TEMP_MULTIPLIER

			if(camera.camerarotationprevmousex and camera.camerarotationprevmousey)then
				xcameradelta=(globalx-camera.camerarotationprevmousex)
				ycameradelta=(globaly-camera.camerarotationprevmousey)
			end
			local inversionmultiplier=1
			if(XPRACTICE.CVars.cvarvalues["mouseInvertYaw"]=="1")then
				inversionmultiplier=-1
			end		
			camera.orientation.yaw=camera.orientation.yaw+ -1*xcameradelta*inversionmultiplier*speed
			
			local inversionmultiplier=1
			if(XPRACTICE.CVars.cvarvalues["mouseInvertPitch"]=="1")then			
				inversionmultiplier=-1
			end
			camera.orientation.pitch=camera.orientation.pitch+ -1*ycameradelta*inversionmultiplier*speed
			
			if(camera.orientation.yaw<-math.pi) then camera.orientation.yaw=camera.orientation.yaw+math.pi*2 end
			if(camera.orientation.yaw>math.pi) then camera.orientation.yaw=camera.orientation.yaw-math.pi*2 end				
			
			camera.camerarotationprevmousex=globalx
			camera.camerarotationprevmousey=globaly

			--TODO: move min/max consts to camera
			local MIN_VERTICAL_ANGLE=math.pi*-0.0	--ground
			--local MAX_VERTICAL_ANGLE=math.pi*0.5	--some objects disappear at 0.5
			local MAX_VERTICAL_ANGLE=math.pi*0.49	--overhead
			if(camera.orientation.pitch<MIN_VERTICAL_ANGLE)then camera.orientation.pitch=MIN_VERTICAL_ANGLE end
			if(camera.orientation.pitch>MAX_VERTICAL_ANGLE)then camera.orientation.pitch=MAX_VERTICAL_ANGLE end			
		else
			--else not mousecurrent
			--TODO: look for "self.player" instead (which is apparently never nil)
			-- local player=self.scenario.controls.player
			-- if(player)then
				-- player.targetfacing_3D_button=0
			-- end
		end

		if(mousereleased and not mousecurrent)then
			--TODO: does it matter which order we do this in?  does it need to be reverse order instead?
			XPRACTICE.CVars:Restore("enableMouseSpeed")
			XPRACTICE.CVars:Restore("mouseSpeed")			
		end
		
		local delta=keys.wmouse.pressed
		if(delta)then		
			local DELTA_MULTIPLIER=1
			
			camera.cdist=camera.cdist-delta*DELTA_MULTIPLIER
			local MIN_DIST=5	--TODO: move to camera
			local MAX_DIST=90
			if(camera.cdist<MIN_DIST)then camera.cdist=MIN_DIST end
			if(camera.cdist>MAX_DIST)then camera.cdist=MAX_DIST end
		end	
	
	
	

		
		------PLAYER CHARACTER------------
	
		if(self.player) then
			local player=self.player
			
			if(keys.rmouse.current and (keys.lmouse.current or xcameradelta~=0 or ycameradelta~=0))then
				if(player:IsAbleToTurnAround())then
					player.orientation.yaw=camera.orientation.yaw
					player.target_orientation_displayed.yaw=player.orientation.yaw
				end
			elseif(not keys.rmouse.current)then
				local turnvector=0
				if(keys.turnQ.current)then
					turnvector=turnvector+1
				end
				if(keys.turnE.current)then
					turnvector=turnvector-1
				end				
				if(turnvector~=0)then
					if(player:IsAbleToTurnAround())then
						--TODO: move to AI?
						if(turnvector>0)then
							self.player.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ShuffleLeft)
						elseif(turnvector<0)then
							self.player.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ShuffleRight)
						end
						local TURN_SPEED=2.5											
						player.orientation.yaw=player.orientation.yaw+turnvector*elapsed*TURN_SPEED
						player.orientation.yaw=XPRACTICE.WrapAngle(player.orientation.yaw)
						player.orientation_displayed.yaw=player.target_orientation_displayed.yaw+turnvector*elapsed*TURN_SPEED
						player.orientation_displayed.yaw=XPRACTICE.WrapAngle(player.orientation_displayed.yaw)					
						player.target_orientation_displayed.yaw=player.target_orientation_displayed.yaw+turnvector*elapsed*TURN_SPEED
						player.target_orientation_displayed.yaw=XPRACTICE.WrapAngle(player.target_orientation_displayed.yaw)
						
						--print("turning",player.target_orientation_displayed.yaw)
						if(not keys.lmouse.current)then
							camera.orientation.yaw=camera.orientation.yaw+turnvector*elapsed*TURN_SPEED
							camera.orientation.yaw=XPRACTICE.WrapAngle(camera.orientation.yaw)
						end
					end
				end
			end
			
			local vectorx,vectory			
			vectorx,vectory=self:GetCharacterMovementInputUnitVector()
			if(#player.combatmodule.auras.forcedmovement>0)then			
				local aura=player.combatmodule.auras.forcedmovement[#player.combatmodule.auras.forcedmovement]
				player.backpedal=aura.backpedal
			else				
				player.backpedal=(vectorx<0)
			end
			
			player.lockorientationtocamera=(vectorx~=0 and vectory==0 and (xcameradelta~=0 or ycameradelta~=0))
			--player.lockorientationtocamera=(player.lockorientationtocamera or (player.position.z>0))
			
			if(vectorx==0 and vectory==0)then
				--print("!",player.ai.suggestmode)
				if(not player.ai.suggestmode)then
					--TODO LATER: this is clearing camp before the hint arrow can even be drawn.  for now, make exception for player in stopai
					player:StopAI()
				end
			else
				player.ai.suggestmode=false
				player.combatmodule.tauntmovetarget=nil	--TODO: maybe move to AI?
				player.ai.targetlocation={}			
				local yaw=player.orientation.yaw
				
				vectorx,vectory=XPRACTICE.Transform_Rotate2D(vectorx,vectory,yaw,0,0)
				local movespeed=player:GetFinalMoveSpeed()
				player.ai.targetposition={x=player.position.x+vectorx*movespeed*2,y=player.position.y+vectory*movespeed*2}
			end
		end
			

		--------- MOBCLICKZONES and NAMEPLATES -------------------------------
		
		-- target enemy on mouseup, not mousedown
		-- don't target enemy if:
			-- if both mousebuttons were pressed before either button was released
			-- if mouse moves off of enemy before mouseup (or enemy moves away from mouse)
			-- if mouse moves more than a certain distance between mousedown and mouseup
			-- don't target enemy even if mouse moves back (maybe not feasible to implement)
			
		
		if(self.player)then
			local globalx,globaly
			--print("nameplates:",#self.environment.nameplates)
			if(mousepressed)then
				local nameplates={unpack(self.environment.nameplates)}
				table.sort(nameplates,function(a,b)return a.zsort>b.zsort end)
				globalx,globaly=GetCursorPosition()
				local foundmob=false
				for i=1,#nameplates do					
					local nameplate=nameplates[i]
					if(nameplate:IsUnderMouse(globalx,globaly))then						
						self.potentialclicktarget=nameplate
						self.potentialclicktargetcoordinates={x=globalx,y=globaly}
						foundmob=true
						break
					end
				end
				if(not foundmob)then
					local mobclickzones={unpack(self.environment.mobclickzones)}
					table.sort(mobclickzones,function(a,b)
						--print(a.mob.nameplate.zsort,b.mob.nameplate.zsort)
						return a.zsort>b.zsort
					end)
					for i=1,#mobclickzones do
						local mobclickzone=mobclickzones[i]
						--local nameplate=mobclickzone.mob.nameplate
						if(mobclickzone:IsUnderMouse(globalx,globaly))then
							self.potentialclicktarget=mobclickzone
							self.potentialclicktargetcoordinates={x=globalx,y=globaly}
							foundmob=true
							break
						end
					end
				end
			end
			
			if(self.potentialclicktarget)then 
				if(not globalx)then globalx,globaly=GetCursorPosition() end
				if(not self.potentialclicktarget:IsUnderMouse(globalx,globaly))then
					self.potentialclicktarget=nil
				end
				if(keys.lmouse.current and keys.rmouse.current)then
					self.potentialclicktarget=nil
				end
			end
			if(self.potentialclicktarget)then 
				local distx=globalx-self.potentialclicktargetcoordinates.x
				local disty=globaly-self.potentialclicktargetcoordinates.y
				local distsqr=distx*distx+disty*disty
				--TODO: does mouse position scale properly with screen size?
				--print(globalx,globaly)
				if(distsqr>4*4)then
					self.potentialclicktarget=nil
				end
			end			
			if(self.potentialclicktarget)then 
				if(mousereleased)then
					local button=1;	if(keys.rmouse.released)then button=2 end
					self.potentialclicktarget.mob:OnClick(self.player,self.environment,button)
					self.potentialclicktarget=nil				
				end						
			end
			
			
			
		end
		
		
		---------- JUMP KEY -------------------------------------
		if(self.player)then
			if(keys.jump.pressed)then
				if(not self.player:IsInMidair())then
					if(#self.player.combatmodule.auras.forcedmovement==0)then
						if(self.player:IsIncapacitated()==false)then
							--TODO: move to AI?
							self.player.velocity.z=self.player.jumpvelocity.z
							self.player.animationmodule:PlayAnimation(XPRACTICE.AnimationList.JumpStart)
							--self.player.animationmodule:PlayAnimation(XPRACTICE.AnimationList.JumpLandRun)
						end
					end
				end
			end
		end
		
		
		---------- TOGGLE RUN/WALK KEY -------------------------
		if(self.player)then
			if(keys.togglerunwalk.pressed)then
				self.player.walking=not self.player.walking
			end
		end
		
		
		---------- ESC KEY -------------------------------------
		if(self.player)then
			if(keys.esc.pressed)then
				--TODO: move to AI?
				self.player:SetTargetMob(nil)
				self.environment:SelectMob(nil)
			end
		
		end
	
		
		
		
		--------- MIDDLE MOUSE BUTTON --------------------------
		-- TODO: move to spellcasting block
		if(keys.mmouse.pressed)then
			if(self.player:IsIncapacitated()==false)then
				local bossdebugbutton=nil
				if(self.player.scenario)then
					bossdebugbutton=self.player.scenario.mmbspellbutton					
				end
				if(bossdebugbutton)then
					bossdebugbutton:BossButtonClick()
				else
					local spell_roll=self.player.combatmodule.spellbook.roll
					local queuepointer=spell_roll:NewQueue()
					queuepointer.castercombat=self.player.combatmodule
					local errorcode=self.player.combatmodule:TryQueue(queuepointer)
				end			
			end
		end		
		
		
		
	end
	
	
	
		
	function class:GetCharacterMovementInputUnitVector()
		-- this function assumes the camera is facing "right" (angle 0 radians)
		local environment_gameplay=self.environment.game.environment_gameplay		
		local vectorx,vectory=0,0
		local fwdvector=false
		local keys=self.environment.game.keys

				
		if(keys.leftA.current or (keys.turnQ.current and keys.rmouse.current))then		vectory=vectory+1		end		
		if(keys.rightD.current or (keys.turnE.current and keys.rmouse.current))then	vectory=vectory-1		end	
		if(keys.downS.current)then			vectorx=vectorx-1		end	
		if(keys.upW.current)then			fwdvector=true		end
		----TODO: figure out what we want to do with middle mouse button (hint: we want to dodgeroll)
		--if(self.environment.game.keys.mmouse.current)then			fwdvector=true		end
		if(self.environment.game.keys.lmouse.current and self.environment.game.keys.rmouse.current)then			fwdvector=true		end	--LMB+RMB
		if(fwdvector)then
			vectorx=vectorx+1
		end		
		return vectorx,vectory				
	end			
end

-- YOU ARE LOOKING AT THE playerCONTROLLER CLASS.
-- playerCHARACTER IS FURTHER UP.