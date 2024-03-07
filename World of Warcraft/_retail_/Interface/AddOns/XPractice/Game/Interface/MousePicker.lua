do


	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_MousePicker=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_MousePicker
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Create Mouse Picker)"
			self.icon="interface/icons/inv_pet_mouse.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local mob=spellinstancepointer.castercombat.mob
			local scenario=mob.scenario	
			local picker=XPRACTICE.MousePicker.new()
			picker:Setup(mob.environment,0,0,0)
		end
	end	
	
	
	do
		--local super=XPRACTICE.MultiSolid
		local super=XPRACTICE.WoWObject
		XPRACTICE.MousePicker=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.MousePicker
		
		function class:Setup(environment,x,y,z)
			super.Setup(self,environment,x,y,z)
			self.camera=environment.cameramanager.camera
			self.debugtimer=0
			
			-- a=self:AddActorByClass(XPRACTICE.Solids.Box001,x,y,z,1)
			-- a:SetModelByFileID(2995659)
			self.callback=function(self) end
			self.behavior="GROUND"
			self.attach=nil
			self.hasfocus=false
			self.singleuse=true			
			
			--TODO: decide whether we actually want to tie mousepicker to scenario like this
			local scenario=self.environment.game.scenario
			if(scenario)then
				if(scenario.picker)then scenario.picker:Die();scenario.picker.circle:Die() end
				scenario.picker=self
			end
		end
		function class:CreateAssociatedObjects()
			local circle=XPRACTICE.MousePickerCircle.new()
			circle:Setup(self.environment,self.position.x,self.position.y,self.position.z)			
			circle.picker=self
			self.circle=circle
		end
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(2995659) 	--8fx_rl_personalresponsibility_arrow_blue
--			actor:SetModelByFileID(3507005) 	--target_anima_ardenweald_state_rimonly
		end
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=nil
			self.projectiledespawncustomduration=0.25	
		end
		function class:OnProjectileDespawning()
			--self.circle.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
			self.circle:Die()
		end
		function class:Step(elapsed)
			super.Step(self,elapsed)
			--self.camera.orientation.yaw
			local x1=self.camera.position.x
			local y1=self.camera.position.y
			local z1=self.camera.position.z
			
			
			local yaw=self.camera.orientation.yaw
			local pitch=self.camera.orientation.pitch
			
			--print("p:",pitch,"h:",hypotenuse)
			--print("z:",z1)
			--print("sin:",math.sin(pitch))
			
			local globalx,globaly=GetCursorPosition()
			--TODO: rename vars
			--cursorx,cursory store mouse/window coordinates
			local cursorx,cursory=self.environment:MouseCoordinatesToWindowCoordinates(globalx,globaly)
			
			local localhz,localvt=cursorx/self.environment.game.SCREEN_WIDTH,cursory/self.environment.game.SCREEN_HEIGHT
			local screenratio=self.environment.game.SCREEN_HEIGHT/self.environment.game.SCREEN_WIDTH			
			localhz=(localhz-0.5)
			localvt=(localvt-0.5)
			localvt=localvt*screenratio
			
			local OFFSETMODIFIER=1
			local OFFSETMODIFIER=0
			local x2,y2,z2=XPRACTICE.MatrixMultiplicationRotation3(0,-localhz*OFFSETMODIFIER,localvt*OFFSETMODIFIER,0,pitch,yaw)
			x1=x1+x2;y1=y1+y2;z1=z1+z2
			
			local raypitch,rayyaw
			local ANGLEMODIFIER=.79
			rayyaw=-localhz*ANGLEMODIFIER
			raypitch=-localvt*ANGLEMODIFIER
			local vx,vy,vz
			vz=-math.sin(raypitch)
			local xy=math.cos(raypitch)
			vx=math.cos(rayyaw)*xy
			vy=math.sin(rayyaw)*xy
			--print("yaw:",rayyaw,yaw)
			--print("pitch:",raypitch,pitch)
			vx,vy,vz=XPRACTICE.MatrixMultiplicationRotation3(vx,vy,vz,0,pitch,yaw)
			
			
			-- self.debugtimer=self.debugtimer-elapsed
			-- if(self.debugtimer<=0)then
				-- self.debugtimer=self.debugtimer+0.1
				-- local mpdt=XPRACTICE.MousePickerDebugTracer.new()
				-- mpdt:Setup(self.environment,x1,y1,z1)
				-- mpdt.expirytime=self.environment.localtime+5.0
				-- local SPEED=20
				-- mpdt.velocity.z=vz*SPEED
				-- mpdt.velocity.x=vx*SPEED
				-- mpdt.velocity.y=vy*SPEED				
			-- end
			
			
			-- local hypotenuse=z1/math.sin(raypitch)
			-- if(hypotenuse<1000)then
				
			-- end
			
			if(vz<0)then
				local zdist=-z1/vz
				local destx=x1+vx*zdist
				local desty=y1+vy*zdist
				self.position.x=destx
				self.position.y=desty
				self.position.z=1
				
				self.attach=self:GetTargetInRange()

								
				if(self.attach==nil)then
					self.circle.position.x=destx
					self.circle.position.y=desty
					self.circle.position.z=0.5
				else
					self.circle.position.x=self.attach.position.x
					self.circle.position.y=self.attach.position.y
					self.circle.position.z=0.5
				end				
			end
			
			local keys=self.environment.game.keys
			if(keys.rmouse.pressed)then
				self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
			end
			if(keys.lmouse.pressed)then
				self.hasfocus=true	
				-- this isn't 100% foolproof.  mousepicker has no way to lose focus if we click on another button first
				-- a total fix would require all buttons to inherit a base OnButtonDown event
			end
			if(keys.lmouse.released)then
				if(self.hasfocus)then
					self:callback()
					if(self.singleuse)then
						self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
					end
				end
			end			
		end
		
		function class:GetTargetInRange()
			local nearest=nil
			local attachcandidates={}
			if(self.behavior=="PLAYER")then
				attachcandidates=self.scenario.multiplayer.allplayers
			elseif(self.behavior=="ENEMY")then
				attachcandidates=self.scenario.bosses
			end				
			if(attachcandidates)then			
				local mindistsqr=15*15
				for k,v in pairs(attachcandidates)do
					local distsqr=XPRACTICE.distsqr(self.position.x,self.position.y,v.position.x,v.position.y)
					if(not mindistsqr or distsqr<mindistsqr)then
						mindistsqr=distsqr
						nearest=v
					end
				end			
			end	
			return nearest
		end		
		
	end
	

	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.MousePickerCircle=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.MousePickerCircle
		
		function class:SetActorAppearanceViaOwner(actor)
			--actor:SetModelByFileID(3793517) 	--target_soul_state_rimonly
			actor:SetModelByFileID(3507005) 	--target_anima_ardenweald_state_rimonly
			--actor:SetModelByFileID(2995659) 	--8fx_rl_personalresponsibility_arrow_blue
			self.scale=0.25
		end
		function class:SetDefaultAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			self.projectilespawncustomduration=0.25
			self.projectileloopcustomduration=nil
			self.projectiledespawncustomduration=0.25	
			self.projectiledespawncustomduration=nil
		end		
		--TODO: die if parent picker is dead (can happen if parent doesn't call despawn anim)
	end
	
	
	
	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.MousePickerDebugTracer=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.MousePickerDebugTracer
		
		function class:Setup(environment,x,y,z)
			super.Setup(self,environment,x,y,z)			
		end
		
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3088290) 	--scale_obj_sphere_001gray
			self.alpha=0.25
			self.scale=0.01
		end

	end
	
	
	
	
	
	

	--this one works!  but be very careful about the SIGNUM of x and y or weird things will happen
				-- (we always get confused about which direction +y is in)
	function XPRACTICE.MatrixMultiplicationRotation3(x,y,z,ax,ay,az)
		local x2=x
		local y2=y
		local z2=z

		x2,y2,z2=XPRACTICE.MatrixMultiplication(x2,y2,z2,
											1,0,0,
											0,math.cos(ax),-math.sin(ax),
											0,math.sin(ax),math.cos(ax))
		--print("After AX:",x2,y2,z2)	
		x2,y2,z2=XPRACTICE.MatrixMultiplication(x2,y2,z2,
											math.cos(ay),0,math.sin(ay),
											0,1,0,
											-math.sin(ay),0,math.cos(ay))
		--print("After AY:",x2,y2,z2)
		x2,y2,z2=XPRACTICE.MatrixMultiplication(x2,y2,z2,
											math.cos(az),-math.sin(az),0,
											math.sin(az),math.cos(az),0,
											0,0,1)		
		--print("After AZ:",x2,y2,z2)											
											
		return x2,y2,z2
	end

end