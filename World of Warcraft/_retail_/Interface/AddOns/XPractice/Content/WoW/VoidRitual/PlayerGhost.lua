do
	local super=XPRACTICE.Mob
	XPRACTICE.VOIDRITUAL.PlayerGhost=XPRACTICE.inheritsFrom(XPRACTICE.Mob)
	local class=XPRACTICE.VOIDRITUAL.PlayerGhost
	
	local DISABLE_DISTANCE=7
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.targetghostalpha=1
		self.ghostalpha=1
		self.ghostalphamultiplier=0.75		
		self.enabled=true
		self.basemovespeed=14	--ghosts need to cheat to reach the start portal in time, for group 4 CCW
	end	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.ModelSceneActor.new()
		self.displayobject:Setup(self)
		self.displayobject.drawable:SetModelByUnit("player")
	end	
	function class:Step(elapsed)
		super.Step(self,elapsed)
		if(self.scenario and self.scenario.player)then
			local xdist=self.scenario.player.position.x-self.position.x
			local ydist=self.scenario.player.position.y-self.position.y
			local distsqr=xdist*xdist+ydist*ydist
			if(distsqr<DISABLE_DISTANCE*DISABLE_DISTANCE)then
				self.targetghostalpha=0
				self.enabled=false
			else
				self.targetghostalpha=1
				self.enabled=true
			end
			if(self.ghostalpha>self.targetghostalpha)then
				self.ghostalpha=self.ghostalpha-elapsed*0.5
				if(self.ghostalpha<self.targetghostalpha)then self.ghostalpha=self.targetghostalpha end
			end
			if(self.ghostalpha<self.targetghostalpha)then
				self.ghostalpha=self.ghostalpha+elapsed*0.5
				if(self.ghostalpha>self.targetghostalpha)then self.ghostalpha=self.targetghostalpha end
			end			
		end
	end
	function class:GetFinalAlpha()
		local alpha=0
		local fadealpha=1
		if(self.expirytime and self.fadestarttime)then
			fadealpha=1-(self.environment.localtime-self.fadestarttime)/(self.expirytime-self.fadestarttime)
			if(fadealpha>1)then fadealpha=1 end
			if(fadealpha<0)then fadealpha=0 end
		end
		return self.ghostalpha*self.ghostalphamultiplier*fadealpha
	end
	
	function class:Draw(elapsed)
		self.animationmodule:Step(elapsed)
		self.displayobject:SetPositionAndScale(self.position,self.scale)
		self.displayobject:SetOrientation(self.orientation_displayed)
		local a=self:GetFinalAlpha()
		a=XPRACTICE.Clamp(a,0,1)
		self.displayobject:SetAlpha(self:GetFinalAlpha()) --100002-safe
	end	
	
end