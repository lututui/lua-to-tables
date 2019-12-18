require("OngoingQuestInfoList_True")
require("ParserUtils")

quests = io.open("quests.txt", "w")

for questID, DESC in pairsByKeys(QuestInfoList) do
	local questString = questID .. "#" .. DESC.Title .. "#SG_FEEL#QUE_NOIMAGE#\n"
	
	for i, desc in ipairs(DESC.Description) do
		questString = questString .. desc
	end
	questString = questString .. "#\n"
	
	questString = questString .. DESC.Summary .. "#\n"
	questString = questString .. "\n"

	quests:write(questString)
end

quests:close()