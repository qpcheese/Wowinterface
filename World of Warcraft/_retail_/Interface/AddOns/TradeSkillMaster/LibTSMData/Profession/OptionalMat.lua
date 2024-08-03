-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                          https://tradeskillmaster.com                          --
--    All Rights Reserved - Detailed license information included with addon.     --
-- ------------------------------------------------------------------------------ --

local LibTSMData = select(2, ...).LibTSMData
local OptionalMat = LibTSMData:Init("OptionalMat")



-- ============================================================================
-- Quality Weight
-- ============================================================================

OptionalMat.QualityWeight = {
	["i:188658"] = 10,
	["i:189143"] = 10,
	["i:189541"] = 48,
	["i:189542"] = 48,
	["i:189543"] = 48,
	["i:190099"] = 20,
	["i:190100"] = 20,
	["i:190101"] = 20,
	["i:190311"] = 10,
	["i:190312"] = 14,
	["i:190313"] = 14,
	["i:190314"] = 14,
	["i:190394"] = 3,
	["i:190395"] = 3,
	["i:190396"] = 3,
	["i:190530"] = 48,
	["i:190531"] = 48,
	["i:190532"] = 48,
	["i:190533"] = 78,
	["i:190534"] = 78,
	["i:190535"] = 78,
	["i:190536"] = 33,
	["i:190537"] = 33,
	["i:190538"] = 33,
	["i:191250"] = 10,
	["i:191318"] = 35,
	["i:191319"] = 35,
	["i:191320"] = 35,
	["i:191321"] = 35,
	["i:191322"] = 35,
	["i:191323"] = 35,
	["i:191324"] = 36,
	["i:191325"] = 36,
	["i:191326"] = 36,
	["i:191327"] = 36,
	["i:191328"] = 36,
	["i:191329"] = 36,
	["i:191330"] = 36,
	["i:191331"] = 36,
	["i:191332"] = 36,
	["i:191336"] = 33,
	["i:191337"] = 33,
	["i:191338"] = 33,
	["i:191339"] = 32,
	["i:191340"] = 32,
	["i:191341"] = 32,
	["i:191342"] = 17,
	["i:191343"] = 17,
	["i:191344"] = 17,
	["i:191345"] = 17,
	["i:191346"] = 17,
	["i:191347"] = 17,
	["i:191348"] = 32,
	["i:191349"] = 32,
	["i:191350"] = 32,
	["i:191351"] = 27,
	["i:191352"] = 27,
	["i:191353"] = 27,
	["i:191354"] = 17,
	["i:191355"] = 17,
	["i:191356"] = 17,
	["i:191357"] = 35,
	["i:191358"] = 35,
	["i:191359"] = 35,
	["i:191360"] = 25,
	["i:191361"] = 25,
	["i:191362"] = 25,
	["i:191363"] = 21,
	["i:191364"] = 21,
	["i:191365"] = 21,
	["i:191366"] = 23,
	["i:191367"] = 23,
	["i:191368"] = 23,
	["i:191369"] = 23,
	["i:191370"] = 23,
	["i:191371"] = 23,
	["i:191372"] = 23,
	["i:191373"] = 23,
	["i:191374"] = 23,
	["i:191375"] = 23,
	["i:191376"] = 23,
	["i:191377"] = 23,
	["i:191378"] = 11,
	["i:191379"] = 11,
	["i:191380"] = 11,
	["i:191381"] = 32,
	["i:191382"] = 32,
	["i:191383"] = 32,
	["i:191384"] = 14,
	["i:191385"] = 14,
	["i:191386"] = 14,
	["i:191387"] = 22,
	["i:191388"] = 22,
	["i:191389"] = 22,
	["i:191393"] = 21,
	["i:191394"] = 21,
	["i:191395"] = 21,
	["i:191396"] = 20,
	["i:191397"] = 20,
	["i:191398"] = 20,
	["i:191399"] = 20,
	["i:191400"] = 20,
	["i:191401"] = 20,
	["i:191460"] = 3,
	["i:191461"] = 3,
	["i:191462"] = 3,
	["i:191464"] = 6,
	["i:191465"] = 6,
	["i:191466"] = 6,
	["i:191467"] = 6,
	["i:191468"] = 6,
	["i:191469"] = 6,
	["i:191470"] = 6,
	["i:191471"] = 6,
	["i:191472"] = 6,
	["i:191474"] = 11,
	["i:191475"] = 11,
	["i:191476"] = 11,
	["i:191482"] = 691,
	["i:191483"] = 691,
	["i:191484"] = 691,
	["i:191485"] = 946,
	["i:191486"] = 946,
	["i:191487"] = 946,
	["i:191488"] = 42,
	["i:191489"] = 42,
	["i:191490"] = 42,
	["i:191493"] = 39,
	["i:191494"] = 39,
	["i:191495"] = 39,
	["i:191496"] = 12,
	["i:191497"] = 12,
	["i:191498"] = 12,
	["i:191499"] = 29,
	["i:191500"] = 29,
	["i:191501"] = 29,
	["i:191502"] = 14,
	["i:191503"] = 14,
	["i:191504"] = 14,
	["i:191505"] = 14,
	["i:191506"] = 14,
	["i:191507"] = 14,
	["i:191508"] = 14,
	["i:191509"] = 14,
	["i:191510"] = 14,
	["i:191872"] = 10,
	["i:191873"] = 10,
	["i:192095"] = 4,
	["i:192096"] = 4,
	["i:192097"] = 4,
	["i:192834"] = 20,
	["i:192835"] = 20,
	["i:192836"] = 20,
	["i:192837"] = 25,
	["i:192838"] = 25,
	["i:192839"] = 25,
	["i:192840"] = 25,
	["i:192841"] = 25,
	["i:192842"] = 25,
	["i:192843"] = 25,
	["i:192844"] = 25,
	["i:192845"] = 25,
	["i:192846"] = 25,
	["i:192847"] = 25,
	["i:192848"] = 25,
	["i:192849"] = 15,
	["i:192850"] = 15,
	["i:192851"] = 15,
	["i:192852"] = 108,
	["i:192853"] = 108,
	["i:192855"] = 108,
	["i:192856"] = 108,
	["i:192857"] = 108,
	["i:192858"] = 108,
	["i:192859"] = 108,
	["i:192860"] = 108,
	["i:192861"] = 108,
	["i:192862"] = 108,
	["i:192863"] = 108,
	["i:192865"] = 108,
	["i:192866"] = 88,
	["i:192867"] = 88,
	["i:192868"] = 88,
	["i:192869"] = 254,
	["i:192870"] = 254,
	["i:192871"] = 254,
	["i:192876"] = 26,
	["i:192877"] = 26,
	["i:192878"] = 26,
	["i:192883"] = 21,
	["i:192884"] = 21,
	["i:192885"] = 21,
	["i:192887"] = 291,
	["i:193029"] = 31,
	["i:193030"] = 31,
	["i:193031"] = 31,
	["i:193208"] = 2,
	["i:193210"] = 2,
	["i:193211"] = 2,
	["i:193213"] = 2,
	["i:193214"] = 2,
	["i:193215"] = 2,
	["i:193216"] = 31,
	["i:193217"] = 31,
	["i:193218"] = 31,
	["i:193222"] = 31,
	["i:193223"] = 31,
	["i:193224"] = 31,
	["i:193226"] = 45,
	["i:193227"] = 45,
	["i:193228"] = 45,
	["i:193229"] = 45,
	["i:193230"] = 45,
	["i:193231"] = 45,
	["i:193232"] = 45,
	["i:193233"] = 45,
	["i:193234"] = 45,
	["i:193236"] = 42,
	["i:193237"] = 42,
	["i:193238"] = 42,
	["i:193239"] = 45,
	["i:193240"] = 45,
	["i:193241"] = 45,
	["i:193242"] = 45,
	["i:193243"] = 45,
	["i:193244"] = 45,
	["i:193245"] = 45,
	["i:193246"] = 45,
	["i:193247"] = 45,
	["i:193248"] = 42,
	["i:193249"] = 42,
	["i:193250"] = 42,
	["i:193368"] = 20,
	["i:193369"] = 20,
	["i:193370"] = 20,
	["i:193378"] = 291,
	["i:193379"] = 291,
	["i:193926"] = 9,
	["i:193927"] = 9,
	["i:193928"] = 9,
	["i:193929"] = 54,
	["i:193930"] = 54,
	["i:193931"] = 54,
	["i:193932"] = 29,
	["i:193933"] = 29,
	["i:193934"] = 29,
	["i:193935"] = 117,
	["i:193936"] = 117,
	["i:193937"] = 117,
	["i:193938"] = 117,
	["i:193939"] = 117,
	["i:193940"] = 117,
	["i:194008"] = 123,
	["i:194009"] = 123,
	["i:194010"] = 123,
	["i:194011"] = 218,
	["i:194012"] = 218,
	["i:194013"] = 218,
	["i:194014"] = 218,
	["i:194015"] = 218,
	["i:194016"] = 218,
	["i:194048"] = 34,
	["i:194049"] = 34,
	["i:194050"] = 34,
	["i:194545"] = 2,
	["i:194727"] = 5,
	["i:194728"] = 5,
	["i:194729"] = 5,
	["i:194751"] = 14,
	["i:194752"] = 14,
	["i:194754"] = 42,
	["i:194755"] = 42,
	["i:194756"] = 42,
	["i:194758"] = 14,
	["i:194760"] = 24,
	["i:194761"] = 24,
	["i:194767"] = 34,
	["i:194768"] = 34,
	["i:194846"] = 14,
	["i:194850"] = 14,
	["i:194852"] = 14,
	["i:194855"] = 24,
	["i:194856"] = 14,
	["i:194857"] = 14,
	["i:194858"] = 14,
	["i:194859"] = 34,
	["i:194862"] = 46,
	["i:194863"] = 46,
	["i:194864"] = 46,
	["i:198177"] = 60,
	["i:198178"] = 60,
	["i:198179"] = 60,
	["i:198183"] = 7,
	["i:198184"] = 7,
	["i:198185"] = 7,
	["i:198186"] = 9,
	["i:198187"] = 9,
	["i:198188"] = 9,
	["i:198189"] = 13,
	["i:198190"] = 13,
	["i:198191"] = 13,
	["i:198192"] = 26,
	["i:198193"] = 26,
	["i:198194"] = 26,
	["i:198195"] = 51,
	["i:198196"] = 51,
	["i:198197"] = 51,
	["i:198198"] = 75,
	["i:198199"] = 75,
	["i:198200"] = 75,
	["i:198201"] = 19,
	["i:198202"] = 19,
	["i:198203"] = 19,
	["i:198228"] = 20,
	["i:198229"] = 20,
	["i:198230"] = 20,
	["i:198239"] = 21,
	["i:198240"] = 21,
	["i:198241"] = 21,
	["i:198278"] = 22,
	["i:198279"] = 22,
	["i:198280"] = 22,
	["i:198412"] = 16,
	["i:198413"] = 16,
	["i:198414"] = 16,
	["i:198415"] = 16,
	["i:198416"] = 16,
	["i:198417"] = 16,
	["i:198418"] = 16,
	["i:198419"] = 16,
	["i:198420"] = 16,
	["i:198421"] = 6,
	["i:198422"] = 6,
	["i:198423"] = 6,
	["i:204994"] = 33,
	["i:204995"] = 33,
	["i:204996"] = 33,
}



-- ============================================================================
-- Info
-- ============================================================================

OptionalMat.Info = {
	["i:173161"] = { statModifier = 32 }, -- Missive of Critical Strike
	["i:173160"] = { statModifier = 36 }, -- Missive of Haste
	["i:173163"] = { statModifier = 40 }, -- Missive of Versatility
	["i:173162"] = { statModifier = 49 }, -- Missive of Mastery
	["i:180055"] = { absItemLevel = 19 }, -- Relic of the Past I
	["i:180057"] = { absItemLevel = 28 }, -- Relic of the Past II
	["i:180058"] = { absItemLevel = 39 }, -- Relic of the Past III
	["i:180059"] = { absItemLevel = 48 }, -- Relic of the Past IV
	["i:180060"] = { absItemLevel = 54 }, -- Relic of the Past V
	["i:183942"] = { absItemLevel = 87 }, -- Novice Crafter's Mark
	["i:173381"] = { absItemLevel = 117 }, -- Crafter's Mark I
	["i:173382"] = { absItemLevel = 168 }, -- Crafter's Mark II
	["i:173383"] = { absItemLevel = 200 }, -- Crafter's Mark III
	["i:173384"] = { absItemLevel = 230 }, -- Crafter's Mark of the Chained Isle
	["i:187741"] = { absItemLevel = 233 }, -- Crafter's Mark IV
	["i:187742"] = { absItemLevel = 262 }, -- Crafter's Mark of the First Ones
	["i:185960"] = { relItemLevels = { [74] = true, [87] = true }, relCraftLevel = 2 }, -- Vestige of Origins
	["i:187784"] = { relItemLevels = { [116] = true }, relCraftLevel = 3 }, -- Vestige of the Eternal
	["i:191781"] = { relItemLevels = { [74] = true }, reqCraftLevels = { [1] = true }, relCraftLevel = 4, ignored = true }, -- Vestige of the Devourers
}



-- ============================================================================
-- Item Level By Rank
-- ============================================================================

OptionalMat.ItemLevelByRank = {
	[1] = 15,
	[2] = 35,
	[3] = 50,
	[4] = 60,
	[5] = 74,
	[6] = 87,
	[7] = 116,
}