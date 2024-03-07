function XPRACTICE_RaidBossEmote(message,duration,clear)
	-- center-screen raid notice is easy
	if(clear)then
		RaidNotice_Clear(RaidBossEmoteFrame)
	end
	--TODO: duration doesn't appear to have any effect
	RaidNotice_AddMessage(RaidBossEmoteFrame, message, ChatTypeInfo["RAID_BOSS_EMOTE"],duration)
	-- chat messages are trickier
	local i
	for i = 1, NUM_CHAT_WINDOWS do
		local chatframes = { GetChatWindowMessages(i) }			
		local v
		for _, v in ipairs(chatframes) do
			if v == "MONSTER_BOSS_EMOTE" then
				local frame = 'ChatFrame' .. i
				if _G[frame] then
					_G[frame]:AddMessage(message,1.0,1.0,0.0,GetChatTypeIndex(ChatTypeInfo["RAID_BOSS_EMOTE"].id))
				end
				break
			end
		end
	end
end