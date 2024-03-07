do
	do
		local super=XPRACTICE.MultiSolid
		XPRACTICE.SARKARETH2.BlossomManager=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.BlossomManager
			
		function class:Reset()
			for i=#self.actors,1,-1 do
				self.actors[i].dying=true
			end
		end
		
		function class:AddCircle(x,y)
			local scale=2.0
			local actor=self:AddActorByFileID(1040159,x,y,0.1,scale)
			actor.TEMP_x=x
			actor.TEMP_y=y
			actor:SetAnimation(158)
		end
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			local scenario=self.scenario
			for i=#self.actors,1,-1 do
				local actor=self.actors[i]


				if(scenario.player and scenario.player.phase==1 and not scenario.player:IsDeadInGame())then
					if(scenario.player.position.z>=0 and scenario.player.position.z<3)then
						local xdist=scenario.player.position.x-actor.TEMP_x
						local ydist=scenario.player.position.y-actor.TEMP_y
						local distsqr=xdist*xdist+ydist*ydist
						if(distsqr<=8*8)then
							--TODO: first check if player is SUPPOSED to be getting stacks!
							scenario:AttemptKillPlayer(scenario.player,false,false,"Stay out of Desolate Blossom.",3.0)
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