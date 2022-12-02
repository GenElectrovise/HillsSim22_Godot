extends Node

onready var MainMenu: Control = $MainMenu
onready var NewGame: Control = $NewGame

func _ready():
	MainMenu.visible = true
	NewGame.visible = false
	pass

func s__make_new_game():
	MainMenu.visible = false
	NewGame.visible = true
	pass

func s__start_new_game():
	get_tree().change_scene("res://world/map/World.tscn")
	pass
