do
	XPRACTICE.SpellInstancePointer = {}
	local class=XPRACTICE.SpellInstancePointer
	class.__index = class
	function class.new()
		local self=setmetatable({}, class)
		return self
	end
	
	
	function class:Setup(spellbookspell,castercombat,targetcombat)
		self.spellbookspell=spellbookspell
		self.castercombat=castercombat
		self.targetcombat=targetcombat
		self.castprogress=0
		self.channelprogress=0
		
		-- while nexttick starts at 1, "tick 0" can occur if spellbookspell.tickonchannelstart=true
		self.nextchanneltick=1
		
		self.instance=true
	end
	
	function class:ApplyCastProgress(elapsed)
		if(self:GetCastDuration()>0)then
			self.castprogress=self.castprogress+(elapsed/self:GetCastDuration())
		else
			self.castprogress=1
		end
	end
	
	function class:ApplyChannelProgress(elapsed)		
		if(self:GetChannelDuration()>0)then
			self.channelprogress=self.channelprogress+(elapsed/self:GetChannelDuration())
		else
			self.channelprogress=1
		end
		
		local nexttickpercent=self.nextchanneltick/self.spellbookspell.basechannelticks
		local safety=0
		while(self.channelprogress>=nexttickpercent and safety<100)do
			safety=safety+1
		--if(self.channelprogress>=nexttickpercent)then
			self.spellbookspell:OnChannelTick(self,self.nextchanneltick)
			self.nextchanneltick=self.nextchanneltick+1
			nexttickpercent=self.nextchanneltick/self.spellbookspell.basechannelticks
		end
		if(safety>=100)then
			--TODO: debug warning message
		end
	end

	function class:GetCastProgress()
		if(not self.castprogress) then self.castprogress=0 end
		
		return self.castprogress
	end
	
	function class:GetChannelProgress()
		if(not self.channelprogress) then self.channelprogress=0 end
		return self.channelprogress
	end
	
	function class:GetCastDuration()
		--TODO:
		return self.spellbookspell:GetCastDuration()
	end
	function class:GetChannelDuration()
		--TODO:
		return self.spellbookspell:GetChannelDuration()
	end
	
	function class:CompleteCasting(castendtime)
		self.spellbookspell:CompleteCasting(castendtime,self)		
	end
	function class:CompleteChanneling(channelendtime)
		self.spellbookspell:CompleteChanneling(channelendtime,self)
	end
		
	function class:IsInterruptable()
		return self.spellbookspell:IsInterruptable()
	end		
	
end