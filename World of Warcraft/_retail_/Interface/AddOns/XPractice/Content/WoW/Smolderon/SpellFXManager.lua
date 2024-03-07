do

	local RING_CENTER={}
	RING_CENTER[1]=0
	RING_CENTER[2]=17.775	-- 8 pollenburns, distance 13.96
	RING_CENTER[3]=28.675	-- 12 pollenburns, distance 15.01
	RING_CENTER[4]=39.675	-- 16? burns, distance 15.58
	RING_CENTER[5]=50.575	-- 20? burns, distance 15.89
			

	do
		local super=XPRACTICE.MultiSolid
		XPRACTICE.SMOLDERON.SpellFXManager=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SMOLDERON.SpellFXManager
		
		function class:Reset()
			for i=#self.actors,1,-1 do
				self.actors[i].dying=true
			end			
			self.subpattern=nil		-- = patterns[patternindex], assigned from Schedule			
			self.subpatternindex=nil
			-- telegraphs should be setup in Schedule, but we can handle collision detection and post-impact graphics here.
			self.reportedticks={}
		end
		
	
		function class:SetupEverything(player)
			self:Reset()
			-- for i=1,3 do
				-- local angle=math.pi*2/3*(i-1)+player.orientation.yaw
				-- local x=math.cos(angle)*15+player.position.x
				-- local y=math.sin(angle)*15+player.position.y
				-- local distsqr=XPRACTICE.distsqr(0,0,x,y)
				-- if(distsqr>49*49)then
					-- local angle2=math.atan2(y,x)
					-- x=math.cos(angle2)*49
					-- y=math.sin(angle2)*49
				-- end
				-- local actor=self:AddActorByFileID(3850775,x,y,0,1)	-- 9fx_rl_annihilation_state_progenitor
				-- actor.TEMP_radius=2.5
				-- actor.TEMP_x=x;actor.TEMP_y=y
			-- end
		end
		
		function class:Motes(player)
			local baseangle=math.random()*math.pi*2
			for i=1,5 do
				local mote=self:AddActorByFileID(5371867,player.position.x,player.position.y,1)
				mote.dying=false
				mote.TEMP={}
				mote.TEMP.x=player.position.x
				mote.TEMP.y=player.position.y
				mote.TEMP.z=player.position.z
				mote:SetAnimation(127)	-- not convinced this does anything				
				local angle=baseangle+i*math.pi*2/5
				angle=angle+math.random()-.5
				local multiplier=math.sqrt(math.random())*6
				mote.TEMP.xvel=math.cos(angle)*multiplier
				mote.TEMP.yvel=math.sin(angle)*multiplier
				mote.TEMP.zvel=10
				mote.TEMP.mote=true
			end
		end
		
		function class:ExplosionFX(index)
			if(index>1)then
				local dist=RING_CENTER[index]
				for i=1,index*4 do
					local angle=i*math.pi*2/(index*4)
					local x=math.cos(angle)*dist
					local y=math.sin(angle)*dist
					local actor=self:AddActorByFileID(5372693,x,y,0.03,1.5)	-- pollenburn					
					actor:SetAnimation(0)
					actor.dying=false
					actor.TEMP={}
					actor.TEMP.expirytimer=1.0					
				end
			else
				local actor=self:AddActorByFileID(937087,x,y,0.03,3.0)	-- explosion_fire_impact_ground (probably not the right model)
				actor:SetAnimation(0)
				actor.dying=false
				actor.TEMP={}
				actor.TEMP.expirytimer=2.0
			end
		end		
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			local scenario=self.scenario
			local player=scenario.player

			for i=#self.actors,1,-1 do
				local actor=self.actors[i]

				-- actor animation/despawn goes here
					-- not sure if follow-up actor logic goes here; the explosion effect is delayed by a moment
						-- collision appears to happen on telegraph animation change, rather than explosion effect
				if(actor.TEMP.anim159timer)then
					actor.TEMP.anim159timer=actor.TEMP.anim159timer-elapsed
					if(actor.TEMP.anim159timer<=0)then
						--print("ding!",i)
						actor.TEMP.anim159timer=nil
						local CENTRAL_SHRINK_MULTIPLIER=0.5
						if(actor.TEMP.index==1 and XPRACTICE.SMOLDERON.ADJUST_CENTRAL_CIRCLE_FLASH)then actor:SetScale(CENTRAL_SHRINK_MULTIPLIER);actor:SetPosition(0,0,0.03/CENTRAL_SHRINK_MULTIPLIER) end
						if(XPRACTICE.SMOLDERON.RING_FLASH)then
							actor:SetAnimation(159)
						else
							actor:SetAlpha(0)
						end
						
						self.scenario.collision:RingCheck(actor.TEMP.index)
						
						if(not self.reportedticks[actor.TEMP.tickcount])then
							self.reportedticks[actor.TEMP.tickcount]=true
							if(WeakAuras)then 
								WeakAuras.ScanEvents("XP_SMOLDERON_SPELL_CHANNEL_TICK",actor.TEMP.tickcount) 						
							end
						end
					end
				end
				
				if(actor.TEMP.alpha)then
					actor.TEMP.alpha=math.min(1,actor.TEMP.alpha+elapsed*1/8)
					actor:SetAlpha(actor.TEMP.alpha)
					actor.TEMP.yaw=actor.TEMP.yaw-elapsed*0.5
					actor:SetYaw(actor.TEMP.yaw)
				end
				
				if(actor.TEMP.explodeFXtimer)then
					actor.TEMP.explodeFXtimer=actor.TEMP.explodeFXtimer-elapsed
					if(actor.TEMP.explodeFXtimer<=0)then
						actor.TEMP.explodeFXtimer=nil
						self:ExplosionFX(actor.TEMP.index)
					end
				end
				
				if(actor.TEMP.mote)then
					scenario.collision:MoteCheck(actor,elapsed)
				end
				
				if(actor.TEMP.expirytimer)then
					actor.TEMP.expirytimer=actor.TEMP.expirytimer-elapsed
					--print("?",actor.TEMP.expirytimer,actor.dying)
					if(actor.TEMP.expirytimer<=0)then
						--print("?",actor.TEMP.expirytimer,actor.dying)
						actor.dying=true
					end
				end


				
			
				if(actor.dying)then					
					actor.dying=false
					actor.TEMP=nil
					XPRACTICE.ReusableModelSceneFrames:RemoveActor(actor.frame,actor)				
					tremove(self.actors,i)
				end
			end
		end
		
		
		function class:CreateTelegraph(index,tickcount)
			local fileid
			if(index==1)then
				fileid=5345129			
			elseif(index==2)then
				fileid=5333967
			elseif(index==3)then
				fileid=5333968		
			elseif(index==4)then
				fileid=5333969			
			elseif(index==5)then
				fileid=5333970
			end
			local actor=self:AddActorByFileID(fileid,0,0,0.03)	
			actor.dying=false
			actor:SetAnimation(158)
			actor.TEMP={}
			actor.TEMP.index=index
			actor.TEMP.anim159timer=4.0
			actor.TEMP.explodeFXtimer=4.0+XPRACTICE.SMOLDERON.EXPLOSION_ANIMATION_DELAY
			actor.TEMP.expirytimer=5.0
			actor.TEMP.tickcount=tickcount
			if(index==1)then
				local actor=self:AddActorByFileID(5319044,0,0,0.03,0.26)	-- volcoross central pool filler
				actor.dying=false
				actor:SetAlpha(0)
				actor.TEMP={}
				actor.TEMP.alpha=0
				actor.TEMP.yaw=0
				actor.TEMP.expirytimer=4.0
			end
		end
		
	end
end