extends Node

# The flow of quests is as follows:
# 1) Quests are created and added to their appropriate lists
#	Each quests is told to prepare_q
# 2) When an objective is added to a quest prepare_o should be called. 
#	This is the time for the objective to prepare resources it will need.
# 3) When it is time for the objective to begin, start_o is called
#	The objective is now "active".
# 4) When the objective knows it is finished, it marks finished=true and notifies the QuestManager that an objective has been completed
#	The QuestManager tells all quests to check whether their current objective is complete.
#	If the current objective has finished=true, it will be commanded to clean_o
#	The quest will advance to the next objective.
# 5) If the quest detects it is finished, it marks finished=true and notifies the QuestManager
#	If the QuestManager is satisfied, the quest is finished/cleaned (I haven't decided yet)

export var study_index = -1
export var social_index = -1
export var personal_index = -1
export var future_index = -1

const STUDY_GRP: String = "study_quests"
const SOCIAL_GRP: String = "social_quests"
const PERSONAL_GRP: String = "personal_quests"
const FUTURE_GRP: String = "future_quests"

enum QuestTypes {
	STUDY, SOCIAL, PERSONAL, FUTURE
}

## Signals

func s__on_quest_finished(quest_id):
	pass

##

func add_quest(quest):
	quest.add_to_group(quest.type) ##
	quest.connect()
