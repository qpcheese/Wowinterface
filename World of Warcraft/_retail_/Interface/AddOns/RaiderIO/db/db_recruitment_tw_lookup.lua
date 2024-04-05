--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="tw",date="2024-04-04T08:31:28Z",numCharacters=20488,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 6
F = function() provider.lookup[1] = "\169\22;\16\169\6" end F()

F = nil
RaiderIO.AddProvider(provider)
