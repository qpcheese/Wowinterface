do

	local super=XPRACTICE.GameObject
	XPRACTICE.CustomEffects_EraseAllInterface=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.CustomEffects_EraseAllInterface
	
	function class:CreateAssociatedObjects()
		self.scenario.statuslabel:SetText("")
		self.labels={}
		self.buttons={}	
			
		local game=self.scenario.game		
		local OFFSETX=0
		local OFFSETY=0		

		local text

		
		local button
		local currentmenu=self
		local scenario=self.scenario
		OFFSETX=0
		OFFSETY=125	
		text=XPRACTICE.Label.new();text:Setup(self.environment)		
		text.position.x=OFFSETX+game.window.frame:GetWidth()/2-350
		text.position.y=OFFSETY+game.window.frame:GetHeight()/2-250
		text:SetSize(700,500)
		local desc=""
		local otherplayers=GetNumGroupMembers()-1
		desc="Really clear ALL custom effects from the canvas?"
		text:SetText(desc)
		tinsert(self.labels,text)	
		button=XPRACTICE.Button.new()
		button:Setup(game.environment_gameplay)
		button:SetSize(100,70)
		button.position.x=game.window.frame:GetWidth()/2-75-50
		button.position.y=game.window.frame:GetHeight()/2
		button:SetText("OK")
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(button=="LeftButton" and down)then
					scenario.tempmenu:UnloadCurrentMenu()
					scenario.multiplayer:FormatAndSend("CUSTOMEFFECT_ERASE_ALL")
				end
			end)			
		--button.displayobject.drawable:SetParent(button.displayobject.parentframe)
		tinsert(self.buttons,button)


		button=XPRACTICE.Button.new()
		button:Setup(game.environment_gameplay)
		button:SetSize(100,70)
		button.position.x=game.window.frame:GetWidth()/2+75-50
		button.position.y=game.window.frame:GetHeight()/2
		button:SetText("Cancel")		
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(button=="LeftButton" and down)then
					scenario.tempmenu:UnloadCurrentMenu()
				end
			end)			
		tinsert(self.buttons,button)		

	
		
		
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