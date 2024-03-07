local addonName, _EchoRaidTools = ...;
local _ExposedInternal = _EchoRaidTools:GetModule("ExposedInternal")

function _ExposedInternal:ExposeInspect()
	local libOpenRaid = LibStub:GetLibrary("LibOpenRaid-1.0");

	function _EchoRaidTools.fakeInternal:GetSpecInfo(unit)
		return tDClone(libOpenRaid.GetUnitInfo(unit));
	end

	local tankSpecs = {
		[250] = true,
		[581] = true,
		[104] = true,
		[268] = true,
		[66] = true,
		[73] = true,
	};

	local meleeHealers = {
		[270] = true,
		[65] = true,
	};

	local rangeHealers = {
		[105] = true,
		[256] = true,
		[257] = true,
		[264] = true,
		[1468] = true,
	};

	local meleeSpecs = {
		[251] = true,
		[252] = true,
		[577] = true,
		[103] = true,
		[255] = true,
		[269] = true,
		[70] = true,
		[259] = true,
		[260] = true,
		[261] = true,
		[263] = true,
		[71] = true,
		[72] = true,
	};

	local rangeSpecs = {
		[102] = true,
		[253] = true,
		[254] = true,
		[62] = true,
		[63] = true,
		[64] = true,
		[258] = true,
		[262] = true,
		[265] = true,
		[266] = true,
		[267] = true,
		[1467] = true,
	};

	function _EchoRaidTools.fakeInternal:IsMelee(unit,includeHealers)
		local specInfo = unit and EchoInternal:GetSpecInfo(unit);
		if(specInfo)then
			return meleeSpecs[specInfo.specId] or (includeHealers and meleeHealers[specInfo.specId]);
		end
	end

	function _EchoRaidTools.fakeInternal:IsRanged(unit,includeHealers)
		local specInfo = unit and EchoInternal:GetSpecInfo(unit);
		if(specInfo)then
			return rangeSpecs[specInfo.specId] or (includeHealers and rangeHealers[specInfo.specId]);
		end
	end

	function _EchoRaidTools.fakeInternal:IsHealer(unit)
		local specInfo = unit and EchoInternal:GetSpecInfo(unit);
		return specInfo and (meleeHealers[specInfo.specId] or rangeHealers[specInfo.specId]);
	end

	function _EchoRaidTools.fakeInternal:IsTank(unit)
		local specInfo = unit and EchoInternal:GetSpecInfo(unit);
		return specInfo and tankSpecs[specInfo.specId];
	end
end