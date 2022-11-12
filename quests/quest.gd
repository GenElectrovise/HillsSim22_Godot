class_name Quest extends Node

export var QuestName = "?"
export var QuestDescription = "..."

var started: bool = false
var finished: bool = false
var type: int = -1

var objective_group_name: String = str("quest_objectives_", Global.random.randf())

## Signals

signal quest_finished
signal quest_started

# Objective has called i__finish_objective
# Signal 'objective_finished' has been emitted and recieved here
# The objective has NOT been cleaned
func s__on_objective_finished():
	var size_of_group = get_tree().get_nodes_in_group(objective_group_name).size()
	var remaining_objectives: int = size_of_group - 1
	
	if remaining_objectives < 1:
		i__finish_quest()
	else:
		# The old objective has been removed from the list
		var objective: Objective = get_tree().get_nodes_in_group(objective_group_name)[0]
		objective.call_deferred("i__start_objective")
	pass

## Virtual methods

func i__start_quest():
	started = true
	emit_signal("quest_started")
	pass

func i__finish_quest():
	finished = true
	emit_signal("quest_finished")
	pass

func i__clean_quest():
	for o in get_tree().get_nodes_in_group(objective_group_name):
		o.i__clean_objective()
	queue_free()

##

# Set objective_id to the 
# Add objective to this Quest's Objective group
# Connect output of Objective with this Quest
func add_objective(objective: Objective):
	print("Adding ", objective.to_string(), " to ", self.to_string(), "(", objective_group_name, ")")
	objective.add_to_group(objective_group_name)
	objective.connect("objective_finished", self, "s__on_objective_finished")
	get_tree().current_scene.add_child(objective)
	push_warning("add_objective() defaulting to get_tree().current_scene.add_child()")
	pass

func current() -> Objective:
	return get_tree().get_nodes_in_group(objective_group_name)[0] if get_tree().get_nodes_in_group(objective_group_name).size() > 0 else null
