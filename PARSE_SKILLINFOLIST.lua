require("skillid")
require("jobinheritlist")
require("skillinfolist")
require("ParserUtils")

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