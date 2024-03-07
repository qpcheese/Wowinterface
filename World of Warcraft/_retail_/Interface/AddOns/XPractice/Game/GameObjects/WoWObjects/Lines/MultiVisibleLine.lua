do
	local super=XPRACTICE.WoWObject
	XPRACTICE.MultiVisibleLine=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.MultiVisibleLine
	
	function class:Setup(environment,x1,y1,z1)
		self.particlexoffset=0
		self.particleyoffset=0
		self.fileid=0
		
		super.Setup(self,environment,x1,y1,z1)

		self.points={}
		tinsert(self.points,{x=x1,y=y1,z=z1})

		-- self.linesegment.x1=x1
		-- self.linesegment.y1=y1
		-- self.linesegment.z1=z1
		-- self.linesegment.x2=x2
		-- self.linesegment.y2=y2
		-- self.linesegment.z2=z2
		self.currentsegment=1				
		self.movespeed=2	--measured in frames
		self.movetimer=0
		
		self.visible=true

		--self.normal2d=XPRACTICE.WrapAngle(math.atan2(y2-y1,x2-x1)+math.pi*0.5)

		--self:SetMissileOrientationAlongLine()
	
	end
	
	function class:AddPoint(x2,y2,z2)
		tinsert(self.points,{x=x2,y=y2,z=z2})
	end
	
	-- function class:CreateDisplayObject()
		-- self.displayobject=XPRACTICE.LineDisplayObject.new()
		-- self.displayobject:Setup(self)
	-- end


	function class:SetActorAppearanceViaOwner(actor)
		--self.fileid=970786
		self.fileid=166331	--holy_missile_low
		self.particlexoffset=0
		self.particleyoffset=0				
		actor:SetModelByFileID(self.fileid)	
	end

	

	function class:Step(elapsed)
		super.Step(self,elapsed)
		--print(#self.points,self.currentsegment)
		if(#self.points>=1)then
			local TEMP_MID=1
			self.movetimer=self.movetimer+1
			if(self.movetimer>=self.movespeed)then 
				self.movetimer=0
				self.currentsegment=self:NextSegment()
				--print("new:",self.currentsegment)
				self:SetMissileOrientationAlongLine()
				self.position.x=self.points[self.currentsegment].x+self.particlexoffset
				self.position.y=self.points[self.currentsegment].y+self.particleyoffset
				self.position.z=self.points[self.currentsegment].z
				--DevTools_Dump(self.points[self.currentsegment])
			end
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
	
	function class:PrevSegment()
		local segment=self.currentsegment-1
		if(segment<=0)then
			segment=#self.points
		end
		return segment
	end	
	function class:NextSegment()
		local segment=self.currentsegment+1
		if(segment>#self.points)then
			segment=1
		end
		return segment
	end
	

	function class:SetMissileOrientationAlongLine()
		if(#self.points<1)then return end
		
		--local nextsegment=self:NextSegment()
		--self.orientation_displayed.yaw=math.atan2(self.points[nextsegment].y-self.points[self.currentsegment].y,self.points[nextsegment].x-self.points[self.currentsegment].x)
		
		local prev=self:PrevSegment()		
		self.orientation_displayed.yaw=math.atan2(self.points[self.currentsegment].y-self.points[prev].y,self.points[self.currentsegment].x-self.points[prev].x)
		
	end
	

	-- function class:SetMissileOrientationAgainstLine()
		-- self.orientation_displayed.yaw=math.pi/2+math.atan2(self.linesegment.y2-self.linesegment.y1,self.linesegment.x2-self.linesegment.x1)
		-- --self.orientation.yaw=math.atan2(self.linesegment.y2-self.linesegment.y1,self.linesegment.x2-self.linesegment.x1)
	-- end	

	
	
	function class:Draw(elapsed)
		super.Draw(self,elapsed)
		self.displayobject.drawable:SetShown(self.visible)
	end

	
end
