do
	local super=XPRACTICE.Spell
	XPRACTICE.Spell_Test1 = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Spell_Test1

	function class:SetCustomInfo()
		super.SetCustomInfo(self)

		self.requiresfacing=false		
		self.projectileclass=nil		
		self.basecastduration=2.0
		self.basecooldown=3.0
			
	end

	function class:GetName()
		return "Spell Test 1"
	end	
	
	function class:CompleteCastingEffect(castendtime)
		-- TODO:	
	end
	
	function class:CompleteCastingAnimationFunction(spellinstancepointer)
		--print("TRAININGGROUNDS_Spell: TryCompleteDirectedSpellcast")
		if(not spellinstancepointer.castercombat.mob.backpedal)then
			spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ROLL_BEGIN_LOOP)
		else
			spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ROLL_LOOP)
		end
	end	
		
end