extends Node2D

class_name Objective

export var ObjectiveDescription: String = "?"
export var ObjectiveLocation: String = "?"
export var ObjectiveImage: Texture = load("res://assets/gui/exclamation_mark.png")

var started: bool = false
var prepared: bool = false
var finished: bool = false
var quest
var obj_id: int

# Set up things which the objective needs, such as a location, without starting the objective
# Done when added to a Quest 
func __prepare_o__():
	if prepared:
		push_error(str("Objective ", get_id(), " should not be prepared again!"))
	prepared = true
	print("Preparing Objective ", get_id())
	pass

# Start the objective, for example spawning relevant NPCs
func __start_o__():
	if started:
		push_error(str("Objective ", get_id(), " should not be started again!"))
	started = true
	print("Starting Objective ", get_id())
	pass

# Clean-up the objective, for example removing spawned NPCs
func __finish_o__():
	if finished:
		push_error(str("Objective ", get_id(), " should not be finished again!"))
	finished = true
	print("Finishing Objective ", get_id())
	if quest.current() != self:
		push_error(str("Objective ", get_id(), " is trying to finish out of turn!"))
	quest.__refresh_objectives__()

func get_id():
	return str(quest.get_id() if quest != null else "?:?", ":", obj_id)

