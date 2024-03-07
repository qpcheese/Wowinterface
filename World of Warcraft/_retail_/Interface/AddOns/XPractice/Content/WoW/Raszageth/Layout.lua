do
	local super=XPRACTICE.GameObject
	XPRACTICE.RASZAGETH.Layout=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.RASZAGETH.Layout
	

	
	function class:Setup(environment,x,y,z)
		--local DEBUG_VLINES=true
		local DEBUG_VLINES=false
		super.Setup(self,environment,x,y,z)
		self.edgelines={}		
		self.walllines={}		
		self.permanentedgelines={}
		self.innerwalllines={}	-- only when z<0
		self.outerwalllines={}	-- only when z>0 AND pylon is up	
		
		
	end
	
	function class:EdgelineCheck(yoffset)		
		return true
	end

	
	
end