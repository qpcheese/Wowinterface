XPRACTICE.PlayerInputHandler = {}
XPRACTICE.PlayerInputHandler.__index = XPRACTICE.PlayerInputHandler
function XPRACTICE.PlayerInputHandler.new()
	local self=setmetatable({}, XPRACTICE.PlayerInputHandler)
	return self
end

function XPRACTICE.PlayerInputHandler:Setup(environment)
	self.environment=environment
end

function XPRACTICE.PlayerInputHandler:ProcessInput()
	--override
end