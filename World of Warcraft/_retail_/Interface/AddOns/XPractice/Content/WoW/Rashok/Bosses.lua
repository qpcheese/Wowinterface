do

	XPRACTICE.RASHOK.AnimationList={}
	----XPRACTICE.AnimationTemplate.QuickSetup(animationlist,			name,		index,	subindex,	priority,	duration,	nextanimation)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.RASHOK.AnimationList,"AttackUnarmed1",16,		0,	"Shuffle",	1.25,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.RASHOK.AnimationList,"AttackUnarmed2",16,		1,	"Shuffle",	1.25,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.RASHOK.AnimationList,"Bite",16,		2,	"Priority",	1.25,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.RASHOK.AnimationList,"SpellCastDirected",53,		0,			"Active",	0.25,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.RASHOK.AnimationList,"SearingSlam",216,			0,			"Priority",	2.5,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.RASHOK.AnimationList,"FastSearingSlam",216,			0,			"Priority",	3.5/4,		nil,2.0)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.RASHOK.AnimationList,"SlowChannelCastOmni",	125,		0,			"Active",	0.1,		nil,0.25)

	local PH=1
	
	XPRACTICE.RASHOK.Bosses={}
	
	
	--local boss={{name="Rashok",id=201320,display=103255,scale=2,speedmultiplier=1.0,customboundingbox={-7.5,-7.5,0,7.5,7.5,10}}	
	--local boss={{name="Rashok",id=201320,fileid=4662848,scale=1.0,speedmultiplier=1.0,customboundingbox={-7.5,-7.5,0,7.5,7.5,10}}	
	--local boss={{name="Rashok",id=201320,fileid=4914665,scale=1.0,speedmultiplier=1.0,customboundingbox={-7.5,-7.5,0,7.5,7.5,10}}	
	--local boss={{name="Rashok",id=201320,display=108784,scale=2.0,speedmultiplier=1.0,customboundingbox={-7.5,-7.5,0,7.5,7.5,10}}	
	--local boss={{name="Rashok",id=201320,display=112109,scale=2.0,speedmultiplier=1.0,customboundingbox={-7.5,-7.5,0,7.5,7.5,10}}	
	local boss={{name="Rashok",id=201320,display=112109,scale=2.0,speedmultiplier=1.0}	
				}
				
	XPRACTICE.RASHOK.Bosses[8]=boss
	
	
	function XPRACTICE.RASHOK.Bosses.CreateBosses(scenario,mapindex)
		if(not XPRACTICE.RASHOK.Bosses[mapindex])then return end
		
		local bosses={}				
		
		for i=1,#scenario.bosses do
			local boss=scenario.bosses[i]
			if(not boss.expirytime)then
				boss.fadestarttime=scenario.game.environment_gameplay.localtime
				boss.expirytime=boss.fadestarttime+1.0		
			end
		end
		
		
		
		for i=1,#XPRACTICE.RASHOK.Bosses[mapindex] do
			local info=XPRACTICE.RASHOK.Bosses[mapindex][i]
			local boss=XPRACTICE.RASHOK.MultiBoss.new()
			boss.mapindex=mapindex
			boss.info=info
			boss:Setup(scenario.game.environment_gameplay)
			tinsert(bosses,boss)	
			boss.scenario=scenario
			boss:CreateNameplates()
			boss:FreezeOrientation(30/180*math.pi)			
		end		
		scenario.bosses=bosses
		
		return bosses
	end
	
	do
		local super=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Murloc
		XPRACTICE.RASHOK.MultiBoss=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASHOK.MultiBoss
	
		function class:SetCustomInfo()
			super.SetCustomInfo(self)			
			self.basemovespeed=14*self.info.speedmultiplier
			self.walkspeed=7.0*self.info.speedmultiplier
			self.defaultspeechbubbleduration=4.0
			
			self.autoattacktimer=nil
			self.autoattackspeed=2.0
			self.playername=self.info.name
			self.alwaysignorecollision=true
			self.dontremoveselfnameplates=true
			self.ignoremovementinterrupts=true
			
			--self.chaseradius=28
			self.chaseradius=0
			
			self.alivetime=0

		end					
	
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=self.info.scale
			if(self.info.display)then
				actor:SetModelByCreatureDisplayID(self.info.display)
			elseif(self.info.fileid)then
				actor:SetModelByFileID(self.info.fileid)	
				--self.orientation_displayed.pitch=math.pi/2
			end
		end	
		
		
		function class:CreateNameplates()
			local nameplate=XPRACTICE.Nameplate.new()
			nameplate.hp_TEMP=1.0			
			nameplate:Setup(self.environment,self)			
			nameplate.scalemultiplier=0.25
			nameplate:SetText(self.info.name)
			local castingbar=XPRACTICE.CastingBarTiny.new()
			castingbar:Setup(self.environment,0,0,0)
			castingbar.focus=self
			castingbar:AnchorToNameplate(nameplate)
			local mobclickzone=XPRACTICE.MobClickZone.new()
			mobclickzone:Setup(self.environment,self)
			self.nameplate=nameplate
			self.mobclickzone=mobclickzone
		end				
		
		function class:SetDisplayObjectCustomBoundingBoxViaOwner(displayobject)
			if(self.info.customboundingbox)then
				displayobject.customboundingbox=self.info.customboundingbox
			end
		end
		
		function class:PlayIdleAnimation()			
			if(self.scenario.pauseallmechanics)then
				self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Idle)						
			else				
				self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Ready2H)
			end
		end		
		-- function class:PlayAttackStanceAnimation()			
			-- self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Ready2H)
		-- end
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			self.alivetime=self.alivetime+elapsed
			
			-- --self.alpha=(13/16)+math.cos(self.alivetime*(math.pi*2/5.0))*(3/16)
			
			-- if(self.combatmodule.autoattacking and not self.autoattacktimer)then
				-- self.autoattacktimer=0	--TODO: probably move elsewhere
			-- end

			
		end
	


		function class:SuggestDestination(destx,desty,reactiontime,suggestername)
			-- unlike murloc, does not ignore suggestions while player-controlled
			reactiontime=reactiontime or 0
			if(self.rolepointer and self.rolepointer.playerghostpointer)then
				if(self.ai.suggestmode~=true and (self.ai.targetposition~=nil))then
					-- reject suggestion if mob is currently player-controlled and already moving
					return
				end
			end
			if(self.rolepointer and self.rolepointer.playerghostpointer)then
				if(self.rolepointer.playerghostpointer.playername==self.scenario.multiplayer.myfullname)then
						--TODO: restore this message if we can get it to not spam when boss is in chase/taunt/fixate mode
					--self.scenario.statuslabel:SetText("("..suggestername.." is repositioning you.)",3.0)				
				end
			end		
			self.destx=destx
			self.desty=desty
			-- if mob stopped to cast, they're going to try to restore the old position.  overwrite it
			self.prevmovex=destx
			self.prevmovey=desty						
			self.remainingreactiontime=reactiontime	
			self.ai.suggestmode=true
		end

		function class:SuggestOrientation(destx,desty,reactiontime,suggestername)
			-- unlike murloc, does not ignore suggestions while player-controlled
			reactiontime=reactiontime or 0
			if(self.rolepointer and self.rolepointer.playerghostpointer)then
				if(self.ai.suggestmode~=true and (self.ai.targetposition~=nil))then
					-- reject suggestion if mob is currently player-controlled and already moving
					return
				end
			end
			if(self.rolepointer and self.rolepointer.playerghostpointer)then
				if(self.rolepointer.playerghostpointer.playername==self.scenario.multiplayer.myfullname)then
						--TODO: restore this message if we can get it to not spam when boss is in chase/taunt/fixate mode
					--self.scenario.statuslabel:SetText("("..suggestername.." is repositioning you.)",3.0)				
				end
			end		
			self.destx=destx
			self.desty=desty
			-- if mob stopped to cast, they're going to try to restore the old position.  overwrite it
			self.prevmovex=destx
			self.prevmovey=desty						
			self.remainingreactiontime=reactiontime	
			self.ai.suggestmode=true
		end

		function class:SuggestOrientation(yaw,reactiontime,suggestername)
			reactiontime=reactiontime or 0
			if(self.rolepointer and self.rolepointer.playerghostpointer)then
				if(self.ai.suggestmode~=true and (self.ai.targetposition~=nil))then
					-- reject suggestion if mob is currently player-controlled and already moving
					return
				end
			end
			if(self.rolepointer and self.rolepointer.playerghostpointer)then
				if(self.rolepointer.playerghostpointer.playername==self.scenario.multiplayer.myfullname)then
						--TODO: restore this message if we can get it to not spam when boss is in chase/taunt/fixate mode
					--self.scenario.statuslabel:SetText("("..suggestername.." is repositioning you.)",3.0)				
				end
			end		
			self.destyaw=yaw
			self.remainingreactiontime=reactiontime	
			self.ai.suggestmode=true
		end			
	
	end


end