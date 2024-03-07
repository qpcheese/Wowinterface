do
	local super=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Ghost
	XPRACTICE.MULTIPLAYERV2.Multiplayerv2Murloc=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.MULTIPLAYERV2.Multiplayerv2Murloc
	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.spectator=false
		self.playername="Murloc"
		self.controllername=nil
		self.ghostalphamultiplier=1.0	
		self.targetable=true
		self.prevmoveok=true
		self.camps={}
	end
	
	function class:CreateCombatModule()
		super.CreateCombatModule(self)
		local spell=XPRACTICE.Spell_Blink.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.blink=spell
		local spell=XPRACTICE.Spell_Soulshape.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.soulshape=spell		
		local spell=XPRACTICE.Spell_DemonicCircleTeleport.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.locktele=spell			
		local spell=XPRACTICE.Spell_TranscendenceTransfer.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.monktele=spell		
		local spell=XPRACTICE.Spell_LockGateItem.new()
		spell:Setup(self.combatmodule)
		self.combatmodule.spellbook.gateitem=spell				
	end		
	
	function class:SetActorAppearanceViaOwner(actor)
		--actor:SetModelByCreatureDisplayID(67812) -- murky (murky is missing a lot of animations.  will that be a problem?)
		
		--actor:SetModelByCreatureDisplayID(96258) -- yellow-orange
		--actor:SetModelByCreatureDisplayID(3619) -- green
		
		--actor:SetModelByCreatureDisplayID(31)		-- yellow/green
		--actor:SetModelByCreatureDisplayID(188)	-- blue/purple
		--actor:SetModelByCreatureDisplayID(346)	-- gray
		--actor:SetModelByCreatureDisplayID(369)	-- blue/green
		--actor:SetModelByCreatureDisplayID(385)	-- blue/green
		--actor:SetModelByCreatureDisplayID(386)-- blue/green
		--actor:SetModelByCreatureDisplayID(391)-- blue/purple
		--actor:SetModelByCreatureDisplayID(441)-- blue/green
		--actor:SetModelByCreatureDisplayID(478)-- gray
		
		--actor:SetModelByCreatureDisplayID(91234)--red
		--actor:SetModelByCreatureDisplayID(94893)-- gray
		--actor:SetModelByCreatureDisplayID(96258)-- purple
		--actor:SetModelByCreatureDisplayID(101785)-- blue/purple
		--actor:SetModelByCreatureDisplayID(101786)-- green
		--actor:SetModelByCreatureDisplayID(101787)-- orange
		--actor:SetModelByCreatureDisplayID(101788)-- white
		--actor:SetModelByCreatureDisplayID(101789)-- gray
		
		actor:ClearModel()
		--actor:SetModelByCreatureDisplayID(self.murloccolor or 101786)
		
		
		if(self.index==1)then
			actor:SetModelByCreatureDisplayID(63703) -- mayla, CAN equip
			self.cpuname="Mayla"
		elseif(self.index==2)then
			actor:SetModelByCreatureDisplayID(31177) -- genn, can't equip
			self.cpuname="Genn"
		elseif(self.index==3)then
			actor:SetModelByCreatureDisplayID(41667) -- aysa, CAN equip
			self.cpuname="Aysa"
		elseif(self.index==4)then
			actor:SetModelByCreatureDisplayID(82772) -- moira, CAN equip
			self.cpuname="Moira"
		elseif(self.index==5)then
			actor:SetModelByCreatureDisplayID(67345) -- thalyssra, can't equip
			self.cpuname="Thalyssra"
		elseif(self.index==6)then
			actor:SetModelByCreatureDisplayID(71591) -- akama, can't equip		
			self.cpuname="Akama"		
		elseif(self.index==7)then
			actor:SetModelByCreatureDisplayID(35095) -- malfurion, can't equip (horns and wings) (other models are equippable but lack druid features)
			self.cpuname="Malfurion"		
		elseif(self.index==8)then
			actor:SetModelByCreatureDisplayID(26365) -- valeera, can't equip
			self.cpuname="Valeera"
		elseif(self.index==9)then
			actor:SetModelByCreatureDisplayID(64797) -- gamon, CAN equip (but ... full armor!?)
			self.cpuname="Gamon"
		elseif(self.index==10)then
			actor:SetModelByCreatureDisplayID(93384) -- nisha, can equip
			self.cpuname="Nisha"
		elseif(self.index==11)then
			actor:SetModelByCreatureDisplayID(89342) -- garona, CAN equip
			self.cpuname="Garona"
		elseif(self.index==12)then
			actor:SetModelByCreatureDisplayID(67812) -- murky, can't equip (some models come pre-equipped but are faction-specific)		
			self.cpuname="Murky"
			self.murloc=true
			-- "Fatal Finesse (##) on Murky"
			-- "Skrgl mrrrggk (N) br mmmrk"		
		elseif(self.index==13)then
			actor:SetModelByCreatureDisplayID(29814) -- wilfred, CAN equip (but why isn't he in the database?)
			self.cpuname="Wilfred"			
		elseif(self.index==14)then
			actor:SetModelByCreatureDisplayID(79658) -- t'paartos, CAN equip (but ... isn't lightforged yet?)
			self.cpuname="T'paartos"
		elseif(self.index==15)then
			actor:SetModelByCreatureDisplayID(85799) -- lilian, CAN equip
			self.cpuname="Lilian"	
		elseif(self.index==16)then
			actor:SetModelByCreatureDisplayID(26353) -- brann, CAN equip
			self.cpuname="Brann"			
		elseif(self.index==17)then
			actor:SetModelByCreatureDisplayID(90805) -- gazlowe, CAN equip
			self.cpuname="Gazlowe"
		elseif(self.index==18)then
			actor:SetModelByCreatureDisplayID(78345) -- alleria, can't equip
			self.cpuname="Alleria"
		elseif(self.index==19)then
			--actor:SetModelByCreatureDisplayID(31232) -- voljin, can't equip
			--self.cpuname="Vol'jin"
			actor:SetModelByCreatureDisplayID(75898) -- talanji, can't equip
			self.cpuname="Talanji"			
		elseif(self.index==20)then
			actor:SetModelByCreatureDisplayID(87892) -- jaina, can't equip
			self.cpuname="Jaina"
		end
		self.playername=self.cpuname

		
		--if(self.controllername)then
		--print("?",actor)
		if(self.rolepointer)then
			if(self.rolepointer.playerghostpointer)then				
				local firstname=strsplit("-",self.rolepointer.playerghostpointer.playername)
				--print("firstname:",firstname)
				actor:SetModelByUnit(firstname)
			else
				--print("should be a murloc again...")
			end
		end
	end
	
	function class:CreateNameplates()	
		if(self.rolepointer and self.rolepointer.playerghostpointer)then
			local name,server=strsplit("-",self.rolepointer.playerghostpointer.playername)		
			local myname,myserver=UnitFullName("player")
			local nameplate=XPRACTICE.PlayerNameplate.new()
			nameplate:Setup(self.environment,self)		
			if(server==myserver)then
				nameplate:SetText(name)
			else
				nameplate:SetText(name.." (*)")
			end
			nameplate:SetSelected(true)
			local mobclickzone=XPRACTICE.MobClickZone.new()
			mobclickzone:Setup(self.environment,self)
			self.nameplate=nameplate
			self.mobclickzone=mobclickzone
			nameplate.alpha=1.0
			self.nameplate=nameplate
		end
	end
	
	function class:SuggestDestination(destx,desty,reactiontime,suggestername)
		if(self.rolepointer and not self.rolepointer.playerghostpointer)then
			reactiontime=reactiontime or 0
			self.destx=destx
			self.desty=desty
			self.remainingreactiontime=reactiontime	
			-- if mob stopped to cast, they're going to try to restore the old position.  overwrite it
			self.prevmovex=destx
			self.prevmovey=desty			
			self.ai.suggestmode=true
			--print("dest",destx,desty,reactiontime)
		end
	end
	
	function class:SuggestOrientation(yaw,reactiontime,suggestername)
		if(self.rolepointer and not self.rolepointer.playerghostpointer)then
			reactiontime=reactiontime or 0
			self.destyaw=yaw
			self.remainingreactiontime=reactiontime	
			self.ai.suggestmode=true
		end
	end	
	
	function class:SuggestRoll(reactiontime)
		if(self.rolepointer and not self.rolepointer.playerghostpointer)then
			self.remainingrolltime=reactiontime
		end
	end	
	
	function class:SetCamp(x,y,yaw,reactiontime)		-- yaw is in DEGREES
		reactiontime=reactiontime or 0
		if(yaw)then yaw=yaw*math.pi/180 end
		self.camps[1]={x=x,y=y,yaw=yaw,reactiontime=reactiontime,go=false}	
		--print("setcamp",self,self.camps[1].x,self.camps[1].y,self.camps[1].yaw,reactiontime)		
	end
	
	function class:SetTemporaryCamp(x,y,yaw,reactiontime,duration)		-- yaw is in DEGREES
		self.camps[2]={x=x,y=y,yaw=yaw,duration=duration,reactiontime=reactiontime,go=false}
	end	
	
	-- don't call gotocamp yourself.  it's called automatically from step event
	function class:GotoCamp(camp,reactiontime)
		camp.go=true
		reactiontime=reactiontime or 0
		self:SuggestDestination(camp.x,camp.y,reactiontime)
		if(camp.yaw)then
			self:SuggestOrientation(camp.yaw,reactiontime)
		end
		--print("ssp?",self.scenario.player,self)
		if(self.scenario.player==self)then
			self.scenario:PlaceHintArrow(camp.x,camp.y)
		end
		--print("gotocamp",camp.x,camp.y,camp.yaw,reactiontime)
	end
	
	function class:SuggestLockGate(gate,reactiontime)		
		if(self.rolepointer and not self.rolepointer.playerghostpointer)then
			self.portal_TEMP=gate;self.portalreactiontime=reactiontime
		end
	end
	
	function class:SuggestTauntBoss()
		if(self.rolepointer and self.rolepointer.playerghostpointer)then
			-- then abort.  but also, if WE are the tank, ping the player before returning
			if(self==self.scenario.player)then
				--TODO: also "taunt now" label
				ActionButton_ShowOverlayGlow(self.scenario.tauntbutton.displayobject.drawable)
			end
			return 
		end		
		local boss=self.scenario.boss
		boss.combatmodule.tauntmovetarget=nil
		boss:SetTargetMob(self)
		boss.combatmodule:StartAutoAttacking()
		local ydist=self.position.y-boss.position.y
		local xdist=self.position.x-boss.position.x
		--TODO LATER: consider boss:OnTaunted() instead?
		self.scenario.boss:SuggestOrientation(math.atan2(ydist,xdist),0)
		local playername=self.cpuname
		self:CreateSpeechBubble(self:GetPlayerName().." taunts "..self.scenario.boss.playername)
	end
	
	function class:GetPlayerName()
		if(self.rolepointer and self.rolepointer.playerghostpointer)then
			return self.playername
		else
			return self.cpuname
		end
	end
	
	-- function class:SetCampAtMob(target,distance,reactiontime)		
		-- -- use sparingly; no desync protection in multiplayer		
		-- distance=distance or 7
		-- reactiontime=reactiontime or 0
		-- if(not self.camps)then self.camps={} end
		-- local destx,desty
		-- local targetx,targey
		-- if(target.ai.targetposition)then
			-- targetx=target.ai.targetposition.x
			-- targety=target.ai.targetposition.y
		-- else
			-- targetx=target.destx or target.position.x
			-- targety=target.desty or target.position.y
		-- end
		-- local distx=targetx-self.position.x
		-- local disty=targety-self.position.y
		-- local dist=math.sqrt(distx*distx+disty*disty)
		-- local radius=distance	--TODO:
		-- local t=math.atan2(disty,distx)
		-- destx=self.position.x+math.cos(t)*(dist-radius)
		-- desty=self.position.y+math.sin(t)*(dist-radius)
		-- if(dist>radius)then				
			-- self:SetCamp(destx,desty,nil,reactiontime)
		-- end
	-- end
	
	function class:Step(elapsed)
	
	
		--TODO: move to camp class
		if(self.camps)then
			local camp=self.camps[2]
			if(camp)then				
				if(not camp.go)then
--print("goto camp 2.  duration",camp.duration)
					self:GotoCamp(camp,camp.reactiontime)
				end
				camp.duration=camp.duration-elapsed
				if(camp.duration<=0)then
					local reactiontime=camp.postreactiontime or 0
					if(self.camps[1])then
						self:GotoCamp(self.camps[1],reactiontime)	
--print("...camp1 (after camp2)")						
					end
					self.camps[2]=nil
				end
			elseif(self.camps[1])then
				--print(self,"has camp")
				local camp=self.camps[1]
				if(not camp.go)then
					self:GotoCamp(camp,camp.reactiontime)					
--print("...camp1",camp.x,camp.y,self.destx,self.desty,self.remainingreactiontime)											
				end
			end
		end
	
	
		super.Step(self,elapsed)
		
		if(self:CanSafelyMoveWithoutInterrupting())then
			--print("ok?",self.environment.localtime)
			if(self.combatmodule.tauntmovetarget)then
				if(self.combatmodule.tauntmovetarget:IsDeadInGame())then
					self.combatmodule.tauntmovetarget=nil
					--TODO: change targets (also, move all this to AI?)
				else
					local destx
					local desty
					local distx=self.combatmodule.tauntmovetarget.position.x-self.position.x
					local disty=self.combatmodule.tauntmovetarget.position.y-self.position.y
					local dist=math.sqrt(distx*distx+disty*disty)
					local radius=self.chaseradius or 7	--TODO: different chase radius?
					local t=math.atan2(disty,distx)
					destx=self.position.x+math.cos(t)*(dist-radius)
					desty=self.position.y+math.sin(t)*(dist-radius)		
					if(dist>radius)then
						self:SuggestDestination(destx,desty,0)
						if(math.abs(XPRACTICE.AngleDifference(t,self.orientation.yaw))>math.pi/16)then
							self:SuggestOrientation(t,0)
						end
					else
						if(math.abs(XPRACTICE.AngleDifference(t,self.orientation.yaw))>math.pi/16)then
							self:SuggestOrientation(t,0)
						end
					end
					if(dist<self.chaseradius or 10)then	--TODO: different melee radius?
						if(self.combatmodule.tauntmovetarget==self.scenario.player and self.combatmodule.tauntmovetarget.rolepointer and not self.combatmodule.tauntmovetarget.rolepointer.tank)then
							if(self.scenario:AttemptKillPlayer(self.combatmodule.tauntmovetarget))then
								self.scenario.multiplayer:FormatAndSendCustom("DEAD_MELEED")
								self.scenario.statuslabel:SetText("You taunted the boss, with predictable results.",3.0)
							end						
						end
					end
				end
			end
			if(self.prevmoveok==false)then		
				--print("Go")
				--print("Restore?",self.prevmovex,self.prevmovey)
				if(self.prevmovex and self.prevmovey)then 
					self.ai.targetposition={x=self.prevmovex,y=self.prevmovey};self.prevmovex=nil;self.prevmovey=nil
				end								
			end
			
			self.prevmoveok=true
		else		-- else can't SafelyMoveWithoutInterrupting
			if(self.prevmoveok)then
				--print("Stop")
				if(self.ai.targetposition)then
					self.prevmovex=self.ai.targetposition.x
					self.prevmovey=self.ai.targetposition.y				
					--print("Save?",self.prevmovex,self.prevmovey)
				end
			end
			self.prevmoveok=false
			if(self.ai.suggestmode)then
				if(self.ai.targetposition)then
					self.ai.targetposition=nil
				end
			end
		end
		
		
	end
end