do
	XPRACTICE.FrameLayer = {}
	XPRACTICE.FrameLayer.__index = XPRACTICE.FrameLayer
	local class=XPRACTICE.FrameLayer
	
	function XPRACTICE.FrameLayer.new()
		local self=setmetatable({}, XPRACTICE.FrameLayer)	
		return self
	end
	
	function XPRACTICE.FrameLayer.QuickSetup(level)
		local framelayer=XPRACTICE.FrameLayer.new()
		framelayer.level=level
		return framelayer
	end
end