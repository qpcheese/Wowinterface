
do
	local super=XPRACTICE.PauseableAura
	XPRACTICE.SARKARETH2.Aura_Oblivion=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.Aura_Oblivion


	XPRACTICE.SARKARETH2.ApplyOblivion=function(player,context)
		context=context or nil		-- this is purposefully redundant to make it clear context is optional
		
		if(player:IsDeadInGame())then return end
		
		local auras=player.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.SARKARETH2.Aura_Oblivion)
		if(#auras>0)then
			auras[1].stacks=auras[1].stacks+1
			auras[1].expirytime=auras[1].localtime+auras[1].baseduration
			if(context=="intermission1")then
				if(auras[1].stacks>=7)then				
					for i=1,#player.scenario.allpcs do
						local mob=player.scenario.allpcs[i]
						local aura=mob.combatmodule:ApplyAuraByClass(XPRACTICE.Aura_StampedingRoar,mob.combatmodule,mob.localtime)
					end
				end
			end
			if(auras[1].stacks>=10)then
				local aura=player.combatmodule:ApplyAuraByClass(XPRACTICE.SARKARETH2.Aura_Oblivion_GoDownstairs,player.combatmodule,player.environment.localtime)
				aura.scenario=player.scenario
				aura.context=context
			end
			return auras[1].stacks
		else
			local aura=player.combatmodule:ApplyAuraByClass(XPRACTICE.SARKARETH2.Aura_Oblivion,player.combatmodule,player.environment.localtime)
			aura.scenario=player.scenario
			return aura.stacks
		end	
	end

	
	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=60.0*20
		self.basetickrate=1
	end
	function class:OnApply(localtime)
		super.OnApply(self,localtime)
		local player=self.targetcombat.mob
	end
	-- function class:Tick(ticktime)
		-- self:OnTick(ticktime,1)
		-- --TODO: move to base aura class
		-- self.previousticktime=ticktime
	-- end				
	-- function class:OnTick(ticktime,percentage)
		-- super.OnTick(self,ticktime,percentage)
		-- self.tickcount=self.tickcount or 0
		-- self.tickcount=self.tickcount+1			
		-- self:TickEffect()
	-- end	
end

do
	local super=XPRACTICE.PauseableAura
	XPRACTICE.SARKARETH2.Aura_Oblivion_GoDownstairs=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.Aura_Oblivion_GoDownstairs

	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=0.182
		self.basetickrate=1
	end
	function class:OnRemove()
		super.OnRemove(self)
		local mob=self.targetcombat.mob
		local scenario=mob.scenario

		local stacks=0
		local auras=mob.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.SARKARETH2.Aura_Oblivion)
		if(#auras>0)then
			stacks=auras[1].stacks
		end
		if(stacks==10)then
		--remove oblv aura
		--remove voidempowermentoblivion aura
			XPRACTICE.KillAuraByClass(mob,XPRACTICE.SARKARETH2.Aura_Oblivion)
			XPRACTICE.KillAuraByClass(mob,XPRACTICE.SARKARETH2.Aura_VoidEmpowermentOblivion)
			mob.scenario.holemanager:AddHole(mob.position.x,mob.position.y)
			if(mob==scenario.player)then
				mob.phase=2
				scenario.downstairsmanager:SetupEverything(mob)
				local aura=mob.combatmodule:ApplyAuraByClass(XPRACTICE.SARKARETH2.Aura_EmptinessDebuff,mob.combatmodule,mob.environment.localtime)
				aura.scenario=mob.scenario
				for i=1,#scenario.floor.upstairs do
					scenario.floor.upstairs[i]:SetAlpha(0.0)
				end		
				for i=1,#scenario.floor.downstairs do
					--scenario.floor.downstairs[i]:SetAlpha(0.5)
					scenario.floor.downstairs[i]:SetAlpha(1)
				end
				
			else
				mob.phase=3
			end
			if(self.context=="intermission1")then
				--then we're in 1st intermission
				scenario.voidempowermentpushback=false
				local pc=mob
			
				if(pc==scenario.player)then					
					-- pass/fail player current position
					local distsqr=XPRACTICE.distsqr(pc.position.x,pc.position.y,28.03,27.45)
					--if(distsqr>3*3)then
					if(distsqr>4*4)then
						scenario:AttemptKillPlayer(pc,true,true,"When the intermission begins, take the gateway as soon as possible and stay close to the purple diamond marker.",20.0)
					end
					
				else
					pc.scenario.holemanager:AddHole(pc.position.x,pc.position.y)
					pc.phase=3
					--print("Rolename:",pc.rolepointer.rolename)
					if(pc.rolepointer.rolename=="Tank 1")then
						local aura=pc.combatmodule:ApplyAuraByClass(XPRACTICE.SARKARETH2.Aura_Oblivion_GoUpstairs,pc.combatmodule,pc.environment.localtime)
						aura.scenario=pc.scenario
						aura.context=self.context
						--Reminder: pauseableaura localtime starts at 0 instead of owner's combat localtime!
						--aura.expirytime=13.912
						aura.expirytime=11.912
						--print("Tank1 expirytime:",aura.expirytime)
					else					
						local aura=pc.combatmodule:ApplyAuraByClass(XPRACTICE.SARKARETH2.Aura_Oblivion_GoUpstairs,pc.combatmodule,pc.environment.localtime)
						aura.scenario=pc.scenario
						aura.context=self.context
						aura.expirytime=XPRACTICE.RandomNumberInBetween(15.858,19.075)
						--print("Non-tank expirytime:",aura.expirytime)
					end	
				end
			end
			
			
		
		else
			-- (else do nothing)
			--if player doesn't have 10 stacks of oblv aura, assume GoDownstairs was applied twice and ignore it the second time
		end			

	end
	
end


do
	local super=XPRACTICE.PauseableAura
	XPRACTICE.SARKARETH2.Aura_Oblivion_GoUpstairs=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SARKARETH2.Aura_Oblivion_GoUpstairs

	function class:SetCustomInfo()
		super.SetCustomInfo(self)
		self.baseduration=0.0	-- override this for CPUs who stay downstairs for a predetermined amount of time
		self.basetickrate=1.0
	end
	function class:OnRemove()
		super.OnRemove(self)		
		local mob=self.targetcombat.mob
		local scenario=mob.scenario
		mob.phase=1
		if(mob==scenario.player)then
			XPRACTICE.SARKARETH2.ForceMainPlayerUpstairs(scenario)
			local auras=scenario.player.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(XPRACTICE.SARKARETH2.Aura_AstralFlare)
			if((not auras[1]) or auras[1].stacks<10)then
				scenario:AttemptKillPlayer(scenario.player,true,true,"Collect 10 Astral Flares before going upstairs.\n(Use one of the speed boosts in the Mobility tab if you need to.)",20.0)
			end
		end
		
		XPRACTICE.KillAuraByClass(mob,XPRACTICE.SARKARETH2.Aura_EmptinessDebuff)
		
		--TODO: if CPU, check context and assign new position + destination		
		if(not mob.rolepointer.playerghostpointer)then

				if(mob.TEMP_goupstairsatx)then
					mob.position.x=mob.TEMP_goupstairsatx
					mob.TEMP_goupstairsatx=nil
					mob.position.y=mob.TEMP_goupstairsaty
					mob.destx=mob.TEMP_goupstairsdestx
					mob.desty=mob.TEMP_goupstairsdesty
					mob.destyaw=mob.TEMP_goupstairsdestyaw
					mob.remainingreactiontime=mob.TEMP_goupstairsreactiontime
					
				end



		end
		-- intermission1
			--ranged comes up around 18.86,26.57 then moves to 23.56 31.90
	end	
end

do
	function XPRACTICE.SARKARETH2.ForceMainPlayerUpstairs(scenario)
		scenario.player.phase=1
		for i=1,#scenario.floor.upstairs do
			scenario.floor.upstairs[i]:SetAlpha(1.0)
		end		
		for i=1,#scenario.floor.downstairs do
			scenario.floor.downstairs[i]:SetAlpha(0.0)
		end	
	end
end


XPRACTICE.KillAuraByClass=function(player,auraclass)
	local auras=player.combatmodule.auras:GetAurasByClassIfExistIncludingNewAuras(auraclass)
	for i=1,#auras do
		auras[i]:Die()
	end
end