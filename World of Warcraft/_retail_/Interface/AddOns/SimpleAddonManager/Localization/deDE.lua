-- Default locale
local ADDON_NAME, PRIVATE_TABLE = ...

if GetLocale() ~= "deDE" then
	return
end

local L = PRIVATE_TABLE.L

L["${n} seconds"] = "${n} Sekunden"
L["(Automatically in category)"] = "(Automatisch in Kategorie)"
L["Active Addons"] = "Aktive Addons"
L["Add search results to category"] = "Suchergebnisse zu Kategorie hinzufügen"
L["AddOn binary search"] = "Addon Binary-Suche"
L["Addons being modified"] = "Modifizierte Addons"
L["Addons being modified in this session"] = "In dieser Sitzung modifizierte Addons"
L["Addons enabled and loaded, or ready to be loaded on demand."] = "Aktive und geladene Addons (oder bereit bei Bedarf geladen zu werden)"
L["Addons not in any category. It will be taken into account if you are viewing or not auto-generated categories."] = "Addons in keiner Kategorie. Es wird berücksichtigt ob auto-generierte Kategorien aktiviet oder deaktiviert sind."
L["AddOns Total Memory"] = "Speicher aller Addons"
L["AddOns: "] = "Addons:"
L["Also disable Simple Addon Manager?"] = "Soll 'Simple Addon Manager' auch deaktiviert werden?"
--[[Translation missing --]]
L["Are you sure you want to remove all automatic character profiles?"] = "Are you sure you want to remove all automatic character profiles?"
L["Author"] = "Autor"
L["Author: "] = "Autor:"
L["Autofocus searchbar when opening the UI"] = "Suchleiste beim öffnen des UI fokussieren"
L["Automatically added:"] = "Automatisch hinzugefügt:"
L["Be careful with this option, enabling/disabling Blizzard Addons might have unintended consequences!"] = "Vorsicht! Aktivieren und Deaktivieren von Blizzard Addons kann ungewünschte Folgen haben!"
L["Categories"] = "Kategorien"
L["Category created from addons metadata"] = "Aus Addon-Metadaten erstellte Kategorie"
L["Category Options"] = "Kategorieoptionen"
L["Characters"] = "Charaktere"
L["Circular dependency detected!"] = "Zirkuläre Abhängigkeit festgestellt!"
--[[Translation missing --]]
L["Clear list"] = "Clear list"
L["Collapse all"] = "Alle einklappen"
L["Create new profile"] = "Neues Profil erstellen"
L["Currently Disabled Addons"] = "Inaktive Addons"
L["Currently Enabled Addons"] = "Aktive Addons"
L["Delete"] = "Löschen"
L["Delete category '${category}'?"] = "Kategorie '${category}' löschen?"
L["Delete the profile '${profile}'?"] = "Profil '${profile}' löschen?"
L["Disable this and every AddOn that depends on it"] = "Dieses Addon und alle davon abhängigen Addons deaktivieren"
L["Disabled Addons"] = "Addons deaktivieren"
L["Enable Addons"] = "Addons aktivieren"
L["Enable addons from the profile '${profile}'?"] = "Addons von Profil '${profile}' aktivieren?"
L["Enable this Addon and its dependencies"] = "Dieses Addon und seine Abhängigkeiten aktivieren"
L["Enable this and every AddOn that depends on it"] = "Dieses Addon und alle davon abhängigen Addons aktivieren"
L["Enabled Addons"] = "Aktivierte Addons"
L["Enter the category name"] = "Kategorienamen eingeben"
L["Enter the name for the new profile"] = "Namen für neues Profil eingeben"
L["Enter the new name for the category '${category}'"] = "Neuen Namen für Kategorie '${category}' eingeben"
L["Enter the new name for the profile "] = "Neuen Namen für das Profil eingeben"
L["Expand all"] = "Alle ausklappen"
L["Fixed category"] = "Fixierte Kategorie"
L["Hide autogenerated categories"] = "Automatisch generierte Kategorien verstecken"
--[[Translation missing --]]
L["Hide icons"] = "Hide icons"
L["Ignore addons included in dependent profiles."] = "Addons in abhängigen Profilen ignorieren"
L["Internal name"] = "Interner Name"
L["Left-click to open"] = "Linksklick zum öffnen"
L["List Options"] = "Optionen anzeigen"
L["Load"] = "Laden"
L["Load AddOn"] = "Addon laden"
L["Load Profile"] = "Profil laden"
L["Load profile '${profile}' and reload UI?"] = "Profil '${profile}' laden und UI neu laden?"
L["Load the AddOns from '${char}'?"] = "Addons von Charakter '${char}' laden?"
L["Load the profile '${profile}'?"] = "Profil '${profile}' laden?"
L["Localize autogenerated categories name"] = "Automatisch erstelle Kategorien übersetzen"
L["Manually added:"] = "Manuell hinzugefügt:"
L["Memory Update"] = "Speicher-Aktualisierungszeit"
L["Memory: "] = "Speicher:"
L["Name (improved)"] = "Name (verberssert)"
L["New Category"] = "Neue Kategorie"
L["None"] = "Nichts"
L["Not Found!"] = "Nicht gefunden!"
L["Options"] = "Optionen"
L["Profile dependencies"] = "Profilabhängigkeiten"
L["Profiles"] = "Profile"
L["Reload UI"] = "UI neu laden"
L["Remove search results from category"] = "Suchergebnisse aus Kategorie entfernen"
L["Rename"] = "Umbenennen"
L["Replace original Addon wow menu button"] = "Original WoW Addon Menü Button ersetzen"
L["Result: ${name}"] = "Ergebnis: ${name}"
L["Results: ${results}"] = "Ergebnisse: ${results}"
L["Right-click to edit"] = "Rechtklick zum bearbeiten"
L["Right-click to show profile menu"] = "Rechtsklick um das Profilmenü anzuzeigen"
L["Save"] = "Speichern"
L["Save (*)"] = "Speichern (*)"
L["Save current addons in profile '${profile}'?"] = "Aktuelle Addons im Profil '${profile}' speichern?"
L["Save current addons, ignoring addons included in dependent profiles, into profile '${profile}'?"] = "Aktuelle Addons in Profil '${profile}' speichern, dabei Addons in abhängigen Profilen ignorieren?"
L["Search By"] = "Suchen nach"
L[ [=[Search in progress...
Status: enabled: ${enabled}, disabled: ${disabled}
The addon you are looking for has been disabled?]=] ] = [=[Suche läuft...
Status: aktiviert: ${enabled}, deaktiviert: ${disabled}
Ist das gesuchte Addon deaktiviert?]=]
L["Search Options"] = "Suchoptionen"
L["Select All"] = "Alle auswählen"
L["Select None"] = "Alle abwählen"
L["Show Blizzard addons found in dependencies"] = "Blizzard-Addons in Abhängigkeiten anzeigen"
L["Show memory usage in broker/minimap tooltip"] = "Speichernutzung im Broker/Minimap Tooltip anzeigen"
L["Show minimap button"] = "Minimap-Button anzeigen"
L["Show versions in AddOns list"] = "Versionsnummer in Addon-Liste anzeigen"
L["Sort by"] = "Sortieren nach"
L[ [=[Start binary search?
Make sure to save your profile first, just in case.]=] ] = [=[Binary-Suche starten?
Stelle sicher dein Profil zuerst zu speichern.]=]
L["This addons is not installed!"] = "Dieses Addon ist nicht installiert"
L["Title"] = "Titel"
L["Uncategorized Addons"] = "Unkategorisierte Addons"
L["Update only when opening the main window"] = "Nur beim öffnen des Hauptfensters aktualisieren"
L["User created category"] = "Vom Nutzer erstellte Kategorie"
L["Utilities"] = "Dienstprogramme"
L["Version: "] = "Version:"
L["View AddOn list as dependency tree"] = "Abhängigkeiten von Addons anzeigen (Baumstruktur)"
L["Your AddOns were restored, reload UI?"] = "Deine Addons wurden wiederhergestellt, UI neu laden?"

