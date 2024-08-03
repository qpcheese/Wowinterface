LFGMythicPlus = LibStub("AceAddon-3.0"):NewAddon("MythicPlusKeyAnnouncer", "AceConsole-3.0", "AceEvent-3.0")
local AceGUI = LibStub("AceGUI-3.0")

local currentLFGResults = ''

-- Initialize Addon
function LFGMythicPlus:OnInitialize()
	self:RegisterChatCommand("mpk", "ChatCommand")
	self:RegisterEvent("LFG_LIST_JOINED_GROUP")
	self:RegisterEvent("GROUP_LEFT")
end

-- Handle Chat Commands if non arg then show the UI
function LFGMythicPlus:ChatCommand()
	--if not currentLFGResults == '' then
	print(currentLFGResults)
	--end

	--    if input == "colors" then
	--        printColors()
	--    end
end

-- Handle LFG Join Group Event
function LFGMythicPlus:LFG_LIST_JOINED_GROUP(event, ...)
	local searchResultID = ...
	local msg = ''

	if searchResultID then
		--local id, activityID, name, comment, voiceChat, iLvl, honorLevel, age, numBNetFriends, numCharFriends, numGuildMates, isDelisted, author, members, autoinv = C_LFGList.GetSearchResultInfo(searchResultID)
		local searchResultInfo = C_LFGList.GetSearchResultInfo(searchResultID)
		if searchResultInfo then
			--Get the Activity Information
			--fullName, shortName, categoryID, groupID, itemLevel, filters, minLevel, maxPlayers, displayType, orderIndex, useHonorLevel = C_LFGList.GetActivityInfoTable(searchResultInfo.activityID)
			local activityInfo = C_LFGList.GetActivityInfoTable(searchResultInfo.activityID)
			msg = ("|cffFFC125 Mythic Plus Key Group:|r |cffDA70D6  %s:%s:%s |r"):format(activityInfo.fullName,
				tostring(searchResultInfo.name), tostring(searchResultInfo.comment))
			currentLFGResults = msg
		end
	end

	print(msg)
end

-- Handle Group Leave
function LFGMythicPlus:GROUP_LEFT(event, ...)
	currentLFGResults = ''
end

colors = {
	{
		title = 'LIGHTBLUE',
		color = 'cff00ccff',
	},
	{
		title = 'LIGHTRED',
		color = 'cffff6060',
	},
	{
		title = 'SPRINGGREEN',
		color = 'cff00FF7F',
	},
	{
		title = 'GREENYELLOW',
		color = 'cffADFF2F',
	},
	{
		title = 'BLUE',
		color = 'cff0000ff',
	},
	{
		title = 'PURPLE',
		color = 'cffDA70D6',
	},
	{
		title = 'GREEN',
		color = 'cff00ff00',
	},
	{
		title = 'RED',
		color = 'cffff0000',
	},
	{
		title = 'GOLD',
		color = 'cffffcc00',
	},
	{
		title = 'GOLD2',
		color = 'cffFFC125',
	},
	{
		title = 'GREY',
		color = 'cff888888',
	},
	{
		title = 'WHITE',
		color = 'cffffffff',
	},
	{
		title = 'SUBWHITE',
		color = 'cffbbbbbb',
	},
	{
		title = 'MAGENTA',
		color = 'cffff00ff',
	},
	{
		title = 'YELLOW',
		color = 'cffffff00',
	},
	{
		title = 'ORANGEY',
		color = 'cffFF4500',
	},
	{
		title = 'CHOCOLATE',
		color = 'cffCD661D',
	},
	{
		title = 'CYAN',
		color = 'cff00ffff',
	},
	{
		title = 'IVORY',
		color = 'cff8B8B83',
	},
	{
		title = 'LIGHTYELLOW',
		color = 'cffFFFFE0',
	},
	{
		title = 'OLIVEGREEN',
		color = 'cff71C671',
	},
	{
		title = 'TEAL',
		color = 'cff388E8E',
	},
	{
		title = 'PINK',
		color = 'cffC67171',
	},
	{
		title = 'HOTPINK',
		color = 'cffFF6EB4'
	},
}
function printColors()
	--print("\124cffFF0000This text is red\124r") --This is red color
	local startLine = '\124'
	local endLine = '\124r'
	for i = 1, table.getn(colors) do
		print(startLine .. colors[i].color .. colors[i].title .. endLine)
	end
	print("|cffFFC125 Mythic Plus Key Group:|r |cffDA70D6 KEYINFORMATION HERE|r")
end
