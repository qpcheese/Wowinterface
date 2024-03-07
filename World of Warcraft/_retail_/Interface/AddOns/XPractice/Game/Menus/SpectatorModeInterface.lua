do
	local super=XPRACTICE.GameObject
	XPRACTICE.SpectatorModeInterface=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SpectatorModeInterface
	
	function class:CreateAssociatedObjects()
		self.labels={}
		self.buttons={}
		local scenario=self.scenario
		local game=scenario.game
		
		local text
		local OFFSETY=0
		text=XPRACTICE.Label.new();text:Setup(self.environment)		
		text.position.x=game.window.frame:GetWidth()*0.25
		text.position.y=OFFSETY+game.window.frame:GetHeight()/2+200
		text:SetSize(game.window.frame:GetWidth()/2,70)
		text:SetText("You are currently spectating as a ghost.  To join the game, click SET ROLE.")		
		tinsert(self.labels,text)
		OFFSETY=OFFSETY-32
		local button=XPRACTICE.BossDebugButton.QuickButton(self.environment,scenario,XPRACTICE.THEJAILER2.Spell_SetRole,scenario.spellbunny,"SET\n ROLE")
		button.position.x=game.window.frame:GetWidth()*0.5-52/2
		button.position.y=OFFSETY+game.window.frame:GetHeight()/2+200
		tinsert(self.labels,button)		

		--self:Hide()
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
