do
	local super=XPRACTICE.Scenario
	XPRACTICE.Scenario_Options = XPRACTICE.inheritsFrom(super)	
	local class=XPRACTICE.Scenario_Options
	
	
	
	function class:Populate()
		super.Populate(self)				
			
		-- local environment=self.game.environment_gameplay
		-- local scrollbox=XPRACTICE.ScrollBox.new()
		-- scrollbox:Setup(environment,25,self.game.SCREEN_HEIGHT-25)
		-- self.scrollbox=scrollbox

		self.startbuttons={}
		local startbutton
		local scenario=self

		local text
	
		
		
		
		text=XPRACTICE.Label.new();text:Setup(self.game.environment_gameplay);
		text.position.x=0;
		text.position.y=self.game.window.frame:GetHeight()-200;
		text:SetSize(self.game.window.frame:GetWidth(),200)
		local message="Options"
		text:SetText(message)
		
		self.keybindbuttons={}
		local i=0
		do
			i=i+1
			startbutton=XPRACTICE.KeybindButton.new();startbutton.scenario=scenario;startbutton:Setup(self.game.environment_gameplay)
			startbutton:Set("upW","Move Forward")
			startbutton.position.x=50;startbutton.position.y=self.game.SCREEN_HEIGHT-170-(i-1)*40;startbutton:SetLockedStartingAlpha(1.0)
			i=i+1
			startbutton=XPRACTICE.KeybindButton.new();startbutton.scenario=scenario;startbutton:Setup(self.game.environment_gameplay)
			startbutton:Set("downS","Move Backward")
			startbutton.position.x=50;startbutton.position.y=self.game.SCREEN_HEIGHT-170-(i-1)*40;startbutton:SetLockedStartingAlpha(1.0)	
			i=i+1
			startbutton=XPRACTICE.KeybindButton.new();startbutton.scenario=scenario;startbutton:Setup(self.game.environment_gameplay)
			startbutton:Set("turnQ","Turn Left")
			startbutton.position.x=50;startbutton.position.y=self.game.SCREEN_HEIGHT-170-(i-1)*40;startbutton:SetLockedStartingAlpha(1.0)	
			i=i+1
			startbutton=XPRACTICE.KeybindButton.new();startbutton.scenario=scenario;startbutton:Setup(self.game.environment_gameplay)
			startbutton:Set("turnE","Turn Right")
			startbutton.position.x=50;startbutton.position.y=self.game.SCREEN_HEIGHT-170-(i-1)*40;startbutton:SetLockedStartingAlpha(1.0)	
			i=i+1
			startbutton=XPRACTICE.KeybindButton.new();startbutton.scenario=scenario;startbutton:Setup(self.game.environment_gameplay)
			startbutton:Set("leftA","Strafe Left")
			startbutton.position.x=50;startbutton.position.y=self.game.SCREEN_HEIGHT-170-(i-1)*40;startbutton:SetLockedStartingAlpha(1.0)	
			i=i+1
			startbutton=XPRACTICE.KeybindButton.new();startbutton.scenario=scenario;startbutton:Setup(self.game.environment_gameplay)
			startbutton:Set("rightD","Strafe Right")
			startbutton.position.x=50;startbutton.position.y=self.game.SCREEN_HEIGHT-170-(i-1)*40;startbutton:SetLockedStartingAlpha(1.0)	
			i=i+1
			startbutton=XPRACTICE.KeybindButton.new();startbutton.scenario=scenario;startbutton:Setup(self.game.environment_gameplay)
			startbutton:Set("jump","Jump")
			startbutton.position.x=50;startbutton.position.y=self.game.SCREEN_HEIGHT-170-(i-1)*40;startbutton:SetLockedStartingAlpha(1.0)	
			i=i+1
			startbutton=XPRACTICE.KeybindButton.new();startbutton.scenario=scenario;startbutton:Setup(self.game.environment_gameplay)
			startbutton:Set("togglerunwalk","Toggle Run/Walk")
			startbutton.position.x=50;startbutton.position.y=self.game.SCREEN_HEIGHT-170-(i-1)*40;startbutton:SetLockedStartingAlpha(1.0)	

		end		
				
		self.buttongroups={}
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.game.environment_gameplay);text.position.x=387;text.position.y=self.game.SCREEN_HEIGHT-190;
		text:SetSize(100,100);text:SetText("Screen size")
		XPRACTICE.OptionsMenuButton.debugbuttonx=400
		XPRACTICE.OptionsMenuButton.debugbuttony=self.game.SCREEN_HEIGHT-200
		local group={}
		tinsert(self.buttongroups,group)
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"SCREEN_SIZE","FULLSCREEN","Fit to screen","SIZE")
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"SCREEN_SIZE","1920","1920x1080","SIZE")
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"SCREEN_SIZE","1600","1600x900","SIZE")
		XPRACTICE.OptionsMenuButton.debugbuttonx=400
		XPRACTICE.OptionsMenuButton.debugbuttony=self.game.SCREEN_HEIGHT-200-55
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"SCREEN_SIZE","1280","1280x720","SIZE")
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"SCREEN_SIZE","1024","1024x768","SIZE")
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"SCREEN_SIZE","800","800x600","SIZE")
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.game.environment_gameplay);text.position.x=387;text.position.y=self.game.SCREEN_HEIGHT-325;
		text:SetSize(400,100);text:SetText("You can set a custom screen size with the /xp size command.")		
	
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.game.environment_gameplay);text.position.x=387;text.position.y=self.game.SCREEN_HEIGHT-355;
		text:SetSize(100,100);text:SetText("Frame strata")
		XPRACTICE.OptionsMenuButton.debugbuttonx=400
		XPRACTICE.OptionsMenuButton.debugbuttony=self.game.SCREEN_HEIGHT-370
		local group={}
		tinsert(self.buttongroups,group)
		-- BACKGROUND, LOW, MEDIUM, HIGH, DIALOG, FULLSCREEN, FULLSCREEN_DIALOG, TOOLTIP
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"FrameStrata","BACKGROUND","BACK GROUND","STRATA")
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"FrameStrata","LOW","LOW","STRATA")
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"FrameStrata","MEDIUM","MEDIUM","STRATA")
		XPRACTICE.OptionsMenuButton.debugbuttonx=400
		XPRACTICE.OptionsMenuButton.debugbuttony=self.game.SCREEN_HEIGHT-370-55
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"FrameStrata","HIGH","HIGH","STRATA")
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"FrameStrata","DIALOG","DIALOG","STRATA")
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"FrameStrata","FULLSCREEN","FULLSCREEN","STRATA")
		XPRACTICE.OptionsMenuButton.debugbuttonx=400
		XPRACTICE.OptionsMenuButton.debugbuttony=self.game.SCREEN_HEIGHT-370-55-55
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"FrameStrata","FULLSCREEN_DIALOG","FULLSCREEN DIALOG","STRATA")
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config,"FrameStrata","TOOLTIP","TOOLTIP","STRATA")		
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.game.environment_gameplay);text.position.x=387;text.position.y=self.game.SCREEN_HEIGHT-550;
		text:SetSize(400,100);text:SetText("* Higher frame strata may cause raid alerts to be hidden underneath the game window.")
		
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.game.environment_gameplay);text.position.x=10;text.position.y=self.game.SCREEN_HEIGHT-550;
		text:SetSize(400,100);text:SetText("Camera rotation speed")
		XPRACTICE.OptionsMenuButton.debugbuttonx=50
		XPRACTICE.OptionsMenuButton.debugbuttony=self.game.SCREEN_HEIGHT-575
		local group={}
		tinsert(self.buttongroups,group)
		-- BACKGROUND, LOW, MEDIUM, HIGH, DIALOG, FULLSCREEN, FULLSCREEN_DIALOG, TOOLTIP
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config.Camera,"CameraSpeed",4.5,"SLOW")
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config.Camera,"CameraSpeed",9.0,"MED")
		class.QuickButton(self.game.environment_gameplay,self,group,XPRACTICE_SAVEDATA.Config.Camera,"CameraSpeed",13.5,"FAST")		
	
	
		
		
		do
			startbutton=XPRACTICE.Button.new()
			startbutton:Setup(self.game.environment_gameplay)
			startbutton:SetSize(150,70)
			startbutton.position.x=self.game.SCREEN_WIDTH-10-150
			startbutton.position.y=10
			startbutton:SetLockedStartingAlpha(1.0)
			startbutton:SetText("Return")
			startbutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)
					if(button=="LeftButton" and down)then
						scenario:OnStartButton()
						scenario.game:LoadScenarioByClass(XPRACTICE.Scenario_Menu)
					end
				end)			
			tinsert(self.startbuttons,startbutton)
		end
		
		self:Recalculate()
	end
	
	
	function class:OnStartButton()
		for i=1,#self.startbuttons do
			--self.startbuttons[i].visible=false
			self.startbuttons[i].displayobject.drawable:EnableMouse(false)
		end		
	end
	
	function class:OnEscapeKey()
		self.game:LoadScenarioByClass(XPRACTICE.Scenario_Menu)
	end
	
	
	
	function class.QuickButton(environment,scenario,buttongroup,savearraypointer,savevariable,value,text,settingtype)
		local menubutton
		menubutton=XPRACTICE.Button.new()
		menubutton:Setup(environment)		
		menubutton.position={x=XPRACTICE.OptionsMenuButton.debugbuttonx,y=XPRACTICE.OptionsMenuButton.debugbuttony,z=0}
		local alpha=1
		menubutton:SetLockedStartingAlpha(alpha)
		menubutton:EnableMouse(true)
		menubutton.buttongroup=buttongroup
		tinsert(buttongroup,menubutton)
		menubutton.scenario=scenario
		menubutton.savearraypointer=savearraypointer
		menubutton.savevariable=savevariable
		menubutton.value=value
		menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
				if(button=="LeftButton" and down)then
					menubutton.savearraypointer[menubutton.savevariable]=menubutton.value
					--XPRACTICE.OptionsMenuButton.DeselectButtons(menubutton.buttongroup)	--moved to Recalculate
					--menubutton:Select(true)													--moved to Recalculate
					menubutton.scenario:Recalculate()
					if(settingtype=="SIZE")then
						scenario.game:SetScreenDimensionsFromSavedata()
						scenario.game:LoadScenarioByClass(scenario.game.currentscenarioclass)
					elseif(settingtype=="STRATA")then
						scenario.game.window.background:SetFrameStrata(XPRACTICE_SAVEDATA.Config.FrameStrata) --!!!
					end
				end
			end)
		if(menubutton.savearraypointer[savevariable]==value)then		
			menubutton:Select(true)
		end
		menubutton:SetSize(100,50)
		menubutton:SetText(text)
		XPRACTICE.OptionsMenuButton.debugbuttonx=XPRACTICE.OptionsMenuButton.debugbuttonx+105
		return menubutton
	end		
	
	
	function class:Recalculate()
		for i=1,#self.buttongroups do
			local buttongroup=self.buttongroups[i]
			for j=1,#buttongroup do
				local button=buttongroup[j]
				if(button.savearraypointer[button.savevariable]==button.value)then					
					button:Select(true)
				else
					button:Select(false)
				end
			end
		end	
	end	
	
	
end