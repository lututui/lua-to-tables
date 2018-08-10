require("efstids")
require("stateiconinfo")
require("ParserUtils")

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