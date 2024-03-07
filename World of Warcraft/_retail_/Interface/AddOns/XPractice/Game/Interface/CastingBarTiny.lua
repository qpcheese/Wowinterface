do
	--TODO: inherit from SpellButton instead!
	local super=XPRACTICE.CastingBar
	XPRACTICE.CastingBarTiny=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.CastingBarTiny
	
	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.CastingBarTinyDisplayObject.new()
		self.displayobject:Setup(self)
	end
	function class:SetFillTexture()
		self.displayobject.fill.texture:SetTexture("interface/characterframe/barfill.blp")		
		if(XPRACTICE.TOCVersion>=100000)then
			self.displayobject.fill.texture:SetGradient("HORIZONTAL",XPRACTICE.Colors.SolidWhite,XPRACTICE.Colors.SolidWhite)
		else
			self.displayobject.fill.texture:SetGradientAlpha("HORIZONTAL",1,1,1,1,1,1,1,1)	--pre-100002
		end
	end
	function class:SetFillWidth(fillpercent)
		local maxwidth=self.displayobject.back:GetWidth()
		local fillwidth=fillpercent*maxwidth
		if(fillwidth<1)then fillwidth=1 end
		if(fillwidth>maxwidth)then fillwidth=maxwidth end
		self.displayobject.fill:SetWidth(fillwidth)	
	end
	function class:SetSpellFlash()
		if(self.focus.combatmodule.spellflash.text=="Interrupted")then
			self.displayobject.text.fontstring:SetText(self.focus.combatmodule.spellflash.text)
		else
			self.displayobject.drawable:Hide()
		end
	end

	function class:SetSpellFlashAlpha(alpha)
		-- do nothing
	end

	
end


do
	local super=XPRACTICE.CastingBarDisplayObject
	XPRACTICE.CastingBarTinyDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.CastingBarTinyDisplayObject
	
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
		self.fill=f
		tinsert(self.drawables,f)
		-- local f=XPRACTICE.ReusableFrames:GetFrame()
		-- self.flash=f
		-- tinsert(self.drawables,f)
		
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.shield=f
		tinsert(self.drawables,f)
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.spellicon=f
		tinsert(self.drawables,f)
		
		
		----Spark texture does not have transparent background!  :(
		-- local f=XPRACTICE.ReusableFrames:GetFrame()
		-- self.spark=f
		-- tinsert(self.drawables,f)
	end
	function class:SetAppearance()
		--self.parentframe=self.owner.environment.hudframe
		self.parentframe=self.owner.environment.frame
		--self.parentframe=UIParent
		self.back:SetParent(self.parentframe)
		--self.back.texture:Show();self.back.texture:SetColorTexture(0,0,0,0.5)		
		self.back.texture:Show();self.back.texture:SetColorTexture(0.25,0.25,0.25,0.5)		
		self.back:Show();self.back:SetAlpha(1)
		self.back:SetSize(196,18)
		self.back:SetFrameLevel(200)
				
		self.fill:Show();self.fill:SetAlpha(1)
		self.fill.texture:Show();--self.fill.texture:SetColorTexture(0,0.7,0.7,1)
		self.fill.texture:SetTexture("interface/characterframe/barfill.blp")
		self.fill:SetParent(self.back)
		self.fill:SetPoint("LEFT",self.back,"LEFT",0,0)		
		self.fill:SetSize(196,18)
		self.fill:SetFrameLevel(201)
		
		self.text:Show();self.text:SetAlpha(1)
		self.text:SetParent(self.back)
		self.text:SetAllPoints(self.back)
		self.text.fontstring:Show();self.text.fontstring:SetScale(0.9)
		self.text.fontstring:SetText("")
		self.text:SetFrameLevel(204)

		self.shield:Show();self.shield:SetAlpha(1)
		self.shield.texture:Show();
		self.shield.texture:SetTexture("interface/castingbar/ui-castingbar-arena-shield.blp")
		self.shield:SetParent(self.back)
		self.shield:SetPoint("CENTER",self.back,"LEFT",8,0)		
		self.shield:SetSize(32,32)
		self.shield:SetFrameLevel(203)
		
		self.spellicon:Show();self.spellicon:SetAlpha(1)
		self.spellicon.texture:Show();self.spellicon.texture:SetColorTexture(0.5,0.5,0.5,1)
		--self.spellicon.texture:SetTexture("interface/castingbar/ui-castingbar-arena-shield.blp")
		self.spellicon:SetParent(self.back)
		self.spellicon:SetPoint("CENTER",self.back,"LEFT",0,0)		
		self.spellicon:SetSize(10,10)
		self.spellicon:SetFrameLevel(202)		
		
		-- self.flash:Show();self.flash:SetAlpha(1)
		-- self.flash:SetParent(self.back)
		-- self.flash:SetPoint("CENTER",self.back,"CENTER",0,0)
		-- self.flash.texture:Show();self.flash.texture:SetTexture("interface/characterframe/barhighlight.blp")
		-- self.flash:SetSize(196,18)
		-- self.flash:SetFrameLevel(202)
		
		-- self.spark:Show();self.spark:SetAlpha(1)
		-- self.spark:SetParent(self.back)
		-- self.spark:SetPoint("CENTER",self.back,"CENTER",0,0)
		-- self.spark.texture:Show();self.spark.texture:SetTexture("interface/castingbar/ui-castingbar-spark.blp")
		-- self.spark:SetSize(32,32)		
		
	end	
	function class:SetPositionAndScale(position,scale)
		if(self.owner.nameplate)then
			--TODO: check if nameplate is in "hidden" mode
			self.back:SetPoint("TOP",self.owner.nameplate.displayobject.background,"BOTTOM",0,0)
			self.back:SetWidth(self.owner.nameplate.displayobject.background:GetWidth())
		else
			self.back:SetPoint("BOTTOMLEFT",self.parentframe,"BOTTOMLEFT",position.x,position.y)
		end
		--self.drawable:SetAllPoints(self.parentframe)
	end

	
end
	