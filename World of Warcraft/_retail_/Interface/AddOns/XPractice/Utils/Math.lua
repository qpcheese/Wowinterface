function XPRACTICE.Transform_Rotate2D(x,y,angle,originx,originy)
	originx=originx or 0
	originy=originy or 0
	local x1=x-originx
	local y1=y-originy
	local x2=x1*math.cos(angle)-y1*math.sin(angle)
	local y2=y1*math.cos(angle)+x1*math.sin(angle)
	x2=x2+originx
	y2=y2+originy

	return x2,y2
end

function XPRACTICE.WrapAngle(angle)
	local result=angle
	while(result>math.pi)do result=result-math.pi*2 end
	while(result<=-math.pi)do result=result+math.pi*2 end
	return result
end


function XPRACTICE.signum(x)
	if x<0 then
		return -1
	elseif x>0 then
		return 1
	else
		return 0
	end
end



function XPRACTICE.MatrixMultiplicationRotation(x,y,z,ax,ay,az)
	local x2=x
	local y2=y
	local z2=z

													
	x2,y2,z2=XPRACTICE.MatrixMultiplication(x2,y2,z2,
										math.cos(az),-math.sin(az),0,
										math.sin(az),math.cos(az),0,
										0,0,1)		
	--print("After AZ:",x2,y2,z2)									
	x2,y2,z2=XPRACTICE.MatrixMultiplication(x2,y2,z2,
										1,0,0,
										0,math.cos(ax),-math.sin(ax),
										0,math.sin(ax),math.cos(ax))
	--print("After AX:",x2,y2,z2)
	x2,y2,z2=XPRACTICE.MatrixMultiplication(x2,y2,z2,
										math.cos(ay),0,math.sin(ay),
										0,1,0,
										-math.sin(ay),0,math.cos(ay))
	--print("After AY:",x2,y2,z2)
								
										
	return x2,y2,z2
end

function XPRACTICE.MatrixMultiplicationRotation2(x,y,z,ax,ay,az)
	--TODO: by all rights this function should not work
	-- even if it did work it should cause everything else to break
	-- consult a mathematician
	local x2=x
	local y2=y
	local z2=z		
	x2,y2,z2=XPRACTICE.MatrixMultiplication(x2,y2,z2,
										math.cos(ay),0,math.sin(ay),
										0,1,0,
										-math.sin(ay),0,math.cos(ay))
	x2,y2,z2=XPRACTICE.MatrixMultiplication(x2,y2,z2,
										1,0,0,
										0,math.cos(ax),-math.sin(ax),
										0,math.sin(ax),math.cos(ax))
	x2,y2,z2=XPRACTICE.MatrixMultiplication(x2,y2,z2,
										math.cos(az),-math.sin(az),0,
										math.sin(az),math.cos(az),0,
										0,0,1)		
	return x2,y2,z2
end

function XPRACTICE.MatrixMultiplication(x,y,z,a00,a10,a20,a01,a11,a21,a02,a12,a22)
	local x2,y2,z2
	x2=x*a00+y*a10+z*a20
	y2=x*a01+y*a11+z*a21
	z2=x*a02+y*a12+z*a22
	return x2,y2,z2
end

function XPRACTICE.distsqr(x1,y1,x2,y2)
	return (x2-x1)*(x2-x1)+(y2-y1)*(y2-y1)
end

function XPRACTICE.PointLineDistSqr(px,py,lx1,ly1,lx2,ly2)
	local l2=XPRACTICE.distsqr(lx1,ly1,lx2,ly2)
	--if line has length 0, it's just point-point distance
	if(l2==0)then return XPRACTICE.distsqr(px,py,lx1,ly1) end
	--otherwise
	local t=((px-lx1)*(lx2-lx1)+(py-ly1)*(ly2-ly1))/l2
	t=math.max(0,math.min(1,t))
	return XPRACTICE.distsqr(px,py, lx1+t*(lx2-lx1), ly1+t*(ly2-ly1)  )
end

function XPRACTICE.AngleDifference(a2,a1)
	function mod(a,b)
		return a-math.floor(a/b)*b
	end
	local difference=a2-a1
	return mod((difference+math.pi),math.pi*2)-math.pi		
end





function XPRACTICE.RandomNumberInBetween(a,b)
	-- not for use with integers
	return math.random()*(b-a)+a
end

function XPRACTICE.RandomPointInCircle(x,y,radius)
	local r=radius*math.sqrt(math.random())
	local t=math.random()*math.pi*2
	return x+r*math.cos(t),y+r*math.sin(t)
end

function XPRACTICE.RandomPointInPieSlice(x,y,radius,angle1,angle2)
	local r=radius*math.sqrt(math.random())
	local t=XPRACTICE.RandomNumberInBetween(angle1,angle2)
	return x+r*math.cos(t),y+r*math.sin(t)
end

function XPRACTICE.RandomPointAlongLine(x1,y1,x2,y2,radius)
	radius=radius or 0
	local r=math.random()
	local x=(x1+(x2-x1)*r)
	local y=(y1+(y2-y1)*r)
	return XPRACTICE.RandomPointInCircle(x,y,radius)	
end

function XPRACTICE.ShuffleList(list)	
	for i = #list, 1, -1 do
		local j=math.floor(math.random()*i)+1
		list[i],list[j]=list[j],list[i]
	end
end

--TODO: 99% sure WoW already implemented something that does this, find it
function XPRACTICE.Clamp(x, min, max)
	if(x<min)then return min end
    if(x>max)then return max end
    return x
end

function XPRACTICE.FindTwoMostDistantMobs(moblist)
	local mob1,mob2=nil,nil
	local maxdistsqr=nil
	for i=1,#moblist-1 do
		for j=i+1,#moblist do
			local m1=moblist[i]
			local m2=moblist[j]
			local distsqr=XPRACTICE.distsqr(m1.position.x,m1.position.y,m2.position.x,m2.position.y)
			if((not maxdistsqr) or distsqr>maxdistsqr)then
				maxdistsqr=distsqr
				mob1=m1
				mob2=m2
			end
		end
	end
	return mob1,mob2
end