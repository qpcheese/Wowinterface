do
	local super=XPRACTICE.GameObject
	XPRACTICE.SetSoakInterface=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SetSoakInterface
	
	function class:CreateAssociatedObjects()
		self.labels={}
		self.buttons={}	
		local game=self.scenario.game
		local OFFSETX=0
		local OFFSETY=0		

		local text
		-- text=XPRACTICE.Label.new();text:Setup(self.environment)		
		-- text.position.x=game.window.frame:GetWidth()*0.25
		-- text.position.y=OFFSETY+game.window.frame:GetHeight()/2+100
		-- text:SetSize(game.window.frame:GetWidth()/2,70)
		-- text:SetText("Really set role to \"ROLENAME\"?")
		-- tinsert(self.labels,text)
		-- self.rolenamelabel=text

		
		local button
		local scenario=self.scenario
		OFFSETX=-400
		OFFSETY=300		
		for i=1,#scenario.roles do
			local role=scenario.roles[i]
			button=XPRACTICE.Button.new()
			button:Setup(game.environment_gameplay)
			button:SetSize(150,30)
			button.position.x=OFFSETX+game.window.frame:GetWidth()/2-150
			button.position.y=OFFSETY+game.window.frame:GetHeight()/2
			button:SetText(role.rolename)		
			button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
					if(button=="LeftButton" and down)then
						local rolechar="?"
						if(role.roleid==nil)then
							print("The role you are trying to access does not have a valid \"Role ID\".  Something has gone terribly wrong.")
							return
						end
						if(role.requireofficer and not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then return end						
						if(scenario.player.rolepointer and scenario.player.rolepointer.roleid==role.roleid)then
							scenario.statuslabel:SetText("You are already "..role.rolename..".")						
						elseif(false)then
							-- TODO: check again that role isn't already taken
						else
							scenario.multiplayer:FormatAndSend("CHANGEROLE",role.roleid)
						end
						scenario.tempmenu:UnloadCurrentMenu()
					end
				end)			
			--button.displayobject.drawable:SetParent(button.displayobject.parentframe)
			tinsert(self.buttons,button)
			
			text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.environment)		
			text.position.x=OFFSETX+10+game.window.frame:GetWidth()/2
			text.position.y=OFFSETY+game.window.frame:GetHeight()/2
			text:SetSize(300,30)
			local desc=""
			--text:SetText("Description Text "..tostring(i)..": "..scenario.roles[i].roleid)
			if(role.requireofficer)then
				desc="(Requires lead/assist)"
			elseif(role.playerghostpointer)then
				desc=role.playerghostpointer.playername
			end
			text:SetText(desc)
			tinsert(self.labels,text)

			if(i%2==1)then
				OFFSETX=100
			else
				OFFSETY=OFFSETY-30-10
				OFFSETX=-400
			end
		end
		OFFSETX=-400
		OFFSETY=OFFSETY-30-10

				
		
		OFFSETY=OFFSETY-30-10
		button=XPRACTICE.Button.new()
		button:Setup(game.environment_gameplay)
		button:SetSize(150,30)
		button.position.x=OFFSETX+game.window.frame:GetWidth()/2-150
		button.position.y=OFFSETY+game.window.frame:GetHeight()/2
		button:SetText("Cancel")		
		button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
				if(button=="LeftButton" and down)then
					scenario.tempmenu:UnloadCurrentMenu()
				end
			end)			
		--button.displayobject.drawable:SetParent(button.displayobject.parentframe)
		tinsert(self.buttons,button)		
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.environment)		
		text.position.x=OFFSETX+10+game.window.frame:GetWidth()/2
		text.position.y=OFFSETY+game.window.frame:GetHeight()/2
		text:SetSize(300,30)
		text:SetText("Cancel soak selection.")
		--text:SetText("")
		tinsert(self.labels,text)	

	
		
		
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