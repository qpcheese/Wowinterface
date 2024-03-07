do
	local super=XPRACTICE.ExtraActionButton
	XPRACTICE.BossDebugButton=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.BossDebugButton
	
	--static functions!  don't use : notation
	function class.ResetPosition()
		XPRACTICE.BossDebugButton.debugbuttonx=52
		XPRACTICE.BossDebugButton.debugbuttony=104
	end	
	XPRACTICE.BossDebugButton.ResetPosition()

		
	function class.QuickButton(environment,scenario,spellclass,castermob,text,size,existingspell)		
		text=text or ""
		size=size or 12
		local bossbutton
		local spell
		if(not existingspell)then
			spell=spellclass.new()
			spell:Setup(castermob.combatmodule)
			spell.scenario=scenario
		else
			spell=existingspell
			spell.scenario=scenario		
		end
		bossbutton=XPRACTICE.BossDebugButton.new()
		bossbutton:Setup(environment)		
		bossbutton:SetIcon(spell:GetIcon())
		if(spell.name and XPRACTICE_SAVEDATA.TEMP_mmbspellname and spell.name==XPRACTICE_SAVEDATA.TEMP_mmbspellname)then
			scenario.mmbspellbutton=bossbutton
		end
		bossbutton.position={x=XPRACTICE.BossDebugButton.debugbuttonx,y=XPRACTICE.BossDebugButton.debugbuttony,z=0}
		local alpha
		if(XPRACTICE.DEBUG.visiblebosscontrolbuttons)then alpha=1 else alpha=0 end
		bossbutton:SetLockedStartingAlpha(alpha)
		bossbutton:EnableMouse(XPRACTICE.DEBUG.visiblebosscontrolbuttons)
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
		bossbutton.BossButtonClick=function(self)
				if(scenario.setmmbmode and (not spell.issetmmb))then
					scenario.setmmbmode=false
					scenario.mmbspellbutton=bossbutton
					XPRACTICE_SAVEDATA.TEMP_mmbspellname=spell.name
					scenario.statuslabel:SetText("Middle mouse button has been set to \""..spell.name.."\".",3.0)					
				else					
					local queuepointer=spell:NewQueue()
					queuepointer.castercombat=castermob.combatmodule					
					local errorcode=castermob.combatmodule:TryQueue(queuepointer)
					--print("errorcode",errorcode)
				end
			end
		bossbutton.displayobject.drawable:SetScript("OnClick",function(self,button,down)			
				if(down)then
					bossbutton:BossButtonClick()
				end
			end)
		local disp=bossbutton.displayobject
		disp.text:SetParent(disp.back)
		disp.text:Show();disp.text:SetAlpha(1)
		disp.text:SetAllPoints(disp.back)
		--self.back:SetFrameLevel(200)
		disp.text.fontstring:Show()
		disp.text.fontstring:SetFont("Fonts\\FRIZQT__.TTF",size,"OUTLINE")
		disp.text.fontstring:SetText(text)
		tinsert(scenario.bossdebugbuttons,bossbutton)
		return bossbutton
	end

	function class.CarriageReturn()
		XPRACTICE.BossDebugButton.debugbuttonx=52
		XPRACTICE.BossDebugButton.debugbuttony=XPRACTICE.BossDebugButton.debugbuttony-52
	end
end
