do
	local super=XPRACTICE.Scenario
	XPRACTICE.Scenario_Menu = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Scenario_Menu

	local REDX="\124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_7:12\124t"
		
		

	
	function class:Populate()
		super.Populate(self)				
			
		local environment=self.game.environment_gameplay
		local scrollbox=XPRACTICE.ScrollBox.new()
		scrollbox:Setup(environment,25,self.game.SCREEN_HEIGHT-25)
		self.scrollbox=scrollbox
		
		local scrollbar=XPRACTICE.ScrollBarVertical.new()
		scrollbar:Setup(environment,self.game.SCREEN_WIDTH-52,2)
		scrollbar:SetSize(50,self.game.SCREEN_HEIGHT-4)
		scrollbar.scrollbox=scrollbox
		self.scrollbar=scrollbar
		
		local x=-1
		local y=0
		
		self.startbuttons={}
		local startbutton
		local scenario=self
		--local buttonx=0
		local buttonx=self.game.window.frame:GetWidth()*2/3-300/2.0
		-- --!!!

		--local menuy=self.game.window.frame:GetHeight()-15
		local menuy=-15
		for j=#XPRACTICE.ScenarioList,1,-1 do			
			local scen=XPRACTICE.ScenarioList[j]
			x=x+1	
			if(x>0)then x=0;y=y+1 end
			if(scen.category=="SCENARIO" or (scen.category=="SCENARIO_TEST" and self.game.testmode==true))then
				startbutton=XPRACTICE.Button.new()
				startbutton:Setup(self.game.environment_gameplay)
				startbutton:SetSize(300,140)
				--startbutton.position.x=buttonx-300/2.0
				startbutton.position.x=buttonx
				--startbutton.position.y=self.environment.game.window.frame:GetHeight()/2+80-150*i
				--startbutton.position.y=self.game.window.frame:GetHeight()/2+150-150*y			
				startbutton.position.y=menuy-140
				startbutton:SetLockedStartingAlpha(1.0)
				startbutton:SetText(scen.name.."\r"..scen.description)
				startbutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)
						if(button=="LeftButton" and down)then
							scenario:OnStartButton()
							scenario.game:LoadScenarioByClass(scen.class)
						end
					end)			
				startbutton.displayobject.parentframe=scrollbox.displayobject.drawable
				startbutton.displayobject.drawable:SetParent(startbutton.displayobject.parentframe)
				tinsert(self.startbuttons,startbutton)
				menuy=menuy-150
			elseif(scen.category=="SEPARATOR")then
				local separator=XPRACTICE.MenuSeparator.new()
				separator:Setup(self.game.environment_gameplay)
				separator:SetWidth(self.game.SCREEN_WIDTH*2/3-200)
				separator:SetText(scen.name..": "..scen.description)
				separator.position.x=self.game.window.frame:GetWidth()/3+100
				separator.position.y=menuy-15
				separator.displayobject.parentframe=scrollbox.displayobject.drawable
				separator.displayobject.drawable:SetParent(separator.displayobject.parentframe)
				menuy=menuy-30
			end
		end
		
		local maxscrollheight=-menuy-self.game.SCREEN_HEIGHT
		if(maxscrollheight<10)then maxscrollheight=10 end
		scrollbar:SetMaxScrollHeight(maxscrollheight)
		
		
		-- i=i+1	
		-- startbutton=XPRACTICE.Button.new()
		-- startbutton:Setup(self.environment.game.environment_hud)
		-- startbutton.x=buttonx
		-- startbutton.y=self.environment.game.window.frame:GetHeight()/2+80-150*i
		-- startbutton.drawable.width=500;startbutton.drawable.height=140				
		-- startbutton:SetText("Vectis\rfor mDPS and rDPS")
		-- startbutton.drawable.frame:SetScript("OnClick",function()					
					-- self:OnStartButton()
					-- self.environment.game:LoadScenarioByClass(XPRACTICE.VECTIS_Scenario_Vectis)
				-- end)
		-- tinsert(self.startbuttons,startbutton)
		
		

		
				
		-- if(XPRACTICE.Scenario_Animation)then
			-- i=i+1				
			-- startbutton=XPRACTICE.Button.new()
			-- startbutton:Setup(self.environment.game.environment_hud)
			-- startbutton.x=buttonx
			-- startbutton.y=self.environment.game.window.frame:GetHeight()/2+80-150*i
			-- startbutton.drawable.width=500;startbutton.drawable.height=140				
			-- startbutton:SetText("Animation\rNothing to see here")
			-- startbutton.drawable.frame:SetScript("OnClick",function()					
						-- self:OnStartButton()
						-- self.environment.game:LoadScenarioByClass(XPRACTICE.Scenario_Animation)
					-- end)
			-- tinsert(self.startbuttons,startbutton)
		-- end
		

		
		local c="|cFF14FF14"	-- NOTHING TO SEE HERE
		local r="|r"

		
		--local OFFSETX=-250
		--local OFFSETX=0
		local OFFSETX=100
		
		
		--local OFFSETY=-80		
		local OFFSETY=300
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.game.environment_gameplay)
		text.position.x=OFFSETX;text.position.y=OFFSETY+self.game.window.frame:GetHeight()/2-125-0
		text:SetSize(self.game.window.frame:GetWidth()/3,70)
		text:SetText("Left-click a scenario to begin")
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.game.environment_gameplay)
		text.position.x=OFFSETX;text.position.y=OFFSETY+self.game.window.frame:GetHeight()/2-125-25
		text:SetSize(self.game.window.frame:GetWidth()/3,70)
		text:SetText("Move with WASD or by holding both mouse buttons")
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.game.environment_gameplay)
		text.position.x=OFFSETX;text.position.y=OFFSETY+self.game.window.frame:GetHeight()/2-125-50
		text:SetSize(self.game.window.frame:GetWidth()/3,70)
		text:SetText("Press Esc to quit")		
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.game.environment_gameplay)
		text.position.x=OFFSETX;text.position.y=OFFSETY+self.game.window.frame:GetHeight()/2-125-100
		text:SetSize(self.game.window.frame:GetWidth()/3,70)
		text:SetText("You can adjust keybinds and other settings in the options menu.")
		
		
		--local OFFSETY=150
		local OFFSETY=-150
		
		-- local text
		-- text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.game.environment_gameplay);text.position.x=OFFSETX;text.position.y=OFFSETY+self.game.window.frame:GetHeight()/2-125-0;text:SetSize(self.game.window.frame:GetWidth()/3,300)
		-- local c="|cFF14FF14"	-- NOTHING TO SEE HERE
		-- local r="|r"
		-- text:SetText(message)
		
		local text
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.game.environment_gameplay);text.position.x=OFFSETX;text.position.y=OFFSETY+self.game.window.frame:GetHeight()/2-125-0;text:SetSize(self.game.window.frame:GetWidth()/3,300)
		local message="Latest updates:\r\r"
					.."Added a scenario for Mythic Smolderon: World in Flames.  There is also a rudimentary menu for raid officers to assign Phase 1 dance circles to the entire group at once.\r\r"
					.."Fixed some outstanding bugs.  Multiplayer games should no longer crash in groups that have not been set to assist-all.\r\r"
					.."In order to reduce memory consumption and make room for a sizable future update, Shadowlands scenarios have been removed.  They will (hopefully) return in a legacy addon in patch 11.0.\r\r"
					.."\r\r"..c..r

		text:SetText(message)

		

		do
			startbutton=XPRACTICE.Button.new()
			startbutton:Setup(self.game.environment_gameplay)
			startbutton:SetSize(150,70)
			startbutton.position.x=10
			startbutton.position.y=self.game.SCREEN_HEIGHT-70-10
			startbutton:SetLockedStartingAlpha(1.0)
			startbutton:SetText("Options")
			startbutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)
					if(button=="LeftButton" and down)then
						scenario:OnStartButton()
						scenario.game:LoadScenarioByClass(XPRACTICE.Scenario_Options)
					end
				end)			
			tinsert(self.startbuttons,startbutton)
			menuy=menuy-150
		end
		
		do
			startbutton=XPRACTICE.Button.new()
			startbutton:Setup(self.game.environment_gameplay)
			startbutton:SetSize(150,70)
			startbutton.position.x=10+150+10
			startbutton.position.y=self.game.SCREEN_HEIGHT-70-10
			startbutton:SetLockedStartingAlpha(1.0)
			startbutton:SetText("Credits")
			startbutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)
					if(button=="LeftButton" and down)then
						scenario:OnStartButton()
						scenario.game:LoadScenarioByClass(XPRACTICE.Scenario_Credits)
					end
				end)			
			tinsert(self.startbuttons,startbutton)
			menuy=menuy-150
		end

	end
	
	function class:PopulatePlayerHUD()
		-- do nothing
		
	end	
	

	
	function class:OnStartButton()
		for i=1,#self.startbuttons do
			--self.startbuttons[i].visible=false
			self.startbuttons[i].displayobject.drawable:EnableMouse(false)
		end		
	end

	function class:OnEscapeKey()
		self.game:Shutdown()
	end
	
end