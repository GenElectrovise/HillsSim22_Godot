extends Node

func _ready():
	var quest = QuestManager.register_quest(WatchBirdsQuest.new(QuestManager.QuestTypes.STUDY), QuestManager.QuestTypes.STUDY)
	quest.prepare_q()
	quest.start_q()
	
	GUI.HUD.visible = true
	pass # Replace with function body.

func is_pausable():
	return true
