extends Node

onready var TITLE_SCREEN = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

func _on_StartButton_pressed():
	#Global.switch_scene(Levels.lookup("outside"))
	var _error = get_tree().change_scene("res://levels/outside/outside_scene.tscn")
	pass 
