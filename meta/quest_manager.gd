extends Node2D

var quests = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func start_quest(quest):
	if(quest is Quest):
		quests.append(quest)
		quest.quest_id = quests.size() - 1
		quest._start()

func get_all_quests():
	return quests

func get_complete_quests():
	var complete = []
	for quest in quests:
		if(quest.is_complete):
			complete.append(quest)
	return complete

func get_running_quests():
	var running = []
	for quest in quests:
		if(!quest.is_complete):
			running.append(quest)
	return running
