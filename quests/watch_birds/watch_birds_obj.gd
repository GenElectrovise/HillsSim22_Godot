extends Objective

class_name WatchBirdsObjective

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _init():
	ObjectiveName = "Watch birds"
	ObjectiveLocation = "The Quad"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

func _start():
	._start()
