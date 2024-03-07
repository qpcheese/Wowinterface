
do
	local super=XPRACTICE.GameObject
	XPRACTICE.Button=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Button
	
	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		--IMPORTANT: remember to enable/disable mouse when changing button's targetalpha
		self.alpha=0
		self.targetalpha=1
	end

	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.ButtonDisplayObject.new()
		self.displayobject:Setup(self)
	end
	
	function class:SetSize(wid,hgt)
		self.displayobject.drawable:SetSize(wid,hgt)
	end
	

	
	function class:SetText(text)
		self.displayobject.text.fontstring:SetText(text)
	end
	
	function class:SetIcon(icon)		
		if(not icon)then
			self.displayobject.back.texture:SetTexture("interface/icons/inv_misc_questionmark.blp")	
		else			
			self.displayobject.back.texture:SetTexture(icon)
		end
	end
	
	
	function class:SetLockedStartingAlpha(alpha)
		self.alpha=alpha
		self.targetalpha=alpha
		self.displayobject.drawable:SetAlpha(XPRACTICE.Clamp(self.alpha,0,1))
	end
		
	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		if(self.alpha<self.targetalpha)then
			self.alpha=self.alpha+elapsed
			if(self.alpha>self.targetalpha)then self.alpha=self.targetalpha end
			self.displayobject.drawable:SetAlpha(XPRACTICE.Clamp(self.alpha,0,1))
		elseif(self.alpha>self.targetalpha)then
			self.alpha=self.alpha-elapsed
			if(self.alpha<self.targetalpha)then self.alpha=self.targetalpha end		
			self.displayobject.drawable:SetAlpha(XPRACTICE.Clamp(self.alpha,0,1))
		end
	end
	
	function class:Draw(elapsed)
		self.displayobject:SetPositionAndScale(self.position,self.scale)
				
		--local alpha=1
		--self.displayobject:SetAlpha(alpha)	
	end	
	function class:Select(toggle)
		self.selected=toggle
		if(toggle==true)then			
			self.displayobject.drawable.texture:SetColorTexture(1,1,1,0.5)	
		else
			--ActionButton_HideOverlayGlow(button.displayobject.drawable)
			self.displayobject.drawable.texture:SetColorTexture(0,0,0,0.5)	
		end
	end
	function class:EnableMouse(toggle)
		self.displayobject.drawable:EnableMouse(toggle)
	end	
	
end

do
	local super=XPRACTICE.DisplayObject
	XPRACTICE.ButtonDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ButtonDisplayObject
	
	function class:CreateDrawable()		
		local f=XPRACTICE.ReusableButtonFrames:GetFrame()
		self.drawable=f
		self.drawable.owner=self
		self.back=f
		tinsert(self.drawables,f)
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.top=f
		tinsert(self.drawables,f)		
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.bottom=f
		tinsert(self.drawables,f)		
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.left=f
		tinsert(self.drawables,f)		
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.right=f
		tinsert(self.drawables,f)				
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.text=f
		tinsert(self.drawables,f)
		-- local f=XPRACTICE.ReusableFrames:GetFrame()
		-- self.extraborder=f
		-- tinsert(self.drawables,f)		
	end
	function class:SetAppearance()
		local linewidth=2
		--self.parentframe=self.owner.environment.hudframe
		self.parentframe=self.owner.environment.frame
		--self.parentframe=UIParent
		self.back:SetParent(self.parentframe)
		self.back.texture:Show();self.back.texture:SetColorTexture(0,0,0,0.5)		
		self.back:Show();self.back:SetAlpha(1)
		self.back:SetSize(200,120)
		self.back:SetFrameLevel(200)
		--TODO: in SpeechBubble, we set drawable's alpha in step event, but not for Button.  will this cause issues later?
		self.top:SetParent(self.back)
		self.top.texture:Show();self.top.texture:SetColorTexture(1,1,1,1)
		self.top:Show();self.top:SetAlpha(1)
		self.top:SetPoint("BOTTOMLEFT",self.back,"TOPLEFT",-linewidth,0)
		self.top:SetPoint("BOTTOMRIGHT",self.back,"TOPRIGHT",linewidth,0)
		self.top:SetHeight(linewidth)
		self.bottom:SetParent(self.back)
		self.bottom.texture:Show();self.bottom.texture:SetColorTexture(1,1,1,1)
		self.bottom:Show();self.bottom:SetAlpha(1)
		self.bottom:SetPoint("TOPLEFT",self.back,"BOTTOMLEFT",-linewidth,0)
		self.bottom:SetPoint("TOPRIGHT",self.back,"BOTTOMRIGHT",linewidth,0)
		self.bottom:SetHeight(linewidth)	
		self.left:SetParent(self.back)
		self.left.texture:Show();self.left.texture:SetColorTexture(1,1,1,1)
		self.left:Show();self.left:SetAlpha(1)
		self.left:SetPoint("TOPRIGHT",self.back,"TOPLEFT",0,linewidth)
		self.left:SetPoint("BOTTOMRIGHT",self.back,"BOTTOMLEFT",0,-linewidth)
		self.left:SetWidth(linewidth)
		self.right:SetParent(self.back)
		self.right.texture:Show();self.right.texture:SetColorTexture(1,1,1,1)
		self.right:Show();self.right:SetAlpha(1)
		self.right:SetPoint("TOPLEFT",self.back,"TOPRIGHT",0,linewidth)
		self.right:SetPoint("BOTTOMLEFT",self.back,"BOTTOMRIGHT",0,-linewidth)
		self.right:SetWidth(linewidth)		
		self.text:SetParent(self.back)
		self.text:Show();self.text:SetAlpha(1)
		self.text:SetAllPoints(self.back)
		self.text.fontstring:Show()
		self.text.fontstring:SetText("")
		-- self.extraborder:Show();self.extraborder:SetAlpha(1)
		-- self.extraborder:SetPoint("CENTER",self.back,"CENTER",0,0)
		-- self.extraborder.texture:Show();self.extraborder.texture:SetColorTexture(0,0,0,0)
		-- self.extraborder:SetSize(200,120)		
	end
	function class:SetPositionAndScale(position,scale)
		self.back:SetPoint("BOTTOMLEFT",self.parentframe,"BOTTOMLEFT",position.x,position.y)
		--self.drawable:SetAllPoints(self.parentframe)
	end

end
