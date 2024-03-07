	local function QuickCast(spell,scenario,boss,args)
		local queuepointer=spell:NewQueue()
		queuepointer.castercombat=boss.combatmodule
		local spellinstance=spell:NewCast(queuepointer)
		spellinstance.targetcombat=boss.combatmodule
		spellinstance.args=args
		spellinstance.scenario=scenario
		spellinstance.spellbookspell:StartCasting(boss.environment.localtime,spellinstance)		
		boss.combatmodule.castedspell=spellinstance					
	end	

	local roomnumber=XPRACTICE.PRIMALCOUNCIL.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.PRIMALCOUNCIL.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="PRIMAL_BLIZZARD"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=false
			self.requireofficer=true
			self.argtypes={}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.PRIMALCOUNCIL.Multiplayer	
	function class.HandleCustom_PRIMAL_BLIZZARD(self,sender,args)		
		local scenario=self.scenario
		local boss=scenario.bosses[1]
		if(boss.combatmodule.channeledspell==nil)then
			QuickCast(boss.combatmodule.primalblizzard,scenario,boss,args)
		end
	end			
		

	do	
		local super=XPRACTICE.Spell
		XPRACTICE.PRIMALCOUNCIL.Spell_PrimalBlizzard=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Spell_PrimalBlizzard
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.name="Primal Blizzard"
			self.icon="interface/icons/spell_frost_arcticwinds.blp"
			self.requiresfacing=false;self.projectileclass=nil;self.basecastduration=0.0;self.basechannelduration=10.0;self.basechannelticks=10.0
			self.usablewhilemoving=true
		end
		function class:Broadcast_v2(scenario)						
			if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer("player"))then
				scenario.statuslabel:SetText("That action requires raid lead/assist.",3.0)
				return
			end
			self.scenario.multiplayer:FormatAndSendCustom("PRIMAL_BLIZZARD")	
		end
		function class:CompleteCastingEffect(castendtime,spellinstancepointer)	
			local scenario=spellinstancepointer.castercombat.mob.scenario
			local args=spellinstancepointer.args
			local iconsize="20"
			local icon="\124T"..self.icon..":"..iconsize.."\124t"
			local link="\124cffff0000\124Hspell:371836\124h[Primal Blizzard]\124h\124r"			
			local message=icon.." Kadros begins to freeze all players in a "..link.."!"
			XPRACTICE_RaidBossEmote(message,5.0,true)	
			--local aura=scenario.player.combatmodule:ApplyAuraByClass(XPRACTICE.PRIMALCOUNCIL.Aura_PrimalBlizzard,scenario.player.combatmodule,scenario.player.environment.localtime)
			XPRACTICE.PRIMALCOUNCIL.ApplyBlizzard(scenario.player)
		end
	end
	
	XPRACTICE.PRIMALCOUNCIL.ApplyBlizzard=function(player)
		local auras=player.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.PRIMALCOUNCIL.Aura_PrimalBlizzard)
		if(#auras>0)then
			auras[1].expirytime=player.environment.localtime+auras[1].baseduration
			auras[1].tickcount=0
		else
			local aura=player.combatmodule:ApplyAuraByClass(XPRACTICE.PRIMALCOUNCIL.Aura_PrimalBlizzard,player.combatmodule,player.environment.localtime)
			aura.scenario=player.scenario
		end	
	end	
	
	do
		local super=XPRACTICE.Aura
		XPRACTICE.PRIMALCOUNCIL.Aura_PrimalBlizzard=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.Aura_PrimalBlizzard
		function class:SetCustomInfo()
			super.SetCustomInfo(self)
			self.stacks=0
			self.baseduration=15.0
			self.basetickrate=1.0
		end
		function class:Tick(ticktime)
			self:OnTick(ticktime,1)
			--TODO: move to base aura class
			self.previousticktime=ticktime
		end				
		function class:OnTick(ticktime,percentage)
			super.OnTick(self,ticktime,percentage)
			local mob=self.targetcombat.mob
			local scenario=mob.scenario
			self.tickcount=self.tickcount or 0
			self.tickcount=self.tickcount+1			
			if(self.tickcount<=11)then				
				self.stacks=self.stacks+1
				self.expirytime=mob.environment.localtime+self.baseduration
			else
				if(self.stacks==0)then self:Die() end
			end
			scenario.collision:ScorchedGroundCheck(self)
			if(self.stacks>=10)then					
				if(scenario:AttemptKillPlayer(mob))then
					scenario.statuslabel:SetText("You were frozen solid!  Step into Scorched Ground to avoid this fate.",3.0)
					scenario.multiplayer:FormatAndSendCustom("DEAD_FROSTTOMB",nil)
				end
			end								
		end
	end
	
	
	local roomnumber=XPRACTICE.PRIMALCOUNCIL.NPCID
	local roomBCD=XPRACTICE.MULTIPLAYERV2.Datatypes.BCD.ToString(XPRACTICE.PRIMALCOUNCIL.NPCID)		
	do
		local messagecode=XPRACTICE.MULTIPLAYERV2.previouscustomcode
		messagecode=messagecode+1
		local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
		local messagename="DEAD_FROSTTOMB"
		local super=XPRACTICE.MULTIPLAYERV2.Message
		local lambda=XPRACTICE.inheritsFrom(super)
		local class=lambda	
		function class:SetCustomInfo()
			self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
			self.ignoreself=true
			self.requireofficer=false
			self.argtypes={}
		end		
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]:Setup()
		XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2["CUSTOM_"..roomBCD].Messagetypes[messagename]			
		XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode
	end
	
	local class=XPRACTICE.PRIMALCOUNCIL.Multiplayer	
	function class.HandleCustom_DEAD_FROSTTOMB(self,sender,args)		
		local scenario=self.scenario
		local player=self.allplayers[sender]
		if(not player)then return end
		scenario:AttemptKillPlayer(player,true)
		scenario.statuslabel:SetText(sender.." was frozen solid!",3.0)
	end				
	
	
	
do
	do
		local super=XPRACTICE.GameObject
		XPRACTICE.PRIMALCOUNCIL.PrimalBlizzardDebuffIcon=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.PrimalBlizzardDebuffIcon
		
		function class:Setup(environment,x,y,z)
			super.Setup(self,environment,x,y,z)
			self.focus=nil
			self.tex=nil
		end
		
		function class:CreateDisplayObject()
			self.displayobject=XPRACTICE.PRIMALCOUNCIL.PrimalBlizzardDebuffDisplayObject.new()
			self.displayobject:Setup(self)
		end
		
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			local player=self.focus		
			if(not player)then self.displayobject.drawable:Hide(); return end
			local auras=player.combatmodule.auras:GetAurasByClassIfExist(XPRACTICE.PRIMALCOUNCIL.Aura_PrimalBlizzard)
			if(#auras>0 and auras[1].stacks>0)then
				self.displayobject.drawable:Show()
				local scenario=self.scenario
				self.displayobject.text.fontstring:SetText(auras[1].stacks)
			else
				self.displayobject.drawable:Hide()			
			end

		end

		function class:Draw(elapsed)
			--TODO: maybe move this to base class but check for existence of displayobject?
			self.displayobject:SetPositionAndScale(self.position,self.scale)
		end	
		
		
	end
	
	do
		local super=XPRACTICE.DisplayObject
		XPRACTICE.PRIMALCOUNCIL.PrimalBlizzardDebuffDisplayObject=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.PRIMALCOUNCIL.PrimalBlizzardDebuffDisplayObject
		
		function class:CreateDrawable()		
			local f=XPRACTICE.ReusableFrames:GetFrame()
			self.drawable=f
			self.drawable.owner=self
			self.back=f
			tinsert(self.drawables,f)
			local f=XPRACTICE.ReusableFrames:GetFrame()
			self.text=f
			tinsert(self.drawables,f)
		end
		function class:SetAppearance()
			--self.parentframe=self.owner.environment.hudframe
			self.parentframe=self.owner.environment.frame
			--self.parentframe=UIParent
			self.back:SetParent(self.parentframe)
			self.back.texture:Show();self.back.texture:SetTexture("interface/icons/spell_frost_arcticwinds.blp")
			self.back:Show();self.back:SetAlpha(1)
			self.back:SetSize(100,100)
			self.back:SetFrameLevel(200)				
			
			self.text:Show();self.text:SetAlpha(1)
			self.text:SetParent(self.back)
			--self.text:SetAllPoints(self.icon)
			self.text:SetAllPoints(self.back)
			self.text.fontstring:Show();self.text.fontstring:SetScale(4)
			self.text.fontstring:SetText("")
			self.text:SetFrameLevel(202)
			
		end	
		function class:SetPositionAndScale(position,scale)
			self.back:SetPoint("BOTTOMLEFT",self.parentframe,"BOTTOMLEFT",position.x,position.y)
		end
	
	end
end	