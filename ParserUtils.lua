function reverseMap(map)
	local newMap = {}
	
	for k, v in pairs(map) do
		newMap[v] = k
	end
	
	return newMap
end

function filterByValueType(map, fType)
	local newMap = {}
	fType = fType or "number"
	
	for k, v in pairs(map) do
		if (type(v) == fType) then
			newMap[k] = v
		end
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

function tableKeyMapDeconstruct(map, i)
	local newMap = {}
	
	for j, x in pairs(map) do
		newMap[j[i]] = x
	end
	
	return newMap
end