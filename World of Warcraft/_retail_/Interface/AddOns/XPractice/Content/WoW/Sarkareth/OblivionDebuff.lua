 	do
		local super=XPRACTICE.GameObject
		XPRACTICE.SARKARETH2.OblivionDebuffIcon=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.OblivionDebuffIcon
		
		function class:Setup(environment,x,y,z)
			super.Setup(self,environment,x,y,z)
			self.focus=nil
			self.tex=nil
		end
		
		function class:CreateDisplayObject()
			self.displayobject=XPRACTICE.SARKARETH2.OblivionDebuffDisplayObject.new()
			self.displayobject:Setup(self)
		end
		
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			local player=self.focus		
			if(not player)then self.displayobject.drawable:Hide(); return end


			local auras=player.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.SARKARETH2.Aura_Oblivion)
			if(#auras>0)then			
				local scenario=self.scenario
				self.displayobject.drawable:Show()
				self.displayobject.text.fontstring:SetText(auras[1].stacks)
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
		XPRACTICE.SARKARETH2.OblivionDebuffDisplayObject=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.OblivionDebuffDisplayObject
		
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
			self.back.texture:Show();self.back.texture:SetTexture("interface/icons/inv_cosmicvoid_orb.blp")
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
