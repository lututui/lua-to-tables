require("efstids")
require("stateiconinfo")

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

HANDLES = reverseMap(EFST_IDs)

statusnametable = io.open("statusnametable.txt", "w")

for i, content in pairsByKeys(StateIconList) do
	if (content["descript"][1][1] ~= "%s") then
		statusnametable:write(HANDLES[i] .. " " .. content["descript"][1][1] .. "\n")
	else
		statusnametable:write(HANDLES[i] .. " " .. content["descript"][2][1] .. "\n")
	end
end

statusnametable:close()