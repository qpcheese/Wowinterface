do
	local super=XPRACTICE.GameObject
	XPRACTICE.SetRoleWarningInterface=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SetRoleWarningInterface
	
	function class:CreateAssociatedObjects()
		self.labels={}
		self.buttons={}	
		local game=self.scenario.game

		local text
		local OFFSETY=0
		text=XPRACTICE.Label.new();text:Setup(self.environment)		
		text.position.x=game.window.frame:GetWidth()*0.25
		text.position.y=OFFSETY+game.window.frame:GetHeight()/2+100
		text:SetSize(game.window.frame:GetWidth()/2,70)
		text:SetText("Really set role to \"ROLENAME\"?")
		tinsert(self.labels,text)
		self.rolenamelabel=text
		OFFSETY=OFFSETY-18
		text=XPRACTICE.Label.new();text:Setup(self.environment)		
		text.position.x=game.window.frame:GetWidth()*0.25
		text.position.y=OFFSETY+game.window.frame:GetHeight()/2+100
		text:SetSize(game.window.frame:GetWidth()/2,70)
		text:SetText("(PLAYERNAME-SERVERNAME will be kicked out into spectator mode!)")
		tinsert(self.labels,text)
		self.warninglabel=text
		
		local button
		local scenario=self.scenario
		OFFSETY=OFFSETY-60
		button=XPRACTICE.Button.new()
		button:Setup(game.environment_gameplay)
		button:SetSize(100,60)
		button.position.x=game.window.frame:GetWidth()/2-50-60
		button.position.y=OFFSETY+game.window.frame:GetHeight()/2+100
		button:SetText("OK")		
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(button=="LeftButton" and down)then
					local rolechar="?"
					
					--scenario.multiplayer:FormatAndSend(
				end
			end)			
		--button.displayobject.drawable:SetParent(button.displayobject.parentframe)
		tinsert(self.buttons,button)
		self.okbutton=button
		
		local button
		button=XPRACTICE.Button.new()
		button:Setup(game.environment_gameplay)
		button:SetSize(100,60)
		button.position.x=game.window.frame:GetWidth()/2-50+60
		button.position.y=OFFSETY+game.window.frame:GetHeight()/2+100
		button:SetText("Cancel")
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(button=="LeftButton" and down)then					
					
				end
			end)			
		--button.displayobject.drawable:SetParent(button.displayobject.parentframe)
		tinsert(self.buttons,button)
		self.cancelbutton=button		
		
		self:Hide()
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