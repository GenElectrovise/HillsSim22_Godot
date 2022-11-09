class_name Quest extends Node

export var QuestName = "?"
export var QuestDescription = "..."

var stage: int = -1 
var started: bool = false
var finished: bool = false
var type: int = -1

var objective_group_name: String = str("quest_objectives_", Global.random.randf())

## Signals

signal quest_finished
signal quest_started

func s__on_objective_finished():
	stage += 1
	if stage >= get_tree().get_nodes_in_group(objective_group_name).size():
		i__finish_quest()
		return
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
	pass
