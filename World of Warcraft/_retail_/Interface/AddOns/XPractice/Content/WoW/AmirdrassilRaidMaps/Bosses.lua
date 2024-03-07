do
	local PH=1
	
	XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses={}
	
	local boss={{name="Placehogger",id=201261,display=108956,scale=5.0,speedmultiplier=5/2}}
	--local boss={{name="Placehogger",id=201261,file=3759600,scale=5.0,speedmultiplier=5/2}}
	tinsert(XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses,boss)
	--local boss={{name="Amalgamation",id=201774,display=108956,scale=5.0,speedmultiplier=0.0,customboundingbox={-10,-10,0,10,10,15}}}
	local boss={{name="Placehogger",id=201774,display=108956,scale=5.0,speedmultiplier=5/2,index=1}}
	tinsert(XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses,boss)	
	local boss={{name="Placehogger",id=200912,display=108956,scale=5.0,speedmultiplier=5/2,index=1},
				{name="Placehogger",id=201774,display=108956,scale=5.0,speedmultiplier=5/2,index=2},
				{name="Placehogger",id=201774,display=108956,scale=5.0,speedmultiplier=5/2,index=3}}
	tinsert(XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses,boss)		
	local boss={{name="Placehogger",id=199659,display=108956,scale=5.0,speedmultiplier=5/2}}
	tinsert(XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses,boss)	
	local boss={{name="Placehogger",id=201320,display=108956,scale=5.0,speedmultiplier=5/2}}
	tinsert(XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses,boss)
	local boss={{name="Placehogger",id=202637,display=108956,scale=30.0,speedmultiplier=0}}	--also set Z manually
	tinsert(XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses,boss)	
	local boss={{name="Placehogger",id=205319,display=108956,scale=7.5,speedmultiplier=0}}
	tinsert(XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses,boss)	
	local boss={{name="Placehogger",id=205319,display=108956,scale=5.0,speedmultiplier=5/2}}
	tinsert(XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses,boss)	
	local boss={{name="Placehalondrus",id=205320,display=103924,scale=5.0,speedmultiplier=5/2}}	-- mount; rider 103928
	tinsert(XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses,boss)	
	
	
	function XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses.CreateBosses(scenario,mapindex)
		if(not XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses[mapindex])then return end
		
		local bosses={}				
		
		for i=1,#scenario.bosses do
			local boss=scenario.bosses[i]
			if(not boss.expirytime)then
				boss.fadestarttime=scenario.game.environment_gameplay.localtime
				boss.expirytime=boss.fadestarttime+1.0		
			end
		end
		scenario.bosses={}
		
		
		for i=1,#XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses[mapindex] do
			local info=XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses[mapindex][i]
			local boss=XPRACTICE.AMIRDRASSILRAIDMAPS.MultiBoss.new()
			boss.mapindex=mapindex
			boss.info=info
			boss:Setup(scenario.game.environment_gameplay)
			tinsert(bosses,boss)	
			boss:CreateNameplates()
			if(#XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses[mapindex]>1)then
				boss.position.y=(i-1)/(#XPRACTICE.AMIRDRASSILRAIDMAPS.Bosses[mapindex]-1)*30-15
			end
			if(mapindex==6)then
				boss.position.z=-30
				boss.gravity=0
			end
			if(mapindex==9)then
				local rider=XPRACTICE.WoWObject.new()
				rider:Setup(scenario.game.environment_gameplay)
				rider.displayobject.drawable:SetModelByCreatureDisplayID(103928)
				boss.displayobject.drawable:AttachToMount(rider.displayobject.drawable,1)
				boss.TEMP_rider=rider
			end
		end		
		scenario.bosses=bosses
		
		return bosses
	end
	
	do
		local super=XPRACTICE.Mob		
		XPRACTICE.AMIRDRASSILRAIDMAPS.MultiBoss=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.AMIRDRASSILRAIDMAPS.MultiBoss
	
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
			if(self.info.display)then
				actor:SetModelByCreatureDisplayID(self.info.display)
			elseif(self.info.file)then
				actor:SetModelByFileID(self.info.file)
			end
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
		
		function class:Cleanup()
			super.Cleanup(self)
			if(self.TEMP_rider)then
				self.TEMP_rider:Die()
			end
		end
		
	end


end