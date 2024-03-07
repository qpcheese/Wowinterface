
local WIDTH=300
local HEIGHT=30

do
	local super=XPRACTICE.Button
	XPRACTICE.KeybindButton=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.KeybindButton
	
	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		self:SetText("ERROR","?")
		local keybindbutton=self
		self.displayobject.back:SetScript("OnClick",function(self,button,down)
			if(button=="LeftButton" and down)then
				local previouslyselected=(keybindbutton.scenario.game.pendingkeybindbutton==keybindbutton)
				keybindbutton.scenario.game.pendingkeybindbutton=nil
				for i=1,#keybindbutton.scenario.keybindbuttons do
					keybindbutton.scenario.keybindbuttons[i]:Select(false)
				end
				if(not previouslyselected)then
					--TODO: if button is already selected, unselect it
					--TODO: unselect any other keybind buttons pending
					keybindbutton:Select(true)
					keybindbutton.scenario.game.pendingkeybindbutton=keybindbutton
				end
			end
		end)		
		tinsert(self.scenario.keybindbuttons,self)
	end
	
	function class:Select(toggle)
		self.selected=toggle
		if(toggle==true)then			
			self.displayobject.back.texture:SetColorTexture(1,1,1,0.5)	
		else
			--ActionButton_HideOverlayGlow(button.displayobject.drawable)
			self.displayobject.back.texture:SetColorTexture(0,0,0,0.5)	
		end
	end	
	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.KeybindButtonDisplayObject.new()
		self.displayobject:Setup(self)
	end

	function class:Set(keybindname,desc)
		if(keybindname)then self.keybindname=keybindname end
		if(self.keybindname)then
			--TODO NEXT:
			local keybind=self.scenario.game.keys:GetKeybind(self.keybindname)
			self:SetText(keybind)
		end
		if(desc)then self.displayobject.desctext.fontstring:SetText(desc) end
	end
end

do
	local super=XPRACTICE.DisplayObject
	XPRACTICE.KeybindButtonDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.KeybindButtonDisplayObject
	
	function class:CreateDrawable()		
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.drawable=f
		self.drawable.owner=self		
		tinsert(self.drawables,f)
		local f=XPRACTICE.ReusableButtonFrames:GetFrame()		
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
		local f=XPRACTICE.ReusableLeftalignedTextFrames:GetFrame()
		self.desctext=f
		tinsert(self.drawables,f)			
	end
	function class:SetAppearance()
		local linewidth=2
		--self.parentframe=self.owner.environment.hudframe
		self.parentframe=self.owner.environment.frame
		--self.parentframe=UIParent
		self.drawable:SetParent(self.parentframe)
		self.drawable.texture:Show();self.drawable.texture:SetColorTexture(0,0,0,0)		
		self.drawable:Show();self.back:SetAlpha(1)
		self.drawable:SetSize(WIDTH,HEIGHT)
		self.drawable:SetFrameLevel(200)
		self.back:SetParent(self.drawable)
		self.back.texture:Show();self.back.texture:SetColorTexture(0,0,0,0.5)
		self.back:Show();self.back:SetAlpha(1)
		self.back:SetSize(WIDTH/3,HEIGHT)
		self.back:SetPoint("RIGHT",self.drawable,"RIGHT",0,0)
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
		self.desctext:SetParent(self.drawable)
		self.desctext:Show();self.desctext:SetAlpha(1)
		self.desctext:SetPoint("LEFT",self.drawable,"LEFT",0,0)
		--self.desctext:SetAllPoints(self.drawable)
		self.desctext:SetSize(WIDTH*2/3,HEIGHT)
		-- self.desctext:SetSize(WIDTH/3,HEIGHT)
		-- self.desctext:SetPoint("RIGHT",self.drawable,"RIGHT",0,0)		
		self.desctext.fontstring:Show()
		self.desctext.fontstring:SetText("")		
		-- self.extraborder:Show();self.extraborder:SetAlpha(1)
		-- self.extraborder:SetPoint("CENTER",self.back,"CENTER",0,0)
		-- self.extraborder.texture:Show();self.extraborder.texture:SetColorTexture(0,0,0,0)
		-- self.extraborder:SetSize(200,120)		
	end
	function class:SetPositionAndScale(position,scale)
		--self.back:SetPoint("BOTTOMLEFT",self.parentframe,"BOTTOMLEFT",position.x,position.y)
		self.drawable:SetPoint("BOTTOMLEFT",self.parentframe,"BOTTOMLEFT",position.x,position.y)
		--self.drawable:SetAllPoints(self.parentframe)
	end

end
