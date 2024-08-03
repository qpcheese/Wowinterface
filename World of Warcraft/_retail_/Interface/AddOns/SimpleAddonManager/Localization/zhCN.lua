-- Default locale
local ADDON_NAME, PRIVATE_TABLE = ...

if GetLocale() ~= "zhCN" then
	return
end

local L = PRIVATE_TABLE.L

--[[Translation missing --]]
L["${n} seconds"] = "${n} seconds"
L["(Automatically in category)"] = "自动分类"
--[[Translation missing --]]
L["Active Addons"] = "Active Addons"
L["Add search results to category"] = "将搜索结果添加至类别"
--[[Translation missing --]]
L["AddOn binary search"] = "AddOn binary search"
L["Addons being modified"] = "被修改的插件"
L["Addons being modified in this session"] = "当前会话被修改的插件"
--[[Translation missing --]]
L["Addons enabled and loaded, or ready to be loaded on demand."] = "Addons enabled and loaded, or ready to be loaded on demand."
--[[Translation missing --]]
L["Addons not in any category. It will be taken into account if you are viewing or not auto-generated categories."] = "Addons not in any category. It will be taken into account if you are viewing or not auto-generated categories."
L["AddOns Total Memory"] = "插件内存占用合计"
--[[Translation missing --]]
L["AddOns: "] = "AddOns: "
--[[Translation missing --]]
L["Also disable Simple Addon Manager?"] = "Also disable Simple Addon Manager?"
--[[Translation missing --]]
L["Are you sure you want to remove all automatic character profiles?"] = "Are you sure you want to remove all automatic character profiles?"
L["Author"] = "作者"
L["Author: "] = "作者:"
L["Autofocus searchbar when opening the UI"] = "打开插件时自动定位到搜索栏"
L["Automatically added:"] = "自动添加:"
--[[Translation missing --]]
L["Be careful with this option, enabling/disabling Blizzard Addons might have unintended consequences!"] = "Be careful with this option, enabling/disabling Blizzard Addons might have unintended consequences!"
L["Categories"] = "类别"
L["Category created from addons metadata"] = "从插件元数据创建的类别"
L["Category Options"] = "类别选项"
--[[Translation missing --]]
L["Characters"] = "Characters"
--[[Translation missing --]]
L["Circular dependency detected!"] = "Circular dependency detected!"
--[[Translation missing --]]
L["Clear list"] = "Clear list"
--[[Translation missing --]]
L["Collapse all"] = "Collapse all"
L["Create new profile"] = "创建新配置文件"
L["Currently Disabled Addons"] = "当前已禁用的插件"
L["Currently Enabled Addons"] = "当前已启用的插件"
L["Delete"] = "删除"
L["Delete category '${category}'?"] = "删除类别 '${category}'?"
L["Delete the profile '${profile}'?"] = "删除配置文件 '${profile}'?"
--[[Translation missing --]]
L["Disable this and every AddOn that depends on it"] = "Disable this and every AddOn that depends on it"
L["Disabled Addons"] = "已禁用的插件"
--[[Translation missing --]]
L["Enable Addons"] = "Enable Addons"
--[[Translation missing --]]
L["Enable addons from the profile '${profile}'?"] = "Enable addons from the profile '${profile}'?"
L["Enable this Addon and its dependencies"] = "启用此插件及依赖"
--[[Translation missing --]]
L["Enable this and every AddOn that depends on it"] = "Enable this and every AddOn that depends on it"
L["Enabled Addons"] = "已启用的插件"
L["Enter the category name"] = "输入类别名称"
L["Enter the name for the new profile"] = "输入新配置文件名称"
L["Enter the new name for the category '${category}'"] = "为 '${category}' 输入新名称"
L["Enter the new name for the profile "] = "为配置文件输入新名称"
--[[Translation missing --]]
L["Expand all"] = "Expand all"
L["Fixed category"] = "固定类别"
L["Hide autogenerated categories"] = "隐藏自动生成的类别"
--[[Translation missing --]]
L["Hide icons"] = "Hide icons"
--[[Translation missing --]]
L["Ignore addons included in dependent profiles."] = "Ignore addons included in dependent profiles."
L["Internal name"] = "内部名称"
L["Left-click to open"] = "左键打开"
--[[Translation missing --]]
L["List Options"] = "List Options"
L["Load"] = "加载"
--[[Translation missing --]]
L["Load AddOn"] = "Load AddOn"
--[[Translation missing --]]
L["Load Profile"] = "Load Profile"
--[[Translation missing --]]
L["Load profile '${profile}' and reload UI?"] = "Load profile '${profile}' and reload UI?"
--[[Translation missing --]]
L["Load the AddOns from '${char}'?"] = "Load the AddOns from '${char}'?"
L["Load the profile '${profile}'?"] = "加载配置文件 '${profile}'?"
L["Localize autogenerated categories name"] = "本地化自动生成的类别名称"
L["Manually added:"] = "手动添加:"
--[[Translation missing --]]
L["Memory Update"] = "Memory Update"
L["Memory: "] = "内存占用:"
L["Name (improved)"] = "名称（改进）"
L["New Category"] = "新建类别"
L["None"] = "无"
--[[Translation missing --]]
L["Not Found!"] = "Not Found!"
L["Options"] = "选项"
--[[Translation missing --]]
L["Profile dependencies"] = "Profile dependencies"
L["Profiles"] = "配置文件"
L["Reload UI"] = "重载界面"
L["Remove search results from category"] = "从类别中移除搜索结果"
L["Rename"] = "重命名"
L["Replace original Addon wow menu button"] = "替换WOW原始的菜单按钮"
--[[Translation missing --]]
L["Result: ${name}"] = "Result: ${name}"
L["Results: ${results}"] = "结果: ${results}"
L["Right-click to edit"] = "右键编辑"
--[[Translation missing --]]
L["Right-click to show profile menu"] = "Right-click to show profile menu"
L["Save"] = "保存"
--[[Translation missing --]]
L["Save (*)"] = "Save (*)"
L["Save current addons in profile '${profile}'?"] = "将现有插件方案保存至配置文件 '${profile}'?"
--[[Translation missing --]]
L["Save current addons, ignoring addons included in dependent profiles, into profile '${profile}'?"] = "Save current addons, ignoring addons included in dependent profiles, into profile '${profile}'?"
L["Search By"] = "搜索方式"
--[[Translation missing --]]
L[ [=[Search in progress...
Status: enabled: ${enabled}, disabled: ${disabled}
The addon you are looking for has been disabled?]=] ] = [=[Search in progress...
Status: enabled: ${enabled}, disabled: ${disabled}
The addon you are looking for has been disabled?]=]
--[[Translation missing --]]
L["Search Options"] = "Search Options"
L["Select All"] = "全选"
L["Select None"] = "全部取消"
--[[Translation missing --]]
L["Show Blizzard addons found in dependencies"] = "Show Blizzard addons found in dependencies"
--[[Translation missing --]]
L["Show memory usage in broker/minimap tooltip"] = "Show memory usage in broker/minimap tooltip"
L["Show minimap button"] = "显示小地图图标"
L["Show versions in AddOns list"] = "在插件列表中显示版本"
L["Sort by"] = "排序方式"
--[[Translation missing --]]
L[ [=[Start binary search?
Make sure to save your profile first, just in case.]=] ] = [=[Start binary search?
Make sure to save your profile first, just in case.]=]
--[[Translation missing --]]
L["This addons is not installed!"] = "This addons is not installed!"
L["Title"] = "标题"
--[[Translation missing --]]
L["Uncategorized Addons"] = "Uncategorized Addons"
--[[Translation missing --]]
L["Update only when opening the main window"] = "Update only when opening the main window"
L["User created category"] = "用户创建的类别"
--[[Translation missing --]]
L["Utilities"] = "Utilities"
L["Version: "] = "版本:"
--[[Translation missing --]]
L["View AddOn list as dependency tree"] = "View AddOn list as dependency tree"
--[[Translation missing --]]
L["Your AddOns were restored, reload UI?"] = "Your AddOns were restored, reload UI?"

