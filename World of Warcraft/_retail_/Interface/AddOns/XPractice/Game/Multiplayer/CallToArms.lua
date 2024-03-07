--TODO: do we need to copy this to multiplayerv2 too?

--TODO: something better than this table
	-- (also, this won't work once we have dynamically-loading scenarios)
local ctatable={}
ctatable["RYGELON"]={version="LEGACY",class=nil,name="Rygelon"}
ctatable["THEJAILER2"]={version="LEGACY",class=nil,name="The Jailer"}
ctatable["THEJAILER3"]={version="LEGACY",class=nil,name="The Jailer"}
ctatable["VOTIRAIDMAPS"]={version="2",class=XPRACTICE.VOTIRAIDMAPS.Scenario,name="Vault of the Incarnates"}
ctatable["PRIMALCOUNCIL"]={version="1",class=XPRACTICE.PRIMALCOUNCIL.Scenario,name="Primal Council"}
ctatable["RASZAGETH"]={version="1",class=XPRACTICE.RASZAGETH.Scenario,name="Raszageth"}
ctatable["ABERRUSRAIDMAPS"]={version="1",class=XPRACTICE.ABERRUSRAIDMAPS.Scenario,name="Aberrus, the Shadowed Crucible"}
ctatable["AMIRDRASSILRAIDMAPS"]={version="1",class=XPRACTICE.AMIRDRASSILRAIDMAPS.Scenario,name="Amirdrassil, the Dream's Hope"}
ctatable["SMOLDERON"]={version="1",class=XPRACTICE.SMOLDERON.Scenario,name="World in Flames"}

function XPRACTICE.MULTIPLAYER.SendCallToArms(text)
	XPRACTICE.MULTIPLAYERV2.Send(text)
end

function XPRACTICE.MULTIPLAYER.ProcessCallToArms(text,sender)
	--TODO NEXT: don't count offline players
	
	local cta,cmd,arg1,arg2=strsplit(" ",text)
	if(cta~="CALL_TO_ARMS")then return end
	if(cmd=="JOIN")then
		if(not XPRACTICE.MULTIPLAYERV2.IsRealOfficer(sender))then return end
		local scen=ctatable[arg1]
		if(scen)then
			if(scen.version=="LEGACY" or scen.class==nil)then
				XPRACTICE.MULTIPLAYERV2.Send("CALL_TO_ARMS UNABLE LEGACY")
				print(sender,"is using an outdated version of X Practice, time for them to update...")
				return
			end
		
			if(scen.version==arg2)then			
				if(not InCombatLockdown())then					
					if(not XPRACTICE.alreadyattemptederrorshutdown)then
						--TODO: check if we're already in the room	
						--TODO: make this work when multiboxing
						if(#XPRACTICE.games>0)then
							local game=XPRACTICE.games[1]
							if(game.currentscenarioclass==scen.class)then
								-- UNABLE ALREADY
								XPRACTICE.MULTIPLAYERV2.Send("CALL_TO_ARMS UNABLE ALREADY")
								return
							end
						end
						XPRACTICE.MULTIPLAYERV2.Send("CALL_TO_ARMS HEEDED")
						XPRACTICE_RaidBossEmote("Raid officer "..sender.." calls upon you to practice "..scen.name.." in X Practice!")
						C_Timer.After(1.5,function()XPRACTICE.MULTIPLAYER.ForceLoadScenario(scen.class)end)
					else
						XPRACTICE.MULTIPLAYERV2.Send("CALL_TO_ARMS UNABLE RELOAD")
						print(sender,"wants you to join them in X Practice, but you need to /reload the client first.")						
					end
				else
					XPRACTICE.MULTIPLAYERV2.Send("CALL_TO_ARMS UNABLE COMBAT")
					print(sender,"wants you to join them in X Practice, but you're in combat.")
				end
			else
				XPRACTICE.MULTIPLAYERV2.Send("CALL_TO_ARMS UNABLE VERSION")
				print(sender,"wants you to join them in X Practice, but your addon versions don't match.  Time to update!")
			end
		else
			XPRACTICE.MULTIPLAYERV2.Send("CALL_TO_ARMS UNABLE SCENARIONOTFOUND")
			print(sender,"wants you to join them in X Practice, but you don't have the scenario they're looking for.  Time to update!")
		end
	elseif(cmd=="UNABLE")then
		--TODO:
		if(arg1=="COMBAT")then
		elseif(arg1=="VERSION")then
		elseif(arg1=="SCENARIONOTFOUND")then
		elseif(arg1=="RELOAD")then
		elseif(arg1=="ALREADY")then
		elseif(arg1=="LEGACY")then
		else
		
		end
	elseif(cmd=="HEEDED")then
		--TODO:
	end
end

function XPRACTICE.MULTIPLAYER.ForceLoadScenario(class)
	if(not InCombatLockdown())then					
		if(not XPRACTICE.alreadyattemptederrorshutdown)then
			--TODO: check if we're already in the room	
			--TODO: make this work when multiboxing
			if(#XPRACTICE.games==0)then
				XPRACTICE.alreadyattemptederrorshutdown=false
				XPRACTICE.StartNewGame()
			end
			local game=XPRACTICE.games[1]
			if(game)then
				if(game.currentscenarioclass==class)then
					-- UNABLE ALREADY
					XPRACTICE.MULTIPLAYERV2.Send("CALL_TO_ARMS UNABLE ALREADY")
					return
				end
				game:LoadScenarioByClass(class)
			else
				print("You were about to load X Practice, but something went wrong.")
			end
		else
			XPRACTICE.MULTIPLAYERV2.Send("CALL_TO_ARMS UNABLE RELOAD")
			print("You were about to load X Practice, but you need to /reload the client first.")						
		end
	else
		XPRACTICE.MULTIPLAYERV2.Send("CALL_TO_ARMS UNABLE COMBAT")
		print("You were about to load X Practice, but you're in combat now.")
	end

end