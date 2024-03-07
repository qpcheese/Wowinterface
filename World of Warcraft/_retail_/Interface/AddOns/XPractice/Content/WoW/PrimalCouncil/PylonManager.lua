do

--TODO: phase 2+3 area denial hex effects around pillars

	XPRACTICE.PRIMALCOUNCIL.Pylon = {}
	XPRACTICE.PRIMALCOUNCIL.Pylon.__index = XPRACTICE.PRIMALCOUNCIL.Pylon
	function XPRACTICE.PRIMALCOUNCIL.Pylon.new()
		local self=setmetatable({}, XPRACTICE.PRIMALCOUNCIL.Pylon)	
		return self
	end
	local class=XPRACTICE.PRIMALCOUNCIL.Pylon

	--TODO: code reuse w/ Floor
	local HEXside=14*math.sqrt(2)
	local HEXhalfsideroot3=HEXside*.5*math.sqrt(3)	
	local hexgridx=HEXhalfsideroot3
	local hexgridy=HEXside*1.5
	local floorscale=0.3725		
	local pylons={}
	
	function class:Setup(environment,x,y,z)
		self.wall=false
		self.hole=true
		self.expectedwallstate=false
		self.expectedholestate=true
		self.swirltimer=nil		
		self.swirlfadestarttime=0.0
		self.holecolor=0
		self.hatchtimer=nil
		self.hatchstate=1.0
		self.targethatchstate=1.0
		self.targethatchstatestarttime=0.0
		self.pylontimer=nil
		self.pylonstate=-1.0
		self.targetpylonstate=-1.0
		self.closehatchafterpylonlowers=false
		self.corruptionanimationtimer=nil
	end
	
	function class:SetHexCoords(x,y)
		self.hexcoordsx=x
		self.hexcoordsy=y		
		self.position={x=hexgridx*x*floorscale,y=hexgridy*y*floorscale}
		--print("Hex:",x,y)
		--print("Coords:",self.position.x,self.position.y)
	end
	

end

-- 1003528  -- 6ak_arakkoa_glow.m2 ?

do
	local super=XPRACTICE.MultiSolid
	XPRACTICE.PRIMALCOUNCIL.PylonManager=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.PRIMALCOUNCIL.PylonManager

	--TODO: code reuse w/ Floor
	local HEXside=14*math.sqrt(2)
	local HEXhalfsideroot3=HEXside*.5*math.sqrt(3)	
	local hexgridx=HEXhalfsideroot3
	local hexgridy=HEXside*1.5
	local floorscale=0.3725			
	
	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		self.pylons={}
		
		-- pylons 1-4 (WWW)
		for y=3,-3,-2 do
			self:NewPylon(-9,y)
		end
		
		--pylons 5-10 (WW)
		for y=4,-4,-2 do
			self:NewPylon(-6,y)
		end					

		-- pylons 11-15 (W)
		for y=5,-5,-2 do
			self:NewPylon(-3,y)
		end
		
		--pylons 16-21 (mid)
		for y=6,-6,-2 do
			if(y~=0)then self:NewPylon(0,y) end
		end		

		--pylons 22-26 (E)
		for y=5,-5,-2 do
			self:NewPylon(3,y)
		end
		
		--pylons 27-31 (EE)
		for y=4,-4,-2 do
			self:NewPylon(6,y)
		end
		
		--pylons 32-36 (EEE)
		for y=3,-3,-2 do
			self:NewPylon(9,y)
		end
		
		--self:OpenHatch(self.pylons[5],5.0)
		
		self:ResetToPhase1()
		--self:ResetToPhase2()
		--self:ResetToPhase3()
		--self:ResetToPhase4()


		-- --self:OpenHatch(self.pylons[5])
		-- self:OpenHatchInstantly(self.pylons[5])
		-- self:RaisePylonInstantly(self.pylons[5])
		-- self:CorruptAndLowerPylon(self.pylons[5])
		-- self:GlowHoleBlue(self.pylons[5])
		-- self:LowerPylon(self.pylons[5])
		
		-- --self:CloseHatchInstantly(self.pylons[5])
		-- self:CloseHatch(self.pylons[5])
		
		self.layout:RebakeDynamicLines()
		--self.layout:ShowDebugLines()
	end
	
	
	function class:NewPylon(x,y)
		local pylon=XPRACTICE.PRIMALCOUNCIL.Pylon.new()
		pylon:SetHexCoords(x,y)
		pylon:Setup()
		tinsert(self.pylons,pylon)
		local a=self:AddActorByFileID(4215642,pylon.position.x+1.125,pylon.position.y-0.625,-2,0.58,math.pi*(0.5+1/6))
		a:SetAnimation(158)
		pylon.pillargraphic=a
		pylon.pillargraphic:SetAlpha(0)
		-- TODO: replace glowgraphics with 9fx_raid3_jailer_debuff_target
		local a=self:AddActorByFileID(320166,pylon.position.x,pylon.position.y,-2,1.325,0,-math.pi/2)
		--local a=self:AddActorByFileID(320225,pylon.position.x,pylon.position.y,-2,1.325,0,-math.pi/2)
		pylon.glowgraphic=a
		
		local a=self:AddActorByFileID(3622260,pylon.position.x,pylon.position.y,0.1,1.25)
		pylon.swirl=a
		pylon.swirl:SetAnimation(158)
		pylon.swirl:SetAlpha(0)
		pylon.shuttergraphics={}
		local floorscale=0.3725
		for i=1,6 do
			--TODO: replace shuttergraphics with 9du_progenitorraid_jailerfight_trapdoor01
			local t=math.pi*2/6*i+math.pi*0
			local MIN=1.5
			local MAX=3.4
			local SLIDER=1.0
			--local SLIDER=0.0
			local MULTIPLIER=SLIDER*(MAX-MIN)+MIN
			local x=pylon.position.x+MULTIPLIER*math.cos(t)*(HEXhalfsideroot3-14/math.sqrt(2))*floorscale
			local y=pylon.position.y+MULTIPLIER*math.sin(t)*(HEXhalfsideroot3-14/math.sqrt(2))*floorscale
			local boxscaleadjustment=(math.sqrt(2)+0.01)
			--local a=self:AddActorByClass(XPRACTICE.SOLIDS.Box001,x,y,-7*boxscaleadjustment*floorscale,1*boxscaleadjustment*floorscale,t+math.pi)
			local SCALE=0.85
			local a=self:AddActorByClass(XPRACTICE.SOLIDS.Box001,x,y,-7.1*boxscaleadjustment*floorscale*SCALE,SCALE*boxscaleadjustment*floorscale,t+math.pi/4)
			--print((HEXhalfsideroot3-14/math.sqrt(2))*floorscale)  --  2.699483
			--print(-7.1*boxscaleadjustment*floorscale*SCALE)		-- -3.201685
			--print(SCALE*boxscaleadjustment*floorscale)			--  0.450942
			--local a=self:AddActorByClass(XPRACTICE.SOLIDS.Box001,x,y,-6.9*boxscaleadjustment*floorscale*SCALE,SCALE*boxscaleadjustment*floorscale,t+math.pi/4)
			a:SetSpellVisualKit(6527)
			tinsert(pylon.shuttergraphics,a)			
		end
	end	
	
	function class:ResetToPhase1()
		for i=1,#self.pylons do
			local pylon=self.pylons[i]
			self:GlowHoleYellow(pylon)
			self:GlowPylonYellow(pylon)
			self:OpenHatch(pylon,2)
			self:LowerPylon(pylon)
			self:SetHatchGraphics(pylon)
			self:SetPylonGraphics(pylon)
		end
		
	end
	
	function class:ResetToPhase2()
		local openpylonlist={1,6,12,3,4,8,9,19,20,21,10,16,17,22,24,29,33,31,32,35,36}
		local pylonisopen={}
		for i=1,#openpylonlist do
			pylonisopen[openpylonlist[i]]=true
		end
		for i=1,36 do
			local pylon=self.pylons[i]
			self:GlowHoleBlue(pylon)			
			self:GlowPylonBlue(pylon)
			self:LowerPylon(pylon)
			if(pylonisopen[i])then
				self:OpenHatch(pylon,2)
			else
				self:CloseHatch(pylon)
			end
		end
	end	
	

	function class:ResetToPhase3()
		local closedpylonlist={2, 7, 13, 5, 11, 18}
		local pylonisclosed={}		
		for i=1,#closedpylonlist do
			pylonisclosed[closedpylonlist[i]]=true
		end
		local pillaruplist={1,6,12}
		local pillarisup={}
		for i=1,#pillaruplist do
			pillarisup[pillaruplist[i]]=true
		end		
		for i=1,36 do
			local pylon=self.pylons[i]
			self:GlowHoleBlue(pylon)
			self:GlowPylonBlue(pylon)
			if(pylonisclosed[i])then
				self:CloseHatch(pylon)
			else
				self:OpenHatch(pylon,5)
			end
			if(pillarisup[i])then
				self:RaisePylon(pylon)
			else
				self:LowerPylon(pylon)
			end
		end		
	end	
	function class:ResetToPhase4()
		local closedpylonlist={2, 7, 13, 5, 11, 18}
		local pylonisclosed={}		
		for i=1,#closedpylonlist do
			pylonisclosed[closedpylonlist[i]]=true
		end
		for i=1,36 do
			local pylon=self.pylons[i]
			self:GlowHoleBlue(pylon)
			self:GlowPylonBlue(pylon)
			if(pylonisclosed[i])then
				self:CloseHatch(pylon)
			else
				self:OpenHatch(pylon,5)
			end
			self:LowerPylon(pylon)
		end		
	end		
	
	
	
	function class:GlowHoleYellow(pylon)
		pylon.glowgraphic:SetModelByFileID(320166)
	end
	function class:GlowHoleBlue(pylon)
		pylon.glowgraphic:SetModelByFileID(320225)
	end
	
	function class:OpenHatch(pylon,swirlduration)
		if(pylon.expectedholestate==true)then return end
		pylon.expectedholestate=true
		swirlduration=swirlduration or 2.0
		pylon.swirltimer=0
		pylon.swirlfadestarttime=swirlduration-0.25		
		pylon.swirl:SetAlpha(1)
		pylon.swirl:SetAnimation(0)
		pylon.hatchtimer=0
		pylon.targethatchstate=1.0
		pylon.targethatchstatestarttime=2.0
	end
		
	function class:OpenHatchInstantly(pylon)	-- for debug purposes
		if(pylon.expectedholestate==true)then return end
		pylon.expectedholestate=true	
		pylon.hatchstate=1.0
		pylon.hole=true
		self:SetHatchGraphics(pylon)
		self.layout:RebakeDynamicLines()
	end		
	
	function class:CloseHatch(pylon)		
		if(pylon.pylonstate and pylon.pylonstate>-1.0)then
			-- we should only be here if we call a reset function while a pylon is up.
				-- under normal circumstances, closehatch is only called while pylons are already down.
			self:LowerPylon(pylon)
			pylon.closehatchafterpylonlowers=true
		else
			self:CloseHatchExecute(pylon)
		end
	end	
	
	function class:CloseHatchExecute(pylon)	
		if(pylon.expectedholestate==false)then return end
		pylon.expectedholestate=false		
	
		pylon.hatchtimer=0
		pylon.targethatchstate=0.0
		pylon.targethatchstatestarttime=0.0			
	end
	
	function class:CloseHatchInstantly(pylon)		
		if(pylon.expectedholestate==false)then return end
		pylon.expectedholestate=false
		pylon.hatchstate=0.0
		pylon.hole=false
		self:SetHatchGraphics(pylon)
		self.layout:RebakeDynamicLines()
	end		
	
	function class:SetHatchGraphics(pylon)
		for i=1,6 do
			local t=math.pi*2/6*i+math.pi*0
			local MIN=1.5
			local MAX=3.4	--TODO: this clips into the center azeroth hex (won't be a problem once we use the in-game shutter model)
			local MULTIPLIER=pylon.hatchstate*(MAX-MIN)+MIN			
			local x=pylon.position.x+MULTIPLIER*math.cos(t)*2.699483
			local y=pylon.position.y+MULTIPLIER*math.sin(t)*2.699483
			local scalemultiplier=0.450942
			--pylon.shuttergraphics[i]:SetPosition(x*scalemultiplier,y*scalemultiplier,-3.201685)	
			pylon.shuttergraphics[i]:SetPosition(x/scalemultiplier,y/scalemultiplier,-3.201685/scalemultiplier)	
		end
	end
	
	function class:SetPylonGraphics(pylon)
		local z
		local MAX=1
		local MIN=-80
		local clippedpylonstate=pylon.pylonstate
		if(clippedpylonstate>1.0)then clippedpylonstate=1.0 end
		if(clippedpylonstate<-1.0)then clippedpylonstate=-1.0 end
		if(clippedpylonstate>0.0)then
			local t=clippedpylonstate*math.pi*0.55
			z=MIN+(MAX-MIN)*math.sin(t)
		else
			z=MIN+clippedpylonstate*120
		end		
		
		local PYLONSCALE=0.58
		pylon.pillargraphic:SetPosition((pylon.position.x+1.125)/PYLONSCALE,(pylon.position.y-0.625)/PYLONSCALE,z/PYLONSCALE)
		
		local a=(pylon.pylonstate+0.5)*2
		if(a>1.0)then a=1.0 elseif(a<0)then a=0 end
		pylon.pillargraphic:SetAlpha(a)	--100002-safe
	end
	
	function class:RaisePylon(pylon)
		if(pylon.expectedwallstate==true)then return end
		pylon.expectedwallstate=true
		pylon.glowgraphic:SetAlpha(0)	-- we're doing this earlier than actual WoW to avoid weird clipping issues
		pylon.pylontimer=0
		pylon.targetpylonstate=1.0
	end

	function class:RaisePylonInstantly(pylon)	-- for debug purposes
		if(pylon.expectedwallstate==true)then return end
		pylon.expectedwallstate=true	
		pylon.pylonstate=1.0
		pylon.wall=true
		self.layout:RebakeDynamicLines()
		self:SetPylonGraphics(pylon)
		pylon.glowgraphic:SetAlpha(0)
	end	
	
	function class:CorruptAndLowerPylon(pylon)
		pylon.corruptionanimationtimer=0
		pylon.tyranny=true
		pylon.pillargraphic:SetAnimation(213,0,2.0)
	end
	
	function class:LowerPylon(pylon)
		if(pylon.expectedwallstate==false)then return end
		pylon.expectedwallstate=false
		pylon.pylontimer=0
		pylon.targetpylonstate=-1.0
	end	
	
	function class:GlowPylonYellow(pylon)
		pylon.pillargraphic:SetAnimation(158)
	end
	function class:GlowPylonBlue(pylon)
		pylon.pillargraphic:SetAnimation(0)
	end	
	
	
	
	
	function class:Step(elapsed)
		super.Step(self,elapsed)		
		for i=1,#self.pylons do
			local pylon=self.pylons[i]
			if(pylon.swirltimer~=nil)then
				local prevtimer=pylon.swirltimer
				pylon.swirltimer=pylon.swirltimer+elapsed
				if(prevtimer<0.25 and pylon.swirltimer>=0.25)then
					pylon.swirl:SetAnimation(158)
				end
				if(prevtimer<pylon.swirlfadestarttime and pylon.swirltimer>=pylon.swirlfadestarttime)then
					pylon.swirl:SetAnimation(159)
				end
				if(pylon.swirltimer>pylon.swirlfadestarttime+0.25)then
					pylon.swirltimer=nil
					pylon.swirl:SetAnimation(158)
					pylon.swirl:SetAlpha(0)					
				end
			end
			if(pylon.hatchtimer~=nil)then
				local prevtimer=pylon.hatchtimer
				pylon.hatchtimer=pylon.hatchtimer+elapsed
				if(pylon.hatchtimer>=pylon.targethatchstatestarttime)then
					local HATCHSPEED=4.0
					if(pylon.hatchstate<pylon.targethatchstate)then					
						if(not pylon.hole)then
							pylon.hole=true
							self.layout:RebakeDynamicLines()
						end
						pylon.hatchstate=pylon.hatchstate+elapsed*HATCHSPEED						
						if(pylon.hatchstate>=pylon.targethatchstate)then
							pylon.hatchstate=pylon.targethatchstate
							pylon.hatchtimer=nil
						end
						self:SetHatchGraphics(pylon)
					elseif(pylon.hatchstate>pylon.targethatchstate)then
						pylon.hatchstate=pylon.hatchstate-elapsed*HATCHSPEED
						self:SetHatchGraphics(pylon)
						if(pylon.hatchstate<=pylon.targethatchstate)then
							pylon.hatchstate=pylon.targethatchstate
							pylon.hatchtimer=nil
							pylon.hole=false
							self.layout:RebakeDynamicLines()
						end
						self:SetHatchGraphics(pylon)
					end					
				end
			end
			if(pylon.pylontimer~=nil)then
				local prevtimer=pylon.pylontimer
				pylon.pylontimer=pylon.pylontimer+elapsed			
				if(pylon.pylontimer>0)then
					local UPPYLONSPEED=0.5
					local DOWNPYLONSPEED=1.0
					local prevstate=pylon.pylonstate
					if(pylon.pylonstate<pylon.targetpylonstate)then
						pylon.pylonstate=pylon.pylonstate+elapsed*UPPYLONSPEED
						if(prevstate<0.265 and pylon.pylonstate>=0.265)then
							pylon.wall=true
							self.layout:RebakeDynamicLines()
						end
						if(pylon.pylonstate>=pylon.targetpylonstate)then
							pylon.pylonstate=pylon.targetpylonstate
							pylon.pylontimer=nil
						end			
						self:SetPylonGraphics(pylon)			
					elseif(pylon.pylonstate>pylon.targetpylonstate)then
						pylon.pylonstate=pylon.pylonstate-elapsed*DOWNPYLONSPEED
						if(prevstate>0.4 and pylon.pylonstate<=0.4)then
							if(pylon.tyranny)then
								pylon.tyranny=false
								local orb=XPRACTICE.PRIMALCOUNCIL.TyrannyOrb.new()
								orb.scenario=self.scenario
								orb.pylon=pylon
								orb:Setup(self.scenario.game.environment_gameplay,pylon.position.x,pylon.position.y,0)								
							end
						end
						if(prevstate>0.265 and pylon.pylonstate<=0.265)then
							pylon.wall=false
							self.layout:RebakeDynamicLines()
							pylon.glowgraphic:SetAlpha(1)
						end					
						
						if(pylon.pylonstate<=pylon.targetpylonstate)then
							pylon.pylonstate=pylon.targetpylonstate
							pylon.pylontimer=nil
							pylon.glowgraphic:SetAlpha(1)
							if(pylon.closehatchafterpylonlowers)then
								self:CloseHatchExecute(pylon)
								pylon.closehatchafterpylonlowers=false
							end							
						end
						self:SetPylonGraphics(pylon)		
					end
				end
			end
			if(pylon.corruptionanimationtimer~=nil)then
				pylon.corruptionanimationtimer=pylon.corruptionanimationtimer+elapsed	
				if(pylon.corruptionanimationtimer>4.6)then
					pylon.corruptionanimationtimer=nil
					pylon.pillargraphic:SetAnimation(0)
					self:LowerPylon(pylon)
				end
			end
		end
	end
	
end