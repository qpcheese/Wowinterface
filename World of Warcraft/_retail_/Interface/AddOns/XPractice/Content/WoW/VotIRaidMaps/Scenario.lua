
do
	local super=XPRACTICE.Scenario
	XPRACTICE.VOTIRAIDMAPS.Scenario=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.VOTIRAIDMAPS.Scenario
	
	--XPRACTICE.VOTIRAIDMAPS.NPCID=180990
	--XPRACTICE.VOTIRAIDMAPS.NPCID=180991
	--XPRACTICE.VOTIRAIDMAPS.NPCID=180992
	XPRACTICE.VOTIRAIDMAPS.NPCID=14030
	

	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		
		self.savedataname="VOTIRAIDMAPS"
		self.npcid=XPRACTICE.VOTIRAIDMAPS.NPCID

		self.gameinprogress=false	--TODO: replace "phaseinprogress" with "gameinprogress" for all the other files too
		self.gameneedsreset=false
		self.currentphase=1
		self.phasecomplete=false

		self.player=nil
		self.startbutton=nil
		self.lastmovetime=0
		
		self.events={}
		self.stopallevents=false
		
		self.allplayers={}	--TODO: maybe get rid of this -- we get it confused with multiplayer.allplayers
		self.allpcs={}
		

		self.tempobjs={}

		self.reportedcollisionlist={}
		
		self.setmmbmode=false
		
		self.bossqueue={}
		self.bossgcd=0
		self.inphasecount=0
		
		self.totaldeaths=0
		self.timeelapsed=0
		self.lastreportedtime=0
		self.reportedtimeup=false
		
		self.resultstimer=nil
		self.endtimer=nil
		
		self.queueloader=nil
		
	end
	


	function class:Populate()
		super.Populate(self)
		
		--self.game.window.bordergraphic.titletext.fontstring:SetText("X Practice (PLAYTEST)")
		
		local scenario=self
		
		self.gameinprogress=false
		self.phasetime=0
		
		self.buttongroup={}
		self.buttongroup[1]={}		-- Options/Go

		
		self.markers={}
		
	
		local scenario=self
		local gamemenu=XPRACTICE.GameMenu.new()
		gamemenu:Setup(self.game.environment_gameplay,self.game.SCREEN_WIDTH/2-180/2,self.game.SCREEN_HEIGHT/2-270/2)
		self.gamemenu=gamemenu
		

		self.game.environment_gameplay.modelsceneframe:SetLightDirection(.2,0,-1)
		self.game.environment_gameplay.modelsceneframe:SetCameraFarClip(2000)
		--print(self.game.environment_gameplay.modelsceneframe:GetCameraFieldOfView()/math.pi*180)
		--self.game.environment_gameplay.modelsceneframe:SetCameraFieldOfView(90*math.pi/180)
		
			




		self.collision=XPRACTICE.VOTIRAIDMAPS.Collision.new()
		self.collision.scenario=self
		
		local button

		
		local label=XPRACTICE.FadingLabel.new()		
		label:Setup(self.game.environment_gameplay)
		label.position={x=self.game.SCREEN_WIDTH/2-600/2,y=150,z=0}
		label:SetSize(600,300)
		label:SetText("")
		self.statuslabel=label

		self.debugbuttonx=self.game.SCREEN_WIDTH/2-25
		self.debugbuttony=104
						

		local label=XPRACTICE.LeftAlignedLabel.new()		
		label:Setup(self.game.environment_gameplay)
		label.position={x=self.game.SCREEN_WIDTH-200,y=20,z=0}
		label:SetSize(200,100)
		label:SetText("")
		self.populationlabel=label

		self.cpulockgates={}
		

		local mob,obj
		local player

		

		local name1,name2=UnitFullName("player")
		local myfullname=name1.."-"..name2		
		--player=XPRACTICE.PlayerCharacter.new()		
		player=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost.new()
		player.playername=myfullname
		player:Setup(self.game.environment_gameplay)		
		player.displayobject.drawable:SetSheathed(false) 
		
		 --player.basemovespeed=140
		 --player.backpedalspeed=140
		
		player.position={x=75,y=0,z=0}
		player.orientation.yaw=-math.pi;player.orientation_displayed.yaw=player.orientation.yaw

		player.scenario=self
		self.player=player		
		tinsert(self.allplayers,player)
				

		self.game.environment_gameplay.cameramanager.camera.focus=player
		self.game.environment_gameplay.cameramanager.camera.orientation.yaw=player.orientation.yaw
		self.game.environment_gameplay.cameramanager.camera.orientation.pitch=math.pi*0.075
		--self.game.environment_gameplay.cameramanager.camera.orientation.pitch=math.pi*0.15
		--self.game.environment_gameplay.cameramanager.camera.cdist=30
		self.game.environment_gameplay.cameramanager.camera.cdist=60
		
		
		local lossofcontrolalert=XPRACTICE.LossOfControlAlert.new()
		self.lossofcontrolalert=lossofcontrolalert
		lossofcontrolalert:Setup(self.game.environment_gameplay)
		lossofcontrolalert.position={x=self.game.SCREEN_WIDTH/2-180/2,y=self.game.SCREEN_HEIGHT/2,z=0}
		lossofcontrolalert.focus=player

		

		
		local controller=XPRACTICE.PlayerController.new()
		controller:Setup(self.game.environment_gameplay,player,self.game.environment_gameplay.cameramanager.camera)
		self.playercontroller=controller
		
		-- self.auratracker=XPRACTICE.VOTIRAIDMAPS.ExplosiveRunes_AuraTracker.new()				
		-- self.auratracker:Setup(self.game.environment_gameplay,self.game.SCREEN_WIDTH-500,self.game.SCREEN_HEIGHT-300)
		-- self.auratracker.scenario=self
		
		self.bosses={}
		
		-- local boss=XPRACTICE.VOTIRAIDMAPS.TheJailer.new()
		-- self.boss=boss	
		-- self.boss.scenario=self
		-- self.boss:Setup(self.game.environment_gameplay)
		-- self.boss.position={x=math.cos(math.pi*2/3)*18,y=math.sin(math.pi*2/3)*18,z=0}
		-- self.boss:FreezeOrientation(math.pi*2/3)
		-- self.boss:CreateNameplates()
		
		-- --TODO LATER: move elsewhere
		-- local bosscastingbar=XPRACTICE.CastingBar.new()
		-- self.bosscastingbar=bosscastingbar
		-- bosscastingbar:Setup(self.game.environment_gameplay)
		-- bosscastingbar.position={x=self.game.SCREEN_WIDTH/2-196/2,y=240,z=0}
		-- bosscastingbar.focus=boss	
		
		--TODO LATER: move elsewhere
		local maincastingbar=XPRACTICE.CastingBar.new()
		self.maincastingbar=maincastingbar
		maincastingbar:Setup(self.game.environment_gameplay)
		maincastingbar.position={x=self.game.SCREEN_WIDTH/2-196/2,y=150,z=0}
		maincastingbar.focus=player		
		
		


		-- we use a separate mob for hidden spells so we can cast while boss is already casting
			-- pick a mob class at random.  we can't use Mob because the game doesn't know how to handle FileID(1) after rebooting
				-- (function crashes silently, no lua error!)
		local obj=XPRACTICE.LEGACY.CrimsonCabalist.new()
		obj:Setup(self.game.environment_gameplay)
		obj.alpha=0		-- invisible bunny
		obj.scenario=self
		self.spellbunny=obj
		

		
		-- self.layout=XPRACTICE.VOTIRAIDMAPS.Layout.new()
		-- self.layout:Setup(self.game.environment_gameplay,self)
		
		local floorobj
		floorobj=XPRACTICE.VOTIRAIDMAPS.Floor.new()
		
		floorobj:Setup(self.game.environment_gameplay)
		self.floor=floorobj
		self.floor.scenario=self
		floorobj.visiblefromallphases=true

		self.layout=XPRACTICE.VOTIRAIDMAPS.Layout.new()
		self.layout.scenario=self
		self.layout:Setup(self.game.environment_gameplay)
		
		
		local scenario=self
		

		
		
		self.multiplayer=XPRACTICE.VOTIRAIDMAPS.Multiplayer.new()	-- inherits multiplayerv2
		self.multiplayer:Setup(self.npcid,self,self.game.environment_gameplay)	
		self.multiplayer:SendHello()		
		


		local label=XPRACTICE.HelpLabel.new()		
		label:Setup(self.game.environment_gameplay)
		--label.position={x=150,y=self.game.SCREEN_HEIGHT/2,z=0}
		label.position={x=150,y=250,z=0}
		label:SetSize(800,600)
		local message="VAULT OF THE INCARNATES RAID MAPS\r\r"..
						"(Placeholder.  There is no help text for this scenario.)\r"
		--label:SetText("test")
		label:SetText(message)
		label.alpha=0;label.displayobject.drawable:SetAlpha(0)
		self.helplabel=label			

			
		self.worldmarkercontroller=XPRACTICE.VOTIRAIDMAPS.WorldMarkerController.new()
		self.worldmarkercontroller:Setup(self.game.environment_gameplay)
		
		

		
		

	
	
		XPRACTICE.BossDebugButton.ResetPosition()
		self.bossdebugbuttons={}
		local button
		
		XPRACTICE.BossDebugButton_v2.HIDEBUTTONS=true
		local buttongroup={}
		XPRACTICE.OptionsMenuButton.debugbuttonx=25
		XPRACTICE.OptionsMenuButton.debugbuttony=52+52+10
		local extrabuttons={}
		button=class.QuickCollapseButton(self.game.environment_gameplay,self,buttongroup,"Extra")
		button.buttons=extrabuttons
		XPRACTICE.OptionsMenuButton.debugbuttony=XPRACTICE.OptionsMenuButton.debugbuttony+45
		local mobilitybuttons={}
		button=class.QuickCollapseButton(self.game.environment_gameplay,self,buttongroup,"Mobility")
		button.buttons=mobilitybuttons
		XPRACTICE.OptionsMenuButton.debugbuttony=XPRACTICE.OptionsMenuButton.debugbuttony+45
		local bosscontrolbuttons={}
		button=class.QuickCollapseButton(self.game.environment_gameplay,self,buttongroup,"Boss controls")
		button.buttons=bosscontrolbuttons
		XPRACTICE.OptionsMenuButton.debugbuttony=XPRACTICE.OptionsMenuButton.debugbuttony+45
		local worldmarkerbuttons=self.worldmarkercontroller:QuickButtons(156,240,self)
		button=class.QuickCollapseButton(self.game.environment_gameplay,self,buttongroup,"World markers")	
		button.buttons=worldmarkerbuttons		
		XPRACTICE.OptionsMenuButton.debugbuttony=XPRACTICE.OptionsMenuButton.debugbuttony+45		
		local changemapbuttons=XPRACTICE.VOTIRAIDMAPS.ChangeMap.QuickButtons(156,310,self)
		button=class.QuickCollapseButton(self.game.environment_gameplay,self,buttongroup,"Change map")
		self.changemapbutton=button
		button.buttons=changemapbuttons
		
		XPRACTICE.BossDebugButton.debugbuttony=XPRACTICE.BossDebugButton.debugbuttony+52
		XPRACTICE.BossDebugButton.debugbuttony=XPRACTICE.BossDebugButton.debugbuttony+52
		XPRACTICE.BossDebugButton.debugbuttony=XPRACTICE.BossDebugButton.debugbuttony+52
		--self.getplayerpositionbutton=XPRACTICE.BossDebugButton.QuickButton(self.game.environment_gameplay,self,XPRACTICE.LEGACY.Spell_GetPlayerPosition,self.spellbunny)

		
		


		XPRACTICE.BossDebugButton.CarriageReturn()				

		--self.tauntbutton=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.VOTIRAIDMAPS.Spell_TauntBoss,self.spellbunny,"TAUNT\nBOSS")
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
			XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
		self.brezbutton=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.VOTIRAIDMAPS.Spell_ChangeMap,self.spellbunny,"TEST")		
		
		--self.roarbutton=XPRACTICE.BossDebugButton.QuickButton(self.game.environment_gameplay,self,XPRACTICE.VOTIRAIDMAPS.Spell_Roar,self.spellbunny,"ROAR")
		--self.pallybubblebutton=XPRACTICE.BossDebugButton.QuickButton(self.game.environment_gameplay,self,XPRACTICE.VOTIRAIDMAPS.Spell_PallyBubble,self.spellbunny,"INVUL\n5 SEC")


		local button
		XPRACTICE.BossDebugButton.CarriageReturn()
		XPRACTICE.BossDebugButton.debugbuttony=194		
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52		
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.VOTIRAIDMAPS.Spell_MoveBoss,self.spellbunny,"MOVE\nBOSS")
		tinsert(bosscontrolbuttons,button)


		local button
		XPRACTICE.BossDebugButton.CarriageReturn()
		XPRACTICE.BossDebugButton.debugbuttony=148
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.Spell_Roll,self.player,"ROLL",nil,self.player.combatmodule.spellbook.roll,"roll")
		tinsert(mobilitybuttons,button)
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.Spell_Blink,self.player,"BLINK",nil,nil,"blink")
		tinsert(mobilitybuttons,button)
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.Spell_Soulshape,self.player,"SOUL\nSHAPE",nil,nil,"soulshape")		
		tinsert(mobilitybuttons,button)
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.Spell_TranscendenceTransfer,self.player,"MONK\nTELE",nil,nil,"monktele")
		tinsert(mobilitybuttons,button)
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.Spell_DemonicCircleTeleport,self.player,"LOCK\nTELE",nil,nil,"locktele")		
		tinsert(mobilitybuttons,button)
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.Spell_LockGateItem,self.player,"GATE\nITEM",nil,nil,"gateitem")
		tinsert(mobilitybuttons,button)
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.Spell_SetMMB,self.player,"SET\nMMB")	
		tinsert(mobilitybuttons,button)
		
		
		XPRACTICE.BossDebugButton.CarriageReturn()		
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.Spell_Sprint,self.player,"DASH",nil,nil,"dashv2")
		tinsert(mobilitybuttons,button)
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.Spell_HeroicLeap,self.player,"LEAP",nil,nil,"heroicleapcursor")
		tinsert(mobilitybuttons,button)
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.Spell_Transcendence,self.player,"MONK\nSET",nil,nil,"transcendence")
		tinsert(mobilitybuttons,button)
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.Spell_DemonicCircle,self.player,"LOCK\nSET",nil,nil,"demoniccircle")		
		tinsert(mobilitybuttons,button)
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.Spell_LockGateCombo,self.player,"LOCK\nGATE",nil,nil,"lockgatecombo")
		tinsert(mobilitybuttons,button)
		
		
		XPRACTICE.BossDebugButton.CarriageReturn()
		XPRACTICE.BossDebugButton.debugbuttony=104
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.LEGACY.Spell_GetPlayerPosition,self.spellbunny,"COORDS",9)
		tinsert(extrabuttons,button)
		button=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.VOTIRAIDMAPS.Spell_CallToArms,self.spellbunny,"CALL")
		tinsert(extrabuttons,button)
	
		XPRACTICE.BossDebugButton_v2.HIDEBUTTONS=false
	
		XPRACTICE.BossDebugButton.CarriageReturn()
		XPRACTICE.BossDebugButton.debugbuttony=52	
		self.brezbutton=XPRACTICE.BossDebugButton_v2.QuickButton(self.game.environment_gameplay,self,XPRACTICE.VOTIRAIDMAPS.Spell_Brez,self.spellbunny,"ANKH")		
		

		--self.phase1button=XPRACTICE.BossDebugButton.QuickButton(self.game.environment_gameplay,self,XPRACTICE.VOTIRAIDMAPS.Spell_ResetPhase1,self.spellbunny,"GOTO\nPHASE1",9)
		
		
		-- self.swirlsyncstopbutton=XPRACTICE.BossDebugButton.QuickButton(self.game.environment_gameplay,self,XPRACTICE.VOTIRAIDMAPS.Spell_SwirlSync_Stop,self.spellbunny,"SWIRL\nSTOP")
		-- self.resetstacksbutton=XPRACTICE.BossDebugButton.QuickButton(self.game.environment_gameplay,self,XPRACTICE.VOTIRAIDMAPS.Spell_ResetStacks,self.spellbunny,"RESET\nSTACK")
		
		-- XPRACTICE.BossDebugButton.CarriageReturn()
		-- self.humanappearancebutton=XPRACTICE.BossDebugButton.QuickButton(self.game.environment_gameplay,self,XPRACTICE.VOTIRAIDMAPS.Spell_HumanAppearance,self.spellbunny,"HMN")
		-- self.lichappearancebutton=XPRACTICE.BossDebugButton.QuickButton(self.game.environment_gameplay,self,XPRACTICE.VOTIRAIDMAPS.Spell_LichAppearance,self.spellbunny,"LICH")		
		-- XPRACTICE.BossDebugButton.CarriageReturn()
		
		-- -- NOTE: the new temp menu interface system creates some additional bossdebugbuttons; unsure if we want them to add them to the list
		-- for i=1,#self.bossdebugbuttons do
			-- self.bossdebugbuttons[i]:SetLockedStartingAlpha(1);self.bossdebugbuttons[i]:EnableMouse(true) --TODO:
		-- end
		
		-- local interface=XPRACTICE.SetRoleInterface.new()
		-- interface.scenario=self
		-- interface:Setup(self.game.environment_gameplay)	
		-- local interface=XPRACTICE.SpectatorModeInterface.new()
		-- interface.scenario=self
		-- interface:Setup(self.game.environment_gameplay)
		
		

		
		--TODO: Roles class
		self.roles={}		
		tinsert(self.roles,{roleid="B",rolename="The Jailer",requireofficer=true,playerpointer=nil,mob=self.boss})
				
		-- self.schedule=XPRACTICE.VOTIRAIDMAPS.Schedule.new()
		-- self.schedule.scenario=self
		-- self.schedule:Setup(self.game.environment_gameplay)
				
		
		
		self.tempmenu=XPRACTICE.TempMenuInterfaceCollection.new()
		self.tempmenu.scenario=self
		self.tempmenu:Setup(self.game.environment_gameplay)
		--self.tempmenu:LoadMenu(XPRACTICE.SetRoleInterfacev2)
		
		
		

		--self.worldmarkercontroller:LoadAll(self,true)


		
		if(self.multiplayer.joinedsolo)then
			self.statuslabel:SetText("You are not in a group!\nJoin a group to enable multiplayer features.",5.0)
			self.floor:TransitionTo(XPRACTICE.VOTIRAIDMAPS.FloorData.ERANOG)
		else
			self.statuslabel:SetText("Welcome to Vault of the Incarnates!  Wait a moment for raid communications...",5.0)
			self.waitingforcommstimer=2.0
		end
		
		local setup=false

		-- ActionButton_ShowOverlayGlow(self.setrolebutton.displayobject.drawable)

		
		if(setup)then		
			--self.statuslabel:SetText("Welcome to the long-overdue Jailer scenario.\nBefore clicking go, please set your ROLE and your assigned TANK SOAK.",nil)
		end
		
		self.askforsetup=setup
		
	end
	
	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		
		if(self.waitingforcommstimer and self.waitingforcommstimer>0)then
			self.waitingforcommstimer=self.waitingforcommstimer-elapsed
			if(self.waitingforcommstimer<=0)then
				self.waitingforcommstimer=nil
				self.statuslabel:SetText("No raid officers found.  Moving to Eranog's room.",5.0)
				self.floor:TransitionTo(1)
			end
		end
		
		if(self.populationlabel)then
			local playercount=0
			for k,v in pairs(self.multiplayer.allplayers)do
				playercount=playercount+1
			end
			self.populationlabel:SetText("Player count: "..tostring(playercount))
		end
		
		
		
		
		
		


		
		---------------------------------------------------------------
		-- HIT DETECTION
		---------------------------------------------------------------
		
		if(self.player)then
			self.collision:OutOfBoundsCheck()
			
			self.collision:DebuffCheck()
		end
		
		-------------------------------------------------------------------------------
		-- GAME END DETECTION
		-------------------------------------------------------------------------------		


		
		
		------------------------------------------------------------------------------
		-- FAKE COMBAT LOG MESSAGES
		------------------------------------------------------------------------------
		
		--
		
		------------------------------------------------------------------------------
		-- MENU BUTTONS
		------------------------------------------------------------------------------	
	
		

		
		
		if(self.schedule and self.schedule.time and self.boss.nameplate)then		
			local TOTALPHASETIME=3*60+10
			self.boss.nameplate.hp_TEMP=1.0 - (0.4 * self.schedule.time/TOTALPHASETIME)
		end
		
		
		------------------------------------------------------------------------------
		-- TIMED EVENTS
		------------------------------------------------------------------------------	
		-- process this loop forward so events are executed usually in the order they are queued
		
		for i=1,#self.events do
			local event=self.events[i]
			if(self.stopallevents==false or event.alwayshappens)then
				if(self.game.environment_gameplay.localtime>=event.time)then
					--print("event",event,event.time)
					if(event.button)then
						event.button:BossButtonClick()				
					end
					if(event.func)then
						event.func(self)
					end
					event.dead=true
					--TODO LATER: due to the way spell queues are currently set up, queueing up two buttons on the same frame will overwrite the former spell with the latter
					-- so for now, we break to limit one event per frame
					break
				end
			end
		end

		-- removal loop goes backward as usual
		for i=#self.events,1,-1 do
			if(self.events[i].dead)then
				tremove(self.events,i)
			end
		end
		
	end
	
	
	-- function class:UpdatePlayerFloorbelowStatus()
		-- for k,v in pairs(self.multiplayer.allplayers)do
			-- local player=v
			-- if(self.player.floorbelow==false and self.player.position.z<0)then 
				-- return 
			-- end
			-- local ok=self.collision:EdgeCheck(player)
			-- player.floorbelow=ok		
		-- end
	-- end
	
	function class:UpdatePlayerFloorbelowStatus()
		--overridden function is base scenario class, so we can't move the entire thing to collision
		if(not self.player)then return end
		if(self.player.alwaysignorecollision==true)then return end
		if(self.player.floorbelow==false and self.player.position.z<0)then return end
		
		local ok=self.layout:EdgelineCheck(0)
		if(ok==false)then
			ok=self.layout:EdgelineCheck(-0.01) or self.layout:EdgelineCheck(-0.01)
		end
		self.player.floorbelow=ok
	end
	
	


	function class:Brez()
		local auras=self.player.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.VOTIRAIDMAPS.Aura_ChangePhaseForced)
		if(#auras>0)then 			
			return 
		end				
		if(self.player.position.z<0)then
			return
		end
	
		local auras=self.player.combatmodule.auras.deadingame
		if(#auras==0)then 
			self.statuslabel:SetText("You're not dead yet.",3.0)
			return 
		end
		local auras=self.player.combatmodule.auras.deadingame
		for i=1,#auras do
			auras[i]:Die()
		end
		ActionButton_HideOverlayGlow(self.brezbutton.displayobject.drawable)
		
		self.player.portaldebuff=false
		self.player.velocity.x=0
		self.player.velocity.y=0
		self.player.velocity.z=0			
		self.player:StopAI()

		self.statuslabel:SetText("Brezzed.",3.0)
		self.multiplayer:FormatAndSendCustom("BREZ")
	end



	function class:BrezOther(player)
		local auras=player.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.VOTIRAIDMAPS.Aura_ChangePhaseForced)
		if(#auras>0)then 			
			return 
		end				
		if(player.position.z<0)then
			return
		end	
		local auras=player.combatmodule.auras.deadingame
		if(#auras==0)then 
			return 
		end
		local auras=player.combatmodule.auras.deadingame
		for i=1,#auras do
			auras[i]:Die()
		end		
		player.portaldebuff=false
		player.velocity.x=0
		player.velocity.y=0
		player.velocity.z=0				
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
	


	function class:ClickButtonAfterDelay(button,delay)		
		if(delay<0)then return end --cheap way to skip events when we fastforward
		local event={}
		event.button=button
		event.time=self.game.environment_gameplay.localtime+delay
		event.dead=false
		tinsert(self.events,event)
	end
	
	function class:FunctionAfterDelay(func,delay)		
		if(delay<0)then return end --cheap way to skip events when we fastforward
		local event={}
		event.func=func
		event.time=self.game.environment_gameplay.localtime+delay
		event.dead=false
		tinsert(self.events,event)
	end
	

	
	function class:OnRoomLock(hostname)
		--self.statuslabel:SetText(hostname.." is sending data.  The encounter will start momentarily...",3.0)
		self.statuslabel:SetText(hostname.." has started the encounter!",3.0)
		self.gameinprogress=true
		self.totaldeaths=0
				
		if(self.schedule)then self.schedule:Die() end
		
		self.gameneedsreset=true
		self.schedule=XPRACTICE.VOTIRAIDMAPS.Schedule.new()
		self.schedule.scenario=self
		self.schedule:Setup(self.game.environment_gameplay)
		
		if(self.multiplayer.host)then
			--
		end
	end
	

	function class:OnRoomUnlock(hostname,noofficers,acknowledge)
		--if(not self.multiplayer.roomlocked)then return end   --this doesn't work: room is ALREADY unlocked
		
		self:BrezAllPlayers()
		
		if(self.schedule)then self.schedule:Die() end
		
		self.debuffsactive=false
		self.guiddebuffs={}
		self.reportedcollisionlist={}
		
		self.boss.combatmodule.targetmob=nil
		self.boss.combatmodule.autoattacking=false

		if(not(IsInGroup("player")) or UnitIsGroupLeader("player")==true)then
			ActionButton_ShowOverlayGlow(self.gotophase1button.displayobject.drawable)
		end
		
		if(not self.multiplayer.joinedgameinprogress)then
			if(not noofficers)then
				if(self.gameinprogress)then
					self.statuslabel:SetText(hostname.." ended the encounter.",3.0)
				end
			else
				if(self.gameinprogress)then      
					self.statuslabel:SetText("The host has left the room.  The encounter ends.",3.0)
				end
			end					
			self.multiplayer:SendIExist()
		else
			self.multiplayer.joinedgameinprogress=false
			self.statuslabel:SetText("The encounter in progress has ended.  You will now join the room.",3.0)
			self.multiplayer:SendHello()
		end		
		self.totaldeaths=0
		self.timeelapsed=0
		self.reportedtimeup=false
		self.lastreportedtime=0
		self.gameinprogress=false
		self.resultstimer=nil
		self.endtimer=nil

		

	end

	function class:OnRoomAlreadyInProgress(sender)
		self.statuslabel:SetText("An encounter is already in progress!\nYou will automatically join the room when the encounter ends.",nil)
	end
	
	function class:OnCustomMessage(msgcode,sender,args)
		
	end
	
	function class:OnEscapeKey()		
		if(self.gamemenu)then		-- this line is basically a "have we run Populate yet?" check
			if(self.gamemenu.shown)then
				self.gamemenu:Hide()
			elseif(self.tempmenu.currentmenu)then
				self.tempmenu:UnloadCurrentMenu()
			elseif(false)then
				--TODO NEXT: if ground targeting cursor exists, kill it here
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
	
	
	function class:AttemptKillPlayer(player,ignorebubble)
		if(player:IsDeadInGame())then return false end
		--TODO: move to base mob
		for i=1,#player.combatmodule.auras.newauras do
			local aura=player.combatmodule.auras.newauras[i]
			if(aura:Class()==XPRACTICE.Aura_DeadInGame)then return false end
			--print(aura.class)
		end
		
		local auras=player.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.VOTIRAIDMAPS.Aura_PallyBubble)
		if(#auras>0 and ignorebubble~=true)then
			return false
		else			
			--print("AKP",player,ignorebubble)
			local aura=player.combatmodule:ApplyAuraByClass(XPRACTICE.Aura_DeadInGame,player.combatmodule,player.environment.localtime)	
			self.totaldeaths=self.totaldeaths+1	
			ActionButton_ShowOverlayGlow(self.brezbutton.displayobject.drawable)
			return true
		end
	end
	
	function class:BrezAllPlayers()
		--print("Current?:",self.multiplayer.allplayers)
		for k,v in pairs(self.multiplayer.allplayers) do
			--print("Rez player",k,v)
			local player=v		
			local auras=player.combatmodule.auras.deadingame
			if(#auras>0)then
				for i=1,#auras do
					auras[i]:Die()
				end				
				player:StopAI()
			end
		end
		for k,v in pairs(self.multiplayer.previousplayerghosts) do
			local player=v		
			local auras=player.combatmodule.auras.deadingame
			if(#auras>0)then
				for i=1,#auras do
					auras[i]:Die()
				end
				player:StopAI()
			end
		end
		ActionButton_HideOverlayGlow(self.brezbutton.displayobject.drawable)
	end
	
	
	
	
	function class:GetAllRoleMobs()
		local result={}
		for k,v in pairs(self.multiplayer.allplayers) do	--TODO: only murlocs, not ghosts
			tinsert(result,v)
		end
		tinsert(result,self.boss)
		return result
	end	
	
	function class:PlaceHintArrow(x,y)
		--print("hint?",x,y)
		if(self.hintarrow)then
			--TODO LATER: :StartDespawn()
			self.hintarrow:Die()
		end
		local arrow=XPRACTICE.VOTIRAIDMAPS.HintArrow.new()
		arrow:Setup(self.game.environment_gameplay,x,y,0.5)
		self.hintarrow=arrow
	end

	function class:PlaceBossHintArrow(x,y)
		if(self.bosshintarrow)then
			--TODO LATER: :StartDespawn()
			self.bosshintarrow:Die()
		end
		local arrow=XPRACTICE.VOTIRAIDMAPS.BossHintArrow.new()
		arrow:Setup(self.game.environment_gameplay,x,y,1.5)
		self.bosshintarrow=arrow
	end	
	
	
	function class.QuickWorldMarkerButton(environment,scenario,buttongroup,text)
	end
	
	
	function class.QuickCollapseButton(environment,scenario,buttongroup,text)
		local menubutton
		menubutton=XPRACTICE.Button.new()
		menubutton:Setup(environment)		
		menubutton.position={x=XPRACTICE.OptionsMenuButton.debugbuttonx,y=XPRACTICE.OptionsMenuButton.debugbuttony,z=0}
		local alpha=1
		menubutton:SetLockedStartingAlpha(alpha)
		menubutton:EnableMouse(true)
		menubutton.buttongroup=buttongroup
		tinsert(buttongroup,menubutton)
		menubutton.scenario=scenario
		menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
				if(button=="LeftButton" and down)then
					for i=1,#buttongroup do
						local mb=buttongroup[i]
						if(mb==menubutton and not mb.selected)then
							for j=1,#mb.buttons do
								local b=mb.buttons[j]
								b:SetLockedStartingAlpha(1)
								b:EnableMouse(true)
							end
							mb:Select(true)
						else
							for j=1,#mb.buttons do
								local b=mb.buttons[j]
								b:SetLockedStartingAlpha(0)
								b:EnableMouse(false)
							end				
							mb:Select(false)
						end						
					end
				end
			end)
		menubutton:SetSize(100,30)
		menubutton:SetText(text)
		menubutton.buttons={}
		return menubutton
	end			
	
	function class:OnReceiveHello()
		if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
			if(self.mapindex)then
				local args={}
				args[1]=string.char(self.mapindex)				
				local j
				for j=2,13 do
					args[j]=0
				end
				j=2
				for i=1,#self.bosses do
					if(self.bosses[i].ai.targetposition and self.mapindex~=2)then
						args[j]=self.bosses[i].ai.targetposition.x
						args[j+1]=self.bosses[i].ai.targetposition.y
					else
						args[j]=self.bosses[i].position.x
						args[j+1]=self.bosses[i].position.y
					end
					args[j+2]=self.bosses[i].orientation.yaw
					j=j+3
				end
				self.multiplayer:FormatAndSendCustom("WORLD_STATE",unpack(args))
				self.worldmarkercontroller:SendAll(self)
			end
		end
	end
		
	
	
	XPRACTICE.ScenarioList.RegisterScenario(XPRACTICE.VOTIRAIDMAPS.Scenario,"Vault of the Incarnates","Raid Maps","SCENARIO")
end

