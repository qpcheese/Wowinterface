do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.SARKARETH2.Spell_VoidEmpowerment=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.Spell_VoidEmpowerment
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Void Empowerment"
			self.icon="interface/icons/inv_misc_questionmark.blp"
			self.requiresfacing=false;self.projectileclass=nil;
			self.basecastduration=0.0;self.basechannelduration=8.0;
			--print("SVE.BCD",self.basecastduration)
			self.basechannelticks=10.0
			self.basecooldown=0.0
			self.usablewhilemoving=true		

		end
		function class:ChannelingAnimationFunction(spellinstancepointer)				
			--spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.SARKARETH2.AnimationList.FlyReadySpellOmni)
			spellinstancepointer.castercombat.mob.animationmodule:PlayAnimation(XPRACTICE.SARKARETH2.AnimationList.CustomSpell04)
		end		
	end	

end