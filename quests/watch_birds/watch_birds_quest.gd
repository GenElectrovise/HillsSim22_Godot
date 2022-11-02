extends Quest

class_name WatchBirdsQuest
#export(String) var tp_destination_level = $Teleporter.destination_level
#export(Vector2) var tp_destination_position = $Teleporter.destination_position

func _init(quest_type_in):
	QuestName = "Birdwatching"
	QuestDescription = "Stare intently at some birds."
	quest_type = quest_type_in

func _on_Area2D_area_entered(area):
	pass # Replace with function body.

func _start():
	._start()
	var times = Global.random.randi_range(1, 3)
	for i in times:
		var birds = WatchBirdsObjective.new()
		add_objective(birds)
	current()._start()
