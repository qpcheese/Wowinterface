do
	--TODO: maybe rename to SpecialMovementTechnique
	local super=XPRACTICE.Aura
	XPRACTICE.Aura_ForcedMovement = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Aura_ForcedMovement

	function class:Setup(castercombat,targetcombat,localtime)
		--TEMP, move to sorting function
		super.Setup(self,castercombat,targetcombat,localtime)
		self.forcedmovementangle=0
		--self.currentduration=0
		self.backpedal=false
	end
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=0.500		
		self.forcedmovementspeed=26.367
		--TODO: as long as player is grounded, roll distance should be independent of framerate
		--self.totaldistance=25
	end
	
	function class:SetupNewauraLists(auramodule)
		super.SetupNewauraLists(self,auramodule)
		tinsert(self.auramodulelists,auramodule.forcedmovement)
	end
	
	function class:SetForcedMovementAngle(yaw)
		--print("Setting forced movement vector",x,y)
		self.forcedmovementangle=yaw
	end
	
	function class:GetForcedMovementAngle()
		return self.forcedmovementangle
	end
	
	function class:GetForcedMovementSpeed()
		return self.forcedmovementspeed
	end	
	

end