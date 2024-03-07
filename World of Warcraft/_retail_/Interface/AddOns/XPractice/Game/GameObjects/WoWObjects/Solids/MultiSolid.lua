do
	local super=XPRACTICE.GameObject
	XPRACTICE.MultiSolid=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.MultiSolid
	
	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		self.actors={}		
		self.modelsceneframe=environment.modelsceneframe
	end
	
	function class:AddActor(x,y,z,scale,yaw,pitch,roll)
		x=x or 0
		y=y or 0
		z=z or 0
		scale=scale or 1
		yaw=yaw or 0
		pitch=pitch or 0
		roll=roll or 0
		local a=XPRACTICE.ReusableModelSceneFrames:GetActor(self.modelsceneframe)		
		a:SetPosition(x/scale,y/scale,z/scale)
		a:SetScale(scale)
		a:SetYaw(yaw)
		a:SetPitch(pitch)
		a:SetRoll(roll)
		--a:SetModelByFileID(fileid)
		a:SetAlpha(1)
		a:Show()		
		tinsert(self.actors,a)
		
		--print("AddActor",x,y,z,scale,yaw)
		return a
	end
	
	function class:AddActorByClass(class,x,y,z,scale,yaw,pitch,roll)
		local a=self:AddActor(x,y,z,scale,yaw,pitch,roll)
		class.SetActorAppearanceViaOwner(self,a)
		return a
	end
	
	function class:AddActorByCreatureDisplayID(fileid,x,y,z,scale,yaw,pitch,roll)
		x=x or 0
		y=y or 0
		z=z or 0
		scale=scale or 1
		yaw=yaw or 0
		pitch=pitch or 0
		roll=roll or 0
		local a=XPRACTICE.ReusableModelSceneFrames:GetActor(self.modelsceneframe)		
		a:SetPosition(x/scale,y/scale,z/scale)
		a:SetScale(scale)
		a:SetYaw(yaw)
		a:SetPitch(pitch)
		a:SetRoll(roll)		
		a:SetAlpha(1)
		a:Show()		
		tinsert(self.actors,a)
		a:SetModelByCreatureDisplayID(fileid)
		
		--print("AddActor",x,y,z,scale,yaw)
		return a
	end		
	
	function class:AddActorByFileID(fileid,x,y,z,scale,yaw,pitch,roll)
		x=x or 0
		y=y or 0
		z=z or 0
		scale=scale or 1
		yaw=yaw or 0
		pitch=pitch or 0
		roll=roll or 0
		local a=XPRACTICE.ReusableModelSceneFrames:GetActor(self.modelsceneframe)		
		a:SetPosition(x/scale,y/scale,z/scale)
		a:SetScale(scale)
		a:SetYaw(yaw)
		a:SetPitch(pitch)
		a:SetRoll(roll)		
		a:SetAlpha(1)
		a:Show()		
		tinsert(self.actors,a)
		a:SetModelByFileID(fileid)
		
		--print("AddActor",x,y,z,scale,yaw)
		return a
	end	
	
	function class:Cleanup()
		for i=1,#self.actors do
			local actor=self.actors[i]
			--print("Cleanup multisolid",self,"actor",i,actor.frame,actor)
			XPRACTICE.ReusableModelSceneFrames:RemoveActor(actor.frame,actor)
		end
		self.actors={}
		self.dead=true
	end
end