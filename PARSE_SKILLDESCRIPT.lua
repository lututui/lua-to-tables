require("skillid")
require("skilldescript")
require("ParserUtils")

skillsdescriptions = io.open("skillsdescriptions.txt", "w")
IDSK = reverseMap(SKID)

for i, entry in pairsByKeys(SKILL_DESCRIPT) do
	local skilldescriptString = IDSK[i] .. "#\n"
	
	for j, content in pairs(entry) do
		skilldescriptString = skilldescriptString .. content .. "\n"
	end
	
	skilldescriptString = skilldescriptString .. "#\n"
	
	skillsdescriptions:write(skilldescriptString)
end

skillsdescriptions:close()