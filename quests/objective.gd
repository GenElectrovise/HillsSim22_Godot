extends Node

class_name Objective

var ObjectiveName
var ObjectiveLocation

var is_started
var is_complete
var quest_id
var obj_id

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _start():
	if is_started:
		print("Objective ", quest_id, ":", obj_id, " cannot be started twice!")
	is_started = true
	print("Starting Objective ", quest_id, ":", obj_id)
	pass

func _finish():
	pass
