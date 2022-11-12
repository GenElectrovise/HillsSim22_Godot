extends Quest

class_name WatchBirdsQuest
#export(String) var tp_destination_level = $Teleporter.destination_level
#export(Vector2) var tp_destination_position = $Teleporter.destination_position

var possible_locations = [
	Vector3(30,30,0),
	Vector3(30,60,0),
	Vector3(30,90,0)
]

func _init(quest_type_in):
	QuestName = "Birdwatching"
	QuestDescription = "Stare intently at some birds."
	type = quest_type_in

# Inherited #

func i__start_quest():
	.i__start_quest()
	if get_tree().get_nodes_in_group(objective_group_name).size() > 0:
		get_tree().get_nodes_in_group(objective_group_name)[0].i__start_objective()
	else:
		push_error(str("Quest ", self, " attempted to i__start_quest() with no Objectives. Finishing it with i__finish_quest()"))
		i__finish_quest()

func i__clean_quest():
	.i__clean_quest()

# Custom #

func add_objectives():
	var times = Global.random.randi_range(1, 3)
	for i in times:
		if possible_locations.size() > 0:
			var position_index = Global.random.randi_range(0, possible_locations.size() - 1)
			var position = possible_locations[position_index]
			possible_locations.remove(position_index) # Each location can only be used once
			var birds: WatchBirdsObjective = WatchBirdsObjective.new(position)
			add_objective(birds)
	
	QuestManager.dump()
