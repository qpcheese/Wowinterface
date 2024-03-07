do
	XPRACTICE.SpellQueuePointer = {}
	local class=XPRACTICE.SpellQueuePointer
	class.__index = class
	function class.new()
		local self=setmetatable({}, class)
		return self
	end
	
	function class:Setup(spellbookspell,castercombat,targetcombat)
		self.spellbookspell=spellbookspell
		self.castercombat=castercombat
		self.targetcombat=targetcombat
		
		self.queue=true
	end
	
end