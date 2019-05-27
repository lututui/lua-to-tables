require("efstids")
require("ParserUtils")

ID_HANDLE_MAP = reverseMap(filterByValueType(EFST_IDs, "number"))

STATUS_id_handle = io.open("STATUS_id_handle.txt", "w")

for i, handle in pairsByKeys(ID_HANDLE_MAP) do
	STATUS_id_handle:write(i .. " " .. handle .. "\n")
end

STATUS_id_handle:close()