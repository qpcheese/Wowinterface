do
	local LEFTLINEWIDTH=50
	local PADDING=20
	do
		local super=XPRACTICE.GameObject
		XPRACTICE.MenuSeparator=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.MenuSeparator
		
		function class:Setup(environment,x,y,z)
			super.Setup(self,environment,x,y,z)
			--IMPORTANT: remember to enable/disable mouse when changing button's targetalpha
			self.alpha=1
			self.targetalpha=1		
		end

		function class:CreateDisplayObject()
			self.displayobject=XPRACTICE.MenuSeparatorDisplayObject.new()
			self.displayobject:Setup(self)
		end
		
		function class:SetSize(wid,hgt)
			self.displayobject.drawable:SetSize(wid,hgt)
		end
		
		function class:SetWidth(width)
			self.width=width or self.environment.game.SCREEN_WIDTH-100
			self.displayobject.back:SetWidth(self.width)
			--self.displayobject.rightline:SetWidth(self.width-LEFTLINEWIDTH-self.displayobject.text.fontstring:GetStringWidth()-PADDING*2)
			local linewidth=(self.width-self.displayobject.text.fontstring:GetStringWidth()-PADDING*2)/2
			self.displayobject.leftline:SetWidth(linewidth)
			self.displayobject.rightline:SetWidth(linewidth)
		end
			
		function class:SetText(text)
			self.displayobject.text.fontstring:SetText(text)
			self.displayobject.text:SetWidth(self.displayobject.text.fontstring:GetStringWidth())
			self:SetWidth(self.width)
		end
		
		function class:SetIcon(icon)		
			if(not icon)then
				self.displayobject.back.texture:SetTexture("interface/icons/inv_misc_questionmark.blp")	
			else			
				self.displayobject.back.texture:SetTexture(icon)
			end
		end
		
				
		function class:Draw(elapsed)
			self.displayobject:SetPositionAndScale(self.position,self.scale)
		end	
		
	end
	

	do
		local super=XPRACTICE.DisplayObject
		XPRACTICE.MenuSeparatorDisplayObject=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.MenuSeparatorDisplayObject
		
		function class:CreateDrawable()		
			local f=XPRACTICE.ReusableButtonFrames:GetFrame()
			self.drawable=f
			self.drawable.owner=self
			self.back=f
			tinsert(self.drawables,f)
			local f=XPRACTICE.ReusableFrames:GetFrame()
			self.leftline=f
			tinsert(self.drawables,f)		
			local f=XPRACTICE.ReusableFrames:GetFrame()
			self.rightline=f
			tinsert(self.drawables,f)		
			local f=XPRACTICE.ReusableFrames:GetFrame()
			self.text=f
			tinsert(self.drawables,f)
		
		end
		function class:SetAppearance()
			local linewidth=2
			--self.parentframe=self.owner.environment.hudframe
			self.parentframe=self.owner.environment.frame
			--self.parentframe=UIParent
			self.back:SetParent(self.parentframe)
			self.back.texture:Hide()
			self.back:Show();self.back:SetAlpha(1)
			self.back:SetSize(10,10)
			self.back:SetFrameLevel(200)
			self.leftline:SetParent(self.back)
			self.leftline.texture:Show();self.leftline.texture:SetColorTexture(1,1,1,1)
			self.leftline:Show();self.leftline:SetAlpha(1)
			self.leftline:SetPoint("LEFT",self.back,"LEFT",0,0)
			self.leftline:SetWidth(LEFTLINEWIDTH)
			self.leftline:SetHeight(linewidth)			
			self.rightline:SetParent(self.back)
			self.rightline.texture:Show();self.rightline.texture:SetColorTexture(1,1,1,1)
			self.rightline:Show();self.rightline:SetAlpha(1)
			self.rightline:SetPoint("RIGHT",self.back,"RIGHT",0,0)
			--self.rightline:SetWidth(500)
			self.rightline:SetWidth(LEFTLINEWIDTH)
			self.rightline:SetHeight(linewidth)			
			self.text:SetParent(self.back)
			self.text:Show();self.text:SetAlpha(1)
			--self.text:SetPoint("LEFT",self.back,"LEFT",LEFTLINEWIDTH+PADDING,0)
			self.text:SetPoint("CENTER",self.back,"CENTER",0,0)
			self.text:SetSize(640,30)
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
	
end