-- note that xpcall doesn't accept function arguments,
-- so fn() should be an anonymous function with its arguments baked in
-- At the moment, this is only used for game:MainGameLoop 
-- to prevent bad things from happening if an error occurs every frame.
function XPRACTICE.xpcall(fn)
	xpcall(fn,function(msg)XPRACTICE.ErrorHandler(msg)end)
end


function XPRACTICE.ErrorHandler(msg)	
	print(msg)
	XPRACTICE.PrintStackTrace()
	print("|cFFFF0000A Lua error was detected.  Shutting down X Practice to prevent further issues.")
	print("Please /reload before trying again.")
	
	-- it turns out this function still counts as within xpcall, so any further errors will cause a recursive loop	
	if(XPRACTICE and not XPRACTICE.alreadyattemptederrorshutdown)then
		XPRACTICE.alreadyattemptederrorshutdown=true
		XPRACTICE:Shutdown()
	end		
	
	--TODO: instead of showing error in default lua window, 
	-- print stacktrace to a custom copypastable error dialog instead
	-- (which won't rely on scriptErrors cvar)
	-- we also attempt to display the error in the default lua error window.
	-- we need to break out of xpcall to do so
	-- (note that the stacktrace won't be tremendously useful)
	C_Timer.After(0.5,function()
			error(msg)		
			-- anything past this point won't happen
		end
	)
end



function XPRACTICE.PrintStackTrace()
	local ds=debugstack()
	local split_debugstack=XPRACTICE.split_lines(ds)
	for i,v in ipairs(split_debugstack) do
		print(v)	
	end
end