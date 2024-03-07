
do
	XPRACTICE.CombatModule_QueueTolerance=(400)/1000.0

	XPRACTICE.CombatModule = {}
	local class=XPRACTICE.CombatModule
	class.__index = class

	function class.new()
		local self=setmetatable({}, class)
		return self 
	end
	
	function class:Setup(mob)
		self.mob=mob	
		self.auras=XPRACTICE.AuraModule.new()
		self.auras:Setup(self)	
		self.spellbook={}	--TODO: maybe XPRACTICE.Spellbook?
		self.targetmob=nil
		self.autoattacking=false
		self.nextMHautoattack=nil
		self.nextOHautoattack=nil
		self.localtime=0
		self.queuetime=nil
		self.queuedspell=nil	
		self.castedspell=nil
		self.channeledspell=nil		
		-- "Spell flash" is used by castingbar to indicate a completed or interrupted spell.
		self.spellflash=nil
		
		self.combatlog=mob.environment.game.scenario.combatlog
		
		self.queuetolerance=XPRACTICE.CombatModule_QueueTolerance
	end
	
	function class:SetTargetMob(mob)
		self.targetmob=mob
		if(mob==nil)then
			self:StopAutoAttacking()
		end
	end
	
	function class:StartAutoAttacking()
		self.autoattacking=true
	end
	function class:StopAutoAttacking()
		self.autoattacking=false
	end
	
	function class:HasMHAutoAttack()
		--TODO: NYI HasMHAutoAttack()
		--return true
		return false
	end
	function class:HasOHAutoAttack()
		--TODO: NYI HasOHAutoAttack()
		return false
	end	
	
	
	-- TODO:
	function class:DontClipChannels()
		--This setting only prevents clipped channels at the very end of the channel.
		return true	
	end

	
	function class:Step(elapsed)
		local localtime=self.mob.environment.localtime
		self.localtime=localtime
		
		for i=1,#self.spellbook do
			-- update cooldowns and charges
			self.spellbook[i]:Step(elapsed)
		end
		
		if(self.targetmob and (self.targetmob.targetable==false or self.targetmob.dead))then
			self:SetTargetMob(nil)
		end
				
		
		if(self.autoattacking)then
			if(self:HasMHAutoAttack())then
				if(not self.nextMHautoattack)then
					self.nextMHautoattack=localtime
				end
				if(localtime>=self.nextMHautoattack)then
					self.nextMHautoattack=self.nextMHautoattack+2.60
					--TODO: don't autoattack while casting or channeling
					self.mob.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Attack1H)
				end
			end
		else
			if(self.nextMHautoattack and localtime>=self.nextMHautoattack)then
				self.nextMHautoattack=nil
			end
			if(self.nextOHautoattack and localtime>=self.nextOHautoattack)then
				self.nextOHautoattack=nil
			end			
		end
		
		
		
		
		--queuetime checks are not necessary unless a spell is queued
		local castendtime=nil
		local channelendtime=nil
		local offcooldowntime=nil
		local queuetime=nil
		
		--apply progress based on time since last frame
		if(self.castedspell)then
			self.castedspell:ApplyCastProgress(elapsed)
		end
		if(self.channeledspell)then
			self.channeledspell:ApplyChannelProgress(elapsed)
		end		
		
		
		queuetime=self.localtime	
		
		
		--Before casting the queued spell, resolve the current casted/channeled spell if it exists
		-- and reset castendtime/channelendtime if applicable
		if(self.castedspell and self.castedspell:GetCastProgress()>=1)then
			if(self.mob.scenario and self.mob.scenario.multiplayer and self.mob.scenario.player==self.mob)then
				self.castedspell.spellbookspell:SendCompleteCastingMultiplayer(localtime,self.castedspell)
			end
			self:CompleteCastingCurrentSpell(localtime,self.castedspell)	
		end
		if(self.channeledspell and self.channeledspell:GetChannelProgress()>=1)then
			self:CompleteChannelingCurrentSpell(localtime,self.channeledspell)
		end	

		if(self.castedspell)then
			if(not self.castedspell.spellbookspell:IsUsableWhileMoving(self.castedspell))then
				if(self.mob:IsMoving())then
					if(not self.mob.ignoremovementinterrupts)then
						self:StopCastingCurrentSpell(localtime,self.castedspell)
					end
				end
			end
		end		
		if(self.channeledspell)then
			if(not self.channeledspell.spellbookspell:IsUsableWhileMoving(self.channeledspell))then
				if(self.mob:IsMoving())then
					if(not self.mob.ignoremovementinterrupts)then
						self:StopChannelingCurrentSpell(localtime,self.channeledspell)
					end
				end
			end
		end
		
		
		if(self.queuedspell)then			
			--TODO: ignore all checks if we call from boss override
			if(self.localtime>self.queuedspell.queuetime+self.queuetolerance)then
				--spell timed out in queue
				self.queuedspell=nil
			else
				local errorcode
				errorcode=self:BlockingErrorCheck(self.queuedspell)
				if(not errorcode)then				
					errorcode=self:NonblockingErrorCheck(self.queuedspell)
					if(not errorcode)then
						local spellinstance=self.queuedspell.spellbookspell:NewCast(self.queuedspell)
						spellinstance.targetcombat=self.queuedspell.targetcombat						
						--print("Start casting at time",queuetime)
						--print("Copying args:",self.queuedspell.args,#self.queuedspell.args)
						spellinstance.args=self.queuedspell.args
						spellinstance.spellbookspell:StartCasting(localtime,spellinstance)													
						self.castedspell=spellinstance	
						--print("Casting spell:",spellinstance,"at time",queuetime,"(local time",self.localtime..")")
						self.queuedspell=nil							
					else
						--print("Nonblocking error",errorcode)
						-- do not set queuedspell to nil, try again next frame
					end
				else
					--print("Spell queued, but blocking error",errorcode)
					self.queuedspell=nil
				end
			end
		end
		
		if(self.spellflash)then
			self.spellflash:Step(elapsed)
			-- spellflash will remove itself (during its own step event) when its alpha reaches 0
		end
	end
	
	
	-- "Nonblocking errors" block spellcasts but not spellqueues
	-- e.g. spell cooldown or cast already in progress.
	function class:NonblockingErrorCheck(spellqueuepointer)
		--TODO: check if queuespell is castable while casting
		if(self.castedspell)then
			return "You are busy doing something else"
		end
		--print("Spellbookspell",spellqueuepointer.spellbookspell)
		--print("Cooldown:",spellqueuepointer.spellbookspell.remainingcooldown)
		--print("Charges:",spellqueuepointer.spellbookspell.charges)
		if(spellqueuepointer.spellbookspell.remainingcooldown~=nil)then
			return "ERROR_CODE_SPELL_ON_COOLDOWN"
		end
		if(spellqueuepointer.spellbookspell.charges<=0)then
			return "ERROR_CODE_SPELL_RECHARGING"
		end
		
		-- if(self.channeledspell)then
			-- return "You are busy doing something else"
		-- end	
		return nil
	end
	
	-- "Blocking errors" prevent both spellcasts and spellqueues
	-- e.g. movement, resources, facing, range, etc
	function class:BlockingErrorCheck(spellqueuepointer)
		--TODO: clean up messy logic tree (logic is correct, but messy)
		
		if(not spellqueuepointer.spellbookspell:IsUsableWhileMoving())then
			if(self.mob:IsMoving())then
				return "Can't do that while moving"
			end
		end
		
		local errorcode=nil
		errorcode=spellqueuepointer.spellbookspell:CheckSpecialCastConditions(self,spellqueuepointer.targetcombat)
		
		if(not errorcode)then
			errorcode=spellqueuepointer.spellbookspell:CheckSpellRange(self,spellqueuepointer.targetcombat)
		end

		--TODO: check facing

		--TODO: AI needs to hear about errorcodes (especially "Out of range.")
		return errorcode		
	end
	
	function class:TryQueue(spellqueuepointer)
		if(not spellqueuepointer.queue)then
			error("Tried to queue a non-queue instance of a spell")
			return
		end	
		
		local errorcode
		errorcode=self:BlockingErrorCheck(spellqueuepointer)
		if(not errorcode)then
			--queue the spell
			--print("...OK to queue")
			self.queuedspell=spellqueuepointer
			self.queuedspell.queuetime=self.localtime
			return nil		
		end
		return errorcode		
	end
	
	
	
	-- -- In order to queue a spell, the player must have resources available at the time TryQueue is called.
	-- -- If the resources would only become available by the time the spell is cast, TryQueue will fail.
	-- -- Returns nil if spell queued successfully; otherwise returns error code.
	-- function class:TryQueue(queuespell)
		-- -- if(self.castedspell)then
			-- -- if(self.castedspell.blockqueueingwhilecasting)then
				-- -- return "You are busy doing something else"
			-- -- end
		-- -- end
		-- -- if(self.channeledspell)then
			-- -- if(self.channeledspell.blockqueueingwhilechanneling)then
				-- -- return "You are busy doing something else"
			-- -- end
		-- -- end	
		-- if(not queuespell:IsUsableWhileMoving())then
			-- if(self.mob:IsMoving())then
				-- return "Can't do that while moving"
			-- end
		-- end
		-- if(not queuespell.queue)then
			-- error("Tried to queue a non-queue instance of a spell")
			-- return
		-- end
		-- local spellstatuserrorcode=self:CheckSpellQueueableStatusExceptCooldown(queuespell)
		-- if(not spellstatuserrorcode)then
			-- --print("Timing check...")
			-- local timingerrorcode=self:CheckTryQueueSpellTimingOK(queuespell)
			-- if(not timingerrorcode)then
				-- --queue the spell
				-- --print("...OK to queue")
				-- self.queuedspell=queuespell
				-- self.queuedspell.queuetime=self.localtime
				-- return nil
			-- else
				-- return timingerrorcode
			-- end
		-- else
			-- return spellstatuserrorcode
		-- end	
	-- end
	
	-- function class:CheckTryQueueSpellTimingOK(queuespell)
		-- local errorcode=nil
		-- if(queuespell.remainingcooldown and queuespell.remainingcooldown>self.queuetolerance)then
			-- errorcode="XPRACTICE_ERRORCODE_COOLDOWN"
		-- end
		-- return errorcode
	-- end
	
	
	-- -- Returns nil if spell is OK to cast; otherwise returns error code.
	-- function class:CheckSpellQueueableStatusExceptCooldown(queuespell)
		-- --TODO: check resources
		-- --TODO: check valid target
		-- local errorcode=nil
		
		-- errorcode=queuespell:CheckSpecialCastConditions(self,queuespell.targetcombat)
		
		-- if(not errorcode)then
			-- errorcode=queuespell:CheckSpellRange(self,queuespell.targetcombat)
		-- end
		
		-- -- if(not errorcode)then
			-- -- spell:CheckSpellRange(spell.
		-- -- end
		
		-- --TODO: AI needs to hear about errorcodes (especially "Out of range.")
		-- return errorcode
	-- end
	

	--TODO: decide if we check if spell exists here, or before calling function
	-- (currently before calling function)
	function class:CompleteCastingCurrentSpell(castendtime,spellinstancepointer)
		--print("CombatModule calling CompleteCastingCurrentSpell, castendtime",castendtime)

					--TODO: for the purposes of this training program, maybe only boss spells need to trigger this event?
					--TODO: timestamps in combatlog events
					--TODO: also report STOP_CASTING
					self.combatlog:RecordEvent({
								action=XPRACTICE.CombatEventType.COMPLETE_CASTING,
								caster=self,
								subject=self.castedspell.spellbookspell:Class(),
								target=self.castedspell.targetcombat
								})		
								
		self.castedspell:CompleteCasting(castendtime,spellinstancepointer)
		self.castedspell=nil

	end
	function class:CompleteChannelingCurrentSpell(channelendtime,spellinstancepointer)
		self.channeledspell:CompleteChanneling(channelendtime,spellinstancepointer)
		self.channeledspell=nil
			--TODO: do we report COMPLETE_CASTING, COMPLETE_CHANNELING, or both?
	end
	function class:StopCastingCurrentSpell(caststoptime,spellinstancepointer)
		self.castedspell.spellbookspell:StopCasting(caststoptime,spellinstancepointer)
		self.castedspell=nil
	end
	function class:StopChannelingCurrentSpell(channelstoptime,spellinstancepointer)
		self.channeledspell.spellbookspell:StopChanneling(channelstoptime,spellinstancepointer)
		self.channeledspell=nil
	end
	
	
	--called during aura.setup; adds an instance to the newauras list
	-- NOT TO BE CONFUSED WITH ApplyAura, which creates a new aura from scratch
	-- TODO: name change
	-- TODO: disambiguate with ApplyAuraByClass below
	function class:AddNewAura(aura)
		--print("CombatModule:AddNewAura",self.auramodule,self.auramodule.newauras)
		tinsert(self.auras.newauras,aura)
	end
	
	
	--TODO: ApplyAuraByClass needs a localtime parameter, and/or maybe don't apply auras until the following frame (like gameobjects)
	--TODO: actually do something with the localtime parameter
	function class:ApplyAuraByClass(auraclass, castercombat, localtime)
		-- if(not castercombat)then
			-- error("Assertion failed: applied aura's castercombat was unspecified or nil")
		-- end

		local aurainstance=(auraclass).new()
		aurainstance.castercombat=castercombat
		-- must use target's localtime instead of caster's
		-- (remember, localtime starts from 0 at combatmodule.setup)
		--TODO: do we instead need to calculate a new time relative to global?
		--TODO: localtime is lagging one frame behind spell's castendtime
		aurainstance:Setup(castercombat,self,self.localtime)	--TODO: this is where we would use the localtime parameter
		
		--TODO: check whether aura stacks or ignites
		
		--print("AURA_APPLIED:",TRAININGGROUNDS_CombatEventType.AURA_APPLIED)	
		
		--TODO: rewrite combatlog reference so it's clear that "self.combatlog" is a pointer to scenario's combatlog
		self.combatlog:RecordEvent({
									action=XPRACTICE.CombatEventType.AURA_APPLIED,
									subject=auraclass,
									target=self
									})
		
		return aurainstance
		
		--print("VoidZone: created aura")
	end
	
	
	function class:Cleanup()
		--TODO: cleanup
	end
end