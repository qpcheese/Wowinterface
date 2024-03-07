do
	local super=XPRACTICE.PauseableAura
	XPRACTICE.SARKARETH2.Aura_EmptinessDebuff=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.Aura_EmptinessDebuff


	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=20.0
		self.basetickrate=20.0
		self.tickdelay=20.0
		self.diewhenscenarioends=true
	end

	
	function class:OnExpiry()
		super.OnExpiry(self)
		local mob=self.targetcombat.mob
		local scenario=self.scenario
		if(mob==scenario.player)then
			scenario:AttemptKillPlayer(mob,true,false,"Run through all 3 Mind Fragment circles before Emptiness Between Stars expires.",10.0)
		end
		
	end
end


	
	do
		local super=XPRACTICE.GameObject
		XPRACTICE.SARKARETH2.EmptinessDebuffIcon=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.EmptinessDebuffIcon
		
		function class:Setup(environment,x,y,z)
			super.Setup(self,environment,x,y,z)
			self.focus=nil
			self.tex=nil
		end
		
		function class:CreateDisplayObject()
			self.displayobject=XPRACTICE.SARKARETH2.EmptinessDebuffDisplayObject.new()
			self.displayobject:Setup(self)
		end
		
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			local player=self.focus		
			if(not player)then self.displayobject.drawable:Hide(); return end


			local auras=player.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.SARKARETH2.Aura_EmptinessDebuff)
			local auras2=player.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.SARKARETH2.Aura_VoidBombDebuff)
			if(#auras>0 and #auras2==0)then			
				local scenario=self.scenario
				local timer=math.max(auras[1].expirytime-auras[1].localtime,0)
				local timetext=string.format("%0.1f",timer)
				local circletimer=self.scenario.downstairsmanager.circletimer
				if(circletimer)then
					if(circletimer<timer)then
						local leftover=timer-circletimer
						--timetext=string.format("%0.1f",circletimer).."\n"..string.format("%0.1f",leftover)
						timetext=string.format("%0.1f\n(+%0.1f)",circletimer,leftover)
					end
				end
				
				
				self.displayobject.drawable:Show()
				self.displayobject.text.fontstring:SetText(timetext)
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
		XPRACTICE.SARKARETH2.EmptinessDebuffDisplayObject=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.EmptinessDebuffDisplayObject
		
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
			self.back.texture:Show();self.back.texture:SetTexture("interface/icons/inv_cosmicvoid_buff.blp")
			self.back:Show();self.back:SetAlpha(1)
			self.back:SetSize(150,150)
			self.back:SetFrameLevel(200)				
			
			self.text:Show();self.text:SetAlpha(1)
			self.text:SetSize(150,150)
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
