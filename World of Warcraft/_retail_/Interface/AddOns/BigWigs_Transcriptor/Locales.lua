-- Update at https://wow.curseforge.com/projects/bigwigs_transcriptor/localization

local _, ns = ...
local L = ns.L

local locale = GetLocale()
if locale == "ptBR" then

elseif locale == "frFR" then
L["%d stored events over %.01f seconds. %s"] = "%d évènements enregistrés durant %.01f secondes. %s"
L["|cff20ff20Win!|r"] = "|cff20ff20Victoire !|r"
L["Automatically delete logs shorter than 30 seconds."] = "Efface automatiquement les journaux de moins de 30 secondes."
L["Automatically start Transcriptor logging when you pull a boss and stop when you win or wipe."] = "Lance un enregistrement Transcriptor quand vous engagez un boss et l'arrête quand vous gagnez ou wipez, le tout automatiquement."
L["Clear All"] = "Tout effacer"
L["Delete short logs"] = "Effacer les journaux courts"
L["Ignored Events"] = "Évènements ignorés"
L["Log deleted."] = "Journal supprimé."
L["No logs recorded"] = "Aucun combat enregistré"
L["Start Transcriptor logging from a pull timer at two seconds remaining."] = "Lance la journalisation de Transcriptor quand il ne reste plus que deux secondes à un délai de pull."
L["Start with pull timer"] = "Lancer avec les délais de pull"
L["Stored logs (%s / %s) - Click to delete"] = "Combats enregistrés (%s / %s) - cliquez pour supprimer"
L["Transcriptor"] = "Transcriptor"
L["Transcriptor is currently using %.01f MB of memory. You should clear some logs or risk losing them."] = "Transcriptor utilise actuellement %.01f Mo de mémoire. Vous devriez effacer certains journaux ou vous risquez de tous les perdre."
L["Your Transcriptor DB has been reset! You can still view the contents of the DB in your SavedVariables folder until you exit the game or reload your UI."] = "La base de données de votre Transcriptor a été réinitialisée ! Vous pouvez toujours voir le contenu de la base de données dans votre répertoire SavedVariables tant que vous n'avez pas quitté le jeu ou rechargé votre interface."

elseif locale == "deDE" then
L["%d stored events over %.01f seconds. %s"] = "%d hat Ereignisse über %.01f Sekunden gespeichert. %s"
L["|cff20ff20Win!|r"] = "|cff20ff20Gewonnen!|r"
L["Automatically delete logs shorter than 30 seconds."] = "Löscht automatisch Logs, die kürzer sind als 30 Sekunden."
L["Automatically start Transcriptor logging when you pull a boss and stop when you win or wipe."] = "Die Transcriptor-Aufzeichnung wird automatisch gestartet, wenn ein Boss gepullt wird und stoppt, wenn ihr gewinnt oder sterbt. "
L["Clear All"] = "Alle löschen"
L["Delete short logs"] = "Kurze Logs löschen"
L["Ignored Events"] = "Ignorierte Ereignisse"
L["Include some spell stats and the time between casts in the log tooltip when available."] = "Fügt dem Log-Tooltip einige Zauberstatistiken und die Zeit zwischen Zaubern, falls verfügbar, hinzu."
L["Keep one log per fight"] = "Nur einen Log pro Kampf behalten"
L["Log deleted."] = "Log gelöscht."
L["No logs recorded"] = "Keine Logs aufgezeichnet"
L["Only keep a log for the longest attempt or latest kill of an encounter."] = "Behält nur einen Log für den längsten Versuch oder die letzte Tötung eines Bosses."
L["Show spell cast details"] = "Zauberdetails anzeigen"
L["Start Transcriptor logging from a pull timer at two seconds remaining."] = "Die Transcriptor-Aufzeichnung beginnt bei einem Pull-Timer, mit verbleibenden 2 Sekunden."
L["Start with pull timer"] = "Bei Pull-Timer starten"
L["Stored logs (%s / %s) - Click to delete"] = "Gespeicherte Logs (%s / %s) - Klicken, um zu löschen"
L["Transcriptor"] = "Transcriptor"
L["Transcriptor is currently using %.01f MB of memory. You should clear some logs or risk losing them."] = "Transcriptor nutzt aktuell %.01f MB Speicher. Du solltest einige Logs löschen oder du riskierst, sie zu verlieren."
L["Your Transcriptor DB has been reset! You can still view the contents of the DB in your SavedVariables folder until you exit the game or reload your UI."] = "Deine Transcriptor-Datenbank wurde zurückgesetzt! Du kannst den Inhalt der Datenbank in deinem SavedVariables-Ordner, noch so lange sehen, bis du das Spiel beendest oder dein UI neu lädst"

elseif locale == "itIT" then

elseif locale == "koKR" then
L["%d stored events over %.01f seconds. %s"] = "%.01f초 동안 %d개의 이벤트가 저장되었습니다. %s"
L["|cff20ff20Win!|r"] = "|cff20ff20승리!|r"
L["Automatically delete logs shorter than 30 seconds."] = "30초보다 짧은 기록은 자동으로 삭제합니다."
L["Automatically start Transcriptor logging when you pull a boss and stop when you win or wipe."] = "우두머리 전투를 시작하면 Transcriptor 기록을 자동으로 시작하고 승리하거나 전멸하면 중지합니다."
L["Clear All"] = "모두 초기화"
L["Delete short logs"] = "짧은 기록 삭제"
L["Ignored Events"] = "무시하는 이벤트"
L["Include some spell stats and the time between casts in the log tooltip when available."] = "사용 가능할 때 기록에 몇몇 주문 시전과 시전 사이의 시간을 포함합니다."
L["Keep one log per fight"] = "전투 별 하나의 기록 유지"
L["Log deleted."] = "기록이 삭제되었습니다."
L["No logs recorded"] = "기록된 기록이 없습니다"
L["Only keep a log for the longest attempt or latest kill of an encounter."] = "우두머리 전투의 가장 긴 시간 진행이나 가장 최근 처치 기록만 유지합니다."
L["Show spell cast details"] = "주문 시전 세부 내용 표시"
L["Start Transcriptor logging from a pull timer at two seconds remaining."] = "전투 시작 타이머가 2초 남았을 때 Transcriptor 기록을 시작합니다."
L["Start with pull timer"] = "전투 시작 타이머로 시작"
L["Stored logs (%s / %s) - Click to delete"] = "저장된 기록 (%s / %s) - 삭제하려면 클릭"
L["Transcriptor"] = "Transcriptor"
L["Transcriptor is currently using %.01f MB of memory. You should clear some logs or risk losing them."] = "Transcriptor는 현재 %.01fMB의 메모리를 사용 중입니다. 몇몇 기록을 초기화하지 않으면 기록 손실의 위험이 있습니다."
L["Your Transcriptor DB has been reset! You can still view the contents of the DB in your SavedVariables folder until you exit the game or reload your UI."] = "당신의 Transcriptor DB가 초기화 되었습니다! 게임을 종료하거나 UI를 다시 불러오기 전까지 당신의 SavedVariables 폴더에 있는 DB의 내용을 확인할 수 있습니다."

elseif locale == "esMX" then

elseif locale == "ruRU" then

elseif locale == "zhCN" then
L["%d stored events over %.01f seconds. %s"] = "%d 已储存超过%.01f秒的事件。%s"
L["|cff20ff20Win!|r"] = "|cff20ff20获胜！|r"
L["Automatically delete logs shorter than 30 seconds."] = "自动删除少于30秒的记录。"
L["Automatically start Transcriptor logging when you pull a boss and stop when you win or wipe."] = "随首领战自动开始 Transcriptor 纪录，并在灭团或击败后自动停止。"
L["Clear All"] = "清除全部"
L["Delete short logs"] = "删除短记录"
L["Ignored Events"] = "忽略事件"
L["Include some spell stats and the time between casts in the log tooltip when available."] = "在可用情况下纪录某些法术施法的时间和细节。"
L["Keep one log per fight"] = "每场只保存一份"
L["Log deleted."] = "记录已删除。"
L["No logs recorded"] = "无记录录入"
L["Only enable logging while in a raid instance."] = "只在团队地城副本中纪录日志。"
L["Only keep a log for the longest attempt or latest kill of an encounter."] = "每个首领只保存战斗时间最久或最后成功击杀的纪录。"
L["Raid only"] = "只在团队副本内启用"
L["Show spell cast details"] = "显示法术施放细节"
L["Start Transcriptor logging from a pull timer at two seconds remaining."] = "拉怪计时器剩余2秒时开启 Transcriptor 记录。"
L["Start with pull timer"] = "跟随开怪计时器启用"
L["Stored logs (%s / %s) - Click to delete"] = "储存的日志（%s / %s） - 点击删除"
L["Transcriptor"] = "Transcriptor 记录器"
L["Transcriptor is currently using %.01f MB of memory. You should clear some logs or risk losing them."] = "Transcriptor纪录器已使用了 %.01f MB 內存。你应该清理一些纪录，否则可能丢失它们。"
L["Your Transcriptor DB has been reset! You can still view the contents of the DB in your SavedVariables folder until you exit the game or reload your UI."] = "你的 Transcriptor 数据库已被重置！你仍然可以在你的 SavedVariables文件夹查看中数据库的内容，直到你退出游戏或重新加载用户界面。"

elseif locale == "esES" then
L["%d stored events over %.01f seconds. %s"] = "%d eventos almacenados durante %.01f segundos. %s"
L["|cff20ff20Win!|r"] = "|cff20ff20¡Victoria!|r"
L["Automatically start Transcriptor logging when you pull a boss and stop when you win or wipe."] = "Transcriptor automáticamente empezará a grabar cuando pulees un jefe y parará cuando lo derrotes o wipees."
L["Ignored Events"] = "Eventos ingorados"
L["No logs recorded"] = "No hay logs registrados"
L["Stored logs (%s / %s) - Click to delete"] = "Logs almacenados (%s / %s) - Click para borrar"
L["Transcriptor"] = "Transcriptor"
L["Your Transcriptor DB has been reset! You can still view the contents of the DB in your SavedVariables folder until you exit the game or reload your UI."] = "¡Tu base de dados ha sido reiniciada! Aún puedes ver el contenido de la base de datos en tu carpeta SavedVariables hasta que salgas del juego o recargues tu interfaz."

elseif locale == "zhTW" then
L["%d stored events over %.01f seconds. %s"] = "%d 已儲存超過%.01f秒的事件。 %s"
L["|cff20ff20Win!|r"] = "|cff20ff20獲勝！|r"
L["Automatically delete logs shorter than 30 seconds."] = "自動刪除未達30秒的日誌"
L["Automatically start Transcriptor logging when you pull a boss and stop when you win or wipe."] = "隨首領戰開始自動紀錄 Transcriptor 日誌，並在滅團或擊敗後自動停止。"
L["Clear All"] = "全部刪除"
L["Delete short logs"] = "刪除過短日誌"
L["Ignored Events"] = "忽略事件"
L["Include some spell stats and the time between casts in the log tooltip when available."] = "在可用情況下紀錄某些法術施法的時間和細節。"
L["Keep one log per fight"] = "每場只保存一份"
L["Log deleted."] = "紀錄刪除。"
L["No logs recorded"] = "無日誌記錄"
L["Only enable logging while in a raid instance."] = "只在團隊地城副本中紀錄日誌。"
L["Only keep a log for the longest attempt or latest kill of an encounter."] = "每個首領只保存戰鬥時間最久或最後成功擊殺的紀錄。"
L["Raid only"] = "只在團隊副本內啟用"
L["Show spell cast details"] = "顯示施法細節"
L["Start Transcriptor logging from a pull timer at two seconds remaining."] = "在開怪倒數剩餘兩秒時開始紀錄日誌。"
L["Start with pull timer"] = "隨倒數計時啟動"
L["Stored logs (%s / %s) - Click to delete"] = "儲存的日誌（%s / %s） - 點擊刪除"
L["Transcriptor"] = "Transcriptor 記錄器"
L["Transcriptor is currently using %.01f MB of memory. You should clear some logs or risk losing them."] = "Transcriptor紀錄器已使用了 %.01f MB 記憶體。你應該清理一些日誌，否則可能丟失它們。"
L["Your Transcriptor DB has been reset! You can still view the contents of the DB in your SavedVariables folder until you exit the game or reload your UI."] = "你的 Transcriptor 紀錄檔已被重置！你仍然可以在你的SavedVariables資料夾中查看已紀錄的日誌，直到你退出遊戲或重新載入你的UI。"

end
