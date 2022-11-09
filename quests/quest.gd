class_name Quest extends Node

export var QuestName = "?"
export var QuestDescription = "..."

export var stage: int = -1 
export var prepared: bool = false
export var started: bool = false
export var finished: bool = false
export var quest_id: int = -1
export var quest_type: int = -1

## Virtual methods

func i__start_quest():
	pass

func i__finish_quest():
	emit_signal("quest_finished") # To QM - "a quest finished"
	pass

## Signals

signal quest_finished

func s__on_objective_finished(obj_id):
	stage += 1
	pass
