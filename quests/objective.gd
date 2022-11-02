extends Node

class_name Objective

export var ObjectiveDescription: String = "?"
export var ObjectiveLocation: String = "?"
export var ObjectiveImage: Texture = load("res://assets/gui/exclamation_mark.png")

var is_started: bool
var is_complete: bool
var quest
var obj_id: int

func _start():
	if is_started:
		print("Objective ", get_id(), " cannot be started twice!")
	is_started = true
	print("Starting Objective ", get_id())
	pass

func get_id():
	return str(quest.get_id() if quest != null else "?:?", ":", obj_id)

func _finish():
	pass
