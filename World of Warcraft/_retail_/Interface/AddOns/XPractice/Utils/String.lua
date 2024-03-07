-- SOURCE: codea.io/talk/discussion/2118/split-a-string-by-return-newline
function XPRACTICE.split_lines(str)
  local t = {}
  local function helper(line) table.insert(t, line) return "" end
  helper((string.gsub(str,"(.-)\r?\n", helper)))
  return t
end

function XPRACTICE.ChangeOneCharacter(originalstring,character,index)
	local pre=string.sub(originalstring,1,index-1)
	local post=string.sub(originalstring,index+1)
	return pre..character..post
end