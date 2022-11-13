class_name WatchBirdsObjective extends Objective

var BirdsNestScene = load("res://quests/watch_birds/BirdsNest.tscn")
var BirdsNest: BirdsNest

var position: Vector3 = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _init(position: Vector3).():
	ObjectiveDescription = "Watch birds"
	ObjectiveLocation = "The Quad"
	self.position = position
	pass 

# Inherited #

func i__start_objective():
	.i__start_objective()
	BirdsNest = BirdsNestScene.instance()
	BirdsNest.position = Vector2(self.position.x, self.position.y)
	BirdsNest.connect("on_birds_watched", self, "on_birds_watched")
	print(BirdsNest, " is connected to ", self, " : ", BirdsNest.is_connected("on_birds_watched", self, "on_birds_watched"))
	get_tree().current_scene.add_child(BirdsNest)
	## ^^ change current for the desired scene
	print("Watching birds with Nest ", BirdsNest)

func i__finish_objective():
	.i__finish_objective()
	print("Birds have been watched")

func i__clean_objective():
	.i__clean_objective()
	BirdsNest.queue_free()
	print("Birds have been cleaned")

func on_birds_watched():
	i__finish_objective()
