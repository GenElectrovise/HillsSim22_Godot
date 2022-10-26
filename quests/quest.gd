extends Node2D

class_name Quest

var stage
var is_started
var objectives = []
var quest_id

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_objective(objective):
	if(objective is Objective):
		objectives.append(objective)
		objective.quest_id = quest_id
		objective.obj_id = objectives.size() - 1

func current() -> Objective:
	return objectives[stage]

func _start():
	assert(!is_started, str("Quest ", quest_id, " cannot be started twice!"))
	print("Starting quest ", quest_id)
	stage = 0
	current()._start()
	pass

func _finish():
	pass
