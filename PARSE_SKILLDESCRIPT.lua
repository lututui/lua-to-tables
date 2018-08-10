require("skillid")
require("skilldescript")

function reverseMap(map)
	local newMap = {}
	
	for k, v in pairs(map) do
		newMap[v] = k
	end
	
	return newMap
end

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