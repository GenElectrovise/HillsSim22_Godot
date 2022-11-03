extends Objective

class_name WatchBirdsObjective

var BirdsNestObjectiveScene = load("res://quests/watch_birds/WatchBirdsObjective.tscn")
var nest

# Called when the node enters the scene tree for the first time.
func _init():
	ObjectiveDescription = "Watch birds"
	ObjectiveLocation = "The Quad"
	Objective
	pass 

# Inherited #

func prepare_o(position: Vector2):
	.__prepare_o__()
	self.position = position

func start_o():
	.__start_o__()
	nest = BirdsNestObjectiveScene.instance()
	nest.position = self.position
	Global.CurrentScene.add_child(nest)

func finish_o():
	.__finish_o__()
	nest.free()

# Custom #

func _on_Area2D_area_entered(area):
	quest.on_objective_finished()
	finish_o()
	pass
