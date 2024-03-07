--TODO: set events to be handled next frame (so lua errors aren't blank)

do
	--local class=XPRACTICE.Scenario
	local class=XPRACTICE.MULTIPLAYER.Multiplayer
	
	----TODO: maybe move class back to scenario so we can override it?
			-- not sure if better than creating a child multiplayer class and overriding that instead
	
	local function IsRealOfficer(unit)
		unit=strsplit("-",unit)
		return ((UnitIsGroupLeader(unit)==true) or (UnitIsGroupAssistant(unit)==true) or not IsInGroup(unit))
	end
	
	local function IsFlaggedAsOfficer(multiplayermodule,sender)
		if(not IsInGroup("player"))then return true end
		local name1,name2=UnitFullName("player")
		local myfullname=name1.."-"..name2		
		if(myfullname==sender)then return multiplayermodule.officer end
		if(multiplayermodule.allplayers[sender])then return multiplayermodule.allplayers[sender].officer end
		return false
	end
	


	class.Send={}	
	class.Handle={}
	class.SendCustom={}
	class.HandleCustom={}

	function class:SendHello()
		local scenario=self.scenario
		self:FormatAndSend("HELLO",scenario.player.position.x,scenario.player.position.y,scenario.player.orientation.yaw)
		self:OverrideSendChatMessage()
	end

	function class.Handle_HELLO(self,sender,args)
		local officer=IsRealOfficer("player")
		if(self.roomlocked and officer)then
			self:FormatAndSend("ALREADYINPROGRESS")
		end
		if(self.roomlocked)then return end
		
		--print(sender,"says hello.  ("..args[1],args[2],args[3]..")")
		if(not self.allplayers[sender])then
			if(self.previousplayerghosts[sender])then
				self.allplayers[sender]=self.previousplayerghosts[sender]
				self.allplayers[sender].inactivity=nil
				local ghost=self.allplayers[sender]
				ghost.position.x=args[1]
				ghost.position.y=args[2]
				ghost:FreezeOrientation(args[3])
			else
				local scenario=self.scenario		
				local ghost=XPRACTICE.MULTIPLAYER.MultiplayerGhost.new()
				if(self.murlocscopyplayerappearances)then ghost.copyplayerappearance=true end
				ghost.playername=sender
				ghost:Setup(scenario.game.environment_gameplay,args[1],args[2],0)
				ghost.scenario=self.scenario
				
				ghost:FreezeOrientation(args[3])
				self.allplayers[sender]=ghost			
				local name,server=strsplit("-",sender)
				ghost:CreateSpeechBubble(name.." joins the room.")
			end
			--TODO LATER: not sure if the guid check can be isolated to previousplayerghosts-doesn't-exist check
			local guid=self:GetPaddedUnitGUID(sender)
			if(guid)then
				self.guidpointers[guid]=self.allplayers[sender]
				self.allplayers[sender].paddedguid=guid
			end			
		end
		self:SendIExist()
		local scenario=self.scenario
		scenario:OnReceiveHello()
	end

	function class:SendGoodbye()
		local scenario=self.scenario		
		if(self.host)then
			local otherofficercount=0
			for k,v in pairs(self.allplayers) do
				if(v~=self.scenario.player)then
					if(v.officer and IsRealOfficer(k))then	--TODO: might have broken recently, make sure "IsRealOfficer(k)" is correct
						otherofficercount=otherofficercount+1
					end
				end
			end
			-- if(otherofficercount==0)then
				--print("send noofficers")
				self:FormatAndSend("UNLOCK_NOOFFICERS")
			-- end
		end		
		self:FormatAndSend("GOODBYE")
		self:RestoreSendChatMessage()
	end

	function class.Handle_GOODBYE(self,sender,args)
		self.previousplayerghosts[sender]=nil
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(ghost)then		
			-- if the final officer quits while encounter is running, they will send UNLOCK_NOOFFICERS
			-- which removes them from the ghost list before we get to this point
				-- the speech bubble is instead handled by Handle_unlock_noofficers
			self.allplayers[sender]=nil
			local name,server=strsplit("-",sender)
			ghost:CreateSpeechBubble(name.." leaves the room.")
			for k,v in pairs(ghost.extraobjects)do
				v:Die()
			end
			ghost.fadestarttime=ghost.environment.localtime+1.0
			ghost.expirytime=ghost.fadestarttime+2.0
			if(sender==self.hostname)then
				self.hostname=""
				-- if(self.officer)then				
					-- class.Send.CLAIMHOST(self)
				-- end
			end
		end		
	end

	function class:SendIExist()
		local scenario=self.scenario
		self:FormatAndSend("IEXIST",scenario.player.position.x,scenario.player.position.y,scenario.player.orientation.yaw)
		self.extraobjectstimer=0.5
	end

	function class.Handle_IEXIST(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]

		if(not ghost and self.roomlocked)then return end
		if(not ghost)then
			if(self.previousplayerghosts[sender])then
				self.allplayers[sender]=self.previousplayerghosts[sender]
				self.allplayers[sender].inactivity=nil
				ghost=self.allplayers[sender]
			else
				ghost=XPRACTICE.MULTIPLAYER.MultiplayerGhost.new()
				if(self.murlocscopyplayerappearances)then ghost.copyplayerappearance=true end
				ghost.playername=sender
				ghost:Setup(scenario.game.environment_gameplay,args[1],args[2],0)
				ghost.scenario=self.scenario
				self.allplayers[sender]=ghost
			end
			--TODO LATER: can the guid check be moved to the previousplayerghosts-doesn't-exist block?
			local guid=self:GetPaddedUnitGUID(sender)
			if(guid)then
				self.guidpointers[guid]=self.allplayers[sender]
				self.allplayers[sender].paddedguid=guid
			end			
		end
		ghost.position.x=args[1]
		ghost.position.y=args[2]						
		ghost:FreezeOrientation(args[3])		
	end

	function class.Handle_EXTRAOBJECTS(self,sender,args)
		local objnames={o1={obj="demoniccircle",spell="demoniccircle"},
						o2={obj="transcendence",spell="transcendence"},
						o3={obj="lockgate1",spell="lockgate1"},
						o4={obj="lockgate2",spell="lockgate2"}}
		local scenario=self.scenario
		local ghost=self.allplayers[sender]		
		if(not ghost)then return end
		for i=1,#args,5 do
			local objtype=args[i]
			if(objtype~="X")then				
				local index="o"..objtype				
				local objname=objnames[index].obj				
				local spellname=objnames[index].spell
				if(ghost.extraobjects[objname]==nil)then
					local spell=ghost.combatmodule.spellbook[spellname]
					local queuepointer=spell:NewQueue()
					queuepointer.castercombat=ghost.combatmodule
					local spellinstance=spell:NewCast(queuepointer)
					spellinstance.targetcombat=ghost.combatmodule		
					local castendtime=ghost.environment.localtime
					spellinstance:CompleteCasting(castendtime,spellinstance)
					local obj=ghost.extraobjects[objname]
					if(obj)then
						obj.position.x=args[i+1]
						obj.position.y=args[i+2]
						obj.position.z=args[i+3]
						obj.orientation_displayed.yaw=args[i+4]
						if(obj.FreezeOrientation)then
							obj:FreezeOrientation(args[i+4])
						end
					end
				end
			end
		end		
	end


	function class:SendRun()
		local scenario=self.scenario
		if(scenario.player.ai.targetposition)then
			self:FormatAndSend("RUN",scenario.player.ai.targetposition.x,scenario.player.ai.targetposition.y,scenario.player.orientation.yaw)
		else
			self:FormatAndSend("RUN",scenario.player.position.x,scenario.player.position.y,scenario.player.orientation.yaw)
		end
	end



	function class.Handle_RUN(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		ghost.destx=args[1]
		ghost.desty=args[2]				
		ghost.destyaw=args[3]
		ghost.remainingreactiontime=0		
	end



	
	function class:SendRoll()
		local scenario=self.scenario
		self:FormatAndSend("ROLL",scenario.player.attemptedmovementunitvector.x,scenario.player.attemptedmovementunitvector.y,scenario.player.orientation.yaw)
	end

	function class.Handle_ROLL(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		ghost.attemptedmovementunitvector.x=args[1]
		ghost.attemptedmovementunitvector.y=args[2]				
		ghost.orientation.yaw=args[3]
		
		local spell_roll=ghost.combatmodule.spellbook.roll
		local queuepointer=spell_roll:NewQueue()
		queuepointer.castercombat=ghost.combatmodule
		local spellinstance=spell_roll:NewCast(queuepointer)
		spellinstance.targetcombat=ghost.combatmodule		
		local castendtime=ghost.environment.localtime
		spellinstance:CompleteCasting(castendtime,spellinstance)
		

		--ghost.remainingreactiontime=0		
	end

	function class:SendTurnInPlace()
		local scenario=self.scenario
		self:FormatAndSend("TURNINPLACE",scenario.player.position.x,scenario.player.position.y,scenario.player.orientation.yaw)
	end

	function class.Handle_TURNINPLACE(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		ghost.position.x=args[1]
		ghost.position.y=args[2]						
		ghost.orientation.yaw=args[3]
	end
	
	function class:SendMidair()
		local scenario=self.scenario
		--print("anim:",scenario.player.animationmodule.currentanimation.index)
		local jump=(scenario.player.animationmodule.currentanimation.index==38)
		--print("MIDAIR",scenario.player.velocity.x,scenario.player.velocity.y,scenario.player.velocity.z)
		self:FormatAndSend("MIDAIR",scenario.player.position.x,scenario.player.position.y,scenario.player.position.z,scenario.player.velocity.x,scenario.player.velocity.y,scenario.player.velocity.z,scenario.player.orientation.yaw,jump)
	end
	
	function class.Handle_MIDAIR(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		ghost.position.x=args[1]
		ghost.position.y=args[2]
		ghost.position.z=args[3]
		ghost.velocity.x=args[4]
		ghost.velocity.y=args[5]
		ghost.velocity.z=args[6]
		ghost.orientation.yaw=args[7]
		--must reset ghost AI too.
		--otherwise, ghost AI will still try to move to place it jumped from, and ends up facing backwards
		ghost.destx=0;ghost.desty=0	
		ghost.ai.targetposition=nil
		if(args[8])then 
			ghost.animationmodule:PlayAnimation(XPRACTICE.AnimationList.JumpStart) 
		end
	end	
	
	function class:SendBackpedalStart()
		self:FormatAndSend("BACKPEDALSTART")
	end
	
	function class.Handle_BACKPEDALSTART(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		ghost.backpedal=true
	end		
	
	function class:SendBackpedalStop()
		self:FormatAndSend("BACKPEDALSTOP")
	end
	
	function class.Handle_BACKPEDALSTOP(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		ghost.backpedal=false
	end			

	function class:SendWalkStart()
		self:FormatAndSend("WALKSTART")
	end
	
	function class.Handle_WALKSTART(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		ghost.walking=true
	end		
	
	function class:SendWalkStop()
		self:FormatAndSend("WALKSTOP")
	end
	
	function class.Handle_WALKSTOP(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		ghost.walking=false
	end		

	--TODO: LOCK, ROLLCALL (maybe), GAMESTART (maybe), ALREADYINPROGRESS (maybe), UNLOCK	

	
	function class.Send.LOCK(self)
		self:FormatAndSend("LOCK")
	end
	function class.Handle_LOCK(self,sender,args)
		if(self.roomlocked)then return end
		local name,server=strsplit("-",sender)
		--print("sender:",name,server)
		local officer=IsRealOfficer(name)
		if(not officer)then return end
		
		self.roomlocked=true
		
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		local name1,name2=UnitFullName("player")				
		local myfullname=name1.."-"..name2				
		if((not ghost) and (not myfullname==sender))then return end

		if(sender==myfullname)then		
			self.host=true
		else
			self.host=false
		end
		self.hostname=sender
		
		
		for k,v in pairs(self.previousplayerghosts) do
			if(v.inactivity)then
				--v:Die()				
				v.fadestarttime=v.environment.localtime+1.0
				v.expirytime=v.fadestarttime+2.0				
			end
			self.previousplayerghosts[k]=nil
		end		
		
		for k,v in pairs(self.allplayers) do
			--print("Checking",v.playername)
			local officer=IsRealOfficer(v.playername)
			v.officer=officer			
			--if(officer)then print("Added",k,"to officer list.") end
			self.previousplayerghosts[k]=v
		end
		self.officer=IsRealOfficer("player")

		self.scenario:OnRoomLock(sender)
	end

	function class.Send.UNLOCK(self)
		self:FormatAndSend("UNLOCK")
	end
	function class.CoreUnlock(self,sender,args,noofficers,acknowledge)
		if(not self.roomlocked)then return end
		
		self.roomlocked=false
	
		local scenario=self.scenario
		self.officer=false
		self.host=false
		self.hostname=""
		for k,v in pairs(self.allplayers) do
			if(v~=self.scenario.player)then
				self.allplayers[k]=nil	--previousplayerghosts[k] still exists for now
			end
		end	
		for k,v in pairs(self.previousplayerghosts)do
			if(v~=self.scenario.player)then
				v.inactivity=true
			end
		end
	end
	function class.Handle_UNLOCK(self,sender,args)
		--print("received UNLOCK.")
		if(not IsFlaggedAsOfficer(self,sender))then return end
		self.CoreUnlock(self,sender,args,false,false)
		self:FormatAndSend("ACKNOWLEDGEUNLOCK")
		-- Remember, this message only UNLOCKS players who are in the current game.
		-- Players who came in while room was locked are still locked until ACKNOWLEDGE goes through.
		-- (Anyone can theoretically send a valid UNLOCK if they were assist when the game started.  Only current assists can send ACKNOWLEDGE.)
					-- (That might not be true anymore; we changed the rehost system so only current officers can claim host.)
	end
	function class.Handle_ACKNOWLEDGEUNLOCK(self,sender,args)
		local officer=IsRealOfficer(sender)
		if(not officer)then return end
		self.CoreUnlock(self,sender,args,false,true)	
		self.scenario:OnRoomUnlock(sender,false,true)
	end
	function class.Handle_UNLOCK_NOOFFICERS(self,sender,args)
		-- Any real officer or initial officer can send this shutdown message.
		-- (This might be relevant if the raid leader changes after the game begins.)
		local officer=(IsRealOfficer(sender) or IsFlaggedAsOfficer(self,sender))
		if(not officer)then return end
		
		-- NOOFFICERS prevents the normal GOODBYE fadeout + speech bubble from appearing, so we do it here instead.
		local ghost=self.allplayers[sender]
		if(ghost)then
			if(ghost~=self.scenario.player)then				
				ghost.fadestarttime=ghost.environment.localtime+1.0
				ghost.expirytime=ghost.fadestarttime+2.0
				local name,server=strsplit("-",sender)
				ghost:CreateSpeechBubble(name.." leaves the room.")
				for k,v in pairs(ghost.extraobjects)do
					v:Die()
				end
			end
		end		
		self.CoreUnlock(self,sender,args,true,false)
		-- (allplayers is now empty except for own player)
		self.scenario:OnRoomUnlock(sender,true,false)
	end	
	
	function class.Send.CLAIMHOST(self)
		self:FormatAndSend("CLAIMHOST")
	end
	function class.Handle_CLAIMHOST(self,sender,args)		
		if(not self.roomlocked)then return end
		if(self.hostname~="")then return end
		if(not IsRealOfficer(sender))then return end
		self.roomlocked=true
		
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end		
		local name1,name2=UnitFullName("player")				
		local myfullname=name1.."-"..name2		
		if(sender==myfullname)then		
			self.host=true
		else
			self.host=false
		end
		self.hostname=sender
		self.scenario:OnRoomLock(sender)
	end
	
	function class.Send.ALREADYINPROGRESS(self)
		self:FormatAndSend("ALREADYINPROGRESS")
	end
	function class.Handle_ALREADYINPROGRESS(self,sender,args)
		if(self.roomlocked)then return end
		local name,server=strsplit("-",sender)
		local officer=IsRealOfficer(name)
		if(not officer)then return end
		
		self.roomlocked=true
		self.joinedgameinprogress=true
				
		self.scenario:OnRoomAlreadyInProgress(sender)
	end	
	
	
	function class.Handle_WORLDMARKER(self,sender,args)
		if(not IsRealOfficer(sender))then return end
		local index,x,y=tonumber(args[1]),args[2],args[3]
		if(not index)then return end
		if(index<1 or index>8)then return end
		local scenario=self.scenario
		local wmc=self.scenario.worldmarkercontroller
		if(wmc)then
			if(wmc.wms[index])then
				wmc.wms[index].animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
			end
			local wmname=XPRACTICE.LEGACY.wmnumbers[index][2]		
			local obj=XPRACTICE.WoWObject.new();obj:Setup(scenario.game.environment_gameplay)		
			obj.displayobject.drawable:SetModelByFileID(XPRACTICE.LEGACY.wmmodels[wmname])	-- raid_ui_fx_
			--obj.position=XPRACTICE_SAVEDATA.LEGACY[varname]
			obj.position={x=x,y=y,z=0}
			obj.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
			obj.projectilespawncustomduration=2.0;obj.projectileloopcustomduration=nil;obj.projectiledespawncustomduration=2.0
			wmc.wms[index]=obj
			
			local varname="WorldMarker"..wmname.."pos"
			XPRACTICE_SAVEDATA[scenario.savedataname][varname.."x"]=x
			XPRACTICE_SAVEDATA[scenario.savedataname][varname.."y"]=y
		end
	end		
	function class.Handle_ALLWORLDMARKERS(self,sender,args)
		if(not IsRealOfficer(sender))then return end
		local scenario=self.scenario
		local wmc=scenario.worldmarkercontroller
		if(not wmc)then return end
		local a=1
		for index=1,8 do
			local visible=args[a];a=a+1
			local x=args[a];a=a+1
			local y=args[a];a=a+1
			if(visible==true)then
				if(wmc.wms[index])then
					wmc.wms[index].animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
				end
				local wmname=XPRACTICE.LEGACY.wmnumbers[index][2]		
				local obj=XPRACTICE.WoWObject.new();obj:Setup(scenario.game.environment_gameplay)		
				obj.displayobject.drawable:SetModelByFileID(XPRACTICE.LEGACY.wmmodels[wmname])	-- raid_ui_fx_
				--obj.position=XPRACTICE_SAVEDATA.LEGACY[varname]
				obj.position={x=x,y=y,z=0}
				obj.animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileSpawnCustomDuration)
				obj.projectilespawncustomduration=2.0;obj.projectileloopcustomduration=nil;obj.projectiledespawncustomduration=2.0
				wmc.wms[index]=obj
				
				local varname="WorldMarker"..wmname.."pos"
				XPRACTICE_SAVEDATA[scenario.savedataname][varname.."x"]=x
				XPRACTICE_SAVEDATA[scenario.savedataname][varname.."y"]=y
			else
				if(wmc.wms[index])then
					wmc.wms[index].animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
				end			
				local wmname=XPRACTICE.LEGACY.wmnumbers[index][2]		
				local varname="WorldMarker"..wmname.."pos"
				XPRACTICE_SAVEDATA[scenario.savedataname][varname.."x"]=nil
				XPRACTICE_SAVEDATA[scenario.savedataname][varname.."y"]=nil		
			end
		end
	end		
	function class.Handle_CLEARWORLDMARKER(self,sender,args)
		if(not IsRealOfficer(sender))then return end
		local wmc=self.scenario.worldmarkercontroller
		if(not wmc)then return end
		local index=tonumber(args[1])
		if(not index)then return end
		if(index<1 or index>9)then return end
		local i1,i2=index,index
		if(index==9)then i1=1;i2=8 end
		local scenario=self.scenario
		for i=i1,i2 do
			if(wmc.wms[i])then
				wmc.wms[i].animationmodule:PlayAnimation(XPRACTICE.AnimationList.ProjectileDespawnCustomDuration)
			end
			local wmname=XPRACTICE.LEGACY.wmnumbers[i][2]		
			local varname="WorldMarker"..wmname.."pos"
			XPRACTICE_SAVEDATA[scenario.savedataname][varname.."x"]=nil
			XPRACTICE_SAVEDATA[scenario.savedataname][varname.."y"]=nil		
		end
	end		
	
	function class:SendFloorBelow()
		local scenario=self.scenario
		self:FormatAndSend("FLOORBELOW",scenario.player.floorbelow)
	end	
	
	function class:SendWallChecking()
		local scenario=self.scenario
		self:FormatAndSend("WALLCHECKING",scenario.player.wallchecking,scenario.player.position.x,scenario.player.position.y,scenario.player.position.z,
															scenario.player.velocity.x,scenario.player.velocity.y,scenario.player.velocity.z,
															scenario.player.orientation.yaw)
	end	
	
	function class.Handle_FLOORBELOW(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		ghost.floorbelow=args[1]
	end				
	
	function class.Handle_WALLCHECKING(self,sender,args)
		local scenario=self.scenario
		local ghost=self.allplayers[sender]
		if(not ghost)then return end
		ghost.wallchecking=args[1]
		--if(ghost.wallchecking)then
		if(true)then
			ghost.position.x=args[2]
			ghost.position.y=args[3]
			ghost.position.z=args[4]
			ghost.velocity.x=args[5]
			ghost.velocity.y=args[6]
			ghost.velocity.z=args[7]
			ghost.orientation.yaw=args[8]
		end
	end		
	
	function class.Handle_ROLE(self,sender,args)
		-- obsolete function; do nothing
	end
	function class.Handle_ROLLRESPONSE(self,sender,args)
		-- obsolete function; do nothing
	end	
	function class.Handle_LOCKv2(self,sender,args)
		-- obsolete function; do nothing
	end	
	function class.Handle_ROLLCALL_CLOSED(self,sender,args)
		-- obsolete function; do nothing
	end		
	function class.Handle_ROLLCALL_CHECK(self,sender,args)
		-- obsolete function; do nothing
	end		
	function class.Handle_ROLLCALL(self,sender,args)
		-- obsolete function; do nothing
	end		
	
	
	function class.Send.CUSTOM(self)
		local messagetype="CUSTOM_"..self.roomBCD
		--self:FormatAndSend("ALREADYINPROGRESS")
	end
	function class.Handle_CUSTOM(self,msgcode,sender,args)
		self.scenario:OnCustomMessage(msgcode,sender,args)
	end		
end