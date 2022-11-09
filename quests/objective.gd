class_name Objective extends Node2D

export var ObjectiveDescription: String = "?"
export var ObjectiveLocation: String = "?"
export var ObjectiveImage: Texture = load("res://assets/gui/exclamation_mark.png")

export var started: bool = false
export var finished: bool = false 
export var obj_id: int

## Signals

signal objective_finished

## Virtual methods

func i__start_objective():
	pass

func i__finish_objective():
	emit_signal("objective_finished")
	pass

##
