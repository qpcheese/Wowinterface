do
	local super=XPRACTICE.Scenario
	XPRACTICE.SMOLDERON.Scenario_Options=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SMOLDERON.Scenario_Options
	
	local savedataname="SMOLDERON"
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.parentscenario=XPRACTICE.SMOLDERON.Scenario
	end

	
	XPRACTICE.GetSaveDataDefaults[savedataname]=function()
		local defaults={}

		defaults.roleid=nil
		

		defaults.WorldMarkerREDXposx = nil
		defaults.WorldMarkerREDXposy = nil
		defaults.WorldMarkerPURPLEDIAMONDposx = nil
		defaults.WorldMarkerPURPLEDIAMONDposy = nil
		defaults.WorldMarkerGREENTRIANGLEposx = nil
		defaults.WorldMarkerGREENTRIANGLEposy = nil
		defaults.WorldMarkerYELLOWSTARposx = 	nil
		defaults.WorldMarkerYELLOWSTARposy = 	nil
		defaults.WorldMarkerSILVERMOONposx =	nil
		defaults.WorldMarkerSILVERMOONposy =	nil
		defaults.WorldMarkerBLUESQUAREposx =	nil
		defaults.WorldMarkerBLUESQUAREposy =	nil
		defaults.WorldMarkerORANGECIRCLEposx =	nil
		defaults.WorldMarkerORANGECIRCLEposy =	nil
		defaults.WorldMarkerWHITESKULLposx =	nil
		defaults.WorldMarkerWHITESKULLposy =	nil
		
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
