extends Quest

class_name WatchBirdsQuest
#export(String) var tp_destination_level = $Teleporter.destination_level
#export(Vector2) var tp_destination_position = $Teleporter.destination_position

func _on_Area2D_area_entered(area):
	pass # Replace with function body.

func _start():
	var times = Global.random.randi_range(1, 3)
	for i in times:
		var birds = WatchBirdsObjective.new()
		add_objective(WatchBirdsObjective.new())
		._start()
