do
	local super=XPRACTICE.Scenario
	XPRACTICE.SARKARETH2.Scenario_Options=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.Scenario_Options
	
	local savedataname="SARKARETH2"
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.parentscenario=XPRACTICE.SARKARETH2.Scenario
	end

	
	XPRACTICE.GetSaveDataDefaults[savedataname]=function()
		local defaults={}

		defaults.subscenario=1
		
		defaults.roleid=nil
		

		defaults.WorldMarkerREDXposx = 0
		defaults.WorldMarkerREDXposy = -2
		defaults.WorldMarkerPURPLEDIAMONDposx = 28.03
		defaults.WorldMarkerPURPLEDIAMONDposy = 27.45
		defaults.WorldMarkerGREENTRIANGLEposx = 46.36
		defaults.WorldMarkerGREENTRIANGLEposy = 0
		defaults.WorldMarkerYELLOWSTARposx = 	-16.23
		defaults.WorldMarkerYELLOWSTARposy = 	1.04
		defaults.WorldMarkerSILVERMOONposx =	24.43
		defaults.WorldMarkerSILVERMOONposy =	23.87
		defaults.WorldMarkerBLUESQUAREposx =	3.70
		defaults.WorldMarkerBLUESQUAREposy =	38.11
		defaults.WorldMarkerORANGECIRCLEposx =	1.37
		defaults.WorldMarkerORANGECIRCLEposy =	-47.26
		defaults.WorldMarkerWHITESKULLposx =	33.65
		defaults.WorldMarkerWHITESKULLposy =	-34.32
		
		return defaults
	end
	
	
	

	function class:Populate()
		super.Populate(self)
		
		
		self.buttongroups={}

		
		local scenario=self
		


	end
	
	

	
		
	function class:Recalculate()
	
		for i=1,#self.buttongroups do
			local buttongroup=self.buttongroups[i]
			for j=1,#buttongroup do
				local button=buttongroup[j]
				if(XPRACTICE_SAVEDATA[button.savearray][button.savevariable]==button.value)then
					button:Select(true)
				else
					button:Select(false)
				end
			end
		end
	
	end

	function class:EnableButtons(buttongroup,toggle)
		for i=1,#buttongroup do
			local button=buttongroup[i]
			if(toggle)then
				button.displayobject.drawable:SetAlpha(1)
			else
				button.displayobject.drawable:SetAlpha(0)
			end
			button:EnableMouse(toggle)
		end
	end
	function class:DeselectButtons(buttongroup)
		for i=1,#buttongroup do
			local button=buttongroup[i]
			button:Select(false)
		end
	end
	
	function class:OnEscapeKey()
		self.game:LoadScenarioByClass(self.parentscenario)
	end	
end

-- do not register scenario to main menu
