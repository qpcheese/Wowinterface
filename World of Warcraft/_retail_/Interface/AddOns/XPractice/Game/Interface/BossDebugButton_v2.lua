do
	local super=XPRACTICE.BossDebugButton
	XPRACTICE.BossDebugButton_v2=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.BossDebugButton_v2
	
	XPRACTICE.BossDebugButton_v2.HIDEBUTTONS=false
	
	function class.QuickButton(environment,scenario,spellclass,castermob,text,size,existingspell,spellbookspellname)		
		text=text or ""
		size=size or 12
		local bossbutton
		local spell		
		if(not existingspell)then
			spell=spellclass.new()
			spell:Setup(castermob.combatmodule)			
			if(spellbookspellname)then
				--TODO: should be combatmodule.spells[, not combatmodule[
				castermob.combatmodule[spellbookspellname]=spell	--TODO: this was supposed to say "combatmodule.spellbook["
			end
			spell.scenario=scenario
		else
			spell=existingspell
			spell.scenario=scenario		
		end
		bossbutton=XPRACTICE.BossDebugButton_v2.new()
		bossbutton:Setup(environment)		
		bossbutton:SetIcon(spell:GetIcon())
		bossbutton.spellbookspellname=spellbookspellname	-- used in place of existingspell when a spellbutton is not specific to a certain character.
		if(spell.name and XPRACTICE_SAVEDATA.TEMP_mmbspellname and spell.name==XPRACTICE_SAVEDATA.TEMP_mmbspellname)then
			scenario.mmbspellbutton=bossbutton
		end		
		bossbutton.position={x=XPRACTICE.BossDebugButton.debugbuttonx,y=XPRACTICE.BossDebugButton.debugbuttony,z=0}
		local alpha
		--if(XPRACTICE.DEBUG.visiblebosscontrolbuttons)then alpha=1 else alpha=0 end
		alpha=1
		if(not XPRACTICE.BossDebugButton_v2.HIDEBUTTONS)then
			bossbutton:SetLockedStartingAlpha(alpha)			
			bossbutton:EnableMouse(true)
			--bossbutton:EnableMouse(XPRACTICE.DEBUG.visiblebosscontrolbuttons)
		else
			bossbutton:SetLockedStartingAlpha(0)
			bossbutton:EnableMouse(false)		
		end
		XPRACTICE.BossDebugButton.debugbuttonx=XPRACTICE.BossDebugButton.debugbuttonx+52
		bossbutton.BossButtonClick=function(self,cpuclick)
				if(scenario.setmmbmode and (not spell.issetmmb) and (not cpuclick))then
					scenario.setmmbmode=false
					scenario.mmbspellbutton=bossbutton
					XPRACTICE_SAVEDATA.TEMP_mmbspellname=spell.name
					scenario.statuslabel:SetText("Middle mouse button has been set to \""..spell.name.."\".",3.0)					
				else		
					ActionButton_HideOverlayGlow(bossbutton.displayobject.drawable)					
					local myspell=spell
					if(spellbookspellname)then
						if(scenario.player.combatmodule.spellbook[spellbookspellname])then
							myspell=scenario.player.combatmodule.spellbook[spellbookspellname]
							castermob=scenario.player
						else
							--TODO NEXT: reenable this debug warning once we can stop it from spamming THEJAILER2
							--print("Not found:",spellbookspellname)
						end
					end
					if(myspell.Broadcast_v2)then
						myspell:Broadcast_v2(scenario)
					else
						local queuepointer=myspell:NewQueue()
						queuepointer.castercombat=castermob.combatmodule
						local errorcode=castermob.combatmodule:TryQueue(queuepointer)
						--print("errorcode",errorcode)
					end
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


end
