
do
	local super=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Murloc
	XPRACTICE.SARKARETH2.CPUPlayer=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.CPUPlayer
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.targetghostalpha=1
		self.ghostalpha=1
		self.ghostalphamultiplier=1.0
		self.enabled=false
		self.destx=nil
		self.desty=nil
		self.multidestx=nil
		self.multidesty=nil
		self.playername="CPU"
		--self.index is initialized before calling setup
		
	end	
	function class:CreateDisplayObject()
		self.displayobject=XPRACTICE.ModelSceneActor.new()
		self.displayobject:Setup(self)
		if(self.index==1)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(63703) -- mayla
			self.playername="Mayla"
		elseif(self.index==2)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(31177) -- genn
			self.playername="Genn"
		elseif(self.index==3)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(41667) -- aysa
			self.playername="Aysa"
		elseif(self.index==4)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(82772) -- moira
			self.playername="Moira"
		elseif(self.index==5)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(93384) -- nisha
			self.playername="Nisha"
		elseif(self.index==6)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(85799) -- lilian
			self.playername="Lilian"			
		elseif(self.index==7)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(67812) -- murky
			self.playername="Murky"
			self.murloc=true
			-- "Fatal Finesse (##) on Murky"
			-- "Skrgl mrrrggk (N) br mmmrk"
		elseif(self.index==8)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(26365) -- valeera
			self.playername="Valeera"
		elseif(self.index==9)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(64797) -- gamon
			self.playername="Gamon"
		elseif(self.index==10)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(79658) -- t'paartos
			self.playername="T'paartos"
		elseif(self.index==11)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(26353) -- brann
			self.playername="Brann"		
		elseif(self.index==12)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(89342) -- garona
			self.playername="Garona"
		elseif(self.index==13)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(29814) -- wilfred
			self.playername="Wilfred"			
		elseif(self.index==14)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(67345) -- thalyssra
			self.playername="Thalyssra"
		elseif(self.index==15)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(71591) -- akama
			self.playername="Akama"
		elseif(self.index==16)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(35095) -- malfurion
			self.playername="Malfurion"			
		elseif(self.index==17)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(90805) -- gazlowe
			self.playername="Gazlowe"
		elseif(self.index==18)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(78345) -- alleria
			self.playername="Alleria"
		elseif(self.index==19)then
			--self.displayobject.drawable:SetModelByCreatureDisplayID(31232) -- voljin
			--self.playername="Vol'jin"
			self.displayobject.drawable:SetModelByCreatureDisplayID(75898) -- talanji
			self.playername="Talanji"			
		elseif(self.index==20)then
			self.displayobject.drawable:SetModelByCreatureDisplayID(87892) -- jaina
			self.playername="Jaina"
		else
			self.displayobject.drawable:SetModelByUnit("player")
		end
	end	
	function class:PlayIdleAnimation()
		if(self.index<=10)then
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Ready1H)
		elseif(self.index>=11)then
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ReadySpellDirected)
			--self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.MagReadySpellCast)
		else
			self.animationmodule:PlayAnimation(XPRACTICE.AnimationList.Idle)
		end
	end	
	function class:CreateCombatModule()
		super.CreateCombatModule(self)
		local spell_roll=XPRACTICE.Spell_Roll.new()
		spell_roll:Setup(self.combatmodule)
		--TODO: don't hardcode roll.  it's already spellbook[1]
		self.combatmodule.spellbook.roll=spell_roll
	end	
	
	
	
	--TODO: this logic is a mess -- for now, removed stutterstep
	function class:ApproachPoint(x,y,mindistance,maxdistance,override)		
		--does not include reactiontime.  
		--if function returns false, do not set reactiontime -- destx/y are nil
		local distx=x-self.position.x
		local disty=y-self.position.y
		if(not self.cpu and not self.mirrorrealm)then
			--!!!
			distx=x-self.scenario.fakerangedcamp.x
			disty=y-self.scenario.fakerangedcamp.y
			--print("Approach as if standing on",distx,disty)
		end		
		
		local distsqr=distx*distx+disty*disty
		local dist=math.sqrt(distsqr)
		if(dist==0)then dist=1 end
		local targetdist=XPRACTICE.RandomNumberInBetween(mindistance,maxdistance)		
		

	
		-- --print("real targetdist",targetdist)
		-- if(self.stutterstep)then
			-- local multitargetalreadyexists=true
			-- if(self.multidestx)then
				-- multitargetalreadyexists=true				
			-- end
			-- if(not self.multidestx) then
				-- self.multidestx=x-(distx*targetdist/dist)		
				-- self.multidesty=y-(disty*targetdist/dist)		
			-- end		
			-- local stutterdist
			-- if(dist<self.ignorestutterstepdistance)then
				-- stutterdist=XPRACTICE.RandomNumberInBetween(5.0,10.0)
				-- targetdist=dist-stutterdist
			-- else
				-- stutterdist=XPRACTICE.RandomNumberInBetween(0.1,2.0)
				-- targetdist=self.ignorestutterstepdistance+stutterdist
			-- end				
			-- if(multitargetalreadyexists)then
				-- if(stutterdist>dist)then
					-- return false
				-- end
			-- end
		-- end
		-- -- not the same as self.destx/y -- might have changed due to stutterstep

		self.destx=x-(distx*targetdist/dist)		
		self.desty=y-(disty*targetdist/dist)	
		

		
		if(override)then
			self.ai:SetTargetPosition(self.destx,self.desty)
			--otherwise nothing happens until we reach existing target OR remainingreactiontime reaches zero
		end
		return true
		--print("approach",self.destx,self.desty)
	end
	
	-- function class:OnArrivedAtAIDestination()
		-- if(self.stutterstep and self.multidestx and self.multidesty)then			
			-- if(self:ApproachPoint(self.multidestx,self.multidesty,0,0.1))then
				-- self.remainingreactiontime=XPRACTICE.RandomNumberInBetween(1.0,2.0)
			-- else
				-- self.stutterstep=false
				-- self.multidestx=nil
				-- self.multidesty=nil
				-- --TODO: OnArrivedAtMultiDestination?
			-- end
		-- end
	-- end

	function class:ForceLookAtMob(mob)
		self.destyaw=nil
		local angle=math.atan2(mob.position.y-self.position.y,mob.position.x-self.position.x)
		self.orientation.yaw=angle
		self.orientation_displayed.yaw=angle
	end


end
