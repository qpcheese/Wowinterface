do	
	XPRACTICE.MULTIPLAYERV2.Message = {}
	local class=XPRACTICE.MULTIPLAYERV2.Message
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
		self.argtypes={}
		self.argmetas={}
	end


	function class:ToString()
		local str=""
		return str
	end
	
	function class:MessageIsValid(sender,args)
		local name1,name2=UnitFullName("player")
		--print("ignoreself:",self.ignoreself,"sender:",sender,name1,name2)
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

XPRACTICE.MULTIPLAYERV2.Messagetypes={}
XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer={}

local messagecode=0

do
	--CUSTOM is first message code, primarily so we don't accidentally assign a later standard code to it
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	--print("CUSTOM code:",messagecode,BCDmessagecode)
	local messagename="CUSTOM"	
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]		
	XPRACTICE.MULTIPLAYERV2.previouscustomcode=messagecode

	--XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	--XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]
	messagecode=messagecode+1
	local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="HELLO"
	local super=XPRACTICE.MULTIPLAYERV2.Message
	local lambda=XPRACTICE.inheritsFrom(super)
	local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6}}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="GOODBYE"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={}
	end
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="IEXIST"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},	-- x
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},	-- y
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6},	-- yaw
						{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR}}	-- roleID ("X" for spectator)
	end	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="EXTRAOBJECTS"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={}
		for i=1,5 do
			tinsert(self.argtypes,{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR})
			tinsert(self.argtypes,{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4})
			tinsert(self.argtypes,{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4})
			tinsert(self.argtypes,{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4})
			tinsert(self.argtypes,{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6})
		end
	end	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="RUN"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6}}
	end

	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			
	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ROLL"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6}}
	end

	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]		
	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="TURNINPLACE"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6}}
	end

	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="MIDAIR"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BOOLEAN}}
	end
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]

	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="BACKPEDALSTART"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="BACKPEDALSTOP"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="WALKSTART"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="WALKSTOP"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="LOCK"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false	-- the officer flag is not set until the room is locked, so we have to accept messages from all players then check for officer status manually
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="UNLOCK"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]	

	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="UNLOCK_NOOFFICERS"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false	-- similarly, players who are in the lobby don't know who is flagged as officer, so we have to accept UNLOCK_NOOFFICERS messages from everyone
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ACKNOWLEDGEUNLOCK"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false	-- we have to accept ACKNOWLEDGEUNLOCK messages from everyone
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ALREADYINPROGRESS"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false
		self.argtypes={}
	end		
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="CLAIMHOST"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=true
		self.argtypes={}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]	
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="WORLDMARKER"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false
		self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4}}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]		
	
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="ALLWORLDMARKERS"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false
		self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BOOLEAN},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
						{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4}	}
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]		
		
	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="CLEARWORLDMARKER"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=true
		self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR,4} }
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			


	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="CUSTOMEFFECT_GROUND"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.requireofficer=true
		self.argtypes={		{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR},	--effect code (behavior)
							{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR},	--(color)
							{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR},	--(style)
							{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR},	--(radius)
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},			--x
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4}		}	--y
	end
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]			

	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="CUSTOMEFFECT_ATTACH"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.requireofficer=true
		self.argtypes={		{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR},					--effect code				
							{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR},		
							{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR},
							{XPRACTICE.MULTIPLAYERV2.Datatypes.PADDEDGUID}} -- attach player (or "ALL-XXXXXXXXXXXX")
	end
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]	

	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="CUSTOMEFFECT_ERASE"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.requireofficer=true
		self.argtypes={		{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR},	--(radius)
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},			--x
							{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4}		}	--y
	end
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]	

	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="CUSTOMEFFECT_ERASE_ALL"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=true
		self.argtypes={}
	end
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]


	--print("old messagecode:",messagecode)
	--local messagecode=21
	--local messagecode=23

	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="FLOORBELOW"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={{XPRACTICE.MULTIPLAYERV2.Datatypes.BOOLEAN}}
	end

	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]

	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="WALLCHECKING"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=true
		self.argtypes={{XPRACTICE.MULTIPLAYERV2.Datatypes.BOOLEAN},
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},		-- x,y,z, vx,vy,vz, yaw
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,4},
					{XPRACTICE.MULTIPLAYERV2.Datatypes.BCD,6}}
	end

	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]
	
	


	messagecode=messagecode+1;local BCDmessagecode=XPRACTICE.MULTIPLAYERV2.Datatypes.ShortBCD.ToString(messagecode)
	local messagename="CHANGEROLE"
	local super=XPRACTICE.MULTIPLAYERV2.Message;local lambda=XPRACTICE.inheritsFrom(super);local class=lambda	
	function class:SetCustomInfo()
		self.messagename=messagename;self.messagecode=messagecode;self.BCDmessagecode=BCDmessagecode
		self.ignoreself=false
		self.requireofficer=false
		self.argtypes={	{XPRACTICE.MULTIPLAYERV2.Datatypes.CHAR} }
	end
	
	XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]=lambda.new();XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]:Setup()
	XPRACTICE.MULTIPLAYERV2.MessagetypesBCDPointer[BCDmessagecode]=XPRACTICE.MULTIPLAYERV2.Messagetypes[messagename]	
	XPRACTICE.MULTIPLAYERV2.previousmessagecode=messagecode	
	


	-----
	

	
	
end

