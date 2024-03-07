do
	local i=0
	XPRACTICE.CombatEventType={}
	i=i+1;XPRACTICE.CombatEventType.START_CASTING=i
	i=i+1;XPRACTICE.CombatEventType.COMPLETE_CASTING=i
	i=i+1;XPRACTICE.CombatEventType.HIT_BY_ATTACK=i
	i=i+1;XPRACTICE.CombatEventType.AURA_APPLIED=i
	--print("AURA_APPLIED:",XPRACTICE.CombatEventType.AURA_APPLIED)
	i=i+1;XPRACTICE.CombatEventType.AURA_REMOVED=i
	i=i+1;XPRACTICE.CombatEventType.MOBILE_REMOVED=i	
	i=i+1;XPRACTICE.CombatEventType.WAYPOINT_REACHED=i
	i=i+1;XPRACTICE.CombatEventType.DANCE_APPLIED=i
	i=i+1;XPRACTICE.CombatEventType.CHOREOGRAPHY_STATUS=i
end
