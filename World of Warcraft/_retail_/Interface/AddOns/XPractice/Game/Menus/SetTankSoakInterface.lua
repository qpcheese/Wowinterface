do
	local super=XPRACTICE.GameObject
	XPRACTICE.SetTankSoakInterface=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SetTankSoakInterface
	
	function class:CreateAssociatedObjects()
		self.scenario.statuslabel:SetText("")
		self.labels={}
		self.buttons={}	
		local game=self.scenario.game
		local OFFSETX=0
		local OFFSETY=0		

		local text

		
		local button
		local scenario=self.scenario
		OFFSETX=0
		OFFSETY=125	
		text=XPRACTICE.Label.new();text:Setup(self.environment)		
		text.position.x=OFFSETX+game.window.frame:GetWidth()/2-350
		text.position.y=OFFSETY+game.window.frame:GetHeight()/2-50
		text:SetSize(700,300)
		local desc=""		
		text:SetText("This setting will determine the placement of hint arrows when Martyrdom (tank soak) is cast.\nYou are not (yet) graded on whether you soak it properly.")
		tinsert(self.labels,text)	
		for j=1,3 do
			local i=j
			if(j==3)then i=0 end
			local role=scenario.roles[i]
			button=XPRACTICE.Button.new()
			button:Setup(game.environment_gameplay)
			button:SetSize(300,70)
			button.position.x=OFFSETX+game.window.frame:GetWidth()/2-150
			button.position.y=OFFSETY+game.window.frame:GetHeight()/2
			if(i==1)then
				button:SetText("Martyrdom ODDS")
			elseif(i==2)then
				button:SetText("Martyrdom EVENS")
			else
				button:SetText("Do not soak Martyrdom")
			end
			button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
					if(button=="LeftButton" and down)then
						scenario.statuslabel:SetText("TANK SOAK setting has been changed.")		
						XPRACTICE_SAVEDATA.THEJAILER2.tanksoak=i
						scenario.tempmenu:UnloadCurrentMenu()
					end
				end)			
			--button.displayobject.drawable:SetParent(button.displayobject.parentframe)
			tinsert(self.buttons,button)
			
			OFFSETY=OFFSETY-70-10
		end
		
		OFFSETX=0
		OFFSETY=OFFSETY+30-10

		button=XPRACTICE.Button.new()
		button:Setup(game.environment_gameplay)
		button:SetSize(150,30)
		button.position.x=OFFSETX+game.window.frame:GetWidth()/2-150+75
		button.position.y=OFFSETY+game.window.frame:GetHeight()/2
		button:SetText("Cancel")		
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(button=="LeftButton" and down)then
					scenario.tempmenu:UnloadCurrentMenu()
				end
			end)			
		--button.displayobject.drawable:SetParent(button.displayobject.parentframe)
		tinsert(self.buttons,button)		
		-- text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.environment)		
		-- text.position.x=OFFSETX+10+game.window.frame:GetWidth()/2
		-- text.position.y=OFFSETY+game.window.frame:GetHeight()/2
		-- text:SetSize(300,30)
		-- text:SetText("Cancel soak selection.")
		-- --text:SetText("")
		-- tinsert(self.labels,text)	

	
		
		
		self:Show()
	end
	
	function class:Hide()
		for i=1,#self.labels do
			self.labels[i].alpha=0
		end
		for i=1,#self.buttons do
			self.buttons[i]:SetLockedStartingAlpha(0)
			self.buttons[i]:EnableMouse(false)
		end		
	end
	
	function class:Show()
		for i=1,#self.labels do
			self.labels[i].alpha=1
		end
		for i=1,#self.buttons do
			self.buttons[i]:SetLockedStartingAlpha(1)
			self.buttons[i]:EnableMouse(true)
		end		
	end	
end