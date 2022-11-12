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
	get_tree().current_scene.add_child(BirdsNest)
	## ^^ Current scene?

func on_birds_watched():
	finished = true
	QuestManager.notify_quests_objective_completed()

func i__clean_objective():
	.i__clean_objective()
	BirdsNest.queue_free()
