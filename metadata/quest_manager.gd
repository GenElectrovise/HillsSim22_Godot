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

var study_quests = []
var study_index = -1
var social_quests = []
var social_index = -1
var personal_quests = []
var personal_index = -1
var future_quests = []
var future_index = -1

enum QuestTypes {
	STUDY, SOCIAL, PERSONAL, FUTURE
}

# Flow #

func notify_quests_objective_completed():
	print("notify_quests_objective_completed()")
	QuestManager.dump()
	var study = get_quest(QuestTypes.STUDY, study_index)
	if study != null:
		study.check_objectives()
	var social = get_quest(QuestTypes.SOCIAL, social_index)
	if social != null:
		social.check_objectives()
	var personal = get_quest(QuestTypes.PERSONAL, personal_index)
	if personal != null:
		personal.check_objectives()
	var future = get_quest(QuestTypes.FUTURE, future_index)
	if future != null:
		future.check_objectives()
	print("//notify_quests_objective_completed()")
	QuestManager.dump()

func check_quests():
	print("check_quests()")
	QuestManager.dump()
	var study = get_quest(QuestTypes.STUDY, study_index)
	if study != null && study.finished:
		print("Cleaning quest ", study.get_id())
		increment_index(QuestTypes.STUDY)
		study.clean_q()
		
	var social = get_quest(QuestTypes.SOCIAL, social_index)
	if social != null && social.finished:
		print("Cleaning quest ", social.get_id())
		increment_index(QuestTypes.SOCIAL)
		social.clean_q()
		
	var personal = get_quest(QuestTypes.PERSONAL, personal_index)
	if personal != null && personal.finished:
		print("Cleaning quest ", personal.get_id())
		increment_index(QuestTypes.PERSONAL)
		personal.clean_q()
		
	var future = get_quest(QuestTypes.FUTURE, future_index)
	if future != null && future.finished:
		print("Cleaning quest ", future.get_id())
		increment_index(QuestTypes.FUTURE)
		future.clean_q()
	print("//check_quests()")
	QuestManager.dump()

#

func register_quest(quest: Quest, quest_type):
	if(quest is Quest):
		match quest_type:
			QuestTypes.STUDY:
				study_quests.append(quest)
				quest.quest_id = study_quests.size() - 1
				print("Registered quest id:", quest.quest_id, " type:", quest_type)
				return quest
			QuestTypes.SOCIAL:
				social_quests.append(quest)
				quest.quest_id = social_quests.size() - 1
				print("Registered quest id:", quest.quest_id, " type:", quest_type)
				return quest
			QuestTypes.PERSONAL:
				personal_quests.append(quest)
				quest.quest_id = personal_quests.size() - 1
				print("Registered quest id:", quest.quest_id, " type:", quest_type)
				return quest
			QuestTypes.FUTURE:
				future_quests.append(quest)
				quest.quest_id = future_quests.size() - 1
				print("Registered quest id:", quest.quest_id, " type:", quest_type)
				return quest
		quest.quest_id = -1000
	print("Failed to register quest type:", quest_type, " quest:", quest)

func get(id: String):
	var parts = id.split(":")
	return get_quest(parts[1], parts[0])

func get_quest(quest_id, quest_type) -> Quest:
	match quest_type:
		QuestTypes.STUDY:
			var quest = study_quests[quest_id] if has_quest(quest_id, quest_type) else null
			return quest
		QuestTypes.SOCIAL:
			var quest =  social_quests[quest_id] if has_quest(quest_id, quest_type) else null
			return quest
		QuestTypes.PERSONAL:
			var quest =  personal_quests[quest_id] if has_quest(quest_id, quest_type) else null
			return quest
		QuestTypes.FUTURE:
			var quest =  future_quests[quest_id] if has_quest(quest_id, quest_type) else null
			return quest
	#if quest_type != -1:
	#print("Failed to get quest id:", quest_id, " type:", quest_type)
	return null

func has_quest(quest_id, quest_type) -> bool:
	var all_quests = get_all_quests(quest_type)
	if quest_id > all_quests.size() - 1:
		# print("Could not find quest id:", quest_id, " type:", quest_type, " -> index > quests.size() (", (all_quests.size() - 1), ")")
		return false
	if quest_id < 0:
		#print("Could not find quest id:", quest_id, " type:", quest_type, " (id_index ", quest_id, "< -1)")
		return false
	if all_quests[quest_id] == null:
		#print("Could not find quest id:", quest_id, " type:", quest_type, " (quest null)")
		return false
	
	return true

func get_all_quests(quest_type):
	match quest_type:
		QuestTypes.STUDY:
			return study_quests
		QuestTypes.SOCIAL:
			return social_quests
		QuestTypes.PERSONAL:
			return personal_quests
		QuestTypes.FUTURE:
			return future_quests
	print("Cannot get quests for illegal type:", quest_type)
	return null

func increment_index(quest_type):
	match quest_type:
		QuestTypes.STUDY:
			study_index += 1
			print("Incremented study_index ", str(study_index - 1), " -> ", study_index)
		QuestTypes.SOCIAL:
			social_index += 1
			print("Incremented social_index ", str(social_index - 1), " -> ", social_index)
		QuestTypes.PERSONAL:
			personal_index += 1
			print("Incremented personal_index ", str(personal_index - 1), " -> ", personal_index)
		QuestTypes.FUTURE:
			future_index += 1
			print("Incremented future_index ", str(future_index - 1), " -> ", future_index)

func get_complete_quests(quest_type):
	var quests = get_all_quests(quest_type)
	var complete = []
	for quest in quests:
		if(quest.is_complete):
			complete.append(quest)
	return complete

func get_running_quests(quest_type):
	var quests = get_all_quests(quest_type)
	var running = []
	for quest in quests:
		if(!quest.is_complete):
			running.append(quest)
	return running

func id_str(quest_type, quest_id, obj_id ):
	return str(quest_type, ":", quest_id, ":", obj_id)

func dump():
	print("QuestManager dump():")
	var all = []
	all.append_array(study_quests)
	all.append_array(social_quests)
	all.append_array(personal_quests)
	all.append_array(future_quests)
	for q in all:
		print("  ", q.get_id(), " ", q, " p=", q.prepared, " s=", q.started, " f=", q.finished)
		for o in q.objectives:
			print("    ", o.get_id(), " ", o, " p=", o.prepared, " s=", o.started, " f=", o.finished)
