
do
	XPRACTICE.ABERRUSRAIDMAPS_CustomEffectDefaults={}
	local GROUND,PLAYER,ENEMY,BLUE,GRAY,RED,RING,SWIRL,BOTH,CYLINDER,END="G","P","E","B","G","R","R","S","B","C","END"
	function XPRACTICE.ABERRUSRAIDMAPS_CustomEffectDefaults.GetDefaults(index)
	
		if(index==1)then	
			return{		--KAZZARA
				{GROUND, RED, SWIRL, 4},		--hellsteel fragment
				{GROUND, RED, SWIRL, 3}, 		--revenant's blood
				{PLAYER, RED, RING, 5}, 		--dread rifts
				{GROUND, RED, CYLINDER, 5}, 	--dread rifts void zone
				{END}}
				
		elseif(index==2)then
			return{		--AMALGAMATION
				{ENEMY, RED, RING, 25},			--boss tether range
				{ENEMY, GRAY, RING, 50},		--boss debuff auras
				{PLAYER, RED, RING, 5},			--player collision aura 1
				{PLAYER, BLUE, RING, 5},		--player collision aura 2
				{PLAYER, BLUE, BOTH, 8},		--void zone drop / split soak
				{GROUND, BLUE, CYLINDER, 8},	--umbral detonation void zone
				{GROUND, RED, RING, 5},			--solo soaks
				{GROUND, GRAY, SWIRL, 10},		--splinters
				{PLAYER, GRAY, RING, 6},		--shadow and flame
				{END}}		
				
		elseif(index==3)then
			return{		--EXPERIMENTS
				{GROUND, BLUE, SWIRL, 16},		--unstable essence
				{GROUND, RED, SWIRL, 7}, 		--volatile spew
				{PLAYER, BLUE, BOTH, 5}, 		--disintegrate
				{END}}		
				
		elseif(index==4)then
			return{		--ZAQALI
				{GROUND, RED, BOTH, 12},		--blazing focus (should be ENEMY behavior, but we don't have adds implemented yet)
				{GROUND, GRAY, SWIRL, 12}, 		--devastating leap / arbalest fire
				{GROUND, GRAY, SWIRL, 6}, 		--cave rubble
				{PLAYER, RED, RING, 8}, 		--blazing spear
				{GROUND, RED, RING, 8}, 		--aftershock
				{GROUND, RED, BOTH, 25}, 		--scorching roar (should be ENEMY behavior, but we don't have adds implemented yet)
				{END}}	

		elseif(index==5)then
			return{		--RASHOK
				{PLAYER, BLUE, RING, 8},		--searing slam (size not listed in dungeon journal)
				{GROUND, RED, CYLINDER, 8},		--lava vortex (actual size unknown)
				{GROUND, GRAY, CYLINDER, 8},	--shadowflame energy (actual size unknown)
				{GROUND, RED, RING, 5},			--solo soaks
				{GROUND, RED, RING, 10},		--big split soak
				{GROUND, GRAY, SWIRL, 20},		--shattered conduit
				{GROUND, GRAY, SWIRL, 5},		--shadowflame fissures
				{END}}		
		
		elseif(index==6)then
				return{		--ZSKARN
				{GROUND, RED, CYLINDER, 10},	--dragonfire traps
				{GROUND, RED, SWIRL, 8}, 		--(actual size unknown)
				{PLAYER, RED, BOTH, 5}, 		--unstable embers
				{END}}		
		
		elseif(index==7)then
			return{		--MAGMORAX
				{PLAYER, BLUE, RING, 6},		--split soak
				{PLAYER, RED, RING, 10}, 		--void zone drop
				{GROUND, RED, CYLINDER, 1},
				{GROUND, RED, CYLINDER, 5},
				{GROUND, RED, CYLINDER, 10}, 	--void zone (size varies)
				{GROUND, RED, CYLINDER, 15},
				{GROUND, RED, CYLINDER, 20},
				{GROUND, RED, CYLINDER, 25},				
				{END}}				
		
		elseif(index==8)then
			return{		--NELTHARION
				{GROUND, RED, BOTH, 5},			--volcanic blast / sunder reality
				{PLAYER, RED, RING, 15},		--volcanic heart (15y heroic, LOS mythic)
				{GROUND, GRAY, SWIRL, 22},		--echoing fissure / aftershock
				{GROUND, GRAY, SWIRL, 3},		--collapsed earth
				{GROUND, GRAY, CYLINDER, 1},	--sunder reality safe zone (actual size unknown)
				{END}}		
		
		elseif(index==9 or index==10)then
			return{		--SARKARETH
				{GROUND, GRAY, CYLINDER, 5},	--dimensional puncture (actual size unknown)
				{GROUND, RED, BOTH, 10},		--scorching bomb (should be ENEMY behavior, but we don't have adds implemented yet)
				{GROUND, RED, SWIRL, 4},		--drifting embers
				{GROUND, BLUE, BOTH, 12},		--void bomb (should be ENEMY behavior, but we don't have adds implemented yet)
				{PLAYER, BLUE, RING, 20},		--void blast
				{GROUND, BLUE, SWIRL, 30},		--cosmic ascension
				{GROUND, BLUE, CYLINDER, 3},	--astral formation (actual size unknown)
				{GROUND, BLUE, BOTH, 10},		--astral eruption
				{GROUND, BLUE, BOTH, 12},		--embrace of nothingness
				{GROUND, GRAY, SWIRL, 3},		--motes of oblivion
				{END}}		
		
		end
		
		--Default case (we should never reach this point)
		return{	
			{GROUND,	RED,	CYLINDER,	7},
			{PLAYER,	GRAY,	RING,		7},
			{BOSS,		RED,	SWIRL,		20},
			{END}}

	end
end