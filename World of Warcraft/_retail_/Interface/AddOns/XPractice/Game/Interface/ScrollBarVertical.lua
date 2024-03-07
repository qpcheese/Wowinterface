do
	local super=XPRACTICE.GameObject
	XPRACTICE.ScrollBarVertical=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.ScrollBarVertical
	
	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		self.maxscrollheight=1000
		self.scrolly=0
		self.totalsize=500
		self.buttonsize=50
		self.boxheight=100
		self.scrollwheelspeed=50	
		self.scrollbuttonspeed=400
	end
	
	function class:CreateDisplayObject()
		local scrollbar=XPRACTICE.ScrollBarVerticalDisplayObject.new()		
		scrollbar:Setup(self)
		scrollbar.drawable:SetScript("OnClick",function(self,button,down) 
											--Click event will not fire if we click on the top/bottom buttons or the box
														if(button=="LeftButton")then
															scrollbar.mousepressed=down
														end
													end)
		self.displayobject=scrollbar
	end
	function class:CreateAssociatedObjects()
		local scrollbar=self
	
		local scrollbutton
		scrollbutton=XPRACTICE.ButtonInnerBorder.new()		
		scrollbutton:Setup(self.environment)
		scrollbutton.displayobject.back.texture:SetTexture("interface/chatframe/ui-chaticon-scrolldown-up.blp")
		scrollbutton:SetLockedStartingAlpha(1.0)
		scrollbutton.displayobject.drawable:EnableMouse(true)
		scrollbutton.displayobject.drawable:SetScript("OnClick",function(self,button,down) 																
																if(button=="LeftButton")then
																	scrollbutton.mousecurrent=down
																end
															end)		
		scrollbutton.displayobject.drawable:SetScript("OnMouseUp",function(self,button) 
																	scrollbutton.mousecurrent=false
															end)															
		self.downbutton=scrollbutton
		
		local scrollbutton
		scrollbutton=XPRACTICE.ButtonInnerBorder.new()		
		scrollbutton:Setup(self.environment)
		scrollbutton.displayobject.back.texture:SetTexture("interface/chatframe/ui-chaticon-scrollup-up.blp")
		scrollbutton:SetLockedStartingAlpha(1.0)
		scrollbutton.displayobject.drawable:EnableMouse(true)
		scrollbutton.displayobject.drawable:SetScript("OnClick",function(self,button,down) 
																if(button=="LeftButton")then
																	scrollbutton.mousecurrent=down
																end
															end)
		scrollbutton.displayobject.drawable:SetScript("OnMouseUp",function(self,button) 
																	scrollbutton.mousecurrent=false
															end)
															
		self.upbutton=scrollbutton
		
		local scrollbutton
		scrollbutton=XPRACTICE.ButtonInnerBorder.new()		
		scrollbutton:Setup(self.environment)
		scrollbutton.displayobject.back.texture:SetColorTexture(1,1,1,0.5)
		scrollbutton:SetLockedStartingAlpha(1.0)
		scrollbutton.displayobject.drawable:EnableMouse(true)
		scrollbutton.displayobject.drawable:SetScript("OnClick",function(self,button,down) 
																if(button=="LeftButton")then		
																	scrollbutton.mousecurrent=down																	
																	if(down)then
																		local globalx,globaly=GetCursorPosition()
																		scrollbutton.startmousey=globaly
																		scrollbutton.startpositiony=scrollbutton.position.y
																		scrollbutton.startscrolly=scrollbar.scrolly
																	end
																end
															end)	
		scrollbutton.displayobject.drawable:SetScript("OnMouseUp",function(self,button) 
																	scrollbutton.mousecurrent=false
															end)
		self.box=scrollbutton		


																
	end
	
	
	function class:SetSize(wid,hgt)
		self.totalsize=hgt
		self.buttonsize=wid
		self.displayobject.drawable:SetSize(wid,hgt)
		self.downbutton:SetSize(wid,wid)
		self.upbutton:SetSize(wid,wid)
		self:SetMaxScrollHeight(self.maxscrollheight) -- we call this to update self.boxsize
		self:UpdateBoxSize()
	end
	function class:SetMaxScrollHeight(maxscrollheight)
		self.maxscrollheight=maxscrollheight
		local bartop=self.totalsize-self.buttonsize
		local barbottom=self.buttonsize
		self.boxheight=(self.totalsize/(maxscrollheight+self.totalsize))*(bartop-barbottom)
		if(self.boxheight<50)then self.boxheight=50 end
		self:UpdateBoxSize()
	end
	
	
	function class:UpdateBoxSize()
		self.box:SetSize(self.buttonsize,self.boxheight)
	end



	function class:Step(elapsed)
		super.Step(self,elapsed)
		local keys=self.environment.game.keys	
		
		-- if(keys.lmouse.released)then
			-- self.box.mousecurrent=false
			-- self.upbutton.mousecurrent=false
			-- self.downbutton.mousecurrent=false
		-- end
		-- print(self.box.mousecurrent)
		
		if(self.displayobject.mousepressed==true)then
			--Click event will not fire if we click on the top/bottom buttons or the box
			-- so we know that we clicked on the bar itself
			self.displayobject.mousepressed=false
			local globalx,globaly=GetCursorPosition()
			--print(globalx,globaly)
			local left,bottom,width,height=self.displayobject.drawable:GetScaledRect()
			local localx=globalx-left
			local localy=globaly-bottom			
			local bary=localy-self.buttonsize
			local multiplier=0
			if(bary<=self.box.position.y)then
				multiplier=1
			else
				multiplier=-1
			end
			local jumpspeed=self.totalsize*0.75	--TODO: not tested with multiple sizes of scroll areas
			self.scrolly=self.scrolly+jumpspeed*multiplier
		end
		
		--TODO: rename "box" or "scrollbox"; we're using both and it's confusing
		if(self.box.mousecurrent==true)then
			local globalx,globaly=GetCursorPosition()
			local diff=globaly-self.box.startmousey
			local buttonsize=self.buttonsize
			local bartop=self.totalsize-buttonsize
			local barbottom=buttonsize
			local boxheight=self.boxheight
			local barheight=(bartop-barbottom-boxheight)
			local scrolldiff=diff/barheight*self.maxscrollheight
			--print("scrolldiff",scrolldiff)
			self.scrolly=self.box.startscrolly-scrolldiff
		end
		
		if(self.downbutton.mousecurrent==true)then
			self.scrolly=self.scrolly+self.scrollbuttonspeed*elapsed
		end
		if(self.upbutton.mousecurrent==true)then
			self.scrolly=self.scrolly-self.scrollbuttonspeed*elapsed
		end		
		
		if(self.scrolly<0)then self.scrolly=0 end
		if(self.scrolly>self.maxscrollheight)then self.scrolly=self.maxscrollheight end	
		
		self.downbutton.position.x=self.position.x
		self.downbutton.position.y=self.position.y
		local buttonsize=self.buttonsize
		local bartop=self.totalsize-buttonsize
		local barbottom=buttonsize
		self.upbutton.position.x=self.position.x
		self.upbutton.position.y=self.position.y+bartop		
		local scrollratio=1.0-self.scrolly/self.maxscrollheight		
		self.box.position.x=self.position.x
		local boxheight=self.boxheight
		local boxy=(bartop-barbottom-boxheight)*scrollratio
		self.box.position.y=self.position.y+buttonsize+boxy		
				
		if(self.scrollbox)then
			self.scrollbox.position.y=self.scrolly+self.totalsize
		end		
	end
	
	function class:Draw(elapsed)
		self.displayobject:SetPositionAndScale(self.position,self.scale)
		self.displayobject.drawable:SetAlpha(XPRACTICE.Clamp(self.alpha,0,1))
	end	
	
	function class:GetPlayerInput(elapsed)
		local keys=self.environment.game.keys
		local delta=keys.wmouse.pressed
		if(delta)then
			self.scrolly=self.scrolly-self.scrollwheelspeed*delta			
		end			
		
	end
	

	
	function class:IsUnderMouse(globalx,globaly)
		if(self:IsClickable())then
			local left,bottom,width,height=self.displayobject.drawable:GetScaledRect()
			local right=left+width
			local top=bottom+height
			local vertical_leeway=0
			top=top+vertical_leeway
			bottom=bottom-vertical_leeway
			--print(globalx,globaly,nameplate.displayobject.drawable:GetScaledRect())
			if(left<=globalx and globalx<=right)then
				if(bottom<=globaly and globaly<=top)then
					return true
				end
			end
		end
		return false
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