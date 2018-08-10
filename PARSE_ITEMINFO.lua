require("iteminfo")
require("ParserUtils")

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
