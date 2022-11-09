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

## API

func s__on_quest_finished(quest_id):
	pass

## Util

func register_quest(quest: Quest, quest_type):
	quest.set_meta("quest_type", quest_type)
	quest.add_to_group(get_group_name(quest_type))
	quest.connect("quest_finished", self, "s__on_quest_finished")


func get_current(type) -> Quest:
	return get_tree().get_nodes_in_group(get_group_name(type))[get_quest_index(type)]

# Signal function
# previously notify_quests_etc...
func s__on_quest_completed(quest: Quest):
	var type = quest.quest_type
	var new_index = -1
	match quest_type:
		QuestTypes.STUDY:
			study_index += 1
			new_index = study_index
		QuestTypes.SOCIAL:
			social_index += 1
			new_index = social_index
		QuestTypes.PERSONAL:
			personal_index += 1
			new_index = personal_index
		QuestTypes.FUTURE:
			future_index += 1
			new_index = future_index
		_:
			push_error(str("Cannot get_group_name for quest_type ", quest_type))
	get_tree().call_group(get_group_name(type), "g__quest_in_group_completed")
	get_tree().get_nodes_in_group(get_group_name(type))[new_index]. ## Start?


func check_quests():
	for so in SocialSet.get_children():
		if (so != null) && (so is Quest) && (so.finished):
			so.clean_q()
			social_index += 1
	for st in StudySet.get_children():
		if (st != null) && (st is Quest) && (st.finished):
			st.clean_q()
			study_index += 1
	for pe in PersonalSet.get_children():
		if (pe != null) && (pe is Quest) && (pe.finished):
			pe.clean_q()
			personal_index += 1
	for fu in FutureSet.get_children():
		if (fu != null) && (fu is Quest) && (fu.finished):
			fu.clean_q()
			future_index += 1

#

func get_group_name(quest_type) -> String:
	match quest_type:
		QuestTypes.STUDY:
			return STUDY_GRP
		QuestTypes.SOCIAL:
			return SOCIAL_GRP
		QuestTypes.PERSONAL:
			return PERSONAL_GRP
		QuestTypes.FUTURE:
			return FUTURE_GRP
		_:
			push_error(str("Cannot get_group_name for quest_type ", quest_type))
			return "no_group"

func get_quest_index(quest_type) -> int:
	match quest_type:
		QuestTypes.STUDY:
			return study_index
		QuestTypes.SOCIAL:
			return social_index
		QuestTypes.PERSONAL:
			return personal_index
		QuestTypes.FUTURE:
			return future_index
		_:
			push_error(str("Cannot get_group_name for quest_type ", quest_type))
			return -99

func id_str(quest_type, quest_id, obj_id ):
	return str(quest_type, ":", quest_id, ":", obj_id)

func dump():
	print("QuestManager dump():")
	var all = []
	all.append_array(StudySet.get_children())
	all.append_array(SocialSet.get_children())
	all.append_array(PersonalSet.get_children())
	all.append_array(FutureSet.get_children())
	for q in all:
		print("  ", q.get_id(), " ", q, " p=", q.prepared, " s=", q.started, " f=", q.finished)
		for o in q.get_children():
			print("    ", o.get_id(), " ", o, " p=", o.prepared, " s=", o.started, " f=", o.finished)
