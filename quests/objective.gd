extends Node

class_name Objective

var is_started
var is_complete
var quest_id
var obj_id

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _start():
	assert(!is_started, str("Objective ", quest_id, ":", obj_id, " cannot be started twice!"))
	print("Starting Objective ", quest_id, ":", obj_id)
	pass

func _finish():
	pass
