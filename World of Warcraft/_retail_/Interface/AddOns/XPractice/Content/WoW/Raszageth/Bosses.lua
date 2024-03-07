do

	XPRACTICE.RASZAGETH.AnimationList={}
	----XPRACTICE.AnimationTemplate.QuickSetup(animationlist,			name,		index,	subindex,	priority,	duration,	nextanimation)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.RASZAGETH.AnimationList,"AttackUnarmed1",16,		0,	"Shuffle",	1.25,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.RASZAGETH.AnimationList,"AttackUnarmed2",16,		1,	"Shuffle",	1.25,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.RASZAGETH.AnimationList,"Bite",16,		2,	"Priority",	1.25,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.RASZAGETH.AnimationList,"SpellCastDirected",53,		0,			"Active",	0.25,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.RASZAGETH.AnimationList,"HurricaneWing",214,			0,			"Priority",	2.0,		nil)

	local PH=1
	
	XPRACTICE.RASZAGETH.Bosses={}
	
	
	local boss={{name="Raszageth",id=191531,display=103255,scale=2,speedmultiplier=1.0,customboundingbox={-7.5,-7.5,0,7.5,7.5,10}}	
	--local boss={{name="Raszageth",id=191531,fileid=915919,scale=2,speedmultiplier=1.0,customboundingbox={-7.5,-7.5,0,7.5,7.5,10}}	
				}
				
	XPRACTICE.RASZAGETH.Bosses[8]=boss
	
	
	function XPRACTICE.RASZAGETH.Bosses.CreateBosses(scenario,mapindex)
		if(not XPRACTICE.RASZAGETH.Bosses[mapindex])then return end
		
		local bosses={}				
		
		for i=1,#scenario.bosses do
			local boss=scenario.bosses[i]
			if(not boss.expirytime)then
				boss.fadestarttime=scenario.game.environment_gameplay.localtime
				boss.expirytime=boss.fadestarttime+1.0		
			end
		end
		
		
		
		for i=1,#XPRACTICE.RASZAGETH.Bosses[mapindex] do
			local info=XPRACTICE.RASZAGETH.Bosses[mapindex][i]
			local boss=XPRACTICE.RASZAGETH.MultiBoss.new()
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
		XPRACTICE.RASZAGETH.MultiBoss=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.RASZAGETH.MultiBoss
	
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
			
			self.chaseradius=28
			
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
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Idle)
		end		
		function class:PlayAttackStanceAnimation()			
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ReadyUnarmed)
		end
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			self.alivetime=self.alivetime+elapsed
			
			self.alpha=(13/16)+math.cos(self.alivetime*(math.pi*2/5.0))*(3/16)
			
			if(self.combatmodule.autoattacking and not self.autoattacktimer)then
				self.autoattacktimer=0	--TODO: probably move elsewhere
			end
			--if(self.combatmodule.tauntmovetarget==nil)then
			if(self.combatmodule.targetmob==nil)then
				self.autoattacktimer=nil	--TODO NEXT: only if combatmodule.targetmob is nil
			end			
			
			if(self.autoattacktimer and not self.scenario.pauseallmechanics)then
				if(self.combatmodule.castedspell==nil and self.combatmodule.channeledspell==nil and not self.scenario.stopallevents)then
					self.autoattacktimer=self.autoattacktimer-elapsed
					if(self.autoattacktimer<=0)then
						self.autoattacktimer=self.autoattacktimer+self.autoattackspeed
						if(math.random()<0.5)then
							self.animationmodule:PlayAnimation(XPRACTICE.RASZAGETH.AnimationList.AttackUnarmed1)
						else
							self.animationmodule:PlayAnimation(XPRACTICE.RASZAGETH.AnimationList.AttackUnarmed2)
						end
					end
				end
			end			
			
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