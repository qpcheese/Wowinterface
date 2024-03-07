do
	local super=XPRACTICE.Scenario
	XPRACTICE.Scenario_Credits = XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.Scenario_Credits
	
	
	
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
		local message="Credits"
		text:SetText(message)
		
		text=XPRACTICE.Label.new();text:Setup(self.game.environment_gameplay);
		--text.position.x=self.game.window.frame:GetWidth()/12;
		text.position.x=self.game.window.frame:GetWidth()/3;
		text.position.y=0+100;
		text:SetSize(self.game.window.frame:GetWidth()/3,self.game.window.frame:GetHeight())
		local message="X Practice would not be possible without the tireless efforts of the machinima and datamining communities.\r\r"
					.."We are grateful to the Blizzard engineers for the creation of devtools and widgets for cutscenes and UI, and for making these tools available for the public to tinker with.\r\r"
					.."Special thanks to the RWF communities for your suggestions, feedback, and encouragement.\r\r"
		text:SetText(message)
		

		
		text=XPRACTICE.Label.new();text:Setup(self.game.environment_gameplay);
		text.position.x=0;
		text.position.y=200;
		text:SetSize(self.game.window.frame:GetWidth(),100)
		local message="oh yeah and Lua Viper did ... programming and stuff."
		text:SetText(message)		
		
		
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
	
	
	
	
end