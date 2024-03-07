
--SOURCE: lua-users.org/wiki/InheritanceTutorial
function XPRACTICE.inheritsFrom(baseClass)
	local new_class={}
	local class_mt={__index=new_class}
	function new_class:new()
		local newinst={}
		setmetatable(newinst,class_mt)
		return newinst
	end
	if baseClass~=nil then
		setmetatable(new_class,{__index=baseClass})		
	else
		--print("WARNING: XPRACTICE.inheritsFrom was given nil as its base class.  (we can't tell which class should be the parent from here)")
		XPRACTICE.PrintStackTrace()
		error("Assertion failed: inheritsFrom base class must not be nil")		
	end
    function new_class:Class()
        return new_class
    end
	-- WARNING: to access parent functions, call super.function(self,args)
	-- 	not super:function(args) -- that translates to super.function(super,args)!
    function new_class:SuperClass()		
        return baseClass
    end
    function new_class:Isa( theClass )
        local b_isa = false
        local cur_class = new_class
        while ( nil ~= cur_class ) and ( false == b_isa ) do
            if cur_class == theClass then
                b_isa = true
            else
				if(cur_class.superClass~=nil)then
					cur_class = cur_class:SuperClass()
				else
					cur_class=nil
				end
            end
        end
        return b_isa
    end	
	
	return new_class
end