
RCLootCouncilDB = {
	["global"] = {
		["log"] = {
			"<01:30:43> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [1]
			"<01:30:48> <DEBUG>		GetPlayersGuildRank()", -- [2]
			"<01:30:48> <DEBUG>		GetPlayersGuildRank()", -- [3]
			"<01:30:48> <DEBUG>		Found Guild Rank: Raider", -- [4]
			"<01:31:28> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [5]
			"<01:31:28> <Comm>		^1^SplayerInfoRequest^T^t^^	PARTY	Buffdotcom-Ragnaros", -- [6]
			"<01:31:28> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	PARTY	Buffdotcom-Ragnaros", -- [7]
			"<01:31:28> <WARNING>		Non-ML:	Buffdotcom-Ragnaros	sent Mldb!", -- [8]
			"<01:31:30> <DEBUG>		GetML()", -- [9]
			"<01:31:30> <DEBUG>		Resetting council as we have a new ML!", -- [10]
			"<01:31:30> <INFO>		MasterLooter	Buffdotcom-Ragnaros	LootMethod	personalloot", -- [11]
			"<01:31:30> <Comm>		^1^Scouncil^T^N1^T^S3682-0B2BF87A^B^t^t^^	PARTY	Buffdotcom-Ragnaros", -- [12]
			"<01:31:30> <DEBUG>		isCouncil	false", -- [13]
			"<01:31:45> <DEBUG>		Timer MLdb_check passed", -- [14]
			"<01:31:45> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	PARTY	Buffdotcom-Ragnaros", -- [15]
			"<01:31:45> <INFO>		OnMLDBReceived", -- [16]
			"<01:33:08> <DEBUG>		Event:	GROUP_LEFT	1	Party-3682-1-0000386866DD", -- [17]
			"<01:33:08> <DEBUG>		GetML()", -- [18]
			"<01:33:08> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [19]
			"<01:33:10> <DEBUG>		GetML()", -- [20]
			"<01:33:10> <Data.Player>		CreatePlayer	Player-1615-0A623298", -- [21]
			"<01:33:10> <DEBUG>		Resetting council as we have a new ML!", -- [22]
			"<01:33:10> <INFO>		MasterLooter	варикафура-Ревущийфьорд	LootMethod	personalloot", -- [23]
			"<01:33:25> <DEBUG>		Timer MLdb_check passed", -- [24]
			"<01:34:43> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [25]
			"<01:34:43> <INFO>		UpdatePlayersData()", -- [26]
			"<01:34:44> <DEBUG>		GetML()", -- [27]
			"<01:35:17> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Papee-Ragnaros", -- [28]
			"<01:35:17> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [29]
			"<01:35:57> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [30]
			"<01:35:57> <INFO>		UpdatePlayersData()", -- [31]
			"<01:35:59> <DEBUG>		GetML()", -- [32]
			"<01:35:59> <Data.Player>		CreatePlayer	Player-1305-0AD9E380", -- [33]
			"<01:43:21> <DEBUG>		Event:	ENCOUNTER_START	1043	Grand Vizier Ertan	8	5", -- [34]
			"<01:43:21> <INFO>		UpdatePlayersData()", -- [35]
			"<01:45:41> <DEBUG>		Event:	ENCOUNTER_END	1043	Grand Vizier Ertan	8	5	1", -- [36]
			"<01:51:50> <DEBUG>		Event:	ENCOUNTER_START	1041	Altairus	8	5", -- [37]
			"<01:51:50> <INFO>		UpdatePlayersData()", -- [38]
			"<01:54:38> <DEBUG>		Event:	ENCOUNTER_END	1041	Altairus	8	5	1", -- [39]
			"<01:59:23> <DEBUG>		Event:	ENCOUNTER_START	1042	Asaad	8	5", -- [40]
			"<01:59:23> <INFO>		UpdatePlayersData()", -- [41]
			"<02:03:16> <DEBUG>		Event:	ENCOUNTER_END	1042	Asaad	8	5	1", -- [42]
			"<02:03:19> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	1042	133362	|cffa335ee|Hitem:133362::::::::70:62::16:7:9331:6652:9223:9220:9144:3323:8767:1:28:1279:::::|h[Billowing Skydrape]|h|r	1	Tambra-Kazzak	DEMONHUNTER", -- [43]
			"<02:03:19> <Comm>		^1^Sl^T^N1^S389539^t^^	PARTY	Tambra-Kazzak", -- [44]
			"<02:03:22> <Comm>		^1^Stradable^T^N1^S|cffa335ee|Hitem:133362::::::::70:581::16:7:9331:6652:9223:9220:9144:3323:8767:1:28:1279:::::|h[Billowing~`Skydrape]|h|r^N2^S389539^t^^	PARTY	Tambra-Kazzak", -- [45]
			"<02:03:34> <DEBUG>		Event:	LOOT_READY	true", -- [46]
			"<02:03:34> <DEBUG>		Ignoring	nil	as it's a currency", -- [47]
			"<02:03:34> <DEBUG>		Adding to self.lootSlotInfo	2	|cffa335ee|Hitem:133250::::::::70:62::33:7:9331:6652:9223:9221:9144:3323:8767:1:28:1279:::::|h[Leggings of Iridescent Clouds]|h|r	4	1	GameObject-0-4252-657-24651-389539-00004062C5	1", -- [48]
			"<02:03:34> <DEBUG>		OnLootSlotCleared()	2	|cffa335ee|Hitem:133250::::::::70:62::33:7:9331:6652:9223:9221:9144:3323:8767:1:28:1279:::::|h[Leggings of Iridescent Clouds]|h|r	4", -- [49]
			"<02:03:34> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	1042	133250	|cffa335ee|Hitem:133250::::::::70:62::33:7:9331:6652:9223:9221:9144:3323:8767:1:28:1279:::::|h[Leggings of Iridescent Clouds]|h|r	1	Qpfromage	MAGE", -- [50]
			"<02:03:34> <DEBUG>		Event:	LOOT_CLOSED", -- [51]
			"<02:03:34> <DEBUG>		Event:	LOOT_CLOSED", -- [52]
			"<02:03:34> <Comm>		^1^Sl^T^N1^S389539^t^^	PARTY	Qpfromage-Ragnaros", -- [53]
			"<02:03:34> <Comm>		^1^Sl^T^N1^S389539^t^^	PARTY	Qpfromage-Ragnaros", -- [54]
			"<02:03:36> <DEBUG>		Storage:New	|cffa335ee|Hitem:133250::::::::70:62::33:7:9331:6652:9223:9221:9144:3323:8767:1:28:1279:::::|h[Leggings of Iridescent Clouds]|h|r	temp", -- [55]
			"<02:03:36> <DEBUG>		Storage: searching for item:	||cffa335ee||Hitem:133250::::::::70:62::33:7:9331:6652:9223:9221:9144:3323:8767:1:28:1279:::::||h[Leggings of Iridescent Clouds]||h||r	5", -- [56]
			"<02:03:36> <DEBUG>		Found item at	3	23", -- [57]
			"<02:03:37> <DEBUG>		Storage: searching for item:	||cffa335ee||Hitem:133250::::::::70:62::33:7:9331:6652:9223:9221:9144:3323:8767:1:28:1279:::::||h[Leggings of Iridescent Clouds]||h||r	5", -- [58]
			"<02:03:37> <DEBUG>		Found item at	3	23", -- [59]
			"<02:03:37> <Comm>		^1^Stradable^T^N1^S|cffa335ee|Hitem:133250::::::::70:62::33:7:9331:6652:9223:9221:9144:3323:8767:1:28:1279:::::|h[Leggings~`of~`Iridescent~`Clouds]|h|r^N2^S389539^t^^	PARTY	Qpfromage-Ragnaros", -- [60]
			"<02:03:50> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [61]
			"<02:03:50> <INFO>		UpdatePlayersData()", -- [62]
			"<02:03:52> <DEBUG>		GetML()", -- [63]
			"<02:04:44> <DEBUG>		Event:	GROUP_LEFT	1	Party-1615-1-000038686A76", -- [64]
			"<02:04:44> <DEBUG>		GetML()", -- [65]
			"07/26/23", -- [66]
			"<02:31:57> <INFO>		Logged In", -- [67]
			"<02:31:57> <INFO>[ML]		Init", -- [68]
			"<02:31:57> <INFO>		RCLootCouncil	TradeUI enabled", -- [69]
			"<02:32:03> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [70]
			"<02:32:03> <DEBUG>		ActivateSkin	bfa", -- [71]
			"<02:32:06> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [72]
			"<02:32:06> <INFO>		UpdatePlayersData()", -- [73]
			"<02:32:06> <INFO>		Player relog...", -- [74]
			"<02:32:07> <DEBUG>		GetPlayersGuildRank()", -- [75]
			"<02:32:07> <DEBUG>		Found Guild Rank: Raider", -- [76]
			"<02:32:10> <DEBUG>		GetML()", -- [77]
			"<02:32:10> <DEBUG>		Storage: searching for item:	||cffa335ee||Hitem:133250::::::::70:62::33:7:9331:6652:9223:9221:9144:3323:8767:1:28:1279:::::||h[Leggings of Iridescent Clouds]||h||r	5", -- [78]
			"<02:32:10> <DEBUG>		Found item at	3	23", -- [79]
			"<02:32:10> <DEBUG>		Storage: searching for item:	||cffa335ee||Hitem:133250::::::::70:62::33:7:9331:6652:9223:9221:9144:3323:8767:1:28:1279:::::||h[Leggings of Iridescent Clouds]||h||r	5", -- [80]
			"<02:32:10> <DEBUG>		Found item at	3	23", -- [81]
			"<02:32:10> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [82]
			"07/26/23", -- [83]
			"<18:13:02> <INFO>		Logged In", -- [84]
			"<18:13:02> <INFO>[ML]		Init", -- [85]
			"<18:13:02> <INFO>		RCLootCouncil	TradeUI enabled", -- [86]
			"<18:13:09> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [87]
			"<18:13:09> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [88]
			"<18:13:09> <DEBUG>		ActivateSkin	bfa", -- [89]
			"<18:13:11> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [90]
			"<18:13:11> <INFO>		UpdatePlayersData()", -- [91]
			"<18:13:11> <INFO>		Player relog...", -- [92]
			"<18:13:12> <DEBUG>		GetPlayersGuildRank()", -- [93]
			"<18:13:12> <DEBUG>		GetPlayersGuildRank()", -- [94]
			"<18:13:12> <DEBUG>		Found Guild Rank: Raider", -- [95]
			"<18:13:15> <DEBUG>		GetML()", -- [96]
			"<18:13:15> <WARNING>		ItemStorage, db item no link or timeout	|cffa335ee|Hitem:133250::::::::70:62::33:7:9331:6652:9223:9221:9144:3323:8767:1:28:1279:::::|h[Leggings of Iridescent Clouds]|h|r	12660	1690331530	temp", -- [97]
			"<18:13:15> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [98]
			"<18:13:15> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zeroe-Ragnaros", -- [99]
			"<18:32:13> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Nèlliel-Ragnaros", -- [100]
			"<18:34:59> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Infernodh-Ragnaros", -- [101]
			"<18:38:22> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Infernodh-Ragnaros", -- [102]
			"<18:39:49> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Nèlliel-Ragnaros", -- [103]
			"07/26/23", -- [104]
			"<20:21:52> <INFO>		Logged In", -- [105]
			"<20:21:52> <INFO>[ML]		Init", -- [106]
			"<20:21:52> <INFO>		RCLootCouncil	TradeUI enabled", -- [107]
			"<20:21:59> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [108]
			"<20:21:59> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [109]
			"<20:21:59> <DEBUG>		ActivateSkin	bfa", -- [110]
			"<20:22:02> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [111]
			"<20:22:02> <INFO>		UpdatePlayersData()", -- [112]
			"<20:22:02> <INFO>		Player relog...", -- [113]
			"<20:22:04> <DEBUG>		GetPlayersGuildRank()", -- [114]
			"<20:22:04> <DEBUG>		GetPlayersGuildRank()", -- [115]
			"<20:22:04> <DEBUG>		Found Guild Rank: Raider", -- [116]
			"<20:22:07> <DEBUG>		GetML()", -- [117]
			"<20:22:07> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [118]
			"<20:22:07> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mordekaisar-Ragnaros", -- [119]
			"<20:22:20> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [120]
			"<20:22:22> <DEBUG>		GetML()", -- [121]
			"<20:22:22> <Data.Player>		CreatePlayer	Player-1390-0AF63C1B", -- [122]
			"<20:22:22> <Data.Player>		CreatePlayer	Player-1403-0A69ADE2", -- [123]
			"<20:22:22> <Data.Player>		CreatePlayer	Player-1621-0B09C7B6", -- [124]
			"<20:22:22> <Data.Player>		CreatePlayer	Player-1390-08460BF8", -- [125]
			"<20:22:22> <Data.Player>		CreatePlayer	Player-1305-0C8060FA", -- [126]
			"<20:22:22> <Data.Player>		CreatePlayer	Player-1305-06FCD3A0", -- [127]
			"<20:22:22> <Data.Player>		CreatePlayer	Player-1084-0AA3352A", -- [128]
			"<20:22:22> <Data.Player>		CreatePlayer	Player-1390-086A105F", -- [129]
			"<20:22:22> <DEBUG>		Resetting council as we have a new ML!", -- [130]
			"<20:22:22> <INFO>		MasterLooter	Sûnder-Hyjal	LootMethod	personalloot", -- [131]
			"<20:22:37> <DEBUG>		Timer MLdb_check passed", -- [132]
			"<20:22:37> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^SMLdb_request^t^^	RAID	Qpfromage-Ragnaros", -- [133]
			"<20:22:37> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^Scouncil_request^t^^	RAID	Qpfromage-Ragnaros", -- [134]
			"<20:22:37> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^SMLdb_request^t^^	RAID	Brussewayn-Kazzak", -- [135]
			"<20:22:37> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^Scouncil_request^t^^	RAID	Brussewayn-Kazzak", -- [136]
			"<20:22:58> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^SMLdb_request^t^^	RAID	Aeranoss-MarécagedeZangar", -- [137]
			"<20:24:43> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Nèlliel-Ragnaros", -- [138]
			"<20:24:44> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mordekaisar-Ragnaros", -- [139]
			"<20:28:12> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [140]
			"<20:28:12> <INFO>		UpdatePlayersData()", -- [141]
			"<20:28:14> <DEBUG>		GetML()", -- [142]
			"<20:28:14> <Data.Player>		CreatePlayer	Player-3674-05AEAA2B", -- [143]
			"<20:28:14> <Data.Player>		CreatePlayer	Player-1621-0854C3FC", -- [144]
			"<20:28:14> <Data.Player>		CreatePlayer	Player-1127-0A4CA8A2", -- [145]
			"<20:28:14> <Data.Player>		CreatePlayer	Player-3674-0A8089CA", -- [146]
			"<20:28:14> <Data.Player>		CreatePlayer	Player-1303-0592D932", -- [147]
			"<20:28:14> <Data.Player>		CreatePlayer	Player-1390-09E57D63", -- [148]
			"<20:28:30> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Aberrus, the Shadowed Crucible (Mythic)	552689	0	0", -- [149]
			"<20:28:31> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [150]
			"<20:28:31> <INFO>		UpdatePlayersData()", -- [151]
			"<20:28:32> <DEBUG>		GetML()", -- [152]
			"<20:28:53> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [153]
			"<20:28:53> <INFO>		UpdatePlayersData()", -- [154]
			"<20:28:54> <DEBUG>		GetML()", -- [155]
			"<20:29:36> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Altdani-Ragnaros", -- [156]
			"<20:29:36> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mordekaisar-Ragnaros", -- [157]
			"<20:30:43> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Aberrus, the Shadowed Crucible (Mythic)	552556	0	0", -- [158]
			"<20:30:43> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [159]
			"<20:30:43> <INFO>		UpdatePlayersData()", -- [160]
			"<20:30:45> <DEBUG>		GetML()", -- [161]
			"<20:30:52> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [162]
			"<20:30:52> <INFO>		UpdatePlayersData()", -- [163]
			"<20:30:53> <DEBUG>		GetML()", -- [164]
			"<20:33:56> <Comm>		^1^SpI^T^N1^SDAMAGER^N2^STrial^N4^N0^N5^N445.125^N6^N254^t^^	RAID	Amenía-TarrenMill", -- [165]
			"<20:33:56> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^Sreconnect^t^^	RAID	Amenía-TarrenMill", -- [166]
			"<20:34:08> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^SMLdb_request^t^^	RAID	Amenía-TarrenMill", -- [167]
			"<20:34:08> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^Scouncil_request^t^^	RAID	Amenía-TarrenMill", -- [168]
			"<20:35:38> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Aberrus, the Shadowed Crucible (Mythic)	552261	0	0", -- [169]
			"<20:35:38> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [170]
			"<20:35:38> <INFO>		UpdatePlayersData()", -- [171]
			"<20:35:40> <DEBUG>		GetML()", -- [172]
			"<20:35:50> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [173]
			"<20:35:50> <INFO>		UpdatePlayersData()", -- [174]
			"<20:35:51> <DEBUG>		GetML()", -- [175]
			"<20:35:59> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [176]
			"<20:36:01> <DEBUG>		GetML()", -- [177]
			"<20:36:01> <DEBUG>		Resetting council as we have a new ML!", -- [178]
			"<20:36:01> <INFO>		MasterLooter	Retardinxx-Draenor	LootMethod	personalloot", -- [179]
			"<20:36:01> <Comm>		^1^SplayerInfoRequest^T^t^^	RAID	Retardinxx-Draenor", -- [180]
			"<20:36:01> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	RAID	Retardinxx-Draenor", -- [181]
			"<20:36:01> <INFO>		OnMLDBReceived", -- [182]
			"<20:36:01> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SDAMAGER^N4^SRaider^N6^N0^N7^N446.25^N8^N62^t^^	RAID	Qpfromage-Ragnaros", -- [183]
			"<20:36:01> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SHEALER^N4^SRoster^N6^N0^N7^N444.5^N8^N1468^t^^	RAID	Valfor-Dalaran", -- [184]
			"<20:36:01> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^STANK^N4^SSans~`guilde^N6^N0^N7^N443.75^N8^N73^t^^	RAID	Karno-Hyjal", -- [185]
			"<20:36:01> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SDAMAGER^N4^STrial^N6^N0^N7^N445.125^N8^N254^t^^	RAID	Amenía-TarrenMill", -- [186]
			"<20:36:01> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SHEALER^N4^SRôle-Historique^N6^N0^N7^N442.75^N8^N65^t^^	RAID	Aeranoss-MarécagedeZangar", -- [187]
			"<20:36:01> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SDAMAGER^N4^SRoster^N6^N0^N7^N444.125^N8^N263^t^^	RAID	Linte-Hyjal", -- [188]
			"<20:36:01> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SDAMAGER^N4^SMember^N5^B^N6^N55^N7^N444.75^N8^N267^t^^	RAID	Brussewayn-Kazzak", -- [189]
			"<20:36:03> <Comm>		^1^Scouncil^T^N1^T^S1403-0A69ADE2^B^t^t^^	RAID	Retardinxx-Draenor", -- [190]
			"<20:36:03> <DEBUG>		isCouncil	false", -- [191]
			"<20:36:16> <Comm>		^1^SStartHandleLoot^T^t^^	RAID	Retardinxx-Draenor", -- [192]
			"<20:36:16> <DEBUG>		Timer MLdb_check passed", -- [193]
			"<20:38:32> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SMLdb_request^t^^	RAID	Tomorrowland-Drak'thul", -- [194]
			"<20:38:32> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^Scouncil_request^t^^	RAID	Tomorrowland-Drak'thul", -- [195]
			"<20:38:32> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	RAID	Retardinxx-Draenor", -- [196]
			"<20:38:32> <INFO>		OnMLDBReceived", -- [197]
			"<20:38:32> <Comm>		^1^Scouncil^T^N1^T^S1403-0A69ADE2^B^t^t^^	RAID	Retardinxx-Draenor", -- [198]
			"<20:38:32> <DEBUG>		isCouncil	false", -- [199]
			"<20:45:21> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Aberrus, the Shadowed Crucible (Mythic)	551678	0	0", -- [200]
			"<20:45:21> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [201]
			"<20:45:21> <INFO>		UpdatePlayersData()", -- [202]
			"<20:45:23> <DEBUG>		GetML()", -- [203]
			"<20:45:23> <Data.Player>		CreatePlayer	Player-1390-0C8502ED", -- [204]
			"<20:45:23> <Data.Player>		CreatePlayer	Player-1092-080D1C5C", -- [205]
			"<20:45:29> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [206]
			"<20:45:29> <INFO>		UpdatePlayersData()", -- [207]
			"<20:45:30> <DEBUG>		GetML()", -- [208]
			"<20:46:48> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Aberrus, the Shadowed Crucible (Mythic)	551591	0	0", -- [209]
			"<20:46:48> <Comm>		^1^SStopHandleLoot^T^t^^	RAID	Retardinxx-Draenor", -- [210]
			"<20:46:48> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [211]
			"<20:46:48> <INFO>		UpdatePlayersData()", -- [212]
			"<20:46:49> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [213]
			"<20:46:50> <DEBUG>		GetML()", -- [214]
			"<20:46:50> <DEBUG>		Resetting council as we have a new ML!", -- [215]
			"<20:46:50> <INFO>		MasterLooter	Sûnder-Hyjal	LootMethod	personalloot", -- [216]
			"<20:46:51> <DEBUG>		GetML()", -- [217]
			"<20:47:05> <DEBUG>		Timer MLdb_check passed", -- [218]
			"<20:48:33> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^SMLdb_request^t^^	RAID	Dwafzik-TarrenMill", -- [219]
			"<20:48:33> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^Scouncil_request^t^^	RAID	Dwafzik-TarrenMill", -- [220]
			"<20:48:43> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Linte-Hyjal", -- [221]
			"<20:49:52> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	0	190315	|cff0070dd|Hitem:190315::::::::70:62:::::::::|h[Rousing Earth]|h|r	3	Xacyum-TwistingNether	HUNTER", -- [222]
			"<20:51:08> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Valfor-Dalaran", -- [223]
			"<20:51:08> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Valfor-Dalaran", -- [224]
			"<20:51:17> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [225]
			"<20:51:17> <INFO>		UpdatePlayersData()", -- [226]
			"<20:51:17> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [227]
			"<20:51:22> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Linte-Hyjal", -- [228]
			"<20:51:22> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Linte-Hyjal", -- [229]
			"<20:57:41> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Zerow-Ragnaros", -- [230]
			"<20:58:59> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Dangerss-Ragnaros", -- [231]
			"<21:01:51> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [232]
			"<21:01:51> <INFO>		UpdatePlayersData()", -- [233]
			"<21:02:54> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Jfree-Ragnaros", -- [234]
			"<21:03:31> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [235]
			"<21:04:09> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Mordekaisar-Ragnaros", -- [236]
			"<21:06:55> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [237]
			"<21:06:55> <INFO>		UpdatePlayersData()", -- [238]
			"<21:09:06> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [239]
			"<21:10:22> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Mordekaisar-Ragnaros", -- [240]
			"<21:10:22> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [241]
			"<21:11:01> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [242]
			"<21:11:01> <INFO>		UpdatePlayersData()", -- [243]
			"<21:14:27> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [244]
			"<21:19:25> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [245]
			"<21:19:25> <INFO>		UpdatePlayersData()", -- [246]
			"<21:22:17> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [247]
			"<21:24:34> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Altdani-Ragnaros", -- [248]
			"<21:24:34> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [249]
			"<21:25:07> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [250]
			"<21:25:07> <INFO>		UpdatePlayersData()", -- [251]
			"<21:26:02> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [252]
			"<21:27:05> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [253]
			"<21:27:05> <INFO>		UpdatePlayersData()", -- [254]
			"<21:30:39> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [255]
			"<21:32:26> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Infernodh-Ragnaros", -- [256]
			"<21:32:27> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [257]
			"<21:33:02> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [258]
			"<21:33:02> <INFO>		UpdatePlayersData()", -- [259]
			"<21:36:06> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [260]
			"<21:38:18> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [261]
			"<21:38:18> <INFO>		UpdatePlayersData()", -- [262]
			"<21:41:11> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [263]
			"<21:44:07> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [264]
			"<21:44:07> <INFO>		UpdatePlayersData()", -- [265]
			"<21:46:59> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [266]
			"<21:48:14> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [267]
			"<21:48:14> <INFO>		UpdatePlayersData()", -- [268]
			"<21:49:09> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Jfree-Ragnaros", -- [269]
			"<21:50:25> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [270]
			"<21:51:34> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [271]
			"<21:51:34> <INFO>		UpdatePlayersData()", -- [272]
			"<21:54:35> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [273]
			"<21:55:48> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [274]
			"<21:55:48> <INFO>		UpdatePlayersData()", -- [275]
			"<21:57:56> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Voljinson-Ragnaros", -- [276]
			"<21:57:57> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [277]
			"<21:58:57> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [278]
			"<22:01:05> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [279]
			"<22:01:05> <INFO>		UpdatePlayersData()", -- [280]
			"<22:05:38> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [281]
			"<22:07:32> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [282]
			"<22:07:32> <INFO>		UpdatePlayersData()", -- [283]
			"<22:08:31> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [284]
			"<22:09:55> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [285]
			"<22:09:55> <INFO>		UpdatePlayersData()", -- [286]
			"<22:10:11> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Papee-Ragnaros", -- [287]
			"<22:10:11> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [288]
			"<22:14:46> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [289]
			"<22:17:00> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [290]
			"<22:17:00> <INFO>		UpdatePlayersData()", -- [291]
			"<22:20:02> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [292]
			"<22:20:30> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Rejuvsham-Ragnaros", -- [293]
			"<22:20:30> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [294]
			"<22:24:02> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [295]
			"<22:24:04> <DEBUG>		GetML()", -- [296]
			"<22:24:04> <Data.Player>		CreatePlayer	Player-1305-0AE8B190", -- [297]
			"<22:24:04> <Data.Player>		CreatePlayer	Player-3391-0C636F3D", -- [298]
			"<22:24:04> <Data.Player>		CreatePlayer	Player-1084-0A9DA3CC", -- [299]
			"<22:24:04> <DEBUG>		Resetting council as we have a new ML!", -- [300]
			"<22:24:04> <INFO>		MasterLooter	Retardinxx-Draenor	LootMethod	personalloot", -- [301]
			"<22:24:04> <Comm>		^1^SplayerInfoRequest^T^t^^	RAID	Retardinxx-Draenor", -- [302]
			"<22:24:04> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	RAID	Retardinxx-Draenor", -- [303]
			"<22:24:04> <INFO>		OnMLDBReceived", -- [304]
			"<22:24:04> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SDAMAGER^N4^STrial^N6^N0^N7^N445.125^N8^N254^t^^	RAID	Amenía-TarrenMill", -- [305]
			"<22:24:05> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SHEALER^N4^SRôle-Historique^N6^N0^N7^N442.75^N8^N65^t^^	RAID	Aeranoss-MarécagedeZangar", -- [306]
			"<22:24:05> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SDAMAGER^N4^SRaider^N6^N0^N7^N446.25^N8^N62^t^^	RAID	Qpfromage-Ragnaros", -- [307]
			"<22:24:05> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^STANK^N4^SSans~`guilde^N6^N0^N7^N443.75^N8^N73^t^^	RAID	Karno-Hyjal", -- [308]
			"<22:24:05> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SDAMAGER^N4^SRoster^N6^N0^N7^N444.5^N8^N263^t^^	RAID	Linte-Hyjal", -- [309]
			"<22:24:05> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SDAMAGER^N4^SUnguilded^N6^N0^N7^N444.5^N8^N64^t^^	RAID	Dwafzik-TarrenMill", -- [310]
			"<22:24:05> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SHEALER^N4^SRoster^N6^N0^N7^N444.5^N8^N1468^t^^	RAID	Valfor-Dalaran", -- [311]
			"<22:24:05> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^SpI^N3^SDAMAGER^N4^SMember^N5^B^N6^N55^N7^N444.75^N8^N267^t^^	RAID	Brussewayn-Kazzak", -- [312]
			"<22:24:06> <Comm>		^1^Scouncil^T^N1^T^S1403-0A69ADE2^B^t^t^^	RAID	Retardinxx-Draenor", -- [313]
			"<22:24:06> <DEBUG>		isCouncil	false", -- [314]
			"<22:24:19> <DEBUG>		Timer MLdb_check passed", -- [315]
			"<22:25:56> <Comm>		^1^SpI^T^N1^STANK^N2^SSans~`guilde^N4^N0^N5^N443.75^N6^N73^t^^	RAID	Karno-Hyjal", -- [316]
			"<22:25:56> <Comm>		^1^Sxrealm^T^N1^SRetardinxx-Draenor^N2^Sreconnect^t^^	RAID	Karno-Hyjal", -- [317]
			"<22:25:56> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^Smldb^N3^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	RAID	Retardinxx-Draenor", -- [318]
			"<22:25:56> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^Scouncil^N3^T^S1403-0A69ADE2^B^t^t^^	RAID	Retardinxx-Draenor", -- [319]
			"<22:29:24> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [320]
			"<22:29:26> <DEBUG>		GetML()", -- [321]
			"<22:29:26> <DEBUG>		Resetting council as we have a new ML!", -- [322]
			"<22:29:26> <INFO>		MasterLooter	Sûnder-Hyjal	LootMethod	personalloot", -- [323]
			"<22:29:26> <Comm>		^1^SStopHandleLoot^T^t^^	RAID	Retardinxx-Draenor", -- [324]
			"<22:29:33> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [325]
			"<22:29:35> <DEBUG>		GetML()", -- [326]
			"<22:29:35> <DEBUG>		Resetting council as we have a new ML!", -- [327]
			"<22:29:35> <INFO>		MasterLooter	Karno-Hyjal	LootMethod	personalloot", -- [328]
			"<22:29:35> <Comm>		^1^SplayerInfoRequest^T^t^^	RAID	Karno-Hyjal", -- [329]
			"<22:29:35> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	RAID	Karno-Hyjal", -- [330]
			"<22:29:35> <INFO>		OnMLDBReceived", -- [331]
			"<22:29:35> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SDAMAGER^N4^SRaider^N6^N0^N7^N446.25^N8^N62^t^^	RAID	Qpfromage-Ragnaros", -- [332]
			"<22:29:35> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SDAMAGER^N4^STrial^N6^N0^N7^N445.125^N8^N254^t^^	RAID	Amenía-TarrenMill", -- [333]
			"<22:29:35> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SDAMAGER^N4^SObsidian^N6^N0^N7^N444.75^N8^N70^t^^	RAID	Retardinxx-Draenor", -- [334]
			"<22:29:35> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SDAMAGER^N4^SUnguilded^N6^N0^N7^N444.5^N8^N64^t^^	RAID	Dwafzik-TarrenMill", -- [335]
			"<22:29:35> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SHEALER^N4^SRôle-Historique^N6^N0^N7^N442.75^N8^N65^t^^	RAID	Aeranoss-MarécagedeZangar", -- [336]
			"<22:29:35> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SHEALER^N4^SRoster^N6^N0^N7^N444.5^N8^N1468^t^^	RAID	Valfor-Dalaran", -- [337]
			"<22:29:36> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SDAMAGER^N4^SMember^N5^B^N6^N55^N7^N444.75^N8^N267^t^^	RAID	Brussewayn-Kazzak", -- [338]
			"<22:29:37> <Comm>		^1^Scouncil^T^N1^T^S1390-086A105F^B^t^t^^	RAID	Karno-Hyjal", -- [339]
			"<22:29:37> <DEBUG>		isCouncil	false", -- [340]
			"<22:29:41> <DEBUG>		Timer MLdb_check passed", -- [341]
			"<22:29:47> <Comm>		^1^SStopHandleLoot^T^t^^	RAID	Karno-Hyjal", -- [342]
			"<22:29:50> <DEBUG>		Timer MLdb_check passed", -- [343]
			"<22:30:41> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [344]
			"<22:30:43> <DEBUG>		GetML()", -- [345]
			"<22:30:43> <Data.Player>		CreatePlayer	Player-1390-0AF6393B", -- [346]
			"<22:30:43> <DEBUG>		Resetting council as we have a new ML!", -- [347]
			"<22:30:43> <INFO>		MasterLooter	Strongdps-Hyjal	LootMethod	personalloot", -- [348]
			"<22:30:43> <Comm>		^1^SplayerInfoRequest^T^t^^	RAID	Strongdps-Hyjal", -- [349]
			"<22:30:43> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	RAID	Strongdps-Hyjal", -- [350]
			"<22:30:43> <INFO>		OnMLDBReceived", -- [351]
			"<22:30:43> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SDAMAGER^N4^SRaider^N6^N0^N7^N446.25^N8^N62^t^^	RAID	Qpfromage-Ragnaros", -- [352]
			"<22:30:43> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SHEALER^N4^SRoster^N6^N0^N7^N444.5^N8^N1468^t^^	RAID	Valfor-Dalaran", -- [353]
			"<22:30:43> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SDAMAGER^N4^SObsidian^N6^N0^N7^N444.75^N8^N70^t^^	RAID	Retardinxx-Draenor", -- [354]
			"<22:30:43> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SDAMAGER^N4^SUnguilded^N6^N0^N7^N444.5^N8^N64^t^^	RAID	Dwafzik-TarrenMill", -- [355]
			"<22:30:43> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SHEALER^N4^SRôle-Historique^N6^N0^N7^N442.75^N8^N65^t^^	RAID	Aeranoss-MarécagedeZangar", -- [356]
			"<22:30:43> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SDAMAGER^N4^STrial^N6^N0^N7^N445.125^N8^N254^t^^	RAID	Amenía-TarrenMill", -- [357]
			"<22:30:43> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SDAMAGER^N4^SMember^N5^B^N6^N55^N7^N444.75^N8^N267^t^^	RAID	Brussewayn-Kazzak", -- [358]
			"<22:30:45> <Comm>		^1^SStopHandleLoot^T^t^^	RAID	Strongdps-Hyjal", -- [359]
			"<22:30:58> <DEBUG>		Timer MLdb_check passed", -- [360]
			"<22:31:03> <Comm>		^1^SStopHandleLoot^T^t^^	RAID	Strongdps-Hyjal", -- [361]
			"<22:33:39> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [362]
			"<22:33:39> <INFO>		UpdatePlayersData()", -- [363]
			"<22:36:18> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [364]
			"<22:37:22> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [365]
			"<22:37:22> <INFO>		UpdatePlayersData()", -- [366]
			"<22:38:39> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Mecap-Ragnaros", -- [367]
			"<22:38:39> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [368]
			"<22:39:31> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [369]
			"<22:40:37> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [370]
			"<22:40:37> <INFO>		UpdatePlayersData()", -- [371]
			"<22:44:13> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [372]
			"<22:47:55> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [373]
			"<22:47:55> <INFO>		UpdatePlayersData()", -- [374]
			"<22:50:21> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [375]
			"<22:52:03> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [376]
			"<22:52:03> <INFO>		UpdatePlayersData()", -- [377]
			"<22:56:36> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [378]
			"<22:58:56> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [379]
			"<22:58:56> <INFO>		UpdatePlayersData()", -- [380]
			"<23:02:03> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [381]
			"<23:03:42> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [382]
			"<23:03:42> <INFO>		UpdatePlayersData()", -- [383]
			"<23:07:59> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [384]
			"<23:09:31> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [385]
			"<23:09:31> <INFO>		UpdatePlayersData()", -- [386]
			"<23:14:30> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [387]
			"<23:17:28> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [388]
			"<23:17:28> <INFO>		UpdatePlayersData()", -- [389]
			"<23:19:17> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [390]
			"<23:20:27> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [391]
			"<23:20:27> <INFO>		UpdatePlayersData()", -- [392]
			"<23:25:17> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [393]
			"<23:25:40> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [394]
			"<23:25:40> <INFO>		UpdatePlayersData()", -- [395]
			"<23:25:41> <DEBUG>		GetML()", -- [396]
			"<23:26:25> <DEBUG>		Event:	GROUP_LEFT	1	Party-1390-1-0000614B3FB2", -- [397]
			"<23:26:25> <DEBUG>		GetML()", -- [398]
			"<23:27:03> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Rap-Ragnaros", -- [399]
			"<23:27:03> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [400]
			"<00:01:51> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Rejuvlife-Ragnaros", -- [401]
			"<00:01:51> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [402]
			"<00:02:52> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Rejuvsham-Ragnaros", -- [403]
			"<00:02:52> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [404]
			"<00:05:16> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Wrathwings-Ragnaros", -- [405]
			"<00:05:17> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [406]
			"<00:06:19> <DEBUG>		Event:	LOOT_READY	true", -- [407]
			"<00:06:31> <DEBUG>		Event:	LOOT_READY	true", -- [408]
			"<00:06:45> <DEBUG>		Event:	LOOT_READY	true", -- [409]
			"<00:06:57> <DEBUG>		Event:	LOOT_READY	true", -- [410]
			"<00:07:05> <DEBUG>		Event:	LOOT_READY	true", -- [411]
			"<00:07:17> <DEBUG>		Event:	LOOT_READY	true", -- [412]
			"<00:07:31> <DEBUG>		Event:	LOOT_READY	true", -- [413]
			"<00:07:53> <DEBUG>		Event:	LOOT_READY	true", -- [414]
			"<00:11:17> <DEBUG>		Event:	LOOT_READY	true", -- [415]
			"<00:11:18> <DEBUG>		Event:	LOOT_READY	true", -- [416]
			"<00:11:26> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Papee-Ragnaros", -- [417]
			"<00:11:26> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [418]
			"<00:14:46> <DEBUG>		Event:	LOOT_READY	true", -- [419]
			"<00:14:55> <DEBUG>		Event:	LOOT_READY	true", -- [420]
			"<00:14:58> <DEBUG>		Event:	LOOT_READY	true", -- [421]
			"<00:15:04> <DEBUG>		Event:	LOOT_READY	true", -- [422]
			"<00:15:10> <DEBUG>		Event:	LOOT_READY	true", -- [423]
			"<00:15:15> <DEBUG>		Event:	LOOT_READY	true", -- [424]
			"<00:15:24> <DEBUG>		Event:	LOOT_READY	true", -- [425]
			"<00:15:31> <DEBUG>		Event:	LOOT_READY	true", -- [426]
			"<00:15:43> <DEBUG>		Event:	LOOT_READY	true", -- [427]
			"<00:15:51> <DEBUG>		Event:	LOOT_READY	true", -- [428]
			"<00:15:58> <DEBUG>		Event:	LOOT_READY	true", -- [429]
			"<00:16:17> <DEBUG>		Event:	LOOT_READY	true", -- [430]
			"<00:16:20> <DEBUG>		Event:	LOOT_READY	true", -- [431]
			"<00:16:31> <DEBUG>		Event:	LOOT_READY	true", -- [432]
			"<00:16:31> <DEBUG>		Event:	LOOT_READY	true", -- [433]
			"<00:16:31> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	0	205188	|cff0070dd|Hitem:205188::::::::70:62:::::::::|h[Barter Boulder]|h|r	1	Qpfromage	MAGE", -- [434]
			"<00:16:44> <DEBUG>		Event:	LOOT_READY	true", -- [435]
			"<00:16:54> <DEBUG>		Event:	LOOT_READY	true", -- [436]
			"<00:17:18> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [437]
			"<00:17:20> <Comm>		^1^Sxrealm^T^N1^SVexxy-Drak'thul^N2^SMLdb_request^t^^	RAID	Zebulight-Blackrock", -- [438]
			"<00:17:20> <Comm>		^1^Sxrealm^T^N1^SVexxy-Drak'thul^N2^Scouncil_request^t^^	RAID	Zebulight-Blackrock", -- [439]
			"<00:17:20> <DEBUG>		GetML()", -- [440]
			"<00:17:20> <Data.Player>		CreatePlayer	Player-1092-096E0A20", -- [441]
			"<00:17:20> <Data.Player>		CreatePlayer	Player-581-0A3CD12A", -- [442]
			"<00:17:20> <Data.Player>		CreatePlayer	Player-1396-0948CD31", -- [443]
			"<00:17:20> <Data.Player>		CreatePlayer	Player-1621-0A5BB8C3", -- [444]
			"<00:17:20> <Data.Player>		CreatePlayer	Player-512-056B435F", -- [445]
			"<00:17:20> <Data.Player>		CreatePlayer	Player-1092-0AA53599", -- [446]
			"<00:17:20> <Data.Player>		CreatePlayer	Player-1403-0A54A773", -- [447]
			"<00:17:20> <DEBUG>		Resetting council as we have a new ML!", -- [448]
			"<00:17:20> <INFO>		MasterLooter	Vexxy-Drak'thul	LootMethod	personalloot", -- [449]
			"<00:17:35> <DEBUG>		Timer MLdb_check passed", -- [450]
			"<00:17:44> <Comm>		^1^Sxrealm^T^N1^SVexxy-Drak'thul^N2^SMLdb_request^t^^	RAID	Cazzker-Ragnaros", -- [451]
			"<00:17:44> <Comm>		^1^Sxrealm^T^N1^SVexxy-Drak'thul^N2^Scouncil_request^t^^	RAID	Cazzker-Ragnaros", -- [452]
			"<00:17:45> <Comm>		^1^Sxrealm^T^N1^SVexxy-Drak'thul^N2^SMLdb_request^t^^	RAID	Frantik-Kazzak", -- [453]
			"<00:17:45> <Comm>		^1^Sxrealm^T^N1^SVexxy-Drak'thul^N2^Scouncil_request^t^^	RAID	Frantik-Kazzak", -- [454]
			"<00:18:18> <Comm>		^1^Sxrealm^T^N1^SVexxy-Drak'thul^N2^SMLdb_request^t^^	RAID	Arîana-Ragnaros", -- [455]
			"<00:18:18> <Comm>		^1^Sxrealm^T^N1^SVexxy-Drak'thul^N2^Scouncil_request^t^^	RAID	Arîana-Ragnaros", -- [456]
			"<00:23:09> <DEBUG>		Event:	LOOT_READY	true", -- [457]
			"<00:23:11> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	2696	194481	|cffa335ee|Hitem:194481::::::::70:62::::1:28:2706:::::|h[Plans: Obsidian Seared Crusher]|h|r	1	Cazzker	MAGE", -- [458]
			"<00:23:16> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [459]
			"<00:23:18> <DEBUG>		Event:	LOOT_READY	true", -- [460]
			"<00:23:18> <DEBUG>		GetML()", -- [461]
			"<00:23:18> <Data.Player>		CreatePlayer	Player-3682-097055B2", -- [462]
			"<00:23:18> <Data.Player>		CreatePlayer	Player-2073-0A096743", -- [463]
			"<00:23:18> <Data.Player>		CreatePlayer	Player-1379-052B8E2E", -- [464]
			"<00:23:18> <Data.Player>		CreatePlayer	Player-1379-0922EE7A", -- [465]
			"<00:23:18> <Data.Player>		CreatePlayer	Player-604-07C21039", -- [466]
			"<00:23:18> <DEBUG>		Resetting council as we have a new ML!", -- [467]
			"<00:23:18> <INFO>		MasterLooter	Húdeex-Drak'thul	LootMethod	personalloot", -- [468]
			"<00:23:22> <DEBUG>		Event:	GROUP_LEFT	1	Party-1092-1-00006788B93E", -- [469]
			"<00:23:22> <DEBUG>		GetML()", -- [470]
			"<00:23:33> <DEBUG>		Timer MLdb_check passed", -- [471]
			"<00:23:57> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [472]
			"<00:23:59> <DEBUG>		GetML()", -- [473]
			"<00:23:59> <Data.Player>		CreatePlayer	Player-633-0737F6AF", -- [474]
			"<00:23:59> <DEBUG>		Resetting council as we have a new ML!", -- [475]
			"<00:23:59> <INFO>		MasterLooter	Phoqyhu-BurningSteppes	LootMethod	personalloot", -- [476]
			"<00:24:14> <DEBUG>		Timer MLdb_check passed", -- [477]
			"<00:25:39> <DEBUG>		Event:	LOOT_READY	true", -- [478]
			"<00:26:29> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	0	190320	|cff0070dd|Hitem:190320::::::::70:62:::::::::|h[Rousing Fire]|h|r	2	Suzox-Sanguino	DEATHKNIGHT", -- [479]
			"<00:26:38> <DEBUG>		Event:	LOOT_READY	true", -- [480]
			"<00:26:38> <DEBUG>		Event:	LOOT_READY	true", -- [481]
			"<00:27:02> <DEBUG>		Event:	LOOT_READY	true", -- [482]
			"<00:27:02> <DEBUG>		Event:	LOOT_READY	true", -- [483]
			"<00:27:02> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	0	190315	|cff0070dd|Hitem:190315::::::::70:62:::::::::|h[Rousing Earth]|h|r	3	Qpfromage	MAGE", -- [484]
			"<00:27:13> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	0	190313	|cff0070dd|Hitem:190313::::::::70:62::::1:38:2:::::|h[Khaz'gorite Ore |A:Professions-ChatIcon-Quality-Tier2:17:23::1|a]|h|r	2	Danilow-Aggra(Português)	WARRIOR", -- [485]
			"<00:27:31> <DEBUG>		Event:	LOOT_READY	true", -- [486]
			"<00:27:32> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	0	190320	|cff0070dd|Hitem:190320::::::::70:62:::::::::|h[Rousing Fire]|h|r	2	Qpfromage	MAGE", -- [487]
			"<00:28:03> <DEBUG>		Event:	LOOT_READY	true", -- [488]
			"<00:28:09> <DEBUG>		Event:	GROUP_LEFT	1	Party-633-1-00002EF3F4E1", -- [489]
			"<00:28:09> <DEBUG>		GetML()", -- [490]
			"<00:28:31> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [491]
			"<00:28:33> <DEBUG>		GetML()", -- [492]
			"<00:28:33> <Data.Player>		CreatePlayer	Player-1302-0C316EF0", -- [493]
			"<00:28:33> <Data.Player>		CreatePlayer	Player-1335-0A0A70AC", -- [494]
			"<00:28:33> <Data.Player>		CreatePlayer	Player-3674-0AED5EB3", -- [495]
			"<00:28:33> <DEBUG>		Resetting council as we have a new ML!", -- [496]
			"<00:28:33> <INFO>		MasterLooter	Yachty-Archimonde	LootMethod	personalloot", -- [497]
			"<00:28:48> <DEBUG>		Timer MLdb_check passed", -- [498]
			"<00:29:49> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	0	190315	|cff0070dd|Hitem:190315::::::::70:62:::::::::|h[Rousing Earth]|h|r	4	Yachty-Archimonde	MONK", -- [499]
			"<00:30:39> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	0	190315	|cff0070dd|Hitem:190315::::::::70:62:::::::::|h[Rousing Earth]|h|r	2	Addalici-TwistingNether	SHAMAN", -- [500]
			"<00:30:50> <DEBUG>		Event:	LOOT_READY	true", -- [501]
			"<00:30:50> <DEBUG>		Event:	LOOT_READY	true", -- [502]
			"<00:30:50> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	0	190315	|cff0070dd|Hitem:190315::::::::70:62:::::::::|h[Rousing Earth]|h|r	3	Qpfromage	MAGE", -- [503]
			"<00:30:53> <DEBUG>		Event:	GROUP_LEFT	1	Party-1335-1-0000316EA082", -- [504]
			"<00:30:53> <DEBUG>		GetML()", -- [505]
			"<00:32:33> <DEBUG>		Event:	LOOT_READY	true", -- [506]
			"<00:33:44> <DEBUG>		Event:	LOOT_READY	true", -- [507]
			"<00:34:58> <DEBUG>		Event:	LOOT_READY	true", -- [508]
			"<00:35:24> <DEBUG>		Event:	LOOT_READY	true", -- [509]
			"<00:35:41> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Mecap-Ragnaros", -- [510]
			"<00:35:41> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [511]
			"<00:35:50> <DEBUG>		Event:	LOOT_READY	true", -- [512]
			"<00:36:24> <DEBUG>		Event:	LOOT_READY	true", -- [513]
			"<00:40:22> <DEBUG>		Event:	LOOT_READY	true", -- [514]
			"<00:40:22> <DEBUG>		Event:	LOOT_READY	true", -- [515]
			"<00:40:22> <DEBUG>		Event:	LOOT_READY	true", -- [516]
			"<00:43:13> <DEBUG>		Event:	LOOT_READY	true", -- [517]
			"<00:43:39> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [518]
			"<00:43:39> <INFO>		UpdatePlayersData()", -- [519]
			"<00:43:41> <DEBUG>		GetML()", -- [520]
			"<00:45:46> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Papeë-Ragnaros", -- [521]
			"<00:45:46> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [522]
			"<00:53:02> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Zerow-Ragnaros", -- [523]
			"07/27/23", -- [524]
			"<00:54:14> <INFO>		Logged In", -- [525]
			"<00:54:14> <INFO>[ML]		Init", -- [526]
			"<00:54:14> <INFO>		RCLootCouncil	TradeUI enabled", -- [527]
			"<00:54:20> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [528]
			"<00:54:20> <DEBUG>		ActivateSkin	bfa", -- [529]
			"<00:54:24> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [530]
			"<00:54:24> <INFO>		UpdatePlayersData()", -- [531]
			"<00:54:24> <INFO>		Player relog...", -- [532]
			"<00:54:26> <DEBUG>		GetPlayersGuildRank()", -- [533]
			"<00:54:26> <DEBUG>		Found Guild Rank: Raider", -- [534]
			"<00:54:27> <DEBUG>		GetML()", -- [535]
			"<00:54:28> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [536]
			"<00:54:28> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [537]
			"<00:56:00> <DEBUG>		Event:	LOOT_READY	true", -- [538]
			"<01:08:41> <DEBUG>		Event:	LOOT_READY	true", -- [539]
			"07/27/23", -- [540]
			"<20:25:56> <INFO>		Logged In", -- [541]
			"<20:25:56> <INFO>[ML]		Init", -- [542]
			"<20:25:56> <INFO>		RCLootCouncil	TradeUI enabled", -- [543]
			"<20:26:04> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [544]
			"<20:26:04> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [545]
			"<20:26:04> <DEBUG>		ActivateSkin	bfa", -- [546]
			"<20:26:06> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [547]
			"<20:26:06> <INFO>		UpdatePlayersData()", -- [548]
			"<20:26:06> <INFO>		Player relog...", -- [549]
			"<20:26:08> <DEBUG>		GetPlayersGuildRank()", -- [550]
			"<20:26:08> <DEBUG>		Found Guild Rank: Raider", -- [551]
			"<20:26:10> <DEBUG>		GetML()", -- [552]
			"<20:26:10> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [553]
			"<20:26:10> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [554]
			"<20:26:10> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [555]
			"<20:26:30> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [556]
			"<20:26:32> <DEBUG>		GetML()", -- [557]
			"<20:26:32> <Data.Player>		CreatePlayer	Player-1302-0C945858", -- [558]
			"<20:26:32> <Data.Player>		CreatePlayer	Player-1403-0A738523", -- [559]
			"<20:26:32> <DEBUG>		Resetting council as we have a new ML!", -- [560]
			"<20:26:32> <INFO>		MasterLooter	Sûnder-Hyjal	LootMethod	personalloot", -- [561]
			"<20:26:47> <DEBUG>		Timer MLdb_check passed", -- [562]
			"<20:26:47> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^SMLdb_request^t^^	RAID	Qpfromage-Ragnaros", -- [563]
			"<20:26:47> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^Scouncil_request^t^^	RAID	Qpfromage-Ragnaros", -- [564]
			"<20:27:36> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [565]
			"<20:27:36> <INFO>		UpdatePlayersData()", -- [566]
			"<20:27:38> <DEBUG>		GetML()", -- [567]
			"<20:27:46> <Comm>		^1^SpI^T^N1^SHEALER^N2^SRoster^N4^N0^N5^N444.5^N6^N1468^t^^	RAID	Valfor-Dalaran", -- [568]
			"<20:27:47> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^Sreconnect^t^^	RAID	Valfor-Dalaran", -- [569]
			"<20:27:58> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^SMLdb_request^t^^	RAID	Valfor-Dalaran", -- [570]
			"<20:29:05> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^SMLdb_request^t^^	RAID	Tapir-Dalaran", -- [571]
			"<20:29:05> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^Scouncil_request^t^^	RAID	Tapir-Dalaran", -- [572]
			"<20:29:41> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^SMLdb_request^t^^	RAID	Dwafzik-TarrenMill", -- [573]
			"<20:29:41> <Comm>		^1^Sxrealm^T^N1^SSûnder-Hyjal^N2^Scouncil_request^t^^	RAID	Dwafzik-TarrenMill", -- [574]
			"<20:34:09> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Aberrus, the Shadowed Crucible (Mythic)	465950	1	0", -- [575]
			"<20:34:10> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [576]
			"<20:34:10> <INFO>		UpdatePlayersData()", -- [577]
			"<20:34:11> <DEBUG>		GetML()", -- [578]
			"<20:34:11> <Data.Player>		CreatePlayer	Player-1621-0B175E27", -- [579]
			"<20:38:38> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [580]
			"<20:38:40> <DEBUG>		GetML()", -- [581]
			"<20:38:40> <Data.Player>		CreatePlayer	Player-1403-07CA91C8", -- [582]
			"<20:38:40> <DEBUG>		Resetting council as we have a new ML!", -- [583]
			"<20:38:40> <INFO>		MasterLooter	Karno-Hyjal	LootMethod	personalloot", -- [584]
			"<20:38:40> <Comm>		^1^SplayerInfoRequest^T^t^^	RAID	Karno-Hyjal", -- [585]
			"<20:38:40> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	RAID	Karno-Hyjal", -- [586]
			"<20:38:40> <INFO>		OnMLDBReceived", -- [587]
			"<20:38:40> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SDAMAGER^N4^SUnguilded^N6^N0^N7^N445.125^N8^N252^t^^	RAID	Tapir-Dalaran", -- [588]
			"<20:38:40> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SHEALER^N4^SRoster^N6^N0^N7^N444.5^N8^N1468^t^^	RAID	Valfor-Dalaran", -- [589]
			"<20:38:43> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SDAMAGER^N4^SCookie^N6^N0^N7^N444.125^N8^N258^t^^	RAID	Steffmôll-Draenor", -- [590]
			"<20:38:43> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SHEALER^N4^SRôle-Historique^N6^N0^N7^N442.75^N8^N65^t^^	RAID	Aeranoss-MarécagedeZangar", -- [591]
			"<20:38:43> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SDAMAGER^N4^SRaider^N6^N0^N7^N446.25^N8^N62^t^^	RAID	Qpfromage-Ragnaros", -- [592]
			"<20:38:43> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SDAMAGER^N4^SNovice^N6^N0^N7^N444.375^N8^N70^t^^	RAID	Vilytria-Archimonde", -- [593]
			"<20:38:43> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SDAMAGER^N4^SMember^N5^B^N6^N55^N7^N444.75^N8^N267^t^^	RAID	Brussewayn-Kazzak", -- [594]
			"<20:38:43> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SpI^N3^SDAMAGER^N4^SUnguilded^N6^N0^N7^N444.5^N8^N64^t^^	RAID	Dwafzik-TarrenMill", -- [595]
			"<20:38:43> <Comm>		^1^Scouncil^T^N1^T^S1390-086A105F^B^t^t^^	RAID	Karno-Hyjal", -- [596]
			"<20:38:43> <DEBUG>		isCouncil	false", -- [597]
			"<20:38:43> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [598]
			"<20:38:43> <INFO>		UpdatePlayersData()", -- [599]
			"<20:38:44> <Comm>		^1^SStopHandleLoot^T^t^^	RAID	Karno-Hyjal", -- [600]
			"<20:38:45> <DEBUG>		GetML()", -- [601]
			"<20:38:55> <DEBUG>		Timer MLdb_check passed", -- [602]
			"<20:38:55> <Comm>		^1^Sxrealm^T^N1^SKarno-Hyjal^N2^SMLdb_request^t^^	RAID	Tapir-Dalaran", -- [603]
			"<20:39:47> <Comm>		^1^SStopHandleLoot^T^t^^	RAID	Karno-Hyjal", -- [604]
			"<20:39:50> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [605]
			"<20:39:52> <DEBUG>		GetML()", -- [606]
			"<20:39:52> <DEBUG>		Resetting council as we have a new ML!", -- [607]
			"<20:39:52> <INFO>		MasterLooter	Strongdps-Hyjal	LootMethod	personalloot", -- [608]
			"<20:39:52> <Comm>		^1^SplayerInfoRequest^T^t^^	RAID	Strongdps-Hyjal", -- [609]
			"<20:39:52> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	RAID	Strongdps-Hyjal", -- [610]
			"<20:39:52> <INFO>		OnMLDBReceived", -- [611]
			"<20:39:52> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SDAMAGER^N4^SNovice^N6^N0^N7^N444.125^N8^N70^t^^	RAID	Vilytria-Archimonde", -- [612]
			"<20:39:52> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SDAMAGER^N4^SUnguilded^N6^N0^N7^N444.5^N8^N64^t^^	RAID	Dwafzik-TarrenMill", -- [613]
			"<20:39:52> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SHEALER^N4^SRôle-Historique^N6^N0^N7^N442.75^N8^N65^t^^	RAID	Aeranoss-MarécagedeZangar", -- [614]
			"<20:39:52> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SDAMAGER^N4^SRaider^N6^N0^N7^N446.25^N8^N62^t^^	RAID	Qpfromage-Ragnaros", -- [615]
			"<20:39:52> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SHEALER^N4^SRoster^N6^N0^N7^N444.5^N8^N1468^t^^	RAID	Valfor-Dalaran", -- [616]
			"<20:39:52> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SDAMAGER^N4^SUnguilded^N6^N0^N7^N445.125^N8^N252^t^^	RAID	Tapir-Dalaran", -- [617]
			"<20:39:52> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SDAMAGER^N4^SMember^N5^B^N6^N55^N7^N444.75^N8^N267^t^^	RAID	Brussewayn-Kazzak", -- [618]
			"<20:39:52> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SpI^N3^SDAMAGER^N4^SCookie^N6^N0^N7^N444.125^N8^N258^t^^	RAID	Steffmôll-Draenor", -- [619]
			"<20:39:53> <Comm>		^1^SStopHandleLoot^T^t^^	RAID	Strongdps-Hyjal", -- [620]
			"<20:40:07> <DEBUG>		Timer MLdb_check passed", -- [621]
			"<20:41:04> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Aberrus, the Shadowed Crucible (Mythic)	465535	1	0", -- [622]
			"<20:41:04> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [623]
			"<20:41:04> <INFO>		UpdatePlayersData()", -- [624]
			"<20:41:06> <DEBUG>		GetML()", -- [625]
			"<20:42:08> <Comm>		^1^SStopHandleLoot^T^t^^	RAID	Strongdps-Hyjal", -- [626]
			"<20:42:55> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Linte-Hyjal", -- [627]
			"<20:42:55> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Linte-Hyjal", -- [628]
			"<20:43:47> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Tapir-Dalaran", -- [629]
			"<20:43:52> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Valfor-Dalaran", -- [630]
			"<20:43:52> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Valfor-Dalaran", -- [631]
			"<20:44:45> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Valfor-Dalaran", -- [632]
			"<20:44:45> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Valfor-Dalaran", -- [633]
			"<20:44:49> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Steffmôll-Draenor", -- [634]
			"<20:44:49> <Comm>		^1^Sl^T^N1^S203825^t^^	RAID	Steffmôll-Draenor", -- [635]
			"<20:44:52> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [636]
			"<20:44:52> <INFO>		UpdatePlayersData()", -- [637]
			"<20:44:52> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [638]
			"<20:50:05> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Rap-Ragnaros", -- [639]
			"<20:50:06> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [640]
			"<20:50:06> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [641]
			"<20:50:21> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Nèlliel-Ragnaros", -- [642]
			"<20:50:21> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [643]
			"<20:50:21> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [644]
			"<20:55:24> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Mimmick-Ragnaros", -- [645]
			"<20:56:19> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [646]
			"<20:56:19> <INFO>		UpdatePlayersData()", -- [647]
			"<21:00:21> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [648]
			"<21:03:46> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [649]
			"<21:03:46> <INFO>		UpdatePlayersData()", -- [650]
			"<21:05:47> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [651]
			"<21:07:35> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [652]
			"<21:07:35> <INFO>		UpdatePlayersData()", -- [653]
			"<21:10:10> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [654]
			"<21:10:40> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Hdç-Ragnaros", -- [655]
			"<21:10:40> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [656]
			"<21:10:40> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [657]
			"<21:11:24> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Papee-Ragnaros", -- [658]
			"<21:11:24> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [659]
			"<21:11:24> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [660]
			"<21:16:19> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [661]
			"<21:16:19> <INFO>		UpdatePlayersData()", -- [662]
			"<21:20:01> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [663]
			"<21:20:23> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	0	190315	|cff0070dd|Hitem:190315::::::::70:62:::::::::|h[Rousing Earth]|h|r	3	Brussewayn-Kazzak	WARLOCK", -- [664]
			"<21:21:58> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [665]
			"<21:21:58> <INFO>		UpdatePlayersData()", -- [666]
			"<21:26:56> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [667]
			"<21:28:41> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [668]
			"<21:28:41> <INFO>		UpdatePlayersData()", -- [669]
			"<21:32:10> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [670]
			"<21:33:02> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [671]
			"<21:33:02> <INFO>		UpdatePlayersData()", -- [672]
			"<21:33:03> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [673]
			"<21:34:21> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [674]
			"<21:34:21> <INFO>		UpdatePlayersData()", -- [675]
			"<21:36:49> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [676]
			"<21:40:32> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [677]
			"<21:40:32> <INFO>		UpdatePlayersData()", -- [678]
			"<21:41:43> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Papeë-Ragnaros", -- [679]
			"<21:41:43> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [680]
			"<21:41:43> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [681]
			"<21:45:30> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [682]
			"<21:48:13> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Altdani-Ragnaros", -- [683]
			"<21:48:13> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [684]
			"<21:48:13> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [685]
			"<21:49:48> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [686]
			"<21:49:48> <INFO>		UpdatePlayersData()", -- [687]
			"<21:52:16> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [688]
			"<21:54:52> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [689]
			"<21:54:52> <INFO>		UpdatePlayersData()", -- [690]
			"<21:55:22> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Papeë-Ragnaros", -- [691]
			"<21:55:22> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [692]
			"<21:55:22> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [693]
			"<21:57:00> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [694]
			"<22:00:32> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [695]
			"<22:00:32> <INFO>		UpdatePlayersData()", -- [696]
			"<22:05:48> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [697]
			"<22:06:45> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [698]
			"<22:06:45> <INFO>		UpdatePlayersData()", -- [699]
			"<22:06:46> <DEBUG>		GetML()", -- [700]
			"<22:12:31> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Aberrus, the Shadowed Crucible (Mythic)	460048	1	0", -- [701]
			"<22:12:32> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [702]
			"<22:12:32> <INFO>		UpdatePlayersData()", -- [703]
			"<22:12:34> <DEBUG>		GetML()", -- [704]
			"<22:13:57> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Jfree-Ragnaros", -- [705]
			"<22:15:23> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Nèlliel-Ragnaros", -- [706]
			"<22:15:23> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [707]
			"<22:15:23> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [708]
			"<22:17:31> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Nèlliel-Ragnaros", -- [709]
			"<22:17:31> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [710]
			"<22:17:31> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [711]
			"<22:19:35> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [712]
			"<22:19:35> <INFO>		UpdatePlayersData()", -- [713]
			"<22:24:16> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [714]
			"<22:26:17> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [715]
			"<22:26:17> <INFO>		UpdatePlayersData()", -- [716]
			"<22:31:07> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [717]
			"<22:32:53> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [718]
			"<22:32:53> <INFO>		UpdatePlayersData()", -- [719]
			"<22:34:56> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [720]
			"<22:35:33> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [721]
			"<22:35:33> <INFO>		UpdatePlayersData()", -- [722]
			"<22:35:34> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [723]
			"<22:36:57> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [724]
			"<22:36:57> <INFO>		UpdatePlayersData()", -- [725]
			"<22:38:28> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [726]
			"<22:39:48> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [727]
			"<22:39:48> <INFO>		UpdatePlayersData()", -- [728]
			"<22:44:32> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [729]
			"<22:47:19> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [730]
			"<22:47:19> <INFO>		UpdatePlayersData()", -- [731]
			"<22:52:31> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [732]
			"<22:54:05> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [733]
			"<22:54:05> <INFO>		UpdatePlayersData()", -- [734]
			"<22:57:39> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [735]
			"<22:58:52> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [736]
			"<22:58:52> <INFO>		UpdatePlayersData()", -- [737]
			"<23:03:33> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [738]
			"<23:06:03> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Goshdarn-Ragnaros", -- [739]
			"<23:06:30> <Comm>		^1^SpI^T^N1^SDAMAGER^N2^SMember^N3^B^N4^N55^N5^N444.75^N6^N267^t^^	RAID	Brussewayn-Kazzak", -- [740]
			"<23:06:30> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^Sreconnect^t^^	RAID	Brussewayn-Kazzak", -- [741]
			"<23:06:43> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SMLdb_request^t^^	RAID	Brussewayn-Kazzak", -- [742]
			"<23:06:43> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^Scouncil_request^t^^	RAID	Brussewayn-Kazzak", -- [743]
			"<23:06:47> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Jfree-Ragnaros", -- [744]
			"<23:06:56> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [745]
			"<23:06:56> <INFO>		UpdatePlayersData()", -- [746]
			"<23:12:32> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [747]
			"<23:13:30> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Zerow-Ragnaros", -- [748]
			"<23:13:56> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [749]
			"<23:13:56> <INFO>		UpdatePlayersData()", -- [750]
			"<23:17:43> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [751]
			"<23:19:31> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [752]
			"<23:19:31> <INFO>		UpdatePlayersData()", -- [753]
			"<23:24:08> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [754]
			"<23:24:40> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [755]
			"<23:24:40> <INFO>		UpdatePlayersData()", -- [756]
			"<23:24:53> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [757]
			"<23:25:52> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [758]
			"<23:25:52> <INFO>		UpdatePlayersData()", -- [759]
			"<23:25:53> <DEBUG>		GetML()", -- [760]
			"<23:26:29> <DEBUG>		Event:	GROUP_LEFT	1	Party-1390-1-0000614DE3C9", -- [761]
			"<23:26:29> <DEBUG>		GetML()", -- [762]
			"<23:43:30> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Infernodh-Ragnaros", -- [763]
			"<23:43:30> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [764]
			"<23:43:30> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [765]
			"07/27/23", -- [766]
			"<23:51:31> <INFO>		Logged In", -- [767]
			"<23:51:31> <INFO>[ML]		Init", -- [768]
			"<23:51:31> <INFO>		RCLootCouncil	TradeUI enabled", -- [769]
			"<23:51:35> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [770]
			"<23:51:35> <DEBUG>		ActivateSkin	bfa", -- [771]
			"<23:51:37> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [772]
			"<23:51:37> <INFO>		UpdatePlayersData()", -- [773]
			"<23:51:37> <INFO>		Player relog...", -- [774]
			"<23:51:39> <DEBUG>		GetPlayersGuildRank()", -- [775]
			"<23:51:39> <DEBUG>		Found Guild Rank: Raider", -- [776]
			"<23:51:39> <DEBUG>		GetML()", -- [777]
			"<23:51:39> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [778]
			"<23:51:39> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [779]
			"<23:51:39> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [780]
			"07/28/23", -- [781]
			"<00:29:14> <INFO>		Logged In", -- [782]
			"<00:29:14> <INFO>[ML]		Init", -- [783]
			"<00:29:14> <INFO>		RCLootCouncil	TradeUI enabled", -- [784]
			"<00:29:15> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [785]
			"<00:29:15> <DEBUG>		ActivateSkin	bfa", -- [786]
			"<00:29:17> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [787]
			"<00:29:17> <INFO>		UpdatePlayersData()", -- [788]
			"<00:29:17> <INFO>		Player relog...", -- [789]
			"<00:29:19> <DEBUG>		GetPlayersGuildRank()", -- [790]
			"<00:29:19> <DEBUG>		Found Guild Rank: Raider", -- [791]
			"<00:29:19> <DEBUG>		GetML()", -- [792]
			"<00:29:19> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [793]
			"<00:29:19> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [794]
			"<00:29:19> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [795]
			"07/28/23", -- [796]
			"<00:29:54> <INFO>		Logged In", -- [797]
			"<00:29:54> <INFO>[ML]		Init", -- [798]
			"<00:29:54> <INFO>		RCLootCouncil	TradeUI enabled", -- [799]
			"<00:29:55> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [800]
			"<00:29:55> <DEBUG>		ActivateSkin	bfa", -- [801]
			"<00:29:58> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [802]
			"<00:29:58> <INFO>		UpdatePlayersData()", -- [803]
			"<00:29:58> <INFO>		Player relog...", -- [804]
			"<00:29:59> <DEBUG>		GetPlayersGuildRank()", -- [805]
			"<00:29:59> <DEBUG>		Found Guild Rank: Raider", -- [806]
			"<00:29:59> <DEBUG>		GetML()", -- [807]
			"<00:29:59> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [808]
			"<00:30:00> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [809]
			"<00:30:00> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [810]
			"07/28/23", -- [811]
			"<00:31:39> <INFO>		Logged In", -- [812]
			"<00:31:39> <INFO>[ML]		Init", -- [813]
			"<00:31:40> <INFO>		RCLootCouncil	TradeUI enabled", -- [814]
			"<00:31:41> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [815]
			"<00:31:41> <DEBUG>		ActivateSkin	bfa", -- [816]
			"<00:31:43> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [817]
			"<00:31:43> <INFO>		UpdatePlayersData()", -- [818]
			"<00:31:43> <INFO>		Player relog...", -- [819]
			"<00:31:44> <DEBUG>		GetPlayersGuildRank()", -- [820]
			"<00:31:44> <DEBUG>		Found Guild Rank: Raider", -- [821]
			"<00:31:45> <DEBUG>		GetML()", -- [822]
			"<00:31:45> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [823]
			"<00:31:45> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [824]
			"<00:31:45> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [825]
			"07/28/23", -- [826]
			"<00:38:45> <INFO>		Logged In", -- [827]
			"<00:38:45> <INFO>[ML]		Init", -- [828]
			"<00:38:45> <INFO>		RCLootCouncil	TradeUI enabled", -- [829]
			"<00:38:50> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [830]
			"<00:38:50> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [831]
			"<00:38:50> <DEBUG>		ActivateSkin	bfa", -- [832]
			"<00:38:52> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [833]
			"<00:38:52> <INFO>		UpdatePlayersData()", -- [834]
			"<00:38:52> <INFO>		Player relog...", -- [835]
			"<00:38:54> <DEBUG>		GetPlayersGuildRank()", -- [836]
			"<00:38:54> <DEBUG>		Found Guild Rank: Raider", -- [837]
			"<00:38:56> <DEBUG>		GetML()", -- [838]
			"<00:38:56> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [839]
			"<00:38:57> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [840]
			"<00:38:57> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [841]
			"<00:51:06> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [842]
			"<00:51:06> <INFO>		UpdatePlayersData()", -- [843]
			"<00:51:07> <DEBUG>		GetML()", -- [844]
			"<00:57:35> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [845]
			"<00:57:35> <INFO>		UpdatePlayersData()", -- [846]
			"<00:57:36> <DEBUG>		GetML()", -- [847]
			"<01:21:31> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Jfree-Ragnaros", -- [848]
			"<01:23:08> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Zerow-Ragnaros", -- [849]
			"<01:25:17> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Jfree-Ragnaros", -- [850]
			"<01:31:47> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [851]
			"<01:31:47> <INFO>		UpdatePlayersData()", -- [852]
			"<01:31:48> <DEBUG>		GetML()", -- [853]
			"<01:46:01> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Rejuvsham-Ragnaros", -- [854]
			"<01:46:02> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [855]
			"<01:46:31> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Mimmick-Ragnaros", -- [856]
			"<02:01:38> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [857]
			"<02:01:38> <INFO>		UpdatePlayersData()", -- [858]
			"<02:01:40> <DEBUG>		GetML()", -- [859]
			"<03:28:03> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Therion-Ragnaros", -- [860]
			"<03:50:37> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [861]
			"<03:50:37> <INFO>		UpdatePlayersData()", -- [862]
			"<03:50:39> <DEBUG>		GetML()", -- [863]
			"07/28/23", -- [864]
			"<03:52:40> <INFO>		Logged In", -- [865]
			"<03:52:40> <INFO>[ML]		Init", -- [866]
			"<03:52:40> <INFO>		RCLootCouncil	TradeUI enabled", -- [867]
			"<03:52:43> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [868]
			"<03:52:43> <DEBUG>		ActivateSkin	bfa", -- [869]
			"<03:52:46> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [870]
			"<03:52:46> <INFO>		UpdatePlayersData()", -- [871]
			"<03:52:46> <INFO>		Player relog...", -- [872]
			"<03:52:47> <DEBUG>		GetPlayersGuildRank()", -- [873]
			"<03:52:47> <DEBUG>		Found Guild Rank: Raider", -- [874]
			"<03:52:48> <DEBUG>		GetML()", -- [875]
			"<03:52:48> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [876]
			"<03:59:54> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [877]
			"<03:59:56> <DEBUG>		GetML()", -- [878]
			"<03:59:56> <Data.Player>		CreatePlayer	Player-3702-09C22E16", -- [879]
			"<03:59:56> <Data.Player>		CreatePlayer	Player-3674-05A52B4A", -- [880]
			"<03:59:56> <Data.Player>		CreatePlayer	Player-3691-0A07326E", -- [881]
			"<03:59:56> <DEBUG>		Resetting council as we have a new ML!", -- [882]
			"<03:59:56> <INFO>		MasterLooter	Tordrale-ArgentDawn	LootMethod	personalloot", -- [883]
			"<04:00:11> <DEBUG>		Timer MLdb_check passed", -- [884]
			"<04:00:11> <Comm>		^1^Sxrealm^T^N1^STordrale-ArgentDawn^N2^SMLdb_request^t^^	PARTY	Qpfromage-Ragnaros", -- [885]
			"<04:00:11> <Comm>		^1^Sxrealm^T^N1^STordrale-ArgentDawn^N2^Scouncil_request^t^^	PARTY	Qpfromage-Ragnaros", -- [886]
			"<04:00:57> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [887]
			"<04:00:57> <INFO>		UpdatePlayersData()", -- [888]
			"<04:00:58> <DEBUG>		GetML()", -- [889]
			"<04:00:58> <Data.Player>		CreatePlayer	Player-1379-0A7D517F", -- [890]
			"<04:01:26> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Uldaman: Legacy of Tyr (Mythic)	439113	0	0", -- [891]
			"<04:01:26> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [892]
			"<04:01:26> <INFO>		UpdatePlayersData()", -- [893]
			"<04:01:28> <DEBUG>		GetML()", -- [894]
			"<04:08:55> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [895]
			"<04:08:57> <DEBUG>		GetML()", -- [896]
			"<04:08:57> <Data.Player>		CreatePlayer	Player-1305-0C8FFED1", -- [897]
			"<04:08:57> <DEBUG>		Resetting council as we have a new ML!", -- [898]
			"<04:08:57> <INFO>		MasterLooter	Renegade-TwistingNether	LootMethod	personalloot", -- [899]
			"<04:08:58> <Comm>		^1^SplayerInfoRequest^T^t^^	PARTY	Renegade-TwistingNether", -- [900]
			"<04:08:58> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	PARTY	Renegade-TwistingNether", -- [901]
			"<04:08:58> <INFO>		OnMLDBReceived", -- [902]
			"<04:08:58> <Comm>		^1^Sxrealm^T^N1^SRenegade-TwistingNether^N2^SpI^N3^SDAMAGER^N4^SRaider^N6^N0^N7^N446.25^N8^N62^t^^	PARTY	Qpfromage-Ragnaros", -- [903]
			"<04:08:58> <Comm>		^1^Sxrealm^T^N1^SRenegade-TwistingNether^N2^SpI^N3^SDAMAGER^N4^STrial~`Raider^N6^N0^N7^N443.625^N8^N1473^t^^	PARTY	Marcen-Kazzak", -- [904]
			"<04:09:00> <Comm>		^1^Scouncil^T^N1^T^S3674-05A52B4A^B^t^t^^	PARTY	Renegade-TwistingNether", -- [905]
			"<04:09:00> <DEBUG>		isCouncil	false", -- [906]
			"<04:09:12> <DEBUG>		Timer MLdb_check passed", -- [907]
			"<04:13:33> <DEBUG>		Event:	ENCOUNTER_START	2555	The Lost Dwarves	8	5", -- [908]
			"<04:13:33> <INFO>		UpdatePlayersData()", -- [909]
			"<04:16:23> <DEBUG>		Event:	ENCOUNTER_END	2555	The Lost Dwarves	8	5	1", -- [910]
			"<04:19:32> <DEBUG>		Event:	ENCOUNTER_START	2556	Bromach	8	5", -- [911]
			"<04:19:32> <INFO>		UpdatePlayersData()", -- [912]
			"<04:20:18> <DEBUG>		Event:	ENCOUNTER_END	2556	Bromach	8	5	0", -- [913]
			"<04:21:05> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [914]
			"<04:21:05> <INFO>		UpdatePlayersData()", -- [915]
			"<04:21:07> <DEBUG>		GetML()", -- [916]
			"<04:21:52> <DEBUG>		Event:	GROUP_LEFT	1	Party-3702-1-0000678D4692", -- [917]
			"<04:21:52> <DEBUG>		GetML()", -- [918]
			"<04:23:04> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [919]
			"<04:23:06> <DEBUG>		GetML()", -- [920]
			"<04:23:06> <Data.Player>		CreatePlayer	Player-1305-0C23CE59", -- [921]
			"<04:23:06> <Data.Player>		CreatePlayer	Player-1615-0AE3F563", -- [922]
			"<04:23:06> <Data.Player>		CreatePlayer	Player-1084-0A852B39", -- [923]
			"<04:23:06> <DEBUG>		Resetting council as we have a new ML!", -- [924]
			"<04:23:06> <INFO>		MasterLooter	Tanksslave-Kazzak	LootMethod	personalloot", -- [925]
			"<04:23:15> <DEBUG>		Event:	GROUP_LEFT	1	Party-1305-1-0000614EFB83", -- [926]
			"<04:23:15> <DEBUG>		GetML()", -- [927]
			"<04:23:21> <DEBUG>		Timer MLdb_check passed", -- [928]
			"<04:58:49> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [929]
			"<04:58:51> <DEBUG>		GetML()", -- [930]
			"<04:58:51> <Data.Player>		CreatePlayer	Player-3674-093812D6", -- [931]
			"<04:58:51> <Data.Player>		CreatePlayer	Player-1085-0A3019AE", -- [932]
			"<04:58:51> <DEBUG>		Resetting council as we have a new ML!", -- [933]
			"<04:58:51> <INFO>		MasterLooter	Eekadh-TwistingNether	LootMethod	personalloot", -- [934]
			"<04:59:06> <DEBUG>		Timer MLdb_check passed", -- [935]
			"<05:04:03> <Comm>		^1^Sxrealm^T^N1^SEekadh-TwistingNether^N2^SMLdb_request^t^^	PARTY	Woopilicious-Antonidas", -- [936]
			"<05:04:03> <Comm>		^1^Sxrealm^T^N1^SEekadh-TwistingNether^N2^Scouncil_request^t^^	PARTY	Woopilicious-Antonidas", -- [937]
			"<05:04:20> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [938]
			"<05:04:20> <INFO>		UpdatePlayersData()", -- [939]
			"<05:04:22> <DEBUG>		GetML()", -- [940]
			"<05:04:22> <Data.Player>		CreatePlayer	Player-1092-0447CD8C", -- [941]
			"<05:04:22> <Data.Player>		CreatePlayer	Player-3686-09E7D779", -- [942]
			"<05:05:39> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [943]
			"<05:05:39> <INFO>		UpdatePlayersData()", -- [944]
			"<05:05:40> <DEBUG>		GetML()", -- [945]
			"<05:06:00> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [946]
			"<05:06:00> <INFO>		UpdatePlayersData()", -- [947]
			"<05:06:01> <DEBUG>		GetML()", -- [948]
			"<05:06:23> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Neltharus (Mythic)	435216	0	0", -- [949]
			"<05:06:23> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [950]
			"<05:06:23> <INFO>		UpdatePlayersData()", -- [951]
			"<05:06:25> <DEBUG>		GetML()", -- [952]
			"<05:12:58> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [953]
			"<05:12:58> <INFO>		UpdatePlayersData()", -- [954]
			"<05:12:59> <DEBUG>		Event:	GROUP_LEFT	1	Party-3674-1-0000386BE815", -- [955]
			"<05:12:59> <DEBUG>		GetML()", -- [956]
			"<05:13:00> <DEBUG>		GetML()", -- [957]
			"07/28/23", -- [958]
			"<06:42:14> <INFO>		Logged In", -- [959]
			"<06:42:14> <INFO>[ML]		Init", -- [960]
			"<06:42:14> <INFO>		RCLootCouncil	TradeUI enabled", -- [961]
			"<06:42:22> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [962]
			"<06:42:22> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [963]
			"<06:42:22> <DEBUG>		ActivateSkin	bfa", -- [964]
			"<06:42:24> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [965]
			"<06:42:24> <INFO>		UpdatePlayersData()", -- [966]
			"<06:42:24> <INFO>		Player relog...", -- [967]
			"<06:42:26> <DEBUG>		GetPlayersGuildRank()", -- [968]
			"<06:42:26> <DEBUG>		Found Guild Rank: Raider", -- [969]
			"<06:42:28> <DEBUG>		GetML()", -- [970]
			"<06:42:29> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [971]
			"<06:42:46> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [972]
			"<06:42:46> <INFO>		UpdatePlayersData()", -- [973]
			"<06:42:48> <DEBUG>		GetML()", -- [974]
			"<06:44:50> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [975]
			"<06:44:50> <INFO>		UpdatePlayersData()", -- [976]
			"<06:44:52> <DEBUG>		GetML()", -- [977]
			"07/28/23", -- [978]
			"<06:46:31> <INFO>		Logged In", -- [979]
			"<06:46:31> <INFO>[ML]		Init", -- [980]
			"<06:46:31> <INFO>		RCLootCouncil	TradeUI enabled", -- [981]
			"<06:46:32> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [982]
			"<06:46:32> <DEBUG>		ActivateSkin	bfa", -- [983]
			"<06:46:35> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [984]
			"<06:46:35> <INFO>		UpdatePlayersData()", -- [985]
			"<06:46:35> <INFO>		Player relog...", -- [986]
			"<06:46:36> <DEBUG>		GetPlayersGuildRank()", -- [987]
			"<06:46:36> <DEBUG>		Found Guild Rank: Raider", -- [988]
			"<06:46:36> <DEBUG>		GetML()", -- [989]
			"<06:46:37> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [990]
			"07/28/23", -- [991]
			"<07:01:49> <INFO>		Logged In", -- [992]
			"<07:01:49> <INFO>[ML]		Init", -- [993]
			"<07:01:49> <INFO>		RCLootCouncil	TradeUI enabled", -- [994]
			"<07:01:50> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [995]
			"<07:01:50> <DEBUG>		ActivateSkin	bfa", -- [996]
			"<07:01:52> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [997]
			"<07:01:52> <INFO>		UpdatePlayersData()", -- [998]
			"<07:01:52> <INFO>		Player relog...", -- [999]
			"<07:01:53> <DEBUG>		GetPlayersGuildRank()", -- [1000]
			"<07:01:53> <DEBUG>		Found Guild Rank: Raider", -- [1001]
			"<07:01:53> <DEBUG>		GetML()", -- [1002]
			"<07:01:54> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1003]
			"<07:13:08> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1004]
			"<07:13:08> <INFO>		UpdatePlayersData()", -- [1005]
			"<07:13:09> <DEBUG>		GetML()", -- [1006]
			"<07:13:39> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1007]
			"<07:13:39> <INFO>		UpdatePlayersData()", -- [1008]
			"<07:13:40> <DEBUG>		GetML()", -- [1009]
			"<08:06:42> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1010]
			"<08:06:42> <INFO>		UpdatePlayersData()", -- [1011]
			"<08:06:44> <DEBUG>		GetML()", -- [1012]
			"<08:28:23> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Paorel-Ragnaros", -- [1013]
			"<08:38:37> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1014]
			"<08:38:37> <INFO>		UpdatePlayersData()", -- [1015]
			"<08:38:39> <DEBUG>		GetML()", -- [1016]
			"07/28/23", -- [1017]
			"<08:42:02> <INFO>		Logged In", -- [1018]
			"<08:42:02> <INFO>[ML]		Init", -- [1019]
			"<08:42:02> <INFO>		RCLootCouncil	TradeUI enabled", -- [1020]
			"<08:42:10> <INFO>		Flurrq-Ragnaros	3.9.1	nil", -- [1021]
			"<08:42:10> <DEBUG>		ActivateSkin	bfa", -- [1022]
			"<08:42:12> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1023]
			"<08:42:12> <INFO>		UpdatePlayersData()", -- [1024]
			"<08:42:12> <INFO>		Player relog...", -- [1025]
			"<08:42:18> <DEBUG>		GetPlayersGuildRank()", -- [1026]
			"<08:42:18> <DEBUG>		Found Guild Rank: Alt", -- [1027]
			"<08:42:20> <DEBUG>		GetML()", -- [1028]
			"<08:42:20> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Flurrq-Ragnaros", -- [1029]
			"07/28/23", -- [1030]
			"<08:45:55> <INFO>		Logged In", -- [1031]
			"<08:45:55> <INFO>[ML]		Init", -- [1032]
			"<08:45:55> <INFO>		RCLootCouncil	TradeUI enabled", -- [1033]
			"<08:45:59> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1034]
			"<08:45:59> <DEBUG>		ActivateSkin	bfa", -- [1035]
			"<08:46:01> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1036]
			"<08:46:01> <INFO>		UpdatePlayersData()", -- [1037]
			"<08:46:01> <INFO>		Player relog...", -- [1038]
			"<08:46:02> <DEBUG>		GetPlayersGuildRank()", -- [1039]
			"<08:46:02> <DEBUG>		GetPlayersGuildRank()", -- [1040]
			"<08:46:02> <DEBUG>		Found Guild Rank: Raider", -- [1041]
			"<08:46:04> <DEBUG>		GetML()", -- [1042]
			"<08:46:04> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1043]
			"<08:53:31> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Paorel-Ragnaros", -- [1044]
			"<08:54:28> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1045]
			"<08:54:28> <INFO>		UpdatePlayersData()", -- [1046]
			"<08:54:30> <DEBUG>		GetML()", -- [1047]
			"<09:20:29> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1048]
			"<09:20:29> <INFO>		UpdatePlayersData()", -- [1049]
			"<09:20:31> <DEBUG>		GetML()", -- [1050]
			"<09:21:19> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1051]
			"<09:21:19> <INFO>		UpdatePlayersData()", -- [1052]
			"<09:21:21> <DEBUG>		GetML()", -- [1053]
			"<10:07:42> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1054]
			"<10:07:42> <INFO>		UpdatePlayersData()", -- [1055]
			"<10:07:43> <DEBUG>		GetML()", -- [1056]
			"<10:10:38> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1057]
			"<10:10:38> <INFO>		UpdatePlayersData()", -- [1058]
			"<10:10:40> <DEBUG>		GetML()", -- [1059]
			"<10:11:44> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1060]
			"<10:11:44> <INFO>		UpdatePlayersData()", -- [1061]
			"<10:11:46> <DEBUG>		GetML()", -- [1062]
			"<10:20:34> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Hev-Ragnaros", -- [1063]
			"<10:23:15> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1064]
			"<10:23:15> <INFO>		UpdatePlayersData()", -- [1065]
			"<10:23:17> <DEBUG>		GetML()", -- [1066]
			"<10:24:49> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1067]
			"<10:24:49> <INFO>		UpdatePlayersData()", -- [1068]
			"<10:24:51> <DEBUG>		GetML()", -- [1069]
			"07/28/23", -- [1070]
			"<11:13:23> <INFO>		Logged In", -- [1071]
			"<11:13:23> <INFO>[ML]		Init", -- [1072]
			"<11:13:23> <INFO>		RCLootCouncil	TradeUI enabled", -- [1073]
			"<11:13:25> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1074]
			"<11:13:25> <DEBUG>		ActivateSkin	bfa", -- [1075]
			"<11:13:26> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1076]
			"<11:13:26> <INFO>		UpdatePlayersData()", -- [1077]
			"<11:13:26> <INFO>		Player relog...", -- [1078]
			"<11:13:27> <DEBUG>		GetPlayersGuildRank()", -- [1079]
			"<11:13:27> <DEBUG>		Found Guild Rank: Raider", -- [1080]
			"<11:13:27> <DEBUG>		GetML()", -- [1081]
			"<11:13:27> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1082]
			"07/28/23", -- [1083]
			"<11:14:01> <INFO>		Logged In", -- [1084]
			"<11:14:01> <INFO>[ML]		Init", -- [1085]
			"<11:14:01> <INFO>		RCLootCouncil	TradeUI enabled", -- [1086]
			"<11:14:02> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1087]
			"<11:14:02> <DEBUG>		ActivateSkin	bfa", -- [1088]
			"<11:14:05> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1089]
			"<11:14:05> <INFO>		UpdatePlayersData()", -- [1090]
			"<11:14:05> <INFO>		Player relog...", -- [1091]
			"<11:14:06> <DEBUG>		GetPlayersGuildRank()", -- [1092]
			"<11:14:06> <DEBUG>		Found Guild Rank: Raider", -- [1093]
			"<11:14:06> <DEBUG>		GetML()", -- [1094]
			"<11:14:07> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1095]
			"07/28/23", -- [1096]
			"<11:17:23> <INFO>		Logged In", -- [1097]
			"<11:17:23> <INFO>[ML]		Init", -- [1098]
			"<11:17:23> <INFO>		RCLootCouncil	TradeUI enabled", -- [1099]
			"<11:17:25> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1100]
			"<11:17:25> <DEBUG>		ActivateSkin	bfa", -- [1101]
			"<11:17:27> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1102]
			"<11:17:27> <INFO>		UpdatePlayersData()", -- [1103]
			"<11:17:27> <INFO>		Player relog...", -- [1104]
			"<11:17:28> <DEBUG>		GetPlayersGuildRank()", -- [1105]
			"<11:17:28> <DEBUG>		Found Guild Rank: Raider", -- [1106]
			"<11:17:28> <DEBUG>		GetML()", -- [1107]
			"<11:17:29> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1108]
			"<11:24:35> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1109]
			"<11:24:35> <INFO>		UpdatePlayersData()", -- [1110]
			"<11:24:36> <DEBUG>		GetML()", -- [1111]
			"<11:27:05> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1112]
			"<11:27:05> <INFO>		UpdatePlayersData()", -- [1113]
			"<11:27:06> <DEBUG>		GetML()", -- [1114]
			"<11:34:41> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Paorel-Ragnaros", -- [1115]
			"<11:38:13> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1116]
			"<11:38:13> <INFO>		UpdatePlayersData()", -- [1117]
			"<11:38:14> <DEBUG>		GetML()", -- [1118]
			"<11:40:18> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Jfree-Ragnaros", -- [1119]
			"<11:53:57> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1120]
			"<11:53:57> <INFO>		UpdatePlayersData()", -- [1121]
			"<11:53:59> <DEBUG>		GetML()", -- [1122]
			"<11:56:43> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1123]
			"<11:56:43> <INFO>		UpdatePlayersData()", -- [1124]
			"<11:56:44> <DEBUG>		GetML()", -- [1125]
			"<12:08:47> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Mimmick-Ragnaros", -- [1126]
			"<12:27:03> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Miakasa-Ragnaros", -- [1127]
			"<12:30:40> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Miakasa-Ragnaros", -- [1128]
			"<12:33:52> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Miakasa-Ragnaros", -- [1129]
			"<12:36:44> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Miakasa-Ragnaros", -- [1130]
			"<12:38:39> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Paorel-Ragnaros", -- [1131]
			"<12:45:32> <DEBUG>		Event:	LOOT_READY	false", -- [1132]
			"<12:54:39> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Jfree-Ragnaros", -- [1133]
			"<12:54:52> <DEBUG>		Event:	LOOT_READY	false", -- [1134]
			"<12:54:54> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	0	103624	|cff0070dd|Hitem:103624::::::::70:64::::1:28:173:::::|h[Treasures of the Vale]|h|r	1	Qpfromage	MAGE", -- [1135]
			"<12:55:59> <DEBUG>		Event:	LOOT_READY	false", -- [1136]
			"<13:03:33> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1137]
			"<13:03:33> <INFO>		UpdatePlayersData()", -- [1138]
			"<13:03:35> <DEBUG>		GetML()", -- [1139]
			"<13:07:10> <DEBUG>		Event:	LOOT_READY	true", -- [1140]
			"<13:07:38> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1141]
			"<13:07:38> <INFO>		UpdatePlayersData()", -- [1142]
			"<13:07:40> <DEBUG>		GetML()", -- [1143]
			"<13:10:48> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Mimmick-Ragnaros", -- [1144]
			"<13:47:36> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Torashi-Ragnaros", -- [1145]
			"<13:47:37> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [1146]
			"<13:47:37> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [1147]
			"<13:49:46> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Asset-Ragnaros", -- [1148]
			"<13:51:29> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Mimmick-Ragnaros", -- [1149]
			"<13:56:26> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Jfree-Ragnaros", -- [1150]
			"<14:05:16> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Mábashí-Ragnaros", -- [1151]
			"<14:16:27> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1152]
			"<14:16:27> <INFO>		UpdatePlayersData()", -- [1153]
			"<14:16:28> <DEBUG>		GetML()", -- [1154]
			"<14:26:25> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Mimmick-Ragnaros", -- [1155]
			"<15:16:41> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Miakasa-Ragnaros", -- [1156]
			"<15:16:53> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Miakasa-Ragnaros", -- [1157]
			"<15:17:06> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Miakasa-Ragnaros", -- [1158]
			"<15:20:32> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Miakasa-Ragnaros", -- [1159]
			"<15:29:47> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Miakasa-Ragnaros", -- [1160]
			"<15:29:47> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [1161]
			"<15:29:47> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mábashí-Ragnaros", -- [1162]
			"<15:31:33> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Miakasa-Ragnaros", -- [1163]
			"<15:31:34> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mábashí-Ragnaros", -- [1164]
			"<15:31:34> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [1165]
			"<15:42:34> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Paorel-Ragnaros", -- [1166]
			"<15:42:34> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mábashí-Ragnaros", -- [1167]
			"<15:44:30> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Miakasa-Ragnaros", -- [1168]
			"<15:44:30> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mábashí-Ragnaros", -- [1169]
			"<15:57:10> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Jfree-Ragnaros", -- [1170]
			"<15:58:15> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Miakasa-Ragnaros", -- [1171]
			"<15:58:15> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [1172]
			"<16:15:14> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Mimmick-Ragnaros", -- [1173]
			"<16:26:15> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Wrathwings-Ragnaros", -- [1174]
			"<16:26:15> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [1175]
			"<16:26:15> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [1176]
			"<16:47:48> <DEBUG>		Event:	LOOT_READY	true", -- [1177]
			"<16:48:37> <DEBUG>		Event:	LOOT_READY	true", -- [1178]
			"<16:48:59> <DEBUG>		Event:	LOOT_READY	true", -- [1179]
			"<16:51:50> <DEBUG>		Event:	LOOT_READY	true", -- [1180]
			"<16:52:14> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Miakasa-Ragnaros", -- [1181]
			"<16:52:15> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [1182]
			"<16:52:15> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [1183]
			"<16:52:34> <DEBUG>		Event:	LOOT_READY	true", -- [1184]
			"<16:56:37> <DEBUG>		Event:	LOOT_READY	true", -- [1185]
			"<16:56:37> <DEBUG>		Event:	LOOT_READY	true", -- [1186]
			"<16:56:37> <DEBUG>		Event:	LOOT_READY	true", -- [1187]
			"<16:56:37> <DEBUG>		Event:	LOOT_READY	true", -- [1188]
			"<16:56:50> <DEBUG>		Event:	LOOT_READY	true", -- [1189]
			"<16:59:35> <DEBUG>		Event:	LOOT_READY	true", -- [1190]
			"<16:59:35> <DEBUG>		Event:	LOOT_READY	true", -- [1191]
			"<16:59:35> <DEBUG>		Event:	LOOT_READY	true", -- [1192]
			"<16:59:42> <DEBUG>		Event:	LOOT_READY	true", -- [1193]
			"<17:13:07> <DEBUG>		Event:	LOOT_READY	true", -- [1194]
			"<17:14:28> <DEBUG>		Event:	LOOT_READY	true", -- [1195]
			"<17:14:28> <DEBUG>		Event:	LOOT_READY	true", -- [1196]
			"<17:14:28> <DEBUG>		Event:	LOOT_READY	true", -- [1197]
			"<17:14:28> <DEBUG>		Event:	LOOT_READY	true", -- [1198]
			"<17:14:43> <DEBUG>		Event:	LOOT_READY	true", -- [1199]
			"<17:14:50> <DEBUG>		Event:	LOOT_READY	true", -- [1200]
			"<17:16:35> <DEBUG>		Event:	LOOT_READY	true", -- [1201]
			"<17:19:50> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Mábashí-Ragnaros", -- [1202]
			"<17:20:18> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Miakasa-Ragnaros", -- [1203]
			"<17:20:18> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [1204]
			"<17:20:18> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mábashí-Ragnaros", -- [1205]
			"<17:20:18> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [1206]
			"<17:21:08> <DEBUG>		Event:	LOOT_READY	true", -- [1207]
			"<17:21:19> <DEBUG>		Event:	LOOT_READY	true", -- [1208]
			"<17:21:28> <DEBUG>		Event:	LOOT_READY	true", -- [1209]
			"<17:22:39> <DEBUG>		Event:	LOOT_READY	true", -- [1210]
			"<17:22:44> <DEBUG>		Event:	LOOT_READY	true", -- [1211]
			"<17:22:44> <DEBUG>		Event:	LOOT_READY	true", -- [1212]
			"<17:22:45> <DEBUG>		Event:	LOOT_READY	true", -- [1213]
			"<17:23:29> <DEBUG>		Event:	LOOT_READY	true", -- [1214]
			"<17:24:42> <DEBUG>		Event:	LOOT_READY	true", -- [1215]
			"<17:34:54> <DEBUG>		Event:	LOOT_READY	true", -- [1216]
			"<17:35:01> <DEBUG>		Event:	LOOT_READY	true", -- [1217]
			"<17:35:08> <DEBUG>		Event:	LOOT_READY	true", -- [1218]
			"<17:35:08> <DEBUG>		Event:	LOOT_READY	true", -- [1219]
			"<17:35:28> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Miakasa-Ragnaros", -- [1220]
			"<17:35:28> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [1221]
			"<17:35:28> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mábashí-Ragnaros", -- [1222]
			"<17:35:28> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [1223]
			"<17:38:15> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Mimmick-Ragnaros", -- [1224]
			"<18:09:50> <DEBUG>		Event:	LOOT_READY	true", -- [1225]
			"<18:10:31> <DEBUG>		Event:	LOOT_READY	true", -- [1226]
			"07/29/23", -- [1227]
			"<00:27:01> <INFO>		Logged In", -- [1228]
			"<00:27:01> <INFO>[ML]		Init", -- [1229]
			"<00:27:01> <INFO>		RCLootCouncil	TradeUI enabled", -- [1230]
			"<00:27:09> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [1231]
			"<00:27:09> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1232]
			"<00:27:09> <DEBUG>		ActivateSkin	bfa", -- [1233]
			"<00:27:11> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1234]
			"<00:27:11> <INFO>		UpdatePlayersData()", -- [1235]
			"<00:27:11> <INFO>		Player relog...", -- [1236]
			"<00:27:12> <DEBUG>		GetPlayersGuildRank()", -- [1237]
			"<00:27:12> <DEBUG>		Found Guild Rank: Raider", -- [1238]
			"<00:27:15> <DEBUG>		GetML()", -- [1239]
			"<00:27:15> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1240]
			"<00:27:15> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [1241]
			"<00:33:47> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1242]
			"<00:33:47> <INFO>		UpdatePlayersData()", -- [1243]
			"<00:33:48> <DEBUG>		GetML()", -- [1244]
			"<00:36:17> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1245]
			"<00:36:17> <INFO>		UpdatePlayersData()", -- [1246]
			"<00:36:19> <DEBUG>		GetML()", -- [1247]
			"<00:38:26> <DEBUG>		Event:	LOOT_READY	true", -- [1248]
			"<00:39:22> <DEBUG>		Event:	LOOT_READY	true", -- [1249]
			"<00:39:39> <DEBUG>		Event:	LOOT_READY	true", -- [1250]
			"<00:45:04> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1251]
			"<00:45:04> <INFO>		UpdatePlayersData()", -- [1252]
			"<00:45:05> <DEBUG>		GetML()", -- [1253]
			"<00:45:11> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1254]
			"<00:45:11> <INFO>		UpdatePlayersData()", -- [1255]
			"<00:45:13> <DEBUG>		GetML()", -- [1256]
			"<00:46:56> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1257]
			"<00:46:56> <INFO>		UpdatePlayersData()", -- [1258]
			"<00:46:57> <DEBUG>		GetML()", -- [1259]
			"<00:49:16> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1260]
			"<00:49:16> <INFO>		UpdatePlayersData()", -- [1261]
			"<00:49:18> <DEBUG>		GetML()", -- [1262]
			"<00:49:54> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1263]
			"<00:49:54> <INFO>		UpdatePlayersData()", -- [1264]
			"<00:49:55> <DEBUG>		GetML()", -- [1265]
			"<00:50:42> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1266]
			"<00:50:42> <INFO>		UpdatePlayersData()", -- [1267]
			"<00:50:43> <DEBUG>		GetML()", -- [1268]
			"<00:52:51> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1269]
			"<00:52:51> <INFO>		UpdatePlayersData()", -- [1270]
			"<00:52:51> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1271]
			"<00:52:53> <DEBUG>		GetML()", -- [1272]
			"<00:52:53> <DEBUG>		GetML()", -- [1273]
			"<00:53:23> <DEBUG>		Event:	LOOT_READY	true", -- [1274]
			"<00:53:23> <DEBUG>		Adding to self.lootSlotInfo	1	|cff9d9d9d|Hitem:157844::::::::70:64:::::::::|h[Iridescent Speck]|h|r	0	1	Creature-0-4251-2207-19355-151638-00004446C1	1", -- [1275]
			"<00:53:23> <DEBUG>		Event:	LOOT_READY	true", -- [1276]
			"<00:53:23> <DEBUG>		Adding to self.lootSlotInfo	1	|cff9d9d9d|Hitem:157844::::::::70:64:::::::::|h[Iridescent Speck]|h|r	0	2	Creature-0-4251-2207-19355-151639-00004446C1	1	Creature-0-4251-2207-19355-151638-00004446C1	1", -- [1277]
			"<00:53:24> <DEBUG>		Event:	LOOT_READY	true", -- [1278]
			"<00:53:24> <DEBUG>		Adding to self.lootSlotInfo	1	|cff9d9d9d|Hitem:157844::::::::70:64:::::::::|h[Iridescent Speck]|h|r	0	1	Creature-0-4251-2207-19355-151639-00004446C1	1", -- [1279]
			"<00:53:24> <DEBUG>		OnLootSlotCleared()	1	|cff9d9d9d|Hitem:157844::::::::70:64:::::::::|h[Iridescent Speck]|h|r	0", -- [1280]
			"<00:53:24> <DEBUG>		Event:	LOOT_CLOSED", -- [1281]
			"<00:53:24> <DEBUG>		Event:	LOOT_CLOSED", -- [1282]
			"<00:53:24> <Comm>		^1^Sl^T^N1^S151639^t^^	INSTANCE_CHAT	Qpfromage-Ragnaros", -- [1283]
			"<00:53:24> <Comm>		^1^Sl^T^N1^S151639^t^^	INSTANCE_CHAT	Qpfromage-Ragnaros", -- [1284]
			"<00:54:09> <DEBUG>		Event:	LOOT_READY	true", -- [1285]
			"<00:54:09> <DEBUG>		Adding to self.lootSlotInfo	1	|cff9d9d9d|Hitem:157844::::::::70:64:::::::::|h[Iridescent Speck]|h|r	0	4	Creature-0-4251-2207-19355-151638-00014446C1	1	Creature-0-4251-2207-19355-151639-0000C446C1	1	Creature-0-4251-2207-19355-151638-0000C446C1	1	Creature-0-4251-2207-19355-151638-00024446C1	1", -- [1286]
			"<00:54:09> <DEBUG>		Adding to self.lootSlotInfo	2	|cff9d9d9d|Hitem:159140::::::::70:64:::::::::|h[Lifeless Clay]|h|r	0	1	Creature-0-4251-2207-19355-151638-00034446C1	1", -- [1287]
			"<00:54:09> <DEBUG>		Event:	LOOT_READY	true", -- [1288]
			"<00:54:09> <DEBUG>		Adding to self.lootSlotInfo	1	|cff9d9d9d|Hitem:157844::::::::70:64:::::::::|h[Iridescent Speck]|h|r	0	4	Creature-0-4251-2207-19355-151638-00014446C1	1	Creature-0-4251-2207-19355-151639-0000C446C1	1	Creature-0-4251-2207-19355-151638-0000C446C1	1	Creature-0-4251-2207-19355-151638-00024446C1	1", -- [1289]
			"<00:54:09> <DEBUG>		Adding to self.lootSlotInfo	2	|cff9d9d9d|Hitem:159140::::::::70:64:::::::::|h[Lifeless Clay]|h|r	0	2	Creature-0-4251-2207-19355-151638-0002C446C1	1	Creature-0-4251-2207-19355-151638-00034446C1	1", -- [1290]
			"<00:54:09> <DEBUG>		OnLootSlotCleared()	1	|cff9d9d9d|Hitem:157844::::::::70:64:::::::::|h[Iridescent Speck]|h|r	0", -- [1291]
			"<00:54:10> <DEBUG>		Event:	LOOT_READY	true", -- [1292]
			"<00:54:10> <DEBUG>		Adding to self.lootSlotInfo	2	|cff9d9d9d|Hitem:159140::::::::70:64:::::::::|h[Lifeless Clay]|h|r	0	1	Creature-0-4251-2207-19355-151638-0002C446C1	1", -- [1293]
			"<00:54:10> <DEBUG>		OnLootSlotCleared()	2	|cff9d9d9d|Hitem:159140::::::::70:64:::::::::|h[Lifeless Clay]|h|r	0", -- [1294]
			"<00:54:10> <DEBUG>		Event:	LOOT_CLOSED", -- [1295]
			"<00:54:10> <DEBUG>		Event:	LOOT_CLOSED", -- [1296]
			"<00:54:10> <Comm>		^1^Sl^T^N1^S151638^t^^	INSTANCE_CHAT	Qpfromage-Ragnaros", -- [1297]
			"<00:54:10> <Comm>		^1^Sl^T^N1^S151638^t^^	INSTANCE_CHAT	Qpfromage-Ragnaros", -- [1298]
			"<00:54:53> <DEBUG>		Event:	LOOT_READY	true", -- [1299]
			"<00:54:53> <DEBUG>		Adding to self.lootSlotInfo	1	|cff9d9d9d|Hitem:157844::::::::70:64:::::::::|h[Iridescent Speck]|h|r	0	1	Creature-0-4251-2207-19355-151639-00014446C1	1", -- [1300]
			"<00:54:53> <DEBUG>		OnLootSlotCleared()	1	|cff9d9d9d|Hitem:157844::::::::70:64:::::::::|h[Iridescent Speck]|h|r	0", -- [1301]
			"<00:54:53> <DEBUG>		Event:	LOOT_CLOSED", -- [1302]
			"<00:54:53> <DEBUG>		Event:	LOOT_CLOSED", -- [1303]
			"<00:54:54> <Comm>		^1^Sl^T^N1^S151639^t^^	INSTANCE_CHAT	Qpfromage-Ragnaros", -- [1304]
			"<00:54:54> <Comm>		^1^Sl^T^N1^S151639^t^^	INSTANCE_CHAT	Qpfromage-Ragnaros", -- [1305]
			"<00:56:49> <DEBUG>		Event:	LOOT_READY	true", -- [1306]
			"<00:56:49> <DEBUG>		Event:	LOOT_CLOSED", -- [1307]
			"<00:56:49> <DEBUG>		Event:	LOOT_CLOSED", -- [1308]
			"<00:56:49> <DEBUG>		Event:	ENCOUNTER_LOOT_RECEIVED	0	167830	|cffe6cc80|Hitem:167830::::::::70:64:::::::::|h[Petrified Ebony Scale]|h|r	1	Qpfromage	MAGE", -- [1309]
			"<00:57:45> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1310]
			"<00:57:45> <INFO>		UpdatePlayersData()", -- [1311]
			"<00:57:46> <DEBUG>		Event:	GROUP_LEFT	2	Party-3682-1-0000386D73E5", -- [1312]
			"<00:57:46> <DEBUG>		GetML()", -- [1313]
			"<00:57:47> <DEBUG>		GetML()", -- [1314]
			"<00:59:21> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1315]
			"<00:59:21> <INFO>		UpdatePlayersData()", -- [1316]
			"<00:59:23> <DEBUG>		GetML()", -- [1317]
			"<01:01:47> <DEBUG>		Event:	LOOT_READY	true", -- [1318]
			"<01:08:37> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1319]
			"<01:08:37> <INFO>		UpdatePlayersData()", -- [1320]
			"<01:08:38> <DEBUG>		GetML()", -- [1321]
			"<01:10:20> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1322]
			"<01:10:20> <INFO>		UpdatePlayersData()", -- [1323]
			"<01:10:22> <DEBUG>		GetML()", -- [1324]
			"<01:10:37> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1325]
			"<01:10:37> <INFO>		UpdatePlayersData()", -- [1326]
			"<01:10:39> <DEBUG>		GetML()", -- [1327]
			"<01:11:38> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1328]
			"<01:11:40> <DEBUG>		GetML()", -- [1329]
			"<01:11:40> <DEBUG>		Resetting council as we have a new ML!", -- [1330]
			"<01:11:40> <INFO>		MasterLooter	Kfcsniffer-Ragnaros	LootMethod	personalloot", -- [1331]
			"<01:11:55> <DEBUG>		Timer MLdb_check passed", -- [1332]
			"<01:12:43> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Papeë-Ragnaros", -- [1333]
			"<01:12:43> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Jfree-Ragnaros", -- [1334]
			"<01:12:43> <DEBUG>		Event:	GROUP_LEFT	1	Party-3682-1-0000386D7531", -- [1335]
			"<01:12:43> <DEBUG>		GetML()", -- [1336]
			"<01:12:43> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1337]
			"<01:12:45> <DEBUG>		GetML()", -- [1338]
			"<01:12:45> <Data.Player>		CreatePlayer	Player-1084-05CC5F1B", -- [1339]
			"<01:12:45> <DEBUG>		Resetting council as we have a new ML!", -- [1340]
			"<01:12:45> <INFO>		MasterLooter	Priestatsu-TarrenMill	LootMethod	personalloot", -- [1341]
			"<01:13:00> <DEBUG>		Timer MLdb_check passed", -- [1342]
			"<01:13:00> <Comm>		^1^Sxrealm^T^N1^SPriestatsu-TarrenMill^N2^SMLdb_request^t^^	PARTY	Qpfromage-Ragnaros", -- [1343]
			"<01:13:00> <Comm>		^1^Sxrealm^T^N1^SPriestatsu-TarrenMill^N2^Scouncil_request^t^^	PARTY	Qpfromage-Ragnaros", -- [1344]
			"<01:14:52> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Zerow-Ragnaros", -- [1345]
			"<01:15:05> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1346]
			"<01:15:05> <INFO>		UpdatePlayersData()", -- [1347]
			"<01:15:07> <DEBUG>		GetML()", -- [1348]
			"<01:15:16> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1349]
			"<01:15:16> <INFO>		UpdatePlayersData()", -- [1350]
			"<01:15:18> <DEBUG>		GetML()", -- [1351]
			"<01:15:24> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1352]
			"<01:15:24> <INFO>		UpdatePlayersData()", -- [1353]
			"<01:15:26> <DEBUG>		GetML()", -- [1354]
			"<01:17:19> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Wrathwings-Ragnaros", -- [1355]
			"<01:17:20> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [1356]
			"<01:18:34> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1357]
			"<01:18:34> <INFO>		UpdatePlayersData()", -- [1358]
			"<01:18:35> <DEBUG>		GetML()", -- [1359]
			"<01:18:35> <Data.Player>		CreatePlayer	Player-3391-0C495EEF", -- [1360]
			"<01:18:50> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Mimmick-Ragnaros", -- [1361]
			"<01:20:37> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Halls of Infusion (Mythic)	362362	0	0", -- [1362]
			"<01:20:38> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1363]
			"<01:20:38> <INFO>		UpdatePlayersData()", -- [1364]
			"<01:20:39> <DEBUG>		GetML()", -- [1365]
			"<01:21:26> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1366]
			"<01:21:26> <INFO>		UpdatePlayersData()", -- [1367]
			"<01:21:28> <DEBUG>		GetML()", -- [1368]
			"<01:21:47> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Halls of Infusion (Mythic)	362292	0	0", -- [1369]
			"<01:21:48> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1370]
			"<01:21:48> <INFO>		UpdatePlayersData()", -- [1371]
			"<01:21:49> <DEBUG>		GetML()", -- [1372]
			"<01:23:58> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1373]
			"<01:23:58> <INFO>		UpdatePlayersData()", -- [1374]
			"<01:23:59> <DEBUG>		GetML()", -- [1375]
			"<01:25:13> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Halls of Infusion (Mythic)	362086	0	0", -- [1376]
			"<01:25:14> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1377]
			"<01:25:14> <INFO>		UpdatePlayersData()", -- [1378]
			"<01:25:15> <DEBUG>		GetML()", -- [1379]
			"<01:34:07> <DEBUG>		Event:	ENCOUNTER_START	2615	Watcher Irideus	8	5", -- [1380]
			"<01:34:07> <INFO>		UpdatePlayersData()", -- [1381]
			"<01:37:56> <DEBUG>		Event:	ENCOUNTER_END	2615	Watcher Irideus	8	5	0", -- [1382]
			"<01:38:20> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1383]
			"<01:38:20> <INFO>		UpdatePlayersData()", -- [1384]
			"<01:38:21> <DEBUG>		GetML()", -- [1385]
			"<01:38:35> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Torashi-Ragnaros", -- [1386]
			"<01:38:35> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [1387]
			"<01:38:35> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [1388]
			"<01:39:25> <DEBUG>		Event:	GROUP_LEFT	1	Party-1084-1-000067906BF7", -- [1389]
			"<01:39:25> <DEBUG>		GetML()", -- [1390]
			"<01:39:45> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1391]
			"<01:39:47> <DEBUG>		GetML()", -- [1392]
			"<01:39:47> <DEBUG>		Resetting council as we have a new ML!", -- [1393]
			"<01:39:47> <INFO>		MasterLooter	Yamáto-Ragnaros	LootMethod	personalloot", -- [1394]
			"<01:40:02> <DEBUG>		Timer MLdb_check passed", -- [1395]
			"<01:56:05> <DEBUG>		Event:	GROUP_LEFT	1	Party-3682-1-0000386D7705", -- [1396]
			"<01:56:05> <DEBUG>		GetML()", -- [1397]
			"<01:56:05> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1398]
			"<01:56:07> <DEBUG>		GetML()", -- [1399]
			"<01:56:07> <Data.Player>		CreatePlayer	Player-1305-0BF757C0", -- [1400]
			"<01:56:07> <DEBUG>		Resetting council as we have a new ML!", -- [1401]
			"<01:56:07> <INFO>		MasterLooter	Bestbaby-Kazzak	LootMethod	personalloot", -- [1402]
			"<01:56:22> <DEBUG>		Timer MLdb_check passed", -- [1403]
			"<01:56:23> <Comm>		^1^Sxrealm^T^N1^SBestbaby-Kazzak^N2^SMLdb_request^t^^	PARTY	Qpfromage-Ragnaros", -- [1404]
			"<01:56:23> <Comm>		^1^Sxrealm^T^N1^SBestbaby-Kazzak^N2^Scouncil_request^t^^	PARTY	Qpfromage-Ragnaros", -- [1405]
			"<02:01:59> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Brackenhide Hollow (Mythic)	359880	0	0", -- [1406]
			"<02:02:00> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1407]
			"<02:02:00> <INFO>		UpdatePlayersData()", -- [1408]
			"<02:02:01> <DEBUG>		GetML()", -- [1409]
			"<02:02:01> <Data.Player>		CreatePlayer	Player-1416-09F8B967", -- [1410]
			"<02:03:00> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1411]
			"<02:03:02> <DEBUG>		GetML()", -- [1412]
			"<02:03:02> <DEBUG>		Resetting council as we have a new ML!", -- [1413]
			"<02:03:02> <INFO>		MasterLooter	Yamáto-Ragnaros	LootMethod	personalloot", -- [1414]
			"<02:03:17> <DEBUG>		Timer MLdb_check passed", -- [1415]
			"<02:13:43> <DEBUG>		Event:	ENCOUNTER_START	2570	Hackclaw's War-Band	8	5", -- [1416]
			"<02:13:43> <INFO>		UpdatePlayersData()", -- [1417]
			"<02:16:10> <DEBUG>		Event:	ENCOUNTER_END	2570	Hackclaw's War-Band	8	5	1", -- [1418]
			"<02:25:07> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1419]
			"<02:25:09> <DEBUG>		GetML()", -- [1420]
			"<02:25:09> <DEBUG>		Resetting council as we have a new ML!", -- [1421]
			"<02:25:09> <INFO>		MasterLooter	Bestbaby-Kazzak	LootMethod	personalloot", -- [1422]
			"<02:25:22> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1423]
			"<02:25:22> <INFO>		UpdatePlayersData()", -- [1424]
			"<02:25:23> <DEBUG>		GetML()", -- [1425]
			"<02:25:24> <DEBUG>		Timer MLdb_check passed", -- [1426]
			"<02:25:25> <Comm>		^1^Sxrealm^T^N1^SBestbaby-Kazzak^N2^SMLdb_request^t^^	PARTY	Qpfromage-Ragnaros", -- [1427]
			"<02:25:27> <Comm>		^1^Sxrealm^T^N1^SBestbaby-Kazzak^N2^Scouncil_request^t^^	PARTY	Qpfromage-Ragnaros", -- [1428]
			"<02:25:27> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1429]
			"<02:25:29> <DEBUG>		GetML()", -- [1430]
			"<02:25:29> <DEBUG>		Resetting council as we have a new ML!", -- [1431]
			"<02:25:29> <INFO>		MasterLooter	Qpfromage-Ragnaros	LootMethod	personalloot", -- [1432]
			"<02:25:29> <DEBUG>[ML]		UpdateGroupCouncil	Qpfromage-Ragnaros", -- [1433]
			"<02:25:29> <DEBUG>[ML]		NewML	Qpfromage-Ragnaros", -- [1434]
			"<02:25:29> <DEBUG>[ML]		UpdateMLdb", -- [1435]
			"<02:25:29> <INFO>		OnMLDBReceived", -- [1436]
			"<02:25:29> <Comm>		^1^SplayerInfoRequest^T^t^^	PARTY	Qpfromage-Ragnaros", -- [1437]
			"<02:25:29> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	PARTY	Qpfromage-Ragnaros", -- [1438]
			"<02:25:29> <Comm>		^1^SpI^T^N1^SDAMAGER^N2^SRaider^N4^N0^N5^N446.25^N6^N62^t^^	WHISPER	Qpfromage-Ragnaros", -- [1439]
			"<02:25:31> <DEBUG>[ML]		UpdateGroupCouncil	Qpfromage-Ragnaros", -- [1440]
			"<02:25:31> <Comm>		^1^Scouncil^T^N1^T^S3682-0B236980^B^t^t^^	PARTY	Qpfromage-Ragnaros", -- [1441]
			"<02:25:31> <DEBUG>		isCouncil	true", -- [1442]
			"<02:25:31> <DEBUG>		GetLootDBStatistics()", -- [1443]
			"<02:25:31> <DEBUG>		GetGuildRankNum()", -- [1444]
			"<02:25:31> <INFO>		RCVotingFrame	enabled", -- [1445]
			"<02:25:44> <DEBUG>		Timer MLdb_check passed", -- [1446]
			"<02:25:48> <DEBUG>		Event:	GROUP_LEFT	1	Party-1305-1-000061518DD1", -- [1447]
			"<02:25:48> <DEBUG>		GetML()", -- [1448]
			"<02:25:48> <INFO>		Stop handling loot", -- [1449]
			"<02:25:48> <INFO>[ML]		Disabled", -- [1450]
			"<02:25:48> <Comm>		^1^SStopHandleLoot^T^t^^	WHISPER	Qpfromage-Ragnaros", -- [1451]
			"<02:25:53> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1452]
			"<02:25:53> <INFO>		UpdatePlayersData()", -- [1453]
			"<02:25:54> <DEBUG>		GetML()", -- [1454]
			"<02:25:54> <DEBUG>		VotingFrame:Update() without lootTable!!", -- [1455]
			"<02:27:01> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Therion-Ragnaros", -- [1456]
			"<02:27:01> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Mimmick-Ragnaros", -- [1457]
			"<02:27:01> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [1458]
			"07/29/23", -- [1459]
			"<10:49:54> <INFO>		Logged In", -- [1460]
			"<10:49:54> <INFO>[ML]		Init", -- [1461]
			"<10:49:54> <INFO>		RCLootCouncil	TradeUI enabled", -- [1462]
			"<10:50:02> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [1463]
			"<10:50:02> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1464]
			"<10:50:02> <DEBUG>		ActivateSkin	bfa", -- [1465]
			"<10:50:04> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1466]
			"<10:50:04> <INFO>		UpdatePlayersData()", -- [1467]
			"<10:50:04> <INFO>		Player relog...", -- [1468]
			"<10:50:06> <DEBUG>		GetPlayersGuildRank()", -- [1469]
			"<10:50:06> <DEBUG>		GetPlayersGuildRank()", -- [1470]
			"<10:50:06> <DEBUG>		Found Guild Rank: Raider", -- [1471]
			"<10:50:08> <DEBUG>		GetML()", -- [1472]
			"<10:50:08> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1473]
			"<10:50:08> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Zerow-Ragnaros", -- [1474]
			"07/30/23", -- [1475]
			"<21:52:04> <INFO>		Logged In", -- [1476]
			"<21:52:04> <INFO>[ML]		Init", -- [1477]
			"<21:52:04> <INFO>		RCLootCouncil	TradeUI enabled", -- [1478]
			"<21:52:12> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [1479]
			"<21:52:12> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1480]
			"<21:52:12> <DEBUG>		ActivateSkin	bfa", -- [1481]
			"<21:52:14> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1482]
			"<21:52:14> <INFO>		UpdatePlayersData()", -- [1483]
			"<21:52:14> <INFO>		Player relog...", -- [1484]
			"<21:52:15> <DEBUG>		GetPlayersGuildRank()", -- [1485]
			"<21:52:16> <DEBUG>		GetPlayersGuildRank()", -- [1486]
			"<21:52:16> <DEBUG>		Found Guild Rank: Raider", -- [1487]
			"<21:52:18> <DEBUG>		GetML()", -- [1488]
			"<21:52:18> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1489]
			"07/30/23", -- [1490]
			"<22:32:50> <INFO>		Logged In", -- [1491]
			"<22:32:50> <INFO>[ML]		Init", -- [1492]
			"<22:32:50> <INFO>		RCLootCouncil	TradeUI enabled", -- [1493]
			"<22:32:54> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [1494]
			"<22:32:54> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1495]
			"<22:32:54> <DEBUG>		ActivateSkin	bfa", -- [1496]
			"<22:32:57> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1497]
			"<22:32:57> <INFO>		UpdatePlayersData()", -- [1498]
			"<22:32:57> <INFO>		Player relog...", -- [1499]
			"<22:32:58> <DEBUG>		GetPlayersGuildRank()", -- [1500]
			"<22:32:58> <DEBUG>		GetPlayersGuildRank()", -- [1501]
			"<22:32:58> <DEBUG>		Found Guild Rank: Raider", -- [1502]
			"<22:33:00> <DEBUG>		GetML()", -- [1503]
			"<22:33:01> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1504]
			"<22:33:49> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1505]
			"<22:33:51> <DEBUG>		GetML()", -- [1506]
			"<22:33:51> <Data.Player>		CreatePlayer	Player-3713-0732419C", -- [1507]
			"<22:33:51> <Data.Player>		CreatePlayer	Player-1615-0A846180", -- [1508]
			"<22:33:51> <Data.Player>		CreatePlayer	Player-1084-097B0F6E", -- [1509]
			"<22:33:51> <Data.Player>		CreatePlayer	Player-1396-06651835", -- [1510]
			"<22:33:51> <Data.Player>		CreatePlayer	Player-1403-080C65AF", -- [1511]
			"<22:33:51> <DEBUG>		Resetting council as we have a new ML!", -- [1512]
			"<22:33:51> <INFO>		MasterLooter	Strongdps-Hyjal	LootMethod	personalloot", -- [1513]
			"<22:34:06> <DEBUG>		Timer MLdb_check passed", -- [1514]
			"<22:34:06> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SMLdb_request^t^^	RAID	Qpfromage-Ragnaros", -- [1515]
			"<22:34:06> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^Scouncil_request^t^^	RAID	Qpfromage-Ragnaros", -- [1516]
			"<22:34:46> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Aberrus, the Shadowed Crucible (Mythic)	199513	1	0", -- [1517]
			"<22:34:47> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1518]
			"<22:34:47> <INFO>		UpdatePlayersData()", -- [1519]
			"<22:34:48> <DEBUG>		GetML()", -- [1520]
			"<22:35:24> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [1521]
			"<22:35:24> <INFO>		UpdatePlayersData()", -- [1522]
			"<22:37:26> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [1523]
			"<22:38:03> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Smaugthis-Ragnaros", -- [1524]
			"<22:39:03> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [1525]
			"<22:39:03> <INFO>		UpdatePlayersData()", -- [1526]
			"<22:43:58> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [1527]
			"<22:45:35> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [1528]
			"<22:45:35> <INFO>		UpdatePlayersData()", -- [1529]
			"<22:50:17> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Zerow-Ragnaros", -- [1530]
			"<22:50:24> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [1531]
			"<22:51:59> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [1532]
			"<22:51:59> <INFO>		UpdatePlayersData()", -- [1533]
			"<22:55:34> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [1534]
			"<22:56:45> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [1535]
			"<22:56:45> <INFO>		UpdatePlayersData()", -- [1536]
			"<22:59:13> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [1537]
			"07/30/23", -- [1538]
			"<23:00:15> <INFO>		Logged In", -- [1539]
			"<23:00:15> <INFO>[ML]		Init", -- [1540]
			"<23:00:15> <INFO>		RCLootCouncil	TradeUI enabled", -- [1541]
			"<23:00:17> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1542]
			"<23:00:17> <DEBUG>		ActivateSkin	bfa", -- [1543]
			"<23:00:19> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1544]
			"<23:00:19> <INFO>		UpdatePlayersData()", -- [1545]
			"<23:00:19> <INFO>		Player relog...", -- [1546]
			"<23:00:21> <DEBUG>		GetPlayersGuildRank()", -- [1547]
			"<23:00:21> <DEBUG>		Found Guild Rank: Raider", -- [1548]
			"<23:00:21> <DEBUG>		GetML()", -- [1549]
			"<23:00:21> <DEBUG>		Resetting council as we have a new ML!", -- [1550]
			"<23:00:21> <INFO>		MasterLooter	Strongdps-Hyjal	LootMethod	personalloot", -- [1551]
			"<23:00:21> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1552]
			"<23:00:21> <Comm>		^1^SpI^T^N1^SDAMAGER^N2^SRaider^N4^N0^N5^N446.25^N6^N62^t^^	RAID	Qpfromage-Ragnaros", -- [1553]
			"<23:00:21> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^Sreconnect^t^^	RAID	Qpfromage-Ragnaros", -- [1554]
			"<23:00:36> <DEBUG>		Timer MLdb_check passed", -- [1555]
			"<23:00:36> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^SMLdb_request^t^^	RAID	Qpfromage-Ragnaros", -- [1556]
			"<23:00:36> <Comm>		^1^Sxrealm^T^N1^SStrongdps-Hyjal^N2^Scouncil_request^t^^	RAID	Qpfromage-Ragnaros", -- [1557]
			"<23:00:59> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [1558]
			"<23:00:59> <INFO>		UpdatePlayersData()", -- [1559]
			"<23:06:29> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [1560]
			"<23:07:47> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [1561]
			"<23:07:47> <INFO>		UpdatePlayersData()", -- [1562]
			"<23:13:25> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [1563]
			"<23:16:32> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [1564]
			"<23:16:32> <INFO>		UpdatePlayersData()", -- [1565]
			"<23:21:58> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [1566]
			"<23:23:35> <DEBUG>		Event:	ENCOUNTER_START	2683	Magmorax	16	20", -- [1567]
			"<23:23:35> <INFO>		UpdatePlayersData()", -- [1568]
			"<23:25:46> <DEBUG>		Event:	ENCOUNTER_END	2683	Magmorax	16	20	0", -- [1569]
			"08/01/23", -- [1570]
			"<00:22:35> <INFO>		Logged In", -- [1571]
			"<00:22:35> <INFO>[ML]		Init", -- [1572]
			"<00:22:35> <INFO>		RCLootCouncil	TradeUI enabled", -- [1573]
			"<00:22:44> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [1574]
			"<00:22:44> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1575]
			"<00:22:44> <DEBUG>		ActivateSkin	bfa", -- [1576]
			"<00:22:46> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1577]
			"<00:22:46> <INFO>		UpdatePlayersData()", -- [1578]
			"<00:22:46> <INFO>		Player relog...", -- [1579]
			"<00:22:49> <DEBUG>		GetML()", -- [1580]
			"<00:22:49> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1581]
			"<00:23:33> <DEBUG>		GetPlayersGuildRank()", -- [1582]
			"<00:23:33> <DEBUG>		Found Guild Rank: Raider", -- [1583]
			"08/01/23", -- [1584]
			"<00:23:50> <INFO>		Logged In", -- [1585]
			"<00:23:50> <INFO>[ML]		Init", -- [1586]
			"<00:23:50> <INFO>		RCLootCouncil	TradeUI enabled", -- [1587]
			"<00:23:52> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1588]
			"<00:23:52> <DEBUG>		ActivateSkin	bfa", -- [1589]
			"<00:23:54> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1590]
			"<00:23:54> <INFO>		UpdatePlayersData()", -- [1591]
			"<00:23:54> <INFO>		Player relog...", -- [1592]
			"<00:23:56> <DEBUG>		GetPlayersGuildRank()", -- [1593]
			"<00:23:56> <DEBUG>		Found Guild Rank: Raider", -- [1594]
			"<00:23:56> <DEBUG>		GetML()", -- [1595]
			"<00:23:56> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1596]
			"<00:25:02> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1597]
			"<00:25:02> <INFO>		UpdatePlayersData()", -- [1598]
			"<00:25:04> <DEBUG>		GetML()", -- [1599]
			"<00:28:21> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Smaugthis-Ragnaros", -- [1600]
			"08/01/23", -- [1601]
			"<02:22:43> <INFO>		Logged In", -- [1602]
			"<02:22:43> <INFO>[ML]		Init", -- [1603]
			"<02:22:43> <INFO>		RCLootCouncil	TradeUI enabled", -- [1604]
			"<02:22:51> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [1605]
			"<02:22:51> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1606]
			"<02:22:51> <DEBUG>		ActivateSkin	bfa", -- [1607]
			"<02:22:53> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1608]
			"<02:22:53> <INFO>		UpdatePlayersData()", -- [1609]
			"<02:22:53> <INFO>		Player relog...", -- [1610]
			"<02:22:55> <DEBUG>		GetPlayersGuildRank()", -- [1611]
			"<02:22:55> <DEBUG>		Found Guild Rank: Raider", -- [1612]
			"<02:22:57> <DEBUG>		GetML()", -- [1613]
			"<02:22:57> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1614]
			"<02:52:10> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	çookie-Ragnaros", -- [1615]
			"<03:26:45> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1616]
			"<03:26:45> <INFO>		UpdatePlayersData()", -- [1617]
			"<03:26:47> <DEBUG>		GetML()", -- [1618]
			"<04:41:50> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1619]
			"<04:41:50> <INFO>		UpdatePlayersData()", -- [1620]
			"<04:41:52> <DEBUG>		GetML()", -- [1621]
			"<04:51:03> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1622]
			"<04:51:03> <INFO>		UpdatePlayersData()", -- [1623]
			"<04:51:05> <DEBUG>		GetML()", -- [1624]
			"08/01/23", -- [1625]
			"<05:56:45> <INFO>		Logged In", -- [1626]
			"<05:56:45> <INFO>[ML]		Init", -- [1627]
			"<05:56:45> <INFO>		RCLootCouncil	TradeUI enabled", -- [1628]
			"<05:56:53> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [1629]
			"<05:56:53> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1630]
			"<05:56:53> <DEBUG>		ActivateSkin	bfa", -- [1631]
			"<05:56:55> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1632]
			"<05:56:55> <INFO>		UpdatePlayersData()", -- [1633]
			"<05:56:55> <INFO>		Player relog...", -- [1634]
			"<05:56:57> <DEBUG>		GetML()", -- [1635]
			"<05:56:58> <DEBUG>		GetPlayersGuildRank()", -- [1636]
			"<05:56:58> <DEBUG>		GetPlayersGuildRank()", -- [1637]
			"<05:56:58> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1638]
			"08/01/23", -- [1639]
			"<06:14:19> <INFO>		Logged In", -- [1640]
			"<06:14:19> <INFO>[ML]		Init", -- [1641]
			"<06:14:19> <INFO>		RCLootCouncil	TradeUI enabled", -- [1642]
			"<06:14:20> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1643]
			"<06:14:20> <DEBUG>		ActivateSkin	bfa", -- [1644]
			"<06:14:22> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1645]
			"<06:14:22> <INFO>		UpdatePlayersData()", -- [1646]
			"<06:14:22> <INFO>		Player relog...", -- [1647]
			"<06:14:22> <DEBUG>		GetML()", -- [1648]
			"<06:14:22> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1649]
			"<06:14:28> <DEBUG>		GetPlayersGuildRank()", -- [1650]
			"<06:14:28> <DEBUG>		Found Guild Rank: Raider", -- [1651]
			"<06:17:53> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1652]
			"<06:17:53> <INFO>		UpdatePlayersData()", -- [1653]
			"<06:17:55> <DEBUG>		GetML()", -- [1654]
			"<06:35:17> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1655]
			"<06:35:17> <INFO>		UpdatePlayersData()", -- [1656]
			"<06:35:19> <DEBUG>		GetML()", -- [1657]
			"<06:35:37> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1658]
			"<06:35:37> <INFO>		UpdatePlayersData()", -- [1659]
			"<06:35:39> <DEBUG>		GetML()", -- [1660]
			"<06:35:53> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1661]
			"<06:35:53> <INFO>		UpdatePlayersData()", -- [1662]
			"<06:35:55> <DEBUG>		GetML()", -- [1663]
			"08/01/23", -- [1664]
			"<06:54:31> <INFO>		Logged In", -- [1665]
			"<06:54:31> <INFO>[ML]		Init", -- [1666]
			"<06:54:31> <INFO>		RCLootCouncil	TradeUI enabled", -- [1667]
			"<06:54:32> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1668]
			"<06:54:32> <DEBUG>		ActivateSkin	bfa", -- [1669]
			"<06:54:34> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1670]
			"<06:54:34> <INFO>		UpdatePlayersData()", -- [1671]
			"<06:54:34> <INFO>		Player relog...", -- [1672]
			"<06:54:36> <DEBUG>		GetPlayersGuildRank()", -- [1673]
			"<06:54:36> <DEBUG>		Found Guild Rank: Raider", -- [1674]
			"<06:54:36> <DEBUG>		GetML()", -- [1675]
			"<06:54:36> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1676]
			"08/01/23", -- [1677]
			"<07:03:31> <INFO>		Logged In", -- [1678]
			"<07:03:31> <INFO>[ML]		Init", -- [1679]
			"<07:03:31> <INFO>		RCLootCouncil	TradeUI enabled", -- [1680]
			"<07:03:32> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1681]
			"<07:03:32> <DEBUG>		ActivateSkin	bfa", -- [1682]
			"<07:03:35> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1683]
			"<07:03:35> <INFO>		UpdatePlayersData()", -- [1684]
			"<07:03:35> <INFO>		Player relog...", -- [1685]
			"<07:03:36> <DEBUG>		GetPlayersGuildRank()", -- [1686]
			"<07:03:36> <DEBUG>		Found Guild Rank: Raider", -- [1687]
			"<07:03:36> <DEBUG>		GetML()", -- [1688]
			"<07:03:36> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1689]
			"<07:57:29> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1690]
			"<07:57:29> <INFO>		UpdatePlayersData()", -- [1691]
			"<07:57:31> <DEBUG>		GetML()", -- [1692]
			"<08:31:12> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1693]
			"<08:31:12> <INFO>		UpdatePlayersData()", -- [1694]
			"<08:31:13> <DEBUG>		GetML()", -- [1695]
			"<09:31:21> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1696]
			"<09:31:21> <INFO>		UpdatePlayersData()", -- [1697]
			"<09:31:22> <DEBUG>		GetML()", -- [1698]
			"<09:33:21> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1699]
			"<09:33:21> <INFO>		UpdatePlayersData()", -- [1700]
			"<09:33:22> <DEBUG>		GetML()", -- [1701]
			"08/01/23", -- [1702]
			"<09:40:16> <INFO>		Logged In", -- [1703]
			"<09:40:16> <INFO>[ML]		Init", -- [1704]
			"<09:40:16> <INFO>		RCLootCouncil	TradeUI enabled", -- [1705]
			"<09:40:17> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1706]
			"<09:40:17> <DEBUG>		ActivateSkin	bfa", -- [1707]
			"<09:40:20> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1708]
			"<09:40:20> <INFO>		UpdatePlayersData()", -- [1709]
			"<09:40:20> <INFO>		Player relog...", -- [1710]
			"<09:40:21> <DEBUG>		GetPlayersGuildRank()", -- [1711]
			"<09:40:21> <DEBUG>		Found Guild Rank: Raider", -- [1712]
			"<09:40:21> <DEBUG>		GetML()", -- [1713]
			"<09:40:22> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1714]
			"08/01/23", -- [1715]
			"<09:44:48> <INFO>		Logged In", -- [1716]
			"<09:44:48> <INFO>[ML]		Init", -- [1717]
			"<09:44:48> <INFO>		RCLootCouncil	TradeUI enabled", -- [1718]
			"<09:44:50> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1719]
			"<09:44:50> <DEBUG>		ActivateSkin	bfa", -- [1720]
			"<09:44:52> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1721]
			"<09:44:52> <INFO>		UpdatePlayersData()", -- [1722]
			"<09:44:52> <INFO>		Player relog...", -- [1723]
			"<09:44:53> <DEBUG>		GetPlayersGuildRank()", -- [1724]
			"<09:44:53> <DEBUG>		Found Guild Rank: Raider", -- [1725]
			"<09:44:53> <DEBUG>		GetML()", -- [1726]
			"<09:44:54> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1727]
			"<09:56:40> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1728]
			"<09:56:40> <INFO>		UpdatePlayersData()", -- [1729]
			"<09:56:42> <DEBUG>		GetML()", -- [1730]
			"<09:57:44> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1731]
			"<09:57:44> <INFO>		UpdatePlayersData()", -- [1732]
			"<09:57:46> <DEBUG>		GetML()", -- [1733]
			"<10:08:36> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1734]
			"<10:08:36> <INFO>		UpdatePlayersData()", -- [1735]
			"<10:08:38> <DEBUG>		GetML()", -- [1736]
			"08/01/23", -- [1737]
			"<10:09:39> <INFO>		Logged In", -- [1738]
			"<10:09:39> <INFO>[ML]		Init", -- [1739]
			"<10:09:39> <INFO>		RCLootCouncil	TradeUI enabled", -- [1740]
			"<10:09:40> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1741]
			"<10:09:40> <DEBUG>		ActivateSkin	bfa", -- [1742]
			"<10:09:43> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1743]
			"<10:09:43> <INFO>		UpdatePlayersData()", -- [1744]
			"<10:09:43> <INFO>		Player relog...", -- [1745]
			"<10:09:45> <DEBUG>		GetML()", -- [1746]
			"<10:09:45> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1747]
			"<10:09:48> <DEBUG>		GetPlayersGuildRank()", -- [1748]
			"<10:09:48> <DEBUG>		Found Guild Rank: Raider", -- [1749]
			"<10:10:23> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1750]
			"<10:10:23> <INFO>		UpdatePlayersData()", -- [1751]
			"<10:10:24> <DEBUG>		GetML()", -- [1752]
			"<10:26:47> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1753]
			"<10:26:47> <INFO>		UpdatePlayersData()", -- [1754]
			"<10:26:49> <DEBUG>		GetML()", -- [1755]
			"<10:28:25> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1756]
			"<10:28:25> <INFO>		UpdatePlayersData()", -- [1757]
			"<10:28:27> <DEBUG>		GetML()", -- [1758]
			"<10:32:41> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1759]
			"<10:32:41> <INFO>		UpdatePlayersData()", -- [1760]
			"<10:32:43> <DEBUG>		GetML()", -- [1761]
			"<10:34:01> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1762]
			"<10:34:01> <INFO>		UpdatePlayersData()", -- [1763]
			"<10:34:03> <DEBUG>		GetML()", -- [1764]
			"<10:35:47> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1765]
			"<10:35:47> <INFO>		UpdatePlayersData()", -- [1766]
			"<10:35:49> <DEBUG>		GetML()", -- [1767]
			"<10:39:41> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1768]
			"<10:39:41> <INFO>		UpdatePlayersData()", -- [1769]
			"<10:39:42> <DEBUG>		GetML()", -- [1770]
			"<10:41:54> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Mábashí-Ragnaros", -- [1771]
			"08/01/23", -- [1772]
			"<10:49:53> <INFO>		Logged In", -- [1773]
			"<10:49:53> <INFO>[ML]		Init", -- [1774]
			"<10:49:53> <INFO>		RCLootCouncil	TradeUI enabled", -- [1775]
			"<10:49:54> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1776]
			"<10:49:54> <DEBUG>		ActivateSkin	bfa", -- [1777]
			"<10:49:57> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1778]
			"<10:49:57> <INFO>		UpdatePlayersData()", -- [1779]
			"<10:49:57> <INFO>		Player relog...", -- [1780]
			"<10:49:59> <DEBUG>		GetPlayersGuildRank()", -- [1781]
			"<10:49:59> <DEBUG>		Found Guild Rank: Raider", -- [1782]
			"<10:49:59> <DEBUG>		GetML()", -- [1783]
			"<10:49:59> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1784]
			"08/01/23", -- [1785]
			"<11:43:38> <INFO>		Logged In", -- [1786]
			"<11:43:38> <INFO>[ML]		Init", -- [1787]
			"<11:43:38> <INFO>		RCLootCouncil	TradeUI enabled", -- [1788]
			"<11:43:46> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [1789]
			"<11:43:46> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1790]
			"<11:43:46> <DEBUG>		ActivateSkin	bfa", -- [1791]
			"<11:43:48> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1792]
			"<11:43:48> <INFO>		UpdatePlayersData()", -- [1793]
			"<11:43:48> <INFO>		Player relog...", -- [1794]
			"<11:43:49> <DEBUG>		GetPlayersGuildRank()", -- [1795]
			"<11:43:49> <DEBUG>		Found Guild Rank: Raider", -- [1796]
			"<11:43:52> <DEBUG>		GetML()", -- [1797]
			"<11:43:53> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1798]
			"08/01/23", -- [1799]
			"<11:45:44> <INFO>		Logged In", -- [1800]
			"<11:45:44> <INFO>[ML]		Init", -- [1801]
			"<11:45:44> <INFO>		RCLootCouncil	TradeUI enabled", -- [1802]
			"<11:45:45> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1803]
			"<11:45:45> <DEBUG>		ActivateSkin	bfa", -- [1804]
			"<11:45:47> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1805]
			"<11:45:47> <INFO>		UpdatePlayersData()", -- [1806]
			"<11:45:47> <INFO>		Player relog...", -- [1807]
			"<11:45:48> <DEBUG>		GetPlayersGuildRank()", -- [1808]
			"<11:45:48> <DEBUG>		Found Guild Rank: Raider", -- [1809]
			"<11:45:49> <DEBUG>		GetML()", -- [1810]
			"<11:45:49> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1811]
			"<12:16:56> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Torashi-Ragnaros", -- [1812]
			"<12:17:44> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Torashi-Ragnaros", -- [1813]
			"<12:22:52> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Torashi-Ragnaros", -- [1814]
			"<12:56:12> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Torashi-Ragnaros", -- [1815]
			"<14:53:13> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1816]
			"<14:53:15> <DEBUG>		GetML()", -- [1817]
			"<14:53:15> <Data.Player>		CreatePlayer	Player-1305-0BDA3903", -- [1818]
			"<14:53:15> <Data.Player>		CreatePlayer	Player-1315-0C45D562", -- [1819]
			"<14:53:15> <Data.Player>		CreatePlayer	Player-3682-0B27F34E", -- [1820]
			"<14:53:15> <Data.Player>		CreatePlayer	Player-604-0A75088C", -- [1821]
			"<14:53:15> <DEBUG>		Resetting council as we have a new ML!", -- [1822]
			"<14:53:15> <INFO>		MasterLooter	Myërs-Kazzak	LootMethod	personalloot", -- [1823]
			"<14:53:30> <DEBUG>		Timer MLdb_check passed", -- [1824]
			"<14:53:30> <Comm>		^1^Sxrealm^T^N1^SMyërs-Kazzak^N2^SMLdb_request^t^^	PARTY	Qpfromage-Ragnaros", -- [1825]
			"<14:53:30> <Comm>		^1^Sxrealm^T^N1^SMyërs-Kazzak^N2^Scouncil_request^t^^	PARTY	Qpfromage-Ragnaros", -- [1826]
			"<14:53:31> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	PARTY	Myërs-Kazzak", -- [1827]
			"<14:53:31> <INFO>		OnMLDBReceived", -- [1828]
			"<14:53:31> <Comm>		^1^Scouncil^T^N1^T^S1305-0BDA3903^B^t^t^^	PARTY	Myërs-Kazzak", -- [1829]
			"<14:53:31> <DEBUG>		isCouncil	false", -- [1830]
			"<14:54:40> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1831]
			"<14:54:40> <INFO>		UpdatePlayersData()", -- [1832]
			"<14:54:41> <DEBUG>		GetML()", -- [1833]
			"<14:56:08> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1834]
			"<14:56:08> <INFO>		UpdatePlayersData()", -- [1835]
			"<14:56:09> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Freehold (Mythic)	54230	0	0", -- [1836]
			"<14:56:10> <DEBUG>		GetML()", -- [1837]
			"<14:57:21> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1838]
			"<14:57:23> <DEBUG>		GetML()", -- [1839]
			"<14:57:23> <DEBUG>		Resetting council as we have a new ML!", -- [1840]
			"<14:57:23> <INFO>		MasterLooter	Laylona-Thrall	LootMethod	personalloot", -- [1841]
			"<14:57:23> <Comm>		^1^SplayerInfoRequest^T^t^^	PARTY	Laylona-Thrall", -- [1842]
			"<14:57:23> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	PARTY	Laylona-Thrall", -- [1843]
			"<14:57:23> <INFO>		OnMLDBReceived", -- [1844]
			"<14:57:23> <Comm>		^1^Sxrealm^T^N1^SLaylona-Thrall^N2^SpI^N3^SDAMAGER^N4^SRaider^N6^N0^N7^N445.875^N8^N64^t^^	PARTY	Qpfromage-Ragnaros", -- [1845]
			"<14:57:23> <Comm>		^1^Sxrealm^T^N1^SLaylona-Thrall^N2^SpI^N3^SDAMAGER^N4^SJust~`Fingertip^N6^N0^N7^N440.6875^N8^N252^t^^	PARTY	Myërs-Kazzak", -- [1846]
			"<14:57:23> <Comm>		^1^SStopHandleLoot^T^t^^	PARTY	Myërs-Kazzak", -- [1847]
			"<14:57:25> <Comm>		^1^Scouncil^T^N1^T^S604-0A75088C^B^t^t^^	PARTY	Laylona-Thrall", -- [1848]
			"<14:57:25> <DEBUG>		isCouncil	false", -- [1849]
			"<14:57:38> <DEBUG>		Timer MLdb_check passed", -- [1850]
			"<15:01:43> <DEBUG>		Event:	ENCOUNTER_START	2093	Skycap'n Kragg	8	5", -- [1851]
			"<15:01:43> <INFO>		UpdatePlayersData()", -- [1852]
			"<15:04:32> <DEBUG>		Event:	ENCOUNTER_END	2093	Skycap'n Kragg	8	5	1", -- [1853]
			"<15:09:12> <DEBUG>		Event:	ENCOUNTER_START	2094	Council o' Captains	8	5", -- [1854]
			"<15:09:12> <INFO>		UpdatePlayersData()", -- [1855]
			"<15:12:18> <DEBUG>		Event:	ENCOUNTER_END	2094	Council o' Captains	8	5	1", -- [1856]
			"<15:16:48> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1857]
			"<15:16:48> <INFO>		UpdatePlayersData()", -- [1858]
			"<15:16:50> <DEBUG>		GetML()", -- [1859]
			"<15:18:39> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1860]
			"<15:18:41> <DEBUG>		GetML()", -- [1861]
			"<15:18:41> <DEBUG>		Resetting council as we have a new ML!", -- [1862]
			"<15:18:41> <INFO>		MasterLooter	Dragondog-Ragnaros	LootMethod	personalloot", -- [1863]
			"<15:18:56> <DEBUG>		Timer MLdb_check passed", -- [1864]
			"<15:19:03> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1865]
			"<15:19:05> <DEBUG>		GetML()", -- [1866]
			"<15:19:05> <DEBUG>		Resetting council as we have a new ML!", -- [1867]
			"<15:19:05> <INFO>		MasterLooter	Qpfromage-Ragnaros	LootMethod	personalloot", -- [1868]
			"<15:19:05> <DEBUG>[ML]		UpdateGroupCouncil	Qpfromage-Ragnaros", -- [1869]
			"<15:19:05> <DEBUG>[ML]		NewML	Qpfromage-Ragnaros", -- [1870]
			"<15:19:05> <DEBUG>[ML]		UpdateMLdb", -- [1871]
			"<15:19:05> <INFO>		OnMLDBReceived", -- [1872]
			"<15:19:05> <Comm>		^1^SplayerInfoRequest^T^t^^	PARTY	Qpfromage-Ragnaros", -- [1873]
			"<15:19:05> <Comm>		^1^Smldb^T^N1^T^S|8^T^S|14^T^S|5^N3^t^t^S|12^N60^S|11^T^S|14^T^t^t^S|1^B^S|2^B^S|5^N3^S|17^B^t^t^^	PARTY	Qpfromage-Ragnaros", -- [1874]
			"<15:19:05> <Comm>		^1^SpI^T^N1^SDAMAGER^N2^SRaider^N4^N0^N5^N445.875^N6^N64^t^^	WHISPER	Qpfromage-Ragnaros", -- [1875]
			"<15:19:07> <DEBUG>[ML]		UpdateGroupCouncil	Qpfromage-Ragnaros", -- [1876]
			"<15:19:07> <Comm>		^1^Scouncil^T^N1^T^S3682-0B236980^B^t^t^^	PARTY	Qpfromage-Ragnaros", -- [1877]
			"<15:19:07> <DEBUG>		isCouncil	true", -- [1878]
			"<15:19:07> <DEBUG>		GetLootDBStatistics()", -- [1879]
			"<15:19:07> <DEBUG>		GetGuildRankNum()", -- [1880]
			"<15:19:07> <INFO>		RCVotingFrame	enabled", -- [1881]
			"<15:19:20> <DEBUG>		Timer MLdb_check passed", -- [1882]
			"<15:19:25> <DEBUG>		Event:	GROUP_LEFT	1	Party-1305-1-0000615B18EA", -- [1883]
			"<15:19:25> <DEBUG>		GetML()", -- [1884]
			"<15:19:25> <INFO>		Stop handling loot", -- [1885]
			"<15:19:25> <INFO>[ML]		Disabled", -- [1886]
			"<15:19:25> <Comm>		^1^SStopHandleLoot^T^t^^	WHISPER	Qpfromage-Ragnaros", -- [1887]
			"08/01/23", -- [1888]
			"<15:29:18> <INFO>		Logged In", -- [1889]
			"<15:29:18> <INFO>[ML]		Init", -- [1890]
			"<15:29:18> <INFO>		RCLootCouncil	TradeUI enabled", -- [1891]
			"<15:29:19> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1892]
			"<15:29:19> <DEBUG>		ActivateSkin	bfa", -- [1893]
			"<15:29:20> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1894]
			"<15:29:20> <INFO>		UpdatePlayersData()", -- [1895]
			"<15:29:20> <INFO>		Player relog...", -- [1896]
			"<15:29:22> <DEBUG>		GetML()", -- [1897]
			"<15:29:22> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1898]
			"<15:29:27> <DEBUG>		GetPlayersGuildRank()", -- [1899]
			"<15:29:27> <DEBUG>		Found Guild Rank: Raider", -- [1900]
			"<16:10:03> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Rejuvlife-Ragnaros", -- [1901]
			"08/01/23", -- [1902]
			"<19:51:17> <INFO>		Logged In", -- [1903]
			"<19:51:17> <INFO>[ML]		Init", -- [1904]
			"<19:51:17> <INFO>		RCLootCouncil	TradeUI enabled", -- [1905]
			"<19:51:22> <Data.Player>		UpdateCachedPlayer - couldn't get PlayerInfoByGUID	Qpfromage-Ragnaros	Player-3682-0B236980", -- [1906]
			"<19:51:22> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1907]
			"<19:51:22> <DEBUG>		ActivateSkin	bfa", -- [1908]
			"<19:51:23> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1909]
			"<19:51:23> <INFO>		UpdatePlayersData()", -- [1910]
			"<19:51:23> <INFO>		Player relog...", -- [1911]
			"<19:51:24> <DEBUG>		GetPlayersGuildRank()", -- [1912]
			"<19:51:24> <DEBUG>		Found Guild Rank: Raider", -- [1913]
			"<19:51:26> <DEBUG>		GetML()", -- [1914]
			"<19:51:27> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1915]
			"<20:10:05> <Comm>		^1^Sv^T^N1^S3.9.0^t^^	GUILD	Asset-Ragnaros", -- [1916]
			"<20:16:25> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Infernodh-Ragnaros", -- [1917]
			"<20:16:25> <Comm>		^1^Sr^T^N1^S3.9.0^N3^T^t^t^^	GUILD	Asset-Ragnaros", -- [1918]
			"<20:46:30> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Wrathwings-Ragnaros", -- [1919]
			"<20:46:32> <DEBUG>		Event:	PARTY_LEADER_CHANGED", -- [1920]
			"<20:46:34> <DEBUG>		GetML()", -- [1921]
			"<20:46:34> <Data.Player>		CreatePlayer	Player-3656-07BF9982", -- [1922]
			"<20:46:34> <Data.Player>		CreatePlayer	Player-3691-09B76285", -- [1923]
			"<20:46:34> <Data.Player>		CreatePlayer	Player-3674-0B219B18", -- [1924]
			"<20:46:34> <DEBUG>		Resetting council as we have a new ML!", -- [1925]
			"<20:46:34> <INFO>		MasterLooter	Jöötikkä-Stormreaver	LootMethod	personalloot", -- [1926]
			"<20:46:49> <DEBUG>		Timer MLdb_check passed", -- [1927]
			"<20:46:49> <Comm>		^1^Sxrealm^T^N1^SJöötikkä-Stormreaver^N2^SMLdb_request^t^^	PARTY	Qpfromage-Ragnaros", -- [1928]
			"<20:46:49> <Comm>		^1^Sxrealm^T^N1^SJöötikkä-Stormreaver^N2^Scouncil_request^t^^	PARTY	Qpfromage-Ragnaros", -- [1929]
			"<20:47:31> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1930]
			"<20:47:31> <INFO>		UpdatePlayersData()", -- [1931]
			"<20:47:32> <DEBUG>		GetML()", -- [1932]
			"<20:48:03> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Smaugthis-Ragnaros", -- [1933]
			"<20:50:37> <DEBUG>		Event:	RAID_INSTANCE_WELCOME	Freehold (Mythic)	32962	0	0", -- [1934]
			"<20:50:38> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1935]
			"<20:50:38> <INFO>		UpdatePlayersData()", -- [1936]
			"<20:50:39> <DEBUG>		GetML()", -- [1937]
			"<20:50:39> <Data.Player>		CreatePlayer	Player-3674-081BF176", -- [1938]
			"<20:56:05> <DEBUG>		Event:	ENCOUNTER_START	2093	Skycap'n Kragg	8	5", -- [1939]
			"<20:56:05> <INFO>		UpdatePlayersData()", -- [1940]
			"<20:58:50> <DEBUG>		Event:	ENCOUNTER_END	2093	Skycap'n Kragg	8	5	1", -- [1941]
			"<21:02:47> <DEBUG>		Event:	ENCOUNTER_START	2094	Council o' Captains	8	5", -- [1942]
			"<21:02:47> <INFO>		UpdatePlayersData()", -- [1943]
			"<21:05:07> <DEBUG>		Event:	ENCOUNTER_END	2094	Council o' Captains	8	5	0", -- [1944]
			"<21:05:16> <DEBUG>		Event:	GROUP_LEFT	1	Party-3656-1-0000679EE16B", -- [1945]
			"<21:05:16> <DEBUG>		GetML()", -- [1946]
			"08/01/23", -- [1947]
			"<21:06:27> <INFO>		Logged In", -- [1948]
			"<21:06:27> <INFO>[ML]		Init", -- [1949]
			"<21:06:27> <INFO>		RCLootCouncil	TradeUI enabled", -- [1950]
			"<21:06:30> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1951]
			"<21:06:30> <DEBUG>		ActivateSkin	bfa", -- [1952]
			"<21:06:32> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1953]
			"<21:06:32> <INFO>		UpdatePlayersData()", -- [1954]
			"<21:06:32> <INFO>		Player relog...", -- [1955]
			"<21:06:34> <DEBUG>		GetML()", -- [1956]
			"<21:06:35> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1957]
			"<21:06:36> <DEBUG>		GetPlayersGuildRank()", -- [1958]
			"<21:06:36> <DEBUG>		Found Guild Rank: Raider", -- [1959]
			"<21:06:50> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	false", -- [1960]
			"<21:06:50> <INFO>		UpdatePlayersData()", -- [1961]
			"<21:06:52> <DEBUG>		GetML()", -- [1962]
			"08/01/23", -- [1963]
			"<21:08:13> <INFO>		Logged In", -- [1964]
			"<21:08:13> <INFO>[ML]		Init", -- [1965]
			"<21:08:13> <INFO>		RCLootCouncil	TradeUI enabled", -- [1966]
			"<21:08:14> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1967]
			"<21:08:14> <DEBUG>		ActivateSkin	bfa", -- [1968]
			"<21:08:15> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1969]
			"<21:08:15> <INFO>		UpdatePlayersData()", -- [1970]
			"<21:08:15> <INFO>		Player relog...", -- [1971]
			"<21:08:16> <DEBUG>		GetPlayersGuildRank()", -- [1972]
			"<21:08:16> <DEBUG>		Found Guild Rank: Raider", -- [1973]
			"<21:08:17> <DEBUG>		GetML()", -- [1974]
			"<21:08:17> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1975]
			"08/01/23", -- [1976]
			"<21:08:45> <INFO>		Logged In", -- [1977]
			"<21:08:45> <INFO>[ML]		Init", -- [1978]
			"<21:08:45> <INFO>		RCLootCouncil	TradeUI enabled", -- [1979]
			"<21:08:46> <INFO>		Qpfromage-Ragnaros	3.9.1	nil", -- [1980]
			"<21:08:46> <DEBUG>		ActivateSkin	bfa", -- [1981]
			"<21:08:47> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	false	true", -- [1982]
			"<21:08:47> <INFO>		UpdatePlayersData()", -- [1983]
			"<21:08:47> <INFO>		Player relog...", -- [1984]
			"<21:08:48> <DEBUG>		GetPlayersGuildRank()", -- [1985]
			"<21:08:48> <DEBUG>		Found Guild Rank: Raider", -- [1986]
			"<21:08:49> <DEBUG>		GetML()", -- [1987]
			"<21:08:49> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Qpfromage-Ragnaros", -- [1988]
			"<21:10:59> <Comm>		^1^Sv^T^N1^S3.9.1^t^^	GUILD	Hev-Ragnaros", -- [1989]
			"08/22/23", -- [1990]
			"<03:29:19> <INFO>		Logged In", -- [1991]
			"<03:29:19> <INFO>[ML]		Init", -- [1992]
			"<03:29:19> <INFO>		RCLootCouncil	TradeUI enabled", -- [1993]
			"<03:29:34> <Data.Player>		CreatePlayer	Player-3682-0B310D76", -- [1994]
			"<03:29:34> <INFO>		Unknown	3.9.1	nil", -- [1995]
			"<03:29:34> <DEBUG>		ActivateSkin	bfa", -- [1996]
			"<03:29:38> <DEBUG>		Event:	PLAYER_ENTERING_WORLD	true	false", -- [1997]
			"<03:29:38> <INFO>		UpdatePlayersData()", -- [1998]
			"<03:29:38> <INFO>		Player relog...", -- [1999]
			"<03:29:44> <DEBUG>		GetML()", -- [2000]
		},
		["cache"] = {
			["player"] = {
				["Player-3682-0B116533"] = {
					["name"] = "Fonya-Ragnaros",
					["guid"] = "Player-3682-0B116533",
					["class"] = "ROGUE",
					["cache_time"] = 1676377737,
					["realm"] = "Ragnaros",
				},
				["Player-512-056B435F"] = {
					["name"] = "Pera-Kael'thas",
					["guid"] = "Player-512-056B435F",
					["class"] = "PALADIN",
					["cache_time"] = 1690410198,
					["realm"] = "Kael'thas",
				},
				["Player-1305-0C51B612"] = {
					["name"] = "Lastshamyy-Kazzak",
					["guid"] = "Player-1305-0C51B612",
					["class"] = "SHAMAN",
					["cache_time"] = 1686035164,
					["realm"] = "Kazzak",
				},
				["Player-581-0A63A82B"] = {
					["name"] = "Talna-Blackrock",
					["guid"] = "Player-581-0A63A82B",
					["class"] = "ROGUE",
					["cache_time"] = 1679408696,
					["realm"] = "Blackrock",
				},
				["Player-1303-05925E20"] = {
					["name"] = "War-Aggra(Português)",
					["guid"] = "Player-1303-05925E20",
					["class"] = "SHAMAN",
					["cache_time"] = 1676808823,
					["realm"] = "Aggra(Português)",
				},
				["Player-3391-0C7EAFA3"] = {
					["name"] = "Keeja-Silvermoon",
					["guid"] = "Player-3391-0C7EAFA3",
					["class"] = "DRUID",
					["cache_time"] = 1689677222,
					["realm"] = "Silvermoon",
				},
				["Player-3702-0A57A293"] = {
					["name"] = "Shangho-ArgentDawn",
					["guid"] = "Player-3702-0A57A293",
					["class"] = "MONK",
					["cache_time"] = 1676803451,
					["realm"] = "ArgentDawn",
				},
				["Player-1390-0C8F28B6"] = {
					["name"] = "Hoøo-Hyjal",
					["guid"] = "Player-1390-0C8F28B6",
					["class"] = "MONK",
					["cache_time"] = 1687259300,
					["realm"] = "Hyjal",
				},
				["Player-1305-0C8C665B"] = {
					["name"] = "Kidman-Kazzak",
					["guid"] = "Player-1305-0C8C665B",
					["class"] = "ROGUE",
					["cache_time"] = 1687953960,
					["realm"] = "Kazzak",
				},
				["Player-1604-05DF1F00"] = {
					["name"] = "хлой-СвежевательДуш",
					["guid"] = "Player-1604-05DF1F00",
					["class"] = "ROGUE",
					["cache_time"] = 1687041442,
					["realm"] = "СвежевательДуш",
				},
				["Player-580-0A49392B"] = {
					["ilvl"] = 420.625,
					["guid"] = "Player-580-0A49392B",
					["class"] = "SHAMAN",
					["role"] = "DAMAGER",
					["cache_time"] = 1680432796,
					["realm"] = "Blackmoore",
					["name"] = "Kwekiidoili-Blackmoore",
					["specID"] = 263,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-3674-0ADA4672"] = {
					["name"] = "Bildodaggins-TwistingNether",
					["guid"] = "Player-3674-0ADA4672",
					["class"] = "MONK",
					["cache_time"] = 1689850645,
					["realm"] = "TwistingNether",
				},
				["Player-3686-09EF273C"] = {
					["name"] = "Odinspride-Antonidas",
					["guid"] = "Player-3686-09EF273C",
					["class"] = "WARRIOR",
					["cache_time"] = 1677254693,
					["realm"] = "Antonidas",
				},
				["Player-1929-0F1D3FE4"] = {
					["name"] = "лучший-ПиратскаяБухта",
					["guid"] = "Player-1929-0F1D3FE4",
					["class"] = "HUNTER",
					["cache_time"] = 1679027934,
					["realm"] = "ПиратскаяБухта",
				},
				["Player-1309-0BABA14B"] = {
					["name"] = "Alendaar-Pozzodell'Eternità",
					["guid"] = "Player-1309-0BABA14B",
					["class"] = "PRIEST",
					["cache_time"] = 1679747022,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-1615-0AA4F683"] = {
					["name"] = "друпофану-Ревущийфьорд",
					["guid"] = "Player-1615-0AA4F683",
					["class"] = "DRUID",
					["cache_time"] = 1676327182,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1378-070A8C8A"] = {
					["name"] = "Fellurian-DunModr",
					["guid"] = "Player-1378-070A8C8A",
					["class"] = "HUNTER",
					["cache_time"] = 1686934454,
					["realm"] = "DunModr",
				},
				["Player-1403-09D939F3"] = {
					["name"] = "Aborgman-Draenor",
					["guid"] = "Player-1403-09D939F3",
					["class"] = "ROGUE",
					["cache_time"] = 1676439596,
					["realm"] = "Draenor",
				},
				["Player-1305-0AE60345"] = {
					["name"] = "Containment-Kazzak",
					["guid"] = "Player-1305-0AE60345",
					["class"] = "PALADIN",
					["cache_time"] = 1680700900,
					["realm"] = "Kazzak",
				},
				["Player-3692-09FCD01D"] = {
					["name"] = "Soulschamy-Eredar",
					["guid"] = "Player-3692-09FCD01D",
					["class"] = "SHAMAN",
					["cache_time"] = 1686754263,
					["realm"] = "Eredar",
				},
				["Player-1305-0C497276"] = {
					["name"] = "Falsedk-Kazzak",
					["guid"] = "Player-1305-0C497276",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678765881,
					["realm"] = "Kazzak",
				},
				["Player-1615-0B17B5B5"] = {
					["name"] = "сеториор-Ревущийфьорд",
					["guid"] = "Player-1615-0B17B5B5",
					["class"] = "PALADIN",
					["cache_time"] = 1677126111,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1621-089407D5"] = {
					["name"] = "Lucemsanctäm-Dalaran",
					["guid"] = "Player-1621-089407D5",
					["class"] = "PALADIN",
					["cache_time"] = 1688985337,
					["realm"] = "Dalaran",
				},
				["Player-3391-0C00C9B5"] = {
					["ilvl"] = 418.125,
					["guid"] = "Player-3391-0C00C9B5",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["cache_time"] = 1678066914,
					["realm"] = "Silvermoon",
					["name"] = "Melwalor-Silvermoon",
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["rank"] = "Vantus Runer",
				},
				["Player-1127-08FB53FB"] = {
					["name"] = "Chrônicle-KirinTor",
					["guid"] = "Player-1127-08FB53FB",
					["class"] = "PALADIN",
					["cache_time"] = 1684945104,
					["realm"] = "KirinTor",
				},
				["Player-3690-0B161758"] = {
					["name"] = "Donogrif-KhazModan",
					["guid"] = "Player-3690-0B161758",
					["class"] = "DRUID",
					["cache_time"] = 1675869700,
					["realm"] = "KhazModan",
				},
				["Player-3674-087C0AA6"] = {
					["role"] = "DAMAGER",
					["name"] = "Leydi-TwistingNether",
					["guid"] = "Player-3674-087C0AA6",
					["realm"] = "TwistingNether",
					["class"] = "WARRIOR",
					["cache_time"] = 1677665910,
					["rank"] = "Trail Raider",
				},
				["Player-1305-0C7F3743"] = {
					["name"] = "Chilldust-Kazzak",
					["guid"] = "Player-1305-0C7F3743",
					["class"] = "EVOKER",
					["cache_time"] = 1677957827,
					["realm"] = "Kazzak",
				},
				["Player-1402-0665E880"] = {
					["name"] = "Nuadhu-Turalyon",
					["guid"] = "Player-1402-0665E880",
					["class"] = "PRIEST",
					["cache_time"] = 1676967298,
					["realm"] = "Turalyon",
				},
				["Player-3713-09F7D63C"] = {
					["name"] = "Cherryflame-Al'Akir",
					["guid"] = "Player-3713-09F7D63C",
					["class"] = "PALADIN",
					["cache_time"] = 1677606779,
					["realm"] = "Al'Akir",
				},
				["Player-1305-0645EEE6"] = {
					["name"] = "Agnis-Kazzak",
					["guid"] = "Player-1305-0645EEE6",
					["class"] = "MAGE",
					["cache_time"] = 1679506666,
					["realm"] = "Kazzak",
				},
				["Player-3702-0A4622CE"] = {
					["role"] = "HEALER",
					["name"] = "Lopan-ArgentDawn",
					["guid"] = "Player-3702-0A4622CE",
					["rank"] = "Member",
					["class"] = "PALADIN",
					["cache_time"] = 1676343727,
					["realm"] = "ArgentDawn",
				},
				["Player-1084-0A8947B4"] = {
					["name"] = "Níõhöggr-TarrenMill",
					["guid"] = "Player-1084-0A8947B4",
					["class"] = "EVOKER",
					["cache_time"] = 1677309445,
					["realm"] = "TarrenMill",
				},
				["Player-3391-0C857AD9"] = {
					["name"] = "Botare-Silvermoon",
					["guid"] = "Player-3391-0C857AD9",
					["class"] = "DRUID",
					["cache_time"] = 1678894799,
					["realm"] = "Silvermoon",
				},
				["Player-1379-09669335"] = {
					["name"] = "Sicarone-Sanguino",
					["guid"] = "Player-1379-09669335",
					["class"] = "PALADIN",
					["cache_time"] = 1688166624,
					["realm"] = "Sanguino",
				},
				["Player-1335-05CD9264"] = {
					["name"] = "Aok-Ysondre",
					["guid"] = "Player-1335-05CD9264",
					["class"] = "PRIEST",
					["cache_time"] = 1680421947,
					["realm"] = "Ysondre",
				},
				["Player-1307-0C574CB0"] = {
					["name"] = "Sáphira-ChamberofAspects",
					["guid"] = "Player-1307-0C574CB0",
					["class"] = "EVOKER",
					["cache_time"] = 1676806970,
					["realm"] = "ChamberofAspects",
				},
				["Player-1305-026AE2F4"] = {
					["name"] = "Riro-Kazzak",
					["guid"] = "Player-1305-026AE2F4",
					["class"] = "PRIEST",
					["cache_time"] = 1685766281,
					["realm"] = "Kazzak",
				},
				["Player-1602-052EA21A"] = {
					["name"] = "саппорт-Гордунни",
					["guid"] = "Player-1602-052EA21A",
					["class"] = "MONK",
					["cache_time"] = 1678491178,
					["realm"] = "Гордунни",
				},
				["Player-3686-09A5AFB2"] = {
					["name"] = "Alvarim-Antonidas",
					["guid"] = "Player-3686-09A5AFB2",
					["class"] = "WARRIOR",
					["cache_time"] = 1680642957,
					["realm"] = "Antonidas",
				},
				["Player-3691-09F198EC"] = {
					["name"] = "Nöka-Blackhand",
					["guid"] = "Player-3691-09F198EC",
					["class"] = "HUNTER",
					["cache_time"] = 1677071253,
					["realm"] = "Blackhand",
				},
				["Player-1403-0A6EA39C"] = {
					["name"] = "Hemondünter-Draenor",
					["guid"] = "Player-1403-0A6EA39C",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685398638,
					["realm"] = "Draenor",
				},
				["Player-3682-0B2517E8"] = {
					["name"] = "Ninavoker-Ragnaros",
					["guid"] = "Player-3682-0B2517E8",
					["class"] = "EVOKER",
					["cache_time"] = 1687248521,
					["realm"] = "Ragnaros",
				},
				["Player-1390-0C5311B0"] = {
					["name"] = "Ardaga-Hyjal",
					["guid"] = "Player-1390-0C5311B0",
					["class"] = "EVOKER",
					["cache_time"] = 1683963820,
					["realm"] = "Hyjal",
				},
				["Player-1084-0A8BBC56"] = {
					["name"] = "Mêssy-TarrenMill",
					["guid"] = "Player-1084-0A8BBC56",
					["class"] = "EVOKER",
					["cache_time"] = 1685398638,
					["realm"] = "TarrenMill",
				},
				["Player-3702-0948F5DD"] = {
					["name"] = "Viscara-ArgentDawn",
					["guid"] = "Player-3702-0948F5DD",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677392792,
					["realm"] = "ArgentDawn",
				},
				["Player-3682-07B60CFB"] = {
					["name"] = "Dita-Ragnaros",
					["guid"] = "Player-3682-07B60CFB",
					["class"] = "MAGE",
					["cache_time"] = 1689700268,
					["realm"] = "Ragnaros",
				},
				["Player-1084-090F2427"] = {
					["name"] = "Bledel-TarrenMill",
					["guid"] = "Player-1084-090F2427",
					["class"] = "ROGUE",
					["cache_time"] = 1689677188,
					["realm"] = "TarrenMill",
				},
				["Player-1615-09CAA40A"] = {
					["name"] = "зугреб-Ревущийфьорд",
					["guid"] = "Player-1615-09CAA40A",
					["class"] = "WARRIOR",
					["cache_time"] = 1687791012,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1602-0F0DF444"] = {
					["name"] = "вэдъми-Гордунни",
					["guid"] = "Player-1602-0F0DF444",
					["class"] = "MONK",
					["cache_time"] = 1683828690,
					["realm"] = "Гордунни",
				},
				["Player-1403-0A59EBB4"] = {
					["name"] = "Cubatus-Draenor",
					["guid"] = "Player-1403-0A59EBB4",
					["class"] = "WARLOCK",
					["cache_time"] = 1677665404,
					["realm"] = "Draenor",
				},
				["Player-3674-071B6F03"] = {
					["name"] = "Qazinio-TwistingNether",
					["guid"] = "Player-3674-071B6F03",
					["class"] = "PRIEST",
					["cache_time"] = 1684502528,
					["realm"] = "TwistingNether",
				},
				["Player-578-0A63B7A9"] = {
					["name"] = "Akandrîa-Durotan",
					["guid"] = "Player-578-0A63B7A9",
					["class"] = "MAGE",
					["cache_time"] = 1676204312,
					["realm"] = "Durotan",
				},
				["Player-1305-0ACD19E9"] = {
					["name"] = "Fyrmästare-Kazzak",
					["guid"] = "Player-1305-0ACD19E9",
					["class"] = "SHAMAN",
					["cache_time"] = 1687102801,
					["realm"] = "Kazzak",
				},
				["Player-1925-0B8C8984"] = {
					["name"] = "рубий-ВечнаяПесня",
					["guid"] = "Player-1925-0B8C8984",
					["class"] = "WARRIOR",
					["cache_time"] = 1677309445,
					["realm"] = "ВечнаяПесня",
				},
				["Player-1305-0C3E73ED"] = {
					["name"] = "Mikeonabike-Kazzak",
					["guid"] = "Player-1305-0C3E73ED",
					["class"] = "DRUID",
					["cache_time"] = 1685393886,
					["realm"] = "Kazzak",
				},
				["Player-604-0A29CFDB"] = {
					["name"] = "Hopeman-Thrall",
					["guid"] = "Player-604-0A29CFDB",
					["class"] = "HUNTER",
					["cache_time"] = 1680754040,
					["realm"] = "Thrall",
				},
				["Player-2073-09FFA53F"] = {
					["name"] = "Floohabba-Stormscale",
					["guid"] = "Player-2073-09FFA53F",
					["class"] = "PRIEST",
					["cache_time"] = 1687257934,
					["realm"] = "Stormscale",
				},
				["Player-1604-0A1C65FE"] = {
					["name"] = "мотрем-СвежевательДуш",
					["guid"] = "Player-1604-0A1C65FE",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680290814,
					["realm"] = "СвежевательДуш",
				},
				["Player-1092-07D94BF3"] = {
					["name"] = "Sacriwar-Drak'thul",
					["guid"] = "Player-1092-07D94BF3",
					["class"] = "WARRIOR",
					["cache_time"] = 1678126084,
					["realm"] = "Drak'thul",
				},
				["Player-3682-0B199437"] = {
					["ilvl"] = 416.5,
					["guid"] = "Player-3682-0B199437",
					["class"] = "DEMONHUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1679519132,
					["rank"] = "Mythic Raider",
					["name"] = "Crunchypie-Ragnaros",
					["specID"] = 577,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-570-05B25455"] = {
					["name"] = "Kredar-Baelgun",
					["guid"] = "Player-570-05B25455",
					["class"] = "HUNTER",
					["cache_time"] = 1677315157,
					["realm"] = "Baelgun",
				},
				["Player-1084-0A805A9C"] = {
					["name"] = "Piingf-TarrenMill",
					["guid"] = "Player-1084-0A805A9C",
					["class"] = "EVOKER",
					["cache_time"] = 1688687303,
					["realm"] = "TarrenMill",
				},
				["Player-1084-05CA14A6"] = {
					["name"] = "Moonk-TarrenMill",
					["guid"] = "Player-1084-05CA14A6",
					["class"] = "MONK",
					["cache_time"] = 1684015318,
					["realm"] = "TarrenMill",
				},
				["Player-1084-0A915283"] = {
					["name"] = "Valeniino-TarrenMill",
					["guid"] = "Player-1084-0A915283",
					["class"] = "PRIEST",
					["cache_time"] = 1686121310,
					["realm"] = "TarrenMill",
				},
				["Player-3682-09DDBAF6"] = {
					["ilvl"] = 445.5,
					["guid"] = "Player-3682-09DDBAF6",
					["class"] = "WARLOCK",
					["role"] = "DAMAGER",
					["cache_time"] = 1689281451,
					["realm"] = "Ragnaros",
					["name"] = "Grats-Ragnaros",
					["specID"] = 266,
					["enchantingLvl"] = 0,
					["rank"] = "Core",
				},
				["Player-1390-0C5ABBAE"] = {
					["name"] = "Yødà-Hyjal",
					["guid"] = "Player-1390-0C5ABBAE",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677665404,
					["realm"] = "Hyjal",
				},
				["Player-3674-0B09E8EA"] = {
					["name"] = "Magicwingers-TwistingNether",
					["guid"] = "Player-3674-0B09E8EA",
					["class"] = "EVOKER",
					["cache_time"] = 1678461554,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0B0AB856"] = {
					["ilvl"] = 418.125,
					["guid"] = "Player-1305-0B0AB856",
					["class"] = "WARRIOR",
					["role"] = "TANK",
					["cache_time"] = 1680437946,
					["realm"] = "Kazzak",
					["name"] = "Ogrihm-Kazzak",
					["specID"] = 73,
					["enchantingLvl"] = 0,
					["rank"] = "Team 1",
				},
				["Player-3682-0B0E28E2"] = {
					["name"] = "Homei-Ragnaros",
					["guid"] = "Player-3682-0B0E28E2",
					["class"] = "EVOKER",
					["cache_time"] = 1676421933,
					["realm"] = "Ragnaros",
				},
				["Player-3702-0A947D42"] = {
					["name"] = "Toastey-ArgentDawn",
					["guid"] = "Player-3702-0A947D42",
					["class"] = "WARRIOR",
					["cache_time"] = 1684501707,
					["realm"] = "ArgentDawn",
				},
				["Player-1379-0AD179DC"] = {
					["name"] = "Jotä-Sanguino",
					["guid"] = "Player-1379-0AD179DC",
					["class"] = "EVOKER",
					["cache_time"] = 1676446776,
					["realm"] = "Sanguino",
				},
				["Player-3674-0B0B150B"] = {
					["name"] = "Dragonbica-TwistingNether",
					["guid"] = "Player-3674-0B0B150B",
					["class"] = "EVOKER",
					["cache_time"] = 1676439582,
					["realm"] = "TwistingNether",
				},
				["Player-3692-045CC609"] = {
					["name"] = "Odoil-Eredar",
					["guid"] = "Player-3692-045CC609",
					["class"] = "HUNTER",
					["cache_time"] = 1678641239,
					["realm"] = "Eredar",
				},
				["Player-1307-03B151CC"] = {
					["name"] = "Scraggy-ChamberofAspects",
					["guid"] = "Player-1307-03B151CC",
					["class"] = "DRUID",
					["cache_time"] = 1688983952,
					["realm"] = "ChamberofAspects",
				},
				["Player-3391-0C636F3D"] = {
					["name"] = "Axemastèr-Silvermoon",
					["guid"] = "Player-3391-0C636F3D",
					["class"] = "WARRIOR",
					["cache_time"] = 1690750821,
					["realm"] = "Silvermoon",
				},
				["Player-1403-0A666657"] = {
					["name"] = "Oblutak-Draenor",
					["guid"] = "Player-1403-0A666657",
					["class"] = "WARLOCK",
					["cache_time"] = 1689804288,
					["realm"] = "Draenor",
				},
				["Player-3674-0B1C8D3F"] = {
					["name"] = "Oglus-TwistingNether",
					["guid"] = "Player-3674-0B1C8D3F",
					["class"] = "HUNTER",
					["cache_time"] = 1679506666,
					["realm"] = "TwistingNether",
				},
				["Player-3679-0C844D0E"] = {
					["name"] = "Hubbischurke-Aegwynn",
					["guid"] = "Player-3679-0C844D0E",
					["class"] = "ROGUE",
					["cache_time"] = 1678052884,
					["realm"] = "Aegwynn",
				},
				["Player-3713-0AA36A78"] = {
					["name"] = "Obdukcja-BurningLegion",
					["guid"] = "Player-3713-0AA36A78",
					["class"] = "SHAMAN",
					["cache_time"] = 1689397818,
					["realm"] = "BurningLegion",
				},
				["Player-1315-0A3B7E01"] = {
					["name"] = "Haüru-Elune",
					["guid"] = "Player-1315-0A3B7E01",
					["class"] = "HUNTER",
					["cache_time"] = 1685871367,
					["realm"] = "Elune",
				},
				["Player-3713-0737034A"] = {
					["name"] = "Garuacz-BurningLegion",
					["guid"] = "Player-3713-0737034A",
					["class"] = "WARRIOR",
					["cache_time"] = 1684231108,
					["realm"] = "BurningLegion",
				},
				["Player-1335-09C7017D"] = {
					["name"] = "Hizual-Ysondre",
					["guid"] = "Player-1335-09C7017D",
					["class"] = "WARRIOR",
					["cache_time"] = 1685780231,
					["realm"] = "Ysondre",
				},
				["Player-1615-0B21BFF5"] = {
					["name"] = "детывоин-Ревущийфьорд",
					["guid"] = "Player-1615-0B21BFF5",
					["class"] = "WARRIOR",
					["cache_time"] = 1684207657,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1621-0B01998F"] = {
					["name"] = "Tôc-Eldre'Thalas",
					["guid"] = "Player-1621-0B01998F",
					["class"] = "HUNTER",
					["cache_time"] = 1689772053,
					["realm"] = "Eldre'Thalas",
				},
				["Player-580-0A732180"] = {
					["name"] = "Lutharion-Blackmoore",
					["guid"] = "Player-580-0A732180",
					["class"] = "PALADIN",
					["cache_time"] = 1684223693,
					["realm"] = "Blackmoore",
				},
				["Player-3682-0B236980"] = {
					["ilvl"] = 445.875,
					["guid"] = "Player-3682-0B236980",
					["class"] = "MAGE",
					["role"] = "DAMAGER",
					["cache_time"] = 1690916927,
					["rank"] = "Raider",
					["name"] = "Qpfromage-Ragnaros",
					["specID"] = 64,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-3713-0AD15516"] = {
					["name"] = "Widzet-BurningLegion",
					["guid"] = "Player-3713-0AD15516",
					["class"] = "EVOKER",
					["cache_time"] = 1686710191,
					["realm"] = "BurningLegion",
				},
				["Player-1084-08CB09DE"] = {
					["name"] = "Erzya-TarrenMill",
					["guid"] = "Player-1084-08CB09DE",
					["class"] = "PRIEST",
					["cache_time"] = 1687261056,
					["realm"] = "TarrenMill",
				},
				["Player-1329-09A7A974"] = {
					["name"] = "Borgundvaag-Ravencrest",
					["guid"] = "Player-1329-09A7A974",
					["class"] = "DRUID",
					["cache_time"] = 1685573000,
					["realm"] = "Ravencrest",
				},
				["Player-3686-09C38297"] = {
					["name"] = "Bushyatsa-Antonidas",
					["guid"] = "Player-3686-09C38297",
					["class"] = "HUNTER",
					["cache_time"] = 1680395992,
					["realm"] = "Antonidas",
				},
				["Player-1604-0F5AC6BD"] = {
					["name"] = "фаремира-СвежевательДуш",
					["guid"] = "Player-1604-0F5AC6BD",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1688985357,
					["realm"] = "СвежевательДуш",
				},
				["Player-3682-080A4D43"] = {
					["name"] = "Aarrggh-Ragnaros",
					["guid"] = "Player-3682-080A4D43",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1685552508,
					["realm"] = "Ragnaros",
				},
				["Player-1928-0A6CA636"] = {
					["name"] = "элунэс-Голдринн",
					["guid"] = "Player-1928-0A6CA636",
					["class"] = "DRUID",
					["cache_time"] = 1679632936,
					["realm"] = "Голдринн",
				},
				["Player-1402-0A306BBB"] = {
					["name"] = "Cathrosar-Turalyon",
					["guid"] = "Player-1402-0A306BBB",
					["class"] = "WARLOCK",
					["cache_time"] = 1676168526,
					["realm"] = "Turalyon",
				},
				["Player-1084-0A95C746"] = {
					["name"] = "Hõlymoly-TarrenMill",
					["guid"] = "Player-1084-0A95C746",
					["class"] = "PALADIN",
					["cache_time"] = 1684475487,
					["realm"] = "TarrenMill",
				},
				["Player-3702-0782BE91"] = {
					["name"] = "Nohrinat-ArgentDawn",
					["guid"] = "Player-3702-0782BE91",
					["class"] = "DRUID",
					["cache_time"] = 1685740823,
					["realm"] = "ArgentDawn",
				},
				["Player-1084-0A811422"] = {
					["role"] = "HEALER",
					["name"] = "Funkyevoker-TarrenMill",
					["guid"] = "Player-1084-0A811422",
					["realm"] = "TarrenMill",
					["class"] = "EVOKER",
					["cache_time"] = 1676377737,
					["rank"] = "Unguilded",
				},
				["Player-1602-0F54C333"] = {
					["name"] = "шокич-Гордунни",
					["guid"] = "Player-1602-0F54C333",
					["class"] = "SHAMAN",
					["cache_time"] = 1687952836,
					["realm"] = "Гордунни",
				},
				["Player-580-07EFE99C"] = {
					["name"] = "Sanok-Blackmoore",
					["guid"] = "Player-580-07EFE99C",
					["class"] = "WARLOCK",
					["cache_time"] = 1684487461,
					["realm"] = "Blackmoore",
				},
				["Player-3674-08A0EA98"] = {
					["ilvl"] = 117.5625,
					["guid"] = "Player-3674-08A0EA98",
					["class"] = "DEMONHUNTER",
					["role"] = "TANK",
					["cache_time"] = 1686184517,
					["rank"] = "Unguilded",
					["name"] = "Lúkè-TwistingNether",
					["specID"] = 581,
					["enchantingLvl"] = 0,
					["realm"] = "TwistingNether",
				},
				["Player-1402-07508EC4"] = {
					["name"] = "Sweetkatha-Doomhammer",
					["guid"] = "Player-1402-07508EC4",
					["class"] = "ROGUE",
					["cache_time"] = 1677607191,
					["realm"] = "Doomhammer",
				},
				["Player-3674-0B1D49C1"] = {
					["name"] = "Kyrii-TwistingNether",
					["guid"] = "Player-3674-0B1D49C1",
					["class"] = "WARRIOR",
					["cache_time"] = 1680754040,
					["realm"] = "TwistingNether",
				},
				["Player-3682-06ECD02B"] = {
					["ilvl"] = 422.5625,
					["guid"] = "Player-3682-06ECD02B",
					["class"] = "DRUID",
					["realm"] = "Ragnaros",
					["role"] = "DAMAGER",
					["cache_time"] = 1686170430,
					["name"] = "Shaamoo-Ragnaros",
					["specID"] = 103,
					["enchanter"] = true,
					["enchantingLvl"] = 100,
					["rank"] = "Raider",
				},
				["Player-580-0A39949F"] = {
					["name"] = "Setokaya-Blackmoore",
					["guid"] = "Player-580-0A39949F",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677606207,
					["realm"] = "Blackmoore",
				},
				["Player-3391-0A60439B"] = {
					["name"] = "Marshy-Silvermoon",
					["guid"] = "Player-3391-0A60439B",
					["class"] = "PALADIN",
					["cache_time"] = 1679747022,
					["realm"] = "Silvermoon",
				},
				["Player-3681-0AC6229A"] = {
					["name"] = "Squishpunch-Magtheridon",
					["guid"] = "Player-3681-0AC6229A",
					["class"] = "MONK",
					["cache_time"] = 1679043246,
					["realm"] = "Magtheridon",
				},
				["Player-3674-06BAECD5"] = {
					["name"] = "Kaplati-TwistingNether",
					["guid"] = "Player-3674-06BAECD5",
					["class"] = "PRIEST",
					["cache_time"] = 1680003722,
					["realm"] = "TwistingNether",
				},
				["Player-3391-0C4CC839"] = {
					["name"] = "Sparkious-Silvermoon",
					["guid"] = "Player-3391-0C4CC839",
					["class"] = "HUNTER",
					["cache_time"] = 1687041442,
					["realm"] = "Silvermoon",
				},
				["Player-3674-0B21A0CE"] = {
					["name"] = "Dotmaniac-TwistingNether",
					["guid"] = "Player-3674-0B21A0CE",
					["class"] = "PRIEST",
					["cache_time"] = 1686935978,
					["realm"] = "TwistingNether",
				},
				["Player-1403-0A6DE58E"] = {
					["name"] = "Vampíríc-Draenor",
					["guid"] = "Player-1403-0A6DE58E",
					["class"] = "PRIEST",
					["cache_time"] = 1684412175,
					["realm"] = "Draenor",
				},
				["Player-1403-0A67EE70"] = {
					["name"] = "Ghalndar-Draenor",
					["guid"] = "Player-1403-0A67EE70",
					["class"] = "PALADIN",
					["cache_time"] = 1680278206,
					["realm"] = "Draenor",
				},
				["Player-3691-09CAE4E8"] = {
					["name"] = "Stryps-Blackhand",
					["guid"] = "Player-3691-09CAE4E8",
					["class"] = "PRIEST",
					["cache_time"] = 1676387096,
					["realm"] = "Blackhand",
				},
				["Player-581-0A2F687C"] = {
					["name"] = "Schantur-Blackrock",
					["guid"] = "Player-581-0A2F687C",
					["class"] = "WARRIOR",
					["cache_time"] = 1688901714,
					["realm"] = "Blackrock",
				},
				["Player-3674-0B16E5B9"] = {
					["name"] = "Couchorsh-TwistingNether",
					["guid"] = "Player-3674-0B16E5B9",
					["class"] = "SHAMAN",
					["cache_time"] = 1675782444,
					["realm"] = "TwistingNether",
				},
				["Player-1378-0ADF31F6"] = {
					["name"] = "Drakïer-DunModr",
					["guid"] = "Player-1378-0ADF31F6",
					["class"] = "PRIEST",
					["cache_time"] = 1687791302,
					["realm"] = "DunModr",
				},
				["Player-1309-08F5A9B9"] = {
					["name"] = "Gutell-Pozzodell'Eternità",
					["guid"] = "Player-1309-08F5A9B9",
					["class"] = "HUNTER",
					["cache_time"] = 1676466306,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-3692-09653EDF"] = {
					["name"] = "Nebelwirker-Eredar",
					["guid"] = "Player-3692-09653EDF",
					["class"] = "MONK",
					["cache_time"] = 1676168520,
					["realm"] = "Eredar",
				},
				["Player-1928-0E389A74"] = {
					["name"] = "герм-Седогрив",
					["guid"] = "Player-1928-0E389A74",
					["class"] = "SHAMAN",
					["cache_time"] = 1676486742,
					["realm"] = "Седогрив",
				},
				["Player-1096-043793D2"] = {
					["name"] = "Drasil-ScarshieldLegion",
					["guid"] = "Player-1096-043793D2",
					["class"] = "PALADIN",
					["cache_time"] = 1683825214,
					["realm"] = "ScarshieldLegion",
				},
				["Player-604-0A2AE191"] = {
					["name"] = "Suidacra-Thrall",
					["guid"] = "Player-604-0A2AE191",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1684926332,
					["realm"] = "Thrall",
				},
				["Player-3391-0C54204E"] = {
					["name"] = "Flylez-Silvermoon",
					["guid"] = "Player-3391-0C54204E",
					["class"] = "EVOKER",
					["cache_time"] = 1687261056,
					["realm"] = "Silvermoon",
				},
				["Player-1390-0C457AC9"] = {
					["name"] = "Mellios-Hyjal",
					["guid"] = "Player-1390-0C457AC9",
					["class"] = "HUNTER",
					["cache_time"] = 1684883011,
					["realm"] = "Hyjal",
				},
				["Player-3674-0B199446"] = {
					["name"] = "Sightxpala-TwistingNether",
					["guid"] = "Player-3674-0B199446",
					["class"] = "PALADIN",
					["cache_time"] = 1687257934,
					["realm"] = "TwistingNether",
				},
				["Player-3682-0A804B86"] = {
					["name"] = "Envyangel-Ragnaros",
					["guid"] = "Player-3682-0A804B86",
					["class"] = "MAGE",
					["cache_time"] = 1686175017,
					["realm"] = "Ragnaros",
				},
				["Player-1329-09FBFB12"] = {
					["name"] = "Coldtears-Ravencrest",
					["guid"] = "Player-1329-09FBFB12",
					["class"] = "DRUID",
					["cache_time"] = 1685781186,
					["realm"] = "Ravencrest",
				},
				["Player-580-0A72E4F7"] = {
					["name"] = "Michidh-Blackmoore",
					["guid"] = "Player-580-0A72E4F7",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689340203,
					["realm"] = "Blackmoore",
				},
				["Player-1092-0AA22C76"] = {
					["name"] = "Santes-Drak'thul",
					["guid"] = "Player-1092-0AA22C76",
					["class"] = "PRIEST",
					["cache_time"] = 1690225634,
					["realm"] = "Drak'thul",
				},
				["Player-3686-071229FE"] = {
					["name"] = "Dulmir-Antonidas",
					["guid"] = "Player-3686-071229FE",
					["class"] = "PALADIN",
					["cache_time"] = 1685048856,
					["realm"] = "Antonidas",
				},
				["Player-1615-090E6F43"] = {
					["name"] = "зулмун-Ревущийфьорд",
					["guid"] = "Player-1615-090E6F43",
					["class"] = "HUNTER",
					["cache_time"] = 1687791012,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3702-08FED090"] = {
					["name"] = "Minós-ArgentDawn",
					["guid"] = "Player-3702-08FED090",
					["class"] = "DRUID",
					["cache_time"] = 1683808318,
					["realm"] = "ArgentDawn",
				},
				["Player-3682-0B292768"] = {
					["ilvl"] = 444.375,
					["guid"] = "Player-3682-0B292768",
					["class"] = "SHAMAN",
					["rank"] = "Raider",
					["role"] = "DAMAGER",
					["cache_time"] = 1688676359,
					["name"] = "Helpdotcom-Ragnaros",
					["enchanter"] = true,
					["specID"] = 263,
					["enchantingLvl"] = 88,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0C551600"] = {
					["name"] = "Fireføx-Kazzak",
					["guid"] = "Player-1305-0C551600",
					["class"] = "MAGE",
					["cache_time"] = 1689804288,
					["realm"] = "Kazzak",
				},
				["Player-1305-0B9BE63A"] = {
					["name"] = "Miindblast-Kazzak",
					["guid"] = "Player-1305-0B9BE63A",
					["class"] = "PRIEST",
					["cache_time"] = 1686773172,
					["realm"] = "Kazzak",
				},
				["Player-1604-09E69F53"] = {
					["name"] = "турена-СвежевательДуш",
					["guid"] = "Player-1604-09E69F53",
					["class"] = "DRUID",
					["cache_time"] = 1684212886,
					["realm"] = "СвежевательДуш",
				},
				["Player-1379-09959CAB"] = {
					["name"] = "Methal-Sanguino",
					["guid"] = "Player-1379-09959CAB",
					["class"] = "HUNTER",
					["cache_time"] = 1683073733,
					["realm"] = "Sanguino",
				},
				["Player-1084-0A80C6F7"] = {
					["name"] = "Menegroth-TarrenMill",
					["guid"] = "Player-1084-0A80C6F7",
					["class"] = "EVOKER",
					["cache_time"] = 1680290994,
					["realm"] = "TarrenMill",
				},
				["Player-1080-05A32CA4"] = {
					["name"] = "Thirikzal-Bloodhoof",
					["guid"] = "Player-1080-05A32CA4",
					["class"] = "HUNTER",
					["cache_time"] = 1676479581,
					["realm"] = "Bloodhoof",
				},
				["Player-3702-09BA2203"] = {
					["name"] = "Triip-ArgentDawn",
					["guid"] = "Player-3702-09BA2203",
					["class"] = "PRIEST",
					["cache_time"] = 1678458531,
					["realm"] = "ArgentDawn",
				},
				["Player-3674-05A76956"] = {
					["name"] = "Charadhras-TwistingNether",
					["guid"] = "Player-3674-05A76956",
					["class"] = "MAGE",
					["cache_time"] = 1679506666,
					["realm"] = "TwistingNether",
				},
				["Player-3391-09BAB196"] = {
					["name"] = "Aletha-Silvermoon",
					["guid"] = "Player-3391-09BAB196",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687956237,
					["realm"] = "Silvermoon",
				},
				["Player-3691-058CD9E6"] = {
					["name"] = "Alekos-Blackhand",
					["guid"] = "Player-3691-058CD9E6",
					["class"] = "PALADIN",
					["cache_time"] = 1676792641,
					["realm"] = "Blackhand",
				},
				["Player-1615-0B0FA66A"] = {
					["name"] = "непопка-Ревущийфьорд",
					["guid"] = "Player-1615-0B0FA66A",
					["class"] = "EVOKER",
					["cache_time"] = 1685393886,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1084-0A64249D"] = {
					["name"] = "Gulligaulliz-TarrenMill",
					["guid"] = "Player-1084-0A64249D",
					["class"] = "SHAMAN",
					["cache_time"] = 1689677222,
					["realm"] = "TarrenMill",
				},
				["Player-1379-0A72B9B0"] = {
					["name"] = "Mirajanei-Sanguino",
					["guid"] = "Player-1379-0A72B9B0",
					["class"] = "PRIEST",
					["cache_time"] = 1689772053,
					["realm"] = "Sanguino",
				},
				["Player-1615-09A1086E"] = {
					["name"] = "кроссифи-Ревущийфьорд",
					["guid"] = "Player-1615-09A1086E",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684209680,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3657-0ADE4A55"] = {
					["name"] = "Korgrom-Frostwhisper",
					["guid"] = "Player-3657-0ADE4A55",
					["class"] = "HUNTER",
					["cache_time"] = 1687949367,
					["realm"] = "Frostwhisper",
				},
				["Player-1305-0821AD3E"] = {
					["name"] = "Yóruichí-Kazzak",
					["guid"] = "Player-1305-0821AD3E",
					["class"] = "MONK",
					["cache_time"] = 1684472200,
					["realm"] = "Kazzak",
				},
				["Player-1403-0638013F"] = {
					["name"] = "Orcerede-Draenor",
					["guid"] = "Player-1403-0638013F",
					["class"] = "WARRIOR",
					["cache_time"] = 1677665661,
					["realm"] = "Draenor",
				},
				["Player-1335-09F1FD37"] = {
					["name"] = "Cirimillia-Ysondre",
					["guid"] = "Player-1335-09F1FD37",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1678496861,
					["realm"] = "Ysondre",
				},
				["Player-3682-0B181DC4"] = {
					["name"] = "Shørtarse-Ragnaros",
					["guid"] = "Player-3682-0B181DC4",
					["class"] = "SHAMAN",
					["cache_time"] = 1676913794,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0C833B4C"] = {
					["ilvl"] = 416.625,
					["guid"] = "Player-1305-0C833B4C",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1679348432,
					["realm"] = "Kazzak",
					["name"] = "Envyspoon-Kazzak",
					["specID"] = 255,
					["enchantingLvl"] = 0,
					["rank"] = "Rubber Duck",
				},
				["Player-3682-0B1970EA"] = {
					["name"] = "Dracainé-Ragnaros",
					["guid"] = "Player-3682-0B1970EA",
					["class"] = "EVOKER",
					["cache_time"] = 1678726907,
					["realm"] = "Ragnaros",
				},
				["Player-1390-091A40E3"] = {
					["name"] = "Hyasudo-Hyjal",
					["guid"] = "Player-1390-091A40E3",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676789834,
					["realm"] = "Hyjal",
				},
				["Player-3682-0B27F050"] = {
					["ilvl"] = 442.1875,
					["guid"] = "Player-3682-0B27F050",
					["class"] = "MONK",
					["role"] = "DAMAGER",
					["cache_time"] = 1688072566,
					["realm"] = "Ragnaros",
					["name"] = "Skaterble-Ragnaros",
					["specID"] = 269,
					["enchantingLvl"] = 0,
					["rank"] = "Trial",
				},
				["Player-581-06930F71"] = {
					["name"] = "Theprotz-Blackrock",
					["guid"] = "Player-581-06930F71",
					["class"] = "PALADIN",
					["cache_time"] = 1684571566,
					["realm"] = "Blackrock",
				},
				["Player-1403-0A6EC9D6"] = {
					["name"] = "Katamino-Draenor",
					["guid"] = "Player-1403-0A6EC9D6",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1684877955,
					["realm"] = "Draenor",
				},
				["Player-1084-09F552AB"] = {
					["name"] = "Cardînal-TarrenMill",
					["guid"] = "Player-1084-09F552AB",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680695598,
					["realm"] = "TarrenMill",
				},
				["Player-3691-0631594B"] = {
					["name"] = "Nerdwatcher-Blackhand",
					["guid"] = "Player-3691-0631594B",
					["class"] = "PALADIN",
					["cache_time"] = 1677072237,
					["realm"] = "Blackhand",
				},
				["Player-1396-0ADB8FAC"] = {
					["name"] = "Megxy-Quel'Thalas",
					["guid"] = "Player-1396-0ADB8FAC",
					["class"] = "PALADIN",
					["cache_time"] = 1676439582,
					["realm"] = "Quel'Thalas",
				},
				["Player-3692-045EA530"] = {
					["name"] = "Tctaírqt-Eredar",
					["guid"] = "Player-3692-045EA530",
					["class"] = "ROGUE",
					["cache_time"] = 1676486742,
					["realm"] = "Eredar",
				},
				["Player-1302-0A42FD67"] = {
					["name"] = "Nossdarn-Archimonde",
					["guid"] = "Player-1302-0A42FD67",
					["class"] = "ROGUE",
					["cache_time"] = 1686121310,
					["realm"] = "Archimonde",
				},
				["Player-1329-09F888F9"] = {
					["name"] = "Arlinna-Ravencrest",
					["guid"] = "Player-1329-09F888F9",
					["class"] = "DRUID",
					["cache_time"] = 1684561485,
					["realm"] = "Ravencrest",
				},
				["Player-3682-0A620941"] = {
					["ilvl"] = 135.3125,
					["guid"] = "Player-3682-0A620941",
					["class"] = "WARRIOR",
					["role"] = "DAMAGER",
					["cache_time"] = 1686182992,
					["rank"] = "Unguilded",
					["name"] = "Rambónér-Ragnaros",
					["specID"] = 72,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-1301-0C42CB7A"] = {
					["name"] = "Nahó-Outland",
					["guid"] = "Player-1301-0C42CB7A",
					["class"] = "PRIEST",
					["cache_time"] = 1685766281,
					["realm"] = "Outland",
				},
				["Player-1602-0F3F7EF7"] = {
					["name"] = "шмалимэн-Гордунни",
					["guid"] = "Player-1602-0F3F7EF7",
					["class"] = "DRUID",
					["cache_time"] = 1688901714,
					["realm"] = "Гордунни",
				},
				["Player-1305-08E1303D"] = {
					["name"] = "Ticeymour-Kazzak",
					["guid"] = "Player-1305-08E1303D",
					["class"] = "PALADIN",
					["cache_time"] = 1687157932,
					["realm"] = "Kazzak",
				},
				["Player-3682-0B09E34C"] = {
					["ilvl"] = 439.0625,
					["guid"] = "Player-3682-0B09E34C",
					["class"] = "EVOKER",
					["realm"] = "Ragnaros",
					["role"] = "HEALER",
					["cache_time"] = 1687302868,
					["name"] = "Notasset-Ragnaros",
					["specID"] = 1468,
					["enchanter"] = true,
					["enchantingLvl"] = 28,
					["rank"] = "Officer Alt",
				},
				["Player-3674-0B1813BE"] = {
					["name"] = "Selini-TwistingNether",
					["guid"] = "Player-3674-0B1813BE",
					["class"] = "DRUID",
					["cache_time"] = 1687298820,
					["realm"] = "TwistingNether",
				},
				["Player-3691-09F71AB7"] = {
					["name"] = "Kule-Mal'Ganis",
					["guid"] = "Player-3691-09F71AB7",
					["class"] = "MAGE",
					["cache_time"] = 1677321823,
					["realm"] = "Mal'Ganis",
				},
				["Player-3682-05C5694E"] = {
					["name"] = "Misfu-Ragnaros",
					["guid"] = "Player-3682-05C5694E",
					["class"] = "PRIEST",
					["cache_time"] = 1683751096,
					["realm"] = "Ragnaros",
				},
				["Player-1604-0BB55B5F"] = {
					["name"] = "мазайя-СвежевательДуш",
					["guid"] = "Player-1604-0BB55B5F",
					["class"] = "WARLOCK",
					["cache_time"] = 1679138037,
					["realm"] = "СвежевательДуш",
				},
				["Player-1615-0B15947E"] = {
					["name"] = "мэйвисзера-Ревущийфьорд",
					["guid"] = "Player-1615-0B15947E",
					["class"] = "PALADIN",
					["cache_time"] = 1676957994,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1331-06E22DAF"] = {
					["name"] = "Kemosabe-Suramar",
					["guid"] = "Player-1331-06E22DAF",
					["class"] = "SHAMAN",
					["cache_time"] = 1687791302,
					["realm"] = "Suramar",
				},
				["Player-578-037FD767"] = {
					["name"] = "Palanesse-Arthas",
					["guid"] = "Player-578-037FD767",
					["class"] = "PALADIN",
					["cache_time"] = 1679570387,
					["realm"] = "Arthas",
				},
				["Player-1305-0B795308"] = {
					["name"] = "Destrike-Kazzak",
					["guid"] = "Player-1305-0B795308",
					["class"] = "PALADIN",
					["cache_time"] = 1684475487,
					["realm"] = "Kazzak",
				},
				["Player-1401-094CF5F2"] = {
					["name"] = "Ryannah-Teldrassil",
					["guid"] = "Player-1401-094CF5F2",
					["class"] = "HUNTER",
					["cache_time"] = 1680292466,
					["realm"] = "Teldrassil",
				},
				["Player-1127-09AFD632"] = {
					["name"] = "Cresut-ConfrérieduThorium",
					["guid"] = "Player-1127-09AFD632",
					["class"] = "MONK",
					["cache_time"] = 1685832119,
					["realm"] = "ConfrérieduThorium",
				},
				["Player-3682-09C8C1DB"] = {
					["name"] = "Thriver-Ragnaros",
					["guid"] = "Player-3682-09C8C1DB",
					["class"] = "PRIEST",
					["cache_time"] = 1676370489,
					["realm"] = "Ragnaros",
				},
				["Player-3690-09051B9E"] = {
					["name"] = "Slummette-KhazModan",
					["guid"] = "Player-3690-09051B9E",
					["class"] = "DRUID",
					["cache_time"] = 1680513310,
					["realm"] = "KhazModan",
				},
				["Player-3682-076E2F74"] = {
					["name"] = "Thalarion-Ragnaros",
					["guid"] = "Player-3682-076E2F74",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677518150,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0BF3F540"] = {
					["name"] = "Evilheärt-Kazzak",
					["guid"] = "Player-1305-0BF3F540",
					["class"] = "PRIEST",
					["cache_time"] = 1687133300,
					["realm"] = "Kazzak",
				},
				["Player-580-0A0A4D30"] = {
					["name"] = "Oculytos-Blackmoore",
					["guid"] = "Player-580-0A0A4D30",
					["class"] = "MAGE",
					["cache_time"] = 1680027948,
					["realm"] = "Blackmoore",
				},
				["Player-1335-09F9EFA2"] = {
					["name"] = "Travälas-Ysondre",
					["guid"] = "Player-1335-09F9EFA2",
					["class"] = "PRIEST",
					["cache_time"] = 1676973948,
					["realm"] = "Ysondre",
				},
				["Player-1084-0A9403CF"] = {
					["name"] = "Nezalezhna-TarrenMill",
					["guid"] = "Player-1084-0A9403CF",
					["class"] = "PRIEST",
					["cache_time"] = 1684883011,
					["realm"] = "TarrenMill",
				},
				["Player-1390-0C531A66"] = {
					["name"] = "Cadégoute-Hyjal",
					["guid"] = "Player-1390-0C531A66",
					["class"] = "EVOKER",
					["cache_time"] = 1677410550,
					["realm"] = "Hyjal",
				},
				["Player-3691-07056B47"] = {
					["name"] = "Zanderbluff-Blackhand",
					["guid"] = "Player-3691-07056B47",
					["class"] = "WARRIOR",
					["cache_time"] = 1685537524,
					["realm"] = "Blackhand",
				},
				["Player-1928-04914024"] = {
					["name"] = "дентарг-Голдринн",
					["guid"] = "Player-1928-04914024",
					["class"] = "PRIEST",
					["cache_time"] = 1676201349,
					["realm"] = "Голдринн",
				},
				["Player-1403-0721DA19"] = {
					["name"] = "Ludil-Draenor",
					["guid"] = "Player-1403-0721DA19",
					["class"] = "WARRIOR",
					["cache_time"] = 1686754474,
					["realm"] = "Draenor",
				},
				["Player-1302-0AF3F4F8"] = {
					["name"] = "Athanatøs-Archimonde",
					["guid"] = "Player-1302-0AF3F4F8",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1688687303,
					["realm"] = "Archimonde",
				},
				["Player-1329-0949CB48"] = {
					["name"] = "Wiskeyftw-Ravencrest",
					["guid"] = "Player-1329-0949CB48",
					["class"] = "WARRIOR",
					["cache_time"] = 1685858759,
					["realm"] = "Ravencrest",
				},
				["Player-3666-05826926"] = {
					["name"] = "Trustyrusty-Aszune",
					["guid"] = "Player-3666-05826926",
					["class"] = "WARRIOR",
					["cache_time"] = 1685830113,
					["realm"] = "Aszune",
				},
				["Player-1084-0AA288D2"] = {
					["name"] = "Cessle-TarrenMill",
					["guid"] = "Player-1084-0AA288D2",
					["class"] = "EVOKER",
					["cache_time"] = 1689253178,
					["realm"] = "TarrenMill",
				},
				["Player-1305-09B550F9"] = {
					["name"] = "Dnov-Kazzak",
					["guid"] = "Player-1305-09B550F9",
					["class"] = "DRUID",
					["cache_time"] = 1684413259,
					["realm"] = "Kazzak",
				},
				["Player-2073-09D63819"] = {
					["name"] = "Strrex-Stormscale",
					["guid"] = "Player-2073-09D63819",
					["class"] = "PALADIN",
					["cache_time"] = 1689772053,
					["realm"] = "Stormscale",
				},
				["Player-1305-0B96374E"] = {
					["name"] = "Achiille-Kazzak",
					["guid"] = "Player-1305-0B96374E",
					["class"] = "DRUID",
					["cache_time"] = 1680221247,
					["realm"] = "Kazzak",
				},
				["Player-1335-06B2CAEE"] = {
					["name"] = "Havocakiki-Ysondre",
					["guid"] = "Player-1335-06B2CAEE",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685514335,
					["realm"] = "Ysondre",
				},
				["Player-1084-0A806442"] = {
					["name"] = "Cluddvoker-TarrenMill",
					["guid"] = "Player-1084-0A806442",
					["class"] = "EVOKER",
					["cache_time"] = 1687952836,
					["realm"] = "TarrenMill",
				},
				["Player-580-0A6B9700"] = {
					["name"] = "Nagumol-Blackmoore",
					["guid"] = "Player-580-0A6B9700",
					["class"] = "PALADIN",
					["cache_time"] = 1680292466,
					["realm"] = "Blackmoore",
				},
				["Player-1390-09356FBD"] = {
					["name"] = "Taghût-Hyjal",
					["guid"] = "Player-1390-09356FBD",
					["class"] = "PRIEST",
					["cache_time"] = 1676377737,
					["realm"] = "Hyjal",
				},
				["Player-1403-06130637"] = {
					["name"] = "Styxrypala-Draenor",
					["guid"] = "Player-1403-06130637",
					["class"] = "PALADIN",
					["cache_time"] = 1684164857,
					["realm"] = "Draenor",
				},
				["Player-1604-0F05D6CA"] = {
					["name"] = "бамбалея-СвежевательДуш",
					["guid"] = "Player-1604-0F05D6CA",
					["class"] = "PALADIN",
					["cache_time"] = 1684510785,
					["realm"] = "СвежевательДуш",
				},
				["Player-512-09DF637E"] = {
					["name"] = "Hikamori-Throk'Feroth",
					["guid"] = "Player-512-09DF637E",
					["class"] = "DRUID",
					["cache_time"] = 1679138037,
					["realm"] = "Throk'Feroth",
				},
				["Player-1615-03C033B4"] = {
					["name"] = "дюкпал-Ревущийфьорд",
					["guid"] = "Player-1615-03C033B4",
					["class"] = "PALADIN",
					["cache_time"] = 1677309445,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1379-09C024D4"] = {
					["name"] = "Maguinum-Zul'jin",
					["guid"] = "Player-1379-09C024D4",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679408696,
					["realm"] = "Zul'jin",
				},
				["Player-2073-0984B26B"] = {
					["name"] = "Shamysamy-Stormscale",
					["guid"] = "Player-2073-0984B26B",
					["class"] = "SHAMAN",
					["cache_time"] = 1676960971,
					["realm"] = "Stormscale",
				},
				["Player-1305-0BDC5A73"] = {
					["name"] = "Thôrwen-Kazzak",
					["guid"] = "Player-1305-0BDC5A73",
					["class"] = "MONK",
					["cache_time"] = 1686754263,
					["realm"] = "Kazzak",
				},
				["Player-1388-0A97AF21"] = {
					["name"] = "Chaosbringer-Lightbringer",
					["guid"] = "Player-1388-0A97AF21",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1678894799,
					["realm"] = "Lightbringer",
				},
				["Player-3674-059F8486"] = {
					["name"] = "Ironfury-TwistingNether",
					["guid"] = "Player-3674-059F8486",
					["class"] = "WARRIOR",
					["cache_time"] = 1686690665,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0B238574"] = {
					["name"] = "Fireclap-TwistingNether",
					["guid"] = "Player-3674-0B238574",
					["class"] = "WARRIOR",
					["cache_time"] = 1683903940,
					["realm"] = "TwistingNether",
				},
				["Player-1092-03D1F6A1"] = {
					["name"] = "Mummyk-Drak'thul",
					["guid"] = "Player-1092-03D1F6A1",
					["class"] = "PALADIN",
					["cache_time"] = 1686773989,
					["realm"] = "Drak'thul",
				},
				["Player-1378-0AE3998D"] = {
					["name"] = "Markalia-DunModr",
					["guid"] = "Player-1378-0AE3998D",
					["class"] = "WARLOCK",
					["cache_time"] = 1686788530,
					["realm"] = "DunModr",
				},
				["Player-1082-01414C2D"] = {
					["name"] = "Sandalf-KulTiras",
					["guid"] = "Player-1082-01414C2D",
					["class"] = "MAGE",
					["cache_time"] = 1679782125,
					["realm"] = "KulTiras",
				},
				["Player-3674-0AB2C8B5"] = {
					["name"] = "Gora-TwistingNether",
					["guid"] = "Player-3674-0AB2C8B5",
					["class"] = "WARLOCK",
					["cache_time"] = 1676973948,
					["realm"] = "TwistingNether",
				},
				["Player-1615-0B1C425C"] = {
					["name"] = "хъюсстан-Ревущийфьорд",
					["guid"] = "Player-1615-0B1C425C",
					["class"] = "HUNTER",
					["cache_time"] = 1689804288,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1335-0676F0CB"] = {
					["name"] = "Ghanorr-Ysondre",
					["guid"] = "Player-1335-0676F0CB",
					["class"] = "WARRIOR",
					["cache_time"] = 1687952836,
					["realm"] = "Ysondre",
				},
				["Player-3682-0B156ADF"] = {
					["ilvl"] = 430.25,
					["guid"] = "Player-3682-0B156ADF",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1685651466,
					["realm"] = "Ragnaros",
					["name"] = "Shadyb-Ragnaros",
					["specID"] = 254,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1379-0AAF5546"] = {
					["name"] = "Cyrodiil-Sanguino",
					["guid"] = "Player-1379-0AAF5546",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1680292466,
					["realm"] = "Sanguino",
				},
				["Player-531-09C44441"] = {
					["name"] = "Blunzn-Dethecus",
					["guid"] = "Player-531-09C44441",
					["class"] = "DRUID",
					["cache_time"] = 1677321823,
					["realm"] = "Dethecus",
				},
				["Player-1325-099023EA"] = {
					["name"] = "Scráecos-Aggramar",
					["guid"] = "Player-1325-099023EA",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1689800841,
					["realm"] = "Aggramar",
				},
				["Player-3692-09D84EE8"] = {
					["name"] = "Storker-Eredar",
					["guid"] = "Player-3692-09D84EE8",
					["class"] = "WARLOCK",
					["cache_time"] = 1689802006,
					["realm"] = "Eredar",
				},
				["Player-3682-0B1A08AE"] = {
					["name"] = "Friendlyguy-Ragnaros",
					["guid"] = "Player-3682-0B1A08AE",
					["class"] = "ROGUE",
					["cache_time"] = 1678726907,
					["realm"] = "Ragnaros",
				},
				["Player-1084-09C5DE48"] = {
					["ilvl"] = 448,
					["guid"] = "Player-1084-09C5DE48",
					["class"] = "DEATHKNIGHT",
					["role"] = "DAMAGER",
					["name"] = "Pippix-TarrenMill",
					["rank"] = "Raider",
					["cache_time"] = 1688888541,
					["specID"] = 252,
					["enchantingLvl"] = 0,
					["realm"] = "TarrenMill",
				},
				["Player-1084-0A94E906"] = {
					["name"] = "Glück-TarrenMill",
					["guid"] = "Player-1084-0A94E906",
					["class"] = "HUNTER",
					["cache_time"] = 1683073733,
					["realm"] = "TarrenMill",
				},
				["Player-1615-0469F4CF"] = {
					["name"] = "черемушка-Ревущийфьорд",
					["guid"] = "Player-1615-0469F4CF",
					["class"] = "WARLOCK",
					["cache_time"] = 1676439631,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1390-0C8F6AA4"] = {
					["name"] = "Rodjin-Hyjal",
					["guid"] = "Player-1390-0C8F6AA4",
					["class"] = "ROGUE",
					["cache_time"] = 1685781186,
					["realm"] = "Hyjal",
				},
				["Player-1602-099BD4AC"] = {
					["name"] = "найтбладия-Гордунни",
					["guid"] = "Player-1602-099BD4AC",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676968925,
					["realm"] = "Гордунни",
				},
				["Player-3674-0A10CCCC"] = {
					["ilvl"] = 418.6875,
					["guid"] = "Player-3674-0A10CCCC",
					["class"] = "DEMONHUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1680437145,
					["realm"] = "TwistingNether",
					["name"] = "Niclasxd-TwistingNether",
					["specID"] = 577,
					["enchantingLvl"] = 0,
					["rank"] = "ALT",
				},
				["Player-1305-0C2A6DEB"] = {
					["name"] = "Incbank-Kazzak",
					["guid"] = "Player-1305-0C2A6DEB",
					["class"] = "MONK",
					["cache_time"] = 1680211738,
					["realm"] = "Kazzak",
				},
				["Player-1379-09937302"] = {
					["name"] = "Doomslayer-Sanguino",
					["guid"] = "Player-1379-09937302",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1688868978,
					["realm"] = "Sanguino",
				},
				["Player-1615-0B189F9F"] = {
					["name"] = "фосфофиллити-Ревущийфьорд",
					["guid"] = "Player-1615-0B189F9F",
					["class"] = "PRIEST",
					["cache_time"] = 1676383325,
					["realm"] = "Ревущийфьорд",
				},
				["Player-2074-0A590CA1"] = {
					["name"] = "Ildmanden-EmeraldDream",
					["guid"] = "Player-2074-0A590CA1",
					["class"] = "MAGE",
					["cache_time"] = 1680392947,
					["realm"] = "EmeraldDream",
				},
				["Player-1105-04A467A3"] = {
					["name"] = "Sariell-Dalvengyr",
					["guid"] = "Player-1105-04A467A3",
					["class"] = "WARLOCK",
					["cache_time"] = 1676210025,
					["realm"] = "Dalvengyr",
				},
				["Player-1403-09C4434E"] = {
					["name"] = "Azsò-Draenor",
					["guid"] = "Player-1403-09C4434E",
					["class"] = "DRUID",
					["cache_time"] = 1687790447,
					["realm"] = "Draenor",
				},
				["Player-1416-0A731B25"] = {
					["name"] = "Chunkydin-Bronzebeard",
					["guid"] = "Player-1416-0A731B25",
					["class"] = "PALADIN",
					["cache_time"] = 1689268730,
					["realm"] = "Bronzebeard",
				},
				["Player-1084-0A8B46DD"] = {
					["name"] = "Paperrman-TarrenMill",
					["guid"] = "Player-1084-0A8B46DD",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689802006,
					["realm"] = "TarrenMill",
				},
				["Player-1335-09EA9A36"] = {
					["name"] = "Vachipotter-Ysondre",
					["guid"] = "Player-1335-09EA9A36",
					["class"] = "MAGE",
					["cache_time"] = 1676937112,
					["realm"] = "Ysondre",
				},
				["Player-1096-0A6B03DB"] = {
					["name"] = "Snuck-EarthenRing",
					["guid"] = "Player-1096-0A6B03DB",
					["class"] = "HUNTER",
					["cache_time"] = 1679427077,
					["realm"] = "EarthenRing",
				},
				["Player-1379-0A6FCB04"] = {
					["name"] = "Steppen-Sanguino",
					["guid"] = "Player-1379-0A6FCB04",
					["class"] = "HUNTER",
					["cache_time"] = 1676377737,
					["realm"] = "Sanguino",
				},
				["Player-604-080B43B8"] = {
					["name"] = "Dénè-Thrall",
					["guid"] = "Player-604-080B43B8",
					["class"] = "DRUID",
					["cache_time"] = 1677665404,
					["realm"] = "Thrall",
				},
				["Player-1403-09899FDC"] = {
					["name"] = "Snuu-Draenor",
					["guid"] = "Player-1403-09899FDC",
					["class"] = "PALADIN",
					["cache_time"] = 1687041442,
					["realm"] = "Draenor",
				},
				["Player-3702-0966535D"] = {
					["name"] = "Beithir-ArgentDawn",
					["guid"] = "Player-3702-0966535D",
					["class"] = "HUNTER",
					["cache_time"] = 1678230027,
					["realm"] = "ArgentDawn",
				},
				["Player-3686-09FD52B7"] = {
					["name"] = "Wolfsatani-Antonidas",
					["guid"] = "Player-3686-09FD52B7",
					["class"] = "HUNTER",
					["cache_time"] = 1680290814,
					["realm"] = "Antonidas",
				},
				["Player-3692-06F4321A"] = {
					["name"] = "Tormentius-Eredar",
					["guid"] = "Player-3692-06F4321A",
					["class"] = "WARLOCK",
					["cache_time"] = 1677607191,
					["realm"] = "Eredar",
				},
				["Player-3690-0B0AEF2A"] = {
					["name"] = "Zephirøn-KhazModan",
					["guid"] = "Player-3690-0B0AEF2A",
					["class"] = "EVOKER",
					["cache_time"] = 1684501707,
					["realm"] = "KhazModan",
				},
				["Player-1604-09179E3F"] = {
					["name"] = "друитка-СвежевательДуш",
					["guid"] = "Player-1604-09179E3F",
					["class"] = "DRUID",
					["cache_time"] = 1676144908,
					["realm"] = "СвежевательДуш",
				},
				["Player-1403-09862CCF"] = {
					["name"] = "Gulgrippy-Draenor",
					["guid"] = "Player-1403-09862CCF",
					["class"] = "WARLOCK",
					["cache_time"] = 1685032038,
					["realm"] = "Draenor",
				},
				["Player-1384-058D45E5"] = {
					["name"] = "Vulcan-ColinasPardas",
					["guid"] = "Player-1384-058D45E5",
					["class"] = "PALADIN",
					["cache_time"] = 1676184332,
					["realm"] = "ColinasPardas",
				},
				["Player-1602-0F4CE9E3"] = {
					["name"] = "спецоператор-Гордунни",
					["guid"] = "Player-1602-0F4CE9E3",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1677957394,
					["realm"] = "Гордунни",
				},
				["Player-580-0A619DEF"] = {
					["name"] = "Torogithron-Blackmoore",
					["guid"] = "Player-580-0A619DEF",
					["class"] = "DRUID",
					["cache_time"] = 1676796439,
					["realm"] = "Blackmoore",
				},
				["Player-1305-0BC2635D"] = {
					["name"] = "Seyedsinaa-Kazzak",
					["guid"] = "Player-1305-0BC2635D",
					["class"] = "PRIEST",
					["cache_time"] = 1680278206,
					["realm"] = "Kazzak",
				},
				["Player-3691-09C89CE6"] = {
					["name"] = "Hammsel-Blackhand",
					["guid"] = "Player-3691-09C89CE6",
					["class"] = "ROGUE",
					["cache_time"] = 1688499798,
					["realm"] = "Blackhand",
				},
				["Player-1403-0A6F31EA"] = {
					["name"] = "Xaldrack-Draenor",
					["guid"] = "Player-1403-0A6F31EA",
					["class"] = "EVOKER",
					["cache_time"] = 1687157932,
					["realm"] = "Draenor",
				},
				["Player-1416-0A6FA1A0"] = {
					["name"] = "Recutie-AeriePeak",
					["guid"] = "Player-1416-0A6FA1A0",
					["class"] = "MONK",
					["cache_time"] = 1679994645,
					["realm"] = "AeriePeak",
				},
				["Player-1305-0C12A058"] = {
					["name"] = "Kardod-Kazzak",
					["guid"] = "Player-1305-0C12A058",
					["class"] = "DRUID",
					["cache_time"] = 1677607044,
					["realm"] = "Kazzak",
				},
				["Player-1096-0A20FAE0"] = {
					["name"] = "Spooker-EarthenRing",
					["guid"] = "Player-1096-0A20FAE0",
					["class"] = "WARLOCK",
					["cache_time"] = 1679622284,
					["realm"] = "EarthenRing",
				},
				["Player-581-069F0C4F"] = {
					["name"] = "Iúna-Blackrock",
					["guid"] = "Player-581-069F0C4F",
					["class"] = "DRUID",
					["cache_time"] = 1687247803,
					["realm"] = "Blackrock",
				},
				["Player-1305-0B2B3D24"] = {
					["name"] = "Vortnê-Kazzak",
					["guid"] = "Player-1305-0B2B3D24",
					["class"] = "MAGE",
					["cache_time"] = 1687949273,
					["realm"] = "Kazzak",
				},
				["Player-1401-07722601"] = {
					["name"] = "Holdmybow-Nozdormu",
					["guid"] = "Player-1401-07722601",
					["class"] = "HUNTER",
					["cache_time"] = 1677606779,
					["realm"] = "Nozdormu",
				},
				["Player-1615-09B94E11"] = {
					["name"] = "бизулька-Ревущийфьорд",
					["guid"] = "Player-1615-09B94E11",
					["class"] = "MONK",
					["cache_time"] = 1676444247,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1615-0B174BB0"] = {
					["ilvl"] = 420.8125,
					["guid"] = "Player-1615-0B174BB0",
					["class"] = "DEMONHUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1684204457,
					["realm"] = "Ревущийфьорд",
					["name"] = "атмена-Ревущийфьорд",
					["specID"] = 577,
					["enchantingLvl"] = 0,
					["rank"] = "ЯСТРУБ",
				},
				["Player-1305-0C5E03CC"] = {
					["name"] = "Magiguzzen-Kazzak",
					["guid"] = "Player-1305-0C5E03CC",
					["class"] = "MAGE",
					["cache_time"] = 1686003431,
					["realm"] = "Kazzak",
				},
				["Player-3682-0B033544"] = {
					["name"] = "Shinestab-Ragnaros",
					["guid"] = "Player-3682-0B033544",
					["class"] = "ROGUE",
					["cache_time"] = 1686980572,
					["realm"] = "Ragnaros",
				},
				["Player-3682-0AED3473"] = {
					["name"] = "Rbgg-Ragnaros",
					["guid"] = "Player-3682-0AED3473",
					["class"] = "SHAMAN",
					["cache_time"] = 1680422486,
					["realm"] = "Ragnaros",
				},
				["Player-1084-0A7B93C3"] = {
					["name"] = "Levya-TarrenMill",
					["guid"] = "Player-1084-0A7B93C3",
					["class"] = "PALADIN",
					["cache_time"] = 1690157726,
					["realm"] = "TarrenMill",
				},
				["Player-2073-0568CDED"] = {
					["name"] = "Harv-Stormscale",
					["guid"] = "Player-2073-0568CDED",
					["class"] = "WARLOCK",
					["cache_time"] = 1688930496,
					["realm"] = "Stormscale",
				},
				["Player-1092-0A8FB630"] = {
					["name"] = "Kuukihime-Drak'thul",
					["guid"] = "Player-1092-0A8FB630",
					["class"] = "MONK",
					["cache_time"] = 1676383325,
					["realm"] = "Drak'thul",
				},
				["Player-1396-065CDA83"] = {
					["name"] = "Palaofpower-AzjolNerub",
					["guid"] = "Player-1396-065CDA83",
					["class"] = "PALADIN",
					["cache_time"] = 1684579228,
					["realm"] = "AzjolNerub",
				},
				["Player-1403-0A67A5D1"] = {
					["name"] = "Taloevera-Draenor",
					["guid"] = "Player-1403-0A67A5D1",
					["class"] = "DRUID",
					["cache_time"] = 1685052602,
					["realm"] = "Draenor",
				},
				["Player-581-07A67308"] = {
					["name"] = "Tempurus-Blackrock",
					["guid"] = "Player-581-07A67308",
					["class"] = "SHAMAN",
					["cache_time"] = 1686710191,
					["realm"] = "Blackrock",
				},
				["Player-1614-06770197"] = {
					["name"] = "пипипочка-Галакронд",
					["guid"] = "Player-1614-06770197",
					["class"] = "MONK",
					["cache_time"] = 1683073733,
					["realm"] = "Галакронд",
				},
				["Player-1623-0B0FD691"] = {
					["name"] = "нокта-Дракономор",
					["guid"] = "Player-1623-0B0FD691",
					["class"] = "DRUID",
					["cache_time"] = 1677324336,
					["realm"] = "Дракономор",
				},
				["Player-3713-0AC483D3"] = {
					["name"] = "Teshar-BurningLegion",
					["guid"] = "Player-3713-0AC483D3",
					["class"] = "HUNTER",
					["cache_time"] = 1677515492,
					["realm"] = "BurningLegion",
				},
				["Player-1302-0BB57BF9"] = {
					["name"] = "Titoulapinou-Archimonde",
					["guid"] = "Player-1302-0BB57BF9",
					["class"] = "DRUID",
					["cache_time"] = 1680292466,
					["realm"] = "Archimonde",
				},
				["Player-1596-0E92D69A"] = {
					["name"] = "Xetas-Deathwing",
					["guid"] = "Player-1596-0E92D69A",
					["class"] = "WARRIOR",
					["cache_time"] = 1676960971,
					["realm"] = "Deathwing",
				},
				["Player-1084-0A9FC0F4"] = {
					["name"] = "Fløxy-TarrenMill",
					["guid"] = "Player-1084-0A9FC0F4",
					["class"] = "DRUID",
					["cache_time"] = 1689951100,
					["realm"] = "TarrenMill",
				},
				["Player-1084-08AFECDE"] = {
					["name"] = "Bjernikus-TarrenMill",
					["guid"] = "Player-1084-08AFECDE",
					["class"] = "DRUID",
					["cache_time"] = 1676765465,
					["realm"] = "TarrenMill",
				},
				["Player-1615-07B9F92A"] = {
					["name"] = "нервоток-Ревущийфьорд",
					["guid"] = "Player-1615-07B9F92A",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676387096,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3691-06851B8A"] = {
					["name"] = "Ala-Blackhand",
					["guid"] = "Player-3691-06851B8A",
					["class"] = "MAGE",
					["cache_time"] = 1684926332,
					["realm"] = "Blackhand",
				},
				["Player-1416-0A420015"] = {
					["name"] = "Flaskhals-Eonar",
					["guid"] = "Player-1416-0A420015",
					["class"] = "WARLOCK",
					["cache_time"] = 1687041442,
					["realm"] = "Eonar",
				},
				["Player-1092-07E61288"] = {
					["ilvl"] = 442.625,
					["guid"] = "Player-1092-07E61288",
					["class"] = "DEATHKNIGHT",
					["role"] = "DAMAGER",
					["cache_time"] = 1685539073,
					["realm"] = "Drak'thul",
					["name"] = "Satyraa-Drak'thul",
					["specID"] = 252,
					["enchantingLvl"] = 0,
					["rank"] = "Alt",
				},
				["Player-1329-09FDBA80"] = {
					["name"] = "Kikkh-Ravencrest",
					["guid"] = "Player-1329-09FDBA80",
					["class"] = "PRIEST",
					["cache_time"] = 1680303765,
					["realm"] = "Ravencrest",
				},
				["Player-1104-082E5C64"] = {
					["name"] = "Kîtschî-Kil'jaeden",
					["guid"] = "Player-1104-082E5C64",
					["class"] = "HUNTER",
					["cache_time"] = 1689699139,
					["realm"] = "Kil'jaeden",
				},
				["Player-1621-05610E08"] = {
					["name"] = "Brosselit-Dalaran",
					["guid"] = "Player-1621-05610E08",
					["class"] = "MONK",
					["cache_time"] = 1677126111,
					["realm"] = "Dalaran",
				},
				["Player-1390-0AAD4562"] = {
					["name"] = "Spûnk-Hyjal",
					["guid"] = "Player-1390-0AAD4562",
					["class"] = "MONK",
					["cache_time"] = 1687791012,
					["realm"] = "Hyjal",
				},
				["Player-3682-08F30EB1"] = {
					["name"] = "Wolle-Ragnaros",
					["guid"] = "Player-3682-08F30EB1",
					["class"] = "WARLOCK",
					["cache_time"] = 1685682864,
					["realm"] = "Ragnaros",
				},
				["Player-1396-096307FE"] = {
					["name"] = "Kimberbo-AzjolNerub",
					["guid"] = "Player-1396-096307FE",
					["class"] = "HUNTER",
					["cache_time"] = 1685745517,
					["realm"] = "AzjolNerub",
				},
				["Player-3682-0B03956D"] = {
					["ilvl"] = 434.0625,
					["guid"] = "Player-3682-0B03956D",
					["class"] = "SHAMAN",
					["role"] = "HEALER",
					["cache_time"] = 1685386842,
					["realm"] = "Ragnaros",
					["name"] = "Maccasham-Ragnaros",
					["specID"] = 264,
					["enchantingLvl"] = 0,
					["rank"] = "Recruiter",
				},
				["Player-3682-06594359"] = {
					["name"] = "Amandacerny-Ragnaros",
					["guid"] = "Player-3682-06594359",
					["class"] = "ROGUE",
					["cache_time"] = 1686121310,
					["realm"] = "Ragnaros",
				},
				["Player-2073-09FF6B77"] = {
					["ilvl"] = 423.25,
					["guid"] = "Player-2073-09FF6B77",
					["class"] = "ROGUE",
					["role"] = "DAMAGER",
					["cache_time"] = 1684235960,
					["rank"] = "Trial",
					["name"] = "Ritchiejr-Stormscale",
					["specID"] = 261,
					["enchantingLvl"] = 0,
					["realm"] = "Stormscale",
				},
				["Player-3686-09C01F21"] = {
					["name"] = "Barlianhunt-Antonidas",
					["guid"] = "Player-3686-09C01F21",
					["class"] = "HUNTER",
					["cache_time"] = 1678052884,
					["realm"] = "Antonidas",
				},
				["Player-1329-06F3733F"] = {
					["name"] = "Getidruid-Ravencrest",
					["guid"] = "Player-1329-06F3733F",
					["class"] = "DRUID",
					["cache_time"] = 1677087851,
					["realm"] = "Ravencrest",
				},
				["Player-581-0A6A9CA0"] = {
					["name"] = "Nvll-Blackrock",
					["guid"] = "Player-581-0A6A9CA0",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679968027,
					["realm"] = "Blackrock",
				},
				["Player-1096-0990AE7D"] = {
					["name"] = "Maliny-EarthenRing",
					["guid"] = "Player-1096-0990AE7D",
					["class"] = "MAGE",
					["cache_time"] = 1676144918,
					["realm"] = "EarthenRing",
				},
				["Player-1329-09397F24"] = {
					["name"] = "Kimorochan-Ravencrest",
					["guid"] = "Player-1329-09397F24",
					["class"] = "HUNTER",
					["cache_time"] = 1678229349,
					["realm"] = "Ravencrest",
				},
				["Player-1335-04FFF624"] = {
					["name"] = "Ryüzas-Ysondre",
					["guid"] = "Player-1335-04FFF624",
					["class"] = "WARRIOR",
					["cache_time"] = 1678900352,
					["realm"] = "Ysondre",
				},
				["Player-1305-0C5B57AC"] = {
					["name"] = "Zérry-Kazzak",
					["guid"] = "Player-1305-0C5B57AC",
					["class"] = "PALADIN",
					["cache_time"] = 1684131973,
					["realm"] = "Kazzak",
				},
				["Player-1329-065BD5FA"] = {
					["name"] = "Megakua-Ravencrest",
					["guid"] = "Player-1329-065BD5FA",
					["class"] = "DRUID",
					["cache_time"] = 1676955286,
					["realm"] = "Ravencrest",
				},
				["Player-1621-0B2842B6"] = {
					["name"] = "Siael-Dalaran",
					["guid"] = "Player-1621-0B2842B6",
					["class"] = "PALADIN",
					["cache_time"] = 1688985357,
					["realm"] = "Dalaran",
				},
				["Player-2073-0998DD78"] = {
					["name"] = "Dóraemon-Stormscale",
					["guid"] = "Player-2073-0998DD78",
					["class"] = "WARRIOR",
					["cache_time"] = 1687954070,
					["realm"] = "Stormscale",
				},
				["Player-612-09149B45"] = {
					["name"] = "Maranwe-Gilneas",
					["guid"] = "Player-612-09149B45",
					["class"] = "DRUID",
					["cache_time"] = 1678126084,
					["realm"] = "Gilneas",
				},
				["Player-1390-0C53A1BA"] = {
					["name"] = "Pengu-Hyjal",
					["guid"] = "Player-1390-0C53A1BA",
					["class"] = "EVOKER",
					["cache_time"] = 1689800841,
					["realm"] = "Hyjal",
				},
				["Player-1084-0A901140"] = {
					["name"] = "åkeyletsgo-TarrenMill",
					["guid"] = "Player-1084-0A901140",
					["class"] = "ROGUE",
					["cache_time"] = 1676331628,
					["realm"] = "TarrenMill",
				},
				["Player-3692-05943E16"] = {
					["name"] = "Artino-Eredar",
					["guid"] = "Player-3692-05943E16",
					["class"] = "PALADIN",
					["cache_time"] = 1679570387,
					["realm"] = "Eredar",
				},
				["Player-3674-06CB2137"] = {
					["name"] = "Bertbram-TwistingNether",
					["guid"] = "Player-3674-06CB2137",
					["class"] = "PALADIN",
					["cache_time"] = 1677518213,
					["realm"] = "TwistingNether",
				},
				["Player-3682-0A77E09F"] = {
					["ilvl"] = 442.6875,
					["guid"] = "Player-3682-0A77E09F",
					["class"] = "PRIEST",
					["role"] = "HEALER",
					["cache_time"] = 1689281451,
					["rank"] = "Raider",
					["name"] = "Wituwu-Ragnaros",
					["specID"] = 257,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-1122-092505C7"] = {
					["name"] = "Ratüs-Eitrigg",
					["guid"] = "Player-1122-092505C7",
					["class"] = "PALADIN",
					["cache_time"] = 1675869700,
					["realm"] = "Eitrigg",
				},
				["Player-3674-0B243AE8"] = {
					["name"] = "Hovertime-TwistingNether",
					["guid"] = "Player-3674-0B243AE8",
					["class"] = "DRUID",
					["cache_time"] = 1684231108,
					["realm"] = "TwistingNether",
				},
				["Player-3674-08A1D1E7"] = {
					["name"] = "Harrydottor-TwistingNether",
					["guid"] = "Player-3674-08A1D1E7",
					["class"] = "WARLOCK",
					["cache_time"] = 1684502528,
					["realm"] = "TwistingNether",
				},
				["Player-1084-0A8FB6DA"] = {
					["name"] = "Flòkì-TarrenMill",
					["guid"] = "Player-1084-0A8FB6DA",
					["class"] = "DRUID",
					["cache_time"] = 1676785851,
					["realm"] = "TarrenMill",
				},
				["Player-3674-0B0ED5DB"] = {
					["name"] = "Babybelf-TwistingNether",
					["guid"] = "Player-3674-0B0ED5DB",
					["class"] = "PALADIN",
					["cache_time"] = 1680027948,
					["realm"] = "TwistingNether",
				},
				["Player-3686-046644C2"] = {
					["name"] = "Arckanie-Antonidas",
					["guid"] = "Player-3686-046644C2",
					["class"] = "MAGE",
					["cache_time"] = 1689699139,
					["realm"] = "Antonidas",
				},
				["Player-1315-05CE4ABE"] = {
					["name"] = "Shaolong-Elune",
					["guid"] = "Player-1315-05CE4ABE",
					["class"] = "WARRIOR",
					["cache_time"] = 1685871367,
					["realm"] = "Elune",
				},
				["Player-3691-09CA2561"] = {
					["name"] = "Rêês-Blackhand",
					["guid"] = "Player-3691-09CA2561",
					["class"] = "SHAMAN",
					["cache_time"] = 1676533093,
					["realm"] = "Blackhand",
				},
				["Player-580-0A064AAB"] = {
					["name"] = "Puow-Blackmoore",
					["guid"] = "Player-580-0A064AAB",
					["class"] = "MAGE",
					["cache_time"] = 1676180633,
					["realm"] = "Blackmoore",
				},
				["Player-3682-069A9322"] = {
					["name"] = "Moodý-Ragnaros",
					["guid"] = "Player-3682-069A9322",
					["class"] = "PALADIN",
					["cache_time"] = 1686971553,
					["realm"] = "Ragnaros",
				},
				["Player-1615-0AE1C143"] = {
					["name"] = "луйджи-Ревущийфьорд",
					["guid"] = "Player-1615-0AE1C143",
					["class"] = "WARLOCK",
					["cache_time"] = 1678633550,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1405-08F866AB"] = {
					["name"] = "Rikaja-DerRatvonDalaran",
					["guid"] = "Player-1405-08F866AB",
					["class"] = "DRUID",
					["cache_time"] = 1677072237,
					["realm"] = "DerRatvonDalaran",
				},
				["Player-1615-09F049D3"] = {
					["name"] = "анпронаунсбл-Ревущийфьорд",
					["guid"] = "Player-1615-09F049D3",
					["class"] = "HUNTER",
					["cache_time"] = 1687257934,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3703-06226631"] = {
					["name"] = "Talnara-Frostwolf",
					["guid"] = "Player-3703-06226631",
					["class"] = "PRIEST",
					["cache_time"] = 1680290994,
					["realm"] = "Frostwolf",
				},
				["Player-1305-0B3EDA00"] = {
					["name"] = "Seekndstrooy-Kazzak",
					["guid"] = "Player-1305-0B3EDA00",
					["class"] = "PALADIN",
					["cache_time"] = 1680139732,
					["realm"] = "Kazzak",
				},
				["Player-3703-09FFCDCB"] = {
					["name"] = "Deexos-Frostwolf",
					["guid"] = "Player-3703-09FFCDCB",
					["class"] = "WARRIOR",
					["cache_time"] = 1684883011,
					["realm"] = "Frostwolf",
				},
				["Player-1621-0B281B41"] = {
					["ilvl"] = 440.9375,
					["guid"] = "Player-1621-0B281B41",
					["class"] = "PRIEST",
					["realm"] = "Dalaran",
					["role"] = "HEALER",
					["cache_time"] = 1686696451,
					["name"] = "Ainoko-Dalaran",
					["specID"] = 257,
					["enchanter"] = true,
					["enchantingLvl"] = 25,
					["rank"] = "Test",
				},
				["Player-3674-0AFE3074"] = {
					["name"] = "Bë-TwistingNether",
					["guid"] = "Player-3674-0AFE3074",
					["class"] = "PRIEST",
					["cache_time"] = 1684883011,
					["realm"] = "TwistingNether",
				},
				["Player-1379-09F83C9F"] = {
					["name"] = "Xun-Sanguino",
					["guid"] = "Player-1379-09F83C9F",
					["class"] = "WARRIOR",
					["cache_time"] = 1684926332,
					["realm"] = "Sanguino",
				},
				["Player-1301-0BFF06F9"] = {
					["name"] = "Huggepung-Outland",
					["guid"] = "Player-1301-0BFF06F9",
					["class"] = "PALADIN",
					["cache_time"] = 1687949172,
					["realm"] = "Outland",
				},
				["Player-3391-0C494F04"] = {
					["name"] = "Drhuid-Silvermoon",
					["guid"] = "Player-3391-0C494F04",
					["class"] = "DRUID",
					["cache_time"] = 1679741042,
					["realm"] = "Silvermoon",
				},
				["Player-1929-0E627077"] = {
					["name"] = "хандик-ТкачСмерти",
					["guid"] = "Player-1929-0E627077",
					["class"] = "HUNTER",
					["cache_time"] = 1677073065,
					["realm"] = "ТкачСмерти",
				},
				["Player-3674-0B00DBBA"] = {
					["name"] = "Gaulyp-TwistingNether",
					["guid"] = "Player-3674-0B00DBBA",
					["class"] = "PRIEST",
					["cache_time"] = 1686121325,
					["realm"] = "TwistingNether",
				},
				["Player-1604-0F529787"] = {
					["name"] = "бложеный-СвежевательДуш",
					["guid"] = "Player-1604-0F529787",
					["class"] = "HUNTER",
					["cache_time"] = 1676439631,
					["realm"] = "СвежевательДуш",
				},
				["Player-1403-0A618AFB"] = {
					["ilvl"] = 401.6875,
					["guid"] = "Player-1403-0A618AFB",
					["class"] = "HUNTER",
					["rank"] = "Raider",
					["role"] = "DAMAGER",
					["cache_time"] = 1676768223,
					["name"] = "Kayydá-Draenor",
					["enchanter"] = true,
					["specID"] = 253,
					["enchantingLvl"] = 50,
					["realm"] = "Draenor",
				},
				["Player-1602-0A99A46E"] = {
					["name"] = "боллукс-Гордунни",
					["guid"] = "Player-1602-0A99A46E",
					["class"] = "PRIEST",
					["cache_time"] = 1675779446,
					["realm"] = "Гордунни",
				},
				["Player-1403-0804EFB6"] = {
					["name"] = "ázraél-Draenor",
					["guid"] = "Player-1403-0804EFB6",
					["class"] = "WARLOCK",
					["cache_time"] = 1680290994,
					["realm"] = "Draenor",
				},
				["Player-3656-0A022EFC"] = {
					["name"] = "Zuresh-Haomarush",
					["guid"] = "Player-3656-0A022EFC",
					["class"] = "DRUID",
					["cache_time"] = 1686983533,
					["realm"] = "Haomarush",
				},
				["Player-3682-0B2539D4"] = {
					["name"] = "Pompunch-Ragnaros",
					["guid"] = "Player-3682-0B2539D4",
					["class"] = "MONK",
					["cache_time"] = 1686169690,
					["realm"] = "Ragnaros",
				},
				["Player-1604-089E05CE"] = {
					["name"] = "анирсель-СвежевательДуш",
					["guid"] = "Player-1604-089E05CE",
					["class"] = "PRIEST",
					["cache_time"] = 1684204457,
					["realm"] = "СвежевательДуш",
				},
				["Player-1084-0A86D57F"] = {
					["name"] = "Violetdragon-TarrenMill",
					["guid"] = "Player-1084-0A86D57F",
					["class"] = "EVOKER",
					["cache_time"] = 1684501707,
					["realm"] = "TarrenMill",
				},
				["Player-1390-0C7927D8"] = {
					["name"] = "Dramacouine-Hyjal",
					["guid"] = "Player-1390-0C7927D8",
					["class"] = "HUNTER",
					["cache_time"] = 1676611726,
					["realm"] = "Hyjal",
				},
				["Player-1598-098D9D83"] = {
					["name"] = "Oshaza-Talnivarr",
					["guid"] = "Player-1598-098D9D83",
					["class"] = "SHAMAN",
					["cache_time"] = 1676973948,
					["realm"] = "Talnivarr",
				},
				["Player-1402-0A285B1B"] = {
					["name"] = "Grasprost-Turalyon",
					["guid"] = "Player-1402-0A285B1B",
					["class"] = "SHAMAN",
					["cache_time"] = 1676988319,
					["realm"] = "Turalyon",
				},
				["Player-3674-0B0960DD"] = {
					["name"] = "Dothemoo-TwistingNether",
					["guid"] = "Player-3674-0B0960DD",
					["class"] = "DRUID",
					["cache_time"] = 1676387096,
					["realm"] = "TwistingNether",
				},
				["Player-3713-09432098"] = {
					["name"] = "Jandruidll-BurningLegion",
					["guid"] = "Player-3713-09432098",
					["class"] = "DRUID",
					["cache_time"] = 1676408322,
					["realm"] = "BurningLegion",
				},
				["Player-1604-0B5FB914"] = {
					["name"] = "витрум-СвежевательДуш",
					["guid"] = "Player-1604-0B5FB914",
					["class"] = "DRUID",
					["cache_time"] = 1676361187,
					["realm"] = "СвежевательДуш",
				},
				["Player-1329-06F6F814"] = {
					["name"] = "Raskarask-Ravencrest",
					["guid"] = "Player-1329-06F6F814",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676601366,
					["realm"] = "Ravencrest",
				},
				["Player-1403-0A738523"] = {
					["name"] = "Steffmôll-Draenor",
					["guid"] = "Player-1403-0A738523",
					["class"] = "PRIEST",
					["cache_time"] = 1690488753,
					["realm"] = "Draenor",
				},
				["Player-1615-0B0FD8A2"] = {
					["name"] = "ичикаге-Ревущийфьорд",
					["guid"] = "Player-1615-0B0FD8A2",
					["class"] = "PALADIN",
					["cache_time"] = 1684054876,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3691-04991293"] = {
					["name"] = "Hitmeloser-Blackhand",
					["guid"] = "Player-3691-04991293",
					["class"] = "HUNTER",
					["cache_time"] = 1676793237,
					["realm"] = "Blackhand",
				},
				["Player-1305-0B454DCD"] = {
					["name"] = "Vanholter-Kazzak",
					["guid"] = "Player-1305-0B454DCD",
					["class"] = "MAGE",
					["cache_time"] = 1676182188,
					["realm"] = "Kazzak",
				},
				["Player-580-0A4B9714"] = {
					["name"] = "Fløkee-Blackmoore",
					["guid"] = "Player-580-0A4B9714",
					["class"] = "WARLOCK",
					["cache_time"] = 1684207643,
					["realm"] = "Blackmoore",
				},
				["Player-3682-07A5A42F"] = {
					["ilvl"] = 429.6875,
					["guid"] = "Player-3682-07A5A42F",
					["class"] = "MAGE",
					["role"] = "DAMAGER",
					["cache_time"] = 1690123270,
					["realm"] = "Ragnaros",
					["name"] = "Jfree-Ragnaros",
					["specID"] = 63,
					["enchantingLvl"] = 0,
					["rank"] = "Alt",
				},
				["Player-3674-0B095659"] = {
					["name"] = "Tokopeli-TwistingNether",
					["guid"] = "Player-3674-0B095659",
					["class"] = "PRIEST",
					["cache_time"] = 1676973948,
					["realm"] = "TwistingNether",
				},
				["Player-1331-07070497"] = {
					["name"] = "Kirolabête-Medivh",
					["guid"] = "Player-1331-07070497",
					["class"] = "SHAMAN",
					["cache_time"] = 1680292466,
					["realm"] = "Medivh",
				},
				["Player-1084-077719B8"] = {
					["name"] = "Senju-TarrenMill",
					["guid"] = "Player-1084-077719B8",
					["class"] = "MONK",
					["cache_time"] = 1676479581,
					["realm"] = "TarrenMill",
				},
				["Player-580-0A53EF54"] = {
					["name"] = "Orczähmer-Blackmoore",
					["guid"] = "Player-580-0A53EF54",
					["class"] = "HUNTER",
					["cache_time"] = 1676077894,
					["realm"] = "Blackmoore",
				},
				["Player-1403-0A1AC3E5"] = {
					["name"] = "Moobsie-Draenor",
					["guid"] = "Player-1403-0A1AC3E5",
					["class"] = "PALADIN",
					["cache_time"] = 1684487446,
					["realm"] = "Draenor",
				},
				["Player-1390-08460BF8"] = {
					["name"] = "Linte-Hyjal",
					["guid"] = "Player-1390-08460BF8",
					["class"] = "SHAMAN",
					["cache_time"] = 1690750821,
					["realm"] = "Hyjal",
				},
				["Player-3691-09FE1501"] = {
					["name"] = "Holyswolee-Blackhand",
					["guid"] = "Player-3691-09FE1501",
					["class"] = "PALADIN",
					["cache_time"] = 1684493090,
					["realm"] = "Blackhand",
				},
				["Player-2074-0A4C6BAD"] = {
					["name"] = "Drakks-EmeraldDream",
					["guid"] = "Player-2074-0A4C6BAD",
					["class"] = "EVOKER",
					["cache_time"] = 1678635800,
					["realm"] = "EmeraldDream",
				},
				["Player-3691-0491897A"] = {
					["name"] = "Harvog-Blackhand",
					["guid"] = "Player-3691-0491897A",
					["class"] = "SHAMAN",
					["cache_time"] = 1677607044,
					["realm"] = "Blackhand",
				},
				["Player-581-08C60F66"] = {
					["name"] = "Shøx-Blackrock",
					["guid"] = "Player-581-08C60F66",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679220234,
					["realm"] = "Blackrock",
				},
				["Player-3691-0A07B35A"] = {
					["name"] = "Irektya-Blackhand",
					["guid"] = "Player-3691-0A07B35A",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689268730,
					["realm"] = "Blackhand",
				},
				["Player-1929-0E634614"] = {
					["name"] = "детонация-ПиратскаяБухта",
					["guid"] = "Player-1929-0E634614",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1684926332,
					["realm"] = "ПиратскаяБухта",
				},
				["Player-1305-0AEEC77F"] = {
					["ilvl"] = 405.5,
					["guid"] = "Player-1305-0AEEC77F",
					["class"] = "DRUID",
					["role"] = "HEALER",
					["name"] = "Treece-Kazzak",
					["realm"] = "Kazzak",
					["cache_time"] = 1677337923,
					["specID"] = 105,
					["enchantingLvl"] = 0,
					["rank"] = "Officer Alt",
				},
				["Player-1097-0A94F56C"] = {
					["name"] = "Racco-Ysera",
					["guid"] = "Player-1097-0A94F56C",
					["class"] = "HUNTER",
					["cache_time"] = 1679570387,
					["realm"] = "Ysera",
				},
				["Player-531-06D4C29B"] = {
					["name"] = "Makthor-Mug'thol",
					["guid"] = "Player-531-06D4C29B",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676334416,
					["realm"] = "Mug'thol",
				},
				["Player-1305-0BC7BDA8"] = {
					["name"] = "Aprettyname-Kazzak",
					["guid"] = "Player-1305-0BC7BDA8",
					["class"] = "DRUID",
					["cache_time"] = 1685532670,
					["realm"] = "Kazzak",
				},
				["Player-1305-0C8B3F8F"] = {
					["name"] = "Coolatanken-Kazzak",
					["guid"] = "Player-1305-0C8B3F8F",
					["class"] = "PALADIN",
					["cache_time"] = 1686622002,
					["realm"] = "Kazzak",
				},
				["Player-1313-0C53C91E"] = {
					["name"] = "Venodrak-Wildhammer",
					["guid"] = "Player-1313-0C53C91E",
					["class"] = "EVOKER",
					["cache_time"] = 1687298820,
					["realm"] = "Wildhammer",
				},
				["Player-1597-0F00CDCC"] = {
					["name"] = "Palazail-Sylvanas",
					["guid"] = "Player-1597-0F00CDCC",
					["class"] = "PALADIN",
					["cache_time"] = 1686687418,
					["realm"] = "Sylvanas",
				},
				["Player-3656-0A8C9D78"] = {
					["name"] = "Murscel-Stormreaver",
					["guid"] = "Player-3656-0A8C9D78",
					["class"] = "DRUID",
					["cache_time"] = 1687261056,
					["realm"] = "Stormreaver",
				},
				["Player-580-0A6F5A69"] = {
					["name"] = "Isuná-Blackmoore",
					["guid"] = "Player-580-0A6F5A69",
					["class"] = "MAGE",
					["cache_time"] = 1680258337,
					["realm"] = "Blackmoore",
				},
				["Player-1402-04DA5D7B"] = {
					["name"] = "Niak-Turalyon",
					["guid"] = "Player-1402-04DA5D7B",
					["class"] = "DRUID",
					["cache_time"] = 1678860427,
					["realm"] = "Turalyon",
				},
				["Player-1403-0A4F3EE8"] = {
					["name"] = "Cuhgmon-Draenor",
					["guid"] = "Player-1403-0A4F3EE8",
					["class"] = "WARRIOR",
					["cache_time"] = 1676808823,
					["realm"] = "Draenor",
				},
				["Player-1305-0C78D159"] = {
					["name"] = "Ogibradve-Kazzak",
					["guid"] = "Player-1305-0C78D159",
					["class"] = "WARRIOR",
					["cache_time"] = 1683963820,
					["realm"] = "Kazzak",
				},
				["Player-2073-09C09B9F"] = {
					["name"] = "Irefutåbil-Stormscale",
					["guid"] = "Player-2073-09C09B9F",
					["class"] = "PRIEST",
					["cache_time"] = 1679133580,
					["realm"] = "Stormscale",
				},
				["Player-1615-075CFF90"] = {
					["name"] = "каун-Ревущийфьорд",
					["guid"] = "Player-1615-075CFF90",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676758015,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3691-07177352"] = {
					["name"] = "Tiasto-Blackhand",
					["guid"] = "Player-3691-07177352",
					["class"] = "WARRIOR",
					["cache_time"] = 1679506666,
					["realm"] = "Blackhand",
				},
				["Player-1602-0F3161EF"] = {
					["name"] = "курюзелёное-Гордунни",
					["guid"] = "Player-1602-0F3161EF",
					["class"] = "ROGUE",
					["cache_time"] = 1676968925,
					["realm"] = "Гордунни",
				},
				["Player-1403-0A4F90C6"] = {
					["name"] = "Bodkivka-Draenor",
					["guid"] = "Player-1403-0A4F90C6",
					["class"] = "EVOKER",
					["cache_time"] = 1686035755,
					["realm"] = "Draenor",
				},
				["Player-581-09F17D83"] = {
					["name"] = "Zeyol-Blackrock",
					["guid"] = "Player-581-09F17D83",
					["class"] = "MAGE",
					["cache_time"] = 1686121310,
					["realm"] = "Blackrock",
				},
				["Player-3682-08A6173D"] = {
					["ilvl"] = 443.5,
					["guid"] = "Player-3682-08A6173D",
					["class"] = "SHAMAN",
					["role"] = "DAMAGER",
					["cache_time"] = 1689281451,
					["realm"] = "Ragnaros",
					["name"] = "Lonz-Ragnaros",
					["specID"] = 262,
					["enchantingLvl"] = 0,
					["rank"] = "Core",
				},
				["Player-1305-040AF0DD"] = {
					["name"] = "Lelene-Kazzak",
					["guid"] = "Player-1305-040AF0DD",
					["class"] = "PALADIN",
					["cache_time"] = 1680292466,
					["realm"] = "Kazzak",
				},
				["Player-1403-0A670C02"] = {
					["name"] = "Miyora-Draenor",
					["guid"] = "Player-1403-0A670C02",
					["class"] = "DRUID",
					["cache_time"] = 1688922048,
					["realm"] = "Draenor",
				},
				["Player-3691-09EFA4F7"] = {
					["name"] = "Theabraxas-Blackhand",
					["guid"] = "Player-3691-09EFA4F7",
					["class"] = "WARLOCK",
					["cache_time"] = 1684559781,
					["realm"] = "Blackhand",
				},
				["Player-580-07FAD58E"] = {
					["name"] = "Xiiri-Blackmoore",
					["guid"] = "Player-580-07FAD58E",
					["class"] = "HUNTER",
					["cache_time"] = 1688927498,
					["realm"] = "Blackmoore",
				},
				["Player-3682-0B1ACF0D"] = {
					["name"] = "Laurs-Ragnaros",
					["guid"] = "Player-3682-0B1ACF0D",
					["class"] = "WARRIOR",
					["cache_time"] = 1679327375,
					["realm"] = "Ragnaros",
				},
				["Player-1303-0A119C30"] = {
					["name"] = "Sacredtusk-Aggra(Português)",
					["guid"] = "Player-1303-0A119C30",
					["class"] = "DRUID",
					["cache_time"] = 1680401778,
					["realm"] = "Aggra(Português)",
				},
				["Player-3391-0C2B64E5"] = {
					["name"] = "Ejia-Silvermoon",
					["guid"] = "Player-3391-0C2B64E5",
					["class"] = "DRUID",
					["cache_time"] = 1677223354,
					["realm"] = "Silvermoon",
				},
				["Player-1408-0A633A71"] = {
					["name"] = "Emmyqt-DunMorogh",
					["guid"] = "Player-1408-0A633A71",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1679932008,
					["realm"] = "DunMorogh",
				},
				["Player-1615-0B014A10"] = {
					["name"] = "ублюдечки-Ревущийфьорд",
					["guid"] = "Player-1615-0B014A10",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1675869700,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-0A816D9C"] = {
					["name"] = "Russellorc-Ragnaros",
					["guid"] = "Player-3682-0A816D9C",
					["class"] = "WARRIOR",
					["cache_time"] = 1678865303,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0BA3ADFA"] = {
					["name"] = "Seedblast-Kazzak",
					["guid"] = "Player-1305-0BA3ADFA",
					["class"] = "MAGE",
					["cache_time"] = 1685745460,
					["realm"] = "Kazzak",
				},
				["Player-1596-0F53C03C"] = {
					["name"] = "Aithreth-Lightning'sBlade",
					["guid"] = "Player-1596-0F53C03C",
					["class"] = "EVOKER",
					["cache_time"] = 1676757146,
					["realm"] = "Lightning'sBlade",
				},
				["Player-1923-0AAE758E"] = {
					["name"] = "арматуринаа-Ясеневыйлес",
					["guid"] = "Player-1923-0AAE758E",
					["class"] = "DRUID",
					["cache_time"] = 1675869700,
					["realm"] = "Ясеневыйлес",
				},
				["Player-1084-0A94EACF"] = {
					["name"] = "Suncherry-TarrenMill",
					["guid"] = "Player-1084-0A94EACF",
					["class"] = "DRUID",
					["cache_time"] = 1680693800,
					["realm"] = "TarrenMill",
				},
				["Player-3682-093985A2"] = {
					["name"] = "Khaelya-Ragnaros",
					["guid"] = "Player-3682-093985A2",
					["class"] = "ROGUE",
					["cache_time"] = 1676973948,
					["realm"] = "Ragnaros",
				},
				["Player-1615-09A59CC5"] = {
					["name"] = "айсонми-Ревущийфьорд",
					["guid"] = "Player-1615-09A59CC5",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677665404,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3674-097467D2"] = {
					["name"] = "Wazane-TwistingNether",
					["guid"] = "Player-3674-097467D2",
					["class"] = "DRUID",
					["cache_time"] = 1679424868,
					["realm"] = "TwistingNether",
				},
				["Player-1615-0AEB4362"] = {
					["name"] = "элунаар-Ревущийфьорд",
					["guid"] = "Player-1615-0AEB4362",
					["class"] = "MONK",
					["cache_time"] = 1688949050,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1092-080D1C5C"] = {
					["name"] = "Tomorrowland-Drak'thul",
					["guid"] = "Player-1092-080D1C5C",
					["class"] = "PRIEST",
					["cache_time"] = 1690493152,
					["realm"] = "Drak'thul",
				},
				["Player-1615-0AA7B1CD"] = {
					["name"] = "сеуау-Ревущийфьорд",
					["guid"] = "Player-1615-0AA7B1CD",
					["class"] = "MONK",
					["cache_time"] = 1685749577,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1602-0F517A63"] = {
					["name"] = "гаврпал-Гордунни",
					["guid"] = "Player-1602-0F517A63",
					["class"] = "PALADIN",
					["cache_time"] = 1688499798,
					["realm"] = "Гордунни",
				},
				["Player-1335-09DA610C"] = {
					["name"] = "Sokadab-Ysondre",
					["guid"] = "Player-1335-09DA610C",
					["class"] = "HUNTER",
					["cache_time"] = 1680262695,
					["realm"] = "Ysondre",
				},
				["Player-3686-0535589C"] = {
					["name"] = "Ishval-Antonidas",
					["guid"] = "Player-3686-0535589C",
					["class"] = "WARRIOR",
					["cache_time"] = 1679632936,
					["realm"] = "Antonidas",
				},
				["Player-1602-0F5D56F9"] = {
					["name"] = "бронвур-Гордунни",
					["guid"] = "Player-1602-0F5D56F9",
					["class"] = "PALADIN",
					["cache_time"] = 1686934454,
					["realm"] = "Гордунни",
				},
				["Player-1084-0A57E2A8"] = {
					["ilvl"] = 417.1875,
					["guid"] = "Player-1084-0A57E2A8",
					["class"] = "PRIEST",
					["role"] = "HEALER",
					["cache_time"] = 1680383988,
					["rank"] = "Raider",
					["name"] = "Makèá-TarrenMill",
					["specID"] = 257,
					["enchantingLvl"] = 0,
					["realm"] = "TarrenMill",
				},
				["Player-1325-03C61918"] = {
					["name"] = "Zhiros-Aggramar",
					["guid"] = "Player-1325-03C61918",
					["class"] = "HUNTER",
					["cache_time"] = 1679506666,
					["realm"] = "Aggramar",
				},
				["Player-3682-0AA8169C"] = {
					["name"] = "Drmicky-Ragnaros",
					["guid"] = "Player-3682-0AA8169C",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676453757,
					["realm"] = "Ragnaros",
				},
				["Player-3682-06CC7CDD"] = {
					["name"] = "Blamas-Ragnaros",
					["guid"] = "Player-3682-06CC7CDD",
					["class"] = "SHAMAN",
					["cache_time"] = 1676525453,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0A4D4A88"] = {
					["name"] = "Valytharia-Kazzak",
					["guid"] = "Player-1305-0A4D4A88",
					["class"] = "MONK",
					["cache_time"] = 1686754263,
					["realm"] = "Kazzak",
				},
				["Player-3692-0A03CA26"] = {
					["name"] = "Nobow-Eredar",
					["guid"] = "Player-3692-0A03CA26",
					["class"] = "HUNTER",
					["cache_time"] = 1687259300,
					["realm"] = "Eredar",
				},
				["Player-1099-09139014"] = {
					["name"] = "Julinaria-Rexxar",
					["guid"] = "Player-1099-09139014",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1679220234,
					["realm"] = "Rexxar",
				},
				["Player-580-0A57E506"] = {
					["name"] = "Rêspâwn-Blackmoore",
					["guid"] = "Player-580-0A57E506",
					["class"] = "DRUID",
					["cache_time"] = 1689769880,
					["realm"] = "Blackmoore",
				},
				["Player-1615-0B1D02FC"] = {
					["name"] = "зюкси-Ревущийфьорд",
					["guid"] = "Player-1615-0B1D02FC",
					["class"] = "PRIEST",
					["cache_time"] = 1690056506,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1615-0B12C70D"] = {
					["name"] = "кактусоло-Ревущийфьорд",
					["guid"] = "Player-1615-0B12C70D",
					["class"] = "WARRIOR",
					["cache_time"] = 1684491466,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1305-0C3FCE40"] = {
					["name"] = "Bhzad-Kazzak",
					["guid"] = "Player-1305-0C3FCE40",
					["class"] = "WARRIOR",
					["cache_time"] = 1678732140,
					["realm"] = "Kazzak",
				},
				["Player-1305-0C939062"] = {
					["name"] = "Namash-Kazzak",
					["guid"] = "Player-1305-0C939062",
					["class"] = "SHAMAN",
					["cache_time"] = 1689253178,
					["realm"] = "Kazzak",
				},
				["Player-1305-084B715C"] = {
					["name"] = "Dklouk-Kazzak",
					["guid"] = "Player-1305-084B715C",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680262695,
					["realm"] = "Kazzak",
				},
				["Player-3703-06AFA448"] = {
					["name"] = "Clocki-Frostwolf",
					["guid"] = "Player-3703-06AFA448",
					["class"] = "HUNTER",
					["cache_time"] = 1683073733,
					["realm"] = "Frostwolf",
				},
				["Player-1084-0A53DA96"] = {
					["name"] = "Ewwhat-TarrenMill",
					["guid"] = "Player-1084-0A53DA96",
					["class"] = "WARRIOR",
					["cache_time"] = 1679424868,
					["realm"] = "TarrenMill",
				},
				["Player-1084-086F0F3F"] = {
					["name"] = "Jèhuty-TarrenMill",
					["guid"] = "Player-1084-086F0F3F",
					["class"] = "MONK",
					["cache_time"] = 1676439591,
					["realm"] = "TarrenMill",
				},
				["Player-1305-04897CA7"] = {
					["name"] = "Frantzis-Kazzak",
					["guid"] = "Player-1305-04897CA7",
					["class"] = "HUNTER",
					["cache_time"] = 1676479581,
					["realm"] = "Kazzak",
				},
				["Player-3391-09302DAC"] = {
					["name"] = "Quenderin-Silvermoon",
					["guid"] = "Player-3391-09302DAC",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676763406,
					["realm"] = "Silvermoon",
				},
				["Player-1096-08B97719"] = {
					["name"] = "Jakonda-DefiasBrotherhood",
					["guid"] = "Player-1096-08B97719",
					["class"] = "HUNTER",
					["cache_time"] = 1680290994,
					["realm"] = "DefiasBrotherhood",
				},
				["Player-1390-094B8A60"] = {
					["name"] = "Dixøurs-Hyjal",
					["guid"] = "Player-1390-094B8A60",
					["class"] = "DRUID",
					["cache_time"] = 1680292466,
					["realm"] = "Hyjal",
				},
				["Player-1104-04C57B6B"] = {
					["name"] = "Sheara-Gul'dan",
					["guid"] = "Player-1104-04C57B6B",
					["class"] = "MAGE",
					["cache_time"] = 1686754263,
					["realm"] = "Gul'dan",
				},
				["Player-1305-0A282482"] = {
					["name"] = "Pimeplz-Kazzak",
					["guid"] = "Player-1305-0A282482",
					["class"] = "PALADIN",
					["cache_time"] = 1684472200,
					["realm"] = "Kazzak",
				},
				["Player-1092-0A968961"] = {
					["name"] = "Bielamrdka-Drak'thul",
					["guid"] = "Player-1092-0A968961",
					["class"] = "HUNTER",
					["cache_time"] = 1685468704,
					["realm"] = "Drak'thul",
				},
				["Player-1615-0A4548A3"] = {
					["ilvl"] = 384.4375,
					["guid"] = "Player-1615-0A4548A3",
					["class"] = "WARLOCK",
					["realm"] = "Ревущийфьорд",
					["role"] = "DAMAGER",
					["cache_time"] = 1676372637,
					["name"] = "соложмых-Ревущийфьорд",
					["specID"] = 266,
					["enchanter"] = true,
					["enchantingLvl"] = 25,
					["rank"] = "Член ги",
				},
				["Player-3674-0B18EC32"] = {
					["name"] = "Keshandr-TwistingNether",
					["guid"] = "Player-3674-0B18EC32",
					["class"] = "HUNTER",
					["cache_time"] = 1676180633,
					["realm"] = "TwistingNether",
				},
				["Player-3682-0B1695DA"] = {
					["name"] = "Vyathas-Ragnaros",
					["guid"] = "Player-3682-0B1695DA",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676583473,
					["realm"] = "Ragnaros",
				},
				["Player-3674-0B0478E6"] = {
					["name"] = "Notmousse-TwistingNether",
					["guid"] = "Player-3674-0B0478E6",
					["class"] = "SHAMAN",
					["cache_time"] = 1678486019,
					["realm"] = "TwistingNether",
				},
				["Player-3391-0BE852EC"] = {
					["name"] = "Omfgdh-Silvermoon",
					["guid"] = "Player-3391-0BE852EC",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684123613,
					["realm"] = "Silvermoon",
				},
				["Player-1402-0A27A14D"] = {
					["name"] = "Onlytides-Doomhammer",
					["guid"] = "Player-1402-0A27A14D",
					["class"] = "SHAMAN",
					["cache_time"] = 1686004021,
					["realm"] = "Doomhammer",
				},
				["Player-1597-06A2AD2B"] = {
					["name"] = "Unbull-Jaedenar",
					["guid"] = "Player-1597-06A2AD2B",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1686121310,
					["realm"] = "Jaedenar",
				},
				["Player-604-07BC0E6C"] = {
					["name"] = "Banglado-Thrall",
					["guid"] = "Player-604-07BC0E6C",
					["class"] = "DRUID",
					["cache_time"] = 1676768222,
					["realm"] = "Thrall",
				},
				["Player-1096-0A5028AE"] = {
					["name"] = "Garrôsh-DefiasBrotherhood",
					["guid"] = "Player-1096-0A5028AE",
					["class"] = "WARRIOR",
					["cache_time"] = 1687791302,
					["realm"] = "DefiasBrotherhood",
				},
				["Player-3713-0A82291D"] = {
					["name"] = "Eily-BurningLegion",
					["guid"] = "Player-3713-0A82291D",
					["class"] = "PRIEST",
					["cache_time"] = 1677515492,
					["realm"] = "BurningLegion",
				},
				["Player-1602-0F5304B3"] = {
					["name"] = "сиронис-Гордунни",
					["guid"] = "Player-1602-0F5304B3",
					["class"] = "PRIEST",
					["cache_time"] = 1676466306,
					["realm"] = "Гордунни",
				},
				["Player-581-0A740438"] = {
					["name"] = "Tettentobi-Blackrock",
					["guid"] = "Player-581-0A740438",
					["class"] = "DRUID",
					["cache_time"] = 1686934454,
					["realm"] = "Blackrock",
				},
				["Player-2074-058E2A2E"] = {
					["name"] = "Oxmo-EmeraldDream",
					["guid"] = "Player-2074-058E2A2E",
					["class"] = "WARRIOR",
					["cache_time"] = 1677315157,
					["realm"] = "EmeraldDream",
				},
				["Player-1316-0BE4DB4A"] = {
					["name"] = "Bûbble-Nemesis",
					["guid"] = "Player-1316-0BE4DB4A",
					["class"] = "PALADIN",
					["cache_time"] = 1684569933,
					["realm"] = "Nemesis",
				},
				["Player-3692-04FB369F"] = {
					["name"] = "Shellie-Eredar",
					["guid"] = "Player-3692-04FB369F",
					["class"] = "PRIEST",
					["cache_time"] = 1686754263,
					["realm"] = "Eredar",
				},
				["Player-1303-0C250E45"] = {
					["name"] = "Vulps-Frostmane",
					["guid"] = "Player-1303-0C250E45",
					["class"] = "MAGE",
					["cache_time"] = 1684502528,
					["realm"] = "Frostmane",
				},
				["Player-1305-0C8FE827"] = {
					["name"] = "Remenant-Kazzak",
					["guid"] = "Player-1305-0C8FE827",
					["class"] = "ROGUE",
					["cache_time"] = 1684209680,
					["realm"] = "Kazzak",
				},
				["Player-1602-0F505853"] = {
					["name"] = "лустач-Гордунни",
					["guid"] = "Player-1602-0F505853",
					["class"] = "MONK",
					["cache_time"] = 1684472200,
					["realm"] = "Гордунни",
				},
				["Player-3391-092F1289"] = {
					["name"] = "Varene-Silvermoon",
					["guid"] = "Player-3391-092F1289",
					["class"] = "PRIEST",
					["cache_time"] = 1684211462,
					["realm"] = "Silvermoon",
				},
				["Player-3682-0A7A0140"] = {
					["ilvl"] = 441.9375,
					["guid"] = "Player-3682-0A7A0140",
					["class"] = "PALADIN",
					["realm"] = "Ragnaros",
					["role"] = "DAMAGER",
					["cache_time"] = 1687802886,
					["name"] = "Pad-Ragnaros",
					["specID"] = 70,
					["enchanter"] = true,
					["enchantingLvl"] = 120,
					["rank"] = "Trial",
				},
				["Player-1604-0BFBF699"] = {
					["name"] = "падшаялоа-СвежевательДуш",
					["guid"] = "Player-1604-0BFBF699",
					["class"] = "PRIEST",
					["cache_time"] = 1678459218,
					["realm"] = "СвежевательДуш",
				},
				["Player-1084-0A6822C3"] = {
					["name"] = "Neffyou-TarrenMill",
					["guid"] = "Player-1084-0A6822C3",
					["class"] = "HUNTER",
					["cache_time"] = 1685832119,
					["realm"] = "TarrenMill",
				},
				["Player-3682-0B14D3C5"] = {
					["name"] = "Kenzsjo-Ragnaros",
					["guid"] = "Player-3682-0B14D3C5",
					["class"] = "ROGUE",
					["cache_time"] = 1688161192,
					["realm"] = "Ragnaros",
				},
				["Player-1378-0ADE41C1"] = {
					["name"] = "Dreyfush-DunModr",
					["guid"] = "Player-1378-0ADE41C1",
					["class"] = "WARRIOR",
					["cache_time"] = 1687955030,
					["realm"] = "DunModr",
				},
				["Player-1403-09C84421"] = {
					["name"] = "Sukall-Draenor",
					["guid"] = "Player-1403-09C84421",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1679506666,
					["realm"] = "Draenor",
				},
				["Player-1615-09B3580C"] = {
					["name"] = "сильверкот-Ревущийфьорд",
					["guid"] = "Player-1615-09B3580C",
					["class"] = "DRUID",
					["cache_time"] = 1689270818,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1621-0836192E"] = {
					["name"] = "Novadeath-Dalaran",
					["guid"] = "Player-1621-0836192E",
					["class"] = "ROGUE",
					["cache_time"] = 1677111814,
					["realm"] = "Dalaran",
				},
				["Player-1092-088CAAF5"] = {
					["name"] = "Brutalus-BurningBlade",
					["guid"] = "Player-1092-088CAAF5",
					["class"] = "PRIEST",
					["cache_time"] = 1686121310,
					["realm"] = "BurningBlade",
				},
				["Player-1092-00F9D62A"] = {
					["name"] = "Drtivaz-Drak'thul",
					["guid"] = "Player-1092-00F9D62A",
					["class"] = "WARRIOR",
					["cache_time"] = 1676977455,
					["realm"] = "Drak'thul",
				},
				["Player-1084-0A7E0547"] = {
					["name"] = "Jihoonpal-TarrenMill",
					["guid"] = "Player-1084-0A7E0547",
					["class"] = "PALADIN",
					["cache_time"] = 1689704202,
					["realm"] = "TarrenMill",
				},
				["Player-1403-0A341A06"] = {
					["name"] = "Blöw-Draenor",
					["guid"] = "Player-1403-0A341A06",
					["class"] = "SHAMAN",
					["cache_time"] = 1684501707,
					["realm"] = "Draenor",
				},
				["Player-3692-09E65DCC"] = {
					["name"] = "Crysthalos-Eredar",
					["guid"] = "Player-3692-09E65DCC",
					["class"] = "MAGE",
					["cache_time"] = 1686121310,
					["realm"] = "Eredar",
				},
				["Player-3682-07B87974"] = {
					["name"] = "Critstarz-Ragnaros",
					["guid"] = "Player-3682-07B87974",
					["class"] = "HUNTER",
					["cache_time"] = 1690135545,
					["realm"] = "Ragnaros",
				},
				["Player-1403-09C9CB95"] = {
					["name"] = "Faint-Draenor",
					["guid"] = "Player-1403-09C9CB95",
					["class"] = "PRIEST",
					["cache_time"] = 1686933987,
					["realm"] = "Draenor",
				},
				["Player-3682-0B122AC4"] = {
					["name"] = "Secondhealer-Ragnaros",
					["guid"] = "Player-3682-0B122AC4",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680813097,
					["realm"] = "Ragnaros",
				},
				["Player-1403-0A61F7A7"] = {
					["name"] = "Fvp-Draenor",
					["guid"] = "Player-1403-0A61F7A7",
					["class"] = "MAGE",
					["cache_time"] = 1680383988,
					["realm"] = "Draenor",
				},
				["Player-1092-09549F9B"] = {
					["name"] = "Eloranus-BurningBlade",
					["guid"] = "Player-1092-09549F9B",
					["class"] = "MAGE",
					["cache_time"] = 1676190291,
					["realm"] = "BurningBlade",
				},
				["Player-3691-0493C4BF"] = {
					["name"] = "Immerdruf-Blackhand",
					["guid"] = "Player-3691-0493C4BF",
					["class"] = "WARRIOR",
					["cache_time"] = 1680292466,
					["realm"] = "Blackhand",
				},
				["Player-1305-0C8FFED1"] = {
					["name"] = "Marcen-Kazzak",
					["guid"] = "Player-1305-0C8FFED1",
					["class"] = "EVOKER",
					["cache_time"] = 1690510136,
					["realm"] = "Kazzak",
				},
				["Player-1096-0611E244"] = {
					["name"] = "Asta-DefiasBrotherhood",
					["guid"] = "Player-1096-0611E244",
					["class"] = "PRIEST",
					["cache_time"] = 1678411108,
					["realm"] = "DefiasBrotherhood",
				},
				["Player-1096-0A642D22"] = {
					["name"] = "Leegma-Ravenholdt",
					["guid"] = "Player-1096-0A642D22",
					["class"] = "EVOKER",
					["cache_time"] = 1687298820,
					["realm"] = "Ravenholdt",
				},
				["Player-580-08E140FC"] = {
					["name"] = "Fraggyrogue-Blackmoore",
					["guid"] = "Player-580-08E140FC",
					["class"] = "ROGUE",
					["cache_time"] = 1680008261,
					["realm"] = "Blackmoore",
				},
				["Player-3692-09FE2127"] = {
					["name"] = "Lejnaya-Eredar",
					["guid"] = "Player-3692-09FE2127",
					["class"] = "PALADIN",
					["cache_time"] = 1680292466,
					["realm"] = "Eredar",
				},
				["Player-3682-0AFB2442"] = {
					["ilvl"] = 413.8125,
					["guid"] = "Player-3682-0AFB2442",
					["class"] = "WARRIOR",
					["realm"] = "Ragnaros",
					["role"] = "TANK",
					["cache_time"] = 1676323969,
					["name"] = "Eldoii-Ragnaros",
					["specID"] = 73,
					["enchanter"] = true,
					["enchantingLvl"] = 82,
					["rank"] = "Mythic Raider",
				},
				["Player-3682-0B09339F"] = {
					["ilvl"] = 414.8125,
					["guid"] = "Player-3682-0B09339F",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1679949497,
					["realm"] = "Ragnaros",
					["name"] = "Iliyana-Ragnaros",
					["specID"] = 253,
					["enchantingLvl"] = 0,
					["rank"] = "Mythic Raider",
				},
				["Player-3686-0A03B046"] = {
					["name"] = "Cendor-Antonidas",
					["guid"] = "Player-3686-0A03B046",
					["class"] = "PALADIN",
					["cache_time"] = 1685128648,
					["realm"] = "Antonidas",
				},
				["Player-3682-0B28D272"] = {
					["ilvl"] = 441.25,
					["guid"] = "Player-3682-0B28D272",
					["class"] = "PALADIN",
					["role"] = "HEALER",
					["name"] = "Zeroe-Ragnaros",
					["realm"] = "Ragnaros",
					["cache_time"] = 1689951104,
					["specID"] = 65,
					["enchantingLvl"] = 0,
					["rank"] = "Alt",
				},
				["Player-3713-0AD73D8A"] = {
					["name"] = "Hrfun-BurningLegion",
					["guid"] = "Player-3713-0AD73D8A",
					["class"] = "HUNTER",
					["cache_time"] = 1680262695,
					["realm"] = "BurningLegion",
				},
				["Player-580-0A0FC757"] = {
					["name"] = "Lajapal-Blackmoore",
					["guid"] = "Player-580-0A0FC757",
					["class"] = "PALADIN",
					["cache_time"] = 1684487464,
					["realm"] = "Blackmoore",
				},
				["Player-3391-0A4F7286"] = {
					["name"] = "Flammathoria-Silvermoon",
					["guid"] = "Player-3391-0A4F7286",
					["class"] = "SHAMAN",
					["cache_time"] = 1680437946,
					["realm"] = "Silvermoon",
				},
				["Player-1305-0C88A059"] = {
					["name"] = "Coachgordon-Kazzak",
					["guid"] = "Player-1305-0C88A059",
					["class"] = "SHAMAN",
					["cache_time"] = 1685529229,
					["realm"] = "Kazzak",
				},
				["Player-3691-09DAF858"] = {
					["name"] = "Judgêmental-Blackhand",
					["guid"] = "Player-3691-09DAF858",
					["class"] = "PALADIN",
					["cache_time"] = 1684501707,
					["realm"] = "Blackhand",
				},
				["Player-1084-090C3938"] = {
					["name"] = "Fleetingmind-TarrenMill",
					["guid"] = "Player-1084-090C3938",
					["class"] = "WARRIOR",
					["cache_time"] = 1687157922,
					["realm"] = "TarrenMill",
				},
				["Player-1602-0F575D45"] = {
					["name"] = "лакостабум-Гордунни",
					["guid"] = "Player-1602-0F575D45",
					["class"] = "DRUID",
					["cache_time"] = 1685516014,
					["realm"] = "Гордунни",
				},
				["Player-3702-0A911634"] = {
					["name"] = "Kasamarhu-ArgentDawn",
					["guid"] = "Player-3702-0A911634",
					["class"] = "DRUID",
					["cache_time"] = 1676377737,
					["realm"] = "ArgentDawn",
				},
				["Player-1602-0F5298DE"] = {
					["name"] = "драккарич-Гордунни",
					["guid"] = "Player-1602-0F5298DE",
					["class"] = "EVOKER",
					["cache_time"] = 1677075763,
					["realm"] = "Гордунни",
				},
				["Player-1305-0C556CC8"] = {
					["name"] = "Delvithal-Kazzak",
					["guid"] = "Player-1305-0C556CC8",
					["class"] = "EVOKER",
					["cache_time"] = 1676973948,
					["realm"] = "Kazzak",
				},
				["Player-1615-0B0FF2AC"] = {
					["name"] = "эмиар-Ревущийфьорд",
					["guid"] = "Player-1615-0B0FF2AC",
					["class"] = "WARRIOR",
					["cache_time"] = 1676952906,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-0ADC5C10"] = {
					["ilvl"] = 417.0625,
					["guid"] = "Player-3682-0ADC5C10",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1677792661,
					["rank"] = "Social",
					["name"] = "Itharíus-Ragnaros",
					["specID"] = 254,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-3692-09FC4358"] = {
					["name"] = "Atneus-Eredar",
					["guid"] = "Player-3692-09FC4358",
					["class"] = "ROGUE",
					["cache_time"] = 1680245006,
					["realm"] = "Eredar",
				},
				["Player-1602-0AB94733"] = {
					["name"] = "гацкан-Гордунни",
					["guid"] = "Player-1602-0AB94733",
					["class"] = "PALADIN",
					["cache_time"] = 1685437969,
					["realm"] = "Гордунни",
				},
				["Player-1305-0C4CA7CF"] = {
					["name"] = "Lichhunter-Kazzak",
					["guid"] = "Player-1305-0C4CA7CF",
					["class"] = "HUNTER",
					["cache_time"] = 1680218725,
					["realm"] = "Kazzak",
				},
				["Player-3682-0AA5E2D2"] = {
					["ilvl"] = 398.25,
					["guid"] = "Player-3682-0AA5E2D2",
					["class"] = "WARRIOR",
					["role"] = "DAMAGER",
					["cache_time"] = 1676913794,
					["rank"] = "Alt",
					["name"] = "Gosumvp-Ragnaros",
					["specID"] = 71,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-1084-0A9A28C3"] = {
					["name"] = "Mjnd-TarrenMill",
					["guid"] = "Player-1084-0A9A28C3",
					["class"] = "PALADIN",
					["cache_time"] = 1689338662,
					["realm"] = "TarrenMill",
				},
				["Player-3691-099F9930"] = {
					["name"] = "Bagule-Blackhand",
					["guid"] = "Player-3691-099F9930",
					["class"] = "HUNTER",
					["cache_time"] = 1676973948,
					["realm"] = "Blackhand",
				},
				["Player-3682-0B10E8B4"] = {
					["ilvl"] = 444.5625,
					["guid"] = "Player-3682-0B10E8B4",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1689281451,
					["realm"] = "Ragnaros",
					["name"] = "Cödhead-Ragnaros",
					["specID"] = 254,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1379-0ADAB80C"] = {
					["name"] = "Hêllion-Sanguino",
					["guid"] = "Player-1379-0ADAB80C",
					["class"] = "EVOKER",
					["cache_time"] = 1689699139,
					["realm"] = "Sanguino",
				},
				["Player-1615-08F86C4C"] = {
					["name"] = "мирэлис-Ревущийфьорд",
					["guid"] = "Player-1615-08F86C4C",
					["class"] = "WARLOCK",
					["cache_time"] = 1676326104,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1305-06E57F78"] = {
					["name"] = "Massterror-Kazzak",
					["guid"] = "Player-1305-06E57F78",
					["class"] = "MAGE",
					["cache_time"] = 1688889814,
					["realm"] = "Kazzak",
				},
				["Player-3682-0B0B2B88"] = {
					["name"] = "Quackitude-Ragnaros",
					["guid"] = "Player-3682-0B0B2B88",
					["class"] = "EVOKER",
					["cache_time"] = 1687040673,
					["realm"] = "Ragnaros",
				},
				["Player-1099-0A8F7FB9"] = {
					["name"] = "Ery-Rexxar",
					["guid"] = "Player-1099-0A8F7FB9",
					["class"] = "WARRIOR",
					["cache_time"] = 1679043249,
					["realm"] = "Rexxar",
				},
				["Player-3682-0B0A2B26"] = {
					["name"] = "Taugyík-Ragnaros",
					["guid"] = "Player-3682-0B0A2B26",
					["class"] = "EVOKER",
					["cache_time"] = 1688983952,
					["realm"] = "Ragnaros",
				},
				["Player-1084-0AA10128"] = {
					["name"] = "Ellah-TarrenMill",
					["guid"] = "Player-1084-0AA10128",
					["class"] = "WARRIOR",
					["cache_time"] = 1687956237,
					["realm"] = "TarrenMill",
				},
				["Player-1621-0B0A5E21"] = {
					["name"] = "Cbg-Dalaran",
					["guid"] = "Player-1621-0B0A5E21",
					["class"] = "EVOKER",
					["cache_time"] = 1676647023,
					["realm"] = "Dalaran",
				},
				["Player-1092-0447CD8C"] = {
					["name"] = "Ragemonster-Drak'thul",
					["guid"] = "Player-1092-0447CD8C",
					["class"] = "PALADIN",
					["cache_time"] = 1690513584,
					["realm"] = "Drak'thul",
				},
				["Player-580-08D7E8FA"] = {
					["name"] = "Mórphuss-Blackmoore",
					["guid"] = "Player-580-08D7E8FA",
					["class"] = "HUNTER",
					["cache_time"] = 1686121699,
					["realm"] = "Blackmoore",
				},
				["Player-1403-0A2F9237"] = {
					["name"] = "Castweazel-Draenor",
					["guid"] = "Player-1403-0A2F9237",
					["class"] = "MAGE",
					["cache_time"] = 1687298820,
					["realm"] = "Draenor",
				},
				["Player-1403-0A6FCE6A"] = {
					["name"] = "Puhvelipappi-Draenor",
					["guid"] = "Player-1403-0A6FCE6A",
					["class"] = "PRIEST",
					["cache_time"] = 1686121310,
					["realm"] = "Draenor",
				},
				["Player-1390-0C83BE41"] = {
					["name"] = "Lodjay-Hyjal",
					["guid"] = "Player-1390-0C83BE41",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684056553,
					["realm"] = "Hyjal",
				},
				["Player-1305-0B3B0EEC"] = {
					["name"] = "Skizim-Kazzak",
					["guid"] = "Player-1305-0B3B0EEC",
					["class"] = "PRIEST",
					["cache_time"] = 1687261056,
					["realm"] = "Kazzak",
				},
				["Player-3691-09F81B73"] = {
					["name"] = "Cixxz-Blackhand",
					["guid"] = "Player-3691-09F81B73",
					["class"] = "MONK",
					["cache_time"] = 1676973948,
					["realm"] = "Blackhand",
				},
				["Player-2073-09F3AF8F"] = {
					["name"] = "Sorryimgay-Stormscale",
					["guid"] = "Player-2073-09F3AF8F",
					["class"] = "MAGE",
					["cache_time"] = 1677665404,
					["realm"] = "Stormscale",
				},
				["Player-1301-09AB398C"] = {
					["name"] = "Hykzz-Outland",
					["guid"] = "Player-1301-09AB398C",
					["class"] = "PRIEST",
					["cache_time"] = 1676439596,
					["realm"] = "Outland",
				},
				["Player-1621-0B1E5054"] = {
					["name"] = "Bÿrn-Dalaran",
					["guid"] = "Player-1621-0B1E5054",
					["class"] = "MONK",
					["cache_time"] = 1680303748,
					["realm"] = "Dalaran",
				},
				["Player-604-046C7433"] = {
					["name"] = "Tängo-Thrall",
					["guid"] = "Player-604-046C7433",
					["class"] = "HUNTER",
					["cache_time"] = 1676311312,
					["realm"] = "Thrall",
				},
				["Player-3674-0B1CF6AC"] = {
					["name"] = "Monkorobos-TwistingNether",
					["guid"] = "Player-3674-0B1CF6AC",
					["class"] = "MONK",
					["cache_time"] = 1680388343,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0872037A"] = {
					["name"] = "Pheadros-TwistingNether",
					["guid"] = "Player-3674-0872037A",
					["class"] = "MONK",
					["cache_time"] = 1676973948,
					["realm"] = "TwistingNether",
				},
				["Player-1098-0A86A9F3"] = {
					["name"] = "Volsheesh-Malygos",
					["guid"] = "Player-1098-0A86A9F3",
					["class"] = "SHAMAN",
					["cache_time"] = 1680292466,
					["realm"] = "Malygos",
				},
				["Player-3674-0AC1D75E"] = {
					["name"] = "Afterr-TwistingNether",
					["guid"] = "Player-3674-0AC1D75E",
					["class"] = "HUNTER",
					["cache_time"] = 1680437946,
					["realm"] = "TwistingNether",
				},
				["Player-581-0A693CE0"] = {
					["name"] = "Malagân-Blackrock",
					["guid"] = "Player-581-0A693CE0",
					["class"] = "EVOKER",
					["cache_time"] = 1676479581,
					["realm"] = "Blackrock",
				},
				["Player-3692-06D0ABE3"] = {
					["name"] = "Arusaki-Eredar",
					["guid"] = "Player-3692-06D0ABE3",
					["class"] = "ROGUE",
					["cache_time"] = 1677518150,
					["realm"] = "Eredar",
				},
				["Player-2073-09FCC379"] = {
					["name"] = "Cskakiller-Stormscale",
					["guid"] = "Player-2073-09FCC379",
					["class"] = "WARRIOR",
					["cache_time"] = 1688687303,
					["realm"] = "Stormscale",
				},
				["Player-1305-0C3C2693"] = {
					["name"] = "Inncubuss-Kazzak",
					["guid"] = "Player-1305-0C3C2693",
					["class"] = "PALADIN",
					["cache_time"] = 1680399046,
					["realm"] = "Kazzak",
				},
				["Player-3690-0AFFB845"] = {
					["name"] = "øzø-KhazModan",
					["guid"] = "Player-3690-0AFFB845",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684205677,
					["realm"] = "KhazModan",
				},
				["Player-1084-0A8B9DF7"] = {
					["name"] = "Omidbutcher-TarrenMill",
					["guid"] = "Player-1084-0A8B9DF7",
					["class"] = "HUNTER",
					["cache_time"] = 1676184388,
					["realm"] = "TarrenMill",
				},
				["Player-1615-0AFF7BCB"] = {
					["name"] = "князьгрязь-Ревущийфьорд",
					["guid"] = "Player-1615-0AFF7BCB",
					["class"] = "PALADIN",
					["cache_time"] = 1685871367,
					["realm"] = "Ревущийфьорд",
				},
				["Player-581-08D5662A"] = {
					["name"] = "Brewszlee-Blackrock",
					["guid"] = "Player-581-08D5662A",
					["class"] = "MONK",
					["cache_time"] = 1685794414,
					["realm"] = "Blackrock",
				},
				["Player-1301-051B9D43"] = {
					["name"] = "Thaigal-Outland",
					["guid"] = "Player-1301-051B9D43",
					["class"] = "MONK",
					["cache_time"] = 1676187142,
					["realm"] = "Outland",
				},
				["Player-1396-08519DDD"] = {
					["name"] = "Phobyaa-Quel'Thalas",
					["guid"] = "Player-1396-08519DDD",
					["class"] = "MONK",
					["cache_time"] = 1689768633,
					["realm"] = "Quel'Thalas",
				},
				["Player-3391-0C8C12EE"] = {
					["name"] = "Raitelis-Silvermoon",
					["guid"] = "Player-3391-0C8C12EE",
					["class"] = "PALADIN",
					["cache_time"] = 1684502528,
					["realm"] = "Silvermoon",
				},
				["Player-3682-0B233FD0"] = {
					["ilvl"] = 429.5625,
					["guid"] = "Player-3682-0B233FD0",
					["class"] = "DRUID",
					["role"] = "HEALER",
					["cache_time"] = 1685651079,
					["realm"] = "Ragnaros",
					["name"] = "Brinsiguruu-Ragnaros",
					["specID"] = 105,
					["enchantingLvl"] = 0,
					["rank"] = "Trial",
				},
				["Player-3674-0AF4F919"] = {
					["name"] = "Woottôdoo-TwistingNether",
					["guid"] = "Player-3674-0AF4F919",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1684883011,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0C4A5716"] = {
					["name"] = "Zxerg-Kazzak",
					["guid"] = "Player-1305-0C4A5716",
					["class"] = "HUNTER",
					["cache_time"] = 1687157922,
					["realm"] = "Kazzak",
				},
				["Player-1335-06F1A1AC"] = {
					["name"] = "Setrarie-Ysondre",
					["guid"] = "Player-1335-06F1A1AC",
					["class"] = "HUNTER",
					["cache_time"] = 1683073733,
					["realm"] = "Ysondre",
				},
				["Player-633-0737F6AF"] = {
					["name"] = "Phoqyhu-BurningSteppes",
					["guid"] = "Player-633-0737F6AF",
					["class"] = "PRIEST",
					["cache_time"] = 1690410239,
					["realm"] = "BurningSteppes",
				},
				["Player-1621-0AC1E344"] = {
					["name"] = "Kimaru-Dalaran",
					["guid"] = "Player-1621-0AC1E344",
					["class"] = "HUNTER",
					["cache_time"] = 1676861407,
					["realm"] = "Dalaran",
				},
				["Player-3682-0B0E1571"] = {
					["ilvl"] = 442.75,
					["guid"] = "Player-3682-0B0E1571",
					["class"] = "DEMONHUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1688676359,
					["realm"] = "Ragnaros",
					["name"] = "Smurkio-Ragnaros",
					["specID"] = 577,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-3682-07424F59"] = {
					["ilvl"] = 443.3125,
					["guid"] = "Player-3682-07424F59",
					["class"] = "MONK",
					["realm"] = "Ragnaros",
					["role"] = "HEALER",
					["cache_time"] = 1689281451,
					["name"] = "Barryscotty-Ragnaros",
					["specID"] = 270,
					["enchanter"] = true,
					["enchantingLvl"] = 86,
					["rank"] = "Officer Alt",
				},
				["Player-3691-0A0274A2"] = {
					["name"] = "Schmilfy-Blackhand",
					["guid"] = "Player-3691-0A0274A2",
					["class"] = "PRIEST",
					["cache_time"] = 1686687418,
					["realm"] = "Blackhand",
				},
				["Player-3682-08C80B4F"] = {
					["name"] = "Hamonhaze-Ragnaros",
					["guid"] = "Player-3682-08C80B4F",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676768222,
					["realm"] = "Ragnaros",
				},
				["Player-581-0A5838D9"] = {
					["name"] = "Benschgiie-Blackrock",
					["guid"] = "Player-581-0A5838D9",
					["class"] = "MONK",
					["cache_time"] = 1684128158,
					["realm"] = "Blackrock",
				},
				["Player-1084-0A312EBA"] = {
					["name"] = "Waldy-TarrenMill",
					["guid"] = "Player-1084-0A312EBA",
					["class"] = "PRIEST",
					["cache_time"] = 1686197400,
					["realm"] = "TarrenMill",
				},
				["Player-1084-0A8AFEE1"] = {
					["name"] = "Travels-TarrenMill",
					["guid"] = "Player-1084-0A8AFEE1",
					["class"] = "HUNTER",
					["cache_time"] = 1680483942,
					["realm"] = "TarrenMill",
				},
				["Player-1598-06D82C2A"] = {
					["name"] = "Saranko-LaughingSkull",
					["guid"] = "Player-1598-06D82C2A",
					["class"] = "DRUID",
					["cache_time"] = 1684125836,
					["realm"] = "LaughingSkull",
				},
				["Player-1122-0726F6FE"] = {
					["name"] = "Skêl-Uldaman",
					["guid"] = "Player-1122-0726F6FE",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1680292466,
					["realm"] = "Uldaman",
				},
				["Player-578-081124E4"] = {
					["name"] = "Kyiel-Wrathbringer",
					["guid"] = "Player-578-081124E4",
					["class"] = "PALADIN",
					["cache_time"] = 1676365490,
					["realm"] = "Wrathbringer",
				},
				["Player-1604-0A2B9365"] = {
					["name"] = "игнистерра-СвежевательДуш",
					["guid"] = "Player-1604-0A2B9365",
					["class"] = "SHAMAN",
					["cache_time"] = 1680292466,
					["realm"] = "СвежевательДуш",
				},
				["Player-1084-0A8DF858"] = {
					["name"] = "Curiit-TarrenMill",
					["guid"] = "Player-1084-0A8DF858",
					["class"] = "WARLOCK",
					["cache_time"] = 1676502766,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0C836E84"] = {
					["name"] = "Dylsi-Kazzak",
					["guid"] = "Player-1305-0C836E84",
					["class"] = "PRIEST",
					["cache_time"] = 1677687759,
					["realm"] = "Kazzak",
				},
				["Player-1390-0C8502ED"] = {
					["name"] = "Djakaissa-Hyjal",
					["guid"] = "Player-1390-0C8502ED",
					["class"] = "PRIEST",
					["cache_time"] = 1690750821,
					["realm"] = "Hyjal",
				},
				["Player-3691-09E148D1"] = {
					["name"] = "Rówyná-Blackhand",
					["guid"] = "Player-3691-09E148D1",
					["class"] = "WARLOCK",
					["cache_time"] = 1676369923,
					["realm"] = "Blackhand",
				},
				["Player-2073-09F42638"] = {
					["name"] = "Samaräs-Stormscale",
					["guid"] = "Player-2073-09F42638",
					["class"] = "WARRIOR",
					["cache_time"] = 1676790256,
					["realm"] = "Stormscale",
				},
				["Player-1604-0F499EF3"] = {
					["name"] = "конъсерва-СвежевательДуш",
					["guid"] = "Player-1604-0F499EF3",
					["class"] = "WARRIOR",
					["cache_time"] = 1684501707,
					["realm"] = "СвежевательДуш",
				},
				["Player-580-0A68CAC0"] = {
					["name"] = "Smoqqs-Blackmoore",
					["guid"] = "Player-580-0A68CAC0",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680437946,
					["realm"] = "Blackmoore",
				},
				["Player-3691-0999DAA3"] = {
					["name"] = "Gammora-Blackhand",
					["guid"] = "Player-3691-0999DAA3",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679221593,
					["realm"] = "Blackhand",
				},
				["Player-3682-0AAE0434"] = {
					["name"] = "Dezit-Ragnaros",
					["guid"] = "Player-3682-0AAE0434",
					["class"] = "WARLOCK",
					["cache_time"] = 1677879103,
					["realm"] = "Ragnaros",
				},
				["Player-1305-09DDAF9B"] = {
					["name"] = "Dulnok-Kazzak",
					["guid"] = "Player-1305-09DDAF9B",
					["class"] = "HUNTER",
					["cache_time"] = 1676387096,
					["realm"] = "Kazzak",
				},
				["Player-1302-0C825F46"] = {
					["name"] = "Shoklorz-Archimonde",
					["guid"] = "Player-1302-0C825F46",
					["class"] = "PALADIN",
					["cache_time"] = 1689699139,
					["realm"] = "Archimonde",
				},
				["Player-1615-0AD6B73B"] = {
					["name"] = "флися-Ревущийфьорд",
					["guid"] = "Player-1615-0AD6B73B",
					["class"] = "MAGE",
					["cache_time"] = 1677607191,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3674-0B26DC6D"] = {
					["name"] = "Hamsivoker-TwistingNether",
					["guid"] = "Player-3674-0B26DC6D",
					["class"] = "EVOKER",
					["cache_time"] = 1689850645,
					["realm"] = "TwistingNether",
				},
				["Player-3682-0AEAB102"] = {
					["name"] = "Stewdruid-Ragnaros",
					["guid"] = "Player-3682-0AEAB102",
					["class"] = "DRUID",
					["cache_time"] = 1686758840,
					["realm"] = "Ragnaros",
				},
				["Player-1098-059FD235"] = {
					["name"] = "Aèrin-Malfurion",
					["guid"] = "Player-1098-059FD235",
					["class"] = "HUNTER",
					["cache_time"] = 1679228248,
					["realm"] = "Malfurion",
				},
				["Player-3682-0866F7E7"] = {
					["name"] = "Liek-Ragnaros",
					["guid"] = "Player-3682-0866F7E7",
					["class"] = "WARRIOR",
					["cache_time"] = 1687259300,
					["realm"] = "Ragnaros",
				},
				["Player-1596-0751258C"] = {
					["name"] = "Trackmania-TheMaelstrom",
					["guid"] = "Player-1596-0751258C",
					["class"] = "HUNTER",
					["cache_time"] = 1676973948,
					["realm"] = "TheMaelstrom",
				},
				["Player-1084-0A791F00"] = {
					["name"] = "Darkjosh-TarrenMill",
					["guid"] = "Player-1084-0A791F00",
					["class"] = "WARLOCK",
					["cache_time"] = 1679747022,
					["realm"] = "TarrenMill",
				},
				["Player-1084-09948431"] = {
					["name"] = "Slaqzthree-TarrenMill",
					["guid"] = "Player-1084-09948431",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1678480586,
					["realm"] = "TarrenMill",
				},
				["Player-3682-0AC82CF6"] = {
					["name"] = "Ordeca-Ragnaros",
					["guid"] = "Player-3682-0AC82CF6",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679335297,
					["realm"] = "Ragnaros",
				},
				["Player-1403-0A7174C4"] = {
					["name"] = "Díscard-Draenor",
					["guid"] = "Player-1403-0A7174C4",
					["class"] = "HUNTER",
					["cache_time"] = 1686934454,
					["realm"] = "Draenor",
				},
				["Player-3682-0B1CD5E3"] = {
					["name"] = "Chìva-Ragnaros",
					["guid"] = "Player-3682-0B1CD5E3",
					["class"] = "DRUID",
					["cache_time"] = 1680553185,
					["realm"] = "Ragnaros",
				},
				["Player-580-086C38E5"] = {
					["name"] = "Liyáh-Blackmoore",
					["guid"] = "Player-580-086C38E5",
					["class"] = "PRIEST",
					["cache_time"] = 1677518200,
					["realm"] = "Blackmoore",
				},
				["Player-581-09E0A825"] = {
					["name"] = "Urf-Blackrock",
					["guid"] = "Player-581-09E0A825",
					["class"] = "ROGUE",
					["cache_time"] = 1676182188,
					["realm"] = "Blackrock",
				},
				["Player-3682-0B26ACBD"] = {
					["ilvl"] = 386.5,
					["guid"] = "Player-3682-0B26ACBD",
					["class"] = "PRIEST",
					["role"] = "HEALER",
					["cache_time"] = 1688881144,
					["realm"] = "Ragnaros",
					["name"] = "Dogson-Ragnaros",
					["specID"] = 257,
					["enchantingLvl"] = 0,
					["rank"] = "Alt",
				},
				["Player-580-0A6B1C75"] = {
					["name"] = "Zaw-Blackmoore",
					["guid"] = "Player-580-0A6B1C75",
					["class"] = "HUNTER",
					["cache_time"] = 1676601603,
					["realm"] = "Blackmoore",
				},
				["Player-1596-0F1DE120"] = {
					["name"] = "Coggersnick-TheMaelstrom",
					["guid"] = "Player-1596-0F1DE120",
					["class"] = "ROGUE",
					["cache_time"] = 1687956908,
					["realm"] = "TheMaelstrom",
				},
				["Player-1084-0A8B566F"] = {
					["name"] = "Soulboundd-TarrenMill",
					["guid"] = "Player-1084-0A8B566F",
					["class"] = "EVOKER",
					["cache_time"] = 1676365490,
					["realm"] = "TarrenMill",
				},
				["Player-1390-0C1F9FA5"] = {
					["name"] = "Itsnotmojo-Hyjal",
					["guid"] = "Player-1390-0C1F9FA5",
					["class"] = "HUNTER",
					["cache_time"] = 1686934454,
					["realm"] = "Hyjal",
				},
				["Player-3682-07C057AA"] = {
					["name"] = "Gedeoonn-Ragnaros",
					["guid"] = "Player-3682-07C057AA",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687955030,
					["realm"] = "Ragnaros",
				},
				["Player-3674-0992727C"] = {
					["name"] = "Iqoes-TwistingNether",
					["guid"] = "Player-3674-0992727C",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679622284,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0534344C"] = {
					["name"] = "Malv-Kazzak",
					["guid"] = "Player-1305-0534344C",
					["class"] = "HUNTER",
					["cache_time"] = 1678052884,
					["realm"] = "Kazzak",
				},
				["Player-580-0A7466A1"] = {
					["name"] = "Bergnasenbär-Blackmoore",
					["guid"] = "Player-580-0A7466A1",
					["class"] = "MONK",
					["cache_time"] = 1687298820,
					["realm"] = "Blackmoore",
				},
				["Player-633-076E9F65"] = {
					["name"] = "Paused-ShatteredHand",
					["guid"] = "Player-633-076E9F65",
					["class"] = "WARLOCK",
					["cache_time"] = 1676367472,
					["realm"] = "ShatteredHand",
				},
				["Player-1097-0A3E79A7"] = {
					["name"] = "Smooklover-Ysera",
					["guid"] = "Player-1097-0A3E79A7",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679854886,
					["realm"] = "Ysera",
				},
				["Player-1084-0A947DC3"] = {
					["name"] = "Limpansdk-TarrenMill",
					["guid"] = "Player-1084-0A947DC3",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1689245123,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0C65222B"] = {
					["name"] = "Sorenstar-Kazzak",
					["guid"] = "Player-1305-0C65222B",
					["class"] = "DRUID",
					["cache_time"] = 1677665404,
					["realm"] = "Kazzak",
				},
				["Player-1084-08C71207"] = {
					["name"] = "Hayotal-TarrenMill",
					["guid"] = "Player-1084-08C71207",
					["class"] = "DRUID",
					["cache_time"] = 1679506666,
					["realm"] = "TarrenMill",
				},
				["Player-1390-07AA068A"] = {
					["name"] = "Ishkarabine-Hyjal",
					["guid"] = "Player-1390-07AA068A",
					["class"] = "HUNTER",
					["cache_time"] = 1686754474,
					["realm"] = "Hyjal",
				},
				["Player-1615-07BA8491"] = {
					["name"] = "сургуч-Ревущийфьорд",
					["guid"] = "Player-1615-07BA8491",
					["class"] = "DRUID",
					["cache_time"] = 1684510785,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3674-09C6BDB0"] = {
					["name"] = "Jerkai-TwistingNether",
					["guid"] = "Player-3674-09C6BDB0",
					["class"] = "PALADIN",
					["cache_time"] = 1684413259,
					["realm"] = "TwistingNether",
				},
				["Player-1390-0BE8299D"] = {
					["name"] = "Noobaax-Hyjal",
					["guid"] = "Player-1390-0BE8299D",
					["class"] = "SHAMAN",
					["cache_time"] = 1690305151,
					["realm"] = "Hyjal",
				},
				["Player-1615-08F07B06"] = {
					["name"] = "старыидядя-Ревущийфьорд",
					["guid"] = "Player-1615-08F07B06",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1685781164,
					["realm"] = "Ревущийфьорд",
				},
				["Player-581-0A51F97A"] = {
					["name"] = "Vâskâ-Blackrock",
					["guid"] = "Player-581-0A51F97A",
					["class"] = "DRUID",
					["cache_time"] = 1678642525,
					["realm"] = "Blackrock",
				},
				["Player-581-0A667EEF"] = {
					["name"] = "Nhaahla-Blackrock",
					["guid"] = "Player-581-0A667EEF",
					["class"] = "WARLOCK",
					["cache_time"] = 1689338654,
					["realm"] = "Blackrock",
				},
				["Player-1335-096A9A29"] = {
					["name"] = "Wilpøx-Ysondre",
					["guid"] = "Player-1335-096A9A29",
					["class"] = "PALADIN",
					["cache_time"] = 1684420122,
					["realm"] = "Ysondre",
				},
				["Player-3682-0B23E535"] = {
					["name"] = "Lifegrips-Ragnaros",
					["guid"] = "Player-3682-0B23E535",
					["class"] = "PRIEST",
					["cache_time"] = 1689281451,
					["realm"] = "Ragnaros",
				},
				["Player-1316-049659EC"] = {
					["name"] = "Maße-Nemesis",
					["guid"] = "Player-1316-049659EC",
					["class"] = "PALADIN",
					["cache_time"] = 1683069512,
					["realm"] = "Nemesis",
				},
				["Player-1615-0B0D0DF9"] = {
					["name"] = "шмалевой-Ревущийфьорд",
					["guid"] = "Player-1615-0B0D0DF9",
					["class"] = "HUNTER",
					["cache_time"] = 1677347909,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3674-0B2514E5"] = {
					["name"] = "Alfagreek-TwistingNether",
					["guid"] = "Player-3674-0B2514E5",
					["class"] = "MONK",
					["cache_time"] = 1684926332,
					["realm"] = "TwistingNether",
				},
				["Player-3686-0A02538B"] = {
					["name"] = "Thælgrim-Antonidas",
					["guid"] = "Player-3686-0A02538B",
					["class"] = "WARRIOR",
					["cache_time"] = 1685128648,
					["realm"] = "Antonidas",
				},
				["Player-1084-0A5F8509"] = {
					["name"] = "Petmeharder-TarrenMill",
					["guid"] = "Player-1084-0A5F8509",
					["class"] = "DRUID",
					["cache_time"] = 1679846287,
					["realm"] = "TarrenMill",
				},
				["Player-1604-0EC974D1"] = {
					["name"] = "бубеносец-СвежевательДуш",
					["guid"] = "Player-1604-0EC974D1",
					["class"] = "DRUID",
					["cache_time"] = 1683903940,
					["realm"] = "СвежевательДуш",
				},
				["Player-3674-05A38F50"] = {
					["name"] = "Sanios-TwistingNether",
					["guid"] = "Player-3674-05A38F50",
					["class"] = "PALADIN",
					["cache_time"] = 1676206092,
					["realm"] = "TwistingNether",
				},
				["Player-1335-09B494A6"] = {
					["role"] = "TANK",
					["name"] = "Uglybaby-Ysondre",
					["guid"] = "Player-1335-09B494A6",
					["rank"] = "Unguilded",
					["class"] = "DRUID",
					["cache_time"] = 1679780488,
					["realm"] = "Ysondre",
				},
				["Player-3691-0924CCBB"] = {
					["name"] = "Andiwms-Mal'Ganis",
					["guid"] = "Player-3691-0924CCBB",
					["class"] = "MAGE",
					["cache_time"] = 1677518213,
					["realm"] = "Mal'Ganis",
				},
				["Player-1390-0C3CF680"] = {
					["name"] = "Soowon-Hyjal",
					["guid"] = "Player-1390-0C3CF680",
					["class"] = "WARRIOR",
					["cache_time"] = 1684564034,
					["realm"] = "Hyjal",
				},
				["Player-1390-0C4F62B9"] = {
					["name"] = "Guaiden-Hyjal",
					["guid"] = "Player-1390-0C4F62B9",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1684502528,
					["realm"] = "Hyjal",
				},
				["Player-2073-06A3BCBD"] = {
					["name"] = "Stringmeme-Stormscale",
					["guid"] = "Player-2073-06A3BCBD",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687791012,
					["realm"] = "Stormscale",
				},
				["Player-1301-0C41013B"] = {
					["name"] = "Bozq-Outland",
					["guid"] = "Player-1301-0C41013B",
					["class"] = "DRUID",
					["cache_time"] = 1676761783,
					["realm"] = "Outland",
				},
				["Player-1309-049712FA"] = {
					["role"] = "HEALER",
					["name"] = "Elicjd-Pozzodell'Eternità",
					["guid"] = "Player-1309-049712FA",
					["rank"] = "Membro",
					["class"] = "DRUID",
					["cache_time"] = 1677489750,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-3674-0B133FA1"] = {
					["name"] = "Oora-TwistingNether",
					["guid"] = "Player-3674-0B133FA1",
					["class"] = "EVOKER",
					["cache_time"] = 1685685471,
					["realm"] = "TwistingNether",
				},
				["Player-1097-08C56C7B"] = {
					["name"] = "Gèé-Malorne",
					["guid"] = "Player-1097-08C56C7B",
					["class"] = "WARRIOR",
					["cache_time"] = 1689290162,
					["realm"] = "Malorne",
				},
				["Player-1305-0C0265B8"] = {
					["name"] = "Elchapobaby-Kazzak",
					["guid"] = "Player-1305-0C0265B8",
					["class"] = "ROGUE",
					["cache_time"] = 1689769880,
					["realm"] = "Kazzak",
				},
				["Player-1335-066AB6AB"] = {
					["ilvl"] = 438.75,
					["guid"] = "Player-1335-066AB6AB",
					["class"] = "DEMONHUNTER",
					["role"] = "TANK",
					["cache_time"] = 1687260396,
					["realm"] = "Ysondre",
					["name"] = "Leguerrecsgo-Ysondre",
					["specID"] = 581,
					["enchantingLvl"] = 0,
					["rank"] = "Magma",
				},
				["Player-1084-0A82B0F7"] = {
					["name"] = "Rommél-TarrenMill",
					["guid"] = "Player-1084-0A82B0F7",
					["class"] = "WARRIOR",
					["cache_time"] = 1686935978,
					["realm"] = "TarrenMill",
				},
				["Player-1105-08F6E3EC"] = {
					["name"] = "Ladariel-Aman'thul",
					["guid"] = "Player-1105-08F6E3EC",
					["class"] = "HUNTER",
					["cache_time"] = 1678616145,
					["realm"] = "Aman'thul",
				},
				["Player-3682-0B24B2C9"] = {
					["name"] = "Amphatic-Ragnaros",
					["guid"] = "Player-3682-0B24B2C9",
					["class"] = "PRIEST",
					["cache_time"] = 1686619075,
					["realm"] = "Ragnaros",
				},
				["Player-3692-05F9A462"] = {
					["name"] = "Dashfal-Eredar",
					["guid"] = "Player-3692-05F9A462",
					["class"] = "DRUID",
					["cache_time"] = 1676973948,
					["realm"] = "Eredar",
				},
				["Player-3682-0B251C19"] = {
					["ilvl"] = 443.25,
					["guid"] = "Player-3682-0B251C19",
					["class"] = "DRUID",
					["role"] = "DAMAGER",
					["cache_time"] = 1688407659,
					["realm"] = "Ragnaros",
					["name"] = "Zerow-Ragnaros",
					["specID"] = 103,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-3674-0B192E2D"] = {
					["name"] = "Lyvian-TwistingNether",
					["guid"] = "Player-3674-0B192E2D",
					["class"] = "SHAMAN",
					["cache_time"] = 1678066914,
					["realm"] = "TwistingNether",
				},
				["Player-3691-09EEE161"] = {
					["name"] = "Moondus-Blackhand",
					["guid"] = "Player-3691-09EEE161",
					["class"] = "DRUID",
					["cache_time"] = 1679412889,
					["realm"] = "Blackhand",
				},
				["Player-3702-0A897B2E"] = {
					["name"] = "Argan-ArgentDawn",
					["guid"] = "Player-3702-0A897B2E",
					["class"] = "SHAMAN",
					["cache_time"] = 1676787714,
					["realm"] = "ArgentDawn",
				},
				["Player-1329-05801921"] = {
					["ilvl"] = 406.75,
					["guid"] = "Player-1329-05801921",
					["class"] = "PALADIN",
					["role"] = "TANK",
					["cache_time"] = 1677513829,
					["rank"] = "BoldgeBoy",
					["name"] = "Protbrampa-Ravencrest",
					["specID"] = 66,
					["enchantingLvl"] = 0,
					["realm"] = "Ravencrest",
				},
				["Player-1084-09D3CC33"] = {
					["name"] = "Hasanii-TarrenMill",
					["guid"] = "Player-1084-09D3CC33",
					["class"] = "DRUID",
					["cache_time"] = 1679506666,
					["realm"] = "TarrenMill",
				},
				["Player-1329-0A02A967"] = {
					["name"] = "Bmwgodx-Ravencrest",
					["guid"] = "Player-1329-0A02A967",
					["class"] = "DRUID",
					["cache_time"] = 1685491367,
					["realm"] = "Ravencrest",
				},
				["Player-3391-0C842877"] = {
					["name"] = "Catsnip-Silvermoon",
					["guid"] = "Player-3391-0C842877",
					["class"] = "DRUID",
					["cache_time"] = 1684481197,
					["realm"] = "Silvermoon",
				},
				["Player-1587-095EE61C"] = {
					["name"] = "Fleaf-Hellfire",
					["guid"] = "Player-1587-095EE61C",
					["class"] = "DRUID",
					["cache_time"] = 1676165355,
					["realm"] = "Hellfire",
				},
				["Player-570-092B0B2D"] = {
					["name"] = "Zedelus-Baelgun",
					["guid"] = "Player-570-092B0B2D",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676760090,
					["realm"] = "Baelgun",
				},
				["Player-1400-0A6C7B19"] = {
					["name"] = "Serephin-Area52",
					["guid"] = "Player-1400-0A6C7B19",
					["class"] = "PALADIN",
					["cache_time"] = 1687102865,
					["realm"] = "Area52",
				},
				["Player-580-08E41E87"] = {
					["name"] = "Farella-Blackmoore",
					["guid"] = "Player-580-08E41E87",
					["class"] = "DRUID",
					["cache_time"] = 1686605803,
					["realm"] = "Blackmoore",
				},
				["Player-1403-0A6055CC"] = {
					["name"] = "Gaggel-Draenor",
					["guid"] = "Player-1403-0A6055CC",
					["class"] = "WARRIOR",
					["cache_time"] = 1685358176,
					["realm"] = "Draenor",
				},
				["Player-1335-0A021183"] = {
					["ilvl"] = 442.25,
					["guid"] = "Player-1335-0A021183",
					["class"] = "DRUID",
					["role"] = "DAMAGER",
					["cache_time"] = 1687260449,
					["realm"] = "Ysondre",
					["name"] = "Plooky-Ysondre",
					["specID"] = 102,
					["enchantingLvl"] = 0,
					["rank"] = "Magma",
				},
				["Player-604-0A39911D"] = {
					["name"] = "Gologrion-Thrall",
					["guid"] = "Player-604-0A39911D",
					["class"] = "PALADIN",
					["cache_time"] = 1680290814,
					["realm"] = "Thrall",
				},
				["Player-1313-05895DFC"] = {
					["name"] = "Vixi-Thunderhorn",
					["guid"] = "Player-1313-05895DFC",
					["class"] = "SHAMAN",
					["cache_time"] = 1676200394,
					["realm"] = "Thunderhorn",
				},
				["Player-3686-09CAB27F"] = {
					["name"] = "Keolah-Antonidas",
					["guid"] = "Player-3686-09CAB27F",
					["class"] = "PRIEST",
					["cache_time"] = 1677256332,
					["realm"] = "Antonidas",
				},
				["Player-3674-0AF679E7"] = {
					["name"] = "Tobirinopal-TwistingNether",
					["guid"] = "Player-3674-0AF679E7",
					["class"] = "PALADIN",
					["cache_time"] = 1685062299,
					["realm"] = "TwistingNether",
				},
				["Player-570-0A94FDBC"] = {
					["name"] = "Lisana-Azshara",
					["guid"] = "Player-570-0A94FDBC",
					["class"] = "PRIEST",
					["cache_time"] = 1679426719,
					["realm"] = "Azshara",
				},
				["Player-1316-0C15A99C"] = {
					["name"] = "Darkhoe-Nemesis",
					["guid"] = "Player-1316-0C15A99C",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686988340,
					["realm"] = "Nemesis",
				},
				["Player-604-086BC338"] = {
					["name"] = "Fujoock-Thrall",
					["guid"] = "Player-604-086BC338",
					["class"] = "MAGE",
					["cache_time"] = 1679244313,
					["realm"] = "Thrall",
				},
				["Player-1621-08892047"] = {
					["name"] = "Søleddad-Dalaran",
					["guid"] = "Player-1621-08892047",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677333500,
					["realm"] = "Dalaran",
				},
				["Player-3682-0775C9EC"] = {
					["name"] = "Kfcsniffer-Ragnaros",
					["guid"] = "Player-3682-0775C9EC",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1690586508,
					["realm"] = "Ragnaros",
				},
				["Player-581-0A62BCE4"] = {
					["name"] = "Mutenx-Blackrock",
					["guid"] = "Player-581-0A62BCE4",
					["class"] = "WARRIOR",
					["cache_time"] = 1684883011,
					["realm"] = "Blackrock",
				},
				["Player-1121-09D2E5C3"] = {
					["name"] = "Florion-KultderVerdammten",
					["guid"] = "Player-1121-09D2E5C3",
					["class"] = "DRUID",
					["cache_time"] = 1684487464,
					["realm"] = "KultderVerdammten",
				},
				["Player-3682-0B1CD5E6"] = {
					["ilvl"] = 417.4375,
					["guid"] = "Player-3682-0B1CD5E6",
					["class"] = "PALADIN",
					["realm"] = "Ragnaros",
					["role"] = "TANK",
					["cache_time"] = 1680115423,
					["name"] = "Aquamentes-Ragnaros",
					["specID"] = 66,
					["enchanter"] = true,
					["enchantingLvl"] = 71,
					["rank"] = "Mythic Raider",
				},
				["Player-633-0A4A8FF2"] = {
					["name"] = "Plaguestrike-Darkspear",
					["guid"] = "Player-633-0A4A8FF2",
					["class"] = "PRIEST",
					["cache_time"] = 1678766259,
					["realm"] = "Darkspear",
				},
				["Player-1127-0A37667D"] = {
					["name"] = "Panzy-KirinTor",
					["guid"] = "Player-1127-0A37667D",
					["class"] = "MONK",
					["cache_time"] = 1680483778,
					["realm"] = "KirinTor",
				},
				["Player-1602-0BFD1252"] = {
					["name"] = "роуэнн-Гордунни",
					["guid"] = "Player-1602-0BFD1252",
					["class"] = "PRIEST",
					["cache_time"] = 1676183151,
					["realm"] = "Гордунни",
				},
				["Player-580-0A6815A9"] = {
					["name"] = "Lâfee-Blackmoore",
					["guid"] = "Player-580-0A6815A9",
					["class"] = "HUNTER",
					["cache_time"] = 1678894799,
					["realm"] = "Blackmoore",
				},
				["Player-3674-0AEB1EC7"] = {
					["name"] = "Píkkutyttö-TwistingNether",
					["guid"] = "Player-3674-0AEB1EC7",
					["class"] = "SHAMAN",
					["cache_time"] = 1684877956,
					["realm"] = "TwistingNether",
				},
				["Player-1379-0A9E00EF"] = {
					["ilvl"] = 419.6875,
					["guid"] = "Player-1379-0A9E00EF",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1679747022,
					["realm"] = "Sanguino",
					["name"] = "Urrik-Sanguino",
					["specID"] = 253,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1329-0A0726EE"] = {
					["name"] = "Greasyfist-Ravencrest",
					["guid"] = "Player-1329-0A0726EE",
					["class"] = "MONK",
					["cache_time"] = 1689259343,
					["realm"] = "Ravencrest",
				},
				["Player-1929-04F26C6A"] = {
					["name"] = "китси-ЧерныйШрам",
					["guid"] = "Player-1929-04F26C6A",
					["class"] = "SHAMAN",
					["cache_time"] = 1686049857,
					["realm"] = "ЧерныйШрам",
				},
				["Player-1390-0C8AE69B"] = {
					["name"] = "Pïøvrà-Hyjal",
					["guid"] = "Player-1390-0C8AE69B",
					["class"] = "HUNTER",
					["cache_time"] = 1684501551,
					["realm"] = "Hyjal",
				},
				["Player-1305-097DD0FB"] = {
					["name"] = "Titanstrike-Kazzak",
					["guid"] = "Player-1305-097DD0FB",
					["class"] = "HUNTER",
					["cache_time"] = 1689804288,
					["realm"] = "Kazzak",
				},
				["Player-3686-0674B9BD"] = {
					["name"] = "Leodur-Antonidas",
					["guid"] = "Player-3686-0674B9BD",
					["class"] = "PALADIN",
					["cache_time"] = 1687259258,
					["realm"] = "Antonidas",
				},
				["Player-1305-0C3AA207"] = {
					["name"] = "Alásea-Kazzak",
					["guid"] = "Player-1305-0C3AA207",
					["class"] = "DRUID",
					["cache_time"] = 1689374076,
					["realm"] = "Kazzak",
				},
				["Player-1922-01050286"] = {
					["name"] = "доброга-Азурегос",
					["guid"] = "Player-1922-01050286",
					["class"] = "PRIEST",
					["cache_time"] = 1685531441,
					["realm"] = "Азурегос",
				},
				["Player-1403-0760DF6F"] = {
					["name"] = "Terenor-Draenor",
					["guid"] = "Player-1403-0760DF6F",
					["class"] = "PALADIN",
					["cache_time"] = 1684877956,
					["realm"] = "Draenor",
				},
				["Player-1309-050B39B5"] = {
					["name"] = "Breakdown-Pozzodell'Eternità",
					["guid"] = "Player-1309-050B39B5",
					["class"] = "HUNTER",
					["cache_time"] = 1676814570,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-3682-0B247C30"] = {
					["ilvl"] = 444,
					["guid"] = "Player-3682-0B247C30",
					["class"] = "MAGE",
					["realm"] = "Ragnaros",
					["role"] = "DAMAGER",
					["cache_time"] = 1689281451,
					["name"] = "Ståck-Ragnaros",
					["specID"] = 62,
					["enchanter"] = true,
					["enchantingLvl"] = 100,
					["rank"] = "Raider",
				},
				["Player-1604-0EA11588"] = {
					["name"] = "думрай-СвежевательДуш",
					["guid"] = "Player-1604-0EA11588",
					["class"] = "ROGUE",
					["cache_time"] = 1684579228,
					["realm"] = "СвежевательДуш",
				},
				["Player-3674-08BB2A61"] = {
					["name"] = "Worstlock-TwistingNether",
					["guid"] = "Player-3674-08BB2A61",
					["class"] = "WARLOCK",
					["cache_time"] = 1680392947,
					["realm"] = "TwistingNether",
				},
				["Player-1604-0B473E8D"] = {
					["name"] = "кайтадель-СвежевательДуш",
					["guid"] = "Player-1604-0B473E8D",
					["class"] = "PALADIN",
					["cache_time"] = 1676968925,
					["realm"] = "СвежевательДуш",
				},
				["Player-1305-0BAEA532"] = {
					["name"] = "Kynther-Kazzak",
					["guid"] = "Player-1305-0BAEA532",
					["class"] = "HUNTER",
					["cache_time"] = 1677665404,
					["realm"] = "Kazzak",
				},
				["Player-1309-0BD76A08"] = {
					["name"] = "Efiø-Pozzodell'Eternità",
					["guid"] = "Player-1309-0BD76A08",
					["class"] = "SHAMAN",
					["cache_time"] = 1676768222,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-1615-0B0705DA"] = {
					["name"] = "асшуриель-Ревущийфьорд",
					["guid"] = "Player-1615-0B0705DA",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1688592287,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1084-091F7E84"] = {
					["name"] = "Sikkimetzis-TarrenMill",
					["guid"] = "Player-1084-091F7E84",
					["class"] = "SHAMAN",
					["cache_time"] = 1680754040,
					["realm"] = "TarrenMill",
				},
				["Player-3690-08CA20D5"] = {
					["name"] = "Ponglenis-KhazModan",
					["guid"] = "Player-3690-08CA20D5",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684926079,
					["realm"] = "KhazModan",
				},
				["Player-1403-06DE7794"] = {
					["name"] = "Bankloans-Draenor",
					["guid"] = "Player-1403-06DE7794",
					["class"] = "PRIEST",
					["cache_time"] = 1680421947,
					["realm"] = "Draenor",
				},
				["Player-3686-09E5EEB2"] = {
					["name"] = "Drpriester-Antonidas",
					["guid"] = "Player-3686-09E5EEB2",
					["class"] = "PRIEST",
					["cache_time"] = 1679998790,
					["realm"] = "Antonidas",
				},
				["Player-1335-096F7E07"] = {
					["name"] = "Sæfralys-Ysondre",
					["guid"] = "Player-1335-096F7E07",
					["class"] = "DRUID",
					["cache_time"] = 1676957994,
					["realm"] = "Ysondre",
				},
				["Player-1305-0C117477"] = {
					["name"] = "Layes-Kazzak",
					["guid"] = "Player-1305-0C117477",
					["class"] = "PALADIN",
					["cache_time"] = 1685393886,
					["realm"] = "Kazzak",
				},
				["Player-3691-092325B3"] = {
					["name"] = "Bassførscher-Mal'Ganis",
					["guid"] = "Player-3691-092325B3",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687041442,
					["realm"] = "Mal'Ganis",
				},
				["Player-1092-0AA53599"] = {
					["name"] = "Húdeex-Drak'thul",
					["guid"] = "Player-1092-0AA53599",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1690410198,
					["realm"] = "Drak'thul",
				},
				["Player-1403-0A27A4EC"] = {
					["name"] = "Moriaa-Draenor",
					["guid"] = "Player-1403-0A27A4EC",
					["class"] = "WARLOCK",
					["cache_time"] = 1688872431,
					["realm"] = "Draenor",
				},
				["Player-1305-0C6114AE"] = {
					["name"] = "Kettana-Kazzak",
					["guid"] = "Player-1305-0C6114AE",
					["class"] = "DRUID",
					["cache_time"] = 1684502528,
					["realm"] = "Kazzak",
				},
				["Player-1325-03C60E52"] = {
					["name"] = "Matthias-Aggramar",
					["guid"] = "Player-1325-03C60E52",
					["class"] = "PALADIN",
					["cache_time"] = 1689800841,
					["realm"] = "Aggramar",
				},
				["Player-3674-06806295"] = {
					["name"] = "Budix-TwistingNether",
					["guid"] = "Player-3674-06806295",
					["class"] = "MONK",
					["cache_time"] = 1685393886,
					["realm"] = "TwistingNether",
				},
				["Player-1302-0B9D1CAD"] = {
					["name"] = "Nyoh-Archimonde",
					["guid"] = "Player-1302-0B9D1CAD",
					["class"] = "PRIEST",
					["cache_time"] = 1679506666,
					["realm"] = "Archimonde",
				},
				["Player-3686-070D4C03"] = {
					["name"] = "Chenks-Antonidas",
					["guid"] = "Player-3686-070D4C03",
					["class"] = "PALADIN",
					["cache_time"] = 1679846287,
					["realm"] = "Antonidas",
				},
				["Player-1329-09F7D6FC"] = {
					["name"] = "Petsotis-Ravencrest",
					["guid"] = "Player-1329-09F7D6FC",
					["class"] = "WARRIOR",
					["cache_time"] = 1676165355,
					["realm"] = "Ravencrest",
				},
				["Player-3682-0AEFD099"] = {
					["ilvl"] = 418.9375,
					["guid"] = "Player-3682-0AEFD099",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["cache_time"] = 1679517906,
					["rank"] = "Mythic Raider",
					["name"] = "Nindz-Ragnaros",
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-580-0A6DD6DE"] = {
					["name"] = "Deluxo-Blackmoore",
					["guid"] = "Player-580-0A6DD6DE",
					["class"] = "MAGE",
					["cache_time"] = 1689804288,
					["realm"] = "Blackmoore",
				},
				["Player-1335-09E8FF6B"] = {
					["name"] = "Spiragon-Ysondre",
					["guid"] = "Player-1335-09E8FF6B",
					["class"] = "EVOKER",
					["cache_time"] = 1685781164,
					["realm"] = "Ysondre",
				},
				["Player-3674-0B157100"] = {
					["name"] = "Sthm-TwistingNether",
					["guid"] = "Player-3674-0B157100",
					["class"] = "PRIEST",
					["cache_time"] = 1684926332,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0B18F265"] = {
					["name"] = "Albinoidiot-TwistingNether",
					["guid"] = "Player-3674-0B18F265",
					["class"] = "EVOKER",
					["cache_time"] = 1676206092,
					["realm"] = "TwistingNether",
				},
				["Player-3686-04423DF8"] = {
					["name"] = "Ghisuu-Antonidas",
					["guid"] = "Player-3686-04423DF8",
					["class"] = "PRIEST",
					["cache_time"] = 1677315157,
					["realm"] = "Antonidas",
				},
				["Player-1379-0ABFC599"] = {
					["name"] = "Renansun-Uldum",
					["guid"] = "Player-1379-0ABFC599",
					["class"] = "PALADIN",
					["cache_time"] = 1680262695,
					["realm"] = "Uldum",
				},
				["Player-1604-0C1D9FD9"] = {
					["name"] = "дедфедот-СвежевательДуш",
					["guid"] = "Player-1604-0C1D9FD9",
					["class"] = "MONK",
					["cache_time"] = 1686121310,
					["realm"] = "СвежевательДуш",
				},
				["Player-1303-0C84BB86"] = {
					["name"] = "Dyrdril-Aggra(Português)",
					["guid"] = "Player-1303-0C84BB86",
					["class"] = "PRIEST",
					["cache_time"] = 1680483675,
					["realm"] = "Aggra(Português)",
				},
				["Player-3686-09FD860C"] = {
					["name"] = "Cniccnac-Antonidas",
					["guid"] = "Player-3686-09FD860C",
					["class"] = "WARLOCK",
					["cache_time"] = 1680005528,
					["realm"] = "Antonidas",
				},
				["Player-1602-0C7BA840"] = {
					["name"] = "шазраэль-Гордунни",
					["guid"] = "Player-1602-0C7BA840",
					["class"] = "ROGUE",
					["cache_time"] = 1686033353,
					["realm"] = "Гордунни",
				},
				["Player-1604-09A85944"] = {
					["name"] = "церара-СвежевательДуш",
					["guid"] = "Player-1604-09A85944",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676185839,
					["realm"] = "СвежевательДуш",
				},
				["Player-1403-0A346460"] = {
					["name"] = "Badbeaver-Draenor",
					["guid"] = "Player-1403-0A346460",
					["class"] = "MONK",
					["cache_time"] = 1680107851,
					["realm"] = "Draenor",
				},
				["Player-3682-067A7E54"] = {
					["name"] = "Fipsy-Ragnaros",
					["guid"] = "Player-3682-067A7E54",
					["class"] = "PALADIN",
					["cache_time"] = 1684569933,
					["realm"] = "Ragnaros",
				},
				["Player-1305-099A51DF"] = {
					["name"] = "Inma-Kazzak",
					["guid"] = "Player-1305-099A51DF",
					["class"] = "PALADIN",
					["cache_time"] = 1679622284,
					["realm"] = "Kazzak",
				},
				["Player-3691-06FB690E"] = {
					["ilvl"] = 423.25,
					["guid"] = "Player-3691-06FB690E",
					["class"] = "WARRIOR",
					["realm"] = "Blackhand",
					["role"] = "TANK",
					["name"] = "Mancubus-Blackhand",
					["cache_time"] = 1684218160,
					["specID"] = 73,
					["enchanter"] = true,
					["enchantingLvl"] = 100,
					["rank"] = "Mainraider",
				},
				["Player-1335-03EBBE96"] = {
					["name"] = "ímpact-Ysondre",
					["guid"] = "Player-1335-03EBBE96",
					["class"] = "SHAMAN",
					["cache_time"] = 1680292466,
					["realm"] = "Ysondre",
				},
				["Player-1587-0F575968"] = {
					["name"] = "Nagyhús-Arathor",
					["guid"] = "Player-1587-0F575968",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685740823,
					["realm"] = "Arathor",
				},
				["Player-1301-0C54302F"] = {
					["name"] = "Rhaani-Outland",
					["guid"] = "Player-1301-0C54302F",
					["class"] = "EVOKER",
					["cache_time"] = 1679621075,
					["realm"] = "Outland",
				},
				["Player-1615-0B28FDAE"] = {
					["name"] = "металитс-Ревущийфьорд",
					["guid"] = "Player-1615-0B28FDAE",
					["class"] = "PALADIN",
					["cache_time"] = 1688985349,
					["realm"] = "Ревущийфьорд",
				},
				["Player-581-0A6D7749"] = {
					["name"] = "Bigdude-Blackrock",
					["guid"] = "Player-581-0A6D7749",
					["class"] = "PALADIN",
					["cache_time"] = 1679506666,
					["realm"] = "Blackrock",
				},
				["Player-1092-0A920318"] = {
					["role"] = "DAMAGER",
					["name"] = "Woxiss-BurningBlade",
					["guid"] = "Player-1092-0A920318",
					["realm"] = "BurningBlade",
					["class"] = "DRUID",
					["cache_time"] = 1676377737,
					["rank"] = "Unguilded",
				},
				["Player-1623-07210475"] = {
					["name"] = "корольллич-Дракономор",
					["guid"] = "Player-1623-07210475",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687949172,
					["realm"] = "Дракономор",
				},
				["Player-581-0A610680"] = {
					["name"] = "Yøu-Blackrock",
					["guid"] = "Player-581-0A610680",
					["class"] = "HUNTER",
					["cache_time"] = 1687949172,
					["realm"] = "Blackrock",
				},
				["Player-1084-0A096E73"] = {
					["name"] = "Nashla-TarrenMill",
					["guid"] = "Player-1084-0A096E73",
					["class"] = "HUNTER",
					["cache_time"] = 1676332542,
					["realm"] = "TarrenMill",
				},
				["Player-1390-0C51F5B5"] = {
					["name"] = "Zguegzilla-Hyjal",
					["guid"] = "Player-1390-0C51F5B5",
					["class"] = "WARRIOR",
					["cache_time"] = 1677223354,
					["realm"] = "Hyjal",
				},
				["Player-3682-0A5232E6"] = {
					["name"] = "Wakywoo-Ragnaros",
					["guid"] = "Player-3682-0A5232E6",
					["class"] = "MONK",
					["cache_time"] = 1677672192,
					["realm"] = "Ragnaros",
				},
				["Player-1378-0627350C"] = {
					["name"] = "Caedric-DunModr",
					["guid"] = "Player-1378-0627350C",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1685397111,
					["realm"] = "DunModr",
				},
				["Player-1615-0B168AFE"] = {
					["name"] = "даниламясник-Ревущийфьорд",
					["guid"] = "Player-1615-0B168AFE",
					["class"] = "WARRIOR",
					["cache_time"] = 1677347909,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1403-0A3C465B"] = {
					["name"] = "Choeron-Draenor",
					["guid"] = "Player-1403-0A3C465B",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676768222,
					["realm"] = "Draenor",
				},
				["Player-1390-0C7B04D0"] = {
					["name"] = "Lìñk-Hyjal",
					["guid"] = "Player-1390-0C7B04D0",
					["class"] = "PALADIN",
					["cache_time"] = 1685288739,
					["realm"] = "Hyjal",
				},
				["Player-1587-0F553078"] = {
					["name"] = "Leyna-Arathor",
					["guid"] = "Player-1587-0F553078",
					["class"] = "EVOKER",
					["cache_time"] = 1679427324,
					["realm"] = "Arathor",
				},
				["Player-1615-0B214E46"] = {
					["name"] = "аркасьен-Ревущийфьорд",
					["guid"] = "Player-1615-0B214E46",
					["class"] = "ROGUE",
					["cache_time"] = 1685864518,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1602-0F54FA63"] = {
					["name"] = "лаумеоун-Гордунни",
					["guid"] = "Player-1602-0F54FA63",
					["class"] = "PALADIN",
					["cache_time"] = 1688876703,
					["realm"] = "Гордунни",
				},
				["Player-1379-0AD74B27"] = {
					["name"] = "Kalar-Sanguino",
					["guid"] = "Player-1379-0AD74B27",
					["class"] = "EVOKER",
					["cache_time"] = 1676768222,
					["realm"] = "Sanguino",
				},
				["Player-1604-0B16A580"] = {
					["name"] = "стейкя-СвежевательДуш",
					["guid"] = "Player-1604-0B16A580",
					["class"] = "PALADIN",
					["cache_time"] = 1684579217,
					["realm"] = "СвежевательДуш",
				},
				["Player-531-0549BD5B"] = {
					["name"] = "Feline-Terrordar",
					["guid"] = "Player-531-0549BD5B",
					["class"] = "DRUID",
					["cache_time"] = 1676973948,
					["realm"] = "Terrordar",
				},
				["Player-1302-092CF34F"] = {
					["name"] = "Lecabillaud-Archimonde",
					["guid"] = "Player-1302-092CF34F",
					["class"] = "MONK",
					["cache_time"] = 1677227530,
					["realm"] = "Archimonde",
				},
				["Player-1929-0CA3055F"] = {
					["name"] = "цацочка-Гром",
					["guid"] = "Player-1929-0CA3055F",
					["class"] = "PRIEST",
					["cache_time"] = 1688947447,
					["realm"] = "Гром",
				},
				["Player-1121-0A6ADBD5"] = {
					["name"] = "Bonesmith-DieewigeWacht",
					["guid"] = "Player-1121-0A6ADBD5",
					["class"] = "WARRIOR",
					["cache_time"] = 1676385549,
					["realm"] = "DieewigeWacht",
				},
				["Player-3674-05B21430"] = {
					["name"] = "Igdraziel-TwistingNether",
					["guid"] = "Player-3674-05B21430",
					["class"] = "WARRIOR",
					["cache_time"] = 1679506666,
					["realm"] = "TwistingNether",
				},
				["Player-1621-098D84CF"] = {
					["name"] = "Häze-MarécagedeZangar",
					["guid"] = "Player-1621-098D84CF",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689804288,
					["realm"] = "MarécagedeZangar",
				},
				["Player-580-01DD854D"] = {
					["name"] = "Schockpulsar-Blackmoore",
					["guid"] = "Player-580-01DD854D",
					["class"] = "PALADIN",
					["cache_time"] = 1676796439,
					["realm"] = "Blackmoore",
				},
				["Player-3682-0A7AEFEC"] = {
					["ilvl"] = 385.375,
					["guid"] = "Player-3682-0A7AEFEC",
					["class"] = "PALADIN",
					["role"] = "TANK",
					["cache_time"] = 1679618143,
					["rank"] = "Alt",
					["name"] = "Fugglypuff-Ragnaros",
					["specID"] = 66,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-581-0A673693"] = {
					["name"] = "Filly-Blackrock",
					["guid"] = "Player-581-0A673693",
					["class"] = "ROGUE",
					["cache_time"] = 1680292466,
					["realm"] = "Blackrock",
				},
				["Player-1621-0B0ECAF3"] = {
					["ilvl"] = 419.6875,
					["guid"] = "Player-1621-0B0ECAF3",
					["class"] = "DRUID",
					["role"] = "DAMAGER",
					["cache_time"] = 1679747022,
					["realm"] = "Dalaran",
					["name"] = "Aleoust-Dalaran",
					["specID"] = 102,
					["enchantingLvl"] = 0,
					["rank"] = "Membre",
				},
				["Player-1623-0AFEFC71"] = {
					["name"] = "палерояль-Дракономор",
					["guid"] = "Player-1623-0AFEFC71",
					["class"] = "PALADIN",
					["cache_time"] = 1688950979,
					["realm"] = "Дракономор",
				},
				["Player-3391-0C306E98"] = {
					["name"] = "Cutestgirl-Silvermoon",
					["guid"] = "Player-3391-0C306E98",
					["class"] = "DRUID",
					["cache_time"] = 1679861251,
					["realm"] = "Silvermoon",
				},
				["Player-3674-07ED8016"] = {
					["name"] = "Grimölf-TwistingNether",
					["guid"] = "Player-3674-07ED8016",
					["class"] = "ROGUE",
					["cache_time"] = 1689395307,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0C8A33F8"] = {
					["name"] = "Maramx-Kazzak",
					["guid"] = "Player-1305-0C8A33F8",
					["class"] = "DRUID",
					["cache_time"] = 1686197400,
					["realm"] = "Kazzak",
				},
				["Player-1104-0A73B6B3"] = {
					["name"] = "Calibubble-Nathrezim",
					["guid"] = "Player-1104-0A73B6B3",
					["class"] = "PALADIN",
					["cache_time"] = 1683810953,
					["realm"] = "Nathrezim",
				},
				["Player-580-0A7296F1"] = {
					["name"] = "Elladría-Blackmoore",
					["guid"] = "Player-580-0A7296F1",
					["class"] = "WARLOCK",
					["cache_time"] = 1686062737,
					["realm"] = "Blackmoore",
				},
				["Player-1092-07D3C203"] = {
					["ilvl"] = 375,
					["guid"] = "Player-1092-07D3C203",
					["class"] = "DRUID",
					["realm"] = "BurningBlade",
					["role"] = "HEALER",
					["cache_time"] = 1676387096,
					["name"] = "Hapytree-BurningBlade",
					["specID"] = 105,
					["enchanter"] = true,
					["enchantingLvl"] = 49,
					["rank"] = "Tunneler",
				},
				["Player-1127-09027EEB"] = {
					["name"] = "Vënum-KirinTor",
					["guid"] = "Player-1127-09027EEB",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687961749,
					["realm"] = "KirinTor",
				},
				["Player-3682-0B038C9A"] = {
					["ilvl"] = 419.5,
					["guid"] = "Player-3682-0B038C9A",
					["class"] = "MAGE",
					["role"] = "DAMAGER",
					["cache_time"] = 1680813585,
					["realm"] = "Ragnaros",
					["name"] = "Qpcheese-Ragnaros",
					["specID"] = 62,
					["enchantingLvl"] = 0,
					["rank"] = "Recruiter",
				},
				["Player-1305-07CC402D"] = {
					["name"] = "Lõst-Kazzak",
					["guid"] = "Player-1305-07CC402D",
					["class"] = "DRUID",
					["cache_time"] = 1685781164,
					["realm"] = "Kazzak",
				},
				["Player-1335-09FED149"] = {
					["name"] = "Shorazen-Ysondre",
					["guid"] = "Player-1335-09FED149",
					["class"] = "PALADIN",
					["cache_time"] = 1687259258,
					["realm"] = "Ysondre",
				},
				["Player-3691-09FB8DA3"] = {
					["name"] = "Whydôthìs-Blackhand",
					["guid"] = "Player-3691-09FB8DA3",
					["class"] = "DRUID",
					["cache_time"] = 1687791302,
					["realm"] = "Blackhand",
				},
				["Player-3691-0494808B"] = {
					["name"] = "Flôlo-Blackhand",
					["guid"] = "Player-3691-0494808B",
					["class"] = "WARLOCK",
					["cache_time"] = 1677606207,
					["realm"] = "Blackhand",
				},
				["Player-1315-0C5343E6"] = {
					["name"] = "Dãrküs-Elune",
					["guid"] = "Player-1315-0C5343E6",
					["class"] = "EVOKER",
					["cache_time"] = 1676911169,
					["realm"] = "Elune",
				},
				["Player-1127-0934C70C"] = {
					["name"] = "Robhyn-KirinTor",
					["guid"] = "Player-1127-0934C70C",
					["class"] = "HUNTER",
					["cache_time"] = 1678052884,
					["realm"] = "KirinTor",
				},
				["Player-1403-0A647483"] = {
					["name"] = "Ghirrosh-Draenor",
					["guid"] = "Player-1403-0A647483",
					["class"] = "WARRIOR",
					["cache_time"] = 1678229349,
					["realm"] = "Draenor",
				},
				["Player-1092-09CB9C75"] = {
					["name"] = "Rakaro-Drak'thul",
					["guid"] = "Player-1092-09CB9C75",
					["class"] = "DRUID",
					["cache_time"] = 1688879894,
					["realm"] = "Drak'thul",
				},
				["Player-1316-07E240FE"] = {
					["name"] = "Hokutø-Nemesis",
					["guid"] = "Player-1316-07E240FE",
					["class"] = "SHAMAN",
					["cache_time"] = 1678052884,
					["realm"] = "Nemesis",
				},
				["Player-633-0AD194CB"] = {
					["name"] = "Mvoker-ShatteredHand",
					["guid"] = "Player-633-0AD194CB",
					["class"] = "EVOKER",
					["cache_time"] = 1689804288,
					["realm"] = "ShatteredHand",
				},
				["Player-1403-09DB8BBB"] = {
					["name"] = "Ekwilbur-Draenor",
					["guid"] = "Player-1403-09DB8BBB",
					["class"] = "PALADIN",
					["cache_time"] = 1677347909,
					["realm"] = "Draenor",
				},
				["Player-1084-0A971771"] = {
					["name"] = "Spinbaby-TarrenMill",
					["guid"] = "Player-1084-0A971771",
					["class"] = "MONK",
					["cache_time"] = 1686197400,
					["realm"] = "TarrenMill",
				},
				["Player-3674-0B11911C"] = {
					["name"] = "Sanaxo-TwistingNether",
					["guid"] = "Player-3674-0B11911C",
					["class"] = "ROGUE",
					["cache_time"] = 1687248521,
					["realm"] = "TwistingNether",
				},
				["Player-1309-0C8E8B65"] = {
					["name"] = "Amubis-Pozzodell'Eternità",
					["guid"] = "Player-1309-0C8E8B65",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1684010132,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-3682-0A839D45"] = {
					["name"] = "Boxyohgee-Ragnaros",
					["guid"] = "Player-3682-0A839D45",
					["class"] = "ROGUE",
					["cache_time"] = 1689293535,
					["realm"] = "Ragnaros",
				},
				["Player-1122-09326BE3"] = {
					["name"] = "Gynécée-Eitrigg",
					["guid"] = "Player-1122-09326BE3",
					["class"] = "DRUID",
					["cache_time"] = 1678052884,
					["realm"] = "Eitrigg",
				},
				["Player-1092-0A3BD796"] = {
					["name"] = "Bayblade-Drak'thul",
					["guid"] = "Player-1092-0A3BD796",
					["class"] = "MONK",
					["cache_time"] = 1680008261,
					["realm"] = "Drak'thul",
				},
				["Player-1587-0F572496"] = {
					["name"] = "Rózsatolvaj-Arathor",
					["guid"] = "Player-1587-0F572496",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685745462,
					["realm"] = "Arathor",
				},
				["Player-612-0A5EFA48"] = {
					["name"] = "Backy-Gilneas",
					["guid"] = "Player-612-0A5EFA48",
					["class"] = "EVOKER",
					["cache_time"] = 1676861407,
					["realm"] = "Gilneas",
				},
				["Player-1303-0C8121CE"] = {
					["name"] = "Livetospike-Aggra(Português)",
					["guid"] = "Player-1303-0C8121CE",
					["class"] = "EVOKER",
					["cache_time"] = 1678052884,
					["realm"] = "Aggra(Português)",
				},
				["Player-3682-0B055009"] = {
					["name"] = "Laike-Ragnaros",
					["guid"] = "Player-3682-0B055009",
					["class"] = "HUNTER",
					["cache_time"] = 1675713949,
					["realm"] = "Ragnaros",
				},
				["Player-1390-0C369992"] = {
					["name"] = "Pælia-Hyjal",
					["guid"] = "Player-1390-0C369992",
					["class"] = "PALADIN",
					["cache_time"] = 1677606779,
					["realm"] = "Hyjal",
				},
				["Player-3674-0B1602C2"] = {
					["name"] = "Flufyqt-TwistingNether",
					["guid"] = "Player-3674-0B1602C2",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680400036,
					["realm"] = "TwistingNether",
				},
				["Player-1615-0B09AF42"] = {
					["name"] = "ньюгии-Ревущийфьорд",
					["guid"] = "Player-1615-0B09AF42",
					["class"] = "EVOKER",
					["cache_time"] = 1676793237,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1305-087B57B7"] = {
					["name"] = "Demonsoull-Kazzak",
					["guid"] = "Player-1305-087B57B7",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1680006982,
					["realm"] = "Kazzak",
				},
				["Player-3682-0B1B92E5"] = {
					["name"] = "Flickmage-Ragnaros",
					["guid"] = "Player-3682-0B1B92E5",
					["class"] = "MAGE",
					["cache_time"] = 1677665910,
					["realm"] = "Ragnaros",
				},
				["Player-1379-09365753"] = {
					["name"] = "Akulakhan-Shen'dralar",
					["guid"] = "Player-1379-09365753",
					["class"] = "MONK",
					["cache_time"] = 1676479581,
					["realm"] = "Shen'dralar",
				},
				["Player-581-0A6A2173"] = {
					["name"] = "Quetzotl-Blackrock",
					["guid"] = "Player-581-0A6A2173",
					["class"] = "DRUID",
					["cache_time"] = 1678052884,
					["realm"] = "Blackrock",
				},
				["Player-3692-058FC600"] = {
					["name"] = "Leyolo-Eredar",
					["guid"] = "Player-3692-058FC600",
					["class"] = "PRIEST",
					["cache_time"] = 1684883011,
					["realm"] = "Eredar",
				},
				["Player-1390-0BE75334"] = {
					["name"] = "Lïnguî-Hyjal",
					["guid"] = "Player-1390-0BE75334",
					["class"] = "ROGUE",
					["cache_time"] = 1676370489,
					["realm"] = "Hyjal",
				},
				["Player-1305-0C49B056"] = {
					["name"] = "Badoo-Kazzak",
					["guid"] = "Player-1305-0C49B056",
					["class"] = "SHAMAN",
					["cache_time"] = 1684212905,
					["realm"] = "Kazzak",
				},
				["Player-1303-0C359ACD"] = {
					["name"] = "Phyxius-GrimBatol",
					["guid"] = "Player-1303-0C359ACD",
					["class"] = "PALADIN",
					["cache_time"] = 1680437946,
					["realm"] = "GrimBatol",
				},
				["Player-1402-09E33A0B"] = {
					["name"] = "Zagrieus-Doomhammer",
					["guid"] = "Player-1402-09E33A0B",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1688983952,
					["realm"] = "Doomhammer",
				},
				["Player-1084-0A869602"] = {
					["name"] = "Archbubbles-TarrenMill",
					["guid"] = "Player-1084-0A869602",
					["class"] = "PALADIN",
					["cache_time"] = 1677665404,
					["realm"] = "TarrenMill",
				},
				["Player-2073-0961FDCF"] = {
					["name"] = "Xeytr-Stormscale",
					["guid"] = "Player-2073-0961FDCF",
					["class"] = "MAGE",
					["cache_time"] = 1676186152,
					["realm"] = "Stormscale",
				},
				["Player-3682-0B14644D"] = {
					["ilvl"] = 393.0625,
					["guid"] = "Player-3682-0B14644D",
					["class"] = "MAGE",
					["role"] = "DAMAGER",
					["cache_time"] = 1677879103,
					["rank"] = "Alt",
					["name"] = "Dumbassmage-Ragnaros",
					["specID"] = 64,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-1084-08DF19DE"] = {
					["name"] = "Spoenie-TarrenMill",
					["guid"] = "Player-1084-08DF19DE",
					["class"] = "DRUID",
					["cache_time"] = 1676486995,
					["realm"] = "TarrenMill",
				},
				["Player-1615-031E08E8"] = {
					["name"] = "форзакен-Ревущийфьорд",
					["guid"] = "Player-1615-031E08E8",
					["class"] = "WARLOCK",
					["cache_time"] = 1683073733,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1597-0F5AAA49"] = {
					["name"] = "Malasortë-Sylvanas",
					["guid"] = "Player-1597-0F5AAA49",
					["class"] = "WARRIOR",
					["cache_time"] = 1687248521,
					["realm"] = "Sylvanas",
				},
				["Player-1084-0A9D413C"] = {
					["name"] = "Bebess-TarrenMill",
					["guid"] = "Player-1084-0A9D413C",
					["class"] = "HUNTER",
					["cache_time"] = 1689772053,
					["realm"] = "TarrenMill",
				},
				["Player-3674-088B032F"] = {
					["name"] = "Capakop-TwistingNether",
					["guid"] = "Player-3674-088B032F",
					["class"] = "HUNTER",
					["cache_time"] = 1679506666,
					["realm"] = "TwistingNether",
				},
				["Player-1084-08DA69EF"] = {
					["name"] = "Rôberta-TarrenMill",
					["guid"] = "Player-1084-08DA69EF",
					["class"] = "MONK",
					["cache_time"] = 1678894799,
					["realm"] = "TarrenMill",
				},
				["Player-1390-0C42F7DD"] = {
					["name"] = "Gømy-Hyjal",
					["guid"] = "Player-1390-0C42F7DD",
					["class"] = "PALADIN",
					["cache_time"] = 1687955030,
					["realm"] = "Hyjal",
				},
				["Player-604-09F91854"] = {
					["name"] = "Jenkins-Thrall",
					["guid"] = "Player-604-09F91854",
					["class"] = "WARLOCK",
					["cache_time"] = 1684235960,
					["realm"] = "Thrall",
				},
				["Player-1615-0B1C6C26"] = {
					["name"] = "миланапетров-Ревущийфьорд",
					["guid"] = "Player-1615-0B1C6C26",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687259300,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1602-0A70DCDA"] = {
					["name"] = "порталия-Гордунни",
					["guid"] = "Player-1602-0A70DCDA",
					["class"] = "MAGE",
					["cache_time"] = 1689677222,
					["realm"] = "Гордунни",
				},
				["Player-3691-09D451DB"] = {
					["name"] = "Demønqt-Blackhand",
					["guid"] = "Player-3691-09D451DB",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1678374224,
					["realm"] = "Blackhand",
				},
				["Player-3674-0AEC5A48"] = {
					["name"] = "Dalghak-TwistingNether",
					["guid"] = "Player-3674-0AEC5A48",
					["class"] = "DRUID",
					["cache_time"] = 1686754474,
					["realm"] = "TwistingNether",
				},
				["Player-1335-09F425CA"] = {
					["name"] = "Lilythk-Ysondre",
					["guid"] = "Player-1335-09F425CA",
					["class"] = "HUNTER",
					["cache_time"] = 1686000336,
					["realm"] = "Ysondre",
				},
				["Player-1305-0C887489"] = {
					["name"] = "Poolaky-Kazzak",
					["guid"] = "Player-1305-0C887489",
					["class"] = "PALADIN",
					["cache_time"] = 1684231108,
					["realm"] = "Kazzak",
				},
				["Player-1405-05BB1222"] = {
					["name"] = "Dadbraekér-ZirkeldesCenarius",
					["guid"] = "Player-1405-05BB1222",
					["class"] = "WARLOCK",
					["cache_time"] = 1684926332,
					["realm"] = "ZirkeldesCenarius",
				},
				["Player-1378-07B472B5"] = {
					["name"] = "Kycka-DunModr",
					["guid"] = "Player-1378-07B472B5",
					["class"] = "DRUID",
					["cache_time"] = 1688985337,
					["realm"] = "DunModr",
				},
				["Player-3682-0B17851D"] = {
					["ilvl"] = 418.9375,
					["guid"] = "Player-3682-0B17851D",
					["class"] = "DRUID",
					["role"] = "HEALER",
					["cache_time"] = 1680813583,
					["rank"] = "Mythic Raider",
					["name"] = "Bathboi-Ragnaros",
					["specID"] = 105,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-3713-0AD7C96A"] = {
					["name"] = "Kaská-BurningLegion",
					["guid"] = "Player-3713-0AD7C96A",
					["class"] = "DRUID",
					["cache_time"] = 1677085516,
					["realm"] = "BurningLegion",
				},
				["Player-1084-0A92B45B"] = {
					["name"] = "Foharrows-TarrenMill",
					["guid"] = "Player-1084-0A92B45B",
					["class"] = "HUNTER",
					["cache_time"] = 1678730018,
					["realm"] = "TarrenMill",
				},
				["Player-3713-0AD2741C"] = {
					["name"] = "Hypnoblaze-BurningLegion",
					["guid"] = "Player-3713-0AD2741C",
					["class"] = "EVOKER",
					["cache_time"] = 1676792336,
					["realm"] = "BurningLegion",
				},
				["Player-1305-0BC545E8"] = {
					["name"] = "Banemonkey-Kazzak",
					["guid"] = "Player-1305-0BC545E8",
					["class"] = "HUNTER",
					["cache_time"] = 1677665910,
					["realm"] = "Kazzak",
				},
				["Player-1329-09F6324D"] = {
					["name"] = "Riodre-Ravencrest",
					["guid"] = "Player-1329-09F6324D",
					["class"] = "PRIEST",
					["cache_time"] = 1686933987,
					["realm"] = "Ravencrest",
				},
				["Player-1080-08E60CE6"] = {
					["name"] = "Bronwen-Khadgar",
					["guid"] = "Player-1080-08E60CE6",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689772053,
					["realm"] = "Khadgar",
				},
				["Player-1329-09F92112"] = {
					["name"] = "Sccrotí-Ravencrest",
					["guid"] = "Player-1329-09F92112",
					["class"] = "PALADIN",
					["cache_time"] = 1677518270,
					["realm"] = "Ravencrest",
				},
				["Player-3682-0B267208"] = {
					["ilvl"] = 444.75,
					["guid"] = "Player-3682-0B267208",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["cache_time"] = 1689620241,
					["rank"] = "Officer Alt",
					["name"] = "Assetp-Ragnaros",
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-1302-0C07A3E0"] = {
					["name"] = "Vpé-Archimonde",
					["guid"] = "Player-1302-0C07A3E0",
					["class"] = "PALADIN",
					["cache_time"] = 1678229349,
					["realm"] = "Archimonde",
				},
				["Player-3391-0C878F33"] = {
					["ilvl"] = 387.5,
					["guid"] = "Player-3391-0C878F33",
					["class"] = "PALADIN",
					["role"] = "DAMAGER",
					["cache_time"] = 1679747022,
					["realm"] = "Silvermoon",
					["name"] = "Lnsx-Silvermoon",
					["specID"] = 70,
					["enchantingLvl"] = 0,
					["rank"] = "Unguilded",
				},
				["Player-1305-07C44D45"] = {
					["name"] = "Valkyrion-Kazzak",
					["guid"] = "Player-1305-07C44D45",
					["class"] = "HUNTER",
					["cache_time"] = 1677885943,
					["realm"] = "Kazzak",
				},
				["Player-1084-0A39AF3D"] = {
					["name"] = "Totemtony-TarrenMill",
					["guid"] = "Player-1084-0A39AF3D",
					["class"] = "SHAMAN",
					["cache_time"] = 1676377737,
					["realm"] = "TarrenMill",
				},
				["Player-1602-0A747266"] = {
					["name"] = "эвилкон-Гордунни",
					["guid"] = "Player-1602-0A747266",
					["class"] = "PRIEST",
					["cache_time"] = 1684309599,
					["realm"] = "Гордунни",
				},
				["Player-3703-04CE47DA"] = {
					["name"] = "Backspace-Frostwolf",
					["guid"] = "Player-3703-04CE47DA",
					["class"] = "ROGUE",
					["cache_time"] = 1679228248,
					["realm"] = "Frostwolf",
				},
				["Player-1305-0C871CCA"] = {
					["name"] = "Fjolnir-Kazzak",
					["guid"] = "Player-1305-0C871CCA",
					["class"] = "PALADIN",
					["cache_time"] = 1684231108,
					["realm"] = "Kazzak",
				},
				["Player-1379-0008C629"] = {
					["name"] = "Inkisitor-Zul'jin",
					["guid"] = "Player-1379-0008C629",
					["class"] = "SHAMAN",
					["cache_time"] = 1679747022,
					["realm"] = "Zul'jin",
				},
				["Player-580-091CDFEF"] = {
					["name"] = "Necrofeelyaa-Blackmoore",
					["guid"] = "Player-580-091CDFEF",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680258337,
					["realm"] = "Blackmoore",
				},
				["Player-1092-09CBF551"] = {
					["name"] = "Sarumanbily-Drak'thul",
					["guid"] = "Player-1092-09CBF551",
					["class"] = "PRIEST",
					["cache_time"] = 1688993030,
					["realm"] = "Drak'thul",
				},
				["Player-1309-0C60C599"] = {
					["name"] = "Vintorez-Pozzodell'Eternità",
					["guid"] = "Player-1309-0C60C599",
					["class"] = "PALADIN",
					["cache_time"] = 1689954010,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-1305-0C2906C2"] = {
					["name"] = "Rimfiree-Kazzak",
					["guid"] = "Player-1305-0C2906C2",
					["class"] = "DRUID",
					["cache_time"] = 1680706575,
					["realm"] = "Kazzak",
				},
				["Player-1305-0C90D32F"] = {
					["ilvl"] = 428.5625,
					["guid"] = "Player-1305-0C90D32F",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["cache_time"] = 1685046636,
					["rank"] = "Unguilded",
					["name"] = "Vyapriest-Kazzak",
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["realm"] = "Kazzak",
				},
				["Player-1403-0A600529"] = {
					["name"] = "Jessed-Draenor",
					["guid"] = "Player-1403-0A600529",
					["class"] = "MAGE",
					["cache_time"] = 1678860427,
					["realm"] = "Draenor",
				},
				["Player-1403-079329CD"] = {
					["name"] = "Wiegott-Draenor",
					["guid"] = "Player-1403-079329CD",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1686121310,
					["realm"] = "Draenor",
				},
				["Player-2073-09E95015"] = {
					["name"] = "Vorugal-Stormscale",
					["guid"] = "Player-2073-09E95015",
					["class"] = "EVOKER",
					["cache_time"] = 1687298820,
					["realm"] = "Stormscale",
				},
				["Player-1084-0928DC70"] = {
					["name"] = "Tkuma-TarrenMill",
					["guid"] = "Player-1084-0928DC70",
					["class"] = "WARRIOR",
					["cache_time"] = 1675782327,
					["realm"] = "TarrenMill",
				},
				["Player-1084-0A7F9B51"] = {
					["name"] = "Sweapy-TarrenMill",
					["guid"] = "Player-1084-0A7F9B51",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686873759,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0C875E72"] = {
					["name"] = "Spørgejörgen-Kazzak",
					["guid"] = "Player-1305-0C875E72",
					["class"] = "SHAMAN",
					["cache_time"] = 1687791012,
					["realm"] = "Kazzak",
				},
				["Player-3692-06515165"] = {
					["name"] = "Wuschh-Eredar",
					["guid"] = "Player-3692-06515165",
					["class"] = "DRUID",
					["cache_time"] = 1676456169,
					["realm"] = "Eredar",
				},
				["Player-3703-09F805F1"] = {
					["name"] = "Monkbonobo-Frostwolf",
					["guid"] = "Player-3703-09F805F1",
					["class"] = "MONK",
					["cache_time"] = 1676220411,
					["realm"] = "Frostwolf",
				},
				["Player-1403-0A0B295A"] = {
					["name"] = "Zvucnikk-Draenor",
					["guid"] = "Player-1403-0A0B295A",
					["class"] = "WARLOCK",
					["cache_time"] = 1689677222,
					["realm"] = "Draenor",
				},
				["Player-3682-0A4EE808"] = {
					["ilvl"] = 437.8125,
					["guid"] = "Player-3682-0A4EE808",
					["class"] = "DEMONHUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1686170267,
					["rank"] = "Mythic Raider",
					["name"] = "Whískyy-Ragnaros",
					["specID"] = 577,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0BBECEE3"] = {
					["name"] = "Bombomdie-Kazzak",
					["guid"] = "Player-1305-0BBECEE3",
					["class"] = "DRUID",
					["cache_time"] = 1689419853,
					["realm"] = "Kazzak",
				},
				["Player-633-062F1B14"] = {
					["ilvl"] = 414.3125,
					["guid"] = "Player-633-062F1B14",
					["class"] = "WARRIOR",
					["role"] = "DAMAGER",
					["cache_time"] = 1677518213,
					["realm"] = "ShatteredHand",
					["name"] = "Stèrnit-ShatteredHand",
					["specID"] = 72,
					["enchantingLvl"] = 0,
					["rank"] = "Officer",
				},
				["Player-1084-09C925F0"] = {
					["name"] = "Zazaz-TarrenMill",
					["guid"] = "Player-1084-09C925F0",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685837361,
					["realm"] = "TarrenMill",
				},
				["Player-509-0A4C5C51"] = {
					["name"] = "Mugnommok-Sargeras",
					["guid"] = "Player-509-0A4C5C51",
					["class"] = "EVOKER",
					["cache_time"] = 1684926332,
					["realm"] = "Sargeras",
				},
				["Player-1105-0A55B097"] = {
					["name"] = "Taalê-Frostmourne",
					["guid"] = "Player-1105-0A55B097",
					["class"] = "PRIEST",
					["cache_time"] = 1680258337,
					["realm"] = "Frostmourne",
				},
				["Player-3674-07787BDC"] = {
					["name"] = "Nothgor-TwistingNether",
					["guid"] = "Player-3674-07787BDC",
					["class"] = "WARLOCK",
					["cache_time"] = 1678223169,
					["realm"] = "TwistingNether",
				},
				["Player-2073-094EB99C"] = {
					["name"] = "Jesburger-Stormscale",
					["guid"] = "Player-2073-094EB99C",
					["class"] = "MONK",
					["cache_time"] = 1684564034,
					["realm"] = "Stormscale",
				},
				["Player-1403-0A22AA88"] = {
					["name"] = "Magiebrot-Draenor",
					["guid"] = "Player-1403-0A22AA88",
					["class"] = "MAGE",
					["cache_time"] = 1676078692,
					["realm"] = "Draenor",
				},
				["Player-1378-08B94473"] = {
					["name"] = "Ibuprofeeno-DunModr",
					["guid"] = "Player-1378-08B94473",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1678499437,
					["realm"] = "DunModr",
				},
				["Player-1335-09FEEA4C"] = {
					["name"] = "Saltyfrosty-Ysondre",
					["guid"] = "Player-1335-09FEEA4C",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1684209680,
					["realm"] = "Ysondre",
				},
				["Player-1329-06A4DF67"] = {
					["name"] = "Manaress-Ravencrest",
					["guid"] = "Player-1329-06A4DF67",
					["class"] = "DRUID",
					["cache_time"] = 1680303765,
					["realm"] = "Ravencrest",
				},
				["Player-1309-0C2C2BBE"] = {
					["name"] = "Malaquìre-Pozzodell'Eternità",
					["guid"] = "Player-1309-0C2C2BBE",
					["class"] = "WARLOCK",
					["cache_time"] = 1687248521,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-1925-0F5AF0A4"] = {
					["name"] = "милффей-ВечнаяПесня",
					["guid"] = "Player-1925-0F5AF0A4",
					["class"] = "PALADIN",
					["cache_time"] = 1685781186,
					["realm"] = "ВечнаяПесня",
				},
				["Player-1092-07F5ACAF"] = {
					["name"] = "Riverglaive-Drak'thul",
					["guid"] = "Player-1092-07F5ACAF",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684479716,
					["realm"] = "Drak'thul",
				},
				["Player-3682-0ADEE32F"] = {
					["name"] = "Quvait-Ragnaros",
					["guid"] = "Player-3682-0ADEE32F",
					["class"] = "MONK",
					["cache_time"] = 1675779446,
					["realm"] = "Ragnaros",
				},
				["Player-1316-0BE9923E"] = {
					["name"] = "Naaku-Nemesis",
					["guid"] = "Player-1316-0BE9923E",
					["class"] = "DRUID",
					["cache_time"] = 1675782327,
					["realm"] = "Nemesis",
				},
				["Player-3674-091DB9E1"] = {
					["name"] = "Rainous-TwistingNether",
					["guid"] = "Player-3674-091DB9E1",
					["class"] = "SHAMAN",
					["cache_time"] = 1677409137,
					["realm"] = "TwistingNether",
				},
				["Player-3391-067A18E6"] = {
					["name"] = "Grumpykat-Silvermoon",
					["guid"] = "Player-3391-067A18E6",
					["class"] = "DRUID",
					["cache_time"] = 1688334538,
					["realm"] = "Silvermoon",
				},
				["Player-1084-0A92B399"] = {
					["name"] = "Xzipiit-TarrenMill",
					["guid"] = "Player-1084-0A92B399",
					["class"] = "ROGUE",
					["cache_time"] = 1687040673,
					["realm"] = "TarrenMill",
				},
				["Player-3674-0A602B9A"] = {
					["name"] = "Kakalos-TwistingNether",
					["guid"] = "Player-3674-0A602B9A",
					["class"] = "PALADIN",
					["cache_time"] = 1679419394,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0B1E29E1"] = {
					["name"] = "Jamyy-TwistingNether",
					["guid"] = "Player-3674-0B1E29E1",
					["class"] = "PALADIN",
					["cache_time"] = 1684590154,
					["realm"] = "TwistingNether",
				},
				["Player-3391-0B78CAE2"] = {
					["name"] = "Ullmina-Silvermoon",
					["guid"] = "Player-3391-0B78CAE2",
					["class"] = "PRIEST",
					["cache_time"] = 1684420122,
					["realm"] = "Silvermoon",
				},
				["Player-1329-0949CA8A"] = {
					["name"] = "Brønsun-Ravencrest",
					["guid"] = "Player-1329-0949CA8A",
					["class"] = "WARRIOR",
					["cache_time"] = 1676953481,
					["realm"] = "Ravencrest",
				},
				["Player-3674-091A8325"] = {
					["role"] = "HEALER",
					["name"] = "Straich-TwistingNether",
					["guid"] = "Player-3674-091A8325",
					["rank"] = "Raider Alt",
					["class"] = "PALADIN",
					["cache_time"] = 1688950979,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0B11F07D"] = {
					["name"] = "Rockarsp-TwistingNether",
					["guid"] = "Player-3674-0B11F07D",
					["class"] = "PRIEST",
					["cache_time"] = 1676079047,
					["realm"] = "TwistingNether",
				},
				["Player-3682-0B210614"] = {
					["ilvl"] = 393.375,
					["guid"] = "Player-3682-0B210614",
					["class"] = "PALADIN",
					["role"] = "TANK",
					["cache_time"] = 1685482769,
					["rank"] = "Alt",
					["name"] = "Moglight-Ragnaros",
					["specID"] = 66,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-3391-08225B1C"] = {
					["name"] = "Ebonmaster-Silvermoon",
					["guid"] = "Player-3391-08225B1C",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680395641,
					["realm"] = "Silvermoon",
				},
				["Player-1084-08133852"] = {
					["name"] = "Rigningin-TarrenMill",
					["guid"] = "Player-1084-08133852",
					["class"] = "WARRIOR",
					["cache_time"] = 1684475487,
					["realm"] = "TarrenMill",
				},
				["Player-578-06A9B277"] = {
					["name"] = "Tokz-Arthas",
					["guid"] = "Player-578-06A9B277",
					["class"] = "WARLOCK",
					["cache_time"] = 1679027833,
					["realm"] = "Arthas",
				},
				["Player-1379-0AC9AA7B"] = {
					["name"] = "Incal-Zul'jin",
					["guid"] = "Player-1379-0AC9AA7B",
					["class"] = "PALADIN",
					["cache_time"] = 1676973948,
					["realm"] = "Zul'jin",
				},
				["Player-1302-0C5746EE"] = {
					["name"] = "Heradracofeu-Archimonde",
					["guid"] = "Player-1302-0C5746EE",
					["class"] = "EVOKER",
					["cache_time"] = 1689773233,
					["realm"] = "Archimonde",
				},
				["Player-581-0A41ED81"] = {
					["name"] = "Karilion-Blackrock",
					["guid"] = "Player-581-0A41ED81",
					["class"] = "PALADIN",
					["cache_time"] = 1676973948,
					["realm"] = "Blackrock",
				},
				["Player-1305-0C62F6FB"] = {
					["name"] = "Coombuster-Kazzak",
					["guid"] = "Player-1305-0C62F6FB",
					["class"] = "MAGE",
					["cache_time"] = 1676331628,
					["realm"] = "Kazzak",
				},
				["Player-2073-09575516"] = {
					["name"] = "Baredurid-Stormscale",
					["guid"] = "Player-2073-09575516",
					["class"] = "DRUID",
					["cache_time"] = 1679027741,
					["realm"] = "Stormscale",
				},
				["Player-1390-0C0FFBC9"] = {
					["name"] = "Ninjaorc-Hyjal",
					["guid"] = "Player-1390-0C0FFBC9",
					["class"] = "HUNTER",
					["cache_time"] = 1685062299,
					["realm"] = "Hyjal",
				},
				["Player-3702-0A9CCC3C"] = {
					["name"] = "Argoron-ArgentDawn",
					["guid"] = "Player-3702-0A9CCC3C",
					["class"] = "PALADIN",
					["cache_time"] = 1685815559,
					["realm"] = "ArgentDawn",
				},
				["Player-1378-0AD16335"] = {
					["name"] = "Leändro-DunModr",
					["guid"] = "Player-1378-0AD16335",
					["class"] = "EVOKER",
					["cache_time"] = 1687955030,
					["realm"] = "DunModr",
				},
				["Player-1602-0D224426"] = {
					["name"] = "пэйпала-Гордунни",
					["guid"] = "Player-1602-0D224426",
					["class"] = "DRUID",
					["cache_time"] = 1684579228,
					["realm"] = "Гордунни",
				},
				["Player-581-0A6FE64F"] = {
					["name"] = "Exeter-Blackrock",
					["guid"] = "Player-581-0A6FE64F",
					["class"] = "MONK",
					["cache_time"] = 1684235960,
					["realm"] = "Blackrock",
				},
				["Player-3682-0B17870F"] = {
					["ilvl"] = 387.6875,
					["guid"] = "Player-3682-0B17870F",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1678485980,
					["rank"] = "Social",
					["name"] = "Fartbending-Ragnaros",
					["specID"] = 255,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-3391-0C918479"] = {
					["name"] = "Haribalsac-Silvermoon",
					["guid"] = "Player-3391-0C918479",
					["class"] = "DRUID",
					["cache_time"] = 1687791302,
					["realm"] = "Silvermoon",
				},
				["Player-1329-09F91C5A"] = {
					["name"] = "Slootybapper-Ravencrest",
					["guid"] = "Player-1329-09F91C5A",
					["class"] = "MONK",
					["cache_time"] = 1676385549,
					["realm"] = "Ravencrest",
				},
				["Player-1390-0BC33BEE"] = {
					["name"] = "Nâximuss-Hyjal",
					["guid"] = "Player-1390-0BC33BEE",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1680398338,
					["realm"] = "Hyjal",
				},
				["Player-1307-0C24C50D"] = {
					["name"] = "Skojarduva-ChamberofAspects",
					["guid"] = "Player-1307-0C24C50D",
					["class"] = "MONK",
					["cache_time"] = 1683817629,
					["realm"] = "ChamberofAspects",
				},
				["Player-3391-0C8E16D0"] = {
					["name"] = "Dazchi-Silvermoon",
					["guid"] = "Player-3391-0C8E16D0",
					["class"] = "MONK",
					["cache_time"] = 1687259300,
					["realm"] = "Silvermoon",
				},
				["Player-3682-0B0C2F01"] = {
					["name"] = "Dracyrus-Ragnaros",
					["guid"] = "Player-3682-0B0C2F01",
					["class"] = "MAGE",
					["cache_time"] = 1676456197,
					["realm"] = "Ragnaros",
				},
				["Player-1602-0F48EABF"] = {
					["name"] = "хелмира-Гордунни",
					["guid"] = "Player-1602-0F48EABF",
					["class"] = "PRIEST",
					["cache_time"] = 1684473849,
					["realm"] = "Гордунни",
				},
				["Player-1302-08BEFF5F"] = {
					["name"] = "Ferz-Archimonde",
					["guid"] = "Player-1302-08BEFF5F",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1677107183,
					["realm"] = "Archimonde",
				},
				["Player-3674-0789F967"] = {
					["name"] = "Rhombos-TwistingNether",
					["guid"] = "Player-3674-0789F967",
					["class"] = "ROGUE",
					["cache_time"] = 1680303748,
					["realm"] = "TwistingNether",
				},
				["Player-1329-09D764A3"] = {
					["name"] = "Qpe-Ravencrest",
					["guid"] = "Player-1329-09D764A3",
					["class"] = "MAGE",
					["cache_time"] = 1675996532,
					["realm"] = "Ravencrest",
				},
				["Player-1302-0C16D127"] = {
					["name"] = "Pouleetpurée-Archimonde",
					["guid"] = "Player-1302-0C16D127",
					["class"] = "ROGUE",
					["cache_time"] = 1685341872,
					["realm"] = "Archimonde",
				},
				["Player-1602-0925D4CC"] = {
					["name"] = "сурасей-Гордунни",
					["guid"] = "Player-1602-0925D4CC",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678894799,
					["realm"] = "Гордунни",
				},
				["Player-1604-0371FB39"] = {
					["name"] = "вектус-СвежевательДуш",
					["guid"] = "Player-1604-0371FB39",
					["class"] = "MAGE",
					["cache_time"] = 1680513310,
					["realm"] = "СвежевательДуш",
				},
				["Player-3702-09900BBF"] = {
					["name"] = "Serís-ArgentDawn",
					["guid"] = "Player-3702-09900BBF",
					["class"] = "MAGE",
					["cache_time"] = 1680437946,
					["realm"] = "ArgentDawn",
				},
				["Player-3674-0B01C0B3"] = {
					["name"] = "Naymar-TwistingNether",
					["guid"] = "Player-3674-0B01C0B3",
					["class"] = "PRIEST",
					["cache_time"] = 1676803606,
					["realm"] = "TwistingNether",
				},
				["Player-3691-0589E92D"] = {
					["name"] = "Pandlina-Blackhand",
					["guid"] = "Player-3691-0589E92D",
					["class"] = "MONK",
					["cache_time"] = 1685191876,
					["realm"] = "Blackhand",
				},
				["Player-1305-0C8EFDDE"] = {
					["name"] = "Wakatta-Kazzak",
					["guid"] = "Player-1305-0C8EFDDE",
					["class"] = "SHAMAN",
					["cache_time"] = 1686126505,
					["realm"] = "Kazzak",
				},
				["Player-3686-09F92919"] = {
					["name"] = "Sophhieqt-Antonidas",
					["guid"] = "Player-3686-09F92919",
					["class"] = "MAGE",
					["cache_time"] = 1680400036,
					["realm"] = "Antonidas",
				},
				["Player-3391-0C796F78"] = {
					["name"] = "Katwynn-Silvermoon",
					["guid"] = "Player-3391-0C796F78",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676343727,
					["realm"] = "Silvermoon",
				},
				["Player-3692-09B927A3"] = {
					["name"] = "Pablos-Eredar",
					["guid"] = "Player-3692-09B927A3",
					["class"] = "PRIEST",
					["cache_time"] = 1680249823,
					["realm"] = "Eredar",
				},
				["Player-1303-0593C4EC"] = {
					["name"] = "Cryptos-Aggra(Português)",
					["guid"] = "Player-1303-0593C4EC",
					["class"] = "HUNTER",
					["cache_time"] = 1684883011,
					["realm"] = "Aggra(Português)",
				},
				["Player-3391-0C38FC98"] = {
					["name"] = "Priokomo-Silvermoon",
					["guid"] = "Player-3391-0C38FC98",
					["class"] = "HUNTER",
					["cache_time"] = 1676186152,
					["realm"] = "Silvermoon",
				},
				["Player-1615-0A7A26B9"] = {
					["name"] = "четожестко-Ревущийфьорд",
					["guid"] = "Player-1615-0A7A26B9",
					["class"] = "DRUID",
					["cache_time"] = 1676444247,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3391-0C84FA74"] = {
					["name"] = "Retriash-Silvermoon",
					["guid"] = "Player-3391-0C84FA74",
					["class"] = "PALADIN",
					["cache_time"] = 1680130100,
					["realm"] = "Silvermoon",
				},
				["Player-2073-09F65475"] = {
					["role"] = "DAMAGER",
					["name"] = "Hascharov-Stormscale",
					["guid"] = "Player-2073-09F65475",
					["realm"] = "Stormscale",
					["class"] = "WARRIOR",
					["cache_time"] = 1676423903,
					["rank"] = "Alts",
				},
				["Player-1615-0B00A4FB"] = {
					["role"] = "DAMAGER",
					["name"] = "эллви-Ревущийфьорд",
					["guid"] = "Player-1615-0B00A4FB",
					["rank"] = "Новичок",
					["class"] = "SHAMAN",
					["cache_time"] = 1676336936,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1396-0AE0B6E3"] = {
					["name"] = "ægá-Quel'Thalas",
					["guid"] = "Player-1396-0AE0B6E3",
					["class"] = "PALADIN",
					["cache_time"] = 1686754474,
					["realm"] = "Quel'Thalas",
				},
				["Player-1098-0A5E3147"] = {
					["name"] = "Vishni-Malygos",
					["guid"] = "Player-1098-0A5E3147",
					["class"] = "PRIEST",
					["cache_time"] = 1679996113,
					["realm"] = "Malygos",
				},
				["Player-3691-09C0385A"] = {
					["name"] = "Rhya-Taerar",
					["guid"] = "Player-3691-09C0385A",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684926332,
					["realm"] = "Taerar",
				},
				["Player-1302-09EBC996"] = {
					["name"] = "Cårlii-Archimonde",
					["guid"] = "Player-1302-09EBC996",
					["class"] = "PRIEST",
					["cache_time"] = 1685356504,
					["realm"] = "Archimonde",
				},
				["Player-1305-04B4CEDB"] = {
					["name"] = "Nolimitz-Kazzak",
					["guid"] = "Player-1305-04B4CEDB",
					["class"] = "MAGE",
					["cache_time"] = 1676439631,
					["realm"] = "Kazzak",
				},
				["Player-3391-0C265F86"] = {
					["name"] = "Rahím-Silvermoon",
					["guid"] = "Player-3391-0C265F86",
					["class"] = "MONK",
					["cache_time"] = 1678894799,
					["realm"] = "Silvermoon",
				},
				["Player-1098-05676D27"] = {
					["name"] = "Mirjami-Malfurion",
					["guid"] = "Player-1098-05676D27",
					["class"] = "PRIEST",
					["cache_time"] = 1679782087,
					["realm"] = "Malfurion",
				},
				["Player-1416-0A6EB1D5"] = {
					["name"] = "Lazycodingp-Eonar",
					["guid"] = "Player-1416-0A6EB1D5",
					["class"] = "PALADIN",
					["cache_time"] = 1689417619,
					["realm"] = "Eonar",
				},
				["Player-1390-07FE7E18"] = {
					["name"] = "Thantas-Hyjal",
					["guid"] = "Player-1390-07FE7E18",
					["class"] = "HUNTER",
					["cache_time"] = 1686754263,
					["realm"] = "Hyjal",
				},
				["Player-3682-0B0952E5"] = {
					["ilvl"] = 409.75,
					["guid"] = "Player-3682-0B0952E5",
					["class"] = "WARRIOR",
					["role"] = "TANK",
					["cache_time"] = 1676928123,
					["rank"] = "Guild Master",
					["name"] = "Otpclap-Ragnaros",
					["specID"] = 73,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-580-0A2A8C7E"] = {
					["name"] = "Athemes-Blackmoore",
					["guid"] = "Player-580-0A2A8C7E",
					["class"] = "HUNTER",
					["cache_time"] = 1683073733,
					["realm"] = "Blackmoore",
				},
				["Player-3682-0B2A13DE"] = {
					["name"] = "Flurrq-Ragnaros",
					["guid"] = "Player-3682-0B2A13DE",
					["class"] = "ROGUE",
					["cache_time"] = 1690526530,
					["realm"] = "Ragnaros",
				},
				["Player-1316-07DD0248"] = {
					["name"] = "Brothers-Nemesis",
					["guid"] = "Player-1316-07DD0248",
					["class"] = "SHAMAN",
					["cache_time"] = 1678052884,
					["realm"] = "Nemesis",
				},
				["Player-1305-0B294470"] = {
					["name"] = "Ztdrood-Kazzak",
					["guid"] = "Player-1305-0B294470",
					["class"] = "DRUID",
					["cache_time"] = 1675873501,
					["realm"] = "Kazzak",
				},
				["Player-612-056D20FD"] = {
					["name"] = "Zexx-Mannoroth",
					["guid"] = "Player-612-056D20FD",
					["class"] = "PALADIN",
					["cache_time"] = 1684926332,
					["realm"] = "Mannoroth",
				},
				["Player-3391-0AFD7625"] = {
					["name"] = "Nastyä-Silvermoon",
					["guid"] = "Player-3391-0AFD7625",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684413259,
					["realm"] = "Silvermoon",
				},
				["Player-1925-0F3DB79F"] = {
					["name"] = "глобич-ВечнаяПесня",
					["guid"] = "Player-1925-0F3DB79F",
					["class"] = "WARRIOR",
					["cache_time"] = 1685514335,
					["realm"] = "ВечнаяПесня",
				},
				["Player-3692-09B69536"] = {
					["name"] = "Nualiee-Eredar",
					["guid"] = "Player-3692-09B69536",
					["class"] = "SHAMAN",
					["cache_time"] = 1678234225,
					["realm"] = "Eredar",
				},
				["Player-3682-063E70FE"] = {
					["name"] = "Mobzstar-Ragnaros",
					["guid"] = "Player-3682-063E70FE",
					["class"] = "MAGE",
					["cache_time"] = 1687790368,
					["realm"] = "Ragnaros",
				},
				["Player-3702-06AB22A5"] = {
					["name"] = "Nazmordith-ArgentDawn",
					["guid"] = "Player-3702-06AB22A5",
					["class"] = "WARLOCK",
					["cache_time"] = 1687006559,
					["realm"] = "ArgentDawn",
				},
				["Player-3702-0A8A0C12"] = {
					["name"] = "Ellehry-ArgentDawn",
					["guid"] = "Player-3702-0A8A0C12",
					["class"] = "PRIEST",
					["cache_time"] = 1685740823,
					["realm"] = "ArgentDawn",
				},
				["Player-1309-0BDFE0C4"] = {
					["name"] = "Acheronian-Pozzodell'Eternità",
					["guid"] = "Player-1309-0BDFE0C4",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687954070,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-1615-0A994AD6"] = {
					["name"] = "милиария-Ревущийфьорд",
					["guid"] = "Player-1615-0A994AD6",
					["class"] = "PALADIN",
					["cache_time"] = 1685514335,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-0A9166E0"] = {
					["ilvl"] = 442.9375,
					["guid"] = "Player-3682-0A9166E0",
					["class"] = "WARLOCK",
					["realm"] = "Ragnaros",
					["role"] = "DAMAGER",
					["cache_time"] = 1688407200,
					["name"] = "Dangerss-Ragnaros",
					["specID"] = 267,
					["enchanter"] = true,
					["enchantingLvl"] = 100,
					["rank"] = "Alt",
				},
				["Player-3674-099BFDAE"] = {
					["name"] = "Milkysmite-TwistingNether",
					["guid"] = "Player-3674-099BFDAE",
					["class"] = "PRIEST",
					["cache_time"] = 1680292466,
					["realm"] = "TwistingNether",
				},
				["Player-1084-06138B0D"] = {
					["name"] = "Kontanthjælp-TarrenMill",
					["guid"] = "Player-1084-06138B0D",
					["class"] = "WARLOCK",
					["cache_time"] = 1686754263,
					["realm"] = "TarrenMill",
				},
				["Player-1084-0A8CE07C"] = {
					["ilvl"] = 423.375,
					["guid"] = "Player-1084-0A8CE07C",
					["class"] = "ROGUE",
					["role"] = "DAMAGER",
					["name"] = "Oreowastaken-TarrenMill",
					["rank"] = " Officer",
					["cache_time"] = 1684233824,
					["specID"] = 261,
					["enchantingLvl"] = 0,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0C51B8A0"] = {
					["name"] = "Gamemethods-Kazzak",
					["guid"] = "Player-1305-0C51B8A0",
					["class"] = "HUNTER",
					["cache_time"] = 1676387096,
					["realm"] = "Kazzak",
				},
				["Player-1084-0A806292"] = {
					["name"] = "Personá-TarrenMill",
					["guid"] = "Player-1084-0A806292",
					["class"] = "EVOKER",
					["cache_time"] = 1676973948,
					["realm"] = "TarrenMill",
				},
				["Player-570-09D26739"] = {
					["name"] = "Arexius-Azshara",
					["guid"] = "Player-570-09D26739",
					["class"] = "WARRIOR",
					["cache_time"] = 1676973948,
					["realm"] = "Azshara",
				},
				["Player-1329-09D68931"] = {
					["name"] = "Alrondiel-Ravencrest",
					["guid"] = "Player-1329-09D68931",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1683903492,
					["realm"] = "Ravencrest",
				},
				["Player-1329-09FE3E10"] = {
					["name"] = "Mîyà-Ravencrest",
					["guid"] = "Player-1329-09FE3E10",
					["class"] = "SHAMAN",
					["cache_time"] = 1684502528,
					["realm"] = "Ravencrest",
				},
				["Player-3391-07ED7164"] = {
					["name"] = "Ashtiara-Silvermoon",
					["guid"] = "Player-3391-07ED7164",
					["class"] = "SHAMAN",
					["cache_time"] = 1685815559,
					["realm"] = "Silvermoon",
				},
				["Player-3713-084C563C"] = {
					["name"] = "Besai-BurningLegion",
					["guid"] = "Player-3713-084C563C",
					["class"] = "WARRIOR",
					["cache_time"] = 1677879103,
					["realm"] = "BurningLegion",
				},
				["Player-1121-0611A268"] = {
					["name"] = "Citrus-DieTodeskrallen",
					["guid"] = "Player-1121-0611A268",
					["class"] = "WARLOCK",
					["cache_time"] = 1684883011,
					["realm"] = "DieTodeskrallen",
				},
				["Player-1084-08804510"] = {
					["name"] = "Fayella-TarrenMill",
					["guid"] = "Player-1084-08804510",
					["class"] = "DRUID",
					["cache_time"] = 1685824352,
					["realm"] = "TarrenMill",
				},
				["Player-1615-0B18BCE1"] = {
					["name"] = "мегадезз-Ревущийфьорд",
					["guid"] = "Player-1615-0B18BCE1",
					["class"] = "SHAMAN",
					["cache_time"] = 1676957174,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-0B09C1CD"] = {
					["ilvl"] = 418.0625,
					["guid"] = "Player-3682-0B09C1CD",
					["class"] = "EVOKER",
					["role"] = "DAMAGER",
					["cache_time"] = 1683751096,
					["rank"] = "Trial",
					["name"] = "Visharys-Ragnaros",
					["specID"] = 1467,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0C941BD2"] = {
					["name"] = "Elixí-Kazzak",
					["guid"] = "Player-1305-0C941BD2",
					["class"] = "PRIEST",
					["cache_time"] = 1689374076,
					["realm"] = "Kazzak",
				},
				["Player-3702-0A1F4CC0"] = {
					["name"] = "Shaqueloheal-ArgentDawn",
					["guid"] = "Player-3702-0A1F4CC0",
					["class"] = "DRUID",
					["cache_time"] = 1677665404,
					["realm"] = "ArgentDawn",
				},
				["Player-1390-06D41EA3"] = {
					["role"] = "DAMAGER",
					["name"] = "Xapharian-Hyjal",
					["guid"] = "Player-1390-06D41EA3",
					["realm"] = "Hyjal",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676765465,
					["rank"] = "Membre",
				},
				["Player-1329-09FA003E"] = {
					["name"] = "Filiduttdk-Ravencrest",
					["guid"] = "Player-1329-09FA003E",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1677522629,
					["realm"] = "Ravencrest",
				},
				["Player-1084-05C6179A"] = {
					["name"] = "Fokionas-TarrenMill",
					["guid"] = "Player-1084-05C6179A",
					["class"] = "WARRIOR",
					["cache_time"] = 1676439631,
					["realm"] = "TarrenMill",
				},
				["Player-1084-0A24CD32"] = {
					["name"] = "Steinove-TarrenMill",
					["guid"] = "Player-1084-0A24CD32",
					["class"] = "DRUID",
					["cache_time"] = 1679747022,
					["realm"] = "TarrenMill",
				},
				["Player-1098-0A678CDC"] = {
					["name"] = "Erlinda-Malfurion",
					["guid"] = "Player-1098-0A678CDC",
					["class"] = "MAGE",
					["cache_time"] = 1676377737,
					["realm"] = "Malfurion",
				},
				["Player-1305-0BF58CCB"] = {
					["name"] = "Dankular-Kazzak",
					["guid"] = "Player-1305-0BF58CCB",
					["class"] = "HUNTER",
					["cache_time"] = 1689804288,
					["realm"] = "Kazzak",
				},
				["Player-1597-0F5B63E7"] = {
					["name"] = "Moldan-Sylvanas",
					["guid"] = "Player-1597-0F5B63E7",
					["class"] = "WARLOCK",
					["cache_time"] = 1686933987,
					["realm"] = "Sylvanas",
				},
				["Player-3674-0B1B9C8C"] = {
					["name"] = "Sturepve-TwistingNether",
					["guid"] = "Player-3674-0B1B9C8C",
					["class"] = "WARLOCK",
					["cache_time"] = 1677508946,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0C64DA13"] = {
					["name"] = "Alixila-Kazzak",
					["guid"] = "Player-1305-0C64DA13",
					["class"] = "DRUID",
					["cache_time"] = 1676768222,
					["realm"] = "Kazzak",
				},
				["Player-1621-0B19251C"] = {
					["name"] = "Grizõndox-Dalaran",
					["guid"] = "Player-1621-0B19251C",
					["class"] = "PALADIN",
					["cache_time"] = 1687791302,
					["realm"] = "Dalaran",
				},
				["Player-1305-0BABB512"] = {
					["name"] = "Necroymancer-Kazzak",
					["guid"] = "Player-1305-0BABB512",
					["class"] = "WARLOCK",
					["cache_time"] = 1687261056,
					["realm"] = "Kazzak",
				},
				["Player-3674-0A54BB50"] = {
					["name"] = "Epicgamrmove-TwistingNether",
					["guid"] = "Player-3674-0A54BB50",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685062299,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0C6044F3"] = {
					["name"] = "Chipdkk-Kazzak",
					["guid"] = "Player-1305-0C6044F3",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1686935978,
					["realm"] = "Kazzak",
				},
				["Player-1596-0A40478D"] = {
					["name"] = "Deehaychfink-TheMaelstrom",
					["guid"] = "Player-1596-0A40478D",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676439631,
					["realm"] = "TheMaelstrom",
				},
				["Player-1604-0F410CFA"] = {
					["name"] = "волсаджин-СвежевательДуш",
					["guid"] = "Player-1604-0F410CFA",
					["class"] = "DRUID",
					["cache_time"] = 1686754263,
					["realm"] = "СвежевательДуш",
				},
				["Player-1390-0C53D4D8"] = {
					["name"] = "Malyzïa-Hyjal",
					["guid"] = "Player-1390-0C53D4D8",
					["class"] = "EVOKER",
					["cache_time"] = 1676370489,
					["realm"] = "Hyjal",
				},
				["Player-1305-0BF72667"] = {
					["name"] = "Seviyorum-Kazzak",
					["guid"] = "Player-1305-0BF72667",
					["class"] = "MAGE",
					["cache_time"] = 1677606207,
					["realm"] = "Kazzak",
				},
				["Player-1121-0A737147"] = {
					["name"] = "Nissel-DieSilberneHand",
					["guid"] = "Player-1121-0A737147",
					["class"] = "PRIEST",
					["cache_time"] = 1684596359,
					["realm"] = "DieSilberneHand",
				},
				["Player-3691-09B69AC9"] = {
					["name"] = "Gàdget-Blackhand",
					["guid"] = "Player-3691-09B69AC9",
					["class"] = "PRIEST",
					["cache_time"] = 1685398638,
					["realm"] = "Blackhand",
				},
				["Player-3674-092BED9B"] = {
					["name"] = "Malínka-TwistingNether",
					["guid"] = "Player-3674-092BED9B",
					["class"] = "MONK",
					["cache_time"] = 1686619075,
					["realm"] = "TwistingNether",
				},
				["Player-3691-09FFEF73"] = {
					["name"] = "Dimødes-Blackhand",
					["guid"] = "Player-3691-09FFEF73",
					["class"] = "WARLOCK",
					["cache_time"] = 1688499798,
					["realm"] = "Blackhand",
				},
				["Player-3713-0AB22A36"] = {
					["name"] = "Giggii-BurningLegion",
					["guid"] = "Player-3713-0AB22A36",
					["class"] = "PRIEST",
					["cache_time"] = 1679220234,
					["realm"] = "BurningLegion",
				},
				["Player-3713-0AE77179"] = {
					["name"] = "Päczo-BurningLegion",
					["guid"] = "Player-3713-0AE77179",
					["class"] = "HUNTER",
					["cache_time"] = 1687961789,
					["realm"] = "BurningLegion",
				},
				["Player-1084-0A95B40F"] = {
					["name"] = "Semperfi-TarrenMill",
					["guid"] = "Player-1084-0A95B40F",
					["class"] = "PALADIN",
					["cache_time"] = 1686935978,
					["realm"] = "TarrenMill",
				},
				["Player-1403-0A21741E"] = {
					["name"] = "Hitchin-Draenor",
					["guid"] = "Player-1403-0A21741E",
					["class"] = "PALADIN",
					["cache_time"] = 1683963812,
					["realm"] = "Draenor",
				},
				["Player-3691-06C983C1"] = {
					["name"] = "Gronosh-Blackhand",
					["guid"] = "Player-3691-06C983C1",
					["class"] = "WARRIOR",
					["cache_time"] = 1679223561,
					["realm"] = "Blackhand",
				},
				["Player-1621-0B175E27"] = {
					["name"] = "Tapir-Dalaran",
					["guid"] = "Player-1621-0B175E27",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1690750821,
					["realm"] = "Dalaran",
				},
				["Player-1405-0A535B2A"] = {
					["name"] = "Rendan-DieNachtwache",
					["guid"] = "Player-1405-0A535B2A",
					["class"] = "PALADIN",
					["cache_time"] = 1679410208,
					["realm"] = "DieNachtwache",
				},
				["Player-2073-09F052CD"] = {
					["name"] = "Ryleei-Stormscale",
					["guid"] = "Player-2073-09F052CD",
					["class"] = "WARRIOR",
					["cache_time"] = 1679348344,
					["realm"] = "Stormscale",
				},
				["Player-1403-0A4CB24F"] = {
					["name"] = "Noxstrasza-Draenor",
					["guid"] = "Player-1403-0A4CB24F",
					["class"] = "EVOKER",
					["cache_time"] = 1687298820,
					["realm"] = "Draenor",
				},
				["Player-3713-0ACCF25C"] = {
					["name"] = "Gachidemon-BurningLegion",
					["guid"] = "Player-3713-0ACCF25C",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685047577,
					["realm"] = "BurningLegion",
				},
				["Player-2073-09EBE0B5"] = {
					["name"] = "Dractharys-Stormscale",
					["guid"] = "Player-2073-09EBE0B5",
					["class"] = "EVOKER",
					["cache_time"] = 1676937105,
					["realm"] = "Stormscale",
				},
				["Player-3682-0AEF4852"] = {
					["name"] = "Antixs-Ragnaros",
					["guid"] = "Player-3682-0AEF4852",
					["class"] = "PALADIN",
					["cache_time"] = 1676760097,
					["realm"] = "Ragnaros",
				},
				["Player-1615-0B1505B2"] = {
					["name"] = "шайлапутри-Ревущийфьорд",
					["guid"] = "Player-1615-0B1505B2",
					["class"] = "PALADIN",
					["cache_time"] = 1679197333,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3674-0A63DC60"] = {
					["name"] = "Trymheimr-TwistingNether",
					["guid"] = "Player-3674-0A63DC60",
					["class"] = "WARLOCK",
					["cache_time"] = 1676338023,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0B2164C1"] = {
					["name"] = "Jêbu-TwistingNether",
					["guid"] = "Player-3674-0B2164C1",
					["class"] = "PALADIN",
					["cache_time"] = 1688874543,
					["realm"] = "TwistingNether",
				},
				["Player-1403-0A025A0B"] = {
					["name"] = "Oútkast-Draenor",
					["guid"] = "Player-1403-0A025A0B",
					["class"] = "WARLOCK",
					["cache_time"] = 1684926794,
					["realm"] = "Draenor",
				},
				["Player-3391-0C7B530A"] = {
					["name"] = "Warwy-Silvermoon",
					["guid"] = "Player-3391-0C7B530A",
					["class"] = "PRIEST",
					["cache_time"] = 1688985347,
					["realm"] = "Silvermoon",
				},
				["Player-3674-05A55E5D"] = {
					["name"] = "Tombsdigger-TwistingNether",
					["guid"] = "Player-3674-05A55E5D",
					["class"] = "PALADIN",
					["cache_time"] = 1688687270,
					["realm"] = "TwistingNether",
				},
				["Player-3703-05A57353"] = {
					["name"] = "Ifeelsoalive-Frostwolf",
					["guid"] = "Player-3703-05A57353",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684413259,
					["realm"] = "Frostwolf",
				},
				["Player-3713-083CA6E8"] = {
					["name"] = "Fallenvan-BurningLegion",
					["guid"] = "Player-3713-083CA6E8",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689800841,
					["realm"] = "BurningLegion",
				},
				["Player-2073-09CCCE36"] = {
					["name"] = "Mèrcy-Stormscale",
					["guid"] = "Player-2073-09CCCE36",
					["class"] = "HUNTER",
					["cache_time"] = 1679564691,
					["realm"] = "Stormscale",
				},
				["Player-3682-0A58E41A"] = {
					["ilvl"] = 441.6875,
					["guid"] = "Player-3682-0A58E41A",
					["class"] = "WARLOCK",
					["role"] = "DAMAGER",
					["cache_time"] = 1686170543,
					["realm"] = "Ragnaros",
					["name"] = "Extincter-Ragnaros",
					["specID"] = 266,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1602-0B32BC39"] = {
					["name"] = "урлеада-Гордунни",
					["guid"] = "Player-1602-0B32BC39",
					["class"] = "PALADIN",
					["cache_time"] = 1688877607,
					["realm"] = "Гордунни",
				},
				["Player-3674-0AFEA264"] = {
					["name"] = "Bromma-TwistingNether",
					["guid"] = "Player-3674-0AFEA264",
					["class"] = "HUNTER",
					["cache_time"] = 1677524172,
					["realm"] = "TwistingNether",
				},
				["Player-1329-09D1BD74"] = {
					["name"] = "Rysiaa-Ravencrest",
					["guid"] = "Player-1329-09D1BD74",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689772053,
					["realm"] = "Ravencrest",
				},
				["Player-1403-06E0E58C"] = {
					["name"] = "Xentrìc-Draenor",
					["guid"] = "Player-1403-06E0E58C",
					["class"] = "DRUID",
					["cache_time"] = 1684926332,
					["realm"] = "Draenor",
				},
				["Player-612-0A447156"] = {
					["name"] = "Tigres-Gilneas",
					["guid"] = "Player-612-0A447156",
					["class"] = "MONK",
					["cache_time"] = 1684883011,
					["realm"] = "Gilneas",
				},
				["Player-3690-093FA6DF"] = {
					["name"] = "Zeusombre-KhazModan",
					["guid"] = "Player-3690-093FA6DF",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686619075,
					["realm"] = "KhazModan",
				},
				["Player-1305-0B3D93CF"] = {
					["name"] = "Khayyo-Kazzak",
					["guid"] = "Player-1305-0B3D93CF",
					["class"] = "WARRIOR",
					["cache_time"] = 1676783114,
					["realm"] = "Kazzak",
				},
				["Player-3674-0B22F483"] = {
					["name"] = "Kraems-TwistingNether",
					["guid"] = "Player-3674-0B22F483",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1683073733,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0B09B5B4"] = {
					["name"] = "Nídhoggur-TwistingNether",
					["guid"] = "Player-3674-0B09B5B4",
					["class"] = "EVOKER",
					["cache_time"] = 1685062299,
					["realm"] = "TwistingNether",
				},
				["Player-3391-067511D5"] = {
					["name"] = "Aribeth-Silvermoon",
					["guid"] = "Player-3391-067511D5",
					["class"] = "PALADIN",
					["cache_time"] = 1684877955,
					["realm"] = "Silvermoon",
				},
				["Player-3682-08B3820F"] = {
					["ilvl"] = 417.8125,
					["guid"] = "Player-3682-08B3820F",
					["class"] = "ROGUE",
					["role"] = "DAMAGER",
					["cache_time"] = 1680813097,
					["realm"] = "Ragnaros",
					["name"] = "Gondar-Ragnaros",
					["specID"] = 261,
					["enchantingLvl"] = 0,
					["rank"] = "Mythic Raider",
				},
				["Player-1084-0A53E773"] = {
					["name"] = "Zeralightng-TarrenMill",
					["guid"] = "Player-1084-0A53E773",
					["class"] = "SHAMAN",
					["cache_time"] = 1676210025,
					["realm"] = "TarrenMill",
				},
				["Player-1384-09C2CE57"] = {
					["name"] = "Bleedslolz-ColinasPardas",
					["guid"] = "Player-1384-09C2CE57",
					["class"] = "DRUID",
					["cache_time"] = 1677514676,
					["realm"] = "ColinasPardas",
				},
				["Player-3691-099F1316"] = {
					["name"] = "Kaxhba-Blackhand",
					["guid"] = "Player-3691-099F1316",
					["class"] = "DRUID",
					["cache_time"] = 1677665404,
					["realm"] = "Blackhand",
				},
				["Player-3391-0AD9B1A7"] = {
					["name"] = "Lifëbloom-Silvermoon",
					["guid"] = "Player-3391-0AD9B1A7",
					["class"] = "DRUID",
					["cache_time"] = 1684420122,
					["realm"] = "Silvermoon",
				},
				["Player-3691-0A032B7B"] = {
					["name"] = "Nyunala-Blackhand",
					["guid"] = "Player-3691-0A032B7B",
					["class"] = "PRIEST",
					["cache_time"] = 1684926079,
					["realm"] = "Blackhand",
				},
				["Player-3391-0C59D9A8"] = {
					["name"] = "Fatidogstyle-Silvermoon",
					["guid"] = "Player-3391-0C59D9A8",
					["class"] = "EVOKER",
					["cache_time"] = 1676950723,
					["realm"] = "Silvermoon",
				},
				["Player-1305-05AB5311"] = {
					["name"] = "Rus-Kazzak",
					["guid"] = "Player-1305-05AB5311",
					["class"] = "ROGUE",
					["cache_time"] = 1686197400,
					["realm"] = "Kazzak",
				},
				["Player-1602-0F51D05D"] = {
					["name"] = "хиз-Гордунни",
					["guid"] = "Player-1602-0F51D05D",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676466306,
					["realm"] = "Гордунни",
				},
				["Player-1096-087D760A"] = {
					["name"] = "Pitter-DefiasBrotherhood",
					["guid"] = "Player-1096-087D760A",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1685340864,
					["realm"] = "DefiasBrotherhood",
				},
				["Player-1092-09C951F5"] = {
					["name"] = "Kyaani-Drak'thul",
					["guid"] = "Player-1092-09C951F5",
					["class"] = "PRIEST",
					["cache_time"] = 1686773989,
					["realm"] = "Drak'thul",
				},
				["Player-1335-06E39A2C"] = {
					["ilvl"] = 439.9375,
					["guid"] = "Player-1335-06E39A2C",
					["class"] = "SHAMAN",
					["rank"] = "Officier",
					["role"] = "HEALER",
					["cache_time"] = 1685514335,
					["name"] = "Kakawet-Ysondre",
					["enchanter"] = true,
					["specID"] = 264,
					["enchantingLvl"] = 28,
					["realm"] = "Ysondre",
				},
				["Player-1615-0B0B1A62"] = {
					["name"] = "деорим-Ревущийфьорд",
					["guid"] = "Player-1615-0B0B1A62",
					["class"] = "WARLOCK",
					["cache_time"] = 1679197333,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1335-09FC0904"] = {
					["name"] = "Lilcham-Ysondre",
					["guid"] = "Player-1335-09FC0904",
					["class"] = "SHAMAN",
					["cache_time"] = 1684412175,
					["realm"] = "Ysondre",
				},
				["Player-3686-07032EAB"] = {
					["name"] = "Daawoop-Antonidas",
					["guid"] = "Player-3686-07032EAB",
					["class"] = "WARRIOR",
					["cache_time"] = 1684566068,
					["realm"] = "Antonidas",
				},
				["Player-3682-0B294CD1"] = {
					["name"] = "Shakki-Ragnaros",
					["guid"] = "Player-3682-0B294CD1",
					["class"] = "HUNTER",
					["cache_time"] = 1688418037,
					["realm"] = "Ragnaros",
				},
				["Player-3682-0A5D5D0E"] = {
					["name"] = "Páóral-Ragnaros",
					["guid"] = "Player-3682-0A5D5D0E",
					["class"] = "WARRIOR",
					["cache_time"] = 1680719837,
					["realm"] = "Ragnaros",
				},
				["Player-3691-09F60645"] = {
					["ilvl"] = 415.9375,
					["guid"] = "Player-3691-09F60645",
					["class"] = "ROGUE",
					["role"] = "DAMAGER",
					["cache_time"] = 1678320307,
					["rank"] = "Gildenlos",
					["name"] = "Pêwqt-Blackhand",
					["specID"] = 260,
					["enchantingLvl"] = 0,
					["realm"] = "Blackhand",
				},
				["Player-1602-05B24C2E"] = {
					["name"] = "лиорити-Гордунни",
					["guid"] = "Player-1602-05B24C2E",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1679427324,
					["realm"] = "Гордунни",
				},
				["Player-1621-0B29E3DB"] = {
					["name"] = "Ornavok-Dalaran",
					["guid"] = "Player-1621-0B29E3DB",
					["class"] = "EVOKER",
					["cache_time"] = 1689398539,
					["realm"] = "Dalaran",
				},
				["Player-1615-0AB5A203"] = {
					["name"] = "арахнири-Ревущийфьорд",
					["guid"] = "Player-1615-0AB5A203",
					["class"] = "MAGE",
					["cache_time"] = 1687949013,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1315-0C3F51AB"] = {
					["name"] = "Theradrassil-Elune",
					["guid"] = "Player-1315-0C3F51AB",
					["class"] = "WARRIOR",
					["cache_time"] = 1687955030,
					["realm"] = "Elune",
				},
				["Player-3391-0BC798C7"] = {
					["name"] = "Zhào-Silvermoon",
					["guid"] = "Player-3391-0BC798C7",
					["class"] = "MONK",
					["cache_time"] = 1684413259,
					["realm"] = "Silvermoon",
				},
				["Player-3674-0B0E3ADC"] = {
					["name"] = "Ababilian-TwistingNether",
					["guid"] = "Player-3674-0B0E3ADC",
					["class"] = "EVOKER",
					["cache_time"] = 1689253178,
					["realm"] = "TwistingNether",
				},
				["Player-1390-0ADF100E"] = {
					["name"] = "Torrnix-Hyjal",
					["guid"] = "Player-1390-0ADF100E",
					["class"] = "SHAMAN",
					["cache_time"] = 1676369923,
					["realm"] = "Hyjal",
				},
				["Player-1309-0C06C12B"] = {
					["name"] = "Jazzydynàmo-Pozzodell'Eternità",
					["guid"] = "Player-1309-0C06C12B",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684501707,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-1335-06BCB505"] = {
					["name"] = "Schiro-Ysondre",
					["guid"] = "Player-1335-06BCB505",
					["class"] = "PRIEST",
					["cache_time"] = 1676937105,
					["realm"] = "Ysondre",
				},
				["Player-1621-0B083447"] = {
					["name"] = "Kigratt-Dalaran",
					["guid"] = "Player-1621-0B083447",
					["class"] = "PRIEST",
					["cache_time"] = 1685821825,
					["realm"] = "Dalaran",
				},
				["Player-1305-0B11D376"] = {
					["name"] = "Javido-Kazzak",
					["guid"] = "Player-1305-0B11D376",
					["class"] = "PALADIN",
					["cache_time"] = 1688687303,
					["realm"] = "Kazzak",
				},
				["Player-1302-0C3DF6CA"] = {
					["name"] = "Ryukem-Archimonde",
					["guid"] = "Player-1302-0C3DF6CA",
					["class"] = "WARRIOR",
					["cache_time"] = 1676167428,
					["realm"] = "Archimonde",
				},
				["Player-3682-0A641692"] = {
					["ilvl"] = 428.25,
					["guid"] = "Player-3682-0A641692",
					["class"] = "PRIEST",
					["role"] = "HEALER",
					["cache_time"] = 1684877955,
					["realm"] = "Ragnaros",
					["name"] = "Araxxor-Ragnaros",
					["specID"] = 257,
					["enchantingLvl"] = 0,
					["rank"] = "Raider - Doki",
				},
				["Player-3682-07E81ED9"] = {
					["name"] = "Magicginger-Ragnaros",
					["guid"] = "Player-3682-07E81ED9",
					["class"] = "DRUID",
					["cache_time"] = 1687040673,
					["realm"] = "Ragnaros",
				},
				["Player-3692-04606A58"] = {
					["role"] = "TANK",
					["name"] = "Snorryy-Eredar",
					["guid"] = "Player-3692-04606A58",
					["realm"] = "Eredar",
					["class"] = "PALADIN",
					["cache_time"] = 1676372637,
					["rank"] = "GM-Twink",
				},
				["Player-580-0A73B78D"] = {
					["name"] = "Delorý-Blackmoore",
					["guid"] = "Player-580-0A73B78D",
					["class"] = "SHAMAN",
					["cache_time"] = 1687949013,
					["realm"] = "Blackmoore",
				},
				["Player-3674-05A52B4A"] = {
					["name"] = "Renegade-TwistingNether",
					["guid"] = "Player-3674-05A52B4A",
					["class"] = "PALADIN",
					["cache_time"] = 1690510866,
					["realm"] = "TwistingNether",
				},
				["Player-1615-0ACE48C0"] = {
					["name"] = "касталамир-Ревущийфьорд",
					["guid"] = "Player-1615-0ACE48C0",
					["class"] = "WARRIOR",
					["cache_time"] = 1676377737,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-0B038A40"] = {
					["ilvl"] = 433.25,
					["guid"] = "Player-3682-0B038A40",
					["class"] = "PRIEST",
					["rank"] = "Guild Master",
					["role"] = "HEALER",
					["cache_time"] = 1686170394,
					["name"] = "Filsket-Ragnaros",
					["enchanter"] = true,
					["specID"] = 257,
					["enchantingLvl"] = 97,
					["realm"] = "Ragnaros",
				},
				["Player-1408-0A5DEDFD"] = {
					["name"] = "Wargrem-DunMorogh",
					["guid"] = "Player-1408-0A5DEDFD",
					["class"] = "ROGUE",
					["cache_time"] = 1676973948,
					["realm"] = "DunMorogh",
				},
				["Player-3682-0AFF9E68"] = {
					["name"] = "Embracer-Ragnaros",
					["guid"] = "Player-3682-0AFF9E68",
					["class"] = "ROGUE",
					["cache_time"] = 1676383325,
					["realm"] = "Ragnaros",
				},
				["Player-1305-054A701F"] = {
					["name"] = "Palaofchaos-Kazzak",
					["guid"] = "Player-1305-054A701F",
					["class"] = "PALADIN",
					["cache_time"] = 1688429446,
					["realm"] = "Kazzak",
				},
				["Player-3691-09A6F5E9"] = {
					["name"] = "Ylduar-Blackhand",
					["guid"] = "Player-3691-09A6F5E9",
					["class"] = "PALADIN",
					["cache_time"] = 1685826910,
					["realm"] = "Blackhand",
				},
				["Player-1084-0A8C78CF"] = {
					["name"] = "Cocaim-TarrenMill",
					["guid"] = "Player-1084-0A8C78CF",
					["class"] = "HUNTER",
					["cache_time"] = 1677104859,
					["realm"] = "TarrenMill",
				},
				["Player-3674-081C783E"] = {
					["name"] = "Näsgûl-TwistingNether",
					["guid"] = "Player-3674-081C783E",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677879103,
					["realm"] = "TwistingNether",
				},
				["Player-1092-0A904EBE"] = {
					["name"] = "Asaplocky-BurningBlade",
					["guid"] = "Player-1092-0A904EBE",
					["class"] = "WARLOCK",
					["cache_time"] = 1679027063,
					["realm"] = "BurningBlade",
				},
				["Player-3674-06B94C33"] = {
					["name"] = "Onéstar-TwistingNether",
					["guid"] = "Player-3674-06B94C33",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1688306766,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0C574A9E"] = {
					["name"] = "Bjørnsenrog-Kazzak",
					["guid"] = "Player-1305-0C574A9E",
					["class"] = "ROGUE",
					["cache_time"] = 1677606207,
					["realm"] = "Kazzak",
				},
				["Player-1105-08FBBFE9"] = {
					["name"] = "Lupari-Aman'thul",
					["guid"] = "Player-1105-08FBBFE9",
					["class"] = "PRIEST",
					["cache_time"] = 1676220405,
					["realm"] = "Aman'thul",
				},
				["Player-1121-0A61BE71"] = {
					["name"] = "Calmiak-DieTodeskrallen",
					["guid"] = "Player-1121-0A61BE71",
					["class"] = "EVOKER",
					["cache_time"] = 1675869174,
					["realm"] = "DieTodeskrallen",
				},
				["Player-1615-0B19212D"] = {
					["name"] = "аназем-Ревущийфьорд",
					["guid"] = "Player-1615-0B19212D",
					["class"] = "SHAMAN",
					["cache_time"] = 1676167219,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-0B20292A"] = {
					["ilvl"] = 70.875,
					["guid"] = "Player-3682-0B20292A",
					["class"] = "PALADIN",
					["role"] = "DAMAGER",
					["cache_time"] = 1680815900,
					["rank"] = "Alt",
					["name"] = "Jerwin-Ragnaros",
					["specID"] = 70,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-3682-0B21E85C"] = {
					["ilvl"] = 445.875,
					["guid"] = "Player-3682-0B21E85C",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1689281451,
					["realm"] = "Ragnaros",
					["name"] = "Nèlliel-Ragnaros",
					["specID"] = 253,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-3692-09FDFCB0"] = {
					["name"] = "Sálly-Eredar",
					["guid"] = "Player-3692-09FDFCB0",
					["class"] = "HUNTER",
					["cache_time"] = 1680292466,
					["realm"] = "Eredar",
				},
				["Player-1597-0D7E94CD"] = {
					["name"] = "Drezerion-Sylvanas",
					["guid"] = "Player-1597-0D7E94CD",
					["class"] = "WARRIOR",
					["cache_time"] = 1687791302,
					["realm"] = "Sylvanas",
				},
				["Player-1925-0AE9F272"] = {
					["name"] = "торимдубощит-ВечнаяПесня",
					["guid"] = "Player-1925-0AE9F272",
					["class"] = "WARRIOR",
					["cache_time"] = 1686196330,
					["realm"] = "ВечнаяПесня",
				},
				["Player-633-0ADF897D"] = {
					["name"] = "Bomberisto-Terokkar",
					["guid"] = "Player-633-0ADF897D",
					["class"] = "HUNTER",
					["cache_time"] = 1687248521,
					["realm"] = "Terokkar",
				},
				["Player-1305-0C324899"] = {
					["name"] = "Sutskouwu-Kazzak",
					["guid"] = "Player-1305-0C324899",
					["class"] = "WARLOCK",
					["cache_time"] = 1677518150,
					["realm"] = "Kazzak",
				},
				["Player-3674-07B0F81B"] = {
					["name"] = "Jarona-TwistingNether",
					["guid"] = "Player-3674-07B0F81B",
					["class"] = "SHAMAN",
					["cache_time"] = 1676069534,
					["realm"] = "TwistingNether",
				},
				["Player-3682-0A6FF262"] = {
					["name"] = "Neckromancër-Ragnaros",
					["guid"] = "Player-3682-0A6FF262",
					["class"] = "WARLOCK",
					["cache_time"] = 1685780231,
					["realm"] = "Ragnaros",
				},
				["Player-1335-09F83E2F"] = {
					["name"] = "Sjokzz-Ysondre",
					["guid"] = "Player-1335-09F83E2F",
					["class"] = "MAGE",
					["cache_time"] = 1676387096,
					["realm"] = "Ysondre",
				},
				["Player-1084-0A6B101C"] = {
					["name"] = "Theprofessor-TarrenMill",
					["guid"] = "Player-1084-0A6B101C",
					["class"] = "ROGUE",
					["cache_time"] = 1689287073,
					["realm"] = "TarrenMill",
				},
				["Player-1403-0A68FC80"] = {
					["role"] = "HEALER",
					["name"] = "Lousindra-Draenor",
					["guid"] = "Player-1403-0A68FC80",
					["rank"] = "Core Raider",
					["class"] = "PRIEST",
					["cache_time"] = 1684223711,
					["realm"] = "Draenor",
				},
				["Player-3674-0B1DA514"] = {
					["name"] = "Iondon-TwistingNether",
					["guid"] = "Player-3674-0B1DA514",
					["class"] = "EVOKER",
					["cache_time"] = 1687956237,
					["realm"] = "TwistingNether",
				},
				["Player-3686-098CADB9"] = {
					["name"] = "Lisandril-Antonidas",
					["guid"] = "Player-3686-098CADB9",
					["class"] = "DRUID",
					["cache_time"] = 1679220234,
					["realm"] = "Antonidas",
				},
				["Player-1127-0A3DCBD7"] = {
					["ilvl"] = 421.0625,
					["guid"] = "Player-1127-0A3DCBD7",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["cache_time"] = 1684182960,
					["rank"] = "Unguilded",
					["name"] = "Chibibowa-LesSentinelles",
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["realm"] = "LesSentinelles",
				},
				["Player-1403-0A1D1ED7"] = {
					["name"] = "Waifulolly-Draenor",
					["guid"] = "Player-1403-0A1D1ED7",
					["class"] = "PALADIN",
					["cache_time"] = 1689451340,
					["realm"] = "Draenor",
				},
				["Player-3682-0B0B1CD7"] = {
					["name"] = "Antiflexx-Ragnaros",
					["guid"] = "Player-3682-0B0B1CD7",
					["class"] = "EVOKER",
					["cache_time"] = 1680128132,
					["realm"] = "Ragnaros",
				},
				["Player-3686-09F7EAFC"] = {
					["name"] = "Gàjéel-Antonidas",
					["guid"] = "Player-3686-09F7EAFC",
					["class"] = "WARRIOR",
					["cache_time"] = 1676387096,
					["realm"] = "Antonidas",
				},
				["Player-3674-0B192465"] = {
					["name"] = "Marrywhite-TwistingNether",
					["guid"] = "Player-3674-0B192465",
					["class"] = "PRIEST",
					["cache_time"] = 1680249823,
					["realm"] = "TwistingNether",
				},
				["Player-1309-0A52A940"] = {
					["name"] = "Akì-Pozzodell'Eternità",
					["guid"] = "Player-1309-0A52A940",
					["class"] = "DRUID",
					["cache_time"] = 1689802006,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-3391-0C84AD65"] = {
					["name"] = "Imoendk-Silvermoon",
					["guid"] = "Player-3391-0C84AD65",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1683903940,
					["realm"] = "Silvermoon",
				},
				["Player-1309-0BD73B85"] = {
					["name"] = "Obaòba-Pozzodell'Eternità",
					["guid"] = "Player-1309-0BD73B85",
					["class"] = "PALADIN",
					["cache_time"] = 1677198332,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-3682-0B296BB1"] = {
					["ilvl"] = 443.625,
					["guid"] = "Player-3682-0B296BB1",
					["class"] = "PALADIN",
					["role"] = "DAMAGER",
					["cache_time"] = 1688418037,
					["realm"] = "Ragnaros",
					["name"] = "Pad-Ragnaros",
					["specID"] = 70,
					["enchantingLvl"] = 0,
					["rank"] = "Lord of Things",
				},
				["Player-1390-0BA157D6"] = {
					["name"] = "Bütäne-Hyjal",
					["guid"] = "Player-1390-0BA157D6",
					["class"] = "WARRIOR",
					["cache_time"] = 1686934454,
					["realm"] = "Hyjal",
				},
				["Player-1379-09A8DBEE"] = {
					["name"] = "Elespañoll-Zul'jin",
					["guid"] = "Player-1379-09A8DBEE",
					["class"] = "WARRIOR",
					["cache_time"] = 1685745517,
					["realm"] = "Zul'jin",
				},
				["Player-1084-0A9C2CD1"] = {
					["name"] = "Awryeon-TarrenMill",
					["guid"] = "Player-1084-0A9C2CD1",
					["class"] = "PRIEST",
					["cache_time"] = 1686605803,
					["realm"] = "TarrenMill",
				},
				["Player-1403-0A553E69"] = {
					["name"] = "Blaínee-Draenor",
					["guid"] = "Player-1403-0A553E69",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676408322,
					["realm"] = "Draenor",
				},
				["Player-1390-0C8EBF14"] = {
					["name"] = "Naqk-Hyjal",
					["guid"] = "Player-1390-0C8EBF14",
					["class"] = "WARRIOR",
					["cache_time"] = 1684413259,
					["realm"] = "Hyjal",
				},
				["Player-2073-09FE78BC"] = {
					["name"] = "Kwadehenkie-Stormscale",
					["guid"] = "Player-2073-09FE78BC",
					["class"] = "HUNTER",
					["cache_time"] = 1680437946,
					["realm"] = "Stormscale",
				},
				["Player-3682-0B1E83A7"] = {
					["ilvl"] = 440.25,
					["guid"] = "Player-3682-0B1E83A7",
					["class"] = "WARRIOR",
					["realm"] = "Ragnaros",
					["role"] = "DAMAGER",
					["cache_time"] = 1686170267,
					["name"] = "Ryleei-Ragnaros",
					["specID"] = 72,
					["enchanter"] = true,
					["enchantingLvl"] = 100,
					["rank"] = "Mythic Raider",
				},
				["Player-1305-0C61B8D3"] = {
					["name"] = "Zigorat-Kazzak",
					["guid"] = "Player-1305-0C61B8D3",
					["class"] = "SHAMAN",
					["cache_time"] = 1678486019,
					["realm"] = "Kazzak",
				},
				["Player-1403-0A56E22F"] = {
					["name"] = "Brinsigüer-Draenor",
					["guid"] = "Player-1403-0A56E22F",
					["class"] = "HUNTER",
					["cache_time"] = 1684060493,
					["realm"] = "Draenor",
				},
				["Player-1390-0AFEB016"] = {
					["name"] = "Aghälys-Hyjal",
					["guid"] = "Player-1390-0AFEB016",
					["class"] = "WARLOCK",
					["cache_time"] = 1677071053,
					["realm"] = "Hyjal",
				},
				["Player-1084-0A9144FD"] = {
					["name"] = "Inkon-TarrenMill",
					["guid"] = "Player-1084-0A9144FD",
					["class"] = "PRIEST",
					["cache_time"] = 1689712190,
					["realm"] = "TarrenMill",
				},
				["Player-1098-0A80488D"] = {
					["name"] = "Bidayn-Malygos",
					["guid"] = "Player-1098-0A80488D",
					["class"] = "EVOKER",
					["cache_time"] = 1689699139,
					["realm"] = "Malygos",
				},
				["Player-1305-05C1D63E"] = {
					["name"] = "Shandey-Kazzak",
					["guid"] = "Player-1305-05C1D63E",
					["class"] = "DRUID",
					["cache_time"] = 1676439631,
					["realm"] = "Kazzak",
				},
				["Player-3682-0B22F42A"] = {
					["ilvl"] = 443.75,
					["guid"] = "Player-3682-0B22F42A",
					["class"] = "DRUID",
					["realm"] = "Ragnaros",
					["role"] = "HEALER",
					["cache_time"] = 1690329832,
					["name"] = "Rejuvlife-Ragnaros",
					["specID"] = 105,
					["enchanter"] = true,
					["enchantingLvl"] = 100,
					["rank"] = "Core",
				},
				["Player-3391-0C84EFA8"] = {
					["name"] = "Vixtor-Silvermoon",
					["guid"] = "Player-3391-0C84EFA8",
					["class"] = "WARRIOR",
					["cache_time"] = 1679747022,
					["realm"] = "Silvermoon",
				},
				["Player-1623-082360CB"] = {
					["name"] = "некатайвату-Дракономор",
					["guid"] = "Player-1623-082360CB",
					["class"] = "MAGE",
					["cache_time"] = 1676525453,
					["realm"] = "Дракономор",
				},
				["Player-1084-0A62F567"] = {
					["name"] = "Gendrw-TarrenMill",
					["guid"] = "Player-1084-0A62F567",
					["class"] = "WARLOCK",
					["cache_time"] = 1685398638,
					["realm"] = "TarrenMill",
				},
				["Player-1615-0B119DD7"] = {
					["name"] = "викабулка-Ревущийфьорд",
					["guid"] = "Player-1615-0B119DD7",
					["class"] = "MAGE",
					["cache_time"] = 1677324336,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3691-099DFDE7"] = {
					["name"] = "Nanyias-Blackhand",
					["guid"] = "Player-3691-099DFDE7",
					["class"] = "DRUID",
					["cache_time"] = 1684926333,
					["realm"] = "Blackhand",
				},
				["Player-1127-090CD7D4"] = {
					["name"] = "Florate-KirinTor",
					["guid"] = "Player-1127-090CD7D4",
					["class"] = "PRIEST",
					["cache_time"] = 1684945104,
					["realm"] = "KirinTor",
				},
				["Player-3674-0AD1CF38"] = {
					["name"] = "Smaze-TwistingNether",
					["guid"] = "Player-3674-0AD1CF38",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687259300,
					["realm"] = "TwistingNether",
				},
				["Player-3674-05A881F1"] = {
					["name"] = "Ilizionist-TwistingNether",
					["guid"] = "Player-3674-05A881F1",
					["class"] = "ROGUE",
					["cache_time"] = 1684926332,
					["realm"] = "TwistingNether",
				},
				["Player-1098-096CA2B4"] = {
					["name"] = "Fennjok-Malfurion",
					["guid"] = "Player-1098-096CA2B4",
					["class"] = "SHAMAN",
					["cache_time"] = 1677607191,
					["realm"] = "Malfurion",
				},
				["Player-1305-0B9F4E88"] = {
					["name"] = "Fíérced-Kazzak",
					["guid"] = "Player-1305-0B9F4E88",
					["class"] = "PRIEST",
					["cache_time"] = 1689339555,
					["realm"] = "Kazzak",
				},
				["Player-1305-0B8AA69E"] = {
					["name"] = "Tetra-Kazzak",
					["guid"] = "Player-1305-0B8AA69E",
					["class"] = "HUNTER",
					["cache_time"] = 1685534275,
					["realm"] = "Kazzak",
				},
				["Player-1615-06205BEB"] = {
					["name"] = "викерлал-Ревущийфьорд",
					["guid"] = "Player-1615-06205BEB",
					["class"] = "PALADIN",
					["cache_time"] = 1688983952,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1084-0A917F9A"] = {
					["name"] = "Ignifors-TarrenMill",
					["guid"] = "Player-1084-0A917F9A",
					["class"] = "EVOKER",
					["cache_time"] = 1676533093,
					["realm"] = "TarrenMill",
				},
				["Player-1329-0929E0B1"] = {
					["name"] = "Skilliko-Ravencrest",
					["guid"] = "Player-1329-0929E0B1",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685515186,
					["realm"] = "Ravencrest",
				},
				["Player-1929-05BFA2E3"] = {
					["name"] = "эваер-ЧерныйШрам",
					["guid"] = "Player-1929-05BFA2E3",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1689615678,
					["realm"] = "ЧерныйШрам",
				},
				["Player-1403-06A044AD"] = {
					["name"] = "Bløødybeauty-Draenor",
					["guid"] = "Player-1403-06A044AD",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1686263765,
					["realm"] = "Draenor",
				},
				["Player-1604-0E8FCD4A"] = {
					["name"] = "шкил-СвежевательДуш",
					["guid"] = "Player-1604-0E8FCD4A",
					["class"] = "ROGUE",
					["cache_time"] = 1678234395,
					["realm"] = "СвежевательДуш",
				},
				["Player-3682-0B288139"] = {
					["name"] = "Sàhw-Ragnaros",
					["guid"] = "Player-3682-0B288139",
					["class"] = "WARRIOR",
					["cache_time"] = 1687157922,
					["realm"] = "Ragnaros",
				},
				["Player-1621-0B170FF8"] = {
					["name"] = "Coréllia-Dalaran",
					["guid"] = "Player-1621-0B170FF8",
					["class"] = "PALADIN",
					["cache_time"] = 1689340203,
					["realm"] = "Dalaran",
				},
				["Player-1305-0C781579"] = {
					["name"] = "Zemelya-Kazzak",
					["guid"] = "Player-1305-0C781579",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676328082,
					["realm"] = "Kazzak",
				},
				["Player-612-0711E945"] = {
					["name"] = "Hryhuan-Destromath",
					["guid"] = "Player-612-0711E945",
					["class"] = "WARLOCK",
					["cache_time"] = 1675869700,
					["realm"] = "Destromath",
				},
				["Player-3686-06D8C9D5"] = {
					["name"] = "Rohym-Antonidas",
					["guid"] = "Player-3686-06D8C9D5",
					["class"] = "PALADIN",
					["cache_time"] = 1685998361,
					["realm"] = "Antonidas",
				},
				["Player-3656-084160F6"] = {
					["name"] = "Pasiw-Stormreaver",
					["guid"] = "Player-3656-084160F6",
					["class"] = "WARRIOR",
					["cache_time"] = 1683907664,
					["realm"] = "Stormreaver",
				},
				["Player-1621-0854C3FC"] = {
					["name"] = "Aeranoss-MarécagedeZangar",
					["guid"] = "Player-1621-0854C3FC",
					["class"] = "PALADIN",
					["cache_time"] = 1690750821,
					["realm"] = "MarécagedeZangar",
				},
				["Player-1329-09C193A2"] = {
					["name"] = "Ragehacker-Ravencrest",
					["guid"] = "Player-1329-09C193A2",
					["class"] = "WARRIOR",
					["cache_time"] = 1685531447,
					["realm"] = "Ravencrest",
				},
				["Player-1329-09F675DA"] = {
					["name"] = "Badenboom-Ravencrest",
					["guid"] = "Player-1329-09F675DA",
					["class"] = "DRUID",
					["cache_time"] = 1677518270,
					["realm"] = "Ravencrest",
				},
				["Player-1602-0F25C8A4"] = {
					["name"] = "разделка-Гордунни",
					["guid"] = "Player-1602-0F25C8A4",
					["class"] = "ROGUE",
					["cache_time"] = 1688951000,
					["realm"] = "Гордунни",
				},
				["Player-1390-0C405AA4"] = {
					["name"] = "Shanyâ-Hyjal",
					["guid"] = "Player-1390-0C405AA4",
					["class"] = "SHAMAN",
					["cache_time"] = 1687102801,
					["realm"] = "Hyjal",
				},
				["Player-1301-0C33BA8F"] = {
					["name"] = "Veléxis-Outland",
					["guid"] = "Player-1301-0C33BA8F",
					["class"] = "PALADIN",
					["cache_time"] = 1688868978,
					["realm"] = "Outland",
				},
				["Player-1403-09DB28C8"] = {
					["name"] = "Highlorde-Draenor",
					["guid"] = "Player-1403-09DB28C8",
					["class"] = "PALADIN",
					["cache_time"] = 1680249823,
					["realm"] = "Draenor",
				},
				["Player-3682-0B155119"] = {
					["name"] = "Cyclosarin-Ragnaros",
					["guid"] = "Player-3682-0B155119",
					["class"] = "WARLOCK",
					["cache_time"] = 1680459663,
					["realm"] = "Ragnaros",
				},
				["Player-581-08C31188"] = {
					["name"] = "Lensey-Blackrock",
					["guid"] = "Player-581-08C31188",
					["class"] = "PALADIN",
					["cache_time"] = 1688923372,
					["realm"] = "Blackrock",
				},
				["Player-1378-0A99F676"] = {
					["name"] = "Likeozone-DunModr",
					["guid"] = "Player-1378-0A99F676",
					["class"] = "PRIEST",
					["cache_time"] = 1686788530,
					["realm"] = "DunModr",
				},
				["Player-3681-0AD3FAA2"] = {
					["name"] = "Kemm-Magtheridon",
					["guid"] = "Player-3681-0AD3FAA2",
					["class"] = "MONK",
					["cache_time"] = 1684590154,
					["realm"] = "Magtheridon",
				},
				["Player-1602-0F222DD9"] = {
					["name"] = "аидкатв-Гордунни",
					["guid"] = "Player-1602-0F222DD9",
					["class"] = "DRUID",
					["cache_time"] = 1689617426,
					["realm"] = "Гордунни",
				},
				["Player-1403-0A673E99"] = {
					["name"] = "Mälad-Draenor",
					["guid"] = "Player-1403-0A673E99",
					["class"] = "PRIEST",
					["cache_time"] = 1680112361,
					["realm"] = "Draenor",
				},
				["Player-1925-09B8ED1B"] = {
					["name"] = "сопля-ВечнаяПесня",
					["guid"] = "Player-1925-09B8ED1B",
					["class"] = "WARRIOR",
					["cache_time"] = 1678776898,
					["realm"] = "ВечнаяПесня",
				},
				["Player-1302-07F8C69D"] = {
					["name"] = "Arweena-Archimonde",
					["guid"] = "Player-1302-07F8C69D",
					["class"] = "PRIEST",
					["cache_time"] = 1676188529,
					["realm"] = "Archimonde",
				},
				["Player-1602-099DE1E3"] = {
					["name"] = "джамблх-Гордунни",
					["guid"] = "Player-1602-099DE1E3",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676354879,
					["realm"] = "Гордунни",
				},
				["Player-3674-0A8336FE"] = {
					["name"] = "Gripq-TwistingNether",
					["guid"] = "Player-3674-0A8336FE",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1679747022,
					["realm"] = "TwistingNether",
				},
				["Player-1084-0A8ABD27"] = {
					["name"] = "Morauwu-TarrenMill",
					["guid"] = "Player-1084-0A8ABD27",
					["class"] = "HUNTER",
					["cache_time"] = 1679506666,
					["realm"] = "TarrenMill",
				},
				["Player-3713-0AD07B7C"] = {
					["name"] = "Ghisguth-BurningLegion",
					["guid"] = "Player-3713-0AD07B7C",
					["class"] = "WARLOCK",
					["cache_time"] = 1686690665,
					["realm"] = "BurningLegion",
				},
				["Player-3691-09E22E76"] = {
					["name"] = "Ekkeron-Blackhand",
					["guid"] = "Player-3691-09E22E76",
					["class"] = "WARRIOR",
					["cache_time"] = 1686121947,
					["realm"] = "Blackhand",
				},
				["Player-1615-0B1FD078"] = {
					["name"] = "катябуря-Ревущийфьорд",
					["guid"] = "Player-1615-0B1FD078",
					["class"] = "PALADIN",
					["cache_time"] = 1685685467,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1096-098F38ED"] = {
					["name"] = "Abidi-EarthenRing",
					["guid"] = "Player-1096-098F38ED",
					["class"] = "HUNTER",
					["cache_time"] = 1678860427,
					["realm"] = "EarthenRing",
				},
				["Player-3674-05AEAA2B"] = {
					["name"] = "Xacyum-TwistingNether",
					["guid"] = "Player-3674-05AEAA2B",
					["class"] = "HUNTER",
					["cache_time"] = 1690406741,
					["realm"] = "TwistingNether",
				},
				["Player-1379-0AD6A951"] = {
					["name"] = "Kolhar-Zul'jin",
					["guid"] = "Player-1379-0AD6A951",
					["class"] = "EVOKER",
					["cache_time"] = 1677606207,
					["realm"] = "Zul'jin",
				},
				["Player-1403-0A5B941F"] = {
					["name"] = "Kdr-Draenor",
					["guid"] = "Player-1403-0A5B941F",
					["class"] = "WARRIOR",
					["cache_time"] = 1677957827,
					["realm"] = "Draenor",
				},
				["Player-1329-09C9DCF5"] = {
					["name"] = "Suígu-Ravencrest",
					["guid"] = "Player-1329-09C9DCF5",
					["class"] = "PALADIN",
					["cache_time"] = 1676791556,
					["realm"] = "Ravencrest",
				},
				["Player-1305-0C82E8D1"] = {
					["name"] = "Ingward-Kazzak",
					["guid"] = "Player-1305-0C82E8D1",
					["class"] = "PRIEST",
					["cache_time"] = 1680695598,
					["realm"] = "Kazzak",
				},
				["Player-1403-0A6D48AE"] = {
					["name"] = "Laggolas-Draenor",
					["guid"] = "Player-1403-0A6D48AE",
					["class"] = "HUNTER",
					["cache_time"] = 1683073477,
					["realm"] = "Draenor",
				},
				["Player-1615-099BCA89"] = {
					["name"] = "локомотивь-Ревущийфьорд",
					["guid"] = "Player-1615-099BCA89",
					["class"] = "DRUID",
					["cache_time"] = 1679412879,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3686-068E8AE5"] = {
					["name"] = "Chruzzit-Antonidas",
					["guid"] = "Player-3686-068E8AE5",
					["class"] = "WARLOCK",
					["cache_time"] = 1679632936,
					["realm"] = "Antonidas",
				},
				["Player-3692-08E0ADCD"] = {
					["name"] = "Meruda-Eredar",
					["guid"] = "Player-3692-08E0ADCD",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678052884,
					["realm"] = "Eredar",
				},
				["Player-1390-0C8816FE"] = {
					["name"] = "Hakrifa-Hyjal",
					["guid"] = "Player-1390-0C8816FE",
					["class"] = "EVOKER",
					["cache_time"] = 1689699139,
					["realm"] = "Hyjal",
				},
				["Player-1084-09D2019D"] = {
					["name"] = "Rvivr-TarrenMill",
					["guid"] = "Player-1084-09D2019D",
					["class"] = "PRIEST",
					["cache_time"] = 1680258337,
					["realm"] = "TarrenMill",
				},
				["Player-1335-09FC11EC"] = {
					["name"] = "Okawr-Ysondre",
					["guid"] = "Player-1335-09FC11EC",
					["class"] = "WARRIOR",
					["cache_time"] = 1680292466,
					["realm"] = "Ysondre",
				},
				["Player-1305-0C4A3B7C"] = {
					["ilvl"] = 413.5625,
					["guid"] = "Player-1305-0C4A3B7C",
					["class"] = "DEATHKNIGHT",
					["role"] = "TANK",
					["cache_time"] = 1680813097,
					["realm"] = "Kazzak",
					["name"] = "Mogdead-Kazzak",
					["specID"] = 250,
					["enchantingLvl"] = 0,
					["rank"] = "Recruit",
				},
				["Player-3674-09D4040C"] = {
					["name"] = "Maleficentt-TwistingNether",
					["guid"] = "Player-3674-09D4040C",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1683073733,
					["realm"] = "TwistingNether",
				},
				["Player-1302-0C3F54D4"] = {
					["name"] = "Koranga-Archimonde",
					["guid"] = "Player-1302-0C3F54D4",
					["class"] = "MAGE",
					["cache_time"] = 1680754040,
					["realm"] = "Archimonde",
				},
				["Player-3682-0B253A97"] = {
					["ilvl"] = 435.1875,
					["guid"] = "Player-3682-0B253A97",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["cache_time"] = 1686170427,
					["realm"] = "Ragnaros",
					["name"] = "Chibibowa-Ragnaros",
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["rank"] = "Trial",
				},
				["Player-1305-0B86916D"] = {
					["name"] = "Bangsummums-Kazzak",
					["guid"] = "Player-1305-0B86916D",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1679415998,
					["realm"] = "Kazzak",
				},
				["Player-580-0A3BAFE1"] = {
					["name"] = "Rinjii-Tichondrius",
					["guid"] = "Player-580-0A3BAFE1",
					["class"] = "HUNTER",
					["cache_time"] = 1680290994,
					["realm"] = "Tichondrius",
				},
				["Player-604-04605D27"] = {
					["name"] = "Asumaro-Thrall",
					["guid"] = "Player-604-04605D27",
					["class"] = "SHAMAN",
					["cache_time"] = 1676439596,
					["realm"] = "Thrall",
				},
				["Player-2073-09BC9A89"] = {
					["name"] = "Yaeron-Stormscale",
					["guid"] = "Player-2073-09BC9A89",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676486995,
					["realm"] = "Stormscale",
				},
				["Player-1084-0A2D455D"] = {
					["name"] = "Kkamela-TarrenMill",
					["guid"] = "Player-1084-0A2D455D",
					["class"] = "PRIEST",
					["cache_time"] = 1686605803,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0C869CE7"] = {
					["name"] = "Rebellios-Kazzak",
					["guid"] = "Player-1305-0C869CE7",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685816533,
					["realm"] = "Kazzak",
				},
				["Player-581-0A6C977F"] = {
					["name"] = "Córc-Blackrock",
					["guid"] = "Player-581-0A6C977F",
					["class"] = "WARRIOR",
					["cache_time"] = 1684235960,
					["realm"] = "Blackrock",
				},
				["Player-1305-0C62865C"] = {
					["name"] = "Stunf-Kazzak",
					["guid"] = "Player-1305-0C62865C",
					["class"] = "WARRIOR",
					["cache_time"] = 1678461061,
					["realm"] = "Kazzak",
				},
				["Player-1305-0B875203"] = {
					["name"] = "Boomerina-Kazzak",
					["guid"] = "Player-1305-0B875203",
					["class"] = "WARRIOR",
					["cache_time"] = 1677878374,
					["realm"] = "Kazzak",
				},
				["Player-570-09B9F334"] = {
					["name"] = "Myotisa-Azshara",
					["guid"] = "Player-570-09B9F334",
					["class"] = "WARRIOR",
					["cache_time"] = 1684926332,
					["realm"] = "Azshara",
				},
				["Player-3674-0AF37AEC"] = {
					["name"] = "Xkenshiniks-TwistingNether",
					["guid"] = "Player-3674-0AF37AEC",
					["class"] = "WARLOCK",
					["cache_time"] = 1684205930,
					["realm"] = "TwistingNether",
				},
				["Player-1316-0C8C999E"] = {
					["name"] = "Ganyma-Nemesis",
					["guid"] = "Player-1316-0C8C999E",
					["class"] = "PALADIN",
					["cache_time"] = 1689419853,
					["realm"] = "Nemesis",
				},
				["Player-3674-0AEB1373"] = {
					["name"] = "Waturr-TwistingNether",
					["guid"] = "Player-3674-0AEB1373",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677515492,
					["realm"] = "TwistingNether",
				},
				["Player-3682-0A625B9D"] = {
					["name"] = "Rambonér-Ragnaros",
					["guid"] = "Player-3682-0A625B9D",
					["class"] = "SHAMAN",
					["cache_time"] = 1677879103,
					["realm"] = "Ragnaros",
				},
				["Player-1099-0A4925E6"] = {
					["name"] = "Valkyr-Rexxar",
					["guid"] = "Player-1099-0A4925E6",
					["class"] = "WARRIOR",
					["cache_time"] = 1676785844,
					["realm"] = "Rexxar",
				},
				["Player-1621-0B05702E"] = {
					["name"] = "Ancêm-Dalaran",
					["guid"] = "Player-1621-0B05702E",
					["class"] = "SHAMAN",
					["cache_time"] = 1687261056,
					["realm"] = "Dalaran",
				},
				["Player-1621-08A20E1F"] = {
					["name"] = "Aonnia-Dalaran",
					["guid"] = "Player-1621-08A20E1F",
					["class"] = "DRUID",
					["cache_time"] = 1676370489,
					["realm"] = "Dalaran",
				},
				["Player-3692-046AB18E"] = {
					["name"] = "Duktig-Eredar",
					["guid"] = "Player-3692-046AB18E",
					["class"] = "SHAMAN",
					["cache_time"] = 1676180633,
					["realm"] = "Eredar",
				},
				["Player-1615-01FC4089"] = {
					["name"] = "серелиус-Ревущийфьорд",
					["guid"] = "Player-1615-01FC4089",
					["class"] = "DRUID",
					["cache_time"] = 1686710191,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1597-0CF9E7B7"] = {
					["name"] = "Eureka-Sylvanas",
					["guid"] = "Player-1597-0CF9E7B7",
					["class"] = "DRUID",
					["cache_time"] = 1678230027,
					["realm"] = "Sylvanas",
				},
				["Player-1615-0B019AC8"] = {
					["name"] = "жрицаутех-Ревущийфьорд",
					["guid"] = "Player-1615-0B019AC8",
					["class"] = "PRIEST",
					["cache_time"] = 1687949444,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1928-0F3BD6F5"] = {
					["name"] = "паззл-Корольлич",
					["guid"] = "Player-1928-0F3BD6F5",
					["class"] = "DRUID",
					["cache_time"] = 1676079047,
					["realm"] = "Корольлич",
				},
				["Player-1302-09B6BE5E"] = {
					["name"] = "ßigßañg-Archimonde",
					["guid"] = "Player-1302-09B6BE5E",
					["class"] = "WARRIOR",
					["cache_time"] = 1686702897,
					["realm"] = "Archimonde",
				},
				["Player-3691-06DD86F3"] = {
					["name"] = "Brüll-Blackhand",
					["guid"] = "Player-3691-06DD86F3",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676957174,
					["realm"] = "Blackhand",
				},
				["Player-580-0A74FC93"] = {
					["name"] = "Tesayë-Blackmoore",
					["guid"] = "Player-580-0A74FC93",
					["class"] = "HUNTER",
					["cache_time"] = 1687791302,
					["realm"] = "Blackmoore",
				},
				["Player-1597-0F110A5E"] = {
					["name"] = "Leman-Sylvanas",
					["guid"] = "Player-1597-0F110A5E",
					["class"] = "WARLOCK",
					["cache_time"] = 1684598292,
					["realm"] = "Sylvanas",
				},
				["Player-3713-072D0370"] = {
					["name"] = "Cataon-BurningLegion",
					["guid"] = "Player-3713-072D0370",
					["class"] = "SHAMAN",
					["cache_time"] = 1676792336,
					["realm"] = "BurningLegion",
				},
				["Player-1602-05A91B91"] = {
					["name"] = "докторищще-Гордунни",
					["guid"] = "Player-1602-05A91B91",
					["class"] = "PALADIN",
					["cache_time"] = 1686062737,
					["realm"] = "Гордунни",
				},
				["Player-612-0A6F1ACD"] = {
					["name"] = "Trapattoni-Destromath",
					["guid"] = "Player-612-0A6F1ACD",
					["class"] = "EVOKER",
					["cache_time"] = 1680292466,
					["realm"] = "Destromath",
				},
				["Player-3674-081BF176"] = {
					["name"] = "Tayylorswift-TwistingNether",
					["guid"] = "Player-3674-081BF176",
					["class"] = "PRIEST",
					["cache_time"] = 1690915840,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0B219B18"] = {
					["name"] = "Däkuookami-TwistingNether",
					["guid"] = "Player-3674-0B219B18",
					["class"] = "EVOKER",
					["cache_time"] = 1690915840,
					["realm"] = "TwistingNether",
				},
				["Player-3691-09B76285"] = {
					["name"] = "Liltrashxo-Blackhand",
					["guid"] = "Player-3691-09B76285",
					["class"] = "HUNTER",
					["cache_time"] = 1690915840,
					["realm"] = "Blackhand",
				},
				["Player-581-083708C1"] = {
					["name"] = "Itankthat-Blackrock",
					["guid"] = "Player-581-083708C1",
					["class"] = "MONK",
					["cache_time"] = 1684493090,
					["realm"] = "Blackrock",
				},
				["Player-1615-0B2322FC"] = {
					["name"] = "душаандрюхи-Ревущийфьорд",
					["guid"] = "Player-1615-0B2322FC",
					["class"] = "PRIEST",
					["cache_time"] = 1689253178,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-0B178079"] = {
					["name"] = "Fredknight-Ragnaros",
					["guid"] = "Player-3682-0B178079",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1675886183,
					["realm"] = "Ragnaros",
				},
				["Player-3682-0B27F34E"] = {
					["name"] = "Dragondog-Ragnaros",
					["guid"] = "Player-3682-0B27F34E",
					["class"] = "EVOKER",
					["cache_time"] = 1690895922,
					["realm"] = "Ragnaros",
				},
				["Player-1315-0C45D562"] = {
					["name"] = "Harûu-Elune",
					["guid"] = "Player-1315-0C45D562",
					["class"] = "PRIEST",
					["cache_time"] = 1690894644,
					["realm"] = "Elune",
				},
				["Player-1084-070E90E4"] = {
					["name"] = "Anódia-TarrenMill",
					["guid"] = "Player-1084-070E90E4",
					["class"] = "DRUID",
					["cache_time"] = 1676501074,
					["realm"] = "TarrenMill",
				},
				["Player-1403-080C65AF"] = {
					["name"] = "Mushasha-Draenor",
					["guid"] = "Player-1403-080C65AF",
					["class"] = "PRIEST",
					["cache_time"] = 1690750821,
					["realm"] = "Draenor",
				},
				["Player-1335-09E71105"] = {
					["name"] = "Staroke-Ysondre",
					["guid"] = "Player-1335-09E71105",
					["class"] = "EVOKER",
					["cache_time"] = 1687248521,
					["realm"] = "Ysondre",
				},
				["Player-1923-0EE99921"] = {
					["name"] = "таунед-Ясеневыйлес",
					["guid"] = "Player-1923-0EE99921",
					["class"] = "DRUID",
					["cache_time"] = 1676973948,
					["realm"] = "Ясеневыйлес",
				},
				["Player-1084-097B0F6E"] = {
					["name"] = "Balamonk-TarrenMill",
					["guid"] = "Player-1084-097B0F6E",
					["class"] = "MONK",
					["cache_time"] = 1690750821,
					["realm"] = "TarrenMill",
				},
				["Player-1335-02DBA557"] = {
					["name"] = "Guluum-Ysondre",
					["guid"] = "Player-1335-02DBA557",
					["class"] = "MAGE",
					["cache_time"] = 1676803606,
					["realm"] = "Ysondre",
				},
				["Player-1329-04EC0F70"] = {
					["name"] = "Ragnár-Ravencrest",
					["guid"] = "Player-1329-04EC0F70",
					["class"] = "WARRIOR",
					["cache_time"] = 1677251886,
					["realm"] = "Ravencrest",
				},
				["Player-1302-06684DA3"] = {
					["name"] = "Leemon-Archimonde",
					["guid"] = "Player-1302-06684DA3",
					["class"] = "DRUID",
					["cache_time"] = 1677106953,
					["realm"] = "Archimonde",
				},
				["Player-1379-052B8E2E"] = {
					["name"] = "Emanie-Uldum",
					["guid"] = "Player-1379-052B8E2E",
					["class"] = "PRIEST",
					["cache_time"] = 1690410198,
					["realm"] = "Uldum",
				},
				["Player-1302-0C316EF0"] = {
					["name"] = "Yachty-Archimonde",
					["guid"] = "Player-1302-0C316EF0",
					["class"] = "MONK",
					["cache_time"] = 1690410513,
					["realm"] = "Archimonde",
				},
				["Player-3674-093812D6"] = {
					["name"] = "Eekadh-TwistingNether",
					["guid"] = "Player-3674-093812D6",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1690513584,
					["realm"] = "TwistingNether",
				},
				["Player-510-099C1B96"] = {
					["name"] = "Flotov-Chantséternels",
					["guid"] = "Player-510-099C1B96",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1688922052,
					["realm"] = "Chantséternels",
				},
				["Player-2073-09335868"] = {
					["name"] = "Fierca-Stormscale",
					["guid"] = "Player-2073-09335868",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676377737,
					["realm"] = "Stormscale",
				},
				["Player-3691-09CD7F91"] = {
					["name"] = "Rollotaku-Blackhand",
					["guid"] = "Player-3691-09CD7F91",
					["class"] = "HUNTER",
					["cache_time"] = 1678052884,
					["realm"] = "Blackhand",
				},
				["Player-1084-0A534A19"] = {
					["name"] = "Deidorian-TarrenMill",
					["guid"] = "Player-1084-0A534A19",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676783114,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0C3F2A98"] = {
					["name"] = "Lockwrath-Kazzak",
					["guid"] = "Player-1305-0C3F2A98",
					["class"] = "WARLOCK",
					["cache_time"] = 1680005528,
					["realm"] = "Kazzak",
				},
				["Player-3682-0B238D73"] = {
					["ilvl"] = 444.5,
					["guid"] = "Player-3682-0B238D73",
					["class"] = "DEATHKNIGHT",
					["realm"] = "Ragnaros",
					["role"] = "DAMAGER",
					["cache_time"] = 1689281451,
					["name"] = "Asset-Ragnaros",
					["specID"] = 252,
					["enchanter"] = true,
					["enchantingLvl"] = 99,
					["rank"] = "Officer Alt",
				},
				["Player-3674-088691BD"] = {
					["name"] = "Graveweed-TwistingNether",
					["guid"] = "Player-3674-088691BD",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687956237,
					["realm"] = "TwistingNether",
				},
				["Player-3682-0AEC5E2E"] = {
					["ilvl"] = 438.375,
					["guid"] = "Player-3682-0AEC5E2E",
					["class"] = "DEATHKNIGHT",
					["role"] = "DAMAGER",
					["cache_time"] = 1685651466,
					["realm"] = "Ragnaros",
					["name"] = "Slowone-Ragnaros",
					["specID"] = 252,
					["enchantingLvl"] = 0,
					["rank"] = "Mythic Raider",
				},
				["Player-3691-0765B008"] = {
					["name"] = "Makie-Echsenkessel",
					["guid"] = "Player-3691-0765B008",
					["class"] = "ROGUE",
					["cache_time"] = 1686754263,
					["realm"] = "Echsenkessel",
				},
				["Player-3391-0C8CDFDD"] = {
					["ilvl"] = 437.375,
					["guid"] = "Player-3391-0C8CDFDD",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1685797754,
					["realm"] = "Silvermoon",
					["name"] = "Neviem-Silvermoon",
					["specID"] = 255,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1379-0A7D517F"] = {
					["name"] = "Väleska-Sanguino",
					["guid"] = "Player-1379-0A7D517F",
					["class"] = "PALADIN",
					["cache_time"] = 1690509687,
					["realm"] = "Sanguino",
				},
				["Player-580-0A639882"] = {
					["name"] = "Waynez-Blackmoore",
					["guid"] = "Player-580-0A639882",
					["class"] = "SHAMAN",
					["cache_time"] = 1677518150,
					["realm"] = "Blackmoore",
				},
				["Player-1121-0A6A8673"] = {
					["name"] = "Airesa-DerAbyssischeRat",
					["guid"] = "Player-1121-0A6A8673",
					["class"] = "MONK",
					["cache_time"] = 1676950723,
					["realm"] = "DerAbyssischeRat",
				},
				["Player-3691-09FD2ACF"] = {
					["name"] = "Speccs-Blackhand",
					["guid"] = "Player-3691-09FD2ACF",
					["class"] = "EVOKER",
					["cache_time"] = 1689699139,
					["realm"] = "Blackhand",
				},
				["Player-3674-0B131680"] = {
					["name"] = "Enotus-TwistingNether",
					["guid"] = "Player-3674-0B131680",
					["class"] = "WARRIOR",
					["cache_time"] = 1686196139,
					["realm"] = "TwistingNether",
				},
				["Player-1403-0A3E61B8"] = {
					["name"] = "Stormbully-Draenor",
					["guid"] = "Player-1403-0A3E61B8",
					["class"] = "SHAMAN",
					["cache_time"] = 1686121310,
					["realm"] = "Draenor",
				},
				["Player-581-05A25784"] = {
					["name"] = "Baummensch-Blackrock",
					["guid"] = "Player-581-05A25784",
					["class"] = "DRUID",
					["cache_time"] = 1676768222,
					["realm"] = "Blackrock",
				},
				["Player-1305-0C23CE59"] = {
					["name"] = "Tanksslave-Kazzak",
					["guid"] = "Player-1305-0C23CE59",
					["class"] = "PRIEST",
					["cache_time"] = 1690510985,
					["realm"] = "Kazzak",
				},
				["Player-1416-0A44CFC0"] = {
					["name"] = "Wanda-Vek'nilash",
					["guid"] = "Player-1416-0A44CFC0",
					["class"] = "WARLOCK",
					["cache_time"] = 1689800841,
					["realm"] = "Vek'nilash",
				},
				["Player-1305-0C6244FE"] = {
					["name"] = "Mulletgodxqt-Kazzak",
					["guid"] = "Player-1305-0C6244FE",
					["class"] = "EVOKER",
					["cache_time"] = 1689948802,
					["realm"] = "Kazzak",
				},
				["Player-3391-0C869F13"] = {
					["name"] = "Tbhdenes-Silvermoon",
					["guid"] = "Player-3391-0C869F13",
					["class"] = "WARLOCK",
					["cache_time"] = 1684883011,
					["realm"] = "Silvermoon",
				},
				["Player-1379-0AE1A09C"] = {
					["ilvl"] = 442.0625,
					["guid"] = "Player-1379-0AE1A09C",
					["class"] = "EVOKER",
					["role"] = "DAMAGER",
					["cache_time"] = 1687258024,
					["realm"] = "Sanguino",
					["name"] = "Radâe-Sanguino",
					["specID"] = 1467,
					["enchantingLvl"] = 0,
					["rank"] = "Trial",
				},
				["Player-2073-09E8B2B3"] = {
					["name"] = "Vherax-Stormscale",
					["guid"] = "Player-2073-09E8B2B3",
					["class"] = "EVOKER",
					["cache_time"] = 1675737337,
					["realm"] = "Stormscale",
				},
				["Player-3691-09C80BFE"] = {
					["name"] = "Lemasi-Blackhand",
					["guid"] = "Player-3691-09C80BFE",
					["class"] = "DRUID",
					["cache_time"] = 1685398638,
					["realm"] = "Blackhand",
				},
				["Player-2073-0A096743"] = {
					["name"] = "Ashaugmen-Stormscale",
					["guid"] = "Player-2073-0A096743",
					["class"] = "EVOKER",
					["cache_time"] = 1690410198,
					["realm"] = "Stormscale",
				},
				["Player-3674-0AE61C3C"] = {
					["name"] = "Bigdondon-TwistingNether",
					["guid"] = "Player-3674-0AE61C3C",
					["class"] = "DRUID",
					["cache_time"] = 1686754474,
					["realm"] = "TwistingNether",
				},
				["Player-3691-09F04439"] = {
					["ilvl"] = 416.5,
					["guid"] = "Player-3691-09F04439",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["name"] = "Schëinhëilig-Blackhand",
					["realm"] = "Blackhand",
					["cache_time"] = 1676381729,
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["rank"] = "Raidmöwe",
				},
				["Player-1335-06EBC8CF"] = {
					["name"] = "Azriä-Ysondre",
					["guid"] = "Player-1335-06EBC8CF",
					["class"] = "ROGUE",
					["cache_time"] = 1679506666,
					["realm"] = "Ysondre",
				},
				["Player-3686-09E8FFA4"] = {
					["name"] = "Schubhàns-Antonidas",
					["guid"] = "Player-3686-09E8FFA4",
					["class"] = "WARLOCK",
					["cache_time"] = 1678052884,
					["realm"] = "Antonidas",
				},
				["Player-3674-0B0CABEA"] = {
					["ilvl"] = 442.875,
					["guid"] = "Player-3674-0B0CABEA",
					["class"] = "DRUID",
					["role"] = "HEALER",
					["cache_time"] = 1686690665,
					["rank"] = "Raider",
					["name"] = "Juuyuu-TwistingNether",
					["specID"] = 105,
					["enchantingLvl"] = 0,
					["realm"] = "TwistingNether",
				},
				["Player-1084-0A63C601"] = {
					["name"] = "Bittergal-TarrenMill",
					["guid"] = "Player-1084-0A63C601",
					["class"] = "WARLOCK",
					["cache_time"] = 1676186369,
					["realm"] = "TarrenMill",
				},
				["Player-3656-04D6B055"] = {
					["name"] = "Sushiman-Haomarush",
					["guid"] = "Player-3656-04D6B055",
					["class"] = "WARRIOR",
					["cache_time"] = 1687157932,
					["realm"] = "Haomarush",
				},
				["Player-1379-0922EE7A"] = {
					["name"] = "Zacu-Sanguino",
					["guid"] = "Player-1379-0922EE7A",
					["class"] = "PRIEST",
					["cache_time"] = 1690410198,
					["realm"] = "Sanguino",
				},
				["Player-3682-0AB1FA43"] = {
					["name"] = "Guldpräst-Ragnaros",
					["guid"] = "Player-3682-0AB1FA43",
					["class"] = "PRIEST",
					["cache_time"] = 1686035755,
					["realm"] = "Ragnaros",
				},
				["Player-3674-0A8089CA"] = {
					["name"] = "Dopex-TwistingNether",
					["guid"] = "Player-3674-0A8089CA",
					["class"] = "ROGUE",
					["cache_time"] = 1690750821,
					["realm"] = "TwistingNether",
				},
				["Player-1329-097837DC"] = {
					["name"] = "Jòcke-Ravencrest",
					["guid"] = "Player-1329-097837DC",
					["class"] = "WARRIOR",
					["cache_time"] = 1686121310,
					["realm"] = "Ravencrest",
				},
				["Player-1084-08728B66"] = {
					["name"] = "Donthil-TarrenMill",
					["guid"] = "Player-1084-08728B66",
					["class"] = "PALADIN",
					["cache_time"] = 1687791012,
					["realm"] = "TarrenMill",
				},
				["Player-3682-0B00340B"] = {
					["name"] = "Voodoojohn-Ragnaros",
					["guid"] = "Player-3682-0B00340B",
					["class"] = "SHAMAN",
					["cache_time"] = 1689286279,
					["realm"] = "Ragnaros",
				},
				["Player-1084-0A847EAD"] = {
					["name"] = "Sneezehuntz-TarrenMill",
					["guid"] = "Player-1084-0A847EAD",
					["class"] = "HUNTER",
					["cache_time"] = 1680262695,
					["realm"] = "TarrenMill",
				},
				["Player-1615-0B182D15"] = {
					["name"] = "ветриго-Ревущийфьорд",
					["guid"] = "Player-1615-0B182D15",
					["class"] = "MONK",
					["cache_time"] = 1676973948,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1604-0F5869C9"] = {
					["name"] = "крипнахиле-СвежевательДуш",
					["guid"] = "Player-1604-0F5869C9",
					["class"] = "SHAMAN",
					["cache_time"] = 1686934454,
					["realm"] = "СвежевательДуш",
				},
				["Player-1305-09B07644"] = {
					["name"] = "Pitatu-Kazzak",
					["guid"] = "Player-1305-09B07644",
					["class"] = "PRIEST",
					["cache_time"] = 1680400229,
					["realm"] = "Kazzak",
				},
				["Player-1403-0A5A1CF8"] = {
					["name"] = "Trackpad-Draenor",
					["guid"] = "Player-1403-0A5A1CF8",
					["class"] = "EVOKER",
					["cache_time"] = 1677518150,
					["realm"] = "Draenor",
				},
				["Player-3702-0A9ECE4F"] = {
					["name"] = "Gættabæs-ArgentDawn",
					["guid"] = "Player-3702-0A9ECE4F",
					["class"] = "PRIEST",
					["cache_time"] = 1689287248,
					["realm"] = "ArgentDawn",
				},
				["Player-1390-0B444FCB"] = {
					["name"] = "Trackaï-Hyjal",
					["guid"] = "Player-1390-0B444FCB",
					["class"] = "ROGUE",
					["cache_time"] = 1683906553,
					["realm"] = "Hyjal",
				},
				["Player-3674-07789A7A"] = {
					["name"] = "Vinegarr-TwistingNether",
					["guid"] = "Player-3674-07789A7A",
					["class"] = "PRIEST",
					["cache_time"] = 1685393886,
					["realm"] = "TwistingNether",
				},
				["Player-1379-09A8843D"] = {
					["name"] = "Python-Zul'jin",
					["guid"] = "Player-1379-09A8843D",
					["class"] = "DRUID",
					["cache_time"] = 1678860427,
					["realm"] = "Zul'jin",
				},
				["Player-1127-0A4CA8A2"] = {
					["name"] = "Mevira-KirinTor",
					["guid"] = "Player-1127-0A4CA8A2",
					["class"] = "EVOKER",
					["cache_time"] = 1690750821,
					["realm"] = "KirinTor",
				},
				["Player-1335-0691C8F0"] = {
					["name"] = "Mëkags-Ysondre",
					["guid"] = "Player-1335-0691C8F0",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684052763,
					["realm"] = "Ysondre",
				},
				["Player-1092-0A988492"] = {
					["name"] = "Molière-Drak'thul",
					["guid"] = "Player-1092-0A988492",
					["class"] = "PALADIN",
					["cache_time"] = 1687953965,
					["realm"] = "Drak'thul",
				},
				["Player-3691-09FB8C98"] = {
					["name"] = "Gârgrim-Blackhand",
					["guid"] = "Player-3691-09FB8C98",
					["class"] = "WARRIOR",
					["cache_time"] = 1678616145,
					["realm"] = "Blackhand",
				},
				["Player-1303-07975494"] = {
					["name"] = "Scyshamy-Aggra(Português)",
					["guid"] = "Player-1303-07975494",
					["class"] = "SHAMAN",
					["cache_time"] = 1690156137,
					["realm"] = "Aggra(Português)",
				},
				["Player-1305-0C7FBF89"] = {
					["name"] = "Tromponii-Kazzak",
					["guid"] = "Player-1305-0C7FBF89",
					["class"] = "SHAMAN",
					["cache_time"] = 1677957827,
					["realm"] = "Kazzak",
				},
				["Player-1335-09F6CE3E"] = {
					["name"] = "Pavelito-Ysondre",
					["guid"] = "Player-1335-09F6CE3E",
					["class"] = "EVOKER",
					["cache_time"] = 1687248521,
					["realm"] = "Ysondre",
				},
				["Player-1615-08CFE5F0"] = {
					["name"] = "автократ-Ревущийфьорд",
					["guid"] = "Player-1615-08CFE5F0",
					["class"] = "PALADIN",
					["cache_time"] = 1689352223,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-0A7C5C5E"] = {
					["ilvl"] = 417.625,
					["guid"] = "Player-3682-0A7C5C5E",
					["class"] = "WARRIOR",
					["role"] = "DAMAGER",
					["cache_time"] = 1679002272,
					["rank"] = "Mythic Raider",
					["name"] = "Samantro-Ragnaros",
					["specID"] = 72,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-3702-0A95698B"] = {
					["name"] = "Seregos-ArgentDawn",
					["guid"] = "Player-3702-0A95698B",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1678730018,
					["realm"] = "ArgentDawn",
				},
				["Player-3682-07B1496C"] = {
					["ilvl"] = 437.875,
					["guid"] = "Player-3682-07B1496C",
					["class"] = "DEMONHUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1690135547,
					["realm"] = "Ragnaros",
					["name"] = "Goshdarn-Ragnaros",
					["specID"] = 577,
					["enchantingLvl"] = 0,
					["rank"] = "Alt",
				},
				["Player-1127-093373F8"] = {
					["name"] = "Miniratie-KirinTor",
					["guid"] = "Player-1127-093373F8",
					["class"] = "SHAMAN",
					["cache_time"] = 1690056758,
					["realm"] = "KirinTor",
				},
				["Player-581-08C4480E"] = {
					["name"] = "Lyriane-Blackrock",
					["guid"] = "Player-581-08C4480E",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687949013,
					["realm"] = "Blackrock",
				},
				["Player-1084-0A3CC77B"] = {
					["name"] = "Maresal-TarrenMill",
					["guid"] = "Player-1084-0A3CC77B",
					["class"] = "MONK",
					["cache_time"] = 1685191876,
					["realm"] = "TarrenMill",
				},
				["Player-1390-0AF6393B"] = {
					["name"] = "Strongdps-Hyjal",
					["guid"] = "Player-1390-0AF6393B",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1690750821,
					["realm"] = "Hyjal",
				},
				["Player-1084-0A9D1D36"] = {
					["name"] = "Iceyy-Dentarg",
					["guid"] = "Player-1084-0A9D1D36",
					["class"] = "DRUID",
					["cache_time"] = 1689704202,
					["realm"] = "Dentarg",
				},
				["Player-1390-0C2CBA33"] = {
					["name"] = "Rayonlumiere-Hyjal",
					["guid"] = "Player-1390-0C2CBA33",
					["class"] = "PALADIN",
					["cache_time"] = 1677249984,
					["realm"] = "Hyjal",
				},
				["Player-1615-0B0AD519"] = {
					["name"] = "табха-Ревущийфьорд",
					["guid"] = "Player-1615-0B0AD519",
					["class"] = "EVOKER",
					["cache_time"] = 1689951102,
					["realm"] = "Ревущийфьорд",
				},
				["Player-2073-09DF1CE9"] = {
					["name"] = "Careyou-Stormscale",
					["guid"] = "Player-2073-09DF1CE9",
					["class"] = "PRIEST",
					["cache_time"] = 1680278206,
					["realm"] = "Stormscale",
				},
				["Player-3674-08CA3448"] = {
					["name"] = "Dugar-TwistingNether",
					["guid"] = "Player-3674-08CA3448",
					["class"] = "SHAMAN",
					["cache_time"] = 1677665404,
					["realm"] = "TwistingNether",
				},
				["Player-1403-0A72640C"] = {
					["name"] = "Robrands-Draenor",
					["guid"] = "Player-1403-0A72640C",
					["class"] = "EVOKER",
					["cache_time"] = 1689804288,
					["realm"] = "Draenor",
				},
				["Player-1403-09D8CFFD"] = {
					["name"] = "Néithyo-Draenor",
					["guid"] = "Player-1403-09D8CFFD",
					["class"] = "HUNTER",
					["cache_time"] = 1680258337,
					["realm"] = "Draenor",
				},
				["Player-1621-0A5BB8C3"] = {
					["name"] = "Pacollito-Eldre'Thalas",
					["guid"] = "Player-1621-0A5BB8C3",
					["class"] = "SHAMAN",
					["cache_time"] = 1690410198,
					["realm"] = "Eldre'Thalas",
				},
				["Player-1379-0AA673FF"] = {
					["name"] = "Lezil-Sanguino",
					["guid"] = "Player-1379-0AA673FF",
					["class"] = "PRIEST",
					["cache_time"] = 1676861407,
					["realm"] = "Sanguino",
				},
				["Player-1403-099E8C25"] = {
					["name"] = "Priëstitute-Draenor",
					["guid"] = "Player-1403-099E8C25",
					["class"] = "PRIEST",
					["cache_time"] = 1689804288,
					["realm"] = "Draenor",
				},
				["Player-1305-0C535649"] = {
					["name"] = "Evokuga-Kazzak",
					["guid"] = "Player-1305-0C535649",
					["class"] = "EVOKER",
					["cache_time"] = 1689802006,
					["realm"] = "Kazzak",
				},
				["Player-1615-0A5DEDEE"] = {
					["name"] = "эстал-Ревущийфьорд",
					["guid"] = "Player-1615-0A5DEDEE",
					["class"] = "PRIEST",
					["cache_time"] = 1689954010,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1122-0A70A6BF"] = {
					["name"] = "Uina-Uldaman",
					["guid"] = "Player-1122-0A70A6BF",
					["class"] = "PRIEST",
					["cache_time"] = 1685059364,
					["realm"] = "Uldaman",
				},
				["Player-3391-08E995F8"] = {
					["name"] = "Rime-Silvermoon",
					["guid"] = "Player-3391-08E995F8",
					["class"] = "WARLOCK",
					["cache_time"] = 1689802006,
					["realm"] = "Silvermoon",
				},
				["Player-1621-0AFE7358"] = {
					["name"] = "Elëkträ-Dalaran",
					["guid"] = "Player-1621-0AFE7358",
					["class"] = "PRIEST",
					["cache_time"] = 1689340203,
					["realm"] = "Dalaran",
				},
				["Player-1587-0326EF65"] = {
					["name"] = "Inyeza-Hellfire",
					["guid"] = "Player-1587-0326EF65",
					["class"] = "WARLOCK",
					["cache_time"] = 1676768222,
					["realm"] = "Hellfire",
				},
				["Player-1403-06359CAD"] = {
					["ilvl"] = 385.0625,
					["guid"] = "Player-1403-06359CAD",
					["class"] = "SHAMAN",
					["realm"] = "Draenor",
					["role"] = "DAMAGER",
					["cache_time"] = 1679012111,
					["name"] = "Helpdotcom-Draenor",
					["specID"] = 263,
					["enchanter"] = true,
					["enchantingLvl"] = 1,
					["rank"] = "Unguilded",
				},
				["Player-1928-0E441E4E"] = {
					["name"] = "ороти-Седогрив",
					["guid"] = "Player-1928-0E441E4E",
					["class"] = "ROGUE",
					["cache_time"] = 1678733070,
					["realm"] = "Седогрив",
				},
				["Player-1615-0A623298"] = {
					["name"] = "варикафура-Ревущийфьорд",
					["guid"] = "Player-1615-0A623298",
					["class"] = "WARRIOR",
					["cache_time"] = 1690329832,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3691-09DA0A31"] = {
					["name"] = "Káshá-Blackhand",
					["guid"] = "Player-3691-09DA0A31",
					["class"] = "WARLOCK",
					["cache_time"] = 1684926332,
					["realm"] = "Blackhand",
				},
				["Player-1403-0A4D747F"] = {
					["role"] = "HEALER",
					["name"] = "Scalybishop-Draenor",
					["guid"] = "Player-1403-0A4D747F",
					["realm"] = "Draenor",
					["class"] = "EVOKER",
					["cache_time"] = 1687956944,
					["rank"] = "Dark Ranger",
				},
				["Player-3682-0B0A5868"] = {
					["name"] = "Agorafóbia-Ragnaros",
					["guid"] = "Player-3682-0B0A5868",
					["class"] = "EVOKER",
					["cache_time"] = 1689699139,
					["realm"] = "Ragnaros",
				},
				["Player-581-081CC700"] = {
					["name"] = "Rømpø-Blackrock",
					["guid"] = "Player-581-081CC700",
					["class"] = "WARRIOR",
					["cache_time"] = 1680292466,
					["realm"] = "Blackrock",
				},
				["Player-1403-0A4C702B"] = {
					["name"] = "Albersoar-Draenor",
					["guid"] = "Player-1403-0A4C702B",
					["class"] = "EVOKER",
					["cache_time"] = 1689800841,
					["realm"] = "Draenor",
				},
				["Player-1403-07CA91C8"] = {
					["name"] = "Kiraxx-Draenor",
					["guid"] = "Player-1403-07CA91C8",
					["class"] = "WARLOCK",
					["cache_time"] = 1690493152,
					["realm"] = "Draenor",
				},
				["Player-1403-0A534813"] = {
					["name"] = "Celié-Draenor",
					["guid"] = "Player-1403-0A534813",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684559781,
					["realm"] = "Draenor",
				},
				["Player-3682-09AC7F82"] = {
					["ilvl"] = 408.375,
					["guid"] = "Player-3682-09AC7F82",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1678136508,
					["rank"] = "Raider",
					["name"] = "Avantoe-Ragnaros",
					["specID"] = 253,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-3691-09FD4023"] = {
					["name"] = "Gwyndra-Blackhand",
					["guid"] = "Player-3691-09FD4023",
					["class"] = "EVOKER",
					["cache_time"] = 1689698521,
					["realm"] = "Blackhand",
				},
				["Player-1305-0C8CF483"] = {
					["name"] = "Hatewarlock-Kazzak",
					["guid"] = "Player-1305-0C8CF483",
					["class"] = "WARLOCK",
					["cache_time"] = 1685487968,
					["realm"] = "Kazzak",
				},
				["Player-3674-0B1D1C53"] = {
					["name"] = "Mewoker-TwistingNether",
					["guid"] = "Player-3674-0B1D1C53",
					["class"] = "EVOKER",
					["cache_time"] = 1689769880,
					["realm"] = "TwistingNether",
				},
				["Player-1302-089519F9"] = {
					["name"] = "Frøzzenart-Archimonde",
					["guid"] = "Player-1302-089519F9",
					["class"] = "MAGE",
					["cache_time"] = 1689772053,
					["realm"] = "Archimonde",
				},
				["Player-3391-0C852C94"] = {
					["name"] = "Bzanbahador-Silvermoon",
					["guid"] = "Player-3391-0C852C94",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679424868,
					["realm"] = "Silvermoon",
				},
				["Player-1315-0719B2F6"] = {
					["name"] = "Scrappicoco-Elune",
					["guid"] = "Player-1315-0719B2F6",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1689800841,
					["realm"] = "Elune",
				},
				["Player-3691-09737BB5"] = {
					["name"] = "Ennvî-Blackhand",
					["guid"] = "Player-3691-09737BB5",
					["class"] = "PRIEST",
					["cache_time"] = 1689704202,
					["realm"] = "Blackhand",
				},
				["Player-3674-093AFC1C"] = {
					["name"] = "Ertunçp-TwistingNether",
					["guid"] = "Player-3674-093AFC1C",
					["class"] = "PRIEST",
					["cache_time"] = 1687791012,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0AC31BCC"] = {
					["name"] = "Nyeldris-TwistingNether",
					["guid"] = "Player-3674-0AC31BCC",
					["class"] = "PALADIN",
					["cache_time"] = 1683815885,
					["realm"] = "TwistingNether",
				},
				["Player-3713-088E5B3C"] = {
					["name"] = "Ghuurall-BurningLegion",
					["guid"] = "Player-3713-088E5B3C",
					["class"] = "MAGE",
					["cache_time"] = 1689699139,
					["realm"] = "BurningLegion",
				},
				["Player-1618-0B10B9DB"] = {
					["role"] = "DAMAGER",
					["name"] = "Brumrum-DieAldor",
					["guid"] = "Player-1618-0B10B9DB",
					["realm"] = "DieAldor",
					["class"] = "WARRIOR",
					["cache_time"] = 1676911145,
					["rank"] = "Gefährte",
				},
				["Player-3682-0B0A8A5E"] = {
					["ilvl"] = 417.75,
					["guid"] = "Player-3682-0B0A8A5E",
					["class"] = "DEATHKNIGHT",
					["role"] = "DAMAGER",
					["cache_time"] = 1679599567,
					["realm"] = "Ragnaros",
					["name"] = "Hamut-Ragnaros",
					["specID"] = 252,
					["enchantingLvl"] = 0,
					["rank"] = "Mythic Raider",
				},
				["Player-1302-0A195BAC"] = {
					["name"] = "Warmachinee-Archimonde",
					["guid"] = "Player-1302-0A195BAC",
					["class"] = "DRUID",
					["cache_time"] = 1686702897,
					["realm"] = "Archimonde",
				},
				["Player-1084-0961B131"] = {
					["name"] = "Trkalo-TarrenMill",
					["guid"] = "Player-1084-0961B131",
					["class"] = "ROGUE",
					["cache_time"] = 1676973948,
					["realm"] = "TarrenMill",
				},
				["Player-1615-0A61D529"] = {
					["name"] = "газаврик-Ревущийфьорд",
					["guid"] = "Player-1615-0A61D529",
					["class"] = "PRIEST",
					["cache_time"] = 1689804288,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1597-0CEACD99"] = {
					["name"] = "Maldeb-Sylvanas",
					["guid"] = "Player-1597-0CEACD99",
					["class"] = "DRUID",
					["cache_time"] = 1685826137,
					["realm"] = "Sylvanas",
				},
				["Player-3692-06733F12"] = {
					["name"] = "Bibamuspower-Eredar",
					["guid"] = "Player-3692-06733F12",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684883011,
					["realm"] = "Eredar",
				},
				["Player-604-08C3545A"] = {
					["name"] = "Bùmblebee-Thrall",
					["guid"] = "Player-604-08C3545A",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677411890,
					["realm"] = "Thrall",
				},
				["Player-1335-09CBA0C0"] = {
					["name"] = "Elena-Ysondre",
					["guid"] = "Player-1335-09CBA0C0",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677073121,
					["realm"] = "Ysondre",
				},
				["Player-580-0A749A86"] = {
					["name"] = "Falarfal-Blackmoore",
					["guid"] = "Player-580-0A749A86",
					["class"] = "HUNTER",
					["cache_time"] = 1685487968,
					["realm"] = "Blackmoore",
				},
				["Player-1403-0A06ED6B"] = {
					["name"] = "Notron-Draenor",
					["guid"] = "Player-1403-0A06ED6B",
					["class"] = "DRUID",
					["cache_time"] = 1684158100,
					["realm"] = "Draenor",
				},
				["Player-1390-0C825728"] = {
					["name"] = "Chffaar-Hyjal",
					["guid"] = "Player-1390-0C825728",
					["class"] = "ROGUE",
					["cache_time"] = 1678234610,
					["realm"] = "Hyjal",
				},
				["Player-1390-0C8CD41F"] = {
					["ilvl"] = 435.1875,
					["guid"] = "Player-1390-0C8CD41F",
					["class"] = "PRIEST",
					["role"] = "HEALER",
					["cache_time"] = 1686934581,
					["realm"] = "Hyjal",
					["name"] = "Holybaq-Hyjal",
					["specID"] = 257,
					["enchantingLvl"] = 0,
					["rank"] = "Nouveau",
				},
				["Player-3674-0B27DA3B"] = {
					["name"] = "Teabase-TwistingNether",
					["guid"] = "Player-3674-0B27DA3B",
					["class"] = "PALADIN",
					["cache_time"] = 1689769880,
					["realm"] = "TwistingNether",
				},
				["Player-1379-0A257339"] = {
					["name"] = "Euphoryya-Sanguino",
					["guid"] = "Player-1379-0A257339",
					["class"] = "HUNTER",
					["cache_time"] = 1676383325,
					["realm"] = "Sanguino",
				},
				["Player-3656-0A8AA7C8"] = {
					["name"] = "Wintersun-Stormreaver",
					["guid"] = "Player-3656-0A8AA7C8",
					["class"] = "PRIEST",
					["cache_time"] = 1677665404,
					["realm"] = "Stormreaver",
				},
				["Player-1390-0C5D41C0"] = {
					["name"] = "Veeröna-Hyjal",
					["guid"] = "Player-1390-0C5D41C0",
					["class"] = "ROGUE",
					["cache_time"] = 1687257934,
					["realm"] = "Hyjal",
				},
				["Player-1325-09FB6162"] = {
					["name"] = "Maddbone-Aggramar",
					["guid"] = "Player-1325-09FB6162",
					["class"] = "WARRIOR",
					["cache_time"] = 1689800841,
					["realm"] = "Aggramar",
				},
				["Player-612-056C9612"] = {
					["name"] = "Sarkhan-Mannoroth",
					["guid"] = "Player-612-056C9612",
					["class"] = "PRIEST",
					["cache_time"] = 1677607191,
					["realm"] = "Mannoroth",
				},
				["Player-3703-06D01785"] = {
					["name"] = "Nekali-Frostwolf",
					["guid"] = "Player-3703-06D01785",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686754474,
					["realm"] = "Frostwolf",
				},
				["Player-580-0A59DEEC"] = {
					["name"] = "Opór-Blackmoore",
					["guid"] = "Player-580-0A59DEEC",
					["class"] = "DRUID",
					["cache_time"] = 1685740823,
					["realm"] = "Blackmoore",
				},
				["Player-1923-04E0B087"] = {
					["name"] = "соулл-Ясеневыйлес",
					["guid"] = "Player-1923-04E0B087",
					["class"] = "PALADIN",
					["cache_time"] = 1689353247,
					["realm"] = "Ясеневыйлес",
				},
				["Player-3391-0C4B5ED2"] = {
					["name"] = "Inspirationx-Silvermoon",
					["guid"] = "Player-3391-0C4B5ED2",
					["class"] = "MONK",
					["cache_time"] = 1689772053,
					["realm"] = "Silvermoon",
				},
				["Player-1621-0AFD4310"] = {
					["ilvl"] = 416.6875,
					["guid"] = "Player-1621-0AFD4310",
					["class"] = "WARRIOR",
					["role"] = "DAMAGER",
					["name"] = "æthelwolf-Dalaran",
					["realm"] = "Dalaran",
					["cache_time"] = 1676382197,
					["specID"] = 71,
					["enchantingLvl"] = 0,
					["rank"] = "Apply",
				},
				["Player-1335-09E768FB"] = {
					["name"] = "Lyrean-Ysondre",
					["guid"] = "Player-1335-09E768FB",
					["class"] = "EVOKER",
					["cache_time"] = 1684926332,
					["realm"] = "Ysondre",
				},
				["Player-1305-0C866B9C"] = {
					["name"] = "Nzoko-Kazzak",
					["guid"] = "Player-1305-0C866B9C",
					["class"] = "PALADIN",
					["cache_time"] = 1689352223,
					["realm"] = "Kazzak",
				},
				["Player-1615-0AE9AD75"] = {
					["name"] = "мистерсушняк-Ревущийфьорд",
					["guid"] = "Player-1615-0AE9AD75",
					["class"] = "PRIEST",
					["cache_time"] = 1684926332,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1096-03EAEDE6"] = {
					["name"] = "Hikidoki-ScarshieldLegion",
					["guid"] = "Player-1096-03EAEDE6",
					["class"] = "DRUID",
					["cache_time"] = 1677665404,
					["realm"] = "ScarshieldLegion",
				},
				["Player-1379-0AAA20F9"] = {
					["name"] = "Fumademonios-Sanguino",
					["guid"] = "Player-1379-0AAA20F9",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684292453,
					["realm"] = "Sanguino",
				},
				["Player-3674-059B0E5E"] = {
					["name"] = "Eilis-TwistingNether",
					["guid"] = "Player-3674-059B0E5E",
					["class"] = "WARLOCK",
					["cache_time"] = 1689699139,
					["realm"] = "TwistingNether",
				},
				["Player-1329-06D5C77D"] = {
					["name"] = "Venaticus-Ravencrest",
					["guid"] = "Player-1329-06D5C77D",
					["class"] = "HUNTER",
					["cache_time"] = 1676063890,
					["realm"] = "Ravencrest",
				},
				["Player-3691-0494011C"] = {
					["name"] = "Faldon-Blackhand",
					["guid"] = "Player-3691-0494011C",
					["class"] = "PALADIN",
					["cache_time"] = 1690135301,
					["realm"] = "Blackhand",
				},
				["Player-3391-0C7CAEB5"] = {
					["name"] = "Katalonan-Silvermoon",
					["guid"] = "Player-3391-0C7CAEB5",
					["class"] = "SHAMAN",
					["cache_time"] = 1676763406,
					["realm"] = "Silvermoon",
				},
				["Player-3702-0A73D54C"] = {
					["name"] = "Sportzdruid-ArgentDawn",
					["guid"] = "Player-3702-0A73D54C",
					["class"] = "DRUID",
					["cache_time"] = 1687041442,
					["realm"] = "ArgentDawn",
				},
				["Player-3692-09E7D1DE"] = {
					["name"] = "Schmatsu-Eredar",
					["guid"] = "Player-3692-09E7D1DE",
					["class"] = "EVOKER",
					["cache_time"] = 1689802006,
					["realm"] = "Eredar",
				},
				["Player-3391-0C4DD949"] = {
					["name"] = "Jucksx-Silvermoon",
					["guid"] = "Player-3391-0C4DD949",
					["class"] = "ROGUE",
					["cache_time"] = 1677394231,
					["realm"] = "Silvermoon",
				},
				["Player-3657-0A20C7C9"] = {
					["name"] = "Shakiraz-Darksorrow",
					["guid"] = "Player-3657-0A20C7C9",
					["class"] = "MAGE",
					["cache_time"] = 1689401454,
					["realm"] = "Darksorrow",
				},
				["Player-1403-0A3A1881"] = {
					["name"] = "Reckfisting-Draenor",
					["guid"] = "Player-1403-0A3A1881",
					["class"] = "MONK",
					["cache_time"] = 1685516014,
					["realm"] = "Draenor",
				},
				["Player-1335-066E7C35"] = {
					["name"] = "Bistoukette-Ysondre",
					["guid"] = "Player-1335-066E7C35",
					["class"] = "SHAMAN",
					["cache_time"] = 1676369902,
					["realm"] = "Ysondre",
				},
				["Player-1416-0A24A309"] = {
					["name"] = "Therenewer-Eonar",
					["guid"] = "Player-1416-0A24A309",
					["class"] = "PRIEST",
					["cache_time"] = 1678233163,
					["realm"] = "Eonar",
				},
				["Player-1604-0BE5CE58"] = {
					["name"] = "сериэл-СвежевательДуш",
					["guid"] = "Player-1604-0BE5CE58",
					["class"] = "DRUID",
					["cache_time"] = 1676973948,
					["realm"] = "СвежевательДуш",
				},
				["Player-1598-0B7DE5BB"] = {
					["name"] = "Oderov-Sunstrider",
					["guid"] = "Player-1598-0B7DE5BB",
					["class"] = "WARRIOR",
					["cache_time"] = 1689698521,
					["realm"] = "Sunstrider",
				},
				["Player-1325-03C607E1"] = {
					["name"] = "Firestormed-Aggramar",
					["guid"] = "Player-1325-03C607E1",
					["class"] = "MAGE",
					["cache_time"] = 1689800841,
					["realm"] = "Aggramar",
				},
				["Player-1127-04F7D9CD"] = {
					["name"] = "Corsopapa-LesSentinelles",
					["guid"] = "Player-1127-04F7D9CD",
					["class"] = "SHAMAN",
					["cache_time"] = 1689699139,
					["realm"] = "LesSentinelles",
				},
				["Player-3674-0B264826"] = {
					["name"] = "Deadcorrupt-TwistingNether",
					["guid"] = "Player-3674-0B264826",
					["class"] = "PRIEST",
					["cache_time"] = 1689799678,
					["realm"] = "TwistingNether",
				},
				["Player-3682-0AFF9141"] = {
					["name"] = "Múrsu-Ragnaros",
					["guid"] = "Player-3682-0AFF9141",
					["class"] = "DRUID",
					["cache_time"] = 1689677222,
					["realm"] = "Ragnaros",
				},
				["Player-3682-0B09DA3D"] = {
					["ilvl"] = 412.8125,
					["guid"] = "Player-3682-0B09DA3D",
					["class"] = "EVOKER",
					["rank"] = "Alt",
					["role"] = "DAMAGER",
					["cache_time"] = 1686262031,
					["name"] = "Jerevoker-Ragnaros",
					["enchanter"] = true,
					["specID"] = 1467,
					["enchantingLvl"] = 31,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0878924F"] = {
					["ilvl"] = 442.5,
					["guid"] = "Player-1305-0878924F",
					["class"] = "DEMONHUNTER",
					["role"] = "TANK",
					["cache_time"] = 1686988340,
					["rank"] = "Ognjen",
					["name"] = "Ognjen-Kazzak",
					["specID"] = 581,
					["enchantingLvl"] = 0,
					["realm"] = "Kazzak",
				},
				["Player-1127-0A4DA04B"] = {
					["name"] = "Agraou-LesClairvoyants",
					["guid"] = "Player-1127-0A4DA04B",
					["class"] = "EVOKER",
					["cache_time"] = 1689617426,
					["realm"] = "LesClairvoyants",
				},
				["Player-3674-0AE5F61E"] = {
					["name"] = "Lorennzo-TwistingNether",
					["guid"] = "Player-3674-0AE5F61E",
					["class"] = "MAGE",
					["cache_time"] = 1689677222,
					["realm"] = "TwistingNether",
				},
				["Player-2073-09F3D1F9"] = {
					["name"] = "Eiq-Stormscale",
					["guid"] = "Player-2073-09F3D1F9",
					["class"] = "ROGUE",
					["cache_time"] = 1677309445,
					["realm"] = "Stormscale",
				},
				["Player-580-082C5473"] = {
					["name"] = "Saitò-Blackmoore",
					["guid"] = "Player-580-082C5473",
					["class"] = "WARRIOR",
					["cache_time"] = 1684883011,
					["realm"] = "Blackmoore",
				},
				["Player-531-01C25642"] = {
					["name"] = "Hádez-Dethecus",
					["guid"] = "Player-531-01C25642",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687259300,
					["realm"] = "Dethecus",
				},
				["Player-3391-0C3904BA"] = {
					["name"] = "Maryberrý-Silvermoon",
					["guid"] = "Player-3391-0C3904BA",
					["class"] = "DRUID",
					["cache_time"] = 1689800841,
					["realm"] = "Silvermoon",
				},
				["Player-581-0A7346D0"] = {
					["name"] = "Ichbinmax-Blackrock",
					["guid"] = "Player-581-0A7346D0",
					["class"] = "PALADIN",
					["cache_time"] = 1686934454,
					["realm"] = "Blackrock",
				},
				["Player-3674-06B13670"] = {
					["name"] = "Torhian-TwistingNether",
					["guid"] = "Player-3674-06B13670",
					["class"] = "WARRIOR",
					["cache_time"] = 1687102798,
					["realm"] = "TwistingNether",
				},
				["Player-580-08CB8094"] = {
					["name"] = "Thrêgor-Blackmoore",
					["guid"] = "Player-580-08CB8094",
					["class"] = "SHAMAN",
					["cache_time"] = 1680437946,
					["realm"] = "Blackmoore",
				},
				["Player-3686-09F5D3F8"] = {
					["name"] = "Milian-Antonidas",
					["guid"] = "Player-3686-09F5D3F8",
					["class"] = "DRUID",
					["cache_time"] = 1689338809,
					["realm"] = "Antonidas",
				},
				["Player-1309-06EBE45A"] = {
					["name"] = "ândre-Pozzodell'Eternità",
					["guid"] = "Player-1309-06EBE45A",
					["class"] = "DRUID",
					["cache_time"] = 1684294594,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-3682-0B034970"] = {
					["ilvl"] = 414,
					["guid"] = "Player-3682-0B034970",
					["class"] = "DRUID",
					["rank"] = "Alt",
					["role"] = "TANK",
					["cache_time"] = 1675972134,
					["name"] = "Freddle-Ragnaros",
					["enchanter"] = true,
					["specID"] = 104,
					["enchantingLvl"] = 88,
					["realm"] = "Ragnaros",
				},
				["Player-1309-0865757B"] = {
					["ilvl"] = 414.625,
					["guid"] = "Player-1309-0865757B",
					["class"] = "WARRIOR",
					["role"] = "DAMAGER",
					["cache_time"] = 1676814570,
					["rank"] = "Raider ",
					["name"] = "Wakkos-Pozzodell'Eternità",
					["specID"] = 72,
					["enchantingLvl"] = 0,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-604-0A734E6F"] = {
					["name"] = "Silendris-Thrall",
					["guid"] = "Player-604-0A734E6F",
					["class"] = "PRIEST",
					["cache_time"] = 1688985349,
					["realm"] = "Thrall",
				},
				["Player-3674-0A1622B1"] = {
					["name"] = "Somanisa-TwistingNether",
					["guid"] = "Player-3674-0A1622B1",
					["class"] = "ROGUE",
					["cache_time"] = 1686121310,
					["realm"] = "TwistingNether",
				},
				["Player-1618-0356718E"] = {
					["name"] = "Gyldor-DieAldor",
					["guid"] = "Player-1618-0356718E",
					["class"] = "PALADIN",
					["cache_time"] = 1686754474,
					["realm"] = "DieAldor",
				},
				["Player-3691-09A12870"] = {
					["name"] = "Citrûs-Blackhand",
					["guid"] = "Player-3691-09A12870",
					["class"] = "MAGE",
					["cache_time"] = 1677256334,
					["realm"] = "Blackhand",
				},
				["Player-1305-0C8060FA"] = {
					["ilvl"] = 444.75,
					["guid"] = "Player-1305-0C8060FA",
					["class"] = "WARLOCK",
					["realm"] = "Kazzak",
					["role"] = "DAMAGER",
					["cache_time"] = 1690750821,
					["name"] = "Brussewayn-Kazzak",
					["specID"] = 267,
					["enchanter"] = true,
					["enchantingLvl"] = 55,
					["rank"] = "Member",
				},
				["Player-604-0A60DF5D"] = {
					["name"] = "Mirrin-Thrall",
					["guid"] = "Player-604-0A60DF5D",
					["class"] = "EVOKER",
					["cache_time"] = 1677515492,
					["realm"] = "Thrall",
				},
				["Player-3713-0AE3D907"] = {
					["name"] = "Shipek-BurningLegion",
					["guid"] = "Player-3713-0AE3D907",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684424313,
					["realm"] = "BurningLegion",
				},
				["Player-1618-0769A112"] = {
					["name"] = "Canary-DieAldor",
					["guid"] = "Player-1618-0769A112",
					["class"] = "DRUID",
					["cache_time"] = 1689253178,
					["realm"] = "DieAldor",
				},
				["Player-2074-09B40E7F"] = {
					["name"] = "Eneprya-EmeraldDream",
					["guid"] = "Player-2074-09B40E7F",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684883011,
					["realm"] = "EmeraldDream",
				},
				["Player-1390-0ADD748D"] = {
					["name"] = "Eldjazairi-Hyjal",
					["guid"] = "Player-1390-0ADD748D",
					["class"] = "PALADIN",
					["cache_time"] = 1689804288,
					["realm"] = "Hyjal",
				},
				["Player-1403-0A54A773"] = {
					["name"] = "Giandragon-Draenor",
					["guid"] = "Player-1403-0A54A773",
					["class"] = "EVOKER",
					["cache_time"] = 1690410198,
					["realm"] = "Draenor",
				},
				["Player-2073-0748F011"] = {
					["name"] = "Rm-Stormscale",
					["guid"] = "Player-2073-0748F011",
					["class"] = "ROGUE",
					["cache_time"] = 1688930496,
					["realm"] = "Stormscale",
				},
				["Player-1403-07F5DECB"] = {
					["name"] = "Raindead-Draenor",
					["guid"] = "Player-1403-07F5DECB",
					["class"] = "SHAMAN",
					["cache_time"] = 1676795234,
					["realm"] = "Draenor",
				},
				["Player-1127-05A9BFD9"] = {
					["name"] = "Alphaforta-LesClairvoyants",
					["guid"] = "Player-1127-05A9BFD9",
					["class"] = "DRUID",
					["cache_time"] = 1685832119,
					["realm"] = "LesClairvoyants",
				},
				["Player-1096-0A1C214A"] = {
					["name"] = "áshi-Sporeggar",
					["guid"] = "Player-1096-0A1C214A",
					["class"] = "DRUID",
					["cache_time"] = 1689699139,
					["realm"] = "Sporeggar",
				},
				["Player-3713-0AE7F838"] = {
					["name"] = "Sõren-BurningLegion",
					["guid"] = "Player-3713-0AE7F838",
					["class"] = "DRUID",
					["cache_time"] = 1689699139,
					["realm"] = "BurningLegion",
				},
				["Player-3674-070B7880"] = {
					["name"] = "Kenreis-TwistingNether",
					["guid"] = "Player-3674-070B7880",
					["class"] = "SHAMAN",
					["cache_time"] = 1685745460,
					["realm"] = "TwistingNether",
				},
				["Player-1615-0B214D3D"] = {
					["name"] = "айсайсбейби-Ревущийфьорд",
					["guid"] = "Player-1615-0B214D3D",
					["class"] = "DRUID",
					["cache_time"] = 1685864518,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-09A25FEC"] = {
					["name"] = "Yajin-Ragnaros",
					["guid"] = "Player-3682-09A25FEC",
					["class"] = "ROGUE",
					["cache_time"] = 1680431963,
					["realm"] = "Ragnaros",
				},
				["Player-1378-0A340845"] = {
					["name"] = "Isthähar-C'Thun",
					["guid"] = "Player-1378-0A340845",
					["class"] = "WARRIOR",
					["cache_time"] = 1683073733,
					["realm"] = "C'Thun",
				},
				["Player-3702-0A80BBC6"] = {
					["name"] = "Ancelyn-ArgentDawn",
					["guid"] = "Player-3702-0A80BBC6",
					["class"] = "DRUID",
					["cache_time"] = 1679997750,
					["realm"] = "ArgentDawn",
				},
				["Player-1615-06F1B671"] = {
					["name"] = "тимтимми-Ревущийфьорд",
					["guid"] = "Player-1615-06F1B671",
					["class"] = "PALADIN",
					["cache_time"] = 1684561485,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-0AFE652F"] = {
					["name"] = "Polkadots-Ragnaros",
					["guid"] = "Player-3682-0AFE652F",
					["class"] = "WARLOCK",
					["cache_time"] = 1677701795,
					["realm"] = "Ragnaros",
				},
				["Player-581-085C27B2"] = {
					["name"] = "Dannyexqt-Blackrock",
					["guid"] = "Player-581-085C27B2",
					["class"] = "WARRIOR",
					["cache_time"] = 1686049857,
					["realm"] = "Blackrock",
				},
				["Player-1084-0AA25722"] = {
					["name"] = "Chillspy-TarrenMill",
					["guid"] = "Player-1084-0AA25722",
					["class"] = "SHAMAN",
					["cache_time"] = 1689395307,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0C904AFA"] = {
					["name"] = "Blazeimpact-Kazzak",
					["guid"] = "Player-1305-0C904AFA",
					["class"] = "EVOKER",
					["cache_time"] = 1689292721,
					["realm"] = "Kazzak",
				},
				["Player-3674-0B297374"] = {
					["name"] = "Distasteful-TwistingNether",
					["guid"] = "Player-3674-0B297374",
					["class"] = "WARLOCK",
					["cache_time"] = 1689397818,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0C60A604"] = {
					["name"] = "Nisio-Kazzak",
					["guid"] = "Player-1305-0C60A604",
					["class"] = "EVOKER",
					["cache_time"] = 1687248139,
					["realm"] = "Kazzak",
				},
				["Player-3656-07BF9982"] = {
					["name"] = "Jöötikkä-Stormreaver",
					["guid"] = "Player-3656-07BF9982",
					["class"] = "DRUID",
					["cache_time"] = 1690915840,
					["realm"] = "Stormreaver",
				},
				["Player-1104-0A0C117B"] = {
					["name"] = "Kill-Nathrezim",
					["guid"] = "Player-1104-0A0C117B",
					["class"] = "HUNTER",
					["cache_time"] = 1687949013,
					["realm"] = "Nathrezim",
				},
				["Player-1099-0A6CA4A9"] = {
					["name"] = "Trû-Alleria",
					["guid"] = "Player-1099-0A6CA4A9",
					["class"] = "DRUID",
					["cache_time"] = 1677665404,
					["realm"] = "Alleria",
				},
				["Player-604-0A2B6ED5"] = {
					["name"] = "Somna-Thrall",
					["guid"] = "Player-604-0A2B6ED5",
					["class"] = "PALADIN",
					["cache_time"] = 1689297589,
					["realm"] = "Thrall",
				},
				["Player-1305-0C73E1A2"] = {
					["name"] = "Evilhuntter-Kazzak",
					["guid"] = "Player-1305-0C73E1A2",
					["class"] = "HUNTER",
					["cache_time"] = 1680221149,
					["realm"] = "Kazzak",
				},
				["Player-1084-0AA1234E"] = {
					["name"] = "Kumadruid-TarrenMill",
					["guid"] = "Player-1084-0AA1234E",
					["class"] = "DRUID",
					["cache_time"] = 1689287073,
					["realm"] = "TarrenMill",
				},
				["Player-580-0A6EFF20"] = {
					["name"] = "Healdrake-Blackmoore",
					["guid"] = "Player-580-0A6EFF20",
					["class"] = "EVOKER",
					["cache_time"] = 1689340203,
					["realm"] = "Blackmoore",
				},
				["Player-1305-03E6C04D"] = {
					["name"] = "Ragnâr-Kazzak",
					["guid"] = "Player-1305-03E6C04D",
					["class"] = "DRUID",
					["cache_time"] = 1678223169,
					["realm"] = "Kazzak",
				},
				["Player-1403-0A2E7974"] = {
					["name"] = "Mirdna-Draenor",
					["guid"] = "Player-1403-0A2E7974",
					["class"] = "HUNTER",
					["cache_time"] = 1677665404,
					["realm"] = "Draenor",
				},
				["Player-1390-0C72E07B"] = {
					["name"] = "Nanomurloc-Hyjal",
					["guid"] = "Player-1390-0C72E07B",
					["class"] = "PRIEST",
					["cache_time"] = 1678894799,
					["realm"] = "Hyjal",
				},
				["Player-1302-099B1309"] = {
					["name"] = "Veynz-Archimonde",
					["guid"] = "Player-1302-099B1309",
					["class"] = "WARLOCK",
					["cache_time"] = 1689772053,
					["realm"] = "Archimonde",
				},
				["Player-570-05B4125E"] = {
					["name"] = "Emilynn-Baelgun",
					["guid"] = "Player-570-05B4125E",
					["class"] = "PRIEST",
					["cache_time"] = 1689290162,
					["realm"] = "Baelgun",
				},
				["Player-2074-058A7D7F"] = {
					["name"] = "Chunkblower-EmeraldDream",
					["guid"] = "Player-2074-058A7D7F",
					["class"] = "PALADIN",
					["cache_time"] = 1689253178,
					["realm"] = "EmeraldDream",
				},
				["Player-3674-08F00583"] = {
					["name"] = "Gudeen-TwistingNether",
					["guid"] = "Player-3674-08F00583",
					["class"] = "PRIEST",
					["cache_time"] = 1685794414,
					["realm"] = "TwistingNether",
				},
				["Player-604-07C21039"] = {
					["name"] = "Baschel-Thrall",
					["guid"] = "Player-604-07C21039",
					["class"] = "HUNTER",
					["cache_time"] = 1690410198,
					["realm"] = "Thrall",
				},
				["Player-1403-0A223886"] = {
					["name"] = "Pandalow-Draenor",
					["guid"] = "Player-1403-0A223886",
					["class"] = "WARRIOR",
					["cache_time"] = 1689417619,
					["realm"] = "Draenor",
				},
				["Player-1305-0C8DD08F"] = {
					["name"] = "Extraordinry-Kazzak",
					["guid"] = "Player-1305-0C8DD08F",
					["class"] = "SHAMAN",
					["cache_time"] = 1686988340,
					["realm"] = "Kazzak",
				},
				["Player-1084-0A934841"] = {
					["name"] = "Alfrida-TarrenMill",
					["guid"] = "Player-1084-0A934841",
					["class"] = "PALADIN",
					["cache_time"] = 1679747022,
					["realm"] = "TarrenMill",
				},
				["Player-3682-08395E75"] = {
					["ilvl"] = 442.875,
					["guid"] = "Player-3682-08395E75",
					["class"] = "MONK",
					["role"] = "TANK",
					["cache_time"] = 1690326975,
					["realm"] = "Ragnaros",
					["name"] = "Paorel-Ragnaros",
					["specID"] = 268,
					["enchantingLvl"] = 0,
					["rank"] = "Member",
				},
				["Player-1615-09DD7BC3"] = {
					["name"] = "таздингот-Ревущийфьорд",
					["guid"] = "Player-1615-09DD7BC3",
					["class"] = "WARRIOR",
					["cache_time"] = 1688888605,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1615-0A91909C"] = {
					["name"] = "фрозбуу-Ревущийфьорд",
					["guid"] = "Player-1615-0A91909C",
					["class"] = "PRIEST",
					["cache_time"] = 1688876703,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1604-0AEE4236"] = {
					["name"] = "дланьгоспода-СвежевательДуш",
					["guid"] = "Player-1604-0AEE4236",
					["class"] = "HUNTER",
					["cache_time"] = 1688947447,
					["realm"] = "СвежевательДуш",
				},
				["Player-512-06B42935"] = {
					["name"] = "Moarn-Kael'thas",
					["guid"] = "Player-512-06B42935",
					["class"] = "WARRIOR",
					["cache_time"] = 1686121310,
					["realm"] = "Kael'thas",
				},
				["Player-1329-09F1D62C"] = {
					["name"] = "Billythebob-Ravencrest",
					["guid"] = "Player-1329-09F1D62C",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685195489,
					["realm"] = "Ravencrest",
				},
				["Player-1316-09A1F137"] = {
					["name"] = "Elenhoin-Nemesis",
					["guid"] = "Player-1316-09A1F137",
					["class"] = "SHAMAN",
					["cache_time"] = 1678732140,
					["realm"] = "Nemesis",
				},
				["Player-3674-0B29F332"] = {
					["name"] = "Sakuranoyuki-TwistingNether",
					["guid"] = "Player-3674-0B29F332",
					["class"] = "HUNTER",
					["cache_time"] = 1689183014,
					["realm"] = "TwistingNether",
				},
				["Player-3713-0760A04D"] = {
					["name"] = "Sixu-BurningLegion",
					["guid"] = "Player-3713-0760A04D",
					["class"] = "ROGUE",
					["cache_time"] = 1680754040,
					["realm"] = "BurningLegion",
				},
				["Player-1403-0A50E125"] = {
					["name"] = "Majskolben-Draenor",
					["guid"] = "Player-1403-0A50E125",
					["class"] = "DRUID",
					["cache_time"] = 1686754973,
					["realm"] = "Draenor",
				},
				["Player-3391-0C93F0DF"] = {
					["name"] = "Kayekin-Silvermoon",
					["guid"] = "Player-3391-0C93F0DF",
					["class"] = "MAGE",
					["cache_time"] = 1688985349,
					["realm"] = "Silvermoon",
				},
				["Player-1303-0598CAFC"] = {
					["name"] = "Feuwa-Aggra(Português)",
					["guid"] = "Player-1303-0598CAFC",
					["class"] = "WARRIOR",
					["cache_time"] = 1688306751,
					["realm"] = "Aggra(Português)",
				},
				["Player-1122-0A029734"] = {
					["name"] = "Shanila-Eitrigg",
					["guid"] = "Player-1122-0A029734",
					["class"] = "PRIEST",
					["cache_time"] = 1688927498,
					["realm"] = "Eitrigg",
				},
				["Player-3391-0BD1AC0D"] = {
					["name"] = "Xerkis-Silvermoon",
					["guid"] = "Player-3391-0BD1AC0D",
					["class"] = "DRUID",
					["cache_time"] = 1676370489,
					["realm"] = "Silvermoon",
				},
				["Player-3692-045EFC1A"] = {
					["name"] = "Nîal-Eredar",
					["guid"] = "Player-3692-045EFC1A",
					["class"] = "PRIEST",
					["cache_time"] = 1684926332,
					["realm"] = "Eredar",
				},
				["Player-1309-09A1B58A"] = {
					["name"] = "Skulldemon-Pozzodell'Eternità",
					["guid"] = "Player-1309-09A1B58A",
					["class"] = "MAGE",
					["cache_time"] = 1680258337,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-3674-0AF44219"] = {
					["name"] = "Sørenspind-TwistingNether",
					["guid"] = "Player-3674-0AF44219",
					["class"] = "DRUID",
					["cache_time"] = 1686933987,
					["realm"] = "TwistingNether",
				},
				["Player-1335-09D96550"] = {
					["name"] = "Mamyjée-Ysondre",
					["guid"] = "Player-1335-09D96550",
					["class"] = "PALADIN",
					["cache_time"] = 1689004698,
					["realm"] = "Ysondre",
				},
				["Player-3391-0C930D21"] = {
					["name"] = "Dodgeland-Silvermoon",
					["guid"] = "Player-3391-0C930D21",
					["class"] = "PALADIN",
					["cache_time"] = 1688923372,
					["realm"] = "Silvermoon",
				},
				["Player-1602-0C3A8FEF"] = {
					["name"] = "хенесса-Гордунни",
					["guid"] = "Player-1602-0C3A8FEF",
					["class"] = "PRIEST",
					["cache_time"] = 1676444247,
					["realm"] = "Гордунни",
				},
				["Player-3686-09E7D779"] = {
					["name"] = "Woopilicious-Antonidas",
					["guid"] = "Player-3686-09E7D779",
					["class"] = "EVOKER",
					["cache_time"] = 1690513584,
					["realm"] = "Antonidas",
				},
				["Player-1615-0B09B609"] = {
					["name"] = "ржаволёт-Ревущийфьорд",
					["guid"] = "Player-1615-0B09B609",
					["class"] = "EVOKER",
					["cache_time"] = 1686934454,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1403-0A30FB22"] = {
					["name"] = "Nvä-Draenor",
					["guid"] = "Player-1403-0A30FB22",
					["class"] = "WARLOCK",
					["cache_time"] = 1687041442,
					["realm"] = "Draenor",
				},
				["Player-1379-0ACE126A"] = {
					["name"] = "Sneigramos-Sanguino",
					["guid"] = "Player-1379-0ACE126A",
					["class"] = "DRUID",
					["cache_time"] = 1689617412,
					["realm"] = "Sanguino",
				},
				["Player-2073-09EEA802"] = {
					["name"] = "Barackoshamy-Stormscale",
					["guid"] = "Player-2073-09EEA802",
					["class"] = "SHAMAN",
					["cache_time"] = 1677253640,
					["realm"] = "Stormscale",
				},
				["Player-1305-0C8F6AF8"] = {
					["name"] = "Arcpaladin-Kazzak",
					["guid"] = "Player-1305-0C8F6AF8",
					["class"] = "PALADIN",
					["cache_time"] = 1684212905,
					["realm"] = "Kazzak",
				},
				["Player-3702-062408EE"] = {
					["name"] = "Darkyoda-ArgentDawn",
					["guid"] = "Player-3702-062408EE",
					["class"] = "PRIEST",
					["cache_time"] = 1679427324,
					["realm"] = "ArgentDawn",
				},
				["Player-1329-09BBF010"] = {
					["name"] = "Dean-Ravencrest",
					["guid"] = "Player-1329-09BBF010",
					["class"] = "DRUID",
					["cache_time"] = 1676452417,
					["realm"] = "Ravencrest",
				},
				["Player-1596-0EDC37C9"] = {
					["name"] = "Dachiif-TheMaelstrom",
					["guid"] = "Player-1596-0EDC37C9",
					["class"] = "SHAMAN",
					["cache_time"] = 1676187142,
					["realm"] = "TheMaelstrom",
				},
				["Player-3391-0C0E4B0D"] = {
					["name"] = "Bengeezuz-Silvermoon",
					["guid"] = "Player-3391-0C0E4B0D",
					["class"] = "MAGE",
					["cache_time"] = 1676479581,
					["realm"] = "Silvermoon",
				},
				["Player-1597-0F43080E"] = {
					["name"] = "Nordsee-Sylvanas",
					["guid"] = "Player-1597-0F43080E",
					["class"] = "PRIEST",
					["cache_time"] = 1688922037,
					["realm"] = "Sylvanas",
				},
				["Player-1301-0BC336D4"] = {
					["name"] = "Krullee-Outland",
					["guid"] = "Player-1301-0BC336D4",
					["class"] = "DRUID",
					["cache_time"] = 1687961749,
					["realm"] = "Outland",
				},
				["Player-1403-079EFDE0"] = {
					["name"] = "Binayo-Draenor",
					["guid"] = "Player-1403-079EFDE0",
					["class"] = "HUNTER",
					["cache_time"] = 1676810465,
					["realm"] = "Draenor",
				},
				["Player-3702-0A61352F"] = {
					["name"] = "Nalafury-ArgentDawn",
					["guid"] = "Player-3702-0A61352F",
					["class"] = "WARRIOR",
					["cache_time"] = 1680695598,
					["realm"] = "ArgentDawn",
				},
				["Player-1615-09AA8733"] = {
					["name"] = "жоня-Ревущийфьорд",
					["guid"] = "Player-1615-09AA8733",
					["class"] = "SHAMAN",
					["cache_time"] = 1676356988,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1615-0B22522B"] = {
					["name"] = "кашера-Ревущийфьорд",
					["guid"] = "Player-1615-0B22522B",
					["class"] = "SHAMAN",
					["cache_time"] = 1689253178,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1305-0BF757C0"] = {
					["name"] = "Bestbaby-Kazzak",
					["guid"] = "Player-1305-0BF757C0",
					["class"] = "HUNTER",
					["cache_time"] = 1690590322,
					["realm"] = "Kazzak",
				},
				["Player-1615-0AAE7779"] = {
					["name"] = "бабкадемон-Ревущийфьорд",
					["guid"] = "Player-1615-0AAE7779",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677315157,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1301-0C20541D"] = {
					["name"] = "Valiya-Outland",
					["guid"] = "Player-1301-0C20541D",
					["class"] = "DRUID",
					["cache_time"] = 1685059364,
					["realm"] = "Outland",
				},
				["Player-1390-07F36B99"] = {
					["name"] = "Skyouest-Hyjal",
					["guid"] = "Player-1390-07F36B99",
					["class"] = "PALADIN",
					["cache_time"] = 1686121310,
					["realm"] = "Hyjal",
				},
				["Player-1305-0A13B021"] = {
					["name"] = "Morphioos-Kazzak",
					["guid"] = "Player-1305-0A13B021",
					["class"] = "WARRIOR",
					["cache_time"] = 1680437946,
					["realm"] = "Kazzak",
				},
				["Player-3682-0B1BBF64"] = {
					["name"] = "Zaggmonk-Ragnaros",
					["guid"] = "Player-3682-0B1BBF64",
					["class"] = "MONK",
					["cache_time"] = 1685358170,
					["realm"] = "Ragnaros",
				},
				["Player-3674-05B0E23F"] = {
					["name"] = "Kapaski-TwistingNether",
					["guid"] = "Player-3674-05B0E23F",
					["class"] = "SHAMAN",
					["cache_time"] = 1689677222,
					["realm"] = "TwistingNether",
				},
				["Player-3682-09412B6D"] = {
					["name"] = "Sausagelife-Ragnaros",
					["guid"] = "Player-3682-09412B6D",
					["class"] = "PALADIN",
					["cache_time"] = 1689699139,
					["realm"] = "Ragnaros",
				},
				["Player-1092-0A8071DD"] = {
					["name"] = "Sekurok-Drak'thul",
					["guid"] = "Player-1092-0A8071DD",
					["class"] = "EVOKER",
					["cache_time"] = 1678457130,
					["realm"] = "Drak'thul",
				},
				["Player-1302-0C0B4EF2"] = {
					["name"] = "Ferdosi-Archimonde",
					["guid"] = "Player-1302-0C0B4EF2",
					["class"] = "DRUID",
					["cache_time"] = 1684201708,
					["realm"] = "Archimonde",
				},
				["Player-3691-0A07326E"] = {
					["name"] = "Mâryjuana-Blackhand",
					["guid"] = "Player-3691-0A07326E",
					["class"] = "MONK",
					["cache_time"] = 1690510866,
					["realm"] = "Blackhand",
				},
				["Player-3691-0572D143"] = {
					["name"] = "Drâkôr-Blackhand",
					["guid"] = "Player-3691-0572D143",
					["class"] = "WARLOCK",
					["cache_time"] = 1685126676,
					["realm"] = "Blackhand",
				},
				["Player-3682-095A2094"] = {
					["name"] = "ätalia-Ragnaros",
					["guid"] = "Player-3682-095A2094",
					["class"] = "DRUID",
					["cache_time"] = 1688908568,
					["realm"] = "Ragnaros",
				},
				["Player-512-09D0CC28"] = {
					["name"] = "Mílenas-Kael'thas",
					["guid"] = "Player-512-09D0CC28",
					["class"] = "WARLOCK",
					["cache_time"] = 1676973948,
					["realm"] = "Kael'thas",
				},
				["Player-3682-07AC867F"] = {
					["name"] = "Sugarpanda-Ragnaros",
					["guid"] = "Player-3682-07AC867F",
					["class"] = "MONK",
					["cache_time"] = 1689286279,
					["realm"] = "Ragnaros",
				},
				["Player-1929-0CA305A5"] = {
					["name"] = "страхмен-Термоштепсель",
					["guid"] = "Player-1929-0CA305A5",
					["class"] = "WARLOCK",
					["cache_time"] = 1686754263,
					["realm"] = "Термоштепсель",
				},
				["Player-1305-0C61E899"] = {
					["name"] = "Cybermom-Kazzak",
					["guid"] = "Player-1305-0C61E899",
					["class"] = "PRIEST",
					["cache_time"] = 1680437946,
					["realm"] = "Kazzak",
				},
				["Player-3682-0B262074"] = {
					["name"] = "Fakker-Ragnaros",
					["guid"] = "Player-3682-0B262074",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686690665,
					["realm"] = "Ragnaros",
				},
				["Player-3686-09E70649"] = {
					["name"] = "Wargreatmon-Antonidas",
					["guid"] = "Player-3686-09E70649",
					["class"] = "EVOKER",
					["cache_time"] = 1687952836,
					["realm"] = "Antonidas",
				},
				["Player-3682-0AF73C46"] = {
					["name"] = "Anitsirk-Ragnaros",
					["guid"] = "Player-3682-0AF73C46",
					["class"] = "HUNTER",
					["cache_time"] = 1676185839,
					["realm"] = "Ragnaros",
				},
				["Player-3682-0B28E027"] = {
					["ilvl"] = 442.75,
					["guid"] = "Player-3682-0B28E027",
					["class"] = "SHAMAN",
					["rank"] = "Alt",
					["role"] = "HEALER",
					["cache_time"] = 1690135545,
					["name"] = "Rejuvsham-Ragnaros",
					["enchanter"] = true,
					["specID"] = 264,
					["enchantingLvl"] = 25,
					["realm"] = "Ragnaros",
				},
				["Player-1402-0A4B67D9"] = {
					["name"] = "Qwerbae-Doomhammer",
					["guid"] = "Player-1402-0A4B67D9",
					["class"] = "MONK",
					["cache_time"] = 1687955030,
					["realm"] = "Doomhammer",
				},
				["Player-3674-0B1C6C9E"] = {
					["name"] = "Icedragon-TwistingNether",
					["guid"] = "Player-3674-0B1C6C9E",
					["class"] = "PALADIN",
					["cache_time"] = 1688923372,
					["realm"] = "TwistingNether",
				},
				["Player-3391-0C2F015B"] = {
					["name"] = "Nayòmi-Silvermoon",
					["guid"] = "Player-3391-0C2F015B",
					["class"] = "PALADIN",
					["cache_time"] = 1685797754,
					["realm"] = "Silvermoon",
				},
				["Player-1390-08C5F72E"] = {
					["name"] = "Tauriél-Hyjal",
					["guid"] = "Player-1390-08C5F72E",
					["class"] = "HUNTER",
					["cache_time"] = 1677071253,
					["realm"] = "Hyjal",
				},
				["Player-580-09DF8E68"] = {
					["name"] = "Wellactually-Blackmoore",
					["guid"] = "Player-580-09DF8E68",
					["class"] = "DRUID",
					["cache_time"] = 1685998340,
					["realm"] = "Blackmoore",
				},
				["Player-3674-0B17DD98"] = {
					["name"] = "Ezgoodness-TwistingNether",
					["guid"] = "Player-3674-0B17DD98",
					["class"] = "DRUID",
					["cache_time"] = 1676423903,
					["realm"] = "TwistingNether",
				},
				["Player-1085-050FA9BC"] = {
					["name"] = "Grúmpz-TheSha'tar",
					["guid"] = "Player-1085-050FA9BC",
					["class"] = "HUNTER",
					["cache_time"] = 1677665404,
					["realm"] = "TheSha'tar",
				},
				["Player-1302-0C80B670"] = {
					["name"] = "Rollssfire-Archimonde",
					["guid"] = "Player-1302-0C80B670",
					["class"] = "MAGE",
					["cache_time"] = 1676311312,
					["realm"] = "Archimonde",
				},
				["Player-1084-0A9710F0"] = {
					["name"] = "Phillson-TarrenMill",
					["guid"] = "Player-1084-0A9710F0",
					["class"] = "PRIEST",
					["cache_time"] = 1680258337,
					["realm"] = "TarrenMill",
				},
				["Player-1084-0A4E1384"] = {
					["name"] = "Varoa-TarrenMill",
					["guid"] = "Player-1084-0A4E1384",
					["class"] = "SHAMAN",
					["cache_time"] = 1689182151,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0C891B3F"] = {
					["name"] = "Neymor-Kazzak",
					["guid"] = "Player-1305-0C891B3F",
					["class"] = "PALADIN",
					["cache_time"] = 1688874501,
					["realm"] = "Kazzak",
				},
				["Player-3681-0ADAB4DA"] = {
					["name"] = "Madirl-Magtheridon",
					["guid"] = "Player-3681-0ADAB4DA",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676359629,
					["realm"] = "Magtheridon",
				},
				["Player-3682-097B06C7"] = {
					["name"] = "Redpool-Ragnaros",
					["guid"] = "Player-3682-097B06C7",
					["class"] = "PALADIN",
					["cache_time"] = 1687304879,
					["realm"] = "Ragnaros",
				},
				["Player-3686-0A0248F7"] = {
					["ilvl"] = 430.125,
					["guid"] = "Player-3686-0A0248F7",
					["class"] = "PRIEST",
					["rank"] = "Raider",
					["role"] = "HEALER",
					["cache_time"] = 1685128648,
					["name"] = "Graywolf-Antonidas",
					["enchanter"] = true,
					["specID"] = 256,
					["enchantingLvl"] = 97,
					["realm"] = "Antonidas",
				},
				["Player-1598-081A7697"] = {
					["name"] = "Trizza-Chromaggus",
					["guid"] = "Player-1598-081A7697",
					["class"] = "SHAMAN",
					["cache_time"] = 1676973948,
					["realm"] = "Chromaggus",
				},
				["Player-1084-07F39176"] = {
					["name"] = "Shadballs-TarrenMill",
					["guid"] = "Player-1084-07F39176",
					["class"] = "MAGE",
					["cache_time"] = 1687245813,
					["realm"] = "TarrenMill",
				},
				["Player-1621-0B09C7B6"] = {
					["ilvl"] = 444.5,
					["guid"] = "Player-1621-0B09C7B6",
					["class"] = "EVOKER",
					["role"] = "HEALER",
					["cache_time"] = 1690750821,
					["realm"] = "Dalaran",
					["name"] = "Valfor-Dalaran",
					["specID"] = 1468,
					["enchantingLvl"] = 0,
					["rank"] = "Roster",
				},
				["Player-3682-0B29E284"] = {
					["ilvl"] = 443.625,
					["guid"] = "Player-3682-0B29E284",
					["class"] = "MONK",
					["role"] = "DAMAGER",
					["cache_time"] = 1689281451,
					["realm"] = "Ragnaros",
					["name"] = "Skaterble-Ragnaros",
					["specID"] = 269,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1302-0C1DFDB1"] = {
					["name"] = "Turtlerollup-Archimonde",
					["guid"] = "Player-1302-0C1DFDB1",
					["class"] = "PALADIN",
					["cache_time"] = 1676912354,
					["realm"] = "Archimonde",
				},
				["Player-3682-0B050205"] = {
					["ilvl"] = 410.0625,
					["guid"] = "Player-3682-0B050205",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1677093174,
					["realm"] = "Ragnaros",
					["name"] = "Omegacum-Ragnaros",
					["specID"] = 255,
					["enchantingLvl"] = 0,
					["rank"] = "Recruiter",
				},
				["Player-1085-08F405B7"] = {
					["name"] = "Maidchan-Moonglade",
					["guid"] = "Player-1085-08F405B7",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1677339602,
					["realm"] = "Moonglade",
				},
				["Player-1379-0ADF05FB"] = {
					["name"] = "Eüriel-Uldum",
					["guid"] = "Player-1379-0ADF05FB",
					["class"] = "DRUID",
					["cache_time"] = 1680262695,
					["realm"] = "Uldum",
				},
				["Player-3703-04E2CD70"] = {
					["name"] = "Sommerly-Frostwolf",
					["guid"] = "Player-3703-04E2CD70",
					["class"] = "PRIEST",
					["cache_time"] = 1678860427,
					["realm"] = "Frostwolf",
				},
				["Player-1403-0A683964"] = {
					["name"] = "Deymoo-Draenor",
					["guid"] = "Player-1403-0A683964",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687790447,
					["realm"] = "Draenor",
				},
				["Player-1305-0C81776F"] = {
					["name"] = "Beforeforget-Kazzak",
					["guid"] = "Player-1305-0C81776F",
					["class"] = "WARRIOR",
					["cache_time"] = 1680470479,
					["realm"] = "Kazzak",
				},
				["Player-1084-05D22D45"] = {
					["name"] = "Nobrainopain-TarrenMill",
					["guid"] = "Player-1084-05D22D45",
					["class"] = "HUNTER",
					["cache_time"] = 1689352223,
					["realm"] = "TarrenMill",
				},
				["Player-3702-073206ED"] = {
					["name"] = "Lúthienn-ArgentDawn",
					["guid"] = "Player-3702-073206ED",
					["class"] = "PRIEST",
					["cache_time"] = 1688687270,
					["realm"] = "ArgentDawn",
				},
				["Player-1379-0AD15E0C"] = {
					["name"] = "Krysiotv-Zul'jin",
					["guid"] = "Player-1379-0AD15E0C",
					["class"] = "EVOKER",
					["cache_time"] = 1676973948,
					["realm"] = "Zul'jin",
				},
				["Player-1084-0A728CBF"] = {
					["name"] = "Shrog-TarrenMill",
					["guid"] = "Player-1084-0A728CBF",
					["class"] = "HUNTER",
					["cache_time"] = 1686754263,
					["realm"] = "TarrenMill",
				},
				["Player-1127-0925A26B"] = {
					["name"] = "Irenicüs-KirinTor",
					["guid"] = "Player-1127-0925A26B",
					["class"] = "WARLOCK",
					["cache_time"] = 1684202637,
					["realm"] = "KirinTor",
				},
				["Player-3682-0B18768D"] = {
					["name"] = "Wangz-Ragnaros",
					["guid"] = "Player-3682-0B18768D",
					["class"] = "EVOKER",
					["cache_time"] = 1676190291,
					["realm"] = "Ragnaros",
				},
				["Player-581-0A66A0F7"] = {
					["name"] = "Geniehendrix-Blackrock",
					["guid"] = "Player-581-0A66A0F7",
					["class"] = "ROGUE",
					["cache_time"] = 1676190291,
					["realm"] = "Blackrock",
				},
				["Player-3691-09EA449E"] = {
					["name"] = "Druidkuron-Blackhand",
					["guid"] = "Player-3691-09EA449E",
					["class"] = "DRUID",
					["cache_time"] = 1689677208,
					["realm"] = "Blackhand",
				},
				["Player-1621-0AC1786A"] = {
					["name"] = "Yusgan-Cho'gall",
					["guid"] = "Player-1621-0AC1786A",
					["class"] = "DRUID",
					["cache_time"] = 1680292466,
					["realm"] = "Cho'gall",
				},
				["Player-1084-0A9297E9"] = {
					["name"] = "Phoeniixx-TarrenMill",
					["guid"] = "Player-1084-0A9297E9",
					["class"] = "HUNTER",
					["cache_time"] = 1676606635,
					["realm"] = "TarrenMill",
				},
				["Player-1378-081D99CB"] = {
					["ilvl"] = 417.9375,
					["guid"] = "Player-1378-081D99CB",
					["class"] = "SHAMAN",
					["role"] = "HEALER",
					["cache_time"] = 1679747022,
					["realm"] = "DunModr",
					["name"] = "Balp-DunModr",
					["specID"] = 264,
					["enchantingLvl"] = 0,
					["rank"] = "Raider Noche",
				},
				["Player-3682-05C24B4E"] = {
					["ilvl"] = 411.3125,
					["guid"] = "Player-3682-05C24B4E",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1677533507,
					["rank"] = "Trial",
					["name"] = "Dröw-Ragnaros",
					["specID"] = 253,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-3391-0C6C954D"] = {
					["name"] = "Nightrez-Silvermoon",
					["guid"] = "Player-3391-0C6C954D",
					["class"] = "WARLOCK",
					["cache_time"] = 1688303691,
					["realm"] = "Silvermoon",
				},
				["Player-580-0A718E61"] = {
					["name"] = "ðasda-Blackmoore",
					["guid"] = "Player-580-0A718E61",
					["class"] = "MONK",
					["cache_time"] = 1687791302,
					["realm"] = "Blackmoore",
				},
				["Player-604-0A20A4F7"] = {
					["name"] = "Shinpou-Thrall",
					["guid"] = "Player-604-0A20A4F7",
					["class"] = "MONK",
					["cache_time"] = 1676335902,
					["realm"] = "Thrall",
				},
				["Player-3686-05E4347D"] = {
					["name"] = "Xavîenne-Antonidas",
					["guid"] = "Player-3686-05E4347D",
					["class"] = "WARLOCK",
					["cache_time"] = 1677606207,
					["realm"] = "Antonidas",
				},
				["Player-1301-07F81324"] = {
					["name"] = "Milanxxalian-Outland",
					["guid"] = "Player-1301-07F81324",
					["class"] = "WARRIOR",
					["cache_time"] = 1678778673,
					["realm"] = "Outland",
				},
				["Player-1305-0C5339CC"] = {
					["name"] = "Aryzath-Kazzak",
					["guid"] = "Player-1305-0C5339CC",
					["class"] = "EVOKER",
					["cache_time"] = 1684926332,
					["realm"] = "Kazzak",
				},
				["Player-1403-0A187592"] = {
					["name"] = "Karikatur-Draenor",
					["guid"] = "Player-1403-0A187592",
					["class"] = "DRUID",
					["cache_time"] = 1676473513,
					["realm"] = "Draenor",
				},
				["Player-1390-0BE351C7"] = {
					["name"] = "Echysman-Hyjal",
					["guid"] = "Player-1390-0BE351C7",
					["class"] = "WARRIOR",
					["cache_time"] = 1689004698,
					["realm"] = "Hyjal",
				},
				["Player-3691-04D6E251"] = {
					["name"] = "Ayls-Blackhand",
					["guid"] = "Player-3691-04D6E251",
					["class"] = "DRUID",
					["cache_time"] = 1684501707,
					["realm"] = "Blackhand",
				},
				["Player-3691-09FB59BC"] = {
					["name"] = "Xowi-Blackhand",
					["guid"] = "Player-3691-09FB59BC",
					["class"] = "ROGUE",
					["cache_time"] = 1688687303,
					["realm"] = "Blackhand",
				},
				["Player-3682-0A135FA6"] = {
					["ilvl"] = 441.5625,
					["guid"] = "Player-3682-0A135FA6",
					["class"] = "PALADIN",
					["realm"] = "Ragnaros",
					["role"] = "DAMAGER",
					["cache_time"] = 1688072566,
					["name"] = "Wrathwings-Ragnaros",
					["specID"] = 70,
					["enchanter"] = true,
					["enchantingLvl"] = 54,
					["rank"] = "Alt",
				},
				["Player-1379-08346B74"] = {
					["name"] = "Apøcalypse-Zul'jin",
					["guid"] = "Player-1379-08346B74",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684926332,
					["realm"] = "Zul'jin",
				},
				["Player-1390-07E2C64B"] = {
					["name"] = "Palazuur-Hyjal",
					["guid"] = "Player-1390-07E2C64B",
					["class"] = "PALADIN",
					["cache_time"] = 1686772855,
					["realm"] = "Hyjal",
				},
				["Player-3691-0A038194"] = {
					["name"] = "Akincî-Blackhand",
					["guid"] = "Player-3691-0A038194",
					["class"] = "HUNTER",
					["cache_time"] = 1684926332,
					["realm"] = "Blackhand",
				},
				["Player-1084-0A2D63E7"] = {
					["name"] = "Anduinsasimp-TarrenMill",
					["guid"] = "Player-1084-0A2D63E7",
					["class"] = "PRIEST",
					["cache_time"] = 1687157927,
					["realm"] = "TarrenMill",
				},
				["Player-1587-0EC41F92"] = {
					["name"] = "Botini-Nagrand",
					["guid"] = "Player-1587-0EC41F92",
					["class"] = "PRIEST",
					["cache_time"] = 1689001270,
					["realm"] = "Nagrand",
				},
				["Player-580-09EE443F"] = {
					["name"] = "Niored-Blackmoore",
					["guid"] = "Player-580-09EE443F",
					["class"] = "PRIEST",
					["cache_time"] = 1686126505,
					["realm"] = "Blackmoore",
				},
				["Player-1316-094D1CBA"] = {
					["name"] = "Ulquiorra-Nemesis",
					["guid"] = "Player-1316-094D1CBA",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687248521,
					["realm"] = "Nemesis",
				},
				["Player-1379-08EB435C"] = {
					["name"] = "Ingvar-Zul'jin",
					["guid"] = "Player-1379-08EB435C",
					["class"] = "WARLOCK",
					["cache_time"] = 1686754263,
					["realm"] = "Zul'jin",
				},
				["Player-1597-0D7E2AD8"] = {
					["name"] = "Rourbe-Sylvanas",
					["guid"] = "Player-1597-0D7E2AD8",
					["class"] = "WARRIOR",
					["cache_time"] = 1688295537,
					["realm"] = "Sylvanas",
				},
				["Player-1335-0507C506"] = {
					["name"] = "Kéoru-Ysondre",
					["guid"] = "Player-1335-0507C506",
					["class"] = "PRIEST",
					["cache_time"] = 1687949672,
					["realm"] = "Ysondre",
				},
				["Player-3682-0B03A601"] = {
					["ilvl"] = 416.625,
					["guid"] = "Player-3682-0B03A601",
					["class"] = "PALADIN",
					["realm"] = "Ragnaros",
					["role"] = "HEALER",
					["cache_time"] = 1680813097,
					["name"] = "Banaltro-Ragnaros",
					["specID"] = 65,
					["enchanter"] = true,
					["enchantingLvl"] = 82,
					["rank"] = "Mythic Raider",
				},
				["Player-3682-0B1CE45D"] = {
					["name"] = "Pleading-Ragnaros",
					["guid"] = "Player-3682-0B1CE45D",
					["class"] = "EVOKER",
					["cache_time"] = 1684590154,
					["realm"] = "Ragnaros",
				},
				["Player-1928-0E643539"] = {
					["name"] = "тембертиг-Седогрив",
					["guid"] = "Player-1928-0E643539",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1684207643,
					["realm"] = "Седогрив",
				},
				["Player-3690-0B15AFBF"] = {
					["name"] = "Soyon-KhazModan",
					["guid"] = "Player-3690-0B15AFBF",
					["class"] = "EVOKER",
					["cache_time"] = 1676330216,
					["realm"] = "KhazModan",
				},
				["Player-3691-0719B9F1"] = {
					["name"] = "Nathaena-Blackhand",
					["guid"] = "Player-3691-0719B9F1",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676201349,
					["realm"] = "Blackhand",
				},
				["Player-1604-0F2A39AA"] = {
					["name"] = "быканнутый-СвежевательДуш",
					["guid"] = "Player-1604-0F2A39AA",
					["class"] = "DRUID",
					["cache_time"] = 1688866939,
					["realm"] = "СвежевательДуш",
				},
				["Player-1305-0C84876A"] = {
					["name"] = "Palaster-Kazzak",
					["guid"] = "Player-1305-0C84876A",
					["class"] = "PALADIN",
					["cache_time"] = 1687955030,
					["realm"] = "Kazzak",
				},
				["Player-3674-0B1D5AF9"] = {
					["name"] = "Kraanpastei-TwistingNether",
					["guid"] = "Player-3674-0B1D5AF9",
					["class"] = "MONK",
					["cache_time"] = 1686935978,
					["realm"] = "TwistingNether",
				},
				["Player-1615-0A61833E"] = {
					["name"] = "наэки-Ревущийфьорд",
					["guid"] = "Player-1615-0A61833E",
					["class"] = "WARRIOR",
					["cache_time"] = 1687791012,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1084-0A9CD615"] = {
					["name"] = "Sikyyferal-TarrenMill",
					["guid"] = "Player-1084-0A9CD615",
					["class"] = "EVOKER",
					["cache_time"] = 1687955400,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0C29064C"] = {
					["name"] = "Titanïa-Kazzak",
					["guid"] = "Player-1305-0C29064C",
					["class"] = "WARRIOR",
					["cache_time"] = 1688985357,
					["realm"] = "Kazzak",
				},
				["Player-3713-0A98B5B1"] = {
					["name"] = "Shavi-BurningLegion",
					["guid"] = "Player-3713-0A98B5B1",
					["class"] = "MONK",
					["cache_time"] = 1686047947,
					["realm"] = "BurningLegion",
				},
				["Player-3682-0AA536E8"] = {
					["name"] = "Oneglobal-Ragnaros",
					["guid"] = "Player-3682-0AA536E8",
					["class"] = "DRUID",
					["cache_time"] = 1678064508,
					["realm"] = "Ragnaros",
				},
				["Player-1305-08D84DA2"] = {
					["name"] = "Kaizokuoprst-Kazzak",
					["guid"] = "Player-1305-08D84DA2",
					["class"] = "PRIEST",
					["cache_time"] = 1687949172,
					["realm"] = "Kazzak",
				},
				["Player-1615-0B0B6E52"] = {
					["name"] = "окейдуд-Ревущийфьорд",
					["guid"] = "Player-1615-0B0B6E52",
					["class"] = "MAGE",
					["cache_time"] = 1687791302,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1329-09D666B4"] = {
					["name"] = "Kanexs-Ravencrest",
					["guid"] = "Player-1329-09D666B4",
					["class"] = "ROGUE",
					["cache_time"] = 1689259343,
					["realm"] = "Ravencrest",
				},
				["Player-1403-0992C7CB"] = {
					["name"] = "Roastbeff-Draenor",
					["guid"] = "Player-1403-0992C7CB",
					["class"] = "DRUID",
					["cache_time"] = 1680275084,
					["realm"] = "Draenor",
				},
				["Player-3674-0B0D28D3"] = {
					["name"] = "Thañatøs-TwistingNether",
					["guid"] = "Player-3674-0B0D28D3",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1683073733,
					["realm"] = "TwistingNether",
				},
				["Player-1307-062DCCCA"] = {
					["name"] = "Bangrim-ChamberofAspects",
					["guid"] = "Player-1307-062DCCCA",
					["class"] = "WARRIOR",
					["cache_time"] = 1676806970,
					["realm"] = "ChamberofAspects",
				},
				["Player-1329-07017853"] = {
					["name"] = "Afashop-Ravencrest",
					["guid"] = "Player-1329-07017853",
					["class"] = "PRIEST",
					["cache_time"] = 1687248521,
					["realm"] = "Ravencrest",
				},
				["Player-1624-0B21CC5C"] = {
					["name"] = "Teia-Illidan",
					["guid"] = "Player-1624-0B21CC5C",
					["class"] = "WARRIOR",
					["cache_time"] = 1685780231,
					["realm"] = "Illidan",
				},
				["Player-1615-0B2402CA"] = {
					["name"] = "лиингам-Ревущийфьорд",
					["guid"] = "Player-1615-0B2402CA",
					["class"] = "DRUID",
					["cache_time"] = 1689261945,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1615-0B227E9C"] = {
					["name"] = "паживойфлекс-Ревущийфьорд",
					["guid"] = "Player-1615-0B227E9C",
					["class"] = "PALADIN",
					["cache_time"] = 1685751153,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1084-09932012"] = {
					["name"] = "Burkan-TarrenMill",
					["guid"] = "Player-1084-09932012",
					["class"] = "WARLOCK",
					["cache_time"] = 1676439591,
					["realm"] = "TarrenMill",
				},
				["Player-1615-0AE3CE4E"] = {
					["name"] = "ариле-Ревущийфьорд",
					["guid"] = "Player-1615-0AE3CE4E",
					["class"] = "PRIEST",
					["cache_time"] = 1677392792,
					["realm"] = "Ревущийфьорд",
				},
				["Player-580-046B9C68"] = {
					["name"] = "Hógen-Blackmoore",
					["guid"] = "Player-580-046B9C68",
					["class"] = "WARRIOR",
					["cache_time"] = 1687298820,
					["realm"] = "Blackmoore",
				},
				["Player-1316-0497005A"] = {
					["ilvl"] = 434.625,
					["guid"] = "Player-1316-0497005A",
					["class"] = "SHAMAN",
					["rank"] = "Social",
					["role"] = "HEALER",
					["cache_time"] = 1687949444,
					["name"] = "Restregone-Nemesis",
					["enchanter"] = true,
					["specID"] = 264,
					["enchantingLvl"] = 98,
					["realm"] = "Nemesis",
				},
				["Player-1305-0C02D470"] = {
					["name"] = "Scrumptlous-Kazzak",
					["guid"] = "Player-1305-0C02D470",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1680388235,
					["realm"] = "Kazzak",
				},
				["Player-581-08E406E3"] = {
					["name"] = "Joghurtladen-Blackrock",
					["guid"] = "Player-581-08E406E3",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687949013,
					["realm"] = "Blackrock",
				},
				["Player-3656-08A88408"] = {
					["name"] = "Laizkiz-Stormreaver",
					["guid"] = "Player-3656-08A88408",
					["class"] = "PALADIN",
					["cache_time"] = 1684413259,
					["realm"] = "Stormreaver",
				},
				["Player-580-0A7024EA"] = {
					["name"] = "Hovérup-Blackmoore",
					["guid"] = "Player-580-0A7024EA",
					["class"] = "EVOKER",
					["cache_time"] = 1687791302,
					["realm"] = "Blackmoore",
				},
				["Player-1602-0F594037"] = {
					["name"] = "дайвердаун-Гордунни",
					["guid"] = "Player-1602-0F594037",
					["class"] = "MONK",
					["cache_time"] = 1688878042,
					["realm"] = "Гордунни",
				},
				["Player-1379-0919A988"] = {
					["name"] = "Yaküza-Sanguino",
					["guid"] = "Player-1379-0919A988",
					["class"] = "MONK",
					["cache_time"] = 1679027119,
					["realm"] = "Sanguino",
				},
				["Player-1329-09F67613"] = {
					["name"] = "Tankbrampa-Ravencrest",
					["guid"] = "Player-1329-09F67613",
					["class"] = "WARRIOR",
					["cache_time"] = 1677524161,
					["realm"] = "Ravencrest",
				},
				["Player-1390-0C928DFE"] = {
					["name"] = "Minytonton-Hyjal",
					["guid"] = "Player-1390-0C928DFE",
					["class"] = "HUNTER",
					["cache_time"] = 1689346075,
					["realm"] = "Hyjal",
				},
				["Player-581-086A47F7"] = {
					["name"] = "åshley-Blackrock",
					["guid"] = "Player-581-086A47F7",
					["class"] = "DRUID",
					["cache_time"] = 1686196330,
					["realm"] = "Blackrock",
				},
				["Player-1325-03C0F771"] = {
					["name"] = "Darkepic-Aggramar",
					["guid"] = "Player-1325-03C0F771",
					["class"] = "HUNTER",
					["cache_time"] = 1689800841,
					["realm"] = "Aggramar",
				},
				["Player-1305-0881A7BF"] = {
					["name"] = "Zoulian-Kazzak",
					["guid"] = "Player-1305-0881A7BF",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677885943,
					["realm"] = "Kazzak",
				},
				["Player-3674-09BFE70D"] = {
					["name"] = "Imbaku-TwistingNether",
					["guid"] = "Player-3674-09BFE70D",
					["class"] = "DRUID",
					["cache_time"] = 1678865303,
					["realm"] = "TwistingNether",
				},
				["Player-2073-09A22D0B"] = {
					["name"] = "Pälsen-Stormscale",
					["guid"] = "Player-2073-09A22D0B",
					["class"] = "DRUID",
					["cache_time"] = 1686983533,
					["realm"] = "Stormscale",
				},
				["Player-1329-09F7CE0D"] = {
					["name"] = "Hasagi-Ravencrest",
					["guid"] = "Player-1329-09F7CE0D",
					["class"] = "MONK",
					["cache_time"] = 1676165355,
					["realm"] = "Ravencrest",
				},
				["Player-1390-0742FAA4"] = {
					["name"] = "Solkaren-Hyjal",
					["guid"] = "Player-1390-0742FAA4",
					["class"] = "SHAMAN",
					["cache_time"] = 1689855648,
					["realm"] = "Hyjal",
				},
				["Player-580-06F79C7C"] = {
					["name"] = "Amoranâ-Blackmoore",
					["guid"] = "Player-580-06F79C7C",
					["class"] = "WARLOCK",
					["cache_time"] = 1686769399,
					["realm"] = "Blackmoore",
				},
				["Player-1403-0A57D0E7"] = {
					["name"] = "Penelopex-Draenor",
					["guid"] = "Player-1403-0A57D0E7",
					["class"] = "PRIEST",
					["cache_time"] = 1686696451,
					["realm"] = "Draenor",
				},
				["Player-1602-0F45A2D3"] = {
					["name"] = "хвал-Гордунни",
					["guid"] = "Player-1602-0F45A2D3",
					["class"] = "PALADIN",
					["cache_time"] = 1686035141,
					["realm"] = "Гордунни",
				},
				["Player-1305-0C091D91"] = {
					["name"] = "Heazi-Kazzak",
					["guid"] = "Player-1305-0C091D91",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679426755,
					["realm"] = "Kazzak",
				},
				["Player-1084-0A52C925"] = {
					["name"] = "Fakkami-TarrenMill",
					["guid"] = "Player-1084-0A52C925",
					["class"] = "WARLOCK",
					["cache_time"] = 1676479581,
					["realm"] = "TarrenMill",
				},
				["Player-1096-01D4AEF4"] = {
					["name"] = "Pabby-ScarshieldLegion",
					["guid"] = "Player-1096-01D4AEF4",
					["class"] = "HUNTER",
					["cache_time"] = 1687259258,
					["realm"] = "ScarshieldLegion",
				},
				["Player-1597-0D09B42A"] = {
					["name"] = "Pewsey-Sylvanas",
					["guid"] = "Player-1597-0D09B42A",
					["class"] = "SHAMAN",
					["cache_time"] = 1678411108,
					["realm"] = "Sylvanas",
				},
				["Player-3692-08132E02"] = {
					["name"] = "Jayreischamy-Eredar",
					["guid"] = "Player-3692-08132E02",
					["class"] = "SHAMAN",
					["cache_time"] = 1684502528,
					["realm"] = "Eredar",
				},
				["Player-1396-0ADCB20F"] = {
					["name"] = "Mifunesanjur-Quel'Thalas",
					["guid"] = "Player-1396-0ADCB20F",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1686121310,
					["realm"] = "Quel'Thalas",
				},
				["Player-1390-0BEB40F9"] = {
					["name"] = "Tshadow-Hyjal",
					["guid"] = "Player-1390-0BEB40F9",
					["class"] = "WARLOCK",
					["cache_time"] = 1687952836,
					["realm"] = "Hyjal",
				},
				["Player-1329-09E17821"] = {
					["name"] = "Syrra-Ravencrest",
					["guid"] = "Player-1329-09E17821",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685573070,
					["realm"] = "Ravencrest",
				},
				["Player-2074-0590DAF2"] = {
					["name"] = "Raylvana-EmeraldDream",
					["guid"] = "Player-2074-0590DAF2",
					["class"] = "HUNTER",
					["cache_time"] = 1677518150,
					["realm"] = "EmeraldDream",
				},
				["Player-3696-0765196B"] = {
					["name"] = "Gorkaorka-Alexstrasza",
					["guid"] = "Player-3696-0765196B",
					["class"] = "HUNTER",
					["cache_time"] = 1684926332,
					["realm"] = "Alexstrasza",
				},
				["Player-1084-0AA1B26B"] = {
					["name"] = "Vaginessa-TarrenMill",
					["guid"] = "Player-1084-0AA1B26B",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689397951,
					["realm"] = "TarrenMill",
				},
				["Player-3657-0AD0802E"] = {
					["name"] = "Meromay-Bladefist",
					["guid"] = "Player-3657-0AD0802E",
					["class"] = "MONK",
					["cache_time"] = 1687245813,
					["realm"] = "Bladefist",
				},
				["Player-1084-0A9DA3CC"] = {
					["name"] = "Dwafzik-TarrenMill",
					["guid"] = "Player-1084-0A9DA3CC",
					["class"] = "MAGE",
					["cache_time"] = 1690750821,
					["realm"] = "TarrenMill",
				},
				["Player-3691-06209390"] = {
					["name"] = "åsenath-Blackhand",
					["guid"] = "Player-3691-06209390",
					["class"] = "ROGUE",
					["cache_time"] = 1686934454,
					["realm"] = "Blackhand",
				},
				["Player-1302-0C945858"] = {
					["name"] = "Vilytria-Archimonde",
					["guid"] = "Player-1302-0C945858",
					["class"] = "PALADIN",
					["cache_time"] = 1690750821,
					["realm"] = "Archimonde",
				},
				["Player-3702-0A7236DA"] = {
					["name"] = "Palendor-ArgentDawn",
					["guid"] = "Player-3702-0A7236DA",
					["class"] = "PALADIN",
					["cache_time"] = 1677665404,
					["realm"] = "ArgentDawn",
				},
				["Player-3692-09C174CC"] = {
					["name"] = "Himmelsseele-Eredar",
					["guid"] = "Player-3692-09C174CC",
					["class"] = "DRUID",
					["cache_time"] = 1687259300,
					["realm"] = "Eredar",
				},
				["Player-1096-0A5B4088"] = {
					["name"] = "Tarras-DefiasBrotherhood",
					["guid"] = "Player-1096-0A5B4088",
					["class"] = "PALADIN",
					["cache_time"] = 1676783114,
					["realm"] = "DefiasBrotherhood",
				},
				["Player-1597-0D029888"] = {
					["name"] = "Magpiez-Sylvanas",
					["guid"] = "Player-1597-0D029888",
					["class"] = "MAGE",
					["cache_time"] = 1687958136,
					["realm"] = "Sylvanas",
				},
				["Player-3691-09E800B8"] = {
					["name"] = "Drannih-Blackhand",
					["guid"] = "Player-3691-09E800B8",
					["class"] = "EVOKER",
					["cache_time"] = 1684926332,
					["realm"] = "Blackhand",
				},
				["Player-1316-0C8E81D7"] = {
					["name"] = "Bøompleãsure-Nemesis",
					["guid"] = "Player-1316-0C8E81D7",
					["class"] = "PRIEST",
					["cache_time"] = 1687248521,
					["realm"] = "Nemesis",
				},
				["Player-509-0A1D453C"] = {
					["name"] = "Rehezark-Ner'zhul",
					["guid"] = "Player-509-0A1D453C",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1685781186,
					["realm"] = "Ner'zhul",
				},
				["Player-1390-06DC3558"] = {
					["name"] = "Schad-Hyjal",
					["guid"] = "Player-1390-06DC3558",
					["class"] = "DRUID",
					["cache_time"] = 1677607044,
					["realm"] = "Hyjal",
				},
				["Player-1305-0C7934BE"] = {
					["name"] = "Zelenjy-Kazzak",
					["guid"] = "Player-1305-0C7934BE",
					["class"] = "MONK",
					["cache_time"] = 1684502528,
					["realm"] = "Kazzak",
				},
				["Player-580-0A73C828"] = {
					["name"] = "Angstdose-Blackmoore",
					["guid"] = "Player-580-0A73C828",
					["class"] = "PALADIN",
					["cache_time"] = 1684926108,
					["realm"] = "Blackmoore",
				},
				["Player-1305-0BFC2176"] = {
					["name"] = "Cheershot-Kazzak",
					["guid"] = "Player-1305-0BFC2176",
					["class"] = "HUNTER",
					["cache_time"] = 1687949013,
					["realm"] = "Kazzak",
				},
				["Player-1403-0A261BEC"] = {
					["name"] = "Whaytank-Draenor",
					["guid"] = "Player-1403-0A261BEC",
					["class"] = "WARRIOR",
					["cache_time"] = 1677665404,
					["realm"] = "Draenor",
				},
				["Player-1305-0C02A011"] = {
					["name"] = "Coldcuut-Kazzak",
					["guid"] = "Player-1305-0C02A011",
					["class"] = "MAGE",
					["cache_time"] = 1676188831,
					["realm"] = "Kazzak",
				},
				["Player-1301-0C608B5B"] = {
					["name"] = "Fullepixx-Outland",
					["guid"] = "Player-1301-0C608B5B",
					["class"] = "WARRIOR",
					["cache_time"] = 1686037845,
					["realm"] = "Outland",
				},
				["Player-3682-0B025A12"] = {
					["ilvl"] = 409.25,
					["guid"] = "Player-3682-0B025A12",
					["class"] = "PALADIN",
					["role"] = "DAMAGER",
					["cache_time"] = 1686170267,
					["realm"] = "Ragnaros",
					["name"] = "Otplorettv-Ragnaros",
					["specID"] = 70,
					["enchantingLvl"] = 0,
					["rank"] = "Guild Master",
				},
				["Player-1325-09F8A36E"] = {
					["name"] = "Wastra-Hellscream",
					["guid"] = "Player-1325-09F8A36E",
					["class"] = "EVOKER",
					["cache_time"] = 1676170280,
					["realm"] = "Hellscream",
				},
				["Player-1303-0C0546D3"] = {
					["name"] = "Reydemon-Aggra(Português)",
					["guid"] = "Player-1303-0C0546D3",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689853880,
					["realm"] = "Aggra(Português)",
				},
				["Player-2073-0693D5F2"] = {
					["name"] = "Xanaro-Stormscale",
					["guid"] = "Player-2073-0693D5F2",
					["class"] = "WARLOCK",
					["cache_time"] = 1676973948,
					["realm"] = "Stormscale",
				},
				["Player-3391-0C5FD598"] = {
					["name"] = "Dêmonslayer-Silvermoon",
					["guid"] = "Player-3391-0C5FD598",
					["class"] = "WARLOCK",
					["cache_time"] = 1676516463,
					["realm"] = "Silvermoon",
				},
				["Player-580-0A084079"] = {
					["name"] = "Shoyn-Blackmoore",
					["guid"] = "Player-580-0A084079",
					["class"] = "WARLOCK",
					["cache_time"] = 1678233163,
					["realm"] = "Blackmoore",
				},
				["Player-1127-09307AFE"] = {
					["name"] = "Vahéna-KirinTor",
					["guid"] = "Player-1127-09307AFE",
					["class"] = "HUNTER",
					["cache_time"] = 1676372636,
					["realm"] = "KirinTor",
				},
				["Player-1305-0C93D336"] = {
					["role"] = "DAMAGER",
					["name"] = "Rbj-Kazzak",
					["guid"] = "Player-1305-0C93D336",
					["realm"] = "Kazzak",
					["class"] = "HUNTER",
					["cache_time"] = 1687956944,
					["rank"] = "Unguilded",
				},
				["Player-1403-0A2FA03E"] = {
					["name"] = "Hunderri-Draenor",
					["guid"] = "Player-1403-0A2FA03E",
					["class"] = "HUNTER",
					["cache_time"] = 1676387096,
					["realm"] = "Draenor",
				},
				["Player-1329-0A028AAF"] = {
					["name"] = "Pewpewdrake-Ravencrest",
					["guid"] = "Player-1329-0A028AAF",
					["class"] = "EVOKER",
					["cache_time"] = 1689245123,
					["realm"] = "Ravencrest",
				},
				["Player-1305-0C831A40"] = {
					["name"] = "Monsterii-Kazzak",
					["guid"] = "Player-1305-0C831A40",
					["class"] = "WARLOCK",
					["cache_time"] = 1684561507,
					["realm"] = "Kazzak",
				},
				["Player-3690-0A8FD22C"] = {
					["name"] = "Vultix-KhazModan",
					["guid"] = "Player-3690-0A8FD22C",
					["class"] = "ROGUE",
					["cache_time"] = 1685751153,
					["realm"] = "KhazModan",
				},
				["Player-1390-0C88F594"] = {
					["name"] = "Rëpùrgãteur-Hyjal",
					["guid"] = "Player-1390-0C88F594",
					["class"] = "PALADIN",
					["cache_time"] = 1689346075,
					["realm"] = "Hyjal",
				},
				["Player-1602-0AF7EF79"] = {
					["name"] = "стелогрив-Гордунни",
					["guid"] = "Player-1602-0AF7EF79",
					["class"] = "HUNTER",
					["cache_time"] = 1686971553,
					["realm"] = "Гордунни",
				},
				["Player-3691-050C3777"] = {
					["name"] = "Rúdi-Blackhand",
					["guid"] = "Player-3691-050C3777",
					["class"] = "DRUID",
					["cache_time"] = 1686988340,
					["realm"] = "Blackhand",
				},
				["Player-1379-030F2A31"] = {
					["name"] = "Primitivix-Zul'jin",
					["guid"] = "Player-1379-030F2A31",
					["class"] = "PALADIN",
					["cache_time"] = 1685745517,
					["realm"] = "Zul'jin",
				},
				["Player-1329-052CADD1"] = {
					["name"] = "Athanasius-Ravencrest",
					["guid"] = "Player-1329-052CADD1",
					["class"] = "DRUID",
					["cache_time"] = 1685872694,
					["realm"] = "Ravencrest",
				},
				["Player-1621-055E5FDE"] = {
					["name"] = "Avøne-Dalaran",
					["guid"] = "Player-1621-055E5FDE",
					["class"] = "SHAMAN",
					["cache_time"] = 1687041442,
					["realm"] = "Dalaran",
				},
				["Player-1329-097E0E51"] = {
					["name"] = "Illidrious-Ravencrest",
					["guid"] = "Player-1329-097E0E51",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687257934,
					["realm"] = "Ravencrest",
				},
				["Player-1403-0A553F12"] = {
					["name"] = "Tamii-Draenor",
					["guid"] = "Player-1403-0A553F12",
					["class"] = "ROGUE",
					["cache_time"] = 1678536389,
					["realm"] = "Draenor",
				},
				["Player-1403-0A1D9A57"] = {
					["name"] = "Knæbind-Draenor",
					["guid"] = "Player-1403-0A1D9A57",
					["class"] = "PALADIN",
					["cache_time"] = 1684573666,
					["realm"] = "Draenor",
				},
				["Player-1390-0C8714E7"] = {
					["name"] = "Falaxo-Hyjal",
					["guid"] = "Player-1390-0C8714E7",
					["class"] = "SHAMAN",
					["cache_time"] = 1684235960,
					["realm"] = "Hyjal",
				},
				["Player-1302-0C8EAD97"] = {
					["name"] = "Wzaka-Archimonde",
					["guid"] = "Player-1302-0C8EAD97",
					["class"] = "EVOKER",
					["cache_time"] = 1687261056,
					["realm"] = "Archimonde",
				},
				["Player-1929-0E44602D"] = {
					["name"] = "квестер-ПиратскаяБухта",
					["guid"] = "Player-1929-0E44602D",
					["class"] = "PALADIN",
					["cache_time"] = 1685745460,
					["realm"] = "ПиратскаяБухта",
				},
				["Player-3674-0B1D4BE8"] = {
					["name"] = "Demorc-TwistingNether",
					["guid"] = "Player-3674-0B1D4BE8",
					["class"] = "ROGUE",
					["cache_time"] = 1679963788,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0B1ED41F"] = {
					["name"] = "Curlide-TwistingNether",
					["guid"] = "Player-3674-0B1ED41F",
					["class"] = "WARRIOR",
					["cache_time"] = 1688993030,
					["realm"] = "TwistingNether",
				},
				["Player-3702-08DA2219"] = {
					["name"] = "Kiha-ArgentDawn",
					["guid"] = "Player-3702-08DA2219",
					["class"] = "WARRIOR",
					["cache_time"] = 1687006559,
					["realm"] = "ArgentDawn",
				},
				["Player-1305-0C520500"] = {
					["name"] = "Toxiicdemon-Kazzak",
					["guid"] = "Player-1305-0C520500",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679861251,
					["realm"] = "Kazzak",
				},
				["Player-1084-0A8F9558"] = {
					["name"] = "Zóya-TarrenMill",
					["guid"] = "Player-1084-0A8F9558",
					["class"] = "WARLOCK",
					["cache_time"] = 1676387096,
					["realm"] = "TarrenMill",
				},
				["Player-3674-0B10B5BC"] = {
					["name"] = "Kishidan-TwistingNether",
					["guid"] = "Player-3674-0B10B5BC",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1683963823,
					["realm"] = "TwistingNether",
				},
				["Player-1624-056BC846"] = {
					["name"] = "Eltharyon-Illidan",
					["guid"] = "Player-1624-056BC846",
					["class"] = "PALADIN",
					["cache_time"] = 1676799710,
					["realm"] = "Illidan",
				},
				["Player-1403-0A563697"] = {
					["name"] = "Bloodmonéy-Draenor",
					["guid"] = "Player-1403-0A563697",
					["class"] = "WARRIOR",
					["cache_time"] = 1680416854,
					["realm"] = "Draenor",
				},
				["Player-3691-09D3ED6C"] = {
					["name"] = "Reddáwn-Blackhand",
					["guid"] = "Player-3691-09D3ED6C",
					["class"] = "PALADIN",
					["cache_time"] = 1684926332,
					["realm"] = "Blackhand",
				},
				["Player-1403-09D770C3"] = {
					["name"] = "Starnter-Draenor",
					["guid"] = "Player-1403-09D770C3",
					["class"] = "HUNTER",
					["cache_time"] = 1676516463,
					["realm"] = "Draenor",
				},
				["Player-580-04AB32C1"] = {
					["name"] = "Grigórij-Blackmoore",
					["guid"] = "Player-580-04AB32C1",
					["class"] = "WARLOCK",
					["cache_time"] = 1676988297,
					["realm"] = "Blackmoore",
				},
				["Player-3686-0A03847B"] = {
					["name"] = "Maoami-Antonidas",
					["guid"] = "Player-3686-0A03847B",
					["class"] = "PALADIN",
					["cache_time"] = 1687259300,
					["realm"] = "Antonidas",
				},
				["Player-1403-0A4D9729"] = {
					["name"] = "Chronio-Draenor",
					["guid"] = "Player-1403-0A4D9729",
					["class"] = "EVOKER",
					["cache_time"] = 1687248139,
					["realm"] = "Draenor",
				},
				["Player-1390-0C938B9C"] = {
					["name"] = "Elpheim-Hyjal",
					["guid"] = "Player-1390-0C938B9C",
					["class"] = "HUNTER",
					["cache_time"] = 1689772053,
					["realm"] = "Hyjal",
				},
				["Player-1615-0B24EA89"] = {
					["name"] = "сфериель-Ревущийфьорд",
					["guid"] = "Player-1615-0B24EA89",
					["class"] = "PRIEST",
					["cache_time"] = 1684481197,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1127-09755ACD"] = {
					["name"] = "ölwu-LaCroisadeécarlate",
					["guid"] = "Player-1127-09755ACD",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1688927498,
					["realm"] = "LaCroisadeécarlate",
				},
				["Player-1104-0A2E6840"] = {
					["name"] = "Thamantis-Gul'dan",
					["guid"] = "Player-1104-0A2E6840",
					["class"] = "MAGE",
					["cache_time"] = 1686754263,
					["realm"] = "Gul'dan",
				},
				["Player-3682-0B09B14B"] = {
					["name"] = "Angale-Ragnaros",
					["guid"] = "Player-3682-0B09B14B",
					["class"] = "EVOKER",
					["cache_time"] = 1687956943,
					["realm"] = "Ragnaros",
				},
				["Player-1602-0F5EF797"] = {
					["name"] = "хилюзай-Гордунни",
					["guid"] = "Player-1602-0F5EF797",
					["class"] = "SHAMAN",
					["cache_time"] = 1685858759,
					["realm"] = "Гордунни",
				},
				["Player-1403-09907F8F"] = {
					["name"] = "Blighra-Draenor",
					["guid"] = "Player-1403-09907F8F",
					["class"] = "SHAMAN",
					["cache_time"] = 1680646233,
					["realm"] = "Draenor",
				},
				["Player-3686-05E38088"] = {
					["name"] = "Brechthilde-Antonidas",
					["guid"] = "Player-3686-05E38088",
					["class"] = "HUNTER",
					["cache_time"] = 1686933987,
					["realm"] = "Antonidas",
				},
				["Player-1335-09E805C0"] = {
					["name"] = "Mostrasza-Ysondre",
					["guid"] = "Player-1335-09E805C0",
					["class"] = "EVOKER",
					["cache_time"] = 1685781164,
					["realm"] = "Ysondre",
				},
				["Player-3702-09C22E16"] = {
					["name"] = "Tordrale-ArgentDawn",
					["guid"] = "Player-3702-09C22E16",
					["class"] = "DRUID",
					["cache_time"] = 1690510866,
					["realm"] = "ArgentDawn",
				},
				["Player-1390-0C7CFB8D"] = {
					["name"] = "Winghost-Hyjal",
					["guid"] = "Player-1390-0C7CFB8D",
					["class"] = "WARRIOR",
					["cache_time"] = 1676169646,
					["realm"] = "Hyjal",
				},
				["Player-3674-0AED5EB3"] = {
					["name"] = "Addalici-TwistingNether",
					["guid"] = "Player-3674-0AED5EB3",
					["class"] = "SHAMAN",
					["cache_time"] = 1690410513,
					["realm"] = "TwistingNether",
				},
				["Player-1305-087AA155"] = {
					["name"] = "Kushina-Kazzak",
					["guid"] = "Player-1305-087AA155",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686934454,
					["realm"] = "Kazzak",
				},
				["Player-1316-0C547B0D"] = {
					["name"] = "Shevana-Nemesis",
					["guid"] = "Player-1316-0C547B0D",
					["class"] = "EVOKER",
					["cache_time"] = 1687952836,
					["realm"] = "Nemesis",
				},
				["Player-1325-0A07A9D2"] = {
					["name"] = "Elderbeast-Aggramar",
					["guid"] = "Player-1325-0A07A9D2",
					["class"] = "HUNTER",
					["cache_time"] = 1689800841,
					["realm"] = "Aggramar",
				},
				["Player-3674-0B0D49F0"] = {
					["name"] = "Beatric-TwistingNether",
					["guid"] = "Player-3674-0B0D49F0",
					["class"] = "EVOKER",
					["cache_time"] = 1677607191,
					["realm"] = "TwistingNether",
				},
				["Player-3391-0C61E24A"] = {
					["name"] = "Borryusa-Silvermoon",
					["guid"] = "Player-3391-0C61E24A",
					["class"] = "EVOKER",
					["cache_time"] = 1686934454,
					["realm"] = "Silvermoon",
				},
				["Player-1379-07C085B3"] = {
					["name"] = "Vunlak-Sanguino",
					["guid"] = "Player-1379-07C085B3",
					["class"] = "DRUID",
					["cache_time"] = 1687949172,
					["realm"] = "Sanguino",
				},
				["Player-3657-0A968AF9"] = {
					["name"] = "Dampovnen-Frostwhisper",
					["guid"] = "Player-3657-0A968AF9",
					["class"] = "MONK",
					["cache_time"] = 1677253640,
					["realm"] = "Frostwhisper",
				},
				["Player-1325-03FC8BBF"] = {
					["name"] = "Elldritch-Hellscream",
					["guid"] = "Player-1325-03FC8BBF",
					["class"] = "PALADIN",
					["cache_time"] = 1687949672,
					["realm"] = "Hellscream",
				},
				["Player-3674-0B1A3617"] = {
					["name"] = "Wheelupthebl-TwistingNether",
					["guid"] = "Player-3674-0B1A3617",
					["class"] = "PRIEST",
					["cache_time"] = 1677607191,
					["realm"] = "TwistingNether",
				},
				["Player-3681-07F449E5"] = {
					["name"] = "Glassildur-Magtheridon",
					["guid"] = "Player-3681-07F449E5",
					["class"] = "PALADIN",
					["cache_time"] = 1677879103,
					["realm"] = "Magtheridon",
				},
				["Player-1604-0F3DE26A"] = {
					["name"] = "аксвойд-СвежевательДуш",
					["guid"] = "Player-1604-0F3DE26A",
					["class"] = "WARLOCK",
					["cache_time"] = 1684235960,
					["realm"] = "СвежевательДуш",
				},
				["Player-1335-05929113"] = {
					["name"] = "Zoxar-Ysondre",
					["guid"] = "Player-1335-05929113",
					["class"] = "MONK",
					["cache_time"] = 1680112361,
					["realm"] = "Ysondre",
				},
				["Player-1329-09D16ACB"] = {
					["name"] = "Tìtan-Ravencrest",
					["guid"] = "Player-1329-09D16ACB",
					["class"] = "PALADIN",
					["cache_time"] = 1676479581,
					["realm"] = "Ravencrest",
				},
				["Player-1305-0C760CF9"] = {
					["name"] = "Palamix-Kazzak",
					["guid"] = "Player-1305-0C760CF9",
					["class"] = "PALADIN",
					["cache_time"] = 1679997750,
					["realm"] = "Kazzak",
				},
				["Player-3391-0C54E76C"] = {
					["name"] = "Malferious-Silvermoon",
					["guid"] = "Player-3391-0C54E76C",
					["class"] = "DRUID",
					["cache_time"] = 1679419392,
					["realm"] = "Silvermoon",
				},
				["Player-3674-07E0511E"] = {
					["name"] = "Odlidrus-TwistingNether",
					["guid"] = "Player-3674-07E0511E",
					["class"] = "PALADIN",
					["cache_time"] = 1687041442,
					["realm"] = "TwistingNether",
				},
				["Player-1929-0E5FEE22"] = {
					["name"] = "такмор-ПиратскаяБухта",
					["guid"] = "Player-1929-0E5FEE22",
					["class"] = "PALADIN",
					["cache_time"] = 1686985298,
					["realm"] = "ПиратскаяБухта",
				},
				["Player-1379-079F03EA"] = {
					["name"] = "Quoperz-Sanguino",
					["guid"] = "Player-1379-079F03EA",
					["class"] = "SHAMAN",
					["cache_time"] = 1677665404,
					["realm"] = "Sanguino",
				},
				["Player-1305-0512B06B"] = {
					["name"] = "Braincow-Kazzak",
					["guid"] = "Player-1305-0512B06B",
					["class"] = "DRUID",
					["cache_time"] = 1676479581,
					["realm"] = "Kazzak",
				},
				["Player-633-0ADC9888"] = {
					["name"] = "Knumig-ShatteredHand",
					["guid"] = "Player-633-0ADC9888",
					["class"] = "WARRIOR",
					["cache_time"] = 1676169646,
					["realm"] = "ShatteredHand",
				},
				["Player-3666-07C8FB83"] = {
					["name"] = "Strago-Shadowsong",
					["guid"] = "Player-3666-07C8FB83",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687949172,
					["realm"] = "Shadowsong",
				},
				["Player-581-0A5EEC98"] = {
					["name"] = "Translucent-Blackrock",
					["guid"] = "Player-581-0A5EEC98",
					["class"] = "PRIEST",
					["cache_time"] = 1686935978,
					["realm"] = "Blackrock",
				},
				["Player-1403-0A6A5C44"] = {
					["name"] = "Azarekh-Draenor",
					["guid"] = "Player-1403-0A6A5C44",
					["class"] = "WARRIOR",
					["cache_time"] = 1687949013,
					["realm"] = "Draenor",
				},
				["Player-3686-0662EF04"] = {
					["name"] = "Bratrel-Antonidas",
					["guid"] = "Player-3686-0662EF04",
					["class"] = "PALADIN",
					["cache_time"] = 1676976224,
					["realm"] = "Antonidas",
				},
				["Player-1305-0C800179"] = {
					["name"] = "Mahejdi-Kazzak",
					["guid"] = "Player-1305-0C800179",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687791012,
					["realm"] = "Kazzak",
				},
				["Player-1379-054CD187"] = {
					["name"] = "Eathordk-Sanguino",
					["guid"] = "Player-1379-054CD187",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678860427,
					["realm"] = "Sanguino",
				},
				["Player-3682-08D0CBD2"] = {
					["ilvl"] = 436.6875,
					["guid"] = "Player-3682-08D0CBD2",
					["class"] = "PRIEST",
					["rank"] = "Alt",
					["role"] = "DAMAGER",
					["cache_time"] = 1686165996,
					["name"] = "Mylkme-Ragnaros",
					["enchanter"] = true,
					["specID"] = 258,
					["enchantingLvl"] = 51,
					["realm"] = "Ragnaros",
				},
				["Player-1329-0419295C"] = {
					["name"] = "Valdrion-Ravencrest",
					["guid"] = "Player-1329-0419295C",
					["class"] = "PALADIN",
					["cache_time"] = 1688295537,
					["realm"] = "Ravencrest",
				},
				["Player-1623-0A9AA869"] = {
					["name"] = "белоусов-Дракономор",
					["guid"] = "Player-1623-0A9AA869",
					["class"] = "SHAMAN",
					["cache_time"] = 1685437969,
					["realm"] = "Дракономор",
				},
				["Player-3691-064C321A"] = {
					["name"] = "Dämoschlitz-Blackhand",
					["guid"] = "Player-3691-064C321A",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686121310,
					["realm"] = "Blackhand",
				},
				["Player-1305-0C365146"] = {
					["name"] = "Nuelchan-Kazzak",
					["guid"] = "Player-1305-0C365146",
					["class"] = "HUNTER",
					["cache_time"] = 1687954070,
					["realm"] = "Kazzak",
				},
				["Player-1604-0EC9B2C7"] = {
					["name"] = "джиэл-СвежевательДуш",
					["guid"] = "Player-1604-0EC9B2C7",
					["class"] = "SHAMAN",
					["cache_time"] = 1675869114,
					["realm"] = "СвежевательДуш",
				},
				["Player-1403-0A089F59"] = {
					["name"] = "Jøkér-Draenor",
					["guid"] = "Player-1403-0A089F59",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684501707,
					["realm"] = "Draenor",
				},
				["Player-3391-086EA3AF"] = {
					["name"] = "Elhesia-Silvermoon",
					["guid"] = "Player-3391-086EA3AF",
					["class"] = "DRUID",
					["cache_time"] = 1687298820,
					["realm"] = "Silvermoon",
				},
				["Player-1403-05A6F28E"] = {
					["name"] = "Fandensjølv-Draenor",
					["guid"] = "Player-1403-05A6F28E",
					["class"] = "PALADIN",
					["cache_time"] = 1687157927,
					["realm"] = "Draenor",
				},
				["Player-1329-09DB39A1"] = {
					["name"] = "Blueyed-Ravencrest",
					["guid"] = "Player-1329-09DB39A1",
					["class"] = "MAGE",
					["cache_time"] = 1686933987,
					["realm"] = "Ravencrest",
				},
				["Player-1602-0A5764ED"] = {
					["name"] = "еллизаздрра-Гордунни",
					["guid"] = "Player-1602-0A5764ED",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685858759,
					["realm"] = "Гордунни",
				},
				["Player-1127-0A70A4E7"] = {
					["name"] = "Adna-ConfrérieduThorium",
					["guid"] = "Player-1127-0A70A4E7",
					["class"] = "PALADIN",
					["cache_time"] = 1687298820,
					["realm"] = "ConfrérieduThorium",
				},
				["Player-1335-09E8FDBE"] = {
					["name"] = "Drackhorn-Ysondre",
					["guid"] = "Player-1335-09E8FDBE",
					["class"] = "EVOKER",
					["cache_time"] = 1675869174,
					["realm"] = "Ysondre",
				},
				["Player-1378-0AD5981A"] = {
					["ilvl"] = 439.75,
					["guid"] = "Player-1378-0AD5981A",
					["class"] = "DEMONHUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1685488946,
					["realm"] = "DunModr",
					["name"] = "Mortha-DunModr",
					["specID"] = 577,
					["enchantingLvl"] = 0,
					["rank"] = "Oficial",
				},
				["Player-3682-0AF6EC75"] = {
					["name"] = "Samysk-Ragnaros",
					["guid"] = "Player-3682-0AF6EC75",
					["class"] = "DRUID",
					["cache_time"] = 1676814556,
					["realm"] = "Ragnaros",
				},
				["Player-3713-0AB9ED7F"] = {
					["name"] = "Asterdk-BurningLegion",
					["guid"] = "Player-3713-0AB9ED7F",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1677077290,
					["realm"] = "BurningLegion",
				},
				["Player-1127-099C0190"] = {
					["name"] = "Panamros-KirinTor",
					["guid"] = "Player-1127-099C0190",
					["class"] = "HUNTER",
					["cache_time"] = 1685997004,
					["realm"] = "KirinTor",
				},
				["Player-1335-09FBC440"] = {
					["name"] = "Twolip-Ysondre",
					["guid"] = "Player-1335-09FBC440",
					["class"] = "WARLOCK",
					["cache_time"] = 1687131682,
					["realm"] = "Ysondre",
				},
				["Player-3674-0AA86D60"] = {
					["name"] = "Qcr-TwistingNether",
					["guid"] = "Player-3674-0AA86D60",
					["class"] = "PALADIN",
					["cache_time"] = 1687248521,
					["realm"] = "TwistingNether",
				},
				["Player-1615-0AFB5C51"] = {
					["name"] = "ерликх-Ревущийфьорд",
					["guid"] = "Player-1615-0AFB5C51",
					["class"] = "HUNTER",
					["cache_time"] = 1686754263,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3681-07503D44"] = {
					["name"] = "Restoo-Magtheridon",
					["guid"] = "Player-3681-07503D44",
					["class"] = "DRUID",
					["cache_time"] = 1677518150,
					["realm"] = "Magtheridon",
				},
				["Player-1403-0A244158"] = {
					["name"] = "Healstone-Draenor",
					["guid"] = "Player-1403-0A244158",
					["class"] = "SHAMAN",
					["cache_time"] = 1684277685,
					["realm"] = "Draenor",
				},
				["Player-3682-0821C83F"] = {
					["ilvl"] = 403.75,
					["guid"] = "Player-3682-0821C83F",
					["class"] = "PRIEST",
					["role"] = "HEALER",
					["cache_time"] = 1677101991,
					["realm"] = "Ragnaros",
					["name"] = "Greituke-Ragnaros",
					["specID"] = 256,
					["enchantingLvl"] = 0,
					["rank"] = "Alt",
				},
				["Player-3674-0902FA6E"] = {
					["name"] = "Indix-TwistingNether",
					["guid"] = "Player-3674-0902FA6E",
					["class"] = "PALADIN",
					["cache_time"] = 1686933987,
					["realm"] = "TwistingNether",
				},
				["Player-1615-0AF0052D"] = {
					["name"] = "николетка-Ревущийфьорд",
					["guid"] = "Player-1615-0AF0052D",
					["class"] = "SHAMAN",
					["cache_time"] = 1676957174,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1305-0C1CD47D"] = {
					["name"] = "Cllaaw-Kazzak",
					["guid"] = "Player-1305-0C1CD47D",
					["class"] = "HUNTER",
					["cache_time"] = 1687157932,
					["realm"] = "Kazzak",
				},
				["Player-1379-0ABC46B0"] = {
					["ilvl"] = 399.875,
					["guid"] = "Player-1379-0ABC46B0",
					["class"] = "MAGE",
					["role"] = "DAMAGER",
					["cache_time"] = 1676958063,
					["rank"] = "Raider",
					["name"] = "Atryx-Sanguino",
					["specID"] = 64,
					["enchantingLvl"] = 0,
					["realm"] = "Sanguino",
				},
				["Player-3682-0AE8B7FF"] = {
					["ilvl"] = 444.1875,
					["guid"] = "Player-3682-0AE8B7FF",
					["class"] = "MAGE",
					["role"] = "DAMAGER",
					["cache_time"] = 1688418037,
					["realm"] = "Ragnaros",
					["name"] = "Djsmurkioqtx-Ragnaros",
					["specID"] = 63,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1390-0AE4C87D"] = {
					["name"] = "Zïwak-Hyjal",
					["guid"] = "Player-1390-0AE4C87D",
					["class"] = "PALADIN",
					["cache_time"] = 1687041442,
					["realm"] = "Hyjal",
				},
				["Player-1084-0A6FD916"] = {
					["name"] = "Kitiandra-TarrenMill",
					["guid"] = "Player-1084-0A6FD916",
					["class"] = "DRUID",
					["cache_time"] = 1676206086,
					["realm"] = "TarrenMill",
				},
				["Player-1084-082DF7A6"] = {
					["name"] = "Tuskboom-TarrenMill",
					["guid"] = "Player-1084-082DF7A6",
					["class"] = "DRUID",
					["cache_time"] = 1676765465,
					["realm"] = "TarrenMill",
				},
				["Player-3391-0C38E0C4"] = {
					["name"] = "Coffeeinside-Silvermoon",
					["guid"] = "Player-3391-0C38E0C4",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684221806,
					["realm"] = "Silvermoon",
				},
				["Player-3691-09E58712"] = {
					["name"] = "Yinna-Blackhand",
					["guid"] = "Player-3691-09E58712",
					["class"] = "SHAMAN",
					["cache_time"] = 1676208606,
					["realm"] = "Blackhand",
				},
				["Player-1329-09EDBAAE"] = {
					["name"] = "Chocolina-Ravencrest",
					["guid"] = "Player-1329-09EDBAAE",
					["class"] = "PALADIN",
					["cache_time"] = 1684877955,
					["realm"] = "Ravencrest",
				},
				["Player-1122-04B8ABA3"] = {
					["name"] = "Ulticre-Drek'Thar",
					["guid"] = "Player-1122-04B8ABA3",
					["class"] = "PRIEST",
					["cache_time"] = 1676372636,
					["realm"] = "Drek'Thar",
				},
				["Player-1121-04B021BC"] = {
					["name"] = "Quelly-DasSyndikat",
					["guid"] = "Player-1121-04B021BC",
					["class"] = "PALADIN",
					["cache_time"] = 1676973948,
					["realm"] = "DasSyndikat",
				},
				["Player-3674-0AF8F5A7"] = {
					["ilvl"] = 426.375,
					["guid"] = "Player-3674-0AF8F5A7",
					["class"] = "SHAMAN",
					["role"] = "DAMAGER",
					["cache_time"] = 1684235960,
					["rank"] = "Raider",
					["name"] = "Duriann-TwistingNether",
					["specID"] = 263,
					["enchantingLvl"] = 0,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0C6436AD"] = {
					["name"] = "Xoraa-Kazzak",
					["guid"] = "Player-1305-0C6436AD",
					["class"] = "DRUID",
					["cache_time"] = 1677339563,
					["realm"] = "Kazzak",
				},
				["Player-3657-0ABCF53F"] = {
					["name"] = "Ruipelo-Frostwhisper",
					["guid"] = "Player-3657-0ABCF53F",
					["class"] = "DRUID",
					["cache_time"] = 1678894799,
					["realm"] = "Frostwhisper",
				},
				["Player-1305-0C92A9D7"] = {
					["name"] = "Lèbonk-Kazzak",
					["guid"] = "Player-1305-0C92A9D7",
					["class"] = "MONK",
					["cache_time"] = 1689253178,
					["realm"] = "Kazzak",
				},
				["Player-3691-099C70CE"] = {
					["name"] = "Suppay-Blackhand",
					["guid"] = "Player-3691-099C70CE",
					["class"] = "WARLOCK",
					["cache_time"] = 1687298820,
					["realm"] = "Blackhand",
				},
				["Player-1416-09C1B9FD"] = {
					["name"] = "Arrk-AeriePeak",
					["guid"] = "Player-1416-09C1B9FD",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1679997750,
					["realm"] = "AeriePeak",
				},
				["Player-1305-0C52FC1B"] = {
					["name"] = "Kanro-Kazzak",
					["guid"] = "Player-1305-0C52FC1B",
					["class"] = "EVOKER",
					["cache_time"] = 1689290162,
					["realm"] = "Kazzak",
				},
				["Player-1390-08307179"] = {
					["name"] = "Sourama-Hyjal",
					["guid"] = "Player-1390-08307179",
					["class"] = "MONK",
					["cache_time"] = 1677073065,
					["realm"] = "Hyjal",
				},
				["Player-1305-0C628E35"] = {
					["name"] = "Xiuhipo-Kazzak",
					["guid"] = "Player-1305-0C628E35",
					["class"] = "MONK",
					["cache_time"] = 1676328082,
					["realm"] = "Kazzak",
				},
				["Player-578-075A3050"] = {
					["name"] = "Umbraculum-Wrathbringer",
					["guid"] = "Player-578-075A3050",
					["class"] = "PRIEST",
					["cache_time"] = 1679570387,
					["realm"] = "Wrathbringer",
				},
				["Player-3681-0AE53FFF"] = {
					["name"] = "Storcator-Magtheridon",
					["guid"] = "Player-3681-0AE53FFF",
					["class"] = "WARLOCK",
					["cache_time"] = 1687102798,
					["realm"] = "Magtheridon",
				},
				["Player-3682-0A804BA4"] = {
					["ilvl"] = 418.3125,
					["guid"] = "Player-3682-0A804BA4",
					["class"] = "DEMONHUNTER",
					["role"] = "TANK",
					["cache_time"] = 1680553185,
					["realm"] = "Ragnaros",
					["name"] = "Odalicious-Ragnaros",
					["specID"] = 581,
					["enchantingLvl"] = 0,
					["rank"] = "Mythic Raider",
				},
				["Player-580-0A6BA239"] = {
					["name"] = "Vynlash-Blackmoore",
					["guid"] = "Player-580-0A6BA239",
					["class"] = "ROGUE",
					["cache_time"] = 1680485086,
					["realm"] = "Blackmoore",
				},
				["Player-3682-0B23A819"] = {
					["name"] = "Keystonehero-Ragnaros",
					["guid"] = "Player-3682-0B23A819",
					["class"] = "WARRIOR",
					["cache_time"] = 1684182960,
					["realm"] = "Ragnaros",
				},
				["Player-1602-0BEC9ED5"] = {
					["name"] = "сикама-Гордунни",
					["guid"] = "Player-1602-0BEC9ED5",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679197333,
					["realm"] = "Гордунни",
				},
				["Player-1084-0A92B32B"] = {
					["name"] = "Ionix-TarrenMill",
					["guid"] = "Player-1084-0A92B32B",
					["class"] = "ROGUE",
					["cache_time"] = 1679133580,
					["realm"] = "TarrenMill",
				},
				["Player-1621-0B01394C"] = {
					["name"] = "Nzenpersonne-Dalaran",
					["guid"] = "Player-1621-0B01394C",
					["class"] = "DRUID",
					["cache_time"] = 1688985357,
					["realm"] = "Dalaran",
				},
				["Player-3682-09C2C7B8"] = {
					["name"] = "Merumo-Ragnaros",
					["guid"] = "Player-3682-09C2C7B8",
					["class"] = "MONK",
					["cache_time"] = 1685032038,
					["realm"] = "Ragnaros",
				},
				["Player-1301-0A35957C"] = {
					["name"] = "Ostropel-Outland",
					["guid"] = "Player-1301-0A35957C",
					["class"] = "PALADIN",
					["cache_time"] = 1679564691,
					["realm"] = "Outland",
				},
				["Player-1379-0AA03F9C"] = {
					["name"] = "Rehiser-Sanguino",
					["guid"] = "Player-1379-0AA03F9C",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1684926332,
					["realm"] = "Sanguino",
				},
				["Player-3713-08D5BAA5"] = {
					["name"] = "Wojus-BurningLegion",
					["guid"] = "Player-3713-08D5BAA5",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676761804,
					["realm"] = "BurningLegion",
				},
				["Player-1305-0C537745"] = {
					["name"] = "Vokermain-Kazzak",
					["guid"] = "Player-1305-0C537745",
					["class"] = "EVOKER",
					["cache_time"] = 1677394231,
					["realm"] = "Kazzak",
				},
				["Player-1403-077BCEB9"] = {
					["name"] = "Katesbessie-Draenor",
					["guid"] = "Player-1403-077BCEB9",
					["class"] = "PALADIN",
					["cache_time"] = 1687157932,
					["realm"] = "Draenor",
				},
				["Player-1316-0C051DD6"] = {
					["name"] = "Mìlkow-Nemesis",
					["guid"] = "Player-1316-0C051DD6",
					["class"] = "PALADIN",
					["cache_time"] = 1689802006,
					["realm"] = "Nemesis",
				},
				["Player-1305-0AE8B190"] = {
					["name"] = "Ozwindrunner-Kazzak",
					["guid"] = "Player-1305-0AE8B190",
					["class"] = "MAGE",
					["cache_time"] = 1690750821,
					["realm"] = "Kazzak",
				},
				["Player-3674-0ADD782A"] = {
					["name"] = "Uchi-TwistingNether",
					["guid"] = "Player-3674-0ADD782A",
					["class"] = "SHAMAN",
					["cache_time"] = 1687952836,
					["realm"] = "TwistingNether",
				},
				["Player-1403-09A0F435"] = {
					["name"] = "Ishet-Draenor",
					["guid"] = "Player-1403-09A0F435",
					["class"] = "PALADIN",
					["cache_time"] = 1680646233,
					["realm"] = "Draenor",
				},
				["Player-581-04303D8F"] = {
					["name"] = "Horrîble-Blackrock",
					["guid"] = "Player-581-04303D8F",
					["class"] = "PRIEST",
					["cache_time"] = 1687949013,
					["realm"] = "Blackrock",
				},
				["Player-1615-0B05BAEE"] = {
					["name"] = "квинталь-Ревущийфьорд",
					["guid"] = "Player-1615-0B05BAEE",
					["class"] = "PALADIN",
					["cache_time"] = 1676606635,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1390-0C8F5B9A"] = {
					["name"] = "Abrax-Hyjal",
					["guid"] = "Player-1390-0C8F5B9A",
					["class"] = "PRIEST",
					["cache_time"] = 1689772053,
					["realm"] = "Hyjal",
				},
				["Player-3682-0B265B0E"] = {
					["name"] = "Szabolcskin-Ragnaros",
					["guid"] = "Player-3682-0B265B0E",
					["class"] = "PALADIN",
					["cache_time"] = 1686935978,
					["realm"] = "Ragnaros",
				},
				["Player-1084-0A85E947"] = {
					["name"] = "Zyrloin-TarrenMill",
					["guid"] = "Player-1084-0A85E947",
					["class"] = "DRUID",
					["cache_time"] = 1676768222,
					["realm"] = "TarrenMill",
				},
				["Player-1403-0A4EBEF5"] = {
					["name"] = "Sinnersun-Draenor",
					["guid"] = "Player-1403-0A4EBEF5",
					["class"] = "PRIEST",
					["cache_time"] = 1684510785,
					["realm"] = "Draenor",
				},
				["Player-581-08195223"] = {
					["name"] = "Hómká-Blackrock",
					["guid"] = "Player-581-08195223",
					["class"] = "PRIEST",
					["cache_time"] = 1678320295,
					["realm"] = "Blackrock",
				},
				["Player-3674-0915BEBC"] = {
					["name"] = "Ryliliana-TwistingNether",
					["guid"] = "Player-3674-0915BEBC",
					["class"] = "PRIEST",
					["cache_time"] = 1677333500,
					["realm"] = "TwistingNether",
				},
				["Player-1329-09D6ACF2"] = {
					["name"] = "Acidbullet-Ravencrest",
					["guid"] = "Player-1329-09D6ACF2",
					["class"] = "ROGUE",
					["cache_time"] = 1677491796,
					["realm"] = "Ravencrest",
				},
				["Player-1403-0A696926"] = {
					["name"] = "Marrozz-Draenor",
					["guid"] = "Player-1403-0A696926",
					["class"] = "SHAMAN",
					["cache_time"] = 1686935978,
					["realm"] = "Draenor",
				},
				["Player-1127-04564F7B"] = {
					["name"] = "Sâphirâ-ConfrérieduThorium",
					["guid"] = "Player-1127-04564F7B",
					["class"] = "PALADIN",
					["cache_time"] = 1678865303,
					["realm"] = "ConfrérieduThorium",
				},
				["Player-1605-0299D6D5"] = {
					["name"] = "гэрибьюзи-СтражСмерти",
					["guid"] = "Player-1605-0299D6D5",
					["class"] = "DRUID",
					["cache_time"] = 1676186455,
					["realm"] = "СтражСмерти",
				},
				["Player-1329-09EF22B4"] = {
					["name"] = "Secondbase-Ravencrest",
					["guid"] = "Player-1329-09EF22B4",
					["class"] = "ROGUE",
					["cache_time"] = 1676473627,
					["realm"] = "Ravencrest",
				},
				["Player-3682-0A74BEC2"] = {
					["name"] = "Yúcky-Ragnaros",
					["guid"] = "Player-3682-0A74BEC2",
					["class"] = "WARRIOR",
					["cache_time"] = 1678066914,
					["realm"] = "Ragnaros",
				},
				["Player-3713-09CA0F5D"] = {
					["name"] = "Huuba-BurningLegion",
					["guid"] = "Player-3713-09CA0F5D",
					["class"] = "WARLOCK",
					["cache_time"] = 1685745460,
					["realm"] = "BurningLegion",
				},
				["Player-1309-0C93D1BD"] = {
					["name"] = "Bustagiusta-Pozzodell'Eternità",
					["guid"] = "Player-1309-0C93D1BD",
					["class"] = "SHAMAN",
					["cache_time"] = 1687248521,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-1378-05EF8C80"] = {
					["name"] = "Baikushêv-DunModr",
					["guid"] = "Player-1378-05EF8C80",
					["class"] = "PALADIN",
					["cache_time"] = 1686934454,
					["realm"] = "DunModr",
				},
				["Player-3686-094361EF"] = {
					["name"] = "Sçarface-Antonidas",
					["guid"] = "Player-3686-094361EF",
					["class"] = "DRUID",
					["cache_time"] = 1686935978,
					["realm"] = "Antonidas",
				},
				["Player-1084-0A829DB3"] = {
					["name"] = "Bat-TarrenMill",
					["guid"] = "Player-1084-0A829DB3",
					["class"] = "EVOKER",
					["cache_time"] = 1686933987,
					["realm"] = "TarrenMill",
				},
				["Player-580-096BFD71"] = {
					["name"] = "Lokinos-Blackmoore",
					["guid"] = "Player-580-096BFD71",
					["class"] = "WARRIOR",
					["cache_time"] = 1680222925,
					["realm"] = "Blackmoore",
				},
				["Player-1303-0C0FA27B"] = {
					["ilvl"] = 445.5,
					["guid"] = "Player-1303-0C0FA27B",
					["class"] = "ROGUE",
					["role"] = "DAMAGER",
					["cache_time"] = 1690156139,
					["realm"] = "Aggra(Português)",
					["name"] = "Sinelf-Aggra(Português)",
					["specID"] = 261,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-3702-09902F07"] = {
					["name"] = "Ghanoushy-ArgentDawn",
					["guid"] = "Player-3702-09902F07",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687006559,
					["realm"] = "ArgentDawn",
				},
				["Player-3682-0A80C2F0"] = {
					["ilvl"] = 442.1875,
					["guid"] = "Player-3682-0A80C2F0",
					["class"] = "DEMONHUNTER",
					["role"] = "TANK",
					["cache_time"] = 1689281451,
					["realm"] = "Ragnaros",
					["name"] = "Fiò-Ragnaros",
					["specID"] = 581,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1400-03DCAFCF"] = {
					["name"] = "Fuegos-Area52",
					["guid"] = "Player-1400-03DCAFCF",
					["class"] = "MAGE",
					["cache_time"] = 1687041442,
					["realm"] = "Area52",
				},
				["Player-1378-0A365E1C"] = {
					["name"] = "Shidoki-C'Thun",
					["guid"] = "Player-1378-0A365E1C",
					["class"] = "PALADIN",
					["cache_time"] = 1676768222,
					["realm"] = "C'Thun",
				},
				["Player-1084-0A990F17"] = {
					["name"] = "Klyddigt-TarrenMill",
					["guid"] = "Player-1084-0A990F17",
					["class"] = "MONK",
					["cache_time"] = 1687040673,
					["realm"] = "TarrenMill",
				},
				["Player-1302-0A0234D4"] = {
					["name"] = "Pourc-Archimonde",
					["guid"] = "Player-1302-0A0234D4",
					["class"] = "PALADIN",
					["cache_time"] = 1678223169,
					["realm"] = "Archimonde",
				},
				["Player-1091-04FAA19C"] = {
					["name"] = "Narrat-Bloodscalp",
					["guid"] = "Player-1091-04FAA19C",
					["class"] = "PRIEST",
					["cache_time"] = 1687157922,
					["realm"] = "Bloodscalp",
				},
				["Player-1615-0A6E114A"] = {
					["name"] = "даркхолмвитя-Ревущийфьорд",
					["guid"] = "Player-1615-0A6E114A",
					["class"] = "PALADIN",
					["cache_time"] = 1676439582,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1379-0A72E891"] = {
					["name"] = "Zohg-Uldum",
					["guid"] = "Player-1379-0A72E891",
					["class"] = "HUNTER",
					["cache_time"] = 1685393886,
					["realm"] = "Uldum",
				},
				["Player-1615-0B083517"] = {
					["name"] = "айфониус-Ревущийфьорд",
					["guid"] = "Player-1615-0B083517",
					["class"] = "PRIEST",
					["cache_time"] = 1689804288,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1335-09B0D4D7"] = {
					["name"] = "Anatemnein-Ysondre",
					["guid"] = "Player-1335-09B0D4D7",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1683965309,
					["realm"] = "Ysondre",
				},
				["Player-1335-05F72295"] = {
					["name"] = "Tazmagnia-Ysondre",
					["guid"] = "Player-1335-05F72295",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678226933,
					["realm"] = "Ysondre",
				},
				["Player-1305-0C924C59"] = {
					["name"] = "Gnomiex-Kazzak",
					["guid"] = "Player-1305-0C924C59",
					["class"] = "MONK",
					["cache_time"] = 1686935978,
					["realm"] = "Kazzak",
				},
				["Player-1596-0F54DDC8"] = {
					["name"] = "Thomméé-Deathwing",
					["guid"] = "Player-1596-0F54DDC8",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676973948,
					["realm"] = "Deathwing",
				},
				["Player-1127-0905918F"] = {
					["name"] = "Leelunna-KirinTor",
					["guid"] = "Player-1127-0905918F",
					["class"] = "HUNTER",
					["cache_time"] = 1676377737,
					["realm"] = "KirinTor",
				},
				["Player-1417-05823D6A"] = {
					["name"] = "Philsan-Stormrage",
					["guid"] = "Player-1417-05823D6A",
					["class"] = "PALADIN",
					["cache_time"] = 1685834664,
					["realm"] = "Stormrage",
				},
				["Player-1305-0BC58050"] = {
					["name"] = "Niay-Kazzak",
					["guid"] = "Player-1305-0BC58050",
					["class"] = "PALADIN",
					["cache_time"] = 1689800841,
					["realm"] = "Kazzak",
				},
				["Player-1379-05529A35"] = {
					["name"] = "Yusicosafina-Sanguino",
					["guid"] = "Player-1379-05529A35",
					["class"] = "MAGE",
					["cache_time"] = 1677665404,
					["realm"] = "Sanguino",
				},
				["Player-1305-0C62D5A5"] = {
					["name"] = "Bingpumper-Kazzak",
					["guid"] = "Player-1305-0C62D5A5",
					["class"] = "DRUID",
					["cache_time"] = 1676373286,
					["realm"] = "Kazzak",
				},
				["Player-3674-0AF940D8"] = {
					["name"] = "Nomadel-TwistingNether",
					["guid"] = "Player-3674-0AF940D8",
					["class"] = "DRUID",
					["cache_time"] = 1686933987,
					["realm"] = "TwistingNether",
				},
				["Player-1402-05DF25EE"] = {
					["name"] = "Sewen-Turalyon",
					["guid"] = "Player-1402-05DF25EE",
					["class"] = "DRUID",
					["cache_time"] = 1678459218,
					["realm"] = "Turalyon",
				},
				["Player-2073-05025566"] = {
					["name"] = "Warkimad-Stormscale",
					["guid"] = "Player-2073-05025566",
					["class"] = "DRUID",
					["cache_time"] = 1687791302,
					["realm"] = "Stormscale",
				},
				["Player-1084-06956079"] = {
					["name"] = "Centac-TarrenMill",
					["guid"] = "Player-1084-06956079",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687949013,
					["realm"] = "TarrenMill",
				},
				["Player-1596-0F072F13"] = {
					["ilvl"] = 411.875,
					["guid"] = "Player-1596-0F072F13",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["cache_time"] = 1677334722,
					["realm"] = "TheMaelstrom",
					["name"] = "Lupie-TheMaelstrom",
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["rank"] = "Warmasters",
				},
				["Player-3703-06D5DD31"] = {
					["name"] = "Rogodk-Frostwolf",
					["guid"] = "Player-3703-06D5DD31",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1679419392,
					["realm"] = "Frostwolf",
				},
				["Player-1105-0A5091C6"] = {
					["name"] = "Thrreswar-Frostmourne",
					["guid"] = "Player-1105-0A5091C6",
					["class"] = "WARRIOR",
					["cache_time"] = 1677665404,
					["realm"] = "Frostmourne",
				},
				["Player-1604-07289512"] = {
					["name"] = "опрокинул-СвежевательДуш",
					["guid"] = "Player-1604-07289512",
					["class"] = "WARRIOR",
					["cache_time"] = 1687949013,
					["realm"] = "СвежевательДуш",
				},
				["Player-1302-0BAADA9C"] = {
					["name"] = "Baduck-Archimonde",
					["guid"] = "Player-1302-0BAADA9C",
					["class"] = "WARLOCK",
					["cache_time"] = 1687102801,
					["realm"] = "Archimonde",
				},
				["Player-1598-0B6C7988"] = {
					["name"] = "Shadowfel-Sunstrider",
					["guid"] = "Player-1598-0B6C7988",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684926332,
					["realm"] = "Sunstrider",
				},
				["Player-581-0A4C509B"] = {
					["name"] = "Hauntedlock-Blackrock",
					["guid"] = "Player-581-0A4C509B",
					["class"] = "WARLOCK",
					["cache_time"] = 1678865303,
					["realm"] = "Blackrock",
				},
				["Player-1329-09FE6EFA"] = {
					["name"] = "Oktay-Ravencrest",
					["guid"] = "Player-1329-09FE6EFA",
					["class"] = "PALADIN",
					["cache_time"] = 1687954070,
					["realm"] = "Ravencrest",
				},
				["Player-3702-07ED7451"] = {
					["name"] = "Smokieangel-ArgentDawn",
					["guid"] = "Player-3702-07ED7451",
					["class"] = "MONK",
					["cache_time"] = 1684926332,
					["realm"] = "ArgentDawn",
				},
				["Player-1403-05F55A3F"] = {
					["name"] = "Cerney-Draenor",
					["guid"] = "Player-1403-05F55A3F",
					["class"] = "SHAMAN",
					["cache_time"] = 1677249993,
					["realm"] = "Draenor",
				},
				["Player-3692-045B36D2"] = {
					["name"] = "Wildauge-Eredar",
					["guid"] = "Player-3692-045B36D2",
					["class"] = "WARRIOR",
					["cache_time"] = 1679133580,
					["realm"] = "Eredar",
				},
				["Player-3682-0B2B7804"] = {
					["name"] = "Zerog-Ragnaros",
					["guid"] = "Player-3682-0B2B7804",
					["class"] = "ROGUE",
					["cache_time"] = 1689802006,
					["realm"] = "Ragnaros",
				},
				["Player-1929-0ED5282F"] = {
					["name"] = "массарахш-ПиратскаяБухта",
					["guid"] = "Player-1929-0ED5282F",
					["class"] = "DRUID",
					["cache_time"] = 1686196139,
					["realm"] = "ПиратскаяБухта",
				},
				["Player-3682-0B118F21"] = {
					["ilvl"] = 440.0625,
					["guid"] = "Player-3682-0B118F21",
					["class"] = "HUNTER",
					["rank"] = "Mythic Raider",
					["role"] = "DAMAGER",
					["cache_time"] = 1686170267,
					["name"] = "Jereunter-Ragnaros",
					["enchanter"] = true,
					["specID"] = 253,
					["enchantingLvl"] = 65,
					["realm"] = "Ragnaros",
				},
				["Player-3674-0A773A87"] = {
					["name"] = "Iloveyou-TwistingNether",
					["guid"] = "Player-3674-0A773A87",
					["class"] = "DRUID",
					["cache_time"] = 1686935978,
					["realm"] = "TwistingNether",
				},
				["Player-3391-0C270AD0"] = {
					["name"] = "Lightway-Silvermoon",
					["guid"] = "Player-3391-0C270AD0",
					["class"] = "PALADIN",
					["cache_time"] = 1690123270,
					["realm"] = "Silvermoon",
				},
				["Player-1092-0A695687"] = {
					["role"] = "DAMAGER",
					["name"] = "Anga-BurningBlade",
					["guid"] = "Player-1092-0A695687",
					["realm"] = "BurningBlade",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676377737,
					["rank"] = "Spoluhrac",
				},
				["Player-1084-0A470115"] = {
					["name"] = "Mabbitx-TarrenMill",
					["guid"] = "Player-1084-0A470115",
					["class"] = "WARRIOR",
					["cache_time"] = 1686933987,
					["realm"] = "TarrenMill",
				},
				["Player-1403-0A5DD145"] = {
					["name"] = "Shotaholíc-Draenor",
					["guid"] = "Player-1403-0A5DD145",
					["class"] = "HUNTER",
					["cache_time"] = 1676452417,
					["realm"] = "Draenor",
				},
				["Player-1302-0A3BA227"] = {
					["name"] = "Tiberian-Archimonde",
					["guid"] = "Player-1302-0A3BA227",
					["class"] = "WARLOCK",
					["cache_time"] = 1679027741,
					["realm"] = "Archimonde",
				},
				["Player-1615-0AFDF5E4"] = {
					["name"] = "стенденсх-Ревущийфьорд",
					["guid"] = "Player-1615-0AFDF5E4",
					["class"] = "WARRIOR",
					["cache_time"] = 1686933987,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1390-0898359D"] = {
					["name"] = "Kennyaan-Hyjal",
					["guid"] = "Player-1390-0898359D",
					["class"] = "WARLOCK",
					["cache_time"] = 1686934454,
					["realm"] = "Hyjal",
				},
				["Player-1084-0A1F3293"] = {
					["name"] = "Moje-TarrenMill",
					["guid"] = "Player-1084-0A1F3293",
					["class"] = "DRUID",
					["cache_time"] = 1676387096,
					["realm"] = "TarrenMill",
				},
				["Player-1403-0A2F32E5"] = {
					["name"] = "Spykerp-Draenor",
					["guid"] = "Player-1403-0A2F32E5",
					["class"] = "PRIEST",
					["cache_time"] = 1676768222,
					["realm"] = "Draenor",
				},
				["Player-3674-08A8C2A5"] = {
					["name"] = "Sparkbrew-TwistingNether",
					["guid"] = "Player-3674-08A8C2A5",
					["class"] = "MONK",
					["cache_time"] = 1677518150,
					["realm"] = "TwistingNether",
				},
				["Player-580-0A719ECB"] = {
					["name"] = "Bommburr-Blackmoore",
					["guid"] = "Player-580-0A719ECB",
					["class"] = "PALADIN",
					["cache_time"] = 1685487968,
					["realm"] = "Blackmoore",
				},
				["Player-531-04F5FA15"] = {
					["name"] = "Lyneria-Onyxia",
					["guid"] = "Player-531-04F5FA15",
					["class"] = "PALADIN",
					["cache_time"] = 1688901714,
					["realm"] = "Onyxia",
				},
				["Player-3391-0C4DC7D1"] = {
					["name"] = "Chpdrz-Silvermoon",
					["guid"] = "Player-3391-0C4DC7D1",
					["class"] = "PALADIN",
					["cache_time"] = 1677258721,
					["realm"] = "Silvermoon",
				},
				["Player-1305-0C618FA5"] = {
					["ilvl"] = 418.1875,
					["guid"] = "Player-1305-0C618FA5",
					["class"] = "WARRIOR",
					["realm"] = "Kazzak",
					["role"] = "DAMAGER",
					["cache_time"] = 1680813097,
					["name"] = "Tankcred-Kazzak",
					["specID"] = 71,
					["enchanter"] = true,
					["enchantingLvl"] = 100,
					["rank"] = "Raider",
				},
				["Player-1385-09BF0C06"] = {
					["role"] = "HEALER",
					["name"] = "Ahkines-Minahonda",
					["guid"] = "Player-1385-09BF0C06",
					["rank"] = "Oficial",
					["class"] = "DRUID",
					["cache_time"] = 1678499437,
					["realm"] = "Minahonda",
				},
				["Player-1602-059D7745"] = {
					["name"] = "травкоед-Гордунни",
					["guid"] = "Player-1602-059D7745",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1685487968,
					["realm"] = "Гордунни",
				},
				["Player-1384-0AD58AD9"] = {
					["role"] = "DAMAGER",
					["name"] = "Llorabirras-Tyrande",
					["guid"] = "Player-1384-0AD58AD9",
					["rank"] = "Miembro",
					["class"] = "MONK",
					["cache_time"] = 1676768222,
					["realm"] = "Tyrande",
				},
				["Player-1305-0C51F61B"] = {
					["name"] = "Gaalladriell-Kazzak",
					["guid"] = "Player-1305-0C51F61B",
					["class"] = "PRIEST",
					["cache_time"] = 1680027948,
					["realm"] = "Kazzak",
				},
				["Player-3713-0A8FF907"] = {
					["name"] = "Chevi-BurningLegion",
					["guid"] = "Player-3713-0A8FF907",
					["class"] = "PRIEST",
					["cache_time"] = 1685290578,
					["realm"] = "BurningLegion",
				},
				["Player-3686-0A041C73"] = {
					["name"] = "Aikurian-Antonidas",
					["guid"] = "Player-3686-0A041C73",
					["class"] = "PRIEST",
					["cache_time"] = 1687261056,
					["realm"] = "Antonidas",
				},
				["Player-1923-0F46EFE1"] = {
					["name"] = "варигоса-Ясеневыйлес",
					["guid"] = "Player-1923-0F46EFE1",
					["class"] = "EVOKER",
					["cache_time"] = 1677607191,
					["realm"] = "Ясеневыйлес",
				},
				["Player-3656-0AA1A94F"] = {
					["name"] = "Enchisedmy-Stormreaver",
					["guid"] = "Player-3656-0AA1A94F",
					["class"] = "PRIEST",
					["cache_time"] = 1687956237,
					["realm"] = "Stormreaver",
				},
				["Player-1604-0AA8F1E3"] = {
					["name"] = "някоборщик-СвежевательДуш",
					["guid"] = "Player-1604-0AA8F1E3",
					["class"] = "PALADIN",
					["cache_time"] = 1683073733,
					["realm"] = "СвежевательДуш",
				},
				["Player-1390-0C8968A4"] = {
					["name"] = "Tylura-Hyjal",
					["guid"] = "Player-1390-0C8968A4",
					["class"] = "WARLOCK",
					["cache_time"] = 1684481246,
					["realm"] = "Hyjal",
				},
				["Player-3691-0A0225B4"] = {
					["name"] = "Wolfram-Mal'Ganis",
					["guid"] = "Player-3691-0A0225B4",
					["class"] = "WARRIOR",
					["cache_time"] = 1685781186,
					["realm"] = "Mal'Ganis",
				},
				["Player-1403-07FD895B"] = {
					["name"] = "Mayocat-Draenor",
					["guid"] = "Player-1403-07FD895B",
					["class"] = "PRIEST",
					["cache_time"] = 1686934454,
					["realm"] = "Draenor",
				},
				["Player-1305-0C835430"] = {
					["name"] = "Aquamentes-Kazzak",
					["guid"] = "Player-1305-0C835430",
					["class"] = "PALADIN",
					["cache_time"] = 1678139156,
					["realm"] = "Kazzak",
				},
				["Player-1325-09E787A8"] = {
					["name"] = "Offliné-Aggramar",
					["guid"] = "Player-1325-09E787A8",
					["class"] = "EVOKER",
					["cache_time"] = 1689800217,
					["realm"] = "Aggramar",
				},
				["Player-3682-0B055FA1"] = {
					["name"] = "Palaace-Ragnaros",
					["guid"] = "Player-3682-0B055FA1",
					["class"] = "PALADIN",
					["cache_time"] = 1675876198,
					["realm"] = "Ragnaros",
				},
				["Player-1390-0C8E8A2D"] = {
					["name"] = "Iceglock-Hyjal",
					["guid"] = "Player-1390-0C8E8A2D",
					["class"] = "PALADIN",
					["cache_time"] = 1689853901,
					["realm"] = "Hyjal",
				},
				["Player-1325-03C5492D"] = {
					["name"] = "Klamandar-Aggramar",
					["guid"] = "Player-1325-03C5492D",
					["class"] = "WARRIOR",
					["cache_time"] = 1689800841,
					["realm"] = "Aggramar",
				},
				["Player-1402-07945AE7"] = {
					["name"] = "Astreaus-Turalyon",
					["guid"] = "Player-1402-07945AE7",
					["class"] = "HUNTER",
					["cache_time"] = 1677665404,
					["realm"] = "Turalyon",
				},
				["Player-3391-0C4F3DD7"] = {
					["name"] = "Hyúng-Silvermoon",
					["guid"] = "Player-3391-0C4F3DD7",
					["class"] = "WARRIOR",
					["cache_time"] = 1686933987,
					["realm"] = "Silvermoon",
				},
				["Player-1615-0B1B8449"] = {
					["name"] = "баскими-Ревущийфьорд",
					["guid"] = "Player-1615-0B1B8449",
					["class"] = "ROGUE",
					["cache_time"] = 1687949013,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1335-09E6F766"] = {
					["name"] = "Whiiteknight-Ysondre",
					["guid"] = "Player-1335-09E6F766",
					["class"] = "EVOKER",
					["cache_time"] = 1676516463,
					["realm"] = "Ysondre",
				},
				["Player-1390-0C77161C"] = {
					["name"] = "Sêiju-Hyjal",
					["guid"] = "Player-1390-0C77161C",
					["class"] = "HUNTER",
					["cache_time"] = 1684056553,
					["realm"] = "Hyjal",
				},
				["Player-1092-09E7B314"] = {
					["name"] = "Umobuton-Drak'thul",
					["guid"] = "Player-1092-09E7B314",
					["class"] = "WARRIOR",
					["cache_time"] = 1676466306,
					["realm"] = "Drak'thul",
				},
				["Player-3682-09B7E094"] = {
					["ilvl"] = 442.3125,
					["guid"] = "Player-3682-09B7E094",
					["class"] = "PALADIN",
					["role"] = "DAMAGER",
					["name"] = "Muhrtele-Ragnaros",
					["realm"] = "Ragnaros",
					["cache_time"] = 1689281451,
					["specID"] = 70,
					["enchantingLvl"] = 0,
					["rank"] = "Alt",
				},
				["Player-3674-0AD6A3B5"] = {
					["name"] = "Zerberus-TwistingNether",
					["guid"] = "Player-3674-0AD6A3B5",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678860427,
					["realm"] = "TwistingNether",
				},
				["Player-1127-0933E28C"] = {
					["name"] = "Krinoe-KirinTor",
					["guid"] = "Player-1127-0933E28C",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676912169,
					["realm"] = "KirinTor",
				},
				["Player-1122-0A59DA9B"] = {
					["name"] = "Estrell-Uldaman",
					["guid"] = "Player-1122-0A59DA9B",
					["class"] = "HUNTER",
					["cache_time"] = 1677607191,
					["realm"] = "Uldaman",
				},
				["Player-1084-0A81131A"] = {
					["name"] = "Luffvoker-TarrenMill",
					["guid"] = "Player-1084-0A81131A",
					["class"] = "EVOKER",
					["cache_time"] = 1685781186,
					["realm"] = "TarrenMill",
				},
				["Player-1403-0A51489B"] = {
					["name"] = "Sakunä-Draenor",
					["guid"] = "Player-1403-0A51489B",
					["class"] = "DRUID",
					["cache_time"] = 1676533093,
					["realm"] = "Draenor",
				},
				["Player-3391-0C5C22CA"] = {
					["name"] = "Edrental-Silvermoon",
					["guid"] = "Player-3391-0C5C22CA",
					["class"] = "PRIEST",
					["cache_time"] = 1689253178,
					["realm"] = "Silvermoon",
				},
				["Player-3674-08D2B44C"] = {
					["name"] = "Turhis-TwistingNether",
					["guid"] = "Player-3674-08D2B44C",
					["class"] = "PALADIN",
					["cache_time"] = 1684157801,
					["realm"] = "TwistingNether",
				},
				["Player-580-0A7738D1"] = {
					["name"] = "Kyohp-Blackmoore",
					["guid"] = "Player-580-0A7738D1",
					["class"] = "PRIEST",
					["cache_time"] = 1689804288,
					["realm"] = "Blackmoore",
				},
				["Player-1403-0A6B93CB"] = {
					["name"] = "Yazukaw-Draenor",
					["guid"] = "Player-1403-0A6B93CB",
					["class"] = "WARRIOR",
					["cache_time"] = 1684125836,
					["realm"] = "Draenor",
				},
				["Player-1390-09B619DB"] = {
					["name"] = "Shänne-Hyjal",
					["guid"] = "Player-1390-09B619DB",
					["class"] = "DRUID",
					["cache_time"] = 1684006618,
					["realm"] = "Hyjal",
				},
				["Player-1303-0B5CE481"] = {
					["name"] = "Dammtrasan-Frostmane",
					["guid"] = "Player-1303-0B5CE481",
					["class"] = "PALADIN",
					["cache_time"] = 1687041442,
					["realm"] = "Frostmane",
				},
				["Player-3391-0C90B0B4"] = {
					["name"] = "Häxdöktör-Silvermoon",
					["guid"] = "Player-3391-0C90B0B4",
					["class"] = "SHAMAN",
					["cache_time"] = 1687791012,
					["realm"] = "Silvermoon",
				},
				["Player-3682-0B0CE1BC"] = {
					["ilvl"] = 406.5625,
					["guid"] = "Player-3682-0B0CE1BC",
					["class"] = "DRUID",
					["role"] = "DAMAGER",
					["cache_time"] = 1680553185,
					["realm"] = "Ragnaros",
					["name"] = "Senpãi-Ragnaros",
					["specID"] = 102,
					["enchantingLvl"] = 0,
					["rank"] = "Guild Master",
				},
				["Player-1305-0C64E730"] = {
					["name"] = "Sixdo-Kazzak",
					["guid"] = "Player-1305-0C64E730",
					["class"] = "EVOKER",
					["cache_time"] = 1685781186,
					["realm"] = "Kazzak",
				},
				["Player-1403-09CADEC1"] = {
					["name"] = "Serâph-Draenor",
					["guid"] = "Player-1403-09CADEC1",
					["class"] = "PRIEST",
					["cache_time"] = 1680383988,
					["realm"] = "Draenor",
				},
				["Player-1329-06B40565"] = {
					["name"] = "ûn-Ravencrest",
					["guid"] = "Player-1329-06B40565",
					["class"] = "ROGUE",
					["cache_time"] = 1686873759,
					["realm"] = "Ravencrest",
				},
				["Player-1316-0C82217F"] = {
					["name"] = "Narletto-Nemesis",
					["guid"] = "Player-1316-0C82217F",
					["class"] = "PALADIN",
					["cache_time"] = 1684501707,
					["realm"] = "Nemesis",
				},
				["Player-3674-05A9F570"] = {
					["name"] = "Cartilago-TwistingNether",
					["guid"] = "Player-3674-05A9F570",
					["class"] = "PALADIN",
					["cache_time"] = 1689804288,
					["realm"] = "TwistingNether",
				},
				["Player-1379-0A8AACB0"] = {
					["role"] = "DAMAGER",
					["name"] = "Ghrypus-Sanguino",
					["guid"] = "Player-1379-0A8AACB0",
					["rank"] = "Incursor Sangre",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677489750,
					["realm"] = "Sanguino",
				},
				["Player-1615-045B13A1"] = {
					["name"] = "крузерштерн-Ревущийфьорд",
					["guid"] = "Player-1615-045B13A1",
					["class"] = "SHAMAN",
					["cache_time"] = 1677515492,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1084-0A874E54"] = {
					["name"] = "Holylightzx-TarrenMill",
					["guid"] = "Player-1084-0A874E54",
					["class"] = "PALADIN",
					["cache_time"] = 1683815885,
					["realm"] = "TarrenMill",
				},
				["Player-1096-075BCEDE"] = {
					["name"] = "Rhynseargh-DefiasBrotherhood",
					["guid"] = "Player-1096-075BCEDE",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1680292466,
					["realm"] = "DefiasBrotherhood",
				},
				["Player-3686-05D64033"] = {
					["name"] = "Holylok-Antonidas",
					["guid"] = "Player-3686-05D64033",
					["class"] = "PALADIN",
					["cache_time"] = 1684352037,
					["realm"] = "Antonidas",
				},
				["Player-1604-08808D45"] = {
					["name"] = "гойдэмир-СвежевательДуш",
					["guid"] = "Player-1604-08808D45",
					["class"] = "PALADIN",
					["cache_time"] = 1684309599,
					["realm"] = "СвежевательДуш",
				},
				["Player-1305-0C922687"] = {
					["ilvl"] = 442.75,
					["guid"] = "Player-1305-0C922687",
					["class"] = "DEMONHUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1686937315,
					["realm"] = "Kazzak",
					["name"] = "Malvanis-Kazzak",
					["specID"] = 577,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-3713-0ACDEE87"] = {
					["name"] = "Szyszuluna-BurningLegion",
					["guid"] = "Player-3713-0ACDEE87",
					["class"] = "DRUID",
					["cache_time"] = 1676377737,
					["realm"] = "BurningLegion",
				},
				["Player-1379-0ADE3E85"] = {
					["name"] = "Dragomanca-Sanguino",
					["guid"] = "Player-1379-0ADE3E85",
					["class"] = "EVOKER",
					["cache_time"] = 1687952836,
					["realm"] = "Sanguino",
				},
				["Player-1091-066B2DDF"] = {
					["name"] = "Trippyhippy-Twilight'sHammer",
					["guid"] = "Player-1091-066B2DDF",
					["class"] = "DRUID",
					["cache_time"] = 1676768222,
					["realm"] = "Twilight'sHammer",
				},
				["Player-1329-093088F0"] = {
					["name"] = "Schnuddlo-Ravencrest",
					["guid"] = "Player-1329-093088F0",
					["class"] = "PALADIN",
					["cache_time"] = 1686252129,
					["realm"] = "Ravencrest",
				},
				["Player-1602-0C798673"] = {
					["ilvl"] = 431.0625,
					["guid"] = "Player-1602-0C798673",
					["class"] = "MONK",
					["role"] = "TANK",
					["cache_time"] = 1689251296,
					["realm"] = "Гордунни",
					["name"] = "илонаспейсха-Гордунни",
					["specID"] = 268,
					["enchantingLvl"] = 0,
					["rank"] = "Легат",
				},
				["Player-1096-0A73DB1D"] = {
					["name"] = "Célissa-DarkmoonFaire",
					["guid"] = "Player-1096-0A73DB1D",
					["class"] = "WARRIOR",
					["cache_time"] = 1684311131,
					["realm"] = "DarkmoonFaire",
				},
				["Player-1615-0B1C5C18"] = {
					["name"] = "кальн-Ревущийфьорд",
					["guid"] = "Player-1615-0B1C5C18",
					["class"] = "PALADIN",
					["cache_time"] = 1684006618,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1305-0C528E58"] = {
					["name"] = "Wwiwnka-Kazzak",
					["guid"] = "Player-1305-0C528E58",
					["class"] = "HUNTER",
					["cache_time"] = 1680022216,
					["realm"] = "Kazzak",
				},
				["Player-1379-0AA69710"] = {
					["name"] = "Mohat-Zul'jin",
					["guid"] = "Player-1379-0AA69710",
					["class"] = "SHAMAN",
					["cache_time"] = 1689699139,
					["realm"] = "Zul'jin",
				},
				["Player-3682-087D942D"] = {
					["name"] = "Pórketill-Ragnaros",
					["guid"] = "Player-3682-087D942D",
					["class"] = "PRIEST",
					["cache_time"] = 1687157844,
					["realm"] = "Ragnaros",
				},
				["Player-1403-09FFD0DE"] = {
					["name"] = "Npsy-Draenor",
					["guid"] = "Player-1403-09FFD0DE",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687791012,
					["realm"] = "Draenor",
				},
				["Player-570-09B99AA7"] = {
					["name"] = "Sunnypanda-Azshara",
					["guid"] = "Player-570-09B99AA7",
					["class"] = "MONK",
					["cache_time"] = 1676911169,
					["realm"] = "Azshara",
				},
				["Player-3713-0937F983"] = {
					["name"] = "Horynt-BurningLegion",
					["guid"] = "Player-3713-0937F983",
					["class"] = "SHAMAN",
					["cache_time"] = 1677665404,
					["realm"] = "BurningLegion",
				},
				["Player-2073-09D848A3"] = {
					["name"] = "Ravehizz-Stormscale",
					["guid"] = "Player-2073-09D848A3",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676486995,
					["realm"] = "Stormscale",
				},
				["Player-1329-0A02FC0E"] = {
					["name"] = "Vaaderi-Ravencrest",
					["guid"] = "Player-1329-0A02FC0E",
					["class"] = "EVOKER",
					["cache_time"] = 1684157836,
					["realm"] = "Ravencrest",
				},
				["Player-1615-0B1A5DBE"] = {
					["name"] = "берсэк-Ревущийфьорд",
					["guid"] = "Player-1615-0B1A5DBE",
					["class"] = "DRUID",
					["cache_time"] = 1677665404,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1305-0B39EA51"] = {
					["name"] = "Doomtrax-Kazzak",
					["guid"] = "Player-1305-0B39EA51",
					["class"] = "WARLOCK",
					["cache_time"] = 1680278206,
					["realm"] = "Kazzak",
				},
				["Player-604-0A75088C"] = {
					["name"] = "Laylona-Thrall",
					["guid"] = "Player-604-0A75088C",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1690895946,
					["realm"] = "Thrall",
				},
				["Player-1305-0C1A22A7"] = {
					["name"] = "Tokem-Kazzak",
					["guid"] = "Player-1305-0C1A22A7",
					["class"] = "HUNTER",
					["cache_time"] = 1686121310,
					["realm"] = "Kazzak",
				},
				["Player-1602-0EED4A54"] = {
					["name"] = "алаянорочка-Гордунни",
					["guid"] = "Player-1602-0EED4A54",
					["class"] = "PALADIN",
					["cache_time"] = 1685305181,
					["realm"] = "Гордунни",
				},
				["Player-3682-079C05CE"] = {
					["ilvl"] = 437,
					["guid"] = "Player-3682-079C05CE",
					["class"] = "DRUID",
					["role"] = "TANK",
					["cache_time"] = 1689855648,
					["rank"] = "Unguilded",
					["name"] = "Paoral-Ragnaros",
					["specID"] = 102,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-3674-08580A2E"] = {
					["name"] = "Slyatryn-TwistingNether",
					["guid"] = "Player-3674-08580A2E",
					["class"] = "ROGUE",
					["cache_time"] = 1686253971,
					["realm"] = "TwistingNether",
				},
				["Player-1092-0A58B971"] = {
					["name"] = "Pirátskull-Drak'thul",
					["guid"] = "Player-1092-0A58B971",
					["class"] = "HUNTER",
					["cache_time"] = 1688687303,
					["realm"] = "Drak'thul",
				},
				["Player-3702-0A803890"] = {
					["name"] = "Meylos-ArgentDawn",
					["guid"] = "Player-3702-0A803890",
					["class"] = "EVOKER",
					["cache_time"] = 1689677222,
					["realm"] = "ArgentDawn",
				},
				["Player-3674-0B0EDABB"] = {
					["name"] = "Dwamadwagon-TwistingNether",
					["guid"] = "Player-3674-0B0EDABB",
					["class"] = "EVOKER",
					["cache_time"] = 1687259300,
					["realm"] = "TwistingNether",
				},
				["Player-1604-0AFDB3F4"] = {
					["name"] = "ольмекаголд-СвежевательДуш",
					["guid"] = "Player-1604-0AFDB3F4",
					["class"] = "PALADIN",
					["cache_time"] = 1678766133,
					["realm"] = "СвежевательДуш",
				},
				["Player-1305-0B84C762"] = {
					["name"] = "Kezsul-Kazzak",
					["guid"] = "Player-1305-0B84C762",
					["class"] = "WARLOCK",
					["cache_time"] = 1680112361,
					["realm"] = "Kazzak",
				},
				["Player-3674-0632FF9E"] = {
					["name"] = "Légostin-TwistingNether",
					["guid"] = "Player-3674-0632FF9E",
					["class"] = "DRUID",
					["cache_time"] = 1685305181,
					["realm"] = "TwistingNether",
				},
				["Player-1602-0F334E5D"] = {
					["name"] = "стэпаут-Гордунни",
					["guid"] = "Player-1602-0F334E5D",
					["class"] = "WARLOCK",
					["cache_time"] = 1685878014,
					["realm"] = "Гордунни",
				},
				["Player-1305-0C8436A1"] = {
					["name"] = "Sygur-Kazzak",
					["guid"] = "Player-1305-0C8436A1",
					["class"] = "PALADIN",
					["cache_time"] = 1687956908,
					["realm"] = "Kazzak",
				},
				["Player-1329-04195E75"] = {
					["ilvl"] = 405.75,
					["guid"] = "Player-1329-04195E75",
					["class"] = "PRIEST",
					["realm"] = "Ravencrest",
					["role"] = "DAMAGER",
					["cache_time"] = 1680513310,
					["name"] = "Gabrial-Ravencrest",
					["specID"] = 258,
					["enchanter"] = true,
					["enchantingLvl"] = 2,
					["rank"] = "Member",
				},
				["Player-512-03DFE2ED"] = {
					["name"] = "Rhiannön-Throk'Feroth",
					["guid"] = "Player-512-03DFE2ED",
					["class"] = "PALADIN",
					["cache_time"] = 1677665404,
					["realm"] = "Throk'Feroth",
				},
				["Player-1305-0C0D7B72"] = {
					["name"] = "Réponja-Kazzak",
					["guid"] = "Player-1305-0C0D7B72",
					["class"] = "DRUID",
					["cache_time"] = 1689374076,
					["realm"] = "Kazzak",
				},
				["Player-3703-0505756A"] = {
					["name"] = "Trafnix-Frostwolf",
					["guid"] = "Player-3703-0505756A",
					["class"] = "HUNTER",
					["cache_time"] = 1677687759,
					["realm"] = "Frostwolf",
				},
				["Player-3686-09DB0DFC"] = {
					["name"] = "Ansaniâ-Antonidas",
					["guid"] = "Player-3686-09DB0DFC",
					["class"] = "PRIEST",
					["cache_time"] = 1676479581,
					["realm"] = "Antonidas",
				},
				["Player-1390-0C3AFD48"] = {
					["name"] = "Absollem-Hyjal",
					["guid"] = "Player-1390-0C3AFD48",
					["class"] = "DRUID",
					["cache_time"] = 1680290994,
					["realm"] = "Hyjal",
				},
				["Player-1302-0C8DF135"] = {
					["name"] = "Rowketzer-Archimonde",
					["guid"] = "Player-1302-0C8DF135",
					["class"] = "WARRIOR",
					["cache_time"] = 1684412175,
					["realm"] = "Archimonde",
				},
				["Player-3692-04624C26"] = {
					["name"] = "Rîley-Eredar",
					["guid"] = "Player-3692-04624C26",
					["class"] = "DRUID",
					["cache_time"] = 1676486742,
					["realm"] = "Eredar",
				},
				["Player-1379-0ACE5D9B"] = {
					["name"] = "Bartolox-Sanguino",
					["guid"] = "Player-1379-0ACE5D9B",
					["class"] = "DRUID",
					["cache_time"] = 1677071253,
					["realm"] = "Sanguino",
				},
				["Player-1615-0B220DDE"] = {
					["name"] = "хандырик-Ревущийфьорд",
					["guid"] = "Player-1615-0B220DDE",
					["class"] = "SHAMAN",
					["cache_time"] = 1685797754,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3391-08A2C9BB"] = {
					["name"] = "Loubie-Silvermoon",
					["guid"] = "Player-3391-08A2C9BB",
					["class"] = "HUNTER",
					["cache_time"] = 1689677222,
					["realm"] = "Silvermoon",
				},
				["Player-3674-0B22DA2F"] = {
					["name"] = "Buddskiimedp-TwistingNether",
					["guid"] = "Player-3674-0B22DA2F",
					["class"] = "PRIEST",
					["cache_time"] = 1687952836,
					["realm"] = "TwistingNether",
				},
				["Player-1621-0B1561BC"] = {
					["name"] = "Kiokek-Dalaran",
					["guid"] = "Player-1621-0B1561BC",
					["class"] = "MONK",
					["cache_time"] = 1676361246,
					["realm"] = "Dalaran",
				},
				["Player-1621-0B1D4CB3"] = {
					["name"] = "Xlv-Dalaran",
					["guid"] = "Player-1621-0B1D4CB3",
					["class"] = "DRUID",
					["cache_time"] = 1687133300,
					["realm"] = "Dalaran",
				},
				["Player-3674-09608CFE"] = {
					["name"] = "Tarte-TwistingNether",
					["guid"] = "Player-3674-09608CFE",
					["class"] = "DRUID",
					["cache_time"] = 1677258735,
					["realm"] = "TwistingNether",
				},
				["Player-1615-08283B00"] = {
					["name"] = "порнахд-Ревущийфьорд",
					["guid"] = "Player-1615-08283B00",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1677198346,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1615-0AD0235D"] = {
					["name"] = "эленажь-Ревущийфьорд",
					["guid"] = "Player-1615-0AD0235D",
					["class"] = "PRIEST",
					["cache_time"] = 1677665404,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-089B2369"] = {
					["name"] = "Neelix-Ragnaros",
					["guid"] = "Player-3682-089B2369",
					["class"] = "PALADIN",
					["cache_time"] = 1678485980,
					["realm"] = "Ragnaros",
				},
				["Player-509-09AFC612"] = {
					["name"] = "Varæl-Garona",
					["guid"] = "Player-509-09AFC612",
					["class"] = "PALADIN",
					["cache_time"] = 1680292466,
					["realm"] = "Garona",
				},
				["Player-1305-0BDA3903"] = {
					["name"] = "Myërs-Kazzak",
					["guid"] = "Player-1305-0BDA3903",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1690894644,
					["realm"] = "Kazzak",
				},
				["Player-1302-0C86D21A"] = {
					["name"] = "Flübz-Archimonde",
					["guid"] = "Player-1302-0C86D21A",
					["class"] = "PALADIN",
					["cache_time"] = 1687953960,
					["realm"] = "Archimonde",
				},
				["Player-1305-0C14884E"] = {
					["name"] = "Chalupabates-Kazzak",
					["guid"] = "Player-1305-0C14884E",
					["class"] = "MAGE",
					["cache_time"] = 1678236367,
					["realm"] = "Kazzak",
				},
				["Player-3674-0B1E9EB5"] = {
					["name"] = "Lúfÿ-TwistingNether",
					["guid"] = "Player-3674-0B1E9EB5",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686934003,
					["realm"] = "TwistingNether",
				},
				["Player-1302-09C90F82"] = {
					["name"] = "Viraïna-Archimonde",
					["guid"] = "Player-1302-09C90F82",
					["class"] = "PALADIN",
					["cache_time"] = 1687041442,
					["realm"] = "Archimonde",
				},
				["Player-1929-0E2E58FF"] = {
					["name"] = "мормонка-Борейскаятундра",
					["guid"] = "Player-1929-0E2E58FF",
					["class"] = "HUNTER",
					["cache_time"] = 1678052884,
					["realm"] = "Борейскаятундра",
				},
				["Player-3682-0ABD785A"] = {
					["ilvl"] = 433.0625,
					["guid"] = "Player-3682-0ABD785A",
					["class"] = "WARRIOR",
					["role"] = "TANK",
					["cache_time"] = 1686170543,
					["realm"] = "Ragnaros",
					["name"] = "Baptistbarry-Ragnaros",
					["specID"] = 73,
					["enchantingLvl"] = 0,
					["rank"] = "Mythic Raider",
				},
				["Player-580-08444612"] = {
					["name"] = "Argerion-Blackmoore",
					["guid"] = "Player-580-08444612",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687952836,
					["realm"] = "Blackmoore",
				},
				["Player-1307-0C55CB1A"] = {
					["name"] = "Chromïe-ChamberofAspects",
					["guid"] = "Player-1307-0C55CB1A",
					["class"] = "EVOKER",
					["cache_time"] = 1676186380,
					["realm"] = "ChamberofAspects",
				},
				["Player-1587-0C64A2D6"] = {
					["name"] = "Heiimdal-Nagrand",
					["guid"] = "Player-1587-0C64A2D6",
					["class"] = "WARRIOR",
					["cache_time"] = 1680292466,
					["realm"] = "Nagrand",
				},
				["Player-1325-09F3203C"] = {
					["name"] = "Mesg-Aggramar",
					["guid"] = "Player-1325-09F3203C",
					["class"] = "ROGUE",
					["cache_time"] = 1677072459,
					["realm"] = "Aggramar",
				},
				["Player-3713-072D7079"] = {
					["name"] = "Vigel-BurningLegion",
					["guid"] = "Player-3713-072D7079",
					["class"] = "DRUID",
					["cache_time"] = 1683073733,
					["realm"] = "BurningLegion",
				},
				["Player-1092-08D59F5B"] = {
					["name"] = "Totis-Drak'thul",
					["guid"] = "Player-1092-08D59F5B",
					["class"] = "ROGUE",
					["cache_time"] = 1683073733,
					["realm"] = "Drak'thul",
				},
				["Player-1335-0A04CEE5"] = {
					["name"] = "Snowynters-Ysondre",
					["guid"] = "Player-1335-0A04CEE5",
					["class"] = "PALADIN",
					["cache_time"] = 1686000336,
					["realm"] = "Ysondre",
				},
				["Player-3682-05BA316B"] = {
					["name"] = "ürbemarkoló-Ragnaros",
					["guid"] = "Player-3682-05BA316B",
					["class"] = "PRIEST",
					["cache_time"] = 1677672192,
					["realm"] = "Ragnaros",
				},
				["Player-1303-0061E128"] = {
					["name"] = "Amour-GrimBatol",
					["guid"] = "Player-1303-0061E128",
					["class"] = "WARLOCK",
					["cache_time"] = 1676327182,
					["realm"] = "GrimBatol",
				},
				["Player-633-0AD1BD87"] = {
					["name"] = "Tabaluga-Darkspear",
					["guid"] = "Player-633-0AD1BD87",
					["class"] = "EVOKER",
					["cache_time"] = 1684218174,
					["realm"] = "Darkspear",
				},
				["Player-3656-04D21E42"] = {
					["name"] = "Zerosun-Haomarush",
					["guid"] = "Player-3656-04D21E42",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678894799,
					["realm"] = "Haomarush",
				},
				["Player-3691-0A020AA1"] = {
					["name"] = "Panicroll-Blackhand",
					["guid"] = "Player-3691-0A020AA1",
					["class"] = "MONK",
					["cache_time"] = 1688985347,
					["realm"] = "Blackhand",
				},
				["Player-1315-05D60E01"] = {
					["name"] = "Jehannette-Elune",
					["guid"] = "Player-1315-05D60E01",
					["class"] = "PRIEST",
					["cache_time"] = 1676799685,
					["realm"] = "Elune",
				},
				["Player-3713-071DFDA4"] = {
					["name"] = "Luxipux-BurningLegion",
					["guid"] = "Player-3713-071DFDA4",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680262695,
					["realm"] = "BurningLegion",
				},
				["Player-1305-05148664"] = {
					["name"] = "Torbs-Kazzak",
					["guid"] = "Player-1305-05148664",
					["class"] = "ROGUE",
					["cache_time"] = 1677957827,
					["realm"] = "Kazzak",
				},
				["Player-510-0602F6CD"] = {
					["name"] = "Juliien-Vol'jin",
					["guid"] = "Player-510-0602F6CD",
					["class"] = "WARRIOR",
					["cache_time"] = 1676372636,
					["realm"] = "Vol'jin",
				},
				["Player-3391-0BAC08E4"] = {
					["name"] = "Omfgsisa-Silvermoon",
					["guid"] = "Player-3391-0BAC08E4",
					["class"] = "PRIEST",
					["cache_time"] = 1684207657,
					["realm"] = "Silvermoon",
				},
				["Player-3702-0A810F41"] = {
					["name"] = "Nixaria-ArgentDawn",
					["guid"] = "Player-3702-0A810F41",
					["class"] = "EVOKER",
					["cache_time"] = 1686754474,
					["realm"] = "ArgentDawn",
				},
				["Player-1615-0B25EBC4"] = {
					["name"] = "палавдин-Ревущийфьорд",
					["guid"] = "Player-1615-0B25EBC4",
					["class"] = "PALADIN",
					["cache_time"] = 1686121310,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1403-0A6173C0"] = {
					["name"] = "Hølysmoke-Draenor",
					["guid"] = "Player-1403-0A6173C0",
					["class"] = "EVOKER",
					["cache_time"] = 1688687303,
					["realm"] = "Draenor",
				},
				["Player-1379-0AD07D9D"] = {
					["name"] = "Prhitz-Sanguino",
					["guid"] = "Player-1379-0AD07D9D",
					["class"] = "PRIEST",
					["cache_time"] = 1687949013,
					["realm"] = "Sanguino",
				},
				["Player-1302-065C8493"] = {
					["name"] = "Kyouhu-Archimonde",
					["guid"] = "Player-1302-065C8493",
					["class"] = "PALADIN",
					["cache_time"] = 1685341872,
					["realm"] = "Archimonde",
				},
				["Player-1604-0B028B26"] = {
					["name"] = "лояльность-СвежевательДуш",
					["guid"] = "Player-1604-0B028B26",
					["class"] = "WARRIOR",
					["cache_time"] = 1684502528,
					["realm"] = "СвежевательДуш",
				},
				["Player-3682-0A544AB0"] = {
					["name"] = "Smóke-Ragnaros",
					["guid"] = "Player-3682-0A544AB0",
					["class"] = "PRIEST",
					["cache_time"] = 1679616541,
					["realm"] = "Ragnaros",
				},
				["Player-1403-0A55A0E2"] = {
					["name"] = "Arrowdeen-Draenor",
					["guid"] = "Player-1403-0A55A0E2",
					["class"] = "HUNTER",
					["cache_time"] = 1677223354,
					["realm"] = "Draenor",
				},
				["Player-1305-0C88E87B"] = {
					["name"] = "Hsalione-Kazzak",
					["guid"] = "Player-1305-0C88E87B",
					["class"] = "HUNTER",
					["cache_time"] = 1688866939,
					["realm"] = "Kazzak",
				},
				["Player-1602-0BF4A094"] = {
					["name"] = "лачето-Гордунни",
					["guid"] = "Player-1602-0BF4A094",
					["class"] = "PRIEST",
					["cache_time"] = 1687791302,
					["realm"] = "Гордунни",
				},
				["Player-1615-0B19B8AB"] = {
					["name"] = "соулдилер-Ревущийфьорд",
					["guid"] = "Player-1615-0B19B8AB",
					["class"] = "WARLOCK",
					["cache_time"] = 1676525453,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1615-0AE3F563"] = {
					["name"] = "жруборг-Ревущийфьорд",
					["guid"] = "Player-1615-0AE3F563",
					["class"] = "PALADIN",
					["cache_time"] = 1690510985,
					["realm"] = "Ревущийфьорд",
				},
				["Player-580-0A668B95"] = {
					["name"] = "Ráo-Blackmoore",
					["guid"] = "Player-580-0A668B95",
					["class"] = "MONK",
					["cache_time"] = 1676796439,
					["realm"] = "Blackmoore",
				},
				["Player-3682-0A79222F"] = {
					["name"] = "Búbbly-Ragnaros",
					["guid"] = "Player-3682-0A79222F",
					["class"] = "PALADIN",
					["cache_time"] = 1687298820,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0C4E7AEB"] = {
					["name"] = "Noxxîe-Kazzak",
					["guid"] = "Player-1305-0C4E7AEB",
					["class"] = "SHAMAN",
					["cache_time"] = 1687248139,
					["realm"] = "Kazzak",
				},
				["Player-3702-0629DC7E"] = {
					["name"] = "Rebeccá-ArgentDawn",
					["guid"] = "Player-3702-0629DC7E",
					["class"] = "SHAMAN",
					["cache_time"] = 1685468704,
					["realm"] = "ArgentDawn",
				},
				["Player-1316-0C7CB5BD"] = {
					["name"] = "Sharadim-Nemesis",
					["guid"] = "Player-1316-0C7CB5BD",
					["class"] = "PRIEST",
					["cache_time"] = 1680290994,
					["realm"] = "Nemesis",
				},
				["Player-3391-0C439C24"] = {
					["name"] = "Kittaren-Silvermoon",
					["guid"] = "Player-3391-0C439C24",
					["class"] = "DRUID",
					["cache_time"] = 1679968027,
					["realm"] = "Silvermoon",
				},
				["Player-1378-0AE14FAA"] = {
					["name"] = "Trollgaia-DunModr",
					["guid"] = "Player-1378-0AE14FAA",
					["class"] = "DRUID",
					["cache_time"] = 1686788530,
					["realm"] = "DunModr",
				},
				["Player-3656-0AA0FBF5"] = {
					["name"] = "Rhoing-Stormreaver",
					["guid"] = "Player-3656-0AA0FBF5",
					["class"] = "PALADIN",
					["cache_time"] = 1688906515,
					["realm"] = "Stormreaver",
				},
				["Player-3692-060E0494"] = {
					["name"] = "Lía-Eredar",
					["guid"] = "Player-3692-060E0494",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676372636,
					["realm"] = "Eredar",
				},
				["Player-3674-0A5E30C2"] = {
					["name"] = "Nazjra-TwistingNether",
					["guid"] = "Player-3674-0A5E30C2",
					["class"] = "PALADIN",
					["cache_time"] = 1684231108,
					["realm"] = "TwistingNether",
				},
				["Player-1335-0394EEDD"] = {
					["name"] = "Wikerman-Ysondre",
					["guid"] = "Player-1335-0394EEDD",
					["class"] = "SHAMAN",
					["cache_time"] = 1687949273,
					["realm"] = "Ysondre",
				},
				["Player-3674-0B157091"] = {
					["name"] = "Civel-TwistingNether",
					["guid"] = "Player-3674-0B157091",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679506666,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0B0C2D71"] = {
					["name"] = "Chaosnether-Kazzak",
					["guid"] = "Player-1305-0B0C2D71",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685534275,
					["realm"] = "Kazzak",
				},
				["Player-1315-05D5745D"] = {
					["name"] = "Als-Elune",
					["guid"] = "Player-1315-05D5745D",
					["class"] = "PRIEST",
					["cache_time"] = 1685871367,
					["realm"] = "Elune",
				},
				["Player-580-0A125E01"] = {
					["name"] = "Salyka-Blackmoore",
					["guid"] = "Player-580-0A125E01",
					["class"] = "HUNTER",
					["cache_time"] = 1677606779,
					["realm"] = "Blackmoore",
				},
				["Player-581-0A67E740"] = {
					["name"] = "Jéllywatch-Blackrock",
					["guid"] = "Player-581-0A67E740",
					["class"] = "MONK",
					["cache_time"] = 1676448663,
					["realm"] = "Blackrock",
				},
				["Player-3691-0745F2AA"] = {
					["name"] = "Paise-Blackhand",
					["guid"] = "Player-3691-0745F2AA",
					["class"] = "WARLOCK",
					["cache_time"] = 1680292466,
					["realm"] = "Blackhand",
				},
				["Player-1390-0BE399B9"] = {
					["ilvl"] = 427.4375,
					["guid"] = "Player-1390-0BE399B9",
					["class"] = "PALADIN",
					["rank"] = "Unguilded",
					["role"] = "TANK",
					["cache_time"] = 1685468704,
					["name"] = "Goldenshait-Hyjal",
					["enchanter"] = true,
					["specID"] = 66,
					["enchantingLvl"] = 47,
					["realm"] = "Hyjal",
				},
				["Player-581-0A451F80"] = {
					["role"] = "HEALER",
					["name"] = "Mistskeren-Blackrock",
					["guid"] = "Player-581-0A451F80",
					["realm"] = "Blackrock",
					["class"] = "MONK",
					["cache_time"] = 1684927057,
					["rank"] = "Rookie",
				},
				["Player-3682-08133A02"] = {
					["name"] = "Korose-Ragnaros",
					["guid"] = "Player-3682-08133A02",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677672192,
					["realm"] = "Ragnaros",
				},
				["Player-1403-0A608D66"] = {
					["name"] = "Trezglock-Draenor",
					["guid"] = "Player-1403-0A608D66",
					["class"] = "HUNTER",
					["cache_time"] = 1677665419,
					["realm"] = "Draenor",
				},
				["Player-1390-0C804582"] = {
					["name"] = "Bottomtwinky-Hyjal",
					["guid"] = "Player-1390-0C804582",
					["class"] = "EVOKER",
					["cache_time"] = 1677198355,
					["realm"] = "Hyjal",
				},
				["Player-3674-09A35B1F"] = {
					["name"] = "Zerotooth-TwistingNether",
					["guid"] = "Player-3674-09A35B1F",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1684054876,
					["realm"] = "TwistingNether",
				},
				["Player-1602-0F344B97"] = {
					["name"] = "дыхачило-Гордунни",
					["guid"] = "Player-1602-0F344B97",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685342409,
					["realm"] = "Гордунни",
				},
				["Player-1615-0971A846"] = {
					["name"] = "апокалипсит-Ревущийфьорд",
					["guid"] = "Player-1615-0971A846",
					["class"] = "WARLOCK",
					["cache_time"] = 1689253178,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1615-0AF4534C"] = {
					["name"] = "вирнс-Ревущийфьорд",
					["guid"] = "Player-1615-0AF4534C",
					["class"] = "SHAMAN",
					["cache_time"] = 1680292466,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1329-094A06DB"] = {
					["name"] = "Ptaciz-Ravencrest",
					["guid"] = "Player-1329-094A06DB",
					["class"] = "WARRIOR",
					["cache_time"] = 1676979741,
					["realm"] = "Ravencrest",
				},
				["Player-580-0A6ADACF"] = {
					["name"] = "Palypalz-Blackmoore",
					["guid"] = "Player-580-0A6ADACF",
					["class"] = "PALADIN",
					["cache_time"] = 1676465368,
					["realm"] = "Blackmoore",
				},
				["Player-1597-0F5D9839"] = {
					["name"] = "Fatboltz-Sylvanas",
					["guid"] = "Player-1597-0F5D9839",
					["class"] = "WARLOCK",
					["cache_time"] = 1685529229,
					["realm"] = "Sylvanas",
				},
				["Player-1305-04FEC371"] = {
					["name"] = "Sarboot-Kazzak",
					["guid"] = "Player-1305-04FEC371",
					["class"] = "WARLOCK",
					["cache_time"] = 1680258337,
					["realm"] = "Kazzak",
				},
				["Player-1390-0C53942A"] = {
					["name"] = "Nyxeria-Hyjal",
					["guid"] = "Player-1390-0C53942A",
					["class"] = "EVOKER",
					["cache_time"] = 1684502528,
					["realm"] = "Hyjal",
				},
				["Player-3713-07A5331F"] = {
					["name"] = "Byma-BurningLegion",
					["guid"] = "Player-3713-07A5331F",
					["class"] = "SHAMAN",
					["cache_time"] = 1676479581,
					["realm"] = "BurningLegion",
				},
				["Player-604-06A2F3F8"] = {
					["name"] = "Rôyalblunt-Thrall",
					["guid"] = "Player-604-06A2F3F8",
					["class"] = "PALADIN",
					["cache_time"] = 1684202637,
					["realm"] = "Thrall",
				},
				["Player-3674-08D31498"] = {
					["name"] = "Sickdpsxd-TwistingNether",
					["guid"] = "Player-3674-08D31498",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676387096,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0A47E856"] = {
					["name"] = "Whitesonja-Kazzak",
					["guid"] = "Player-1305-0A47E856",
					["class"] = "PRIEST",
					["cache_time"] = 1677126111,
					["realm"] = "Kazzak",
				},
				["Player-3686-0887B92B"] = {
					["name"] = "Locey-Antonidas",
					["guid"] = "Player-3686-0887B92B",
					["class"] = "MAGE",
					["cache_time"] = 1680396168,
					["realm"] = "Antonidas",
				},
				["Player-3674-0AD08369"] = {
					["name"] = "Doktorglas-TwistingNether",
					["guid"] = "Player-3674-0AD08369",
					["class"] = "PALADIN",
					["cache_time"] = 1685780231,
					["realm"] = "TwistingNether",
				},
				["Player-1388-0AD75B5A"] = {
					["name"] = "énid-Mazrigos",
					["guid"] = "Player-1388-0AD75B5A",
					["class"] = "EVOKER",
					["cache_time"] = 1676973948,
					["realm"] = "Mazrigos",
				},
				["Player-3682-08163C0A"] = {
					["name"] = "øops-Ragnaros",
					["guid"] = "Player-3682-08163C0A",
					["class"] = "HUNTER",
					["cache_time"] = 1679027833,
					["realm"] = "Ragnaros",
				},
				["Player-1597-0D099842"] = {
					["name"] = "Ancestral-Sylvanas",
					["guid"] = "Player-1597-0D099842",
					["class"] = "SHAMAN",
					["cache_time"] = 1678733387,
					["realm"] = "Sylvanas",
				},
				["Player-581-0A43F14C"] = {
					["name"] = "Inlight-Blackrock",
					["guid"] = "Player-581-0A43F14C",
					["class"] = "PRIEST",
					["cache_time"] = 1679506666,
					["realm"] = "Blackrock",
				},
				["Player-1305-0C4F8361"] = {
					["name"] = "Envoyligh-Kazzak",
					["guid"] = "Player-1305-0C4F8361",
					["class"] = "PALADIN",
					["cache_time"] = 1679427119,
					["realm"] = "Kazzak",
				},
				["Player-1604-0F1D98F8"] = {
					["name"] = "кучкин-СвежевательДуш",
					["guid"] = "Player-1604-0F1D98F8",
					["class"] = "SHAMAN",
					["cache_time"] = 1678226933,
					["realm"] = "СвежевательДуш",
				},
				["Player-3690-0AEA8D7E"] = {
					["name"] = "Selenereth-KhazModan",
					["guid"] = "Player-3690-0AEA8D7E",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687102892,
					["realm"] = "KhazModan",
				},
				["Player-3674-0A5F10F0"] = {
					["name"] = "Doodliedoo-TwistingNether",
					["guid"] = "Player-3674-0A5F10F0",
					["class"] = "PALADIN",
					["cache_time"] = 1686935978,
					["realm"] = "TwistingNether",
				},
				["Player-1084-0A9A64B1"] = {
					["name"] = "Turat-TarrenMill",
					["guid"] = "Player-1084-0A9A64B1",
					["class"] = "PALADIN",
					["cache_time"] = 1685059364,
					["realm"] = "TarrenMill",
				},
				["Player-1615-0B039914"] = {
					["name"] = "ронухан-Ревущийфьорд",
					["guid"] = "Player-1615-0B039914",
					["class"] = "WARRIOR",
					["cache_time"] = 1678234395,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1615-0A846180"] = {
					["name"] = "мисстергусь-Ревущийфьорд",
					["guid"] = "Player-1615-0A846180",
					["class"] = "ROGUE",
					["cache_time"] = 1690750821,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3713-0AD0EC99"] = {
					["name"] = "Papamobil-BurningLegion",
					["guid"] = "Player-3713-0AD0EC99",
					["class"] = "WARRIOR",
					["cache_time"] = 1680292466,
					["realm"] = "BurningLegion",
				},
				["Player-1587-0F4DE4DB"] = {
					["name"] = "Vinesolar-Runetotem",
					["guid"] = "Player-1587-0F4DE4DB",
					["class"] = "DRUID",
					["cache_time"] = 1678733272,
					["realm"] = "Runetotem",
				},
				["Player-1602-0F2058A6"] = {
					["name"] = "грассфеникс-Гордунни",
					["guid"] = "Player-1602-0F2058A6",
					["class"] = "WARRIOR",
					["cache_time"] = 1676354879,
					["realm"] = "Гордунни",
				},
				["Player-1085-0A9C8A87"] = {
					["name"] = "Drainár-Moonglade",
					["guid"] = "Player-1085-0A9C8A87",
					["class"] = "PALADIN",
					["cache_time"] = 1684926617,
					["realm"] = "Moonglade",
				},
				["Player-3682-0B247217"] = {
					["ilvl"] = 431.375,
					["guid"] = "Player-3682-0B247217",
					["class"] = "PALADIN",
					["rank"] = "Mythic Raider",
					["role"] = "HEALER",
					["cache_time"] = 1686170432,
					["name"] = "Banaltro-Ragnaros",
					["enchanter"] = true,
					["specID"] = 65,
					["enchantingLvl"] = 82,
					["realm"] = "Ragnaros",
				},
				["Player-1084-09814B85"] = {
					["name"] = "Milatios-TarrenMill",
					["guid"] = "Player-1084-09814B85",
					["class"] = "DRUID",
					["cache_time"] = 1677665404,
					["realm"] = "TarrenMill",
				},
				["Player-1092-053C803B"] = {
					["name"] = "Larthos-BurningBlade",
					["guid"] = "Player-1092-053C803B",
					["class"] = "PALADIN",
					["cache_time"] = 1678902000,
					["realm"] = "BurningBlade",
				},
				["Player-3682-0B29ABF2"] = {
					["ilvl"] = 444.75,
					["guid"] = "Player-3682-0B29ABF2",
					["class"] = "PALADIN",
					["realm"] = "Ragnaros",
					["role"] = "DAMAGER",
					["cache_time"] = 1690157726,
					["name"] = "Wrathwings-Ragnaros",
					["specID"] = 70,
					["enchanter"] = true,
					["enchantingLvl"] = 52,
					["rank"] = "Raider",
				},
				["Player-3674-0AE9C2E2"] = {
					["name"] = "Düsentus-TwistingNether",
					["guid"] = "Player-3674-0AE9C2E2",
					["class"] = "WARLOCK",
					["cache_time"] = 1685766281,
					["realm"] = "TwistingNether",
				},
				["Player-3682-08E46049"] = {
					["name"] = "Tyny-Ragnaros",
					["guid"] = "Player-3682-08E46049",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676473627,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0C4F4F58"] = {
					["name"] = "Servvia-Kazzak",
					["guid"] = "Player-1305-0C4F4F58",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1688923981,
					["realm"] = "Kazzak",
				},
				["Player-1604-0BA0386A"] = {
					["name"] = "могууступить-СвежевательДуш",
					["guid"] = "Player-1604-0BA0386A",
					["class"] = "SHAMAN",
					["cache_time"] = 1684413259,
					["realm"] = "СвежевательДуш",
				},
				["Player-3692-0937E7A4"] = {
					["name"] = "Bwonsamdii-Eredar",
					["guid"] = "Player-3692-0937E7A4",
					["class"] = "SHAMAN",
					["cache_time"] = 1687157924,
					["realm"] = "Eredar",
				},
				["Player-1084-0AA17E36"] = {
					["name"] = "Datmoose-TarrenMill",
					["guid"] = "Player-1084-0AA17E36",
					["class"] = "DRUID",
					["cache_time"] = 1687955030,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0C9256C2"] = {
					["name"] = "Fistbreaker-Kazzak",
					["guid"] = "Player-1305-0C9256C2",
					["class"] = "MONK",
					["cache_time"] = 1686935978,
					["realm"] = "Kazzak",
				},
				["Player-3682-0B1210AA"] = {
					["ilvl"] = 442.625,
					["guid"] = "Player-3682-0B1210AA",
					["class"] = "WARRIOR",
					["role"] = "DAMAGER",
					["cache_time"] = 1689281451,
					["realm"] = "Ragnaros",
					["name"] = "Mordekaisar-Ragnaros",
					["specID"] = 72,
					["enchantingLvl"] = 0,
					["rank"] = "Alt",
				},
				["Player-581-0A12AF4F"] = {
					["name"] = "Deathsolty-Blackrock",
					["guid"] = "Player-581-0A12AF4F",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678052884,
					["realm"] = "Blackrock",
				},
				["Player-3391-0C59D9DF"] = {
					["name"] = "Mômonga-Silvermoon",
					["guid"] = "Player-3391-0C59D9DF",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679966556,
					["realm"] = "Silvermoon",
				},
				["Player-1099-0A8F6F95"] = {
					["name"] = "Kaydosku-Rexxar",
					["guid"] = "Player-1099-0A8F6F95",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680400036,
					["realm"] = "Rexxar",
				},
				["Player-580-0A729677"] = {
					["name"] = "Duffdruid-Blackmoore",
					["guid"] = "Player-580-0A729677",
					["class"] = "DRUID",
					["cache_time"] = 1686062753,
					["realm"] = "Blackmoore",
				},
				["Player-1390-0BCD61C6"] = {
					["name"] = "Nägass-Hyjal",
					["guid"] = "Player-1390-0BCD61C6",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1690305136,
					["realm"] = "Hyjal",
				},
				["Player-1335-057EBB59"] = {
					["name"] = "Gazaslim-Ysondre",
					["guid"] = "Player-1335-057EBB59",
					["class"] = "WARRIOR",
					["cache_time"] = 1685398638,
					["realm"] = "Ysondre",
				},
				["Player-580-08CD9FDE"] = {
					["name"] = "Greenflame-Blackmoore",
					["guid"] = "Player-580-08CD9FDE",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687259258,
					["realm"] = "Blackmoore",
				},
				["Player-1305-0B05E7DB"] = {
					["name"] = "Coachn-Kazzak",
					["guid"] = "Player-1305-0B05E7DB",
					["class"] = "PALADIN",
					["cache_time"] = 1685766281,
					["realm"] = "Kazzak",
				},
				["Player-2073-09F68DB5"] = {
					["name"] = "Lohaith-Stormscale",
					["guid"] = "Player-2073-09F68DB5",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678860427,
					["realm"] = "Stormscale",
				},
				["Player-2074-0A032D74"] = {
					["name"] = "Dramus-EmeraldDream",
					["guid"] = "Player-2074-0A032D74",
					["class"] = "PALADIN",
					["cache_time"] = 1687102798,
					["realm"] = "EmeraldDream",
				},
				["Player-1602-0F0A6986"] = {
					["name"] = "гатсберсеркк-Гордунни",
					["guid"] = "Player-1602-0F0A6986",
					["class"] = "WARRIOR",
					["cache_time"] = 1676479581,
					["realm"] = "Гордунни",
				},
				["Player-3391-0C1697D1"] = {
					["name"] = "Mitrandiir-Silvermoon",
					["guid"] = "Player-3391-0C1697D1",
					["class"] = "DRUID",
					["cache_time"] = 1680644778,
					["realm"] = "Silvermoon",
				},
				["Player-3391-0C5573F8"] = {
					["name"] = "Shiroazhi-Silvermoon",
					["guid"] = "Player-3391-0C5573F8",
					["class"] = "PALADIN",
					["cache_time"] = 1676385549,
					["realm"] = "Silvermoon",
				},
				["Player-3682-0B0A2A36"] = {
					["ilvl"] = 442.4375,
					["guid"] = "Player-3682-0B0A2A36",
					["class"] = "EVOKER",
					["role"] = "DAMAGER",
					["cache_time"] = 1689265296,
					["realm"] = "Ragnaros",
					["name"] = "Rambroner-Ragnaros",
					["specID"] = 1473,
					["enchantingLvl"] = 0,
					["rank"] = "Social",
				},
				["Player-1305-0BD7F4F7"] = {
					["name"] = "Noisess-Kazzak",
					["guid"] = "Player-1305-0BD7F4F7",
					["class"] = "DRUID",
					["cache_time"] = 1680222925,
					["realm"] = "Kazzak",
				},
				["Player-3391-0C8FBA1A"] = {
					["name"] = "Bnathean-Silvermoon",
					["guid"] = "Player-3391-0C8FBA1A",
					["class"] = "HUNTER",
					["cache_time"] = 1688985337,
					["realm"] = "Silvermoon",
				},
				["Player-3682-09B9665E"] = {
					["name"] = "Lannela-Ragnaros",
					["guid"] = "Player-3682-09B9665E",
					["class"] = "MAGE",
					["cache_time"] = 1689700268,
					["realm"] = "Ragnaros",
				},
				["Player-581-07BA0FC1"] = {
					["name"] = "Shawrâk-Blackrock",
					["guid"] = "Player-581-07BA0FC1",
					["class"] = "SHAMAN",
					["cache_time"] = 1688687303,
					["realm"] = "Blackrock",
				},
				["Player-3682-0B1D2C1A"] = {
					["ilvl"] = 429.375,
					["guid"] = "Player-3682-0B1D2C1A",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["cache_time"] = 1685565208,
					["realm"] = "Ragnaros",
					["name"] = "Kijul-Ragnaros",
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1084-0A9C83F3"] = {
					["name"] = "Cephandrius-TarrenMill",
					["guid"] = "Player-1084-0A9C83F3",
					["class"] = "EVOKER",
					["cache_time"] = 1689704202,
					["realm"] = "TarrenMill",
				},
				["Player-1305-08D05F02"] = {
					["name"] = "Gerbal-Kazzak",
					["guid"] = "Player-1305-08D05F02",
					["class"] = "DRUID",
					["cache_time"] = 1677253640,
					["realm"] = "Kazzak",
				},
				["Player-1084-081F100F"] = {
					["name"] = "Sðra-TarrenMill",
					["guid"] = "Player-1084-081F100F",
					["class"] = "SHAMAN",
					["cache_time"] = 1677515492,
					["realm"] = "TarrenMill",
				},
				["Player-1390-0C93B0FF"] = {
					["ilvl"] = 439.25,
					["guid"] = "Player-1390-0C93B0FF",
					["class"] = "DEMONHUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1686696461,
					["realm"] = "Hyjal",
					["name"] = "Blackneath-Hyjal",
					["specID"] = 577,
					["enchantingLvl"] = 0,
					["rank"] = "Sans guilde",
				},
				["Player-1390-0C5A1AD9"] = {
					["name"] = "Kiteshi-Hyjal",
					["guid"] = "Player-1390-0C5A1AD9",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684883011,
					["realm"] = "Hyjal",
				},
				["Player-1405-0A67C748"] = {
					["role"] = "DAMAGER",
					["name"] = "Duglum-DerRatvonDalaran",
					["guid"] = "Player-1405-0A67C748",
					["rank"] = "Gildenlos",
					["class"] = "WARLOCK",
					["cache_time"] = 1679846287,
					["realm"] = "DerRatvonDalaran",
				},
				["Player-1329-06A3254E"] = {
					["name"] = "Shdowp-Ravencrest",
					["guid"] = "Player-1329-06A3254E",
					["class"] = "PRIEST",
					["cache_time"] = 1677085516,
					["realm"] = "Ravencrest",
				},
				["Player-3682-0B1B5C05"] = {
					["name"] = "Otpmage-Ragnaros",
					["guid"] = "Player-3682-0B1B5C05",
					["class"] = "MAGE",
					["cache_time"] = 1686169757,
					["realm"] = "Ragnaros",
				},
				["Player-3674-0B0A50DC"] = {
					["role"] = "HEALER",
					["name"] = "Killævoke-TwistingNether",
					["guid"] = "Player-3674-0B0A50DC",
					["realm"] = "TwistingNether",
					["class"] = "EVOKER",
					["cache_time"] = 1685816533,
					["rank"] = "Social",
				},
				["Player-1084-0A64A097"] = {
					["name"] = "Mørtís-TarrenMill",
					["guid"] = "Player-1084-0A64A097",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1683073733,
					["realm"] = "TarrenMill",
				},
				["Player-1388-0ADBEB3E"] = {
					["name"] = "Sinziee-Mazrigos",
					["guid"] = "Player-1388-0ADBEB3E",
					["class"] = "SHAMAN",
					["cache_time"] = 1676759633,
					["realm"] = "Mazrigos",
				},
				["Player-1393-0AD1D68F"] = {
					["name"] = "Mappee-BronzeDragonflight",
					["guid"] = "Player-1393-0AD1D68F",
					["class"] = "EVOKER",
					["cache_time"] = 1686754263,
					["realm"] = "BronzeDragonflight",
				},
				["Player-3691-050A8706"] = {
					["name"] = "Tatzino-Blackhand",
					["guid"] = "Player-3691-050A8706",
					["class"] = "HUNTER",
					["cache_time"] = 1676387096,
					["realm"] = "Blackhand",
				},
				["Player-1084-0A902537"] = {
					["name"] = "Ashdrasil-TarrenMill",
					["guid"] = "Player-1084-0A902537",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679844347,
					["realm"] = "TarrenMill",
				},
				["Player-3682-0B20D298"] = {
					["name"] = "Akilles-Ragnaros",
					["guid"] = "Player-3682-0B20D298",
					["class"] = "PALADIN",
					["cache_time"] = 1684491463,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0C880AC5"] = {
					["name"] = "Aslankalepaz-Kazzak",
					["guid"] = "Player-1305-0C880AC5",
					["class"] = "PALADIN",
					["cache_time"] = 1686933987,
					["realm"] = "Kazzak",
				},
				["Player-1305-0C62A0B9"] = {
					["name"] = "Emamalii-Kazzak",
					["guid"] = "Player-1305-0C62A0B9",
					["class"] = "HUNTER",
					["cache_time"] = 1680290994,
					["realm"] = "Kazzak",
				},
				["Player-1403-0A6F4953"] = {
					["name"] = "Baldec-Draenor",
					["guid"] = "Player-1403-0A6F4953",
					["class"] = "PALADIN",
					["cache_time"] = 1686121310,
					["realm"] = "Draenor",
				},
				["Player-3391-068AF832"] = {
					["name"] = "Merenth-Silvermoon",
					["guid"] = "Player-3391-068AF832",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1684603502,
					["realm"] = "Silvermoon",
				},
				["Player-580-0A610818"] = {
					["name"] = "Zakurai-Blackmoore",
					["guid"] = "Player-580-0A610818",
					["class"] = "EVOKER",
					["cache_time"] = 1686934454,
					["realm"] = "Blackmoore",
				},
				["Player-604-09D1564A"] = {
					["name"] = "Kaldorak-Ambossar",
					["guid"] = "Player-604-09D1564A",
					["class"] = "PRIEST",
					["cache_time"] = 1689395817,
					["realm"] = "Ambossar",
				},
				["Player-1390-08D23DA3"] = {
					["name"] = "Elzäh-Hyjal",
					["guid"] = "Player-1390-08D23DA3",
					["class"] = "MAGE",
					["cache_time"] = 1680292466,
					["realm"] = "Hyjal",
				},
				["Player-1403-0A72E61F"] = {
					["name"] = "Nganouu-Draenor",
					["guid"] = "Player-1403-0A72E61F",
					["class"] = "WARRIOR",
					["cache_time"] = 1688685563,
					["realm"] = "Draenor",
				},
				["Player-604-0A4DB677"] = {
					["name"] = "Picso-Thrall",
					["guid"] = "Player-604-0A4DB677",
					["class"] = "HUNTER",
					["cache_time"] = 1680292466,
					["realm"] = "Thrall",
				},
				["Player-3691-09F0BF08"] = {
					["name"] = "Døømlock-Blackhand",
					["guid"] = "Player-3691-09F0BF08",
					["class"] = "WARLOCK",
					["cache_time"] = 1685191876,
					["realm"] = "Blackhand",
				},
				["Player-1096-0A5CD35E"] = {
					["name"] = "Watermelon-EarthenRing",
					["guid"] = "Player-1096-0A5CD35E",
					["class"] = "EVOKER",
					["cache_time"] = 1689253178,
					["realm"] = "EarthenRing",
				},
				["Player-1403-0A370A86"] = {
					["name"] = "Pipik-Draenor",
					["guid"] = "Player-1403-0A370A86",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680421920,
					["realm"] = "Draenor",
				},
				["Player-3674-08ED83F3"] = {
					["name"] = "Parkla-TwistingNether",
					["guid"] = "Player-3674-08ED83F3",
					["class"] = "PALADIN",
					["cache_time"] = 1680754040,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0C88DC6F"] = {
					["ilvl"] = 365.6875,
					["guid"] = "Player-1305-0C88DC6F",
					["class"] = "PALADIN",
					["role"] = "TANK",
					["name"] = "Cowmuu-Kazzak",
					["realm"] = "Kazzak",
					["cache_time"] = 1680436995,
					["specID"] = 66,
					["enchantingLvl"] = 0,
					["rank"] = "Unguilded",
				},
				["Player-1596-0A839459"] = {
					["name"] = "Sinneri-TheMaelstrom",
					["guid"] = "Player-1596-0A839459",
					["class"] = "MONK",
					["cache_time"] = 1689699139,
					["realm"] = "TheMaelstrom",
				},
				["Player-633-0AD91C1C"] = {
					["name"] = "Dasrau-Darkspear",
					["guid"] = "Player-633-0AD91C1C",
					["class"] = "PRIEST",
					["cache_time"] = 1678052884,
					["realm"] = "Darkspear",
				},
				["Player-3691-0A04E4E8"] = {
					["name"] = "Nookeyy-Blackhand",
					["guid"] = "Player-3691-0A04E4E8",
					["class"] = "EVOKER",
					["cache_time"] = 1687261056,
					["realm"] = "Blackhand",
				},
				["Player-1305-0C8D76D4"] = {
					["name"] = "Bloodmournee-Kazzak",
					["guid"] = "Player-1305-0C8D76D4",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687245813,
					["realm"] = "Kazzak",
				},
				["Player-1096-0A72F4A5"] = {
					["name"] = "Jayee-Ravenholdt",
					["guid"] = "Player-1096-0A72F4A5",
					["class"] = "WARLOCK",
					["cache_time"] = 1689374076,
					["realm"] = "Ravenholdt",
				},
				["Player-3682-08B00D21"] = {
					["ilvl"] = 415.9375,
					["guid"] = "Player-3682-08B00D21",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1678914310,
					["realm"] = "Ragnaros",
					["name"] = "Spooke-Ragnaros",
					["specID"] = 253,
					["enchantingLvl"] = 0,
					["rank"] = "Mythic Raider",
				},
				["Player-1615-09B6ED2F"] = {
					["name"] = "додопицца-Ревущийфьорд",
					["guid"] = "Player-1615-09B6ED2F",
					["class"] = "PALADIN",
					["cache_time"] = 1685491336,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3391-09177F31"] = {
					["name"] = "Gregios-Silvermoon",
					["guid"] = "Player-3391-09177F31",
					["class"] = "SHAMAN",
					["cache_time"] = 1680258337,
					["realm"] = "Silvermoon",
				},
				["Player-1596-06AA532A"] = {
					["name"] = "Casmeister-Deathwing",
					["guid"] = "Player-1596-06AA532A",
					["class"] = "DRUID",
					["cache_time"] = 1685343922,
					["realm"] = "Deathwing",
				},
				["Player-1379-0AD2E4A0"] = {
					["name"] = "Elporrazos-Sanguino",
					["guid"] = "Player-1379-0AD2E4A0",
					["class"] = "WARRIOR",
					["cache_time"] = 1684926332,
					["realm"] = "Sanguino",
				},
				["Player-509-05506E73"] = {
					["name"] = "Sween-Sargeras",
					["guid"] = "Player-509-05506E73",
					["class"] = "HUNTER",
					["cache_time"] = 1676973948,
					["realm"] = "Sargeras",
				},
				["Player-3713-0719EFCE"] = {
					["name"] = "Qrdu-BurningLegion",
					["guid"] = "Player-3713-0719EFCE",
					["class"] = "PALADIN",
					["cache_time"] = 1680292466,
					["realm"] = "BurningLegion",
				},
				["Player-3682-0AAF5EE2"] = {
					["ilvl"] = 436.75,
					["guid"] = "Player-3682-0AAF5EE2",
					["class"] = "PALADIN",
					["role"] = "TANK",
					["cache_time"] = 1686170394,
					["rank"] = "Recruiter",
					["name"] = "Fatpeonlover-Ragnaros",
					["specID"] = 66,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-581-09904BB6"] = {
					["name"] = "Snixxer-Blackrock",
					["guid"] = "Player-581-09904BB6",
					["class"] = "DRUID",
					["cache_time"] = 1684158100,
					["realm"] = "Blackrock",
				},
				["Player-3674-07876E27"] = {
					["name"] = "Javicdh-TwistingNether",
					["guid"] = "Player-3674-07876E27",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687157922,
					["realm"] = "TwistingNether",
				},
				["Player-570-09B5F816"] = {
					["name"] = "Démónlul-Azshara",
					["guid"] = "Player-570-09B5F816",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676768222,
					["realm"] = "Azshara",
				},
				["Player-1378-0A6826BC"] = {
					["name"] = "Piit-C'Thun",
					["guid"] = "Player-1378-0A6826BC",
					["class"] = "MAGE",
					["cache_time"] = 1687248521,
					["realm"] = "C'Thun",
				},
				["Player-1604-093E2639"] = {
					["name"] = "пандоёжик-СвежевательДуш",
					["guid"] = "Player-1604-093E2639",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1685864518,
					["realm"] = "СвежевательДуш",
				},
				["Player-3682-0B23244A"] = {
					["ilvl"] = 420.5625,
					["guid"] = "Player-3682-0B23244A",
					["class"] = "SHAMAN",
					["rank"] = "Raider",
					["role"] = "DAMAGER",
					["cache_time"] = 1686167877,
					["name"] = "Earthshakêr-Ragnaros",
					["enchanter"] = true,
					["specID"] = 262,
					["enchantingLvl"] = 80,
					["realm"] = "Ragnaros",
				},
				["Player-3703-0687CDA1"] = {
					["name"] = "Araxs-Frostwolf",
					["guid"] = "Player-3703-0687CDA1",
					["class"] = "DRUID",
					["cache_time"] = 1679138037,
					["realm"] = "Frostwolf",
				},
				["Player-580-0A732313"] = {
					["ilvl"] = 438.75,
					["guid"] = "Player-580-0A732313",
					["class"] = "WARRIOR",
					["role"] = "TANK",
					["cache_time"] = 1686062777,
					["rank"] = "Raider",
					["name"] = "Altøn-Blackmoore",
					["specID"] = 73,
					["enchantingLvl"] = 0,
					["realm"] = "Blackmoore",
				},
				["Player-1329-08D98636"] = {
					["name"] = "Mcbair-Ravencrest",
					["guid"] = "Player-1329-08D98636",
					["class"] = "DRUID",
					["cache_time"] = 1677227556,
					["realm"] = "Ravencrest",
				},
				["Player-1302-09F8B814"] = {
					["name"] = "Ménéthael-Archimonde",
					["guid"] = "Player-1302-09F8B814",
					["class"] = "PALADIN",
					["cache_time"] = 1677606207,
					["realm"] = "Archimonde",
				},
				["Player-1602-0F1FC3A9"] = {
					["name"] = "ёкоканно-Гордунни",
					["guid"] = "Player-1602-0F1FC3A9",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687248139,
					["realm"] = "Гордунни",
				},
				["Player-1098-099103AB"] = {
					["name"] = "Rotnichtblau-Malygos",
					["guid"] = "Player-1098-099103AB",
					["class"] = "PALADIN",
					["cache_time"] = 1689948802,
					["realm"] = "Malygos",
				},
				["Player-612-09CFBAF3"] = {
					["name"] = "Cips-Ulduar",
					["guid"] = "Player-612-09CFBAF3",
					["class"] = "PRIEST",
					["cache_time"] = 1680292466,
					["realm"] = "Ulduar",
				},
				["Player-3674-0B2A0D3A"] = {
					["name"] = "Sikryu-TwistingNether",
					["guid"] = "Player-3674-0B2A0D3A",
					["class"] = "HUNTER",
					["cache_time"] = 1689699139,
					["realm"] = "TwistingNether",
				},
				["Player-1596-08AE308A"] = {
					["name"] = "Eadros-TheMaelstrom",
					["guid"] = "Player-1596-08AE308A",
					["class"] = "HUNTER",
					["cache_time"] = 1688685563,
					["realm"] = "TheMaelstrom",
				},
				["Player-3656-0A1040AE"] = {
					["name"] = "Máuw-Stormreaver",
					["guid"] = "Player-3656-0A1040AE",
					["class"] = "DRUID",
					["cache_time"] = 1684883011,
					["realm"] = "Stormreaver",
				},
				["Player-3391-0C814EEB"] = {
					["name"] = "Holyshadöw-Silvermoon",
					["guid"] = "Player-3391-0C814EEB",
					["class"] = "PALADIN",
					["cache_time"] = 1676960971,
					["realm"] = "Silvermoon",
				},
				["Player-1379-0AD4015B"] = {
					["name"] = "Swagee-Sanguino",
					["guid"] = "Player-1379-0AD4015B",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1675789443,
					["realm"] = "Sanguino",
				},
				["Player-3674-05A3FD15"] = {
					["ilvl"] = 432,
					["guid"] = "Player-3674-05A3FD15",
					["class"] = "WARLOCK",
					["realm"] = "TwistingNether",
					["role"] = "DAMAGER",
					["cache_time"] = 1689802006,
					["name"] = "Khaêle-TwistingNether",
					["specID"] = 267,
					["enchanter"] = true,
					["enchantingLvl"] = 1,
					["rank"] = "Social",
				},
				["Player-581-0A700349"] = {
					["ilvl"] = 389.4375,
					["guid"] = "Player-581-0A700349",
					["class"] = "ROGUE",
					["role"] = "DAMAGER",
					["name"] = "Vockerogue-Blackrock",
					["realm"] = "Blackrock",
					["cache_time"] = 1680432546,
					["specID"] = 261,
					["enchantingLvl"] = 0,
					["rank"] = "Unguilded",
				},
				["Player-2073-0663C8C0"] = {
					["name"] = "Mope-Stormscale",
					["guid"] = "Player-2073-0663C8C0",
					["class"] = "WARRIOR",
					["cache_time"] = 1677339563,
					["realm"] = "Stormscale",
				},
				["Player-3674-086CC206"] = {
					["name"] = "Rêqt-TwistingNether",
					["guid"] = "Player-3674-086CC206",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1679995682,
					["realm"] = "TwistingNether",
				},
				["Player-3391-0C56FE1E"] = {
					["name"] = "Jumpingjeff-Silvermoon",
					["guid"] = "Player-3391-0C56FE1E",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684420122,
					["realm"] = "Silvermoon",
				},
				["Player-3657-0844E08B"] = {
					["name"] = "Nofco-Frostwhisper",
					["guid"] = "Player-3657-0844E08B",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687257934,
					["realm"] = "Frostwhisper",
				},
				["Player-580-0A231417"] = {
					["name"] = "Grendul-Blackmoore",
					["guid"] = "Player-580-0A231417",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1689804288,
					["realm"] = "Blackmoore",
				},
				["Player-3682-0B15D86C"] = {
					["name"] = "Rîz-Ragnaros",
					["guid"] = "Player-3682-0B15D86C",
					["class"] = "WARRIOR",
					["cache_time"] = 1676369902,
					["realm"] = "Ragnaros",
				},
				["Player-1604-0A9C4049"] = {
					["name"] = "мнебобо-СвежевательДуш",
					["guid"] = "Player-1604-0A9C4049",
					["class"] = "WARRIOR",
					["cache_time"] = 1684052763,
					["realm"] = "СвежевательДуш",
				},
				["Player-1099-0A4AB9D3"] = {
					["name"] = "Shálltear-Rexxar",
					["guid"] = "Player-1099-0A4AB9D3",
					["class"] = "HUNTER",
					["cache_time"] = 1676465421,
					["realm"] = "Rexxar",
				},
				["Player-3703-09FFE232"] = {
					["name"] = "Jacklsøn-Frostwolf",
					["guid"] = "Player-3703-09FFE232",
					["class"] = "ROGUE",
					["cache_time"] = 1684417826,
					["realm"] = "Frostwolf",
				},
				["Player-1602-0F4CA135"] = {
					["name"] = "дракздорму-Гордунни",
					["guid"] = "Player-1602-0F4CA135",
					["class"] = "EVOKER",
					["cache_time"] = 1677110266,
					["realm"] = "Гордунни",
				},
				["Player-1596-0F55DD08"] = {
					["name"] = "Xalaluha-TheMaelstrom",
					["guid"] = "Player-1596-0F55DD08",
					["class"] = "WARLOCK",
					["cache_time"] = 1683073733,
					["realm"] = "TheMaelstrom",
				},
				["Player-1084-0A8C7858"] = {
					["name"] = "Ojii-TarrenMill",
					["guid"] = "Player-1084-0A8C7858",
					["class"] = "DRUID",
					["cache_time"] = 1679244313,
					["realm"] = "TarrenMill",
				},
				["Player-2073-0426B2C2"] = {
					["name"] = "Icozy-Stormscale",
					["guid"] = "Player-2073-0426B2C2",
					["class"] = "SHAMAN",
					["cache_time"] = 1685780231,
					["realm"] = "Stormscale",
				},
				["Player-1325-03C1028E"] = {
					["name"] = "Inamorata-Aggramar",
					["guid"] = "Player-1325-03C1028E",
					["class"] = "PRIEST",
					["cache_time"] = 1689800841,
					["realm"] = "Aggramar",
				},
				["Player-1305-0C205D37"] = {
					["name"] = "Nedtùr-Kazzak",
					["guid"] = "Player-1305-0C205D37",
					["class"] = "WARLOCK",
					["cache_time"] = 1686121310,
					["realm"] = "Kazzak",
				},
				["Player-1403-09D889A9"] = {
					["name"] = "Plagueborer-Draenor",
					["guid"] = "Player-1403-09D889A9",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676439591,
					["realm"] = "Draenor",
				},
				["Player-3674-0B1653C7"] = {
					["name"] = "Wíndblow-TwistingNether",
					["guid"] = "Player-3674-0B1653C7",
					["class"] = "PRIEST",
					["cache_time"] = 1684590154,
					["realm"] = "TwistingNether",
				},
				["Player-3682-0B1484A5"] = {
					["name"] = "Empod-Ragnaros",
					["guid"] = "Player-3682-0B1484A5",
					["class"] = "WARLOCK",
					["cache_time"] = 1676490465,
					["realm"] = "Ragnaros",
				},
				["Player-1928-0819AF31"] = {
					["name"] = "хоризма-Голдринн",
					["guid"] = "Player-1928-0819AF31",
					["class"] = "MONK",
					["cache_time"] = 1688985357,
					["realm"] = "Голдринн",
				},
				["Player-1084-0A921527"] = {
					["name"] = "Barco-TarrenMill",
					["guid"] = "Player-1084-0A921527",
					["class"] = "WARRIOR",
					["cache_time"] = 1687298820,
					["realm"] = "TarrenMill",
				},
				["Player-1615-09A3C39F"] = {
					["name"] = "скианида-Ревущийфьорд",
					["guid"] = "Player-1615-09A3C39F",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676144913,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3702-0A7BC686"] = {
					["name"] = "Fyrens-ArgentDawn",
					["guid"] = "Player-3702-0A7BC686",
					["class"] = "MAGE",
					["cache_time"] = 1678411108,
					["realm"] = "ArgentDawn",
				},
				["Player-1305-0C524406"] = {
					["ilvl"] = 432.875,
					["guid"] = "Player-1305-0C524406",
					["class"] = "DRUID",
					["role"] = "DAMAGER",
					["cache_time"] = 1686936164,
					["realm"] = "Kazzak",
					["name"] = "Ctoxx-Kazzak",
					["specID"] = 102,
					["enchantingLvl"] = 0,
					["rank"] = "Alt",
				},
				["Player-1408-0A4CCDCA"] = {
					["name"] = "Driaris-DunMorogh",
					["guid"] = "Player-1408-0A4CCDCA",
					["class"] = "EVOKER",
					["cache_time"] = 1679939195,
					["realm"] = "DunMorogh",
				},
				["Player-3691-09BF0910"] = {
					["name"] = "Nerghata-Blackhand",
					["guid"] = "Player-3691-09BF0910",
					["class"] = "DRUID",
					["cache_time"] = 1677665404,
					["realm"] = "Blackhand",
				},
				["Player-1621-0B058547"] = {
					["name"] = "Elanora-Dalaran",
					["guid"] = "Player-1621-0B058547",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1683965309,
					["realm"] = "Dalaran",
				},
				["Player-3703-092713DC"] = {
					["name"] = "Xayalin-Frostwolf",
					["guid"] = "Player-3703-092713DC",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676220405,
					["realm"] = "Frostwolf",
				},
				["Player-1305-0C59B9D7"] = {
					["name"] = "Demidrake-Kazzak",
					["guid"] = "Player-1305-0C59B9D7",
					["class"] = "EVOKER",
					["cache_time"] = 1678374221,
					["realm"] = "Kazzak",
				},
				["Player-3391-0C2C9468"] = {
					["name"] = "Alekazi-Silvermoon",
					["guid"] = "Player-3391-0C2C9468",
					["class"] = "WARLOCK",
					["cache_time"] = 1677126111,
					["realm"] = "Silvermoon",
				},
				["Player-1084-0A8B3B03"] = {
					["name"] = "Stepbloodelf-TarrenMill",
					["guid"] = "Player-1084-0A8B3B03",
					["class"] = "ROGUE",
					["cache_time"] = 1676452417,
					["realm"] = "TarrenMill",
				},
				["Player-1402-0A2AE41F"] = {
					["name"] = "Gémli-Doomhammer",
					["guid"] = "Player-1402-0A2AE41F",
					["class"] = "SHAMAN",
					["cache_time"] = 1689253178,
					["realm"] = "Doomhammer",
				},
				["Player-1615-0B0A2444"] = {
					["name"] = "ламелоса-Ревущийфьорд",
					["guid"] = "Player-1615-0B0A2444",
					["class"] = "EVOKER",
					["cache_time"] = 1687259258,
					["realm"] = "Ревущийфьорд",
				},
				["Player-580-09F452F6"] = {
					["name"] = "Bleydés-Blackmoore",
					["guid"] = "Player-580-09F452F6",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677518150,
					["realm"] = "Blackmoore",
				},
				["Player-3391-0C7B3CFD"] = {
					["name"] = "Lythera-Silvermoon",
					["guid"] = "Player-3391-0C7B3CFD",
					["class"] = "HUNTER",
					["cache_time"] = 1676343727,
					["realm"] = "Silvermoon",
				},
				["Player-1390-0C09D489"] = {
					["name"] = "Xvagar-Hyjal",
					["guid"] = "Player-1390-0C09D489",
					["class"] = "MONK",
					["cache_time"] = 1679133580,
					["realm"] = "Hyjal",
				},
				["Player-1305-0B9D3594"] = {
					["name"] = "Psymode-Kazzak",
					["guid"] = "Player-1305-0B9D3594",
					["class"] = "PRIEST",
					["cache_time"] = 1687257934,
					["realm"] = "Kazzak",
				},
				["Player-1305-0C4DDE17"] = {
					["name"] = "Buufu-Kazzak",
					["guid"] = "Player-1305-0C4DDE17",
					["class"] = "DRUID",
					["cache_time"] = 1687248139,
					["realm"] = "Kazzak",
				},
				["Player-3702-09CD0F20"] = {
					["name"] = "Gigasneak-ArgentDawn",
					["guid"] = "Player-3702-09CD0F20",
					["class"] = "ROGUE",
					["cache_time"] = 1676519225,
					["realm"] = "ArgentDawn",
				},
				["Player-3686-09D9874F"] = {
					["name"] = "Quweridon-Antonidas",
					["guid"] = "Player-3686-09D9874F",
					["class"] = "DRUID",
					["cache_time"] = 1689712190,
					["realm"] = "Antonidas",
				},
				["Player-3674-0B1A59BF"] = {
					["name"] = "Ayyoron-TwistingNether",
					["guid"] = "Player-3674-0B1A59BF",
					["class"] = "PALADIN",
					["cache_time"] = 1680513310,
					["realm"] = "TwistingNether",
				},
				["Player-1084-09DA8345"] = {
					["name"] = "Nozemuledja-TarrenMill",
					["guid"] = "Player-1084-09DA8345",
					["class"] = "ROGUE",
					["cache_time"] = 1684210573,
					["realm"] = "TarrenMill",
				},
				["Player-1335-09EB1218"] = {
					["name"] = "Mooviix-Ysondre",
					["guid"] = "Player-1335-09EB1218",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689799678,
					["realm"] = "Ysondre",
				},
				["Player-2073-06CDA785"] = {
					["name"] = "Meerliin-Stormscale",
					["guid"] = "Player-2073-06CDA785",
					["class"] = "MAGE",
					["cache_time"] = 1676340212,
					["realm"] = "Stormscale",
				},
				["Player-1596-0F35A258"] = {
					["name"] = "Duskstrike-TheMaelstrom",
					["guid"] = "Player-1596-0F35A258",
					["class"] = "WARLOCK",
					["cache_time"] = 1688687270,
					["realm"] = "TheMaelstrom",
				},
				["Player-633-0A65B392"] = {
					["name"] = "Amilo-Saurfang",
					["guid"] = "Player-633-0A65B392",
					["class"] = "PALADIN",
					["cache_time"] = 1685047577,
					["realm"] = "Saurfang",
				},
				["Player-1403-0614E05A"] = {
					["name"] = "Ziepoesnetni-Draenor",
					["guid"] = "Player-1403-0614E05A",
					["class"] = "DRUID",
					["cache_time"] = 1689804288,
					["realm"] = "Draenor",
				},
				["Player-1602-06A1C7B5"] = {
					["name"] = "корадо-Гордунни",
					["guid"] = "Player-1602-06A1C7B5",
					["class"] = "MAGE",
					["cache_time"] = 1684927056,
					["realm"] = "Гордунни",
				},
				["Player-581-0A6F5BC9"] = {
					["name"] = "Xythuz-Blackrock",
					["guid"] = "Player-581-0A6F5BC9",
					["class"] = "HUNTER",
					["cache_time"] = 1680292466,
					["realm"] = "Blackrock",
				},
				["Player-3682-0A7AEBD2"] = {
					["ilvl"] = 419.875,
					["guid"] = "Player-3682-0A7AEBD2",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1680433453,
					["realm"] = "Ragnaros",
					["name"] = "Zathaa-Ragnaros",
					["specID"] = 253,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-581-0A5E2CDD"] = {
					["name"] = "Darcurion-Blackrock",
					["guid"] = "Player-581-0A5E2CDD",
					["class"] = "EVOKER",
					["cache_time"] = 1684235960,
					["realm"] = "Blackrock",
				},
				["Player-3391-0C982368"] = {
					["name"] = "Afroblue-Silvermoon",
					["guid"] = "Player-3391-0C982368",
					["class"] = "MAGE",
					["cache_time"] = 1689677222,
					["realm"] = "Silvermoon",
				},
				["Player-2073-09FBF834"] = {
					["name"] = "Shreksie-Stormscale",
					["guid"] = "Player-2073-09FBF834",
					["class"] = "PRIEST",
					["cache_time"] = 1678894799,
					["realm"] = "Stormscale",
				},
				["Player-580-0A6D21F0"] = {
					["name"] = "Hayhatschi-Blackmoore",
					["guid"] = "Player-580-0A6D21F0",
					["class"] = "ROGUE",
					["cache_time"] = 1679027919,
					["realm"] = "Blackmoore",
				},
				["Player-1084-0A95F2AC"] = {
					["name"] = "Valroath-TarrenMill",
					["guid"] = "Player-1084-0A95F2AC",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679244313,
					["realm"] = "TarrenMill",
				},
				["Player-3690-0AF597B3"] = {
					["name"] = "Fläve-KhazModan",
					["guid"] = "Player-3690-0AF597B3",
					["class"] = "DRUID",
					["cache_time"] = 1676988319,
					["realm"] = "KhazModan",
				},
				["Player-1390-0AF63C1B"] = {
					["name"] = "Sûnder-Hyjal",
					["guid"] = "Player-1390-0AF63C1B",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1690483124,
					["realm"] = "Hyjal",
				},
				["Player-1604-09B9D2AD"] = {
					["name"] = "гольфштерн-СвежевательДуш",
					["guid"] = "Player-1604-09B9D2AD",
					["class"] = "PALADIN",
					["cache_time"] = 1684052763,
					["realm"] = "СвежевательДуш",
				},
				["Player-1602-0F47490E"] = {
					["name"] = "эратурим-Гордунни",
					["guid"] = "Player-1602-0F47490E",
					["class"] = "EVOKER",
					["cache_time"] = 1686754263,
					["realm"] = "Гордунни",
				},
				["Player-1305-0BB02341"] = {
					["name"] = "Xtotem-Kazzak",
					["guid"] = "Player-1305-0BB02341",
					["class"] = "SHAMAN",
					["cache_time"] = 1689699139,
					["realm"] = "Kazzak",
				},
				["Player-3682-0B260071"] = {
					["ilvl"] = 436.0625,
					["guid"] = "Player-3682-0B260071",
					["class"] = "PALADIN",
					["rank"] = "Trial",
					["role"] = "DAMAGER",
					["cache_time"] = 1685651466,
					["name"] = "Holylok-Ragnaros",
					["enchanter"] = true,
					["specID"] = 70,
					["enchantingLvl"] = 55,
					["realm"] = "Ragnaros",
				},
				["Player-3682-06F1E341"] = {
					["ilvl"] = 427.9375,
					["guid"] = "Player-3682-06F1E341",
					["class"] = "DRUID",
					["role"] = "HEALER",
					["cache_time"] = 1684475088,
					["rank"] = "Fárajóóó",
					["name"] = "Mackósajtt-Ragnaros",
					["specID"] = 105,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-581-03DAA3BE"] = {
					["name"] = "Hordala-Blackrock",
					["guid"] = "Player-581-03DAA3BE",
					["class"] = "PALADIN",
					["cache_time"] = 1687952836,
					["realm"] = "Blackrock",
				},
				["Player-1305-077A5BA3"] = {
					["name"] = "Ket-Kazzak",
					["guid"] = "Player-1305-077A5BA3",
					["class"] = "PALADIN",
					["cache_time"] = 1684210573,
					["realm"] = "Kazzak",
				},
				["Player-1305-0C80A64B"] = {
					["name"] = "Nét-Kazzak",
					["guid"] = "Player-1305-0C80A64B",
					["class"] = "MONK",
					["cache_time"] = 1677665404,
					["realm"] = "Kazzak",
				},
				["Player-1084-0A9EC21D"] = {
					["name"] = "Smygbullar-TarrenMill",
					["guid"] = "Player-1084-0A9EC21D",
					["class"] = "ROGUE",
					["cache_time"] = 1684877956,
					["realm"] = "TarrenMill",
				},
				["Player-580-093958D2"] = {
					["name"] = "Hulao-Tichondrius",
					["guid"] = "Player-580-093958D2",
					["class"] = "MONK",
					["cache_time"] = 1686754263,
					["realm"] = "Tichondrius",
				},
				["Player-1329-09AA3820"] = {
					["name"] = "Zhool-Ravencrest",
					["guid"] = "Player-1329-09AA3820",
					["class"] = "WARLOCK",
					["cache_time"] = 1688983952,
					["realm"] = "Ravencrest",
				},
				["Player-1096-0990A9C4"] = {
					["name"] = "Kab-EarthenRing",
					["guid"] = "Player-1096-0990A9C4",
					["class"] = "SHAMAN",
					["cache_time"] = 1687791012,
					["realm"] = "EarthenRing",
				},
				["Player-1335-0A0A70AC"] = {
					["name"] = "Moufti-Ysondre",
					["guid"] = "Player-1335-0A0A70AC",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1690410513,
					["realm"] = "Ysondre",
				},
				["Player-3682-0A977845"] = {
					["ilvl"] = 437.375,
					["guid"] = "Player-3682-0A977845",
					["class"] = "DRUID",
					["role"] = "DAMAGER",
					["cache_time"] = 1689183684,
					["realm"] = "Ragnaros",
					["name"] = "Fapàsztor-Ragnaros",
					["specID"] = 103,
					["enchantingLvl"] = 0,
					["rank"] = "Raider1",
				},
				["Player-1405-0823877A"] = {
					["name"] = "Alkazone-DieNachtwache",
					["guid"] = "Player-1405-0823877A",
					["class"] = "DRUID",
					["cache_time"] = 1679410208,
					["realm"] = "DieNachtwache",
				},
				["Player-1302-0C91A1A3"] = {
					["name"] = "Unstar-Archimonde",
					["guid"] = "Player-1302-0C91A1A3",
					["class"] = "MAGE",
					["cache_time"] = 1687261056,
					["realm"] = "Archimonde",
				},
				["Player-1085-09963573"] = {
					["name"] = "Bonnybon-TheSha'tar",
					["guid"] = "Player-1085-09963573",
					["class"] = "PRIEST",
					["cache_time"] = 1687949172,
					["realm"] = "TheSha'tar",
				},
				["Player-1335-037588CE"] = {
					["name"] = "Drin-Ysondre",
					["guid"] = "Player-1335-037588CE",
					["class"] = "MONK",
					["cache_time"] = 1686121310,
					["realm"] = "Ysondre",
				},
				["Player-3682-0AAA6E42"] = {
					["ilvl"] = 412.375,
					["guid"] = "Player-3682-0AAA6E42",
					["class"] = "MONK",
					["role"] = "TANK",
					["cache_time"] = 1679942445,
					["realm"] = "Ragnaros",
					["name"] = "Snuggzugg-Ragnaros",
					["specID"] = 268,
					["enchantingLvl"] = 0,
					["rank"] = "Mythic Raider",
				},
				["Player-3674-0B0A369C"] = {
					["name"] = "Kumawakawoke-TwistingNether",
					["guid"] = "Player-3674-0B0A369C",
					["class"] = "EVOKER",
					["cache_time"] = 1687259300,
					["realm"] = "TwistingNether",
				},
				["Player-580-0A4DB79A"] = {
					["name"] = "Yágamí-Blackmoore",
					["guid"] = "Player-580-0A4DB79A",
					["class"] = "PALADIN",
					["cache_time"] = 1677410550,
					["realm"] = "Blackmoore",
				},
				["Player-3682-0B262FDE"] = {
					["ilvl"] = 446.5,
					["guid"] = "Player-3682-0B262FDE",
					["class"] = "EVOKER",
					["role"] = "DAMAGER",
					["cache_time"] = 1689281451,
					["realm"] = "Ragnaros",
					["name"] = "çakey-Ragnaros",
					["specID"] = 1467,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1390-06D343B0"] = {
					["name"] = "Fenum-Hyjal",
					["guid"] = "Player-1390-06D343B0",
					["class"] = "PALADIN",
					["cache_time"] = 1676973948,
					["realm"] = "Hyjal",
				},
				["Player-1329-09F7ADCB"] = {
					["name"] = "Frukostboll-Ravencrest",
					["guid"] = "Player-1329-09F7ADCB",
					["class"] = "SHAMAN",
					["cache_time"] = 1677110266,
					["realm"] = "Ravencrest",
				},
				["Player-3682-0B1A2316"] = {
					["ilvl"] = 416.75,
					["guid"] = "Player-3682-0B1A2316",
					["class"] = "DEMONHUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1686044481,
					["realm"] = "Ragnaros",
					["name"] = "Chaosbrìnger-Ragnaros",
					["specID"] = 577,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-3713-0876A71C"] = {
					["name"] = "Acosta-BurningLegion",
					["guid"] = "Player-3713-0876A71C",
					["class"] = "MAGE",
					["cache_time"] = 1676479581,
					["realm"] = "BurningLegion",
				},
				["Player-1305-0C63546F"] = {
					["name"] = "Beefdáddy-Kazzak",
					["guid"] = "Player-1305-0C63546F",
					["class"] = "DRUID",
					["cache_time"] = 1677665404,
					["realm"] = "Kazzak",
				},
				["Player-1305-0C7FC78D"] = {
					["name"] = "Pumpér-Kazzak",
					["guid"] = "Player-1305-0C7FC78D",
					["class"] = "WARLOCK",
					["cache_time"] = 1686935978,
					["realm"] = "Kazzak",
				},
				["Player-1403-09830D1E"] = {
					["name"] = "Rheisdul-Draenor",
					["guid"] = "Player-1403-09830D1E",
					["class"] = "WARLOCK",
					["cache_time"] = 1680754040,
					["realm"] = "Draenor",
				},
				["Player-3682-09450CB0"] = {
					["ilvl"] = 424.3125,
					["guid"] = "Player-3682-09450CB0",
					["class"] = "MONK",
					["realm"] = "Ragnaros",
					["role"] = "DAMAGER",
					["cache_time"] = 1684960646,
					["name"] = "Bhikkhu-Ragnaros",
					["specID"] = 269,
					["enchanter"] = true,
					["enchantingLvl"] = 35,
					["rank"] = "Mythic Raider",
				},
				["Player-1379-0AE43E90"] = {
					["name"] = "Notobrew-Sanguino",
					["guid"] = "Player-1379-0AE43E90",
					["class"] = "MONK",
					["cache_time"] = 1684603502,
					["realm"] = "Sanguino",
				},
				["Player-3674-0B26863D"] = {
					["name"] = "Bábíer-TwistingNether",
					["guid"] = "Player-3674-0B26863D",
					["class"] = "PRIEST",
					["cache_time"] = 1685305181,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0C82BF78"] = {
					["name"] = "àgentgirl-Kazzak",
					["guid"] = "Player-1305-0C82BF78",
					["class"] = "PALADIN",
					["cache_time"] = 1684501707,
					["realm"] = "Kazzak",
				},
				["Player-3679-0C62DEEC"] = {
					["name"] = "Tmfløww-Aegwynn",
					["guid"] = "Player-3679-0C62DEEC",
					["class"] = "SHAMAN",
					["cache_time"] = 1679228248,
					["realm"] = "Aegwynn",
				},
				["Player-580-0A723F71"] = {
					["name"] = "Antíí-Blackmoore",
					["guid"] = "Player-580-0A723F71",
					["class"] = "PALADIN",
					["cache_time"] = 1685837361,
					["realm"] = "Blackmoore",
				},
				["Player-1302-066822CC"] = {
					["name"] = "Jhinbo-Archimonde",
					["guid"] = "Player-1302-066822CC",
					["class"] = "WARLOCK",
					["cache_time"] = 1677106953,
					["realm"] = "Archimonde",
				},
				["Player-1305-0C452F39"] = {
					["name"] = "Zitlock-Kazzak",
					["guid"] = "Player-1305-0C452F39",
					["class"] = "WARLOCK",
					["cache_time"] = 1684566068,
					["realm"] = "Kazzak",
				},
				["Player-1615-0A5B269B"] = {
					["name"] = "новичок-Ревущийфьорд",
					["guid"] = "Player-1615-0A5B269B",
					["class"] = "ROGUE",
					["cache_time"] = 1684926079,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1615-0A5FC4AC"] = {
					["name"] = "симпоз-Ревущийфьорд",
					["guid"] = "Player-1615-0A5FC4AC",
					["class"] = "PRIEST",
					["cache_time"] = 1685834664,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1305-07ADC3A8"] = {
					["name"] = "Uaeload-Kazzak",
					["guid"] = "Player-1305-07ADC3A8",
					["class"] = "DRUID",
					["cache_time"] = 1679747022,
					["realm"] = "Kazzak",
				},
				["Player-1390-08A95511"] = {
					["name"] = "Faëllys-Hyjal",
					["guid"] = "Player-1390-08A95511",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1678894799,
					["realm"] = "Hyjal",
				},
				["Player-1305-0C572B9F"] = {
					["name"] = "Thu-Kazzak",
					["guid"] = "Player-1305-0C572B9F",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1680218725,
					["realm"] = "Kazzak",
				},
				["Player-1379-08A7E534"] = {
					["name"] = "Arakalada-Uldum",
					["guid"] = "Player-1379-08A7E534",
					["class"] = "WARLOCK",
					["cache_time"] = 1689772053,
					["realm"] = "Uldum",
				},
				["Player-1316-0B2E34E0"] = {
					["name"] = "Lenna-Nemesis",
					["guid"] = "Player-1316-0B2E34E0",
					["class"] = "PRIEST",
					["cache_time"] = 1689804288,
					["realm"] = "Nemesis",
				},
				["Player-1302-0944E360"] = {
					["name"] = "Finegæs-Archimonde",
					["guid"] = "Player-1302-0944E360",
					["class"] = "DRUID",
					["cache_time"] = 1678616145,
					["realm"] = "Archimonde",
				},
				["Player-1096-0855519F"] = {
					["name"] = "Borp-DefiasBrotherhood",
					["guid"] = "Player-1096-0855519F",
					["class"] = "MAGE",
					["cache_time"] = 1678458531,
					["realm"] = "DefiasBrotherhood",
				},
				["Player-1379-0A9FC242"] = {
					["name"] = "Drakmanu-Sanguino",
					["guid"] = "Player-1379-0A9FC242",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1685539218,
					["realm"] = "Sanguino",
				},
				["Player-1105-08336222"] = {
					["name"] = "Yamà-Nazjatar",
					["guid"] = "Player-1105-08336222",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676785859,
					["realm"] = "Nazjatar",
				},
				["Player-1403-09CC3594"] = {
					["name"] = "Faleha-Draenor",
					["guid"] = "Player-1403-09CC3594",
					["class"] = "DRUID",
					["cache_time"] = 1680112361,
					["realm"] = "Draenor",
				},
				["Player-1084-0A8E54D2"] = {
					["name"] = "Benk-TarrenMill",
					["guid"] = "Player-1084-0A8E54D2",
					["class"] = "WARRIOR",
					["cache_time"] = 1678480586,
					["realm"] = "TarrenMill",
				},
				["Player-1602-0F5574BB"] = {
					["name"] = "алесто-Гордунни",
					["guid"] = "Player-1602-0F5574BB",
					["class"] = "DRUID",
					["cache_time"] = 1678894799,
					["realm"] = "Гордунни",
				},
				["Player-3682-0A567F6A"] = {
					["name"] = "Vallgar-Ragnaros",
					["guid"] = "Player-3682-0A567F6A",
					["class"] = "HUNTER",
					["cache_time"] = 1688671393,
					["realm"] = "Ragnaros",
				},
				["Player-1084-0979329F"] = {
					["name"] = "Mofasa-TarrenMill",
					["guid"] = "Player-1084-0979329F",
					["class"] = "MONK",
					["cache_time"] = 1685437969,
					["realm"] = "TarrenMill",
				},
				["Player-3391-0C539A05"] = {
					["name"] = "Scalespaw-Silvermoon",
					["guid"] = "Player-3391-0C539A05",
					["class"] = "EVOKER",
					["cache_time"] = 1677258735,
					["realm"] = "Silvermoon",
				},
				["Player-1305-0A46FA85"] = {
					["name"] = "Oldowl-Kazzak",
					["guid"] = "Player-1305-0A46FA85",
					["class"] = "DRUID",
					["cache_time"] = 1679938772,
					["realm"] = "Kazzak",
				},
				["Player-1092-07F7ED64"] = {
					["name"] = "Hemly-Drak'thul",
					["guid"] = "Player-1092-07F7ED64",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678126084,
					["realm"] = "Drak'thul",
				},
				["Player-3686-09F1424C"] = {
					["name"] = "Muichirô-Antonidas",
					["guid"] = "Player-3686-09F1424C",
					["class"] = "ROGUE",
					["cache_time"] = 1689804288,
					["realm"] = "Antonidas",
				},
				["Player-1084-0A3927EB"] = {
					["name"] = "Rickyjo-TarrenMill",
					["guid"] = "Player-1084-0A3927EB",
					["class"] = "PALADIN",
					["cache_time"] = 1677322749,
					["realm"] = "TarrenMill",
				},
				["Player-1084-0A8478A8"] = {
					["name"] = "Drakepumpa-TarrenMill",
					["guid"] = "Player-1084-0A8478A8",
					["class"] = "EVOKER",
					["cache_time"] = 1680290994,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0BB0C5EA"] = {
					["name"] = "Kaffelito-Kazzak",
					["guid"] = "Player-1305-0BB0C5EA",
					["class"] = "PRIEST",
					["cache_time"] = 1677665404,
					["realm"] = "Kazzak",
				},
				["Player-3692-09AEE02B"] = {
					["name"] = "Knaertzel-Eredar",
					["guid"] = "Player-3692-09AEE02B",
					["class"] = "WARRIOR",
					["cache_time"] = 1685393886,
					["realm"] = "Eredar",
				},
				["Player-1602-0F27097B"] = {
					["name"] = "наглаямакака-Гордунни",
					["guid"] = "Player-1602-0F27097B",
					["class"] = "MAGE",
					["cache_time"] = 1678766041,
					["realm"] = "Гордунни",
				},
				["Player-1403-0A4D366F"] = {
					["name"] = "Injokar-Draenor",
					["guid"] = "Player-1403-0A4D366F",
					["class"] = "EVOKER",
					["cache_time"] = 1677606207,
					["realm"] = "Draenor",
				},
				["Player-3682-0B145FFB"] = {
					["ilvl"] = 410.4375,
					["guid"] = "Player-3682-0B145FFB",
					["class"] = "DEATHKNIGHT",
					["role"] = "DAMAGER",
					["cache_time"] = 1677792647,
					["rank"] = "Trial",
					["name"] = "Carrieddk-Ragnaros",
					["specID"] = 252,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-633-0AC40C09"] = {
					["name"] = "Rydgez-Bloodfeather",
					["guid"] = "Player-633-0AC40C09",
					["class"] = "WARRIOR",
					["cache_time"] = 1686262031,
					["realm"] = "Bloodfeather",
				},
				["Player-1396-0948CD31"] = {
					["name"] = "Drzora-AzjolNerub",
					["guid"] = "Player-1396-0948CD31",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1690409840,
					["realm"] = "AzjolNerub",
				},
				["Player-3703-0652609A"] = {
					["name"] = "Dyssodyson-Frostwolf",
					["guid"] = "Player-3703-0652609A",
					["class"] = "DRUID",
					["cache_time"] = 1679417616,
					["realm"] = "Frostwolf",
				},
				["Player-1604-0F504F71"] = {
					["name"] = "минилайф-СвежевательДуш",
					["guid"] = "Player-1604-0F504F71",
					["class"] = "EVOKER",
					["cache_time"] = 1675869174,
					["realm"] = "СвежевательДуш",
				},
				["Player-1390-0C87452F"] = {
					["name"] = "åyððke-Hyjal",
					["guid"] = "Player-1390-0C87452F",
					["class"] = "ROGUE",
					["cache_time"] = 1680437946,
					["realm"] = "Hyjal",
				},
				["Player-3691-09FB6E6B"] = {
					["name"] = "Pewshok-Blackhand",
					["guid"] = "Player-3691-09FB6E6B",
					["class"] = "SHAMAN",
					["cache_time"] = 1678319979,
					["realm"] = "Blackhand",
				},
				["Player-1329-06A2CD3D"] = {
					["name"] = "Gonamo-Ravencrest",
					["guid"] = "Player-1329-06A2CD3D",
					["class"] = "ROGUE",
					["cache_time"] = 1677085516,
					["realm"] = "Ravencrest",
				},
				["Player-1309-0C2672AA"] = {
					["name"] = "Shog-Pozzodell'Eternità",
					["guid"] = "Player-1309-0C2672AA",
					["class"] = "MAGE",
					["cache_time"] = 1680258337,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-581-083D7B7A"] = {
					["name"] = "Braknar-Blackrock",
					["guid"] = "Player-581-083D7B7A",
					["class"] = "WARRIOR",
					["cache_time"] = 1678640480,
					["realm"] = "Blackrock",
				},
				["Player-1092-0A80EB57"] = {
					["name"] = "Kormios-Drak'thul",
					["guid"] = "Player-1092-0A80EB57",
					["class"] = "EVOKER",
					["cache_time"] = 1687953965,
					["realm"] = "Drak'thul",
				},
				["Player-2073-0717ACA4"] = {
					["name"] = "Holmee-Stormscale",
					["guid"] = "Player-2073-0717ACA4",
					["class"] = "PRIEST",
					["cache_time"] = 1676486995,
					["realm"] = "Stormscale",
				},
				["Player-3674-0B09C400"] = {
					["name"] = "Dadwink-TwistingNether",
					["guid"] = "Player-3674-0B09C400",
					["class"] = "EVOKER",
					["cache_time"] = 1689677222,
					["realm"] = "TwistingNether",
				},
				["Player-1305-05BD8DA6"] = {
					["name"] = "Windzi-Kazzak",
					["guid"] = "Player-1305-05BD8DA6",
					["class"] = "ROGUE",
					["cache_time"] = 1680292466,
					["realm"] = "Kazzak",
				},
				["Player-1602-0F4B7B50"] = {
					["name"] = "янедемон-Гордунни",
					["guid"] = "Player-1602-0F4B7B50",
					["class"] = "WARLOCK",
					["cache_time"] = 1676377737,
					["realm"] = "Гордунни",
				},
				["Player-3391-0C53DFAE"] = {
					["name"] = "Xîuhcoatl-Silvermoon",
					["guid"] = "Player-3391-0C53DFAE",
					["class"] = "EVOKER",
					["cache_time"] = 1676797643,
					["realm"] = "Silvermoon",
				},
				["Player-3674-0AF8597F"] = {
					["name"] = "Azuwrath-TwistingNether",
					["guid"] = "Player-3674-0AF8597F",
					["class"] = "WARLOCK",
					["cache_time"] = 1685291997,
					["realm"] = "TwistingNether",
				},
				["Player-3702-09266390"] = {
					["name"] = "Rignasroh-ArgentDawn",
					["guid"] = "Player-3702-09266390",
					["class"] = "WARRIOR",
					["cache_time"] = 1675870763,
					["realm"] = "ArgentDawn",
				},
				["Player-1396-06651835"] = {
					["name"] = "Hp-AzjolNerub",
					["guid"] = "Player-1396-06651835",
					["class"] = "PRIEST",
					["cache_time"] = 1690750821,
					["realm"] = "AzjolNerub",
				},
				["Player-1084-0A75170D"] = {
					["name"] = "Myríl-TarrenMill",
					["guid"] = "Player-1084-0A75170D",
					["class"] = "PRIEST",
					["cache_time"] = 1685032038,
					["realm"] = "TarrenMill",
				},
				["Player-1305-08AC16F5"] = {
					["name"] = "Erinnaa-Kazzak",
					["guid"] = "Player-1305-08AC16F5",
					["class"] = "MAGE",
					["cache_time"] = 1680470506,
					["realm"] = "Kazzak",
				},
				["Player-3682-0B09C349"] = {
					["ilvl"] = 444.125,
					["guid"] = "Player-3682-0B09C349",
					["class"] = "EVOKER",
					["role"] = "HEALER",
					["cache_time"] = 1689281451,
					["rank"] = "Raider",
					["name"] = "Dokterdrake-Ragnaros",
					["specID"] = 1468,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-1084-0A461A7D"] = {
					["name"] = "Madharvester-TarrenMill",
					["guid"] = "Player-1084-0A461A7D",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1680139732,
					["realm"] = "TarrenMill",
				},
				["Player-3682-0B038E40"] = {
					["ilvl"] = 413.3125,
					["guid"] = "Player-3682-0B038E40",
					["class"] = "DRUID",
					["role"] = "HEALER",
					["cache_time"] = 1680813097,
					["rank"] = "Recruiter",
					["name"] = "Macca-Ragnaros",
					["specID"] = 105,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-3682-0B1E81F6"] = {
					["ilvl"] = 443,
					["guid"] = "Player-3682-0B1E81F6",
					["class"] = "SHAMAN",
					["realm"] = "Ragnaros",
					["role"] = "DAMAGER",
					["cache_time"] = 1687203840,
					["name"] = "Helpdotcom-Ragnaros",
					["specID"] = 263,
					["enchanter"] = true,
					["enchantingLvl"] = 86,
					["rank"] = "Trial",
				},
				["Player-1929-0E488477"] = {
					["name"] = "тогард-ПиратскаяБухта",
					["guid"] = "Player-1929-0E488477",
					["class"] = "WARRIOR",
					["cache_time"] = 1676446776,
					["realm"] = "ПиратскаяБухта",
				},
				["Player-1403-0A6498D9"] = {
					["name"] = "Aztonmartin-Draenor",
					["guid"] = "Player-1403-0A6498D9",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1688947450,
					["realm"] = "Draenor",
				},
				["Player-1602-0F5C2355"] = {
					["name"] = "асоуе-Гордунни",
					["guid"] = "Player-1602-0F5C2355",
					["class"] = "ROGUE",
					["cache_time"] = 1685305181,
					["realm"] = "Гордунни",
				},
				["Player-1335-06845F4F"] = {
					["name"] = "Sigihunter-Ysondre",
					["guid"] = "Player-1335-06845F4F",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1678226933,
					["realm"] = "Ysondre",
				},
				["Player-3682-0B19EC37"] = {
					["ilvl"] = 409.0625,
					["guid"] = "Player-3682-0B19EC37",
					["class"] = "MONK",
					["role"] = "TANK",
					["cache_time"] = 1679952487,
					["rank"] = "Alt",
					["name"] = "Qubit-Ragnaros",
					["specID"] = 268,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-1928-0454D1D9"] = {
					["name"] = "йоказуна-Голдринн",
					["guid"] = "Player-1928-0454D1D9",
					["class"] = "PALADIN",
					["cache_time"] = 1675869700,
					["realm"] = "Голдринн",
				},
				["Player-3391-0C20BAA0"] = {
					["name"] = "Pingvinbanan-Silvermoon",
					["guid"] = "Player-3391-0C20BAA0",
					["class"] = "DRUID",
					["cache_time"] = 1676385549,
					["realm"] = "Silvermoon",
				},
				["Player-578-059EEE11"] = {
					["name"] = "Fíora-Kel'Thuzad",
					["guid"] = "Player-578-059EEE11",
					["class"] = "SHAMAN",
					["cache_time"] = 1678052884,
					["realm"] = "Kel'Thuzad",
				},
				["Player-3391-0766706F"] = {
					["name"] = "Guteridrood-Silvermoon",
					["guid"] = "Player-3391-0766706F",
					["class"] = "DRUID",
					["cache_time"] = 1676452417,
					["realm"] = "Silvermoon",
				},
				["Player-1121-0A68DAA2"] = {
					["name"] = "Poosajj-DerAbyssischeRat",
					["guid"] = "Player-1121-0A68DAA2",
					["class"] = "WARRIOR",
					["cache_time"] = 1676950723,
					["realm"] = "DerAbyssischeRat",
				},
				["Player-3702-081E799B"] = {
					["name"] = "Roggmash-ArgentDawn",
					["guid"] = "Player-3702-081E799B",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1675873556,
					["realm"] = "ArgentDawn",
				},
				["Player-604-0A640E86"] = {
					["name"] = "Almoo-Thrall",
					["guid"] = "Player-604-0A640E86",
					["class"] = "PALADIN",
					["cache_time"] = 1687791012,
					["realm"] = "Thrall",
				},
				["Player-1379-0AD1977F"] = {
					["name"] = "Drògon-Uldum",
					["guid"] = "Player-1379-0AD1977F",
					["class"] = "EVOKER",
					["cache_time"] = 1684566068,
					["realm"] = "Uldum",
				},
				["Player-3682-05C4B3BD"] = {
					["name"] = "Attiladk-Ragnaros",
					["guid"] = "Player-3682-05C4B3BD",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1677665404,
					["realm"] = "Ragnaros",
				},
				["Player-1384-098B518B"] = {
					["name"] = "Chimueló-Tyrande",
					["guid"] = "Player-1384-098B518B",
					["class"] = "HUNTER",
					["cache_time"] = 1676338183,
					["realm"] = "Tyrande",
				},
				["Player-3682-0AA2B1F5"] = {
					["ilvl"] = 409.625,
					["guid"] = "Player-3682-0AA2B1F5",
					["class"] = "WARLOCK",
					["rank"] = "Trial",
					["role"] = "DAMAGER",
					["name"] = "Tattz-Ragnaros",
					["cache_time"] = 1678912228,
					["enchanter"] = true,
					["specID"] = 267,
					["enchantingLvl"] = 97,
					["realm"] = "Ragnaros",
				},
				["Player-1092-0A8E6944"] = {
					["role"] = "DAMAGER",
					["name"] = "Turbone-BurningBlade",
					["guid"] = "Player-1092-0A8E6944",
					["realm"] = "BurningBlade",
					["class"] = "ROGUE",
					["cache_time"] = 1676387096,
					["rank"] = "Novácek",
				},
				["Player-1092-0A974870"] = {
					["name"] = "Akrinn-BurningBlade",
					["guid"] = "Player-1092-0A974870",
					["class"] = "HUNTER",
					["cache_time"] = 1687791302,
					["realm"] = "BurningBlade",
				},
				["Player-3674-0B1C18C0"] = {
					["name"] = "Smufzap-TwistingNether",
					["guid"] = "Player-3674-0B1C18C0",
					["class"] = "SHAMAN",
					["cache_time"] = 1687790447,
					["realm"] = "TwistingNether",
				},
				["Player-1329-09FC6A1E"] = {
					["name"] = "Hunger-Ravencrest",
					["guid"] = "Player-1329-09FC6A1E",
					["class"] = "SHAMAN",
					["cache_time"] = 1684569933,
					["realm"] = "Ravencrest",
				},
				["Player-3674-0A90F3D0"] = {
					["name"] = "Healshamy-TwistingNether",
					["guid"] = "Player-3674-0A90F3D0",
					["class"] = "SHAMAN",
					["cache_time"] = 1689772053,
					["realm"] = "TwistingNether",
				},
				["Player-581-0A3CD12A"] = {
					["name"] = "Zebulight-Blackrock",
					["guid"] = "Player-581-0A3CD12A",
					["class"] = "PALADIN",
					["cache_time"] = 1690409840,
					["realm"] = "Blackrock",
				},
				["Player-1390-0C2C964B"] = {
					["name"] = "Neorax-Hyjal",
					["guid"] = "Player-1390-0C2C964B",
					["class"] = "HUNTER",
					["cache_time"] = 1677879103,
					["realm"] = "Hyjal",
				},
				["Player-3691-09CD829A"] = {
					["name"] = "Bucazid-Blackhand",
					["guid"] = "Player-3691-09CD829A",
					["class"] = "DRUID",
					["cache_time"] = 1680437946,
					["realm"] = "Blackhand",
				},
				["Player-1092-0A956B5C"] = {
					["name"] = "Konylka-Drak'thul",
					["guid"] = "Player-1092-0A956B5C",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686754973,
					["realm"] = "Drak'thul",
				},
				["Player-1587-072EC0E3"] = {
					["name"] = "Itsvalling-Arathor",
					["guid"] = "Player-1587-072EC0E3",
					["class"] = "DRUID",
					["cache_time"] = 1688303691,
					["realm"] = "Arathor",
				},
				["Player-3690-0B242DC5"] = {
					["name"] = "Leeshia-KhazModan",
					["guid"] = "Player-3690-0B242DC5",
					["class"] = "EVOKER",
					["cache_time"] = 1687298820,
					["realm"] = "KhazModan",
				},
				["Player-3713-0AC35C70"] = {
					["name"] = "Cactuus-Xavius",
					["guid"] = "Player-3713-0AC35C70",
					["class"] = "WARLOCK",
					["cache_time"] = 1689699139,
					["realm"] = "Xavius",
				},
				["Player-3691-052B188B"] = {
					["name"] = "Teramatinart-Blackhand",
					["guid"] = "Player-3691-052B188B",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687791302,
					["realm"] = "Blackhand",
				},
				["Player-1379-0AE3A851"] = {
					["ilvl"] = 417.1875,
					["guid"] = "Player-1379-0AE3A851",
					["class"] = "SHAMAN",
					["role"] = "HEALER",
					["cache_time"] = 1684501931,
					["realm"] = "Sanguino",
					["name"] = "Ragmar-Sanguino",
					["specID"] = 264,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1305-0BC4A43D"] = {
					["name"] = "Alhampriest-Kazzak",
					["guid"] = "Player-1305-0BC4A43D",
					["class"] = "PRIEST",
					["cache_time"] = 1689676343,
					["realm"] = "Kazzak",
				},
				["Player-1615-0A7755CD"] = {
					["name"] = "креветулечка-Ревущийфьорд",
					["guid"] = "Player-1615-0A7755CD",
					["class"] = "MONK",
					["cache_time"] = 1689804288,
					["realm"] = "Ревущийфьорд",
				},
				["Player-2073-09B22158"] = {
					["name"] = "Resoñ-Stormscale",
					["guid"] = "Player-2073-09B22158",
					["class"] = "WARRIOR",
					["cache_time"] = 1686035164,
					["realm"] = "Stormscale",
				},
				["Player-1084-0A97AE96"] = {
					["name"] = "Clawe-TarrenMill",
					["guid"] = "Player-1084-0A97AE96",
					["class"] = "DRUID",
					["cache_time"] = 1687259300,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0C58C54B"] = {
					["name"] = "Lautaro-Kazzak",
					["guid"] = "Player-1305-0C58C54B",
					["class"] = "WARLOCK",
					["cache_time"] = 1680249823,
					["realm"] = "Kazzak",
				},
				["Player-1084-0A80499B"] = {
					["name"] = "Kasecgos-TarrenMill",
					["guid"] = "Player-1084-0A80499B",
					["class"] = "EVOKER",
					["cache_time"] = 1685745494,
					["realm"] = "TarrenMill",
				},
				["Player-1621-0A1A72E8"] = {
					["name"] = "Iêmãnjä-Dalaran",
					["guid"] = "Player-1621-0A1A72E8",
					["class"] = "DRUID",
					["cache_time"] = 1680290994,
					["realm"] = "Dalaran",
				},
				["Player-3674-0AB824CD"] = {
					["role"] = "DAMAGER",
					["name"] = "Deathbsnusnu-TwistingNether",
					["guid"] = "Player-3674-0AB824CD",
					["rank"] = "Unguilded",
					["class"] = "ROGUE",
					["cache_time"] = 1686184517,
					["realm"] = "TwistingNether",
				},
				["Player-3656-04F193E3"] = {
					["name"] = "Omgifoundyou-Vashj",
					["guid"] = "Player-3656-04F193E3",
					["class"] = "PALADIN",
					["cache_time"] = 1687949013,
					["realm"] = "Vashj",
				},
				["Player-1621-0AB74A5A"] = {
					["name"] = "Elníniel-Dalaran",
					["guid"] = "Player-1621-0AB74A5A",
					["class"] = "PRIEST",
					["cache_time"] = 1678320295,
					["realm"] = "Dalaran",
				},
				["Player-1615-0B241BC2"] = {
					["name"] = "вентруа-Ревущийфьорд",
					["guid"] = "Player-1615-0B241BC2",
					["class"] = "PRIEST",
					["cache_time"] = 1688930496,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1597-0F5E96EB"] = {
					["name"] = "Lolypop-Jaedenar",
					["guid"] = "Player-1597-0F5E96EB",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687133300,
					["realm"] = "Jaedenar",
				},
				["Player-512-08271455"] = {
					["name"] = "Minachips-Kael'thas",
					["guid"] = "Player-512-08271455",
					["class"] = "PRIEST",
					["cache_time"] = 1684413259,
					["realm"] = "Kael'thas",
				},
				["Player-1305-0C03A3CA"] = {
					["name"] = "Calften-Kazzak",
					["guid"] = "Player-1305-0C03A3CA",
					["class"] = "ROGUE",
					["cache_time"] = 1684311131,
					["realm"] = "Kazzak",
				},
				["Player-1305-0C2777B4"] = {
					["name"] = "Qivectimus-Kazzak",
					["guid"] = "Player-1305-0C2777B4",
					["class"] = "MAGE",
					["cache_time"] = 1686121310,
					["realm"] = "Kazzak",
				},
				["Player-1329-0648BA2D"] = {
					["name"] = "Faayth-Ravencrest",
					["guid"] = "Player-1329-0648BA2D",
					["class"] = "MAGE",
					["cache_time"] = 1684413259,
					["realm"] = "Ravencrest",
				},
				["Player-1403-0A615A36"] = {
					["name"] = "Kalsdkern-Draenor",
					["guid"] = "Player-1403-0A615A36",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678233785,
					["realm"] = "Draenor",
				},
				["Player-1929-0E5370C4"] = {
					["name"] = "рейдбосс-ПиратскаяБухта",
					["guid"] = "Player-1929-0E5370C4",
					["class"] = "WARLOCK",
					["cache_time"] = 1688947447,
					["realm"] = "ПиратскаяБухта",
				},
				["Player-3674-0B284021"] = {
					["ilvl"] = 445.25,
					["guid"] = "Player-3674-0B284021",
					["class"] = "PRIEST",
					["role"] = "HEALER",
					["cache_time"] = 1689251791,
					["realm"] = "TwistingNether",
					["name"] = "Pandaelia-TwistingNether",
					["specID"] = 257,
					["enchantingLvl"] = 0,
					["rank"] = "Trial",
				},
				["Player-3692-09F57EF5"] = {
					["ilvl"] = 440,
					["guid"] = "Player-3692-09F57EF5",
					["class"] = "WARLOCK",
					["rank"] = "Schlachtzügler",
					["role"] = "DAMAGER",
					["cache_time"] = 1685395577,
					["name"] = "Cíel-Eredar",
					["enchanter"] = true,
					["specID"] = 266,
					["enchantingLvl"] = 100,
					["realm"] = "Eredar",
				},
				["Player-580-0A5A6177"] = {
					["name"] = "Wiau-Blackmoore",
					["guid"] = "Player-580-0A5A6177",
					["class"] = "DRUID",
					["cache_time"] = 1687259258,
					["realm"] = "Blackmoore",
				},
				["Player-509-06C201D6"] = {
					["name"] = "Vaalouu-Sargeras",
					["guid"] = "Player-509-06C201D6",
					["class"] = "WARLOCK",
					["cache_time"] = 1684564034,
					["realm"] = "Sargeras",
				},
				["Player-3674-08C979CF"] = {
					["name"] = "Harennval-TwistingNether",
					["guid"] = "Player-3674-08C979CF",
					["class"] = "DRUID",
					["cache_time"] = 1684509144,
					["realm"] = "TwistingNether",
				},
				["Player-3681-0AA7BD99"] = {
					["name"] = "Levide-Magtheridon",
					["guid"] = "Player-3681-0AA7BD99",
					["class"] = "WARRIOR",
					["cache_time"] = 1684231108,
					["realm"] = "Magtheridon",
				},
				["Player-3682-07B0DCF6"] = {
					["name"] = "Lelleboi-Ragnaros",
					["guid"] = "Player-3682-07B0DCF6",
					["class"] = "SHAMAN",
					["cache_time"] = 1677249989,
					["realm"] = "Ragnaros",
				},
				["Player-3391-0C90E349"] = {
					["name"] = "Tukiiz-Silvermoon",
					["guid"] = "Player-3391-0C90E349",
					["class"] = "PALADIN",
					["cache_time"] = 1685534275,
					["realm"] = "Silvermoon",
				},
				["Player-1390-0C7E97CD"] = {
					["name"] = "Elnath-Hyjal",
					["guid"] = "Player-1390-0C7E97CD",
					["class"] = "WARRIOR",
					["cache_time"] = 1676370489,
					["realm"] = "Hyjal",
				},
				["Player-3656-0A8F72C5"] = {
					["name"] = "Depsimestari-Stormreaver",
					["guid"] = "Player-3656-0A8F72C5",
					["class"] = "HUNTER",
					["cache_time"] = 1676377737,
					["realm"] = "Stormreaver",
				},
				["Player-1615-092BB47B"] = {
					["name"] = "орзамар-Ревущийфьорд",
					["guid"] = "Player-1615-092BB47B",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1684596359,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3657-0A2438DD"] = {
					["name"] = "Alli-Neptulon",
					["guid"] = "Player-3657-0A2438DD",
					["class"] = "PRIEST",
					["cache_time"] = 1690056758,
					["realm"] = "Neptulon",
				},
				["Player-1929-093E68DB"] = {
					["name"] = "вендьета-ЧерныйШрам",
					["guid"] = "Player-1929-093E68DB",
					["class"] = "DRUID",
					["cache_time"] = 1679426740,
					["realm"] = "ЧерныйШрам",
				},
				["Player-3682-0B04F7CE"] = {
					["name"] = "Niato-Ragnaros",
					["guid"] = "Player-3682-0B04F7CE",
					["class"] = "PRIEST",
					["cache_time"] = 1683012561,
					["realm"] = "Ragnaros",
				},
				["Player-3682-0B1DBDAE"] = {
					["ilvl"] = 416.9375,
					["guid"] = "Player-3682-0B1DBDAE",
					["class"] = "ROGUE",
					["realm"] = "Ragnaros",
					["role"] = "DAMAGER",
					["cache_time"] = 1680546104,
					["name"] = "Stabbynick-Ragnaros",
					["specID"] = 261,
					["enchanter"] = true,
					["enchantingLvl"] = 67,
					["rank"] = "Raider",
				},
				["Player-1302-085506AB"] = {
					["name"] = "Paspique-Archimonde",
					["guid"] = "Player-1302-085506AB",
					["class"] = "PALADIN",
					["cache_time"] = 1685050104,
					["realm"] = "Archimonde",
				},
				["Player-3391-0B8D9390"] = {
					["name"] = "Tælia-Silvermoon",
					["guid"] = "Player-3391-0B8D9390",
					["class"] = "PRIEST",
					["cache_time"] = 1680437946,
					["realm"] = "Silvermoon",
				},
				["Player-1329-09D4AFB4"] = {
					["name"] = "Filiduttkatt-Ravencrest",
					["guid"] = "Player-1329-09D4AFB4",
					["class"] = "DRUID",
					["cache_time"] = 1677521837,
					["realm"] = "Ravencrest",
				},
				["Player-1305-0A37B460"] = {
					["name"] = "Zhozhø-Kazzak",
					["guid"] = "Player-1305-0A37B460",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687041442,
					["realm"] = "Kazzak",
				},
				["Player-1604-0CBA6322"] = {
					["name"] = "дэлсар-СвежевательДуш",
					["guid"] = "Player-1604-0CBA6322",
					["class"] = "DRUID",
					["cache_time"] = 1678628555,
					["realm"] = "СвежевательДуш",
				},
				["Player-1335-093C3262"] = {
					["name"] = "Janemba-Ysondre",
					["guid"] = "Player-1335-093C3262",
					["class"] = "WARLOCK",
					["cache_time"] = 1687949013,
					["realm"] = "Ysondre",
				},
				["Player-3682-0B14C6D1"] = {
					["name"] = "Crazy-Ragnaros",
					["guid"] = "Player-3682-0B14C6D1",
					["class"] = "DRUID",
					["cache_time"] = 1676784514,
					["realm"] = "Ragnaros",
				},
				["Player-580-081BE3AD"] = {
					["name"] = "Séné-Blackmoore",
					["guid"] = "Player-580-081BE3AD",
					["class"] = "MONK",
					["cache_time"] = 1687041442,
					["realm"] = "Blackmoore",
				},
				["Player-580-0A59BCA0"] = {
					["name"] = "Wiiko-Blackmoore",
					["guid"] = "Player-580-0A59BCA0",
					["class"] = "MONK",
					["cache_time"] = 1686754474,
					["realm"] = "Blackmoore",
				},
				["Player-3692-045EA519"] = {
					["name"] = "Isengate-Eredar",
					["guid"] = "Player-3692-045EA519",
					["class"] = "WARRIOR",
					["cache_time"] = 1680292466,
					["realm"] = "Eredar",
				},
				["Player-1084-097356ED"] = {
					["name"] = "Veramonk-TarrenMill",
					["guid"] = "Player-1084-097356ED",
					["class"] = "MONK",
					["cache_time"] = 1687791012,
					["realm"] = "TarrenMill",
				},
				["Player-1329-09EAD398"] = {
					["name"] = "Aestheticbro-Ravencrest",
					["guid"] = "Player-1329-09EAD398",
					["class"] = "EVOKER",
					["cache_time"] = 1688983952,
					["realm"] = "Ravencrest",
				},
				["Player-1615-091ABA85"] = {
					["name"] = "сатанейл-Ревущийфьорд",
					["guid"] = "Player-1615-091ABA85",
					["class"] = "PALADIN",
					["cache_time"] = 1677227556,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-0B2927AE"] = {
					["name"] = "Zerotwofour-Ragnaros",
					["guid"] = "Player-3682-0B2927AE",
					["class"] = "SHAMAN",
					["cache_time"] = 1687957630,
					["realm"] = "Ragnaros",
				},
				["Player-1379-0AC74D70"] = {
					["name"] = "Shinaloa-Sanguino",
					["guid"] = "Player-1379-0AC74D70",
					["class"] = "MONK",
					["cache_time"] = 1676973948,
					["realm"] = "Sanguino",
				},
				["Player-3674-0B1C68E6"] = {
					["ilvl"] = 434.25,
					["guid"] = "Player-3674-0B1C68E6",
					["class"] = "WARRIOR",
					["role"] = "DAMAGER",
					["cache_time"] = 1685059364,
					["realm"] = "TwistingNether",
					["name"] = "Kralexxd-TwistingNether",
					["specID"] = 72,
					["enchantingLvl"] = 0,
					["rank"] = "Officer",
				},
				["Player-1335-05FA682D"] = {
					["name"] = "Waromiko-Ysondre",
					["guid"] = "Player-1335-05FA682D",
					["class"] = "WARRIOR",
					["cache_time"] = 1678226933,
					["realm"] = "Ysondre",
				},
				["Player-570-09B04685"] = {
					["name"] = "Ronimo-Azshara",
					["guid"] = "Player-570-09B04685",
					["class"] = "WARRIOR",
					["cache_time"] = 1679425766,
					["realm"] = "Azshara",
				},
				["Player-1084-09F0CE7B"] = {
					["name"] = "Worlazpallyy-TarrenMill",
					["guid"] = "Player-1084-09F0CE7B",
					["class"] = "PALADIN",
					["cache_time"] = 1686985298,
					["realm"] = "TarrenMill",
				},
				["Player-1084-0AA3352A"] = {
					["ilvl"] = 445.125,
					["guid"] = "Player-1084-0AA3352A",
					["class"] = "HUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1690403443,
					["realm"] = "TarrenMill",
					["name"] = "Amenía-TarrenMill",
					["specID"] = 254,
					["enchantingLvl"] = 0,
					["rank"] = "Trial",
				},
				["Player-1092-096E0A20"] = {
					["name"] = "Vexxy-Drak'thul",
					["guid"] = "Player-1092-096E0A20",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1690409840,
					["realm"] = "Drak'thul",
				},
				["Player-3713-0AD80FCF"] = {
					["ilvl"] = 414.8125,
					["guid"] = "Player-3713-0AD80FCF",
					["class"] = "DEATHKNIGHT",
					["role"] = "DAMAGER",
					["cache_time"] = 1677515492,
					["realm"] = "BurningLegion",
					["name"] = "Leonorek-BurningLegion",
					["specID"] = 252,
					["enchantingLvl"] = 0,
					["rank"] = "Swieza Krew",
				},
				["Player-3682-05CD7131"] = {
					["ilvl"] = 442.625,
					["guid"] = "Player-3682-05CD7131",
					["class"] = "PALADIN",
					["realm"] = "Ragnaros",
					["role"] = "TANK",
					["cache_time"] = 1689281451,
					["name"] = "Grendizer-Ragnaros",
					["specID"] = 66,
					["enchanter"] = true,
					["enchantingLvl"] = 100,
					["rank"] = "Officer",
				},
				["Player-3713-0A726421"] = {
					["name"] = "Zabakun-BurningLegion",
					["guid"] = "Player-3713-0A726421",
					["class"] = "WARLOCK",
					["cache_time"] = 1677324336,
					["realm"] = "BurningLegion",
				},
				["Player-1615-0A882064"] = {
					["name"] = "дженчиган-Ревущийфьорд",
					["guid"] = "Player-1615-0A882064",
					["class"] = "HUNTER",
					["cache_time"] = 1676439631,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1084-0A94F0B3"] = {
					["name"] = "Máiron-TarrenMill",
					["guid"] = "Player-1084-0A94F0B3",
					["class"] = "PALADIN",
					["cache_time"] = 1688983952,
					["realm"] = "TarrenMill",
				},
				["Player-1615-0B152153"] = {
					["name"] = "синдрошир-Ревущийфьорд",
					["guid"] = "Player-1615-0B152153",
					["class"] = "EVOKER",
					["cache_time"] = 1678236367,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1403-0A1C115F"] = {
					["name"] = "Bradli-Draenor",
					["guid"] = "Player-1403-0A1C115F",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676646998,
					["realm"] = "Draenor",
				},
				["Player-581-075457C2"] = {
					["name"] = "Fiqqusuterus-Blackrock",
					["guid"] = "Player-581-075457C2",
					["class"] = "HUNTER",
					["cache_time"] = 1683073477,
					["realm"] = "Blackrock",
				},
				["Player-1615-0B21053F"] = {
					["name"] = "ресокс-Ревущийфьорд",
					["guid"] = "Player-1615-0B21053F",
					["class"] = "PALADIN",
					["cache_time"] = 1685740823,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1923-0F5C16A3"] = {
					["name"] = "жабапёс-Ясеневыйлес",
					["guid"] = "Player-1923-0F5C16A3",
					["class"] = "PALADIN",
					["cache_time"] = 1683073733,
					["realm"] = "Ясеневыйлес",
				},
				["Player-3682-0B0D90B2"] = {
					["name"] = "Odapaín-Ragnaros",
					["guid"] = "Player-3682-0B0D90B2",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1679435365,
					["realm"] = "Ragnaros",
				},
				["Player-3691-04EE1563"] = {
					["name"] = "Dennilox-Blackhand",
					["guid"] = "Player-3691-04EE1563",
					["class"] = "PRIEST",
					["cache_time"] = 1685191876,
					["realm"] = "Blackhand",
				},
				["Player-1378-0A3007F5"] = {
					["name"] = "Ileodeon-C'Thun",
					["guid"] = "Player-1378-0A3007F5",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684566068,
					["realm"] = "C'Thun",
				},
				["Player-581-0A716136"] = {
					["name"] = "Zândâlâdîn-Blackrock",
					["guid"] = "Player-581-0A716136",
					["class"] = "PALADIN",
					["cache_time"] = 1685794414,
					["realm"] = "Blackrock",
				},
				["Player-1305-0A977267"] = {
					["name"] = "Falzelight-Kazzak",
					["guid"] = "Player-1305-0A977267",
					["class"] = "PALADIN",
					["cache_time"] = 1684292453,
					["realm"] = "Kazzak",
				},
				["Player-1403-06C3D7DE"] = {
					["name"] = "Corkii-Draenor",
					["guid"] = "Player-1403-06C3D7DE",
					["class"] = "WARRIOR",
					["cache_time"] = 1676372636,
					["realm"] = "Draenor",
				},
				["Player-604-05214C95"] = {
					["name"] = "Ellery-Thrall",
					["guid"] = "Player-604-05214C95",
					["class"] = "SHAMAN",
					["cache_time"] = 1688306751,
					["realm"] = "Thrall",
				},
				["Player-1092-09F76918"] = {
					["name"] = "Cajkynka-Drak'thul",
					["guid"] = "Player-1092-09F76918",
					["class"] = "WARLOCK",
					["cache_time"] = 1688908576,
					["realm"] = "Drak'thul",
				},
				["Player-3682-0A6EE216"] = {
					["name"] = "Nuurii-Ragnaros",
					["guid"] = "Player-3682-0A6EE216",
					["class"] = "SHAMAN",
					["cache_time"] = 1676372636,
					["realm"] = "Ragnaros",
				},
				["Player-3713-07229606"] = {
					["name"] = "Bästion-BurningLegion",
					["guid"] = "Player-3713-07229606",
					["class"] = "SHAMAN",
					["cache_time"] = 1684603502,
					["realm"] = "BurningLegion",
				},
				["Player-1403-0A75BB05"] = {
					["name"] = "Hbc-Draenor",
					["guid"] = "Player-1403-0A75BB05",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689769880,
					["realm"] = "Draenor",
				},
				["Player-1127-0A5A0060"] = {
					["name"] = "Rhanamir-KirinTor",
					["guid"] = "Player-1127-0A5A0060",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678052884,
					["realm"] = "KirinTor",
				},
				["Player-1615-0ACBB7C6"] = {
					["name"] = "кхир-Ревущийфьорд",
					["guid"] = "Player-1615-0ACBB7C6",
					["class"] = "DRUID",
					["cache_time"] = 1685780231,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1615-0AEC85C3"] = {
					["name"] = "летерх-Ревущийфьорд",
					["guid"] = "Player-1615-0AEC85C3",
					["class"] = "DRUID",
					["cache_time"] = 1685864518,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1390-0766E8C1"] = {
					["name"] = "Ander-Hyjal",
					["guid"] = "Player-1390-0766E8C1",
					["class"] = "HUNTER",
					["cache_time"] = 1678409718,
					["realm"] = "Hyjal",
				},
				["Player-1390-0B260813"] = {
					["name"] = "Brunimonde-Hyjal",
					["guid"] = "Player-1390-0B260813",
					["class"] = "MAGE",
					["cache_time"] = 1676973948,
					["realm"] = "Hyjal",
				},
				["Player-1403-09959DA8"] = {
					["name"] = "Blackslight-Draenor",
					["guid"] = "Player-1403-09959DA8",
					["class"] = "PALADIN",
					["cache_time"] = 1685358170,
					["realm"] = "Draenor",
				},
				["Player-1621-0AEF8A2D"] = {
					["name"] = "Ontario-Dalaran",
					["guid"] = "Player-1621-0AEF8A2D",
					["class"] = "DRUID",
					["cache_time"] = 1678638104,
					["realm"] = "Dalaran",
				},
				["Player-1403-098E127C"] = {
					["name"] = "Asyrine-Draenor",
					["guid"] = "Player-1403-098E127C",
					["class"] = "MAGE",
					["cache_time"] = 1679747022,
					["realm"] = "Draenor",
				},
				["Player-581-05671D72"] = {
					["name"] = "Yamâtø-Blackrock",
					["guid"] = "Player-581-05671D72",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680292466,
					["realm"] = "Blackrock",
				},
				["Player-3391-0C803785"] = {
					["name"] = "Mâko-Silvermoon",
					["guid"] = "Player-3391-0C803785",
					["class"] = "MONK",
					["cache_time"] = 1683811886,
					["realm"] = "Silvermoon",
				},
				["Player-580-09E8EDEE"] = {
					["name"] = "Blutrót-Blackmoore",
					["guid"] = "Player-580-09E8EDEE",
					["class"] = "ROGUE",
					["cache_time"] = 1687961749,
					["realm"] = "Blackmoore",
				},
				["Player-1403-0A65B67A"] = {
					["name"] = "Grimmalf-Draenor",
					["guid"] = "Player-1403-0A65B67A",
					["class"] = "WARRIOR",
					["cache_time"] = 1687791302,
					["realm"] = "Draenor",
				},
				["Player-1305-0B802969"] = {
					["name"] = "Fleshcfa-Kazzak",
					["guid"] = "Player-1305-0B802969",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685437969,
					["realm"] = "Kazzak",
				},
				["Player-1604-0BF71325"] = {
					["name"] = "антистий-СвежевательДуш",
					["guid"] = "Player-1604-0BF71325",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1677665404,
					["realm"] = "СвежевательДуш",
				},
				["Player-1329-09FA95C1"] = {
					["name"] = "Leverfläck-Ravencrest",
					["guid"] = "Player-1329-09FA95C1",
					["class"] = "EVOKER",
					["cache_time"] = 1677518213,
					["realm"] = "Ravencrest",
				},
				["Player-1085-0A3019AE"] = {
					["name"] = "Disco-TheSha'tar",
					["guid"] = "Player-1085-0A3019AE",
					["class"] = "PRIEST",
					["cache_time"] = 1690513584,
					["realm"] = "TheSha'tar",
				},
				["Player-1084-0A47105E"] = {
					["name"] = "Arron-TarrenMill",
					["guid"] = "Player-1084-0A47105E",
					["class"] = "WARRIOR",
					["cache_time"] = 1689804288,
					["realm"] = "TarrenMill",
				},
				["Player-580-0A4BD6BA"] = {
					["name"] = "Veibaesimp-Blackmoore",
					["guid"] = "Player-580-0A4BD6BA",
					["class"] = "HUNTER",
					["cache_time"] = 1684417841,
					["realm"] = "Blackmoore",
				},
				["Player-1305-09E96A23"] = {
					["name"] = "Hàxor-Kazzak",
					["guid"] = "Player-1305-09E96A23",
					["class"] = "SHAMAN",
					["cache_time"] = 1685745517,
					["realm"] = "Kazzak",
				},
				["Player-2073-0706A8A1"] = {
					["name"] = "Tropz-Stormscale",
					["guid"] = "Player-2073-0706A8A1",
					["class"] = "DRUID",
					["cache_time"] = 1678894799,
					["realm"] = "Stormscale",
				},
				["Player-1602-0F2D3149"] = {
					["name"] = "джумала-Гордунни",
					["guid"] = "Player-1602-0F2D3149",
					["class"] = "WARRIOR",
					["cache_time"] = 1676372636,
					["realm"] = "Гордунни",
				},
				["Player-1401-0893C1FF"] = {
					["name"] = "Eldoro-Shattrath",
					["guid"] = "Player-1401-0893C1FF",
					["class"] = "ROGUE",
					["cache_time"] = 1676794444,
					["realm"] = "Shattrath",
				},
				["Player-1092-07DBE65C"] = {
					["name"] = "Terond-BurningBlade",
					["guid"] = "Player-1092-07DBE65C",
					["class"] = "PALADIN",
					["cache_time"] = 1685054657,
					["realm"] = "BurningBlade",
				},
				["Player-1604-0F3E0EE1"] = {
					["name"] = "яхвэ-СвежевательДуш",
					["guid"] = "Player-1604-0F3E0EE1",
					["class"] = "WARLOCK",
					["cache_time"] = 1688876703,
					["realm"] = "СвежевательДуш",
				},
				["Player-3691-065BA551"] = {
					["name"] = "Elènor-Blackhand",
					["guid"] = "Player-3691-065BA551",
					["class"] = "DRUID",
					["cache_time"] = 1680290994,
					["realm"] = "Blackhand",
				},
				["Player-3391-0C7B52C5"] = {
					["name"] = "Vankydh-Silvermoon",
					["guid"] = "Player-3391-0C7B52C5",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684475489,
					["realm"] = "Silvermoon",
				},
				["Player-3686-09FD4937"] = {
					["name"] = "Radiantman-Antonidas",
					["guid"] = "Player-3686-09FD4937",
					["class"] = "PALADIN",
					["cache_time"] = 1680437946,
					["realm"] = "Antonidas",
				},
				["Player-3674-0AE318E7"] = {
					["name"] = "Hgayboys-TwistingNether",
					["guid"] = "Player-3674-0AE318E7",
					["class"] = "SHAMAN",
					["cache_time"] = 1684231108,
					["realm"] = "TwistingNether",
				},
				["Player-1615-0B251AA3"] = {
					["name"] = "слтпес-Ревущийфьорд",
					["guid"] = "Player-1615-0B251AA3",
					["class"] = "SHAMAN",
					["cache_time"] = 1685393886,
					["realm"] = "Ревущийфьорд",
				},
				["Player-633-0ADB4BFF"] = {
					["name"] = "Angelb-Darkspear",
					["guid"] = "Player-633-0ADB4BFF",
					["class"] = "ROGUE",
					["cache_time"] = 1680698303,
					["realm"] = "Darkspear",
				},
				["Player-3674-0B1AFC1D"] = {
					["name"] = "Aurisera-TwistingNether",
					["guid"] = "Player-3674-0B1AFC1D",
					["class"] = "EVOKER",
					["cache_time"] = 1676952903,
					["realm"] = "TwistingNether",
				},
				["Player-1329-0680E44E"] = {
					["name"] = "Filiduttmage-Ravencrest",
					["guid"] = "Player-1329-0680E44E",
					["class"] = "MAGE",
					["cache_time"] = 1677522488,
					["realm"] = "Ravencrest",
				},
				["Player-581-0A738916"] = {
					["name"] = "Miosan-Blackrock",
					["guid"] = "Player-581-0A738916",
					["class"] = "MONK",
					["cache_time"] = 1684218174,
					["realm"] = "Blackrock",
				},
				["Player-1302-0C4E3F45"] = {
					["name"] = "Feylor-Archimonde",
					["guid"] = "Player-1302-0C4E3F45",
					["class"] = "HUNTER",
					["cache_time"] = 1677319972,
					["realm"] = "Archimonde",
				},
				["Player-3691-049A2452"] = {
					["name"] = "Crissp-Blackhand",
					["guid"] = "Player-3691-049A2452",
					["class"] = "PRIEST",
					["cache_time"] = 1686121310,
					["realm"] = "Blackhand",
				},
				["Player-1084-092EDDCF"] = {
					["name"] = "Kappadinho-TarrenMill",
					["guid"] = "Player-1084-092EDDCF",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1689698521,
					["realm"] = "TarrenMill",
				},
				["Player-1379-0AD5574C"] = {
					["name"] = "Iyio-Sanguino",
					["guid"] = "Player-1379-0AD5574C",
					["class"] = "PALADIN",
					["cache_time"] = 1687949273,
					["realm"] = "Sanguino",
				},
				["Player-1084-098AD01E"] = {
					["name"] = "Hexagram-TarrenMill",
					["guid"] = "Player-1084-098AD01E",
					["class"] = "PALADIN",
					["cache_time"] = 1686605803,
					["realm"] = "TarrenMill",
				},
				["Player-1097-06C4C435"] = {
					["name"] = "Grafparty-Malorne",
					["guid"] = "Player-1097-06C4C435",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1679861251,
					["realm"] = "Malorne",
				},
				["Player-1403-0A70D56D"] = {
					["name"] = "Wickedfap-Draenor",
					["guid"] = "Player-1403-0A70D56D",
					["class"] = "PRIEST",
					["cache_time"] = 1685398638,
					["realm"] = "Draenor",
				},
				["Player-1084-0A54898C"] = {
					["name"] = "Simbaheal-TarrenMill",
					["guid"] = "Player-1084-0A54898C",
					["class"] = "SHAMAN",
					["cache_time"] = 1685829095,
					["realm"] = "TarrenMill",
				},
				["Player-1378-0AE23F2C"] = {
					["name"] = "Vastagø-C'Thun",
					["guid"] = "Player-1378-0AE23F2C",
					["class"] = "ROGUE",
					["cache_time"] = 1685781186,
					["realm"] = "C'Thun",
				},
				["Player-1403-0A5A74BC"] = {
					["name"] = "Shays-Draenor",
					["guid"] = "Player-1403-0A5A74BC",
					["class"] = "EVOKER",
					["cache_time"] = 1676144825,
					["realm"] = "Draenor",
				},
				["Player-1403-0A68E53B"] = {
					["ilvl"] = 419.125,
					["guid"] = "Player-1403-0A68E53B",
					["class"] = "DEMONHUNTER",
					["rank"] = "Unguilded",
					["role"] = "DAMAGER",
					["cache_time"] = 1680695598,
					["name"] = "Zvet-Draenor",
					["enchanter"] = true,
					["specID"] = 577,
					["enchantingLvl"] = 105,
					["realm"] = "Draenor",
				},
				["Player-3702-07C9C032"] = {
					["name"] = "Frassle-ArgentDawn",
					["guid"] = "Player-3702-07C9C032",
					["class"] = "PALADIN",
					["cache_time"] = 1685745494,
					["realm"] = "ArgentDawn",
				},
				["Player-3682-098BDB1B"] = {
					["name"] = "Marcipan-Ragnaros",
					["guid"] = "Player-3682-098BDB1B",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686121310,
					["realm"] = "Ragnaros",
				},
				["Player-1084-0A5FEC5F"] = {
					["name"] = "Ollorin-TarrenMill",
					["guid"] = "Player-1084-0A5FEC5F",
					["class"] = "DRUID",
					["cache_time"] = 1685874644,
					["realm"] = "TarrenMill",
				},
				["Player-3674-0A88CDB7"] = {
					["name"] = "Madinwarlock-TwistingNether",
					["guid"] = "Player-3674-0A88CDB7",
					["class"] = "WARLOCK",
					["cache_time"] = 1675782439,
					["realm"] = "TwistingNether",
				},
				["Player-1403-0A53B27A"] = {
					["name"] = "Mavedrag-Draenor",
					["guid"] = "Player-1403-0A53B27A",
					["class"] = "EVOKER",
					["cache_time"] = 1689855648,
					["realm"] = "Draenor",
				},
				["Player-1305-0C8D3661"] = {
					["name"] = "àdrian-Kazzak",
					["guid"] = "Player-1305-0C8D3661",
					["class"] = "WARLOCK",
					["cache_time"] = 1683965309,
					["realm"] = "Kazzak",
				},
				["Player-3674-0AB9BFE6"] = {
					["name"] = "Discopino-TwistingNether",
					["guid"] = "Player-3674-0AB9BFE6",
					["class"] = "PRIEST",
					["cache_time"] = 1689677222,
					["realm"] = "TwistingNether",
				},
				["Player-3691-0A02A5C0"] = {
					["name"] = "Holzon-Blackhand",
					["guid"] = "Player-3691-0A02A5C0",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686687418,
					["realm"] = "Blackhand",
				},
				["Player-1615-0AB5B1AC"] = {
					["name"] = "инбарлави-Ревущийфьорд",
					["guid"] = "Player-1615-0AB5B1AC",
					["class"] = "PRIEST",
					["cache_time"] = 1679412879,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1403-09E977D4"] = {
					["name"] = "Chárm-Draenor",
					["guid"] = "Player-1403-09E977D4",
					["class"] = "MONK",
					["cache_time"] = 1677073121,
					["realm"] = "Draenor",
				},
				["Player-1329-09CC2D95"] = {
					["name"] = "åhnejulla-Ravencrest",
					["guid"] = "Player-1329-09CC2D95",
					["class"] = "PALADIN",
					["cache_time"] = 1679747022,
					["realm"] = "Ravencrest",
				},
				["Player-1621-0B1CF343"] = {
					["name"] = "Sslaah-MarécagedeZangar",
					["guid"] = "Player-1621-0B1CF343",
					["class"] = "WARLOCK",
					["cache_time"] = 1678778036,
					["realm"] = "MarécagedeZangar",
				},
				["Player-1396-0AE6474D"] = {
					["name"] = "Shadowehsan-AzjolNerub",
					["guid"] = "Player-1396-0AE6474D",
					["class"] = "PRIEST",
					["cache_time"] = 1687157922,
					["realm"] = "AzjolNerub",
				},
				["Player-1403-054D88EB"] = {
					["name"] = "Toby-Draenor",
					["guid"] = "Player-1403-054D88EB",
					["class"] = "PALADIN",
					["cache_time"] = 1684926332,
					["realm"] = "Draenor",
				},
				["Player-3692-09F90E7F"] = {
					["name"] = "Snowboh-Eredar",
					["guid"] = "Player-3692-09F90E7F",
					["class"] = "WARRIOR",
					["cache_time"] = 1689270799,
					["realm"] = "Eredar",
				},
				["Player-3681-08DDD8ED"] = {
					["name"] = "Nekasidin-Magtheridon",
					["guid"] = "Player-3681-08DDD8ED",
					["class"] = "PALADIN",
					["cache_time"] = 1688687270,
					["realm"] = "Magtheridon",
				},
				["Player-1305-0C923D5D"] = {
					["name"] = "Triggeréd-Kazzak",
					["guid"] = "Player-1305-0C923D5D",
					["class"] = "PRIEST",
					["cache_time"] = 1685748808,
					["realm"] = "Kazzak",
				},
				["Player-3674-05AA4957"] = {
					["name"] = "Warrush-TwistingNether",
					["guid"] = "Player-3674-05AA4957",
					["class"] = "WARRIOR",
					["cache_time"] = 1689352223,
					["realm"] = "TwistingNether",
				},
				["Player-1329-09C364CF"] = {
					["name"] = "Mehix-Ravencrest",
					["guid"] = "Player-1329-09C364CF",
					["class"] = "SHAMAN",
					["cache_time"] = 1680218725,
					["realm"] = "Ravencrest",
				},
				["Player-1417-070BE438"] = {
					["name"] = "Mjoz-Azuremyst",
					["guid"] = "Player-1417-070BE438",
					["class"] = "HUNTER",
					["cache_time"] = 1687955030,
					["realm"] = "Azuremyst",
				},
				["Player-1615-0B119595"] = {
					["name"] = "лоуссон-Ревущийфьорд",
					["guid"] = "Player-1615-0B119595",
					["class"] = "PALADIN",
					["cache_time"] = 1676079047,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3703-04D7391A"] = {
					["name"] = "Aerîon-Frostwolf",
					["guid"] = "Player-3703-04D7391A",
					["class"] = "PALADIN",
					["cache_time"] = 1686196330,
					["realm"] = "Frostwolf",
				},
				["Player-1329-099EE51B"] = {
					["name"] = "Deathsu-Ravencrest",
					["guid"] = "Player-1329-099EE51B",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1677333500,
					["realm"] = "Ravencrest",
				},
				["Player-3657-0ADB8339"] = {
					["name"] = "Ellaer-Darksorrow",
					["guid"] = "Player-3657-0ADB8339",
					["class"] = "PRIEST",
					["cache_time"] = 1676768222,
					["realm"] = "Darksorrow",
				},
				["Player-3391-0C86F2D6"] = {
					["name"] = "Redoomer-Silvermoon",
					["guid"] = "Player-3391-0C86F2D6",
					["class"] = "PALADIN",
					["cache_time"] = 1690305151,
					["realm"] = "Silvermoon",
				},
				["Player-3674-0AE430AF"] = {
					["name"] = "Viggøs-TwistingNether",
					["guid"] = "Player-3674-0AE430AF",
					["class"] = "WARRIOR",
					["cache_time"] = 1677665404,
					["realm"] = "TwistingNether",
				},
				["Player-1604-0E962C2B"] = {
					["name"] = "цветочик-СвежевательДуш",
					["guid"] = "Player-1604-0E962C2B",
					["class"] = "DRUID",
					["cache_time"] = 1676078692,
					["realm"] = "СвежевательДуш",
				},
				["Player-1316-0564FFCD"] = {
					["name"] = "Quando-Nemesis",
					["guid"] = "Player-1316-0564FFCD",
					["class"] = "WARRIOR",
					["cache_time"] = 1676973948,
					["realm"] = "Nemesis",
				},
				["Player-3713-0AC03220"] = {
					["name"] = "Wamu-BurningLegion",
					["guid"] = "Player-3713-0AC03220",
					["class"] = "MONK",
					["cache_time"] = 1687248521,
					["realm"] = "BurningLegion",
				},
				["Player-3674-09D6251E"] = {
					["name"] = "Vulenira-TwistingNether",
					["guid"] = "Player-3674-09D6251E",
					["class"] = "HUNTER",
					["cache_time"] = 1680754040,
					["realm"] = "TwistingNether",
				},
				["Player-1302-0C83B371"] = {
					["name"] = "åplüs-Archimonde",
					["guid"] = "Player-1302-0C83B371",
					["class"] = "SHAMAN",
					["cache_time"] = 1684203016,
					["realm"] = "Archimonde",
				},
				["Player-1615-0579CB60"] = {
					["name"] = "бабабревно-Ревущийфьорд",
					["guid"] = "Player-1615-0579CB60",
					["class"] = "DRUID",
					["cache_time"] = 1676444247,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3681-0ADBC10F"] = {
					["name"] = "Litoprot-Magtheridon",
					["guid"] = "Player-3681-0ADBC10F",
					["class"] = "WARRIOR",
					["cache_time"] = 1676973948,
					["realm"] = "Magtheridon",
				},
				["Player-3691-05C654B7"] = {
					["name"] = "Archímedes-Blackhand",
					["guid"] = "Player-3691-05C654B7",
					["class"] = "PRIEST",
					["cache_time"] = 1676647023,
					["realm"] = "Blackhand",
				},
				["Player-578-0946AA05"] = {
					["name"] = "Keelgarr-Durotan",
					["guid"] = "Player-578-0946AA05",
					["class"] = "DRUID",
					["cache_time"] = 1676952896,
					["realm"] = "Durotan",
				},
				["Player-3682-0A48F881"] = {
					["name"] = "Ichiigoo-Ragnaros",
					["guid"] = "Player-3682-0A48F881",
					["class"] = "SHAMAN",
					["cache_time"] = 1679506666,
					["realm"] = "Ragnaros",
				},
				["Player-1390-0BEB3939"] = {
					["name"] = "Chléøs-Hyjal",
					["guid"] = "Player-1390-0BEB3939",
					["class"] = "HUNTER",
					["cache_time"] = 1679747022,
					["realm"] = "Hyjal",
				},
				["Player-1302-0C899FF0"] = {
					["name"] = "Parrudor-Archimonde",
					["guid"] = "Player-1302-0C899FF0",
					["class"] = "PALADIN",
					["cache_time"] = 1685397111,
					["realm"] = "Archimonde",
				},
				["Player-3691-0709D594"] = {
					["name"] = "Ascobøl-Blackhand",
					["guid"] = "Player-3691-0709D594",
					["class"] = "SHAMAN",
					["cache_time"] = 1689339567,
					["realm"] = "Blackhand",
				},
				["Player-3691-09FB5FD8"] = {
					["name"] = "Trottor-Blackhand",
					["guid"] = "Player-3691-09FB5FD8",
					["class"] = "HUNTER",
					["cache_time"] = 1678894799,
					["realm"] = "Blackhand",
				},
				["Player-1390-0C3D4E40"] = {
					["name"] = "Heyer-Hyjal",
					["guid"] = "Player-1390-0C3D4E40",
					["class"] = "WARLOCK",
					["cache_time"] = 1680437946,
					["realm"] = "Hyjal",
				},
				["Player-2073-09CCDD02"] = {
					["name"] = "Furydream-Stormscale",
					["guid"] = "Player-2073-09CCDD02",
					["class"] = "WARRIOR",
					["cache_time"] = 1680483861,
					["realm"] = "Stormscale",
				},
				["Player-3691-09C79F3F"] = {
					["name"] = "Anirael-Blackhand",
					["guid"] = "Player-3691-09C79F3F",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685398638,
					["realm"] = "Blackhand",
				},
				["Player-580-0A6FD1FE"] = {
					["name"] = "Nîkaprego-Blackmoore",
					["guid"] = "Player-580-0A6FD1FE",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1680262695,
					["realm"] = "Blackmoore",
				},
				["Player-3682-0AA2160B"] = {
					["name"] = "Mábashí-Ragnaros",
					["guid"] = "Player-3682-0AA2160B",
					["class"] = "HUNTER",
					["cache_time"] = 1689281451,
					["realm"] = "Ragnaros",
				},
				["Player-1587-0F58981A"] = {
					["name"] = "Nyilazoltán-Arathor",
					["guid"] = "Player-1587-0F58981A",
					["class"] = "HUNTER",
					["cache_time"] = 1685740823,
					["realm"] = "Arathor",
				},
				["Player-3686-09647B8F"] = {
					["name"] = "Kaischi-Antonidas",
					["guid"] = "Player-3686-09647B8F",
					["class"] = "WARRIOR",
					["cache_time"] = 1685393886,
					["realm"] = "Antonidas",
				},
				["Player-1615-0B0BCB96"] = {
					["name"] = "материон-Ревущийфьорд",
					["guid"] = "Player-1615-0B0BCB96",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686754263,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3674-0AF614FD"] = {
					["name"] = "Caprîestsun-TwistingNether",
					["guid"] = "Player-3674-0AF614FD",
					["class"] = "PRIEST",
					["cache_time"] = 1687157922,
					["realm"] = "TwistingNether",
				},
				["Player-1929-0EFA2E9A"] = {
					["name"] = "катанадэмон-ЧерныйШрам",
					["guid"] = "Player-1929-0EFA2E9A",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1678628555,
					["realm"] = "ЧерныйШрам",
				},
				["Player-1390-0C55B9D9"] = {
					["name"] = "Nythog-Hyjal",
					["guid"] = "Player-1390-0C55B9D9",
					["class"] = "EVOKER",
					["cache_time"] = 1676311312,
					["realm"] = "Hyjal",
				},
				["Player-1309-0AA9ED6E"] = {
					["name"] = "Areidhel-Pozzodell'Eternità",
					["guid"] = "Player-1309-0AA9ED6E",
					["class"] = "DRUID",
					["cache_time"] = 1679415375,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-1084-0A6C253C"] = {
					["name"] = "Nantus-TarrenMill",
					["guid"] = "Player-1084-0A6C253C",
					["class"] = "WARRIOR",
					["cache_time"] = 1676502766,
					["realm"] = "TarrenMill",
				},
				["Player-581-07B0F01F"] = {
					["name"] = "Smîck-Blackrock",
					["guid"] = "Player-581-07B0F01F",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677607044,
					["realm"] = "Blackrock",
				},
				["Player-1305-0C80F3F5"] = {
					["name"] = "Liglig-Kazzak",
					["guid"] = "Player-1305-0C80F3F5",
					["class"] = "HUNTER",
					["cache_time"] = 1676955286,
					["realm"] = "Kazzak",
				},
				["Player-3692-09E3060E"] = {
					["name"] = "Ralphi-Eredar",
					["guid"] = "Player-3692-09E3060E",
					["class"] = "HUNTER",
					["cache_time"] = 1676439596,
					["realm"] = "Eredar",
				},
				["Player-1084-0A23AE2A"] = {
					["name"] = "Nezukô-TarrenMill",
					["guid"] = "Player-1084-0A23AE2A",
					["class"] = "SHAMAN",
					["cache_time"] = 1689395307,
					["realm"] = "TarrenMill",
				},
				["Player-1092-0158521B"] = {
					["name"] = "Icenova-Drak'thul",
					["guid"] = "Player-1092-0158521B",
					["class"] = "MAGE",
					["cache_time"] = 1680421947,
					["realm"] = "Drak'thul",
				},
				["Player-3686-09C0656B"] = {
					["ilvl"] = 435.6875,
					["guid"] = "Player-3686-09C0656B",
					["class"] = "PALADIN",
					["role"] = "DAMAGER",
					["cache_time"] = 1686126505,
					["rank"] = "Social",
					["name"] = "Silversonic-Antonidas",
					["specID"] = 70,
					["enchantingLvl"] = 0,
					["realm"] = "Antonidas",
				},
				["Player-3674-0B19DB8C"] = {
					["name"] = "Pelaboy-TwistingNether",
					["guid"] = "Player-3674-0B19DB8C",
					["class"] = "PALADIN",
					["cache_time"] = 1676957174,
					["realm"] = "TwistingNether",
				},
				["Player-3682-0B1FB0FD"] = {
					["name"] = "Qpew-Ragnaros",
					["guid"] = "Player-3682-0B1FB0FD",
					["class"] = "HUNTER",
					["cache_time"] = 1680236701,
					["realm"] = "Ragnaros",
				},
				["Player-1379-0AA1A32B"] = {
					["name"] = "Yokosenpai-Sanguino",
					["guid"] = "Player-1379-0AA1A32B",
					["class"] = "MAGE",
					["cache_time"] = 1684926971,
					["realm"] = "Sanguino",
				},
				["Player-3391-0B7CF249"] = {
					["name"] = "Víctór-Silvermoon",
					["guid"] = "Player-3391-0B7CF249",
					["class"] = "WARRIOR",
					["cache_time"] = 1676465368,
					["realm"] = "Silvermoon",
				},
				["Player-3682-0B2105ED"] = {
					["ilvl"] = 433.1875,
					["guid"] = "Player-3682-0B2105ED",
					["class"] = "WARLOCK",
					["role"] = "DAMAGER",
					["cache_time"] = 1686170267,
					["realm"] = "Ragnaros",
					["name"] = "Moglocked-Ragnaros",
					["specID"] = 266,
					["enchantingLvl"] = 0,
					["rank"] = "Recruiter",
				},
				["Player-1305-0C85E41F"] = {
					["name"] = "Osamodas-Kazzak",
					["guid"] = "Player-1305-0C85E41F",
					["class"] = "HUNTER",
					["cache_time"] = 1684502528,
					["realm"] = "Kazzak",
				},
				["Player-2073-09F87F47"] = {
					["ilvl"] = 416.5625,
					["guid"] = "Player-2073-09F87F47",
					["class"] = "ROGUE",
					["realm"] = "Stormscale",
					["role"] = "DAMAGER",
					["cache_time"] = 1678481387,
					["name"] = "Stabbynick-Stormscale",
					["specID"] = 261,
					["enchanter"] = true,
					["enchantingLvl"] = 67,
					["rank"] = "Unguilded",
				},
				["Player-1084-0A49D2A4"] = {
					["ilvl"] = 419.5,
					["guid"] = "Player-1084-0A49D2A4",
					["class"] = "DRUID",
					["role"] = "DAMAGER",
					["cache_time"] = 1680262695,
					["realm"] = "TarrenMill",
					["name"] = "Boomkek-TarrenMill",
					["specID"] = 102,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1597-0D0020AA"] = {
					["name"] = "Beelii-Sylvanas",
					["guid"] = "Player-1597-0D0020AA",
					["class"] = "MAGE",
					["cache_time"] = 1676335902,
					["realm"] = "Sylvanas",
				},
				["Player-3690-0AF32B59"] = {
					["name"] = "Arhaam-KhazModan",
					["guid"] = "Player-3690-0AF32B59",
					["class"] = "PALADIN",
					["cache_time"] = 1685781186,
					["realm"] = "KhazModan",
				},
				["Player-1390-0C0F53FE"] = {
					["name"] = "Vhonn-Hyjal",
					["guid"] = "Player-1390-0C0F53FE",
					["class"] = "SHAMAN",
					["cache_time"] = 1676377737,
					["realm"] = "Hyjal",
				},
				["Player-1329-09D02A08"] = {
					["name"] = "Myangelr-Ravencrest",
					["guid"] = "Player-1329-09D02A08",
					["class"] = "MAGE",
					["cache_time"] = 1680298988,
					["realm"] = "Ravencrest",
				},
				["Player-1403-0A5B3861"] = {
					["name"] = "Insåníty-Draenor",
					["guid"] = "Player-1403-0A5B3861",
					["class"] = "PRIEST",
					["cache_time"] = 1686786892,
					["realm"] = "Draenor",
				},
				["Player-1301-0C3059E5"] = {
					["name"] = "Sanyavardo-Outland",
					["guid"] = "Player-1301-0C3059E5",
					["class"] = "WARRIOR",
					["cache_time"] = 1678374238,
					["realm"] = "Outland",
				},
				["Player-1378-004F7F98"] = {
					["name"] = "Kelturah-DunModr",
					["guid"] = "Player-1378-004F7F98",
					["class"] = "WARLOCK",
					["cache_time"] = 1683073477,
					["realm"] = "DunModr",
				},
				["Player-531-04E5D622"] = {
					["name"] = "Heilkuh-Onyxia",
					["guid"] = "Player-531-04E5D622",
					["class"] = "DRUID",
					["cache_time"] = 1676372636,
					["realm"] = "Onyxia",
				},
				["Player-1305-0B351875"] = {
					["name"] = "Ultrabolts-Kazzak",
					["guid"] = "Player-1305-0B351875",
					["class"] = "WARLOCK",
					["cache_time"] = 1688983952,
					["realm"] = "Kazzak",
				},
				["Player-531-05A92275"] = {
					["name"] = "Môritz-Onyxia",
					["guid"] = "Player-531-05A92275",
					["class"] = "SHAMAN",
					["cache_time"] = 1684564034,
					["realm"] = "Onyxia",
				},
				["Player-1335-068DECAC"] = {
					["name"] = "Windfûrÿ-Ysondre",
					["guid"] = "Player-1335-068DECAC",
					["class"] = "PALADIN",
					["cache_time"] = 1685685439,
					["realm"] = "Ysondre",
				},
				["Player-1305-0C87149C"] = {
					["name"] = "Speedy-Kazzak",
					["guid"] = "Player-1305-0C87149C",
					["class"] = "DRUID",
					["cache_time"] = 1680708830,
					["realm"] = "Kazzak",
				},
				["Player-1084-0A7A961D"] = {
					["name"] = "Ajoz-TarrenMill",
					["guid"] = "Player-1084-0A7A961D",
					["class"] = "PALADIN",
					["cache_time"] = 1677395628,
					["realm"] = "TarrenMill",
				},
				["Player-1335-06B845A1"] = {
					["name"] = "Papinius-Ysondre",
					["guid"] = "Player-1335-06B845A1",
					["class"] = "MONK",
					["cache_time"] = 1689346075,
					["realm"] = "Ysondre",
				},
				["Player-1303-07953D1D"] = {
					["name"] = "Manåu-Aggra(Português)",
					["guid"] = "Player-1303-07953D1D",
					["class"] = "HUNTER",
					["cache_time"] = 1676520404,
					["realm"] = "Aggra(Português)",
				},
				["Player-1604-0F063C3E"] = {
					["name"] = "касторий-СвежевательДуш",
					["guid"] = "Player-1604-0F063C3E",
					["class"] = "MAGE",
					["cache_time"] = 1676973948,
					["realm"] = "СвежевательДуш",
				},
				["Player-1096-098F98AD"] = {
					["name"] = "Kronblom-EarthenRing",
					["guid"] = "Player-1096-098F98AD",
					["class"] = "WARRIOR",
					["cache_time"] = 1678729942,
					["realm"] = "EarthenRing",
				},
				["Player-1329-09EB493A"] = {
					["name"] = "Lukzus-Ravencrest",
					["guid"] = "Player-1329-09EB493A",
					["class"] = "WARRIOR",
					["cache_time"] = 1685491336,
					["realm"] = "Ravencrest",
				},
				["Player-570-05B51F84"] = {
					["name"] = "Everend-Baelgun",
					["guid"] = "Player-570-05B51F84",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1689290162,
					["realm"] = "Baelgun",
				},
				["Player-1390-0C066A5D"] = {
					["name"] = "Samw-Hyjal",
					["guid"] = "Player-1390-0C066A5D",
					["class"] = "WARRIOR",
					["cache_time"] = 1688983867,
					["realm"] = "Hyjal",
				},
				["Player-1084-0A8E0FFE"] = {
					["name"] = "Failproof-TarrenMill",
					["guid"] = "Player-1084-0A8E0FFE",
					["class"] = "MAGE",
					["cache_time"] = 1676768222,
					["realm"] = "TarrenMill",
				},
				["Player-3682-05C7EE38"] = {
					["name"] = "Dipzz-Ragnaros",
					["guid"] = "Player-3682-05C7EE38",
					["class"] = "SHAMAN",
					["cache_time"] = 1678714910,
					["realm"] = "Ragnaros",
				},
				["Player-3713-07131E61"] = {
					["name"] = "Kosimazaki-BurningLegion",
					["guid"] = "Player-3713-07131E61",
					["class"] = "DRUID",
					["cache_time"] = 1680139732,
					["realm"] = "BurningLegion",
				},
				["Player-1615-092B0F08"] = {
					["name"] = "баночкасечи-Ревущийфьорд",
					["guid"] = "Player-1615-092B0F08",
					["class"] = "WARRIOR",
					["cache_time"] = 1684204457,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3674-0AF2703A"] = {
					["name"] = "Bigexecutie-TwistingNether",
					["guid"] = "Player-3674-0AF2703A",
					["class"] = "WARRIOR",
					["cache_time"] = 1677339563,
					["realm"] = "TwistingNether",
				},
				["Player-1329-09755BD9"] = {
					["name"] = "Mohillon-Ravencrest",
					["guid"] = "Player-1329-09755BD9",
					["class"] = "DRUID",
					["cache_time"] = 1677524172,
					["realm"] = "Ravencrest",
				},
				["Player-1390-0B89EB35"] = {
					["name"] = "Giovanx-Hyjal",
					["guid"] = "Player-1390-0B89EB35",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686000336,
					["realm"] = "Hyjal",
				},
				["Player-3692-0516AB11"] = {
					["name"] = "Rhannox-Eredar",
					["guid"] = "Player-3692-0516AB11",
					["class"] = "DRUID",
					["cache_time"] = 1685048856,
					["realm"] = "Eredar",
				},
				["Player-1587-0F2F9461"] = {
					["name"] = "Nagyhus-Arathor",
					["guid"] = "Player-1587-0F2F9461",
					["class"] = "SHAMAN",
					["cache_time"] = 1685745460,
					["realm"] = "Arathor",
				},
				["Player-3674-05A68E5C"] = {
					["name"] = "Sisyus-TwistingNether",
					["guid"] = "Player-3674-05A68E5C",
					["class"] = "WARRIOR",
					["cache_time"] = 1685468704,
					["realm"] = "TwistingNether",
				},
				["Player-3686-09E377C2"] = {
					["name"] = "Mînoque-Antonidas",
					["guid"] = "Player-3686-09E377C2",
					["class"] = "HUNTER",
					["cache_time"] = 1680431963,
					["realm"] = "Antonidas",
				},
				["Player-580-0A43492F"] = {
					["name"] = "Cryka-Blackmoore",
					["guid"] = "Player-580-0A43492F",
					["class"] = "HUNTER",
					["cache_time"] = 1687949013,
					["realm"] = "Blackmoore",
				},
				["Player-1604-0F0640DC"] = {
					["name"] = "капучинно-СвежевательДуш",
					["guid"] = "Player-1604-0F0640DC",
					["class"] = "WARLOCK",
					["cache_time"] = 1686933987,
					["realm"] = "СвежевательДуш",
				},
				["Player-3674-088E330E"] = {
					["name"] = "Nemesisz-TwistingNether",
					["guid"] = "Player-3674-088E330E",
					["class"] = "DRUID",
					["cache_time"] = 1683809510,
					["realm"] = "TwistingNether",
				},
				["Player-1307-0C8F5C3B"] = {
					["name"] = "Ravenbell-ChamberofAspects",
					["guid"] = "Player-1307-0C8F5C3B",
					["class"] = "PRIEST",
					["cache_time"] = 1687956237,
					["realm"] = "ChamberofAspects",
				},
				["Player-3691-09C723B4"] = {
					["name"] = "Zaados-Blackhand",
					["guid"] = "Player-3691-09C723B4",
					["class"] = "WARLOCK",
					["cache_time"] = 1675869700,
					["realm"] = "Blackhand",
				},
				["Player-3674-09A009DC"] = {
					["ilvl"] = 402.625,
					["guid"] = "Player-3674-09A009DC",
					["class"] = "WARRIOR",
					["realm"] = "TwistingNether",
					["role"] = "DAMAGER",
					["cache_time"] = 1677072459,
					["name"] = "Bravewolf-TwistingNether",
					["specID"] = 71,
					["enchanter"] = true,
					["enchantingLvl"] = 45,
					["rank"] = "Raider Alt",
				},
				["Player-2074-0587D74C"] = {
					["name"] = "Chunksblown-EmeraldDream",
					["guid"] = "Player-2074-0587D74C",
					["class"] = "PRIEST",
					["cache_time"] = 1687102801,
					["realm"] = "EmeraldDream",
				},
				["Player-1403-0677D169"] = {
					["name"] = "Tautruß-Draenor",
					["guid"] = "Player-1403-0677D169",
					["class"] = "DRUID",
					["cache_time"] = 1686263765,
					["realm"] = "Draenor",
				},
				["Player-1302-0C430837"] = {
					["name"] = "Crowelle-Archimonde",
					["guid"] = "Player-1302-0C430837",
					["class"] = "HUNTER",
					["cache_time"] = 1676370489,
					["realm"] = "Archimonde",
				},
				["Player-1621-0AE41BF6"] = {
					["name"] = "Chyppy-Dalaran",
					["guid"] = "Player-1621-0AE41BF6",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1689804288,
					["realm"] = "Dalaran",
				},
				["Player-1390-0A4F495F"] = {
					["name"] = "Asthélios-Hyjal",
					["guid"] = "Player-1390-0A4F495F",
					["class"] = "PRIEST",
					["cache_time"] = 1690121076,
					["realm"] = "Hyjal",
				},
				["Player-1302-0C7F499B"] = {
					["name"] = "Neys-Archimonde",
					["guid"] = "Player-1302-0C7F499B",
					["class"] = "MAGE",
					["cache_time"] = 1676387096,
					["realm"] = "Archimonde",
				},
				["Player-1403-0734968B"] = {
					["name"] = "Sebbwl-Draenor",
					["guid"] = "Player-1403-0734968B",
					["class"] = "WARLOCK",
					["cache_time"] = 1676439596,
					["realm"] = "Draenor",
				},
				["Player-1378-0967D17E"] = {
					["name"] = "Vexare-DunModr",
					["guid"] = "Player-1378-0967D17E",
					["class"] = "WARRIOR",
					["cache_time"] = 1676479581,
					["realm"] = "DunModr",
				},
				["Player-1084-07F602FB"] = {
					["name"] = "Atzira-TarrenMill",
					["guid"] = "Player-1084-07F602FB",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1685052602,
					["realm"] = "TarrenMill",
				},
				["Player-1302-0C522719"] = {
					["name"] = "Erbag-Archimonde",
					["guid"] = "Player-1302-0C522719",
					["class"] = "WARLOCK",
					["cache_time"] = 1676372636,
					["realm"] = "Archimonde",
				},
				["Player-3681-0AACFEC3"] = {
					["name"] = "Linaa-Magtheridon",
					["guid"] = "Player-3681-0AACFEC3",
					["class"] = "PRIEST",
					["cache_time"] = 1684231108,
					["realm"] = "Magtheridon",
				},
				["Player-1105-0A68CCEF"] = {
					["name"] = "Tanji-Anub'arak",
					["guid"] = "Player-1105-0A68CCEF",
					["class"] = "WARRIOR",
					["cache_time"] = 1676387096,
					["realm"] = "Anub'arak",
				},
				["Player-1305-0C356C75"] = {
					["name"] = "Talimañ-Kazzak",
					["guid"] = "Player-1305-0C356C75",
					["class"] = "PALADIN",
					["cache_time"] = 1684294594,
					["realm"] = "Kazzak",
				},
				["Player-1303-03F84BDD"] = {
					["name"] = "Escudos-GrimBatol",
					["guid"] = "Player-1303-03F84BDD",
					["class"] = "PALADIN",
					["cache_time"] = 1677321823,
					["realm"] = "GrimBatol",
				},
				["Player-1602-0C75EE8D"] = {
					["name"] = "астрамара-Гордунни",
					["guid"] = "Player-1602-0C75EE8D",
					["class"] = "MAGE",
					["cache_time"] = 1676354879,
					["realm"] = "Гордунни",
				},
				["Player-3674-09ECE4C4"] = {
					["name"] = "Ozma-TwistingNether",
					["guid"] = "Player-3674-09ECE4C4",
					["class"] = "DRUID",
					["cache_time"] = 1687949013,
					["realm"] = "TwistingNether",
				},
				["Player-1403-0A21CD46"] = {
					["name"] = "Pulsaria-Draenor",
					["guid"] = "Player-1403-0A21CD46",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677072459,
					["realm"] = "Draenor",
				},
				["Player-3691-058A159E"] = {
					["name"] = "Schatulli-Blackhand",
					["guid"] = "Player-3691-058A159E",
					["class"] = "WARRIOR",
					["cache_time"] = 1680290994,
					["realm"] = "Blackhand",
				},
				["Player-580-08A85E71"] = {
					["name"] = "Nelenaidh-Blackmoore",
					["guid"] = "Player-580-08A85E71",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1688901714,
					["realm"] = "Blackmoore",
				},
				["Player-1305-0BB083F4"] = {
					["name"] = "Growlon-Kazzak",
					["guid"] = "Player-1305-0BB083F4",
					["class"] = "HUNTER",
					["cache_time"] = 1676601603,
					["realm"] = "Kazzak",
				},
				["Player-1305-087AD471"] = {
					["name"] = "Lankycheese-Kazzak",
					["guid"] = "Player-1305-087AD471",
					["class"] = "WARLOCK",
					["cache_time"] = 1680290994,
					["realm"] = "Kazzak",
				},
				["Player-3691-064943F8"] = {
					["name"] = "Trathos-Blackhand",
					["guid"] = "Player-3691-064943F8",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676859424,
					["realm"] = "Blackhand",
				},
				["Player-1390-0C52F4DD"] = {
					["name"] = "Olbegonob-Hyjal",
					["guid"] = "Player-1390-0C52F4DD",
					["class"] = "EVOKER",
					["cache_time"] = 1684926079,
					["realm"] = "Hyjal",
				},
				["Player-3674-0B099A85"] = {
					["name"] = "Immale-TwistingNether",
					["guid"] = "Player-3674-0B099A85",
					["class"] = "WARRIOR",
					["cache_time"] = 1676960971,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0A4F88AA"] = {
					["ilvl"] = 406.9375,
					["guid"] = "Player-3674-0A4F88AA",
					["class"] = "DEMONHUNTER",
					["role"] = "DAMAGER",
					["cache_time"] = 1676069534,
					["rank"] = "Unguilded",
					["name"] = "Chaosbrìnger-TwistingNether",
					["specID"] = 577,
					["enchantingLvl"] = 0,
					["realm"] = "TwistingNether",
				},
				["Player-3657-0ADB174F"] = {
					["name"] = "Talexhunts-Genjuros",
					["guid"] = "Player-3657-0ADB174F",
					["class"] = "HUNTER",
					["cache_time"] = 1676182188,
					["realm"] = "Genjuros",
				},
				["Player-1597-0D6823FC"] = {
					["name"] = "Sorrowborne-Sylvanas",
					["guid"] = "Player-1597-0D6823FC",
					["class"] = "PALADIN",
					["cache_time"] = 1678066914,
					["realm"] = "Sylvanas",
				},
				["Player-1390-0C52B174"] = {
					["name"] = "Cräcki-Hyjal",
					["guid"] = "Player-1390-0C52B174",
					["class"] = "PRIEST",
					["cache_time"] = 1690305151,
					["realm"] = "Hyjal",
				},
				["Player-1403-0A019103"] = {
					["name"] = "Homellander-Draenor",
					["guid"] = "Player-1403-0A019103",
					["class"] = "MONK",
					["cache_time"] = 1684277685,
					["realm"] = "Draenor",
				},
				["Player-3713-072D66CA"] = {
					["name"] = "Bigcritz-BurningLegion",
					["guid"] = "Player-3713-072D66CA",
					["class"] = "WARRIOR",
					["cache_time"] = 1680262695,
					["realm"] = "BurningLegion",
				},
				["Player-1084-0A4BBDD2"] = {
					["name"] = "Ollgaa-TarrenMill",
					["guid"] = "Player-1084-0A4BBDD2",
					["class"] = "PALADIN",
					["cache_time"] = 1680401778,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0C5D7EAC"] = {
					["name"] = "Ræjin-Kazzak",
					["guid"] = "Player-1305-0C5D7EAC",
					["class"] = "SHAMAN",
					["cache_time"] = 1676439631,
					["realm"] = "Kazzak",
				},
				["Player-1084-0A376040"] = {
					["name"] = "Latcharn-TarrenMill",
					["guid"] = "Player-1084-0A376040",
					["class"] = "WARRIOR",
					["cache_time"] = 1676755006,
					["realm"] = "TarrenMill",
				},
				["Player-3682-092092DD"] = {
					["ilvl"] = 419.875,
					["guid"] = "Player-3682-092092DD",
					["class"] = "WARLOCK",
					["role"] = "DAMAGER",
					["cache_time"] = 1680813097,
					["realm"] = "Ragnaros",
					["name"] = "Faewynn-Ragnaros",
					["specID"] = 266,
					["enchantingLvl"] = 0,
					["rank"] = "Mythic Raider",
				},
				["Player-1615-0A5A1441"] = {
					["name"] = "дедотмороз-Ревущийфьорд",
					["guid"] = "Player-1615-0A5A1441",
					["class"] = "WARLOCK",
					["cache_time"] = 1685516014,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1331-09F7C69B"] = {
					["name"] = "Bavmorda-Medivh",
					["guid"] = "Player-1331-09F7C69B",
					["class"] = "PRIEST",
					["cache_time"] = 1677607191,
					["realm"] = "Medivh",
				},
				["Player-581-0A2CFAC5"] = {
					["name"] = "Hypedorc-Blackrock",
					["guid"] = "Player-581-0A2CFAC5",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678631557,
					["realm"] = "Blackrock",
				},
				["Player-1121-05CBC21E"] = {
					["name"] = "Durbuz-KultderVerdammten",
					["guid"] = "Player-1121-05CBC21E",
					["class"] = "WARLOCK",
					["cache_time"] = 1676973948,
					["realm"] = "KultderVerdammten",
				},
				["Player-1390-0C31736D"] = {
					["name"] = "Elylia-Hyjal",
					["guid"] = "Player-1390-0C31736D",
					["class"] = "PRIEST",
					["cache_time"] = 1688502238,
					["realm"] = "Hyjal",
				},
				["Player-3703-09F0ED8A"] = {
					["name"] = "Nêmø-Frostwolf",
					["guid"] = "Player-3703-09F0ED8A",
					["class"] = "DRUID",
					["cache_time"] = 1685397111,
					["realm"] = "Frostwolf",
				},
				["Player-581-0A6FA21E"] = {
					["name"] = "Kaybu-Blackrock",
					["guid"] = "Player-581-0A6FA21E",
					["class"] = "PALADIN",
					["cache_time"] = 1686049852,
					["realm"] = "Blackrock",
				},
				["Player-1329-09EC49D1"] = {
					["name"] = "Alerandir-Ravencrest",
					["guid"] = "Player-1329-09EC49D1",
					["class"] = "HUNTER",
					["cache_time"] = 1685573068,
					["realm"] = "Ravencrest",
				},
				["Player-612-08CFA30F"] = {
					["name"] = "Cloudmcfox-Nera'thor",
					["guid"] = "Player-612-08CFA30F",
					["class"] = "ROGUE",
					["cache_time"] = 1677606207,
					["realm"] = "Nera'thor",
				},
				["Player-1388-07921908"] = {
					["name"] = "Tencanto-Lightbringer",
					["guid"] = "Player-1388-07921908",
					["class"] = "MAGE",
					["cache_time"] = 1687791012,
					["realm"] = "Lightbringer",
				},
				["Player-1621-0B12751F"] = {
					["name"] = "Kesium-Dalaran",
					["guid"] = "Player-1621-0B12751F",
					["class"] = "DRUID",
					["cache_time"] = 1676370489,
					["realm"] = "Dalaran",
				},
				["Player-3713-0AD60C99"] = {
					["name"] = "Ajwory-BurningLegion",
					["guid"] = "Player-3713-0AD60C99",
					["class"] = "WARLOCK",
					["cache_time"] = 1676335902,
					["realm"] = "BurningLegion",
				},
				["Player-1385-08AC0C05"] = {
					["name"] = "Elentärï-Minahonda",
					["guid"] = "Player-1385-08AC0C05",
					["class"] = "DRUID",
					["cache_time"] = 1678499437,
					["realm"] = "Minahonda",
				},
				["Player-1379-0AC3B0DC"] = {
					["name"] = "Namespeligro-Sanguino",
					["guid"] = "Player-1379-0AC3B0DC",
					["class"] = "MONK",
					["cache_time"] = 1676377737,
					["realm"] = "Sanguino",
				},
				["Player-1096-0A60013A"] = {
					["name"] = "Zarrpala-Ravenholdt",
					["guid"] = "Player-1096-0A60013A",
					["class"] = "PALADIN",
					["cache_time"] = 1676758015,
					["realm"] = "Ravenholdt",
				},
				["Player-3691-09E2B765"] = {
					["role"] = "DAMAGER",
					["name"] = "Satepa-Blackhand",
					["guid"] = "Player-3691-09E2B765",
					["realm"] = "Blackhand",
					["class"] = "SHAMAN",
					["cache_time"] = 1680399047,
					["rank"] = "Gildenleader",
				},
				["Player-1379-08DB2BA8"] = {
					["name"] = "Caiman-Sanguino",
					["guid"] = "Player-1379-08DB2BA8",
					["class"] = "HUNTER",
					["cache_time"] = 1677256326,
					["realm"] = "Sanguino",
				},
				["Player-1390-0C241258"] = {
					["name"] = "Reïner-Hyjal",
					["guid"] = "Player-1390-0C241258",
					["class"] = "WARRIOR",
					["cache_time"] = 1677198355,
					["realm"] = "Hyjal",
				},
				["Player-1379-0ADD5CDD"] = {
					["name"] = "Drü-Uldum",
					["guid"] = "Player-1379-0ADD5CDD",
					["class"] = "DRUID",
					["cache_time"] = 1683073733,
					["realm"] = "Uldum",
				},
				["Player-1305-0AD9E380"] = {
					["name"] = "Tambra-Kazzak",
					["guid"] = "Player-1305-0AD9E380",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1690329832,
					["realm"] = "Kazzak",
				},
				["Player-604-0A6716FC"] = {
					["name"] = "Thannak-Thrall",
					["guid"] = "Player-604-0A6716FC",
					["class"] = "ROGUE",
					["cache_time"] = 1687949013,
					["realm"] = "Thrall",
				},
				["Player-1597-0D7C25E8"] = {
					["name"] = "Justinne-Sylvanas",
					["guid"] = "Player-1597-0D7C25E8",
					["class"] = "DRUID",
					["cache_time"] = 1685050104,
					["realm"] = "Sylvanas",
				},
				["Player-1403-0A153C27"] = {
					["name"] = "Fexron-Draenor",
					["guid"] = "Player-1403-0A153C27",
					["class"] = "WARLOCK",
					["cache_time"] = 1689772053,
					["realm"] = "Draenor",
				},
				["Player-1403-0A73AE6D"] = {
					["name"] = "Pingwini-Draenor",
					["guid"] = "Player-1403-0A73AE6D",
					["class"] = "DRUID",
					["cache_time"] = 1689262982,
					["realm"] = "Draenor",
				},
				["Player-1401-0A4D4318"] = {
					["name"] = "Dragoran-Perenolde",
					["guid"] = "Player-1401-0A4D4318",
					["class"] = "EVOKER",
					["cache_time"] = 1675869700,
					["realm"] = "Perenolde",
				},
				["Player-1615-0B21A3F5"] = {
					["name"] = "пиайпоскидке-Ревущийфьорд",
					["guid"] = "Player-1615-0B21A3F5",
					["class"] = "PRIEST",
					["cache_time"] = 1684883011,
					["realm"] = "Ревущийфьорд",
				},
				["Player-510-0A6883D4"] = {
					["name"] = "Varass-Chantséternels",
					["guid"] = "Player-510-0A6883D4",
					["class"] = "PALADIN",
					["cache_time"] = 1683906208,
					["realm"] = "Chantséternels",
				},
				["Player-2073-094BB938"] = {
					["name"] = "Ftohës-Stormscale",
					["guid"] = "Player-2073-094BB938",
					["class"] = "MAGE",
					["cache_time"] = 1687102801,
					["realm"] = "Stormscale",
				},
				["Player-3391-0C84E7A8"] = {
					["name"] = "Kixer-Silvermoon",
					["guid"] = "Player-3391-0C84E7A8",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680708830,
					["realm"] = "Silvermoon",
				},
				["Player-1379-08685233"] = {
					["name"] = "Averapaco-Uldum",
					["guid"] = "Player-1379-08685233",
					["class"] = "PALADIN",
					["cache_time"] = 1686934454,
					["realm"] = "Uldum",
				},
				["Player-3674-0A722438"] = {
					["name"] = "çøøkie-TwistingNether",
					["guid"] = "Player-3674-0A722438",
					["class"] = "DRUID",
					["cache_time"] = 1684131204,
					["realm"] = "TwistingNether",
				},
				["Player-3702-0A220B4A"] = {
					["name"] = "Djihad-ArgentDawn",
					["guid"] = "Player-3702-0A220B4A",
					["class"] = "PALADIN",
					["cache_time"] = 1684218171,
					["realm"] = "ArgentDawn",
				},
				["Player-1615-0AD743BF"] = {
					["name"] = "кенипаладин-Ревущийфьорд",
					["guid"] = "Player-1615-0AD743BF",
					["class"] = "PALADIN",
					["cache_time"] = 1688877348,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3703-061F3D9D"] = {
					["name"] = "Körperklaus-Frostwolf",
					["guid"] = "Player-3703-061F3D9D",
					["class"] = "PALADIN",
					["cache_time"] = 1685780231,
					["realm"] = "Frostwolf",
				},
				["Player-3682-0AFEE871"] = {
					["name"] = "Bkhunt-Ragnaros",
					["guid"] = "Player-3682-0AFEE871",
					["class"] = "HUNTER",
					["cache_time"] = 1677250012,
					["realm"] = "Ragnaros",
				},
				["Player-1316-0C85FAD1"] = {
					["name"] = "Pallasacra-Nemesis",
					["guid"] = "Player-1316-0C85FAD1",
					["class"] = "PALADIN",
					["cache_time"] = 1680292466,
					["realm"] = "Nemesis",
				},
				["Player-2073-042E07C9"] = {
					["name"] = "Gogopowerful-Stormscale",
					["guid"] = "Player-2073-042E07C9",
					["class"] = "SHAMAN",
					["cache_time"] = 1687949273,
					["realm"] = "Stormscale",
				},
				["Player-1084-0A6EB2B0"] = {
					["name"] = "Dampner-TarrenMill",
					["guid"] = "Player-1084-0A6EB2B0",
					["class"] = "PRIEST",
					["cache_time"] = 1689257602,
					["realm"] = "TarrenMill",
				},
				["Player-3674-0A844DDA"] = {
					["name"] = "Speendd-TwistingNether",
					["guid"] = "Player-3674-0A844DDA",
					["class"] = "PALADIN",
					["cache_time"] = 1684501707,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0AED09B6"] = {
					["name"] = "Skoufis-TwistingNether",
					["guid"] = "Player-3674-0AED09B6",
					["class"] = "WARRIOR",
					["cache_time"] = 1679414930,
					["realm"] = "TwistingNether",
				},
				["Player-1098-0566EB01"] = {
					["name"] = "Excess-Malfurion",
					["guid"] = "Player-1098-0566EB01",
					["class"] = "PALADIN",
					["cache_time"] = 1685872694,
					["realm"] = "Malfurion",
				},
				["Player-3682-08788FC1"] = {
					["name"] = "Norbih-Ragnaros",
					["guid"] = "Player-3682-08788FC1",
					["class"] = "PRIEST",
					["cache_time"] = 1688874501,
					["realm"] = "Ragnaros",
				},
				["Player-3682-0B12B697"] = {
					["name"] = "Myfficraider-Ragnaros",
					["guid"] = "Player-3682-0B12B697",
					["class"] = "EVOKER",
					["cache_time"] = 1675884019,
					["realm"] = "Ragnaros",
				},
				["Player-1084-0A7EEEA9"] = {
					["name"] = "Femboylock-TarrenMill",
					["guid"] = "Player-1084-0A7EEEA9",
					["class"] = "WARLOCK",
					["cache_time"] = 1684883011,
					["realm"] = "TarrenMill",
				},
				["Player-2073-043CB090"] = {
					["name"] = "Agoraa-Stormscale",
					["guid"] = "Player-2073-043CB090",
					["class"] = "PALADIN",
					["cache_time"] = 1676144825,
					["realm"] = "Stormscale",
				},
				["Player-1587-0F41C6BD"] = {
					["name"] = "Plex-Hellfire",
					["guid"] = "Player-1587-0F41C6BD",
					["class"] = "WARLOCK",
					["cache_time"] = 1687791302,
					["realm"] = "Hellfire",
				},
				["Player-3657-05B91FB8"] = {
					["name"] = "Raastakan-Zenedar",
					["guid"] = "Player-3657-05B91FB8",
					["class"] = "PALADIN",
					["cache_time"] = 1678730018,
					["realm"] = "Zenedar",
				},
				["Player-2073-09F4BC52"] = {
					["name"] = "Adoonis-Stormscale",
					["guid"] = "Player-2073-09F4BC52",
					["class"] = "DRUID",
					["cache_time"] = 1685823297,
					["realm"] = "Stormscale",
				},
				["Player-1615-0ABCD7D1"] = {
					["name"] = "марпина-Ревущийфьорд",
					["guid"] = "Player-1615-0ABCD7D1",
					["class"] = "HUNTER",
					["cache_time"] = 1687949172,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1615-0B09B3FA"] = {
					["name"] = "кисьмурлысь-Ревущийфьорд",
					["guid"] = "Player-1615-0B09B3FA",
					["class"] = "EVOKER",
					["cache_time"] = 1676794438,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1390-086A105F"] = {
					["ilvl"] = 443.75,
					["guid"] = "Player-1390-086A105F",
					["class"] = "WARRIOR",
					["role"] = "TANK",
					["cache_time"] = 1690750821,
					["realm"] = "Hyjal",
					["name"] = "Karno-Hyjal",
					["specID"] = 73,
					["enchantingLvl"] = 0,
					["rank"] = "Sans guilde",
				},
				["Player-1602-0A5205DB"] = {
					["name"] = "причэр-Гордунни",
					["guid"] = "Player-1602-0A5205DB",
					["class"] = "PRIEST",
					["cache_time"] = 1689398192,
					["realm"] = "Гордунни",
				},
				["Player-1390-0923ECCF"] = {
					["name"] = "Xlightniight-Hyjal",
					["guid"] = "Player-1390-0923ECCF",
					["class"] = "WARRIOR",
					["cache_time"] = 1684009880,
					["realm"] = "Hyjal",
				},
				["Player-3691-048CC02A"] = {
					["name"] = "Beledino-Blackhand",
					["guid"] = "Player-3691-048CC02A",
					["class"] = "PALADIN",
					["cache_time"] = 1684926332,
					["realm"] = "Blackhand",
				},
				["Player-3682-07B747DB"] = {
					["name"] = "Paorol-Ragnaros",
					["guid"] = "Player-3682-07B747DB",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686253971,
					["realm"] = "Ragnaros",
				},
				["Player-1305-08422581"] = {
					["name"] = "Nagas-Kazzak",
					["guid"] = "Player-1305-08422581",
					["class"] = "WARLOCK",
					["cache_time"] = 1679968027,
					["realm"] = "Kazzak",
				},
				["Player-3713-0A725A08"] = {
					["role"] = "DAMAGER",
					["name"] = "Hrabiawons-BurningLegion",
					["guid"] = "Player-3713-0A725A08",
					["rank"] = "Raider",
					["class"] = "ROGUE",
					["cache_time"] = 1685748809,
					["realm"] = "BurningLegion",
				},
				["Player-3674-05A312AD"] = {
					["name"] = "Demirdokum-TwistingNether",
					["guid"] = "Player-3674-05A312AD",
					["class"] = "WARRIOR",
					["cache_time"] = 1679138037,
					["realm"] = "TwistingNether",
				},
				["Player-1416-09F8B967"] = {
					["name"] = "ðarksoul-AeriePeak",
					["guid"] = "Player-1416-09F8B967",
					["class"] = "PALADIN",
					["cache_time"] = 1690590328,
					["realm"] = "AeriePeak",
				},
				["Player-3656-0A603C45"] = {
					["name"] = "Azalenne-Stormreaver",
					["guid"] = "Player-3656-0A603C45",
					["class"] = "PRIEST",
					["cache_time"] = 1683069512,
					["realm"] = "Stormreaver",
				},
				["Player-3674-0B09AD38"] = {
					["name"] = "Mcdragon-TwistingNether",
					["guid"] = "Player-3674-0B09AD38",
					["class"] = "EVOKER",
					["cache_time"] = 1686121310,
					["realm"] = "TwistingNether",
				},
				["Player-1305-0BF412B5"] = {
					["name"] = "Molekh-Kazzak",
					["guid"] = "Player-1305-0BF412B5",
					["class"] = "ROGUE",
					["cache_time"] = 1685386842,
					["realm"] = "Kazzak",
				},
				["Player-1302-0A003C93"] = {
					["name"] = "Farlinnhiah-Archimonde",
					["guid"] = "Player-1302-0A003C93",
					["class"] = "PRIEST",
					["cache_time"] = 1686935978,
					["realm"] = "Archimonde",
				},
				["Player-580-08D32892"] = {
					["name"] = "Zinista-Blackmoore",
					["guid"] = "Player-580-08D32892",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676806970,
					["realm"] = "Blackmoore",
				},
				["Player-1096-061521FC"] = {
					["name"] = "Hephaisto-DefiasBrotherhood",
					["guid"] = "Player-1096-061521FC",
					["class"] = "SHAMAN",
					["cache_time"] = 1676757146,
					["realm"] = "DefiasBrotherhood",
				},
				["Player-1621-0A2538D0"] = {
					["name"] = "Bambinaa-Eldre'Thalas",
					["guid"] = "Player-1621-0A2538D0",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1675779446,
					["realm"] = "Eldre'Thalas",
				},
				["Player-3682-0B2B9B92"] = {
					["ilvl"] = 442.875,
					["guid"] = "Player-3682-0B2B9B92",
					["class"] = "WARRIOR",
					["role"] = "DAMAGER",
					["cache_time"] = 1689387110,
					["rank"] = "Unguilded",
					["name"] = "Wârpig-Ragnaros",
					["specID"] = 71,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-3391-0C24D1F0"] = {
					["name"] = "Niato-Silvermoon",
					["guid"] = "Player-3391-0C24D1F0",
					["class"] = "PRIEST",
					["cache_time"] = 1680437946,
					["realm"] = "Silvermoon",
				},
				["Player-1923-0F4FC9EA"] = {
					["name"] = "фелфаер-Ясеневыйлес",
					["guid"] = "Player-1923-0F4FC9EA",
					["class"] = "WARLOCK",
					["cache_time"] = 1685858759,
					["realm"] = "Ясеневыйлес",
				},
				["Player-1309-0C90A993"] = {
					["name"] = "Shadowsho-Pozzodell'Eternità",
					["guid"] = "Player-1309-0C90A993",
					["class"] = "PRIEST",
					["cache_time"] = 1687955030,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-1587-08450F40"] = {
					["name"] = "Cudär-Arathor",
					["guid"] = "Player-1587-08450F40",
					["class"] = "PALADIN",
					["cache_time"] = 1684561238,
					["realm"] = "Arathor",
				},
				["Player-1307-05B5D20A"] = {
					["name"] = "Daleda-ChamberofAspects",
					["guid"] = "Player-1307-05B5D20A",
					["class"] = "PRIEST",
					["cache_time"] = 1676186152,
					["realm"] = "ChamberofAspects",
				},
				["Player-1615-032D57FC"] = {
					["name"] = "капыто-Ревущийфьорд",
					["guid"] = "Player-1615-032D57FC",
					["class"] = "WARRIOR",
					["cache_time"] = 1685398638,
					["realm"] = "Ревущийфьорд",
				},
				["Player-581-045A13CB"] = {
					["name"] = "Bomah-Blackrock",
					["guid"] = "Player-581-045A13CB",
					["class"] = "WARRIOR",
					["cache_time"] = 1680292466,
					["realm"] = "Blackrock",
				},
				["Player-3702-07E5C53C"] = {
					["name"] = "Slitaruzz-ArgentDawn",
					["guid"] = "Player-3702-07E5C53C",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676168537,
					["realm"] = "ArgentDawn",
				},
				["Player-1305-0C50F1F3"] = {
					["name"] = "Zerosixtyòne-Kazzak",
					["guid"] = "Player-1305-0C50F1F3",
					["class"] = "WARLOCK",
					["cache_time"] = 1684128158,
					["realm"] = "Kazzak",
				},
				["Player-3690-0AA55C5C"] = {
					["name"] = "Paslàxou-KhazModan",
					["guid"] = "Player-3690-0AA55C5C",
					["class"] = "PALADIN",
					["cache_time"] = 1684008541,
					["realm"] = "KhazModan",
				},
				["Player-3657-091F0764"] = {
					["name"] = "Fellishlemon-Zenedar",
					["guid"] = "Player-3657-091F0764",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676757146,
					["realm"] = "Zenedar",
				},
				["Player-1305-0C4EE06E"] = {
					["name"] = "Eshghddsh-Kazzak",
					["guid"] = "Player-1305-0C4EE06E",
					["class"] = "SHAMAN",
					["cache_time"] = 1676359629,
					["realm"] = "Kazzak",
				},
				["Player-3656-0698E1D3"] = {
					["name"] = "Smythet-Stormreaver",
					["guid"] = "Player-3656-0698E1D3",
					["class"] = "MAGE",
					["cache_time"] = 1686754474,
					["realm"] = "Stormreaver",
				},
				["Player-3682-05C12C72"] = {
					["name"] = "Tandre-Ragnaros",
					["guid"] = "Player-3682-05C12C72",
					["class"] = "HUNTER",
					["cache_time"] = 1684883011,
					["realm"] = "Ragnaros",
				},
				["Player-1127-095E3A96"] = {
					["name"] = "Elraldur-CultedelaRivenoire",
					["guid"] = "Player-1127-095E3A96",
					["class"] = "HUNTER",
					["cache_time"] = 1676768222,
					["realm"] = "CultedelaRivenoire",
				},
				["Player-3682-09E0FA89"] = {
					["name"] = "Skreamoutlau-Ragnaros",
					["guid"] = "Player-3682-09E0FA89",
					["class"] = "ROGUE",
					["cache_time"] = 1689700268,
					["realm"] = "Ragnaros",
				},
				["Player-3674-05A16624"] = {
					["name"] = "Shattox-TwistingNether",
					["guid"] = "Player-3674-05A16624",
					["class"] = "SHAMAN",
					["cache_time"] = 1677339602,
					["realm"] = "TwistingNether",
				},
				["Player-1127-07640C74"] = {
					["name"] = "Psykiti-LesSentinelles",
					["guid"] = "Player-1127-07640C74",
					["class"] = "DRUID",
					["cache_time"] = 1683965309,
					["realm"] = "LesSentinelles",
				},
				["Player-1316-0C233F90"] = {
					["name"] = "Zarrotar-Nemesis",
					["guid"] = "Player-1316-0C233F90",
					["class"] = "WARRIOR",
					["cache_time"] = 1683073733,
					["realm"] = "Nemesis",
				},
				["Player-3674-07BEF283"] = {
					["name"] = "Forrnaks-TwistingNether",
					["guid"] = "Player-3674-07BEF283",
					["class"] = "DRUID",
					["cache_time"] = 1680006982,
					["realm"] = "TwistingNether",
				},
				["Player-580-082FE794"] = {
					["name"] = "Lagily-Blackmoore",
					["guid"] = "Player-580-082FE794",
					["class"] = "SHAMAN",
					["cache_time"] = 1685780231,
					["realm"] = "Blackmoore",
				},
				["Player-580-09FCF008"] = {
					["name"] = "Bloodsquad-Blackmoore",
					["guid"] = "Player-580-09FCF008",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1688922052,
					["realm"] = "Blackmoore",
				},
				["Player-3391-0AF07C2C"] = {
					["name"] = "Sjoowie-Silvermoon",
					["guid"] = "Player-3391-0AF07C2C",
					["class"] = "DRUID",
					["cache_time"] = 1685032038,
					["realm"] = "Silvermoon",
				},
				["Player-1305-0C8CA374"] = {
					["name"] = "Scarespriest-Kazzak",
					["guid"] = "Player-1305-0C8CA374",
					["class"] = "PRIEST",
					["cache_time"] = 1687953965,
					["realm"] = "Kazzak",
				},
				["Player-1615-0B1E4A10"] = {
					["name"] = "гдемоикрылъя-Ревущийфьорд",
					["guid"] = "Player-1615-0B1E4A10",
					["class"] = "PALADIN",
					["cache_time"] = 1686196139,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1305-0A1CDE8E"] = {
					["name"] = "Pongers-Kazzak",
					["guid"] = "Player-1305-0A1CDE8E",
					["class"] = "SHAMAN",
					["cache_time"] = 1677227556,
					["realm"] = "Kazzak",
				},
				["Player-1390-0C5C1713"] = {
					["name"] = "Drackharys-Hyjal",
					["guid"] = "Player-1390-0C5C1713",
					["class"] = "EVOKER",
					["cache_time"] = 1684883011,
					["realm"] = "Hyjal",
				},
				["Player-1597-0F2FAB89"] = {
					["name"] = "Plaguemug-Sylvanas",
					["guid"] = "Player-1597-0F2FAB89",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1678223169,
					["realm"] = "Sylvanas",
				},
				["Player-3713-09BED8B8"] = {
					["name"] = "Neessandra-BurningLegion",
					["guid"] = "Player-3713-09BED8B8",
					["class"] = "SHAMAN",
					["cache_time"] = 1685538250,
					["realm"] = "BurningLegion",
				},
				["Player-1305-0C6EB944"] = {
					["name"] = "Prydz-Kazzak",
					["guid"] = "Player-1305-0C6EB944",
					["class"] = "ROGUE",
					["cache_time"] = 1680218725,
					["realm"] = "Kazzak",
				},
				["Player-3391-06FBA7A8"] = {
					["name"] = "Eladri-Silvermoon",
					["guid"] = "Player-3391-06FBA7A8",
					["class"] = "PRIEST",
					["cache_time"] = 1684559790,
					["realm"] = "Silvermoon",
				},
				["Player-3674-0AF1E07E"] = {
					["name"] = "Sifasagir-TwistingNether",
					["guid"] = "Player-3674-0AF1E07E",
					["class"] = "PRIEST",
					["cache_time"] = 1678461554,
					["realm"] = "TwistingNether",
				},
				["Player-1084-0A7960B7"] = {
					["name"] = "Toogum-TarrenMill",
					["guid"] = "Player-1084-0A7960B7",
					["class"] = "DRUID",
					["cache_time"] = 1676606635,
					["realm"] = "TarrenMill",
				},
				["Player-3391-0C82C9F4"] = {
					["ilvl"] = 410.125,
					["guid"] = "Player-3391-0C82C9F4",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["cache_time"] = 1677096006,
					["realm"] = "Silvermoon",
					["name"] = "Teckko-Silvermoon",
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["rank"] = "Unguilded",
				},
				["Player-3713-082641C3"] = {
					["name"] = "Ekszala-BurningLegion",
					["guid"] = "Player-3713-082641C3",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1677075763,
					["realm"] = "BurningLegion",
				},
				["Player-3674-0B1B08BD"] = {
					["name"] = "Sjuksystern-TwistingNether",
					["guid"] = "Player-3674-0B1B08BD",
					["class"] = "PALADIN",
					["cache_time"] = 1677518270,
					["realm"] = "TwistingNether",
				},
				["Player-1335-07621357"] = {
					["name"] = "Alenthas-Ysondre",
					["guid"] = "Player-1335-07621357",
					["class"] = "MONK",
					["cache_time"] = 1677319954,
					["realm"] = "Ysondre",
				},
				["Player-3682-0A931218"] = {
					["name"] = "Rebrew-Ragnaros",
					["guid"] = "Player-3682-0A931218",
					["class"] = "MONK",
					["cache_time"] = 1686754474,
					["realm"] = "Ragnaros",
				},
				["Player-1614-0AE460D6"] = {
					["name"] = "делит-Галакронд",
					["guid"] = "Player-1614-0AE460D6",
					["class"] = "DRUID",
					["cache_time"] = 1676519225,
					["realm"] = "Галакронд",
				},
				["Player-581-0A6D49E4"] = {
					["name"] = "Zennon-Blackrock",
					["guid"] = "Player-581-0A6D49E4",
					["class"] = "DRUID",
					["cache_time"] = 1684603502,
					["realm"] = "Blackrock",
				},
				["Player-1400-03DDF244"] = {
					["name"] = "Maybell-Area52",
					["guid"] = "Player-1400-03DDF244",
					["class"] = "HUNTER",
					["cache_time"] = 1676909682,
					["realm"] = "Area52",
				},
				["Player-1305-0C638214"] = {
					["name"] = "Metifountain-Kazzak",
					["guid"] = "Player-1305-0C638214",
					["class"] = "PALADIN",
					["cache_time"] = 1687955030,
					["realm"] = "Kazzak",
				},
				["Player-1099-0A90B87A"] = {
					["name"] = "Dämo-Rexxar",
					["guid"] = "Player-1099-0A90B87A",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1678894799,
					["realm"] = "Rexxar",
				},
				["Player-1390-09719275"] = {
					["name"] = "Twinnx-Hyjal",
					["guid"] = "Player-1390-09719275",
					["class"] = "DRUID",
					["cache_time"] = 1687259258,
					["realm"] = "Hyjal",
				},
				["Player-1105-0A633AA0"] = {
					["name"] = "Sundriel-Dalvengyr",
					["guid"] = "Player-1105-0A633AA0",
					["class"] = "MONK",
					["cache_time"] = 1676210025,
					["realm"] = "Dalvengyr",
				},
				["Player-1305-0BDD87EF"] = {
					["name"] = "Absorbent-Kazzak",
					["guid"] = "Player-1305-0BDD87EF",
					["class"] = "PRIEST",
					["cache_time"] = 1676783114,
					["realm"] = "Kazzak",
				},
				["Player-1096-0A5CF353"] = {
					["name"] = "Taroth-Ravenholdt",
					["guid"] = "Player-1096-0A5CF353",
					["class"] = "EVOKER",
					["cache_time"] = 1689800841,
					["realm"] = "Ravenholdt",
				},
				["Player-1305-0B8D720E"] = {
					["name"] = "Vangzz-Kazzak",
					["guid"] = "Player-1305-0B8D720E",
					["class"] = "MAGE",
					["cache_time"] = 1678635547,
					["realm"] = "Kazzak",
				},
				["Player-1302-0BFE55BD"] = {
					["name"] = "Meyk-Archimonde",
					["guid"] = "Player-1302-0BFE55BD",
					["class"] = "DRUID",
					["cache_time"] = 1685343927,
					["realm"] = "Archimonde",
				},
				["Player-1618-0B0AA842"] = {
					["name"] = "Rimmon-DieAldor",
					["guid"] = "Player-1618-0B0AA842",
					["class"] = "DRUID",
					["cache_time"] = 1686121310,
					["realm"] = "DieAldor",
				},
				["Player-3674-05B1998D"] = {
					["name"] = "Nidix-TwistingNether",
					["guid"] = "Player-3674-05B1998D",
					["class"] = "ROGUE",
					["cache_time"] = 1686121310,
					["realm"] = "TwistingNether",
				},
				["Player-3691-0A0223F3"] = {
					["name"] = "Lykhie-Blackhand",
					["guid"] = "Player-3691-0A0223F3",
					["class"] = "DRUID",
					["cache_time"] = 1684052763,
					["realm"] = "Blackhand",
				},
				["Player-3713-0732419C"] = {
					["name"] = "Fairod-BurningLegion",
					["guid"] = "Player-3713-0732419C",
					["class"] = "DRUID",
					["cache_time"] = 1690750821,
					["realm"] = "BurningLegion",
				},
				["Player-3391-0A7F8A74"] = {
					["name"] = "Zenyt-Silvermoon",
					["guid"] = "Player-3391-0A7F8A74",
					["class"] = "DRUID",
					["cache_time"] = 1685797754,
					["realm"] = "Silvermoon",
				},
				["Player-1305-0BA3309A"] = {
					["ilvl"] = 398.375,
					["guid"] = "Player-1305-0BA3309A",
					["class"] = "PRIEST",
					["realm"] = "Kazzak",
					["role"] = "DAMAGER",
					["cache_time"] = 1676792336,
					["name"] = "Nautronpr-Kazzak",
					["specID"] = 258,
					["enchanter"] = true,
					["enchantingLvl"] = 15,
					["rank"] = "Worky  Peon",
				},
				["Player-3682-0B2BF87A"] = {
					["ilvl"] = 443.1875,
					["guid"] = "Player-3682-0B2BF87A",
					["class"] = "EVOKER",
					["role"] = "DAMAGER",
					["cache_time"] = 1690590308,
					["realm"] = "Ragnaros",
					["name"] = "Buffdotcom-Ragnaros",
					["specID"] = 1473,
					["enchantingLvl"] = 0,
					["rank"] = "Unguilded",
				},
				["Player-1329-06A03100"] = {
					["name"] = "Rambopus-Ravencrest",
					["guid"] = "Player-1329-06A03100",
					["class"] = "PALADIN",
					["cache_time"] = 1685195489,
					["realm"] = "Ravencrest",
				},
				["Player-1379-0AB44B38"] = {
					["name"] = "Metalkarp-Sanguino",
					["guid"] = "Player-1379-0AB44B38",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1685398638,
					["realm"] = "Sanguino",
				},
				["Player-3674-06F39AB3"] = {
					["name"] = "Kabôm-TwistingNether",
					["guid"] = "Player-3674-06F39AB3",
					["class"] = "PRIEST",
					["cache_time"] = 1684413259,
					["realm"] = "TwistingNether",
				},
				["Player-1379-09A8A8E6"] = {
					["name"] = "Loyufell-Sanguino",
					["guid"] = "Player-1379-09A8A8E6",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676408322,
					["realm"] = "Sanguino",
				},
				["Player-1623-0270D649"] = {
					["name"] = "сириус-Дракономор",
					["guid"] = "Player-1623-0270D649",
					["class"] = "WARRIOR",
					["cache_time"] = 1677072459,
					["realm"] = "Дракономор",
				},
				["Player-3691-09C86FB8"] = {
					["name"] = "Llóki-Blackhand",
					["guid"] = "Player-3691-09C86FB8",
					["class"] = "HUNTER",
					["cache_time"] = 1676465368,
					["realm"] = "Blackhand",
				},
				["Player-580-0A5781A8"] = {
					["name"] = "Mokileinchen-Blackmoore",
					["guid"] = "Player-580-0A5781A8",
					["class"] = "PALADIN",
					["cache_time"] = 1680437946,
					["realm"] = "Blackmoore",
				},
				["Player-1335-09F8FF15"] = {
					["name"] = "Yukihmito-Ysondre",
					["guid"] = "Player-1335-09F8FF15",
					["class"] = "PRIEST",
					["cache_time"] = 1677258735,
					["realm"] = "Ysondre",
				},
				["Player-1335-093062A4"] = {
					["name"] = "Tahmar-Ysondre",
					["guid"] = "Player-1335-093062A4",
					["class"] = "HUNTER",
					["cache_time"] = 1687261056,
					["realm"] = "Ysondre",
				},
				["Player-1379-0A7CB999"] = {
					["name"] = "Ayummi-Sanguino",
					["guid"] = "Player-1379-0A7CB999",
					["class"] = "MONK",
					["cache_time"] = 1684926332,
					["realm"] = "Sanguino",
				},
				["Player-3713-0AE6B43E"] = {
					["name"] = "Tyrea-BurningLegion",
					["guid"] = "Player-3713-0AE6B43E",
					["class"] = "PRIEST",
					["cache_time"] = 1689417619,
					["realm"] = "BurningLegion",
				},
				["Player-1587-0F2F945F"] = {
					["name"] = "Platósifa-Arathor",
					["guid"] = "Player-1587-0F2F945F",
					["class"] = "PALADIN",
					["cache_time"] = 1685745460,
					["realm"] = "Arathor",
				},
				["Player-1615-0808D522"] = {
					["name"] = "зиранель-Ревущийфьорд",
					["guid"] = "Player-1615-0808D522",
					["class"] = "ROGUE",
					["cache_time"] = 1687949013,
					["realm"] = "Ревущийфьорд",
				},
				["Player-580-0A3479A2"] = {
					["name"] = "Lidllasagne-Blackmoore",
					["guid"] = "Player-580-0A3479A2",
					["class"] = "DRUID",
					["cache_time"] = 1679428338,
					["realm"] = "Blackmoore",
				},
				["Player-580-0A66C5A3"] = {
					["name"] = "Ferinah-Blackmoore",
					["guid"] = "Player-580-0A66C5A3",
					["class"] = "DRUID",
					["cache_time"] = 1675869700,
					["realm"] = "Blackmoore",
				},
				["Player-3682-0B0C0F10"] = {
					["name"] = "Milkeix-Ragnaros",
					["guid"] = "Player-3682-0B0C0F10",
					["class"] = "SHAMAN",
					["cache_time"] = 1677879103,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0C3EA383"] = {
					["name"] = "Eledudu-Kazzak",
					["guid"] = "Player-1305-0C3EA383",
					["class"] = "DRUID",
					["cache_time"] = 1686933987,
					["realm"] = "Kazzak",
				},
				["Player-1303-059D16C2"] = {
					["name"] = "Taninhaa-Aggra(Português)",
					["guid"] = "Player-1303-059D16C2",
					["class"] = "MAGE",
					["cache_time"] = 1677071253,
					["realm"] = "Aggra(Português)",
				},
				["Player-1092-0A91F329"] = {
					["name"] = "Glüêsnïffër-Drak'thul",
					["guid"] = "Player-1092-0A91F329",
					["class"] = "SHAMAN",
					["cache_time"] = 1684123613,
					["realm"] = "Drak'thul",
				},
				["Player-1602-0B2E29C5"] = {
					["name"] = "тыквонька-Гордунни",
					["guid"] = "Player-1602-0B2E29C5",
					["class"] = "DRUID",
					["cache_time"] = 1678894799,
					["realm"] = "Гордунни",
				},
				["Player-3674-0B18C8DE"] = {
					["name"] = "Güldaan-TwistingNether",
					["guid"] = "Player-3674-0B18C8DE",
					["class"] = "WARLOCK",
					["cache_time"] = 1676201349,
					["realm"] = "TwistingNether",
				},
				["Player-1379-0A6A2AAF"] = {
					["name"] = "Bokken-Uldum",
					["guid"] = "Player-1379-0A6A2AAF",
					["class"] = "HUNTER",
					["cache_time"] = 1684413259,
					["realm"] = "Uldum",
				},
				["Player-1305-0C9006A5"] = {
					["name"] = "Gunborgh-Kazzak",
					["guid"] = "Player-1305-0C9006A5",
					["class"] = "WARRIOR",
					["cache_time"] = 1686121310,
					["realm"] = "Kazzak",
				},
				["Player-1092-043DB71A"] = {
					["name"] = "Levijathan-Drak'thul",
					["guid"] = "Player-1092-043DB71A",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1688687303,
					["realm"] = "Drak'thul",
				},
				["Player-3691-092485BE"] = {
					["ilvl"] = 444,
					["guid"] = "Player-3691-092485BE",
					["class"] = "PALADIN",
					["role"] = "HEALER",
					["cache_time"] = 1690229188,
					["rank"] = "Twink",
					["name"] = "Galaadrìel-Mal'Ganis",
					["specID"] = 65,
					["enchantingLvl"] = 0,
					["realm"] = "Mal'Ganis",
				},
				["Player-3686-09FE6AF4"] = {
					["name"] = "Patrioi-Antonidas",
					["guid"] = "Player-3686-09FE6AF4",
					["class"] = "SHAMAN",
					["cache_time"] = 1683910142,
					["realm"] = "Antonidas",
				},
				["Player-3702-0A8FD1A6"] = {
					["name"] = "Tayur-ArgentDawn",
					["guid"] = "Player-3702-0A8FD1A6",
					["class"] = "WARRIOR",
					["cache_time"] = 1677392792,
					["realm"] = "ArgentDawn",
				},
				["Player-1602-0F50C767"] = {
					["name"] = "коунтрин-Гордунни",
					["guid"] = "Player-1602-0F50C767",
					["class"] = "EVOKER",
					["cache_time"] = 1676385549,
					["realm"] = "Гордунни",
				},
				["Player-1305-0C4050A6"] = {
					["name"] = "Mootivation-Kazzak",
					["guid"] = "Player-1305-0C4050A6",
					["class"] = "PALADIN",
					["cache_time"] = 1684412175,
					["realm"] = "Kazzak",
				},
				["Player-2073-043063D3"] = {
					["name"] = "Vegapuncked-Stormscale",
					["guid"] = "Player-2073-043063D3",
					["class"] = "WARRIOR",
					["cache_time"] = 1680754040,
					["realm"] = "Stormscale",
				},
				["Player-633-0AC2AEF6"] = {
					["name"] = "Othros-ShatteredHand",
					["guid"] = "Player-633-0AC2AEF6",
					["class"] = "PALADIN",
					["cache_time"] = 1683073477,
					["realm"] = "ShatteredHand",
				},
				["Player-1403-0A49E12E"] = {
					["name"] = "Jawady-Draenor",
					["guid"] = "Player-1403-0A49E12E",
					["class"] = "ROGUE",
					["cache_time"] = 1680027948,
					["realm"] = "Draenor",
				},
				["Player-1313-0C6EADBF"] = {
					["name"] = "Keksicek-Thunderhorn",
					["guid"] = "Player-1313-0C6EADBF",
					["class"] = "PRIEST",
					["cache_time"] = 1677223354,
					["realm"] = "Thunderhorn",
				},
				["Player-1379-052D61CE"] = {
					["name"] = "Bullord-Uldum",
					["guid"] = "Player-1379-052D61CE",
					["class"] = "WARRIOR",
					["cache_time"] = 1686934454,
					["realm"] = "Uldum",
				},
				["Player-3674-05B1449F"] = {
					["name"] = "Blessis-TwistingNether",
					["guid"] = "Player-3674-05B1449F",
					["class"] = "PRIEST",
					["cache_time"] = 1689804288,
					["realm"] = "TwistingNether",
				},
				["Player-1615-0AE828D0"] = {
					["name"] = "бухойхил-Ревущийфьорд",
					["guid"] = "Player-1615-0AE828D0",
					["class"] = "DRUID",
					["cache_time"] = 1676377737,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3674-0B1F7105"] = {
					["name"] = "Nagå-TwistingNether",
					["guid"] = "Player-3674-0B1F7105",
					["class"] = "WARLOCK",
					["cache_time"] = 1680470506,
					["realm"] = "TwistingNether",
				},
				["Player-580-0A6A92ED"] = {
					["name"] = "Ahímoth-Blackmoore",
					["guid"] = "Player-580-0A6A92ED",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1677606207,
					["realm"] = "Blackmoore",
				},
				["Player-3674-0AEB1E44"] = {
					["name"] = "Gacangur-TwistingNether",
					["guid"] = "Player-3674-0AEB1E44",
					["class"] = "SHAMAN",
					["cache_time"] = 1680290994,
					["realm"] = "TwistingNether",
				},
				["Player-1602-0F4700CA"] = {
					["name"] = "древесница-Гордунни",
					["guid"] = "Player-1602-0F4700CA",
					["class"] = "EVOKER",
					["cache_time"] = 1677106924,
					["realm"] = "Гордунни",
				},
				["Player-1615-0AD4448D"] = {
					["name"] = "кенчикх-Ревущийфьорд",
					["guid"] = "Player-1615-0AD4448D",
					["class"] = "PRIEST",
					["cache_time"] = 1689338641,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1305-0C143821"] = {
					["name"] = "Shakkh-Kazzak",
					["guid"] = "Player-1305-0C143821",
					["class"] = "MAGE",
					["cache_time"] = 1689253178,
					["realm"] = "Kazzak",
				},
				["Player-1390-0C5A6BFE"] = {
					["name"] = "Teâmy-Hyjal",
					["guid"] = "Player-1390-0C5A6BFE",
					["class"] = "EVOKER",
					["cache_time"] = 1676372636,
					["realm"] = "Hyjal",
				},
				["Player-1305-0C6293FB"] = {
					["ilvl"] = 414.75,
					["guid"] = "Player-1305-0C6293FB",
					["class"] = "WARLOCK",
					["role"] = "DAMAGER",
					["cache_time"] = 1680122031,
					["realm"] = "Kazzak",
					["name"] = "Moglocked-Kazzak",
					["specID"] = 266,
					["enchantingLvl"] = 0,
					["rank"] = "Raider",
				},
				["Player-1596-075D11E3"] = {
					["name"] = "Naughtykitty-TheMaelstrom",
					["guid"] = "Player-1596-075D11E3",
					["class"] = "PALADIN",
					["cache_time"] = 1677665404,
					["realm"] = "TheMaelstrom",
				},
				["Player-3682-0B09E3F2"] = {
					["ilvl"] = 437.9375,
					["guid"] = "Player-3682-0B09E3F2",
					["class"] = "EVOKER",
					["role"] = "DAMAGER",
					["cache_time"] = 1686170372,
					["realm"] = "Ragnaros",
					["name"] = "Sliyrak-Ragnaros",
					["specID"] = 1467,
					["enchantingLvl"] = 0,
					["rank"] = "Mythic Raider",
				},
				["Player-604-09EEA15F"] = {
					["name"] = "Milian-Thrall",
					["guid"] = "Player-604-09EEA15F",
					["class"] = "WARRIOR",
					["cache_time"] = 1687257934,
					["realm"] = "Thrall",
				},
				["Player-1403-09BF6AC3"] = {
					["name"] = "Eatmeillidan-Draenor",
					["guid"] = "Player-1403-09BF6AC3",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689618153,
					["realm"] = "Draenor",
				},
				["Player-2073-071707DF"] = {
					["name"] = "Agapimenus-Stormscale",
					["guid"] = "Player-2073-071707DF",
					["class"] = "WARLOCK",
					["cache_time"] = 1684413259,
					["realm"] = "Stormscale",
				},
				["Player-604-08B5F3AD"] = {
					["name"] = "Schlìtz-Thrall",
					["guid"] = "Player-604-08B5F3AD",
					["class"] = "DRUID",
					["cache_time"] = 1685539218,
					["realm"] = "Thrall",
				},
				["Player-604-081B4B65"] = {
					["name"] = "Geroi-Thrall",
					["guid"] = "Player-604-081B4B65",
					["class"] = "MONK",
					["cache_time"] = 1676502766,
					["realm"] = "Thrall",
				},
				["Player-580-0A5D0BD0"] = {
					["name"] = "Healgecko-Blackmoore",
					["guid"] = "Player-580-0A5D0BD0",
					["class"] = "EVOKER",
					["cache_time"] = 1684209680,
					["realm"] = "Blackmoore",
				},
				["Player-633-0A8E618A"] = {
					["name"] = "Zeléne-ShatteredHand",
					["guid"] = "Player-633-0A8E618A",
					["class"] = "PALADIN",
					["cache_time"] = 1680708830,
					["realm"] = "ShatteredHand",
				},
				["Player-1305-0C8EF384"] = {
					["name"] = "Tóothlèss-Kazzak",
					["guid"] = "Player-1305-0C8EF384",
					["class"] = "EVOKER",
					["cache_time"] = 1689677222,
					["realm"] = "Kazzak",
				},
				["Player-3682-05C5D679"] = {
					["name"] = "Lódís-Ragnaros",
					["guid"] = "Player-3682-05C5D679",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676533093,
					["realm"] = "Ragnaros",
				},
				["Player-612-0A668579"] = {
					["name"] = "Exxo-Destromath",
					["guid"] = "Player-612-0A668579",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687102798,
					["realm"] = "Destromath",
				},
				["Player-1084-0A68C9A1"] = {
					["name"] = "Sokekboii-TarrenMill",
					["guid"] = "Player-1084-0A68C9A1",
					["class"] = "WARRIOR",
					["cache_time"] = 1687040673,
					["realm"] = "TarrenMill",
				},
				["Player-3691-09F7DE4D"] = {
					["name"] = "Ilonie-Blackhand",
					["guid"] = "Player-3691-09F7DE4D",
					["class"] = "PALADIN",
					["cache_time"] = 1676439631,
					["realm"] = "Blackhand",
				},
				["Player-1604-0F454DAD"] = {
					["name"] = "аленкинакин-СвежевательДуш",
					["guid"] = "Player-1604-0F454DAD",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687102801,
					["realm"] = "СвежевательДуш",
				},
				["Player-3691-06A1F1AA"] = {
					["name"] = "Depletion-Blackhand",
					["guid"] = "Player-3691-06A1F1AA",
					["class"] = "DRUID",
					["cache_time"] = 1676331628,
					["realm"] = "Blackhand",
				},
				["Player-1406-0488401E"] = {
					["name"] = "Wombad-Khaz'goroth",
					["guid"] = "Player-1406-0488401E",
					["class"] = "HUNTER",
					["cache_time"] = 1689699139,
					["realm"] = "Khaz'goroth",
				},
				["Player-1302-0C81E0D3"] = {
					["name"] = "Wiilybenched-Archimonde",
					["guid"] = "Player-1302-0C81E0D3",
					["class"] = "MAGE",
					["cache_time"] = 1677319954,
					["realm"] = "Archimonde",
				},
				["Player-1091-04FF0CD1"] = {
					["name"] = "Nouch-Emeriss",
					["guid"] = "Player-1091-04FF0CD1",
					["class"] = "SHAMAN",
					["cache_time"] = 1686971553,
					["realm"] = "Emeriss",
				},
				["Player-1316-07F55442"] = {
					["role"] = "DAMAGER",
					["name"] = "Zarhigna-Nemesis",
					["guid"] = "Player-1316-07F55442",
					["rank"] = "Alt Officer",
					["class"] = "WARLOCK",
					["cache_time"] = 1677489750,
					["realm"] = "Nemesis",
				},
				["Player-1403-080AF440"] = {
					["name"] = "Shylena-Draenor",
					["guid"] = "Player-1403-080AF440",
					["class"] = "PRIEST",
					["cache_time"] = 1676387096,
					["realm"] = "Draenor",
				},
				["Player-1621-0B165433"] = {
					["name"] = "Koralion-MarécagedeZangar",
					["guid"] = "Player-1621-0B165433",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1686934343,
					["realm"] = "MarécagedeZangar",
				},
				["Player-3696-09B813FA"] = {
					["name"] = "Brewio-Nethersturm",
					["guid"] = "Player-3696-09B813FA",
					["class"] = "MONK",
					["cache_time"] = 1689677222,
					["realm"] = "Nethersturm",
				},
				["Player-604-04040D35"] = {
					["name"] = "Caddi-Thrall",
					["guid"] = "Player-604-04040D35",
					["class"] = "DRUID",
					["cache_time"] = 1687949172,
					["realm"] = "Thrall",
				},
				["Player-580-0A4C8ED1"] = {
					["name"] = "Nukepriest-Blackmoore",
					["guid"] = "Player-580-0A4C8ED1",
					["class"] = "PRIEST",
					["cache_time"] = 1676370489,
					["realm"] = "Blackmoore",
				},
				["Player-1403-0A5047A7"] = {
					["name"] = "Bergo-Draenor",
					["guid"] = "Player-1403-0A5047A7",
					["class"] = "WARRIOR",
					["cache_time"] = 1686196010,
					["realm"] = "Draenor",
				},
				["Player-3713-0A883B8B"] = {
					["name"] = "Riupala-BurningLegion",
					["guid"] = "Player-3713-0A883B8B",
					["class"] = "PALADIN",
					["cache_time"] = 1686037845,
					["realm"] = "BurningLegion",
				},
				["Player-1923-0F5F5687"] = {
					["name"] = "шилка-Ясеневыйлес",
					["guid"] = "Player-1923-0F5F5687",
					["class"] = "MONK",
					["cache_time"] = 1686773989,
					["realm"] = "Ясеневыйлес",
				},
				["Player-3391-0BD1B55C"] = {
					["name"] = "Juicewrldger-Silvermoon",
					["guid"] = "Player-3391-0BD1B55C",
					["class"] = "HUNTER",
					["cache_time"] = 1676370489,
					["realm"] = "Silvermoon",
				},
				["Player-1598-0F0402B8"] = {
					["ilvl"] = 437.0625,
					["guid"] = "Player-1598-0F0402B8",
					["class"] = "MONK",
					["role"] = "HEALER",
					["cache_time"] = 1687260231,
					["realm"] = "LaughingSkull",
					["name"] = "Sprecher-LaughingSkull",
					["specID"] = 270,
					["enchantingLvl"] = 0,
					["rank"] = "Officer Main",
				},
				["Player-3702-0A802FE5"] = {
					["name"] = "Azolian-ArgentDawn",
					["guid"] = "Player-3702-0A802FE5",
					["class"] = "EVOKER",
					["cache_time"] = 1687791302,
					["realm"] = "ArgentDawn",
				},
				["Player-1329-0933B86B"] = {
					["name"] = "Ormal-Ravencrest",
					["guid"] = "Player-1329-0933B86B",
					["class"] = "PALADIN",
					["cache_time"] = 1679747022,
					["realm"] = "Ravencrest",
				},
				["Player-1121-05DFF8B7"] = {
					["name"] = "Klyra-KultderVerdammten",
					["guid"] = "Player-1121-05DFF8B7",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687298820,
					["realm"] = "KultderVerdammten",
				},
				["Player-1390-08E062D4"] = {
					["name"] = "Gromuscle-Hyjal",
					["guid"] = "Player-1390-08E062D4",
					["class"] = "SHAMAN",
					["cache_time"] = 1687245813,
					["realm"] = "Hyjal",
				},
				["Player-3682-0B083399"] = {
					["name"] = "Olgey-Ragnaros",
					["guid"] = "Player-3682-0B083399",
					["class"] = "WARLOCK",
					["cache_time"] = 1688687303,
					["realm"] = "Ragnaros",
				},
				["Player-1615-0AEC533E"] = {
					["name"] = "майндоф-Ревущийфьорд",
					["guid"] = "Player-1615-0AEC533E",
					["class"] = "PRIEST",
					["cache_time"] = 1686121310,
					["realm"] = "Ревущийфьорд",
				},
				["Player-2073-09C9E9F2"] = {
					["name"] = "Sjöhäst-Stormscale",
					["guid"] = "Player-2073-09C9E9F2",
					["class"] = "DRUID",
					["cache_time"] = 1687949013,
					["realm"] = "Stormscale",
				},
				["Player-3656-083B0CBE"] = {
					["ilvl"] = 419.75,
					["guid"] = "Player-3656-083B0CBE",
					["class"] = "SHAMAN",
					["role"] = "DAMAGER",
					["cache_time"] = 1685745494,
					["realm"] = "Stormreaver",
					["name"] = "Sortaja-Stormreaver",
					["specID"] = 262,
					["enchantingLvl"] = 0,
					["rank"] = "Sosiaali",
				},
				["Player-580-0A602214"] = {
					["name"] = "Bovar-Blackmoore",
					["guid"] = "Player-580-0A602214",
					["class"] = "PRIEST",
					["cache_time"] = 1687006559,
					["realm"] = "Blackmoore",
				},
				["Player-3674-08FF5A34"] = {
					["name"] = "Oipi-TwistingNether",
					["guid"] = "Player-3674-08FF5A34",
					["class"] = "PRIEST",
					["cache_time"] = 1679506666,
					["realm"] = "TwistingNether",
				},
				["Player-3391-0C838AFC"] = {
					["name"] = "Grêatlord-Silvermoon",
					["guid"] = "Player-3391-0C838AFC",
					["class"] = "EVOKER",
					["cache_time"] = 1680392947,
					["realm"] = "Silvermoon",
				},
				["Player-510-0A4299FF"] = {
					["name"] = "Gariashy-Vol'jin",
					["guid"] = "Player-510-0A4299FF",
					["class"] = "WARRIOR",
					["cache_time"] = 1677607044,
					["realm"] = "Vol'jin",
				},
				["Player-1084-0A5DE985"] = {
					["name"] = "Jasmaya-TarrenMill",
					["guid"] = "Player-1084-0A5DE985",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1680383988,
					["realm"] = "TarrenMill",
				},
				["Player-1084-05CC5F1B"] = {
					["name"] = "Priestatsu-TarrenMill",
					["guid"] = "Player-1084-05CC5F1B",
					["class"] = "PRIEST",
					["cache_time"] = 1690587500,
					["realm"] = "TarrenMill",
				},
				["Player-581-0A035A13"] = {
					["name"] = "Janubian-Blackrock",
					["guid"] = "Player-581-0A035A13",
					["class"] = "PRIEST",
					["cache_time"] = 1678052884,
					["realm"] = "Blackrock",
				},
				["Player-1602-097179CF"] = {
					["name"] = "алёналёд-Гордунни",
					["guid"] = "Player-1602-097179CF",
					["class"] = "MAGE",
					["cache_time"] = 1687791012,
					["realm"] = "Гордунни",
				},
				["Player-1305-0BCA9F41"] = {
					["name"] = "Rhenya-Kazzak",
					["guid"] = "Player-1305-0BCA9F41",
					["class"] = "HUNTER",
					["cache_time"] = 1684559781,
					["realm"] = "Kazzak",
				},
				["Player-3682-0784CFBD"] = {
					["name"] = "Wyper-Ragnaros",
					["guid"] = "Player-3682-0784CFBD",
					["class"] = "HUNTER",
					["cache_time"] = 1687304879,
					["realm"] = "Ragnaros",
				},
				["Player-3692-061461CE"] = {
					["name"] = "Gauntlgrym-Eredar",
					["guid"] = "Player-3692-061461CE",
					["class"] = "SHAMAN",
					["cache_time"] = 1687949013,
					["realm"] = "Eredar",
				},
				["Player-3682-0B1C6402"] = {
					["name"] = "Jeresmash-Ragnaros",
					["guid"] = "Player-3682-0B1C6402",
					["class"] = "WARRIOR",
					["cache_time"] = 1678312358,
					["realm"] = "Ragnaros",
				},
				["Player-1602-0F64952B"] = {
					["name"] = "кубооктаэдр-Гордунни",
					["guid"] = "Player-1602-0F64952B",
					["class"] = "SHAMAN",
					["cache_time"] = 1690056758,
					["realm"] = "Гордунни",
				},
				["Player-3702-0995F4A6"] = {
					["name"] = "Nieena-ArgentDawn",
					["guid"] = "Player-3702-0995F4A6",
					["class"] = "DRUID",
					["cache_time"] = 1685740823,
					["realm"] = "ArgentDawn",
				},
				["Player-3691-0491ED87"] = {
					["name"] = "Allune-Blackhand",
					["guid"] = "Player-3691-0491ED87",
					["class"] = "PRIEST",
					["cache_time"] = 1687949013,
					["realm"] = "Blackhand",
				},
				["Player-3702-0A94BAE2"] = {
					["name"] = "Heycj-ArgentDawn",
					["guid"] = "Player-3702-0A94BAE2",
					["class"] = "PALADIN",
					["cache_time"] = 1680437946,
					["realm"] = "ArgentDawn",
				},
				["Player-3682-0B08F657"] = {
					["name"] = "Prototyilli-Ragnaros",
					["guid"] = "Player-3682-0B08F657",
					["class"] = "WARRIOR",
					["cache_time"] = 1677672192,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0C87633C"] = {
					["name"] = "Ylandaa-Kazzak",
					["guid"] = "Player-1305-0C87633C",
					["class"] = "PALADIN",
					["cache_time"] = 1687952836,
					["realm"] = "Kazzak",
				},
				["Player-580-07FC697B"] = {
					["name"] = "Cáph-Blackmoore",
					["guid"] = "Player-580-07FC697B",
					["class"] = "MAGE",
					["cache_time"] = 1687949013,
					["realm"] = "Blackmoore",
				},
				["Player-581-08B1C644"] = {
					["name"] = "Teliriyon-Blackrock",
					["guid"] = "Player-581-08B1C644",
					["class"] = "PALADIN",
					["cache_time"] = 1684926332,
					["realm"] = "Blackrock",
				},
				["Player-1096-08BC646E"] = {
					["name"] = "Exion-Ravenholdt",
					["guid"] = "Player-1096-08BC646E",
					["class"] = "PALADIN",
					["cache_time"] = 1687298820,
					["realm"] = "Ravenholdt",
				},
				["Player-1379-0547C5A6"] = {
					["name"] = "Shïnna-Sanguino",
					["guid"] = "Player-1379-0547C5A6",
					["class"] = "SHAMAN",
					["cache_time"] = 1688889814,
					["realm"] = "Sanguino",
				},
				["Player-1602-0C9C71BA"] = {
					["name"] = "упругийбанан-Гордунни",
					["guid"] = "Player-1602-0C9C71BA",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1688687270,
					["realm"] = "Гордунни",
				},
				["Player-3691-0946A932"] = {
					["name"] = "Pushl-Blackhand",
					["guid"] = "Player-3691-0946A932",
					["class"] = "SHAMAN",
					["cache_time"] = 1677665404,
					["realm"] = "Blackhand",
				},
				["Player-1305-0C901852"] = {
					["name"] = "Pikhoo-Kazzak",
					["guid"] = "Player-1305-0C901852",
					["class"] = "PALADIN",
					["cache_time"] = 1687257934,
					["realm"] = "Kazzak",
				},
				["Player-3674-09213C1F"] = {
					["name"] = "Kubaiisi-TwistingNether",
					["guid"] = "Player-3674-09213C1F",
					["class"] = "SHAMAN",
					["cache_time"] = 1686935978,
					["realm"] = "TwistingNether",
				},
				["Player-581-092D17E0"] = {
					["name"] = "Fihptak-Blackrock",
					["guid"] = "Player-581-092D17E0",
					["class"] = "SHAMAN",
					["cache_time"] = 1678642525,
					["realm"] = "Blackrock",
				},
				["Player-3674-0AC1BDD8"] = {
					["name"] = "Meap-TwistingNether",
					["guid"] = "Player-3674-0AC1BDD8",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1680392947,
					["realm"] = "TwistingNether",
				},
				["Player-3656-0A9C8ED1"] = {
					["name"] = "Maggmawl-Stormreaver",
					["guid"] = "Player-3656-0A9C8ED1",
					["class"] = "WARLOCK",
					["cache_time"] = 1686873759,
					["realm"] = "Stormreaver",
				},
				["Player-1403-08121AE0"] = {
					["name"] = "Voedh-Draenor",
					["guid"] = "Player-1403-08121AE0",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687041442,
					["realm"] = "Draenor",
				},
				["Player-3674-0B2411A0"] = {
					["ilvl"] = 423.25,
					["guid"] = "Player-3674-0B2411A0",
					["class"] = "WARLOCK",
					["role"] = "DAMAGER",
					["cache_time"] = 1683918892,
					["realm"] = "TwistingNether",
					["name"] = "Shínza-TwistingNether",
					["specID"] = 267,
					["enchantingLvl"] = 0,
					["rank"] = "Member",
				},
				["Player-3703-0A030A34"] = {
					["name"] = "Strongkong-Frostwolf",
					["guid"] = "Player-3703-0A030A34",
					["class"] = "PALADIN",
					["cache_time"] = 1686121310,
					["realm"] = "Frostwolf",
				},
				["Player-581-06E83C99"] = {
					["name"] = "Buhôi-Blackrock",
					["guid"] = "Player-581-06E83C99",
					["class"] = "DRUID",
					["cache_time"] = 1683073477,
					["realm"] = "Blackrock",
				},
				["Player-1305-0C8D4967"] = {
					["name"] = "Szkala-Kazzak",
					["guid"] = "Player-1305-0C8D4967",
					["class"] = "HUNTER",
					["cache_time"] = 1687041442,
					["realm"] = "Kazzak",
				},
				["Player-1379-0ADD039B"] = {
					["name"] = "Shyrlero-Uldum",
					["guid"] = "Player-1379-0ADD039B",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679245493,
					["realm"] = "Uldum",
				},
				["Player-3674-09D9C7B2"] = {
					["name"] = "Renys-TwistingNether",
					["guid"] = "Player-3674-09D9C7B2",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1684926332,
					["realm"] = "TwistingNether",
				},
				["Player-1615-0AE02942"] = {
					["name"] = "шамёр-Ревущийфьорд",
					["guid"] = "Player-1615-0AE02942",
					["class"] = "SHAMAN",
					["cache_time"] = 1676790256,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3674-0B21A24F"] = {
					["name"] = "Grimoirepala-TwistingNether",
					["guid"] = "Player-3674-0B21A24F",
					["class"] = "PALADIN",
					["cache_time"] = 1684125836,
					["realm"] = "TwistingNether",
				},
				["Player-1615-0A57CFF8"] = {
					["name"] = "эллектор-Ревущийфьорд",
					["guid"] = "Player-1615-0A57CFF8",
					["class"] = "MONK",
					["cache_time"] = 1679506666,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3682-0B0AE781"] = {
					["name"] = "Tessarionn-Ragnaros",
					["guid"] = "Player-3682-0B0AE781",
					["class"] = "EVOKER",
					["cache_time"] = 1690121248,
					["realm"] = "Ragnaros",
				},
				["Player-1597-0D0828AF"] = {
					["name"] = "Hotsjik-Sylvanas",
					["guid"] = "Player-1597-0D0828AF",
					["class"] = "ROGUE",
					["cache_time"] = 1687791012,
					["realm"] = "Sylvanas",
				},
				["Player-509-0553DD72"] = {
					["name"] = "Chamenerve-Sargeras",
					["guid"] = "Player-509-0553DD72",
					["class"] = "SHAMAN",
					["cache_time"] = 1687949367,
					["realm"] = "Sargeras",
				},
				["Player-3674-0B26A942"] = {
					["name"] = "Wasert-TwistingNether",
					["guid"] = "Player-3674-0B26A942",
					["class"] = "MAGE",
					["cache_time"] = 1685329621,
					["realm"] = "TwistingNether",
				},
				["Player-3674-0B276C98"] = {
					["name"] = "Burntleather-TwistingNether",
					["guid"] = "Player-3674-0B276C98",
					["class"] = "MONK",
					["cache_time"] = 1687157687,
					["realm"] = "TwistingNether",
				},
				["Player-3391-0BB7AEA6"] = {
					["name"] = "Therca-Silvermoon",
					["guid"] = "Player-3391-0BB7AEA6",
					["class"] = "DRUID",
					["cache_time"] = 1687791302,
					["realm"] = "Silvermoon",
				},
				["Player-1305-0C795508"] = {
					["name"] = "Infectedmosh-Kazzak",
					["guid"] = "Player-1305-0C795508",
					["class"] = "EVOKER",
					["cache_time"] = 1688983952,
					["realm"] = "Kazzak",
				},
				["Player-1305-08B552BC"] = {
					["name"] = "Samwide-Kazzak",
					["guid"] = "Player-1305-08B552BC",
					["class"] = "HUNTER",
					["cache_time"] = 1688296901,
					["realm"] = "Kazzak",
				},
				["Player-3691-0A0156EA"] = {
					["name"] = "Amazingmedi-Blackhand",
					["guid"] = "Player-3691-0A0156EA",
					["class"] = "PALADIN",
					["cache_time"] = 1686121310,
					["realm"] = "Blackhand",
				},
				["Player-3691-069D3CAF"] = {
					["name"] = "Xarthrion-Blackhand",
					["guid"] = "Player-3691-069D3CAF",
					["class"] = "WARLOCK",
					["cache_time"] = 1676423903,
					["realm"] = "Blackhand",
				},
				["Player-1329-09F7BAF3"] = {
					["name"] = "Pesdrakon-Ravencrest",
					["guid"] = "Player-1329-09F7BAF3",
					["class"] = "EVOKER",
					["cache_time"] = 1689397951,
					["realm"] = "Ravencrest",
				},
				["Player-1587-0F504072"] = {
					["name"] = "Halocline-Nagrand",
					["guid"] = "Player-1587-0F504072",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1676808823,
					["realm"] = "Nagrand",
				},
				["Player-1604-0F589CBD"] = {
					["name"] = "драге-СвежевательДуш",
					["guid"] = "Player-1604-0F589CBD",
					["class"] = "ROGUE",
					["cache_time"] = 1680290994,
					["realm"] = "СвежевательДуш",
				},
				["Player-510-0A540A85"] = {
					["name"] = "Ainoko-Vol'jin",
					["guid"] = "Player-510-0A540A85",
					["class"] = "MONK",
					["cache_time"] = 1683906211,
					["realm"] = "Vol'jin",
				},
				["Player-1615-0A472519"] = {
					["name"] = "вайтвинг-Ревущийфьорд",
					["guid"] = "Player-1615-0A472519",
					["class"] = "WARLOCK",
					["cache_time"] = 1684926332,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1403-0A5FF16A"] = {
					["name"] = "Antharis-Draenor",
					["guid"] = "Player-1403-0A5FF16A",
					["class"] = "PALADIN",
					["cache_time"] = 1676311312,
					["realm"] = "Draenor",
				},
				["Player-3703-04CDCF36"] = {
					["name"] = "Firstwarrior-Frostwolf",
					["guid"] = "Player-3703-04CDCF36",
					["class"] = "WARRIOR",
					["cache_time"] = 1686121310,
					["realm"] = "Frostwolf",
				},
				["Player-3682-05D07C90"] = {
					["ilvl"] = 443.625,
					["guid"] = "Player-3682-05D07C90",
					["class"] = "WARLOCK",
					["rank"] = "Trial",
					["role"] = "DAMAGER",
					["cache_time"] = 1689281451,
					["name"] = "Papee-Ragnaros",
					["enchanter"] = true,
					["specID"] = 267,
					["enchantingLvl"] = 105,
					["realm"] = "Ragnaros",
				},
				["Player-1303-0B5B24AE"] = {
					["name"] = "Zarodai-Frostmane",
					["guid"] = "Player-1303-0B5B24AE",
					["class"] = "WARRIOR",
					["cache_time"] = 1678461554,
					["realm"] = "Frostmane",
				},
				["Player-1313-0C8B8FBE"] = {
					["name"] = "Teryc-Wildhammer",
					["guid"] = "Player-1313-0C8B8FBE",
					["class"] = "WARRIOR",
					["cache_time"] = 1688301840,
					["realm"] = "Wildhammer",
				},
				["Player-1379-0AA7C84F"] = {
					["name"] = "Flashkete-Sanguino",
					["guid"] = "Player-1379-0AA7C84F",
					["class"] = "ROGUE",
					["cache_time"] = 1687245813,
					["realm"] = "Sanguino",
				},
				["Player-3682-075BDFB1"] = {
					["name"] = "Voldeath-Ragnaros",
					["guid"] = "Player-3682-075BDFB1",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1679506666,
					["realm"] = "Ragnaros",
				},
				["Player-1390-0B8BC333"] = {
					["name"] = "Banyuk-Hyjal",
					["guid"] = "Player-1390-0B8BC333",
					["class"] = "WARRIOR",
					["cache_time"] = 1676973948,
					["realm"] = "Hyjal",
				},
				["Player-580-0A4A07F7"] = {
					["name"] = "Latriax-Blackmoore",
					["guid"] = "Player-580-0A4A07F7",
					["class"] = "DRUID",
					["cache_time"] = 1689677188,
					["realm"] = "Blackmoore",
				},
				["Player-581-0A72E628"] = {
					["name"] = "Hpaly-Blackrock",
					["guid"] = "Player-581-0A72E628",
					["class"] = "PALADIN",
					["cache_time"] = 1684877955,
					["realm"] = "Blackrock",
				},
				["Player-1615-07FB2370"] = {
					["name"] = "вылечуска-Ревущийфьорд",
					["guid"] = "Player-1615-07FB2370",
					["class"] = "PRIEST",
					["cache_time"] = 1688908574,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1602-0F58B7EF"] = {
					["name"] = "суперслива-Гордунни",
					["guid"] = "Player-1602-0F58B7EF",
					["class"] = "ROGUE",
					["cache_time"] = 1686614799,
					["realm"] = "Гордунни",
				},
				["Player-1615-0AE8CC4D"] = {
					["name"] = "энджиайс-Ревущийфьорд",
					["guid"] = "Player-1615-0AE8CC4D",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1679631178,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3391-0C8EC3A2"] = {
					["name"] = "Knívsta-Silvermoon",
					["guid"] = "Player-3391-0C8EC3A2",
					["class"] = "WARRIOR",
					["cache_time"] = 1685342409,
					["realm"] = "Silvermoon",
				},
				["Player-1307-06F98010"] = {
					["name"] = "Bloodanger-ChamberofAspects",
					["guid"] = "Player-1307-06F98010",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687949013,
					["realm"] = "ChamberofAspects",
				},
				["Player-1390-0C63D639"] = {
					["name"] = "Becksai-Hyjal",
					["guid"] = "Player-1390-0C63D639",
					["class"] = "DRUID",
					["cache_time"] = 1689346075,
					["realm"] = "Hyjal",
				},
				["Player-1390-0C546112"] = {
					["name"] = "Cône-Hyjal",
					["guid"] = "Player-1390-0C546112",
					["class"] = "EVOKER",
					["cache_time"] = 1687955030,
					["realm"] = "Hyjal",
				},
				["Player-1417-0A00379B"] = {
					["name"] = "Platepriest-Stormrage",
					["guid"] = "Player-1417-0A00379B",
					["class"] = "PALADIN",
					["cache_time"] = 1687955030,
					["realm"] = "Stormrage",
				},
				["Player-1305-0C803317"] = {
					["name"] = "Mmdcarrykon-Kazzak",
					["guid"] = "Player-1305-0C803317",
					["class"] = "HUNTER",
					["cache_time"] = 1680221247,
					["realm"] = "Kazzak",
				},
				["Player-1302-0667E989"] = {
					["name"] = "Rexvitae-Archimonde",
					["guid"] = "Player-1302-0667E989",
					["class"] = "SHAMAN",
					["cache_time"] = 1688687303,
					["realm"] = "Archimonde",
				},
				["Player-1305-0A4D68BF"] = {
					["name"] = "Thelitemaze-Kazzak",
					["guid"] = "Player-1305-0A4D68BF",
					["class"] = "PALADIN",
					["cache_time"] = 1680292466,
					["realm"] = "Kazzak",
				},
				["Player-3691-09CFE765"] = {
					["name"] = "Rethias-Blackhand",
					["guid"] = "Player-3691-09CFE765",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1688687303,
					["realm"] = "Blackhand",
				},
				["Player-3691-0A0572BC"] = {
					["name"] = "Brânde-Blackhand",
					["guid"] = "Player-3691-0A0572BC",
					["class"] = "WARRIOR",
					["cache_time"] = 1687954070,
					["realm"] = "Blackhand",
				},
				["Player-1379-0A7EE962"] = {
					["name"] = "Endrelock-Sanguino",
					["guid"] = "Player-1379-0A7EE962",
					["class"] = "WARLOCK",
					["cache_time"] = 1680262695,
					["realm"] = "Sanguino",
				},
				["Player-1084-08C897A9"] = {
					["name"] = "Shadowslady-TarrenMill",
					["guid"] = "Player-1084-08C897A9",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1687953965,
					["realm"] = "TarrenMill",
				},
				["Player-1302-0BEBD3C3"] = {
					["name"] = "Diposite-Archimonde",
					["guid"] = "Player-1302-0BEBD3C3",
					["class"] = "PALADIN",
					["cache_time"] = 1676383325,
					["realm"] = "Archimonde",
				},
				["Player-3674-0A829BE1"] = {
					["name"] = "Stylishqt-TwistingNether",
					["guid"] = "Player-3674-0A829BE1",
					["class"] = "ROGUE",
					["cache_time"] = 1686935978,
					["realm"] = "TwistingNether",
				},
				["Player-3692-061C546A"] = {
					["name"] = "Desiria-Eredar",
					["guid"] = "Player-3692-061C546A",
					["class"] = "ROGUE",
					["cache_time"] = 1675869700,
					["realm"] = "Eredar",
				},
				["Player-1403-079985C6"] = {
					["name"] = "Tylk-Draenor",
					["guid"] = "Player-1403-079985C6",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687949672,
					["realm"] = "Draenor",
				},
				["Player-3713-0ADFE068"] = {
					["name"] = "Badxman-BurningLegion",
					["guid"] = "Player-3713-0ADFE068",
					["class"] = "PALADIN",
					["cache_time"] = 1680124914,
					["realm"] = "BurningLegion",
				},
				["Player-3691-09E751AB"] = {
					["name"] = "Dracdracula-Blackhand",
					["guid"] = "Player-3691-09E751AB",
					["class"] = "EVOKER",
					["cache_time"] = 1684926332,
					["realm"] = "Blackhand",
				},
				["Player-1316-0A70E50B"] = {
					["name"] = "Venethor-Nemesis",
					["guid"] = "Player-1316-0A70E50B",
					["class"] = "SHAMAN",
					["cache_time"] = 1687954070,
					["realm"] = "Nemesis",
				},
				["Player-1403-0A5A7790"] = {
					["name"] = "Rigidum-Draenor",
					["guid"] = "Player-1403-0A5A7790",
					["class"] = "EVOKER",
					["cache_time"] = 1678230027,
					["realm"] = "Draenor",
				},
				["Player-3682-0B15D370"] = {
					["ilvl"] = 441.5,
					["guid"] = "Player-3682-0B15D370",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["cache_time"] = 1687467846,
					["realm"] = "Ragnaros",
					["name"] = "Cryst-Ragnaros",
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["rank"] = "Trial",
				},
				["Player-604-0435ACEB"] = {
					["name"] = "Teufelsseele-Thrall",
					["guid"] = "Player-604-0435ACEB",
					["class"] = "ROGUE",
					["cache_time"] = 1686121947,
					["realm"] = "Thrall",
				},
				["Player-531-07B0224C"] = {
					["name"] = "Heiligebohne-Terrordar",
					["guid"] = "Player-531-07B0224C",
					["class"] = "PALADIN",
					["cache_time"] = 1677607044,
					["realm"] = "Terrordar",
				},
				["Player-1416-079B2F55"] = {
					["name"] = "Egyptian-Blade'sEdge",
					["guid"] = "Player-1416-079B2F55",
					["class"] = "HUNTER",
					["cache_time"] = 1688889814,
					["realm"] = "Blade'sEdge",
				},
				["Player-1925-0B4A7FCF"] = {
					["name"] = "флаурос-ВечнаяПесня",
					["guid"] = "Player-1925-0B4A7FCF",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1686126505,
					["realm"] = "ВечнаяПесня",
				},
				["Player-3682-0B0664C7"] = {
					["ilvl"] = 441.25,
					["guid"] = "Player-3682-0B0664C7",
					["class"] = "WARRIOR",
					["realm"] = "Ragnaros",
					["role"] = "DAMAGER",
					["cache_time"] = 1688676359,
					["name"] = "Rap-Ragnaros",
					["specID"] = 72,
					["enchanter"] = true,
					["enchantingLvl"] = 57,
					["rank"] = "Raider",
				},
				["Player-3674-0B264AA1"] = {
					["name"] = "Ziyankar-TwistingNether",
					["guid"] = "Player-3674-0B264AA1",
					["class"] = "SHAMAN",
					["cache_time"] = 1689419853,
					["realm"] = "TwistingNether",
				},
				["Player-1390-0C8C3CA9"] = {
					["name"] = "Mikboubou-Hyjal",
					["guid"] = "Player-1390-0C8C3CA9",
					["class"] = "PALADIN",
					["cache_time"] = 1687949172,
					["realm"] = "Hyjal",
				},
				["Player-1390-0C505AE7"] = {
					["name"] = "Ishuzú-Hyjal",
					["guid"] = "Player-1390-0C505AE7",
					["class"] = "MONK",
					["cache_time"] = 1689387100,
					["realm"] = "Hyjal",
				},
				["Player-1329-0A018999"] = {
					["name"] = "Hellgardigan-Ravencrest",
					["guid"] = "Player-1329-0A018999",
					["class"] = "WARLOCK",
					["cache_time"] = 1687298820,
					["realm"] = "Ravencrest",
				},
				["Player-3713-09303A55"] = {
					["name"] = "Kawa-BurningLegion",
					["guid"] = "Player-3713-09303A55",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1685745494,
					["realm"] = "BurningLegion",
				},
				["Player-1305-0C629985"] = {
					["name"] = "Loordmonk-Kazzak",
					["guid"] = "Player-1305-0C629985",
					["class"] = "MONK",
					["cache_time"] = 1688985357,
					["realm"] = "Kazzak",
				},
				["Player-1615-0B0A4102"] = {
					["name"] = "змиаш-Ревущийфьорд",
					["guid"] = "Player-1615-0B0A4102",
					["class"] = "EVOKER",
					["cache_time"] = 1689353247,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1302-09F279A5"] = {
					["name"] = "Eclawpé-Archimonde",
					["guid"] = "Player-1302-09F279A5",
					["class"] = "DRUID",
					["cache_time"] = 1689772053,
					["realm"] = "Archimonde",
				},
				["Player-3682-0B292702"] = {
					["name"] = "Wârpig-Ragnaros",
					["guid"] = "Player-3682-0B292702",
					["class"] = "WARRIOR",
					["cache_time"] = 1689297589,
					["realm"] = "Ragnaros",
				},
				["Player-604-0A6BF2EE"] = {
					["name"] = "Hûmunûku-Thrall",
					["guid"] = "Player-604-0A6BF2EE",
					["class"] = "HUNTER",
					["cache_time"] = 1679027919,
					["realm"] = "Thrall",
				},
				["Player-581-040E0850"] = {
					["name"] = "Nyerâ-Blackrock",
					["guid"] = "Player-581-040E0850",
					["class"] = "PRIEST",
					["cache_time"] = 1687949013,
					["realm"] = "Blackrock",
				},
				["Player-3692-092EFA0D"] = {
					["name"] = "Hurtsmonk-Eredar",
					["guid"] = "Player-3692-092EFA0D",
					["class"] = "MONK",
					["cache_time"] = 1687949013,
					["realm"] = "Eredar",
				},
				["Player-3682-0A42895A"] = {
					["name"] = "Yamáto-Ragnaros",
					["guid"] = "Player-3682-0A42895A",
					["class"] = "DRUID",
					["cache_time"] = 1690588981,
					["realm"] = "Ragnaros",
				},
				["Player-604-0A696CE4"] = {
					["name"] = "Tae-Ambossar",
					["guid"] = "Player-604-0A696CE4",
					["class"] = "PALADIN",
					["cache_time"] = 1689257602,
					["realm"] = "Ambossar",
				},
				["Player-612-06CFD2E0"] = {
					["name"] = "Krongsmlu-Destromath",
					["guid"] = "Player-612-06CFD2E0",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1689768633,
					["realm"] = "Destromath",
				},
				["Player-1604-0EAB94D0"] = {
					["name"] = "гунфрид-СвежевательДуш",
					["guid"] = "Player-1604-0EAB94D0",
					["class"] = "PALADIN",
					["cache_time"] = 1688993030,
					["realm"] = "СвежевательДуш",
				},
				["Player-1604-0F5861FB"] = {
					["name"] = "зенофар-СвежевательДуш",
					["guid"] = "Player-1604-0F5861FB",
					["class"] = "ROGUE",
					["cache_time"] = 1688993030,
					["realm"] = "СвежевательДуш",
				},
				["Player-1615-06CC62B4"] = {
					["name"] = "бильбауфмэн-Ревущийфьорд",
					["guid"] = "Player-1615-06CC62B4",
					["class"] = "HUNTER",
					["cache_time"] = 1686934454,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3674-07AA39BB"] = {
					["name"] = "Fearlessjr-TwistingNether",
					["guid"] = "Player-3674-07AA39BB",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677665404,
					["realm"] = "TwistingNether",
				},
				["Player-3682-0B1B8B82"] = {
					["ilvl"] = 410.9375,
					["guid"] = "Player-3682-0B1B8B82",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["cache_time"] = 1677180283,
					["rank"] = "Trial",
					["name"] = "Teckó-Ragnaros",
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["realm"] = "Ragnaros",
				},
				["Player-1335-04EA33C3"] = {
					["name"] = "Nutsa-Ysondre",
					["guid"] = "Player-1335-04EA33C3",
					["class"] = "DRUID",
					["cache_time"] = 1689004698,
					["realm"] = "Ysondre",
				},
				["Player-1329-09F7D6B5"] = {
					["name"] = "Legitbruv-Ravencrest",
					["guid"] = "Player-1329-09F7D6B5",
					["class"] = "MAGE",
					["cache_time"] = 1676165355,
					["realm"] = "Ravencrest",
				},
				["Player-3682-081BF5BE"] = {
					["name"] = "Täkacs-Ragnaros",
					["guid"] = "Player-3682-081BF5BE",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1687949013,
					["realm"] = "Ragnaros",
				},
				["Player-1602-0F53F60C"] = {
					["name"] = "лоркрафтер-Гордунни",
					["guid"] = "Player-1602-0F53F60C",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676387096,
					["realm"] = "Гордунни",
				},
				["Player-1084-099142B8"] = {
					["name"] = "Nyuû-TarrenMill",
					["guid"] = "Player-1084-099142B8",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689677216,
					["realm"] = "TarrenMill",
				},
				["Player-1390-0C4962A1"] = {
					["name"] = "Saveme-Hyjal",
					["guid"] = "Player-1390-0C4962A1",
					["class"] = "WARRIOR",
					["cache_time"] = 1687955030,
					["realm"] = "Hyjal",
				},
				["Player-1301-0C43C16E"] = {
					["name"] = "Attackhund-Outland",
					["guid"] = "Player-1301-0C43C16E",
					["class"] = "HUNTER",
					["cache_time"] = 1676761804,
					["realm"] = "Outland",
				},
				["Player-3391-0C92A994"] = {
					["name"] = "Presumme-Silvermoon",
					["guid"] = "Player-3391-0C92A994",
					["class"] = "PRIEST",
					["cache_time"] = 1689287248,
					["realm"] = "Silvermoon",
				},
				["Player-1615-0AE95813"] = {
					["ilvl"] = 444.5,
					["guid"] = "Player-1615-0AE95813",
					["class"] = "PRIEST",
					["role"] = "DAMAGER",
					["name"] = "простзайка-Ревущийфьорд",
					["realm"] = "Ревущийфьорд",
					["cache_time"] = 1689252254,
					["specID"] = 258,
					["enchantingLvl"] = 0,
					["rank"] = "Тельце",
				},
				["Player-3674-0B240A7E"] = {
					["name"] = "Ayugard-TwistingNether",
					["guid"] = "Player-3674-0B240A7E",
					["class"] = "DRUID",
					["cache_time"] = 1689677188,
					["realm"] = "TwistingNether",
				},
				["Player-1587-0EC64E72"] = {
					["name"] = "Metaalhoofd-Arathor",
					["guid"] = "Player-1587-0EC64E72",
					["class"] = "PALADIN",
					["cache_time"] = 1675789488,
					["realm"] = "Arathor",
				},
				["Player-1390-09E57D63"] = {
					["name"] = "Välsouille-Hyjal",
					["guid"] = "Player-1390-09E57D63",
					["class"] = "MONK",
					["cache_time"] = 1690493152,
					["realm"] = "Hyjal",
				},
				["Player-1598-0C043F8D"] = {
					["name"] = "Monkblade-Balnazzar",
					["guid"] = "Player-1598-0C043F8D",
					["class"] = "MONK",
					["cache_time"] = 1679506666,
					["realm"] = "Balnazzar",
				},
				["Player-1335-09D0EAA6"] = {
					["name"] = "Millko-Ysondre",
					["guid"] = "Player-1335-09D0EAA6",
					["class"] = "SHAMAN",
					["cache_time"] = 1676448650,
					["realm"] = "Ysondre",
				},
				["Player-3682-0B09EF1E"] = {
					["name"] = "Kcu-Ragnaros",
					["guid"] = "Player-3682-0B09EF1E",
					["class"] = "EVOKER",
					["cache_time"] = 1687157687,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0C92AA2F"] = {
					["name"] = "Zulskar-Kazzak",
					["guid"] = "Player-1305-0C92AA2F",
					["class"] = "ROGUE",
					["cache_time"] = 1689247435,
					["realm"] = "Kazzak",
				},
				["Player-1305-0ACE46C5"] = {
					["name"] = "Mattadoorr-Kazzak",
					["guid"] = "Player-1305-0ACE46C5",
					["class"] = "PALADIN",
					["cache_time"] = 1677347909,
					["realm"] = "Kazzak",
				},
				["Player-3682-0ADF29F8"] = {
					["name"] = "Molesboom-Ragnaros",
					["guid"] = "Player-3682-0ADF29F8",
					["class"] = "DRUID",
					["cache_time"] = 1689800841,
					["realm"] = "Ragnaros",
				},
				["Player-1084-09D19613"] = {
					["name"] = "Rukkari-TarrenMill",
					["guid"] = "Player-1084-09D19613",
					["class"] = "ROGUE",
					["cache_time"] = 1679747022,
					["realm"] = "TarrenMill",
				},
				["Player-3674-0AEF211C"] = {
					["name"] = "Honeysmacks-TwistingNether",
					["guid"] = "Player-3674-0AEF211C",
					["class"] = "DRUID",
					["cache_time"] = 1687956237,
					["realm"] = "TwistingNether",
				},
				["Player-1390-0C8724C5"] = {
					["name"] = "Hed-Hyjal",
					["guid"] = "Player-1390-0C8724C5",
					["class"] = "WARRIOR",
					["cache_time"] = 1686773989,
					["realm"] = "Hyjal",
				},
				["Player-1615-07606BF9"] = {
					["name"] = "йоулон-Ревущийфьорд",
					["guid"] = "Player-1615-07606BF9",
					["class"] = "PALADIN",
					["cache_time"] = 1687248521,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1390-0C53F8D3"] = {
					["name"] = "Ilepsyr-Hyjal",
					["guid"] = "Player-1390-0C53F8D3",
					["class"] = "EVOKER",
					["cache_time"] = 1686934454,
					["realm"] = "Hyjal",
				},
				["Player-1379-0AE2A3A6"] = {
					["name"] = "Kulterror-Sanguino",
					["guid"] = "Player-1379-0AE2A3A6",
					["class"] = "MAGE",
					["cache_time"] = 1683073733,
					["realm"] = "Sanguino",
				},
				["Player-1403-06DC14B3"] = {
					["name"] = "Smellyhands-Draenor",
					["guid"] = "Player-1403-06DC14B3",
					["class"] = "MONK",
					["cache_time"] = 1685573068,
					["realm"] = "Draenor",
				},
				["Player-1615-0838905A"] = {
					["name"] = "одрихеппберн-Ревущийфьорд",
					["guid"] = "Player-1615-0838905A",
					["class"] = "DRUID",
					["cache_time"] = 1689353263,
					["realm"] = "Ревущийфьорд",
				},
				["Player-3674-0B0A3148"] = {
					["role"] = "DAMAGER",
					["name"] = "Draktherion-TwistingNether",
					["guid"] = "Player-3674-0B0A3148",
					["realm"] = "TwistingNether",
					["class"] = "EVOKER",
					["cache_time"] = 1689183684,
					["rank"] = "Officer",
				},
				["Player-1305-0BEB3916"] = {
					["name"] = "Dunkitty-Kazzak",
					["guid"] = "Player-1305-0BEB3916",
					["class"] = "MONK",
					["cache_time"] = 1678372296,
					["realm"] = "Kazzak",
				},
				["Player-1390-0C8A8F0B"] = {
					["name"] = "Vaykia-Hyjal",
					["guid"] = "Player-1390-0C8A8F0B",
					["class"] = "PRIEST",
					["cache_time"] = 1689004698,
					["realm"] = "Hyjal",
				},
				["Player-3681-07BAD478"] = {
					["name"] = "Sectorclear-Magtheridon",
					["guid"] = "Player-3681-07BAD478",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1689024234,
					["realm"] = "Magtheridon",
				},
				["Player-3674-0A707994"] = {
					["name"] = "Enfeebsp-TwistingNether",
					["guid"] = "Player-3674-0A707994",
					["class"] = "PRIEST",
					["cache_time"] = 1689772053,
					["realm"] = "TwistingNether",
				},
				["Player-3703-09F157BF"] = {
					["name"] = "Høneý-Frostwolf",
					["guid"] = "Player-3703-09F157BF",
					["class"] = "DRUID",
					["cache_time"] = 1686873759,
					["realm"] = "Frostwolf",
				},
				["Player-3682-0B21063A"] = {
					["ilvl"] = 418,
					["guid"] = "Player-3682-0B21063A",
					["class"] = "DEATHKNIGHT",
					["role"] = "TANK",
					["cache_time"] = 1686165354,
					["realm"] = "Ragnaros",
					["name"] = "Mogdead-Ragnaros",
					["specID"] = 250,
					["enchantingLvl"] = 0,
					["rank"] = "Recruiter",
				},
				["Player-3690-0B23E2D1"] = {
					["name"] = "Daléno-KhazModan",
					["guid"] = "Player-3690-0B23E2D1",
					["class"] = "DRUID",
					["cache_time"] = 1685751153,
					["realm"] = "KhazModan",
				},
				["Player-1379-0AE75F28"] = {
					["name"] = "Lamakinamtal-Sanguino",
					["guid"] = "Player-1379-0AE75F28",
					["class"] = "PALADIN",
					["cache_time"] = 1689800300,
					["realm"] = "Sanguino",
				},
				["Player-1305-0B9493F8"] = {
					["name"] = "Holypojk-Kazzak",
					["guid"] = "Player-1305-0B9493F8",
					["class"] = "PALADIN",
					["cache_time"] = 1689698521,
					["realm"] = "Kazzak",
				},
				["Player-1305-0C8441B0"] = {
					["name"] = "Adefted-Kazzak",
					["guid"] = "Player-1305-0C8441B0",
					["class"] = "SHAMAN",
					["cache_time"] = 1678779126,
					["realm"] = "Kazzak",
				},
				["Player-1602-0F52F5C0"] = {
					["name"] = "ансвель-Гордунни",
					["guid"] = "Player-1602-0F52F5C0",
					["class"] = "WARRIOR",
					["cache_time"] = 1676951384,
					["realm"] = "Гордунни",
				},
				["Player-1305-0C8FE493"] = {
					["name"] = "Bartim-Kazzak",
					["guid"] = "Player-1305-0C8FE493",
					["class"] = "ROGUE",
					["cache_time"] = 1689677208,
					["realm"] = "Kazzak",
				},
				["Player-1325-05F6EDC1"] = {
					["name"] = "Thoragrin-Aggramar",
					["guid"] = "Player-1325-05F6EDC1",
					["class"] = "PRIEST",
					["cache_time"] = 1689800841,
					["realm"] = "Aggramar",
				},
				["Player-1329-09D14A6F"] = {
					["name"] = "Kalho-Ravencrest",
					["guid"] = "Player-1329-09D14A6F",
					["class"] = "WARRIOR",
					["cache_time"] = 1676473627,
					["realm"] = "Ravencrest",
				},
				["Player-3674-0B294E6C"] = {
					["name"] = "Euslapal-TwistingNether",
					["guid"] = "Player-3674-0B294E6C",
					["class"] = "PALADIN",
					["cache_time"] = 1689769880,
					["realm"] = "TwistingNether",
				},
				["Player-3682-06E4D0D0"] = {
					["name"] = "Excussum-Ragnaros",
					["guid"] = "Player-3682-06E4D0D0",
					["class"] = "HUNTER",
					["cache_time"] = 1689183044,
					["realm"] = "Ragnaros",
				},
				["Player-1309-0C7B28A3"] = {
					["name"] = "Eigengrau-Pozzodell'Eternità",
					["guid"] = "Player-1309-0C7B28A3",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1689954010,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-1403-0A69ADE2"] = {
					["name"] = "Retardinxx-Draenor",
					["guid"] = "Player-1403-0A69ADE2",
					["class"] = "PALADIN",
					["cache_time"] = 1690406741,
					["realm"] = "Draenor",
				},
				["Player-1092-088451EA"] = {
					["name"] = "Xvaynegodxqt-Drak'thul",
					["guid"] = "Player-1092-088451EA",
					["class"] = "HUNTER",
					["cache_time"] = 1684122124,
					["realm"] = "Drak'thul",
				},
				["Player-581-0A5EA180"] = {
					["name"] = "Komadrac-Blackrock",
					["guid"] = "Player-581-0A5EA180",
					["class"] = "EVOKER",
					["cache_time"] = 1689804288,
					["realm"] = "Blackrock",
				},
				["Player-3703-0945246A"] = {
					["name"] = "Stungodx-Frostwolf",
					["guid"] = "Player-3703-0945246A",
					["class"] = "ROGUE",
					["cache_time"] = 1676973948,
					["realm"] = "Frostwolf",
				},
				["Player-1098-09D50710"] = {
					["name"] = "Zwarley-Malfurion",
					["guid"] = "Player-1098-09D50710",
					["class"] = "PALADIN",
					["cache_time"] = 1676220419,
					["realm"] = "Malfurion",
				},
				["Player-1313-053CFB65"] = {
					["name"] = "Baybas-Wildhammer",
					["guid"] = "Player-1313-053CFB65",
					["class"] = "MONK",
					["cache_time"] = 1687298820,
					["realm"] = "Wildhammer",
				},
				["Player-3682-0B18B5F0"] = {
					["name"] = "Winstreak-Ragnaros",
					["guid"] = "Player-3682-0B18B5F0",
					["class"] = "DRUID",
					["cache_time"] = 1678233785,
					["realm"] = "Ragnaros",
				},
				["Player-581-0A6F3BF7"] = {
					["name"] = "Zêusx-Blackrock",
					["guid"] = "Player-581-0A6F3BF7",
					["class"] = "WARLOCK",
					["cache_time"] = 1685794414,
					["realm"] = "Blackrock",
				},
				["Player-1403-054D07E6"] = {
					["name"] = "Mëgei-Draenor",
					["guid"] = "Player-1403-054D07E6",
					["class"] = "PALADIN",
					["cache_time"] = 1680290994,
					["realm"] = "Draenor",
				},
				["Player-3702-08A7414D"] = {
					["name"] = "Pikachi-ArgentDawn",
					["guid"] = "Player-3702-08A7414D",
					["class"] = "MONK",
					["cache_time"] = 1683808318,
					["realm"] = "ArgentDawn",
				},
				["Player-1604-0E7A20D4"] = {
					["name"] = "слипинфорест-СвежевательДуш",
					["guid"] = "Player-1604-0E7A20D4",
					["class"] = "DRUID",
					["cache_time"] = 1679197333,
					["realm"] = "СвежевательДуш",
				},
				["Player-3692-045DBE35"] = {
					["name"] = "Kyriljin-Eredar",
					["guid"] = "Player-3692-045DBE35",
					["class"] = "PRIEST",
					["cache_time"] = 1686121310,
					["realm"] = "Eredar",
				},
				["Player-1390-0C845CEF"] = {
					["name"] = "Ennìx-Hyjal",
					["guid"] = "Player-1390-0C845CEF",
					["class"] = "EVOKER",
					["cache_time"] = 1687257934,
					["realm"] = "Hyjal",
				},
				["Player-1305-0C01C028"] = {
					["name"] = "Dxbdruid-Kazzak",
					["guid"] = "Player-1305-0C01C028",
					["class"] = "DRUID",
					["cache_time"] = 1677395628,
					["realm"] = "Kazzak",
				},
				["Player-1379-0AC4FA8F"] = {
					["name"] = "Yusikaria-Sanguino",
					["guid"] = "Player-1379-0AC4FA8F",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1677665404,
					["realm"] = "Sanguino",
				},
				["Player-580-0A5F5CF1"] = {
					["name"] = "Gaeng-Blackmoore",
					["guid"] = "Player-580-0A5F5CF1",
					["class"] = "MONK",
					["cache_time"] = 1677878374,
					["realm"] = "Blackmoore",
				},
				["Player-580-0A43BF24"] = {
					["name"] = "Nousklock-Blackmoore",
					["guid"] = "Player-580-0A43BF24",
					["class"] = "WARLOCK",
					["cache_time"] = 1687259300,
					["realm"] = "Blackmoore",
				},
				["Player-3702-0A637276"] = {
					["name"] = "Cthulhas-ArgentDawn",
					["guid"] = "Player-3702-0A637276",
					["class"] = "WARRIOR",
					["cache_time"] = 1690056758,
					["realm"] = "ArgentDawn",
				},
				["Player-1325-03C6080A"] = {
					["name"] = "Nostramu-Aggramar",
					["guid"] = "Player-1325-03C6080A",
					["class"] = "PRIEST",
					["cache_time"] = 1689800841,
					["realm"] = "Aggramar",
				},
				["Player-1401-0A4D70ED"] = {
					["name"] = "Theralia-Nozdormu",
					["guid"] = "Player-1401-0A4D70ED",
					["class"] = "EVOKER",
					["cache_time"] = 1689339555,
					["realm"] = "Nozdormu",
				},
				["Player-1602-0F52D1AD"] = {
					["name"] = "рейнатян-Гордунни",
					["guid"] = "Player-1602-0F52D1AD",
					["class"] = "SHAMAN",
					["cache_time"] = 1689948802,
					["realm"] = "Гордунни",
				},
				["Player-3702-0A914008"] = {
					["name"] = "Cartwell-ArgentDawn",
					["guid"] = "Player-3702-0A914008",
					["class"] = "DEATHKNIGHT",
					["cache_time"] = 1677104859,
					["realm"] = "ArgentDawn",
				},
				["Player-1305-06FCD3A0"] = {
					["name"] = "Vejeta-Kazzak",
					["guid"] = "Player-1305-06FCD3A0",
					["class"] = "PALADIN",
					["cache_time"] = 1690493152,
					["realm"] = "Kazzak",
				},
				["Player-1104-0A17F37C"] = {
					["name"] = "Avalenon-Gul'dan",
					["guid"] = "Player-1104-0A17F37C",
					["class"] = "PRIEST",
					["cache_time"] = 1690042087,
					["realm"] = "Gul'dan",
				},
				["Player-1925-0F06F9FE"] = {
					["name"] = "гелтрон-ВечнаяПесня",
					["guid"] = "Player-1925-0F06F9FE",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1688930496,
					["realm"] = "ВечнаяПесня",
				},
				["Player-3682-0B1015F7"] = {
					["name"] = "Berzerker-Ragnaros",
					["guid"] = "Player-3682-0B1015F7",
					["class"] = "WARRIOR",
					["cache_time"] = 1686933987,
					["realm"] = "Ragnaros",
				},
				["Player-1615-043E8FD7"] = {
					["name"] = "дёргаюбибу-Ревущийфьорд",
					["guid"] = "Player-1615-043E8FD7",
					["class"] = "PRIEST",
					["cache_time"] = 1687949013,
					["realm"] = "Ревущийфьорд",
				},
				["Player-1604-09AF56BC"] = {
					["name"] = "сайлерх-СвежевательДуш",
					["guid"] = "Player-1604-09AF56BC",
					["class"] = "SHAMAN",
					["cache_time"] = 1684883011,
					["realm"] = "СвежевательДуш",
				},
				["Player-3682-0B27A07F"] = {
					["ilvl"] = 437.125,
					["guid"] = "Player-3682-0B27A07F",
					["class"] = "DEMONHUNTER",
					["role"] = "TANK",
					["cache_time"] = 1687304879,
					["realm"] = "Ragnaros",
					["name"] = "Hdç-Ragnaros",
					["specID"] = 581,
					["enchantingLvl"] = 0,
					["rank"] = "Alt",
				},
				["Player-1604-0F6090CA"] = {
					["name"] = "помнипровуду-СвежевательДуш",
					["guid"] = "Player-1604-0F6090CA",
					["class"] = "PRIEST",
					["cache_time"] = 1688879900,
					["realm"] = "СвежевательДуш",
				},
				["Player-1390-0C627C58"] = {
					["name"] = "Blackburne-Hyjal",
					["guid"] = "Player-1390-0C627C58",
					["class"] = "MONK",
					["cache_time"] = 1680290994,
					["realm"] = "Hyjal",
				},
				["Player-1309-0C533A85"] = {
					["name"] = "Spyreo-Pozzodell'Eternità",
					["guid"] = "Player-1309-0C533A85",
					["class"] = "EVOKER",
					["cache_time"] = 1687955030,
					["realm"] = "Pozzodell'Eternità",
				},
				["Player-1329-099223EB"] = {
					["name"] = "Battleangel-Ravencrest",
					["guid"] = "Player-1329-099223EB",
					["class"] = "HUNTER",
					["cache_time"] = 1680708830,
					["realm"] = "Ravencrest",
				},
				["Player-3391-0C495EEF"] = {
					["name"] = "Kraéz-Silvermoon",
					["guid"] = "Player-3391-0C495EEF",
					["class"] = "SHAMAN",
					["cache_time"] = 1690587500,
					["realm"] = "Silvermoon",
				},
				["Player-1379-054441E2"] = {
					["name"] = "Verx-Sanguino",
					["guid"] = "Player-1379-054441E2",
					["class"] = "PALADIN",
					["cache_time"] = 1689772053,
					["realm"] = "Sanguino",
				},
				["Player-1403-0A35DC5A"] = {
					["name"] = "Ethaelwolf-Draenor",
					["guid"] = "Player-1403-0A35DC5A",
					["class"] = "PALADIN",
					["cache_time"] = 1689768575,
					["realm"] = "Draenor",
				},
				["Player-3391-0C920B01"] = {
					["role"] = "DAMAGER",
					["name"] = "Augmentxd-Silvermoon",
					["guid"] = "Player-3391-0C920B01",
					["realm"] = "Silvermoon",
					["class"] = "EVOKER",
					["cache_time"] = 1690157734,
					["rank"] = "Unguilded",
				},
				["Player-1303-0592D932"] = {
					["name"] = "Biigdealer-Aggra(Português)",
					["guid"] = "Player-1303-0592D932",
					["class"] = "DRUID",
					["cache_time"] = 1690488753,
					["realm"] = "Aggra(Português)",
				},
				["Player-581-09D45C59"] = {
					["name"] = "Nellomotto-Blackrock",
					["guid"] = "Player-581-09D45C59",
					["class"] = "PALADIN",
					["cache_time"] = 1685340864,
					["realm"] = "Blackrock",
				},
				["Player-1096-0A649A69"] = {
					["name"] = "Leocadir-DefiasBrotherhood",
					["guid"] = "Player-1096-0A649A69",
					["class"] = "EVOKER",
					["cache_time"] = 1687040673,
					["realm"] = "DefiasBrotherhood",
				},
				["Player-1085-0A83983D"] = {
					["name"] = "Felmoe-SteamwheedleCartel",
					["guid"] = "Player-1085-0A83983D",
					["class"] = "DEMONHUNTER",
					["cache_time"] = 1676955279,
					["realm"] = "SteamwheedleCartel",
				},
				["Player-604-09E403AC"] = {
					["name"] = "Zence-Thrall",
					["guid"] = "Player-604-09E403AC",
					["class"] = "SHAMAN",
					["cache_time"] = 1687259258,
					["realm"] = "Thrall",
				},
				["Player-1403-0A62542B"] = {
					["name"] = "Brimstonee-Draenor",
					["guid"] = "Player-1403-0A62542B",
					["class"] = "PALADIN",
					["cache_time"] = 1689804288,
					["realm"] = "Draenor",
				},
				["Player-3682-097055B2"] = {
					["name"] = "Arîana-Ragnaros",
					["guid"] = "Player-3682-097055B2",
					["class"] = "MAGE",
					["cache_time"] = 1690410198,
					["realm"] = "Ragnaros",
				},
				["Player-1305-0C23D6E8"] = {
					["name"] = "Underlurd-Kazzak",
					["guid"] = "Player-1305-0C23D6E8",
					["class"] = "PALADIN",
					["cache_time"] = 1688878042,
					["realm"] = "Kazzak",
				},
				["Player-1923-0A39E2B2"] = {
					["name"] = "магерыч-Ясеневыйлес",
					["guid"] = "Player-1923-0A39E2B2",
					["class"] = "HUNTER",
					["cache_time"] = 1676385549,
					["realm"] = "Ясеневыйлес",
				},
				["Player-1390-0A559FDA"] = {
					["name"] = "Harrysky-Hyjal",
					["guid"] = "Player-1390-0A559FDA",
					["class"] = "WARRIOR",
					["cache_time"] = 1677112712,
					["realm"] = "Hyjal",
				},
				["Player-1379-0AE3990A"] = {
					["name"] = "Chrysa-Zul'jin",
					["guid"] = "Player-1379-0AE3990A",
					["class"] = "PRIEST",
					["cache_time"] = 1685291173,
					["realm"] = "Zul'jin",
				},
				["Player-1084-08B3BE10"] = {
					["name"] = "Keikóp-TarrenMill",
					["guid"] = "Player-1084-08B3BE10",
					["class"] = "PRIEST",
					["cache_time"] = 1685685471,
					["realm"] = "TarrenMill",
				},
				["Player-1390-0C8F3AFD"] = {
					["name"] = "Shèng-Hyjal",
					["guid"] = "Player-1390-0C8F3AFD",
					["class"] = "PRIEST",
					["cache_time"] = 1690044601,
					["realm"] = "Hyjal",
				},
				["Player-3692-070BFD22"] = {
					["name"] = "Asrisuri-Eredar",
					["guid"] = "Player-3692-070BFD22",
					["class"] = "WARRIOR",
					["cache_time"] = 1676486742,
					["realm"] = "Eredar",
				},
				["Player-1305-0C834EB9"] = {
					["name"] = "Chìva-Kazzak",
					["guid"] = "Player-1305-0C834EB9",
					["class"] = "DRUID",
					["cache_time"] = 1678143779,
					["realm"] = "Kazzak",
				},
				["Player-1597-0F5321CD"] = {
					["name"] = "Cubish-Sylvanas",
					["guid"] = "Player-1597-0F5321CD",
					["class"] = "EVOKER",
					["cache_time"] = 1686687418,
					["realm"] = "Sylvanas",
				},
				["Player-3690-0A630B34"] = {
					["name"] = "Tobiase-KhazModan",
					["guid"] = "Player-3690-0A630B34",
					["class"] = "WARRIOR",
					["cache_time"] = 1676988319,
					["realm"] = "KhazModan",
				},
				["Player-1403-0A76B39F"] = {
					["name"] = "Nímona-Draenor",
					["guid"] = "Player-1403-0A76B39F",
					["class"] = "PRIEST",
					["cache_time"] = 1690214800,
					["realm"] = "Draenor",
				},
				["Player-2073-09DE394F"] = {
					["name"] = "Kellton-Stormscale",
					["guid"] = "Player-2073-09DE394F",
					["class"] = "PALADIN",
					["cache_time"] = 1690210423,
					["realm"] = "Stormscale",
				},
				["Player-1305-0C3AA360"] = {
					["name"] = "Dictatör-Kazzak",
					["guid"] = "Player-1305-0C3AA360",
					["class"] = "PRIEST",
					["cache_time"] = 1690229185,
					["realm"] = "Kazzak",
				},
				["Player-1084-0A852B39"] = {
					["name"] = "Vxevo-TarrenMill",
					["guid"] = "Player-1084-0A852B39",
					["class"] = "EVOKER",
					["cache_time"] = 1690510985,
					["realm"] = "TarrenMill",
				},
				["Player-1305-0BE3D537"] = {
					["name"] = "Leadreà-Kazzak",
					["guid"] = "Player-1305-0BE3D537",
					["class"] = "PALADIN",
					["cache_time"] = 1688927498,
					["realm"] = "Kazzak",
				},
				["Player-581-0A6CE899"] = {
					["name"] = "Ramsirage-Blackrock",
					["guid"] = "Player-581-0A6CE899",
					["class"] = "PALADIN",
					["cache_time"] = 1689024415,
					["realm"] = "Blackrock",
				},
			},
		},
		["oldVersion"] = "3.9.0",
		["regionID"] = 3,
		["locale"] = "enUS",
		["version"] = "3.9.1",
	},
	["profileKeys"] = {
		["Qpaladin - Ragnaros"] = "Default",
		["Qpcheese - Chamber of Aspects"] = "Default",
		["Qpebank - Draenor"] = "Default",
		["Qpc - Draenor"] = "Default",
		["Zelení - Draenor"] = "Default",
		["Flurrq - Ragnaros"] = "Default",
		["Djagon - Ragnaros"] = "Default",
		["Qubit - Ragnaros"] = "Default",
		["Myfficraider - Ragnaros"] = "Default",
		["Dogson - Ragnaros"] = "Default",
		["Laurs - Ragnaros"] = "Default",
		["Qpe - Ravencrest"] = "Default",
		["Qpcheese - Ragnaros"] = "Default",
		["Jerwin - Ragnaros"] = "Default",
		["Qpfromage - Ragnaros"] = "Default",
		["Qpew - Ragnaros"] = "Default",
		["Cyclosarin - Ragnaros"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["modules"] = {
				["RCLootFrame"] = {
					["alwaysShowTooltip"] = true,
				},
				["RCVotingFrame"] = {
					["moreInfo"] = true,
				},
			},
			["UI"] = {
				["tradeui"] = {
					["bgColor"] = {
						0.55, -- [1]
						0.84, -- [2]
						1, -- [3]
					},
					["borderColor"] = {
						0.62, -- [1]
						0.86, -- [2]
						0.87, -- [3]
						0.85, -- [4]
					},
					["background"] = "Blizzard Garrison Background 3",
					["border"] = "Blizzard Dialog",
				},
				["lootframe"] = {
					["bgColor"] = {
						0.55, -- [1]
						0.84, -- [2]
						1, -- [3]
					},
					["borderColor"] = {
						0.62, -- [1]
						0.86, -- [2]
						0.87, -- [3]
						0.85, -- [4]
					},
					["background"] = "Blizzard Garrison Background 3",
					["border"] = "Blizzard Dialog",
				},
				["default"] = {
					["bgColor"] = {
						0.55, -- [1]
						0.84, -- [2]
						1, -- [3]
					},
					["borderColor"] = {
						0.62, -- [1]
						0.86, -- [2]
						0.87, -- [3]
						0.85, -- [4]
					},
					["background"] = "Blizzard Garrison Background 3",
					["border"] = "Blizzard Dialog",
				},
				["DefaultRCLootFrame"] = {
					["y"] = -16.00031823245809,
					["x"] = 336.9998516646265,
					["point"] = "LEFT",
					["borderColor"] = {
						0.62, -- [1]
						0.86, -- [2]
						0.87, -- [3]
						0.85, -- [4]
					},
					["scale"] = 1.100000023841858,
					["background"] = "Blizzard Garrison Background 3",
					["border"] = "Blizzard Dialog",
					["bgColor"] = {
						0.55, -- [1]
						0.84, -- [2]
						1, -- [3]
					},
				},
				["DefaultRCLootCouncilFrame"] = {
					["y"] = 75.0024272702467,
					["x"] = -201.100512060264,
					["point"] = "RIGHT",
					["borderColor"] = {
						0.62, -- [1]
						0.86, -- [2]
						0.87, -- [3]
						0.85, -- [4]
					},
					["scale"] = 1.100000023841858,
					["background"] = "Blizzard Garrison Background 3",
					["border"] = "Blizzard Dialog",
					["bgColor"] = {
						0.55, -- [1]
						0.84, -- [2]
						1, -- [3]
					},
				},
				["DefaultRCLootHistoryFrame"] = {
					["y"] = -1.999966213920743,
					["x"] = -0.9999181790772127,
					["borderColor"] = {
						0.62, -- [1]
						0.86, -- [2]
						0.87, -- [3]
						0.85, -- [4]
					},
					["scale"] = 1.100000023841858,
					["background"] = "Blizzard Garrison Background 3",
					["border"] = "Blizzard Dialog",
					["bgColor"] = {
						0.55, -- [1]
						0.84, -- [2]
						1, -- [3]
					},
				},
			},
		},
	},
}
RCLootCouncilLootDB = {
	["profileKeys"] = {
		["Qpaladin - Ragnaros"] = "Qpaladin - Ragnaros",
		["Qpcheese - Chamber of Aspects"] = "Qpcheese - Chamber of Aspects",
		["Qpebank - Draenor"] = "Qpebank - Draenor",
		["Qpc - Draenor"] = "Qpc - Draenor",
		["Zelení - Draenor"] = "Zelení - Draenor",
		["Flurrq - Ragnaros"] = "Flurrq - Ragnaros",
		["Djagon - Ragnaros"] = "Djagon - Ragnaros",
		["Qubit - Ragnaros"] = "Qubit - Ragnaros",
		["Myfficraider - Ragnaros"] = "Myfficraider - Ragnaros",
		["Dogson - Ragnaros"] = "Dogson - Ragnaros",
		["Laurs - Ragnaros"] = "Laurs - Ragnaros",
		["Qpe - Ravencrest"] = "Qpe - Ravencrest",
		["Qpcheese - Ragnaros"] = "Qpcheese - Ragnaros",
		["Jerwin - Ragnaros"] = "Jerwin - Ragnaros",
		["Qpfromage - Ragnaros"] = "Qpfromage - Ragnaros",
		["Qpew - Ragnaros"] = "Qpew - Ragnaros",
		["Cyclosarin - Ragnaros"] = "Cyclosarin - Ragnaros",
	},
	["factionrealm"] = {
		["Horde - Ragnaros"] = {
			["Grendizer-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["class"] = "PALADIN",
					["iSubClass"] = 4,
					["groupSize"] = 20,
					["boss"] = "The Amalgamation Chamber",
					["time"] = "23:14:33",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:134517::::::::70:66::35:7:9382:6652:9223:9218:9144:3326:8767::::::|h[Tremorguard Pauldrons]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Disenchant",
					["typeCode"] = "default",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202595::::::::70:66::6:7:9410:9380:6652:9224:9218:1498:8767::::::|h[Shoulderplates of Planar Isolation]|h|r",
					["id"] = "1686842073-6",
					["date"] = "15/06/23",
					["responseID"] = 1,
					["votes"] = 0,
					["isAwardReason"] = true,
				}, -- [1]
				{
					["mapID"] = 2569,
					["date"] = "22/06/23",
					["class"] = "PALADIN",
					["iSubClass"] = 4,
					["groupSize"] = 20,
					["votes"] = 0,
					["time"] = "22:41:52",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202451:6496:::::::70:66::5:6:6652:9228:9409:9334:1498:8767:1:28:2615:::::|h[Heartfire Sentinel's Faulds]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["response"] = "Mainspec/Need",
					["boss"] = "Assault of the Zaqali",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202597::::::::70:66::6:7:9410:9380:6652:9224:9221:1498:8767::::::|h[Obsidian Guard's Chausses]|h|r",
					["note"] = "447 UPGRADE",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["id"] = "1687444912-7",
					["typeCode"] = "default",
				}, -- [2]
				{
					["mapID"] = 2569,
					["date"] = "23/06/23",
					["class"] = "PALADIN",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["votes"] = 1,
					["time"] = "00:21:57",
					["iClass"] = 15,
					["itemReplaced1"] = "|cffa335ee|Hitem:202453::::::::70:66::5:6:6652:9230:9409:9334:1492:8767:1:28:1040:::::|h[Heartfire Sentinel's Protectors]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["response"] = "Mainspec/Need",
					["boss"] = "The Forgotten Experiments",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202626::::::::70:66::6:4:9230:9410:1498:8767::::::|h[Venerated Mixing Fluid]|h|r",
					["note"] = "ilvl upgrade",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["id"] = "1687450917-15",
					["typeCode"] = "default",
				}, -- [3]
				{
					["mapID"] = 2569,
					["color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["class"] = "PALADIN",
					["iSubClass"] = 2,
					["groupSize"] = 20,
					["boss"] = "Kazzara, the Hellforged",
					["time"] = "22:15:49",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:193657:6580:192961::::::70:66::33:8:6652:9413:9223:9220:9144:9334:1663:8767:1:28:1279:::::|h[Binders of the Moldering]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Disenchant",
					["isAwardReason"] = true,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202594::::::::70:66::6:8:9410:9380:6652:9415:9224:9220:1498:8767::::::|h[Bloodstench Skinguards]|h|r",
					["votes"] = 0,
					["date"] = "29/06/23",
					["responseID"] = 1,
					["id"] = "1688048149-1",
					["typeCode"] = "default",
				}, -- [4]
				{
					["mapID"] = 2569,
					["color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["class"] = "PALADIN",
					["iSubClass"] = 4,
					["groupSize"] = 20,
					["boss"] = "Kazzara, the Hellforged",
					["time"] = "22:17:06",
					["iClass"] = 9,
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Disenchant",
					["isAwardReason"] = true,
					["difficultyID"] = 16,
					["lootWon"] = "|cff0070dd|Hitem:205145::::::::70:66::6:::::::|h[Plans: Shadowed Impact Buckler]|h|r",
					["votes"] = 0,
					["date"] = "29/06/23",
					["responseID"] = 1,
					["id"] = "1688048226-2",
					["typeCode"] = "default",
				}, -- [5]
				{
					["mapID"] = 2569,
					["date"] = "13/07/23",
					["class"] = "PALADIN",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "22:55:29",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202617::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Elementium Pocket Anvil]|h|r",
					["typeCode"] = "default",
					["owner"] = "Grendizer-Ragnaros",
					["votes"] = 0,
					["response"] = "Disenchant",
					["id"] = "1689260129-5",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202613::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Zaqali Chaos Grapnel]|h|r",
					["isAwardReason"] = true,
					["color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["responseID"] = 1,
					["itemReplaced2"] = "|cffa335ee|Hitem:203963::::::::70:66::3:5:6652:7979:9329:1485:8767:1:28:2645:::::|h[Beacon to the Beyond]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
				}, -- [6]
			},
			["Cödhead-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "HUNTER",
					["iSubClass"] = 2,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "22:30:59",
					["iClass"] = 2,
					["itemReplaced1"] = "|cffa335ee|Hitem:193449:6528:::::::70:66::13:7:8836:8840:8902:9405:9376:8790:9366:8:28:2164:29:32:30:40:38:8:40:337:45:204697:46:192552:49:204440:::::|h[Bow of the Dragon Hunters |A:Professions-ChatIcon-Quality-Tier5:17:17::1|a]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202607::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Brutal Dragonslayer's Trophy]|h|r",
					["votes"] = 0,
					["date"] = "29/06/23",
					["responseID"] = 1,
					["id"] = "1688049059-5",
					["typeCode"] = "default",
				}, -- [1]
				{
					["mapID"] = 2569,
					["date"] = "29/06/23",
					["class"] = "HUNTER",
					["iSubClass"] = 3,
					["groupSize"] = 20,
					["votes"] = 1,
					["time"] = "22:32:07",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:193428:6586:::::::70:66::13:10:8836:8840:8902:9405:9373:8797:8960:8790:9366:9414:10:28:2164:29:40:30:32:38:8:40:351:45:204682:46:193555:47:192552:50:204440:52:206041:::::|h[Flame-Touched Cuffs |A:Professions-ChatIcon-Quality-Tier5:17:17::1|a]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["response"] = "Mainspec/Need",
					["boss"] = "Assault of the Zaqali",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202604::::::::70:66::6:8:9410:9380:42:9413:9224:9220:1498:8767::::::|h[Boulder-Tossing Bands]|h|r",
					["note"] = "massive masssive massive.",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["id"] = "1688049127-7",
					["typeCode"] = "default",
				}, -- [2]
			},
			["Barryscotty-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "MONK",
					["iSubClass"] = 2,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "22:42:41",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:204391:6613:::::::70:66::5:7:6652:9226:9219:9409:9334:1492:8767::::::|h[Failed Applicant's Footpads]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Offspec/Greed",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202574::::::::70:66::6:7:9410:9380:6652:9224:9219:1498:8767::::::|h[Flamebound Huntsman's Footpads]|h|r",
					["votes"] = 1,
					["date"] = "15/06/23",
					["responseID"] = 2,
					["id"] = "1686840161-3",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Pad-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "15/06/23",
					["class"] = "PALADIN",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "22:42:05",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202617::::::::70:66::5:5:9409:6652:9334:1498:8767::::::|h[Elementium Pocket Anvil]|h|r",
					["votes"] = 1,
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["id"] = "1686840125-1",
					["response"] = "Minor Upgrade",
					["note"] = "can use for m+ if no one needs",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202613::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Zaqali Chaos Grapnel]|h|r",
					["color"] = {
						0, -- [1]
						0.7, -- [2]
						0.7, -- [3]
						1, -- [4]
					},
					["isAwardReason"] = false,
					["responseID"] = 3,
					["itemReplaced2"] = "|cffa335ee|Hitem:203963::::::::70:66::3:5:6652:7979:9329:1485:8767:1:28:2645:::::|h[Beacon to the Beyond]|h|r",
					["typeCode"] = "default",
				}, -- [1]
				{
					["mapID"] = 2569,
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "PALADIN",
					["iSubClass"] = 4,
					["groupSize"] = 20,
					["boss"] = "The Amalgamation Chamber",
					["time"] = "23:14:29",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202450::::::::70:66::5:6:6652:9227:9409:9334:1498:8767:1:28:2615:::::|h[Heartfire Sentinel's Steelwings]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Offspec/Greed",
					["typeCode"] = "default",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202595::::::::70:66::6:7:9410:9380:6652:9224:9218:1498:8767::::::|h[Shoulderplates of Planar Isolation]|h|r",
					["id"] = "1686842069-5",
					["date"] = "15/06/23",
					["responseID"] = 2,
					["votes"] = 1,
					["isAwardReason"] = false,
				}, -- [2]
				{
					["mapID"] = 2569,
					["date"] = "22/06/23",
					["class"] = "PALADIN",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "Kazzara, the Hellforged",
					["time"] = "22:20:31",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202617::::::::70:66::5:5:9409:6652:9334:1498:8767::::::|h[Elementium Pocket Anvil]|h|r",
					["typeCode"] = "default",
					["owner"] = "Grendizer-Ragnaros",
					["votes"] = 0,
					["response"] = "Offspec/Greed",
					["id"] = "1687443631-0",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202616::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Enduring Dreadplate]|h|r",
					["isAwardReason"] = false,
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["responseID"] = 2,
					["itemReplaced2"] = "|cffa335ee|Hitem:203963::::::::70:66::3:5:6652:7979:9329:1485:8767:1:28:2645:::::|h[Beacon to the Beyond]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
				}, -- [3]
				{
					["mapID"] = 2569,
					["date"] = "04/07/23",
					["class"] = "PALADIN",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "The Amalgamation Chamber",
					["time"] = "01:00:40",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202617::::::::70:66::5:5:9409:6652:9334:1498:8767::::::|h[Elementium Pocket Anvil]|h|r",
					["typeCode"] = "default",
					["owner"] = "Grendizer-Ragnaros",
					["votes"] = 2,
					["response"] = "Mainspec/Need",
					["id"] = "1688403640-0",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202617::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Elementium Pocket Anvil]|h|r",
					["isAwardReason"] = false,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["responseID"] = 1,
					["itemReplaced2"] = "|cffa335ee|Hitem:203963::::::::70:66::5:5:6652:9409:9334:1489:8767::::::|h[Beacon to the Beyond]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
				}, -- [4]
			},
			["Mylkme-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "PRIEST",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "20:55:07",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:155891::::::::70:264::33:7:9321:6652:9223:9218:9144:3285:8767:1:28:1279:::::|h[Greasy Bacon-Grabbers]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Heroic",
					["owner"] = "Maccasham-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 15,
					["lootWon"] = "|cffa335ee|Hitem:202578::::::::70:264::5:7:9409:9330:6652:9226:9218:1485:8767::::::|h[Phoenix-Plume Gloves]|h|r",
					["votes"] = 0,
					["date"] = "11/05/23",
					["responseID"] = 1,
					["id"] = "1683834907-1",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Ryleei-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "WARRIOR",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "The Forgotten Experiments",
					["time"] = "20:37:07",
					["iClass"] = 15,
					["itemReplaced1"] = "|cffa335ee|Hitem:200425::::::::70:264::35:5:6652:7977:8974:8829:1495::::::|h[Gauntlets of the Walking Mountain]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Heroic",
					["owner"] = "Maccasham-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 15,
					["lootWon"] = "|cffa335ee|Hitem:202638::::::::70:264::5:4:9230:9409:1485:8767::::::|h[Zenith Mixing Fluid]|h|r",
					["votes"] = 0,
					["date"] = "11/05/23",
					["responseID"] = 1,
					["id"] = "1683833827-2",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Kijul-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "PRIEST",
					["iSubClass"] = 1,
					["groupSize"] = 11,
					["boss"] = "Rashok, the Elder",
					["time"] = "21:33:37",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:109784:6607:::::::70:264::33:8:7977:6652:8822:8818:9144:8971:3293:8767:1:28:1279:::::|h[Sandals of Arcane Mystery]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Heroic",
					["owner"] = "Maccasham-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 15,
					["lootWon"] = "|cffa335ee|Hitem:202603::::::::70:264::5:7:6652:9226:9219:9409:9331:1485:8767::::::|h[Sandals of Ancient Fury]|h|r",
					["votes"] = 0,
					["date"] = "11/05/23",
					["responseID"] = 1,
					["id"] = "1683837217-6",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Grats-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "15/06/23",
					["class"] = "WARLOCK",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "The Amalgamation Chamber",
					["time"] = "23:15:29",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:206184:6562:::::::70:66::35:6:9382:6652:9415:9144:1669:8767::::::|h[Skyshard Ring]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["typeCode"] = "default",
					["owner"] = "Grendizer-Ragnaros",
					["id"] = "1686842129-8",
					["response"] = "Mainspec/Need",
					["note"] = "i have a 421 ring i guess",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202572::::::::70:66::6:6:9410:9380:6652:9415:1498:8767::::::|h[Entropic Convergence Loop]|h|r",
					["isAwardReason"] = false,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["responseID"] = 1,
					["itemReplaced2"] = "|cffa335ee|Hitem:192999:6562:192967::::::70:66::13:8:8836:8840:8902:8780:9405:8846:8174:9365:8:28:2164:29:36:30:49:38:8:40:258:49:198046:50:200652:51:190453:::::|h[Signet of Titanic Insight |A:Professions-ChatIcon-Quality-Tier5:17:17::1|a]|h|r",
					["votes"] = 3,
				}, -- [1]
				{
					["mapID"] = 2569,
					["date"] = "22/06/23",
					["class"] = "WARLOCK",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "Kazzara, the Hellforged",
					["time"] = "22:22:05",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:193769::::::::70:66::16:5:6652:9144:9329:1659:8767:1:28:1279:::::|h[Erupting Spear Fragment]|h|r",
					["typeCode"] = "default",
					["owner"] = "Grendizer-Ragnaros",
					["votes"] = 1,
					["response"] = "Mainspec/Need",
					["id"] = "1687443725-3",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202612::::::::70:66::6:5:6652:9410:9382:1498:8767::::::|h[Screaming Black Dragonscale]|h|r",
					["isAwardReason"] = false,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["responseID"] = 1,
					["itemReplaced2"] = "|cffa335ee|Hitem:203996::::::::70:66::5:5:6652:9409:9334:1492:8767::::::|h[Igneous Flowstone]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
				}, -- [2]
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "WARLOCK",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "The Forgotten Experiments",
					["time"] = "00:47:06",
					["iClass"] = 15,
					["itemReplaced1"] = "|cffa335ee|Hitem:134420::::::::70:66::33:7:6652:9223:9218:9144:9329:3316:8767:1:28:1279:::::|h[Gloves of the Mountain Conquest]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202624::::::::70:66::6:4:9230:9410:1498:8767::::::|h[Dreadful Mixing Fluid]|h|r",
					["votes"] = 1,
					["date"] = "07/07/23",
					["responseID"] = 1,
					["id"] = "1688662026-4",
					["typeCode"] = "default",
				}, -- [3]
			},
			["Qpfromage-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "MAGE",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "20:54:49",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:200320::::::::70:264::5:5:7980:6652:8826:1485:8767::::::|h[Crystal Scholar's Beacons]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Heroic",
					["owner"] = "Maccasham-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 15,
					["lootWon"] = "|cffa335ee|Hitem:202580::::::::70:264::5:7:9409:9330:6652:9226:9218:1485:8767::::::|h[Mystic's Scalding Frame]|h|r",
					["votes"] = 0,
					["date"] = "11/05/23",
					["responseID"] = 1,
					["id"] = "1683834889-0",
					["typeCode"] = "default",
				}, -- [1]
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "MAGE",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "22:42:34",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202552::::::::70:66::5:6:6652:9230:9409:9334:1492:8767::::::|h[Underlight Conjurer's Gloves]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202578::::::::70:66::6:7:9410:9380:6652:9224:9218:1498:8767::::::|h[Phoenix-Plume Gloves]|h|r",
					["votes"] = 1,
					["date"] = "15/06/23",
					["responseID"] = 1,
					["id"] = "1686840154-2",
					["typeCode"] = "default",
				}, -- [2]
				{
					["mapID"] = 2569,
					["date"] = "22/06/23",
					["class"] = "MAGE",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["votes"] = 1,
					["time"] = "23:05:53",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202551::::::::70:66::5:7:6652:9414:9229:9409:9334:1498:8767:1:28:1040:::::|h[Underlight Conjurer's Arcanocowl]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["response"] = "Mainspec/Need",
					["boss"] = "The Amalgamation Chamber",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202579::::::::70:66::6:8:9410:9380:6652:9415:9224:9221:1498:8767::::::|h[Attendant's Concocting Cover]|h|r",
					["note"] = "Catalyst upgrade .5 ",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["id"] = "1687446353-9",
					["typeCode"] = "default",
				}, -- [3]
			},
			["Whískyy-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "11/05/23",
					["class"] = "DEMONHUNTER",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "20:58:02",
					["iClass"] = 2,
					["itemReplaced1"] = "|cffa335ee|Hitem:190508:6643:::::::70:264::13:7:8836:8840:8902:9405:8846:8791:9365:8:28:2164:29:32:30:40:38:8:40:193:44:198046:45:194578:49:190453:::::|h[Primal Molten Warglaive |A:Professions-ChatIcon-Quality-Tier5:17:17::1|a]|h|r",
					["typeCode"] = "default",
					["owner"] = "Maccasham-Ragnaros",
					["votes"] = 0,
					["response"] = "Offspec/Greed",
					["id"] = "1683835082-3",
					["difficultyID"] = 15,
					["lootWon"] = "|cffa335ee|Hitem:204279::::::::70:264::5:5:9409:9330:6652:1485:8767::::::|h[Wallclimber's Incursion Hatchet]|h|r",
					["isAwardReason"] = false,
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["responseID"] = 2,
					["itemReplaced2"] = "|cffa335ee|Hitem:190518:6643:::::::70:264::13:8:8836:8840:8902:9405:8846:8791:8174:9365:9:28:2164:29:36:30:32:38:8:40:182:45:198046:46:194578:47:200652:50:190453:::::|h[Obsidian Seared Slicer |A:Professions-ChatIcon-Quality-Tier5:17:17::1|a]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Heroic",
				}, -- [1]
			},
			["Nèlliel-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						0.7, -- [2]
						0.7, -- [3]
						1, -- [4]
					},
					["class"] = "HUNTER",
					["iSubClass"] = 2,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "22:41:13",
					["iClass"] = 2,
					["itemReplaced1"] = "|cffa335ee|Hitem:133251:6528:::::::70:66::35:5:9382:6652:9147:9466:8767::::::|h[Thundercall]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Minor Upgrade",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202607::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Brutal Dragonslayer's Trophy]|h|r",
					["votes"] = 0,
					["date"] = "22/06/23",
					["responseID"] = 3,
					["id"] = "1687444873-5",
					["typeCode"] = "default",
				}, -- [1]
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "HUNTER",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["boss"] = "Kazzara, the Hellforged",
					["time"] = "22:17:17",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:133362:6592:::::::70:66::16:7:6652:9223:9220:9144:9334:9458:8767:1:28:1279:::::|h[Billowing Skydrape]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202573::::::::70:66::6:7:9410:9380:6652:9224:9220:1498:8767::::::|h[Etchings of the Captive Revenant]|h|r",
					["votes"] = 1,
					["date"] = "29/06/23",
					["responseID"] = 1,
					["id"] = "1688048237-3",
					["typeCode"] = "default",
				}, -- [2]
			},
			["Vallgar-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						0.7, -- [2]
						0.7, -- [3]
						1, -- [4]
					},
					["class"] = "HUNTER",
					["iSubClass"] = 3,
					["groupSize"] = 20,
					["boss"] = "The Amalgamation Chamber",
					["time"] = "23:15:25",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:204421::::::::70:66::6:8:9410:9380:6652:9415:9224:9219:1498:8767:1:28:2647:::::|h[Faulds of Failed Experiments]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Minor Upgrade",
					["typeCode"] = "default",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202605::::::::70:66::6:8:9410:9380:6652:9413:9224:9219:1498:8767::::::|h[Gloomfused Chemistry Belt]|h|r",
					["id"] = "1686842125-7",
					["date"] = "15/06/23",
					["responseID"] = 3,
					["votes"] = 2,
					["isAwardReason"] = false,
				}, -- [1]
			},
			["Fiò-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "22/06/23",
					["class"] = "DEMONHUNTER",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["votes"] = 0,
					["time"] = "22:21:00",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:133247:6598:::::::70:66::16:7:9223:9220:9144:6652:9329:3329:8767:1:28:1279:::::|h[Shadow of Perfect Bliss]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["response"] = "Mainspec/Need",
					["boss"] = "Kazzara, the Hellforged",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202573::::::::70:66::6:7:9410:9380:6652:9224:9220:1498:8767::::::|h[Etchings of the Captive Revenant]|h|r",
					["note"] = "2nd bis",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["id"] = "1687443660-1",
					["typeCode"] = "default",
				}, -- [1]
				{
					["mapID"] = 2569,
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "DEMONHUNTER",
					["iSubClass"] = 2,
					["groupSize"] = 20,
					["boss"] = "The Forgotten Experiments",
					["time"] = "00:19:30",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202522::::::::70:66::35:5:6652:9227:9381:1501:8767::::::|h[Kinslayer's Tainted Spaulders]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Offspec/Greed",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202575::::::::70:66::6:7:6652:9224:9218:9410:9381:1498:8767::::::|h[Neldris's Sinewy Scapula]|h|r",
					["votes"] = 0,
					["date"] = "23/06/23",
					["responseID"] = 2,
					["id"] = "1687450770-12",
					["typeCode"] = "default",
				}, -- [2]
			},
			["Helpdotcom-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "SHAMAN",
					["iSubClass"] = 3,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "22:32:10",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:193812:6574:192961::::::70:66::33:8:6652:9413:9223:9220:9144:9329:1659:8767:1:28:1279:::::|h[Fierce Boreal Armguards]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202604::::::::70:66::6:8:9410:9380:6652:9413:9224:9220:1498:8767::::::|h[Boulder-Tossing Bands]|h|r",
					["votes"] = 1,
					["date"] = "29/06/23",
					["responseID"] = 1,
					["id"] = "1688049130-8",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Muhrtele-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "22/06/23",
					["class"] = "PALADIN",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "22:41:33",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202613::::::::70:66::5:5:9409:6652:9333:1494:8767::::::|h[Zaqali Chaos Grapnel]|h|r",
					["typeCode"] = "default",
					["owner"] = "Grendizer-Ragnaros",
					["votes"] = 0,
					["response"] = "Mainspec/Need",
					["id"] = "1687444893-6",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202613::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Zaqali Chaos Grapnel]|h|r",
					["isAwardReason"] = false,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["responseID"] = 1,
					["itemReplaced2"] = "|cffa335ee|Hitem:204736::::::::70:66::42:4:6652:9309:1533:8767:1:28:2641:::::|h[Heatbound Medallion]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
				}, -- [1]
			},
			["çakey-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "15/06/23",
					["class"] = "EVOKER",
					["iSubClass"] = 3,
					["groupSize"] = 20,
					["votes"] = 0,
					["time"] = "22:43:18",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202488::::::::70:66::5:7:6652:9414:9229:9409:9334:1498:8767:1:28:2615:::::|h[Crown of Obsidian Secrets]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["response"] = "Offspec/Greed",
					["boss"] = "Assault of the Zaqali",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202591::::::::70:66::6:8:9410:9380:6652:9414:9224:9221:1498:8767::::::|h[Gatecrasher Giant's Coif]|h|r",
					["note"] = "Would take for when i can upgto 447",
					["isAwardReason"] = false,
					["responseID"] = 2,
					["id"] = "1686840198-4",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Sliyrak-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "11/05/23",
					["class"] = "EVOKER",
					["iSubClass"] = 4,
					["groupSize"] = 11,
					["boss"] = "Rashok, the Elder",
					["time"] = "21:33:16",
					["iClass"] = 2,
					["itemReplaced1"] = "|cffa335ee|Hitem:202555:6643:::::::70:264::3:5:42:7979:9324:1475:8767::::::|h[Zskarn's Autopsy Scalpel]|h|r",
					["typeCode"] = "default",
					["owner"] = "Maccasham-Ragnaros",
					["votes"] = 0,
					["response"] = "Offspec/Greed",
					["id"] = "1683837196-5",
					["difficultyID"] = 15,
					["lootWon"] = "|cffa335ee|Hitem:204319::::::::70:264::5:5:6652:9409:9331:1485:8767::::::|h[Bloodfire Extraction Conduit]|h|r",
					["isAwardReason"] = false,
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["responseID"] = 2,
					["itemReplaced2"] = "|cffa335ee|Hitem:195484::::::::70:264::6:4:6652:7981:1498:8767::::::|h[Icewrath's Channeling Conduit]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Heroic",
				}, -- [1]
			},
			["Shaamoo-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "DRUID",
					["iSubClass"] = 2,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "20:56:50",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:200351:6625:::::::70:264::35:6:6652:8830:8973:7977:1492:8767::::::|h[Lost Landcaller's Robes]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Heroic",
					["owner"] = "Maccasham-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 15,
					["lootWon"] = "|cffa335ee|Hitem:202586::::::::70:264::5:7:9409:9330:6652:9226:9221:1485:8767::::::|h[Warlord's Volcanic Vest]|h|r",
					["votes"] = 0,
					["date"] = "11/05/23",
					["responseID"] = 1,
					["id"] = "1683835010-2",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Maccasham-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "SHAMAN",
					["iSubClass"] = 6,
					["groupSize"] = 20,
					["boss"] = "The Forgotten Experiments",
					["time"] = "20:29:33",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:201999::::::::70:264::35:5:9130:6652:9144:1643:8767::::::|h[Skovald's Resolve]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Heroic",
					["owner"] = "Maccasham-Ragnaros",
					["response"] = "Offspec/Greed",
					["isAwardReason"] = false,
					["difficultyID"] = 15,
					["lootWon"] = "|cffa335ee|Hitem:202571::::::::70:264::5:5:6652:9409:9331:1485:8767::::::|h[Experiment 1, Kitewing]|h|r",
					["votes"] = 0,
					["date"] = "11/05/23",
					["responseID"] = 2,
					["id"] = "1683833373-0",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Wituwu-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "PRIEST",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "The Forgotten Experiments",
					["time"] = "00:22:17",
					["iClass"] = 15,
					["itemReplaced1"] = "|cffa335ee|Hitem:202543::::::::70:66::3:6:6652:9230:7979:9329:1488:8767:1:28:1040:::::|h[Grasp of the Furnace Seraph]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Mainspec/Need",
					["typeCode"] = "default",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202626::::::::70:66::6:4:9230:9410:1498:8767::::::|h[Venerated Mixing Fluid]|h|r",
					["id"] = "1686846137-9",
					["date"] = "16/06/23",
					["responseID"] = 1,
					["votes"] = 1,
					["isAwardReason"] = false,
				}, -- [1]
				{
					["mapID"] = 2569,
					["date"] = "29/06/23",
					["class"] = "PRIEST",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["votes"] = 1,
					["time"] = "22:15:36",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202545:6619:::::::70:66::5:6:6652:9231:9409:9334:1492:8767:1:28:2615:::::|h[Command of the Furnace Seraph]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["response"] = "Mainspec/Need",
					["boss"] = "Kazzara, the Hellforged",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202600::::::::70:66::6:7:9410:9380:6652:9224:9221:1498:8767::::::|h[Reanimator's Wicked Cassock]|h|r",
					["note"] = "for mythic path",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["id"] = "1688048136-0",
					["typeCode"] = "default",
				}, -- [2]
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "PRIEST",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["boss"] = "The Amalgamation Chamber",
					["time"] = "23:19:16",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202542::192922::::::70:66::5:7:6652:9229:9409:9334:1498:8767:9413:1:28:1040:::::|h[Mask of the Furnace Seraph]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Mainspec/Need",
					["typeCode"] = "default",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202579::::::::70:66::6:8:9410:9380:6652:9415:9224:9221:1498:8767::::::|h[Attendant's Concocting Cover]|h|r",
					["id"] = "1688656756-0",
					["date"] = "06/07/23",
					["responseID"] = 1,
					["votes"] = 2,
					["isAwardReason"] = false,
				}, -- [3]
			},
			["Skaterble-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0.7, -- [1]
						0.7, -- [2]
						0.7, -- [3]
						1, -- [4]
					},
					["class"] = "MONK",
					["iSubClass"] = 2,
					["groupSize"] = 20,
					["boss"] = "Unknown",
					["time"] = "22:37:11",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202506::::::::70:66::5:7:6652:9409:9415:9334:8094:9229:1498::::::|h[Cover of the Vermillion Forge]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Pass",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202602::::::::70:66::6:8:9410:9380:6652:9415:9224:9221:1498:8767::::::|h[Violent Gravemask]|h|r",
					["votes"] = 0,
					["date"] = "13/07/23",
					["responseID"] = "PASS",
					["id"] = "1689259031-0",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Slowone-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "11/05/23",
					["class"] = "DEATHKNIGHT",
					["iSubClass"] = 0,
					["groupSize"] = 14,
					["votes"] = 0,
					["time"] = "21:30:55",
					["iClass"] = 15,
					["itemReplaced1"] = "|cffa335ee|Hitem:200409:6490:::::::70:264::6:5:7981:6652:8827:1498:8767:1:28:1040:::::|h[Greaves of the Haunted Frostbrood]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Heroic",
					["owner"] = "Maccasham-Ragnaros",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["response"] = "Mainspec/Need",
					["boss"] = "Rashok, the Elder",
					["difficultyID"] = 15,
					["lootWon"] = "|cffa335ee|Hitem:202634::::::::70:264::5:4:9409:9228:1485:8767::::::|h[Dreadful Cooling Fluid]|h|r",
					["note"] = "2/4",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["id"] = "1683837055-4",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Asset-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "22/06/23",
					["class"] = "DEATHKNIGHT",
					["iSubClass"] = 4,
					["groupSize"] = 20,
					["votes"] = 0,
					["time"] = "23:05:27",
					["iClass"] = 2,
					["itemReplaced1"] = "|cffa335ee|Hitem:133371:3368:::::::70:66::16:5:6652:9147:9334:9458:8767:1:28:1279:::::|h[Thundercleaver Axe]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["response"] = "Mainspec/Need",
					["boss"] = "The Amalgamation Chamber",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202568::::::::70:66::6:5:9410:9380:42:1498:8767::::::|h[Scholar's Thinking Cudgel]|h|r",
					["note"] = "for frost",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["id"] = "1687446327-8",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Papee-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "29/06/23",
					["class"] = "WARLOCK",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["votes"] = 1,
					["time"] = "22:31:39",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202534::::::::70:66::5:6:6652:9230:9409:9334:1492:8767:1:28:1040:::::|h[Grips of the Sinister Savant]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["response"] = "Mainspec/Need",
					["boss"] = "Assault of the Zaqali",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202578::::::::70:66::6:7:9410:9380:6652:9224:9218:1498:8767::::::|h[Phoenix-Plume Gloves]|h|r",
					["note"] = "Main spec for 447 catalyst",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["id"] = "1688049099-6",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Dangerss-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "WARLOCK",
					["iSubClass"] = 4,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "22:41:53",
					["iClass"] = 9,
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:194490::::::::70:66::6:::::::|h[Plans: Allied Wristguard of Companionship]|h|r",
					["votes"] = 0,
					["date"] = "15/06/23",
					["responseID"] = 1,
					["id"] = "1686840113-0",
					["typeCode"] = "default",
				}, -- [1]
			},
			["Mordekaisar-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "13/07/23",
					["class"] = "WARRIOR",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "Unknown",
					["time"] = "22:37:29",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:207566::::::::70:66::23:5:7977:6652:9334:1492:8767:1:28:2731:::::|h[Accelerating Sandglass]|h|r",
					["votes"] = 0,
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["id"] = "1689259049-1",
					["response"] = "Minor Upgrade",
					["note"] = "OS",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202616::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Enduring Dreadplate]|h|r",
					["color"] = {
						0, -- [1]
						0.7, -- [2]
						0.7, -- [3]
						1, -- [4]
					},
					["isAwardReason"] = false,
					["responseID"] = 3,
					["itemReplaced2"] = "|cffa335ee|Hitem:203729::::::::70:66::5:5:9409:6652:9334:1495:8767::::::|h[Ominous Chromatic Essence]|h|r",
					["typeCode"] = "default",
				}, -- [1]
				{
					["mapID"] = 2569,
					["color"] = {
						0.7, -- [1]
						0.7, -- [2]
						0.7, -- [3]
						1, -- [4]
					},
					["class"] = "WARRIOR",
					["iSubClass"] = 2,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "22:54:55",
					["iClass"] = 2,
					["itemReplaced1"] = "|cffa335ee|Hitem:190514:6643:::::::70:66::13:7:8836:8840:8902:9405:9376:8793:9366:8:28:2164:29:49:30:40:38:8:40:123:45:204697:46:194566:50:204440:::::|h[Obsidian Seared Claymore |A:Professions-ChatIcon-Quality-Tier5:17:17::1|a]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Autopass",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202607::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Brutal Dragonslayer's Trophy]|h|r",
					["votes"] = 0,
					["date"] = "13/07/23",
					["responseID"] = "AUTOPASS",
					["id"] = "1689260095-2",
					["typeCode"] = "default",
				}, -- [2]
				{
					["mapID"] = 2569,
					["date"] = "13/07/23",
					["class"] = "WARRIOR",
					["iSubClass"] = 4,
					["groupSize"] = 20,
					["votes"] = 0,
					["time"] = "22:55:10",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:190501::::::::70:66::13:8:8836:8840:8902:9405:9376:8793:9366:9415:9:28:2164:29:36:30:49:38:8:40:173:44:204697:45:194566:49:204440:51:206041:::::|h[Primal Molten Greatbelt |A:Professions-ChatIcon-Quality-Tier5:17:17::1|a]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["response"] = "Offspec/Greed",
					["boss"] = "Assault of the Zaqali",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202577::::::::70:66::6:8:9410:9380:6652:9415:9224:9219:1498:8767::::::|h[Seal of the Defiant Hordes]|h|r",
					["note"] = "Tmog",
					["isAwardReason"] = false,
					["responseID"] = 2,
					["id"] = "1689260110-3",
					["typeCode"] = "default",
				}, -- [3]
				{
					["mapID"] = 2569,
					["date"] = "13/07/23",
					["class"] = "WARRIOR",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "22:55:18",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:207566::::::::70:66::23:5:7977:6652:9334:1492:8767:1:28:2731:::::|h[Accelerating Sandglass]|h|r",
					["typeCode"] = "default",
					["owner"] = "Grendizer-Ragnaros",
					["votes"] = 0,
					["response"] = "Offspec/Greed",
					["id"] = "1689260118-4",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202613::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Zaqali Chaos Grapnel]|h|r",
					["isAwardReason"] = false,
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["responseID"] = 2,
					["itemReplaced2"] = "|cffa335ee|Hitem:203729::::::::70:66::5:5:9409:6652:9334:1495:8767::::::|h[Ominous Chromatic Essence]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
				}, -- [4]
			},
			["Djsmurkioqtx-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "22/06/23",
					["class"] = "MAGE",
					["iSubClass"] = 10,
					["groupSize"] = 20,
					["boss"] = "The Amalgamation Chamber",
					["time"] = "23:06:20",
					["iClass"] = 2,
					["itemReplaced1"] = "|cffa335ee|Hitem:190506:6643:::::::70:66::13:7:8836:8840:8902:9405:9376:8793:9366:8:28:2164:29:40:30:49:38:8:40:191:44:204697:45:194566:49:204440:::::|h[Primal Molten Spellblade |A:Professions-ChatIcon-Quality-Tier5:17:17::1|a]|h|r",
					["votes"] = 1,
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["id"] = "1687446380-11",
					["response"] = "Mainspec/Need",
					["note"] = "for 447 ",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202563::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Obsidian Stirring Staff]|h|r",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["isAwardReason"] = false,
					["responseID"] = 1,
					["itemReplaced2"] = "|cffa335ee|Hitem:193745::::::::70:66::33:5:6652:9144:9334:1663:8767:1:28:1279:::::|h[Rod of Perfect Order]|h|r",
					["typeCode"] = "default",
				}, -- [1]
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "MAGE",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "The Forgotten Experiments",
					["time"] = "00:21:44",
					["iClass"] = 15,
					["itemReplaced1"] = "|cffa335ee|Hitem:202552::::::::70:66::5:6:6652:9230:9409:9334:1492:8767:1:28:1040:::::|h[Underlight Conjurer's Gloves]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202625::::::::70:66::6:4:9230:9410:1498:8767::::::|h[Mystic Mixing Fluid]|h|r",
					["votes"] = 2,
					["date"] = "23/06/23",
					["responseID"] = 1,
					["id"] = "1687450904-14",
					["typeCode"] = "default",
				}, -- [2]
			},
			["Rap-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "06/07/23",
					["class"] = "WARRIOR",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "The Amalgamation Chamber",
					["time"] = "23:19:45",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202612::::::::70:66::5:5:6652:9409:9333:1488:8767:1:28:2474:::::|h[Screaming Black Dragonscale]|h|r",
					["typeCode"] = "default",
					["owner"] = "Grendizer-Ragnaros",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["response"] = "Offspec/Greed",
					["id"] = "1688656785-3",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202617::::::::70:66::6:5:9410:9380:6652:1498:8767::::::|h[Elementium Pocket Anvil]|h|r",
					["isAwardReason"] = false,
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["responseID"] = 2,
					["itemReplaced2"] = "|cffa335ee|Hitem:203963::::::::70:66::5:5:6652:9409:9333:1485:8767::::::|h[Beacon to the Beyond]|h|r",
					["votes"] = 1,
				}, -- [1]
			},
			["Dokterdrake-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "16/06/23",
					["class"] = "EVOKER",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["votes"] = 0,
					["time"] = "00:23:43",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202565:6655:::::::70:66::5:5:6652:9409:9334:1489:8767:1:28:2645:::::|h[Erethos, the Empty Promise]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["typeCode"] = "default",
					["response"] = "Mainspec/Need",
					["id"] = "1686846223-11",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:204318::::::::70:66::6:5:6652:9410:9381:1498:8767::::::|h[Thadrion's Erratic Arcanotrode]|h|r",
					["note"] = "need it when i get legendary",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["boss"] = "The Forgotten Experiments",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [1]
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "EVOKER",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "The Forgotten Experiments",
					["time"] = "00:23:47",
					["iClass"] = 15,
					["itemReplaced1"] = "|cffa335ee|Hitem:202489::::::::70:66::5:6:6652:9230:9409:9334:1492:8767:1:28:1040:::::|h[Claws of Obsidian Secrets]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Mainspec/Need",
					["typeCode"] = "default",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202638::::::::70:66::6:4:9230:9410:1498:8767::::::|h[Zenith Mixing Fluid]|h|r",
					["id"] = "1686846227-12",
					["date"] = "16/06/23",
					["responseID"] = 1,
					["votes"] = 1,
					["isAwardReason"] = false,
				}, -- [2]
				{
					["mapID"] = 2569,
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "EVOKER",
					["iSubClass"] = 3,
					["groupSize"] = 20,
					["boss"] = "Kazzara, the Hellforged",
					["time"] = "22:21:04",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:133235::::::::70:66::35:8:9382:43:9223:9218:9144:6652:9466:8767::::::|h[Fallen Snow Shoulderguards]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Offspec/Greed",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202590::::::::70:66::6:7:9410:9380:6652:9224:9218:1498:8767::::::|h[Kazzara's Grafted Companion]|h|r",
					["votes"] = 1,
					["date"] = "22/06/23",
					["responseID"] = 2,
					["id"] = "1687443664-2",
					["typeCode"] = "default",
				}, -- [3]
				{
					["mapID"] = 2569,
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "EVOKER",
					["iSubClass"] = 3,
					["groupSize"] = 20,
					["boss"] = "Assault of the Zaqali",
					["time"] = "22:41:08",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202488::::::::70:66::5:7:6652:9414:9229:9409:9334:1498:8767:1:28:1040:::::|h[Crown of Obsidian Secrets]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Offspec/Greed",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202591::::::::70:66::6:8:9410:9380:6652:9415:9224:9221:1498:8767::::::|h[Gatecrasher Giant's Coif]|h|r",
					["votes"] = 0,
					["date"] = "22/06/23",
					["responseID"] = 2,
					["id"] = "1687444868-4",
					["typeCode"] = "default",
				}, -- [4]
				{
					["mapID"] = 2569,
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "EVOKER",
					["iSubClass"] = 3,
					["groupSize"] = 20,
					["boss"] = "The Amalgamation Chamber",
					["time"] = "23:06:05",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202491:6619:::::::70:66::5:6:6652:9231:9409:9334:1492:8767:1:28:2615:::::|h[Hauberk of Obsidian Secrets]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["response"] = "Offspec/Greed",
					["isAwardReason"] = false,
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202598::::::::70:66::6:7:9410:9380:6652:9224:9221:1498:8767::::::|h[Cuirass of Meticulous Mixture]|h|r",
					["votes"] = 0,
					["date"] = "22/06/23",
					["responseID"] = 2,
					["id"] = "1687446365-10",
					["typeCode"] = "default",
				}, -- [5]
				{
					["mapID"] = 2569,
					["date"] = "23/06/23",
					["class"] = "EVOKER",
					["iSubClass"] = 3,
					["groupSize"] = 20,
					["votes"] = 0,
					["time"] = "00:20:16",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:193460:6613:::::::70:66::13:7:8836:8840:8902:8960:9405:9376:9366:5:28:2164:38:8:40:386:45:204697:48:204440:::::|h[Venom-Steeped Stompers |A:Professions-ChatIcon-Quality-Tier5:17:17::1|a]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["color"] = {
						1, -- [1]
						0.5, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["response"] = "Offspec/Greed",
					["boss"] = "The Forgotten Experiments",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202588::::::::70:66::6:7:9410:9381:6652:9224:9219:1498:8767::::::|h[Exacting Augmenter's Sabatons]|h|r",
					["note"] = "tmog",
					["isAwardReason"] = false,
					["responseID"] = 2,
					["id"] = "1687450816-13",
					["typeCode"] = "default",
				}, -- [6]
				{
					["mapID"] = 2569,
					["date"] = "29/06/23",
					["class"] = "EVOKER",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "Kazzara, the Hellforged",
					["time"] = "22:20:43",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202612::::::::70:66::5:4:9409:9334:1492:8767::::::|h[Screaming Black Dragonscale]|h|r",
					["votes"] = 0,
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["id"] = "1688048443-4",
					["response"] = "Minor Upgrade",
					["note"] = "i have 441 version",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202612::::::::70:66::6:5:42:9410:9382:1498:8767::::::|h[Screaming Black Dragonscale]|h|r",
					["color"] = {
						0, -- [1]
						0.7, -- [2]
						0.7, -- [3]
						1, -- [4]
					},
					["isAwardReason"] = false,
					["responseID"] = 3,
					["itemReplaced2"] = "|cffa335ee|Hitem:202614::::::::70:66::3:5:6652:7979:9329:1491:8767::::::|h[Rashok's Molten Heart]|h|r",
					["typeCode"] = "default",
				}, -- [7]
			},
			["Buffdotcom-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "19/07/23",
					["class"] = "EVOKER",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["isAwardReason"] = false,
					["time"] = "15:33:34",
					["iClass"] = 4,
					["id"] = "1689770014-0",
					["owner"] = "Buffdotcom-Ragnaros",
					["response"] = "Personal Loot - Non tradeable",
					["difficultyID"] = 15,
					["lootWon"] = "|cffa335ee|Hitem:204467::::::::70:1473::5:7:6652:9226:9220:9409:9332:1485:8767::::::|h[Drape of the Dracthyr Trials]|h|r",
					["boss"] = "The Vigilant Steward, Zskarn",
					["responseID"] = "PL",
					["instance"] = "Aberrus, the Shadowed Crucible-Heroic",
					["color"] = {
						1, -- [1]
						0.6, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [1]
				{
					["mapID"] = 2569,
					["date"] = "19/07/23",
					["class"] = "EVOKER",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["isAwardReason"] = false,
					["time"] = "15:33:36",
					["iClass"] = 4,
					["id"] = "1689770016-1",
					["owner"] = "Buffdotcom-Ragnaros",
					["response"] = "Personal Loot - Non tradeable",
					["difficultyID"] = 15,
					["lootWon"] = "|cffa335ee|Hitem:204467::::::::70:1473::5:7:6652:9226:9220:9409:9332:1485:8767::::::|h[Drape of the Dracthyr Trials]|h|r",
					["boss"] = "The Vigilant Steward, Zskarn",
					["responseID"] = "PL",
					["instance"] = "Aberrus, the Shadowed Crucible-Heroic",
					["color"] = {
						1, -- [1]
						0.6, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [2]
			},
			["Ståck-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["date"] = "16/06/23",
					["class"] = "MAGE",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["votes"] = 0,
					["time"] = "00:23:26",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:193745::::::::70:66::16:5:6652:9144:9334:1663:8767:1:28:1279:::::|h[Rod of Perfect Order]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["typeCode"] = "default",
					["response"] = "Mainspec/Need",
					["id"] = "1686846206-10",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:204318::::::::70:66::6:5:6652:9410:9381:1498:8767::::::|h[Thadrion's Erratic Arcanotrode]|h|r",
					["note"] = "pretty good upgrade",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["boss"] = "The Forgotten Experiments",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [1]
				{
					["mapID"] = 2569,
					["date"] = "06/07/23",
					["class"] = "MAGE",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["votes"] = 2,
					["time"] = "23:19:18",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:202551::192922::::::70:66::5:7:41:9413:9229:9409:9334:1498:8767:1:28:1040:::::|h[Underlight Conjurer's Arcanocowl]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["typeCode"] = "default",
					["response"] = "Mainspec/Need",
					["id"] = "1688656758-1",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202579::::::::70:66::6:8:9410:9380:6652:9415:9224:9221:1498:8767::::::|h[Attendant's Concocting Cover]|h|r",
					["note"] = "good upgrade for 447",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["boss"] = "The Amalgamation Chamber",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [2]
				{
					["mapID"] = 2569,
					["date"] = "06/07/23",
					["class"] = "MAGE",
					["iSubClass"] = 1,
					["groupSize"] = 20,
					["votes"] = 3,
					["time"] = "23:19:25",
					["iClass"] = 4,
					["itemReplaced1"] = "|cffa335ee|Hitem:193724:6574:::::::70:66::33:8:6652:9414:9223:9220:9144:9334:1663:8767:1:28:1279:::::|h[Lily-Laced Bracelets]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Mythic",
					["owner"] = "Grendizer-Ragnaros",
					["typeCode"] = "default",
					["response"] = "Mainspec/Need",
					["id"] = "1688656765-2",
					["difficultyID"] = 16,
					["lootWon"] = "|cffa335ee|Hitem:202593::::::::70:66::6:8:9410:9380:6652:9413:9224:9220:1498:8767::::::|h[Unstable Vial Handlers]|h|r",
					["note"] = "insane next patch",
					["isAwardReason"] = false,
					["responseID"] = 1,
					["boss"] = "The Amalgamation Chamber",
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
				}, -- [3]
			},
			["Shadyb-Ragnaros"] = {
				{
					["mapID"] = 2569,
					["color"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["class"] = "HUNTER",
					["iSubClass"] = 0,
					["groupSize"] = 20,
					["boss"] = "The Forgotten Experiments",
					["time"] = "20:34:22",
					["iClass"] = 15,
					["itemReplaced1"] = "|cffa335ee|Hitem:200389::::::::70:264::35:6:6652:8829:9130:7977:1498:8767::::::|h[Stormwing Harrier's Handguards]|h|r",
					["instance"] = "Aberrus, the Shadowed Crucible-Heroic",
					["owner"] = "Maccasham-Ragnaros",
					["response"] = "Mainspec/Need",
					["isAwardReason"] = false,
					["difficultyID"] = 15,
					["lootWon"] = "|cffa335ee|Hitem:202625::::::::70:264::5:4:9230:9409:1485:8767::::::|h[Mystic Mixing Fluid]|h|r",
					["votes"] = 0,
					["date"] = "11/05/23",
					["responseID"] = 1,
					["id"] = "1683833662-1",
					["typeCode"] = "default",
				}, -- [1]
			},
		},
	},
}
