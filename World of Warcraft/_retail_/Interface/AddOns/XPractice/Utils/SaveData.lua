XPRACTICE.GetSaveDataDefaults={}	-- child functions usually live in Scenario_Options

function XPRACTICE.ResetSaveData(tablename)
	if(tablename)then
		XPRACTICE_SAVEDATA[tablename]={}
		XPRACTICE.CheckSaveData(tablename)
	end
end

function XPRACTICE.CheckSaveData(tablename)
	if(tablename)then
		if(XPRACTICE_SAVEDATA[tablename]==nil)then
			XPRACTICE_SAVEDATA[tablename]={}
		end
		if(XPRACTICE.GetSaveDataDefaults[tablename])then
			local defaults=XPRACTICE.GetSaveDataDefaults[tablename]() 
			
			for k,v in pairs(defaults) do
				if(XPRACTICE_SAVEDATA[tablename][k]==nil)then
					XPRACTICE_SAVEDATA[tablename][k]=v
				end
			end
		end
	end
end
