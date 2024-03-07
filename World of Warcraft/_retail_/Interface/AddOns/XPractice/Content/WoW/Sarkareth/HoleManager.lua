do
	do
		local super=XPRACTICE.MultiSolid
		XPRACTICE.SARKARETH2.HoleManager=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.HoleManager
			
		function class:Reset()
			for i=#self.actors,1,-1 do
				self.actors[i].dying=true
			end
		end
		
		function class:AddHole(x,y)
			local scale=0.15
			local actor=self:AddActorByFileID(3088343,x,y,-0.1,scale)
			actor:SetSpellVisualKit(6531)
			--actor.TEMP_graceperiod=2.0
			actor.TEMP_graceperiod=1.5
			actor.TEMP_x=x
			actor.TEMP_y=y
		end
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			local scenario=self.scenario
			for i=#self.actors,1,-1 do
				local actor=self.actors[i]

				if(actor.TEMP_graceperiod>0)then
					actor.TEMP_graceperiod=actor.TEMP_graceperiod-elapsed
				else
					if(scenario.player and not scenario.player:IsDeadInGame())then
						if(scenario.player.position.z>=0 and scenario.player.position.z<3)then
							local xdist=scenario.player.position.x-actor.TEMP_x
							local ydist=scenario.player.position.y-actor.TEMP_y
							local distsqr=xdist*xdist+ydist*ydist
							if(distsqr<=2*2)then
								--scenario:AttemptKillPlayer(scenario.player)
								scenario.player.floorbelow=false
								scenario.player.position.z=-.01
							end
						end
					end
				end


			
			
				if(actor.dying)then
					actor.dying=false
					XPRACTICE.ReusableModelSceneFrames:RemoveActor(actor.frame,actor)				
					tremove(self.actors,i)
				end
			end
		end
		
		
		
		
	end
end