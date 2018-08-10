require("iteminfo")

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

items = io.open("items.txt", "w")
itemsdescriptions = io.open("itemsdescriptions.txt", "w")
itemslotcounttable = io.open("itemslotcounttable.txt", "w")

for ItemID, DESC in pairsByKeys(tbl) do
	if next(DESC.identifiedDescriptionName) ~= nil then
		local itemsString = ItemID .. "#" .. DESC.identifiedDisplayName .. "#\n"
		local itemsdescriptionsString = ItemID .. "#\n"
		local itemslotcounttableString = ItemID .. "#" .. DESC.slotCount .. "#\n"
		
		for i, desc in ipairs(DESC.identifiedDescriptionName) do
			itemsdescriptionsString = itemsdescriptionsString .. desc .. "\n"
		end
		itemsdescriptionsString = itemsdescriptionsString .. "#\n"
		
		items:write(itemsString)
		itemsdescriptions:write(itemsdescriptionsString)
		if (DESC.slotCount > 0) then
			itemslotcounttable:write(itemslotcounttableString)
		end
	end
end

items:close()
itemsdescriptions:close()
itemslotcounttable:close()
