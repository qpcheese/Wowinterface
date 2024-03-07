do
	--TODO: inherit from SpellButton instead!
	local super=XPRACTICE.Button
	XPRACTICE.ExtraActionButton=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ExtraActionButton
	
	function class:Setup(environment)
		super.Setup(self,environment)
		self:SetSize(50,50)
	end
	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.ExtraActionButtonDisplayObject.new()
		self.displayobject:Setup(self)
	end
	
	function class:SetExtraBorderSize(wid,hgt)
		self.displayobject.extraborder:SetSize(wid,hgt)
	end
	
	function class:SetExtraBorderIcon(icon)
		self.displayobject.extraborder.texture:SetTexture(icon)
	end



end

do
	local super=XPRACTICE.ButtonDisplayObject
	XPRACTICE.ExtraActionButtonDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ExtraActionButtonDisplayObject
	
	--TODO: move to SpellButton
	function class:CreateDrawable()		
		local f=XPRACTICE.ReusableButtonFrames:GetFrame()
		self.drawable=f
		self.drawable.owner=self
		self.back=f
		tinsert(self.drawables,f)
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.text=f
		tinsert(self.drawables,f)
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.extraborder=f
		tinsert(self.drawables,f)		
	end
	function class:SetAppearance()
		--self.parentframe=self.owner.environment.hudframe
		self.parentframe=self.owner.environment.frame
		--self.parentframe=UIParent
		self.back:SetParent(self.parentframe)
		self.back.texture:Show();self.back.texture:SetColorTexture(0,0,0,0.5)		
		self.back:Show();self.back:SetAlpha(1)
		self.back:SetSize(200,120)
		self.back:SetFrameLevel(200)
		--TODO: in SpeechBubble, we set drawable's alpha in step event, but not for Button.  will this cause issues later?		
		self.extraborder:Show();self.extraborder:SetAlpha(1)
		self.extraborder:SetParent(self.back)
		self.extraborder:SetPoint("CENTER",self.back,"CENTER",0,0)
		self.extraborder.texture:Show();self.extraborder.texture:SetColorTexture(0,0,0,0)
		self.extraborder:SetSize(200,120)		
	end	
	
	
end