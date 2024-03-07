--*** in order to replace the sound u have to mute first the original one. Below is the list of sounds u want to mute

local MutedSounds = {

--*** you can add here new lines with sound IDs you want to mute. Use this database https://wow.tools/files/
--*** use   %PartOfNameOfSoundYouSearch%.ogg  mask in a search line to find a right ID (example: %weather%.ogg)
--*** below are some examples of weather sounds IDs i have found. Don't forget to delete the lines if you don't want to mute these sounds
--*** everything in a line after -- is ignored, so you can actually comment the line instead of deleting it
--*** REMEMBER! the spell sounds are muted for every player/npc in game, not only for you. But you can objectively play new ones only for you, cause it is not
--*** possible to bind the sound to environment. So if you tried to play a new sound for a player/npc who stays far away from you, you would here it like your own.

--568970, --	sound/spells/fishingbobber_ver2_2.ogg
--569044, --	sound/spells/fishingbobber_ver2_3.ogg
--569285, --	sound/spells/fishingbobber_ver2_1.ogg
538981, --	sound/ambience/weather/rainmediumloop.ogg
538982, --	sound/ambience/weather/rainheavyloop.ogg
538983, --	sound/ambience/weather/rainlightloop.ogg
538984, --	sound/ambience/weather/snowheavy.ogg
538985, --	sound/ambience/weather/snowlight.ogg
538986, --	sound/ambience/weather/sandstormheavy.ogg
538987, --	sound/ambience/weather/sandstormmedium.ogg
538988, --	sound/ambience/weather/sandstormlight.ogg
538989, --	sound/ambience/weather/snowmedium.ogg
2057626, --	sound/ambience/weather/fx_weather_rain_heavy_01_stereo_loop.ogg
2057628, --	sound/ambience/weather/fx_weather_rain_heavy_02_stereo_loop.ogg
2057629, --	sound/ambience/weather/fx_weather_rain_light_01_stereo_loop.ogg
2057630, --	sound/ambience/weather/fx_weather_rain_light_02_stereo_loop.ogg
2057631, --	sound/ambience/weather/fx_weather_rain_med_01_stereo_loop.ogg
2057632, --	sound/ambience/weather/fx_weather_rain_med_02_stereo_loop.ogg
2066248, --	sound/ambience/weather/fx_weather_blazing_sky_distant_volcano_01.ogg
2066249, --	sound/ambience/weather/fx_weather_blazing_sky_distant_volcano_02.ogg
2066250, --	sound/ambience/weather/fx_weather_blazing_sky_distant_volcano_03.ogg
2066251, --	sound/ambience/weather/fx_weather_blazing_sky_distant_volcano_04.ogg
2066252, --	sound/ambience/weather/fx_weather_blazing_sky_distant_volcano_05.ogg
2066253, --	sound/ambience/weather/fx_weather_blazing_sky_distant_volcano_06.ogg
2182419, --	sound/ambience/weather/fx_weather_80_lightningstorm_loop.ogg
2182420, --	sound/ambience/weather/fx_weather_80_lightningstorm_periodic_06.ogg
2182422, --	sound/ambience/weather/fx_weather_80_lightningstorm_periodic_04.ogg
2182423, --	sound/ambience/weather/fx_weather_80_lightningstorm_periodic_03.ogg
2182424, --	sound/ambience/weather/fx_weather_80_lightningstorm_periodic_02.ogg
2182425, --	sound/ambience/weather/fx_weather_80_lightningstorm_periodic_01.ogg

}


--addon frame
local SSReplacer = CreateFrame("Frame", "SSReplacer01", nil)


--mute/unmute function
local function MuteUnmute()
	if _SSReplacer == "on" then
		for _, fileid in pairs(MutedSounds) do
			MuteSoundFile(fileid)
		end
	else
		for _, fileid in pairs(MutedSounds) do
			UnmuteSoundFile(fileid)
		end
	end
end

--event function
local function onEvent(self, event, ...)

	local arg1, arg2, arg3 = ...
	if event == "PLAYER_LOGIN" then
		print("|cFFFFDF00Type |cFF005FFF/ssr|cFFFFDF00 to switch on/off replaced sounds")

	elseif (_SSReplacer == "on") and (event == "UNIT_SPELLCAST_SUCCEEDED") and (arg1 == "player") then

--*** now you can add a new sound for any spell
--*** if spell/shot with number ... is succeeded then play a sound file (example: Autoshot number is 75)

--	print(arg3)  --*** uncomment this line (delete -- at the beginning), save and /reload to see the spell numbers in your chat window.


		if (arg3==75) then
			PlaySoundFile("Interface\\AddOns\\SimpleSoundReplacer\\_Silence.ogg")


--*** else if any other spell is succeeded then play a sound

		elseif (arg3==75) or (arg3==75) then
			PlaySoundFile("Interface\\AddOns\\SimpleSoundReplacer\\_Silence.ogg")
		
--***		elseif (arg3==...) then
--***		elseif ...
--***		elseif
--***		elseif

		end

	elseif (event == "ADDON_LOADED" and arg1 == "SimpleSoundReplacer") then
		if _SSReplacer == nil then
			_SSReplacer = "on"
		end
		MuteUnmute()
	end
end

SlashCmdList["SIMPLESOUNDREPLACER"] = function(msg)
	if _SSReplacer == "on" then
		_SSReplacer = "off"
		print("|cFFFFDF00Replaced Sounds are OFF")
	else 
		_SSReplacer = "on"
		print("|cFFFFDF00Replaced Sounds are ON")
	end
	MuteUnmute()
end
SLASH_SIMPLESOUNDREPLACER1 = '/ssr'

SSReplacer:RegisterEvent("PLAYER_LOGIN")
SSReplacer:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
SSReplacer:RegisterEvent("ADDON_LOADED")
SSReplacer:SetScript("OnEvent", onEvent)
