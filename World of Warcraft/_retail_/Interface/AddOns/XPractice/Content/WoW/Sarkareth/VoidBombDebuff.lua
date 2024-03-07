--NOTE: the debuff itself is "Void Fracture", not "Void Bomb"

do
	local super=XPRACTICE.PauseableAura
	XPRACTICE.SARKARETH2.Aura_VoidBombDebuff=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.Aura_VoidBombDebuff


	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=14.0
		self.basetickrate=1.0
		self.diewhenscenarioends=true
	end
	function class:OnApply(localtime)
		super.OnApply(self,localtime)
		local player=self.targetcombat.mob
		--TODO: also remove Disintegrated and Seared buffs from P1 if they exist
	end

	function class:OnTick(ticktime,percentage)
		super.OnTick(self,ticktime,percentage)
		-- check remaining time and display warnings/overheads if we haven't already
			-- reminder: compare to self.localtime, not self.combatmodule.localtime
	end	
	
	function class:OnRemove()
		super.OnRemove(self)
		local mob=self.targetcombat.mob
		local scenario=mob.scenario
		local x,y=0,0
		if(mob==scenario.player)then
			x,y=mob.position.x,mob.position.y			
			local distsqr=nil
			local tolerance=nil
			local message=nil
			if(self.context=="intermission1")then
				distsqr=XPRACTICE.distsqr(x,y,24.43,23.87)				
				tolerance=4.0
				message="Your Void Bomb will expire moments after you go downstairs. Be on the silver moon marker when that happens."
			elseif(self.context=="bombs1-1")then
				distsqr=XPRACTICE.distsqr(x,y,24.43,23.87)
				tolerance=15.0
				message="Drop your bomb close to the existing holes to avoid hitting another player."				
			elseif(self.context=="bombs1-2")then
				distsqr=XPRACTICE.distsqr(x,y,24.43,23.87)
				tolerance=15.0
				message="Drop your bomb close to the existing holes to avoid hitting another player."				
			elseif(self.context=="bombs2-1" or self.context=="bombs2-2" or self.context=="bombs3-1" or self.context=="bombs3-2")then
				--uh... we don't actually know these.
				distsqr=0
				tolerance=99.0
			elseif(false)then
				-- TODO NEXT: check player x/y position depending on context
			else				
				print("XP: invalid context for VoidBombDebuff")
			end
			if(distsqr and tolerance and distsqr>tolerance*tolerance)then
				scenario:AttemptKillPlayer(mob,true,true,message,20.0)
			end
		else
			if(self.context=="intermission1")then
				x,y=XPRACTICE.RandomPointInCircle(24.43,23.87,2.0)
			else
				print("XP: invalid context for VoidBombDebuff")
			end
			
		end
		scenario.holemanager:AddHole(x,y)
		-- if(mob==scenario.player and scenario.player.phase==1)then
			-- scenario:AttemptKillPlayer(mob,true,true,"Soak damaging effects to go downstairs before your Void Bomb explodes.",5.0)
		-- end		
		
	end
end


	
	do
		local super=XPRACTICE.GameObject
		XPRACTICE.SARKARETH2.VoidBombDebuffIcon=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.VoidBombDebuffIcon
		
		function class:Setup(environment,x,y,z)
			super.Setup(self,environment,x,y,z)
			self.focus=nil
			self.tex=nil
		end
		
		function class:CreateDisplayObject()
			self.displayobject=XPRACTICE.SARKARETH2.VoidBombDebuffDisplayObject.new()
			self.displayobject:Setup(self)
		end
		
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			local player=self.focus		
			if(not player)then self.displayobject.drawable:Hide(); return end


			local auras=player.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.SARKARETH2.Aura_VoidBombDebuff)
			if(#auras>0)then			
				local scenario=self.scenario
				local timer=math.max(auras[1].expirytime-auras[1].localtime,0)
				local timetext=string.format("%0.1f",timer)
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
		XPRACTICE.SARKARETH2.VoidBombDebuffDisplayObject=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.VoidBombDebuffDisplayObject
		
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
			self.back.texture:Show();self.back.texture:SetTexture("interface/icons/spell_priest_divinestar_shadow2.blp")
			self.back:Show();self.back:SetAlpha(1)
			self.back:SetSize(150,150)
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
