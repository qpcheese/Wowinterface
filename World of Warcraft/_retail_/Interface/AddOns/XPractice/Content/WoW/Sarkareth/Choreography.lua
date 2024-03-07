do
	XPRACTICE.SARKARETH2.Choreography={}
	
	function XPRACTICE.SARKARETH2.Choreography.ApplyIntermission1GoUpstairs(scenario)
		-- intermission1
		--ranged comes up around 18.86,26.57 then moves to 23.56 31.90
		for i=1,#scenario.cpus do
			local mob=scenario.cpus[i]
			if(mob.rolepointer.healer or mob.rolepointer.rdps)then
				local x,y=XPRACTICE.RandomPointInCircle(18.86,26.57,3)
				mob.TEMP_goupstairsatx=x
				mob.TEMP_goupstairsaty=y
				local x2,y2=XPRACTICE.RandomPointInCircle(21.64,33.95,2)		--careful with this, ranged are right next to the hole clump
				mob.TEMP_goupstairsdestx=x2
				mob.TEMP_goupstairsdesty=y2
				mob.TEMP_goupstairsreactiontime=math.random()*0.75
				mob.facetowardsmob=scenario.bosses[1]
			elseif(mob.rolepointer.mdps or i==2)then
				local x,y=XPRACTICE.RandomPointInCircle(35.52,15.43,3)
				mob.TEMP_goupstairsatx=x
				mob.TEMP_goupstairsaty=y				
				--local x2,y2=XPRACTICE.SARKARETH2.Schedule.ReplayCoordsToWorldCoords(nil,-2462.11,2023.44)
				local x2,y2=XPRACTICE.RandomPointInCircle(22.28,13.67,3)
				mob.TEMP_goupstairsdestx=x2
				mob.TEMP_goupstairsdesty=y2
				mob.TEMP_goupstairsreactiontime=math.random()*0.75
				mob.facetowardsmob=scenario.bosses[1]
			elseif(i==1)then	--maintank
				local x,y=XPRACTICE.RandomPointInCircle(35.52,15.43,3)
				mob.TEMP_goupstairsatx=x
				mob.TEMP_goupstairsaty=y
				local x2,y2=XPRACTICE.SARKARETH2.Schedule.ReplayCoordsToWorldCoords(nil,-2483.37,2017.53)
				mob.TEMP_goupstairsdestx=x2
				mob.TEMP_goupstairsdesty=y2
				mob.TEMP_goupstairsreactiontime=math.random()*0.75				
				mob.facetowardsmob=scenario.bosses[1]
			end
		end
	end
	
	
	function XPRACTICE.SARKARETH2.Choreography.ApplyAbyssalBreathDodge(scenario,context)
		if(context==1)then
			for i=1,#scenario.cpus do
				local mob=scenario.cpus[i]
				if(mob.rolepointer.rdps or mob.rolepointer.healer)then
					--local x,y=XPRACTICE.SARKARETH2.Schedule.ReplayCoordsToWorldCoords(nil,-2443.82,2045.78)
					--local x,y=12.73,36.15
					local x,y=14.85,38.06
					local x2,y2=XPRACTICE.RandomPointInCircle(x,y,3)
					local reactiontime=math.random()*1.0
					mob:SuggestDestination(x2,y2,reactiontime)
				end
				if(mob.rolepointer.mdps or mob==scenario.cpus[2])then
					local x,y=XPRACTICE.SARKARETH2.Schedule.ReplayCoordsToWorldCoords(nil,-2465.61,2043.45)
					local x2,y2=XPRACTICE.RandomPointInCircle(x,y,1.5)
					local reactiontime=math.random()*1.0
					mob:SuggestDestination(x2,y2,reactiontime)				
				end
			end
		end
	end
	
	
	function XPRACTICE.SARKARETH2.Choreography.ApplyDesolateBlossomDodge(scenario,context)
		if(context==1)then
			for i=1,#scenario.cpus do
				local mob=scenario.cpus[i]
				if(mob.rolepointer.mdps or mob.rolepointer.tank)then
					local x,y=XPRACTICE.SARKARETH2.Schedule.ReplayCoordsToWorldCoords(nil,-2460.38,2057.74)					
					local x2,y2=XPRACTICE.RandomPointInCircle(x,y,1.5)
					local reactiontime=math.random()*1.0
					mob:SuggestDestination(x2,y2,reactiontime)
				end
			end
			--print("ApplyDesolateBlossomDodge context 1, attempt move",#scenario.adds,"adds:")
			for i=1,#scenario.adds do				
				local mob=scenario.adds[i]
				local x,y=3.37,20.12
				local x2,y2=XPRACTICE.RandomPointInCircle(x,y,2.5)
				--print(i,"to",x2,",",y2)
				local reactiontime=2.0
				mob:SuggestDestination(x2,y2,reactiontime)				
			end
		end
	end	
	
	
	function XPRACTICE.SARKARETH2.Choreography.ApplyVoidBombDodge(scenario,context,suffix,fullcontext,telegraph)
		local x,y=0,0
		if(fullcontext=="bombs1-1")then
			x,y=-1.84,37.13
		elseif(fullcontext=="bombs1-2")then
			x,y=XPRACTICE.SARKARETH2.Schedule.ReplayCoordsToWorldCoords(nil,-2451.12,2072.07)
		end
		for i=1,#scenario.cpus do
			local mob=scenario.cpus[i]
			if(mob.rolepointer.rdps or mob.rolepointer.healer)then				
				if(not (mob.TEMP_voidbombsoak_wave==context and mob.TEMP_voidbombsoak_which<=suffix))then
					local x2,y2=XPRACTICE.RandomPointInCircle(x,y,1.5)
					local reactiontime=math.random()*1.0				
					mob:SuggestDestination(x2,y2,reactiontime)
				elseif(mob.TEMP_voidbombsoak_wave==context and mob.TEMP_voidbombsoak_which==suffix)then
					print("!!")
					mob:SuggestDestination(telegraph.position.x,telegraph.position.y,0)
				end
			end
		end	
	end
	
end