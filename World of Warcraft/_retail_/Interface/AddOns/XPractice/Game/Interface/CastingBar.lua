do
	--TODO: inherit from SpellButton instead!
	local super=XPRACTICE.GameObject
	XPRACTICE.CastingBar=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.CastingBar
	
	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		self.focus=nil
		self.nameplate=nil
	end
	
	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.CastingBarDisplayObject.new()
		self.displayobject:Setup(self)
	end
	
	function class:AnchorToNameplate(nameplate)
		self.nameplate=nameplate
	end
	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		if(self.nameplate and self.nameplate.dead)then
			self:Die()
		end
		--print("castbar",self)
		local interruptable=-1
		local spellicon=-1
		if(self.focus)then
			local fillpercent=0
			--print("castbar2",self.focus,self.focus.combatmodule,self.focus.combatmodule.castedspell,self.focus.combatmodule.channeledspell)
			if(self.focus.combatmodule.castedspell)then				
				if(self.focus.combatmodule.castedspell:GetCastDuration()>0)then
					if(self.focus.combatmodule.castedspell.spellbookspell.hidecastbar==false)then						
						self.displayobject.drawable:Show()
						self.displayobject.drawable:SetAlpha(1)
						self:SetSpellFlashAlpha(0)
						--TODO: unpack(self.focus.combatmodule.castedspell.spellbookspell.castingbarcolor)
						self:SetFillTexture()
						self.displayobject.text.fontstring:SetText(self.focus.combatmodule.castedspell.spellbookspell:GetName())
						fillpercent=self.focus.combatmodule.castedspell.castprogress
						interruptable=self.focus.combatmodule.castedspell:IsInterruptable()
						spellicon=self.focus.combatmodule.castedspell.icon
					end
				end				
			elseif(self.focus.combatmodule.channeledspell)then
				if(self.focus.combatmodule.channeledspell:GetChannelDuration()>0)then
					if(self.focus.combatmodule.channeledspell.spellbookspell.hidecastbar==false)then
						self.displayobject.drawable:Show()
						self.displayobject.drawable:SetAlpha(1)
						self:SetSpellFlashAlpha(0)
						--TODO: unpack(self.focus.combatmodule.channeledspell.spellbookspell.castingbarcolor)
						self:SetFillTexture()
						self.displayobject.text.fontstring:SetText(self.focus.combatmodule.channeledspell.spellbookspell:GetName())
						fillpercent=1-self.focus.combatmodule.channeledspell.channelprogress
						interruptable=self.focus.combatmodule.channeledspell:IsInterruptable()
						spellicon=self.focus.combatmodule.channeledspell.icon
					end
				end
			elseif(self.focus.combatmodule.spellflash)then
				self:SetSpellFlash()
			else
				self.displayobject.drawable:Hide()
			end
			
			if(interruptable~=-1)then
				if(self.displayobject.shield)then
					if(interruptable)then
						self.displayobject.shield:Hide()
					else
						self.displayobject.shield:Show()
					end
				end
			end
			if(spellicon~=-1)then
				if(self.displayobject.spellicon)then
					self.displayobject.spellicon.texture:SetTexture(spellicon)
				end				
			end
			
			self:SetFillWidth(fillpercent)
		end		
	end
	function class:SetFillTexture()
		self.displayobject.fill.texture:SetColorTexture(1,0.7,0,1)
	end
	function class:SetFillWidth(fillpercent)
		local fillwidth=fillpercent*196
		if(fillwidth<1)then fillwidth=1 end
		if(fillwidth>196)then fillwidth=196 end
		self.displayobject.fill:SetWidth(fillwidth)	
	end
	function class:SetSpellFlash()
		self.displayobject.drawable:Show()
		local alpha=self.focus.combatmodule.spellflash.alpha
		if(alpha>1)then alpha=1 end
		self:SetSpellFlashAlpha(alpha)
		self.displayobject.flash:SetAlpha(1)
		self.displayobject.text.fontstring:SetText(self.focus.combatmodule.spellflash.text)
		self.displayobject.fill.texture:SetColorTexture(unpack(self.focus.combatmodule.spellflash.fillRGBA))
		fillpercent=self.focus.combatmodule.spellflash.fillpercent
		-- can't unpack multiple tables (or the same table twice) in the same call!
		local rgba=self.focus.combatmodule.spellflash.flashRGBA
		if(XPRACTICE.TOCVersion>=100000)then
			self.displayobject.flash.texture:SetGradient("HORIZONTAL",CreateColor(rgba[1],rgba[2],rgba[3],rgba[4]),CreateColor(rgba[1],rgba[2],rgba[3],rgba[4]))
		else
			self.displayobject.flash.texture:SetGradientAlpha("HORIZONTAL",rgba[1],rgba[2],rgba[3],rgba[4],rgba[1],rgba[2],rgba[3],rgba[4]) --pre-100002
		end
	end
	function class:SetSpellFlashAlpha(alpha)
		self.displayobject.flash:SetAlpha(XPRACTICE.Clamp(alpha,0,1))
	end
	
	
	function class:Draw(elapsed)
		self.displayobject:SetPositionAndScale(self.position,self.scale)
	end	
	
end


do
	local super=XPRACTICE.DisplayObject
	XPRACTICE.CastingBarDisplayObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.CastingBarDisplayObject
	
	function class:CreateDrawable()		
		--local f=XPRACTICE.ReusableButtonFrames:GetFrame()
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.drawable=f
		self.drawable.owner=self
		self.back=f
		tinsert(self.drawables,f)
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.text=f
		tinsert(self.drawables,f)
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.border=f
		tinsert(self.drawables,f)
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.fill=f
		tinsert(self.drawables,f)
		local f=XPRACTICE.ReusableFrames:GetFrame()
		self.flash=f
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
		self.back.texture:Show();self.back.texture:SetColorTexture(0,0,0,0.5)		
		self.back:Show();self.back:SetAlpha(1)
		self.back:SetSize(196,18)
		self.back:SetFrameLevel(200)
				
		self.fill:Show();self.fill:SetAlpha(1)
		self.fill.texture:Show();self.fill.texture:SetColorTexture(1,0.7,0,1)
		self.fill:SetParent(self.back)
		self.fill:SetPoint("LEFT",self.back,"LEFT",0,0)		
		self.fill:SetSize(196,18)
		self.fill:SetFrameLevel(201)
		
		self.border:Show();self.border:SetAlpha(1)
		self.border:SetParent(self.back)
		self.border:SetPoint("CENTER",self.back,"CENTER",0,0)
		self.border.texture:Show();self.border.texture:SetTexture("interface/castingbar/ui-castingbar-border.blp")
		self.border:SetSize(256,64)
		self.border:SetFrameLevel(202)
		
		self.text:Show();self.text:SetAlpha(1)
		self.text:SetParent(self.back)
		self.text:SetAllPoints(self.back)
		self.text.fontstring:Show();self.text.fontstring:SetScale(0.9)
		self.text.fontstring:SetText("")
		self.text:SetFrameLevel(203)
		
		self.flash:Show();self.flash:SetAlpha(1)
		self.flash:SetParent(self.back)
		self.flash:SetPoint("CENTER",self.back,"CENTER",0,0)
		self.flash.texture:Show();self.flash.texture:SetTexture("interface/castingbar/ui-castingbar-flash.blp")
		self.flash:SetSize(256,64)
		self.flash:SetFrameLevel(202)
		
		-- self.spark:Show();self.spark:SetAlpha(1)
		-- self.spark:SetParent(self.back)
		-- self.spark:SetPoint("CENTER",self.back,"CENTER",0,0)
		-- self.spark.texture:Show();self.spark.texture:SetTexture("interface/castingbar/ui-castingbar-spark.blp")
		-- self.spark:SetSize(32,32)		
		
	end	
	function class:SetPositionAndScale(position,scale)
		if(self.owner.nameplate)then
			self.back:SetPoint("TOP",self.owner.nameplate.displayobject.drawable,"BOTTOM",0,0)
		else
			self.back:SetPoint("BOTTOMLEFT",self.parentframe,"BOTTOMLEFT",position.x,position.y)
		end
		--self.drawable:SetAllPoints(self.parentframe)
	end

	
end
	