do
	local super=XPRACTICE.Label
	XPRACTICE.FadingLabel=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.FadingLabel
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.remainingduration=0
		self.alpha=0
	end
	
	function class:SetText(text,duration)
		self.displayobject.drawable.fontstring:SetText(text)
		if(text~="")then self.alpha=1 else self.alpha=0 end
		self.remainingduration=duration
	end	
	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		if(self.remainingduration~=nil)then
			if(self.remainingduration>0)then
				self.remainingduration=self.remainingduration-elapsed
				if(self.remainingduration<=0)then
					self.remainingduration=0		
				end			
			else
				if(self.alpha>0)then
					self.alpha=self.alpha-elapsed
					if(self.alpha<=0)then
						self.alpha=0
					end
				end
			end
		end
	end

end

