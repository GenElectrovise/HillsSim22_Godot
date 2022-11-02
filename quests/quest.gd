extends Node

class_name Quest

export var QuestName = "?"
export var QuestDescription = "..."

var stage setget set_stage
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
		objective.quest = self
		objective.obj_id = objectives.size() - 1
		print("Added Objective ", objective.get_id(), " to Quest ", get_id())

func current() -> Objective:
	return objectives[stage]

func _start():
	if is_started:
		print("Quest ", quest_id, " cannot be started again!")
		return
	is_started = true
	print("Starting Quest ", get_id())
	QuestManager.increment_index(quest_type)
	self.stage = 0

func get_id() -> String:
	return str(quest_type, ":", quest_id)

func set_stage(s: int):
	print("Changing Quest ", get_id(), " stage ", stage, " -> ", s)
	stage = s

func _finish():
	pass
