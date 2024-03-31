--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="tw",date="2024-03-31T08:28:07Z",numCharacters=20998,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 2
F = function() provider.lookup[1] = "\169\22" end F()

F = nil
RaiderIO.AddProvider(provider)
