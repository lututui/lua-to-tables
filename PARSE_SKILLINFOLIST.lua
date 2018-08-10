require("skillid")
require("jobinheritlist")
require("skillinfolist")

function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
    end
    return iter
end

skillnametable = io.open("skillnametable.txt", "w")
skillssp = io.open("skillssp.txt", "w")

for i, content in pairsByKeys(SKILL_INFO_LIST) do
	skillnametable:write(content[1] .. "#" .. content["SkillName"] .. "#\n")
	
	local passive = 0
	
	if (table.getn(content["SpAmount"]) == 0 or (table.getn(content["SpAmount"]) > 0 and content["SpAmount"][1] == 0)) then
		passive = 1
	end
	
	if (passive == 0) then
		skillssp:write(content[1] .. "#\n")
		
		for j, sp in pairs(content["SpAmount"]) do
			skillssp:write(sp .. "#\n")
		end
		
		skillssp:write("@\n")
	end
end

skillnametable:close()
skillssp:close()