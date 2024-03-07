do
	XPRACTICE.CustomEffectEditInterface_Statics={bossindex=nil,effectindex=nil,originaltext=nil,originalcode=nil,newcode=nil}

	local super=XPRACTICE.GameObject
	XPRACTICE.CustomEffectEditInterface=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.CustomEffectEditInterface
	
	function class:CreateAssociatedObjects()
		self.scenario.statuslabel:SetText("")
		self.labels={}
		self.buttons={}	
			
		local game=self.scenario.game		
		local OFFSETX=0
		local OFFSETY=0		

		local text
		
		local midx=game.window.frame:GetWidth()/2
		local leftx=380
		local midy=game.window.frame:GetHeight()/2

		local originalcode=XPRACTICE.CustomEffectEditInterface_Statics.originalcode
		local originaltext=XPRACTICE.CustomEffectEditInterface_Statics.originaltext
		local newcode=XPRACTICE.CustomEffectEditInterface_Statics.newcode
		
		local button
		local currentmenu=self
		local scenario=self.scenario
		OFFSETX=0
		OFFSETY=0
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.environment)		
		text.position.x=leftx
		text.position.y=midy+230
		text:SetSize(300,30)
		text:SetText("Editing "..originaltext.."...")
		tinsert(self.labels,text)	
		
		text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.environment)		
		text.position.x=leftx+20
		text.position.y=midy+200
		text:SetSize(200,30)
		text:SetText("Behavior:")
		tinsert(self.labels,text)	
		do
			local behaviors={{"G","Place on ground"},{"P","Attach to player"},{"E","Attach to enemy"}}
			local radiobuttons={}
			for i=1,#behaviors do
				local code=behaviors[i][1]
				local text=behaviors[i][2]
				local radiobutton=XPRACTICE.Button.new()
				radiobutton:Setup(game.environment_gameplay)
				radiobutton:SetSize(100,50)
				radiobutton.position.x=leftx+106*(i-1)
				radiobutton.position.y=midy+200-56
				radiobutton:SetText(text)
				radiobutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)
						if(button=="LeftButton" and down)then
							radiobutton:Select(true)
							XPRACTICE.CustomEffectEditInterface_Statics.newcode=XPRACTICE.ChangeOneCharacter(XPRACTICE.CustomEffectEditInterface_Statics.newcode,code,1)
						end
					end)			
				local old=radiobutton.Select
				radiobutton.Select=function(self,selected)
					old(self,selected)					
					if(selected)then					
						for j=1,#radiobuttons do
							if(radiobuttons[j]~=self)then
								radiobuttons[j]:Select(false)
							end
						end
					end
				end
				if(code==string.sub(newcode,1,1))then
					radiobutton:Select(true)
				end	
				
				tinsert(self.buttons,radiobutton)
				tinsert(radiobuttons,radiobutton)
			end
		end
		do
			text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.environment)		
			text.position.x=leftx+20
			text.position.y=midy+100
			text:SetSize(200,30)
			text:SetText("Appearance:")
			tinsert(self.labels,text)		

			local colors={{"B","Blue"},{"G","Gray"},{"R","Red"}}
			local radiobuttons={}
			for i=1,#colors do
				local code=colors[i][1]
				local text=colors[i][2]
				local radiobutton=XPRACTICE.Button.new()
				radiobutton:Setup(game.environment_gameplay)
				radiobutton:SetSize(100,50)
				radiobutton.position.x=leftx+106*(i-1)
				radiobutton.position.y=midy+100-56
				radiobutton:SetText(text)
				radiobutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)
						if(button=="LeftButton" and down)then
							radiobutton:Select(true)			
							XPRACTICE.CustomEffectEditInterface_Statics.newcode=XPRACTICE.ChangeOneCharacter(XPRACTICE.CustomEffectEditInterface_Statics.newcode,code,2)
						end
					end)	
				local old=radiobutton.Select
				radiobutton.Select=function(self,selected)
					old(self,selected)
					if(selected)then
						for j=1,#radiobuttons do
							if(radiobuttons[j]~=self)then
								radiobuttons[j]:Select(false)
							end
						end
					end
				end				
				if(code==string.sub(newcode,2,2))then
					radiobutton:Select(true)
				end					
				--radiobutton.displayobject.drawable:SetParent(radiobutton.displayobject.parentframe)
				tinsert(self.buttons,radiobutton)
				tinsert(radiobuttons,radiobutton)
			end
		end
		do
			local shapes={{"R","Ring"},{"S","Swirl"},{"B","Both"},{"C","Solid"}}
			local radiobuttons={}
			for i=1,#shapes do
				local code=shapes[i][1]
				local text=shapes[i][2]
				local radiobutton=XPRACTICE.Button.new()
				radiobutton:Setup(game.environment_gameplay)
				radiobutton:SetSize(100,50)
				radiobutton.position.x=leftx+106*(i-1)
				radiobutton.position.y=midy+100-56-56
				radiobutton:SetText(text)
				radiobutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)
						if(button=="LeftButton" and down)then
							radiobutton:Select(true)				
							XPRACTICE.CustomEffectEditInterface_Statics.newcode=XPRACTICE.ChangeOneCharacter(XPRACTICE.CustomEffectEditInterface_Statics.newcode,code,3)
						end
					end)	
				local old=radiobutton.Select
				radiobutton.Select=function(self,selected)
					old(self,selected)
					if(selected)then
						for j=1,#radiobuttons do
							if(radiobuttons[j]~=self)then
								radiobuttons[j]:Select(false)
							end
						end
					end
				end				
				if(code==string.sub(newcode,3,3))then
					radiobutton:Select(true)
				end					
				--radiobutton.displayobject.drawable:SetParent(radiobutton.displayobject.parentframe)
				tinsert(self.buttons,radiobutton)
				tinsert(radiobuttons,radiobutton)
			end
		end

		
		do
			local radius={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,30,35,40,45,50}
			local radiobuttons={}
			text=XPRACTICE.LeftAlignedLabel.new();text:Setup(self.environment)		
			text.position.x=leftx+20
			text.position.y=midy-60
			text:SetSize(200,30)
			text:SetText("Radius:")
			tinsert(self.labels,text)	
			local x=leftx
			local y=midy-60-36
			for i=1,#radius do
				local code=string.char(radius[i]+48)
				local text=radius[i]
				local radiobutton=XPRACTICE.Button.new()
				radiobutton:Setup(game.environment_gameplay)
				radiobutton:SetSize(40,30)
				radiobutton.position.x=x
				radiobutton.position.y=y
				x=x+46
				if(i%10==0)then
					x=leftx
					y=y-36
				end
				radiobutton:SetText(text.."y")
				radiobutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)
						if(button=="LeftButton" and down)then
							XPRACTICE.CustomEffectEditInterface_Statics.newcode=XPRACTICE.ChangeOneCharacter(XPRACTICE.CustomEffectEditInterface_Statics.newcode,code,4)
							radiobutton:Select(true)
						end
					end)		
				local old=radiobutton.Select
				radiobutton.Select=function(self,selected)
					old(self,selected)
					if(selected)then
						for j=1,#radiobuttons do
							if(radiobuttons[j]~=self)then
								radiobuttons[j]:Select(false)
							end
						end
					end
				end				
				if(code==string.sub(newcode,4,4))then
					radiobutton:Select(true)
				end					
				--radiobutton.displayobject.drawable:SetParent(button.displayobject.parentframe)
				tinsert(self.buttons,radiobutton)
				tinsert(radiobuttons,radiobutton)
			end		
		end
		--TODO: save changes/discard button/delete preset button
			--scenario.tempmenu:UnloadCurrentMenu()
		
		do
			local button=XPRACTICE.Button.new()
			button:Setup(game.environment_gameplay)
			button:SetSize(150,50)
			button.position.x=leftx
			button.position.y=midy-270
			button:SetText("Save changes")
			button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
					if(button=="LeftButton" and down)then
						local varname="CustomEffectPresets"..tostring(XPRACTICE.CustomEffectEditInterface_Statics.bossindex)
						local effects=XPRACTICE_SAVEDATA[scenario.savedataname][varname]						
						--print("Saving:",scenario.savedataname,varname,XPRACTICE.CustomEffectEditInterface_Statics.effectindex,XPRACTICE.CustomEffectEditInterface_Statics.newcode)
						effects[XPRACTICE.CustomEffectEditInterface_Statics.effectindex]=XPRACTICE.CustomEffectEditInterface_Statics.newcode
						XPRACTICE_SAVEDATA[scenario.savedataname][varname]=effects	--not sure this step is necessary
						
						scenario.tempmenu:UnloadCurrentMenu()
						scenario.customeffectbutton.buttons=scenario.customeffectcontroller:QuickButtons(nil,nil,scenario)
						scenario.statuslabel:SetText(XPRACTICE.CustomEffectEditInterface_Statics.originaltext.." was replaced with \""..
												XPRACTICE.ABERRUSRAIDMAPS.CustomEffect.CodeToString(XPRACTICE.CustomEffectEditInterface_Statics.newcode).."\".")						
					end
				end)				
			tinsert(self.buttons,button)
			
			local button=XPRACTICE.Button.new()
			button:Setup(game.environment_gameplay)
			button:SetSize(150,50)
			button.position.x=leftx+156
			button.position.y=midy-270
			button:SetText("Discard changes")
			button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
					if(button=="LeftButton" and down)then
						scenario.tempmenu:UnloadCurrentMenu()
					end
				end)			
			tinsert(self.buttons,button)		

			local button=XPRACTICE.Button.new()
			button:Setup(game.environment_gameplay)
			button:SetSize(150,50)
			button.position.x=leftx+156+156
			button.position.y=midy-270
			button:SetText("Delete effect")
			button.displayobject.drawable:SetScript("OnClick",function(self,button,down)
					if(button=="LeftButton" and down)then
						scenario.tempmenu:LoadMenu(XPRACTICE.CustomEffectDeleteEffectInterface)
					end
				end)			
			tinsert(self.buttons,button)	
		end
		
		
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