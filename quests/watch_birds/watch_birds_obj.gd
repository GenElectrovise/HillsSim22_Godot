class_name WatchBirdsObjective extends Objective

var BirdsNestScene = load("res://quests/watch_birds/BirdsNest.tscn")
var BirdsNest: BirdsNest

# Called when the node enters the scene tree for the first time.
func _init():
	ObjectiveDescription = "Watch birds"
	ObjectiveLocation = "The Quad"
	pass 

# Inherited #

func prepare_o(position: Vector2):
	.__prepare_o__()
	self.position = position

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
