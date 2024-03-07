--TODO: figure out where to move this file; ideally associate with the Input folder
		-- but it currently inherits GameObject

XPRACTICE.ScenarioPlayerControls = XPRACTICE.inheritsFrom(XPRACTICE.GameObject)

--TODO: move scenario back to game?  it needs to keep track of multiple environments
function XPRACTICE.ScenarioPlayerControls:Setup(environment,scenario)
	XPRACTICE.GameObject.Setup(self,environment,scenario)
	self.scenario=scenario	
end

-- TODO: base SPC shouldn't have selectionrectangle, as charactermode inherits from it
	-- need new SPC_RTSMode class
function XPRACTICE.ScenarioPlayerControls:CreateAssociatedObjects()	
-- dubious
	-- local selection=XPRACTICE.SelectionRectangle.new()
	-- --TODO: better references than going through game
	-- selection:Setup(self.environment.game.environment_hud,self.environment.game.environment_gameplay)
end

--used by child objects such as CharacterMode
function XPRACTICE.ScenarioPlayerControls:SetPlayer(player)
	self.player=player
end


function XPRACTICE.ScenarioPlayerControls:GetPlayerInput(elapsed)
	
	local environment_gameplay=self.environment.game.environment_gameplay
	
	if(self.environment.game.keys.rmouse.pressed)then
		local selectedmobiles={}		
		for i=1,#environment_gameplay.mobiles,1 do
			local obj=environment_gameplay.mobiles[i]
			--TODO: obj:IsPlayerControlled()
			if(obj.selected and obj.faction==XPRACTICE.Factions.PLAYER)then
				tinsert(selectedmobiles,obj)
			end
		end
		if(#selectedmobiles>0)then				
			local globalx,globaly=GetCursorPosition()
			--TODO: rename vars
			--cursorx,cursory store mouse/window coordinates
			local cursorx,cursory=environment_gameplay:MouseCoordinatesToWindowCoordinates(globalx,globaly)
			local targetlocation={}
			targetlocation.x,targetlocation.y=environment_gameplay:WindowCoordinatesToCursorPosition(cursorx,cursory)
			--print("Target location:",targetlocation.x,targetlocation.y)

			
			--TODO: get "x3" and "y3" using same math as in SelectionRectangle
			-- it's probably not the same as targetlocation.x/y as we're looking at screen coordinates here
			

			local targetobjs=environment_gameplay:GetObjectsAtRectangleWindowCoordinates(environment_gameplay.mobiles,cursorx-1,cursory-1,3,3)
			
			local target=environment_gameplay:GetFirstAttackableTarget(targetobjs)	
			
			if(target) then		
			--if(false)then
				--TODO: move selectedmobiles check to top
				
				for i=1,#selectedmobiles,1 do					
					local obj=selectedmobiles[i]
					obj:TargetCombatModule(target.combat)
				end
			
			else
				
				--TODO: move selectedmobiles check to top
				-- move to location
			
				local xcenter,ycenter=0,0
				for i=1,#selectedmobiles,1 do
					local obj=selectedmobiles[i]
					xcenter=xcenter+obj.x
					ycenter=ycenter+obj.y			
				end
				xcenter=xcenter/#selectedmobiles
				ycenter=ycenter/#selectedmobiles
				for i=1,#selectedmobiles,1 do
					local obj=selectedmobiles[i]
					obj.targetlocation={}
					obj.targetlocation.x=(obj.x-xcenter)+targetlocation.x
					obj.targetlocation.y=(obj.y-ycenter)+targetlocation.y
				end
				
			end
		end -- #selectedmobiles>0
	end	--keys.rmouse.pressed

end

function XPRACTICE.ScenarioPlayerControls:FilterSelectableObjectList(player,objs)
	return objs
end




function XPRACTICE.ScenarioPlayerControls:CreateSpellButtonsFromSelectedUnits()
	for k,v in pairs(XPRACTICE.Factions) do
		v.selectedunitspells={}
	end

	--TODO: this will break once we move scenarioplayercontrols out of environment_gameplay (easily fixed though)
	local env=self.environment.game.environment_gameplay
	local spells=env.mobiles
	local spells={}
	for i=1,#env.mobiles,1 do
		if(env.mobiles[i].selected)then
			env.mobiles[i].combat:AddAllSpellsToTable(env.mobiles[i].faction.selectedunitspells)
			print("Selected spells:",env.mobiles[i].faction.selectedunitspells,#env.mobiles[i].faction.selectedunitspells)
		end
	end
	XPRACTICE.RemoveDuplicates(spells)

	--TODO: apparently all the step-1s in our for loops can be omitted. might want to fix that up sometime

	self.environment.game.spellbuttoncontroller:ClearAllSpellButtons()
	for k,faction in pairs(XPRACTICE.Factions) do		
		local spells=faction.selectedunitspells
		--print("Table: ",spells,#spells)
		if(#spells>0)then
			self.environment.game.spellbuttoncontroller:AddSpellButtonRowByFaction(spells,faction)
		end
		--print(faction.selectedunitspells)
	end
end