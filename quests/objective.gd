class_name Objective extends Node

export var ObjectiveDescription: String = "?"
export var ObjectiveLocation: String = "?"
export var ObjectiveImage: Texture = load("res://assets/gui/exclamation_mark.png")

export var started: bool = false
export var finished: bool = false 

## Signals

signal objective_finished
signal objective_started

## Virtual methods

func i__start_objective():
	print("Objectives > Starting ", self)
	started = true
	emit_signal("objective_started")
	pass

func i__finish_objective():
	print("Objectives > Finishing ", self)
	finished = true
	emit_signal("objective_finished")
	i__clean_objective()
	pass

func i__clean_objective():
	print("Objectives > Cleaning ", self)
	queue_free()
