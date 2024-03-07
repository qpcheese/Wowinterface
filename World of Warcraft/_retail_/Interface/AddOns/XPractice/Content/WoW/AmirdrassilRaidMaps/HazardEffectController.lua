-- --TODO: volatile code reuse -- only use function in multiplayer/messagehandler.lua
-- local function IsRealOfficer(unit)
	-- unit=strsplit("-",unit)
	-- return ((UnitIsGroupLeader(unit)==true) or (UnitIsGroupAssistant(unit)==true) or not IsInGroup(unit))
-- end

do
	
	local super=XPRACTICE.GameObject
	XPRACTICE.AMIRDRASSILRAIDMAPS.HazardEffectController=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.AMIRDRASSILRAIDMAPS.HazardEffectController
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.buttons={}
		self.state="FULLVIEW"
	end
	
	
	
	function class:SendAll(scenario)
		if(scenario.multiplayer)then
			if(XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				local viscount=0
				local args={}
				for i=1,8 do
					if(self.wms[i] and not self.wms[i].dead and not self.wms[i].despawning)then 
						viscount=viscount+1
						tinsert(args,true) 
						tinsert(args,self.wms[i].position.x)
						tinsert(args,self.wms[i].position.y)
					else 
						tinsert(args,false) 
						tinsert(args,0)
						tinsert(args,0)
					end
				end
				-- don't clear everyone's markers if you have zero markers placed
				if(viscount>0)then
					scenario.multiplayer:FormatAndSend("ALLWORLDMARKERS",unpack(args))
				end
			end
		end
	end
	
	
	function class:QuickButtons(x,y,scenario)
	
		for i=1,#self.buttons do
			self.buttons[i]:Die()
		end
	
		-- Most recent preset
		-- Compact view / Full view		
		-- Presets list
		-- New preset
		-- Edit preset
		-- Delete preset
		-- Exclude player targets
		
	
		local buttons={}
		for i=1,8 do
			local menubutton
			menubutton=XPRACTICE.Button.new()
			menubutton:Setup(scenario.game.environment_gameplay)		
			menubutton.position={x=x+(i-1)*56,y=y,z=0}
			menubutton:SetSize(50,50)
			menubutton.icontext=XPRACTICE.AMIRDRASSILRAIDMAPS.wmtext[XPRACTICE.AMIRDRASSILRAIDMAPS.wmnumbers[i][2]]
			menubutton:SetText("")	
			local alpha=0
			--TODO: why do icons not respect alpha=0 unless we do this?
			menubutton.SetLockedStartingAlpha=function(self,alpha)
				self.alpha=alpha
				self.targetalpha=alpha
				self.displayobject.drawable:SetAlpha(XPRACTICE.Clamp(self.alpha,0,1))
				if(alpha==0)then
					self:SetText("")
				else
					self:SetText(self.icontext)
				end
			end
			menubutton:SetLockedStartingAlpha(alpha)
			menubutton:EnableMouse(false)			
			tinsert(buttons,menubutton)
			menubutton.scenario=scenario
			local wmc=self
			menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
					if(button=="LeftButton" and down)then
							if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
								scenario.statuslabel:SetText("Adjusting world markers requires raid lead/assist.",3.0)
								return
							end					
						wmc:SetWM(scenario,i,0,0,true)
					end
				end)
					
			tinsert(buttons,menubutton)
		end
	
		self.buttons=buttons
		return buttons
	end
	
	

end

