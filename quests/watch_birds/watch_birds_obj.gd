extends Objective

class_name WatchBirdsObjective

# Called when the node enters the scene tree for the first time.
func _init():
	ObjectiveDescription = "Watch birds"
	ObjectiveLocation = "The Quad"
	Objective
	pass 

func _start():
	._start()
