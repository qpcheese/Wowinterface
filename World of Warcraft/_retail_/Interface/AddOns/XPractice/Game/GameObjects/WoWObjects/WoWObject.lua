do
	local super=XPRACTICE.GameObject
	XPRACTICE.WoWObject=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.WoWObject

	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		
		self.animationmodule=XPRACTICE.AnimationModule.new()
		self.animationmodule:Setup(self)
		self:SetDefaultAnimation()				
	end
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.projectilespawncustomduration=0.5
		self.projectileloopcustomduration=2.0
		self.projectiledespawncustomduration=0.5
		self.visiblefromallphases=false		
		self.targetable=true
		self.displayedpositionoffset={x=0,y=0,z=0}
	end
	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.ModelSceneActor.new()
		self.displayobject:Setup(self)
	end
	
	-- shortcut function to avoid defining a new DisplayObject_ModelSceneActor for every wowobject
	function class:SetInitialPositionViaOwner(actor)
		actor:SetPosition(self.position.x+self.displayedpositionoffset.x,self.position.y+self.displayedpositionoffset.y,self.position.z+self.displayedpositionoffset.z)
	end
	-- shortcut function to avoid defining a new DisplayObject_ModelSceneActor for every wowobject
	function class:SetActorAppearanceViaOwner(actor)
		--if(not XPRACTICE.PTR) then actor:SetModelByFileID(1) end		
		if(not XPRACTICE.PTR) then actor:SetModelByCreatureDisplayID(317) end		
	end	
	function class:SetDisplayObjectCustomBoundingBoxViaOwner(displayobject)
		displayobject.customboundingbox=nil
	end
	
	function class:SetDefaultAnimation()
		--override
	end
	
	function class:OnClick(player,environment,button)
		player:SetTargetMob(self)
		environment:SelectMob(self)
		if(button==2)then
			player.combatmodule:StartAutoAttacking()
		end
	end
	
	function class:Draw(elapsed)
	
		self.animationmodule:Step(elapsed)
	
		--self.displayobject:PlayAnimation(17)	-- #17 pretty reliably has multiple sequences
		--self.displayobject:PlayAnimation(5)	-- Run
		--self.displayobject:PlayAnimation(0)
		--self.displayobject:PlayAnimation(158)			
		
		
		local fadealpha=1
		if(self.expirytime and self.fadestarttime)then
			fadealpha=1-(self.environment.localtime-self.fadestarttime)/(self.expirytime-self.fadestarttime)
			if(fadealpha>1)then fadealpha=1 end
			if(fadealpha<0)then fadealpha=0 end
		end
		
		
		if(self:ExistsInPhase())then
			self.phasealpha=self.phasealpha+1*elapsed
		else
			self.phasealpha=self.phasealpha-1*elapsed
		end
		if(self.phasealpha>1)then self.phasealpha=1 end
		if(self.phasealpha<0)then self.phasealpha=0 end
		

		local phasealpha=self.phasealpha
		local alpha=fadealpha*phasealpha*self.alpha
		--print("alpha",self.alpha)
		
		local scale=self.scale
		if(alpha==0)then
			-- -- (OBSOLETE:)
			-- -- some models (i.e. Psychus) don't disappear correctly at alpha=0
			-- -- so we also set scale to 0 to hide them completely
			-- -- (note that we can't set it to *exactly* 0 or the SetScale will be ignored)
			-- --scale=.01
			-- new method: just call SetShown
			self.displayobject.drawable:SetShown(false)
		else
			self.displayobject.drawable:SetShown(true)
		end
		
		self.displayobject:SetPositionAndScale(self.position,scale,self.displayedpositionoffset)
		self.displayobject:SetOrientation(self.orientation_displayed)
		
		

		
		--TODO: check for auras		
		self.displayobject:SetAlpha(XPRACTICE.Clamp(alpha,0,1))
		
	end
	
	
	
	function class:OnProjectileDespawning()
		--override.  called from AnimationModule:PlayAnimation when the new animation name is "ProjectileDespawnCustomDuration".
	end
	function class:OnProjectileDespawned()
		--override.  called from AnimationModule:PlayAnimation when animation "ProjectileDespawnCustomDuration" finishes playing.		
		self:Die()
	end	
	
	function class:GetAuraAnimation()
		--override.  WoWObjects do not have auras, but Mobs do.
		return nil
	end
end