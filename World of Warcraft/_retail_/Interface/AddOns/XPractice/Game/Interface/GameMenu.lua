do
	local super=XPRACTICE.GameObject
	XPRACTICE.GameMenu=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.GameMenu
	
	function class:Setup(environment,x,y,z)
		self.buttons={}
		super.Setup(self,environment,x,y,z)
		self:Hide()
		
		
		
	end
	
	local GAMEMENUHEIGHT=245
	
	function class:CreateDisplayObject()
		local button=XPRACTICE.ButtonDisplayObject.new()
		button:Setup(self)
		button.drawable.texture:SetColorTexture(0,0,0,0.9)				
		button.drawable:SetSize(180,GAMEMENUHEIGHT)
		button.drawable:SetFrameLevel(240)
		self.displayobject=button
	end
	function class:CreateAssociatedObjects()
		local menubutton
		menubutton=XPRACTICE.ButtonInnerBorder.new()				
		menubutton:Setup(self.environment,10,GAMEMENUHEIGHT-10-40,0)		
		menubutton:SetSize(160,40)
		menubutton.displayobject.parentframe=self.displayobject.back
		menubutton.displayobject.drawable:SetParent(menubutton.displayobject.parentframe)		
		menubutton:SetLockedStartingAlpha(1.0)
		menubutton.displayobject.drawable:EnableMouse(true)
		menubutton:SetText("Restart scenario")		
		menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down) 																
																if(button=="LeftButton" and down==true)then
																	menubutton.environment.game:ReloadSameScenario()
																end
															end)		
		self.downbutton=menubutton
		tinsert(self.buttons,menubutton)
		local menubutton
		menubutton=XPRACTICE.ButtonInnerBorder.new()		
		menubutton:Setup(self.environment,10,GAMEMENUHEIGHT-10-40-50,0)		
		menubutton:SetSize(160,40)
		menubutton.displayobject.parentframe=self.displayobject.back
		menubutton.displayobject.drawable:SetParent(menubutton.displayobject.parentframe)		
		menubutton:SetLockedStartingAlpha(1.0)
		menubutton.displayobject.drawable:EnableMouse(true)
		menubutton:SetText("Exit to \nmain menu")		
		menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down) 																
																if(button=="LeftButton" and down==true)then
																	menubutton.environment.game:LoadScenarioByClass(XPRACTICE.Scenario_Menu)
																end
															end)		
		self.downbutton=menubutton
		tinsert(self.buttons,menubutton)
		
		self.downbutton=menubutton
		tinsert(self.buttons,menubutton)
		local menubutton
		menubutton=XPRACTICE.ButtonInnerBorder.new()		
		menubutton:Setup(self.environment,10,GAMEMENUHEIGHT-10-40-100,0)		
		menubutton:SetSize(160,40)
		menubutton.displayobject.parentframe=self.displayobject.back
		menubutton.displayobject.drawable:SetParent(menubutton.displayobject.parentframe)		
		menubutton:SetLockedStartingAlpha(1.0)
		menubutton.displayobject.drawable:EnableMouse(true)
		menubutton:SetText("Exit to \nWorld of Warcraft")		
		menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down) 																
																if(button=="LeftButton" and down==true)then
																	menubutton.environment.game:Shutdown()
																end
															end)		
		self.quitbutton=menubutton
		tinsert(self.buttons,menubutton)		
		
		local gamemenu=self		
		local menubutton
		menubutton=XPRACTICE.ButtonInnerBorder.new()		
		menubutton:Setup(self.environment,10,10,0)		
		menubutton:SetSize(160,40)
		menubutton.displayobject.parentframe=self.displayobject.back
		menubutton.displayobject.drawable:SetParent(menubutton.displayobject.parentframe)		
		menubutton:SetLockedStartingAlpha(1.0)
		menubutton.displayobject.drawable:EnableMouse(true)
		menubutton:SetText("Return to practice")		
		menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down) 																
																if(button=="LeftButton" and down==true)then
																	gamemenu:Hide()
																end
															end)		
		self.downbutton=menubutton
		tinsert(self.buttons,menubutton)			
	end
	
	
	function class:Draw(elapsed)
		self.displayobject:SetPositionAndScale(self.position,self.scale)
		self.displayobject.drawable:SetAlpha(XPRACTICE.Clamp(self.alpha,0,1))
	end	
	
	function class:Hide()
		self.shown=false
		self.alpha=0
		self.displayobject.drawable:EnableMouse(false)
		for i=1,#self.buttons do
			self.buttons[i]:EnableMouse(false)
		end
	end
	function class:Show()
		self.shown=true
		self.alpha=1
		self.displayobject.drawable:EnableMouse(true)
		for i=1,#self.buttons do
			self.buttons[i]:EnableMouse(true)
		end		
		if(XPRACTICE.DEBUG.escquit)then
			--TODO: code reuse with actual quitbutton.click
			self.quitbutton.environment.game:Shutdown()
		end
	end
	

end

do
	local super=XPRACTICE.DisplayObject
	XPRACTICE.ScrollBarVerticalDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ScrollBarVerticalDisplayObject
	
	function class:CreateDrawable()		
		local f=XPRACTICE.ReusableButtonFrames:GetFrame()
		self.drawable=f
		self.drawable.owner=self
		self.back=f
		f.texture:Show();f.texture:SetColorTexture(0,0,0,0.5)
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
	end
	function class:SetAppearance()
		local linewidth=2
		self.drawable:Show();self.drawable:SetAlpha(1)
		self.parentframe=self.owner.environment.frame
		self.drawable:SetParent(self.parentframe)
		self.drawable:SetSize(25,500)
		self.drawable:SetFrameLevel(199)
		self.drawable:EnableMouse(true)
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
	end
	function class:SetPositionAndScale(position,scale)
		self.drawable:SetPoint("BOTTOMLEFT",self.parentframe,"BOTTOMLEFT",position.x,position.y)
		--self.drawable:SetAllPoints(self.parentframe)
	end
end