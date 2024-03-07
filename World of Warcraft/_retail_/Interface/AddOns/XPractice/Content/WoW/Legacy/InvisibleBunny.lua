	do
		local super=XPRACTICE.Mob
		XPRACTICE.LEGACY.CrimsonCabalist=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.LEGACY.CrimsonCabalist

		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.scale=1.5

			--self.alpha=0  -- if invisible bunny
		end
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByCreatureDisplayID(93611)	
		end
		function class:PlayIdleAnimation()
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ChannelCastOmni)
		end
	end
