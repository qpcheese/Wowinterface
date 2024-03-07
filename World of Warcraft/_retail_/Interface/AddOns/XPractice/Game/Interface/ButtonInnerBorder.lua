
do
	local super=XPRACTICE.Button
	XPRACTICE.ButtonInnerBorder=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ButtonInnerBorder
	

	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.ButtonInnerBorderDisplayObject.new()
		self.displayobject:Setup(self)
	end
	
	
end

do
	local super=XPRACTICE.DisplayObject
	XPRACTICE.ButtonInnerBorderDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ButtonInnerBorderDisplayObject
	
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
		self.top:SetPoint("TOPLEFT",self.back,"TOPLEFT",-0,0)
		self.top:SetPoint("TOPRIGHT",self.back,"TOPRIGHT",0,0)
		self.top:SetHeight(linewidth)
		self.bottom:SetParent(self.back)
		self.bottom.texture:Show();self.bottom.texture:SetColorTexture(1,1,1,1)
		self.bottom:Show();self.bottom:SetAlpha(1)
		self.bottom:SetPoint("BOTTOMLEFT",self.back,"BOTTOMLEFT",-0,0)
		self.bottom:SetPoint("BOTTOMRIGHT",self.back,"BOTTOMRIGHT",0,0)
		self.bottom:SetHeight(linewidth)	
		self.left:SetParent(self.back)
		self.left.texture:Show();self.left.texture:SetColorTexture(1,1,1,1)
		self.left:Show();self.left:SetAlpha(1)
		self.left:SetPoint("TOPLEFT",self.back,"TOPLEFT",0,0)
		self.left:SetPoint("BOTTOMLEFT",self.back,"BOTTOMLEFT",0,-0)
		self.left:SetWidth(linewidth)
		self.right:SetParent(self.back)
		self.right.texture:Show();self.right.texture:SetColorTexture(1,1,1,1)
		self.right:Show();self.right:SetAlpha(1)
		self.right:SetPoint("TOPRIGHT",self.back,"TOPRIGHT",0,0)
		self.right:SetPoint("BOTTOMRIGHT",self.back,"BOTTOMRIGHT",0,-0)
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
