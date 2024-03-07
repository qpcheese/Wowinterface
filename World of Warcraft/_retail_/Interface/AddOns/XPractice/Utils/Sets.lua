-- SOURCE: Stack Overflow 		https://stackoverflow.com/questions/1283388/lua-merge-tables
-- RCIX							https://stackoverflow.com/users/117069/rcix
-- Yu Hao						https://stackoverflow.com/users/1009479/yu-hao
-- Doug Currie					https://stackoverflow.com/users/33252/doug-currie
function XPRACTICE.MergeTables(first_table,second_table)
	for k,v in pairs(second_table) do first_table[k] = v end
end


-- SOURCE: Stack Overflow		https://stackoverflow.com/questions/20066835/lua-remove-duplicate-elements
-- Prashant Gaur				https://stackoverflow.com/users/1850358/prashant-gaur
-- Dmitry Ledentsov				https://stackoverflow.com/users/847349/dmitry-ledentsov
-- vogomatix					https://stackoverflow.com/users/1421665/vogomatix
function XPRACTICE.RemoveDuplicates(inputtable)
	local hash = {}
	local result = {}

	for _,v in ipairs(inputtable) do
	   if (not hash[v]) then
		   result[#result+1] = v
		   hash[v] = true
	   end
	end
	return result
end


-- SOURCE: wowwiki.wikia.com/wiki/USERAPI_tinsertbeforeval
function XPRACTICE.tremovebyval(tab, val)
   for k,v in pairs(tab) do
     if(v==val) then
       table.remove(tab, k)
       return true
     end
   end
   return false
end
 
function XPRACTICE.tcontains(tab,val)
    for k,v in pairs(tab) do
     if(v==val) then
       return true
     end
   end
   return false
end
