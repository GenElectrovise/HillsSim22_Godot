extends Node2D

class_name Quest

var QuestName = "?"
var QuestLocation = "?"

var stage
var is_started
var objectives = []
var quest_id
var quest_type

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
	if is_started:
		print("Quest ", quest_id, " cannot be started again!")
		return
	is_started = true
	
	print("Starting quest ", quest_id, ":", quest_type)
	QuestManager.increment_index(quest_type)
	stage = 0
	current()._start()
	pass

func _finish():
	pass
