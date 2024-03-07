do
	


	XPRACTICE.SMOLDERON.AnimationList={}
	----XPRACTICE.AnimationTemplate.QuickSetup(animationlist,			name,		index,	subindex,	priority,	duration,	nextanimation, speed)	
	
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.SMOLDERON.AnimationList,"SpecialAttackEnd",217,		0,	"Priority",	2.875,		nil)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.SMOLDERON.AnimationList,"SpecialAttackChannel",216,	0,	"Priority",	30.0,		XPRACTICE.SMOLDERON.AnimationList.SpecialAttackEnd)
	-- 1.5 native duration, stretched to 2.0 sec
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.SMOLDERON.AnimationList,"SpecialAttackCast2",215,		0,	"Priority",	2.0,		XPRACTICE.SMOLDERON.AnimationList.SpecialAttackChannel, 1/1.5)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.SMOLDERON.AnimationList,"SpecialAttackCast1",55,		0,	"Priority",	2.0,		XPRACTICE.SMOLDERON.AnimationList.SpecialAttackCast2)
	XPRACTICE.AnimationTemplate.QuickSetup(XPRACTICE.SMOLDERON.AnimationList,"Ready2HL",28,		0,	"Idle",	nil,		nil)

	
	XPRACTICE.SMOLDERON.Bosses={}
	
	

	local boss={{name="Smolderon",id=214082,display=113988,scale=6.0,speedmultiplier=3.0}	
				}
				
	XPRACTICE.SMOLDERON.Bosses[4]=boss
	
	
	function XPRACTICE.SMOLDERON.Bosses.CreateBosses(scenario,mapindex)
		if(not XPRACTICE.SMOLDERON.Bosses[mapindex])then return end
		
		local bosses={}				
		
		for i=1,#scenario.bosses do
			local boss=scenario.bosses[i]
			if(not boss.expirytime)then
				boss.fadestarttime=scenario.game.environment_gameplay.localtime
				boss.expirytime=boss.fadestarttime+1.0		
			end
		end
		
		
		
		for i=1,#XPRACTICE.SMOLDERON.Bosses[mapindex] do
			local info=XPRACTICE.SMOLDERON.Bosses[mapindex][i]
			local boss=XPRACTICE.AMIRDRASSILRAIDMAPS.MultiBoss.new()
			boss.mapindex=mapindex
			boss.info=info
			boss:Setup(scenario.game.environment_gameplay,0,0)
			tinsert(bosses,boss)	
			boss.scenario=scenario
			boss:CreateNameplates()
			boss:FreezeOrientation(0/180*math.pi)	

			boss.PlayIdleAnimation=function(self)
				self.animationmodule:PlayAnimation(XPRACTICE.SMOLDERON.AnimationList.Ready2HL)
			end

			-- boss.currentphase=22 --!!!
			-- boss.visiblefromallphases=false --!!!
			-- boss.alpha=0
			-- print("!!!")
			--boss.scale=0.001--!!!

		end		
		scenario.bosses=bosses
		
		return bosses
	end
	

end

-- do
		-- function XPRACTICE.AMIRDRASSILRAIDMAPS.MultiBoss:SuggestDestination(destx,desty,reactiontime,suggestername)
			-- -- unlike murloc, does not ignore suggestions while player-controlled
			-- reactiontime=reactiontime or 0
			-- if(self.rolepointer and self.rolepointer.playerghostpointer)then
				-- if(self.ai.suggestmode~=true and (self.ai.targetposition~=nil))then
					-- -- reject suggestion if mob is currently player-controlled and already moving
					-- return
				-- end
			-- end
			-- if(self.rolepointer and self.rolepointer.playerghostpointer)then
				-- if(self.rolepointer.playerghostpointer.playername==self.scenario.multiplayer.myfullname)then
						-- --TODO: restore this message if we can get it to not spam when boss is in chase/taunt/fixate mode						
					-- --self.scenario.statuslabel:SetText("("..suggestername.." is repositioning you.)",3.0)				
				-- end
			-- end		
			-- self.destx=destx
			-- self.desty=desty
			-- --print("!!!",destx,desty,reactiontime,suggestername)
			-- -- if mob stopped to cast, they're going to try to restore the old position.  overwrite it
			-- self.prevmovex=destx
			-- self.prevmovey=desty						
			-- self.remainingreactiontime=reactiontime	
			-- --print("suggest:",destx,desty,reactiontime)
			-- self.ai.suggestmode=true
		-- end
		
		-- function XPRACTICE.AMIRDRASSILRAIDMAPS.MultiBoss:SuggestOrientation(yaw,reactiontime,suggestername)
			-- reactiontime=reactiontime or 0
			-- if(self.rolepointer and self.rolepointer.playerghostpointer)then
				-- if(self.ai.suggestmode~=true and (self.ai.targetposition~=nil))then
					-- -- reject suggestion if mob is currently player-controlled and already moving
					-- return
				-- end
			-- end
			-- if(self.rolepointer and self.rolepointer.playerghostpointer)then
				-- if(self.rolepointer.playerghostpointer.playername==self.scenario.multiplayer.myfullname)then
						-- --TODO: restore this message if we can get it to not spam when boss is in chase/taunt/fixate mode
					-- --self.scenario.statuslabel:SetText("("..suggestername.." is repositioning you.)",3.0)				
				-- end
			-- end		
			-- self.destyaw=yaw
			-- self.remainingreactiontime=reactiontime	
			-- self.ai.suggestmode=true
		-- end		

-- end