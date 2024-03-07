do
	local PH=1
	
	XPRACTICE.VOTIRAIDMAPS.Bosses={}
	
	local boss={{name="Eranog",id=184972,display=105614,scale=2.5,speedmultiplier=1.0}}
	tinsert(XPRACTICE.VOTIRAIDMAPS.Bosses,boss)
	local boss={{name="Terros",id=190496,display=106344,scale=1,speedmultiplier=0,customboundingbox={-10,-10,0,10,10,15}}}
	tinsert(XPRACTICE.VOTIRAIDMAPS.Bosses,boss)	
	local boss={{name="Kadros Icewrath",id=187771,display=107599,scale=2.5,speedmultiplier=1.0,index=1},
				{name="Dathea Stormlash",id=187768,display=107598,scale=2.5,speedmultiplier=1.0,index=2},
				{name="Opalfang",id=187772,display=106928,scale=2,speedmultiplier=1.0,index=3},
				{name="Embar Firepath",id=187767,display=107597,scale=2.5,speedmultiplier=1.0,index=4}
				}
	tinsert(XPRACTICE.VOTIRAIDMAPS.Bosses,boss)		
	local boss={{name="Sennarth",id=187967,display=106348,scale=1,speedmultiplier=1.0}}
	tinsert(XPRACTICE.VOTIRAIDMAPS.Bosses,boss)	
	local boss={{name="Dathea, Ascended",id=189813,display=107813,scale=4,speedmultiplier=1.0}}
	tinsert(XPRACTICE.VOTIRAIDMAPS.Bosses,boss)
	local boss={{name="Kurog Grimtotem",id=181378,display=106792,scale=2.5,speedmultiplier=1.0}}
	tinsert(XPRACTICE.VOTIRAIDMAPS.Bosses,boss)	
	local boss={{name="Broodkeeper Diurna",id=190245,display=106243,scale=2.5,speedmultiplier=1.0}}
	tinsert(XPRACTICE.VOTIRAIDMAPS.Bosses,boss)
	--local boss={{name="Raszageth",id=191531,display=103255,scale=2.5,speedmultiplier=1.25,customboundingbox={-7.5,-7.5,0,7.5,7.5,10}}}
	--local boss={{name="Raszageth",id=191531,display=103255,scale=2,speedmultiplier=1.0,customboundingbox={-7.5,-7.5,0,7.5,7.5,10}}}
	local boss={{name="Raszageth",id=191531,display=103255,scale=2,speedmultiplier=2.0,customboundingbox={-7.5,-7.5,0,7.5,7.5,10},index=1},
				{name="Colossal Stormfiend",id=197145,display=111061,scale=4,speedmultiplier=2.0,index=2},
				{name="Colossal Stormfiend",id=197145,display=111061,scale=4,speedmultiplier=2.0,index=3},
				{name="Colossal Stormfiend",id=197145,display=111061,scale=4,speedmultiplier=2.0,index=4}
				}	
	tinsert(XPRACTICE.VOTIRAIDMAPS.Bosses,boss)		
	
	
	function XPRACTICE.VOTIRAIDMAPS.Bosses.CreateBosses(scenario,mapindex)
		if(not XPRACTICE.VOTIRAIDMAPS.Bosses[mapindex])then return end
		
		local bosses={}				
		
		for i=1,#scenario.bosses do
			local boss=scenario.bosses[i]
			if(not boss.expirytime)then
				boss.fadestarttime=scenario.game.environment_gameplay.localtime
				boss.expirytime=boss.fadestarttime+1.0		
			end
		end
		scenario.bosses={}
		
		
		for i=1,#XPRACTICE.VOTIRAIDMAPS.Bosses[mapindex] do
			local info=XPRACTICE.VOTIRAIDMAPS.Bosses[mapindex][i]
			local boss=XPRACTICE.VOTIRAIDMAPS.MultiBoss.new()
			boss.mapindex=mapindex
			boss.info=info
			boss:Setup(scenario.game.environment_gameplay)
			tinsert(bosses,boss)	
			boss:CreateNameplates()
			if(mapindex==3)then
				boss.position.y=i*7-7*2.5
			end
			if(mapindex==8)then
				boss:FreezeOrientation(30*math.pi/180)
				if(i==2)then boss.position.x=-121.0;boss.position.y=-93.8
				elseif(i==3)then boss.position.x=-159.3;boss.position.y=-115.7
				elseif(i==4)then boss.position.x=-181.2;boss.position.y=-77.8
				end
			end
		end		
		scenario.bosses=bosses
		
		return bosses
	end
	
	do
		local super=XPRACTICE.Mob		
		XPRACTICE.VOTIRAIDMAPS.MultiBoss=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.VOTIRAIDMAPS.MultiBoss
	
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