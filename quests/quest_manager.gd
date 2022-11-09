extends Node

# A diagram for the flow of data within the Quest System can be 
# found under '${project}/quests/Quest Flow.png'

const QUESTS_GRP: String = "quests"
const STUDY_GRP: String = "study_quests"
const SOCIAL_GRP: String = "social_quests"
const PERSONAL_GRP: String = "personal_quests"
const FUTURE_GRP: String = "future_quests"

enum QuestTypes {
	STUDY, SOCIAL, PERSONAL, FUTURE
}

## Signals

# Check every Quest
# If finished, remove from quests and type_quests groups
func s__on_quest_finished():
	for quest in get_tree().get_nodes_in_group(QUESTS_GRP):
		if quest.finished:
			quest.i__clean()
	pass

##

func add_quest(quest: Quest):
	if quest.type != -1:
		var qgn = get_quest_group_name(quest.type)
		quest.add_to_group(QUESTS_GRP)
		quest.add_to_group(qgn)
		quest.connect("quest_finished", self, "s__on_quest_finished")

func get_quest_group_name(type) -> String:
	if type == QuestTypes.STUDY:
		return STUDY_GRP
	elif type == QuestTypes.SOCIAL:
		return SOCIAL_GRP
	elif type == QuestTypes.PERSONAL:
		return PERSONAL_GRP
	elif type == QuestTypes.FUTURE:
		return FUTURE_GRP
	else:
		return "no_group_name"
