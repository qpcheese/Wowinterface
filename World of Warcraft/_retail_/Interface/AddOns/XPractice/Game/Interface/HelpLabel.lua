do
	local super=XPRACTICE.LeftAlignedLabel
	XPRACTICE.HelpLabel=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.HelpLabel
			
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.remainingduration=0
		self.alpha=1
	end
	
	function class:OnClick()
		if(self.alpha>0)then
			self.alpha=0
		else
			self.alpha=1
		end
	end
	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		if(self.environment.game.keys.esc.pressed)then
			self.alpha=0
		end
	end
end

do 
	local super=XPRACTICE.Spell
	XPRACTICE.Spell_Help=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Spell_Help
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.name="(Help)"
		self.icon="interface/icons/inv_misc_questionmark.blp"
		self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=nil;self.basechannelticks=nil
	end
			
	function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
		local mob=spellinstancepointer.castercombat.mob
		local scenario=mob.scenario		
		if(scenario.helplabel)then
			scenario.helplabel:OnClick()
		end
	end
end	