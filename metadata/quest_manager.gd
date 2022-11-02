extends Node2D

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

func register_quest(quest: Quest, quest_type) -> Quest:
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
	return quest

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
	print("Failed to get quest id:", quest_id, " type:", quest_type)
	return null

func has_quest(quest_id, quest_type) -> bool:
	var all_quests = get_all_quests(quest_type)
	if quest_id > all_quests.size() - 1:
		print("Could not find quest id:", quest_id, " type:", quest_type, " -> index > quests.size() (", (all_quests.size() - 1), ")")
		return false
	if quest_id < 0:
		print("Could not find quest id:", quest_id, " type:", quest_type, " (id_index ", quest_id, "< -1)")
		return false
	if all_quests[quest_id] == null:
		print("Could not find quest id:", quest_id, " type:", quest_type, " (quest null)")
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
