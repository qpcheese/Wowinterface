do
	local super=XPRACTICE.WoWObject
	XPRACTICE.Line=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Line
	
	function class:Setup(environment,x1,y1,z1,x2,y2,z2)
		self.particlexoffset=0
		self.particleyoffset=0
		self.fileid=0
		
		super.Setup(self,environment,x1,y1,z1)

		self.linesegment={}

		self.linesegment.x1=x1
		self.linesegment.y1=y1
		self.linesegment.z1=z1
		self.linesegment.x2=x2
		self.linesegment.y2=y2
		self.linesegment.z2=z2
		self.TEMP_TOGGLE=0

		self.normal2d=XPRACTICE.WrapAngle(math.atan2(y2-y1,x2-x1)+math.pi*0.5)

	end
	
	-- function class:CreateDisplayObject()
		-- self.displayobject=XPRACTICE.LineDisplayObject.new()
		-- self.displayobject:Setup(self)
	-- end


	function class:SetActorAppearanceViaOwner(actor)
		--actor:SetModelByCreatureDisplayID(81018)	-- Kiro
		--actor:SetModelByFileID(3621935) --9fx_raid1_gargoylebat_sonicwave_missile
		--actor:SetModelByFileID(1983540) --spells/8fx_azerite_generic_projectile01_missile
		-- self.fileid=530068		--spells/druid_wrath_missile_v2		
		-- self.particlexoffset=0.35
		-- self.particleyoffset=0
		--self.fileid=166497	--spells/lightningbolt_missile
		--self.particlexoffset=0
		--self.particleyoffset=0		
		--self.fileid=166330
		self.fileid=166331
		--self.fileid=166332
		self.particlexoffset=0
		self.particleyoffset=0		
		
		actor:SetModelByFileID(self.fileid)	
	end

	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		 
		local TEMP_MID=1
		self.TEMP_TOGGLE=self.TEMP_TOGGLE+1
		if(self.TEMP_TOGGLE>=TEMP_MID*2)then self.TEMP_TOGGLE=0 end
		if(self.TEMP_TOGGLE<TEMP_MID)then			
			self.position.x=self.linesegment.x1+self.particlexoffset
			self.position.y=self.linesegment.y1+self.particleyoffset
			self.position.z=self.linesegment.z1
		else
			self.position.x=self.linesegment.x2+self.particlexoffset
			self.position.y=self.linesegment.y2+self.particleyoffset
			self.position.z=self.linesegment.z2		
		end
	end
	
	function class:ChangeLineActorID(fileid,xoffset,yoffset)	
		if(self.fileid~=fileid)then
			self.fileid=fileid
			self.displayobject.drawable:SetModelByFileID(fileid)
		end
		self.particlexoffset=xoffset
		self.particleyoffset=yoffset
	end
	

	function class:SetMissileOrientationAlongLine()
		self.orientation_displayed.yaw=math.atan2(self.linesegment.y2-self.linesegment.y1,self.linesegment.x2-self.linesegment.x1)
		--self.orientation.yaw=math.atan2(self.linesegment.y2-self.linesegment.y1,self.linesegment.x2-self.linesegment.x1)
	end
	
	-- --TODO: code reuse
	-- function class:Draw(elapsed)
		-- self.animationmodule:Draw(elapsed)
		-- self.displayobject:SetPositionAndScale(self.position,self.scale)
		-- self.displayobject:SetOrientation(self.orientation_displayed)
		-- if(self.visible)then
			-- print("Line visible:",self)
		-- end
		-- --!!!
		-- --self.displayobject.drawable:SetShown(self.visible)
		-- self.displayobject.drawable:SetShown(true)
	-- end		
	
	
	
	function class:Draw(elapsed)
		super.Draw(self,elapsed)
		self.displayobject.drawable:SetShown(self.visible)
	end
	
	
end

-- do
	-- local super=XPRACTICE.DisplayObject
	-- XPRACTICE.LineDisplayObject=XPRACTICE.inheritsFrom(super)
	-- local class=XPRACTICE.LineDisplayObject




-- end