extends Quest

class_name WatchBirdsQuest
#export(String) var tp_destination_level = $Teleporter.destination_level
#export(Vector2) var tp_destination_position = $Teleporter.destination_position

var possible_locations = [
	Vector2(30,30),
	Vector2(30,60),
	Vector2(30,90)
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
	QuestManager.study_index = quest_id
	current().start_o()

func clean_q():
	.__clean_q__()

func check_objectives():
	.__check_objectives__()

# Custom #

func add_objectives():
	var times = Global.random.randi_range(1, 3)
	for i in times:
		if possible_locations.size() > 0:
			var position_index = Global.random.randi_range(0, possible_locations.size() - 1)
			var position = possible_locations[position_index]
			possible_locations.remove(position_index) # Each location can only be used once
			var birds = WatchBirdsObjective.new()
			birds.prepare_o(position)
			add_objective(birds)
	
	QuestManager.dump()
