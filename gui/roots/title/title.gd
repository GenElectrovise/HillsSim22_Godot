extends Node

onready var Title: Control = $Title
onready var NewGame: Control = $NewGame

func _ready():
	Title.visible = true
	NewGame.visible = false
	pass

func s__make_new_game():
	Title.visible = false
	NewGame.visible = true
	pass

func s__start_new_game():
	get_tree().change_scene("res://world/World.tscn")
	pass
