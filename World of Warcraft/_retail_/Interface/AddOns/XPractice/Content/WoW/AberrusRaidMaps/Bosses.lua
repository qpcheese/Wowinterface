do
	local PH=1
	
	XPRACTICE.ABERRUSRAIDMAPS.Bosses={}
	
	local boss={{name="Placehogger",id=201261,display=108956,scale=5.0,speedmultiplier=5/2}}
	tinsert(XPRACTICE.ABERRUSRAIDMAPS.Bosses,boss)
	--local boss={{name="Amalgamation",id=201774,display=108956,scale=5.0,speedmultiplier=0.0,customboundingbox={-10,-10,0,10,10,15}}}
	local boss={{name="Placehogger",id=201774,display=108956,scale=5.0,speedmultiplier=5/2,index=1},
				{name="Placehogger",id=201774,display=108956,scale=5.0,speedmultiplier=5/2,index=2}}
	tinsert(XPRACTICE.ABERRUSRAIDMAPS.Bosses,boss)	
	local boss={{name="Placehogger",id=200912,display=108956,scale=5.0,speedmultiplier=5/2,index=1},
				{name="Placehogger",id=201774,display=108956,scale=5.0,speedmultiplier=5/2,index=2},
				{name="Placehogger",id=201774,display=108956,scale=5.0,speedmultiplier=5/2,index=3}}
	tinsert(XPRACTICE.ABERRUSRAIDMAPS.Bosses,boss)		
	local boss={{name="Placehogger",id=199659,display=108956,scale=5.0,speedmultiplier=5/2}}
	tinsert(XPRACTICE.ABERRUSRAIDMAPS.Bosses,boss)	
	local boss={{name="Placehogger",id=201320,display=108956,scale=5.0,speedmultiplier=5/2}}
	tinsert(XPRACTICE.ABERRUSRAIDMAPS.Bosses,boss)
	local boss={{name="Placehogger",id=202637,display=108956,scale=5.0,speedmultiplier=5/2}}
	tinsert(XPRACTICE.ABERRUSRAIDMAPS.Bosses,boss)	
	local boss={{name="Placehogger",id=201579,display=108956,scale=5.0,speedmultiplier=5/2}}
	tinsert(XPRACTICE.ABERRUSRAIDMAPS.Bosses,boss)
	local boss={{name="Placehogger",id=204223,display=108956,scale=5.0,speedmultiplier=5/2}}
	tinsert(XPRACTICE.ABERRUSRAIDMAPS.Bosses,boss)		
	local boss={{name="Placehogger",id=205319,display=108956,scale=5.0,speedmultiplier=5/2}}
	tinsert(XPRACTICE.ABERRUSRAIDMAPS.Bosses,boss)	
	local boss={{name="Placehogger",id=205319,display=108956,scale=5.0,speedmultiplier=5/2}}
	tinsert(XPRACTICE.ABERRUSRAIDMAPS.Bosses,boss)	
	
	-- local boss={{name="Sarkareth",id=205320,file=4993371,scale=2,speedmultiplier=1.0,index=1}}
	-- tinsert(XPRACTICE.ABERRUSRAIDMAPS.Bosses,boss)	
	
	
	function XPRACTICE.ABERRUSRAIDMAPS.Bosses.CreateBosses(scenario,mapindex)
		if(not XPRACTICE.ABERRUSRAIDMAPS.Bosses[mapindex])then return end
		
		local bosses={}				
		
		for i=1,#scenario.bosses do
			local boss=scenario.bosses[i]
			if(not boss.expirytime)then
				boss.fadestarttime=scenario.game.environment_gameplay.localtime
				boss.expirytime=boss.fadestarttime+1.0		
			end
		end
		scenario.bosses={}
		
		
		for i=1,#XPRACTICE.ABERRUSRAIDMAPS.Bosses[mapindex] do
			local info=XPRACTICE.ABERRUSRAIDMAPS.Bosses[mapindex][i]
			local boss=XPRACTICE.ABERRUSRAIDMAPS.MultiBoss.new()
			boss.mapindex=mapindex
			boss.info=info
			boss:Setup(scenario.game.environment_gameplay)
			tinsert(bosses,boss)	
			boss:CreateNameplates()
			if(#XPRACTICE.ABERRUSRAIDMAPS.Bosses[mapindex]>1)then
				boss.position.y=(i-1)/(#XPRACTICE.ABERRUSRAIDMAPS.Bosses[mapindex]-1)*30-15
			end
		end		
		scenario.bosses=bosses
		
		return bosses
	end
	
	do
		local super=XPRACTICE.Mob		
		XPRACTICE.ABERRUSRAIDMAPS.MultiBoss=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.ABERRUSRAIDMAPS.MultiBoss
	
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
		
	end


end