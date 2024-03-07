	XPRACTICE.SARKARETH2.ApplyAstralFlare=function(player)
		local auras=player.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.SARKARETH2.Aura_AstralFlare)
		if(#auras>0)then
			auras[1].stacks=auras[1].stacks+1
			auras[1].expirytime=auras[1].localtime+auras[1].baseduration
			if(auras[1].stacks>=10)then
				auras[1].stacks=10
			end
			auras[1].multiplier=1+0.1*auras[1].stacks
			return auras[1].stacks
		else
			local aura=player.combatmodule:ApplyAuraByClass(XPRACTICE.SARKARETH2.Aura_AstralFlare,player.combatmodule,player.environment.localtime)
			aura.scenario=player.scenario
			return aura.stacks
		end	
	end	
	
	
	do
		local super=XPRACTICE.PauseableAura
		XPRACTICE.SARKARETH2.Aura_AstralFlare=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.Aura_AstralFlare
		
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.baseduration=23.0
			self.basetickrate=1
		end
		
		-- +10% movespeed per stack (we're manually adjusting multiplier in ApplyAstralFlare)
		function class:SetupNewauraLists(auramodule)
			super.SetupNewauraLists(self,auramodule)
			tinsert(self.auramodulelists,auramodule.speedboost)
			self.multiplier=1.1
		end
		
	end	


 	do
		local super=XPRACTICE.GameObject
		XPRACTICE.SARKARETH2.AstralFlareDebuffIcon=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.AstralFlareDebuffIcon
		
		function class:Setup(environment,x,y,z)
			super.Setup(self,environment,x,y,z)
			self.focus=nil
			self.tex=nil
		end
		
		function class:CreateDisplayObject()
			self.displayobject=XPRACTICE.SARKARETH2.AstralFlareDebuffDisplayObject.new()
			self.displayobject:Setup(self)
		end
		
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			local player=self.focus		
			if(not player)then self.displayobject.drawable:Hide(); return end


			local auras=player.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.SARKARETH2.Aura_AstralFlare)
			if(#auras>0)then			
				local scenario=self.scenario
				self.displayobject.drawable:Show()
				
				if(player.phase==1)then
					self.displayobject.text.fontstring:SetText(string.format("%0.1f",auras[1].expirytime-auras[1].localtime))
				else
					self.displayobject.text.fontstring:SetText(auras[1].stacks)
				end
			else
				self.displayobject.drawable:Hide()
			end
		end

		function class:Draw(elapsed)
			--TODO: maybe move this to base class but check for existence of displayobject?
			self.displayobject:SetPositionAndScale(self.position,self.scale)
		end	
		
		
	end
	
	do
		local super=XPRACTICE.DisplayObject
		XPRACTICE.SARKARETH2.AstralFlareDebuffDisplayObject=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.AstralFlareDebuffDisplayObject
		
		function class:CreateDrawable()		
			local f=XPRACTICE.ReusableFrames:GetFrame()
			self.drawable=f
			self.drawable.owner=self
			self.back=f
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
			self.back.texture:Show();self.back.texture:SetTexture("interface/icons/sha_ability_mage_firestarter_nightborne.blp")
			self.back:Show();self.back:SetAlpha(1)
			self.back:SetSize(100,100)
			self.back:SetFrameLevel(200)				
			
			self.text:Show();self.text:SetAlpha(1)
			self.text:SetParent(self.back)
			--self.text:SetAllPoints(self.icon)
			self.text:SetAllPoints(self.back)
			self.text.fontstring:Show();self.text.fontstring:SetScale(2)
			self.text.fontstring:SetText("")
			self.text:SetFrameLevel(202)
			
		end	
		function class:SetPositionAndScale(position,scale)
			self.back:SetPoint("BOTTOMLEFT",self.parentframe,"BOTTOMLEFT",position.x,position.y)
		end
	
	end
