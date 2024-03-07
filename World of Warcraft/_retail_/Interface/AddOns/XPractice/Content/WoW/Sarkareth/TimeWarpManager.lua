do
	do
		local super=XPRACTICE.MultiSolid
		XPRACTICE.SARKARETH2.TimeWarpManager=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SARKARETH2.TimeWarpManager
			
		function class:DoNaiveTimeWarp()
			local players={self.scenario.player,unpack(self.scenario.cpus)}
			for i=1,#players do
				local player=players[i]
				local actor=self:AddActorByFileID(430845,player.position.x,player.position.y,player.position.z,1)	-- mage_timewarp_impact_01
				actor.TEMP_player=player
				actor.TEMP_remainingduration=1.625
			end
		end
		
		function class:Step(elapsed)
			super.Step(self,elapsed)
			for i=#self.actors,1,-1 do
				local actor=self.actors[i]
				local player=actor.TEMP_player
				if(player)then
					--local x,y,z=actor:GetPosition()					
					--local scale=actor:GetScale()	--default scale 1
					local scale=1
					if(scale~=0)then						
						actor:SetPosition(player.position.x/scale,player.position.y/scale,(player.position.z+2.5)/scale)
					end
				else
					actor.dying=true
				end
				actor.TEMP_remainingduration=actor.TEMP_remainingduration or 0
				actor.TEMP_remainingduration=actor.TEMP_remainingduration-elapsed
				if(actor.TEMP_remainingduration<=0)then
					actor.dying=true
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