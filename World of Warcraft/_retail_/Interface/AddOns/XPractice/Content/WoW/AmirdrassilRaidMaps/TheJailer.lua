-- mace_2h_jailernpc_d_01.m2		-- 3949874
	-- check if it's possible to set this as mount?
		-- some animations use extending flail effect

-- mace_2h_jailerpc_d_01.m2 (no animations, but mouth opens/closes passively)

do

	XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList={}
	----XPRACTICE.AnimationTemplate.QuickSetup(animationlist,			name,		index,	subindex,	priority,	duration,	nextanimation)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList,"IdleAttack1H",17,		0,	"Shuffle",	1.5,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList,"IdleAttack1H_2",17,		1,	"Shuffle",	1.5,		nil)
	
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList,"Custom11",1500,		0,	"Active",	3.5,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList,"Custom3",156,		0,	"Active",	1.0,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList,"Custom2",155,		0,	"Active",	0.5,		XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList.Custom3)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList,"Custom1",154,		0,	"Active",	1.0,		XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList.Custom2)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList,"Custom0",153,		0,	"Active",	0.5,		XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList.Custom1)
	
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList,"ExplosiveRuneCustom",213,	0,		"Active",		nil,nil)
	

	do		
		--local super=XPRACTICE.Mob
		local super=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Murloc
		XPRACTICE.AMIRDRASSILRAIDMAPS.TheJailer=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.AMIRDRASSILRAIDMAPS.TheJailer
		
		function class:Setup(environment,x,y,z)
			super.Setup(self,environment,x,y,z)
						
			self.combatmodule.queuetolerance=60.0 -- reminder: this affects jailer himself, not spellbunny
			
			self.autoattacktimer=nil
			self.autoattackspeed=2.5 --TODO: sometimes seems to be 3.5, don't know why

			
			-- local jailer=self
			-- local prev=self.animationmodule.PlayAnimation			
			-- self.animationmodule.PlayAnimation=function(self,animationtemplate)
				-- prev(self,animationtemplate)
				-- --print(jailer,jailer.attachedweapon)
				-- if(jailer.attachedweapon)then					
					-- jailer.attachedweapon.animationmodule:PlayAnimation(animationtemplate)
					-- --jailer.attachedweapon.animationmodule:PlayAnimation(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList.Custom11)
				-- end
			-- end
			--
			--self.animationmodule:PlayAnimation(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList.Custom11)

		end
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.basemovespeed=14
			self.walkspeed=7.0
			self.defaultspeechbubbleduration=4.0
			
			self.autoattacktimer=nil
			self.autoattackspeed=1.0			
			self.playername="The Jailer"
			self.alwaysignorecollision=true
			self.dontremoveselfnameplates=true
			self.ignoremovementinterrupts=true
		end				
		
		function class:CreateCombatModule()
			super.CreateCombatModule(self)
			
			local spell=XPRACTICE.AMIRDRASSILRAIDMAPS.Spell_WorldCrusher.new();spell:Setup(self.combatmodule)
			self.combatmodule.spellbook.worldcrusher=spell
			local spell=XPRACTICE.AMIRDRASSILRAIDMAPS.Spell_Torment1.new();spell:Setup(self.combatmodule)
			self.combatmodule.spellbook.torment1=spell					
			local spell=XPRACTICE.AMIRDRASSILRAIDMAPS.Spell_ChainsOfOppression.new();spell:Setup(self.combatmodule)
			self.combatmodule.spellbook.chainsofoppression=spell
			local spell=XPRACTICE.AMIRDRASSILRAIDMAPS.Spell_Martyrdom.new();spell:Setup(self.combatmodule)
			self.combatmodule.spellbook.martyrdom=spell			
			local spell=XPRACTICE.AMIRDRASSILRAIDMAPS.Spell_ExplosiveRunes.new();spell:Setup(self.combatmodule)
			self.combatmodule.spellbook.explosiverunes=spell
			local spell=XPRACTICE.AMIRDRASSILRAIDMAPS.Spell_RelentlessDomination.new();spell:Setup(self.combatmodule)
			self.combatmodule.spellbook.relentlessdomination=spell		
		end			

		function class:SetActorAppearanceViaOwner(actor)
			self.scale=1
			actor:SetModelByCreatureDisplayID(100456)

			--actor:SetSpellVisualKit(14290) -- MH frostmourne
			
			if(self.attachedweapon)then
				self.displayobject.drawable:AttachToMount(self.attachedweapon.displayobject.drawable)
			end
		end
		-- function class:SetDisplayObjectCustomBoundingBoxViaOwner(displayobject)
			-- local radius=0.625
			-- local base=0
			-- local height=2
			-- displayobject.customboundingbox={-radius,-radius,base,radius,radius,base+height}
		-- end		

		
		function class:CreateNameplates()
			local nameplate=XPRACTICE.Nameplate.new()
			nameplate.hp_TEMP=1.0			
			nameplate:Setup(self.environment,self)			
			nameplate.scalemultiplier=0.25
			nameplate:SetText("The Jailer")			
			local castingbar=XPRACTICE.CastingBarTiny.new()
			castingbar:Setup(self.environment,0,0,0)
			castingbar.focus=self
			castingbar:AnchorToNameplate(nameplate)
			local mobclickzone=XPRACTICE.MobClickZone.new()
			mobclickzone:Setup(self.environment,self)
			self.nameplate=nameplate
			self.mobclickzone=mobclickzone
		end		
		
		
		function class:PlayIdleAnimation()
			if(self.scenario.gameinprogress)then
				self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Ready1H)
			else
				self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Idle)
			end
		end
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			
			--if(self.camps[1])then print("camp1",self.camps[1].x,self.camps[1].go,self:CanSafelyMoveWithoutInterrupting()) end

			if(self.combatmodule.autoattacking and not self.autoattacktimer)then
				self.autoattacktimer=0	--TODO: probably move elsewhere
			end
			--if(self.combatmodule.tauntmovetarget==nil)then
			if(self.combatmodule.targetmob==nil)then
				self.autoattacktimer=nil	--TODO NEXT: only if combatmodule.targetmob is nil
			end

			--TODO NEXT: only if boss is in melee range of current target
			if(self.autoattacktimer)then			
				if(self.combatmodule.castedspell==nil and self.combatmodule.channeledspell==nil and not self.scenario.stopallevents)then
					self.autoattacktimer=self.autoattacktimer-elapsed
					if(self.autoattacktimer<=0)then
						self.autoattacktimer=self.autoattacktimer+self.autoattackspeed
						if(math.random()<0.5)then
							self.animationmodule:PlayAnimation(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList.IdleAttack1H)
							if(self.attachedweapon)then
								self.attachedweapon.animationmodule:PlayAnimation(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList.IdleAttack1H)
							end
						else
							self.animationmodule:PlayAnimation(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList.IdleAttack1H_2)
							if(self.attachedweapon)then
								self.attachedweapon.animationmodule:PlayAnimation(XPRACTICE.AMIRDRASSILRAIDMAPS.AnimationList.IdleAttack1H_2)
							end						
						end
					end
				end
			end
			
			--print(self.orientation.yaw,self.orientation_displayed.yaw)
		end

			
		function class:ClearTauntStatus()
			--TODO: better way of doing this
				-- ideally we can set target to a CPU without breaking camp suggestions
					-- (maybe combatmodule.targetmob)
			self.combatmodule.tauntmovetarget=nil
		end
			
		function class:GotoCamp(camp,reactiontime)
			camp.go=true

			if(self.scenario.player.rolepointer)then
				if(self.scenario.player.rolepointer.tank)then
					self.scenario:PlaceBossHintArrow(camp.x,camp.y)
				end
			end
			if(self.scenario.player==self)then
				self.scenario:PlaceHintArrow(camp.x,camp.y)
			end			
			
			--TODO: tauntmovetarget should be in AI, not combatmodule
			if(self.combatmodule.tauntmovetarget~=nil)then 
				-- reminder: currently, tauntmovetarget is only set by player-controlled characters.  if that changes, this will break
				--TODO: if boss is following a player, place "boss goes here" marker
				return 
			end
			reactiontime=reactiontime or 0			
			self:SuggestDestination(camp.x,camp.y,reactiontime)
			if(camp.yaw)then
				self:SuggestOrientation(camp.yaw,reactiontime)
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
			--print("suggest:",destx,desty,reactiontime)
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