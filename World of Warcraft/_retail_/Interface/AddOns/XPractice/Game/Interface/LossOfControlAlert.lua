do
	local super=XPRACTICE.GameObject
	XPRACTICE.LossOfControlAlert=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.LossOfControlAlert
	
	function class:Setup(environment)
		super.Setup(self,environment)
		self.focus=nil
		self.aura=nil
	end
	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.LossOfControlAlertDisplayObject.new()
		self.displayobject:Setup(self)
	end
	
	-- function class:SetSize(wid,hgt)
		-- self.displayobject.drawable:SetSize(wid,hgt)
	-- end
	

	function class:Step(elapsed)
		super.Step(self,elapsed)
		if(tonumber(XPRACTICE.CVars.cvarvalues["lossOfControl"])>0)then
			if(tonumber(XPRACTICE.CVars.cvarvalues["lossOfControlFull"])>0)then
					
				if(self.focus)then
				
					local fillpercent=0
					local auracount=#self.focus.combatmodule.auras.lossofcontrolalert
					if(auracount>0)then				
						self.displayobject.drawable:Show()
						local aura=self.focus.combatmodule.auras.lossofcontrolalert[auracount]
						local line1=" ".."|cffffff00"..aura:GetLOCAText().."|r"
						local line2=" "..string.format("%0.1f", aura.expirytime-aura.targetcombat.localtime).." seconds"
						self.displayobject.text.fontstring:SetText(line1.."\n"..line2)
						--self.displayobject.drawable.texture:SetTexture(aura:GetLOCAIcon())
						self.displayobject.icon.texture:SetTexture(aura:GetLOCAIcon())
						self.displayobject.drawable:SetAlpha(1)
						--CooldownFrame_Set(self.displayobject.cooldown,0,0,false)
						if(self.aura~=aura)then
							self.aura=aura
							--self.displayobject.cooldown:SetLossOfControlCooldown(aura.startrealtime, aura.baseduration)	-- lua error
							--self.displayobject.cooldown.currentCooldownType = COOLDOWN_TYPE_LOSS_OF_CONTROL	-- no effect?														
							self.displayobject.cooldown:SetHideCountdownNumbers(false)	-- note that the cvar "countdownForCooldowns" will override this setting no matter what
							self.displayobject.cooldown:SetCooldownDuration(aura.baseduration)
						end
						
					else
						self.displayobject.drawable:Hide()
					end				
				end
			end		
		end
	end	
	
	function class:Draw(elapsed)
		self.displayobject:SetPositionAndScale(self.position,self.scale)
	end		
end

do
	local super=XPRACTICE.DisplayObject
	XPRACTICE.LossOfControlAlertDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.LossOfControlAlertDisplayObject

	
	function class:CreateDrawable()		
		-- don't call super
		
		
		self.drawables={}
		self.drawable=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.drawable)		
		self.background=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.background)				
		self.icon=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.icon)
		self.cooldown=XPRACTICE.ReusableCooldownFrames:GetFrame()
		--self.cooldown=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.cooldown)
		self.text=XPRACTICE.ReusableLeftalignedTextFrames:GetFrame()
		tinsert(self.drawables,self.text)
		self.top=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.top)
		self.bottom=XPRACTICE.ReusableFrames:GetFrame()
		tinsert(self.drawables,self.bottom)	
	end


	function class:SetAppearance()
		--local WIDTH=180
		--local WIDTH=210
		local WIDTH=256
		local XOFFSET=-40
		
		-- don't call super
		self.parentframe=self.owner.environment.frame
		
		--TODO: center-justification on background (currently expects "icon" to be primary anchor point)
		self.drawable:SetParent(self.parentframe)
		self.drawable.texture:Show()
		self.drawable:Show();self.drawable:SetAlpha(1)
		self.drawable:SetSize(50,50)
		self.drawable:SetFrameLevel(200)
		self.background:SetParent(self.drawable)		
		self.background:Show();self.background:SetAlpha(1)
		self.background.texture:Show()
		self.background.texture:SetTexture("interface/cooldown/loc-shadowbg.blp")
		self.background:SetPoint("TOPLEFT",self.drawable,"TOPLEFT",XOFFSET,0)
		self.background:SetSize(WIDTH,50)
		--self.background:SetFrameLevel(200)		
		self.icon:SetParent(self.background)
		self.icon.texture:Show()
		self.icon:Show();self.icon:SetAlpha(1)
		self.icon.texture:SetTexture("interface\\icons\\spell_frost_stun.blp")
		self.icon:SetSize(50,50)	
		self.icon:SetAllPoints(self.drawable)
		--self.icon:SetFrameLevel(201)
		self.cooldown:SetParent(self.icon)
		self.cooldown:Show();self.cooldown:SetAlpha(1)
		self.cooldown:SetAllPoints(self.drawable)
		--self.cooldown:SetFrameLevel(202)
		self.cooldown.texture:Hide()
		self.text:SetParent(self.background)
		self.text:Show();self.text:SetAlpha(1)
		self.text:SetPoint("TOPLEFT",self.drawable,"TOPRIGHT",0,0)		
		--self.text:SetSize(100,30)	
		self.text:SetSize(150,50)	
		self.text.fontstring:SetFont("Fonts\\FRIZQT__.TTF",20,"OUTLINE")
		self.text.fontstring:SetText(" |cffffff00Stunned|r\n ")	
		self.text.fontstring:SetText(" |cffffff00Horrified|r\n 2.4 seconds")	
		self.text.fontstring:Show()
		self.top:SetParent(self.background)
		self.top:Show();self.top:SetAlpha(1)
		--self.top:SetPoint("BOTTOMLEFT",self.drawable,"TOPLEFT",-20,0)
		self.top:SetPoint("BOTTOMLEFT",self.drawable,"TOPLEFT",XOFFSET,0)
		self.top:SetSize(WIDTH,20)
		self.top.texture:Show()
		self.top.texture:SetTexture("interface/cooldown/loc-redline.blp")
		self.bottom:SetParent(self.background)
		self.bottom:Show();self.bottom:SetAlpha(1)
		--self.bottom:SetPoint("TOPLEFT",self.drawable,"BOTTOMLEFT",-20,0)
		self.bottom:SetPoint("TOPLEFT",self.drawable,"BOTTOMLEFT",XOFFSET,0)
		self.bottom:SetSize(WIDTH,20)
		self.bottom.texture:Show()
		self.bottom.texture:SetTexture("interface/cooldown/loc-redline.blp")
		self.bottom.texture:SetRotation(math.pi)

		
		self.drawable:Hide()
		
	end
	
	
	function class:SetPositionAndScale(position,scale)			
		--self.back:SetPoint("BOTTOMLEFT",self.parentframe,"BOTTOMLEFT",position.x,position.y)
		self.drawable:SetPoint("BOTTOMLEFT",self.parentframe,"BOTTOMLEFT",position.x,position.y)
		--self.drawable:SetAllPoints(UIParent)
	end	

end