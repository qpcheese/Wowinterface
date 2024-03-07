do	
	XPRACTICE.CombatLog={}
	local class=XPRACTICE.CombatLog
	class.__index = class
	local class=class
	function class.new()
		local self=setmetatable({}, class)	
		return self
	end	
	
	function class:Setup(scenario)
		self.scenario=scenario
		self.groupdancemodules={}
	end
	
	function class:RecordEvent(event)
		--TODO: right now we're only calling modules; actually record the event somewhere
		for i=1,#self.groupdancemodules do
			local groupdancemodule=self.groupdancemodules[i]
			groupdancemodule:ReactToCombatEvent(event)			
		end
	end	
	
	
end	