extends Quest

class_name WatchBirdsQuest
#export(String) var tp_destination_level = $Teleporter.destination_level
#export(Vector2) var tp_destination_position = $Teleporter.destination_position

export var possible_locations = [
	Vector2(0,0),
	Vector2(10,10),
	Vector2(20,20)
]

func _init(quest_type_in):
	QuestName = "Birdwatching"
	QuestDescription = "Stare intently at some birds."
	quest_type = quest_type_in

# Inherited #

func prepare_q():
	.__prepare_q__()
	add_objectives() 

func start_q():
	.__start_q__()
	stage = 0
	QuestManager.increment_index(quest_type)
	current().start_o()

func finish_q():
	.__finish_q__()

func check_objectives():
	.__check_objectives__()

# Custom #

func add_objectives():
	var times = Global.random.randi_range(1, 3)
	for i in times:
		var position_index = Global.random.randi_range(1, possible_locations.size()) - 1
		var position = possible_locations[position_index]
		possible_locations.remove(position_index) # Each location can only be used once
		var birds = WatchBirdsObjective.new()
		birds.prepare_o(position)
		add_objective(birds)
