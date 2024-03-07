do
	local PH=1
	
	XPRACTICE.PRIMALCOUNCIL.Bosses={}
	

	local boss={{name="Kadros Icewrath",id=187771,display=107599,scale=2.5,speedmultiplier=1.0,index=1},
				{name="Dathea Stormlash",id=187768,display=107598,scale=2.5,speedmultiplier=1.0,index=2},
				{name="Opalfang",id=187772,display=106928,scale=2,speedmultiplier=1.0,index=3},
				{name="Embar Firepath",id=187767,display=107597,scale=2.5,speedmultiplier=1.0,index=4}
				}
	XPRACTICE.PRIMALCOUNCIL.Bosses[3]=boss
	
	
	function XPRACTICE.PRIMALCOUNCIL.Bosses.CreateBosses(scenario,mapindex)
		if(not XPRACTICE.PRIMALCOUNCIL.Bosses[mapindex])then return end
		
		local bosses={}				
		
		for i=1,#scenario.bosses do
			local boss=scenario.bosses[i]
			if(not boss.expirytime)then
				boss.fadestarttime=scenario.game.environment_gameplay.localtime
				boss.expirytime=boss.fadestarttime+1.0		
			end
		end
		
		
		
		for i=1,#XPRACTICE.PRIMALCOUNCIL.Bosses[mapindex] do
			local info=XPRACTICE.PRIMALCOUNCIL.Bosses[mapindex][i]
			local boss=XPRACTICE.PRIMALCOUNCIL.MultiBoss.new()
			boss.mapindex=mapindex
			boss.info=info
			boss:Setup(scenario.game.environment_gameplay)
			tinsert(bosses,boss)	
			boss.scenario=scenario
			boss:CreateNameplates()
			if(mapindex==3)then
				if(i==1) then boss.position.x=23.3;boss.position.y=16.6;boss:FreezeOrientation(-144/180*math.pi)
				elseif(i==2) then boss.position.x=23.1;boss.position.y=-11.7;boss:FreezeOrientation(153/180*math.pi)
				elseif(i==4) then boss.position.x=-1.0;boss.position.y=-26.0;boss:FreezeOrientation(89/180*math.pi)
				elseif(i==3) then boss.position.x=-22.3;boss.position.y=-13.3;boss:FreezeOrientation(33/180*math.pi)
				end				
			end
		end		
		scenario.bosses=bosses
		
		return bosses
	end
	
	do
		local super=XPRACTICE.Mob		
		XPRACTICE.PRIMALCOUNCIL.MultiBoss=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.MultiBoss
	
		function class:SetCustomInfo()
			super.SetCustomInfo(self)			
			self.basemovespeed=14*self.info.speedmultiplier
			self.walkspeed=7.0*self.info.speedmultiplier
			self.defaultspeechbubbleduration=4.0
			
			self.autoattacktimer=nil
			self.autoattackspeed=1.0			
			self.playername=self.info.name
			self.alwaysignorecollision=true
			self.dontremoveselfnameplates=true
			self.ignoremovementinterrupts=true
			self.phase=2	--TODO: phase 2
		end					
	
		function class:SetActorAppearanceViaOwner(actor)
			self.scale=self.info.scale
			actor:SetModelByCreatureDisplayID(self.info.display)
		end	
		
		function class:CreateNameplates()
			local nameplate=XPRACTICE.Nameplate.new()
			nameplate.hp_TEMP=1.0			
			nameplate:Setup(self.environment,self)			
			nameplate.scalemultiplier=0.25
			nameplate:SetText(self.info.name)
			local castingbar=XPRACTICE.CastingBarTiny.new()
			castingbar:Setup(self.environment,0,0,0)
			castingbar.focus=self
			castingbar:AnchorToNameplate(nameplate)
			local mobclickzone=XPRACTICE.MobClickZone.new()
			mobclickzone:Setup(self.environment,self)
			self.nameplate=nameplate
			self.mobclickzone=mobclickzone
		end				
		
		function class:SetDisplayObjectCustomBoundingBoxViaOwner(displayobject)
			if(self.info.customboundingbox)then
				displayobject.customboundingbox=self.info.customboundingbox
			end
		end
		
	end


end