--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="tw",date="2024-04-09T08:24:50Z",numCharacters=20146,db={}}
local F

F = function() provider.db["克羅之刃"]={0,"暴脾气"} end F()
F = function() provider.db["暗影之月"]={2,"Chrysa","Starlord"} end F()

F = nil
RaiderIO.AddProvider(provider)
