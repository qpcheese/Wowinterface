do
	local super=XPRACTICE.GameObject
	XPRACTICE.TempMenuInterfaceCollection=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.TempMenuInterfaceCollection

	function class:Setup(environment,x,y,z)
		super.Setup(self,environment,x,y,z)
		self.currentmenu=nil
	end
	
	function class:LoadMenu(menuclass)
		self:UnloadCurrentMenu()		
		self.currentmenu=menuclass.new()
		self.currentmenu.menuclass=menuclass
		self.currentmenu.scenario=self.scenario
		self.currentmenu:Setup(self.environment)
	end
	
	function class:UnloadCurrentMenu()
		if(self.currentmenu)then
			for i=1,#self.currentmenu.labels do
				self.currentmenu.labels[i]:Die()
			end
			for i=1,#self.currentmenu.buttons do
				self.currentmenu.buttons[i]:Die()
			end			
			self.currentmenu:Die()
			self.currentmenu=nil
		end
	end
	
	
end
	