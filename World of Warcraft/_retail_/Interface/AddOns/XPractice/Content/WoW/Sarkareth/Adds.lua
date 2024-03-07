	local function QuickCast(spell,scenario,boss,args)
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=boss.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=boss.combatmodule
		spellinstance.args=args
		spellinstance.scenario=scenario
		spellinstance.spellbookspell:StartCasting(boss.environment.localtime,spellinstance)		
		boss.combatmodule.castedspell=spellinstance					
	end

do
	XPRACTICE.SARKARETH2.SpawnAdds=function(scenario,context)
		local spawner=XPRACTICE.SARKARETH2.DelayedAddSpawner.new()
		spawner.scenario=scenario
		spawner.context=context
		local boss=scenario.bosses[1]
		spawner:Setup(scenario.game.environment_gameplay,boss.position.x,boss.position.y)
	end

end

do
	local super=XPRACTICE.GameObject
	XPRACTICE.SARKARETH2.DelayedAddSpawner=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.DelayedAddSpawner
	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		self.alivetime=self.alivetime or 0
		self.alivetime=self.alivetime+elapsed
		if(self.alivetime>=1.0)then
			local maintank=self.scenario.cpus[1]
			if(self.context==1)then
				maintank=self.scenario.cpus[1]
			else
				print("XPRACTICE warning: unknown context for Desolate Blossom addspawn ("..tostring(self.context)..")")
			end
		
			local facebossangle=math.atan2(self.scenario.bosses[1].position.y-self.position.y,self.scenario.bosses[1].position.x-self.position.x)
			
			local minduration=1
			local maxduration=2
			local bigduration=3
			if(self.context>=1 and self.context<=3)then
				local smalladddurations=({9.0,11.0,18.0,21.0,15.0,20.0})
				minduration=smalladddurations[self.context*2-1]
				maxduration=smalladddurations[self.context*2]
				bigduration=({24.0,29.0,26.0})[self.context]
			end			
			
			for i=1,5 do
				local angle=math.pi*2/5*i
				local add=XPRACTICE.SARKARETH2.SmallAdd.new()
				add.scenario=self.scenario
				add.context=self.context
				add:Setup(self.environment,self.position.x+math.cos(angle)*2,self.position.y+math.sin(angle)*2)	
				add:FreezeOrientation(facebossangle)
				add.facetowardsmob=maintank
				add.duration=minduration+(maxduration-minduration)*(i-1)/4
			end
			local middleadd=BigAdd
			local add=XPRACTICE.SARKARETH2.BigAdd.new()	--TODO: if context is phase 3, middleadd=SmallAdd instead
			add.scenario=self.scenario
			add.context=self.context
			add:Setup(self.environment,self.position.x,self.position.y)							
			add:FreezeOrientation(facebossangle)
			add.facetowardsmob=maintank
			add.duration=bigduration
			
			self:Die()
		end
	end
end


do
	local super=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Murloc
	XPRACTICE.SARKARETH2.BigAdd=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.BigAdd

	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		self:CreateNameplates()
		
		local spell=XPRACTICE.SARKARETH2.Spell_EmptyStrike.new();spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.emptystrike=spell
		local spell=XPRACTICE.SARKARETH2.Spell_CosmicVolley.new();spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.cosmicvolley=spell					
		local spell=XPRACTICE.SARKARETH2.Spell_BlastingScream.new();spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.blastingscream=spell		
	end

	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.basemovespeed=14
		self.walkspeed=7.0
		self.defaultspeechbubbleduration=4.0
		
		self.autoattacktimer=nil
		self.autoattackspeed=2.0
		self.playername="Empty Recollection"
		-- Cosmic Volley: 2 sec cast, proper interrupt required
			-- at 0:03, 0:08, 0:12, 0:16, 0:21
		-- Empty Strike: 1 sec cast, unpreventable
			-- at 0:06.5, 0:19.5
		
		self.alwaysignorecollision=true
		self.dontremoveselfnameplates=true
		self.ignoremovementinterrupts=true
		
		--self.chaseradius=28
		self.chaseradius=0
		
		self.alivetime=0
		
		self.facetowardstank=nil
		
		self.yawchangeshufflethreshhold=0.02
		
		tinsert(self.scenario.tempobjs,self)
		tinsert(self.scenario.adds,self)
	end					
	
	function class:CreateNameplates()
		local nameplate=XPRACTICE.Nameplate.new()
		nameplate.hp_TEMP=1.0			
		nameplate:Setup(self.environment,self)			
		nameplate.scalemultiplier=0.25
		nameplate:SetText(self.playername)
		local castingbar=XPRACTICE.CastingBarTiny.new()
		castingbar:Setup(self.environment,0,0,0)
		castingbar.focus=self
		castingbar:AnchorToNameplate(nameplate)
		local mobclickzone=XPRACTICE.MobClickZone.new()
		mobclickzone:Setup(self.environment,self)
		self.nameplate=nameplate
		self.mobclickzone=mobclickzone
	end	
	
	function class:SetActorAppearanceViaOwner(actor)
		self.scale=1
		actor:SetModelByCreatureDisplayID(111768)
	end

		function class:SuggestDestination(destx,desty,reactiontime,suggestername)
			-- unlike murloc, adds do not ignore suggestions while player-controlled
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
	
	
	function class:Step(elapsed)
		super.Step(self,elapsed)			

		self.alivetime=self.alivetime or 0
		self.alivetime=self.alivetime+elapsed
		if(self.interrupttimer)then
			if(not self.combatmodule.castedspell)then
				self.interrupttimer=nil			
			else
				self.interrupttimer=self.interrupttimer-elapsed
				if(self.interrupttimer<=0)then
					self.interrupttimer=nil
					self.combatmodule:StopCastingCurrentSpell(self.localtime,self.combatmodule.castedspell)
				end
			end
		end

		local hp=math.max(0,(self.duration-self.alivetime)/self.duration)		
		self.nameplate.hp_TEMP=hp
		if(not self:IsDeadInGame())then
			if(self.firstcasttime and self.alivetime>=self.firstcasttime)then
				self.firstcasttime=nil
				QuickCast(self.combatmodule.spellbook.blastingscream,self.scenario,self)
			end
			if(self.secondcasttime and self.alivetime>=self.secondcasttime)then
				self.secondcasttime=nil
				QuickCast(self.combatmodule.spellbook.blastingscream,self.scenario,self)
			end
			self:BigAddCastSequenceCheck()
			if(hp<=0)then
				self.nameplate:Die()
				local aura=self.combatmodule:ApplyAuraByClass(XPRACTICE.Aura_DeadInGame,self.combatmodule,self.environment.localtime)	
				self.fadestarttime=self.environment.localtime+3.0
				self.expirytime=self.fadestarttime+2.0
			end
		end

		-- if(self==self.scenario.adds[1])then
			-- print("Add1:",self.destx,self.desty)
		-- end
	end
	function class:BigAddCastSequenceCheck()
		self.spellstage=self.spellstage or 1
		local timestamp=({3.0, 6.5, 8.0, 12.0, 16.0, 19.5, 21.0, 999.0})[self.spellstage]
		local whichspell=({"cosmicvolley","emptystrike","cosmicvolley","cosmicvolley","cosmicvolley","emptystrike","cosmicvolley"})[self.spellstage]
		if(self.alivetime>=timestamp)then
			QuickCast(self.combatmodule.spellbook[whichspell],self.scenario,self)
			self.spellstage=self.spellstage+1
		end
	end
	function class:StunMe()
		--do nothing!
	end
	

	
end




do
	local super=XPRACTICE.SARKARETH2.BigAdd
	XPRACTICE.SARKARETH2.SmallAdd=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.SmallAdd

	function class:SetCustomInfo()	
		super.SetCustomInfo(self)
		self.playername="Null Glimmer"
		self.firstcasttime=1.0;self.secondcasttime=999.0		
		-- Blasting Scream: 5 sec cast
			-- timing varies -- events at 3:10.595, 3:36.120, 4:21.139, 5:19.517, 6:43.074, 7:05.228
			-- 				that's approx 0:11, 0:07, 0:09, 0:09, (0:10 + 0:22)
			-- most casts get AOE CCed; only 7:05 gets interrupted (and 4 of the adds die instead)
		if(self.context>=1 and self.context<=5)then
			self.firstcasttime=({11.0,7.0,9.0,9.0,10.0})[self.context]
		end
		if(self.context==5)then
			self.secondcasttime=22.0
		end
		--print("Add casttime:",self.firstcasttime,self.secondcasttime)
		-- Mass CC effects at 3:12.303
		--   				  3:38.767
		--					  4:22.650
		--					  5:21.346
		--				      6:56.774
	end
	
	function class:SetActorAppearanceViaOwner(actor)
		self.scale=1
		actor:SetModelByCreatureDisplayID(111769)
	end	
	
	function class:BigAddCastSequenceCheck()
		-- do nothing!
	end	
	
	function class:StunMe()
		local aura=self.combatmodule:ApplyAuraByClass(XPRACTICE.Aura_LegSweep,self.combatmodule,self.localtime)	
	end
end







do	
	local super=XPRACTICE.Spell
	XPRACTICE.SARKARETH2.Spell_EmptyStrike=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.Spell_EmptyStrike
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.name="Empty Strike"
		self.icon="interface/icons/inv_misc_questionmark.blp"
		self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=1.0;self.basechannelduration=nil;self.basechannelticks=nil
	end	
	function class:CastingAnimationFunction(spellinstancepointer)	
		spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.SARKARETH2.AnimationList.Claws1)
	end
	function class:CompleteCastingAnimationFunction(spellinstancepointer)				
		spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.SARKARETH2.AnimationList.Claws2)
	end		
	-- cosmetic spell; not tracking tank status atm
end

do	
	local super=XPRACTICE.Spell
	XPRACTICE.SARKARETH2.Spell_CosmicVolley=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.Spell_CosmicVolley
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.name="Cosmic Volley"
		self.icon="interface/icons/inv_misc_questionmark.blp"
		self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=2.0;self.basechannelduration=nil;self.basechannelticks=nil
		self.interruptable=true
	end	
	function class:CastingAnimationFunction(spellinstancepointer)	
		spellinstancepointer.castercombat.mob.animationmodule:TryOmniSpellcast()
	end
	function class:CompleteCastingAnimationFunction(spellinstancepointer)				
		spellinstancepointer.castercombat.mob.animationmodule:TryCompleteOmniSpellcast()
	end		
	function class:StartCastingEffect(spellinstancepointer)
		spellinstancepointer.castercombat.mob.interrupttimer=1.0+math.random()*0.75
	end	
	-- cosmetic spell; CPU always interrupts
end

do	
	local super=XPRACTICE.Spell
	XPRACTICE.SARKARETH2.Spell_BlastingScream=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.Spell_BlastingScream
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.name="Blasting Scream"
		self.icon="interface/icons/inv_misc_questionmark.blp"
		self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=5.0;self.basechannelduration=nil;self.basechannelticks=nil
		self.interruptable=true
	end	
	function class:CastingAnimationFunction(spellinstancepointer)	
		spellinstancepointer.castercombat.mob.animationmodule:TryOmniSpellcast()
	end
	function class:CompleteCastingAnimationFunction(spellinstancepointer)				
		spellinstancepointer.castercombat.mob.animationmodule:TryCompleteOmniSpellcast()
	end		
	function class:StartCastingEffect(spellinstancepointer)
		spellinstancepointer.castercombat.mob.interrupttimer=3.0+math.random()*1.75
	end	
	-- cosmetic spell; CPU always interrupts (but prefers to stun)
end