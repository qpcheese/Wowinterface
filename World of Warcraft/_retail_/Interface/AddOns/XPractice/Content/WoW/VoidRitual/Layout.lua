do
	XPRACTICE.VOIDRITUAL.Layout={}
	local layout=XPRACTICE.VOIDRITUAL.Layout
	layout.scale=20.5
	layout.center={x=0,y=0}
	
	function layout.SetCenter(x,y)
		x,y=-y,-x
		layout.center={x=x,y=y}
	end
	function layout.ObeliskSmall(scenario,x,y)
		x,y=-y,-x
		local obj
		obj=XPRACTICE.VOIDRITUAL.ObeliskSmall.new()
		obj:Setup(scenario.game.environment_gameplay);tinsert(scenario.obelisks,obj)
		obj.position.x=(x-layout.center.x)*layout.scale
		obj.position.y=(y-layout.center.y)*layout.scale
	end
	function layout.ObeliskLarge(scenario,x,y)
		x,y=-y,-x
		local obj
		obj=XPRACTICE.VOIDRITUAL.ObeliskLarge.new()
		obj:Setup(scenario.game.environment_gameplay);tinsert(scenario.obelisks,obj)
		obj.position.x=(x-layout.center.x)*layout.scale
		obj.position.y=(y-layout.center.y)*layout.scale
	end
	function layout.Portal1(scenario,x,y)
		x,y=-y,-x
		scenario.portal1position.x=(x-layout.center.x)*layout.scale
		scenario.portal1position.y=(y-layout.center.y)*layout.scale
		scenario.portal1position.z=0
	end	
	function layout.Portal2(scenario,x,y)
		x,y=-y,-x
		scenario.portal2position.x=(x-layout.center.x)*layout.scale
		scenario.portal2position.y=(y-layout.center.y)*layout.scale
		scenario.portal2position.z=4
	end		
	function layout.GhostCW(scenario,x,y,yaw720)
		tinsert(scenario.ghostpositionsCW,{x=x,y=y,z=0})
		tinsert(scenario.ghostorientationsCW,{yaw=yaw720/720.0*(math.pi*2)})
	end
	function layout.GhostCCW(scenario,x,y,yaw720)
		tinsert(scenario.ghostpositionsCCW,{x=x,y=y,z=0})
		tinsert(scenario.ghostorientationsCCW,{yaw=yaw720/720.0*(math.pi*2)})
	end
	
	function XPRACTICE.VOIDRITUAL.Layout.SetObelisks(scenario,layoutindex)
		for i=1,#scenario.obelisks do
			local obj=scenario.obelisks[i]
			obj:Die()
		end		
		scenario.obelisks={}
		scenario:DeleteGoalPortal()
	
		if(layoutindex==1 or layoutindex==4)then
			----- FORMATION 1 -----------------------------------------------
			if(layoutindex==1)then
				scenario.xanesh.orientation.yaw=math.pi/3;		-- FORMATION 1
				scenario.xanesh.ai.targetposition={x=0,y=-18,z=0}
			elseif(layoutindex==4)then
				scenario.xanesh.orientation.yaw=math.pi/6		-- FORMATION 4
				scenario.xanesh.ai.targetposition={x=13,y=20,z=0}
			end			
			layout.SetCenter(3.292,2.002)			
			layout.ObeliskSmall(scenario,2.623,0.872)
			layout.ObeliskLarge(scenario,3.889,1.090)
			layout.ObeliskLarge(scenario,4.788,1.925)
			layout.ObeliskSmall(scenario,3.962,3.262)
			layout.ObeliskLarge(scenario,3.438,2.984)
			layout.ObeliskSmall(scenario,2.939,2.698)
			layout.ObeliskLarge(scenario,1.948,2.116)
			layout.Portal1(scenario,2.648,3.590)
			layout.Portal2(scenario,4.561,3.366)
			scenario:ClearGhostPositions()
			layout.GhostCW(scenario,-32.5265,13.3371,0.1875)
			layout.GhostCW(scenario,19.4632,13.8798,-215.1404)
			layout.GhostCW(scenario,9.4304,-14.9195,-322.6185)
			layout.GhostCCW(scenario,-28.1504,-26.1143,43.2087)
			layout.GhostCCW(scenario,11.5711,-12.3907,144.0404)
			layout.GhostCCW(scenario,19.0961,13.6502,354.3932)
		elseif(layoutindex==2 or layoutindex==5)then
			------- FORMATION 2 -----------------------------------------------
			if(layoutindex==2)then
				scenario.xanesh.orientation.yaw=math.pi/2+math.pi/3	-- FORMATION 2
				scenario.xanesh.ai.targetposition={x=-18,y=13,z=0}
			elseif(layoutindex==5)then
				scenario.xanesh.orientation.yaw=math.pi/6		-- FORMATION 5
				scenario.xanesh.ai.targetposition={x=13,y=20,z=0}
			end
			layout.SetCenter(8.868,2.010)			
			layout.ObeliskSmall(scenario,7.269,2.161)
			layout.ObeliskSmall(scenario,7.670,2.128)
			layout.ObeliskSmall(scenario,8.080,2.087)
			layout.ObeliskSmall(scenario,8.813,0.799)
			layout.ObeliskSmall(scenario,10.132,1.283)
			layout.ObeliskSmall(scenario,9.670,1.936)
			layout.ObeliskSmall(scenario,10.502,1.894)
			layout.ObeliskSmall(scenario,10.231,2.547)
			layout.ObeliskSmall(scenario,9.050,3.155)
			layout.Portal1(scenario,7.689,1.134)
			layout.Portal2(scenario,7.877,3.148)
			scenario:ClearGhostPositions()			
			layout.GhostCW(scenario,-6.5106,-25.7627,224.8593)	--3	
			layout.GhostCW(scenario,8.4545,-26.6725,-354.9542)	--2
			layout.GhostCW(scenario,17.9017,23.9841,-200.7492)	--1
			layout.GhostCCW(scenario,11.0382,-20.9098,157.5997)	--3	
			layout.GhostCCW(scenario,-5.1259,-25.2012,17.4132)	--2
			layout.GhostCCW(scenario,-23.3226,20.3634,-134.7071)--1
			
			----------------------------------------------------------------------------------------------				
		elseif(layoutindex==3)then
			------- FORMATION 3 -----------------------------------------------
			scenario.xanesh.orientation.yaw=math.pi/2;
			scenario.xanesh.ai.targetposition={x=18,y=-18,z=0}
			layout.SetCenter(14.438,2.008)
			layout.ObeliskLarge(scenario,14.353,0.962)
			layout.ObeliskSmall(scenario,13.810,0.774)
			layout.ObeliskSmall(scenario,13.966,1.369)
			layout.ObeliskSmall(scenario,14.875,0.681)
			layout.ObeliskSmall(scenario,14.817,1.302)
			layout.ObeliskSmall(scenario,15.663,1.907)
			layout.ObeliskLarge(scenario,15.238,2.899)
			layout.ObeliskLarge(scenario,13.776,3.002)
			layout.ObeliskSmall(scenario,12.673,2.159)
			layout.ObeliskSmall(scenario,13.091,2.123)
			layout.Portal1(scenario,15.393,0.629)
			layout.Portal2(scenario,13.339,0.935)	
			scenario:ClearGhostPositions()
			layout.GhostCW(scenario,-13.1677,11.6691,41.5741)	--3			
			layout.GhostCW(scenario,-14.0483,-10.2291,183.9255)	--2
			layout.GhostCW(scenario,28.2007,-19.5624,334.6161)	--1
			layout.GhostCCW(scenario,-11.2306,-12.6959,-28.3232)--3			
			layout.GhostCCW(scenario,-15.8726,7.5998,-163.8370)	--2
			layout.GhostCCW(scenario,22.1596,22.6064,-314.4262)	--1
			----------------------------------------------------------------------------------------------		
		end
	end
	
end