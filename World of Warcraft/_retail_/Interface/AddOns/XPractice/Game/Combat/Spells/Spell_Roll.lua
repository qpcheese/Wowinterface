--TODO: possibly move Roll to an external Content folder

do
	local super=XPRACTICE.Spell
	XPRACTICE.Spell_Roll = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Spell_Roll

	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.name="Roll"
		self.icon="interface/icons/ability_monk_roll.blp"

		self.requiresfacing=false		
		self.projectileclass=nil		
		self.basecastduration=0
		self.usablewhilemoving=true
		--TODO: 20s cooldown
		self.basecooldown=1.5
		--self.basecooldown=1.25
		--TODO: 0.5s internal cooldown, lock other spells while rolling
			-- (spells don't display GCD swirl in WoW)
			
	end

	function class:CompleteCastingEffect(castendtime,spellinstancepointer)
		local rollaura=XPRACTICE.Aura_Roll.new()
		rollaura:Setup(spellinstancepointer.castercombat,spellinstancepointer.castercombat,castendtime)
		
		local x,y=spellinstancepointer.castercombat.mob.attemptedmovementunitvector.x,spellinstancepointer.castercombat.mob.attemptedmovementunitvector.y
		local yaw=nil
		if(x==0 and y==0)then
			yaw=spellinstancepointer.castercombat.mob.orientation.yaw
			--x=math.cos(self.castercombat.mob.orientation.yaw)
			--y=math.sin(self.castercombat.mob.orientation.yaw)
			--x=cos(self.castercombat.owner.currentfacing)
			--y=sin(self.castercombat.owner.currentfacing)
		else
			yaw=math.atan2(spellinstancepointer.castercombat.mob.attemptedmovementunitvector.y,spellinstancepointer.castercombat.mob.attemptedmovementunitvector.x)
			--print("Roll vector:",x,y)
		end
		
		rollaura:SetForcedMovementAngle(yaw)
		rollaura.backpedal=spellinstancepointer.castercombat.mob.backpedal
		--print("SetForcedMovementAngle",yaw)
	end
	
	function class:CompleteCastingAnimationFunction(spellinstancepointer)
		--print("TRAININGGROUNDS_Spell: TryCompleteDirectedSpellcast")
		if(not spellinstancepointer.castercombat.mob.backpedal)then
			spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ROLL_BEGIN_LOOP)
		else
			spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ROLL_LOOP)
		end
	end	


	function class:SendCompleteCastingMultiplayer(localtime,spellinstance)
		local mob=spellinstance.castercombat.mob
		mob.scenario.multiplayer:SendRoll()
	end
	
	
end