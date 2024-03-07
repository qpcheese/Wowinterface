do
	
	XPRACTICE.SMOLDERON.AutoEffects={}
	
	function XPRACTICE.SMOLDERON.AutoEffects.Randomize(scenario)
		local tank={}
		local melee={}
		local ranged={}
		local unknown={}
		print("---")
		print("Raid summary:")
		for k,v in pairs(scenario.multiplayer.allplayers)do
			local name=strsplit("-",v.playername)
			local role=v.TEMP_role
			if(not role)then role="Unknown" end
			print("Player:",name,"- Role:",role)
			if(role=="Tank")then
				tinsert(tank,v)
			elseif(role=="Melee")then
				tinsert(melee,v)
			elseif(role=="Ranged")then
				tinsert(ranged,v)
			elseif(role=="Unknown")then
				tinsert(unknown,v)
			end
		end
		print("Shuffling lists...")
		XPRACTICE.ShuffleList(tank)
		XPRACTICE.ShuffleList(melee)
		XPRACTICE.ShuffleList(ranged)
			
		scenario.group1tank=tank[1]	-- these could still be nil, so check for it later
		scenario.group2tank=tank[2]
		if(scenario.group1tank)then
			print("Tank 1:",scenario.group1tank.playername)
		else
			print("Couldn't assign a player to Tank 1")
		end
		if(scenario.group2tank)then		
			print("Tank 2:",scenario.group2tank.playername)
		else
			print("Couldn't assign a player to Tank 2")
		end
		
		scenario.group1={}
		scenario.group2={}
		local halfmelee=math.ceil(#melee/2)
		local halfranged=math.floor(#ranged/2)	-- if we use math.ceil for both, group1 could have 2 more players than group2
		for i=1,halfmelee do
			print("Assigning",melee[i].playername,"to group 1")		
			tinsert(scenario.group1,melee[i])
		end
		for i=1,halfranged do
			print("Assigning",ranged[i].playername,"to group 1")
			tinsert(scenario.group1,ranged[i])
		end		
		for i=halfmelee+1,#melee do
			print("Assigning",melee[i].playername,"to group 2")
			tinsert(scenario.group2,melee[i])
		end
		for i=halfranged+1,#ranged do
			print("Assigning",ranged[i].playername,"to group 2")
			tinsert(scenario.group2,ranged[i])
		end						
		scenario.groups_have_been_set=true
		
		if(#unknown==0)then
			scenario.statuslabel:SetText("Randomized player groups.  Debug info printed to chat window.",5.0)
		else
			scenario.statuslabel:SetText("Randomized player groups.  Debug info printed to chat window.\n"..tostring(#unknown).." player(s) do not have roles assigned!",5.0)
		end
	end


end