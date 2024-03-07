
do
	XPRACTICE.AMIRDRASSILRAIDMAPS_CustomEffectDefaults={}
	local GROUND,PLAYER,ENEMY,BLUE,GRAY,RED,RING,SWIRL,BOTH,CYLINDER,END="G","P","E","B","G","R","R","S","B","C","END"
	function XPRACTICE.AMIRDRASSILRAIDMAPS_CustomEffectDefaults.GetDefaults(index)
	
		if(index==1)then	
			return{		--GNARLROOT
				{PLAYER, RED, RING, 5},			--flaming sap
				{PLAYER, RED, BOTH, 15}, 		--controlled burn
				{GROUND, RED, CYLINDER, 15}, 	--controlled burn
				{GROUND, GRAY, SWIRL, 3}, 		--doom roots
				{GROUND, RED, RING, 5}, 		--splintering charcoal
				{GROUND, GRAY, CYLINDER, 6}, 	--toxic loam
				{END}}
				
		elseif(index==2)then
			return{		--IGIRA
				{GROUND, RED, BOTH, 10},		--blistering spear
				{ENEMY, GRAY, SWIRL, 45},		--marked for torment
				{GROUND, RED, SWIRL, 4},		--searing sparks
				{PLAYER, GRAY, BOTH, 10},		--hacking torment (wracking skewer)
				{PLAYER, GRAY, SWIRL, 8},		--slicing torment (smashing viscera)
				{END}}		
				
		elseif(index==3)then
			return{		--COUNCIL
				{PLAYER, GRAY, SWIRL, 10},		--unstable venom
				{PLAYER, BLUE, SWIRL, 7}, 		--volatile spew
				{PLAYER, BLUE, RING, 7}, 		--polymorph bomb
				{END}}		
				
		elseif(index==4)then
			return{		--SMOLDERON
				{PLAYER, RED, BOTH, 9},			--brand of damnation
				{GROUND, RED, SWIRL, 6}, 		--cauterized explosion
				{PLAYER, RED, RING, 5}, 		--overheated
				{GROUND, RED, CYLINDER, 8}, 	--smoldering ground (actual size unknown)
				{END}}	

		elseif(index==5)then
			return{		--LARODAR
				{GROUND, BLUE, CYLINDER, 8}, 		--(actual size unknown)
				{ENEMY, RED, RING, 12},		-- fiery flourish
				{ENEMY, RED, BOTH, 3},		-- explosive bark
				{GROUND, RED, SWIRL, 3},			--blazing thorns / falling embers
				{PLAYER, RED, RING, 12},		-- flash fire
				{PLAYER, BLUE, RING, 6},		-- smoldering suffocation
				{END}}		
		
		elseif(index==6)then
				return{		--VOLCOROSS
				{GROUND, BLUE, RING, 12},	--flood of the firelands
				{PLAYER, RED, SWIRL, 5}, 		--coiling eruption
				{GROUND, RED, CYLINDER, 3}, 		--volcanic disgorge
				{GROUND, RED, CYLINDER, 8}, 		--(actual size unknown)
				{END}}		
		
		elseif(index==7)then
				return{		--NYMUE
				{GROUND, BLUE, CYLINDER, 1}, 	-- for drawing lines (verdant matrix)
				{GROUND, BLUE, RING, 30},	--lucid miasma (add)
				{GROUND, RED, BOTH, 50},	-- nature volley (add) (TODO: actual size should be 75y)
				{GROUND, RED, SWIRL, 10}, -- violent flora
				{END}}				
		
		elseif(index==8)then
			return{		--TINDRAL
				{PLAYER, RED, RING, 3},			--mass entanglement
				{GROUND, RED, SWIRL, 6},		--star fragments
				{GROUND, RED, CYLINDER, 8},		--scorching ground (actual size unknown)
				{GROUND, BLUE, BOTH, 3},			--wild mushrooms 1 (actual size unknown)
				{GROUND, GRAY, BOTH, 3},			--wild mushrooms 2 (actual size unknown)
				{GROUND, RED, SWIRL, 15},		--fire beam
				{END}}		
		
		elseif(index==9)then
			return{		--FYRAKK
				{PLAYER, BLUE, RING, 6},	--darkflame cleave
				{GROUND, RED, CYLINDER, 6},	--raging flames
				{GROUND, RED, SWIRL, 9},	--firestorm
				{GROUND, RED, SWIRL, 4},	--firestorm 2
				{GROUND, RED, CYLINDER, 9},	--raging flames
				{GROUND, RED, SWIRL, 25},		--incarnate/meteor (actual size unknown)
				{PLAYER, RED, RING, 3},		--molten eruption (actual size unknown)
				{GROUND, RED, RING, 15},		--pulsing core (add)
				{PLAYER, BLUE, BOTH, 9},		--bloom
				
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