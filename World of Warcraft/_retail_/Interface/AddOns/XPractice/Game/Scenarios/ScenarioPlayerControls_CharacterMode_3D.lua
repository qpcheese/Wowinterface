
do
	local super=XPRACTICE.ScenarioPlayerControls
	XPRACTICE.ScenarioPlayerControls_CharacterMode_3D = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ScenarioPlayerControls_CharacterMode_3D

	--TODO: camera and scenario have their own GetPlayerInput.  should we combine camera+scenario playerinput?
	function class:GetPlayerInput(elapsed)
		--print("GetPlayerInput")
		local camera=self.scenario.environment.game.environment_gameplay.cameramanager.camera
		local keys=self.environment.game.keys
		-- don't call super 
		--TODO: might have to call super after we rewrite base ScenarioPlayerControls class
		local mousepressed=false
		local mousecurrent=false
		if(self.environment.game.keys.lmouse.pressed or self.environment.game.keys.rmouse.pressed)then
			--TODO: if both mouse buttons are pressed at the same time, adjust camera angle without waiting for mousemove
			mousepressed=true
		end
		if(self.environment.game.keys.lmouse.current or self.environment.game.keys.rmouse.current)then
			mousecurrent=true
		end
		if(self.environment.game.keys.lmouse.pressed or self.environment.game.keys.rmouse.pressed)then
			-- note that this detects whether EITHER mouse button was released, even if the other is still held down.
			-- to determine check if mousecurrent=false
			mousereleased=true
		end		
		
		if(mousepressed)then
			local globalx,globaly=GetCursorPosition()
			self.camerarotationprevmousex=globalx
			self.camerarotationprevmousey=globaly
			XPRACTICE.CVars:Override("enableMouseSpeed",1)
				-- -- turns out using 0 doesn't work -- camera rotation becomes too granular
			--XPRACTICE.CVars:Override("mouseSpeed",0)
			
			--TODO: first check if mouse sensitivity is enabled and already lower than override!
				-- don't speed the mouse up unwittingly!
			XPRACTICE.CVars:Override("mouseSpeed",XPRACTICE.Config.Camera.MouseSpeed)
		end
		if(mousecurrent)then	
			local globalx,globaly=GetCursorPosition()
			--local speed=0.005*(XPRACTICE.CVars.cvarvalues["cameraYawMoveSpeed"]/180)
			local TEMP_MULTIPLIER=XPRACTICE_SAVEDATA.Config.Camera.CameraSpeed 	--6-7 for windowed, 9-10 for fullscreen
			--TODO: attempt to detect whether mouse sensitivity was already set by player, and calculate multiplier from that
			local speed=0.006*(XPRACTICE.CVars.cvarvalues["cameraYawMoveSpeed"]/180)*TEMP_MULTIPLIER
			local xdelta=0
			local ydelta=0
			if(self.camerarotationprevmousex and self.camerarotationprevmousey)then
				xdelta=(globalx-self.camerarotationprevmousex)
				ydelta=(globaly-self.camerarotationprevmousey)
			end
			camera.cangy=camera.cangy+ -1*xdelta*speed
			camera.cangx=camera.cangx+ydelta*speed
			
			if(camera.cangy<-math.pi) then camera.cangy=camera.cangy+math.pi*2 end
			if(camera.cangy>math.pi) then camera.cangy=camera.cangy-math.pi*2 end				
			
			self.camerarotationprevmousex=globalx
			self.camerarotationprevmousey=globaly
			if(self.environment.game.keys.rmouse.current)then
				local player=self.scenario.controls.player
				--if(player and (xdelta~=0 or ydelta~=0))then
				--TODO: look for "self.player" instead (which is apparently never nil)
				if(player)then
					if((xdelta~=0 or ydelta~=0) or mousepressed)then
						-- local aura
						-- local facing_telegraphs=player.combat.auramodule.facing_telegraph
						-- if(#facing_telegraphs>0)then
							-- aura=facing_telegraphs[1]
						-- else
							-- aura=player.combat:ApplyAuraByClass(XPRACTICE.Aura_Facing_CameraTest,player.combat)					
						-- end
						--aura.customcamerafacing=camera.cangy
						player.currentfacing_3D=camera.cangy
						player.targetfacing_3D=camera.cangy
						--print("cangy:",camera.cangy)
					end
					player.targetfacing_3D_button=1
				end
			end

			local MIN_VERTICAL_ANGLE=-math.pi*0.45	--TODO: move to camera
			local MAX_VERTICAL_ANGLE=math.pi*0.0
			if(camera.cangx<MIN_VERTICAL_ANGLE)then camera.cangx=MIN_VERTICAL_ANGLE end
			if(camera.cangx>MAX_VERTICAL_ANGLE)then camera.cangx=MAX_VERTICAL_ANGLE end			
		else
			--else not mousecurrent
			--TODO: look for "self.player" instead (which is apparently never nil)
			local player=self.scenario.controls.player
			if(player)then
				player.targetfacing_3D_button=0
			end
		end
		if(mousereleased and not mousecurrent)then
			--TODO: does it matter which order we do this in?  does it need to be reverse order instead?
			XPRACTICE.CVars:Restore("enableMouseSpeed")
			XPRACTICE.CVars:Restore("mouseSpeed")			
		end
		
		local delta=keys.wmouse.pressed
		if(delta)then		
			camera.cdist=camera.cdist-delta
			local MIN_DIST=5	--TODO: move to camera
			local MAX_DIST=40	
			if(camera.cdist<MIN_DIST)then camera.cdist=MIN_DIST end
			if(camera.cdist>MAX_DIST)then camera.cdist=MAX_DIST end
		end

		
		local vectorx,vectory			
		--TODO: involuntarymovement shouldn't be in PlayerControls class
		vectorx,vectory=self:GetCharacterMovementInputUnitVector()
		
		self.player.attemptedmovementunitvectorx=vectorx
		self.player.attemptedmovementunitvectory=vectory
		self.player.backpedal=false		
		if(vectorx<0)then self.player.backpedal=true end
		-- arbitrary; we want this to be greater than max movement speed at least
		-- (it doesn't affect movement speed, only the AI's destination)
		local CHARACTERMODE_MOVE_VECTOR_LENGTH=1000
		vectorx=vectorx*CHARACTERMODE_MOVE_VECTOR_LENGTH
		vectory=vectory*CHARACTERMODE_MOVE_VECTOR_LENGTH
		--TODO: move targetlocation to AI? (should at least be in Mobile if it isn't already)
		if(vectorx==0 and vectory==0)then
			self.player.ai.targetlocation=nil
		else
			self.player.ai.targetlocation={}			
			local facing=self.player.currentfacing_3D
			
			vectorx,vectory=XPRACTICE.Transform_Rotate2D(vectorx,vectory,facing,0,0)
			self.player.ai.targetlocation.x=self.player.x+vectorx
			self.player.ai.targetlocation.y=self.player.y+vectory

			
			--print("facing:",self.player.currentfacing_3D,vectorx,vectory)
			--print("Playertarget:",self.player.ai.targetlocation.x,self.player.ai.targetlocation.y)
			--print("!0",self.player.ai.targetlocation.x,self.player.ai.targetlocation.y)
		end		
		
		
		if(self.environment.game.keys.lmouse.current and self.environment.game.keys.rmouse.current)then
			self.player.targetfacing_3D_button=2
		end
		
	end

	
	
	--TODO: a lot of overlap between 2D and 3D mode; reuse code where possible
	function class:GetCharacterMovementInputUnitVector()
		-- however, THIS function assumes the camera is facing "right" (angle 0 radians)
		local environment_gameplay=self.environment.game.environment_gameplay		
		local vectorx,vectory=0,0
		local fwdvector=false
		if(self.environment.game.keys.leftA.current)then		vectory=vectory+1		end		
		if(self.environment.game.keys.rightD.current)then			vectory=vectory-1		end	
		if(self.environment.game.keys.downS.current)then			vectorx=vectorx-1		end	
		if(self.environment.game.keys.upW.current)then			fwdvector=true		end
		----TODO: figure out what we want to do with middle mouse button
			-- (hint: we want to dodgeroll)
		--if(self.environment.game.keys.mmouse.current)then			fwdvector=true		end
		if(self.environment.game.keys.lmouse.current and self.environment.game.keys.rmouse.current)then			fwdvector=true		end	--LMB+RMB
		if(fwdvector)then
			vectorx=vectorx+1
		end		
		return vectorx,vectory				
	end		
	
	function class:Cleanup()
		super.Cleanup(self)
		XPRACTICE.CVars:Restore("enableMouseSpeed")
		XPRACTICE.CVars:Restore("mouseSpeed")	
	end
end
