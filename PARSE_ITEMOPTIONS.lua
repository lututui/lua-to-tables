require("enumvar")
require("addrandomoptionnametable")
require("ParserUtils")

idHandle = io.open("ITEMOPTION_id_handle.txt", "w")
options = io.open("item_options.txt", "w")

for ID, Desc in pairsByKeys(EnumVAR) do
	local IDHANDLE = Desc[1] .. " " .. ID .. "\n"
	idHandle:write(IDHANDLE)
end

for ID, Desc in pairsByKeys(NameTable_VAR) do
	local OPTIONS = ID .. "#" .. Desc .. "#\n"
	options:write(OPTIONS)
end

idHandle:close()
options:close()