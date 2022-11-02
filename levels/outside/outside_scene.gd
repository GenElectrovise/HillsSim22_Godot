extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var quest = QuestManager.register_quest(WatchBirdsQuest.new(QuestManager.QuestTypes.STUDY), QuestManager.QuestTypes.STUDY)
	quest._start()
	
	GUI.HUD.visible = true
	pass # Replace with function body.

func is_pausable():
	return true
	# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
