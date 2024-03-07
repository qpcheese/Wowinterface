do
	local super=XPRACTICE.Aura
	XPRACTICE.MULTIPLAYERV2.Aura_DeathGrip_RoleChange = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.MULTIPLAYERV2.Aura_DeathGrip_RoleChange
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.start={x=self.targetcombat.mob.position.x,y=self.targetcombat.mob.position.y,z=self.targetcombat.mob.position.z}
		--self.destination={x=0,y=0,z=0}
		self.destination={x=self.castercombat.mob.position.x,y=self.castercombat.mob.position.y,z=self.castercombat.mob.position.z}
		--self.baseduration=0.375
		self.baseduration=1.0
		--self.baseduration=2.0 --!!!
	end
	
	function class:SetupNewauraLists(auramodule)
		super.SetupNewauraLists(self,auramodule)
		tinsert(self.auramodulelists,auramodule.grip)
		tinsert(self.auramodulelists,auramodule.ignorewalls)
	end
	
	function class:GetGripPosition()
		local denominator=(self.expirytime-self.starttime)
		if(denominator<=0)then denominator=0.1 end
		local ratio=(self.targetcombat.localtime-self.starttime)/denominator
		
		local x=self.start.x+(self.destination.x-self.start.x)*ratio
		local y=self.start.y+(self.destination.y-self.start.y)*ratio
		
		local t=ratio*math.pi
		local z=self.start.z+(self.destination.z-self.start.z)*ratio+math.sin(t)*5.0
		return x,y,z
	end

	function class:OnExpiry()
		super.OnExpiry(self)
		self.targetcombat.mob.velocity.x=0
		self.targetcombat.mob.velocity.y=0
		self.targetcombat.mob.velocity.z=0
		self.targetcombat.mob.position.x=self.destination.x
		self.targetcombat.mob.position.y=self.destination.y
		self.targetcombat.mob.position.z=self.destination.z
		self.targetcombat.mob:Die()
	end

end