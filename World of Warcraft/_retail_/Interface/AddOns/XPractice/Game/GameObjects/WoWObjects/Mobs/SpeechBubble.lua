-- create speech bubbles with Mob:CreateSpeechBubble(text)

do
	local super=XPRACTICE.GameObject
	XPRACTICE.SpeechBubble=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SpeechBubble
	
	function class:Setup(environment,mob)
		super.Setup(self,environment)
		self.mob=mob
		mob.speechbubble=self
		self.selected=false
		self.selectsize=0.0
		self.in_front_of_camera=false
		self.zsort=1
		self.nearby=false;	self.longrange=not self.nearby
		self.duration=2.0 -- may be overridden by Mob:CreateSpeechBubble
	end
	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.SpeechBubbleDisplayObject.new()
		self.displayobject:Setup(self)
	end	
	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		
		local fadetime=0.25
		local duration=self.duration
		local alpha=1
		if(self.localtime<=fadetime)then
			alpha=self.localtime*(1/fadetime)
		elseif(self.localtime>=duration+fadetime)then
			alpha=(duration+fadetime*2-self.localtime)*(1/fadetime)
		end
		self.alpha=alpha		
		self.displayobject.drawable:SetAlpha(XPRACTICE.Clamp(alpha,0,1))
		if(self.localtime>=duration+fadetime*2)then
			self:Die()
		end
	end
	
	function class:Draw()
		local speechbubbleoffset=2
		local x1,y1,z1,x2,y2,z2=self.mob.displayobject:GetActiveBoundingBox()
		if(not z2)then z2=0 end
		local x3D,y3D,z3D
		x3D=self.mob.position.x
		y3D=self.mob.position.y
		z3D=self.mob.position.z+z2*self.mob.scale+speechbubbleoffset
		local x2D,y2D,z2D=self.environment.modelsceneframe:Project3DPointTo2D(x3D,y3D,z3D)
		
		-- TODO: code reuse from Nameplate -- move to standardized global function
		
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
		
		-- local camerafocus=self.mob.environment.cameramanager.camera.focus
		-- --if(self.selected==true or self.selectsize>0)then
		-- if(self.selectsize>0)then
			-- self:SetNearby()
		-- else
			-- if(camerafocus)then
				-- local distx=camerafocus.position.x-self.mob.position.x
				-- local disty=camerafocus.position.y-self.mob.position.y
				-- local distsqr=distx*distx+disty*disty
				-- local LONGRANGE_CUTOFF=60	 --TODO: 50 or 60?
				-- if(distsqr<=LONGRANGE_CUTOFF*LONGRANGE_CUTOFF)then
					-- self:SetNearby()
				-- else
					-- self:SetLongrange()
				-- end
			-- end
		-- end

		if(self:IsVisibleToCamera())then
			self.displayobject.drawable:SetAlpha(XPRACTICE.Clamp(self.alpha,0,1))
		else
			self.displayobject.drawable:SetAlpha(0)
		end		
	end	
	
	function class:IsVisibleToCamera()
		return self.in_front_of_camera and self.mob:ExistsInPhase()
	end
	
		
	function class:SetText(text)
		self.displayobject:SetText(text)
	end
	
end



do
	local super=XPRACTICE.DisplayObject
	XPRACTICE.SpeechBubbleDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SpeechBubbleDisplayObject
	
	function class:CreateDrawable()
		--drawable is effectively invisible and only serves as an on/off toggle for its child objects
		self.drawable=XPRACTICE.ReusableFrames:GetFrame()		
		tinsert(self.drawables,self.drawable)
		self.top=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.top)
		self.bottom=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.bottom)
		self.left=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.left)
		self.right=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.right)		
		-- size of background controls appearance of border.
		-- however, note that border is parented to drawable, not background
		self.background=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.background)
		self.text=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.text)
	end
	
	function class:SetAppearance()		
		--self.parentframe=self.owner.environment.frame
		-- self.drawable:SetParent(self.parentframe);self.drawable:SetFrameLevel(202)
		-- self.drawable:Show()
		-- self.drawable:SetSize(210,20)
		-- self.drawable:SetAlpha(1)
		-- self.background:SetParent(self.drawable);self.background:SetFrameLevel(202)
		-- self.background.texture:Show()
		-- self.background:Show()
		-- self.background:SetSize(210,20)
		-- self.background.texture:SetColorTexture(0,0,0,0.75)
		-- self.background:SetPoint("CENTER",self.drawable)
		-- self.background:SetAlpha(1)
		-- self.bordertop:SetParent(self.drawable);self.bordertop:SetFrameLevel(202)
		-- self.bordertop.texture:Show()
		-- self.bordertop:Show()
		-- self.bordertop:SetHeight(2)		
		-- self.bordertop:SetPoint("BOTTOMLEFT",self.background,"TOPLEFT",-2,2)
		-- self.bordertop:SetPoint("BOTTOMRIGHT",self.background,"TOPRIGHT",2,2)
		-- self.bordertop.texture:SetColorTexture(1,1,1,1)
		-- self.bordertop:SetAlpha(1)		
		-- self.borderbottom:SetParent(self.drawable);self.borderbottom:SetFrameLevel(202)
		-- self.borderbottom.texture:Show()
		-- self.borderbottom:Show()
		-- self.borderbottom:SetHeight(2)		
		-- self.borderbottom:SetPoint("TOPLEFT",self.background,"BOTTOMLEFT",-2,-2)
		-- self.borderbottom:SetPoint("TOPRIGHT",self.background,"BOTTOMRIGHT",2,-2)
		-- self.borderbottom.texture:SetColorTexture(1,1,1,1)
		-- self.borderbottom:SetAlpha(1)			
		-- self.borderleft:SetParent(self.drawable);self.borderleft:SetFrameLevel(202)
		-- self.borderleft.texture:Show()
		-- self.borderleft:Show()
		-- self.borderleft:SetWidth(2)		
		-- self.borderleft:SetPoint("TOPRIGHT",self.background,"TOPLEFT",-2,0)
		-- self.borderleft:SetPoint("BOTTOMRIGHT",self.background,"BOTTOMLEFT",-2,0)
		-- self.borderleft.texture:SetColorTexture(1,1,1,1)
		-- self.borderleft:SetAlpha(1)				
		-- self.text:Show()
		-- self.text:SetParent(self.background);self.text:SetFrameLevel(203)
		-- self.text:SetPoint("CENTER",self.background,"CENTER",0,0)
		-- self.text.fontstring:SetFont("Fonts\\FRIZQT__.TTF",16)
		-- self.text.fontstring:Show();self:SetText("Unknown\n<Unknown>")		
		-- self.text:SetAlpha(1)
		
		--TODO: code reuse from Button; consolidate
		local linewidth=2
		--self.parentframe=self.owner.environment.hudframe
		self.parentframe=self.owner.environment.frame
		--self.parentframe=UIParent
		self.drawable:SetParent(self.parentframe);self.drawable:SetFrameLevel(202)
		self.drawable:Show()
		self.drawable:SetSize(210,20)
		--self.drawable:SetAlpha(1)	-- intentionally commented out.  causes "flash-on-spawn" problems.
		self.background:SetParent(self.drawable)
		self.background:SetPoint("CENTER",self.drawable)
		self.background.texture:Show();self.background.texture:SetColorTexture(0,0,0,0.5)		
		self.background:Show();self.background:SetAlpha(1)
		self.background:SetSize(200,120)
		--self.background:SetFrameLevel(202)	--TODO: is this line necessary?
		self.top:SetParent(self.background)
		self.top.texture:Show();self.top.texture:SetColorTexture(1,1,1,1)
		self.top:Show();
		self.top:SetPoint("BOTTOMLEFT",self.background,"TOPLEFT",-linewidth,0)
		self.top:SetPoint("BOTTOMRIGHT",self.background,"TOPRIGHT",linewidth,0)
		self.top:SetHeight(linewidth)
		self.top:SetAlpha(1)
		self.bottom:SetParent(self.background)
		self.bottom.texture:Show();self.bottom.texture:SetColorTexture(1,1,1,1)
		self.bottom:Show();
		self.bottom:SetPoint("TOPLEFT",self.background,"BOTTOMLEFT",-linewidth,0)
		self.bottom:SetPoint("TOPRIGHT",self.background,"BOTTOMRIGHT",linewidth,0)
		self.bottom:SetHeight(linewidth)	
		self.bottom:SetAlpha(1)
		self.left:SetParent(self.background)
		self.left.texture:Show();self.left.texture:SetColorTexture(1,1,1,1)
		self.left:Show();
		self.left:SetPoint("TOPRIGHT",self.background,"TOPLEFT",0,linewidth)
		self.left:SetPoint("BOTTOMRIGHT",self.background,"BOTTOMLEFT",0,-linewidth)
		self.left:SetWidth(linewidth)
		self.left:SetAlpha(1)
		self.right:SetParent(self.background)		
		self.right.texture:Show();self.right.texture:SetColorTexture(1,1,1,1)
		self.right:Show();
		self.right:SetPoint("TOPLEFT",self.background,"TOPRIGHT",0,linewidth)
		self.right:SetPoint("BOTTOMLEFT",self.background,"BOTTOMRIGHT",0,-linewidth)
		self.right:SetWidth(linewidth)	
		self.right:SetAlpha(1)		
		self.text:Show()
		self.text:SetParent(self.background);self.text:SetFrameLevel(203)
		self.text:SetPoint("CENTER",self.background,"CENTER",0,0)
		self.text.fontstring:SetFont("Fonts\\FRIZQT__.TTF",16)
		self.text.fontstring:Show();self:SetText("Unknown\n<Unknown>")		
		self.text:SetAlpha(1)
		
	end
	

	
	
	function class:SetText(text)
		self.text.fontstring:SetText(text)
		self.text:SetSize(self.text.fontstring:GetStringWidth(),self.text.fontstring:GetStringHeight()+5)	
		self.background:SetSize(self.text.fontstring:GetStringWidth()+35,self.text.fontstring:GetStringHeight()+5+30)
	end

end
