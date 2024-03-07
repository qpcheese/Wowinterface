do
	local super=XPRACTICE.GameObject
	XPRACTICE.Nameplate=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Nameplate
	
	--TODO: when selected, back of empty HP bar should still be transparent instead of solid white
	
	function class:Setup(environment,mob)
		self.hp_TEMP=self.hp_TEMP or 1.0	--self.hp_TEMP set before setup		
		super.Setup(self,environment)
		self.mob=mob
		mob.nameplate=self
		self.selected=false
		self.selectsize=0.0
		self.in_front_of_camera=false
		self.zsort=1
		self.nearby=false;	self.longrange=not self.nearby
		
	end
	
		
	function class:SetupEnvironmentObjectListIndexStorage()
		super.SetupEnvironmentObjectListIndexStorage(self)
		tinsert(self.environmentobjectlists,self.environment.nameplates)
	end
	
	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.NameplateDisplayObject.new()
		self.displayobject:Setup(self)
	end	
	
	function class:Step(elapsed)
		if(self.mob.targetable==false)then
			self:Die()
		end
		if(self.mob.dead)then
			self:Die()
		end
		if(self.selected)then
			self.selectsize=self.selectsize+elapsed*(10)
			if(self.selectsize>1)then self.selectsize=1 end
		else
			self.selectsize=self.selectsize-elapsed*(10)
			if(self.selectsize<0)then self.selectsize=0 end	
		end
		self.displayobject.background:SetSize(145+65*self.selectsize,15+5*self.selectsize)
		self.displayobject:SetFillPoints()
		--self.displayobject.drawable:SetSize(145+65*self.selectsize,55+5*self.selectsize)
	end
	
	function class:Draw()
		local x1,y1,z1,x2,y2,z2=self.mob.displayobject:GetActiveBoundingBox()
		if(not z2)then z2=0 end
		local x3D,y3D,z3D
		x3D=self.mob.position.x
		y3D=self.mob.position.y
		z3D=self.mob.position.z+z2*self.mob.scale
		local x2D,y2D,z2D=self.environment.modelsceneframe:Project3DPointTo2D(x3D,y3D,z3D)
		
		-- adjust projected point for large screen size
		-- (we're not sure why this works, but it does)
		local multiplier
		local l1,b1,w1,h1=UIParent:GetRect()
		local l2,b2,w2,h2=UIParent:GetScaledRect()
		multiplier=w1/w2		
		x2D=x2D*multiplier
		y2D=y2D*multiplier
		-- do NOT multiply z2D by multiplier
		
		local NEAR_CLIP=1.0		
		if(z2D<NEAR_CLIP)then
			self.displayobject.drawable:SetPoint("BOTTOM",self.displayobject.parentframe,"BOTTOMLEFT",x2D,y2D)
			self.in_front_of_camera=true			
		else
			self.in_front_of_camera=false
		end
		self.zsort=z2D
		
		local camerafocus=self.mob.environment.cameramanager.camera.focus
		--if(self.selected==true or self.selectsize>0)then
		if(self.selectsize>0)then
			self:SetNearby()
		else
			if(camerafocus)then
				local distx=camerafocus.position.x-self.mob.position.x
				local disty=camerafocus.position.y-self.mob.position.y
				local distsqr=distx*distx+disty*disty
				local LONGRANGE_CUTOFF=60	 --TODO: 50 or 60?
				if(distsqr<=LONGRANGE_CUTOFF*LONGRANGE_CUTOFF)then
					self:SetNearby()
				else
					self:SetLongrange()
				end
			end
		end

		if(self:IsVisibleToCamera())then
			self.displayobject.drawable:SetAlpha(1)
		else
			self.displayobject.drawable:SetAlpha(0)
		end		
	end
	
	function class:SetNearby()
		self.nearby=true; self.longrange=not self.nearby
		self.displayobject:SetNearby()
	end
	
	function class:SetLongrange()
		self.nearby=false; self.longrange=not self.nearby
		self.displayobject:SetLongrange()
	end
	
	function class:SetSelected(selected)
		self.displayobject:SetSelected(selected)
		self.selected=selected
	end
	
	function class:SetText(text)
		self.displayobject:SetText(text)
	end

	function class:IsVisibleToCamera()
		return self.in_front_of_camera and self.mob:ExistsInPhase()
	end
	
	function class:IsClickable()
		return self.in_front_of_camera and self.mob:ExistsInPhase() and self.nearby
	end
	
	function class:IsUnderMouse(globalx,globaly)
		if(self:IsClickable())then
			local left,bottom,width,height=self.displayobject.drawable:GetScaledRect()						
			local right=left+width
			local top=bottom+height
			local vertical_leeway=7
			top=top+vertical_leeway
			bottom=bottom-vertical_leeway
			--print(globalx,globaly,nameplate.displayobject.drawable:GetScaledRect())
			if(left<=globalx and globalx<=right)then
				if(bottom<=globaly and globaly<=top)then
					return true
				end
			end
		end
	end
	
	-- SetTextonlyScale is called by MobClickZone:Draw
	function class:SetTextonlySize(size)
		if(size<80)then size=80 end
		local scale=size/800	--tentative		
		local multiplier=self.scalemultiplier or 1
		size=size*multiplier		
		self.displayobject.textonly.fontstring:SetScale(scale)
		self.displayobject.textonly:SetWidth(size)			
	end	
	
	-- function class:Cleanup()
		-- self.displayobject:Cleanup()
	-- end
	
end

-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------

do
	local super=XPRACTICE.DisplayObject
	XPRACTICE.NameplateDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.NameplateDisplayObject
	
	function class:CreateDrawable()
		--drawable is effectively invisible and only serves as an on/off toggle for its child objects
		self.drawable=XPRACTICE.ReusableFrames:GetFrame()		
		tinsert(self.drawables,self.drawable)
		self.background=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.background)
		self.bordertop=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.bordertop)
		self.borderbottom=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.borderbottom)
		self.borderleft=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.borderleft)
		self.borderright=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.borderright)		
		self.topfill=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.topfill)
		self.bottomfill=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.bottomfill)		
		self.name=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.name)
		
		self.textonly=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.textonly)
	end
	
	function class:SetAppearance()		
		self.parentframe=self.owner.environment.frame
		self.drawable:SetParent(self.parentframe);self.drawable:SetFrameLevel(200)
		self.drawable:Show()
		self.drawable:SetSize(210,20)
		self.drawable:SetAlpha(1)	
		self.background:SetParent(self.drawable);self.background:SetFrameLevel(200)
		self.background.texture:Show()
		self.background:Show()
		self.background:SetSize(210,20)		
		--self.background.texture:SetColorTexture(1,1,1,1)
		self.background.texture:SetColorTexture(0,0,0,0.75)
		self.background:SetPoint("CENTER",self.drawable)
		self.background:SetAlpha(1)
		self.bordertop:SetParent(self.background);self.bordertop:SetFrameLevel(201)
		self.bordertop.texture:Show();self.topfill.texture:SetColorTexture(0,0,0,1)
		self.bordertop:Show()
		self.bordertop:SetPoint("TOPLEFT",self.background,"TOPLEFT",0,0)
		self.bordertop:SetPoint("BOTTOMRIGHT",self.background,"TOPRIGHT",0,-2)
		self.bordertop:SetAlpha(1)
		self.borderbottom:SetParent(self.background);self.borderbottom:SetFrameLevel(201)
		self.borderbottom.texture:Show();self.topfill.texture:SetColorTexture(0,0,0,1)
		self.borderbottom:Show()
		self.borderbottom:SetPoint("BOTTOMLEFT",self.background,"BOTTOMLEFT",0,0)
		self.borderbottom:SetPoint("TOPRIGHT",self.background,"BOTTOMRIGHT",0,2)
		self.borderbottom:SetAlpha(1)
		self.borderleft:SetParent(self.background);self.borderleft:SetFrameLevel(201)
		self.borderleft.texture:Show();self.topfill.texture:SetColorTexture(0,0,0,1)
		self.borderleft:Show()
		self.borderleft:SetPoint("TOPLEFT",self.background,"TOPLEFT",0,0)
		self.borderleft:SetPoint("BOTTOMRIGHT",self.background,"BOTTOMLEFT",2,0)
		self.borderleft:SetAlpha(1)
		self.borderright:SetParent(self.background);self.borderright:SetFrameLevel(201)
		self.borderright.texture:Show();self.topfill.texture:SetColorTexture(0,0,0,1)
		self.borderright:Show()
		self.borderright:SetPoint("TOPRIGHT",self.background,"TOPRIGHT",0,0)
		self.borderright:SetPoint("BOTTOMLEFT",self.background,"BOTTOMRIGHT",-2,0)
		self.borderright:SetAlpha(1)		
		self.topfill:SetParent(self.background);self.topfill:SetFrameLevel(201)
		self.topfill.texture:Show();self.topfill.texture:SetColorTexture(1,1,1,1)
		self.topfill:Show()
		self.topfill:SetPoint("BOTTOMLEFT",self.background,"LEFT",2,0)		
		self.topfill:SetAlpha(1)
		self.bottomfill:SetParent(self.background);self.bottomfill:SetFrameLevel(201)
		self.bottomfill.texture:Show();self.bottomfill.texture:SetColorTexture(1,1,1,1)
		self.bottomfill:Show()
		self.bottomfill:SetPoint("BOTTOMLEFT",self.background,"BOTTOMLEFT",2,2)
		--self.bottomfill:SetPoint("TOPRIGHT",self.background,"RIGHT",-2,0)
		self.bottomfill:SetAlpha(1)
		self:SetFillPoints()
		self.name:Show()
		self.name:SetParent(self.background);self.name:SetFrameLevel(201)		
		self.name:SetPoint("BOTTOM",self.background,"TOP",0,0)
		self.name.fontstring:SetFont("Fonts\\FRIZQT__.TTF",20)
		self.name.fontstring:SetTextHeight(20)		
		self.name.fontstring:Show();self:SetText("Unknown\n<Unknown>")		
		self.name:SetAlpha(1)
		
		self.textonly:Show()
		self.textonly:SetParent(self.drawable);self.textonly:SetFrameLevel(201)		
		self.textonly:SetPoint("BOTTOM",self.drawable,"BOTTOM",0,0)
		self.textonly.fontstring:SetFont("Fonts\\FRIZQT__.TTF",48)		
		self.textonly.fontstring:SetTextHeight(48)		
		self.textonly.fontstring:Show()		
		self.textonly:SetAlpha(1)
		
		
		self:SetLongrange()
		self:SetSelected(false)
	end
	
	function class:SetFillPoints()
		local width,_=self.background:GetSize()
		width=width-6
		--local fillwidth=(width)*self.owner.hp_TEMP
		local filloffset=(width)*(1-self.owner.hp_TEMP)
		--print("filloffset:",filloffset)
		
		--self.topfill:SetPoint("TOPRIGHT",self.background,"TOPRIGHT",-2,-2)
		--self.topfill:SetPoint("TOPRIGHT",self.background,"TOPRIGHT",-100,-2)
		self.topfill:SetPoint("TOPRIGHT",self.background,"TOPRIGHT",-2-filloffset,-2)	
		self.bottomfill:SetPoint("TOPRIGHT",self.background,"RIGHT",-2-filloffset,0)
	end
	
	function class:SetSelected(selected)
		local texture,gradient1,gradient2,textcolor
		if(not selected)then
			--texture={0,0,0,0.75}
			texture={0,0,0,1}
			if(XPRACTICE.TOCVersion>=100000)then
				gradient1={"VERTICAL",XPRACTICE.Colors.SlightlyTranslucentRed,XPRACTICE.Colors.SlightlyTranslucentBlack}
				gradient2={"VERTICAL",XPRACTICE.Colors.SlightlyTranslucentBlack,XPRACTICE.Colors.SlightlyTranslucentRed}
			else
				gradient1={"VERTICAL",1,0,0,0.75,0,0,0,0.75}
				gradient2={"VERTICAL",0,0,0,0.75,1,0,0,0.75}			
			end
			textcolor={1,0,0,0.75}
		else
			texture={1,1,1,1}
			if(XPRACTICE.TOCVersion>=100000)then
				gradient1={"VERTICAL",XPRACTICE.Colors.SolidRed,XPRACTICE.Colors.SolidBlack}
				gradient2={"VERTICAL",XPRACTICE.Colors.SolidBlack,XPRACTICE.Colors.SolidRed}			
			else
				gradient1={"VERTICAL",1,0,0,1,0,0,0,1}
				gradient2={"VERTICAL",0,0,0,1,1,0,0,1}				
			end
			textcolor={1,0,0,1}
		end
		--self.background.texture:SetColorTexture(unpack(texture))
		self.bordertop.texture:SetColorTexture(unpack(texture))
		self.borderbottom.texture:SetColorTexture(unpack(texture))
		self.borderleft.texture:SetColorTexture(unpack(texture))
		self.borderright.texture:SetColorTexture(unpack(texture))
		if(XPRACTICE.TOCVersion>=100000)then
			self.topfill.texture:SetGradient(unpack(gradient1))		
			self.bottomfill.texture:SetGradient(unpack(gradient2))		
		else
			self.topfill.texture:SetGradientAlpha(unpack(gradient1))  --pre-100002	
			self.bottomfill.texture:SetGradientAlpha(unpack(gradient2))  --pre-100002
		end
		self.name.fontstring:SetTextColor(unpack(textcolor))
		self.textonly.fontstring:SetTextColor(unpack(textcolor))
	end
	
	function class:SetText(text)
		self.name.fontstring:SetText(text)
		self.name:SetSize(self.name.fontstring:GetStringWidth(),self.name.fontstring:GetStringHeight()+5)	
		self.name.fontstring:SetScale(1)	--TODO: this shouldn't be necessary, but it isn't being applied in ResetProperties
		
		self.textonly.fontstring:SetText(text)
		self.textonly:SetSize(self.textonly.fontstring:GetStringWidth(),self.textonly.fontstring:GetStringHeight()+5)	
	end
	
	function class:SetNearby()		
		self.background:SetAlpha(1)
		-- self.topfill:SetAlpha(1)
		-- self.bottomfill:SetAlpha(1)
		-- self.name:SetAlpha(1)
		self.textonly:SetAlpha(0)
	end
	
	function class:SetLongrange()
		self.background:SetAlpha(0)
		-- self.topfill:SetAlpha(0)
		-- self.bottomfill:SetAlpha(0)
		-- self.name:SetAlpha(0)
		self.textonly:SetAlpha(1)
	end
	
	-- function class:Cleanup()
		-- self.drawable:Cleanup()
	-- end
end

