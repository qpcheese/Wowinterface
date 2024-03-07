do
	local super=XPRACTICE.Scenario
	XPRACTICE.PRIMALCOUNCIL.Scenario_Options=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.PRIMALCOUNCIL.Scenario_Options
	
	local savedataname="PRIMALCOUNCIL"
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.parentscenario=XPRACTICE.PRIMALCOUNCIL.Scenario
	end

	
	XPRACTICE.GetSaveDataDefaults[savedataname]=function()
		local defaults={}

		defaults.roleid=nil
		

		defaults.WorldMarkerREDXposx1 = nil
		defaults.WorldMarkerREDXposy1 = nil
		defaults.WorldMarkerPURPLEDIAMONDposx1 = nil
		defaults.WorldMarkerPURPLEDIAMONDposy1 = nil
		defaults.WorldMarkerGREENTRIANGLEposx1 = nil
		defaults.WorldMarkerGREENTRIANGLEposy1 = nil
		defaults.WorldMarkerYELLOWSTARposx1 = 	nil
		defaults.WorldMarkerYELLOWSTARposy1 = 	nil
		defaults.WorldMarkerSILVERMOONposx1 =	nil
		defaults.WorldMarkerSILVERMOONposy1 =	nil
		defaults.WorldMarkerBLUESQUAREposx1 =	nil
		defaults.WorldMarkerBLUESQUAREposy1 =	nil
		defaults.WorldMarkerORANGECIRCLEposx1 =	nil
		defaults.WorldMarkerORANGECIRCLEposy1 =	nil
		defaults.WorldMarkerWHITESKULLposx1 =	nil
		defaults.WorldMarkerWHITESKULLposy1 =	nil	
		
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
