class_name Objective extends Node2D

export var ObjectiveDescription: String = "?"
export var ObjectiveLocation: String = "?"
export var ObjectiveImage: Texture = load("res://assets/gui/exclamation_mark.png")

export var started: bool = false setget set_started, get_started
export var prepared: bool = false setget set_prepared, get_prepared
export var finished: bool = false setget set_finished, get_finished
export var obj_id: int

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
func __clean_o__():
	if !finished:
		push_error(str("Objective ", get_id(), " is being cleaned while not finished!"))
	print("Cleaning Objective ", get_id())

func get_id():
	return str(get_parent().get_id() if get_parent() != null else "?:?", ":", obj_id)

func set_started(s):
	started = s
func get_started():
	return started
func get_prepared():
	return prepared
func set_prepared(p):
	prepared = p
func get_finished():
	return finished
func set_finished(f):
	finished = f
