do
	local super=XPRACTICE.GameObject
	XPRACTICE.SARKARETH2.VoidEmpowermentOblivion=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.VoidEmpowermentOblivion
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.totalticks=0
		self.basetickrate=0.8
		--self.ticktimer=self.basetickrate		-- no.
		self.ticktimer=0						-- we create this obj at the timestamp where the first stack was applied.
	end
	function class:Step(elapsed)
		super.Step(self,elapsed)
		self.ticktimer=self.ticktimer-elapsed
		if(self.ticktimer<=0)then
			
			self.ticktimer=self.ticktimer+self.basetickrate
			for i=1,#self.scenario.allpcs do
				XPRACTICE.SARKARETH2.ApplyOblivion(self.scenario.allpcs[i],"intermission1")
			end
			self.totalticks=self.totalticks+1
			if(self.totalticks>=10)then self:Die() end
		end
	end
	

	
end