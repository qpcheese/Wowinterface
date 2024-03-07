do
	XPRACTICE.SpellFlash = {}
	local class=XPRACTICE.SpellFlash
	class.__index = class
	function class.new()
		local self=setmetatable({}, class)
		return self
	end
	
	function class:Setup(combatmodule,text,fillpercent,alpha,fillRGBA,flashRGBA)
		self.combatmodule=combatmodule
		self.combatmodule.spellflash=self
		self.text=text
		self.fillpercent=fillpercent
		-- On interrupt, alpha is set to 5 to allow "Interrupted" text to remain on screen longer.
		self.alpha=alpha
		self.fillRGBA=fillRGBA
		self.flashRGBA=flashRGBA
	end
	
	-- this step event is called from combatmodule:step
	function class:Step(elapsed)
		self.alpha=self.alpha-elapsed*4
		if(self.alpha<=0)then
			self.alpha=0
			self.combatmodule.spellflash=nil
		end
	end
	
end