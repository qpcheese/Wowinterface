do
	local super=XPRACTICE.Scenario
	XPRACTICE.VOIDRITUAL.Scenario=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.VOIDRITUAL.Scenario
	
	XPRACTICE.VOIDRITUAL.PauseButtonWarning=false
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.buttonphase=1	--1: group/direction buttons
							--2: go button
							--3: no buttons
							--4: pause button
		self.playergroup=0
		self.orbmovement=0
		self.useguidelines=0
		self.useghosts=false 
		self.xaneshstandstilltimer=0
		self.soakstatus=0	--0: nothing to soak yet
							--1: unsuccessful soak
							--2: successful soak
		self.paused=false
	end

	function class:Populate()
		super.Populate(self)
		
		local scenario=self
		local gamemenu=XPRACTICE.GameMenu.new()
		gamemenu:Setup(self.game.environment_gameplay,self.game.SCREEN_WIDTH/2-180/2,self.game.SCREEN_HEIGHT/2-270/2)
		self.gamemenu=gamemenu		
		
		self.obelisks={}
		self.guidelines=nil
		self.player=nil;self.xanesh=nil;self.goalportal=nil
		self.voidwokestates={}		
		self.ghosts={}
		self:ClearGhostPositions()
		self.portal1position={x=0,y=0,z=0}
		self.portal2position={x=0,y=0,z=0}
		self.buttongroup1={}	-- Mythic formation
		self.buttongroup2={}	-- Orb direction
		self.buttongroup3={}	-- Ready-go
		self.buttongroup4={}	-- Pause
		self.buttongroup5={}	-- Guidelines
		self.buttongroup6={}	-- Ghosts
		
		local scenario=self
		local button
		--for i=1,5 do
		for i=1,3 do
			button=XPRACTICE.Button.new()
			button:Setup(self.game.environment_gameplay)
			--button.position={x=50+(i-1)*60,y=50,z=0}
			button.position={x=90+(i-1)*60,y=50,z=0}
			button:SetSize(50,50)
			button:SetText(tostring(i))
			button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
					if(down)then 
						scenario.playergroup=i
						XPRACTICE.VOIDRITUAL.Layout.SetObelisks(scenario,i)
						self.xaneshstandstilltimer=0
						scenario:DeselectButtons(scenario.buttongroup1)
						self.owner.owner:Select(true)
					end
				end)
			tinsert(self.buttongroup1,button)
		end
		local label
		label=XPRACTICE.Label.new()
		label:Setup(self.game.environment_gameplay)
		label.position={x=50,y=100,z=0}
		label:SetSize(250,50)
		label:SetText("Which group are you in?")
		tinsert(self.buttongroup1,label)
		
		--local BUTTONGROUP2XOFFSET=475
		local BUTTONGROUP2XOFFSET=425
		button=XPRACTICE.Button.new()
		button:Setup(self.game.environment_gameplay)
		button.position={x=0+BUTTONGROUP2XOFFSET,y=45,z=0}
		button:SetSize(100,60)
		button:SetText("Clockwise")
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(down)then 
					scenario.orbmovement=1
					scenario:DeselectButtons(scenario.buttongroup2)
					self.owner.owner:Select(true)
				end
			end)
		tinsert(self.buttongroup2,button)
		button=XPRACTICE.Button.new()
		button:Setup(self.game.environment_gameplay)
		button.position={x=110+BUTTONGROUP2XOFFSET,y=45,z=0}
		button:SetSize(100,60)
		button:SetText("Counter-clockwise")
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(down)then 
					scenario.orbmovement=2
					scenario:DeselectButtons(scenario.buttongroup2)
					self.owner.owner:Select(true)
				end
			end)
		tinsert(self.buttongroup2,button)
		button=XPRACTICE.Button.new()
		button:Setup(self.game.environment_gameplay)
		button.position={x=220+BUTTONGROUP2XOFFSET,y=45,z=0}
		button:SetSize(100,60)
		button:SetText("Random")
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(down)then 
					scenario.orbmovement=3
					scenario:DeselectButtons(scenario.buttongroup2)
					self.owner.owner:Select(true)
				end
			end)
		tinsert(self.buttongroup2,button)		
		label=XPRACTICE.Label.new()
		label:Setup(self.game.environment_gameplay)
		label.position={x=30+BUTTONGROUP2XOFFSET,y=100,z=0}
		label:SetSize(250,50)
		label:SetText("Which way is the orb moving?")
		tinsert(self.buttongroup2,label)
		
		
		--local BUTTONGROUP3XOFFSET=950
		local BUTTONGROUP3XOFFSET=1075
		button=XPRACTICE.Button.new()
		button:Setup(self.game.environment_gameplay)
		button.position={x=BUTTONGROUP3XOFFSET,y=50,z=0}
		button:SetSize(50,50)
		button:SetText("Go!")
		button:SetLockedStartingAlpha(0.0)
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(down)then 
					scenario:SpawnVoidRitualSoaks()
					scenario.buttonphase=3
				end
			end)
		tinsert(self.buttongroup3,button)
		label=XPRACTICE.Label.new()
		label:Setup(self.game.environment_gameplay)
		label.position={x=BUTTONGROUP3XOFFSET-99,y=100,z=0}
		label:SetSize(250,50)
		label:SetText("Ready?")
		tinsert(self.buttongroup3,label)		
		
		local BUTTONGROUP4XOFFSET=590
		button=XPRACTICE.Button.new()
		button:Setup(self.game.environment_gameplay)
		button.position={x=BUTTONGROUP4XOFFSET,y=45,z=0}
		button:SetSize(100,60)
		button:SetText("Pause")
		button.paused=false
		button:SetLockedStartingAlpha(0.0)
		self.pausebutton=button
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(down)then 
					scenario.paused=not scenario.paused
					if(scenario.paused)then
						scenario.pausebutton:SetText("Paused")
						scenario.pausebutton:Select(true)						
					else
						scenario.pausebutton:SetText("Pause")
						scenario.pausebutton:Select(false)
					end
				end
			end)
		tinsert(self.buttongroup4,button)
		
		
		local guidelines=XPRACTICE.VOIDRITUAL.Guidelines1.new()
		guidelines:Setup(self.game.environment_gameplay)
		guidelines.position={x=500,y=200,z=0}
		self.guidelines1=guidelines
		
		local guidelines=XPRACTICE.VOIDRITUAL.Guidelines2.new()
		guidelines:Setup(self.game.environment_gameplay)
		guidelines.position={x=500,y=200,z=0}
		self.guidelines2=guidelines
		
		
		--local BUTTONGROUP3XOFFSET=950
		local BUTTONGROUP5XOFFSET=825
		button=XPRACTICE.Button.new()
		button:Setup(self.game.environment_gameplay)
		button.position={x=BUTTONGROUP5XOFFSET,y=50,z=0}
		button:SetSize(50,50)
		button:SetText("OFF")
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(down)then 
					scenario.useguidelines=0
					scenario:DeselectButtons(scenario.buttongroup5)
					--self.owner.owner:Select(true)
					scenario.guidelines1.displayobject.drawable:SetAlpha(0)
					scenario.guidelines2.displayobject.drawable:SetAlpha(0)
				end
			end)
		tinsert(self.buttongroup5,button)
		button=XPRACTICE.Button.new()
		button:Setup(self.game.environment_gameplay)
		button.position={x=BUTTONGROUP5XOFFSET+60,y=50,z=0}
		button:SetSize(50,50)
		button:SetText("1")
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(down)then 
					scenario.useguidelines=1
					scenario:DeselectButtons(scenario.buttongroup5)
					self.owner.owner:Select(true)
					scenario.guidelines1.displayobject.drawable:SetAlpha(1)
					scenario.guidelines2.displayobject.drawable:SetAlpha(0)
				end
			end)
		tinsert(self.buttongroup5,button)	
		button=XPRACTICE.Button.new()		
		button:Setup(self.game.environment_gameplay)
		button.position={x=BUTTONGROUP5XOFFSET+120,y=50,z=0}
		button:SetSize(50,50)
		button:SetText("2")
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(down)then 
					scenario.useguidelines=2
					scenario:DeselectButtons(scenario.buttongroup5)
					self.owner.owner:Select(true)					
					scenario.guidelines1.displayobject.drawable:SetAlpha(0)
					scenario.guidelines2.displayobject.drawable:SetAlpha(1)
				end
			end)
		tinsert(self.buttongroup5,button)				
		label=XPRACTICE.Label.new()
		label:Setup(self.game.environment_gameplay)
		label.position={x=BUTTONGROUP5XOFFSET-50,y=100,z=0}
		label:SetSize(250,50)
		label:SetText("Use guide lines?")
		tinsert(self.buttongroup5,label)			
		
		
				
		local BUTTONGROUP6XOFFSET=50
		button=XPRACTICE.Button.new()
		button:Setup(self.game.environment_gameplay)
		button.position={x=BUTTONGROUP6XOFFSET,y=215,z=0}
		button:SetSize(100,60)
		button:SetText("Ghosts OFF")
		button.paused=false
		self.ghostsbutton=button
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(down)then 
					scenario.useghosts=not scenario.useghosts
					if(scenario.useghosts)then
						scenario.ghostsbutton:SetText("Ghosts ON")
						scenario.ghostsbutton:Select(true)						
						scenario.ghostsexplanationlabel:SetText("Player ghosts have been enabled. Moving close to a ghost will temporarily disable it, allowing you to kick the orb yourself."
						.."\nDISCLAIMER: ghosts are not 100% reliable and may make mistakes depending on your framerate.")
					else
						scenario.ghostsbutton:SetText("Ghosts OFF")
						scenario.ghostsbutton:Select(false)
						scenario.ghostsexplanationlabel:SetText("")
					end
				end
			end)
		tinsert(self.buttongroup6,button)
		label=XPRACTICE.Label.new()
		label:Setup(self.game.environment_gameplay)
		label.position={x=BUTTONGROUP6XOFFSET-75,y=270,z=0}
		label:SetSize(250,50)
		label:SetText("Enable ghosts?")
		tinsert(self.buttongroup6,label)			
		label=XPRACTICE.Label.new()
		label:Setup(self.game.environment_gameplay)
		self.ghostsexplanationlabel=label
		label.position={x=150,y=200,z=0}
		label:SetSize(1000,100)
		label:SetText("")
		label.displayobject.drawable:SetAlpha(0)
		tinsert(self.buttongroup6,label)		
		
		self:EnableButtons(self.buttongroup3,false)
		self:EnableButtons(self.buttongroup4,false)
		
		local mob,obj
		local player
		
		--mob=XPRACTICE.Mob.new()
		player=XPRACTICE.PlayerCharacter.new()
		player:Setup(self.game.environment_gameplay)
		player.displayobject.drawable:SetSheathed(false)
		player.position={x=0,y=-20,z=0}
		player.orientation.yaw=math.pi;player.orientation_displayed.yaw=math.pi
		player.scenario=self
		self.player=player

		-- local mobclickzone=XPRACTICE.MobClickZone.new()
		-- mobclickzone:Setup(self.game.environment_gameplay,mob)		
		-- local nameplate=XPRACTICE.Nameplate.new()
		-- nameplate:Setup(self.game.environment_gameplay,mob)		

		
		self.game.environment_gameplay.cameramanager.camera.focus=player
		self.game.environment_gameplay.cameramanager.camera.orientation.yaw=math.pi
		self.game.environment_gameplay.cameramanager.camera.orientation.pitch=math.pi*0.15
		self.game.environment_gameplay.cameramanager.camera.cdist=60
		
		local controller=XPRACTICE.PlayerController.new()
		controller:Setup(self.game.environment_gameplay,player,self.game.environment_gameplay.cameramanager.camera)


		
		
		
		for i=1,0 do
			mob=XPRACTICE.Mob.new()
			mob:Setup(self.game.environment_gameplay)		
			mob.position.x=0;mob.position.y=i*2
			if(not XPRACTICE.PTR) then mob.displayobject.drawable:SetModelByFileID(1) end
			mob.displayobject.drawable:SetModelByCreatureDisplayID(81000-1+i)
		end

			

		
		-- mob=XPRACTICE.Mob.new()
		-- mob:Setup(self.game.environment_gameplay)		
		-- --if(not XPRACTICE.PTR) then mob.displayobject.drawable:SetModelByFileID(1) end
		-- mob.displayobject.drawable:SetModelByFileID(1829551)	--taloc elevator
		
--print("TOC:",XPRACTICE.TOCVersion)
		-- mob=XPRACTICE.Mob.new()		
		-- mob:Setup(self.game.environment_gameplay)		
		-- mob.position={x=-21,y=-21,z=0}
		-- mob.scale=2
		-- mob.displayobject.drawable:SetModelByCreatureDisplayID(93159)	-- Xanesh
		-- --mob.displayobject.drawable:SetModelByFileID(456043)	-- raid_ui_fx_yellow
		-- --mob.displayobject.drawable:SetModelByFileID(943408)	-- target_arcane_state.m2

				
				
		obj=XPRACTICE.WoWObject.new()
		obj:Setup(self.game.environment_gameplay)		
		obj.displayobject.drawable:SetModelByFileID(1591934)	--7du_tombofsargeras_councilfloor01
		obj.scale=2
		obj.position={x=0,y=0,z=-.5}

		obj=XPRACTICE.WoWObject.new()
		obj:Setup(self.game.environment_gameplay)		
		--if(not XPRACTICE.PTR) then obj.displayobject.drawable:SetModelByFileID(1) end
		obj.displayobject.drawable:SetModelByFileID(3133407)	--8fx_headcultist_energywall_wrap
		obj.position={x=0,y=0,z=2}
		--obj.scale=1		
		obj.scale=.9
		
		
		----- WORLD MARKERS ------------------------------------------------
		obj=XPRACTICE.WoWObject.new();obj:Setup(self.game.environment_gameplay)		
		obj.displayobject.drawable:SetModelByFileID(456041)	-- raid_ui_fx_red
		obj.position={x=-18,y=-18,z=0}
		obj.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
		obj.projectilespawncustomduration=2.0;obj.projectileloopcustomduration=nil;obj.projectiledespawncustomduration=2.0
	
		obj=XPRACTICE.WoWObject.new();obj:Setup(self.game.environment_gameplay)		
		obj.displayobject.drawable:SetModelByFileID(456039)	-- raid_ui_fx_purple
		obj.position={x=0,y=-16,z=0}
		obj.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
		obj.projectilespawncustomduration=2.0;obj.projectileloopcustomduration=nil;obj.projectiledespawncustomduration=2.0

		obj=XPRACTICE.WoWObject.new();obj:Setup(self.game.environment_gameplay)		
		obj.displayobject.drawable:SetModelByFileID(456037)	-- raid_ui_fx_green
		obj.position={x=21,y=-21,z=0}
		obj.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
		obj.projectilespawncustomduration=2.0;obj.projectileloopcustomduration=nil;obj.projectiledespawncustomduration=2.0

		obj=XPRACTICE.WoWObject.new();obj:Setup(self.game.environment_gameplay)		
		obj.displayobject.drawable:SetModelByFileID(456043)	-- raid_ui_fx_yellow
		obj.position={x=0,y=17,z=0}
		obj.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
		obj.projectilespawncustomduration=2.0;obj.projectileloopcustomduration=nil;obj.projectiledespawncustomduration=2.0

		obj=XPRACTICE.WoWObject.new();obj:Setup(self.game.environment_gameplay)		
		obj.displayobject.drawable:SetModelByFileID(456035)	-- raid_ui_fx_cyan
		obj.position={x=21,y=21,z=0}
		obj.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
		obj.projectilespawncustomduration=2.0;obj.projectileloopcustomduration=nil;obj.projectiledespawncustomduration=2.0
			
		
		------------------------------------------------------------------------------------------------
		
		local xanesh
		xanesh=XPRACTICE.Mob.new()		
		xanesh:Setup(self.game.environment_gameplay)		
		xanesh.position={x=-19,y=-18,z=0}
		xanesh.orientation.yaw=math.pi/4;xanesh.orientation_displayed.yaw=math.pi/4
		xanesh.scale=2
		xanesh.displayobject.drawable:SetModelByCreatureDisplayID(93159)	-- Xanesh
		xanesh.animationmodule:PlayAnimation(XPRACTICE.AnimationList.PriReadySpellCast)		
		xanesh.basemovespeed=14
		self.xanesh=xanesh
		local nameplate=XPRACTICE.Nameplate.new()
		nameplate:Setup(self.game.environment_gameplay,xanesh)
		nameplate:SetText("Dark Inquisitor Xanesh")
		local mobclickzone=XPRACTICE.MobClickZone.new()
		mobclickzone:Setup(self.game.environment_gameplay,xanesh)
		
		
		--local poly=XPRACTICE.Polygon.new()
		--poly:Setup(self.game.environment_gameplay)
		
		obj=XPRACTICE.WoWObject.new()
		obj:Setup(self.game.environment_gameplay)		
		obj.displayobject.drawable:SetModelByCreatureDisplayID(86567)	--Azshara
		obj.position={x=0,y=0,z=0}
		obj.orientation.yaw=-math.pi*.75;obj.orientation_displayed.yaw=-math.pi*.75
		obj.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Stun)
		obj=XPRACTICE.WoWObject.new()
		obj:Setup(self.game.environment_gameplay)		
		obj.displayobject.drawable:SetModelByFileID(3177003)	--8fx_headcultist_voidbarrier_state		
		obj.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawn500ms)

		
		
		
		-------- ORB IMPACT -----------------------------------------------
		-- obj=XPRACTICE.WoWObject.new()
		-- obj:Setup(self.game.environment_gameplay)		
		-- obj.displayobject.drawable:SetModelByFileID(3152608)	--8fx_headcultist_voidwoke_orbimpact	
		-- obj.scale=2.5
		-- obj.position={x=0,y=-14,z=4}			
		-- --obj.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileLoop)
		----------------------------------------------------------------------------------------------
		


		
		
		

		-- obj=XPRACTICE.WoWObject.new()
		-- obj:Setup(self.game.environment_gameplay)		
		-- --obj.displayobject.drawable:SetModelByFileID(392515)	--shadow_vortex_hole
		-- --obj.displayobject.drawable:SetModelByFileID(3052196)	--8fx_rl_falloff_state_void
		-- --obj.displayobject.drawable:SetModelByFileID(2030520)	--8fx_discboss_voidcorruption_pulse_impact
		-- --obj.displayobject.drawable:SetModelByFileID(2394659)	--8fx_rl_meteor_state_void
		-- --obj.displayobject.drawable:SetModelByFileID(3067242)	--8fx_nzothraid_raden_drawvoid_origin_decal
		-- obj.displayobject.drawable:SetModelByFileID(2575490)	--
		-- obj.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileLoop)	
		-- obj.position={x=0,y=15,z=0}	
		-- obj.scale=1
		


		-- obj=XPRACTICE.WoWObject.new()
		-- obj:Setup(self.game.environment_gameplay)		
		-- --obj.displayobject.drawable:SetModelByFileID(3009177)	--8fx_herald_portalmadness_stateground
		-- obj.displayobject.drawable:SetModelByFileID(1907392) --test
		-- obj.scale=1
		-- obj.position={x=0,y=-14,z=0}	
		
		
		
		
		--mob.displayobject.drawable:SetModelByFileID(456043)	-- raid_ui_fx_yellow
		
		--mob.displayobject.drawable:AttachToMount(TEMP_PLAYER,91,0)	-- doesn't work  :(
		
		
		
		-- mob=XPRACTICE.PlayerCharacter.new()
		-- mob:Setup(self.game.environment_gameplay)		
		-- mob.position.x=4
		
	end
	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		if(self.xanesh)then
			if(not self.xanesh.ai.targetposition)then
				self.xaneshstandstilltimer=self.xaneshstandstilltimer+elapsed			
			else
				self.xaneshstandstilltimer=0
			end
			if(self.xaneshstandstilltimer>=0.5)then
				if(self.buttonphase==1 and self.playergroup~=0 and self.orbmovement~=0)then self.buttonphase=2 end		
			else
				if(self.buttonphase==2)then self.buttonphase=1 end
			end
			
			if(self.buttonphase==1)then
				self:EnableButtons(self.buttongroup1,true)
				self:EnableButtons(self.buttongroup2,true)
				self:EnableButtons(self.buttongroup3,false)
				self:EnableButtons(self.buttongroup4,false)
				self:EnableButtons(self.buttongroup5,true)
				self:EnableButtons(self.buttongroup6,true)
			elseif(self.buttonphase==2)then
				self:EnableButtons(self.buttongroup1,true)
				self:EnableButtons(self.buttongroup2,true)
				self:EnableButtons(self.buttongroup3,true)
				self:EnableButtons(self.buttongroup4,false)
				self:EnableButtons(self.buttongroup5,true)
				self:EnableButtons(self.buttongroup6,true)
			elseif(self.buttonphase==3)then
				self:EnableButtons(self.buttongroup1,false)
				self:EnableButtons(self.buttongroup2,false)
				self:EnableButtons(self.buttongroup3,false)
				self:EnableButtons(self.buttongroup4,false)
				self:EnableButtons(self.buttongroup5,false)
				self:EnableButtons(self.buttongroup6,false)
			elseif(self.buttonphase==4)then
				self:EnableButtons(self.buttongroup1,false)
				self:EnableButtons(self.buttongroup2,false)
				self:EnableButtons(self.buttongroup3,false)
				self:EnableButtons(self.buttongroup4,true)			
				self:EnableButtons(self.buttongroup5,false)
				self:EnableButtons(self.buttongroup6,false)
			end			
		end
		local obj
		if(self.soakstatus==1)then
			obj=XPRACTICE.VOIDRITUAL.GenericVoidNovaHigh.new()
			obj:Setup(self.game.environment_gameplay)		
			obj.position={x=self.xanesh.position.x,y=self.xanesh.position.y,z=0}
			self.soakstatus=0
			XPRACTICE_RaidBossEmote("Try again...",2.0,false)		
			self:DeleteGhosts()
			self.buttonphase=1
		elseif(self.soakstatus==2)then
			local startportalposition=self.portal1position
			local goalportalposition=self.portal2position
			local orbmovement=self.orbmovement
			if(orbmovement==3)then orbmovement=math.random(1,2) end
			if(orbmovement==1)then			
				startportalposition=self.portal1position
				goalportalposition=self.portal2position
			else
				startportalposition=self.portal2position
				goalportalposition=self.portal1position	
			end						
			obj=XPRACTICE.VOIDRITUAL.VoidRitualPortalProjectile.new()
			obj:Setup(self.game.environment_gameplay)
			obj.scenario=self
			obj.position={x=self.xanesh.position.x,y=self.xanesh.position.y,z=0}
			obj.portalclass=XPRACTICE.VOIDRITUAL.StartPortal
			obj.destination={x=startportalposition.x,y=startportalposition.y,z=0}
			obj.orientation_displayed.yaw=math.atan2(obj.destination.y-obj.position.y,obj.destination.x-obj.position.x)						
			obj=XPRACTICE.VOIDRITUAL.VoidRitualPortalProjectile.new()
			obj:Setup(self.game.environment_gameplay)
			obj.scenario=self
			obj.position={x=self.xanesh.position.x,y=self.xanesh.position.y,z=0}			
			obj.portalclass=XPRACTICE.VOIDRITUAL.GoalPortal
			obj.destination={x=goalportalposition.x,y=goalportalposition.y,z=4}
			obj.orientation_displayed.yaw=math.atan2(obj.destination.y-obj.position.y,obj.destination.x-obj.position.x)			
			self.soakstatus=0
			--self.buttonphase=4
			obj=XPRACTICE.VOIDRITUAL.VoidwokeState.new()
			obj:Setup(self.game.environment_gameplay)				
			obj.player=self.player
			tinsert(self.voidwokestates,obj)
			for i=1,#self.ghosts do
				local ghost=self.ghosts[i]
				obj=XPRACTICE.VOIDRITUAL.VoidwokeState.new()
				obj:Setup(self.game.environment_gameplay)				
				obj.player=ghost
				tinsert(self.voidwokestates,obj)
				if(orbmovement==1)then
					if(self.ghostpositionsCW[i])then						
						ghost.ai.targetposition={x=self.ghostpositionsCW[i].x,y=self.ghostpositionsCW[i].y,z=0}
						ghost.orientation.yaw=self.ghostorientationsCW[i].yaw
					end
				elseif(orbmovement==2)then
					if(self.ghostpositionsCCW[i])then
						ghost.ai.targetposition={x=self.ghostpositionsCCW[i].x,y=self.ghostpositionsCCW[i].y,z=0}
						ghost.orientation.yaw=self.ghostorientationsCCW[i].yaw
					end
				end
			end
		end
		
	end

	function class:EnableButtons(buttongroup,toggle)
		for i=1,#buttongroup do
			local button=buttongroup[i]
			if(toggle)then
				button.displayobject.drawable:SetAlpha(1) -- for labels
				button.alpha=1
				button:SetLockedStartingAlpha(1.0)	-- for buttons
			else
				button.displayobject.drawable:SetAlpha(0)
				button.alpha=0
				button:SetLockedStartingAlpha(0.0)
			end
			button:EnableMouse(toggle)
		end
	end
	
	function class:DeselectButtons(buttongroup)
		for i=1,#buttongroup do
			local button=buttongroup[i]
			button:Select(false)
		end
	end
	
	function class:DeleteGoalPortal()
		if(self.goalportal)then
			self.goalportal:FadeOut()
		end
		self.goalportal=nil
		for i=1,#self.voidwokestates do
			local voidwokestate=self.voidwokestates[i]
			voidwokestate.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
		end
		self.voidwokestates={}
	end
	
	function class:ClearGhostPositions()
		self.ghostpositionsCW={}
		self.ghostorientationsCW={}
		self.ghostpositionsCCW={}
		self.ghostorientationsCCW={}
	end
	
	function class:DeleteGhosts()
		for i=1,#self.ghosts do
			local ghost=self.ghosts[i]
			ghost.expirytime=self.game.environment_gameplay.localtime+2.0
			ghost.fadestarttime=self.game.environment_gameplay.localtime
		end
		self.ghosts={}
	end
	

	function class:SpawnVoidRitualSoaks()
		self.paused=false
		self.pausebutton:Select(false)
		self.pausebutton:SetText("Pause")
		local obj
		for i=1,3 do
			obj=XPRACTICE.VOIDRITUAL.VoidRitualSoak.new()
			obj:Setup(self.game.environment_gameplay)		
			local angle=self.xanesh.orientation_displayed.yaw
			local x=self.xanesh.position.x+6*math.cos(math.pi/2*i+angle)
			local y=self.xanesh.position.y+6*math.sin(math.pi/2*i+angle)
			obj.position={x=x,y=y,z=0}	
			obj.scenario=self
			if(self.useghosts)then
				local ghost=XPRACTICE.VOIDRITUAL.PlayerGhost.new()
				ghost:Setup(self.game.environment_gameplay)
				ghost.position={x=x,y=y,z=0}
				ghost.orientation.yaw=math.pi/2*i+angle+math.pi
				ghost.orientation_displayed.yaw=ghost.orientation.yaw
				ghost.target_orientation_displayed.yaw=ghost.orientation.yaw				
				ghost.scenario=self
				tinsert(self.ghosts,ghost)
			end			
		end
	end

	function class:OnEscapeKey()
		if(self.gamemenu)then
			if(self.gamemenu.shown)then
				self.gamemenu:Hide()
			else
				local ok=true
				if(self.player)then					
					if(self.player.combatmodule.targetmob)then
						ok=false
					end
				end
				if(ok)then
					self.gamemenu:Show()
				end
			end
		end
	end	

	XPRACTICE.ScenarioList.RegisterScenario(XPRACTICE.VOIDRITUAL.Scenario,"Void Ritual","(Xanesh)")
	XPRACTICE.ScenarioList.RegisterScenario(XPRACTICE.VOIDRITUAL.Scenario,"8.3","Ny'alotha, the Waking City","SEPARATOR")
end