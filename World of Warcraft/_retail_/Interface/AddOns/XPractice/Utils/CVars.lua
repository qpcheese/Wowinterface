do
	--TODO LATER: does RestartGx help us anywhere (not necessarily here)
	
	-- TODO LATER: cvar override makes a fairly strong case for xpractice to be a singleton class
 	_XPRACTICE_CVars = {}
	local class=_XPRACTICE_CVars
	class.__index = class	
	
	function class.new()
		local self=setmetatable({}, class)
		return self
	end
	
	function class:Setup()
		self.cvarnames={}
		tinsert(self.cvarnames,"scriptErrors")
		tinsert(self.cvarnames,"enableMouseSpeed")
		tinsert(self.cvarnames,"mouseSpeed")
		tinsert(self.cvarnames,"mouseInvertPitch")
		tinsert(self.cvarnames,"mouseInvertYaw")
		tinsert(self.cvarnames,"cameraYawMoveSpeed")
		tinsert(self.cvarnames,"lossOfControl")
		tinsert(self.cvarnames,"lossOfControlFull")
		tinsert(self.cvarnames,"violenceLevel")
		self.cvarvalues={}
	end
	
	function class:SaveAll()
		for i=1,#self.cvarnames do
			local cvarname=self.cvarnames[i]			
			self.cvarvalues[cvarname]=GetCVar(cvarname)
			--print("Saving",cvarname,self.cvarvalues[cvarname])
		end
	end
	
	function class:Override(cvarname,value)
		SetCVar(cvarname,value)
	end
	
	function class:Restore(cvarname)
		--print("Restoring",cvarname,self.cvarvalues[cvarname])
		SetCVar(cvarname,self.cvarvalues[cvarname])
	end
	
	function class:RestoreAll()
		for i=#self.cvarnames,1,-1 do
			local cvarname=self.cvarnames[i]
			--print("Restoring",cvarname,self.cvarvalues[cvarname])
			SetCVar(cvarname,self.cvarvalues[cvarname])
		end	
	end
	
	XPRACTICE.CVars=_XPRACTICE_CVars.new()
	XPRACTICE.CVars:Setup()
	
end
