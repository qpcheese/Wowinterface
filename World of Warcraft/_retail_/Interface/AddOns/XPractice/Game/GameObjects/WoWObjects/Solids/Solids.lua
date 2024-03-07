XPRACTICE.SOLIDS={}

do

		
	--TODO: move to global-ish folder
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Rectangle001=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Rectangle001		
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(996305)	--scale_obj_rectangle_001.m2
			-- about 14 x 14 x 2.8
		end
	end
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Rectangle001Gray=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Rectangle001Gray
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3088287)	--scale_obj_rectangle_001gray.m2
			-- about 14 x 14 x 2.8
		end
	end
		
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Rectangle002=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Rectangle002
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(996306)	--scale_obj_rectangle_002.m2	
			-- about 14 x 28 x 2.8
		end
	end
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Rectangle002Gray=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Rectangle002Gray
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3088288)	--scale_obj_rectangle_002gray.m2
			-- about 14 x 28 x 2.8
		end
	end		
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Rectangle003=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Rectangle003
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(996308)	--scale_obj_rectangle_003.m2
			-- about 14 x 56 x 2.8
		end
	end	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Rectangle003Gray=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Rectangle003Gray
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3088289)	--scale_obj_rectangle_003gray.m2
			-- about 14 x 56 x 2.8
		end
	end		

	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Ramp001=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Ramp001
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(996297)	--scale_obj_ramp_001
			-- about 14 x 14 x 7 (26.6 / 63.4 degrees)
			-- -y low edge, +y high edge
		end
		
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Ramp002=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Ramp002
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(996299)	--scale_obj_ramp_002
			-- about 14 x 14 x 14 (45/45 degrees)
		end		
		
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Ramp003=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Ramp003
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(996301)	--scale_obj_ramp_003
			-- about 14 x 42 x 14 (18.4 / 71.6 degrees)
		end		-- NOTE -- this is 1x3, not 1x4

		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Ramp004=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Ramp004
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(996302)	--scale_obj_ramp_004
			-- about 14 x 28 x 14 (26.6 / 63.4 degrees)
		end		

		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Ramp002Gray=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Ramp002Gray
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3088284)	--scale_obj_ramp_002gray
			-- about 14 x 14 x 14 (45/45 degrees)
		end				
		
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Ramp003Gray=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Ramp003Gray
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3088285)	--scale_obj_ramp_003gray
			-- about 14 x 42 x 14 (18.4 / 71.6 degrees)
		end				
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Ramp004Gray=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Ramp004Gray
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3088286)	--scale_obj_ramp_004gray
			-- about 14 x 28 x 14 (26.6 / 63.4 degrees)
		end		

	end	
	
	do
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Box001=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Box001
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(996266)	--scale_obj_box_001.m2
			-- about ? x ? x ?
		end	
		XPRACTICE.SOLIDS.Box003=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Box003
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(996270)	--scale_obj_box_003.m2
			-- about ? x ? x ?
		end			
	
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Box001Gray=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Box001Gray
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3088272)	--scale_obj_box_001gray.m2
			-- about ? x ? x ?
		end

		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Box002Gray=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Box002Gray
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3088273)	--scale_obj_box_002gray.m2
			-- about ? x ? x ?
		end
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Box003Gray=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Box003Gray
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3088274)	--scale_obj_box_003gray.m2
			-- about ? x ? x ?
		end
		
		
		local super=XPRACTICE.WoWObject
		XPRACTICE.SOLIDS.Box001Red=XPRACTICE.inheritsFrom(super)
		local class=XPRACTICE.SOLIDS.Box001Red
		function class:SetActorAppearanceViaOwner(actor)
			actor:SetModelByFileID(3088249)	--scale_obj_box_001red.m2
			-- about ? x ? x ?
		end
		
	end
	

	local super=XPRACTICE.WoWObject
	XPRACTICE.SOLIDS.Cylinder004=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SOLIDS.Cylinder004
	function class:SetActorAppearanceViaOwner(actor)
		actor:SetModelByFileID(996287)	--scale_obj_cylinder_004
		-- about ? x ? x ?
	end
	
	local super=XPRACTICE.WoWObject
	XPRACTICE.SOLIDS.Cylinder004Gray=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SOLIDS.Cylinder004Gray
	function class:SetActorAppearanceViaOwner(actor)
		actor:SetModelByFileID(3088346)	--scale_obj_cylinder_004gray
		-- about ? x ? x ?
	end
	
	local super=XPRACTICE.WoWObject
	XPRACTICE.SOLIDS.Cylinder004Red=XPRACTICE.inheritsFrom(super)
	local class=XPRACTICE.SOLIDS.Cylinder004Red
	function class:SetActorAppearanceViaOwner(actor)
		actor:SetModelByFileID(3088259)	--scale_obj_cylinder_004red
		-- about ? x ? x ?
	end
		
	
end