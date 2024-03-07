do
	local super=XPRACTICE.Button
	XPRACTICE.OptionsMenuButton=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.OptionsMenuButton
	
	--static functions!  don't use : notation
	function class.ResetPosition()
		XPRACTICE.OptionsMenuButton.debugbuttonx=25
		XPRACTICE.OptionsMenuButton.debugbuttony=-35
		XPRACTICE.OptionsMenuButton.descriptiony=-35
	end	
	XPRACTICE.OptionsMenuButton.ResetPosition()

		
	function class.QuickLabel(environment,scenario,scrollbox,text)
		local label=XPRACTICE.LeftAlignedLabel.new()
		label:Setup(environment)		
		label:SetSize(600,600)
		label:SetText(text)		
		label:SetSize(label.displayobject.drawable.fontstring:GetStringWidth(),label.displayobject.drawable.fontstring:GetStringHeight())
		XPRACTICE.OptionsMenuButton.debugbuttony=XPRACTICE.OptionsMenuButton.debugbuttony-label.displayobject.drawable.fontstring:GetStringHeight()
		label.position.x=XPRACTICE.OptionsMenuButton.debugbuttonx		
		label.position.y=XPRACTICE.OptionsMenuButton.debugbuttony
		label.displayobject.parentframe=scrollbox.displayobject.drawable
		label.displayobject.drawable:SetParent(label.displayobject.parentframe)
		XPRACTICE.OptionsMenuButton.debugbuttony=XPRACTICE.OptionsMenuButton.debugbuttony-5
		return label
	end
		
	function class.QuickButtonGroup(environment,scenario,scrollbox,width,height,savearray,savevariable,args)
		XPRACTICE.OptionsMenuButton.debugbuttony=XPRACTICE.OptionsMenuButton.debugbuttony-height
		local buttongroup={}		
		for i=1,#args do
			local arg=args[i]
			local button=class.QuickButton(environment,scenario,buttongroup,savearray,savevariable,arg[2])
			button:SetSize(width,height)
			button:SetText(arg[1])
			button.displayobject.parentframe=scrollbox.displayobject.drawable
			button.displayobject.drawable:SetParent(button.displayobject.parentframe)
			XPRACTICE.OptionsMenuButton.debugbuttonx=XPRACTICE.OptionsMenuButton.debugbuttonx+width+10			
		end
		XPRACTICE.OptionsMenuButton.descriptionx=XPRACTICE.OptionsMenuButton.debugbuttonx+25
		XPRACTICE.OptionsMenuButton.debugbuttonx=25
		XPRACTICE.OptionsMenuButton.debugbuttony=XPRACTICE.OptionsMenuButton.debugbuttony-20
		XPRACTICE.OptionsMenuButton.descriptiony=XPRACTICE.OptionsMenuButton.debugbuttony+20+height/2
		
		return buttongroup
	end

	function class.QuickDescriptionLabel(environment,scenario,scrollbox,text)
		local label=XPRACTICE.LeftAlignedLabel.new()
		label:Setup(environment)		
		label:SetSize(600,600)
		label:SetText(text)		
		label:SetSize(label.displayobject.drawable.fontstring:GetStringWidth(),label.displayobject.drawable.fontstring:GetStringHeight())
		XPRACTICE.OptionsMenuButton.debugbuttony=XPRACTICE.OptionsMenuButton.debugbuttony-label.displayobject.drawable.fontstring:GetStringHeight()
		label.position.x=XPRACTICE.OptionsMenuButton.descriptionx
		label.position.y=XPRACTICE.OptionsMenuButton.descriptiony
		label.displayobject.parentframe=scrollbox.displayobject.drawable
		label.displayobject.drawable:SetParent(label.displayobject.parentframe)
		label.anchor="LEFT"
		XPRACTICE.OptionsMenuButton.debugbuttony=XPRACTICE.OptionsMenuButton.debugbuttony-5
		return label
	end
	
	
	function class.QuickButton(environment,scenario,buttongroup,savearray,savevariable,value)
		local menubutton
		menubutton=XPRACTICE.Button.new()
		menubutton:Setup(environment)		
		menubutton.position={x=XPRACTICE.OptionsMenuButton.debugbuttonx,y=XPRACTICE.OptionsMenuButton.debugbuttony,z=0}
		local alpha=1
		menubutton:SetLockedStartingAlpha(alpha)
		menubutton:EnableMouse(true)
		menubutton.buttongroup=buttongroup
		tinsert(buttongroup,menubutton)
		menubutton.scenario=scenario
		menubutton.savearray=savearray
		menubutton.savevariable=savevariable
		menubutton.value=value
		menubutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
				if(button=="LeftButton" and down)then
					XPRACTICE_SAVEDATA[menubutton.savearray][menubutton.savevariable]=menubutton.value
					--XPRACTICE.OptionsMenuButton.DeselectButtons(menubutton.buttongroup)	--moved to Recalculate
					--menubutton:Select(true)													--moved to Recalculate
					menubutton.scenario:Recalculate()
				end
			end)
		if(XPRACTICE_SAVEDATA[savearray][savevariable]==value)then		
			menubutton:Select(true)
		end
		tinsert(scenario.menubuttons,bossbutton)
		return menubutton
	end	
	
	
	
	
	function class.DeselectButtons(buttongroup)
		for i=1,#buttongroup do
			local button=buttongroup[i]
			button:Select(false)
		end
	end	
end
