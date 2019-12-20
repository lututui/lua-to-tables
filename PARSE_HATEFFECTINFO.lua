require("hateffectinfo")
require("ParserUtils")

hateffect_id_handle = io.open("hateffect_id_handle.txt", "w")
hateffect_name = io.open("hateffect_name.txt", "w")

for ID, EFFECTCONST in pairsByKeys(reverseMap(HatEFID)) do
	local hatEffectString = ID .. " " .. EFFECTCONST .."\n"
	hateffect_id_handle:write(hatEffectString)
	local hatEffectNameString = EFFECTCONST .. " " .. string.gsub(EFFECTCONST, "HAT_EF_", "") .. "\n"
	hateffect_name:write(hatEffectNameString)
end

hateffect_id_handle:close()
hateffect_name:close()