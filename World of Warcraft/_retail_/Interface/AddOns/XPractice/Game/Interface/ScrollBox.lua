do
	local super=XPRACTICE.GameObject
	XPRACTICE.ScrollBox=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ScrollBox
	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.ScrollBoxDisplayObject.new()
		self.displayobject:Setup(self)
	end
	
	function class:SetSize(wid,hgt)
		self.displayobject.drawable:SetSize(wid,hgt)
	end
	
	function class:Draw(elapsed)
		self.displayobject:SetPositionAndScale(self.position,self.scale)
		self.displayobject.drawable:SetAlpha(XPRACTICE.Clamp(self.alpha,0,1))
	end	
end

do
	local super=XPRACTICE.DisplayObject
	XPRACTICE.ScrollBoxDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ScrollBoxDisplayObject
	
	function class:CreateDrawable()
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.drawable=f	
		tinsert(self.drawables,f)
	end
	function class:SetAppearance()
		self.drawable:Show();self.drawable:SetAlpha(1)
		self.parentframe=self.owner.environment.frame
		self.drawable:SetParent(self.parentframe)
		self.drawable:SetSize(50,50)
		self.drawable:SetFrameLevel(200)
	end
	function class:SetPositionAndScale(position,scale)
		self.drawable:SetPoint("BOTTOMLEFT",self.parentframe,"BOTTOMLEFT",position.x,position.y)
		--self.drawable:SetAllPoints(self.parentframe)
	end

end