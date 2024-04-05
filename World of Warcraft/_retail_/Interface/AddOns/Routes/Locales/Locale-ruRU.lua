﻿-- THIS CONTENTS OF THIS FILE IS AUTO-GENERATED BY THE WOWACE PACKAGER
-- Please use the Localization App on WoWAce to update this
-- at http://www.wowace.com/projects/routes/localization/

local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("Routes", "ruRU")
if not L then return end

L[" Data"] = "Данные"
L[" Gatherer/HandyNotes currently does not support callbacks, so this is impossible for Gatherer/HandyNotes."] = "Gatherer/HandyNotes в данный момент не поддерживают обратные вызовы, так что для Gatherer/HandyNotes это невозможно."
L["%s - Node %d"] = "%s - Точка %d"
L["|cffffd200     %d|r node(s) are at |cffffd2000|r yards of a cluster point"] = "|cffffd200 %d|r точек сбора находятся в |cffffd2000|r ярдах от кластера"
L["|cffffd200     %d|r node(s) are between |cffffd200%d|r-|cffffd200%d|r yards of a cluster point"] = "|cffffd200 %d|r точек сбора находятся в |cffffd200%d|r–|cffffd200%d|r ярдах от кластера"
L["A route with that name already exists. Overwrite?"] = "Маршрут с таким именем уже существует. Перезаписать?"
L["A taboo with that name already exists. Overwrite?"] = "Запретная зона с таким именем уже существует. Перезаписать?"
L["Add"] = "Добавить"
L["Add node after (green)"] = "Добавить узел после (зеленый)"
L["Add node before (red)"] = "Добавить узел до (красный)"
L["Always show"] = "Всегда показывать"
L["An updated copy of TomTom is required for TomTom integration to work"] = "Для работы интеграции с TomTom требуется обновленная версия TomTom"
L["Archaeology"] = "Археология"
L["Are you sure you want to delete this route?"] = "Вы уверены, что хотите удалить этот маршрут?"
L["Are you sure you want to delete this taboo? This action will also remove the taboo from all routes that use it."] = "Вы уверены, что хотите удалить эту запретную зону? Это действие также удалит её из всех использующих её маршрутов."
L["Are you sure you want to recreate this route? This will delete all customized settings for this route."] = "Вы уверены, что хотите пересоздать этот маршрут? Это удалит все настройки для этого маршрута."
L["Auto show and hide routes based on your professions"] = "Автоскрытие маршрутов на основе ваших профессий"
L["Auto show/hide"] = "Автоскрытие"
L["Auto Show/Hide per route type"] = "Автоскрытие по типу маршрута"
L["Auto Show/Hide settings"] = "Настройки автоскрытия"
L["Automatic route updating"] = "Автоматическое обновление маршрута"
L["AUTOMATIC_UPDATE_TEXT"] = [=[Routes автоматически обновляет ваши маршруты и добавляет/удаляет узлы, когда это требуется, если в качестве источников данных вы используете |cffffff78GatherMate|r или |cffffff78Cartographer_<Profs>|r. |cffffff78Gatherer/HandyNotes|r не поддерживаются, так как в данный момент они не поддерживают обратные вызовы.

Когда вы находите новый узел в любом из этих дополнений, Routes просматривает зону в поисках существующих маршрутов соответствующего типа и вставляет узел в лучшее место маршрута. Аналогично, когда вы удаляете узел в этих дополнениях, Routes также удаляет узел из соответствующего маршрута.

Движение существующего положения узлов на несколько ярдов отрабатывается как удаление узла с последующей его вставкой. Фактически это делается так же, как и в дополнениях GatherMate и Cartographer_<Profs>.

Для отмены такого автоматического поведения вы можете выключить это в настройках, следуя следующим шагам:

|cffffff781.|r Найдите |cffffff78Routes|r в корне дерева слева экрана настроек.

|cffffff782.|r Снимите галочки рядом с соответствующими источниками данных.
]=]
L["Background"] = "В фоне"
L["Background Disclaimer"] = "Это будет создавать маршрут в фоне, что гораздо медленее, чем при блокировании WoW. В любом случае, это заметно снизит производительность WoW."
L["Background Route Clustering completed."] = "Кластеризация в фоне завершена"
L["Cancel route edit"] = "Отменить редактирование маршрута"
L["Cancel taboo edit"] = "Отменить редактирование запретной зоны"
L["Cartographer_Waypoints module is missing or disabled"] = "Модуль Cartographer_Waypoints отсутствует или отключен"
L["Change default hidden route color"] = "Изменить цвет скрытых маршрутов по умолчанию"
L["Change default route color"] = "Изменить цвет маршрутов по умолчанию"
L["Change direction (TomTom)"] = "Изменить направление (TomTom)"
L["Change the line color"] = "Изменить цвет линии"
L["Cluster"] = "Кластер"
L["Cluster (in Background)"] = "Кластер (в фоне)"
L["Cluster Radius"] = "Радиус кластера"
L["Cluster this route"] = "Кластеризовать этот маршрут"
L["Cluster this route in the background"] = "Кластеризовать этот маршрут в фоне"
L["CLUSTER_DESC"] = "Кластеризация маршрута означает, что будет построен маршрут, проходящий возле всех точек, а находящиеся рядом точки будут объединены в одну. Этот процесс займет время, хотя и достаточно небольшое."
L["CLUSTER_RADIUS_DESC"] = "Максимальное расстояние от точки до точки кластера. По умолчанию 60 ярдов, потому что зона детекции составляет 80 ярдов."
L["Color of lines"] = "Цвета линий"
L["Create Bare Route"] = "Создать начальный маршрут"
L["Create Route"] = "Создать маршрут"
L["Create Route from Data Sources"] = "Создать маршрут из источников данных"
L["Create Taboo"] = "Создать запретную зону"
L["CREATE_BARE_ROUTE_DESC"] = "Это создаст начальный маршрут только с 3 точками, в нем не будут использованы никакие данные источников. Вы можете вручную редактировать маршрут для добавления и удаления узлов."
L["CREATE_ROUTE_TEXT"] = [=[Создание маршрута состоит из 4 простых шагов. Сначала найдите секцию |cffffff78Add|r слева.

|cffffff781.|r Введите название маршрута и нажмите |cffffff78ENTER|r или щелкните по кнопке |cffffff78OK|r.

|cffffff782.|r Выберите локацию для создания в ней маршрута.

|cffffff783.|r Выберите источники данных.

|cffffff784.|r Выберите тип данных, использующихся в вашем маршруте.


|cffffd200Примечания:|r

*Важно нажать |cffffff78ENTER|r или щелкнуть кнопку |cffffff78OK|r при вводе названия маршрута, иначе он не будет сохранен.

* Если маршрут успешно создан, вы увидите розовые линии, покрывающие выбранную локацию на карте мира. Запись для каждого будет создана слева под надписью Маршруты. Начальный маршрут не оптимизирован и нуждается в оптимизации.
]=]
L["CREATE_TABOOS_TEXT"] = [=[|cffffff78Запретные области|r представляют собой области (2D многоугольники) на карте, которые легко позволяют дать понять Routes, что они должны быть проигнорированы. Когда такие области определены, Routes активно игнорирует любые точки в этих областях, и предпринимает дополнительные усилия, чтобы созданные пути не пересекали эти области. Это широко используется для отметки таких мест, через которые нежелательно ходить, а именно парящие острова, пещеры, высокие горы, вражеские города и т.д.

Запретные области создаются следующим образом:

|cffffff781.|r Найдите |cffffff78Taboos|r в корне меню на левом экране настроек.

|cffffff782.|r Введите имя запретной области и нажмите |cffffff78ENTER|r или щелкните по кнопке |cffffff78OK|r.

|cffffff783.|r Выберите имя локации в выпадающем списке для создания в ней запретной зоны.

|cffffff784.|r Щелкните по |cffffff78Create Taboo|r.

|cffffff785.|r Найдите созданную зону на левой панели настроек в меню |cffffff78Taboos|r.

|cffffff786.|r Щелкните по кнопке |cffffff78Edit taboo region|r.

|cffffff787.|r Откройте карту и выберите, если необходимо, нужную локацию для запретной зоны.

|cffffff788.|r  Вы сможете увидеть треугольную затененную область на карте мира. Отредактируйте запретную зону путем
а) |cffffff78перетаскивания|r вершин многоугольника;
б) добавления вершины в многоугольник щелчком  |cffffff78ЛКМ|r между вершинами;
в) удаления вершины из многоугольника щелчком |cffffff78ПКМ|r по существующей вершине.

|cffffff789.|r  Щелкните по кнопке |cffffff78Save taboo edit|r, чтобы сохранить изменения, или по кнопке |cffffff78Cancel taboo edit|r, чтобы не сохранять их.

Запретные области могут накладываться друг на друга, пересекаться между собой и содержать любое количество точек по вашему желанию. Это значит, что вы можете создавать очень сложные и точные запретные области, если захотите.

|cffffd200Примечания:|r

*Однажды созданную запретную зону вы можете прикрепить к существующему маршруту в его настройках. Вы должны заново оптимизировать маршрут после прикрепления или удаления запретной зоны из маршрута.

*Редактирование запретной зоны будет влиять на все маршруты, её использующие, также удаление запретной зоны удалит её из всех использующих её маршрутов.
]=]
L["Creating a route"] = "Создание маршрута"
L["Creating a taboo region"] = "Создание запретной области"
L["Customizing route display"] = "Настройка отображения маршрута"
L["CUSTOMIZING_ROUTE_TEXT"] = [=[Вы можете легко настроить отображение ваших маршрутов на карте. Настройки состоят из двух частей. Раздел |cffffff78Options|r слева содержит глобальные настройки, применяемые к всему,  |cffffff78Line Settings|r – настройки для каждого отдельного маршрута, этот раздел можно использовать для редактирования настроек, отличных от глобальных.

Для прорисовки карты вы уможете указать на каких картах Routes должен отрисовывать ваши маршруты, а также их цвет и толщину линий. Дополнительно вы можете указать, должны ли линии на миникарте отображаться пунктиром, накладываться на стрелку слежения и иконки точек, расставленных |cffffff78GatherMate|r/|cffffff78Cartographer|r/|cffffff78Gatherer|r/|cffffff78HandyNotes|r.

Каждому маршруту с помощью настроек может быть назначен уникальный цвет и толщина линии, он также может быть полностью скрыт. Это позволяет вам отмечать маршруты, которые вы больше не хотите использовать, но не хотите удалять из отображения на картах. Настройка |cffffff78Show hidden routes|r в глобальных настройках может быть использована для прекрытия индивидуальной настройки маршрута.

Также вы можете выбрать |cffffff78Auto show/hide|r  маршруты на основе типа узлов, которые они содержат, такие как узлы горного дела или травничества, выбрать отображение маршрута только если вы владеете данными профессиями, отображение маршрута только при включении данной способности, всегда отображать маршруты или никогда их не отображать. Если маршрут содержит несколько типов точек, он будет показан, пока хотя бы один тип удовлетворяет условиям отображения.


]=]
L["Default route"] = "Маршрут по умолчанию"
L["Delete"] = "Удалить"
L["Delete node"] = "Удалить точку"
L["Delete Taboo"] = "Удалить запрет"
L["Delete this taboo region permanently. This will also remove it from all routes that use it."] = "Навсегда удалить запретную область. Это также удалит её из всех маршрутов."
L["Direction changed"] = "Направление изменено"
L["Do not draw gaps for clustered node points in routes."] = "Не отрисовывать расстояния между кластерами на маршрутах."
L["Draw line gaps"] = "Отрисовывать расстояния"
L["Draw on minimap when indoors"] = "Отображать на миникарте при нахождении внутри зданий"
L["Edit route"] = "Редактировать маршрут"
L["Edit Route Manually"] = "Редактировать маршрут вручную"
L["Edit taboo region"] = "Редактировать запретную зону"
L["Edit this route on the world map"] = "Редактировать маршрут на карте"
L["Edit this taboo region on the world map"] = "Редактировать запретную зону на карте"
L["Extra optimization"] = "Дополнительная оптимизация"
L["ExtractGas"] = "Газ"
L["ExtraOptDesc"] = "Включение этой опции делает оптимизацию на ~40% длительнее, но созданные маршруты становятся немного лучше. Рекомендуется выключить."
L["FAQ"] = "ЧаВо"
L["Fishing"] = "Рыбалка"
L["Foreground"] = "В высоком приоритете"
L["Foreground Disclaimer"] = "Сгенерировать близкий к оптимальному путь для набора точек этого маршрута. Пожалуйста, имейте в виду, что эта операция может привести к «подвисанию». Может даже произойти дисконнект, это зависит от количества точек (зависимости экспоненциальная) и скорости процессора."
L["Frequently Asked Questions"] = "Часто задаваемые вопросы"
L["GathererHERB"] = "Травничество"
L["GathererMINE"] = "Горное дело"
L["GathererOPEN"] = "Сокровища"
L["GatherMate2Archaeology"] = "Археология"
L["GatherMate2Extract Gas"] = "Извлечение газа"
L["GatherMate2Fishing"] = "Рыболовство"
L["GatherMate2Herb Gathering"] = "Травничество"
L["GatherMate2Logging"] = "Лесозаготовки"
L["GatherMate2Mining"] = "Горное дело"
L["GatherMate2Treasure"] = "Сокровища"
L["Help File"] = "Файл помощи"
L["Herbalism"] = "Травничество"
L["Hidden route"] = "Скрытый маршрут"
L["Hide Route"] = "Скрыть маршрут"
L["Hide the route from being shown on the maps"] = "Скрыть маршрут из отображаемых сейчас на картах"
L["Information"] = "Информация"
L["Integrated support options for TomTom"] = "Настройки встроенной поддержки для TomTom"
L["Line Color"] = "Цвет линии"
L["Line gaps"] = "Пробелы линии"
L["Line Settings"] = "Настройки линии"
L["Logging"] = "Лесозаготовки"
L["Map Drawing"] = "Прорисовка карты"
L["Minimap"] = "Миникарта"
L["Minimap drawing"] = "Прорисовка миникарты"
L["Minimap when indoors"] = "Миникарта внутри зданий"
L["Mining"] = "Горное дело"
L["Name of Route"] = "Название маршрута"
L["Name of Taboo"] = "Название запретной зоны"
L["Name of taboo region to add"] = "Название запретной зоны для добавления"
L["Name of the route to add"] = "Название маршрута для добавления"
L["Never show"] = "Никогда не показывать"
L["No data found"] = "Данные не найдены"
L["No data selected for new route"] = "Нет данных для нового маршрута"
L["No name given for new route"] = "Не введено название нового маршрута"
L["No name given for new taboo region"] = "Не введено название новой запретной зоны"
L["Normal lines"] = "Нормальные линии"
L["Note"] = "Примечание"
L["Now running route clustering in the background..."] = "Производим кластеризацию в фоне..."
L["Now running TSP in the background..."] = "Сейчас оптимизация запущена в фоне...."
L["Only while tracking"] = "Только при отслеживании"
L["Only with profession"] = "Только для профессии"
L["Optimize Route"] = "Оптимизировать маршрут"
L["Optimizing a route"] = "Оптимизация маршрута"
L["Options"] = "Настройки"
L["Overview"] = "Обзор"
L["OVERVIEW_TEXT"] = [=[ |cffffff78Routes|r – дополнение, разработанное для того, чтобы сделать сбор ресурсов более эффективным. Это достигается созданием эффективных маршрутов сбора того, что вы хотите собрать, используя существующие данные из дополнений |cffffff78GatherMate|r, |cffffff78Cartographer_<Profs>|r или |cffffff78Gatherer|r. Эти маршруты отображаются на ваших картах, что позволяет вам легко и быстро следовать по ним.

Задача |cffffff78Travelling Salesman Problem|r (TSP) – это традиционная задача, где даны N городов и расстояния между любыми двумя из них, а задача в том, чтобы отыскать кратчайший путь для однократного посещения всех городов и возвращения в начальный. Такая же задача применима к узлам сбора в World of Warcraft для нахождения кратчайшего из возможных маршрутов для посещения каждой точки сбора в цепочке.
]=]
L["Pass %d: %d%%"] = "Проход %d: %d%%"
L["Pass %d: %d%% - %d yards"] = "Проход %d: %d%% - %d ярдов"
L["Path with %d nodes found with length %.2f yards after %d iterations in %.2f seconds."] = "Путь длиной %.2f ярдов из %d узлов найден после %d итераций за %.2f секунд."
L["Permanently delete a route"] = "Навсегда удалить маршрут"
L["Recreate Route"] = "Пересоздать маршрут"
L["Recreate this route with the same creation settings. NOTE: This only works for data from GatherMate2 and Gatherer."] = "Пересоздать этот маршрут с теми же настройкамми. ПРИМЕЧАНИЕ: это работает только с данными GatherMate2 и Gatherer."
L["Reset"] = "Сброс"
L["Reset the line settings to defaults"] = "Сбросить все настройки до дефолтных"
L["Route Clustering"] = "Кластеризация маршрута"
L["Route Optimizing"] = "Оптимизация маршрута"
L["ROUTE_EDIT_DESC"] = "Чтобы отредактировать маршрут, нажмите кнопку |cffffd200Edit|r. Маршрут будет отображен на карте. Перетаскивайте точки на нужные позиции, кликайте между ними левой кнопкой мыши для добавления новых точек, правой – для удаления. Закончив редактирование, нажмите кнопку |cffffd200Save|r для сохранения изменений  или кнопку |cffffd200Cancel|r для отмены. Обратите внимание: редактировать маршрут, который в этот момент оптимизируется или содержит кластеры, невозможно."
L["Routes"] = "Маршруты"
L["routes"] = "маршруты"
L["Routes in %s"] = "Маршруты в %s"
L["Routes Node Menu"] = "Меню Точки маршрутов"
L["Routes with Archaeology"] = "Археологические маршруты"
L["Routes with Fish"] = "Маршруты ловли рыбы"
L["Routes with Gas"] = "Маршруты добычи газа"
L["Routes with Herbs"] = "Маршруты сбора растений"
L["Routes with Notes"] = "Маршруты с примечаниями"
L["Routes with Ore"] = "Маршруты сбора руды"
L["Routes with Timber"] = "Маршруты заготовки древесины"
L["Routes with Treasure"] = "Маршруты сбора сокровищ"
L["Save route edit"] = "Сохранить изменения маршрута"
L["Save taboo edit"] = "Сохранить изменения запретной зоны"
L["Select data to use"] = "Выберите, какие данные использовать"
L["Select data to use in the route creation"] = "Выберите, какие данные использовать для создания маршрута"
L["Select sources of data"] = "Выберите источники данных"
L["Select taboo regions to apply:"] = "Выберите запретные зоны для:"
L["Select Zone"] = "Выбрать зону"
L["Set the width of lines on each of the maps."] = "Установите толщину линий для всех типов карт."
L["Shorten the lines drawn on the minimap slightly so that they do not overlap the icons and minimap tracking blips."] = "Укоротите линии на миникарте так, чтобы они не перекрывали значки и точки слежения."
L["Show hidden routes"] = "Отображать скрытые маршруты"
L["Show hidden routes?"] = "Отобразить скрытые маршруты?"
L["Skill-Engineering"] = "Навык-Инженерия"
L["Skill-Fishing"] = "Навык-Рыбная ловля"
L["Skill-Herbalism"] = "Навык-Травничество"
L["Skill-Mining"] = "Навык-Горное дело"
L["Skip clustered node points"] = "Пропустить кластеры"
L["Start using TomTom"] = "Начать использование TomTom"
L["Start using TomTom by finding the closest visible route/node in the current zone and using that as the waypoint"] = "Начать использование TomTom: добавить новое направление на ближайший видимый маршрут или точку в данной зоне"
L["Start using Waypoints (TomTom)"] = "Начать использование направлений (TomTom)"
L["Stop editing this route on the world map and abandon changes made"] = "Закончить редактирование маршрута на карте и отменить изменения"
L["Stop editing this route on the world map and save the edits"] = "Закончить редактирование маршрута на карте и сохранить изменения"
L["Stop editing this taboo region on the world map and abandon changes made"] = "Закончить редактирование запретной зоны на карте и отменить изменения"
L["Stop editing this taboo region on the world map and save the edits"] = "Закончить редактирование запретной зоны на карте и сохранить изменения"
L["Stop using TomTom"] = "Закончить использование TomTom"
L["Stop using TomTom by clearing the last queued node"] = "Закончить использование TomTom: удалить последнюю добавленную точку"
L["Stop using Waypoints (TomTom)"] = "Закончить использование направлений (TomTom)"
L["TABOO_DESC"] = "Запретные зоны – территории, которые вы можете добавить для того, чтобы исключать находящиеся в них точки. Создав запретную зону, вы можете прикрепить ее к  маршруту, и все точки в этой зоне будут удалены, а новые точки будет нельзя добавить."
L["TABOO_DESC2"] = "Запретные зоны – территории, которые маршруты будут игнорировать. Точки, находящиеся в них, не будут добавляться к маршрутам, а при оптимизации маршруты будут при возможности избегать пересечения запретных зон."
L["TABOO_EDIT_DESC"] = "Для редактирования запретной зоны кликните кнопку |cffffd200Edit|r. Запретная зона будет отображены на карте. Перетаскивайте точки для редактирования, кликайте правой кнопкой мыши для добавления и удаления точек. По окончании редактирования кликните кнопку |cffffd200Save|r для сохранения изменений или |cffffd200Cancel|r для отмены."
L["Taboos"] = "Запретные зоны"
L["Taboos in %s"] = "Запретные зоны в %s"
L["The cluster radius of this route is |cffffd200%d|r yards."] = "Радиус кластера на этом маршруте – |cffffd200%d|r ярдов."
L["The following error occured in the background path generation coroutine, please report to Grum or Xinhuan:"] = "Во время работы процедуры создания маршрута произошла ошибка, пожалуйста, сообщите об этом Grum или Xinhuan:"
L["There is already a TSP running in background. Wait for it to complete first."] = "Процедура оптимизации уже запущена в фоне. Сначала дождитесь её окончания."
L["These settings control the visibility and look of the drawn route."] = "Эти настройки управляют видимостью и внешним видом маршрутов."
L["This route contains |cffffd200%d|r nodes that have been tabooed."] = "Это маршрут содержит |cffffd200%d|r точек, которые запрещены."
L["This route contains the following nodes:"] = "Это маршрут содержит следующие точки:"
L["This route has |cffffd200%d|r nodes and is |cffffd200%d|r yards long."] = "На маршруте |cffffd200%d|r точек, его длина – |cffffd200%d|r ярдов."
L["This route has no taboo regions."] = "Это маршрут не содержит запретных областей."
L["This route has nodes that belong to the following categories:"] = "На маршруте есть точки, относящиеся к следующим категориям:"
L["This route has the following taboo regions:"] = "Это маршрут содержит запретные зоны:"
L["This route is a clustered route, down from the original |cffffd200%d|r nodes."] = "Этот маршрут кластеризирован, в оригинальной версии было |cffffd200%d|r точек."
L["This route is not a clustered route."] = "Этот маршрут не кластеризован."
L[ [=[This section implements TomTom support for Routes. Click Start to find the nearest node in a visible route in the current zone.
]=] ] = "Эта часть реализует поддержку TomTom в Routes. Нажмите Start, чтобы найти ближайшую точку видимого маршрута в данной зоне."
L["Toggle drawing on each of the maps."] = "Переключить отображения на каждой карте."
L["TomTom is missing or disabled"] = "TomTom не установлен или заблокирован"
L["TOO_MANY_NODES_ERROR"] = "На маршруте более 724 точек. Пожалуйста, удалите их вручную или путем кластеризации во избежание ошибок выделения памяти."
L["Treasure"] = "Сокровище"
L["Uncluster"] = "Раскластеризовать"
L["Uncluster this route"] = "Раскластеризовать этот маршрут"
L["Update distance"] = "Обновить расстояние"
L["Use Auto Show/Hide"] = "Использовать автоскрытие"
L["Waypoints (TomTom)"] = "Направления (TomTom)"
L["Waypoints Integration"] = "Интеграция направлений"
L["When the following data sources add or delete node data, update my routes automatically by inserting or removing the same node in the relevant routes."] = "Когда следующие источники добавляют или удаляют данные по точкам, обновляйте мои подходящие маршруты автоматически."
L["Width (Map)"] = "Ширина (карта)"
L["Width (Minimap)"] = "Ширина (мини-карта)"
L["Width (Zone Map)"] = "Ширина (карта зоны)"
L["Width of the line in the map"] = "Ширина линии на карте"
L["Width of the line in the Minimap"] = "Ширина линии на миникарте"
L["Width of the line in the Worldmap"] = "Ширина линии на карте мира"
L["Width of the line in the Zone Map"] = "Ширина линии на карте зоны"
L["Worldmap"] = "Карта мира"
L["Worldmap drawing"] = "Отрисовка карты мира"
L["Yards to move before triggering a minimap update"] = "Ярдов в пути до обновления миникарты"
L["You have |cffffd200%d|r route(s) in |cffffd200%s|r."] = "У вас |cffffd200%d|r маршрут(ов) в |cffffd200%s|r."
L["You have |cffffd200%d|r taboo region(s) in |cffffd200%s|r."] = "У вас |cffffd200%d|r запретных областей в |cffffd200%s|r."
L["You may not delete a route that is being optimized in the background."] = "Вы не можете удалить оптимизирующийся маршрут."
L["You may not delete a taboo that is being edited."] = "Вы не можете удалить редактируемый запрет."
L["Zone Map"] = "Карта зоны"
L["Zone Map drawing"] = "Отрисовка карты зоны"
L["Zone to create route in"] = "Зона для создания маршрута"
L["Zone to create taboo in"] = "Зона для создания запрета"

