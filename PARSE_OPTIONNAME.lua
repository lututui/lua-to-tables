require("enumvar")
require("addrandomoptionnametable")
require("ParserUtils")

item_options = io.open("item_options.txt", "w")
IDEnum = tableKeyMapDeconstruct(reverseMap(EnumVAR), 1)

for k,v in pairsByKeys(NameTable_VAR) do
	if (IDEnum[k] ~= "EnumVAR_LAST") then
		item_options:write(IDEnum[k] .. "#" .. v:gsub(" \n ", " "):gsub(" \n", ""):gsub("\n ", "") .. "#\n")
	end
end

item_options:close()