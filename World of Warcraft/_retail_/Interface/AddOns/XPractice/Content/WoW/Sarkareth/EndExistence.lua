do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SARKARETH2.Spell_EndExistence=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.Spell_EndExistence
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="End Existence"
			self.icon="interface/icons/inv_misc_questionmark.blp"
			self.requiresfacing=false;self.projectileclass=nil;
			self.basecastduration=15.0;self.basechannelduration=nil;
			self.basechannelticks=10.0
			self.basecooldown=0.0
			self.usablewhilemoving=true			
			self.interruptable=true
		end
		function class:CastingAnimationFunction(spellinstancepointer)				
			spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ReadySpellOmni)
		end		
		--TODO: complete casting effect == raid wipe (but this shouldn't happen if CPU1 is always tank)
	end	

end