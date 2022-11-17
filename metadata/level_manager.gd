class_name LevelManager extends Node

var OUTSIDE = preload("res://levels/outside/outside_scene.tscn")

var CurrentLevel

var Levels = {
	"outside": OUTSIDE.instance(),
}

func _ready():
	switch_to(Levels["outside"])
	pass

func switch_to(scene):
	remove_child(CurrentLevel)
	CurrentLevel = scene
	add_child(CurrentLevel)
	pass
