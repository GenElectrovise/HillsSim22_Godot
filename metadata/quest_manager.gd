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

onready var QuestGroups = $QuestGroups
onready var StudySet = $QuestGroups/Study
onready var SocialSet = $QuestGroups/Social
onready var PersonalSet = $QuestGroups/Personal
onready var FutureSet = $QuestGroups/Future
export var study_index = -1
export var social_index = -1
export var personal_index = -1
export var future_index = -1

enum QuestTypes {
	STUDY, SOCIAL, PERSONAL, FUTURE
}

# Flow #

func notify_quests_objective_completed():
	print("notify_quests_objective_completed()")
	QuestManager.dump()
	for set in QuestGroups.get_children():
		for q in set.get_children():
			if q is Quest:
				q.check_objectives()
	print("//notify_quests_objective_completed()")
	QuestManager.dump()

func check_quests():
	print("check_quests()")
	QuestManager.dump()
	for set in QuestGroups.get_children():
		var q = set.get_child(set.index)
		if (q != null) & (q is Quest) && (q.finished):
			print("Cleaning quest ", q.get_id())
			set.index += 1
			q.clean_q()
	
	print("//check_quests()")
	QuestManager.dump()

#

func register_quest(quest: Quest, quest_type):
	if(quest is Quest):
		match quest_type:
			QuestTypes.STUDY:
				StudySet.add_child(quest)
				quest.quest_id = StudySet.get_children().size() - 1
				print("Registered quest ", quest, " id:", quest.quest_id, " type:", quest_type)
			QuestTypes.SOCIAL:
				SocialSet.add_child(quest)
				quest.quest_id = SocialSet.get_children().size() - 1
				print("Registered quest ", quest, " id:", quest.quest_id, " type:", quest_type)
			QuestTypes.PERSONAL:
				PersonalSet.add_child(quest)
				quest.quest_id = PersonalSet.get_children().size() - 1
				print("Registered quest ", quest, " id:", quest.quest_id, " type:", quest_type)
			QuestTypes.FUTURE:
				FutureSet.add_child(quest)
				quest.quest_id = FutureSet.get_children().size() - 1
				print("Registered quest ", quest, " id:", quest.quest_id, " type:", quest_type)
			_:
				quest.quest_id = -1000
				print("Failed to register quest ", quest, " type:", quest_type, " quest:", quest)

func id_str(quest_type, quest_id, obj_id ):
	return str(quest_type, ":", quest_id, ":", obj_id)

func get_current(type):
	match type:
		QuestTypes.STUDY, "study":
			return StudySet.get_child(study_index)
		QuestTypes.SOCIAL, "social":
			return SocialSet.get_child(social_index)
		QuestTypes.PERSONAL, "personal":
			return PersonalSet.get_child(personal_index)
		QuestTypes.FUTURE, "future":
			return FutureSet.get_child(future_index)
		_:
			push_error(str("Unmatched get_current(type) ", type))

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
