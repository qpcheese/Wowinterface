local L, _, T = 0, ...
if T.SkipLocalActionBook then return end
L, T.ActionBook.LW = T.ActionBook.LW, nil

local C, z, V, K = GetLocale(), nil
V =
    C == "deDE" and { -- 34/34 (100%)
      "Fähigkeiten", "Auch Gegenstände mit gleichem Namen nutzen", "Kampfhaustier", "Kampfhaustiere", "Kalender", "Eigenes Makro", "Reitdrache", "Ausrüstungsset", "Ausrüstungssets", "Zusätzlicher Aktionsbutton",
      "Flugreittier", "Bodenreittier", "Interface Fenster", "Gegenstand", "Gegenstände", "Makro", "Makros", "Verschiedenes", "Reittier", "Reittiere",
      "Neues Makro", "Zeige nur wenn angelegt", "Begleiterfähigkeit", "Begleiterfähigkeiten", "Zielmarkierungssymbol", "Weltmarkierung", "Markierungssymbole", "Zeige einen Platzhalter wenn nicht verfügbar", "Zauber", "Spielzeug",
      "Spielzeuge", "UI Fenster", "Benutze den höchsten bekannten Rang", "Zonenfähigkeiten",
    }
    or C == "esES" and { -- 25/34 (73%)
      "Habilidades", "Usar otros artículos con el mismo nombre", "Mascota de duelo", "Mascotas de duelo", z, "Macro personalizado", z, "Conjunto de equipamientos", "Conjuntos de equipamientos", "Botón de acción extra",
      "Montura voladora", "Monutra de tierra", z, "Artículo", "Artículos", "Macro", "Macros", "Misceláneo", "Montura", "Monturas",
      z, "Mostrar sólo al equipar", z, "Habilidades de mascota", "Marcador del mundo", "Marcador del mundo", "Marcadores del mundo", "Mostrar esta rodaja siempre", "Hechizo", "Juegete",
      z, z, z, z,
    }
    or C == "esMX" and { -- 30/34 (88%)
      "Habilidades", "Usar otros artículos con el mismo nombre", "Mascota de duelo", "Mascotas de duelo", "Calendario", "Macro personalizado", z, "Conjunto de equipamientos", "Conjuntos de equipamientos", "Botón de acción extra",
      "Montura voladora", "Monutra de tierra", z, "Artículo", "Artículos", "Macro", "Macros", "Misceláneo", "Montura", "Monturas",
      "Nueva Macro", "Mostrar sólo al equipar", "Hablidad de mascota", "Habilidades de mascota", "Marcador del mundo", "Marcador del mundo", "Marcadores del mundo", "Mostrar esta rodaja siempre", "Hechizo", "Juegete",
      "Juguetes", z, z, "Habilidades de area",
    }
    or C == "frFR" and { -- 33/34 (97%)
      "Compétences", "Également utiliser l'élément avec le même nom", "Mascotte de combat", "Mascottes de combat", "Calendrier", "Macro personnalisée", "Monture draconique", "Set d'équipement", "Équipement de sets", "Bouton d'action supplémentaire",
      "Montures volantes", "Monture terrestre", "Fenêtre", "Objet", "Objets", "Macro", "Macros", "Divers", "Monture", "Montures",
      "Nouvelle Macro", "Afficher seulement quand équipé", "Compétence du Familier", "Compétences du familier", "Marqueur de Raid", "Marqueur de Terrain", "Marqueurs de Raid", "Afficher un remplacement quand indisponible", "Sort", "Jouet",
      "Jouets", "Fenêtres", "Utiliser le rang le plus élevé connu", z,
    }
    or C == "koKR" and { -- 29/34 (85%)
      "능력", "같은 이름의 아이템 사용", "애완동물 대전", "전투 애완동물", z, "사용자 정의 매크로", z, "장비 구성", "장비 구성", "추가 행동 버튼",
      "나는 탈것", "지상 탈것", z, "아이템", "아이템", "매크로", "매크로", "기타", "탈것", "탈것",
      "새 매크로", "착용 시에만 표시", "소환수 능력", "소환수 능력", "공격대 징표", "공격대 위치 표시기", "공격대 징표", "이 조각 항상 표시", "주문", "장난감",
      "장난감", z, "알려진 최고 레벨 사용", z,
    }
    or C == "ruRU" and { -- 30/34 (88%)
      "Способности", "Использовать предметы с таким же именем", "Боевой питомец", "Боевые питомцы", "Календарь", "Пользовательские макросы", z, "Комплект экипировки", "Комплекты экипировки", z,
      "Воздушные средства передвижения", "Наземные средства передвижения", "Панель интерфейса", "Предмет", "Предметы", "Макрос", "Макросы", "Разное", "Средство передвижения", "Средства передвижения",
      "Новый Макрос", "Показывать только если надет", "Способности питомца", "Способности питомцев", "Рейдовая метка", z, "Рейдовые метки", "Всегда показывать этот фрагмент", "Заклинание", "Игрушки",
      "Игрушки", "Панели пользовательского интерфейса", "Использовать наивысший изученный ранг", z,
    }
    or C == "zhCN" and { -- 34/34 (100%)
      "技能", "同样使用具有相同名字的物品", "战斗宠物", "战斗宠物", "日历", "自定义宏", "驭龙术坐骑", "套装方案", "套装方案", "额外动作按钮",
      "飞行坐骑", "地面坐骑", "界面面板", "物品", "物品", "宏", "宏", "杂项", "坐骑", "坐骑",
      "新建宏", "仅在已装备时显示", "宠物技能", "宠物技能", "团队标记", "团队世界标记", "团队标记", "不可用时显示占位符", "法术", "玩具",
      "玩具", "UI面板", "使用已知的最高等级技能", "区域技能",
    }
    or C == "zhTW" and { -- 34/34 (100%)
      "技能", "也要使用名稱相同的物品", "戰寵", "戰寵", "行事曆", "自訂巨集", "飛龍騎術坐騎", "套裝", "套裝", "額外動作按鈕",
      "飛行坐騎", "地面坐騎", "介面視窗", "物品", "物品", "巨集", "巨集", "雜項", "坐騎", "坐騎",
      "新增巨集", "只有裝備在身上時才顯示", "寵物技能", "寵物技能", "團隊標記圖示", "團隊世界標記圖示", "團隊標記圖示", "無法使用時顯示暫代圖示", "技能", "玩具",
      "玩具", "介面視窗", "使用已學會的最高等級", "區域能力",
    }
    or C == "ptBR" and { -- 34/34 (100%)
      "Habilidades", "Também usar itens com o mesmo nome", "Batalha de mascote", "Mascotes de batalha", "Calendário", "Macro Personalizada", "Montaria de Dragonaria", "Conjunto de equipamento", "Conjuntos de equipamentos", "Botão de ação extra",
      "Montaria Voadora", "Montaria Terrestre", "Painel de Interface", "Item", "Itens", "Macro", "Macros", "Variados", "Montaria", "Montarias",
      "Novo Macro", "Apenas mostrar quando equipado", "Habilidade de Mascote", "Habilidades de Mascote", "Marcadores de Raide", "Marcadores Globais de Raide", "Marcadores de raide", "Sempre mostrar essa fatia quando indisponível", "Feitiço", "Brinquedo",
      "Bringquedos", "Painéis de UI", "Usar o mais alto ranque conhecido", "Habilidades da Zona",
    } or nil

K = V and {
      "Abilities", "Also use items with the same name", "Battle Pet", "Battle pets", "Calendar", "Custom Macro", "Dragonriding Mount", "Equipment Set", "Equipment sets", "Extra Action Button",
      "Flying Mount", "Ground Mount", "Interface Panel", "Item", "Items", "Macro", "Macros", "Miscellaneous", "Mount", "Mounts",
      "New Macro", "Only show when equipped", "Pet Ability", "Pet abilities", "Raid Marker", "Raid World Marker", "Raid markers", "Show a placeholder when unavailable", "Spell", "Toy",
      "Toys", "UI panels", "Use the highest known rank", "Zone Abilities",
}

for i=1,K and #K or 0 do
	L[K[i]] = V[i]
end