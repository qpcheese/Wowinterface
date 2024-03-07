do
	XPRACTICE.Spell = {}
	local class=XPRACTICE.Spell
	class.__index = class
	function class.new()
		local self=setmetatable({}, class)
		return self
	end

	function class:Setup(castercombat, targetcombat, multitargetcombats)
		--WARNING: only castercombat is currently used.  targetcombat/multitargetcombats should be moved to SpellQueuePointer/SpellInstancePointer
		--print("A spell",self,"is setup with caster",castercombat)
		-- TODO: maybe rename caster to combat? (or just castercombat)
		--TODO: we should probably rename "caster" to "castercombat", etc
		self.castercombat=castercombat
		tinsert(self.castercombat.spellbook,self)
		-- TODO: target could be nil or a coordinate pair/triplet...
		self.targetcombat=targetcombat
		self.targetlocation=nil
		self.multitargetcombats=multitargetcombats
		
		self.offcooldowntime=nil
		self.nextrechargetime=nil

		--WARNING: the following comment is mostly obsolete, I think we use remainingcooldown instead now
		-- We also track when a spell first went on cooldown, in case the cooldown needs to be adjusted for changes to haste.
		-- Also, whenever a spell gains a charge, oncooldowntime is set to whenever nextrechargetime occurred.
		self.oncooldowntime=nil	
		self.remainingcooldown=nil
		self.remainingrecharge=nil
		self.applycooldownoncaststart=false
		self.caststarttime=nil
		self.castprogress=nil
		self.castendtime=nil
		self.channelstarttime=nil
		self.channelprogress=nil
		self.channelendtime=nil
		
		
		--TODO: replace with overridable function (see CreateProjectile function further down)
		self.projectileclass=nil
		
		-- Certain chain-cast boss spells break when you queue while casting
		--TODO: better system than this
		self.blockqueueingwhilecasting=false
		
		

		
		
		self:SetCustomInfo()	
		self:SetRechargeInfo()
		
		-- the following two are for debug, mostly.
		-- "queue" and "instance" don't do anything themselves,
		-- but we mark various instances of each spell to keep track of their intended use
		-- (and check that those spells have indeed been marked as such when it's time to use them)
		self.queue=false
		self.instance=false
	end

	-- TRAININGGROUNDS_SpellBossCastingStyle={}
	-- --TODO: TARGETLESS should probably be 0
	-- TRAININGGROUNDS_SpellBossCastingStyle.UNDEFINED=0
	-- TRAININGGROUNDS_SpellBossCastingStyle.CURRENTTARGET=1
	-- TRAININGGROUNDS_SpellBossCastingStyle.RANDOMRANGED=2
	-- TRAININGGROUNDS_SpellBossCastingStyle.TARGETLESS=3
	-- -- Spreads a debuff on as many players as possible, avoiding the tanks unless all other players are debuffed or dead. --TODO LATER: or out of range, maybe?
	-- TRAININGGROUNDS_SpellBossCastingStyle.SPREADDEBUFF_NONTANK=4

	function class:GetName()
		return self.name
	end
	function class:GetIcon()
		return self.icon
	end	

	function class:SetCustomInfo()
		-- Undecided whether facing will be enforced in TrainingGrounds.
		-- Even if facing isn't enforced,
		-- this attribute determines whether characters automatically turn to face their target.
		self.requiresfacing=true
		
		self.projectileclass=nil
		
		self.basecastduration=2.000
		self.basechannelduration=nil

		self.barRGBA={1,0.7,0,1}
		self.flashRGBA={1,1,0.5,1}
		self.hidecastbar=false

		self.name="Unnamed spell (you shouldn't see this)"
		self.icon="interface/icons/inv_misc_questionmark.blp"

		-- A basecooldown of 0 indicates no cooldown.
		-- By default, spells with multiple charges will regain charges at the same rate as basecooldown.
		-- Certain spells have a different recharge rate, which should be set in SetRechargeInfo.	
		self.basecooldown=0
		
		-- self.blockqueueingwhilecasting=true
		-- self.blockqueueingwhilechanneling=false
		
		self.basegcd=1.500
		self.respectsgcd=true
		
		--self.range=TRAININGGROUNDS_Mobile_ConvertYardsToTGUnits(40.0)
		self.range=nil
		self.melee=false	-- melee attacks measure edge-to-edge, ranged attacks measure center-toedge
							-- TG "melee range" is 2 yards
		--TODO: maybe this should default to true
		self.requirestarget=false
		
		self.usablewhilemoving=false		
		
		self.basechannelticks=4
		-- If tickonchannelstart is set to true, it provides an ADDITIONAL TICK on top of basechannelticks ("tick 0").
		self.tickonchannelstart=false
		
		self.cooldownrecoverymultiplier=1
		
		----TODO: move to TRAININGGROUNDS_Spell_Boss?
		--self.bosscastingstyle=TRAININGGROUNDS_SpellBossCastingStyle.CURRENTTARGET
		self.min_ranged=3
		self.num_targets=1
	end

	function class:SetRechargeInfo()
		-- spells which don't use "charges" should have a maxcharges of 1.
		-- If a spell shouldn't regain charges over time, set basecooldown to nil.
		self.maxcharges=1
		self.charges=self.maxcharges
		-- self.baserechargerate is not to be confused with self.cooldownrecoverymultiplier!
		self.baserechargerate=self.basecooldown
	end



	function class:Step(elapsed)
		if(self.remainingcooldown)then
			self.remainingcooldown=self.remainingcooldown-elapsed*self.cooldownrecoverymultiplier
			if(self.remainingcooldown<=0)then
				self.remainingcooldown=nil
			end
		end
		if(self.charges<self.maxcharges)then
			if(self.remainingrecharge)then
				self.remainingrecharge=self.remainingrecharge-elapsed*self.cooldownrecoverymultiplier
				if(self.remainingrecharge<=0)then
					self.charges=self.charges+1
					if(self.charges<self.maxcharges)then
						self.remainingrecharge=self.remainingrecharge+self.baserechargerate
					end
				end
			else
				self.remainingrecharge=self.baserechargerate-elapsed*self.cooldownrecoverymultiplier
			end
		else
			self.remainingrecharge=nil
		end
	end

	--TODO: TurnAtSpeed shouldn't stack if called multiple times per frame.
	-- 			Do something with targetfacing (but we're probably using a variable with that name already).



	function class:GetFinalOffCooldownTime()
		local offcooldowntime=self.offcooldowntime
		if(self.respectsgcd)then
			--print("respectsGCD check")
			--print("offgcdtime:",self.castercombat.offgcdtime)
			local offgcdtime=self.castercombat.offgcdtime		
			if(offgcdtime and self.offcooldowntime)then
				--print("self.offcooldowntime:",self.offcooldowntime)
				offcooldowntime=math.max(self.offcooldowntime,self.offgcdtime)
			else
				offcooldowntime=offgcdtime
			end
		end
		--print("final offcooldowntime:",offcooldowntime)
		return offcooldowntime
	end

	function class:ApplyGCD(currenttime)		
		self.castercombat.offgcdtime=currenttime+self.basegcd
		--print("GCD set to",self.castercombat.offgcdtime)
	end

	function class:GetCastDuration()
		--print("SP.Dur?",self.basecastduration)
		return self.basecastduration
	end

	function class:GetChannelDuration()
		return self.basechannelduration
	end
	


	function class:CalculateCastEndTime(caststarttime)	
		--print("SP.CCET",caststarttime,self:GetCastDuration())
		return caststarttime+self:GetCastDuration()
	end

	function class:CalculateChannelEndTime(channelstarttime)		
		return channelstarttime+self:GetChannelDuration()
	end
	
	function class:GetCastEndTime(currenttime)
		-- if instant cast, then currenttime will be 1 frame later than caststarttime
		-- so we use caststarttime instead
		if(self:GetCastDuration()==0)then
			return self.caststarttime
		end
		-- otherwise, calculate castendtime from castprogress
		local remainingtime=self:GetCastDuration()*(1-self:GetCastProgress())
		--print("GetCastEndTime:",currenttime,remainingtime)
		return currenttime+remainingtime
	end

	function class:GetChannelEndTime(currenttime)
		if(self:GetChannelDuration()==0)then
			return self.channelstarttime
		end
		local remainingtime=self:GetChannelDuration()*(1-self:GetChannelProgress())
		return currenttime+remainingtime
	end

	function class:IsUsableWhileMoving(spellinstancepointer)		
		return self.usablewhilemoving
	end

	-- --TODO: behavior set for existing channel, and means by which the two sets interact if they conflict

	--This behavior set affects THIS spell which we're trying to cast during another spell's channel.
	--New spell will interrupt the channel (unless channel clip is prohibited by combat module).  Standard behavior.
	XPRACTICE_CASTABLEWHILECHANNELBEHAVIOR_INTERRUPT=1
	--New spell will be cast at the same time as the channel.
	XPRACTICE_CASTABLEWHILECHANNELBEHAVIOR_SIMULTANEOUS=2
	--New spells cannot be cast at all during the channel (though they can be queued if channel is about to end).
	XPRACTICE_CASTABLEWHILECHANNELBEHAVIOR_PROHIBIT=3

	function class:CastableWhileChannelingBehavior()
		return XPRACTICE_CASTABLEWHILECHANNELBEHAVIOR_INTERRUPT
	end


	-- Returns nil if spell can be cast; otherwise returns error code.
	function class:CheckSpecialCastConditions(castercombat,targetcombat)
		--override; don't call super when overriding
		if(self.requirestarget and (not targetcombat))then
			--TODO: errorcode should be a class with humanreadable AND machinereadable feedback
			return "There is nothing to attack."
		end
		
		return nil
	end

	-- Returns nil if spell can be cast; otherwise returns error code.
	function class:CheckSpellRange(castercombat,targetcombat)
		if(self.range==nil)then return nil end
		
		local currentdist=castercombat.mob:GetSpellDistanceToMobile(targetcombat.mob,self)
		--print("SpellDistanceToMobile:",dist)
		local maxdist=self:GetFinalSpellRange(castercombat)
		--print("SpellRange:",maxdist)
		if(currentdist>maxdist)then 
			return "Out of range."
		end
		
		--override; don't call super when overriding
		return nil
	end

	function class:GetFinalSpellRange(castercombat)
		--TODO: check for auras that affect spell range
		return self.range
	end

	function class:IsInterruptable()
		return self.interruptable
	end



	function class:ConfirmQueue()
		-- by getting here without crashing, we've confirmed that self points to a valid Spell
		-- as long as we're here, label this as a queued spell	
		self.queue=true
	end

	function class:ConfirmInstance()
		-- by getting here without crashing, we've confirmed that self points to a valid Spell
		-- as long as we're here, label this as an instance
		self.instance=true
	end

	--TODO: potential shenanegans with queueing a spell with one target, but casting it on another target
	function class:NewQueue()	
		-- local spellinstance=self:Class().new()
		-- -- we're copying this spell from the main template, so we won't have a target yet.
		-- spellinstance:Setup(self.castercombat,nil)
		-- spellinstance:SetQueuedTarget()
		-- -- TODO: set queuespell's target somewhere
		-- spellinstance:ConfirmQueue()
		-- return spellinstance
		
		local spellqueuepointer=XPRACTICE.SpellQueuePointer.new()
		spellqueuepointer:Setup(self,self.castercombat,nil)
		self:SetQueuedTarget(spellqueuepointer)
		return spellqueuepointer		
	end

	function class:SetQueuedTarget(spellqueuepointer)
		-- some spells are untargeted even if the caster is targeting someone.
			-- in that case, override without calling super.
		if(spellqueuepointer.castercombat)then
			spellqueuepointer.targetcombat=spellqueuepointer.castercombat.targetcombat
		end
	end

	function class:NewCast(spellqueuepointer)
		local spellinstancepointer=XPRACTICE.SpellInstancePointer.new()
		spellinstancepointer:Setup(self,spellqueuepointer.castercombat,spellqueuepointer.targetcombat)
		--spellinstancepointer:ConfirmInstance()	
		return spellinstancepointer
	end

	---------------- Instance functions ----------------------
	function class:StartCasting(caststarttime,spellinstancepointer)
		--override; call super when overriding
		--print("StartCasting")
		if(self.applycooldownoncaststart==true)then
			self:ApplyCooldown()
		end		
		self.caststarttime=caststarttime
		self.castprogress=0
		self.castendtime=self:CalculateCastEndTime(caststarttime)
		--self:ApplyCastProgress(localtime-caststarttime)
		--print("StartCasting",self.caststarttime,self.castendtime)
		--TODO: GCD
		--self:BeginCastingAnimationFunction(spellinstancepointer)

		self:StartCastingEffect(spellinstancepointer)
		
	end
	
	function class:StartCastingEffect(spellinstancepointer)
		--override
	end
	
	function class:ApplyCooldown()
		--print("ApplyCooldown",self.charges,"Spellbookspell",self)
		
		--TODO: self:GetCurrentBaseCooldown()
		if(self.remainingcooldown==nil and self.basecooldown>0)then
			self.remainingcooldown=self.basecooldown
		end
		--TODO: self:GetCurrentBaseRechargeRate()
		if(self.baserechargerate>0)then
			self.charges=self.charges-1
			if(self.remainingrecharge==nil)then
				self.remainingrecharge=self.baserechargerate
			end
		end		
	end
	
	function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
		--override
	end

	function class:CompleteCasting(castendtime,spellinstancepointer)	
		--print("CompleteCasting")
		if(self.applycooldownoncaststart==false)then
			self:ApplyCooldown()
		end

		self:ApplyAutoAttackIfRelevant(castendtime)
		self:CompleteCastingEffect(castendtime,spellinstancepointer)
		if(self:GetChannelDuration())then
			self:StartChanneling(castendtime,spellinstancepointer)
		end

		self:CompleteCastingAnimationFunction(spellinstancepointer)
		if(self.requiresfacing)then
			--TODO: check animation's ENDCAST duration instead
			spellinstancepointer.castercombat.lockfacingendtime=spellinstancepointer.castercombat.localtime+1.000
			if(self.targetlocation)then
				spellinstancepointer.castercombat.lockfacinglocation=spellinstancepointer.targetlocation
				--TODO: combatmodule ignores lockfacinglocation/endtime if lockfacingendtime is invalid.  should it?
				spellinstancepointer.castercombat.lockfacinglocationendtime=spellinstancepointer.castercombat.localtime+1.000
			end
		end
		self:CreateSpellFlashCast(spellinstancepointer)
	end
	
	function class:CreateSpellFlashCast(spellinstancepointer)
		if(spellinstancepointer:GetCastDuration()>0)then
			local spellflash=XPRACTICE.SpellFlash.new()
			spellflash:Setup(spellinstancepointer.castercombat,self:GetName(),1,1,self.barRGBA,self.flashRGBA)		
		end
	end

	function class:CreateSpellFlashChannel(spellinstancepointer)
		if(spellinstancepointer:GetChannelDuration()>0)then
			local spellflash=XPRACTICE.SpellFlash.new()
			spellflash:Setup(spellinstancepointer.castercombat,self:GetName(),0,1,self.barRGBA,self.flashRGBA)	
		end
	end
	
	function class:CreateSpellFlashInterrupt(spellinstancepointer)	
		local spellflash=XPRACTICE.SpellFlash.new()
		spellflash:Setup(spellinstancepointer.castercombat,"Interrupted",1,5,{0.9,0,0,1},{0,0,0,0})
	end	
	
	
	function class:StartChanneling(channelstarttime,spellinstancepointer)
		spellinstancepointer.castercombat.channeledspell=spellinstancepointer
		--spellinstancepointer.channelstarttime=channelstarttime
		spellinstancepointer.channelprogress=0
		--self.channelendtime=self:CalculateChannelEndTime(channelstarttime)	--TODO: function
		--self:ApplyChannelProgress(localtime-channelstarttime)
		--print("StartChanneling",self.channelstarttime,self.channelendtime)
		--self:BeginChannelingAnimationFunction(spellinstancepointer)	--TODO: function
		
		self:StartChannelingEffect(spellinstancepointer)
		
		if(self.tickonchannelstart)then
			self:OnChannelTick(spellinstancepointer,0)
		end
		
	end
	
	function class:StartChannelingEffect(spellinstancepointer)
		--override
	end

	
	function class:OnChannelTick(spellinstancepointer,tickcount)
		--override
	end

	function class:ApplyAutoAttackIfRelevant(castendtime)
		--TODO: check if we should actually apply autocast
		--TODO: check current target
		--TODO: apply castendtime (may require rewriting autocastmodule)
		
		--self.castercombat:StartAttacking()
	end

	function class:CompleteCastingEffect(castendtime,spellinstancepointer)
		--TODO: MAYBE pass castendtime to projectile -- but probably not.	
		local projectile=self:CreateProjectile()			
	end

	function class:CompleteChanneling(channelendtime,spellinstancepointer)
		--TODO:	NYI
		--print("CompleteChanneling",channelendtime)
		
		self:CompleteChannelingAnimationFunction(spellinstancepointer)
		self:CompleteChannelingEffect(channelendtime,spellinstancepointer)
		self:CreateSpellFlashChannel(spellinstancepointer)		
	end

	function class:CompleteChannelingEffect(castendtime,spellinstancepointer)
		--override
	end


	function class:StopCasting(caststoptime,spellinstancepointer)
		--TODO:	NYI
		self:CreateSpellFlashInterrupt(spellinstancepointer)
	end

	function class:StopChanneling(channelstoptime,spellinstancepointer)
		--TODO:	NYI
		self:CreateSpellFlashInterrupt(spellinstancepointer)
	end



	function class:CreateProjectile()

		--override if spell uses multiple projectiles or is otherwise nonconventional.
		
		-- not all spells have projectiles.
		if(self.projectileclass)then
			local projectiles={}
			local projectile
			if(self.multitargetcombats==nil)then
				projectile=self.projectileclass.new()
				tinsert(projectiles,projectile)
				--
			else
				for i=1,#self.multitargetcombats do
					projectile=self.projectileclass.new()
					tinsert(projectiles,projectile)
				end
			end
			
			for i=1,#projectiles do
				projectile:Setup(self.castercombat.mob.environment,self)			
				projectile.position.x=self.castercombat.mob.position.x
				projectile.position.y=self.castercombat.mob.position.y
				--TODO: get x+y+z offsets from caster's modelinfo
				projectile.position.z=50
			end
			
			

		end
		
	end

	function class:CastingAnimationFunction(spellinstancepointer)
		--TODO: not sure whether baseline should have animation or not
		--self.castercombat.mob.animationmodule:TryDirectedSpellcast()
		
		-- do nothing
	end

	function class:CompleteCastingAnimationFunction(spellinstancepointer)
		--print("TRAININGGROUNDS_Spell: TryCompleteDirectedSpellcast")
		
		spellinstancepointer.castercombat.mob.animationmodule:TryCompleteDirectedSpellcast()
	end

	function class:ChannelingAnimationFunction(spellinstancepointer)
		--TODO:
		-- do nothing?
	end
	
	function class:CompleteChannelingAnimationFunction(spellinstancepointer)
		--TODO:
		-- do nothing?
	end

	function class:ExecuteSpellEffect(projectile)
		--override
	end

	function class:GetBossTarget()
		--override
		--TODO: maybe move to TRAININGGROUNDS_BossSpell
		
	end





	do
		--TODO: pass localtime to function
		function XPRACTICE.TEMP_CastSpellOnTargetMobile(castermobile,spellclass,targetmobile)
			--TODO: not recommended to use this; spells are designed to be queued from an instance of a spell in the caster's spellbook	
								-- which (among other things) have had Setup run on them
		

		
			local targetcombat=nil
			if(targetmobile)then
				targetcombat=targetmobile.combatmodule
			end
			
			--TODO: combatmodule:SetTarget (and fix everything it breaks)		
			castermobile.combatmodule.targetcombat=targetcombat
			
			local queuepointer=spellclass:NewQueue()
			queuepointer.castercombat=castermobile.combatmodule
			queuepointer.targetcombat=targetcombat
			--print("Targetcombat:",queuespell.targetcombat)
			local errorcode=castermobile.combatmodule:TryQueue(queuepointer)
			
			return queuepointer
		end
	end

end