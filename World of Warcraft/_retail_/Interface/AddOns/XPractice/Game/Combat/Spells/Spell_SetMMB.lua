do
	do	
		local super=XPRACTICE.Spell
		XPRACTICE.Spell_SetMMB=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.Spell_SetMMB
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="(Set MMB)"
			self.icon="interface/icons/inv_misc_questionmark.blp"
			self.issetmmb=true
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
			self.usablewhilemoving=true
		end
				
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario					
			if(not scenario.setmmbmode)then
				scenario.setmmbmode=true
				scenario.statuslabel:SetText("Click a spell icon to assign it to middle mouse button,\nor click this button again to cancel.",5.0)
			else
				scenario.setmmbmode=false
				scenario.statuslabel:SetText("Canceled MMB assignment mode.",2.0)
			end
		end
	end	
end