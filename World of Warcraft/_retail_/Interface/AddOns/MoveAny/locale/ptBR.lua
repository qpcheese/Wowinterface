-- ptBR Brazilian Portuguese
local _, MoveAny = ...
function MoveAny:LangptBR()
	local tab = {
		["LID_MMBTNLEFT"] = "Clique esquerdo => Bloqueios/Desbloqueio + Opções",
		["LID_MMBTNRIGHT"] = "Shift + Right Click => Hide Minimap Button",
		["LID_GENERAL"] = "Geral",
		["LID_SHOWMINIMAPBUTTON"] = "Show Minimap Button",
		["LID_GRIDSIZE"] = "Gridsize",
		["LID_MOVEFRAMES"] = "Move Frames/Windows",
		["LID_FRAMESKEYDRAG"] = "Move Frame with %s + Leftclick-drag",
		["LID_FRAMESKEYSCALE"] = "Balança com Turno %s + Arrastar com o Botão Direito",
		["LID_FRAMESKEYRESET"] = "Reset Frame with %s + Mousewheelclick-drag",
		["LID_PLAYERFRAME"] = "Player Frame",
		["LID_PETFRAME"] = "Pet Frame",
		["LID_TARGETFRAME"] = "Target Frame",
		["LID_TARGETOFTARGETFRAME"] = "Target of Target Frame",
		["LID_TARGETFRAMESPELLBAR"] = "Castbar from Target",
		["LID_FOCUSFRAME"] = "Focus Frame",
		["LID_FOCUSFRAMESPELLBAR"] = "Castbar from Focus",
		["LID_TARGETOFFOCUSFRAME"] = "Target of Focus Frame",
		["LID_RUNEFRAME"] = "Deathknight - Runes Frame",
		["LID_TOTEMFRAME"] = "Totem Timers",
		["LID_WARLOCKPOWERFRAME"] = "Warlock Power frame",
		["LID_MONKHARMONYBARFRAME"] = "Monk Harmony frame",
		["LID_MAGEARCANECHARGESFRAME"] = "Mage Arcane Charges frame",
		["LID_ESSENCEPLAYERFRAME"] = "Essence Player Frame (Evoker)",
		["LID_MAFPSFrame"] = "FPS",
		["LID_MINIMAP"] = "Mini Mapa",
		["LID_BUFFS"] = "Buffs",
		["LID_DEBUFFS"] = "Debuffs",
		["LID_VEHICLESEATINDICATOR"] = "Vehicle Seat Indicator",
		["LID_ARENAENEMYFRAMES"] = "Arena Enemy Frames",
		["LID_ARENAPREPFRAMES"] = "Arena Prep Frames",
		["LID_QUESTTRACKER"] = "Questtracker",
		["LID_MICROMENU"] = "Micro Menu",
		["LID_BAGS"] = "Bags",
		["LID_GAMETOOLTIP"] = "Tooltip",
		["LID_GAMETOOLTIP_ONCURSOR"] = "Tooltip on Cursor",
		["LID_QUEUESTATUSBUTTON"] = "LFG Status",
		["LID_PETBAR"] = "Pet Bar",
		["LID_STANCEBAR"] = "Stance Bar",
		["LID_TOTEMBAR"] = "Shaman - Barra Totem",
		["LID_LEAVEVEHICLE"] = "Leave Vehicle Button",
		["LID_GROUPLOOTCONTAINER"] = "Loot Roll frame",
		["LID_STATUSTRACKINGBARMANAGER"] = "Status Tracking Bar Manager (XP, Reputation)",
		["LID_ALERTFRAME"] = "Alert Frame (Bonus Loot, Achiements, ...)",
		["LID_CHAT"] = "Chatframe %d",
		["LID_CHATBUTTONFRAME"] = "Botões de Chat",
		["LID_CHATQUICKJOIN"] = "Chat Quick Join",
		["LID_CHATEDITBOX"] = "Chat Inputbox",
		["LID_COMPACTRAIDFRAMEMANAGER"] = "Gerente de Raid",
		["LID_BNToastFrame"] = "Battlenet Friends Notifications",
		["LID_ZONETEXTFRAME"] = "Texto da zona",
		["LID_UIWIDGETTOPCENTER"] = "Widget Top Center (Status on BGs/Dungeons)",
		["LID_IASKILLS"] = "Skillbars",
		["LID_UIWIDGETBELOWMINIMAP"] = "Widget Below Minimap (Capture Status)",
		["LID_DURABILITY"] = "Boneca de Durabilidade",
		["LID_MONEYBAR"] = "Money Bar",
		["LID_TOKENBAR"] = "Token Bar",
		["LID_IAILVLBAR"] = "ItemLevel Bar",
		["LID_CASTINGBAR"] = "Casting Bar",
		["LID_TALKINGHEAD"] = "Talking Head Dialog",
		["LID_POSSESSBAR"] = "Possess Bar (Controlling NPC/Vehicle)",
		["LID_ZONEABILITYFRAME"] = "Zone Ability",
		["LID_EXTRAABILITYCONTAINER"] = "Extra Ability (Capacidade Extra)",
		["LID_MAINMENUEXPBAR"] = "Exp Bar",
		["LID_REPUTATIONWATCHBAR"] = "Barra de Reputação",
		["LID_UIWIDGETPOWERBAR"] = "Barra de alimentação",
		["LID_ROWS"] = "Linhas",
		["LID_SPACING"] = "Espaçamento",
		["LID_PROFILE"] = "Perfil",
		["LID_PROFILES"] = "Profiles",
		["LID_ADDPROFILE"] = "Adicionar Perfil",
		["LID_CURRENT"] = "Atual",
		["LID_SHARE"] = "Compartilhar",
		["LID_SHAREPROFILE"] = "Share Profile",
		["LID_GETPROFILE"] = "Get Profile",
		["LID_INHERITFROM"] = "Herdar de",
		["LID_ADD"] = "Adicionar",
		["LID_REMOVE"] = "Remover",
		["LID_RENAME"] = "Renomear",
		["LID_PLAYER"] = "Jogador",
		["LID_DOWNLOAD"] = "Download",
		["LID_UPLOAD"] = "Upload",
		["LID_STATUS"] = "Status",
		["LID_DONE"] = "Feito",
		["LID_WAITINGFOROWNER"] = "Esperando pelo Proprietário",
		["LID_WAITFORPLAYERPROFILE"] = "Aguarde que outro jogador pressione \"Obter Perfis\"",
		["LID_WAITFORPLAYERPROFILE2"] = "Aguarde que outro jogador pressione \"Compartilhe\"",
		["LID_ALPHAINCOMBAT"] = "Alpha (in Combat)",
		["LID_ALPHANOTINCOMBAT"] = "Alpha (não em Combate)",
		["LID_ALPHAINVEHICLE"] = "Alfa (no veículo)",
		["LID_MABUFFLIMIT"] = "Buff limit",
		["LID_MABUFFSPACINGX"] = "Buff Spacing Horizontal",
		["LID_MABUFFSPACINGY"] = "Buff Spacing Vertical",
		["LID_ISENABLEDINEDITMODE"] = "(Desabilitar no Modo EditMode)",
		["LID_CANBREAKBECAUSEOFEDITMODE"] = "(Pode causar erro devido ao modo de edição)",
		["LID_HELPTEXT"] = "%s já está habilitado em EditMode. Favor desativar em EditMode ou MoveAny",
		["LID_BUILTIN"] = "Built-In",
		["LID_EDITMODE"] = "Overwrite Edit Mode",
		["LID_NORMAL"] = "Normal",
		["LID_CLASSSPECIFIC"] = "Classe Específica",
		["LID_ADVANCED"] = "Avançado",
		["LID_ImproveAny"] = "ImproveAny",
		["LID_ARCHEOLOGYDIGSITEPROGRESSBAR"] = "Archeology digsite progress bar",
		["LID_UIERRORSFRAME"] = "Ui Error Messages, Quest Progress",
		["LID_COMBOPOINTPLAYERFRAME"] = "Pontos de Combo",
		["LID_PARTYFRAME"] = "Party Frame",
		["LID_PARTYMEMBERFRAME"] = "Party Member Frame %s",
		["LID_BOSSTARGETFRAMECONTAINER"] = "Boss Frames",
		["LID_FLIPPED"] = "Flipped",
		["LID_GHOSTFRAME"] = "Armação Fantasma (Teletransporte para Cemitério)",
		["LID_TICKETSTATUSFRAME"] = "Ticket Frame",
		["LID_LOSSOFCONTROLFRAME"] = "Loss of Control Frame (Perda do Quadro de Controle)",
		["LID_TargetFrameNumericalThreat"] = "Percentual de Ameaça",
		["LID_RESETELEMENT"] = "Reset Element",
	}

	if MoveAny:GetWoWBuild() ~= "RETAIL" then
		tab["LID_ACTIONBARS"] = "Barra de ação 1 + 5 + 6"
		tab["LID_ACTIONBAR1"] = "Barra de ação 1 (Barra principal)"
		tab["LID_ACTIONBAR2"] = "Barra de ação 2 (2. Página da barra de ação 1)"
		tab["LID_ACTIONBAR3"] = "Barra de ação 3 (barra direita)"
		tab["LID_ACTIONBAR4"] = "Barra de ação 4 (Barra Esquerda)"
		tab["LID_ACTIONBAR5"] = "Barra de ação 5 (barra superior direita)"
		tab["LID_ACTIONBAR6"] = "Barra de ação 6 (Barra superior esquerda)"
		tab["LID_ACTIONBAR7"] = "Barra de ação 7 (Personalizada)"
		tab["LID_ACTIONBAR8"] = "Barra de ação 8 (Personalizada)"
		tab["LID_ACTIONBAR9"] = "Barra de ação 9 (Personalizada)"
		tab["LID_ACTIONBAR10"] = "Barra de ação 10 (Personalizada)"
	else
		tab["LID_ACTIONBAR1"] = "Barra de ação 1 (Barra principal)"
		tab["LID_ACTIONBAR2"] = "Barra de ação 2 (Acima da barra principal)"
		tab["LID_ACTIONBAR3"] = "Barra de ação 3 (Acima da segunda barra)"
		tab["LID_ACTIONBAR4"] = "Barra de ação 4 (Barra da direita)"
		tab["LID_ACTIONBAR5"] = "Barra de ação 5 (Barra Esquerda)"
		tab["LID_ACTIONBAR6"] = "Barra de ação 6"
		tab["LID_ACTIONBAR7"] = "Barra de ação 7"
		tab["LID_ACTIONBAR8"] = "Barra de ação 8"
	end

	MoveAny:UpdateLanguageTab(tab)
end
