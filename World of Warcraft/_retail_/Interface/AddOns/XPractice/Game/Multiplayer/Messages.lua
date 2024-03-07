do	
	XPRACTICE.MULTIPLAYER.Message = {}
	local class=XPRACTICE.MULTIPLAYER.Message
	class.__index = class

	function class.new()
		local self=setmetatable({}, class)	
		return self
	end

	function class:Setup()		
		self:SetCustomInfo()
		self.messages={}
	end
	
	function class:SetCustomInfo()
		self.messagename="[INVALID]"
		self.messagecode=0
		self.ignoreself=false
		self.requireofficer=false
		self.requirehost=false
		self.argtypes={}
		self.argmetas={}
	end


	function class:ToString()
		local str=""
		return str
	end
	
	function class:MessageIsValid(sender,args)
		local name1,name2=UnitFullName("player")
		
		if(self.ignoreself==true and sender==name1.."-"..name2)then
			return false
		end
		
		if(self.requireofficer and not XPRACTICE.MULTIPLAYERV2.IsRealOfficer(sender))then			
			return false
		end		
	
		return true 
	end
	
	function class:MessageOfficerCheck(multiplayermodule,sender)
		if(self.requireofficer)then
			local name,server=strsplit("-",sender)
			--local officer=IsRealOfficer(name)
			local ghost=multiplayermodule.allplayers[sender]
			if(not ghost)then return false end
			if(not ghost.officer)then return false end
		end	
		return true
	end
	
	-- function class:MessageHostCheck(multiplayermodule,sender)
		-- if(self.requirehost)then
			-- local name,server=strsplit("-",sender)
			-- --local officer=IsRealOfficer(name)
			-- local ghost=multiplayermodule.allplayers[sender]
			-- if(not ghost)then return false end
			-- if(multiplayermodule.hostname~=sender)then 
				-- return false 
			-- end
		-- end	
		-- return true
	-- end
	
	function class:ArgsToString(...)
		local args={...}
		if(#args~=#self.argtypes)then
			print("Args:",#args,"Expected args:",#self.argtypes)
			error("User-defined error: malformed multiplayer message of type "..self.messagename)			
		end
		local str=""
		for i=1,#args do			
			local argtype=self.argtypes[i]
			--if(type(argtype)=="table")then				
			if(true)then	--argtype is always a table because objects are tables!
				--print("Argtype:",i,argtype[1],args[i])
				str=str..argtype[1].ToString(args[i],argtype[2])
			else
				str=str..argtype.ToString(args[i])
			end
		end
		return str
	end
	
	function class:StringToArgs(argstr)
		local args={}
		local index=1		
		for i=1,#self.argtypes do			
			if(index>string.len(argstr))then
				-- invalid message, apparently
				return nil
			end		
		
			local argtype=self.argtypes[i]			
			local meta=nil
			if(type(self.argtypes[i])=="table")then			
				argtype,meta=argtype[1],argtype[2]
			end						
			local size=argtype.Size()
			local arg=string.sub(argstr,index,index+size-1)	
			decodedarg=argtype.Decode(arg,meta)
			tinsert(args,decodedarg)
			index=index+size
		end
		if(#args~=#self.argtypes)then
			print("Args:",#args,"Expected args:",#self.argtypes)
			--error("User-defined error: malformed multiplayer message of type "..self.messagename)			
			return nil
		end		
		return args
	end
end

XPRACTICE.MULTIPLAYER.Messagetypes={}
XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer={}

local messagecode=0

do
	--XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	--XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]
	messagecode=messagecode+1
	local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="HELLO"
	local super=XPRACTICE.MULTIPLAYER.Message
	local lambda=XPRACTICE.inheritsFrom(super)
	local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6}}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="GOODBYE"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="IEXIST"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6}}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="EXTRAOBJECTS"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={}
		for i=1,5 do
			tinsert(self.argtypes,{XPRACTICE.MULTIPLAYER.Datatypes.CHAR})
			tinsert(self.argtypes,{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4})
			tinsert(self.argtypes,{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4})
			tinsert(self.argtypes,{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4})
			tinsert(self.argtypes,{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6})
		end
	end	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="RUN"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6}}
	end

	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]			
	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ROLL"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6}}
	end

	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]		
	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="TURNINPLACE"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6}}
	end

	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="MIDAIR"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6},
						{XPRACTICE.MULTIPLAYER.Datatypes.BOOLEAN}}
	end

	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]

	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="BACKPEDALSTART"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="BACKPEDALSTOP"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="WALKSTART"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="WALKSTOP"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]			
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="LOCK"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false	-- the officer flag is not set until the room is locked, so we have to accept messages from all players then check for officer status manually
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="UNLOCK"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]	

	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="UNLOCK_NOOFFICERS"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false	-- similarly, players who are in the lobby don't know who is flagged as officer, so we have to accept UNLOCK_NOOFFICERS messages from everyone
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ACKNOWLEDGEUNLOCK"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false	-- we have to accept ACKNOWLEDGEUNLOCK messages from everyone
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ALREADYINPROGRESS"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false
		self.argtypes={}
	end		
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="CLAIMHOST"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="WORLDMARKER"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false
		self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.CHAR,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ALLWORLDMARKERS"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false
		self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4}	}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]		
		
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="CLEARWORLDMARKER"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false
		self.argtypes={	{XPRACTICE.MULTIPLAYER.Datatypes.CHAR,4} }
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]			




	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="LOCKv2"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false	-- the officer flag is not set until the room is locked, so we have to accept messages from all players then check for officer status manually
		self.requirehost=false
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]

	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ROLLCALL"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requirehost=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]

	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ROLLRESPONSE"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requirehost=false
		self.argtypes={{XPRACTICE.MULTIPLAYER.Datatypes.CHAR}}	-- randombyte
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]


	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ROLLCALL_CLOSED"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requirehost=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]


	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ROLLCALL_CHECK"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requirehost=true
		self.argtypes={{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},
					{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},
					{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},
					{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},
					{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},{XPRACTICE.MULTIPLAYER.Datatypes.CHAR}}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]


	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="FLOORBELOW"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={{XPRACTICE.MULTIPLAYER.Datatypes.BOOLEAN}}
	end
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]

	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="WALLCHECKING"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={{XPRACTICE.MULTIPLAYER.Datatypes.BOOLEAN},
					{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},		-- x,y,z, vx,vy,vz, yaw
					{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
					{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
					{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
					{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
					{XPRACTICE.MULTIPLAYER.Datatypes.BCD,4},
					{XPRACTICE.MULTIPLAYER.Datatypes.BCD,6}}
	end
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ROLE"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={{XPRACTICE.MULTIPLAYER.Datatypes.CHAR},
					{XPRACTICE.MULTIPLAYER.Datatypes.CHAR}}
	end
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]		
	

	-----
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYER.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="CUSTOM"
	local super=XPRACTICE.MULTIPLAYER.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYER.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYER.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYER.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYER.Messagetypes[messagename]		
	
	XPRACTICE.MULTIPLAYER.previousmessagecode=messagecode
end

