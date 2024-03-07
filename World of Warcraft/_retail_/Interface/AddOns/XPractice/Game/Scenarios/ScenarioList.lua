-- global static:
if(not XPRACTICE.ScenarioList)then
	XPRACTICE.ScenarioList={}		
end
function XPRACTICE.ScenarioList.RegisterScenario(scenarioclass,name,description,category)
	category=category or "SCENARIO"
	tinsert(XPRACTICE.ScenarioList,{class=scenarioclass,name=name,description=description,category=category})
end