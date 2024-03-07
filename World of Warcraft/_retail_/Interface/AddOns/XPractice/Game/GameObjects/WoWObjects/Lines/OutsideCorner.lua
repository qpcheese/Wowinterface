do
	local super=XPRACTICE.WoWObject
	XPRACTICE.OutsideCorner=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.OutsideCorner
	
	function class:Setup(environment,x1,y1,z1)
		self.particlexoffset=0
		self.particleyoffset=0
		self.fileid=0
		
		super.Setup(self,environment,x1,y1,z1)


	
	end
	
	-- function class:CreateDisplayObject()
		-- self.displayobject=XPRACTICE.LineDisplayObject.new()
		-- self.displayobject:Setup(self)
	-- end


	function class:SetActorAppearanceViaOwner(actor)
		--actor:SetModelByCreatureDisplayID(81018)	-- Kiro
		actor:SetModelByFileID(530068)	--spells/druid_wrath_missile_v2
		--self.fileid=166331
		self.fileid=530068
		self.particlexoffset=0.35
		self.particleyoffset=0
		
		actor:SetModelByFileID(self.fileid)
	end


	
	-- function class:Step(elapsed)
		-- super.Step(self,elapsed)
		
		-- local TEMP_MID=1
		-- self.TEMP_TOGGLE=self.TEMP_TOGGLE+1
		-- if(self.TEMP_TOGGLE>=TEMP_MID*2)then self.TEMP_TOGGLE=0 end
		-- if(self.TEMP_TOGGLE<TEMP_MID)then
			-- self.position.x=self.linesegment.x1
			-- self.position.y=self.linesegment.y1
			-- self.position.z=self.linesegment.z1
		-- else
			-- self.position.x=self.linesegment.x2
			-- self.position.y=self.linesegment.y2
			-- self.position.z=self.linesegment.z2		
		-- end
		
	-- end
	
	-- function class:Draw(elapsed)
		-- super.Draw(self,elapsed)
		-- self.displayobject.drawable:SetShown(self.visible)
	-- end
		
	--TODO: code reuse?
	function class:Draw(elapsed)
		--super:Draw(elapsed)
		local position={x=self.position.x+self.particlexoffset,y=self.position.y+self.particleyoffset,z=0}
		--self.displayobject:SetPositionAndScale(self.position,self.scale)
		self.displayobject:SetPositionAndScale(position,self.scale)
		self.displayobject:SetOrientation(self.orientation_displayed)
		self.displayobject.drawable:SetShown(self.visible)
	end			
	
end

-- do
	-- local super=XPRACTICE.DisplayObject
	-- XPRACTICE.LineDisplayObject=XPRACTICE.inheritsFrom(super)
	-- local class=XPRACTICE.LineDisplayObject




-- end