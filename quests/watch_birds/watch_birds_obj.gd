class_name WatchBirdsObjective extends Objective

var BirdsNestScene = load("res://quests/watch_birds/BirdsNest.tscn")
var BirdsNest: BirdsNest

var position: Vector3 = Vector3.ZERO

func _init(position_in: Vector3).():
	ObjectiveDescription = "Watch birds"
	ObjectiveLocation = "The Quad"
	self.position = position_in
	pass 

# Inherited #

func i__start_objective():
	.i__start_objective()
	BirdsNest = BirdsNestScene.instance()
	BirdsNest.position = Vector2(self.position.x, self.position.y)
	var _error = BirdsNest.connect("on_birds_watched", self, "on_birds_watched")
	# print(BirdsNest, " is connected to ", self, " : ", BirdsNest.is_connected("on_birds_watched", self, "on_birds_watched"))
	get_tree().current_scene.add_child(BirdsNest)
	## ^^ change current for the desired scene

func i__finish_objective():
	.i__finish_objective()

func i__clean_objective():
	BirdsNest.queue_free()
	.i__clean_objective()

func on_birds_watched():
	i__finish_objective()

func _to_string():
	return str("WatchBirdsObj")
