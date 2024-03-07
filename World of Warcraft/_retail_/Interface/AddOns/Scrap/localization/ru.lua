local L = LibStub('AceLocale-3.0'):NewLocale('Scrap', 'ruRU')
if not L then return end

-- main
L.Add = 'Добавить в список хлама'
L.DestroyCheapest = 'Уничтожить самый дешевый хлам'
L.DestroyJunk = 'Уничтожить весь хлам'
L.Forget = 'Забыть'
L.Junk = 'Хлам'
L.JunkList = 'Список хлама'
L.NotJunk = 'Не хлам'
L.SellJunk = 'Продать хлам'
L.Remove = 'Удалить из списка хлама'
L.ToggleMousehover = 'Поставить / снять метку хлама под курсором'

-- chat
L.Added = 'Добавлено в список хлама: %s'
L.Destroyed = 'Вы уничтожили: %s x %s'
L.Forgotten = 'Статус хлама забыт: %s'
L.SoldJunk = 'Вы продали хлама на %s'
L.Repaired = 'Вы отремонтировали свою броню за %s'
L.Removed = 'Удалено из списка хлама: %s'

-- dialogs
L.ConfirmDelete = 'Вы уверены, что хотите уничтожить весь хлам? Вы не сможете отменить это действие.'

-- options
L.GeneralDescription = 'Более тонкая настройка Scrap. Хлам не пройдет!'
L.ListDescription = 'Эти опции позволяют дополнительно настроить ваш список хлама и автоматическое обнаружение хлама.'

L.AutoSell = 'Автопродажа'
L.AutoSellTip = 'Если включено, Scrap будет автоматически продавать хлам когда вы посещаете торговца.'
L.AutoRepair = 'Авторемонт'
L.AutoRepairTip = 'Если включено, Scrap будет автоматически ремонтировать броню когда вы посещаете торговца.'
L.CharSpecific = 'Список хлама для текущего персонажа'
L.DestroyWorthless = 'Уничтожить ничего не стоящий хлам'
L.DestroyWorthlessTip = 'Если включено, Scrap будет уничтожать хлам, который ничего не стоит при продаже.'
L.GuildRepair = 'Ремонт за счет гильдии'
L.GuildRepairTip = 'Если включено, Scrap будет использовать средства гильдии для ремонта перед вашими собственными средствами.'
L.Glow = 'Подсвечивать рамки с хламом'
L.GlowTip = 'Если включено, Scrap будет подсвечивать рамки с хламом |cffBBBBBBСЕРЫМ|r цветом.'
L.Icons = 'Иконка монетки'
L.IconsTip = 'Если включено, Scrap будет отмечать хлам маленькими золотыми монетками.'
L.SellPrices = 'Цены продажи во всплывающих подсказках'
L.SellPricesTip = 'Если включено, цены на продажу предметов будут отображаться во всплывающих подсказках, даже если вы не у торговца.'
L.Learning = 'Интеллектуальное обучение'
L.LearningTip = 'Если включено, Scrap будет следить за тем, какие предметы вы часто продаете торговцу и автоматически считать их хламом.'
L.LowConsume = 'Продавать низкоуровневые расходуемые товары'
L.LowConsumeTip = 'Если включено, Scrap будет продавать |cffff2020ВСЕ|r низкоуровневые для вас расходуемые товары.'
L.LowEquip = 'Продавать низкоуровневую экипировку'
L.LowEquipTip = 'Если включено, Scrap будет продавать |cffff2020всю|r привязанную экипировку, уровень которой намного меньше, чем надетой на вас.'
L.SafeMode = 'Безопасный режим'
L.SafeModeTip = 'Если включено, Scrap не будет продавать более 12 предметов за раз, тем самым сохраняя возможность выкупа.'
L.Unusable = 'Продавать непригодную экипировку'
L.UnusableTip = 'Если включено, Scrap будет продавать |cffff2020ВСЮ|r привязанную экипировку, которую ваш персонаж никогда не сможет надеть.'
    
-- tutorials
L.Tutorial_Welcome = 'Добро пожаловать в |cffffd200Scrap|r, от |cffffd200Jaliborc|r. Это краткое руководство поможет вам избавиться от хлама.|n|nЭто сэкономит ваше время, а также место в сумке.Вы готовы начать?'
L.Tutorial_Button = 'Scrap  будет автоматически продавать весь ваш хлам всякий раз, когда вы посещаете торговца. Вы также можете вручную продать его: просто |cffffd200ЛКМ|r по кнопке Scrap.|n|n|cffffd200ПКМ|r по кнопке, чтобы вызвать дополнительные опции.'
L.Tutorial_Drag = 'Что делать если вы хотите сообщить Scrap продавать предмет или нет? Просто |cffffd200Перетащите|r его из вашей сумки на кнопку Scrap.|n|nВ качестве альтернативы, вы можете |cffffd200Назначить клавишу|r в настройках |cffffd200Главного меню|r игры. Нажмите ее при наведении на предмет.'
L.Tutorial_Visualizer = 'Чтобы увидеть какие предметы вы указали как хлам, откройте вкладку |cffffd200Scrap Visualizer|r.|n|nОбратите внимание на то, что будет отображаться только те предметы, которые были |cffffd200добавлены вами|r, а не все предметы в игре.'
L.Tutorial_Bye = 'Удачного вам путешествия, Да пребудет с тобой |cffb400ffЭпик|r. Хлам не пройдет!'
