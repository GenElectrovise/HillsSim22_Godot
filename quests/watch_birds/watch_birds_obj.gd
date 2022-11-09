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

func start_o():
	.__start_o__()
	BirdsNest = BirdsNestScene.instance()
	BirdsNest.position = self.position
	BirdsNest.connect("on_birds_watched", self, "on_birds_watched")
	#Global.CurrentScene.add_child(BirdsNest)
	get_tree().current_scene.add_child(BirdsNest)

func on_birds_watched():
	finished = true
	QuestManager.notify_quests_objective_completed()

func clean_o():
	.__clean_o__()
	BirdsNest.queue_free()
