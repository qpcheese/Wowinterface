-- SOURCE: Stack Overflow 		https://stackoverflow.com/questions/1073336/circle-line-segment-collision-detection-algorithm
-- Mizipzor						https://stackoverflow.com/users/56763/mizipzor
-- smci							https://stackoverflow.com/users/202229/smci
-- bobobobobo					https://stackoverflow.com/users/111307/bobobobo
function XPRACTICE.LineCircleCollision(x1,y1,x2,y2,cx,cy,r)

	local dot=function(v1,v2)		
			return v1[1]*v2[1]+v1[2]*v2[2]
		end
	local d={(x2-x1),(y2-y1)}
	local f={(x1-cx),(y1-cy)}
	
	
	local a=dot(d,d)
	local b=2*dot(f,d)
	local c=dot(f,f)-r*r
	
	local discriminant=b*b-4*a*c
	if(discriminant<0)then
		--print("discriminant<0")
		return false
	else
		discriminant=math.sqrt(discriminant)
		local t1=(-b - discriminant)/(2*a)
		local t2=(-b + discriminant)/(2*a)
		if(t1>=0 and t1<=1) then
			return true
		end
		if(t2>=0 and t2<=1) then
			return true
		end
		return false
	end
	
end



function XPRACTICE.IsColinearPointOnSegment(px,py,lx1,ly1,lx2,ly2)
	-- WARNING: points must be colinear already
	return (px<=math.max(lx1,lx2) and px>=math.min(lx1,lx2)	and py<=math.max(ly1,ly2) and py>=math.min(ly1,ly2))
end

function XPRACTICE.OrderedTripletOrientation(p1x,p1y,p2x,p2y,p3x,p3y)
	local o=(p2y-p1y)*(p3x-p2x)-(p2x-p1x)*(p3y-p2y)
	return XPRACTICE.signum(o)
end

function XPRACTICE.LineLineIntersection(l1x1,l1y1,l1x2,l1y2,l2x1,l2y1,l2x2,l2y2)
	local o1=XPRACTICE.OrderedTripletOrientation(l1x1,l1y1,l1x2,l1y2,l2x1,l2y1)
	local o2=XPRACTICE.OrderedTripletOrientation(l1x1,l1y1,l1x2,l1y2,l2x2,l2y2)
	local o3=XPRACTICE.OrderedTripletOrientation(l2x1,l2y1,l2x2,l2y2,l1x1,l1y1)
	local o4=XPRACTICE.OrderedTripletOrientation(l2x1,l2y1,l2x2,l2y2,l1x2,l1y2)
	
	if(o1~=o2 and o3~=o4)then return true end
	if(o1==0 and XPRACTICE.IsColinearPointOnSegment(l2x1,l2y1,l1x1,l1y1,l1x2,l1y2))then return true end
	if(o2==0 and XPRACTICE.IsColinearPointOnSegment(l2x2,l2y2,l1x1,l1y1,l1x2,l1y2))then return true end
	if(o3==0 and XPRACTICE.IsColinearPointOnSegment(l1x1,l1y1,l2x1,l2y1,l2x2,l2y2))then return true end
	if(o4==0 and XPRACTICE.IsColinearPointOnSegment(l1x2,l1y2,l2x1,l2y1,l2x2,l2y2))then return true end
	
	return false
end

function XPRACTICE.LineLineIntersectionPosition(l1x1,l1y1,l1x2,l1y2,l2x1,l2y1,l2x2,l2y2)
	-- WARNING: may return inconsistent results if L1 and L2 are colinear.
	if(not XPRACTICE.LineLineIntersection(l1x1,l1y1,l1x2,l1y2,l2x1,l2y1,l2x2,l2y2))then return false end
	--print("collision")
	
	local A1=l1y2-l1y1
	local B1=l1x1-l1x2
	local C1=A1*l1x1+B1*l1y1

	local A2=l2y2-l2y1
	local B2=l2x1-l2x2
	local C2=A2*l2x1+B2*l2y1
	
	local det=A1*B2-A2*B1
	local EPSILON=0.01
	if(math.abs(det)<=EPSILON)then return false end
	local x=(B2*C1-B1*C2)/det
	local y=(A1*C2-A2*C1)/det
	
	return x,y
end



function XPRACTICE.LineLineIntersectionPositionV2(l1x1,l1y1,l1x2,l1y2,l2x1,l2y1,l2x2,l2y2)
	local s1x=l1x2-l1x1
	local s1y=l1y2-l1y1
	local s2x=l2x2-l2x1
	local s2y=l2y2-l2y1
	if((-s2x*s1y+s1x*s2y)==0)then return false end
	if((-s2x*s1y+s1x*s2y)==0)then return false end	
	local s=(-s1y*(l1x1-l2x1)+s1x*(l1y1-l2y1)) / (-s2x*s1y+s1x*s2y)
	local t=(s2x*(l1y1-l2y1)-s2y*(l1x1-l2x1)) / (-s2x*s1y+s1x*s2y)
	if(s>=0 and s<=1 and t>-9 and t<=1)then
		return l1x1+(t*s1x),l1y1+(t*s1y)
	end
	return false
end