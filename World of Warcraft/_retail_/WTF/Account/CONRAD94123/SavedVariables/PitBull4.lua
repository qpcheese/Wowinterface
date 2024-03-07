
PitBull4DB = {
	["namespaces"] = {
		["Highlight"] = {
		},
		["LibDualSpec-1.0"] = {
		},
		["RangeFader"] = {
		},
		["CastBarLatency"] = {
		},
		["PhaseIcon"] = {
		},
		["ComboPoints"] = {
		},
		["RoleIcon"] = {
		},
		["Aggro"] = {
		},
		["SummonIcon"] = {
		},
		["HostilityFader"] = {
		},
		["CombatText"] = {
		},
		["ReadyCheckIcon"] = {
		},
		["Totems"] = {
		},
		["Portrait"] = {
		},
		["ExperienceBar"] = {
		},
		["RaidTargetIcon"] = {
		},
		["CombatFader"] = {
		},
		["LeaderIcon"] = {
		},
		["ResurrectionIcon"] = {
		},
		["CastBar"] = {
		},
		["Border"] = {
		},
		["Background"] = {
		},
		["Aura"] = {
		},
		["ReputationBar"] = {
		},
		["PvPIcon"] = {
		},
		["PowerBar"] = {
		},
		["HideBlizzard"] = {
		},
		["RestIcon"] = {
		},
		["ArtifactPowerBar"] = {
		},
		["HealthBar"] = {
		},
		["QuestIcon"] = {
		},
		["Essence"] = {
		},
		["VoiceIcon"] = {
		},
		["VisualHeal"] = {
		},
		["Sounds"] = {
		},
		["PhaseFader"] = {
		},
		["BattlePet"] = {
		},
		["AltPowerBar"] = {
		},
		["BlankSpace"] = {
			["profiles"] = {
				["Qpcheese - Ragnaros"] = {
					["layouts"] = {
						["Normal"] = {
							["elements"] = {
								["Default"] = {
									["exists"] = true,
								},
							},
							["first"] = false,
						},
					},
				},
				["Default"] = {
					["layouts"] = {
						["Normal"] = {
							["first"] = false,
							["elements"] = {
								["Default"] = {
									["exists"] = true,
								},
							},
						},
					},
				},
				["MAGE"] = {
					["layouts"] = {
						["Normal"] = {
							["elements"] = {
								["Default"] = {
									["exists"] = true,
								},
							},
							["first"] = false,
						},
					},
				},
			},
		},
		["ThreatBar"] = {
		},
		["ArcaneCharges"] = {
		},
		["LuaTexts"] = {
			["profiles"] = {
				["Qpcheese - Ragnaros"] = {
					["layouts"] = {
						["Normal"] = {
							["elements"] = {
								["Lua:Artifact power"] = {
									["exists"] = true,
									["code"] = "local cur,max,points = ArtifactPower()\nif max > 0 then\n  if points > 0 then\n    return \"%s/%s (%d)\",cur,max,points\n  end\n  return \"%s/%s\",cur,max\nend\nreturn ConfigMode()",
									["location"] = "center",
									["attach_to"] = "ArtifactPowerBar",
									["events"] = {
										["AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED"] = true,
										["ARTIFACT_XP_UPDATE"] = true,
										["AZERITE_ITEM_POWER_LEVEL_CHANGED"] = true,
										["AZERITE_ITEM_EXPERIENCE_CHANGED"] = true,
									},
								},
								["Lua:Reputation"] = {
									["exists"] = true,
									["code"] = "local name, _, _, max, cur = WatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode()\nelse\n  return \"%d/%d (%s%%)\",cur,max,Percent(cur,max)\nend",
									["location"] = "center",
									["attach_to"] = "ReputationBar",
									["events"] = {
										["UNIT_FACTION"] = true,
										["UPDATE_FACTION"] = true,
									},
								},
								["Lua:Name"] = {
									["exists"] = true,
									["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
									["location"] = "left",
									["attach_to"] = "HealthBar",
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
										["UNIT_NAME_UPDATE"] = true,
									},
								},
								["Lua:Threat"] = {
									["exists"] = true,
									["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
									["location"] = "center",
									["attach_to"] = "ThreatBar",
									["events"] = {
										["UNIT_THREAT_LIST_UPDATE"] = true,
										["UNIT_THREAT_SITUATION_UPDATE"] = true,
									},
								},
								["Lua:Experience"] = {
									["exists"] = true,
									["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
									["location"] = "center",
									["attach_to"] = "ExperienceBar",
									["events"] = {
										["PLAYER_XP_UPDATE"] = true,
										["UNIT_PET_EXPERIENCE"] = true,
									},
								},
								["Lua:Druid mana"] = {
									["exists"] = true,
									["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
									["location"] = "center",
									["attach_to"] = "AltManaBar",
									["events"] = {
										["UNIT_DISPLAYPOWER"] = true,
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
								},
								["Lua:Alternate power"] = {
									["exists"] = true,
									["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "AltPowerBar",
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
								},
								["Lua:Cast time"] = {
									["exists"] = true,
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "CastBar",
									["events"] = {
										["UNIT_SPELLCAST_SUCCEEDED"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
								},
								["Lua:Health"] = {
									["exists"] = true,
									["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
									["location"] = "right",
									["attach_to"] = "HealthBar",
									["events"] = {
										["UNIT_HEALTH"] = true,
										["UNIT_MAXHEALTH"] = true,
										["UNIT_AURA"] = true,
									},
								},
								["Lua:PVPTimer"] = {
									["location"] = "out_right_top",
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
									},
									["exists"] = true,
									["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
								},
								["Lua:Class"] = {
									["exists"] = true,
									["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
									["location"] = "left",
									["attach_to"] = "PowerBar",
									["events"] = {
										["UNIT_LEVEL"] = true,
										["UNIT_CLASSIFICATION_CHANGED"] = true,
										["UNIT_AURA"] = true,
									},
								},
								["Lua:Cast"] = {
									["exists"] = true,
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
									["location"] = "left",
									["attach_to"] = "CastBar",
									["events"] = {
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
								},
								["Lua:Power"] = {
									["exists"] = true,
									["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return \"%s/%s\",Power(unit),max\nend",
									["location"] = "right",
									["attach_to"] = "PowerBar",
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
								},
							},
							["first"] = false,
						},
					},
				},
				["Default"] = {
					["layouts"] = {
						["Normal"] = {
							["first"] = false,
							["elements"] = {
								["Lua:Artifact power"] = {
									["exists"] = true,
									["events"] = {
										["AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED"] = true,
										["ARTIFACT_XP_UPDATE"] = true,
										["AZERITE_ITEM_POWER_LEVEL_CHANGED"] = true,
										["AZERITE_ITEM_EXPERIENCE_CHANGED"] = true,
									},
									["code"] = "local cur,max,points = ArtifactPower()\nif max > 0 then\n  if points > 0 then\n    return \"%s/%s (%d)\",cur,max,points\n  end\n  return \"%s/%s\",cur,max\nend\nreturn ConfigMode()",
									["location"] = "center",
									["attach_to"] = "ArtifactPowerBar",
								},
								["Lua:Reputation"] = {
									["exists"] = true,
									["events"] = {
										["UNIT_FACTION"] = true,
										["UPDATE_FACTION"] = true,
									},
									["code"] = "local name, _, _, max, cur = WatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode()\nelse\n  return \"%d/%d (%s%%)\",cur,max,Percent(cur,max)\nend",
									["location"] = "center",
									["attach_to"] = "ReputationBar",
								},
								["Lua:Name"] = {
									["exists"] = true,
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
										["UNIT_NAME_UPDATE"] = true,
									},
									["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
									["location"] = "left",
									["attach_to"] = "HealthBar",
								},
								["Lua:Threat"] = {
									["exists"] = true,
									["events"] = {
										["UNIT_THREAT_LIST_UPDATE"] = true,
										["UNIT_THREAT_SITUATION_UPDATE"] = true,
									},
									["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
									["location"] = "center",
									["attach_to"] = "ThreatBar",
								},
								["Lua:Power"] = {
									["exists"] = true,
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return \"%s/%s\",Power(unit),max\nend",
									["location"] = "right",
									["attach_to"] = "PowerBar",
								},
								["Lua:Cast time"] = {
									["exists"] = true,
									["events"] = {
										["UNIT_SPELLCAST_SUCCEEDED"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "CastBar",
								},
								["Lua:PVPTimer"] = {
									["exists"] = true,
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
									},
									["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
									["location"] = "out_right_top",
								},
								["Lua:Cast"] = {
									["exists"] = true,
									["events"] = {
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
									["location"] = "left",
									["attach_to"] = "CastBar",
								},
								["Lua:Health"] = {
									["exists"] = true,
									["events"] = {
										["UNIT_HEALTH"] = true,
										["UNIT_MAXHEALTH"] = true,
										["UNIT_AURA"] = true,
									},
									["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
									["location"] = "right",
									["attach_to"] = "HealthBar",
								},
								["Lua:Alternate power"] = {
									["exists"] = true,
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "AltPowerBar",
								},
								["Lua:Class"] = {
									["exists"] = true,
									["events"] = {
										["UNIT_LEVEL"] = true,
										["UNIT_CLASSIFICATION_CHANGED"] = true,
										["UNIT_AURA"] = true,
									},
									["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
									["location"] = "left",
									["attach_to"] = "PowerBar",
								},
								["Lua:Druid mana"] = {
									["exists"] = true,
									["events"] = {
										["UNIT_DISPLAYPOWER"] = true,
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
									["location"] = "center",
									["attach_to"] = "AltManaBar",
								},
								["Lua:Experience"] = {
									["exists"] = true,
									["events"] = {
										["UNIT_PET_EXPERIENCE"] = true,
										["PLAYER_XP_UPDATE"] = true,
									},
									["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
									["location"] = "center",
									["attach_to"] = "ExperienceBar",
								},
							},
						},
					},
				},
				["MAGE"] = {
					["layouts"] = {
						["Normal"] = {
							["elements"] = {
								["Lua:Artifact power"] = {
									["exists"] = true,
									["code"] = "local cur,max,points = ArtifactPower()\nif max > 0 then\n  if points > 0 then\n    return \"%s/%s (%d)\",cur,max,points\n  end\n  return \"%s/%s\",cur,max\nend\nreturn ConfigMode()",
									["location"] = "center",
									["attach_to"] = "ArtifactPowerBar",
									["events"] = {
										["AZERITE_EMPOWERED_ITEM_SELECTION_UPDATED"] = true,
										["ARTIFACT_XP_UPDATE"] = true,
										["AZERITE_ITEM_POWER_LEVEL_CHANGED"] = true,
										["AZERITE_ITEM_EXPERIENCE_CHANGED"] = true,
									},
								},
								["Lua:Reputation"] = {
									["exists"] = true,
									["code"] = "local name, _, _, max, cur = WatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode()\nelse\n  return \"%d/%d (%s%%)\",cur,max,Percent(cur,max)\nend",
									["location"] = "center",
									["attach_to"] = "ReputationBar",
									["events"] = {
										["UNIT_FACTION"] = true,
										["UPDATE_FACTION"] = true,
									},
								},
								["Lua:Name"] = {
									["exists"] = true,
									["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
									["location"] = "left",
									["attach_to"] = "HealthBar",
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
										["UNIT_NAME_UPDATE"] = true,
									},
								},
								["Lua:Threat"] = {
									["exists"] = true,
									["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
									["location"] = "center",
									["attach_to"] = "ThreatBar",
									["events"] = {
										["UNIT_THREAT_LIST_UPDATE"] = true,
										["UNIT_THREAT_SITUATION_UPDATE"] = true,
									},
								},
								["Lua:Experience"] = {
									["exists"] = true,
									["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
									["location"] = "center",
									["attach_to"] = "ExperienceBar",
									["events"] = {
										["PLAYER_XP_UPDATE"] = true,
										["UNIT_PET_EXPERIENCE"] = true,
									},
								},
								["Lua:Druid mana"] = {
									["exists"] = true,
									["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
									["location"] = "center",
									["attach_to"] = "AltManaBar",
									["events"] = {
										["UNIT_DISPLAYPOWER"] = true,
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
								},
								["Lua:Alternate power"] = {
									["exists"] = true,
									["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "AltPowerBar",
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
								},
								["Lua:Cast time"] = {
									["exists"] = true,
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "CastBar",
									["events"] = {
										["UNIT_SPELLCAST_SUCCEEDED"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
								},
								["Lua:Health"] = {
									["exists"] = true,
									["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
									["location"] = "right",
									["attach_to"] = "HealthBar",
									["events"] = {
										["UNIT_HEALTH"] = true,
										["UNIT_MAXHEALTH"] = true,
										["UNIT_AURA"] = true,
									},
								},
								["Lua:PVPTimer"] = {
									["location"] = "out_right_top",
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
									},
									["exists"] = true,
									["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
								},
								["Lua:Class"] = {
									["exists"] = true,
									["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
									["location"] = "left",
									["attach_to"] = "PowerBar",
									["events"] = {
										["UNIT_LEVEL"] = true,
										["UNIT_CLASSIFICATION_CHANGED"] = true,
										["UNIT_AURA"] = true,
									},
								},
								["Lua:Cast"] = {
									["exists"] = true,
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
									["location"] = "left",
									["attach_to"] = "CastBar",
									["events"] = {
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
								},
								["Lua:Power"] = {
									["exists"] = true,
									["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return \"%s/%s\",Power(unit),max\nend",
									["location"] = "right",
									["attach_to"] = "PowerBar",
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
								},
							},
							["first"] = false,
						},
					},
				},
			},
		},
		["CombatIcon"] = {
		},
	},
	["profileKeys"] = {
		["Qpcheese - Ragnaros"] = "Default",
		["Djagon - Ragnaros"] = "Default",
	},
	["global"] = {
		["config_version"] = 5,
	},
	["profiles"] = {
		["Qpcheese - Ragnaros"] = {
			["groups"] = {
				["Party"] = {
					["enabled"] = true,
					["position_x"] = 10,
					["position_y"] = -260,
					["exists"] = true,
					["relative_point"] = "TOPLEFT",
				},
				["Party pets"] = {
					["exists"] = true,
					["unit_group"] = "partypet",
				},
				["Boss"] = {
					["enabled"] = true,
					["position_x"] = -290,
					["position_y"] = 225,
					["show_when"] = {
						["raid40"] = true,
						["raid30"] = true,
						["solo"] = true,
						["raid25"] = true,
						["raid10"] = true,
						["raid"] = true,
						["raid20"] = true,
						["raid15"] = true,
					},
					["exists"] = true,
					["relative_point"] = "RIGHT",
					["unit_group"] = "boss",
				},
			},
			["class_order"] = {
				"WARRIOR", -- [1]
				"DEATHKNIGHT", -- [2]
				"PALADIN", -- [3]
				"MONK", -- [4]
				"PRIEST", -- [5]
				"SHAMAN", -- [6]
				"DRUID", -- [7]
				"ROGUE", -- [8]
				"MAGE", -- [9]
				"WARLOCK", -- [10]
				"HUNTER", -- [11]
				"DEMONHUNTER", -- [12]
				"EVOKER", -- [13]
			},
			["layouts"] = {
				["Normal"] = {
					["exists"] = true,
				},
			},
			["made_units"] = true,
			["made_groups"] = true,
			["units"] = {
				["Player's pet's target"] = {
					["unit"] = "pettarget",
				},
				["Player's pet"] = {
					["enabled"] = true,
					["relative_point"] = "BOTTOM",
					["position_y"] = -30,
					["anchor"] = "TOP",
					["relative_to"] = "SPlayer",
					["unit"] = "pet",
				},
				["Target's target's target"] = {
					["unit"] = "targettargettarget",
				},
				["Target's target"] = {
					["enabled"] = true,
					["relative_point"] = "RIGHT",
					["anchor"] = "LEFT",
					["relative_to"] = "STarget",
					["unit"] = "targettarget",
				},
				["Focus's target's target"] = {
					["unit"] = "focustargettarget",
				},
				["Player"] = {
					["enabled"] = true,
					["relative_point"] = "TOPLEFT",
					["position_y"] = -25,
					["anchor"] = "TOPLEFT",
					["position_x"] = 10,
					["unit"] = "player",
				},
				["Focus"] = {
					["enabled"] = true,
					["relative_point"] = "TOPLEFT",
					["position_y"] = -260,
					["anchor"] = "TOPLEFT",
					["position_x"] = 250,
					["unit"] = "focus",
				},
				["Target"] = {
					["enabled"] = true,
					["relative_point"] = "TOPLEFT",
					["position_y"] = -25,
					["anchor"] = "TOPLEFT",
					["position_x"] = 250,
					["unit"] = "target",
				},
				["Focus's target"] = {
					["unit"] = "focustarget",
				},
			},
		},
		["Default"] = {
			["class_order"] = {
				"WARRIOR", -- [1]
				"DEATHKNIGHT", -- [2]
				"PALADIN", -- [3]
				"MONK", -- [4]
				"PRIEST", -- [5]
				"SHAMAN", -- [6]
				"DRUID", -- [7]
				"ROGUE", -- [8]
				"MAGE", -- [9]
				"WARLOCK", -- [10]
				"HUNTER", -- [11]
				"DEMONHUNTER", -- [12]
				"EVOKER", -- [13]
			},
			["layouts"] = {
				["Normal"] = {
					["exists"] = true,
				},
			},
			["made_groups"] = true,
			["units"] = {
				["Player's pet's target"] = {
					["unit"] = "pettarget",
				},
				["Player's pet"] = {
					["unit"] = "pet",
					["relative_point"] = "BOTTOM",
					["anchor"] = "TOP",
					["enabled"] = true,
					["relative_to"] = "SPlayer",
					["position_y"] = -30,
				},
				["Target's target's target"] = {
					["unit"] = "targettargettarget",
				},
				["Target's target"] = {
					["unit"] = "targettarget",
					["relative_point"] = "RIGHT",
					["anchor"] = "LEFT",
					["enabled"] = true,
					["relative_to"] = "STarget",
				},
				["Focus's target's target"] = {
					["unit"] = "focustargettarget",
				},
				["Player"] = {
					["unit"] = "player",
					["relative_point"] = "TOPLEFT",
					["anchor"] = "TOPLEFT",
					["enabled"] = true,
					["position_x"] = 10,
					["position_y"] = -25,
				},
				["Focus"] = {
					["unit"] = "focus",
					["relative_point"] = "TOPLEFT",
					["anchor"] = "TOPLEFT",
					["enabled"] = true,
					["position_x"] = 250,
					["position_y"] = -260,
				},
				["Target"] = {
					["unit"] = "target",
					["relative_point"] = "TOPLEFT",
					["anchor"] = "TOPLEFT",
					["enabled"] = true,
					["position_x"] = 250,
					["position_y"] = -25,
				},
				["Focus's target"] = {
					["unit"] = "focustarget",
				},
			},
			["made_units"] = true,
			["groups"] = {
				["Party"] = {
					["position_x"] = 10,
					["relative_point"] = "TOPLEFT",
					["enabled"] = true,
					["exists"] = true,
					["position_y"] = -260,
				},
				["Party pets"] = {
					["unit_group"] = "partypet",
					["exists"] = true,
				},
				["Boss"] = {
					["relative_point"] = "RIGHT",
					["position_x"] = -290,
					["enabled"] = true,
					["unit_group"] = "boss",
					["exists"] = true,
					["position_y"] = 225,
					["show_when"] = {
						["solo"] = true,
						["raid10"] = true,
						["raid40"] = true,
						["raid20"] = true,
						["raid25"] = true,
						["raid"] = true,
						["raid30"] = true,
						["raid15"] = true,
					},
				},
			},
		},
		["MAGE"] = {
			["groups"] = {
				["Party"] = {
					["enabled"] = true,
					["position_x"] = 10,
					["position_y"] = -260,
					["exists"] = true,
					["relative_point"] = "TOPLEFT",
				},
				["Party pets"] = {
					["exists"] = true,
					["unit_group"] = "partypet",
				},
				["Boss"] = {
					["enabled"] = true,
					["position_x"] = -290,
					["position_y"] = 225,
					["show_when"] = {
						["raid40"] = true,
						["raid30"] = true,
						["solo"] = true,
						["raid25"] = true,
						["raid10"] = true,
						["raid"] = true,
						["raid20"] = true,
						["raid15"] = true,
					},
					["exists"] = true,
					["relative_point"] = "RIGHT",
					["unit_group"] = "boss",
				},
			},
			["class_order"] = {
				"WARRIOR", -- [1]
				"DEATHKNIGHT", -- [2]
				"PALADIN", -- [3]
				"MONK", -- [4]
				"PRIEST", -- [5]
				"SHAMAN", -- [6]
				"DRUID", -- [7]
				"ROGUE", -- [8]
				"MAGE", -- [9]
				"WARLOCK", -- [10]
				"HUNTER", -- [11]
				"DEMONHUNTER", -- [12]
				"EVOKER", -- [13]
			},
			["layouts"] = {
				["Normal"] = {
					["exists"] = true,
				},
			},
			["made_units"] = true,
			["made_groups"] = true,
			["units"] = {
				["Player's pet's target"] = {
					["unit"] = "pettarget",
				},
				["Player's pet"] = {
					["enabled"] = true,
					["relative_point"] = "BOTTOM",
					["position_y"] = -30,
					["anchor"] = "TOP",
					["relative_to"] = "SPlayer",
					["unit"] = "pet",
				},
				["Target's target's target"] = {
					["unit"] = "targettargettarget",
				},
				["Target's target"] = {
					["enabled"] = true,
					["relative_point"] = "RIGHT",
					["anchor"] = "LEFT",
					["relative_to"] = "STarget",
					["unit"] = "targettarget",
				},
				["Focus's target's target"] = {
					["unit"] = "focustargettarget",
				},
				["Player"] = {
					["enabled"] = true,
					["relative_point"] = "TOPLEFT",
					["position_y"] = -25,
					["anchor"] = "TOPLEFT",
					["position_x"] = 10,
					["unit"] = "player",
				},
				["Focus"] = {
					["enabled"] = true,
					["relative_point"] = "TOPLEFT",
					["position_y"] = -260,
					["anchor"] = "TOPLEFT",
					["position_x"] = 250,
					["unit"] = "focus",
				},
				["Target"] = {
					["enabled"] = true,
					["relative_point"] = "TOPLEFT",
					["position_y"] = -25,
					["anchor"] = "TOPLEFT",
					["position_x"] = 250,
					["unit"] = "target",
				},
				["Focus's target"] = {
					["unit"] = "focustarget",
				},
			},
		},
	},
}
