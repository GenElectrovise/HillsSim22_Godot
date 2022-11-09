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
	started = true
	emit_signal("objective_started")
	pass

func i__finish_objective():
	finished = true
	emit_signal("objective_finished")
	pass

func i__clean_objective():
	queue_free()
