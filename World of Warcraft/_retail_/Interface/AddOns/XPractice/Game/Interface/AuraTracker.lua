do
	local super=XPRACTICE.GameObject
	XPRACTICE.AuraTracker=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.AuraTracker
	
	local FLASHRATE=0.25
	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		self.focus=nil
		self.trackedauraclass=nil
		self.trackedauralist=nil
		self.flashstate=false
		self.flashtimer=FLASHRATE
	end
	
	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.AuraTrackerDisplayObject.new()
		self.displayobject:Setup(self)
	end
	
	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		print("STEP1")
		if(self.focus)then
		print("STEP2")
			local auras=self.focus.combatmodule.auras:GetAurasByClassIfExist(self.trackedauraclass)
			print("STEP3")
			if(#auras>0)then			
			print("STEP4")
				local aura=auras[1]
				self.displayobject.drawable:Show()				
				self.displayobject.icon.texture:SetTexture(aura:GetIcon())
				if(aura.stacks<=1)then
					self.displayobject.text.fontstring:SetText("")
				else
					if(aura.minimumflashstacks and aura.stacks>=aura.minimumflashstacks)then
						self.flashtimer=self.flashtimer-elapsed	
						--print(self.flashstate)
						if(self.flashtimer<=0)then
							self.flashstate=not self.flashstate
							self.flashtimer=FLASHRATE
						end
					else
						self.flashstate=false
						self.flashtimer=FLASHRATE
					end
					local colortag
					if(not self.flashstate)then
						colortag="|cffffffff"						
					else
						colortag="|cffff0000"
					end					
					local resettag="|r"
					self.displayobject.text.fontstring:SetText(colortag..tostring(aura.stacks)..resettag)
				end				
				local fillpercent=(aura.expirytime-self.focus.combatmodule.localtime)/aura.maximumdisplayedtimeremaining
				if(fillpercent>=1)then fillpercent=1 end				
				self:SetFillWidth(fillpercent)
			else
				self.displayobject.drawable:Hide()
			end
		else
			self.displayobject.drawable:Hide()
		end		
	end

	function class:SetFillWidth(fillpercent)
		local fillwidth=fillpercent*196
		if(fillwidth<1)then fillwidth=1 end
		if(fillwidth>196)then fillwidth=196 end
		self.displayobject.fill:SetWidth(fillwidth)	
	end

	
	
	function class:Draw(elapsed)
		self.displayobject:SetPositionAndScale(self.position,self.scale)
	end	
	
end


do
	local super=XPRACTICE.DisplayObject
	XPRACTICE.AuraTrackerDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.AuraTrackerDisplayObject
	
	function class:CreateDrawable()		
		--local f=XPRACTICE.ReusableButtonFrames:GetFrame()
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.drawable=f
		self.drawable.owner=self
		self.back=f
		tinsert(self.drawables,f)
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.fill=f
		tinsert(self.drawables,f)
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.icon=f
		tinsert(self.drawables,f)
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.text=f
		tinsert(self.drawables,f)
	end
	function class:SetAppearance()
		--self.parentframe=self.owner.environment.hudframe
		self.parentframe=self.owner.environment.frame
		--self.parentframe=UIParent
		self.back:SetParent(self.parentframe)
		self.back.texture:Show();self.back.texture:SetColorTexture(0,0,0,0.5)		
		self.back:Show();self.back:SetAlpha(1)
		self.back:SetSize(196,25)
		self.back:SetFrameLevel(200)
				
		self.fill:Show();self.fill:SetAlpha(1)
		self.fill.texture:Show();self.fill.texture:SetColorTexture(0.9,0.9,0.9,1)
		self.fill:SetParent(self.back)
		self.fill:SetPoint("LEFT",self.back,"LEFT",0,0)		
		self.fill:SetSize(196,25)
		self.fill:SetFrameLevel(201)
		
		self.icon:Show();self.icon:SetAlpha(1)
		self.icon:SetParent(self.back)
		self.icon:SetPoint("RIGHT",self.back,"LEFT",0,0)
		self.icon.texture:Show();self.icon.texture:SetTexture("interface/icons/inv_misc_questionmark.blp")
		self.icon:SetSize(25,25)
		self.icon:SetFrameLevel(201)
		
		self.text:Show();self.text:SetAlpha(1)
		self.text:SetParent(self.icon)
		--self.text:SetAllPoints(self.icon)
		self.text:SetAllPoints(self.back)
		self.text.fontstring:Show();self.text.fontstring:SetScale(0.9)
		self.text.fontstring:SetText("")
		self.text:SetFrameLevel(202)
		
	end	
	function class:SetPositionAndScale(position,scale)
		self.back:SetPoint("BOTTOMLEFT",self.parentframe,"BOTTOMLEFT",position.x,position.y)
	end

	
end
	